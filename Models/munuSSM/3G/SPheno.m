
MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};
        
RealParameters = {TanBeta,m0};


EXTPAR = {
   {61,LambdaInput},
   {62,KappaInput},
   {63,ALambdaInput},
   {64,AKappaInput},
   {65,vR1Input},
   {66,vR2Input},
   {67,vR3Input},
   {200, vL1Input},
   {201, vL2Input},
   {202, vL3Input}
   };

DONOTSIMPLIFY=True;
SetOptions[MakeSPheno, IncludeLoopDecays -> False];

ParametersToSolveTadpoles = {mlHd2,mHd2,mHu2,mv2[1,1],mv2[2,2],mv2[3,3]};

AssumptionsTadpoleEquations = {Yv[a__]->Delta[a] Yv[a], T[Yv][a__]->Delta[a] T[Yv][a], conj[x_]->x};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[2];

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{\[Kappa], LHInput[\[Kappa]]},
{\[Lambda], LHInput[\[Lambda]]},
{T[\[Kappa]],  LHInput[T[\[Kappa]]]},
{T[\[Lambda]],  LHInput[T[\[Lambda]]]},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{mv2[1,2],0},
{mv2[1,3],0},
{mv2[2,1],0},
{mv2[2,3],0},
{mv2[3,1],0},
{mv2[3,2],0}
};

BoundarySUSYScale = {
{Yv,LHInput[Yv]},
{vL[1], vL1Input},
{vL[2], vL1Input},
{vL[3], vL1Input},
{vR[1], vR1Input},
{vR[2], vR2Input},
{vR[3], vR3Input}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

QuadruplePrecision = {Chi};

DEFINITION[MatchingConditions]=Default[THDMII];


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
