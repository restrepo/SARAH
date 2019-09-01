$NameUV="HighScaleSUSYlowMA";

$ParametrisationUV = {
   vd -> epsUV,
   vu -> epsUV,
   Yu[a_,b_] :> Delta[3,b] Delta[a,3] Yu[a,b],
   Yd[a_,b_] :> Delta[3,b] Delta[a,3] Yd[a,b],
   Ye[a_,b_] :> Delta[3,b] Delta[a,3] Ye[a,b],
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
   B[\[Mu]] -> epsUV^2,
   \[Mu]->MuSUSY
   };
   
$SimplificationsMatching={
  conj[x_] -> x
};
   
$AssumptionsMatching={
 TanBeta>0, 
 m0>0,
 m12>0,
 MuSUSY>0
}

$ExcludeFieldsMatching={ 
Chi,Cha,hh,Ah,Hpm
};

$SolveTadpolesUV = {mHd2,mHu2};

$MatchingConditions = {
   Lambda1 -> -1/6 hh[1].hh[1].hh[1].hh[1],
   Lambda2 -> -1/6 hh[2].hh[2].hh[2].hh[2],
   Lambda3 -> -hh[1].hh[1].Hpm[2].conj[Hpm[2]],
   Lambda4 -> hh[1].hh[2].Hpm[2].conj[Hpm[1]] + I*hh[1].Ah[2].Hpm[1].conj[Hpm[2]],
   Lambda5 -> hh[1].hh[2].Hpm[2].conj[Hpm[1]] - I*hh[1].Ah[2].Hpm[1].conj[Hpm[2]],
   Lambda6 -> -hh[1].hh[2].Hpm[1].conj[Hpm[1]],
   Lambda7 -> -hh[1].hh[2].Hpm[2].conj[Hpm[2]]
   };

(* ----------------------------------------- *)   
(* LaTeX Output                             *)
(* ----------------------------------------- *)     
   
$EFTcouplingsToTeX=True;
$AdditionalTeXsymbols={
 {Lambda1, "\\lambda_1"},
 {Lambda2, "\\lambda_2"},
 {Lambda3, "\\lambda_3"},
 {Lambda4, "\\lambda_4"},
 {Lambda5, "\\lambda_5"},
 {TanBeta, "t_{\\beta}"},
 {m0, "m_0"},
 {m12, "M_{1/2}"},
 {MA, "M_A"},  
 {MuSUSY, "\\mu"},
 {Azero, "A_0"}
};



(* ----------------------------------------- *)   
(* THDM Output                             *)
(* ----------------------------------------- *)

$ExportToSPheno=True;
$SPhenoEFTmodel="THDM-IInoZ2";
$SPhenoMINPAR={
 {1, m0},
 {2, mGauginos},
 {3, TanBeta},
 {4, MuSUSY},
 {5, Azero},
 {6, MA}};
 
$SPhenoBoundaryHighScale={};
$SPhenoBoundaryRenScale={
 {M12, -MA^2 TanBeta/(1+TanBeta^2)}
 };
$SPhenoTadpoles={M112,M222};
$SPhenoMatchingScale=m0;
$SPhenoRenScale=MA^2;
$SPhenoMatchingEWSB=Default[THDMII];


