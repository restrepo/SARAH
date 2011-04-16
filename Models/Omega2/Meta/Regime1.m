HeavyFields = {Hpm1R1, DR2r1, Hpm2R1, Cha1r1, SDRmmR1, DR3r1, SDLpR1, SDLppR1, SDL0r1, DL1r1, DL2r1, DL3r1, SH0r1, SHCr1, H0r1, HCr1}; 
 
numberLowCurrent = 107; 
numberAllCurrent = 321; 
 
numberAllwithVEVsCurrent = 323; 
 
YukawaCouplingsCurrent = {YQ[i1, i2, i3], YL[i1, i2, i3], f[i1, i2], a, AlphaOm[i1, i2]}; 
 
listAll = {gBL, g2, g3, YQ, YL, f, a, AlphaOm, Mdelta, Momega, Mu3, T[YQ], T[YL], T[f], T[a], T[AlphaOm], B[Mdelta], B[Mu3], B[Momega], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG}; 
 
listAllwithVEVs = {gBL, g2, g3, YQ, YL, f, a, AlphaOm, Mdelta, Momega, Mu3, T[YQ], T[YL], T[f], T[a], T[AlphaOm], B[Mdelta], B[Mu3], B[Momega], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG, vR, vBL}; 
 
listLow = {gBL, g2, g3, YQ, YL, f, a, AlphaOm, Mdelta, Momega}; 
 
listVEVsCurrent = {vR, vBL}; 
 
listGaugeCurrent = {gBL, g2, g2, g3}; 
 
listGauginosCurrent = {MassB, MassWL, MassWL, MassG}; 
 
LHnamesCurrent = {{gBL, None}, {gP, {gauge, 2}}, {gL, None}, {gR, None}, {g2, {gauge, 1}}, {g3, {gauge, 3}}, {YQ, None}, {MDu, None}, {MDd, None}, {YL, None}, {MDe, None}, {MDnu, None}, {T[YQ], None}, {AQ, None}, {T[YL], None}, {AL, None}, {Mu3, {Hmix, 1}}, {B[Mu3], None}, {f, None}, {T[f], None}, {fc, None}, {T[fc], None}, {a, None}, {T[a], None}, {ac, None}, {T[ac], None}, {AlphaOm, None}, {T[AlphaOm], None}, {\[Alpha]c, None}, {T[\[Alpha]c], None}, {Mdelta, None}, {B[Mdelta], None}, {Mdeltac, None}, {B[Mdeltac], None}, {Momega, None}, {B[Momega], None}, {Momegac, None}, {B[Momegac], None}, {mqL, {{{1, 1}, {MSOFT, 41}}, {{2, 2}, {MSOFT, 42}}, {{3, 3}, {MSOFT, 43}}}}, {mlL, {{{1, 1}, {MSOFT, 31}}, {{2, 2}, {MSOFT, 32}}, {{3, 3}, {MSOFT, 33}}}}, {mPhi2, None}, {MassB, {MSOFT, 1}}, {MassWL, {MSOFT, 2}}, {MassG, {MSOFT, 3}}, {vd, None}, {vu, None}, {v, {Hmix, 3}}, {vR, None}, {vL, None}, {vBL, None}, {vBLbar, None}, {vBLL, None}, {vBLbarL, None}, {\[Beta], None}, {TanBeta, {Hmix, 2}}, {ZD, sbotmix}, {ZU, stopmix}, {ZE, staumix}, {ZH, scalarmix}, {ZP, pseudoscalarmix}, {ZC, chargemix}, {ZC2, None}, {ZN, Nmix}, {UP, Umix}, {UM, Vmix}, {UPP, None}, {UMM, None}, {ThetaW, None}, {\[Eta], None}, {\[Xi], None}}; 
 
DimParameters = {{gBL, {}}, {g2, {}}, {g3, {}}, {YQ, {3, 3, 2}}, {YL, {3, 3, 2}}, {f, {3, 3}}, {a, {}}, {AlphaOm, {2, 2}}, {Mdelta, {}}, {Momega, {}}, {Mu3, {2, 2}}, {T[YQ], {3, 3, 2}}, {T[YL], {3, 3, 2}}, {T[f], {3, 3}}, {T[a], {}}, {T[AlphaOm], {2, 2}}, {B[Mdelta], {}}, {B[Mu3], {2, 2}}, {B[Momega], {}}, {mqL2, {3, 3}}, {mqR2, {3, 3}}, {mlL2, {3, 3}}, {mlR2, {3, 3}}, {mPhi2, {2, 2}}, {mdeltaL2, {}}, {mdeltaLbar2, {}}, {mdeltaR2, {}}, {mdeltaRbar2, {}}, {momegaL2, {}}, {momegaR2, {}}, {MassB, {}}, {MassWL, {}}, {MassG, {}}, {vR, {1}}, {vBL, {1}}}; 
 
RealParameters = {gBL, g2, g3, mPhi2, vR, vBL}; 
 
GenHeavyFields = {{Hpm1R1, 1, 2}, {DR2r1, 1, 1}, {Hpm2R1, 1, 2}, {Cha1r1, 1, 2}, {SDRmmR1, 1, 2}, {DR3r1, 1, 1}, {SDLpR1, 1, 2}, {SDLppR1, 1, 2}, {SDL0r1, 1, 2}, {DL1r1, 1, 1}, {DL2r1, 1, 1}, {DL3r1, 1, 1}, {SH0r1, 3, 4}, {SHCr1, 3, 4}, {H0r1, 3, 2}, {HCr1, 3, 2}}; 
 
eigenstateName = EWSB; 
 
FortranNames = {{gBL, gBL}, {g2, g2}, {g3, g3}, {YQ, YQ}, {YL, YL}, {f, fOm}, {a, aOm}, {AlphaOm, AlphaOm}, {Mdelta, Mdelta}, {Momega, Momega}, {Mu3, Mu3}, {T[YQ], TYQ}, {T[YL], TYL}, {T[f], Tf}, {T[a], Ta}, {T[AlphaOm], TAlphaOm}, {B[Mdelta], BMdelta}, {B[Mu3], BMu3}, {B[Momega], BMomega}, {mqL2, mqL2}, {mqR2, mqR2}, {mlL2, mlL2}, {mlR2, mlR2}, {mPhi2, mPhi2}, {mdeltaL2, mdeltaL2}, {mdeltaLbar2, mdeltaLbar2}, {mdeltaR2, mdeltaR2}, {mdeltaRbar2, mdeltaRbar2}, {momegaL2, momegaL2}, {momegaR2, momegaR2}, {MassB, MassB}, {MassWL, MassWL}, {MassG, MassG}, {vR, vR}, {vBL, vBL}}; 
 
HeavyFieldFactors = {{1/4, 0, 0}, {1/2, 0, 0}, {1/4, 0, 0}, {1/2, 0, 0}, {1, 0, 0}, {2, 0, 0}, {1/4, 0, 0}, {1, 0, 0}, {3/4, 1/2, 0}, {1/2, 0, 0}, {1/2, 0, 0}, {3/2, 1, 0}, {1/16, 0, 0}, {1/8, 1/8, 0}, {1/8, 0, 0}, {1/4, 1/4, 0}}; 
 
