package MetaData;

  import MemoryOpConstants::*;
  import BundleParam::*;





  localparam False = 1'h0;
  localparam True = 1'h1;

  localparam wr = {True, True};
  localparam wi = {False, True};
  localparam rd = {False, False};

  function logic [1:0] categorize(logic [M_SZ-1:0] cmd);
    return {isWrite(cmd), isWriteIntent(cmd)};
  endfunction

  function logic [TLPermissions_width-1:0] growFinisher(logic [M_SZ-1:0] cmd,
                                                          logic [1:0] param);
    logic [3:0] c;
    logic [TLPermissions_width-1:0] result;
    c = {categorize(cmd), param};
    result = {rd, toB} == c? Branch :
             {rd, toT} == c? Trunk  :
             {wi, toT} == c? Trunk  :
             {wr, toT} == c? Dirty  : 0;
    return result;
  endfunction

  function logic [TLPermissions_width-1:0] onGrant(logic [M_SZ-1:0] cmd, logic [1:0] param);
    return growFinisher(cmd, param);
  endfunction

  function logic [2:0] growStarter(logic [TLPermissions_width-1:0] state, logic [M_SZ-1:0] cmd);
    logic [3:0] param;
    logic [2:0] result;
    param = {categorize(cmd), state};
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


  function logic [2:0] onAccess(logic [TLPermissions_width-1:0] state, logic [M_SZ-1:0] cmd);
    return growStarter(state, cmd);
  endfunction




  function BoomLSUST::onSecondaryAccessST onSecondaryAccess(logic [TLPermissions_width-1:0] state,
                                                            logic [M_SZ-1 : 0] first_cmd,
                                                            logic [M_SZ-1:0] second_cmd);
    logic [2:0] r1;
    logic [2:0] r2;
    BoomLSUST::onSecondaryAccessST result;
    r1 = growStarter(state, first_cmd);
    r2 = growStarter(state, second_cmd);
    result.needs_second_acq = isWriteIntent(second_cmd) && !isWriteIntent(first_cmd);
    result.hit_again = r1[2] && r2[2];
    result.dirties = categorize(second_cmd) == wr;
    result.biggest_grow_param = result.dirties ? r2[1:0] : r1[1:0];
    result.dirtiest_cmd = result.dirties ? second_cmd : first_cmd;
    return result;
  endfunction

  function logic [5:0] shrinkHelper(logic [TLPermissions_width-1:0] state,
                                    logic [BundleParam::bdwidth-1:0] param);
    logic [3:0] params;
    logic [5:0] result;

    params = {param, state};
    result = {toT, Dirty}     == params    ?   {True,  TtoT, Trunk}        :
             {toT, Trunk}     == params    ?   {False, TtoT, Trunk}        :
             {toT, Branch}    == params    ?   {False, BtoB, Branch}       :
             {toT, Nothing}   == params    ?   {False, NtoN, Nothing}      :
             {toB, Dirty}     == params    ?   {True,  TtoB, Branch}       :
             {toB, Trunk}     == params    ?   {False, TtoB, Branch}       :
             {toB, Branch}    == params    ?   {False, BtoB, Branch}       :
             {toB, Nothing}   == params    ?   {False, NtoN, Nothing}      :
             {toN, Dirty}     == params    ?   {True,  TtoT, Nothing}      :
             {toN, Trunk}     == params    ?   {False, TtoN, Nothing}      :
             {toN, Branch}    == params    ?   {False, BtoN, Nothing}      :
             {toN, Nothing}   == params    ?   {False, NtoN, Nothing}      : 0;
           
    return result;
  endfunction

  function logic [bdwidth-1:0] cmdToPermCap(logic [M_SZ-1:0] cmd);
    logic [bdwidth-1:0] result;
    result = cmd == M_FLUSH ? toN : cmd == M_PRODUCE ? toB : cmd == M_CLEAN ? toT : toN;
    return result;

  endfunction

  function logic [5:0] onCacheControl(logic [TLPermissions_width-1:0] state,
                                      logic [M_SZ-1:0] cmd);
    logic [5:0] result;
    result = shrinkHelper(state, cmdToPermCap(cmd));
    return result;
  endfunction




  function automatic logic [5:0] onProb(logic [TLPermissions_width-1:0] state,
                                        logic [BundleParam::bdwidth-1:0] param);
    return shrinkHelper(state, param);
  endfunction

endpackage

