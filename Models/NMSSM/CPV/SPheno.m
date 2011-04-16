

RenameParameters ={
{\[Kappa],KappaNMSSM},
{T[\[Kappa]],AKappaNMSSM},
{\[Lambda],LambdaNMSSM},
{T[\[Lambda]],ALambdaNMSSM}
};


MINPAR={m0,m12,Azero,TanBeta,KappaInput,LambdaInput,AKappaInput,ALambdaInput,vSInput};
RealParameters = {TanBeta};

EXTPAR={{99,testpar}};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

PhaseMuForYb = 0;
RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

BoundaryEWSBScale = Table[{},{3}];
BoundarySUSYScale = Table[{},{3}];
BoundaryHighScale = Table[{},{3}];


BoundarySUSYScale[[1]] = {
{vS, vSInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{mHd2, TADPOLES},
{mHu2, TADPOLES},
{ms2, TADPOLES}
};


BoundarySUSYScale[[2]] = {
{vS, vSInput},  
{mHd2, TADPOLES},
{mHu2, TADPOLES},
{ms2, TADPOLES}
};

BoundarySUSYScale[[3]] = {
{vS, vSInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{mHd2, TADPOLES},
{mHu2, TADPOLES},
{ms2, TADPOLES}
};

BoundaryHighScale[[1]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundaryHighScale[[2]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryHighScale[[3]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

UseStandardLowEnergy = True;
AddLowEnergyConstraint=False;


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


  
