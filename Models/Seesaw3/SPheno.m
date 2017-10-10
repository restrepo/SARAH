(* ::Package:: *)

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero},
        {6,Bzero}};
        
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
{mHd2, m0^2},
{mHu2, m0^2},
{mHw32, DIAGONAL m0^2},
{mHx32, DIAGONAL m0^2},
{mHxb32, DIAGONAL m0^2},
{mHb32, DIAGONAL m0^2},
{mHg32, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MWM3,LHInput[MWM3]},
{MXM3,MWM3},
{MBM3,MWM3},
{MGM3,MWM3},
{B[MWM3],Bzero*MWM3},
{B[MXM3],Bzero*MWM3},
{B[MBM3],Bzero*MWM3},
{B[MGM3],Bzero*MWM3},
{Yb3,LHInput[Yb3]},
{Yx3,Yb3},
{Yw3,Yb3},
{T[Yb3],Azero*Yb3},
{T[Yx3],Azero*Yb3},
{T[Yw3],Azero*Yb3},
{Q[WOp],0}
};


Thresholds={
{Abs[MWM3IN[1,1]],{Hx3[1],Hxb3[1],Hg3[1],Hb3[1],Hw3[1]}},
{Abs[MWM3IN[2,2]],{Hx3[2],Hxb3[2],Hg3[2],Hb3[2],Hw3[2]}},
{Abs[MWM3IN[3,3]],{Hx3[3],Hxb3[3],Hg3[3],Hb3[3],Hw3[3]}}
};


UseHiggs2LoopMSSM = True;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


BoundaryConditionsUp=Table[{},{Length[Thresholds]}];
BoundaryConditionsDown=Table[{},{Length[Thresholds]}];

BoundaryConditionsDown[[1]]={
{WOp[index1,index2],WOp[index1,index2] +1/2 Yw3[1,index1] Yw3[1,index2]/MassOfHw3[1] +3/10 Yb3[1,index1] Yb3[1,index2]/MassOfHb3[1]}
};

BoundaryConditionsDown[[2]]={
{WOp[index1,index2],WOp[index1,index2] + 1/2 Yw3[2,index1] Yw3[2,index2]/MassOfHw3[2] +3/10 Yb3[2,index1] Yb3[2,index2]/MassOfHb3[2]}
};

BoundaryConditionsDown[[3]]={
{WOp[index1,index2], 1/2 Yw3[3,index1] Yw3[3,index2]/MassOfHw3[1] +3/10 Yb3[3,index1] Yb3[3,index2]/MassOfHb3[3]}
};


(* Example for mSugra input values *)
DefaultInputValues = {m0 -> 100, m12->250, TanBeta ->10, SignumMu ->1, Azero ->300, Bzero -> 10^10, MWM3[1,1]-> 3*10^13, MWM3[2,2]-> 4*10^14, MWM3[3,3]-> 5*10^14, MWM3[1,2]-> 1,  MWM3[1,3]-> 1,  MWM3[2,1]-> 1,  MWM3[3,1]-> 1,  MWM3[3,2]-> 1,  MWM3[2,3]-> 1, Yb3[1,2] -> -0.7, Yb3[1,3]->0.7, Yb3[2,1]->0.22, Yb3[2,2]-> 0.22, Yb3[2,3]->0.22  };


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
