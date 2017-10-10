MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero},
        {6,Bzero},
        {7,Lzero}};

EXTPAR = {
   {61,LambdaInput},
   {62,KappaInput},
   {63,ALambdaInput},
   {64,AKappaInput},
   {65, vSInput},
   {100,TadInput},
   {101,MSInput}};


RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles =  {\[Mu],B[\[Mu]],ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundarySUSYScale = {
{vS, vSInput}
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
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{L1, TadInput},
{L[L1], Lzero*TadInput},
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


DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta -> 20, SignumMu->1, Azero -> -2500, Bzero->100, Lzero->0, LambdaInput -> 0.1, KappaInput -> 0.3,  ALambdaInput -> -300,  AKappaInput -> 650,  vSInput -> 300, MSInput->800};

  
