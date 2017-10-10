OnlyLowEnergySPheno = True;


MINPAR={{1,Lambdainput},
        {2,LambdaSinput},
        {3,MSinput},
        {5,K2input},
        {6,KappaInput},
        {7, vSinput}
        };


ParametersToSolveTadpoles = {mu2, K1};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {v, vSM}
 };


BoundaryLowScaleInput={
  {\[Lambda],Lambdainput},
  {LambdaS,LambdaSinput},
  {vS,vSinput},
  {K2,K2input},
  {MS, MSinput},
  {\[Kappa],KappaInput}
};


AddTreeLevelUnitarityLimits=True;

ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={Lambdainput -> 0.25, LambdaSinput -> 0.2, vSinput -> 0.1, K2input->0.1, MSinput -> 200,KappaInput->0};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};