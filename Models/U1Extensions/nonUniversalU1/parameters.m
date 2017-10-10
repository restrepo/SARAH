(* SARAH generated template for parameters.m file for nonUniversalU1*)
(* File created at 17:55 on 10.1.2016  *) 
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

{lamS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {simpleU1, 3}, 
     LaTeX -> "\\lambda_{S}", 
     OutputName -> lamS}}, 

{muS2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {simpleU1, 12}, 
     LaTeX -> "\\muS_2", 
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
     LesHouches -> {simpleU1, 43}, 
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

{Yv,{ 
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

     
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},       
     
     

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

{h1D,{ 
     Real -> False, 
     LesHouches -> H1D  (* auto generated Les Houches entry *), 
     LaTeX -> "h1D"  (* auto generated LaTeX name *), 
     OutputName -> h1d  (* auto generated Output name *)}}, 

{h1J,{ 
     Real -> False, 
     LesHouches -> H1J  (* auto generated Les Houches entry *), 
     LaTeX -> "h1J"  (* auto generated LaTeX name *), 
     OutputName -> h1j  (* auto generated Output name *)}}, 

{h2D,{ 
     Real -> False, 
     LesHouches -> H2D  (* auto generated Les Houches entry *), 
     LaTeX -> "h2D"  (* auto generated LaTeX name *), 
     OutputName -> h2d  (* auto generated Output name *)}}, 

{h2J,{ 
     Real -> False, 
     LesHouches -> H2J  (* auto generated Les Houches entry *), 
     LaTeX -> "h2J"  (* auto generated LaTeX name *), 
     OutputName -> h2j  (* auto generated Output name *)}}, 

{hXD,{ 
     Real -> False, 
     LesHouches -> HXD  (* auto generated Les Houches entry *), 
     LaTeX -> "hXD"  (* auto generated LaTeX name *), 
     OutputName -> hxd  (* auto generated Output name *)}}, 

{hXJ,{ 
     Real -> False, 
     LesHouches -> HXJ  (* auto generated Les Houches entry *), 
     LaTeX -> "hXJ"  (* auto generated LaTeX name *), 
     OutputName -> hxj  (* auto generated Output name *)}}, 

{h1T,{ 
     Real -> False, 
     LesHouches -> H1T  (* auto generated Les Houches entry *), 
     LaTeX -> "h1T"  (* auto generated LaTeX name *), 
     OutputName -> h1t  (* auto generated Output name *)}}, 

{h1U,{ 
     Real -> False, 
     LesHouches -> H1U  (* auto generated Les Houches entry *), 
     LaTeX -> "h1U"  (* auto generated LaTeX name *), 
     OutputName -> h1u  (* auto generated Output name *)}}, 

{h2T,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "h2T"  (* auto generated LaTeX name *), 
     OutputName -> h2t  (* auto generated Output name *)}}, 

{h2U,{ 
     Real -> False, 
     LesHouches -> H2U  (* auto generated Les Houches entry *), 
     LaTeX -> "h2U"  (* auto generated LaTeX name *), 
     OutputName -> h2u  (* auto generated Output name *)}}, 

{hXT,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "hXT"  (* auto generated LaTeX name *), 
     OutputName -> hxt  (* auto generated Output name *)}}, 

{hXU,{ 
     Real -> False, 
     LesHouches -> HXU  (* auto generated Les Houches entry *), 
     LaTeX -> "hXU"  (* auto generated LaTeX name *), 
     OutputName -> hxu  (* auto generated Output name *)}}, 

{M112,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "M112"  (* auto generated LaTeX name *), 
     OutputName -> m112  (* auto generated Output name *)}}, 

{M222,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "M222"  (* auto generated LaTeX name *), 
     OutputName -> m222  (* auto generated Output name *)}}, 

{Lambda1,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{1}"  (* auto generated LaTeX name *), 
     OutputName -> lam1  (* auto generated Output name *)}}, 

{lamH1S,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamH1S"  (* auto generated LaTeX name *), 
     OutputName -> lamh1s  (* auto generated Output name *)}}, 

{kapHS,{ 
     Real -> True, 
     LesHouches -> {NONUNIVERSALU1,13}  (* auto generated Les Houches entry *), 
     LaTeX -> "kapHS"  (* auto generated LaTeX name *), 
     OutputName -> kaphs  (* auto generated Output name *)}},      
     
{Lambda4,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{4}"  (* auto generated LaTeX name *), 
     OutputName -> lam4  (* auto generated Output name *)}}, 

{Lambda3,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{3}"  (* auto generated LaTeX name *), 
     OutputName -> lam3  (* auto generated Output name *)}}, 

{Lambda2,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\lambda}_{2}"  (* auto generated LaTeX name *), 
     OutputName -> lam2  (* auto generated Output name *)}}, 

{lamH2S,{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamH2S"  (* auto generated LaTeX name *), 
     OutputName -> lamh2s  (* auto generated Output name *)}}, 

{v1,        { Description -> "Down-VEV", LaTeX -> "v_1", OutputName -> v1}}, 
{v2,        { Description -> "Up-VEV", LaTeX -> "v_2", OutputName -> v2}},       
{v,         { Description -> "EW-VEV", DependenceSPheno -> Sqrt[v1^2 + v2^2]}},

{ZP,{ 
     Real -> False, 
     LesHouches -> ZP  (* auto generated Les Houches entry *), 
     LaTeX -> "ZP"  (* auto generated LaTeX name *), 
     OutputName -> zp  (* auto generated Output name *)}}, 

{Mass[VWm],{ 
     Real -> False, 
     LesHouches -> {NONUNIVERSALU1,26}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{VWm}"  (* auto generated LaTeX name *), 
     OutputName -> Mvwm  (* auto generated Output name *)}} 
} 
