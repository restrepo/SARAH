OnlyLowEnergySPheno = True;

MINPAR={
        {1,Lambda1input},
        {2,Lambda2input},
        {3,Lambda3input},
        {4,Lambda4input},
        {5,Lambda5input},

        {11, M1input},
        {12, M2input},
        
        {20,vXInput}

       };

ParametersToSolveTadpoles = {mu2,Meta,MXi};


BoundaryLowScaleInput={
  {v, vSM},
  {Ye, YeSM},
  {Yd, YdSM},
  {Yu, YuSM},
  {g1, g1SM},
  {g2, g2SM},
  {g3, g3SM},

  {Lambda1, Lambda1input},
  {Lambda2a, Lambda2input},
  {Lambda2b, Lambda2input},
  {Lambda3a, Lambda3input},
  {Lambda3b, Lambda3input},
  {Lambda3c, Lambda3input},
  {Lambda4a, Lambda4input},
  {Lambda4b, Lambda4input},
  {Lambda4c, Lambda4input},
  {Lambda5a, Lambda5input},
  {Lambda5b, Lambda5input},    
  {M1a, M1input},
  {M1b, M1input},
  {M2, M2input},
  {vEta, vXInput},
  {vPhi, vXInput}
   
};


ListDecayParticles = {Fu,Fe,Fd,hh,Hpm,xiMM,Ah};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={vXInput->1, M1input->1000, M2input->1000,Lambda1input->0.2,Lambda2input->0.5,Lambda3input->0.5,Lambda4input->0.5,Lambda5input->0.5 };