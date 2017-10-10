HeavyFields = {hhR2, AhR2, ChiR2, FvR2, SVRr2, SomegaL0r2, SOmLpR2, Fomega0, ChaR2}; 
 
numberLowCurrent = 330; 
numberAllCurrent = 330; 
 
numberAllwithVEVsCurrent = 332; 
 
YukawaCouplingsCurrent = {ac1, Ye[i1, i2], Yv[i1, i2], b, bc, Yd[i1, i2], Yu[i1, i2], fc1[i1, i2]}; 
 
listAll = {gBL, gL, gR, g3, ac1, Ye, Yv, b, bc, Yd, Yu, fc1, Mdeltac1, \[Mu], Momega, T[ac1], T[Ye], T[Yv], T[b], T[bc], T[Yd], T[Yu], T[fc1], B[Mdeltac1], B[\[Mu]], B[Momega], mqL2, mdR2, muR2, mlL2, meR2, mvR2, mHd2, mHu2, mdeltaR02, mdeltaRbar02, momegaL2, momegaR02, MassB, MassWL, MassWR0, MassG}; 
 
listAllwithVEVs = {gBL, gL, gR, g3, ac1, Ye, Yv, b, bc, Yd, Yu, fc1, Mdeltac1, \[Mu], Momega, T[ac1], T[Ye], T[Yv], T[b], T[bc], T[Yd], T[Yu], T[fc1], B[Mdeltac1], B[\[Mu]], B[Momega], mqL2, mdR2, muR2, mlL2, meR2, mvR2, mHd2, mHu2, mdeltaR02, mdeltaRbar02, momegaL2, momegaR02, MassB, MassWL, MassWR0, MassG, vR, vBL}; 
 
listLow = {gBL, gL, gR, g3, ac1, Ye, Yv, b, bc, Yd, Yu, fc1, Mdeltac1, \[Mu], Momega, T[ac1], T[Ye], T[Yv], T[b], T[bc], T[Yd], T[Yu], T[fc1], B[Mdeltac1], B[\[Mu]], B[Momega], mqL2, mdR2, muR2, mlL2, meR2, mvR2, mHd2, mHu2, mdeltaR02, mdeltaRbar02, momegaL2, momegaR02, MassB, MassWL, MassWR0, MassG}; 
 
listVEVsCurrent = {vBL, vR}; 
 
listGaugeCurrent = {gBL, gL, gR, g3}; 
 
listGauginosCurrent = {MassB, MassWL, MassWR0, MassG}; 
 
GaugeFixingCurrent = {RXi[B], RXi[BY], RXi[G], RXi[WL], RXi[WR0], RXi[Z2]}; 
 
LHnamesCurrent = {{gBL, {gauge, 4}}, {gL, {gauge, 6}}, {gR, {gauge, 7}}, {g3, {gauge, 3}}, {AlphaS, {SMINPUTS, 3}}, {Yu, Yu}, {Yd, Yd}, {Ye, Ye}, {T[Ye], Te}, {T[Yd], Td}, {T[Yu], Tu}, {\[Mu], {HMIX, 1}}, {B[\[Mu]], {HMIX, 101}}, {fc1, FC1}, {T[fc1], TFC1}, {Mdeltac1, MDELTAC1}, {B[Mdeltac1], BDELTAC1}, {mqL2, MQL2}, {muR2, MUR2}, {mdR2, MDR2}, {mlL2, MLL2}, {meR2, MER2}, {mvR2, MVR2}, {mHd2, {MSOFT, 21}}, {mHu2, {MSOFT, 22}}, {MassB, {MSOFT, 1}}, {MassWL, {MSOFT, 2}}, {MassWR0, {MSOFT, 12}}, {MassG, {MSOFT, 3}}, {mdeltaR02, {MSOFT, 51}}, {mdeltaRbar02, {MSOFT, 51}}, {vBL, None}, {ZD, sbotmix}, {ZU, stopmix}, {ZE, staumix}, {ZH, scalarmix}, {ZP, pseudoscalarmix}, {ZC, chargemix}, {ZC2, None}, {ZN, Nmix}, {UP, Umix}, {UM, Vmix}, {UPP, None}, {UMM, None}, {momegaL2, {MSOFT, 61}}, {momegaR02, {MSOFT, 61}}, {Yv, Yv}, {T[Yv], Tv}, {bc, BCOM}, {ac1, AC1}, {T[ac1], TAC1}, {T[bc], TBCOM}, {b, BOM}, {T[b], TBOM}, {\[Xi], None}}; 
 
