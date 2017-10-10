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


(*
Thresholds={
{Abs[MRIN[1,1]],{vR[1],s[1]}},
{Abs[MRIN[2,2]],{vR[2],s[2]}},
{Abs[MRIN[3,3]],{vR[3],s[3]}}
};
*)


QuadruplePrecision = {Fv};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]}
};


UseHiggs2LoopMSSM = True;
(* UseHiggs2LoopMSSM = False; *)

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


(*

BoundaryConditionsUp=Table[{},{Length[Thresholds]}];
BoundaryConditionsDown=Table[{},{Length[Thresholds]}];

BoundaryConditionsDown[[1]]={
{WOp[index1,index2],WOp[index1,index2] - Yv[1,index1] MUS[1,1] Yv[1,index2]/(MassOfvR[1] MassOfvR[1])}
};

BoundaryConditionsDown[[2]]={
{WOp[index1,index2],WOp[index1,index2] - Yv[2,index1] MUS[2,2] Yv[2,index2]/(MassOfvR[2] MassOfvR[2])}
};

BoundaryConditionsDown[[3]]={
{WOp[index1,index2], - Yv[3,index1] MUS[3,3] Yv[3,index2]/(MassOfvR[3] MassOfvR[3])}
};


*)
