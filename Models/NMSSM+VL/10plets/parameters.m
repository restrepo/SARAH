(* SARAH generated template for parameters.m file for NMSSM10*)
(* File created at 16:00 on 14.1.2016  *) 


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

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> ArcSin[Sqrt[1 - Mass[VWm]^2/Mass[VZ]^2]], 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[1, 1]]], 
     Real -> True, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 

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
     LaTeX -> "{Z^{E'}}", 
     OutputName -> ZeP}}, 

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

{ZUp,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZUP, 
     LaTeX -> "{Z^{U'}}", 
     OutputName -> ZUP}}, 

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
     
{ZURp,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZURP, 
     LaTeX -> "{Z_R^{U'}}", 
     OutputName -> URp}},      

{ZULp,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZULP, 
     LaTeX -> "{Z_L^{U'}}", 
     OutputName -> ULp}},      

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



{tS,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,2} , 
     LaTeX -> "t_S"  , 
     OutputName -> ts  }}, 

{L[tS],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,4} , 
     LaTeX -> "L_{t_S}"  , 
     OutputName -> Lts  }}, 

{MVE,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,6} , 
     LaTeX -> "M_E"  , 
     OutputName -> mve  }}, 

{B[MVE],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,8} , 
     LaTeX -> "B_{E}"  , 
     OutputName -> Bmve  }}, 

{MVQ,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,10} , 
     LaTeX -> "M_Q"  , 
     OutputName -> mvq  }}, 

{B[MVQ],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,12} , 
     LaTeX -> "B_{Q}"  , 
     OutputName -> Bmvq  }}, 

{MS,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,14} , 
     LaTeX -> "M_S"  , 
     OutputName -> ms  }}, 

{B[MS],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,16} , 
     LaTeX -> "B_{S}"  , 
     OutputName -> Bms  }}, 

{MVU,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,18} , 
     LaTeX -> "M_U"  , 
     OutputName -> mvu  }}, 

{B[MVU],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,20} , 
     LaTeX -> "B_{U}"  , 
     OutputName -> Bmvu  }}, 

{Y10,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,22} , 
     LaTeX -> "{Y_{10}}"  , 
     OutputName -> y10  }}, 

{T[Y10],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,24} , 
     LaTeX -> "T_{10}"  , 
     OutputName -> Ty10  }}, 

{Y10p,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,26} , 
     LaTeX -> "Y_{10'}"  , 
     OutputName -> y10p  }}, 

{T[Y10p],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,28} , 
     LaTeX -> "T_{10'}"  , 
     OutputName -> Ty10p  }}, 

{lE10,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,30} , 
     LaTeX -> "{\\lambda_E}"  , 
     OutputName -> le10  }}, 

{T[lE10],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,32} , 
     LaTeX -> "T_{\\lambda_E}"  , 
     OutputName -> Tle10  }}, 

{lambda,{
     Description -> "Singlet-Higgs-Interaction",
     Real -> False, 
     LesHouches -> {NMSSM10,34} , 
     LaTeX -> "\\lambda"  , 
     OutputName -> lam  }}, 

{T[lambda],{
     Description -> "Softbreaking Singlet-Higgs-Interaction",
     Real -> False, 
     LesHouches -> {NMSSM10,36} , 
     LaTeX -> "T_{\\lambda}"  , 
     OutputName -> Tlam  }}, 

{lQ10,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,38} , 
     LaTeX -> "\\lambda_Q"  , 
     OutputName -> lq10  }}, 

{T[lQ10],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,40} , 
     LaTeX -> "T_{\\lambda_Q}"  , 
     OutputName -> Tlq10  }}, 

{kappa,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,42} , 
     LaTeX -> "\\kappa"  , 
     OutputName -> kap  }}, 

{T[kappa],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,44} , 
     LaTeX -> "T_{\\kappa}"  , 
     OutputName -> Tkap  }}, 

{lU10,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,46} , 
     LaTeX -> "\\lambda_U"  , 
     OutputName -> lu10  }}, 

{T[lU10],{ 
     Real -> False, 
     LesHouches -> {NMSSM10,48} , 
     LaTeX -> "T_{\\lambda_U}"  , 
     OutputName -> Tlu10  }}, 

{mu102,{ 
     Real -> True, 
     LesHouches -> {NMSSM10,50} , 
     LaTeX -> "m^2_{{u10}}"  , 
     OutputName -> mu102  }}, 

{mu10p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM10,52} , 
     LaTeX -> "m^2_{u10'}"  , 
     OutputName -> mu10p2  }}, 

{mq102,{ 
     Real -> True, 
     LesHouches -> {NMSSM10,54} , 
     LaTeX -> "m^2_{{q10}}"  , 
     OutputName -> mq102  }}, 

{mq10p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM10,56} , 
     LaTeX -> "m^2_{q10p}"  , 
     OutputName -> mq10p2  }}, 

{me102,{ 
     Real -> True, 
     LesHouches -> {NMSSM10,58} , 
     LaTeX -> "m^2_{e10}"  , 
     OutputName -> me102  }}, 

{me10p2,{ 
     Real -> True, 
     LesHouches -> {NMSSM10,60} , 
     LaTeX -> "m^2_{e10p}"  , 
     OutputName -> me10p2  }}, 

{PhaseGlu,  { Description -> "Gluino-Phase" }}, 

{PhaseE,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,64} , 
     LaTeX -> "\\phi_E"  , 
     OutputName -> phiE  }},
     
{PhaseD,{ 
     Real -> False, 
     LesHouches -> {NMSSM10,65} , 
     LaTeX -> "\\phi_D"  , 
     OutputName -> phiD  }}
} 
