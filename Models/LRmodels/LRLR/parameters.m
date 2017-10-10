(* SARAH generated template for parameters.m file for LRLR*)
(* File created at 9:34 on 15.1.2016  *) 
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

{g1L,{ 
     Description -> "U1L-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 1}, 
     LaTeX -> "g_{1L}", 
     OutputName -> g1L}}, 

{g1R,{ 
     Description -> "U1R-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 2}, 
     LaTeX -> "g_{1R}", 
     OutputName -> g1R}}, 

{g2,{ 
     Description -> "Left-Coupling", 
     Dependence -> None, 
     DependenceNum -> e*Csc[ThetaW], 
     DependenceOptional -> e*Csc[ThetaW], 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 3}, 
     LaTeX -> "g_2", 
     OutputName -> g2}}, 

{g3,{ 
     Description -> "Strong-Coupling", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[AlphaS]*Sqrt[Pi], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 5}, 
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

{gR,{ 
     Description -> "LeftR-Coupling", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 4}, 
     LaTeX -> "g_R", 
     OutputName -> gR}}, 

{muL2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 98}, 
     LaTeX -> "\\mu_{L}^2", 
     OutputName -> MUL2}}, 

{muR2,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 99}, 
     LaTeX -> "\\mu_{R}^2", 
     OutputName -> MUR2}}, 

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

{rho1L,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 1}, 
     LaTeX -> "\\rho_{1L}", 
     OutputName -> RHO1L}}, 

{rho1R,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 2}, 
     LaTeX -> "\\rho_{1R}", 
     OutputName -> RHO1R}}, 

{rho2L,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 3}, 
     LaTeX -> "\\rho_{2L}", 
     OutputName -> RHO2L}}, 

{rho2R,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 4}, 
     LaTeX -> "\\rho_{2R}", 
     OutputName -> RHO2R}}, 

{rho3,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {LRLR, 5}, 
     LaTeX -> "\\rho_3", 
     OutputName -> RHO3}}, 

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[2, 2]]], 
     Real -> True, 
     LesHouches -> ThetaW, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 

{UC,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> CHMIX, 
     LaTeX -> "Z^+", 
     OutputName -> UC}}, 

{UCC,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> CHCHMIX, 
     LaTeX -> "Z^{++}", 
     OutputName -> UCC}}, 

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

{UP,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> AMIX, 
     LaTeX -> "Z^{Ah}", 
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

{vHL,{ 
     Description -> "EW-VEV", 
     Dependence -> None, 
     DependenceNum -> 2*Sqrt[Mass[VWLm]^2/g2^2], 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 1}, 
     LaTeX -> "v", 
     OutputName -> vHL}}, 

{vHR,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 2}, 
     LaTeX -> "vHR", 
     OutputName -> vHR}}, 

{vSD,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 6}, 
     LaTeX -> "vSD", 
     OutputName -> vSD}}, 

{vSE,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 7}, 
     LaTeX -> "vSE", 
     OutputName -> vSE}}, 

{vSU,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 5}, 
     LaTeX -> "vSU", 
     OutputName -> vSU}}, 

{vtL,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 3}, 
     LaTeX -> "vtL", 
     OutputName -> vtL}}, 

{vtR,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {VEV, 4}, 
     LaTeX -> "vtR", 
     OutputName -> vtR}}, 

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
     Description -> "Photon-Z-Z' Mixing Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
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

{g1L1R,{ 
     Real -> True, 
     LesHouches -> {LRLR,7}  (* auto generated Les Houches entry *), 
     LaTeX -> "{g_{1L1}}_R"  (* auto generated LaTeX name *), 
     OutputName -> gLR  (* auto generated Output name *)}}, 

{g1R1L,{ 
     Real -> True, 
     LesHouches -> {LRLR,9}  (* auto generated Les Houches entry *), 
     LaTeX -> "{g_{1R1}}_L"  (* auto generated LaTeX name *), 
     OutputName -> gRL (* auto generated Output name *)}}, 

