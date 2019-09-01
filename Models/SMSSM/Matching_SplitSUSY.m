(* analogous to SplitSUSY/NMSSM/SPheno.m but flavour diagonal *)
$NameUV="SimpleSplitNMSSM";

$ParametrisationUV = {
   vd -> v Cos[ArcTan[TanBeta]],
   vu -> v Sin[ArcTan[TanBeta]],
   v -> epsUV,
   vS -> epsUV,
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
   conj[x_] -> x,
   MassB->epsUV,
   MassWB->epsUV,
   MassG->epsUV,
   B[MS]->epsUV^2,
   MS->epsUV,
   L[L1]->epsUV^3,
   L1->epsUV^2,
   B[\[Mu]]->MAinput^2 TanBeta/(1+TanBeta^2),
   \[Mu] -> epsUV,
   \[Lambda] -> LambdaNMSSM, (*to avoid confusion with SM parameter*)
   \[Kappa] -> KappaNMSSM,
   T[KappaNMSSM] -> TKappaNMSSM,
   T[LambdaNMSSM] -> TLambdaNMSSM,
   mSr2 -> mSi2
   };
   
$SimplificationsMatching={
  conj[x_] -> x,
  UVscaleQ->m0
};
   
$AssumptionsMatching={
 TanBeta>0, 
 m0>0,
 MAinput>0,
 Element[Azero, Reals],
 Element[LambdaNMSSM, Reals],
 Element[KappaNMSSM, Reals],
 Element[TLambdaNMSSM, Reals],
 Element[TKappaNMSSM, Reals]
}


$SolveTadpolesUV = {mHd2, mHu2, ms2};

(* the generation indices were carried out in the interactive mode *)
$MatchingConditions = {
    LambdaH   -> -1/3 hh[2].hh[2].hh[2].hh[2],
    LambdaSr  -> -1/3 hh[1].hh[1].hh[1].hh[1],
    LambdaSHr -> -hh[1].hh[1].hh[2].hh[2],
    KappaSr   -> -1/(3 Sqrt[2]) hh[1].hh[1].hh[1],
    KappaSHr  -> -1/Sqrt[2] hh[1].hh[2].hh[2]
};
   
   
(* ----------------------------------------- *)   
(* LaTeX Output                              *)
(* ----------------------------------------- *)
   
$EFTcouplingsToTeX=True;
$AdditionalTeXsymbols={
 {LambdaH, "\\lambda_H"},
 {LambdaSr, "\\lambda_{Sr}"},
 {LambdaSi, "\\lambda_{Si}"},
 {LambdaSri, "\\lambda_{Sri}"},
 {LambdaSHr, "\\lambda_{SHr}"},
 {LambdaSHi, "\\lambda_{SHi}"},
 {KappaSr, "\\kappa_{Sr}"},
 {KappaSri, "\\kappa_{Sri}"},
 {KappaSHr, "\\kappa_{SHr}"},
 {LambdaNMSSM, "\\lambda"},
 {KappaNMSSM, "\\kappa"},
 {TLambdaNMSSM, "T_{\\lambda}"},
 {TKappaNMSSM, "T_{\\kappa}"},
 {TanBeta, "t_{\\beta}"},
 {Azero, "A_0"},   
 {m0, "m_0"},
 {MAinput, "m_A"}   
};

(* ----------------------------------------- *)   
(* SPheno Output                             *)
(* ----------------------------------------- *)

$ExportToSPheno=True;
$SPhenoEFTmodel="SplitSUSY/NMSSM";
$SPhenoMINPAR={
  {1,  BinoNMSSM},
  {2,  WinoNMSSM},
  {3,  GluinoNMSSM},
  {4,  TanBeta},
  {5,  LambdaNMSSM},
  {6,  KappaNMSSM},
  {7,  TLambdaNMSSM},
  {8,  TKappaNMSSM},
  {9,  vSNMSSM},
  {10, m0},
  {11, Azero},
  {12, MAinput}
}
$SPhenoBoundaryHighScale={
 {LambdaSi,  LambdaSr},
 {LambdaSri, LambdaSr},
 {LambdaSHi, LambdaSHr},
 {KappaSri,  KappaSr},
 {MG,        GluinoNMSSM},
 {MW,        WinoNMSSM},
 {MB,        BinoNMSSM},
 {mSi2,      mSr2},
 {Ysr,       KappaNMSSM},
 {Ysi,       Ysr},
 {Ysu,       LambdaNMSSM Cos[ArcTan[TanBeta]]},
 {Ysd,       LambdaNMSSM Sin[ArcTan[TanBeta]]},
 {Ysrud,     LambdaNMSSM},
 {Ysiud,     Ysrud},
 {g1u,       g1 Sin[ArcTan[TanBeta]]   },
 {g2u,       g2 Sin[ArcTan[TanBeta]]   }, 
 {g1d,       g1 Cos[ArcTan[TanBeta]]   },
 {g2d,       g2 Cos[ArcTan[TanBeta]]   }  
};
$SPhenoBoundaryRenScale={{vS,vSNMSSM}};
$SPhenoTadpoles={m2,mSr2};
$SPhenoMatchingScale=m0;
$SPhenoRenScale=v^2;
$SPhenoMatchingEWSB=Default[OHDM];   
