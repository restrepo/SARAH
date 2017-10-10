
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
   {207, Qs}       };
       
RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

BoundarySUSYScale = {
{vS, vSInput},  
{\[Lambda], LambdaInput}
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




  
