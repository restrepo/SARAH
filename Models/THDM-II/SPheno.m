OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1Input},
        {2,Lambda2Input},
        {3,Lambda3Input},
        {4,Lambda4Input},
        {5,Lambda5Input},
        {9,M12input},        
        {10,TanBeta} };

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {M112,M222};

BoundaryLowScaleInput={
 {Lambda1,Lambda1Input},
 {Lambda2,Lambda2Input},
 {Lambda3,Lambda3Input},
 {Lambda4,Lambda4Input},
 {Lambda5,Lambda5Input},
 {M12, M12input}, 
 {v1,vSM*Cos[ArcTan[TanBeta]]},
 {v2,vSM*Sin[ArcTan[TanBeta]]},
 {Ye, YeSM*vSM/v1},
 {Yd, YdSM*vSM/v1},
 {Yu, YuSM*vSM/v2},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};




ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};




DefaultInputValues ={Lambda1Input -> 0.1, Lambda2Input -> 0.27, Lambda3Input -> 1.1, Lambda4Input ->-0.5, Lambda5Input ->0.5,  M12input -> -200, TanBeta->50};