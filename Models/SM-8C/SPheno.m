OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaIN},
        {2,LambdaHCinput},
        {3, LambdaHSinput},
        {4,LambdaSinput},
        {5,LambdaCSinput},
        {6,eSinput}, 
        {7,eHinput}, 
        {8,eCinput}, 
        {10,vSinput}
};


ParametersToSolveTadpoles = {mu2, MS};

DEFINITION[MatchingConditions]= {
{v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
 };

BoundaryLowScaleInput={
 
 {vS,vSinput},
 {L,LambdaIN},
 {LS,LambdaSinput},
 {LHc,LambdaHCinput},
 {LHs,LambdaHSinput},
 {LCs,LambdaCSinput},
 {eS,eSinput},
 {eC,eCinput},
 {eH,eHinput}
};

 

ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};



DefaultInputValues ={LambdaIN -> -0.1, LambdaHCinput -> -0.1,LambdaHSinput->0.2, LambdaSinput->-0.5, LambdaCSinput->-0.1, eSinput->0.1, eHinput->0.1, eCinput->0.2, vSinput->-1000 };

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};