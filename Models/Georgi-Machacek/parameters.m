(* SARAH generated template for parameters.m file for GM*)
(* File created at 13:25 on 20.1.2016  *) 
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



{M2,{ 
     Real -> False, 
     LesHouches -> {GM,2} , 
     LaTeX -> "M_2" , 
     OutputName -> m2a }}, 

{M1b,{ 
     Real -> False, 
     LesHouches -> {GM,4} , 
     LaTeX -> "M_1^b" , 
     OutputName -> m1b }}, 
     
  

{Lambda5b,{ 
     Real -> False, 
     LesHouches -> {GM,6} , 
     LaTeX -> "{\\lambda}_{5b}" , 
     OutputName -> lam5b }}, 

{Meta,{ 
     Real -> False, 
     LesHouches -> {GM,8} , 
     LaTeX -> "{M}_{\\eta}" , 
     OutputName -> meta }}, 

{MXi,{ 
     Real -> False, 
     LesHouches -> {GM,10} , 
     LaTeX -> "{M}_{\\xi}" , 
     OutputName -> mxi }}, 

{Lambda2b,{ 
     Real -> False, 
     LesHouches -> {GM,12} , 
     LaTeX -> "{\\lambda}_{2b}" , 
     OutputName -> lam2b }}, 

{Lambda1,{ 
     Real -> False, 
     LesHouches -> {GM,14} , 
     LaTeX -> "{\\lambda}_{1}" , 
     OutputName -> lam1 }}, 

{Lambda2a,{ 
     Real -> False, 
     LesHouches -> {GM,16} , 
     LaTeX -> "{\\lambda}_{2a}" , 
     OutputName -> lam2a }}, 

{Lambda5a,{ 
     Real -> False, 
     LesHouches -> {GM,18} , 
     LaTeX -> "{\\lambda}_{5a}" , 
     OutputName -> lam5a }}, 

{M1a,{ 
     Real -> False, 
     LesHouches -> {GM,20} , 
     LaTeX -> "M1a" , 
     OutputName -> m1a }}, 

{Lambda3c,{ 
     Real -> False, 
     LesHouches -> {GM,22} , 
     LaTeX -> "{\\lambda}_{3c}" , 
     OutputName -> lam3c }}, 

{Lambda3b,{ 
     Real -> False, 
     LesHouches -> {GM,24} , 
     LaTeX -> "{\\lambda}_{3b}" , 
     OutputName -> lam3b }}, 

{Lambda3a,{ 
     Real -> False, 
     LesHouches -> {GM,26} , 
     LaTeX -> "{\\lambda}_{3a}" , 
     OutputName -> lam3a }}, 

{Lambda4a,{ 
     Real -> False, 
     LesHouches -> {GM,28} , 
     LaTeX -> "{\\lambda}_{4a}" , 
     OutputName -> lam4a }}, 

{Lambda4c,{ 
     Real -> False, 
     LesHouches -> {GM,30} , 
     LaTeX -> "{\\lambda}_{4c}" , 
     OutputName -> lam4c }}, 

{Lambda4b,{ 
     Real -> False, 
     LesHouches -> {GM,32} , 
     LaTeX -> "{\\lambda}_{4b}" , 
     OutputName -> lam4b }}, 

{vEta,{ 
     Real -> True, 
     LesHouches -> {GM,34} , 
     LaTeX -> "{v}_{\\eta}" , 
     OutputName -> veta }}, 

{vPhi,{ 
     Real -> True, 
     LesHouches -> {GM,36} , 
     LaTeX -> "{v}_{\\Phi}" , 
     OutputName -> vphi }}, 

{ZA,{Description->"Pseudo-Scalar-Mixing-Matrix", 
     Real -> False, 
     LesHouches -> ZA , 
     LaTeX -> "ZA" , 
     OutputName -> za }},
     
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }}     
} 
