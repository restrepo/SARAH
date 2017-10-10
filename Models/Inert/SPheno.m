OnlyLowEnergySPheno = True;


MINPAR={
        {1,Lambda1IN},
        {2,Lambda2IN},
        {3,Lambda3IN},
        {4,Lambda4IN},
        {5,Lambda5IN},
        {6,TanBeta} };


ParametersToSolveTadpoles = {MHD,MHU};
RealParameters = {TanBeta};

BoundaryLowScaleInput={
 {Lambda1,Lambda1IN},
 {Lambda2,Lambda2IN},
 {Lambda3,Lambda3IN},
 {Lambda4,Lambda4IN},
 {Lambda5,Lambda5IN},
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};

ListDecayParticles = {Fu,Fe,Fd,hh,H0,A0,Hp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};



