NameProcess = "LtoL1L2L2";
NameObservables = {{BRtauToemumu, 904, "BR(tau- -> e- mu+ mu-)"}, 
                   {BRtauTomuee, 905, "BR(tau- -> mu- e+ e-)"},
		   {BRtauToemumu2, 906, "BR(tau- -> e+ mu- mu-)"},
		   {BRtauTomuee2, 907, "BR(tau- -> mu+ e- e-)"}
                  };

ExternalStates =  {Electron}; 
NeededOperators = {K1L, K1R, K2L, K2R , 
 O4lSLL, O4lSRR, O4lSRL, O4lSLR , 
 O4lVRR, O4lVLL, O4lVRL, O4lVLR ,
 O4lTLL, O4lTRR , 
 O4lSLLcross, O4lSRRcross, O4lSRLcross, O4lSLRcross , 
 O4lVRRcross, O4lVLLcross, O4lVRLcross, O4lVLRcross ,
 O4lTLLcross, O4lTRRcross };

Body = "LtoL1L2L2.f90"; 

