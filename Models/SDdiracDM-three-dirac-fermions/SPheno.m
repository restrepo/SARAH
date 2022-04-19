OnlyLowEnergySPheno = True;

MINPAR={
    {1,LambdaIN},
    
    {2,Mn1Input},
    {3,Mn2Input},
    {4,MDFInput},
    {5,MS12Input},
    {6,MS22Input},
    {7,LamS1HInput},
    {8,LamS2HInput},
    {9,LamSPHInput},
    {10,LamSInput},
    {11,LamSPInput},
    {12,vSInput},
    {13,YRD1Input},
    {14,YRD2Input},
    {15,YRC1Input},    
    {16,YRC2Input}
    
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
 {Lambda1,LambdaIN},
 
 {Mn1, Mn1Input},
 {Mn2, Mn2Input},
 {MDF, MDFInput},
 {MS12, MS12Input},
 {MS22, MS22Input},
 {LamS1H, LamS1HInput},
 {LamS2H, LamS2HInput},
 {LamSPH, LamSPHInput}, 
 {LamS, LamSInput},
 {LamSP, LamSPInput},
 {vS, vSInput},
 {YRD1, YRD1Input},
 {YRD2, YRD2Input},
 {YRC1, YRC1Input},
 {YRC2, YRC2Input},
 {YNU, LHInput[YNU]},
 
 {YRA1, LHInput[YRA1]},
 {YRA2, LHInput[YRA2]},
 {YRB1, LHInput[YRB1]},
 {YRB2, LHInput[YRB2]}

};


AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,hh,Ssc,Fxe,Fxv};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;

DefaultInputValues ={LambdaIN -> 0.27, Mn1Input -> 110.0, Mn2Input -> 120.0, MDFInput -> 200.0, MS12Input -> 100000.0, MS22Input -> 200000.0, LamS1HInput -> 0.01, LamS2HInput -> 0.02, LamSPHInput -> 0.01, LamSInput -> 0.01,  LamSPInput -> 0.01, vSInput -> 500.0, YRD1Input -> 0.01, YRD2Input -> 0.02, YRC1Input -> 0.01, YRC2Input -> 0.02 };

(* turn off RGEs for loop-decays *)
(*SA`NoRGEsforDecays=True;*)

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
