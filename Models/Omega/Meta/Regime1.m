HeavyFields = {Hpm1R1, DR2r1, Hpm2R1, Cha1r1, SDRmmR1, DR3r1, SDLpR1, SDLppR1, SDL0r1, DL1r1, DL2r1, DL3r1, SH0r1, SHCr1, H0r1, HCr1}; 
 
numberLowCurrent = 105; 
numberAllCurrent = 321; 
 
numberAllwithVEVsCurrent = 322; 
 
YukawaCouplingsCurrent = {YQ[i1, i2, i3], YL[i1, i2, i3], f[i1, i2], a, AlphaOm[i1, i2]}; 
 
listAll = {gBL, g2, g3, YQ, YL, f, a, AlphaOm, Mdelta, Mu3, Momega, T[YQ], T[YL], T[f], T[a], T[AlphaOm], B[Mdelta], B[Mu3], B[Momega], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG}; 
 
listAllwithVEVs = {gBL, g2, g3, YQ, YL, f, a, AlphaOm, Mdelta, Mu3, Momega, T[YQ], T[YL], T[f], T[a], T[AlphaOm], B[Mdelta], B[Mu3], B[Momega], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG, vR}; 
 
listLow = {gBL, g2, g3, YQ, YL, f, a, AlphaOm, Mdelta}; 
 
listVEVsCurrent = {vR}; 
 
listGaugeCurrent = {gBL, g2, g2, g3}; 
 
listGauginosCurrent = {MassB, MassWL, MassWL, MassG}; 
 
LHnamesCurrent = {{gBL, {gauge, 4}}, {g2, {gauge, 2}}, {g3, {gauge, 3}}, {YQ, YQ}, {YL, YL}, {T[YQ], TQ}, {T[YL], TL}, {Mu3, Mu3}, {B[Mu3], BMu3}, {f, FO}, {T[f], TFO}, {a, AOM}, {T[a], TAOM}, {AlphaOm, ALPHAOM}, {T[AlphaOm], TALPHAOM}, {Mdelta, MDELTA}, {B[Mdelta], BDELTA}, {Momega, MOMEGA}, {B[Momega], BOMEGA}, {mqL2, MQL2}, {mqR2, MQR2}, {mlL2, MLL2}, {mlR2, MLR2}, {mPhi2, MPHI2}, {MassB, {MSOFT, 1}}, {MassWL, {MSOFT, 2}}, {MassWR, {MSOFT, 5}}, {MassG, {MSOFT, 3}}, {mdeltaL2, {MSOFT, 41}}, {mdeltaLbar2, {MSOFT, 42}}, {mdeltaR2, {MSOFT, 43}}, {mdeltaRbar2, {MSOFT, 44}}, {momegaL2, {MSOFT, 45}}, {momegaR2, {MSOFT, 46}}, {vR, None}, {ZD, sbotmix}, {ZU, stopmix}, {ZE, staumix}, {ZH, scalarmix}, {ZP, pseudoscalarmix}, {ZC, chargemix}, {ZC2, None}, {ZN, Nmix}, {UP, Umix}, {UM, Vmix}, {UPP, None}, {UMM, None}}; 
 
ParametersToSolveTadpolesCurrent = {Mdelta}; 
 
DimParameters = {{gBL, {}}, {g2, {}}, {g3, {}}, {YQ, {3, 3, 2}}, {YL, {3, 3, 2}}, {f, {3, 3}}, {a, {}}, {AlphaOm, {2, 2}}, {Mdelta, {}}, {Mu3, {2, 2}}, {Momega, {}}, {T[YQ], {3, 3, 2}}, {T[YL], {3, 3, 2}}, {T[f], {3, 3}}, {T[a], {}}, {T[AlphaOm], {2, 2}}, {B[Mdelta], {}}, {B[Mu3], {2, 2}}, {B[Momega], {}}, {mqL2, {3, 3}}, {mqR2, {3, 3}}, {mlL2, {3, 3}}, {mlR2, {3, 3}}, {mPhi2, {2, 2}}, {mdeltaL2, {}}, {mdeltaLbar2, {}}, {mdeltaR2, {}}, {mdeltaRbar2, {}}, {momegaL2, {}}, {momegaR2, {}}, {MassB, {}}, {MassWL, {}}, {MassG, {}}, {vR, {1}}}; 
 
RealParameters = {gBL, g2, g3, mPhi2, vR}; 
 
GenHeavyFields = {{Hpm1R1, 1, 2}, {DR2r1, 1, 1}, {Hpm2R1, 1, 2}, {Cha1r1, 1, 2}, {SDRmmR1, 1, 2}, {DR3r1, 1, 1}, {SDLpR1, 1, 2}, {SDLppR1, 1, 2}, {SDL0r1, 1, 2}, {DL1r1, 1, 1}, {DL2r1, 1, 1}, {DL3r1, 1, 1}, {SH0r1, 3, 4}, {SHCr1, 3, 4}, {H0r1, 3, 2}, {HCr1, 3, 2}}; 
 
eigenstateName = EWSB; 
 
FortranNames = {{gBL, gBL}, {g2, g2}, {g3, g3}, {YQ, YQ}, {YL, YL}, {f, fOm}, {a, aOm}, {AlphaOm, AlphaOm}, {Mdelta, Mdelta}, {Mu3, Mu3}, {Momega, Momega}, {T[YQ], TYQ}, {T[YL], TYL}, {T[f], Tf}, {T[a], Ta}, {T[AlphaOm], TAlphaOm}, {B[Mdelta], BMdelta}, {B[Mu3], BMu3}, {B[Momega], BMomega}, {mqL2, mqL2}, {mqR2, mqR2}, {mlL2, mlL2}, {mlR2, mlR2}, {mPhi2, mPhi2}, {mdeltaL2, mdeltaL2}, {mdeltaLbar2, mdeltaLbar2}, {mdeltaR2, mdeltaR2}, {mdeltaRbar2, mdeltaRbar2}, {momegaL2, momegaL2}, {momegaR2, momegaR2}, {MassB, MassB}, {MassWL, MassWL}, {MassG, MassG}, {vR, vR}}; 
 
HeavyFieldFactors = {{1/4, 0, 0, 0}, {1/2, 0, 0, 0}, {0, 0, 1/4, 0}, {0, 0, 1/2, 0}, {1/4, 0, 1/4, 0}, {1/2, 0, 1/2, 0}, {1/4, 0, 0, 0}, {1, 0, 0, 0}, {3/4, 1/2, 0, 0}, {1/2, 0, 0, 0}, {1/2, 0, 0, 0}, {3/2, 1, 0, 0}, {0, 0, 1/16, 0}, {0, 1/8, 1/8, 0}, {0, 0, 1/8, 0}, {0, 1/4, 1/4, 0}}; 
 
