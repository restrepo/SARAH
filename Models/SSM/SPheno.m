OnlyLowEnergySPheno = True;


MINPAR={{1,Lambdainput},
        {2,LambdaSinput},
        {3,MSinput},
        {4,K1input},
        {5,K2input}
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
  {MS, MSinput}
};




ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};
