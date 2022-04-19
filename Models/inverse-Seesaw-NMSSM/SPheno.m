MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
           {65,vSInput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{T[\[Lambda]N], Azero*\[Lambda]N},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mv2, DIAGONAL m0^2},
{mx2, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput}
};


BoundarySUSYScale={
{MUX, LHInput[MUX]},
{B[MUX], LHInput[B[MUX]]},
{Yv,LHInput[Yv]},
{\[Lambda]N,LHInput[\[Lambda]N]},
{vS, vSInput}
};

DEFINITION[MatchingConditions]=Default[THDMII];

QuadruplePrecision = {Fv};

BoundaryLowScaleInput={
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues[1] = {m0->1000, m12->1000, TanBeta -> 10, Azero -> -1500, LambdaInput ->-0.2, KappaInput ->-0.1, ALambdaInput ->-1500, AKappaInput->-36, vSInput->1000,MUX[a_,a_]->10^-4, \[Lambda]N[a_,a_]->-.1  };




RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
