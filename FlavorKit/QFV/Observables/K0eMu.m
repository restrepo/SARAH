NameProcess = "K0toEmu";
NameObservables = {{BrK0eMu, 8004, "BR(K^0_L -> e mu)"},
                   {ratioK0eMu, 8005, "BR(K^0_L -> e mu)/BR(K^0_L -> e mu)_SM"}};

NeededOperators = {OddllSLL, OddllSLR, OddllSRR, OddllSRL, OddllVRR, OddllVLR, OddllVRL, OddllVLL,
                   OddllSLLSM, OddllSLRSM, OddllSRRSM, OddllSRLSM, OddllVRRSM, OddllVLRSM, OddllVRLSM, OddllVLLSM};

Body = "K0eMu.f90";
