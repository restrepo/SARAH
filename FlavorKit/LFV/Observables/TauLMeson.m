NameProcess = "TauLMeson";
NameObservables = {{BrTautoEPi, 2001, "BR(tau->e pi)"}, 
                   {BrTautoEEta, 2002, "BR(tau->e eta)"}, 
                   {BrTautoEEtap, 2003, "BR(tau->e eta')"},
		   {BrTautoMuPi, 2004, "BR(tau->mu pi)"}, 
                   {BrTautoMuEta, 2005, "BR(tau->mu eta)"}, 
                   {BrTautoMuEtap, 2006, "BR(tau->mu eta')"}};

NeededOperators = {OllddSLL, OllddSRR, OllddSRL, OllddSLR, 
  OllddVRR, OllddVLL, OllddVRL, OllddVLR,
  OlluuSLL, OlluuSRR, OlluuSRL, OlluuSLR, 
  OlluuVRR, OlluuVLL, OlluuVRL, OlluuVLR
};

Body = "TauLMeson.f90"; 

