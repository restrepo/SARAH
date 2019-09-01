(* SARAH generated template for parameters.m file for SplitMSSM*)
(* File created at 10:28 on 29.2.2016  *) 
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

{m2,{ 
     Description -> "SM Mu Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {SM, 1}, 
     LaTeX -> "m^2", 
     OutputName -> m2sm}}, 

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
     OutputName -> vvSM}}, 

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

{MB,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "MB"  (* auto generated LaTeX name *), 
     OutputName -> mbino  (* auto generated Output name *)}}, 

{MG,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "MG"  (* auto generated LaTeX name *), 
     OutputName -> mgluino  (* auto generated Output name *)}}, 

{MW,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "MW"  (* auto generated LaTeX name *), 
     OutputName -> mwino  (* auto generated Output name *)}},

{g1d,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{1d}"  (* auto generated LaTeX name *), 
     OutputName -> gc1d  (* auto generated Output name *)}}, 

{g2d,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{2d}"  (* auto generated LaTeX name *), 
     OutputName -> gc2d  (* auto generated Output name *)}}, 

{g1u,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{1u}"  (* auto generated LaTeX name *), 
     OutputName -> gc1u  (* auto generated Output name *)}}, 

{g2u,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{2u}"  (* auto generated LaTeX name *), 
     OutputName -> gc2u  (* auto generated Output name *)}}, 

{PhaseGlu,{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "PhaseGlu"  (* auto generated LaTeX name *), 
     OutputName -> phaseg  (* auto generated Output name *)}}, 

{Mass[VWp],{ 
     Real -> False, 
     LesHouches -> {SPLITNMSSM,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "M_{VWp}"  (* auto generated LaTeX name *), 
     OutputName -> Mvwp  (* auto generated Output name *)}},

{\[Beta],   { Description -> "Scalar mixing angle in the NMSSM"  }},             
{\[Theta],   { Description -> "Scalar mixing angle in the SplitNMSSM", 
			 LaTeX -> "\\alpha",
             DependenceSPheno -> ArcTan[ZH[2,2]/ZH[1,2]], 
             Real -> True, 
             LesHouches -> {HMIX, 11},
             OutputName-> Theta     }},  

{TanBeta,    { Description -> "Tan Beta" }},

{TanTheta,   { Description -> "Tan Theta", 
               Real->True,
               LaTeX -> "\\tan\\theta",
               DependenceSPheno -> ZH[2,2]/ZH[1,2]
               OutputName -> TanTheta}},

{ZH,{ Description->"Scalar-Mixing-Matrix", 
	 LaTeX -> "Z^H",
     Real -> True, 
     DependenceOptional -> {{-Cos[\[Theta]],Sin[\[Theta]]},
                    {Sin[\[Theta]],Cos[\[Theta]]}}, 
     Value -> None, 
     LesHouches -> SCALARMIX,
     OutputName-> ZH     }},

{ZA, {   Description->"Pseudo-Scalar-Mixing-Matrix", 
   			 LaTeX -> "Z^A",
             Real -> True,
             DependenceOptional -> {{1,0},{0,1}}, 
             Value -> None, 
             LesHouches -> PSEUDOSCALARMIX,
             OutputName-> ZA      }},
 
{LambdaH,{ 
     Description -> "Higgs doublet self coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {SM, 2}, 
     LaTeX -> "\\lambda_H", 
     OutputName -> LamH}}, 

 {LambdaSr, { 
     Description->"Quartic self coupling of the singlet S - real part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
     LaTeX -> "\\lambda_{S_r}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,22},
     OutputName-> LamSr     }},
 {LambdaSi, { 
     Description->"Quartic self coupling of the singlet S - imaginary part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
     LaTeX -> "\\lambda_{S_i}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,23},
     OutputName-> LamSi     }},
 {LambdaSri, { 
     Description->"Quartic self coupling of the singlet S - mixed part",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
     LaTeX -> "\\lambda_{S_{ri}}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,24},
     OutputName-> LamSri     }},
 {LambdaSHr, { 
     Description->"Quartic singlet-doublet coupling - real part",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
	 LaTeX -> "\\lambda_{SH_r}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,25},
     OutputName-> LamSHr     }},

 {LambdaSHi, { 
     Description->"Quartic singlet-doublet coupling - imaginary part",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
	 LaTeX -> "\\lambda_{SH_i}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,26},
     OutputName-> LamSHi     }},


 {KappaSr, { 
     Description->"Trilinear self coupling of the singlet S - real part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
	 LaTeX -> "\\kappa_{S_r}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,27},
     OutputName-> KapSr     }},

 {KappaSri, { 
     Description->"Trilinear self coupling of the singlet S - mixing part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
	 LaTeX -> "\\kappa_{S_{ri}}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,28},
     OutputName-> KapSri     }},

 {KappaSHr, { 
     Description->"Trilinear singlet-doublet coupling",
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None,
	 LaTeX -> "\\kappa_{SH_r}",
     Real -> True, 
     Value -> None, 
     LesHouches -> {SPLITNMSSM,29},
     OutputName-> KapSHr     }},

 {mSr2, { 
     Description -> "Singlet Mu Parameter - real part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "m_{S_r}^2", 
     LesHouches -> {SPLITNMSSM,30},
     OutputName -> mSr2}}, 
  {mSi2, { 
     Description -> "Singlet Mu Parameter - imaginary part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "m_{S_i}^2", 
     LesHouches -> {SPLITNMSSM,31},
     OutputName -> mSi2}}, 
 
 {vS, { 
     Description -> "Singlet VEV", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "v_S", 
     LesHouches -> {SPLITNMSSM,32},
     OutputName -> vS}}, 
 {Ysi, { 
     Description -> "Singlet-singlino Yukawa coupling - imaginary part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Y_{S_i}", 
     LesHouches -> {SPLITNMSSM,33},
     OutputName -> Ysi}},
 {Ysr, { 
     Description -> "Singlet-singlino Yukawa coupling - real part", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Y_{S_r}", 
     LesHouches -> {SPLITNMSSM,34},
     OutputName -> Ysr}},
 {Ysu, { 
     Description -> "higgs-higgsino-singlino coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Y_{S_u}", 
     LesHouches -> {SPLITNMSSM,35},
     OutputName -> Ysu}},
 {Ysd, { 
     Description -> "higgs-higgsino-singlino coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Y_{S_d}", 
     LesHouches -> {SPLITNMSSM,36},
     OutputName -> Ysd}},
 {Ysrud, { 
     Description -> "singlet-higgsino-higgsino coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Y_{S_r}^{ud}", 
     LesHouches -> {SPLITNMSSM,37},
     OutputName -> Ysrud}},
 {Ysiud, { 
     Description -> "singlet-higgsino-higgsino coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LaTeX -> "Y_{S_r}^{ud}", 
     LesHouches -> {SPLITNMSSM,38},
     OutputName -> Ysiud}}
 } 
