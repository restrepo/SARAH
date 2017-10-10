OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaIN},
        {2,LambdaHCinput},
        {3, LambdaHSinput},
        {4,LambdaSinput},
        {5,LambdaCSinput},
        {6,eSinput}, 
        {7,eHinput}, 
        {8,eCinput}, 
        {10,vSinput}
};


ParametersToSolveTadpoles = {mu2, MS};

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {vS,vSinput},
 {L,LambdaIN},
 {LS,LambdaSinput},
 {LHc,LambdaHCinput},
 {LHs,LambdaHSinput},
 {LCs,LambdaCSinput},
 {eS,eSinput},
 {eC,eCinput},
 {eH,eHinput}
};

 

ListDecayParticles = {Fu,Fe,Fd,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};



DefaultInputValues ={LambdaIN -> -0.1, LambdaHCinput -> -0.1,LambdaHSinput->0.2, LambdaSinput->-0.5, LambdaCSinput->-0.1, eSinput->0.1, eHinput->0.1, eCinput->0.2, vSinput->-1000 };

