OnlyLowEnergySPheno = True;

MINPAR={
  {1,Lambda1Input},
  {2,Lambda2Input},
  {3,Lambda3Input},
  {4,mS2Input},
  {5,yy1Input},
  {6,yy2Input},
  {7,M1Input},
  {8,M2Input}
};

ParametersToSolveTadpoles = {mu2};

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
 {Lambda1,Lambda1Input},
 {Lambda2,Lambda2Input},
 {Lambda3,Lambda3Input},
 {mS2,mS2Input},
 {yy1,yy1Input},
 {yy2,yy2Input},
 {M1,M1Input},
 {M2,M2Input},
 {y1,LHInput[y1]},
 {y2,LHInput[y2]}
};


ListDecayParticles = {Fu,Fe,Fd,FX,FY,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={
Lambda1Input -> 0.1, 
Lambda2Input -> 0.1, 
Lambda3Input -> 0.1, 
mS2Input->1000,
yy1input->0.1,
yy2input->0.1,
M1Input->100,
M2Input->100};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

(* turn off RGEs for loop-decays *)                     
SA`NoRGEsforDecays=True;
