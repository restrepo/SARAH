OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,Lambda2IN},
        {3,Lambda3IN},
        {4,Lambda4IN},
        {5,Lambda5IN},
        {11, LamS1IN},
        {12, LamS2IN},
        {13, LamS12IN},
        {14, LamS21IN},
        {15, LamS4IN},
        {16, LamS4cIN},
        {21, mu22IN},
        {22, muSIN}
        };




ParametersToSolveTadpoles = {mu12};

BoundaryLowScaleInput={
  {Lambda1,Lambda1IN},
  {Lambda2,Lambda2IN},
  {Lambda3,Lambda3IN},
  {Lambda4,Lambda4IN},
  {Lambda5,Lambda5IN},
  {LamS4,LamS4IN},
  {LamS4c,LamS4cIN},
  {LamS1,LamS1IN},
  {LamS2,LamS2IN},
  {LamS12,LamS12IN},
  {LamS21,LamS21IN},
  {muS,muSIN},
  {mu22, mu22IN},
  {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};




ListDecayParticles = {Fu,Fe,Fd,hh, ss, HI0, HIp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={Lambda1IN -> 0.28, LamSHIN -> 0.01, LamSIN -> 0};

