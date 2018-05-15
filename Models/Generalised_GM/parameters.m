(* SARAH generated template for parameters.m file for GM*)
(* File created at 9:27 on 7.3.2018  *) 
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

{Lambda1,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {GM, 14}, 
     LaTeX -> "{\\lambda}_{1}", 
     OutputName -> lam1}}, 

{mu2,{ 
     Description -> "SM Mu Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {HMIX, 2}, 
     LaTeX -> "\\mu", 
     OutputName -> Mu}}, 

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]], 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[1, 1]]], 
     Real -> True, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 

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

{vDoub,{ 
     Description -> "EW-VEV", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[Mass[VWp]^2/g2^2], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 3}, 
     LaTeX -> "v", 
     OutputName -> vDoub}}, 

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

{vEta,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GM, 34}, 
     LaTeX -> "{v}_{\\eta}", 
     OutputName -> veta}}, 

{vPhi,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GM, 36}, 
     LaTeX -> "{v}_{\\Phi}", 
     OutputName -> vphi}}, 

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
     DependenceNum -> {{(Sqrt[2]*Mass[Fd, 1])/vDoub, 0, 0}, {0, (Sqrt[2]*Mass[Fd, 2])/vDoub, 0}, {0, 0, (Sqrt[2]*Mass[Fd, 3])/vDoub}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yd, 
     LaTeX -> "Y_d", 
     OutputName -> Yd}}, 

{Ye,{ 
     Description -> "Lepton-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fe, 1])/vDoub, 0, 0}, {0, (Sqrt[2]*Mass[Fe, 2])/vDoub, 0}, {0, 0, (Sqrt[2]*Mass[Fe, 3])/vDoub}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Ye, 
     LaTeX -> "Y_e", 
     OutputName -> Ye}}, 

{Yu,{ 
     Description -> "Up-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fu, 1])/vDoub, 0, 0}, {0, (Sqrt[2]*Mass[Fu, 2])/vDoub, 0}, {0, 0, (Sqrt[2]*Mass[Fu, 3])/vDoub}}, 
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
     DependenceOptional -> {{-Cos[\[Beta]], Sin[\[Beta]]}, {Sin[\[Beta]], Cos[\[Beta]]}}, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZA, 
     LaTeX -> "ZA", 
     OutputName -> za}}, 

{ZH,{ 
     Description -> "Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> ZH, 
     LaTeX -> "Z^H", 
     OutputName -> ZH}}, 

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

{ZW,{ 
     Description -> "W Mixing Matrix", 
     Dependence -> {{1/Sqrt[2], 1/Sqrt[2]}, {I/Sqrt[2], (-I)/Sqrt[2]}}, 
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



(*  ----------- Additional parameters in the model ---------- *) 

{sig4,{ 
     Real -> False, 
     LesHouches -> {GM,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "sig4"  (* auto generated LaTeX name *), 
     OutputName -> sig4  (* auto generated Output name *)}}, 

{mE2,{ 
     Real -> False, 
     LesHouches -> {GM,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{E}"  (* auto generated LaTeX name *), 
     OutputName -> me2  (* auto generated Output name *)}}, 

{mH2,{ 
     Real -> False, 
     LesHouches -> {GM,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{H}"  (* auto generated LaTeX name *), 
     OutputName -> mh2  (* auto generated Output name *)}}, 

{mX2,{ 
     Real -> False, 
     LesHouches -> {GM,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{X}"  (* auto generated LaTeX name *), 
     OutputName -> mx2  (* auto generated Output name *)}}, 

{mu1,{ 
     Real -> False, 
     LesHouches -> {GM,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\mu}_{1}"  (* auto generated LaTeX name *), 
     OutputName -> mu1  (* auto generated Output name *)}}, 

{mu3,{ 
     Real -> False, 
     LesHouches -> {GM,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\mu}_{3}"  (* auto generated LaTeX name *), 
     OutputName -> mu3  (* auto generated Output name *)}}, 

{rho3,{ 
     Real -> False, 
     LesHouches -> {GM,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_{3}"  (* auto generated LaTeX name *), 
     OutputName -> rh3  (* auto generated Output name *)}}, 

{sig3,{ 
     Real -> False, 
     LesHouches -> {GM,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "sig3"  (* auto generated LaTeX name *), 
     OutputName -> sig3  (* auto generated Output name *)}}, 

{sig2,{ 
     Real -> False, 
     LesHouches -> {GM,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "sig2"  (* auto generated LaTeX name *), 
     OutputName -> sig2  (* auto generated Output name *)}}, 

{rho5,{ 
     Real -> False, 
     LesHouches -> {GM,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_{5}"  (* auto generated LaTeX name *), 
     OutputName -> rh5  (* auto generated Output name *)}}, 

{rho4,{ 
     Real -> False, 
     LesHouches -> {GM,22}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_{4}"  (* auto generated LaTeX name *), 
     OutputName -> rh4  (* auto generated Output name *)}}, 

{sig1,{ 
     Real -> False, 
     LesHouches -> {GM,24}  (* auto generated Les Houches entry *), 
     LaTeX -> "sig1"  (* auto generated LaTeX name *), 
     OutputName -> sig1  (* auto generated Output name *)}}, 

{rho2,{ 
     Real -> False, 
     LesHouches -> {GM,26}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_{2}"  (* auto generated LaTeX name *), 
     OutputName -> rh2  (* auto generated Output name *)}}, 

{rho1,{ 
     Real -> False, 
     LesHouches -> {GM,28}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_{1}"  (* auto generated LaTeX name *), 
     OutputName -> rh1  (* auto generated Output name *)}}, 

{\[Beta],{ 
     Real -> False, 
     LesHouches -> {GM,30}  (* auto generated Les Houches entry *), 
     LaTeX -> "{B}_{\\eta}"  (* auto generated LaTeX name *), 
     OutputName -> bet  (* auto generated Output name *)}}, 

{Mass[VWp],{ 
     Real -> False, 
     LesHouches -> {GM,32}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{VWp}"  (* auto generated LaTeX name *), 
     OutputName -> Mvwp  (* auto generated Output name *)}} 
} 
