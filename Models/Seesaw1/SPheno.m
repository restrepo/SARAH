(* ::Package:: *)

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero}};

RealParameters = {TanBeta,m0};
ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

DEFINITION[MatchingConditions]=Default[THDMII];

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
{mv2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{Mv, LHInput[Mv]},
{B[Mv], 0},
{Yv,LHInput[Yv]},
{T[Yv],Azero*Yv},
{Q[WOp],0}
};


Thresholds={
{Abs[MvIN[1,1]],{v[1]}},
{Abs[MvIN[2,2]],{v[2]}},
{Abs[MvIN[3,3]],{v[3]}}
};


UseHiggs2LoopMSSM = True;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

BoundaryConditionsUp=Table[{},{Length[Thresholds]}];
BoundaryConditionsDown=Table[{},{Length[Thresholds]}];


BoundaryConditionsDown[[1]]={
{WOp[index1,index2],WOp[index1,index2] - Yv[1,index1] Yv[1,index2]/MassOfv[1]}
};

BoundaryConditionsDown[[2]]={
{WOp[index1,index2],WOp[index1,index2] - Yv[2,index1] Yv[2,index2]/MassOfv[2]}
};

BoundaryConditionsDown[[3]]={
{WOp[index1,index2], - Yv[3,index1] Yv[3,index2]/MassOfv[3]}
};

(* Example for input values *)
DefaultInputValues = {m0 -> 1000, m12 -> 1500, TanBeta->20, SignumMu ->1, Azero -> -1500, Yv[1,1]->0.001, Yv[2,2]->0.001, Yv[3,3]->0.001, Mv[1,1]->10^15, Mv[2,2]->10^15, Mv[3,3]->10^15};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
