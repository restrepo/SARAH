NameProcess = "KKmix";
NameObservables = {{DelMK, 9100, "Delta(M_K)"}, 
                   {ratioDelMK, 9102, "Delta(M_K)/Delta(M_K)_SM"}, 
                   {epsK, 9103, "epsilon_K"}, 
                   {ratioepsK, 9104, "epsilon_K/epsilon_K^SM"}};

NeededOperators = {O4dSLL, O4dSRR, O4dSRL, O4dSLR, O4dVRR, O4dVLL, O4dVRL, 
                   O4dVLR, O4dTLL, O4dTLR, O4dTRL, O4dTRR,
                   O4dSLLSM, O4dSRRSM, O4dSRLSM, O4dSLRSM, O4dVRRSM, O4dVLLSM, O4dVRLSM, O4dVLRSM, 
                   O4dTLLSM, O4dTLRSM, O4dTRLSM, O4dTRRSM};

Body = "KKmix.f90"; 

