NameProcess = "MuEconversion";
NameObservables = {{CRmuEAl, 800, "CR(mu-e, Al)"}, 
                   {CRmuETi, 801, "CR(mu-e, Ti)"}, 
                   {CRmuESr, 802, "CR(mu-e, Sr)"}, 
                   {CRmuESb, 803, "CR(mu-e, Sb)"}, 
                   {CRmuEAu, 804, "CR(mu-e, Au)"}, 
                   {CRmuEPb, 805, "CR(mu-e, Pb)"}
                  };

NeededOperators = {K1L, K1R, K2L, K2R, 
  OllddSLL, OllddSRR, OllddSRL, OllddSLR, OllddVRR, OllddVLL, 
  OllddVRL, OllddVLR, OllddTLL, OllddTLR, OllddTRL, OllddTRR,
  OlluuSLL, OlluuSRR, OlluuSRL, OlluuSLR, OlluuVRR, OlluuVLL,
  OlluuVRL, OlluuVLR, OlluuTLL, OlluuTLR, OlluuTRL, OlluuTRR
};

Body = "MuEconversion.f90"; 

