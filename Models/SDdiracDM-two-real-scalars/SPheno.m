OnlyLowEnergySPheno = True;

MINPAR={
    {1,LambdaIN},
    
    {2,MDFInput},
    {3,MS12Input},
    {4,MS22Input},
    {5,LamS1HInput},
    {6,LamS2HInput},
    {7,LamSPHInput},
    {8,LamSInput},
    {9,LamSPInput},
    {10,vSInput},
    {11,YRDInput},  
    {12,YRCInput}
    
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
 
 {MDF, MDFInput},
 {MS12, MS12Input},
 {MS22, MS22Input},
 {LamS1H, LamS1HInput},
 {LamS2H, LamS2HInput},
 {LamSPH, LamSPHInput}, 
 {LamS, LamSInput},
 {LamSP, LamSPInput},
 {vS, vSInput},
 {YRD, YRDInput},
 {YRC, YRCInput},
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

DefaultInputValues ={LambdaIN -> 0.27, MDFInput -> 200.0, MS12Input -> 100000.0, MS22Input -> 200000.0, LamS1HInput -> 0.01, LamS2HInput -> 0.02, LamSPHInput -> 0.01, LamSInput -> 0.01,  LamSPInput -> 0.01, vSInput -> 500.0, YRDInput -> 0.01, YRCInput -> 0.01 };

(* turn off RGEs for loop-decays *)
(*SA`NoRGEsforDecays=True;*)

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
