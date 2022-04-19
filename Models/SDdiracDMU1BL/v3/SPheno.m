OnlyLowEnergySPheno = True;

MINPAR={
    {1,LambdaIN},    
    {2,MDFInput},
    {3,LamSPHInput},
    {4,LamSPInput},
    {5,LamSInput},
    {6,vSInput},
    {7,YRDInput},  
    {8,YRCInput},
    {10, g1pINPUT},
    {11, g1p1INPUT},
    {12, g11pINPUT}
    
};

ParametersToSolveTadpoles = {mu2,mP2};

DEFINITION[MatchingConditions]= 
{{v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}};
 
BoundaryLowScaleInput={
 {g1p,g1pINPUT},
 {g11p,g11pINPUT},
 {g1p1,g1p1INPUT},
 
 {Lambda1,LambdaIN},
 
 {MDF, MDFInput},
 {LamSPH, LamSPHInput}, 
 {LamSP, LamSPInput},
 {vS, vSInput},
 {YRD, YRDInput},
 {YRC, YRCInput},
 {YNU, LHInput[YNU]},
 
 {MS12, LHInput[MS12]},
 {LamS1H, LHInput[LamS1H]},
 {LamS, LamSInput},
 
 {YRA1, LHInput[YRA1]},
 {YRB1, LHInput[YRB1]}

};


AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,hh,Ssc,Fxe,Fxv,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;

DefaultInputValues ={LambdaIN -> 0.27, MDFInput -> 200.0, LamSPHInput -> 0.01, LamSPInput -> 0.01,  
                     LamSInput -> 0.000001, vSInput -> 500.0, YRDInput -> 0.01, YRCInput -> 0.01, g1pINPUT->0.5 };

(* turn off RGEs for loop-decays *)
SA`NoRGEsforDecays=True;

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
