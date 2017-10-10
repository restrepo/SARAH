NameProcess = "BtoSLL";
NameObservables = {{BrBtoSEE, 5000, "BR(B-> s e e)"}, 
                   {ratioBtoSEE, 5001, "BR(B-> s e e)/BR(B-> s e e)_SM"}, 
                   {BrBtoSMuMu, 5002, "BR(B-> s mu mu)"} , 
                   {ratioBtoSMuMu, 5003, "BR(B-> s mu mu)/BR(B-> s mu mu)_SM"}};

NeededOperators = {OddllVRR, OddllVLL, OddllVRL, OddllVLR, 
                   CC7, CC7p, CC8, CC8p,
                   OddllVRRSM, OddllVLLSM, OddllVRLSM, OddllVLRSM, 
                   CC7SM, CC7pSM, CC8SM, CC8pSM
};

Body = "BtoSLL.f90"; 

