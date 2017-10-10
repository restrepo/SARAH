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

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mv2, DIAGONAL m0^2},
{ms2, DIAGONAL m0^2},
{mvs2, 0},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundarySUSYScale={
{MUS, LHInput[MUS]},
{Mv, LHInput[Mv]},
{Yv,LHInput[Yv]},
{B[MUS], LHInput[B[MUS]]},
{B[Mv], LHInput[B[Mv]]}
};


InitializationValues = {
 {\[Mu],0},
 {B[\[Mu]],0}

};

QuadruplePrecision = {Fv};



BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


UseHiggs2LoopMSSM = True;
(* UseHiggs2LoopMSSM = False; *)

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

(* Example for input values *)
DefaultInputValues = {m0 -> 1000, m12 -> 1500, TanBeta->20, SignumMu ->1, Azero -> -1500, Yv[1,1]->0.1, Yv[2,2]->0.1, Yv[3,3]->0.1, Mv[1,1]->1000, Mv[2,2]->1000, Mv[3,3]->1000, MUS[1,1]->0.001, MUS[2,2]->0.001, MUS[3,3]->0.001};
