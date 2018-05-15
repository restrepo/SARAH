OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaInput},
        {2, gpInput},
        {3, M1Input},
        {4, epsilonInput},
        {5, deltaInput} };

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
 {gp,gpInput},
 {g1p,-deltaInput*Sqrt[(1-2*epsilonInput*deltaInput+epsilonInput^2)/(1-deltaInput^2)]*g1},
 {\[Lambda], LambdaInput},
 {M1a, M1Input},
 {M2a, M1Input*epsilonInput},
 {gp1, g1}
};

AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,hh,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={LambdaInput->0.27, gpInput->0.5, M1Input->150, epsilonInput->0.01, deltaInput->0.05};

