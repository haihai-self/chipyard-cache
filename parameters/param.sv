// `timescale 1ns/1ns
// TODO: optimize the paramters


// **************************************
// ******* LargeBoomConfig Params *******
// **************************************
`define useRAS 1
`define enableSFBOpt 1
`define enableBTBFastRepair 1
`define enableRasTopRepair 1
`define enableGHistStallRepair 1
`define enablePrefetching 0
`define useBPD 1
`define vaddrBits 39
`define usingCompressed 1       // wether use compressed instructions
`define useLHist 0
`define usingFPU 1
`define xlen 64
`define vaddrBitsExtended 40    // the width of vpc
`define bankWidth 4             // the width of bank in Icahe
`define fetchWidth 8            // the number of instructions that fetches in IF 
`define fetchBytes 16            // fetch bytes(8*2)
// `define nInputs 1             // used in branchpredictor
`define nBanks `fetchBytes<=8?1:2 //2
`define bankBytes `fetchBytes/(`nBanks)  //8
`define coreInstBits 16          // C instructions
`define coreInstBytes `coreInstBits/8
// some parameter about cache
`define blockOffBits 6
`define numChunks 8
`define paddrBits 32
`define coreMaxAddrBits `vaddrBitsExtended // TODO: max of paddrBits and vaddrBitsExtended
`define decodeWidth 3            // *** can change in different Config *** 
`define coreWidth `decodeWidth     
`define numIntPhysRegisters 100  // *** can change in different Config *** 
`define numFpPhysRegisters 96    // *** can change in different Config *** 
`define coreDataBits 64
`define coreDataBytes `coreDataBits/8



// ICache
`define blockBytes 64       // (2 * 8) * 4 (one block has 4 cache-line)  


// HasBoomCoreParameters
// data structure size
`define numRobEntries 96         // *** can change in different Config *** 
`define numFetchBufferEntries 24 // *** can change in different Config ***
`define maxBrCount 16            // *** can change in different Config ***
`define ftqSz 32                 // *** can change in different Config ***
`define numLdqEntries 24         // *** can change in different Config ***
`define numStqEntries 24         // *** can change in different Config ***
`define numRxqEntries 4
`define numIntPhysRegs `numIntPhysRegisters       
`define numFpPhysRegs `numFpPhysRegisters           

// Load/Store Unit
`define icBlockBytes `blockBytes

// Branch Prediction 
`define globalHistoryLength 64  // the length of GHR
`define localHistoryLength 1
`define bpdMaxMetaLength 120    // the max length of meta data in BPD
`define nRasEntries 32           // RAS config

// implicitly calculated constants
`define numRobRows `numRobEntries / (`coreWidth)
`define robAddrSz $clog2(`numRobRows) + $clog2(`coreWidth)
`define brTagSz $clog2(`maxBrCount)
`define ldqAddrSz $clog2(`numLdqEntries)
`define stqAddrSz $clog2(`numStqEntries)
`define ipregSz $clog2(`numIntPhysRegs)
`define fpregSz $clog2(`numFpPhysRegs)
`define maxPregSz `ipregSz >= `fpregSz ? `ipregSz : `fpregSz
`define logicalRegCount `usingFPU ? 64 : 32
`define lregSz $clog2(`logicalRegCount)


