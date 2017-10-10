(* SARAH generated template for parameters.m file for 331v2*)
(* File created at 13:09 on 20.1.2016  *)
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

{ftri,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {POTENTIAL331, 5},
     LaTeX -> "f",
     OutputName -> fcoup}},

{g1,{
     Description -> "X-Coupling",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
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

{l12,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {POTENTIAL331, 11},
     LaTeX -> "\\lambda_{12}",
     OutputName -> l12}},

{l13,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {POTENTIAL331, 12},
     LaTeX -> "\\lambda_{13}",
     OutputName -> l13}},

{l23,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {POTENTIAL331, 13},
     LaTeX -> "\\lambda_{23}",
     OutputName -> l23}},

{mu12,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {POTENTIAL331, 1},
     LaTeX -> "\\mu_1^2",
     OutputName -> mu12}},

{mu22,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {POTENTIAL331, 2},
     LaTeX -> "\\mu_2^2",
     OutputName -> mu22}},

{mu32,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> True,
     LesHouches -> {POTENTIAL331, 3},
     LaTeX -> "\\mu_3^2",
     OutputName -> mu32}},

{l1,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {POTENTIAL331, 6},
     LaTeX -> "\\lambda_{1}",
     OutputName -> l1}},

{l2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {POTENTIAL331, 7},
     LaTeX -> "\\lambda_{2}",
     OutputName -> l2}},

{l3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> {POTENTIAL331, 8},
     LaTeX -> "\\lambda_{3}",
     OutputName -> l3}},

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

{yd1,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YD1,
     LaTeX -> "y^d_1",
     OutputName -> yd1}},

{yd2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YD2,
     LaTeX -> "y^d_2",
     OutputName -> yd2}},

{yd3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YD3,
     LaTeX -> "\\tilde{y}^d",
     OutputName -> yd3}},

{yl,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YL,
     LaTeX -> "y_\\ell",
     OutputName -> yl}},

{yu1,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YU1,
     LaTeX -> "y^u_1",
     OutputName -> yu1}},

{yu2,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YU2,
     LaTeX -> "y^u_2",
     OutputName -> yu2}},

{yu3,{
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> YU3,
     LaTeX -> "\\tilde{y}^u",
     OutputName -> yu3}},

{ZA,{
     Description -> "Pseudo-Scalar-Mixing-Matrix",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> ZAMIX,
     LaTeX -> "Z^{A}",
     OutputName -> ZA}},

{ZH,{
     Description -> "Scalar-Mixing-Matrix",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> ZHMIX,
     LaTeX -> "Z^{H}",
     OutputName -> ZH}},

{ZP,{
     Description -> "Charged-Mixing-Matrix",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> ZPMIX,
     LaTeX -> "Z^{\\pm}",
     OutputName -> ZP}},

{ZW,{
     Description -> "Charged gauge boson Mixing Matrix",
     Dependence -> (1 / Sqrt[2]) {{1, 1, 0, 0},
                                  {-\[ImaginaryI], \[ImaginaryI], 0, 0},
                                  {0, 0, -1, -1},
                                  {0, 0, \[ImaginaryI], -\[ImaginaryI]}},
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> ZWMIX,
     LaTeX -> "Z^{W}",
     OutputName -> ZW}},

{ZZ,{
     Description -> "Neutral gauge boson Mixing Matrix",
     Dependence -> None,
     DependenceNum -> None,
     DependenceOptional -> None,
     DependenceSPheno -> None,
     Real -> False,
     LesHouches -> ZZMIX,
     LaTeX -> "Z^{Z}",
     OutputName -> ZZ}},



(*  ----------- Additional parameters in the model ---------- *)

{yE,{
     Real -> False,
     LesHouches -> YE  (* auto generated Les Houches entry *),
     LaTeX -> "Y_{E}"  (* auto generated LaTeX name *),
     OutputName -> ye  (* auto generated Output name *)}},

{yJ1,{
     Real -> False,
     LesHouches -> YJ1  (* auto generated Les Houches entry *),
     LaTeX -> "Y_{J1}"  (* auto generated LaTeX name *),
     OutputName -> yj1  (* auto generated Output name *)}},

