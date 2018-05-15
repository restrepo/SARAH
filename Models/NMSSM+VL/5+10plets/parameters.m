(* SARAH generated template for parameters.m file for NMSSM15*)
(* File created at 20:02 on 17.1.2016  *) 
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

{kappa,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 42}, 
     LaTeX -> "\\kappa", 
     OutputName -> kap}}, 

{lambda,{
     Description -> "Singlet-Higgs-Interaction",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 34}, 
     LaTeX -> "\\lambda", 
     OutputName -> lam}}, 

{lD5,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 18}, 
     LaTeX -> "\\lambda_D", 
     OutputName -> ld5}}, 

{lL5,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 22}, 
     LaTeX -> "\\lambda_L", 
     OutputName -> ll5}}, 

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

{md52,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSM5, 26}, 
     LaTeX -> "m^2_{d5}", 
     OutputName -> md52}}, 

{md5p2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSM5, 28}, 
     LaTeX -> "m^2_{d5p}", 
     OutputName -> md5p2}}, 

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

{ml52,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSM5, 30}, 
     LaTeX -> "m^2_{l5}", 
     OutputName -> ml52}}, 

{ml5p2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSM5, 32}, 
     LaTeX -> "m^2_{l5p}", 
     OutputName -> ml5p2}}, 

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

{MS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 14}, 
     LaTeX -> "M_S", 
     OutputName -> ms}}, 

{ms2,{ 
     Description -> "Softbreaking Singlet Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {NMSSMRUN, 10}, 
     LaTeX -> "m_S^2", 
     OutputName -> ms2}}, 

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

{MVD,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 2}, 
     LaTeX -> "M_D", 
     OutputName -> mvd}}, 

{MVL,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 6}, 
     LaTeX -> "{M}_L", 
     OutputName -> mvl}}, 

{PhaseD,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 65}, 
     LaTeX -> "\\phi_D", 
     OutputName -> phiD}}, 

{PhaseE,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 66}, 
     LaTeX -> "\\phi_E", 
     OutputName -> phiE}}, 

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

{PhaseV,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 67}, 
     LaTeX -> "\\phi_V", 
     OutputName -> phiV}}, 

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> ArcSin[Sqrt[1 - Mass[VWm]^2/Mass[VZ]^2]], 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[1, 1]]], 
     Real -> True, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 

{tS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 2}, 
     LaTeX -> "t_S", 
     OutputName -> ts}}, 

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
     LesHouches -> {NMSSMRUN, 5}, 
     LaTeX -> "v_s", 
     OutputName -> vS}}, 

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

{ZA,{ 
     Description -> "Pseudo-Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> NMAMIX, 
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

{ZDp,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZDP, 
     LaTeX -> "{Z^{D'}}", 
     OutputName -> ZDP}}, 

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

{ZEp,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZEP, 
     LaTeX -> "Z^{E'}", 
     OutputName -> zep}}, 

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
     LesHouches -> NMHMIX, 
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
     DependenceOptional -> None, 
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

{ZV,{ 
     Description -> "Sneutrino Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> SNUMIX, 
     LaTeX -> "Z^V", 
     OutputName -> ZV}}, 

{ZVp,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZVP, 
     LaTeX -> "Z^{V'}", 
     OutputName -> zvp}}, 

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
     Description -> "Photon-Z Mixing Matrix", 
     Dependence -> {{Cos[ThetaW], -Sin[ThetaW]}, {Sin[ThetaW], Cos[ThetaW]}}, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Z^{\\gamma Z}", 
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

{\[Mu],{ 
     Description -> "Mu-parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {HMIX, 1}, 
     LaTeX -> "\\mu", 
     OutputName -> Mu}}, 

{B[MS],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 16}, 
     LaTeX -> "B_{S}", 
     OutputName -> Bms}}, 

{B[MVD],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 4}, 
     LaTeX -> "B_{D}", 
     OutputName -> Bmvd}}, 

{B[MVL],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 8}, 
     LaTeX -> "B_{L}", 
     OutputName -> Bmvl}}, 

{B[\[Mu]],{ 
     Description -> "Bmu-parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {HMIX, 101}, 
     LaTeX -> "B_{\\mu}", 
     OutputName -> Bmu}}, 

