RenameParameters ={
{\[Kappa],KappaNMSSM},
{T[\[Kappa]],AKappaNMSSM},
{\[Lambda],LambdaNMSSM},
{T[\[Lambda]],ALambdaNMSSM}
};


MINPAR={m0,m12,Azero,TanBeta,KappaInput,LambdaInput,AKappaInput,ALambdaInput};

EXTPAR = {
   {100, vSInput},
   {101, v1Input},
   {102, v2Input},
   {103, v3Input},
   {200, Qq},
   {201, Ql},
   {202, QHd},
   {203, QHu},
   {204, Qd},
   {205, Qu},
   {206, Qe},
   {207, Qs},
   {208, Qs1},
   {209, Qs2},
   {210, Qs3}       };

RealParameters = {TanBeta, vSInput, v1Input, v2Input, v3Input};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2,ms12,ms22,ms32};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];


BoundarySUSYScale = {
{vS, vSInput},  
{v1, v1Input}, 
{v2, v2Input}, 
{v3, v3Input}, 
{ms12, TADPOLES},
{ms22, TADPOLES},
{ms32, TADPOLES}
};


BoundaryHighScale={
{gp, 1},
{gpg1,0},
{g1gp,0},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{ms2, m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MassU,m12}
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

AddLowEnergyConstraint=False;
UseStandardLowEnergy = False;


ConditionForMassOrdering={
{Ah,
"If ((Abs(ZA(1,3)).gt.Abs(ZA(2,3))).And.(MAh2(1).lt.1._dp).And.(MAh2(2).lt.1._dp)) Then \n
   MAh2temp = MAh2 \n
   ZAtemp = ZA \n
   ZA(1,:) = ZAtemp(2,:) \n
   ZA(2,:) = ZAtemp(1,:) \n
   MAh2(1) = MAh2temp(2) \n
   MAh2(2) = MAh2temp(1) \n
End If \n \n"}
};


  
