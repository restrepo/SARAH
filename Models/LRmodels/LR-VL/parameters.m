(* SARAH generated template for parameters.m file for LRVL*)
(* File created at 20:23 on 2.1.2016  *) 
(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


ParameterDefinitions = { 
 
(* ----------- Already defined parameters in existing parameters.m ----------- *) 


 (*{g1,        { Description -> "Hypercharge-Coupling"}},*)


 (*{gBL,      { LaTeX -> "g_{BL}",
             LesHouches -> {gauge,4},
		GUTnormalization -> Sqrt[3/2] }},*)


{gBL,{ 
     Description -> "B-L-Coupling",  (* for explicit relations, choose the following *)
     Dependence -> None,             (*  remove that line *)
     DependenceNum -> None,          (* e/(Cos[ThetaW]*Cos[ThetaBL]) *)
     DependenceOptional -> None,     (* e/(Cos[ThetaW]*Cos[ThetaBL]) *) 
     DependenceSPheno -> None, 
     GUTnormalization -> Sqrt[3/2], 
     Real -> True, 
     LesHouches -> {gauge, 4}, 
     LaTeX -> "g_{B}", 
     OutputName -> gBL}},       

{g2,        { Description -> "Left-Coupling"(*,
              DependenceNum -> None,
              LesHouches -> {gauge, 2}*)}},

{gR,{ 
     Description -> "LeftR-Coupling",  (* for explicit relations, choose the following *)
     Dependence -> None,               (* remove that line *)
     DependenceNum -> None,            (* e/(Sin[ThetaBL]*Cos[ThetaW]) *)
     DependenceOptional -> None,       (* e/(Sin[ThetaBL]*Cos[ThetaW]) *)
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 5}, 
     LaTeX -> "g_R", 
     OutputName -> gR}}, 
              
{g3,        { Description -> "Strong-Coupling"}},    

{AlphaS,    { Description -> "Alpha Strong"}},	

{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},

{aEWinv,    { Description -> "inverse weak coupling constant at mZ",
              OutputName -> aEWM1}},



{lam1,{ 
     Description -> "Singlet Higgs Selfcouplings", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 1}, 
     LaTeX -> "lam1", 
     OutputName -> LAM1}}, 

{lam2L,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 2}, 
     LaTeX -> "\\lambda_{2L}", 
     OutputName -> LAM2L}}, 

{lam2R,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 3}, 
     LaTeX -> "\\lambda_{2R}", 
     OutputName -> LAM2R}},      
     
{lam3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 4}, 
     LaTeX -> "\\lambda_3", 
     OutputName -> LAM3}}, 

{lam4L,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 5}, 
     LaTeX -> "\\lambda_{4L}", 
     OutputName -> LAM4L}}, 

{lam4R,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 6}, 
     LaTeX -> "\\lambda_{4R}", 
     OutputName -> LAM4R}},      
     
{lamU,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> LAMU, 
     LaTeX -> "\\lambda_U", 
     OutputName -> LAMU}},      

{lamD,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> LAMD, 
     LaTeX -> "\\lambda_D", 
     OutputName -> LAMD}},     
     
{lamE,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> LAME, 
     LaTeX -> "\\lambda_E", 
     OutputName -> LAME}},     
     
{lamV,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> LAMV, 
     LaTeX -> "\\lambda_V", 
     OutputName -> LAMV}},          
     
{ME,{ 
     Description -> "Lepton-VL Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ME, 
     LaTeX -> "M_{E}", 
     OutputName -> ME}}, 

{MND,{ 
     Description -> "Dirac-Neutrino-VL Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MND, 
     LaTeX -> "M_{ND}", 
     OutputName -> MND}}, 

{MNM,{ 
     Description -> "Majorana-Neutrino-VL Mass", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> MNM, 
     LaTeX -> "M_{NM}", 
     OutputName -> MNM}}, 

{mu12,{ 
     Description -> "Singlet Mu Parameter", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 100}, 
     LaTeX -> "\\mu_{1}^2", 
     OutputName -> MU12}}, 

{muL2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 98}, 
     LaTeX -> "\\mu_{L}^2", 
     OutputName -> MUL2}}, 
     
{muR2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 99}, 
     LaTeX -> "\\mu_{R}^2", 
     OutputName -> MUR2}},      

{mu3L,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 103}, 
     LaTeX -> "\\mu_{3L}", 
     OutputName -> mu3L}}, 

{mu3R,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRINPUT, 104}, 
     LaTeX -> "\\mu_{3R}", 
     OutputName -> mu3R}},      
     
{PhiW,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Sqrt[Abs[ZW[1, 1]]^2 + Abs[ZW[1, 2]]^2]], 
     Real -> True, 
     LesHouches -> PhiW, 
     LaTeX -> "\\phi_W", 
     OutputName -> PhiW}}, 

{PMNS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UVMIX, 
     LaTeX -> "U^V", 
     OutputName -> UV}}, 

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcSin[Abs[ZZ[2, 1]]], 
     Real -> True, 
     LesHouches -> ThetaW, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 
     
