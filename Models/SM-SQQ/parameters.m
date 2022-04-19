(* SARAH generated template for parameters.m file for SM8C*)
(* File created at 13:10 on 25.1.2016  *) 
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
     Description -> "SM Mu-squared Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {HMIX, 2}, 
     LaTeX -> "\\mu^2", 
     OutputName -> mu2}}, 

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

{vS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 20}, 
     LaTeX -> "v_S", 
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

{ZH,{ 
     Description -> "Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> {{-Sin[\[Alpha]], Cos[\[Alpha]]}, {Cos[\[Alpha]], Sin[\[Alpha]]}}, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> SCALARMIX, 
     LaTeX -> "Z^H", 
     OutputName -> ZH}}, 

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

{\[Alpha],{ 
     Description -> "Scalar mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[ZH[1, 2]], 
     Real -> True, 
     LesHouches -> {HMIX, 11}, 
     LaTeX -> "\\alpha", 
     OutputName -> alphaH}}, 



(*  ----------- Additional parameters in the model ---------- *) 



{MS2,{ 
     Real -> True, 
     LesHouches -> {SM8R,1}  (* auto generated Les Houches entry *), 
     LaTeX -> "m_S^2"  (* auto generated LaTeX name *), 
     OutputName -> ms2  (* auto generated Output name *)}}, 

{MP2,{ 
     Real -> True, 
     LesHouches -> {SM8R,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "M^2_{QP}"  (* auto generated LaTeX name *), 
    OutputName -> mp2  (* auto generated Output name *)}},

{MM2,{ 
     Real -> True, 
     LesHouches -> {SM8R,3}  (* auto generated Les Houches entry *), 
     LaTeX -> "M^2_{QM}"  (* auto generated LaTeX name *), 
     OutputName -> mm2  (* auto generated Output name *)}}, 

{LambdaS,{ 
     Real -> True, 
     LesHouches -> {SM8R,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{S}"  (* auto generated LaTeX name *), 
     OutputName -> lams  (* auto generated Output name *)}}, 


{Lambda1,{ 
     Real -> True, 
     LesHouches -> {SM8R,5}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{1}"  (* auto generated LaTeX name *), 
     OutputName -> lam1  (* auto generated Output name *)}}, 

{Lambda2,{ 
     Real -> True, 
     LesHouches -> {SM8R,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{2}"  (* auto generated LaTeX name *), 
     OutputName -> lam2  (* auto generated Output name *)}}, 



{Lambda3,{ 
     Real -> True, 
     LesHouches -> {SM8R,7}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{3}"  (* auto generated LaTeX name *), 
     OutputName -> lam3  (* auto generated Output name *)}}, 

{Lambda4,{ 
     Real -> True, 
     LesHouches -> {SM8R,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{4}"  (* auto generated LaTeX name *), 
     OutputName -> lam4  (* auto generated Output name *)}}, 


{Lambda5,{ 
     Real -> True, 
     LesHouches -> {SM8R,9}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{5}"  (* auto generated LaTeX name *), 
     OutputName -> lam5  (* auto generated Output name *)}}, 



{Kappa2,{ 
     Real -> True, 
     LesHouches -> {SM8R,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\kappa}_{2}"  (* auto generated LaTeX name *), 
     OutputName -> kap2  (* auto generated Output name *)}}, 
{Kappa3,{ 
     Real -> True, 
     LesHouches -> {SM8R,11}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\kappa}_{3}"  (* auto generated LaTeX name *), 
    OutputName -> kap3  (* auto generated Output name *)}},

{Kappa4,{ 
     Real -> True, 
     LesHouches -> {SM8R,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\kappa}_{4}"  (* auto generated LaTeX name *), 
    OutputName -> kap4  (* auto generated Output name *)}},

{Kappa5,{ 
     Real -> True, 
     LesHouches -> {SM8R,13}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\kappa}_{5}"  (* auto generated LaTeX name *), 
     OutputName -> kap5  (* auto generated Output name *)}},

{Kappa1,{ 
     Real -> True, 
     LesHouches -> {SM8R,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\kappa}_{1}"  (* auto generated LaTeX name *), 
     OutputName -> kap1  (* auto generated Output name *)}}, 

{LambdaH,{ 
     Real -> True, 
     LesHouches -> {SM8R,15}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{H}"  (* auto generated LaTeX name *), 
     OutputName -> lamh  (* auto generated Output name *)}}, 


{Lambda8,{ 
     Real -> True, 
     LesHouches -> {SM8R,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{8}"  (* auto generated LaTeX name *), 
     OutputName -> lam8  (* auto generated Output name *)}}, 

{Lambda11,{ 
     Real -> True, 
     LesHouches -> {SM8R,17}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{11}"  (* auto generated LaTeX name *), 
     OutputName -> lam11  (* auto generated Output name *)}}, 

{Lambda7,{ 
     Real -> True, 
     LesHouches -> {SM8R,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{7}"  (* auto generated LaTeX name *), 
     OutputName -> lam7  (* auto generated Output name *)}}, 

{Lambda6,{ 
     Real -> True, 
     LesHouches -> {SM8R,19}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{6}"  (* auto generated LaTeX name *), 
    OutputName -> lam6  (* auto generated Output name *)}},


{Yq,{ 
     Real -> False, 
     LesHouches -> YQ  (* auto generated Les Houches entry *), 
     LaTeX -> "Yq"  (* auto generated LaTeX name *), 
     OutputName -> yq  (* auto generated Output name *)}}, 

{LambdaCH,{ 
     Real -> False, 
     LesHouches -> {SM8C,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{CH}"  (* auto generated LaTeX name *), 
     OutputName -> lamch  (* auto generated Output name *)}}, 

{LambdaC,{ 
     Real -> False, 
     LesHouches -> {SM8C,21}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{C}"  (* auto generated LaTeX name *), 
     OutputName -> lamc  (* auto generated Output name *)}}, 

{LambdaHS,{ 
     Real -> False, 
     LesHouches -> {SM8C,22}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{HS}"  (* auto generated LaTeX name *), 
     OutputName -> lamhs  (* auto generated Output name *)}}


} 