{yJ2,{
     Real -> False,
     LesHouches -> YJ2  (* auto generated Les Houches entry *),
     LaTeX -> "Y_{J2}"  (* auto generated LaTeX name *),
     OutputName -> yj2  (* auto generated Output name *)}},

{yJ3,{
     Real -> False,
     LesHouches -> YJ3  (* auto generated Les Houches entry *),
     LaTeX -> "Y_{J3}"  (* auto generated LaTeX name *),
     OutputName -> yj3  (* auto generated Output name *)}},

{l23t,{
     Real -> False,
     LesHouches -> {POTENTIAL331, 14},
     LaTeX -> "\\tilde \\lambda_{23}"  (* auto generated LaTeX name *),
     OutputName -> l23t  (* auto generated Output name *)}},

{l13t,{
     Real -> False,
     LesHouches -> {POTENTIAL331, 15},
     LaTeX -> "\\tilde \\lambda_{13}"  (* auto generated LaTeX name *),
     OutputName -> l13t  (* auto generated Output name *)}},

{l12t,{
     Real -> False,
     LesHouches -> {POTENTIAL331, 16},
     LaTeX -> "\\tilde \\lambda_{12}"  (* auto generated LaTeX name *),
     OutputName -> l12t  (* auto generated Output name *)}},

{v1,{
     Real -> True    (* Assuming new VEVs to be real *),
     LesHouches -> {POTENTIAL331, 17},
     LaTeX -> "v_{1}"  (* auto generated LaTeX name *),
     OutputName -> v1  (* auto generated Output name *)}},

{v2,{
     Real -> True    (* Assuming new VEVs to be real *),
     LesHouches -> {POTENTIAL331, 18},
     LaTeX -> "v_{2}"  (* auto generated LaTeX name *),
     OutputName -> v2  (* auto generated Output name *)}},

{v3,{
     Real -> True    (* Assuming new VEVs to be real *),
     LesHouches -> {POTENTIAL331, 19},
     LaTeX -> "v_{3}"  (* auto generated LaTeX name *),
     OutputName -> v3  (* auto generated Output name *)}},

{ZX,{
     Real -> False,
     Dependence -> 1/Sqrt[2] {{1, 1},
                   {\[ImaginaryI],-\[ImaginaryI]}},
     LesHouches -> ZX  (* auto generated Les Houches entry *),
     LaTeX -> "Z_X"  (* auto generated LaTeX name *),
     OutputName -> zx  (* auto generated Output name *)}},

{PhaseT,{
     Real -> False,
     LesHouches -> PHASET,
     LaTeX -> "\\phi_T"  (* auto generated LaTeX name *),
     OutputName -> phaset  (* auto generated Output name *)}},

{ZY,{
     Real -> False,
     LesHouches -> ZY  (* auto generated Les Houches entry *),
     LaTeX -> "Z_Y"  (* auto generated LaTeX name *),
     OutputName -> zy  (* auto generated Output name *)}},

{VD,{
     Real -> False,
     LesHouches -> VD  (* auto generated Les Houches entry *),
     LaTeX -> "V_D"  (* auto generated LaTeX name *),
     OutputName -> vd  (* auto generated Output name *)}},

{UD,{
     Real -> False,
     LesHouches -> UD  (* auto generated Les Houches entry *),
     LaTeX -> "U_D"  (* auto generated LaTeX name *),
     OutputName -> ud  (* auto generated Output name *)}},

{VE,{
     Real -> False,
     LesHouches -> VE  (* auto generated Les Houches entry *),
     LaTeX -> "V_E"  (* auto generated LaTeX name *),
     OutputName -> ve  (* auto generated Output name *)}},

{UE,{
     Real -> False,
     LesHouches -> UE  (* auto generated Les Houches entry *),
     LaTeX -> "U_E"  (* auto generated LaTeX name *),
     OutputName -> ue  (* auto generated Output name *)}},

{Mass[VWp],{
     Real -> False,
     LaTeX -> "M_{VWp}"  (* auto generated LaTeX name *),
     OutputName -> Mvwp  (* auto generated Output name *)}}
}
