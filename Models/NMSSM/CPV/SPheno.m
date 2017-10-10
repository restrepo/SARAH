

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {6,etaInput}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
       	   {63,ALambdaInput},
	   {64,AKappaInput},
           {65,MuEffinput}
	 };

RealParameters = {TanBeta, etaInput, etaSInput,m0};

ParametersToSolveTadpoles = {mHd2,mHu2, ms2, im[T[\[Kappa]]], im[T[\[Lambda]]]};


(* apply the found solution to the symmetric element *)

Tad1Loop[5]=Tad1Loop[4]*vd/vu;

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;


BoundarySUSYScale = {
{eta,etaInput},
{phil,Arg[LambdaInput]},
{etaS,Arg[MuEffinput]-phil},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{re[T[\[Lambda]]], ALambdaInput*re[LambdaInput]},
{re[T[\[Kappa]]], AKappaInput*re[KappaInput]},
{vS, Sqrt[2]*MuEffinput/LambdaInput}
};


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
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryLowScaleInput={
 {\[Kappa], KappaInput},
 {\[Lambda], LambdaInput},
 {re[T[\[Lambda]]], ALambdaInput*re[LambdaInput]},
 {re[T[\[Kappa]]], AKappaInput*re[KappaInput]},
 {eta,etaInput},
 {phil,Arg[LambdaInput]},
 {etaS,Arg[MuEffinput]-phil},
 {vS, Sqrt[2]*Abs[MuEffinput]/Abs[LambdaInput]},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DEFINITION[MatchingConditions]=Default[THDMII];

DefaultInputValues[1] = {m0 -> 1000, m12 -> 1000, TanBeta -> 10, Azero->-2000, LambdaInput ->0.1, KappaInput->0.11, ALambdaInput->-200,AKappaInput->-20, MuEffinput->200 };  

(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;
