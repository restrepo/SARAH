NameProcess = "BtoKLL";
NameObservables = {{BrBtoKee, 6000, "BR(B -> K mu mu)"}, 
                   {ratioBtoKee, 6001, "BR(B -> K mu mu)/BR(B -> K mu mu)_SM"},
                   {BrBtoKmumu, 6002, "BR(B -> K mu mu)"}, 
                   {ratioBtoKmumu, 6003, "BR(B -> K mu mu)/BR(B -> K mu mu)_SM"}};

NeededOperators = {OddllVRR, OddllVLL, OddllVRL, OddllVLR, CC7, CC7p,
                   OddllVRRSM, OddllVLLSM, OddllVRLSM, OddllVLRSM, CC7SM, CC7pSM
};

Body = "BtoKLL.f90"; 

