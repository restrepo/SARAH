$NameUV="SplitSUSY";

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
   mq2[a__] :> Delta[a] MSUSY^2,
   mu2[a__] :> Delta[a] MSUSY^2,
   md2[a__] :> Delta[a] MSUSY^2,
   me2[a__] :> Delta[a] MSUSY^2,
   ml2[a__] :> Delta[a] MSUSY^2,
   conj[x_] -> x,
   MassB->epsUV,
   MassWB->epsUV,
   MassG->epsUV,
   B[\[Mu]]->MA^2 TanBeta/(1+TanBeta^2),
   \[Mu]->epsUV
   };
   
$SimplificationsMatching={
  conj[x_] -> x,
  UVscaleQ->MSUSY
};
   
$AssumptionsMatching={
 TanBeta>0, 
 MSUSY>0,
 MA>0
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
 {MA, "M_A"},  
 {Azero, "A_0"},   
 {MSUSY, "M_{\\text{SUSY}}"}
};

(* ----------------------------------------- *)   
(* SPheno Output                             *)
(* ----------------------------------------- *)

$ExportToSPheno=True;
$SPhenoEFTmodel="SplitSUSY_MSSM";
$SPhenoMINPAR={
 {1, MSUSY},
 {2, M12},
 {3, TanBeta},
 {4, MuInput},
 {5, Azero},
 {6, MA}};
$SPhenoBoundaryHighScale={
 {MG,M12},
 {MW,M12},
 {MB,M12},
 {\[Mu],MuInput},
 {g1u,Sqrt[3/5] g1 Sin[ArcTan[TanBeta]]   },
 {g2u,g2 Sin[ArcTan[TanBeta]]   }, 
 {g1d,Sqrt[3/5] g1 Cos[ArcTan[TanBeta]]   },
 {g2d,g2 Cos[ArcTan[TanBeta]]   }  
};
$SPhenoTadpoles={mu2};
$SPhenoMatchingScale=MSUSY;
$SPhenoRenScale=MA^2;
$SPhenoMatchingEWSB=Default[OHDM];   

