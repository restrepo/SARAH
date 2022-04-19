MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {6,Bzero}};

EXTPAR = {
   {61,LambdaInput},
   {62,KappaInput},
   {63,ALambdaInput},
   {64,AKappaInput},
   {65, vSInput},
   {100,TadInput},
   {101,MSInput}};


RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles =  {\[Mu],B[\[Mu]],L[L1]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundarySUSYScale = {
{vS, vSInput},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};

DEFINITION[MatchingConditions]=Default[THDMII];


BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{ms2, m0^2},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{L1, TadInput},
{MS, MSInput},
{B[MS],Bzero*MSInput},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


DefaultInputValues = {m0 -> 1000, m12 -> 1500, TanBeta -> 10,  Azero -> -3000, Bzero->-1000, LambdaInput -> 0.1, KappaInput -> 0.6,  ALambdaInput -> 10^4,  AKappaInput -> 7000,  vSInput -> 10^4, MSInput->1000};

IncludeFineTuning = True;
FineTuningParameters={
{m0,1/2},{m12,1},{Azero,1},{Bzero,1},{\[Mu],1},{B[\[Mu]],1},
{L[L1],1},{MSInput,1},{AKappaInput,1},{ALambdaInput,1},{TadInput,1}
};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

  
