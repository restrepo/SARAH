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
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


UseHiggs2LoopMSSM = False;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

AddLowEnergyConstraint=False;
UseStandardLowEnergy = False;
