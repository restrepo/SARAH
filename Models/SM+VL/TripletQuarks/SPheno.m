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

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
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
