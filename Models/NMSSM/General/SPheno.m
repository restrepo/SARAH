(* lambda and kappa already used in SPheno:
Replace the names in SARAH generated code *)

RenameParameters ={
{\[Kappa],KappaNMSSM},
{T[\[Kappa]],AKappaNMSSM},
{\[Lambda],LambdaNMSSM},
{T[\[Lambda]],ALambdaNMSSM}
};


MINPAR={m0,m12,Azero,TanBeta,SignumMu,KappaInput,LambdaInput,AKappaInput,ALambdaInput,vSInput,TadInput,LTadInput};
RealParameters = {TanBeta};

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]],ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

BoundarySUSYScale = {
{vS, vSInput},  
{\[Mu], TADPOLES},
{B[\[Mu]], TADPOLES},
{ms2, TADPOLES},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};


BoundaryHighScale ={
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
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{Tad, TadInput},
{L[Tad], LTadInput}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

AddLowEnergyConstraint=False;
UseStandardLowEnergy = False;


(* For kappa = 0 two massles pseudo scalar appear. 
The Goldstone is the one which is not singlet-like! *)

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


(* not yet included in public part *)

AddLowEnergyConstraint=False;
UseStandardLowEnergy = True;

  
