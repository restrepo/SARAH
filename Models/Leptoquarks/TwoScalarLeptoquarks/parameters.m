(* SARAH generated template for parameters.m file for SM*)
(* File created at 19:04 on 26.1.2016  *) 
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

{YP,{ 
     Real -> False, 
     LesHouches -> YP  , 
     LaTeX -> "Y_{\\Phi}"  , 
     OutputName -> yp  }}, 

{YT,{ 
     Real -> False, 
     LesHouches -> YT  , 
     LaTeX -> "Y_{\\Theta}"  , 
     OutputName -> yt  }}, 

{YO,{ 
     Real -> False, 
     LesHouches -> YO  , 
     LaTeX -> "Y_{\\Omega}"  , 
     OutputName -> yo  }}, 

{LambdaHat,{ 
     Real -> False, 
     LesHouches -> {SM,2}  , 
     LaTeX -> "{\\hat \\lambda}"  , 
     OutputName -> lamhat  }}, 

{muH2,{ 
     Real -> False, 
     LesHouches -> {SM,4}  , 
     LaTeX -> "\\mu^2_{H}"  , 
     OutputName -> muh2  }}, 

{muO2,{ 
     Real -> False, 
     LesHouches -> {SM,6}  , 
     LaTeX -> "\\mu^2_{\\Omega}"  , 
     OutputName -> muo2  }}, 

{muP2,{ 
     Real -> False, 
     LesHouches -> {SM,8}  , 
     LaTeX -> "\\mu^2_{\\Phi}"  , 
     OutputName -> mup2  }}, 

{muS2,{ 
     Real -> False, 
     LesHouches -> {SM,10}  , 
     LaTeX -> "\\mu^2_{S}"  , 
     OutputName -> mus2  }}, 

{muT2,{ 
     Real -> False, 
     LesHouches -> {SM,12}  , 
     LaTeX -> "\\mu^2_{\\Theta}"  , 
     OutputName -> mut2  }}, 

{LambdaH,{ 
     Real -> False, 
     LesHouches -> {SM,14}  , 
     LaTeX -> "{\\lambda}_{H}"  , 
     OutputName -> lamh  }}, 

{LambdaHO,{ 
     Real -> False, 
     LesHouches -> {SM,16}  , 
     LaTeX -> "{\\lambda}_{H\\Omega}"  , 
     OutputName -> lamho  }}, 

{LambdaHP,{ 
     Real -> False, 
     LesHouches -> {SM,18}  , 
     LaTeX -> "{\\lambda}_{H\\Phi}"  , 
     OutputName -> lamhp  }}, 

{LambdaHS,{ 
     Real -> False, 
     LesHouches -> {SM,20}  , 
     LaTeX -> "{\\lambda}_{HS}"  , 
     OutputName -> lamhs  }}, 

{LambdaHT,{ 
     Real -> False, 
     LesHouches -> {SM,22}  , 
     LaTeX -> "{\\lambda}_{H\\Theta}"  , 
     OutputName -> lamht  }}, 

{LambdaOP,{ 
     Real -> False, 
     LesHouches -> {SM,24}  , 
     LaTeX -> "{\\lambda}_{\\Omega\\Phi}"  , 
     OutputName -> lamop  }}, 

{LambdaOS,{ 
     Real -> False, 
     LesHouches -> {SM,26}  , 
     LaTeX -> "{\\lambda}_{\\Omega S}"  , 
     OutputName -> lamos  }}, 

{LambdaOT,{ 
     Real -> False, 
     LesHouches -> {SM,28}  , 
     LaTeX -> "{\\lambda}_{\\Omega \\Theta}"  , 
     OutputName -> lamot  }}, 

{LambdaSP,{ 
     Real -> False, 
     LesHouches -> {SM,30}  , 
     LaTeX -> "{\\lambda}_{\\Phi S}"  , 
     OutputName -> lamps  }}, 

{LambdaPT,{ 
     Real -> False, 
     LesHouches -> {SM,32}  , 
     LaTeX -> "{\\lambda}_{\\Phi \\Theta}"  , 
     OutputName -> lampt  }}, 

{LambdaS,{ 
     Real -> False, 
     LesHouches -> {SM,34}  , 
     LaTeX -> "{\\lambda}_{S}"  , 
     OutputName -> lams  }}, 

{LambdaTS,{ 
     Real -> False, 
     LesHouches -> {SM,36}  , 
     LaTeX -> "{\\lambda}_{\\Theta S}"  , 
     OutputName -> lamts  }}, 
     
{LambdaT,{ 
     Real -> False, 
     LesHouches -> {SM,38}  , 
     LaTeX -> "{\\lambda}_{\\Theta }"  , 
     OutputName -> lamT  }}, 
     
{LambdaO,{ 
     Real -> False, 
     LesHouches -> {SM,40}  , 
     LaTeX -> "{\\lambda}_{\\Omega}"  , 
     OutputName -> lamO  }}, 
     
{LambdaP,{ 
     Real -> False, 
     LesHouches -> {SM,42}  , 
     LaTeX -> "{\\lambda}_{\\Phi}"  , 
     OutputName -> lamP  }},      

{vS,{ 
     Real -> True, 
     LesHouches -> {SM,50}  , 
     LaTeX -> "v_{S}"  , 
     OutputName -> vs  }}, 

{ZH,        { Description->"Scalar-Mixing-Matrix",
              DependenceOptional->None}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix",
              DependenceOptional->None}}

} 
