NameProcess = "KtoPInunu";
NameObservables = {{BrKptoPipnunu, 8000, "BR(K^+ -> pi^+ nu nu)"}, 
                   {ratioKptoPipnunu, 8001, "BR(K^+ -> pi^+ nu nu)/BR(K^+ -> pi^+ nu nu)_SM"}, 
                   {BrKltoPinunu, 8002, "BR(K_L -> pi^0 nu nu)"}, 
                   {ratioKltoPinunu, 8003, "BR(K_L -> pi^0 nu nu)/BR(K_L -> pi^0 nu nu)_SM"}};

NeededOperators = {OddvvVRR, OddvvVLL, OddvvVRL, OddvvVLR,
                   OddvvVRRSM, OddvvVLLSM, OddvvVRLSM, OddvvVLRSM};

Body = "KtoPInunu.f90"; 

