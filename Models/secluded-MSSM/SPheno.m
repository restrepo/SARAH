
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
   {200, Qq},
   {201, Ql},
   {202, QHd},
   {203, QHu},
   {204, Qd},
   {205, Qu},
   {206, Qe},
   {207, Qs},
   {208, Qs1},
   {209, Qs2},
   {210, Qs3}       };

RealParameters = {TanBeta, vSInput, v1Input, v2Input, v3Input,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2,ms12,ms22,ms32};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];


BoundarySUSYScale = {
{vS, vSInput},  
{vS1, v1Input}, 
{vS2, v2Input}, 
{vS3, v3Input}
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
{ms2, m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*\[Kappa]},
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

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;




  
