(* SARAH generated template for parameters.m file for VLTQ*)
(* File created at 16:00 on 18.1.2016  *) 
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

{mu2,{ 
     Description -> "SM Mu Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {SM, 1}, 
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

{v,{ 
     Description -> "EW-VEV", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[Mass[VWp]^2/g2^2], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 3}, 
     LaTeX -> "v", 
     OutputName -> v}}, 

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
     DependenceNum -> {{(Sqrt[2]*Mass[Fd, 1])/v, 0, 0}, {0, (Sqrt[2]*Mass[Fd, 2])/v, 0}, {0, 0, (Sqrt[2]*Mass[Fd, 3])/v}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yd, 
     LaTeX -> "Y_d", 
     OutputName -> Yd}}, 

{Ye,{ 
     Description -> "Lepton-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fe, 1])/v, 0, 0}, {0, (Sqrt[2]*Mass[Fe, 2])/v, 0}, {0, 0, (Sqrt[2]*Mass[Fe, 3])/v}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Ye, 
     LaTeX -> "Y_e", 
     OutputName -> Ye}}, 

{Yu,{ 
     Description -> "Up-Yukawa-Coupling", 
     Dependence -> None, 
     DependenceNum -> {{(Sqrt[2]*Mass[Fu, 1])/v, 0, 0}, {0, (Sqrt[2]*Mass[Fu, 2])/v, 0}, {0, 0, (Sqrt[2]*Mass[Fu, 3])/v}}, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> Yu, 
     LaTeX -> "Y_u", 
     OutputName -> Yu}}, 

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

{yy1,{ 
     Real -> False, 
     LesHouches -> {VLTQ,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "yy_1"  (* auto generated LaTeX name *), 
     OutputName -> yy1  (* auto generated Output name *)}}, 

{yy2,{ 
     Real -> False, 
     LesHouches -> {VLTQ,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "yy_2"  (* auto generated LaTeX name *), 
     OutputName -> yy2  (* auto generated Output name *)}}, 

{y1,{ 
     Real -> False, 
     LesHouches -> Y1  (* auto generated Les Houches entry *), 
     LaTeX -> "Y_{1}"  (* auto generated LaTeX name *), 
     OutputName -> y1  (* auto generated Output name *)}}, 

{y2,{ 
     Real -> False, 
     LesHouches -> Y2  (* auto generated Les Houches entry *), 
     LaTeX -> "Y_{2}"  (* auto generated LaTeX name *), 
     OutputName -> y2  (* auto generated Output name *)}}, 

{M1,{ 
     Real -> False, 
     LesHouches -> {VLTQ,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_1"  (* auto generated LaTeX name *), 
     OutputName -> m1  (* auto generated Output name *)}}, 

{M2,{ 
     Real -> False, 
     LesHouches -> {VLTQ,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_2"  (* auto generated LaTeX name *), 
     OutputName -> m2  (* auto generated Output name *)}}, 

{mS2,{ 
     Real -> False, 
     LesHouches -> {VLTQ,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{S}"  (* auto generated LaTeX name *), 
     OutputName -> ms2  (* auto generated Output name *)}}, 

{Lambda2,{ 
     Real -> False, 
     LesHouches -> {VLTQ,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{2}"  (* auto generated LaTeX name *), 
     OutputName -> lam2  (* auto generated Output name *)}}, 

{Lambda3,{ 
     Real -> False, 
     LesHouches -> {VLTQ,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{3}"  (* auto generated LaTeX name *), 
     OutputName -> lam3  (* auto generated Output name *)}}, 

{Lambda1,{ 
     Real -> False, 
     LesHouches -> {VLTQ,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{1}"  (* auto generated LaTeX name *), 
     OutputName -> lam1  (* auto generated Output name *)}}, 

{PhaseX,{ 
     Real -> False, 
     LesHouches -> {VLTQ,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "\\phi_X"  (* auto generated LaTeX name *), 
     OutputName -> phasex  (* auto generated Output name *)}}, 

{PhaseY,{ 
     Real -> False, 
     LesHouches -> {VLTQ,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "\\phi_Y"  (* auto generated LaTeX name *), 
     OutputName -> phasey  (* auto generated Output name *)}}, 

(*
{Mass[VWp],{ 
     Real -> False, 
     LesHouches -> {VLTQ,22}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{VWp}"  (* auto generated LaTeX name *), 
     OutputName -> Mvwp  (* auto generated Output name *)}},
*)

{MFX,{ 
     Real -> True, 
     LesHouches -> {VLTQ,23}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{FX}"  (* auto generated LaTeX name *), 
     OutputName -> MFX  (* auto generated Output name *)}},

{MFY,{ 
     Real -> True,
     LesHouches -> {VLTQ,24}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{FY}"  (* auto generated LaTeX name *), 
     OutputName -> MFY  (* auto generated Output name *)}},

{Mss,{ 
     Real -> True,
     LesHouches -> {VLTQ,25}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{ss}"  (* auto generated LaTeX name *), 
     OutputName -> Mss  (* auto generated Output name *)}},

 {ZH,{ 
     Description->"Scalar-Mixing-Matrix",
     DependenceOptional -> None,
     Real -> False, 
     LesHouches -> ZH  (* auto generated Les Houches entry *), 
     LaTeX -> "Z_H"  (* auto generated LaTeX name *), 
     OutputName -> zh  (* auto generated Output name *)}} 

} 