{rhoL,{Real -> True, 
     LesHouches -> {LRLR,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_L"  (* auto generated LaTeX name *), 
     OutputName -> rhl  (* auto generated Output name *)}}, 

{rhoR,{Real -> True, 
     LesHouches -> {LRLR,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\rho}_R"  (* auto generated LaTeX name *), 
     OutputName -> rhr  (* auto generated Output name *)}}, 

{YL,{Form -> Symmetric, 
     Real -> False, 
     LesHouches -> YL  (* auto generated Les Houches entry *), 
     LaTeX -> "{Y}_L"  (* auto generated LaTeX name *), 
     OutputName -> yl  (* auto generated Output name *)}}, 

{eta,{Real -> True, 
     LesHouches -> {LRLR,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "\\eta"  (* auto generated LaTeX name *), 
     OutputName -> eta  (* auto generated Output name *)}}, 

{kap,{Real -> True, 
     LesHouches -> {LRLR,11}  (* auto generated Les Houches entry *), 
     LaTeX -> "\\kappa"  (* auto generated LaTeX name *), 
     OutputName -> kap  (* auto generated Output name *)}},     
     
{xiS,{ 
     Real -> True,
     LesHouches -> {LRLR,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "\\xi_S"  (* auto generated LaTeX name *), 
     OutputName -> xiS  (* auto generated Output name *)}}, 

{fD,{Form -> Hermitian,  
     Real -> False, 
     LesHouches -> FD  (* auto generated Les Houches entry *), 
     LaTeX -> "fD"  (* auto generated LaTeX name *), 
     OutputName -> fd  (* auto generated Output name *)}}, 

{fE,{Form -> Hermitian, 
     Real -> False, 
     LesHouches -> FE  (* auto generated Les Houches entry *), 
     LaTeX -> "fE"  (* auto generated LaTeX name *), 
     OutputName -> fe  (* auto generated Output name *)}}, 

{fU,{Form -> Hermitian,  
     Real -> False, 
     LesHouches -> FU  (* auto generated Les Houches entry *), 
     LaTeX -> "fU"  (* auto generated LaTeX name *), 
     OutputName -> fu  (* auto generated Output name *)}}, 

{lam,{ 
     Real -> True, 
     LesHouches -> {LRLR,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "lam"  (* auto generated LaTeX name *), 
     OutputName -> lam  (* auto generated Output name *)}}, 

{mudL2,{ 
     Real -> False, 
     LesHouches -> {LRLR,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{{ud}_L}"  (* auto generated LaTeX name *), 
     OutputName -> mudl2  (* auto generated Output name *)}}, 

{mudR2,{ 
     Real -> False, 
     LesHouches -> {LRLR,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "m^2_{{ud}_R}"  (* auto generated LaTeX name *), 
     OutputName -> mudr2  (* auto generated Output name *)}}, 

{muD,{ 
     Real -> False, 
     LesHouches -> {LRLR,20}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\mu}_{D}"  (* auto generated LaTeX name *), 
     OutputName -> mud  (* auto generated Output name *)}}, 

{muE,{ 
     Real -> False, 
     LesHouches -> {LRLR,22}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\mu}_{E}"  (* auto generated LaTeX name *), 
     OutputName -> mue  (* auto generated Output name *)}}, 

{muU,{ 
     Real -> False, 
     LesHouches -> {LRLR,24}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\mu}_{U}"  (* auto generated LaTeX name *), 
     OutputName -> muu  (* auto generated Output name *)}}, 

{etaLL,{ 
     Real -> True, 
     LesHouches -> {LRLR,26}  (* auto generated Les Houches entry *), 
     LaTeX -> "{{\\eta}_L}_L"  (* auto generated LaTeX name *), 
     OutputName -> etall  (* auto generated Output name *)}}, 

{lam2L,{ 
     Real -> False, 
     LesHouches -> {LRLR,28}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lam2}_L"  (* auto generated LaTeX name *), 
     OutputName -> lam2l  (* auto generated Output name *)}}, 

{lamLR,{ 
     Real -> False, 
     LesHouches -> {LRLR,30}  (* auto generated Les Houches entry *), 
     LaTeX -> "{{lam}_L}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamlr  (* auto generated Output name *)}}, 

{etaLR,{ 
     Real -> False, 
     LesHouches -> {LRLR,32}  (* auto generated Les Houches entry *), 
     LaTeX -> "{{\\eta}_L}_R"  (* auto generated LaTeX name *), 
     OutputName -> etalr  (* auto generated Output name *)}}, 

{eLL1,{ 
     Real -> False, 
     LesHouches -> {LRLR,33}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\eta_{LL1}}"  (* auto generated LaTeX name *), 
     OutputName -> eLL1  (* auto generated Output name *)}},      
 
{eLL2,{ 
     Real -> False, 
     LesHouches -> {LRLR,34}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\eta_{LL2}}"  (* auto generated LaTeX name *), 
     OutputName -> eLL2  (* auto generated Output name *)}},       
 
{eRR1,{ 
     Real -> False, 
     LesHouches -> {LRLR,35}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\eta_{RR1}}"  (* auto generated LaTeX name *), 
     OutputName -> eRR1  (* auto generated Output name *)}},      
 
{eRR2,{ 
     Real -> False, 
     LesHouches -> {LRLR,36}  (* auto generated Les Houches entry *), 
     LaTeX -> "{\\eta_{RR2}}"  (* auto generated LaTeX name *), 
     OutputName -> eRR2  (* auto generated Output name *)}},      
 
 
{etaRL,{ 
     Real -> False, 
     LesHouches -> {LRLR,37}  (* auto generated Les Houches entry *), 
     LaTeX -> "{{\\eta}_R}_L"  (* auto generated LaTeX name *), 
     OutputName -> etarl  (* auto generated Output name *)}}, 

     
     
{etaRR,{ 
     Real -> False, 
     LesHouches -> {LRLR,38}  (* auto generated Les Houches entry *), 
     LaTeX -> "{{\\eta}_R}_R"  (* auto generated LaTeX name *), 
     OutputName -> etarr  (* auto generated Output name *)}}, 

{lam2R,{ 
     Real -> False, 
     LesHouches -> {LRLR,39}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lam2}_R"  (* auto generated LaTeX name *), 
     OutputName -> lam2r  (* auto generated Output name *)}}, 

