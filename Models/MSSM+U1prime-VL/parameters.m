(* SARAH generated template for parameters.m file for MSSMU1VL*)
(* File created at 9:08 on 28.1.2016  *) 
(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


ParameterDefinitions = { 
 
(* ----------- Already defined parameters in existing parameters.m ----------- *) 

{aEWinv,{ 
     Description -> "inverse weak coupling constant at mZ", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     Value -> 137.035999679, 
     LesHouches -> {SMINPUTS, 1}, 
     LaTeX -> "\\alpha^{-1}", 
     OutputName -> aEWinv}}, 

{AlphaS,{ 
     Description -> "Alpha Strong", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     Value -> 0.119, 
     LesHouches -> {SMINPUTS, 3}, 
     LaTeX -> "\\alpha_S", 
     OutputName -> aS}}, 

{e,{ 
     Description -> "electric charge", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[aEWinv^(-1)]*Sqrt[Pi], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "e", 
     OutputName -> el}}, 

{g1,{ 
     Description -> "Hypercharge-Coupling", 
     Dependence -> None, 
     DependenceNum -> e*Sec[ThetaW], 
     DependenceOptional -> e*Sec[ThetaW], 
     DependenceSPheno -> None, 
     GUTnormalization -> Sqrt[3/5], 
     Real -> True, 
     LesHouches -> {gauge, 1}, 
     LaTeX -> "g_1", 
     OutputName -> g1}}, 

{g1X,{ 
     Description -> "Mixed Gauge Coupling 1", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 10}, 
     LaTeX -> "g_{Y B}", 
     OutputName -> gYB}}, 

{g2,{ 
     Description -> "Left-Coupling", 
     Dependence -> None, 
     DependenceNum -> e*Csc[ThetaW], 
     DependenceOptional -> e*Csc[ThetaW], 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 2}, 
     LaTeX -> "g_2", 
     OutputName -> g2}}, 

{g3,{ 
     Description -> "Strong-Coupling", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[AlphaS]*Sqrt[Pi], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 3}, 
     LaTeX -> "g_3", 
     OutputName -> g3}}, 

{Gf,{ 
     Description -> "Fermi's constant", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     Value -> 0.0000116639, 
     LesHouches -> {SMINPUTS, 2}, 
     LaTeX -> "G_f", 
     OutputName -> Gf}}, 

{gX,{ 
     Description -> "B-L-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     GUTnormalization -> 1, 
     Real -> True, 
     LesHouches -> {gauge, 4}, 
     LaTeX -> "g_{B}", 
     OutputName -> gBL}}, 

{gX1,{ 
     Description -> "Mixed Gauge Coupling 2", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 11}, 
     LaTeX -> "g_{B Y}", 
     OutputName -> gBY}}, 

{lamD,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> LAMD, 
     LaTeX -> "\\lambda_N", 
     OutputName -> lamD}}, 

{lamN,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {BL, 110}, 
     LaTeX -> "\\lambda_N", 
     OutputName -> lamN}}, 

{lamT,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> LAMT, 
     LaTeX -> "\\lambda_T", 
     OutputName -> lamT}}, 

{lamT3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1VL, 2}, 
     LaTeX -> "lamT3", 
     OutputName -> lamt3}}, 

{lamX,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {BL, 112}, 
     LaTeX -> "\\lambda_X", 
     OutputName -> lamX}}, 

{MassB,{ 
     Description -> "Bino Mass parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Form -> Scalar, 
     Real -> False, 
     LesHouches -> {MSOFT, 1}, 
     LaTeX -> "M_1", 
     OutputName -> M1}}, 

{MassBBp,{ 
     Description -> "Mixed Gaugino Mass 1", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {BL, 32}, 
     LaTeX -> "{M}_{B B'}", 
     OutputName -> MBBp}}, 

{MassBp,{ 
     Description -> "Bino' Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {BL, 31}, 
     LaTeX -> "{M}_{BL}", 
     OutputName -> MBp}}, 

{MassG,{ 
     Description -> "Gluino Mass parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Form -> Scalar, 
     Real -> False, 
     LesHouches -> {MSOFT, 3}, 
     LaTeX -> "M_3", 
     OutputName -> M3}}, 

