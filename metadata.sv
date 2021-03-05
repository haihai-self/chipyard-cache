package MetaData;

import MemoryOpConstants::*;
import TLBundleParam::*;





localparam False = 1'h0 ;
localparam True = 1'h1;

localparam wr = {True, True};
localparam wi = {False, True};
localparam rd = {False, False};

function logic[1:0] categorize(logic[4:0] cmd);
    return {isWrite(cmd), isWriteIntent(cmd)};
endfunction

function logic[TLPermissions_width-1:0] growFinisher(logic [4:0] cmd, logic [1:0] param);
    logic [3:0] c;
    logic [TLPermissions_width-1:0]result;
    c = {categorize(cmd), param};
    result = {rd, toB} == c? Branch :
             {rd, toT} == c? Trunk  :
             {wi, toT} == c? Trunk  :
             {wr, toT} == c? Dirty  : 0;
    return result;
endfunction

function logic[TLPermissions_width-1:0] onGrant(logic [4:0] cmd, logic [1:0] param);
    return growFinisher(cmd, param);
endfunction

function logic[2:0] growStarter(logic[TLPermissions_width-1: 0] state, logic[4:0] cmd);
    logic [3:0] param = {categorize, state};
    logic [2:0] result;
    result ={rd, Dirty}     == param?    {True, Dirty}   : 
            {rd, Trunk}     == param?    {True, Trunk}   : 
            {rd, Branch}    == param?    {True, Branch}  : 
            {wi, Dirty}     == param?    {True, Dirty}   : 
            {wi, Trunk}     == param?    {True, Trunk}   : 
            {wr, Dirty}     == param?    {True, Dirty}   : 
            {wr, Trunk}     == param?    {True, Dirty}   : 
            {rd, Nothing}   == param?    {False, NtoB}   : 
            {wi, Branch}    == param?    {False, BtoN}   : 
            {wi, Nothing}   == param?    {False, NtoT}   : 
            {wr, Branch}    == param?    {False, BtoT}   : 
            {wr, Nothing}   == param?    {False, NtoT}   : 0;
    return result;
endfunction


function logic[2:0] onAccess(logic [TLPermissions_width-1:0] state, logic[4:0] cmd);
    return growStarter(state, cmd);
endfunction

function logic[5:0] shrinkHelper(logic [3:0] param);
  
  logic [5:0] result;

  result = {toT, Dirty}     == param    ?   {True,  TtoT, Trunk}        :
           {toT, Trunk}     == param    ?   {False, TtoT, Trunk}        :
           {toT, Branch}    == param    ?   {False, BtoB, Branch}       :
           {toT, Nothing}   == param    ?   {False, NtoN, Nothing}      :
           {toB, Dirty}     == param    ?   {True,  TtoB, Branch}       :
           {toB, Trunk}     == param    ?   {False, TtoB, Branch}       :
           {toB, Branch}    == param    ?   {False, BtoB, Branch}       :
           {toB, Nothing}   == param    ?   {False, NtoN, Nothing}      :
           {toN, Dirty}     == param    ?   {True,  TtoT, Nothing}      :
           {toN, Trunk}     == param    ?   {False, TtoN, Nothing}      :
           {toN, Branch}    == param    ?   {False, BtoN, Nothing}      :
           {toN, Nothing}   == param    ?   {False, NtoN, Nothing}      : 0;
           
  return result;  
endfunction

function logic[bdwidth-1: 0] cmdToPermCap(logic [4:0] cmd);
    logic [bdwidth-1:0] result;
    result = cmd == M_FLUSH     ? toN :
             cmd == M_PRODUCE   ? toB :
             cmd == M_CLEAN     ? toT : toN;
    return result;
  
endfunction

function logic[5:0] onCacheControl(logic [TLPermissions_width-1:0] state, logic [4:0] cmd);
    logic [5:0] result;
    result = shrinkHelper({cmdToPermCap(cmd), state});
    return result;
endfunction




function automatic logic[5:0] onProb(logic [3:0] param);
  return shrinkHelper(param);
endfunction
    
endpackage

