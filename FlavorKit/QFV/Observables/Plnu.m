NameProcess = "Plnu";
NameObservables = {{BrDmunu, 300, "BR(D->mu nu)"}, 
                   {ratioDmunu, 301, "BR(D->mu nu)/BR(D->mu nu)_SM"},
                   {BrDsmunu, 400, "BR(Ds->mu nu)"}, 
                   {ratioDsmunu, 401, "BR(Ds->mu nu)/BR(Ds->mu nu)_SM"},
                   {BrDstaunu, 402, "BR(Ds->tau nu)"},
                   {ratioDstaunu, 403, "BR(Ds->tau nu)/BR(Ds->tau nu)_SM"},
                   {BrBmunu, 500, "BR(B->mu nu)"},
                   {ratioBmunu, 501, "BR(B->mu nu)/BR(B->mu nu)_SM"},
                   {BrBtaunu, 502, "BR(B->tau nu)"},
                   {ratioBtaunu, 503, "BR(B->tau nu)/BR(B->tau nu)_SM"},
                   {BrKmunu, 600, "BR(K->mu nu)"},
                   {ratioKmunu, 601, "BR(K->mu nu)/BR(K->mu nu)_SM"},
                   {RK, 602 ,"R_K = BR(K->e nu)/(K->mu nu)"},
                   {RKSM, 603 ,"R_K^SM = BR(K->e nu)_SM/(K->mu nu)_SM"}};

NeededOperators = {OdulvSLL, OdulvSRR, OdulvSRL, OdulvSLR,
                   OdulvVRR, OdulvVLL, OdulvVRL, OdulvVLR,
                   OdulvSLLSM, OdulvSRRSM, OdulvSRLSM, OdulvSLRSM,
                   OdulvVRRSM, OdulvVLLSM, OdulvVRLSM, OdulvVLRSM
};

Body = "Plnu.f90"; 

