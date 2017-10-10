
MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};


EXTPAR = {
   {61,LambdaInput},
   {63,ALambdaInput},
   {65, vSInput},
   {200, Qq},
   {201, Ql},
   {202, QHd},
   {203, QHu},
   {204, Qd},
   {205, Qu},
   {206, Qe},
   {207, Qv},
   {208, Qs}       };
       
RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

BoundarySUSYScale = {
{vS, vSInput},  
{\[Lambda], LambdaInput},
{Yv, LHInput[Yv]}
};

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{gp, g1},
{gpg1,0},
{g1gp,0},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mvR2, DIAGONAL m0^2},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MassU,m12}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

DEFINITION[MatchingConditions]=Default[THDMII];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;
 

DefaultInputValues = {m0 -> 2000, m12 -> 400, TanBeta->30,  Azero -> 2500,  LambdaInput -> 0.04, ALambdaInput -> 2800, vSInput -> 3000,\
Qq->1./(2 Sqrt[6]), Ql->1./(2 Sqrt[6]), QHd-> -1./(Sqrt[6]), QHu-> -1./(Sqrt[6]),Qe->1./(2 Sqrt[6]),Qd->1./(2 Sqrt[6]), Qu->1./(2 Sqrt[6]), Qv->1./(2 Sqrt[6]), Qs->2./(Sqrt[6])  };

  