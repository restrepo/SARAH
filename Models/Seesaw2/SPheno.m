(* ::Package:: *)

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero}};

EXTPAR={{200,Lambda1IN},
        {201,Lambda2IN},
        {210,MTScaleIN}};

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
{mt2,m0^2},
{mtb2,m0^2},
{ms2,m0^2},
{msb2,m0^2},
{mz2,m0^2},
{mzb2,m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MTT, MTScaleIN},
{MZZ,MTT},
{MSS,MTT},
{B[MZZ],MTT},
{B[MSS],MTT},
{B[MTT],MTT},
{Yt, LHInput[Yt]},
{L1, Lambda1IN},
{L2, Lambda2IN},
{Ys,Yt},
{Yz,Yt},
{T[Yt],Azero*Yt},
{T[Ys],Azero*Yt},
{T[Yz],Azero*Yt},
{T[L1], Azero*L1},
{T[L2], Azero*L2},
{\[Mu],0},
{B[\[Mu]],0},
{Q[WOp],0}
};


Thresholds={
{Abs[MTScaleIN],{s,sb,t,tb,z,zb}}
};


UseHiggs2LoopMSSM = True;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


(* Boundary conditions at threshold scale: 
input values of seesaw parameters defined at MT *)

BoundaryConditionsUp=Table[{},{Length[Thresholds]}];
BoundaryConditionsDown=Table[{},{Length[Thresholds]}];

(*
BoundaryConditionsUp[[1]] = {
{Yt, LHInput[Yt]},
{L1, Lambda1IN},
{L2, Lambda2IN}
};
*) 

BoundaryConditionsDown[[1]] = {
{WOp, -L2 Yt/MTT }
}; 


(* Example for input values *)
DefaultInputValues = {m0 -> 1000, m12 -> 1500, TanBeta->20, SignumMu ->1, Azero -> -1500,Lambda1IN->0.5, Lambda2IN->0.5, MTScaleIN->10^12, Yt[1,1]->0.001, Yt[1,2]->0.001, Yt[1,3]->0.00001, Yt[2,1]->0.001, Yt[2,2]->0.00001, Yt[2,3]->0.003, Yt[3,1]->0.00001, Yt[3,2]->0.02, Yt[3,3]->0.001};



RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