{lamDdL,{ 
     Real -> False, 
     LesHouches -> {LRLR,40}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamDd}_L"  (* auto generated LaTeX name *), 
     OutputName -> lamddl  (* auto generated Output name *)}}, 

{lamDdR,{ 
     Real -> False, 
     LesHouches -> {LRLR,42}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamDd}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamddr  (* auto generated Output name *)}}, 

{lamDL,{ 
     Real -> False, 
     LesHouches -> {LRLR,44}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamD}_L"  (* auto generated LaTeX name *), 
     OutputName -> lamdl  (* auto generated Output name *)}}, 

{lamDR,{ 
     Real -> False, 
     LesHouches -> {LRLR,46}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamD}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamdr  (* auto generated Output name *)}}, 

{lamDE,{ 
     Real -> False, 
     LesHouches -> {LRLR,47}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamDE"  (* auto generated LaTeX name *), 
     OutputName -> lamde  (* auto generated Output name *)}},   
     
{lamDD,{ 
     Real -> False, 
     LesHouches -> {LRLR,48}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamDD"  (* auto generated LaTeX name *), 
     OutputName -> lamdd  (* auto generated Output name *)}}, 

{lamDU,{ 
     Real -> False, 
     LesHouches -> {LRLR,49}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamDU"  (* auto generated LaTeX name *), 
     OutputName -> lamdu  (* auto generated Output name *)}},      
     
{lamEdL,{ 
     Real -> False, 
     LesHouches -> {LRLR,50}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamEd}_L"  (* auto generated LaTeX name *), 
     OutputName -> lamedl  (* auto generated Output name *)}}, 

{lamEdR,{ 
     Real -> False, 
     LesHouches -> {LRLR,52}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamEd}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamedr  (* auto generated Output name *)}}, 

{lamEL,{ 
     Real -> False, 
     LesHouches -> {LRLR,54}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamE}_L"  (* auto generated LaTeX name *), 
     OutputName -> lamel  (* auto generated Output name *)}}, 

{lamER,{ 
     Real -> False, 
     LesHouches -> {LRLR,56}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamE}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamer  (* auto generated Output name *)}}, 

{lamEE,{ 
     Real -> False, 
     LesHouches -> {LRLR,58}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamEE"  (* auto generated LaTeX name *), 
     OutputName -> lamee  (* auto generated Output name *)}}, 

{lamUdL,{ 
     Real -> False, 
     LesHouches -> {LRLR,60}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamUd}_L"  (* auto generated LaTeX name *), 
     OutputName -> lamudl  (* auto generated Output name *)}}, 

{lamUdR,{ 
     Real -> False, 
     LesHouches -> {LRLR,62}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamUd}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamudr  (* auto generated Output name *)}}, 

{lamUL,{ 
     Real -> False, 
     LesHouches -> {LRLR,64}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamU}_L"  (* auto generated LaTeX name *), 
     OutputName -> lamul  (* auto generated Output name *)}}, 

{lamUR,{ 
     Real -> False, 
     LesHouches -> {LRLR,66}  (* auto generated Les Houches entry *), 
     LaTeX -> "{lamU}_R"  (* auto generated LaTeX name *), 
     OutputName -> lamur  (* auto generated Output name *)}}, 

{lamUU,{ 
     Real -> False, 
     LesHouches -> {LRLR,68}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamUU"  (* auto generated LaTeX name *), 
     OutputName -> lamuu  (* auto generated Output name *)}}, 
     
{lamUE,{ 
     Real -> False, 
     LesHouches -> {LRLR,69}  (* auto generated Les Houches entry *), 
     LaTeX -> "lamUE"  (* auto generated LaTeX name *), 
     OutputName -> lamue  (* auto generated Output name *)}}     
} 
