HeavyFields = {hhR2, AhR2, ChiR2, FvR2, SVRr2, SomegaL0r2, SOmLpR2, Fomega0, ChaR2}; 
 
numberLowCurrent = 104; 
numberAllCurrent = 334; 
 
numberAllwithVEVsCurrent = 336; 
 
YukawaCouplingsCurrent = {Yu[i1, i2], Yd[i1, i2], Ye[i1, i2], Yv[i1, i2], fc1[i1, i2], ac1, b, bc}; 
 
listAll = {gBL, gL, gR, g3, Yu, Yd, Ye, Yv, fc1, ac1, b, bc, Mdeltac1, Momega, \[Mu], T[Yu], T[Yd], T[Ye], T[Yv], T[fc1], T[ac1], T[b], T[bc], B[Mdeltac1], B[Momega], B[\[Mu]], mqL2, mdR2, muR2, mlL2, meR2, mvR2, mHd2, mHu2, mdeltaR02, mdeltaRbar02, momegaL2, momegaR02, MassB, MassWL, MassWR0, MassG}; 
 
listAllwithVEVs = {gBL, gL, gR, g3, Yu, Yd, Ye, Yv, fc1, ac1, b, bc, Mdeltac1, Momega, \[Mu], T[Yu], T[Yd], T[Ye], T[Yv], T[fc1], T[ac1], T[b], T[bc], B[Mdeltac1], B[Momega], B[\[Mu]], mqL2, mdR2, muR2, mlL2, meR2, mvR2, mHd2, mHu2, mdeltaR02, mdeltaRbar02, momegaL2, momegaR02, MassB, MassWL, MassWR0, MassG, vR, vBL}; 
 
listLow = {gBL, gL, gR, g3, Yu, Yd, Ye, Yv, fc1, ac1, b, bc, Mdeltac1, Momega}; 
 
listVEVsCurrent = {vR, vBL}; 
 
listGaugeCurrent = {gBL, gL, gR, g3}; 
 
listGauginosCurrent = {MassB, MassWL, MassWR0, MassG}; 
 
LHnamesCurrent = {{gBL, {gauge, 4}}, {gBLgR, {gauge, 10}}, {gRgBL, {gauge, 11}}, {MassBWR0, {MSOFT, 10}}, {MassWR0B, {MSOFT, 11}}, {gL, {gauge, 6}}, {gR, {gauge, 7}}, {g3, {gauge, 3}}, {Yu, Yu}, {Yd, Yd}, {Ye, Ye}, {T[Ye], Te}, {T[Yd], Td}, {T[Yu], Tu}, {\[Mu], {HMIX, 1}}, {B[\[Mu]], {HMIX, 101}}, {fc1, FC1}, {T[fc1], TFC1}, {Mdeltac1, MDELTAC1}, {B[Mdeltac1], BDELTAC1}, {mqL2, MQL2}, {muR2, MUR2}, {mdR2, MDR2}, {mlL2, MLL2}, {meR2, MER2}, {mvR2, MVR2}, {mHd2, {MSOFT, 21}}, {mHu2, {MSOFT, 22}}, {MassB, {MSOFT, 1}}, {MassWL, {MSOFT, 2}}, {MassWR0, {MSOFT, 12}}, {MassG, {MSOFT, 3}}, {mdeltaR02, {MSOFT, 51}}, {mdeltaRbar02, {MSOFT, 51}}, {vBL, None}, {ZD, sbotmix}, {ZU, stopmix}, {ZE, staumix}, {ZH, scalarmix}, {ZP, pseudoscalarmix}, {ZC, chargemix}, {ZC2, None}, {ZN, Nmix}, {UP, Umix}, {UM, Vmix}, {UPP, None}, {UMM, None}, {momegaL2, {MSOFT, 61}}, {momegaR02, {MSOFT, 61}}, {Yv, Yv}, {T[Yv], Tv}, {bc, BCOM}, {ac1, AC1}, {T[ac1], TAC1}, {T[bc], TBCOM}, {b, BOM}, {T[b], TBOM}, {\[Xi], None}}; 
 
ParametersToSolveTadpolesCurrent = {Mdeltac1, Momega}; 
 
DimParameters = {{gBL, {}}, {gL, {}}, {gR, {}}, {g3, {}}, {Yu, {3, 3}}, {Yd, {3, 3}}, {Ye, {3, 3}}, {Yv, {3, 3}}, {fc1, {3, 3}}, {ac1, {}}, {b, {}}, {bc, {}}, {Mdeltac1, {}}, {Momega, {}}, {\[Mu], {}}, {T[Yu], {3, 3}}, {T[Yd], {3, 3}}, {T[Ye], {3, 3}}, {T[Yv], {3, 3}}, {T[fc1], {3, 3}}, {T[ac1], {}}, {T[b], {}}, {T[bc], {}}, {B[Mdeltac1], {}}, {B[Momega], {}}, {B[\[Mu]], {}}, {mqL2, {3, 3}}, {mdR2, {3, 3}}, {muR2, {3, 3}}, {mlL2, {3, 3}}, {meR2, {3, 3}}, {mvR2, {3, 3}}, {mHd2, {}}, {mHu2, {}}, {mdeltaR02, {}}, {mdeltaRbar02, {}}, {momegaL2, {}}, {momegaR02, {}}, {MassB, {}}, {MassWL, {}}, {MassWR0, {}}, {MassG, {}}, {vR, {1}}, {vBL, {1}}, {gBLgR, {}}, {gRgBL, {}}, {MassBWR0, {}}}; 
 
RealParameters = {gBL, gL, gR, g3, mHd2, mHu2, vR, vBL, gBLgR, gRgBL}; 
 
GenHeavyFields = {{hhR2, 1, 3}, {AhR2, 1, 3}, {ChiR2, 2, 5}, {FvR2, 4, 6}, {SVRr2, 1, 3}, {SomegaL0r2, 1, 1}, {SOmLpR2, 1, 2}, {Fomega0, 1, 1}, {ChaR2, 1, 1}}; 
 
eigenstateName = EWSB; 
 
FortranNames = {{gBL, gBL}, {gL, gL}, {gR, gR}, {g3, g3}, {Yu, Yu}, {Yd, Yd}, {Ye, Ye}, {Yv, Yv}, {fc1, fc1}, {ac1, ac1}, {b, bparameter}, {bc, bc}, {Mdeltac1, Mdeltac1}, {Momega, Momega}, {\[Mu], Mu}, {T[Yu], Tu}, {T[Yd], Td}, {T[Ye], Te}, {T[Yv], TYv}, {T[fc1], Tfc1}, {T[ac1], Tac1}, {T[b], Tb}, {T[bc], Tbc}, {B[Mdeltac1], BMdeltac1}, {B[Momega], Bomega}, {B[\[Mu]], Bmu}, {mqL2, mqL2}, {mdR2, mdR2}, {muR2, muR2}, {mlL2, mlL2}, {meR2, meR2}, {mvR2, mvR2}, {mHd2, mHd2}, {mHu2, mHu2}, {mdeltaR02, mdeltaR02}, {mdeltaRbar02, mdeltaRbar02}, {momegaL2, momegaL2}, {momegaR02, momegaR02}, {MassB, MassB}, {MassWL, MassWL}, {MassWR0, MassWR0}, {MassG, MassG}, {vR, vR}, {vBL, vBL}}; 
 
HeavyFieldFactors = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1/2, 0}, {0, 0, 0}, {0, 1, 0}}; 
 