{L[tS],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 4}, 
     LaTeX -> "L_{t_S}", 
     OutputName -> Lts}}, 

{T[kappa],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 44}, 
     LaTeX -> "T_{\\kappa}", 
     OutputName -> Tkap}}, 

{T[lambda],{
     Description -> "Softbreaking Singlet-Higgs-Interaction",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 36}, 
     LaTeX -> "T_{\\lambda}", 
     OutputName -> Tlam}}, 

{T[lD5],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 20}, 
     LaTeX -> "T_D", 
     OutputName -> Tld5}}, 

{T[lL5],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 24}, 
     LaTeX -> "T_L", 
     OutputName -> Tll5}}, 

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



{MVE,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_E"  (* auto generated LaTeX name *), 
     OutputName -> mve  (* auto generated Output name *)}}, 

{B[MVE],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "B_{E}"  (* auto generated LaTeX name *), 
     OutputName -> Bmve  (* auto generated Output name *)}}, 

{MVQ,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_Q"  (* auto generated LaTeX name *), 
     OutputName -> mvq  (* auto generated Output name *)}}, 

{B[MVQ],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "B_{Q}"  (* auto generated LaTeX name *), 
     OutputName -> Bmvq  (* auto generated Output name *)}}, 

{MVU,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_U"  (* auto generated LaTeX name *), 
     OutputName -> mvu  (* auto generated Output name *)}}, 

{B[MVU],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "B_{U}"  (* auto generated LaTeX name *), 
     OutputName -> Bmvu  (* auto generated Output name *)}}, 

{YEp,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y^{\\prime}_E"  (* auto generated LaTeX name *), 
     OutputName -> yep  (* auto generated Output name *)}}, 

{T[YEp],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "T^{\\prime}_{E}"  (* auto generated LaTeX name *), 
     OutputName -> Tyep  (* auto generated Output name *)}}, 

{YEpp,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y_E^{\\prime\\prime}"  (* auto generated LaTeX name *), 
     OutputName -> yepp  (* auto generated Output name *)}}, 

{T[YEpp],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "T_{E}^{\\prime\\prime}"  (* auto generated LaTeX name *), 
     OutputName -> Tyepp  (* auto generated Output name *)}}, 

{YDp,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,22}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y^{\\prime}_D"  (* auto generated LaTeX name *), 
     OutputName -> ydp  (* auto generated Output name *)}}, 

{T[YDp],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,24}  (* auto generated Les Houches entry *), 
     LaTeX -> "T^{\\prime}_{D}"  (* auto generated LaTeX name *), 
     OutputName -> Tydp  (* auto generated Output name *)}}, 

{YUp,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,26}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y^{\\prime}_U"  (* auto generated LaTeX name *), 
     OutputName -> yup  (* auto generated Output name *)}}, 

{T[YUp],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,28}  (* auto generated Les Houches entry *), 
     LaTeX -> "T^{\\prime}_{U}"  (* auto generated LaTeX name *), 
     OutputName -> Tyup  (* auto generated Output name *)}}, 

{YDpp,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,30}  (* auto generated Les Houches entry *), 
     LaTeX -> "{Y_D}^{\\prime\\prime}"  (* auto generated LaTeX name *), 
     OutputName -> ydpp  (* auto generated Output name *)}}, 

{T[YDpp],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,32}  (* auto generated Les Houches entry *), 
     LaTeX -> "T_{D}^{\\prime\\prime}"  (* auto generated LaTeX name *), 
     OutputName -> Tydpp  (* auto generated Output name *)}}, 

{YUpp,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,34}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y_U^{\\prime\\prime}"  (* auto generated LaTeX name *), 
     OutputName -> yupp  (* auto generated Output name *)}}, 

{T[YUpp],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,36}  (* auto generated Les Houches entry *), 
     LaTeX -> "T_{U}^{\\prime\\prime}"  (* auto generated LaTeX name *), 
     OutputName -> Tyupp  (* auto generated Output name *)}}, 

{lE10,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,38}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_E"  (* auto generated LaTeX name *), 
     OutputName -> le10  (* auto generated Output name *)}}, 

