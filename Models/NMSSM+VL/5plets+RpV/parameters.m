(* SARAH generated template for parameters.m file for NMSSM5*)
(* File created at 17:04 on 14.1.2016  *) 
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

{PhaseD,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {NMSSM5, 65}, 
     LaTeX -> "\\phi_D", 
     OutputName -> phiD}}, 

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



(*  ----------- Additional parameters in the model ---------- *) 

{MVD,{ 
     Real -> False, 
     LesHouches -> {NMSSM5,2} , 
     LaTeX -> "M_D"  (* auto generated LaTeX name *), 
     OutputName -> mvd  (* auto generated Output name *)}}, 

{B[MVD],{ 
     Real -> False, 
     LesHouches -> {NMSSM5,4} , 
     LaTeX -> "B_{D}"  (* auto generated LaTeX name *), 
     OutputName -> Bmvd  (* auto generated Output name *)}}, 

{MVL,{ 
     Real -> False, 
     LesHouches -> {NMSSM5,6} , 
     LaTeX -> "{M}_L"  (* auto generated LaTeX name *), 
     OutputName -> mvl  (* auto generated Output name *)}}, 

{B[MVL],{ 
     Real -> False, 
     LesHouches -> {NMSSM5,8} , 
     LaTeX -> "B_{L}"  (* auto generated LaTeX name *), 
     OutputName -> Bmvl  (* auto generated Output name *)}}, 

{kap5,{ 
     Real -> False, 
     LesHouches -> {NMSSM5,10} , 
     LaTeX -> "\\kappa_5"  (* auto generated LaTeX name *), 
     OutputName -> kap5  (* auto generated Output name *)}}, 

{T[kap5],{ 
     Real -> False, 
     LesHouches -> {NMSSM5,12} , 
     LaTeX -> "T_{\\kappa_5}"  (* auto generated LaTeX name *), 
     OutputName -> Tkap5  (* auto generated Output name *)}}, 

{kap5p,{ 
     Real -> False, 
     LesHouches -> {NMSSM5,14} , 
     LaTeX -> "\\kappa_{5'}"  (* auto generated LaTeX name *), 
     OutputName -> kap5p  (* auto generated Output name *)}}, 

{T[kap5p],{ 
     Real -> False, 
     LesHouches -> {NMSSM5,16} , 
     LaTeX -> "T_{\\kappa_{5'}}"  (* auto generated LaTeX name *), 
     OutputName -> Tkap5p  (* auto generated Output name *)}}, 

{lD5,{ 
     Real -> False, 
     LesHouches -> {NMSSM5,18} , 
     LaTeX -> "\\lambda_D"  (* auto generated LaTeX name *), 
     OutputName -> ld5  (* auto generated Output name *)}}, 

{T[lD5],{ 
     Real -> False, 
     LesHouches -> {NMSSM5,20} , 
     LaTeX -> "T_D"  (* auto generated LaTeX name *), 
     OutputName -> Tld5  (* auto generated Output name *)}}, 

{lL5,{ 
     Real -> False, 
     LesHouches -> {NMSSM5,22} , 
     LaTeX -> "\\lambda_L"  (* auto generated LaTeX name *), 
     OutputName -> ll5  (* auto generated Output name *)}}, 

{T[lL5],{ 
     Real -> False, 
     LesHouches -> {NMSSM5,24} , 
     LaTeX -> "T_L"  (* auto generated LaTeX name *), 
     OutputName -> Tll5  (* auto generated Output name *)}}, 

{md52,{ 
     Real -> True, 
     LesHouches -> {NMSSM5,26} , 
     LaTeX -> "m^2_{d5}"  (* auto generated LaTeX name *), 
     OutputName -> md52  (* auto generated Output name *)}}, 

{md5p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM5,28} , 
     LaTeX -> "m^2_{d5p}"  (* auto generated LaTeX name *), 
     OutputName -> md5p2  (* auto generated Output name *)}}, 

{ml52,{ 
     Real -> True, 
     LesHouches -> {NMSSM5,30} , 
     LaTeX -> "m^2_{l5}"  (* auto generated LaTeX name *), 
     OutputName -> ml52  (* auto generated Output name *)}}, 

{ml5p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM5,32} , 
     LaTeX -> "m^2_{l5p}"  (* auto generated LaTeX name *), 
     OutputName -> ml5p2  (* auto generated Output name *)}}, 

{v5,{ 
     Real -> True , 
     LesHouches -> {NMSSM5,34} , 
     LaTeX -> "v_{5}"  (* auto generated LaTeX name *), 
     OutputName -> v5  (* auto generated Output name *)}}, 

{v5p,{ 
     Real -> True , 
     LesHouches -> {NMSSM5,36} , 
     LaTeX -> "v_{5'}"  (* auto generated LaTeX name *), 
     OutputName -> v5p  (* auto generated Output name *)}}
} 
