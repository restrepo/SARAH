$NameUV="SimpleHighScaleSUSY";

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
   T[Yu][a__] :> Delta[a] MSUSY Yu[a],
   T[Yd][a__] :> Delta[a] MSUSY Yd[a],
   T[Ye][a__] :> Delta[a] MSUSY Ye[a],
   mq2[a__] :> Delta[a] MSUSY^2,
   mu2[a__] :> Delta[a] MSUSY^2,
   md2[a__] :> Delta[a] MSUSY^2,
   me2[a__] :> Delta[a] MSUSY^2,
   ml2[a__] :> Delta[a] MSUSY^2,
   conj[x_] -> x,
   MassB->MSUSY,
   MassWB->MSUSY,
   MassG->MSUSY,
   B[\[Mu]]->MSUSY^2 TanBeta/(1+TanBeta^2),
   \[Mu]->MSUSY
   };
   
$SimplificationsMatching={
  UVscaleQ->MSUSY
};
   
$AssumptionsMatching={
 TanBeta>0, 
 MSUSY>0
}

$SolveTadpolesUV = {mHd2, mHu2};

$MatchingConditions = {
   \[Lambda] -> -1/3 hh[1].hh[1].hh[1].hh[1]
   };
   
   
(* ----------------------------------------- *)   
(* LaTeX Output                             *)
(* ----------------------------------------- *)   
   
$EFTcouplingsToTeX=True;
$AdditionalTeXsymbols={
 {\[Lambda], "\\lambda"},
 {TanBeta, "t_{\\beta}"},
 {MSUSY, "M_{\\text{SUSY}}"},
 {g1Q, "g_1^{\\rm MS}"},
 {g2Q, "g_2^{\\rm MS}"},
 {g23, "g_3^{\\rm MS}"},
 {YuQ[3,3], "Y_t^{\\rm MS}"},
 {YdQ[3,3], "Y_b^{\\rm MS}"}, 
 {YeQ[3,3], "Y_\\tau^{\\rm MS}"}
};


(* ----------------------------------------- *)   
(* SPheno Output                             *)
(* ----------------------------------------- *)

$ExportToSPheno=True;
$SPhenoEFTmodel="SM";
$SPhenoMINPAR={
 {1, MSUSY},
 {2, TanBeta}};
$SPhenoBoundaryHighScale={};
$SPhenoTadpoles={mu2};
$SPhenoMatchingScale={MSUSY};
$SPhenoRenScale=173.;
$SPhenoMatchingEWSB=Default[OHDM];
