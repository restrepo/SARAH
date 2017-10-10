MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {6,MDin}};

EXTPAR = {
	   {61,LambdaInput},
  	   {161,LambdaSInput},
	   {261,LambdaTInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
   	   {163,ALambdaSInput},
   	   {263,ALambdaTInput},
	   {64,AKappaInput},
       {65,vSInput},
       {165,vTInput},
       {100, MuInput},
       {101, BMuInput},
       {200, MTInput},
       {201, BMTInput},
       {300, TadInput},
       {301, SoftTadInput}
	 };


RealParameters = {TanBeta,vTInput, vSInput};

ParametersToSolveTadpoles = {mHd2, mHu2, mS2, mT2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{B[\[Mu]],BMuInput},
{\[Mu],MuInput},
{LS, LambdaSInput},
{LT, LambdaTInput},
{T[LS], LambdaSInput*ALambdaSInput},
{T[LT], LambdaTInput*ALambdaTInput},
{L1, TadInput},
{L[L1], SoftTadInput},
{MT, MTInput},
{B[MT], BMTInput},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MDWBT,MDin},
{MDBS,MDin}
};

BoundarySUSYScale = {
{vS, vSInput},
{vT, vTInput}
};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

FlagLoopContributions = True;  

ListDecayParticles =  {hh,Ah,Hpm, Sd, Su, Se, Sv, Chi, Cha, Fv};
ListDecayParticles3B = {{Cha,"Cha.f90"},{Chi,"Chi.f90"}};


