NameProcess = "Lto3Lp";
NameObservables = {{BRmuTo3e, 901, "BR(mu->3e)"}, 
                   {BRtauTo3e, 902, "BR(tau->3e)"}, 
                   {BRtauTo3mu, 903, "BR(tau->3mu)"}
                  };

ExternalStates =  {Electron}; 
NeededOperators = {K1L, K1R, K2L, K2R, 
 O4lSLL, O4lSRR, O4lSRL, O4lSLR , 
 O4lVRR, O4lVLL, O4lVRL, O4lVLR ,
 O4lTLL, O4lTRR };

Body = "Lto3Lp.f90"; 

