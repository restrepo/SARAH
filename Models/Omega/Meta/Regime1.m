HeavyFields = {Hpm1R1, DR2r1, Hpm2R1, Cha1r1, SDRmmR1, DR3r1, SDLpR1, SDLppR1, SDL0r1, DL1r1, DL2r1, DL3r1, SH0r1, SHCr1, H0r1, HCr1}; 
 
numberLowCurrent = 315; 
numberAllCurrent = 315; 
 
numberAllwithVEVsCurrent = 316; 
 
YukawaCouplingsCurrent = {a, f[i1, i2], YL[i1, i2, i3], AlphaOm[i1, i2], YQ[i1, i2, i3]}; 
 
listAll = {gBL, g2, g3, a, f, YL, AlphaOm, YQ, Mdelta, Momega, Mu3, T[a], T[f], T[YL], T[AlphaOm], T[YQ], B[Mdelta], B[Momega], B[Mu3], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG}; 
 
listAllwithVEVs = {gBL, g2, g3, a, f, YL, AlphaOm, YQ, Mdelta, Momega, Mu3, T[a], T[f], T[YL], T[AlphaOm], T[YQ], B[Mdelta], B[Momega], B[Mu3], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG, vR}; 
 
listLow = {gBL, g2, g3, a, f, YL, AlphaOm, YQ, Mdelta, Momega, Mu3, T[a], T[f], T[YL], T[AlphaOm], T[YQ], B[Mdelta], B[Momega], B[Mu3], mqL2, mqR2, mlL2, mlR2, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, MassB, MassWL, MassG}; 
 
listVEVsCurrent = {vR}; 
 
listGaugeCurrent = {gBL, g2, g2, g3}; 
 
listGauginosCurrent = {MassB, MassWL, MassWL, MassG}; 
 
GaugeFixingCurrent = {RXi[B], RXi[G], RXi[WL], RXi[WR], RXi[WR0], RXi[WRm]}; 
 
LHnamesCurrent = {{gBL, {gauge, 4}}, {g2, {gauge, 2}}, {g3, {gauge, 3}}, {AlphaS, {SMINPUTS, 3}}, {YQ, YQ}, {YL, YL}, {T[YQ], TQ}, {T[YL], TL}, {Mu3, Mu3}, {B[Mu3], BMu3}, {f, FO}, {T[f], TFO}, {a, AOM}, {T[a], TAOM}, {AlphaOm, ALPHAOM}, {T[AlphaOm], TALPHAOM}, {Mdelta, MDELTA}, {B[Mdelta], BDELTA}, {Momega, MOMEGA}, {B[Momega], BOMEGA}, {mqL2, MQL2}, {mqR2, MQR2}, {mlL2, MLL2}, {mlR2, MLR2}, {mPhi2, MPHI2}, {MassB, {MSOFT, 1}}, {MassWL, {MSOFT, 2}}, {MassWR, {MSOFT, 5}}, {MassG, {MSOFT, 3}}, {mdeltaL2, {MSOFT, 41}}, {mdeltaLbar2, {MSOFT, 42}}, {mdeltaR2, {MSOFT, 43}}, {mdeltaRbar2, {MSOFT, 44}}, {momegaL2, {MSOFT, 45}}, {momegaR2, {MSOFT, 46}}, {vR, None}, {ZD, sbotmix}, {ZU, stopmix}, {ZE, staumix}, {ZH, scalarmix}, {ZP, pseudoscalarmix}, {ZC, chargemix}, {ZC2, None}, {ZN, Nmix}, {UP, Umix}, {UM, Vmix}, {UPP, None}, {UMM, None}}; 
 
ParametersToSolveTadpolesCurrent = {Mdelta}; 
 
DimParameters = {{gBL, {}}, {g2, {}}, {g3, {}}, {a, {}}, {f, {3, 3}}, {YL, {3, 3, 2}}, {AlphaOm, {2, 2}}, {YQ, {3, 3, 2}}, {Mdelta, {}}, {Momega, {}}, {Mu3, {2, 2}}, {T[a], {}}, {T[f], {3, 3}}, {T[YL], {3, 3, 2}}, {T[AlphaOm], {2, 2}}, {T[YQ], {3, 3, 2}}, {B[Mdelta], {}}, {B[Momega], {}}, {B[Mu3], {2, 2}}, {mqL2, {3, 3}}, {mqR2, {3, 3}}, {mlL2, {3, 3}}, {mlR2, {3, 3}}, {mPhi2, {2, 2}}, {mdeltaL2, {}}, {mdeltaLbar2, {}}, {mdeltaR2, {}}, {mdeltaRbar2, {}}, {momegaL2, {}}, {momegaR2, {}}, {MassB, {}}, {MassWL, {}}, {MassG, {}}, {vR, {1}}}; 
 
RealParametersRegime = {gBL, g2, g3, mPhi2, mdeltaL2, mdeltaLbar2, mdeltaR2, mdeltaRbar2, momegaL2, momegaR2, vR}; 
 
GenHeavyFields = {{Hpm1R1, 1, 2}, {DR2r1, 1, 1}, {Hpm2R1, 1, 2}, {Cha1r1, 1, 2}, {SDRmmR1, 1, 2}, {DR3r1, 1, 1}, {SDLpR1, 1, 2}, {SDLppR1, 1, 2}, {SDL0r1, 1, 2}, {DL1r1, 1, 1}, {DL2r1, 1, 1}, {DL3r1, 1, 1}, {SH0r1, 3, 4}, {SHCr1, 3, 4}, {H0r1, 3, 2}, {HCr1, 3, 2}}; 
 
eigenstateName = EWSB; 
 
FortranNames = {{gBL, gBL}, {g2, g2}, {g3, g3}, {a, aOM}, {f, fOM}, {YL, YL}, {AlphaOm, alphaOM}, {YQ, YQ}, {Mdelta, Mdelta}, {Momega, Momega}, {Mu3, Mu3}, {T[a], Ta}, {T[f], Tf}, {T[YL], TYL}, {T[AlphaOm], TAlphaOm}, {T[YQ], TYQ}, {B[Mdelta], BMdelta}, {B[Momega], BMomega}, {B[Mu3], BMu3}, {mqL2, mqL2}, {mqR2, mqR2}, {mlL2, mlL2}, {mlR2, mlR2}, {mPhi2, mPhi2}, {mdeltaL2, mdeltaL2}, {mdeltaLbar2, mdeltaLbar2}, {mdeltaR2, mdeltaR2}, {mdeltaRbar2, mdeltaRbar2}, {momegaL2, momegaL2}, {momegaR2, momegaR2}, {MassB, MassB}, {MassWL, MassWL}, {MassG, MassG}, {vR, vR}}; 
 
HeavyFieldFactors = {{1/6, 0, 0, 0}, {1/3, 0, 0, 0}, {0, 0, 1/6, 0}, {0, 0, 1/3, 0}, {1/6, 0, 1/6, 0}, {1/3, 0, 1/3, 0}, {1/6, 0, 0, 0}, {2/3, 0, 0, 0}, {1/2, 1/3, 0, 0}, {1/3, 0, 0, 0}, {1/3, 0, 0, 0}, {1, 2/3, 0, 0}, {0, 0, 1/24, 0}, {0, 1/12, 1/12, 0}, {0, 0, 1/12, 0}, {0, 1/6, 1/6, 0}}; 
 
