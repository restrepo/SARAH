(* ::Package:: *)

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero}};

RealParameters = {TanBeta,m0};

ConditionGUTscale = g1 == g2;

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{T[YSL],Azero*YSL},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mvR2, DIAGONAL m0^2},
{ms2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};




BoundarySUSYScale={
{YSL, LHInput[YSL]},
{MR, LHInput[MR]},
{Yv,LHInput[Yv]},
{B[MR], LHInput[B[MR]]}
};

InitializationValues = {
 {\[Mu],0},
 {B[\[Mu]],0}

};

DEFINITION[MatchingConditions]=Default[THDMII];

QuadruplePrecision = {Fv};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

(* Example for input values *)
(* Not including neutrino fit! *)
DefaultInputValues = {m0 -> 1000, m12 -> 1500, TanBeta->20, SignumMu ->1, Azero -> -1500, Yv[a_,a_]->0.1, MR[a_,a_]->1};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
