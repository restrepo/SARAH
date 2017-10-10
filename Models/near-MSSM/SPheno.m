
MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero},
        {7,Lzero}};

EXTPAR = {
	   {61,LambdaInput},
           {63,ALambdaInput},
           {65,vSInput},
           {100,TadInput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

DEFINITION[MatchingConditions]=Default[THDMII];

ConditionGUTscale = g1 == g2;

BoundarySUSYScale = {
{vS, vSInput},  
{\[Lambda], LambdaInput}
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
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{Tad, TadInput},
{L[Tad], Lzero*TadInput}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;



 DefaultInputValues = {m0 -> 1000, m12 -> 1000, TanBeta -> 10, SignumMu->1, Azero -> -2500,  Lzero->0, LambdaInput -> 0.2,  ALambdaInput -> -100,   vSInput -> 200, TadInput-> 10^6};

 RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