{ThetaBL,{ 
     Description -> "BL-R mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[1, 1]/Cos[ArcSin[Abs[ZZ[2, 1]]]]]], 
     Real -> True, 
     LesHouches -> ThetaBL, 
     LaTeX -> "\\Theta_{BL}", 
     OutputName -> TBL}},      

{ThetaZZp,{ 
     Description -> "Z-Z' mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[2, 2]/Cos[ArcSin[Abs[ZZ[2, 1]]]]]], 
     Real -> True, 
     LesHouches -> ThetaZZp, 
     LaTeX -> "\\Theta_{ZZ'}", 
     OutputName -> TZZp}},        
     

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

{Ve,{ Description -> "Left-Lepton-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UELMIX, 
     LaTeX -> "U^e_L", 
     OutputName -> ZEL}}, 

     (*Description -> "EW-VEV"}}, *)
     
{vL,{  Description -> "EW-VEV",
       DependenceNum -> Sqrt[4*Mass[VWLm]^2/(g2^2)],
       DependenceSPheno -> None,
       OutputName -> vL,
       LesHouches -> {VEV, 1}}},

{vR,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 2}, 
     LaTeX -> "vR", 
     OutputName -> vR}}, 
     
{vS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 3}, 
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

{YVD,{ 
     Description -> "Down-VL Yukawa", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YVD, 
     LaTeX -> "Y_{VD}", 
     OutputName -> YVD}}, 

{YVE,{ 
     Description -> "Lepton-VL Yukawa", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YVE, 
     LaTeX -> "Y_{VE}", 
     OutputName -> YVE}}, 

{YVU,{ 
     Description -> "Up-VL Yukawa", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YVU, 
     LaTeX -> "Y_{VU}", 
     OutputName -> YVU}}, 

{YVV,{ 
     Description -> "Neutrino-VL Yukawa", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> YVV, 
     LaTeX -> "Y_{VV}", 
     OutputName -> YVV}}, 

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
  
{UC,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> CHMIX, 
     LaTeX -> "Z^+", 
     OutputName -> UC}},   
  
     
{ZW,{ 
     Description -> "W Mixing Matrix", 
     Dependence -> {{Cos[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2], -(Sin[PhiW]/Sqrt[2]), -(Sin[PhiW]/Sqrt[2])}, {((-I)*Cos[PhiW])/Sqrt[2], (I*Cos[PhiW])/Sqrt[2], (I*Sin[PhiW])/Sqrt[2], ((-I)*Sin[PhiW])/Sqrt[2]}, {Sin[PhiW]/Sqrt[2], Sin[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2], Cos[PhiW]/Sqrt[2]}, {((-I)*Sin[PhiW])/Sqrt[2], (I*Sin[PhiW])/Sqrt[2], ((-I)*Cos[PhiW])/Sqrt[2], (I*Cos[PhiW])/Sqrt[2]}}, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZWMIX, 
     LaTeX -> "Z^{W}", 
     OutputName -> ZW}}, 

{ZZ,{ 
     Description -> "Photon-Z-Z' Mixing Matrix",                                (* for explicit relations, choose the following *)
     Dependence -> (* {{Cos[ThetaBL] Cos[ThetaW], -Sin[ThetaBL] Sin[ThetaZZp] - (* use this explicit mixing matrix *)
   Cos[ThetaBL] Cos[ThetaZZp] Sin[ThetaW], -Cos[ThetaZZp] Sin[ThetaBL] + 
   Cos[ThetaBL] Sin[ThetaZZp] Sin[ThetaW]}, {Sin[ThetaW], 
  Cos[ThetaZZp] Cos[ThetaW], -Cos[ThetaW] Sin[ThetaZZp]}, {Cos[ThetaW] Sin[
    ThetaBL], 
  Cos[ThetaBL] Sin[ThetaZZp] - Cos[ThetaZZp] Sin[ThetaBL] Sin[ThetaW], 
  Cos[ThetaBL] Cos[ThetaZZp] + Sin[ThetaBL] Sin[ThetaZZp] Sin[ThetaW]}}, 
  *)None,
     DependenceNum -> None,                                                      (* remove that line *)
     DependenceSPheno -> None,                                                   (* remove that line *)
     Real -> True, 
     LesHouches -> ZZMIX, 
     LaTeX -> "Z^Z", 
     OutputName -> ZZ}}, 

{Mass[VWLm],{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> {LRVL, 2}, 
     LaTeX -> "M_{VWLm}", 
     OutputName -> Mvwlm}}, 



(*  ----------- Additional parameters in the model ---------- *) 

{MD,{ 
     Real -> False, 
     LesHouches -> MD  (* auto generated Les Houches entry *), 
     LaTeX -> "MD"  (* auto generated LaTeX name *), 
     OutputName -> md  (* auto generated Output name *)}}, 

{MU,{ 
     Real -> False, 
     LesHouches -> MU  (* auto generated Les Houches entry *), 
     LaTeX -> "MU"  (* auto generated LaTeX name *), 
     OutputName -> mu  (* auto generated Output name *)}} 
} 
