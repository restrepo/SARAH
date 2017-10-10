

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {6,etaInput},
        {7,etaSInput}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
       {65,vSInput}
	 };

RealParameters = {TanBeta, etaInput, etaSInput,m0};

ParametersToSolveTadpoles = {mHd2,im[T[\[Kappa]]],re[T[\[Kappa]]],im[T[\[Lambda]]],re[T[\[Lambda]]]};
Tad1Loop[5]=Tad1Loop[4]*vd/vu;

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundaryEWSBScale = Table[{},{3}];
BoundarySUSYScale = Table[{},{3}];
BoundaryHighScale = Table[{},{3}];


BoundarySUSYScale[[1]] = {
{vS, vSInput},  
{eta,etaInput},
{etaS,etaSInput},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};


BoundarySUSYScale[[2]] = {
{vS, vSInput},
{eta,etaInput},
{etaS,etaSInput}
};

BoundarySUSYScale[[3]] = {
{vS, vSInput},  
{eta,etaInput},
{etaS,etaSInput},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};

BoundaryHighScale[[1]]={
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
{mHu2, mHd2},
{ms2, mHd2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundaryHighScale[[2]]={
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
{mHu2, mHd2},
{ms2, mHd2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryHighScale[[3]]={
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
{mHu2, mHd2},
{ms2, mHd2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundaryLowScaleInput={
 {vS, vSInput},
 {\[Kappa], KappaInput},
 {\[Lambda], LambdaInput},
 {eta,etaInput},
 {etaS,etaSInput},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;



  
