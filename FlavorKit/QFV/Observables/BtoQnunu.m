NameProcess = "BtoQnunu";
NameObservables = {{BrBtoSnunu, 7000, "BR(B->s nu nu)"},
                   {ratioBtoSnunu, 7001, "BR(B->s nu nu)/BR(B->s nu nu)_SM"}, 
                   {BrBtoDnunu, 7002, "BR(B->D nu nu)"}, 
                   {ratioBtoDnunu, 7003, "BR(B->D nu nu)/BR(B->D nu nu)_SM"}};

NeededOperators = {OddvvVRR, OddvvVLL, OddvvVRL, OddvvVLR,
                   OddvvVRRSM, OddvvVLLSM, OddvvVRLSM, OddvvVLRSM};

Body = "BtoQnunu.f90"; 

