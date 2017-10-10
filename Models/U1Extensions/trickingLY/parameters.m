(* SARAH generated template for parameters.m file for trickingLY*)
(* File created at 14:49 on 21.1.2016  *) 
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

{eta1,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ETA1, 
     LaTeX -> "\\eta_{1}", 
     OutputName -> ETA1}}, 

{eta2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ETA2, 
     LaTeX -> "\\eta_{2}", 
     OutputName -> ETA2}}, 

{eta3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ETA3, 
     LaTeX -> "\\eta_{3}", 
     OutputName -> ETA3}}, 

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
     Description -> "Mixed Gauge Coupling 2", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 10}, 
     LaTeX -> "g_{Y X}", 
     OutputName -> gYX}}, 

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
     Description -> "chargeX-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 4}, 
     LaTeX -> "g_{X}", 
     OutputName -> gX}}, 

{gX1,{ 
     Description -> "Mixed Gauge Coupling 1", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {gauge, 11}, 
     LaTeX -> "g_{X Y}", 
     OutputName -> gXY}}, 

{lamH,{ 
     Description -> "SM Higgs Selfcouplings", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {tricking, 1}, 
     LaTeX -> "\\lambda_H", 
     OutputName -> lamH}}, 

{lamHS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {tricking, 3}, 
     LaTeX -> "\\lambda_{HS}", 
     OutputName -> lamHS}}, 

{lamS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {tricking, 2}, 
     LaTeX -> "\\lambda_{S}", 
     OutputName -> lamS}}, 

{muH2,{ 
     Description -> "SM Mu Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {tricking, 25}, 
     LaTeX -> "\\mu_{H}^2", 
     OutputName -> muH2}}, 

{muS2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {tricking, 26}, 
     LaTeX -> "\\mu_{S}^2", 
     OutputName -> muS2}}, 

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

{U1R,{ 
     Description -> "Right-exotics-1-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> U1R, 
     LaTeX -> "{U1}_R"  (* auto generated LaTeX name *), 
     OutputName -> U1R}}, 

{U2R,{ 
     Description -> "Right-exotics-2-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> U2R, 
     LaTeX -> "{U2}_R"  (* auto generated LaTeX name *), 
     OutputName -> U2R}}, 
     
     
{U3R,{ 
     Description -> "Right-exotics-3-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> U3R, 
     LaTeX -> "{U3}_R"  (* auto generated LaTeX name *), 
     OutputName -> U3R}}, 

{U4R,{ 
     Description -> "Right-exotics-4-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> U4R, 
     LaTeX -> "{U4}_R"  (* auto generated LaTeX name *), 
     OutputName -> U4R}},      
     
     

{Ud,{ 
     Description -> "Right-Down-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UDRMIX, 
     LaTeX -> "U^d_R", 
     OutputName -> ZDR}}, 

{Ue,{ 
     Description -> "Right-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UERMIX, 
     LaTeX -> "U^e_R", 
     OutputName -> ZER}}, 

{Uu,{ 
     Description -> "Right-Up-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UURMIX, 
     LaTeX -> "U^u_R", 
     OutputName -> ZUR}}, 

{V1L,{ 
     Description -> "Left-exotics-1-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> V1L, 
     LaTeX -> "{V1}_L"  (* auto generated LaTeX name *), 
     OutputName -> V1L}}, 

{V2L,{ 
     Description -> "Left-exotics-2-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> V2L, 
     LaTeX -> "{V2}_L"  (* auto generated LaTeX name *), 
     OutputName -> V2L}}, 

{V3L,{ 
     Description -> "Left-exotics-3-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> V3L, 
     LaTeX -> "{V3}_L"  (* auto generated LaTeX name *), 
     OutputName -> V3L}}, 

{V4L,{ 
     Description -> "Left-exotics-4-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> V4L, 
     LaTeX -> "{V4}_L"  (* auto generated LaTeX name *), 
     OutputName -> V4L}},      
     
{Vd,{ 
     Description -> "Left-Down-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UDLMIX, 
     LaTeX -> "U^d_L", 
     OutputName -> ZDL}}, 

{Ve,{ 
     Description -> "Left-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UELMIX, 
     LaTeX -> "U^e_L", 
     OutputName -> ZEL}}, 

{vH,{ 
     Description -> "EW-VEV", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[Mass[VWm]^2/g2^2], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 3}, 
     LaTeX -> "v", 
     OutputName -> v}}, 

{vS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {tricking, 30}, 
     LaTeX -> "vS", 
     OutputName -> vS}}, 

{Vu,{ 
     Description -> "Left-Up-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UULMIX, 
     LaTeX -> "U^u_L", 
     OutputName -> ZUL}}, 

{Yd,{ 
     Description -> "Down-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fd, 1])/vH, 0, 0}, {0, (Sqrt[2]*Mass[Fd, 2])/vH, 0}, {0, 0, (Sqrt[2]*Mass[Fd, 3])/vH}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yd, 
     LaTeX -> "Y_d", 
     OutputName -> Yd}}, 

{Ye,{ 
     Description -> "Lepton-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fe, 1])/vH, 0, 0}, {0, (Sqrt[2]*Mass[Fe, 2])/vH, 0}, {0, 0, (Sqrt[2]*Mass[Fe, 3])/vH}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Ye, 
     LaTeX -> "Y_e", 
     OutputName -> Ye}}, 

{Yu,{ 
     Description -> "Up-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fu, 1])/vH, 0, 0}, {0, (Sqrt[2]*Mass[Fu, 2])/vH, 0}, {0, 0, (Sqrt[2]*Mass[Fu, 3])/vH}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yu, 
     LaTeX -> "Y_u", 
     OutputName -> Yu}}, 

{Yv,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YV, 
     LaTeX -> "Y_{v}", 
     OutputName -> YV}}, 

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

{ZNL,{ 
     Description -> "Left-Dirac-Neutrino-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZNL, 
     LaTeX -> "{ZN}_L"  (* auto generated LaTeX name *), 
     OutputName -> ZNL}}, 

{ZNR,{ 
     Description -> "Right-Dirac-Neutrino-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZNR, 
     LaTeX -> "{ZN}_R"  (* auto generated LaTeX name *), 
     OutputName -> ZNR}}, 

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



(*  ----------- Additional parameters in the model ---------- *) 

{Y1,{ 
     Real -> True, 
     LesHouches -> {TRICKINGLY,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y1"  (* auto generated LaTeX name *), 
     OutputName -> y1  (* auto generated Output name *)}}, 

{Q1,{ 
     Real -> True, 
     LesHouches -> {TRICKINGLY,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "Q1"  (* auto generated LaTeX name *), 
     OutputName -> q1  (* auto generated Output name *)}}, 

{U1QX,{ 
     Real -> True, 
     LesHouches -> {TRICKINGLY,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "U1QX"  (* auto generated LaTeX name *), 
     OutputName -> U1QX  (* auto generated Output name *)}}, 

{Y2,{ 
     Real -> True, 
     LesHouches -> {TRICKINGLY,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y2"  (* auto generated LaTeX name *), 
     OutputName -> y2  (* auto generated Output name *)}}, 

{Y3,{ 
     Real -> True, 
     LesHouches -> {TRICKINGLY,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "Y3"  (* auto generated LaTeX name *), 
     OutputName -> y3  (* auto generated Output name *)}}, 

{Mass[VWm],{ 
     Real -> False, 
     LesHouches -> {TRICKINGLY,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{VWm}"  (* auto generated LaTeX name *), 
     OutputName -> Mvwm  (* auto generated Output name *)}} 
} 
