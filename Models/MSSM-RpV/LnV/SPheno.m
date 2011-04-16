MINPAR={m0,m12,TanBeta,SignumMu,Azero};

EXTPAR = {
   {200, vL1Input},
   {201, vL2Input},
   {202, vL3Input}
   };

ParametersToSolveTadpoles ={mlHd2[1],mlHd2[2],mlHd2[3],\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

RenameParameters ={
{\[Epsilon],epsRpV},
{B[\[Epsilon]],BepsRpV}
};

BoundaryHighScale={
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
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundarySUSYScale = {
{\[Epsilon], LHInput[\[Epsilon]]},
{B[\[Epsilon]], LHInput[B[\[Epsilon]]]},
{L1, LHInput[L1]},
{T[L1], LHInput[T[L1]]},
{L2, LHInput[L2]},
{T[L2], LHInput[T[L2]]},
{vL[1], vL1Input},  
{vL[2], vL2Input},  
{vL[3], vL3Input}
};



UseHiggs2LoopMSSM = False;

AddLowEnergyConstraint=False;
UseStandardLowEnergy = False;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;