ParametersToSolveTadpolesCurrent = {Mdeltac1, Momega}; 
 
DimParameters = {{gBL, {}}, {gL, {}}, {gR, {}}, {g3, {}}, {ac1, {}}, {Ye, {3, 3}}, {Yv, {3, 3}}, {b, {}}, {bc, {}}, {Yd, {3, 3}}, {Yu, {3, 3}}, {fc1, {3, 3}}, {Mdeltac1, {}}, {\[Mu], {}}, {Momega, {}}, {T[ac1], {}}, {T[Ye], {3, 3}}, {T[Yv], {3, 3}}, {T[b], {}}, {T[bc], {}}, {T[Yd], {3, 3}}, {T[Yu], {3, 3}}, {T[fc1], {3, 3}}, {B[Mdeltac1], {}}, {B[\[Mu]], {}}, {B[Momega], {}}, {mqL2, {3, 3}}, {mdR2, {3, 3}}, {muR2, {3, 3}}, {mlL2, {3, 3}}, {meR2, {3, 3}}, {mvR2, {3, 3}}, {mHd2, {}}, {mHu2, {}}, {mdeltaR02, {}}, {mdeltaRbar02, {}}, {momegaL2, {}}, {momegaR02, {}}, {MassB, {}}, {MassWL, {}}, {MassWR0, {}}, {MassG, {}}, {vR, {1}}, {vBL, {1}}}; 
 
RealParametersRegime = {gBL, gL, gR, g3, mHd2, mHu2, mdeltaR02, mdeltaRbar02, momegaL2, momegaR02, vR, vBL}; 
 
GenHeavyFields = {{hhR2, 1, 3}, {AhR2, 1, 3}, {ChiR2, 2, 5}, {FvR2, 4, 6}, {SVRr2, 1, 3}, {SomegaL0r2, 1, 1}, {SOmLpR2, 1, 2}, {Fomega0, 1, 1}, {ChaR2, 1, 1}}; 
 
eigenstateName = EWSB; 
 
FortranNames = {{gBL, gBL}, {gL, gL}, {gR, gR}, {g3, g3}, {ac1, ac1}, {Ye, Ye}, {Yv, Yv}, {b, bparameter}, {bc, bc}, {Yd, Yd}, {Yu, Yu}, {fc1, fc1}, {Mdeltac1, Mdeltac1}, {\[Mu], Mu}, {Momega, Momega}, {T[ac1], Tac1}, {T[Ye], Te}, {T[Yv], TYv}, {T[b], Tb}, {T[bc], Tbc}, {T[Yd], Td}, {T[Yu], Tu}, {T[fc1], Tfc1}, {B[Mdeltac1], BMdeltac1}, {B[\[Mu]], Bmu}, {B[Momega], Bomega}, {mqL2, mqL2}, {mdR2, mdR2}, {muR2, muR2}, {mlL2, mlL2}, {meR2, meR2}, {mvR2, mvR2}, {mHd2, mHd2}, {mHu2, mHu2}, {mdeltaR02, mdeltaR02}, {mdeltaRbar02, mdeltaRbar02}, {momegaL2, momegaL2}, {momegaR02, momegaR02}, {MassB, MassB}, {MassWL, MassWL}, {MassWR0, MassWR0}, {MassG, MassG}, {vR, vR}, {vBL, vBL}}; 
 
HeavyFieldFactors = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 1/3, 0}, {0, 0, 0}, {0, 2/3, 0}}; 
 
