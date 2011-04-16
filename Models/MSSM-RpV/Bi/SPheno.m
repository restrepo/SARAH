MINPAR={m0,m12,TanBeta,MuInput,Azero,Bzero};

EXTPAR = {
   {200, vL1Input},
   {201, vL2Input},
   {202, vL3Input}
   };

ParametersToSolveTadpoles ={mHd2,mHu2,B[\[Epsilon]][1],B[\[Epsilon]][2],B[\[Epsilon]][3]};

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
{mlHd2, 0},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{\[Mu], MuInput},
{B[\[Mu]], Bzero*MuInput}
};

BoundarySUSYScale = {
{\[Epsilon], LHInput[\[Epsilon]]},
{vL[1], vL1Input},  
{vL[2], vL2Input},  
{vL[3], vL3Input}
};



UseHiggs2LoopMSSM = False;

AddLowEnergyConstraint=False;
UseStandardLowEnergy = False;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;
