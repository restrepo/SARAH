(* SARAH generated template for parameters.m file for darkLR*)
(* File created at 20:11 on 15.1.2016  *)
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

{alp,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 2},
     LaTeX -> "alp",
     OutputName -> alp}},

{xiR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 3},
     LaTeX -> "\\xi_R",
     OutputName -> xiR}},



{xiLR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 5},
     LaTeX -> "\\xi_{LR}",
     OutputName -> xiLR}},

{alp1,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 14},
     LaTeX -> "\\alpha_1",
     OutputName -> ALP1}},

{alp2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 15},
     LaTeX -> "\\alpha_2",
     OutputName -> ALP2}},

{alp2P,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 16},
     LaTeX -> "\\alpha_2'",
     OutputName -> AL2P}},


{alp3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 20},
     LaTeX -> "\\alpha_3",
     OutputName -> ALP3}},

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

{beta2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 24},
     LaTeX -> "\\beta_2",
     OutputName -> BETA2}},

{betaL,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 10},
     LaTeX -> "{\\beta}_L",
     OutputName -> betl}},

{betaR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 14},
     LaTeX -> "{\\beta}_R",
     OutputName -> betr}},

{e,{
     Description -> "electric charge",
     Dependence -> None,
     DependenceNum -> 2*Sqrt[aEWinv^(-1)]*Sqrt[Pi],
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LaTeX -> "e",
     OutputName -> el}},

{eRR1,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 24},
     LaTeX -> "eRR1",
     OutputName -> err1}},

{eRR2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 18},
     LaTeX -> "eRR2",
     OutputName -> err2}},

{etaLL,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 17},
     LaTeX -> "{{\\eta}_L}_L",
     OutputName -> etall}},

{etaLR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 16},
     LaTeX -> "{{\\eta}_L}_R",
     OutputName -> etalr}},

{etaRL,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 20},
     LaTeX -> "{{\\eta}_R}_L",
     OutputName -> etarl}},

{etaRR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 22},
     LaTeX -> "{{\\eta}_R}_R",
     OutputName -> etarr}},

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
     Description -> "LeftR-Coupling",  (* for explicit relations, choose the following *)
     Dependence -> None,               (* remove that line *)
     DependenceNum -> None,            (* e/(Sin[ThetaBL]*Cos[ThetaW]) *)
     DependenceOptional -> None,       (* e/(Sin[ThetaBL]*Cos[ThetaW]) *)
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {GAUGE, 5},
     LaTeX -> "g_R",
     OutputName -> gR}},

{lam1,{
     Description -> "SM Higgs Selfcouplings",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 1},
     LaTeX -> "\\lambda",
     OutputName -> LAM1}},

{lam3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 4},
     LaTeX -> "\\lambda_3",
     OutputName -> LAM3}},

{lamL,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 6},
     LaTeX -> "{lam}_L",
     OutputName -> laml}},

{lamLR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 8},
     LaTeX -> "{{lam}_L}_R",
     OutputName -> lamlr}},

{lamR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 12},
     LaTeX -> "{lam}_R",
     OutputName -> lamr}},

{mu12,{
     Description -> "SM Mu Parameter",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {MUPARS, 1},
     LaTeX -> "\\mu",
     OutputName -> MU12}},

{mudL2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {MUPARS, 2},
     LaTeX -> "m^2_{{ud}_L}",
     OutputName -> mudl2}},

{mudR2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {MUPARS, 4},
     LaTeX -> "m^2_{{ud}_R}",
     OutputName -> mudr2}},

{muL2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {MUPARS, 6},
     LaTeX -> "m^2_{{u}_L}",
     OutputName -> mul2}},

{muR2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {MUPARS, 8},
     LaTeX -> "m^2_{{u}_R}",
     OutputName -> mur2}},

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

{rho1,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 7},
     LaTeX -> "\\rho_1",
     OutputName -> RHO1}},

{rho2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {LRINPUT, 9},
     LaTeX -> "\\rho_2",
     OutputName -> RHO2}},

{rho3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {DARKLR, 4},
     LaTeX -> "{\\rho}_{3}",
     OutputName -> rh3}},

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

{v1,{ Description -> "Down-VEV",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {VEV, 1},
     LaTeX -> "v_1",
     OutputName -> v1}},

{v2,{ Description -> "Up-VEV",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {VEV, 2},
     LaTeX -> "v_2",
     OutputName -> v2}},

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
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 30},
     LaTeX -> "{v_{H}}_L",
     OutputName -> vhl}},

{vHR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 32},
     LaTeX -> "{v_{H}}_R",
     OutputName -> vhr}},

{vtL,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 26},
     LaTeX -> "{v_{t}}_L",
     OutputName -> vtl}},

{vtR,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {DARKLR, 28},
     LaTeX -> "{v_{t}}_R",
     OutputName -> vtr}},

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

{YDL,{
     Description -> "DeltaL-lLs",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YDL,
     LaTeX -> "Y_{DL}",
     OutputName -> YDL}},

{YDR,{
     Description -> "DeltaR-lRs",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YDR,
     LaTeX -> "Y_{DR}",
     OutputName -> YDR}},

{YL1,{
     Description -> "Lepton-Doublet Yukawa One",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YL1,
     LaTeX -> "Y_{L1}",
     OutputName -> YL1}},

{YQ1,{
     Description -> "Quark-Doublet Yukawa One",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YQ1,
     LaTeX -> "Y_{Q1}",
     OutputName -> YQ1}},

{YQ2,{
     Description -> "Quark-Doublet Yukawa Two",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YQ2,
     LaTeX -> "Y_{Q2}",
     OutputName -> YQ2}},

{YQ3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YQ3,
     LaTeX -> "YQ3",
     OutputName -> yq3}},

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
     LesHouches -> {DARKLR, 34},
     LaTeX -> "M_{VWLm}",
     OutputName -> Mvwlm}}
}
