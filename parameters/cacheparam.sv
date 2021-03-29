package HasNonDiplomaticTileParameters;
  parameter usingVM = 1;
  parameter pgIdxBits = 12;


endpackage


package L1CacheParams;
  parameter nSets = 64;
  parameter nWays = 8;
  parameter rowBits = 128;
  parameter nTLBEntries = 32;
  parameter blockBytes = `blockBytes;
endpackage



package HasL1CacheParameters;
  parameter nSets = L1CacheParams::nSets;
  parameter idxBits = $clog2(L1CacheParams::nSets);
  parameter untagBits = `blockOffBits + idxBits;
  parameter pgUntagBits = (HasNonDiplomaticTileParameters::usingVM
      ) ? (untagBits > HasNonDiplomaticTileParameters::pgIdxBits ?
           HasNonDiplomaticTileParameters::pgIdxBits : untagBits) : untagBits;
  parameter tagBits = `paddrBits - pgUntagBits;
  parameter nWays = L1CacheParams::nWays;
  parameter wayBits = $clog2(nWays);
  parameter isDM = nWays == 1;
  parameter rowBits = L1CacheParams::rowBits;
  parameter rowBytes = rowBits / 8;
  parameter rowOffBits = $clog2(rowBytes);
  parameter nTLBEntries = L1CacheParams::nTLBEntries;

  parameter realAddressBits = `paddrBits;
  parameter cacheDataBits = 128;
  parameter cacheDataBytes = cacheDataBits / 8;
  parameter cacheDataBeats = (L1CacheParams::blockBytes * 8) / cacheDataBits;
  parameter refillCycles = cacheDataBeats;
endpackage

package HasL1HellaCacheParameters;
  parameter nMSHRs = 4;
  parameter cacheBlockBytes = L1CacheParams::blockBytes;
  parameter encRowBits = BundleParam::dataBits;
  parameter lgCacheBlockBytes = $clog2(cacheBlockBytes);
  parameter idxMSB = HasL1CacheParameters::untagBits - 1;
  parameter idxLSB = `blockOffBits;


endpackage
