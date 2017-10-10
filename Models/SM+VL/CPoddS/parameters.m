(* SARAH generated template for parameters.m file for SSMVLeven*)
(* File created at 11:05 on 26.1.2016  *) 
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

{MS2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {HMIX, 34}, 
     LaTeX -> "M_S^2", 
     OutputName -> MuS2}}, 

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

{vS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {HMIX, 51}, 
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

{ZA,         { Description->"Pseudo-Scalar-Mixing-Matrix", 
			   LaTeX -> "Z^A",
			   Real -> True,
			   LesHouches -> PSEUDOSCALARMIX,
			   OutputName-> ZA      }},
			   
{\[Beta],  { Description -> "Pseudo Scalar mixing angle",
			 DependenceSPheno -> None}},   
			 
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

{\[Lambda],{ 
     Description -> "SM Higgs Selfcouplings", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {SM, 2}, 
     LaTeX -> "\\lambda", 
     OutputName -> Lam}}, 

{Mass[VWp],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {PHIPORTAL, 22}, 
     LaTeX -> "M_{VWp}", 
     OutputName -> Mvwp}}, 



(*  ----------- Additional parameters in the model ---------- *) 

{m1F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,1}, 
     LaTeX -> "m_{F_1}", 
     OutputName -> m1F}}, 

{m2F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,2}, 
     LaTeX -> "m_{F_2}", 
     OutputName -> m2F}}, 

{m3F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,3}, 
     LaTeX -> "m_{F_3}", 
     OutputName -> m3F}}, 

{m4F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,4}, 
     LaTeX -> "m_{F_4}", 
     OutputName -> m4F}}, 

{m5F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,5}, 
     LaTeX -> "m_{F_5}", 
     OutputName -> m5F}}, 

{m6F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,6}, 
     LaTeX -> "m_{F_6}", 
     OutputName -> m6F}}, 

{m7F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,7}, 
     LaTeX -> "m_{F_7}", 
     OutputName -> m7F}}, 

{m8F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,8}, 
     LaTeX -> "m_{F_8}", 
     OutputName -> m8F}}, 

{m9F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,9}, 
     LaTeX -> "m_{F_9}", 
     OutputName -> m9F}}, 

{m10F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,10}, 
     LaTeX -> "m_{F_10}", 
     OutputName -> m10F}}, 

{m11F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,11}, 
     LaTeX -> "m_{F_11}", 
     OutputName -> m11F}}, 

{m12F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,12}, 
     LaTeX -> "m_{F_12}", 
     OutputName -> m12F}}, 

{m13F,{ 
     Real -> False, 
     LesHouches -> {VLFMASSES,13}, 
     LaTeX -> "m_{F_13}", 
     OutputName -> m13F}}, 

{YF1,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,1}, 
     LaTeX -> "Y_{F_1}", 
     OutputName -> YF1}}, 

{YF2,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,2}, 
     LaTeX -> "Y_{F_2}", 
     OutputName -> YF2}}, 

{YF3,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,3}, 
     LaTeX -> "Y_{F_3}", 
     OutputName -> YF3}}, 

{YF4,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,4}, 
     LaTeX -> "Y_{F_4}", 
     OutputName -> YF4}}, 

{YF5,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,5}, 
     LaTeX -> "Y_{F_5}", 
     OutputName -> YF5}}, 

{YF6,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,6}, 
     LaTeX -> "Y_{F_6}", 
     OutputName -> YF6}}, 

{YF7,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,7}, 
     LaTeX -> "Y_{F_7}", 
     OutputName -> YF7}}, 

{YF8,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,8}, 
     LaTeX -> "Y_{F_8}", 
     OutputName -> YF8}}, 

{YF9,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,9}, 
     LaTeX -> "Y_{F_9}", 
     OutputName -> YF9}}, 
     
{YF10,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,10}, 
     LaTeX -> "Y_{F_10}", 
     OutputName -> YF10}}, 

{YF11,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,11}, 
     LaTeX -> "Y_{F_11}", 
     OutputName -> YF11}}, 

{YF12,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,12}, 
     LaTeX -> "Y_{F_12}", 
     OutputName -> YF12}}, 

{YF13,{ 
     Real -> False, 
     LesHouches -> {VLFCOUP,13}, 
     LaTeX -> "Y_{F_13}", 
     OutputName -> YF13}}, 
     
     

