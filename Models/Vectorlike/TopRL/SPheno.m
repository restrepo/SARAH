OnlyLowEnergySPheno = True;

MINPAR={
 {1,LambdaIN},
 {2,YTinput},
 {3,MQinput},
 {4,MTinput} 
 };


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
 {\[Lambda],LambdaIN},
 {Yt, YTinput},
 {mQ, MQinput},
 {mT, MTinput}
};

DEFINITION[MatchingConditions]= 
{{v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}};


ListDecayParticles = {Fu,Fe,Fd,Fvt,Fvb,hh};
ListDecayParticles3B = {{Fvt,"FT.f90"},{Fvb,"Fb.f90"}};

DefaultInputValues ={LambdaIN -> 0.27};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
