
MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};

EXTPAR = {
   {61,LambdaInput},
   {62,KappaInput},
   {63,ALambdaInput},
   {64,AKappaInput},
   {65, vSInput},
   {101, v1Input},
   {102, v2Input},
   {103, v3Input},
   {111, mSS1input},
   {112, mSS2input},
   {113, mS1S2input},
   {200, QH}     };

RealParameters = {TanBeta, vSInput, v1Input, v2Input, v3Input,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2,ms12,ms22,ms32};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

DEFINITION[MatchingConditions]=Default[THDMII];

BoundarySUSYScale = {
{vS, vSInput},  
{vS1, v1Input}, 
{vS2, v2Input}, 
{vS3, v3Input},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{mss12, mSS1input},
{mss22, mSS2input},
{ms1s22,mS1S2input}
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
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MassU,m12}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;



DefaultInputValues = {m0 -> 2000, m12 -> 1000, TanBeta->20,  Azero -> -1500,  LambdaInput -> 0.1, ALambdaInput -> 1000, KappaInput->0.3, AKappaInput->-550, vSInput -> 1500, v1Input->100, v2Input->200, v3Input-> 300, QH->0.5, mSS1input->-10^4,mS1S2input->-10^4,mSS2input->-10^4  };


