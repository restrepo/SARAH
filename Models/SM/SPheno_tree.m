OnlyLowEnergySPheno = True;

MINPAR={{1,mHInput}};


ParametersToSolveTadpoles = {mu2};

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {\[Lambda],mHInput^2/(vSM^2)}
};



ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={LambdaIN -> 0.27,mHInput->125.0};