{MassWB,{ 
     Description -> "Wino Mass parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Form -> Scalar, 
     Real -> False, 
     LesHouches -> {MSOFT, 2}, 
     LaTeX -> "M_2", 
     OutputName -> M2}}, 

{mD12,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MD12, 
     LaTeX -> "m^2_{D1}", 
     OutputName -> md12}}, 

{md2,{ 
     Description -> "Softbreaking right Down-Squark Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MSD2, 
     LaTeX -> "m_d^2", 
     OutputName -> md2}}, 

{mDc2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MDC2, 
     LaTeX -> "m^2_{Dc}", 
     OutputName -> mdc2}}, 

{me2,{ 
     Description -> "Softbreaking right Slepton Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MSE2, 
     LaTeX -> "m_e^2", 
     OutputName -> me2}}, 

{mHd2,{ 
     Description -> "Softbreaking Down-Higgs Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSOFT, 21}, 
     LaTeX -> "m_{H_d}^2", 
     OutputName -> mHd2}}, 

{mHu2,{ 
     Description -> "Softbreaking Up-Higgs Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSOFT, 22}, 
     LaTeX -> "m_{H_u}^2", 
     OutputName -> mHu2}}, 

{ml2,{ 
     Description -> "Softbreaking left Slepton Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MSL2, 
     LaTeX -> "m_l^2", 
     OutputName -> ml2}}, 

{mN2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 42}, 
     LaTeX -> "m^2_{N}", 
     OutputName -> mn2}}, 

{mNc2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 46}, 
     LaTeX -> "m^2_{Nc}", 
     OutputName -> mnc2}}, 

{mNNc2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 44}, 
     LaTeX -> "m^2_{NNc}", 
     OutputName -> mnnc2}}, 

{mq2,{ 
     Description -> "Softbreaking left Squark Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MSQ2, 
     LaTeX -> "m_q^2", 
     OutputName -> mq2}}, 

{mS12,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 28}, 
     LaTeX -> "m^2_{S1}", 
     OutputName -> ms12}}, 

{mS1c2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 30}, 
     LaTeX -> "m^2_{S1c}", 
     OutputName -> ms1c2}}, 

{mS2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 18}, 
     LaTeX -> "m^2_{S}", 
     OutputName -> ms2}}, 

{mS22,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 32}, 
     LaTeX -> "m^2_{S2}", 
     OutputName -> ms22}}, 

{mSc2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 24}, 
     LaTeX -> "m^2_{Sc}", 
     OutputName -> msc2}}, 

{mScS22,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 26}, 
     LaTeX -> "m^2_{ScS2}", 
     OutputName -> mscs22}}, 

{mT2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MT2, 
     LaTeX -> "m^2_{T}", 
     OutputName -> mt2}}, 

{mT32,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 34}, 
     LaTeX -> "m^2_{T3}", 
     OutputName -> mt32}}, 

{mT3c2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 36}, 
     LaTeX -> "m^2_{T3c}", 
     OutputName -> mt3c2}}, 

{mTc2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MTC2, 
     LaTeX -> "m^2_{Tc}", 
     OutputName -> mtc2}}, 

{mu1S2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 121}, 
     LaTeX -> "\\mu_{1S}^2", 
     OutputName -> mu1S2}}, 

{mu2,{ 
     Description -> "Softbreaking right Up-Squark Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MSU2, 
     LaTeX -> "m_u^2", 
     OutputName -> mu2}}, 

{mu2S2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 122}, 
     LaTeX -> "\\mu_{2S}^2", 
     OutputName -> mu2S2}}, 

{kap2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 123}, 
     LaTeX -> "\\kappa_2", 
     OutputName -> kap2}}, 

{kap1,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 8}, 
     LaTeX -> "\\kappa_{1}", 
     OutputName -> kap1}}, 

{muS2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 120}, 
     LaTeX -> "\\mu_{S}^2", 
     OutputName -> muS2}}, 

{mvR2,{ 
     Description -> "Softbreaking right Sneutrino Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> mv2, 
     LaTeX -> "m_{\\nu}^2", 
     OutputName -> mv2}}, 

{mX2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 38}, 
     LaTeX -> "m^2_{X}", 
     OutputName -> mx2}}, 

{mXc2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 40}, 
     LaTeX -> "m^2_{Xc}", 
     OutputName -> mxc2}}, 

