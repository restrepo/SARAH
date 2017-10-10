OnlyLowEnergySPheno = True;

MINPAR={
        {1,LHInput},
        {2,LTInput},
        {3,LT2Input},
        {4,LTHInput},
        {5,KInput},

        {10,vTInput}

       };

ParametersToSolveTadpoles = {mu2,MT};


BoundaryLowScaleInput={
  {v, vSM},
  {Ye, YeSM},
  {Yd, YdSM},
  {Yu, YuSM},
  {g1, g1SM},
  {g2, g2SM},
  {g3, g3SM},
  {vT, vTInput},
  {LH, LHInput},
  {LT, LTInput},
  {LT2, LT2Input},
  {LHT, LTHInput},
  {KHT, KInput}
};


ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hpm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={LHInput -> -0.1, LTInput -> -0.2 LT2Input -> -0.1, LTHInput -> -0.2, KInput->0.1, vTInput->3 };