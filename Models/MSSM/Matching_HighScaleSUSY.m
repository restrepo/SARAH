$NameUV="HighScaleSUSY";

$ParametrisationUV = {
   vd -> v Cos[ArcTan[TanBeta]],
   vu -> v Sin[ArcTan[TanBeta]],
   v -> epsUV,
   g1 -> g1Q,
   g2 -> g2Q,
   g3 -> g3Q,
   Yu[a_,b_] :> Sqrt[1+TanBeta^2]/TanBeta*Delta[3,b] Delta[a,3] YuQ[a,b],
   Yd[a_,b_] :> Sqrt[1+TanBeta^2]*Delta[3,b] Delta[a,3] YdQ[a,b],
   Ye[a_,b_] :> Sqrt[1+TanBeta^2]*Delta[3,b] Delta[a,3] YeQ[a,b],
   T[Yu][a__] :> Delta[a] Azero Yu[a],
   T[Yd][a__] :> Delta[a] Azero Yd[a],
   T[Ye][a__] :> Delta[a] Azero Ye[a],
   mq2[a__] :> Delta[a] m0^2,
   mu2[a__] :> Delta[a] m0^2,
   md2[a__] :> Delta[a] m0^2,
   me2[a__] :> Delta[a] m0^2,
   ml2[a__] :> Delta[a] m0^2,
   MassB->m12,
   MassWB->m12,
   MassG->m12,
   B[\[Mu]] -> MA^2/(TanBeta + 1/TanBeta),
   \[Mu]->MuSUSY
   };
   
$SimplificationsMatching={
  conj[x_] -> x
};
   
$AssumptionsMatching={
 TanBeta>0, 
 m0>0,
 m12>0,
 MA>0,
 MuSUSY>0
}

$SolveTadpolesUV = {mHd2, mHu2};

$MatchingConditions = {
   \[Lambda] -> -1/3 hh[1].hh[1].hh[1].hh[1]
   };

(* ----------------------------------------- *)   
(* LaTeX Output                              *)
(* ----------------------------------------- *)
   
$EFTcouplingsToTeX=True;
$AdditionalTeXsymbols={
 {\[Lambda], "\\lambda"},
 {TanBeta, "t_{\\beta}"},
 {m0, "m_0"},
 {m12, "M_{1/2}"},
 {MA, "M_A"},  
 {MuSUSY, "\\mu"},
 {Azero, "A_0"},   
 {MSUSY, "M_{\\text{SUSY}}"}
};

(* ----------------------------------------- *)   
(* SPheno Output                             *)
(* ----------------------------------------- *)

$ExportToSPheno=True;
$SPhenoEFTmodel="SM";
$SPhenoMINPAR={
 {1, Azero},
 {2, m0},
 {3, m12},
 {4, MA},
 {5, MuSUSY},
 {6, TanBeta}};
$SPhenoBoundaryHighScale={};
$SPhenoTadpoles={mu2};
$SPhenoMatchingScale=m0;
$SPhenoRenScale=173.^2;
$SPhenoMatchingEWSB=Default[OHDM];

