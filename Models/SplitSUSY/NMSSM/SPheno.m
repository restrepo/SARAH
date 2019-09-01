MINPAR={
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
};

RenormalizationScaleFirstGuess = 100^2;
RenormalizationScale = v^2;

RealParameters = {TanBeta,m0,MAinput,vSNMSSM}; 


UseParameterAsGUTscale = {m0};

BoundaryHighScale={
 {\[Lambda], LambdaNMSSM},
 {\[Kappa], KappaNMSSM}, 
 {T[\[Lambda]], TLambdaNMSSM},
 {T[\[Kappa]], TKappaNMSSM}, 
 {T[Ye], Azero*Ye},
 {T[Yd], Azero*Yd},
 {T[Yu], Azero*Yu},
 {mq2, DIAGONAL m0^2},
 {ml2, DIAGONAL m0^2},
 {md2, DIAGONAL m0^2},
 {mu2, DIAGONAL m0^2},
 {me2, DIAGONAL m0^2},
 {MassB,  BinoNMSSM},
 {MassWB, WinoNMSSM}, 
 {MassG,  GluinoNMSSM}
};

BoundaryRenScale={
  {vS,        vSNMSSM}
}


ParametersToSolveTadpoles = {m2,mSr2};

DEFINITION[MatchingConditions]=Default[OHDM];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues ={m0 -> 10^6, Azero -> 10^3, MAinput->10^6, TanBeta->2};


(*---------------------------------------------------*)
(* information for matching to MSSM *)
(*---------------------------------------------------*)

MatchingToModel= {"SMSSM"};
MatchingScale = {m0};

IncludeParticlesInThresholds={
 {hh,Ah,Hpm,Su,Sd,Se,Sv}
};


  
AssumptionsMatchingScale={
 {
  {vd,epsUV*Cos[ArcTan[TanBeta]]}, 
  {vu,epsUV*Sin[ArcTan[TanBeta]]},
  {vS,epsUV},
  {B[MS], epsUV^2},
  {MS, epsUV},
  {L[L1], epsUV^3 },
  {L1, epsUV^2},
  {\[Mu], epsUV}
 }
};


BoundaryMatchingScaleUp={
 {
 {Yu, Sqrt[1+TanBeta^2]/TanBeta*Yu},
 {Yd, Sqrt[1+TanBeta^2]*Yd},
 {Ye, Sqrt[1+TanBeta^2]*Ye},
 {B[\[Mu]], MAinput^2*TanBeta/(1+TanBeta^2)}
}
};

BoundaryMatchingScaleDown={
 {
 {MG,        MassG },
 {MW,        MassWB},
 {MB,        MassB}, 
 {mSi2,      mSr2},
 
 (* new Yukawa couplings *)
 {Ysr,   -1/Sqrt[2]*(EFTcoupNLO[Chi[FsR].Chi[FsR].hh[phiS]][PL])},
 {Ysi,   Ysr},
 {Ysrud, Sqrt[2]*(EFTcoupNLO[Chi[FHu0].Chi[FHd0].hh[phiS]][PL]/(ZN[FHu0,4] ZN[FHd0,3]))},
 {Ysiud, Ysrud},
 {Ysu,   Sqrt[2]*(EFTcoupNLO[Chi[FHu0].Chi[FsR].hh[phiu]][PL]/(ZN[FHu0,4] ZN[FsR,5]))},
 {Ysd,   Sqrt[2]*(EFTcoupNLO[Chi[FHd0].Chi[FsR].hh[phiu]][PL]/(ZN[FHd0,3] ZN[FsR,5]))}, 
 {g1u,   -2*(EFTcoupNLO[Chi[fB].Chi[FHu0].hh[phiu]][PL]/(ZN[fB,1] ZN[FHu0,4]))},
 {g2u,   2*(EFTcoupNLO[Chi[fW0].Chi[FHu0].hh[phiu]][PL]/(ZN[fW0,2] ZN[FHu0,4]))}, 
 {g1d,   2*(EFTcoupNLO[Chi[fB].Chi[FHd0].hh[phiu]][PL]/(ZN[fB,1] ZN[FHd0,3]))},
 {g2d,   -2*(EFTcoupNLO[Chi[fW0].Chi[FHd0].hh[phiu]][PL]/(ZN[fW0,2] ZN[FHd0,3]))},
 
  (* new scalar couplings *)
 {LambdaH,   - 1/3 EFTcoupNLO[hh[phiu].hh[phiu].hh[phiu].hh[phiu]]},
 {LambdaSr,  - 1/3 EFTcoupNLO[hh[phiS].hh[phiS].hh[phiS].hh[phiS]]},
 {LambdaSi,  LambdaSr},
 {LambdaSri, LambdaSr},
 {LambdaSHr, - EFTcoupNLO[hh[phiu].hh[phiu].hh[phiS].hh[phiS]]},
 {LambdaSHi, LambdaSHr},
 {KappaSr,   - 1/(3 Sqrt[2]) EFTcoupNLO[hh[phiS].hh[phiS].hh[phiS]]},
 {KappaSri,  KappaSr},
 {KappaSHr,  - 1/Sqrt[2] EFTcoupNLO[hh[phiS].hh[phiu].hh[phiu]]    }
 }
};

ParametersToSolveTadpoleMatchingScale={
 {mHd2,mHu2,ms2}
};
