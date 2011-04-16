RenameParameters ={
{\[Kappa],KappaNMSSM},
{T[\[Kappa]],AKappaNMSSM},
{\[Lambda],LambdaNMSSM},
{T[\[Lambda]],ALambdaNMSSM}
};


MINPAR={m0,m12,Azero,TanBeta,KappaInput,AKappaInput,LambdaInput,ALambdaInput};

EXTPAR = {
   {200, vL1Input},
   {201, vL2Input},
   {202, vL3Input},
   {210, vR1Input}
   };


ParametersToSolveTadpoles = {ml2[1,1],ml2[2,2],ml2[3,3],mHd2,mHu2,mv2};

LoopTadpolesForTreeMasses = True;

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[2];


BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{ml2[1,2], 0},
{ml2[1,3], 0},
{ml2[2,3], 0},
{ml2[3,2], 0},
{ml2[3,1], 0},
{ml2[2,1], 0},
{mlHd2,0},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundarySUSYScale = {
{Yv,LHInput[Yv]},
{vL[1], vL1Input},
{vL[2], vL1Input},
{vL[3], vL1Input},
{vR, vR1Input}
};



UseHiggs2LoopMSSM = False;

AddLowEnergyConstraint=False;
UseStandardLowEnergy = False;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;
