NameProcess = "DeltaMBq";
NameObservables = {{DeltaMBs, 1900, "Delta(M_Bs)"}, 
                   {ratioDeltaMBs, 1901, "Delta(M_Bs)/Delta(M_Bs)_SM"},  
                   {DeltaMBq, 1902, "Delta(M_Bd)"},  
                   {ratioDeltaMBq, 1903, "Delta(M_Bd)/Delta(M_Bd)_SM"}};

ExternalStates =  {Fd}; 
NeededOperators = {O4dSLL, O4dSRR, O4dSRL, O4dSLR, O4dVRR, O4dVLL, 
                  O4dVLLSM, O4dVRL, O4dVLR, O4dTLL, O4dTLR, O4dTRL, O4dTRR,
                  OH2qSL, OH2qSR, OAh2qSL, OAh2qSR};

IncludeSMprediction["DeltaMBq"] = False;

Body = "DeltaMBq.f90"; 