{PhaseFnc,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1VL, 12}, 
     LaTeX -> "PhaseFnc", 
     OutputName -> pfnc}}, 

{PhaseFt3c,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1VL, 6}, 
     LaTeX -> "PhaseFt3c", 
     OutputName -> phft}}, 

{PhaseGlu,{ 
     Description -> "Gluino-Phase", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {Phases, 1}, 
     LaTeX -> "\\phi_{\\tilde{g}}", 
     OutputName -> pG}}, 

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> ArcSin[Sqrt[1 - Mass[VWm]^2/Mass[VZ]^2]], 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[1, 1]]], 
     Real -> True, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 

{ThetaWp,{ 
     Description -> "Theta'", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[3, 3]]], 
     Real -> True, 
     LesHouches -> {ANGLES, 10}, 
     LaTeX -> "{\\Theta'}_W", 
     OutputName -> TWp}}, 

{UM,{ 
     Description -> "Chargino-minus Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UMIX, 
     LaTeX -> "U", 
     OutputName -> UM}}, 

{UP,{ 
     Description -> "Chargino-plus Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> VMIX, 
     LaTeX -> "V", 
     OutputName -> UP}}, 

{UV,{ 
     Description -> "Neutrino-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UVMIX, 
     LaTeX -> "U^V", 
     OutputName -> UV}}, 

{v,{ 
     Description -> "EW-VEV", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[Mass[VWm]^2/g2^2], 
     DependenceOptional -> None, 
     DependenceSPheno -> Sqrt[vd^2 + vu^2], 
     Real -> True, 
     LesHouches -> {HMIX, 3}, 
     LaTeX -> "v", 
     OutputName -> v}}, 

{vd,{ 
     Description -> "Down-VEV", 
     Dependence -> None, 
     DependenceNum -> v*Cos[\[Beta]], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 102}, 
     LaTeX -> "v_d", 
     OutputName -> vd}}, 

{vS,{ 
     Description -> "Singlet-VEV", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 101}, 
     LaTeX -> "v_S", 
     OutputName -> vS}}, 

{vS1,{ 
     Description -> "Singlet-1 VEV", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 103}, 
     LaTeX -> "v_{S1}", 
     OutputName -> vS1}}, 

{vS1c,{ 
     Description -> "Singlet-1c VEV", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 104}, 
     LaTeX -> "v_{S1c}", 
     OutputName -> vS1c}}, 

{vS2,{ 
     Description -> "Singlet-2 VEV", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 105}, 
     LaTeX -> "v_{S2}", 
     OutputName -> vS2}}, 

{vSc,{ 
     Description -> "Singlet-c VEV", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {BL, 102}, 
     LaTeX -> "v_{Sc}", 
     OutputName -> vSc}}, 

{vu,{ 
     Description -> "Up-VEV", 
     Dependence -> None, 
     DependenceNum -> v*Sin[\[Beta]], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 103}, 
     LaTeX -> "v_u", 
     OutputName -> vu}}, 

{Yd,{ 
     Description -> "Down-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yd, 
     LaTeX -> "Y_d", 
     OutputName -> Yd}}, 

{Ye,{ 
     Description -> "Lepton-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Ye, 
     LaTeX -> "Y_e", 
     OutputName -> Ye}}, 

{Yu,{ 
     Description -> "Up-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yu, 
     LaTeX -> "Y_u", 
     OutputName -> Yu}}, 

{Yv,{ 
     Description -> "Neutrino-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yv, 
     LaTeX -> "Y_\\nu", 
     OutputName -> Yv}}, 

{ZA,{ 
     Description -> "Pseudo-Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> PSEUDOSCALARMIX, 
     LaTeX -> "Z^A", 
     OutputName -> ZA}}, 

{ZD,{ 
     Description -> "Down-Squark-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> DSQMIX, 
     LaTeX -> "Z^D", 
     OutputName -> ZD}}, 

{ZDV,{ 
     Description -> "VL-Down-Squark-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> DSQVMIX, 
     LaTeX -> "Z^D_V", 
     OutputName -> ZDV}},      
     
{ZDL,{ 
     Description -> "Left-Down-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UDLMIX, 
     LaTeX -> "U^d_L", 
     OutputName -> ZDL}}, 

{ZDR,{ 
     Description -> "Right-Down-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UDRMIX, 
     LaTeX -> "U^d_R", 
     OutputName -> ZDR}}, 

