
MINPAR={m0,m12,TanBeta,SignumMu,Azero};
RealParameters = {TanBeta};
ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];


BoundaryHighScale={
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
{T[Yv],Azero*Yv}
};


Thresholds={
{Abs[MvIN[1,1]],{v[1]}},
{Abs[MvIN[2,2]],{v[2]}},
{Abs[MvIN[3,3]],{v[3]}}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

BoundaryConditionsUp=Table[{},{Length[Thresholds]}];
BoundaryConditionsDown=Table[{},{Length[Thresholds]}];


BoundaryConditionsDown[[1]]={
{MNuL[index1,index2], - Yv[3,index1] Yv[index2,3]/MassOfv[3]}
};

BoundaryConditionsDown[[2]]={
{MNuL[index1,index2], - Yv[2,index1] Yv[index2,2]/MassOfv[2]}
};

BoundaryConditionsDown[[3]]={
{MNuL[index1,index2], - Yv[1,index1] Yv[index2,1]/MassOfv[1]}
};


(* not yet included in public version *)

UseStandardLowEnergy = False;

