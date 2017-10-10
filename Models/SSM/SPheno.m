OnlyLowEnergySPheno = True;


MINPAR={{1,Lambdainput},
        {2,LambdaSinput},
        {3,MSinput},
        {4,K1input},
        {5,K2input},
        {6,KappaInput}
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
  {\[Lambda],Lambdainput},
  {LambdaS,LambdaSinput},
  {K1,K1input},
  {K2,K2input},
  {MS, MSinput},
  {\[Kappa],KappaInput}
};




ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={Lambdainput -> 0.25, LambdaSinput -> 0.2, K1input -> 0.1, K2input->0.1, MSinput -> 200,KappaInput->0};