{T[lE10],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,40}  (* auto generated Les Houches entry *), 
     LaTeX -> "T_{\\lambda_E}"  (* auto generated LaTeX name *), 
     OutputName -> Tle10  (* auto generated Output name *)}}, 

{lQ10,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,42}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_Q"  (* auto generated LaTeX name *), 
     OutputName -> lq10  (* auto generated Output name *)}}, 

{T[lQ10],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,44}  (* auto generated Les Houches entry *), 
     LaTeX -> "T_{\\lambda+Q}"  (* auto generated LaTeX name *), 
     OutputName -> Tlq10  (* auto generated Output name *)}}, 

{lU10,{ 
     Real -> False, 
     LesHouches -> {NMSSM15,46}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_U"  (* auto generated LaTeX name *), 
     OutputName -> lu10  (* auto generated Output name *)}}, 

{T[lU10],{ 
     Real -> False, 
     LesHouches -> {NMSSM15,48}  (* auto generated Les Houches entry *), 
     LaTeX -> "T_{\\lambda_U}"  (* auto generated LaTeX name *), 
     OutputName -> Tlu10  (* auto generated Output name *)}}, 

{mu102,{ 
     Real -> True, 
     LesHouches -> {NMSSM15,50}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{u10}"  (* auto generated LaTeX name *), 
     OutputName -> mu102  (* auto generated Output name *)}}, 

{mu10p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM15,52}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{u10p}"  (* auto generated LaTeX name *), 
     OutputName -> mu10p2  (* auto generated Output name *)}}, 

{mq102,{ 
     Real -> True, 
     LesHouches -> {NMSSM15,54}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{q10}"  (* auto generated LaTeX name *), 
     OutputName -> mq102  (* auto generated Output name *)}}, 

{mq10p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM15,56}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{q10p}"  (* auto generated LaTeX name *), 
     OutputName -> mq10p2  (* auto generated Output name *)}}, 

{me102,{ 
     Real -> True, 
     LesHouches -> {NMSSM15,58}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{e10}"  (* auto generated LaTeX name *), 
     OutputName -> me102  (* auto generated Output name *)}}, 

{me10p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM15,60}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{e10p}"  (* auto generated LaTeX name *), 
     OutputName -> me10p2  (* auto generated Output name *)}}, 

{ZUp,{ 
     Real -> False, 
     LesHouches -> ZUP  (* auto generated Les Houches entry *), 
     LaTeX -> "Z^{U'}"  (* auto generated LaTeX name *), 
     OutputName -> zup  (* auto generated Output name *)}}, 

{ZULp,{ 
     Real -> False, 
     LesHouches -> ZULP  (* auto generated Les Houches entry *), 
     LaTeX -> "Z_U^{L'}"  (* auto generated LaTeX name *), 
     OutputName -> zulp  (* auto generated Output name *)}}, 

{ZURp,{ 
     Real -> False, 
     LesHouches -> ZURP  (* auto generated Les Houches entry *), 
     LaTeX -> "Z_U^{R'}"  (* auto generated LaTeX name *), 
     OutputName -> zurp  (* auto generated Output name *)}}, 

{ZELp,{ 
     Real -> False, 
     LesHouches -> ZELP  (* auto generated Les Houches entry *), 
     LaTeX -> "Z_E^{L'}"  (* auto generated LaTeX name *), 
     OutputName -> zelp  (* auto generated Output name *)}}, 

{ZERp,{ 
     Real -> False, 
     LesHouches -> ZERP  (* auto generated Les Houches entry *), 
     LaTeX -> "Z_E^{R'}"  (* auto generated LaTeX name *), 
     OutputName -> zerp  (* auto generated Output name *)}}, 

{ZDLp,{ 
     Real -> False, 
     LaTeX -> "Z_D^{L'}"  (* auto generated Les Houches entry *), 
     LesHouches -> ZDLP  (* auto generated LaTeX name *), 
     OutputName -> zdlp  (* auto generated Output name *)}}, 

{ZDRp,{ 
     Real -> False, 
     LaTeX -> "Z_D^{R'}"  (* auto generated Les Houches entry *), 
     LesHouches -> ZDRP  (* auto generated LaTeX name *), 
     OutputName -> zdrp  (* auto generated Output name *)}}
} 
