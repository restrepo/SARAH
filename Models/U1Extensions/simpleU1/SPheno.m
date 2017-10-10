OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,LambdaHSINPUT},
        {3,LambdaSINPUT},
        {4,Lambda1INPUT},
        {5,Lambda2INPUT},
        {6,M1INPUT},
        {7,M2INPUT},
        {20, gXINPUT},
        {22, g1XINPUT},
        {30, vSinput} };

ParametersToSolveTadpoles = {muS2,muH2};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {vH, vSM}
 };


BoundaryLowScaleInput={
 {gX,gXINPUT},
 {g1X,g1XINPUT},
 {gX1,0},
 {lamH, LambdaHINPUT},
 {lamHS, LambdaHSINPUT},
 {lamS, LambdaSINPUT},
 {lam1, Lambda1INPUT},
 {lam2, Lambda2INPUT},
 {M1, M1INPUT},
 {M2, M2INPUT},
 {vS,vSinput}
};



ListDecayParticles = {Fu,Fe,Fd,hh,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={LambdaHINPUT -> -0.085,  
                     gXINPUT->0.5, 
                     vSinput->1650,
                     M1INPUT -> 800,
                     M2INPUT -> 800,
                     Lambda1INPUT -> 0.2,
                     Lambda2INPUT -> 0.2,
                     LambdaSINPUT -> -0.07
                     };