{kapS,{ 
     Real -> False, 
     LesHouches -> {HMIX,52}, 
     LaTeX -> "\\kappa_S", 
     OutputName -> kaps}}, 

{kapHS,{ 
     Real -> False, 
     LesHouches -> {HMIX,53}, 
     LaTeX -> "\\kappa_{HS}", 
     OutputName -> kaphs}}, 

{lamS,{ 
     Real -> False, 
     LesHouches -> {HMIX,54}, 
     LaTeX -> "\\lambda_S", 
     OutputName -> LamS}}, 

{lamHS,{ 
     Real -> False, 
     LesHouches -> {HMIX,55}, 
     LaTeX -> "\\lambda_{HS}", 
     OutputName -> LamHS}}, 

{PhaseX1R,{ 
     Real -> False, 
     LesHouches -> {PHASE,62}, 
     LaTeX -> "{PhaseX1}_R", 
     OutputName -> px1r}}, 

{PhaseX2R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,64}, 
     LaTeX -> "{PhaseX2}_R", 
     OutputName -> px2r}}, 

{PhaseX3R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,66}, 
     LaTeX -> "{PhaseX3}_R", 
     OutputName -> px3r}}, 

{PhaseX4R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,68}, 
     LaTeX -> "{PhaseX4}_R", 
     OutputName -> px4r}}, 

{PhaseX5R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,70}, 
     LaTeX -> "{PhaseX5}_R", 
     OutputName -> px5r}}, 

{PhaseX6R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,72}, 
     LaTeX -> "{PhaseX6}_R", 
     OutputName -> px6r}}, 

{PhaseX7R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,74}, 
     LaTeX -> "{PhaseX7}_R", 
     OutputName -> px7r}}, 

{PhaseX8R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,76}, 
     LaTeX -> "{PhaseX8}_R", 
     OutputName -> px8r}}, 

{PhaseX9R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,78}, 
     LaTeX -> "{PhaseX9}_R", 
     OutputName -> px9r}}, 

{PhaseX10R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,80}, 
     LaTeX -> "{{PhaseX1}^0}_R", 
     OutputName -> px10r}}, 

{PhaseX11R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,82}, 
     LaTeX -> "{PhaseX11}_R", 
     OutputName -> px11r}}, 

{PhaseX12R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,84}, 
     LaTeX -> "{PhaseX12}_R", 
     OutputName -> px12r}}, 

{PhaseX13R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,86}, 
     LaTeX -> "{PhaseX13}_R", 
     OutputName -> px13r}}, 

{PhaseY1R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,88}, 
     LaTeX -> "{PhaseY1}_R", 
     OutputName -> py1R}}, 

{PhaseY2R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,90}, 
     LaTeX -> "{PhaseY2}_R", 
     OutputName -> py2r}}, 

{PhaseY3R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,92}, 
     LaTeX -> "{PhaseY3}_R", 
     OutputName -> py3r}}, 

{PhaseY4R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,94}, 
     LaTeX -> "{PhaseY4}_R", 
     OutputName -> py4r}}, 

{PhaseY6R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,96}, 
     LaTeX -> "{PhaseY6}_R", 
     OutputName -> py6r}}, 

{PhaseY9R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,98}, 
     LaTeX -> "{PhaseY9}_R", 
     OutputName -> py9r}}, 

{PhaseY10R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,100}, 
     LaTeX -> "{{PhaseY1}^0}_R", 
     OutputName -> py10r}}, 

{PhaseY11R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,102}, 
     LaTeX -> "{PhaseY11}_R", 
     OutputName -> py11r}}, 

{PhaseY12R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,104}, 
     LaTeX -> "{PhaseY12}_R", 
     OutputName -> py12r}}, 

{PhaseZ2R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,106}, 
     LaTeX -> "{PhaseZ2}_R", 
     OutputName -> pz2R}}, 

{PhaseZ4R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,108}, 
     LaTeX -> "{PhaseZ4}_R", 
     OutputName -> pz4r}}, 

{PhaseZ10R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,110}, 
     LaTeX -> "{{PhaseZ1}^0}_R", 
     OutputName -> pz10r}}, 

{PhaseZ12R,{ 
     Real -> False, 
     LesHouches -> {SSMVLEVEN,112}, 
     LaTeX -> "{PhaseZ12}_R", 
     OutputName -> pz12r}} 
} 