{ZE,{ 
     Description -> "Slepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> SELMIX, 
     LaTeX -> "Z^E", 
     OutputName -> ZE}}, 

{ZEV,{ 
     Description -> "VL-Slepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZEVMIX, 
     LaTeX -> "Z^E_V", 
     OutputName -> ZEV}},      
     
{ZEL,{ 
     Description -> "Left-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UELMIX, 
     LaTeX -> "U^e_L", 
     OutputName -> ZEL}}, 

{ZER,{ 
     Description -> "Right-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UERMIX, 
     LaTeX -> "U^e_R", 
     OutputName -> ZER}}, 

{ZfW,{ 
     Description -> "Wino Mixing Matrix", 
     Dependence -> {{1/Sqrt[2], 1/Sqrt[2], 0}, {(-I)/Sqrt[2], I/Sqrt[2], 0}, {0, 0, 1}}, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LaTeX -> "Z^{\\tilde{W}}", 
     OutputName -> ZfW}}, 

{ZH,{ 
     Description -> "Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> SCALARMIX, 
     LaTeX -> "Z^H", 
     OutputName -> ZH}}, 

{ZN,{ 
     Description -> "Neutralino Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> NMIX, 
     LaTeX -> "N", 
     OutputName -> ZN}}, 

{ZP,{ 
     Description -> "Charged-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> {{-Cos[\[Beta]], Sin[\[Beta]]}, {Sin[\[Beta]], Cos[\[Beta]]}}, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> CHARGEMIX, 
     LaTeX -> "Z^+", 
     OutputName -> ZP}}, 

{ZU,{ 
     Description -> "Up-Squark-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> USQMIX, 
     LaTeX -> "Z^U", 
     OutputName -> ZU}}, 

{ZUV,{ 
     Description -> "VL-Up-Squark-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> USQVMIX, 
     LaTeX -> "Z^U_V", 
     OutputName -> ZUV}},      
     
{ZUL,{ 
     Description -> "Left-Up-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UULMIX, 
     LaTeX -> "U^u_L", 
     OutputName -> ZUL}}, 

{ZUR,{ 
     Description -> "Right-Up-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UURMIX, 
     LaTeX -> "U^u_R", 
     OutputName -> ZUR}}, 

{ZVI,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> SNUMIXI, 
     LaTeX -> "Z^I", 
     OutputName -> ZVI}}, 

{ZVR,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> SNUMIXR, 
     LaTeX -> "Z^R", 
     OutputName -> ZVR}}, 

     
{ZVVI,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> SNUVMIXI, 
     LaTeX -> "Z^I_V", 
     OutputName -> ZVVI}}, 

{ZVVR,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> SNUVMIXR, 
     LaTeX -> "Z^R_V", 
     OutputName -> ZVVR}},      
     
     
{ZW,{ 
     Description -> "W Mixing Matrix", 
     Dependence -> {{1/Sqrt[2], 1/Sqrt[2]}, {(-I)/Sqrt[2], I/Sqrt[2]}}, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LaTeX -> "Z^{W}", 
     OutputName -> ZW}}, 

{ZZ,{ 
     Description -> "Photon-Z-Z' Mixing Matrix", 
     Dependence -> {{Cos[ThetaW], -(Cos[ThetaWp]*Sin[ThetaW]), Sin[ThetaW]*Sin[ThetaWp]}, {Sin[ThetaW], Cos[ThetaW]*Cos[ThetaWp], -(Cos[ThetaW]*Sin[ThetaWp])}, {0, Sin[ThetaWp], Cos[ThetaWp]}}, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Z^{\\gamma Z Z'}", 
     OutputName -> ZZ}}, 

{\[Beta],{ 
     Description -> "Pseudo Scalar mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcSin[Abs[ZP[1, 2]]], 
     Real -> True, 
     LesHouches -> {HMIX, 10}, 
     LaTeX -> "\\beta", 
     OutputName -> betaH}}, 

{\[Lambda],{ 
     Description -> "Singlet-Higgs-Interaction", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSMRUN, 1}, 
     LaTeX -> "\\lambda", 
     OutputName -> lam}}, 

{B[mu1S2],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 6}, 
     LaTeX -> "B_{\\mu^2_{1S}}", 
     OutputName -> Bm1s}}, 

{B[mu2S2],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 2}, 
     LaTeX -> "B_{\\mu^2_{2S}}", 
     OutputName -> Bm2s}}, 

{B[muS2],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 4}, 
     LaTeX -> "B_{\\mu^2_{S}}", 
     OutputName -> Bmus}}, 

{Mass[VWm],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1, 54}, 
     LaTeX -> "M_{VWm}", 
     OutputName -> Mvwm}}, 

{T[lamD],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> TLAMD, 
     LaTeX -> "T_{lamD}", 
     OutputName -> Tld}}, 

{T[lamN],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1, 12}, 
     LaTeX -> "T_{lamN}", 
     OutputName -> Tln}}, 

{T[lamT],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> TLAMT, 
     LaTeX -> "T_{lamT}", 
     OutputName -> Tlt}}, 

{T[lamT3],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1VL, 4}, 
     LaTeX -> "T_{lamT3}", 
     OutputName -> Tlt3}}, 

{T[lamX],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {MSSMU1, 14}, 
     LaTeX -> "T_{lamX}", 
     OutputName -> Tlx}}, 

{T[kap2],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 16}, 
     LaTeX -> "T_{\\kappa_{2}}", 
     OutputName -> Tka2}}, 

{T[kap1],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {MSSMU1, 10}, 
     LaTeX -> "T_{{\\kappa}_{1}}", 
     OutputName -> Tka1}}, 

{T[Yd],{ 
     Description -> "Trilinear-Down-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Td, 
     LaTeX -> "T_d", 
     OutputName -> Td}}, 

{T[Ye],{ 
     Description -> "Trilinear-Lepton-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Te, 
     LaTeX -> "T_e", 
     OutputName -> Te}}, 

{T[Yu],{ 
     Description -> "Trilinear-Up-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Tu, 
     LaTeX -> "T_u", 
     OutputName -> Tu}}, 

{T[Yv],{ 
     Description -> "Trilinear-Neutrino-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Tv, 
     LaTeX -> "T_\\nu", 
     OutputName -> Tv}}, 

{T[\[Lambda]],{ 
     Description -> "Softbreaking Singlet-Higgs-Interaction", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSMRUN, 3}, 
     LaTeX -> "T_{\\lambda}", 
     OutputName -> Tlam}}, 



(*  ----------- Additional parameters in the model ---------- *) 

{PhaseFxc,{ 
     Real -> False, 
     LesHouches -> {MSSMU1VL,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "PhaseFxc"  (* auto generated LaTeX name *), 
     OutputName -> pfxc  (* auto generated Output name *)}}, 

{ZTL,{ 
     Real -> False, 
     LesHouches -> ZTL  (* auto generated Les Houches entry *), 
     LaTeX -> "{ZT}_L"  (* auto generated LaTeX name *), 
     OutputName -> ztl  (* auto generated Output name *)}}, 

{ZTR,{ 
     Real -> False, 
     LesHouches -> ZTR  (* auto generated Les Houches entry *), 
     LaTeX -> "{ZT}_R"  (* auto generated LaTeX name *), 
     OutputName -> ztr  (* auto generated Output name *)}}, 

{ZEPL,{ 
     Real -> False, 
     LesHouches -> ZEPL  (* auto generated Les Houches entry *), 
     LaTeX -> "{ZEP}_L"  (* auto generated LaTeX name *), 
     OutputName -> zepl  (* auto generated Output name *)}}, 

{ZEPR,{ 
     Real -> False, 
     LesHouches -> ZEPR  (* auto generated Les Houches entry *), 
     LaTeX -> "{ZEP}_R"  (* auto generated LaTeX name *), 
     OutputName -> zepr  (* auto generated Output name *)}}, 

{ZNL,{ 
     Real -> False, 
     LesHouches -> ZNL  (* auto generated Les Houches entry *), 
     LaTeX -> "{ZN}_L"  (* auto generated LaTeX name *), 
     OutputName -> znl  (* auto generated Output name *)}}, 

{ZNR,{ 
     Real -> False, 
     LesHouches -> ZNR  (* auto generated Les Houches entry *), 
     LaTeX -> "{ZN}_R"  (* auto generated LaTeX name *), 
     OutputName -> znr  (* auto generated Output name *)}} 
} 
