OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,LambdaSINPUT},
        {3,LambdaHSINPUT},
        {4,YV1INPUT},
        {5,YV2INPUT},
        {6,YV3INPUT},
        {7,eta1INPUT},
        {8,eta2INPUT},
        {9,eta3INPUT},
        {10,eta4INPUT},
        {30, vSINPUT},
        {40, gXINPUT},
        {42, g1XINPUT},
        {100, threeTimesU1QmINPUT},
        {101, U1QkINPUT},
        {102, twoTimesU1QbINPUT}
        };
    
        
ParametersToSolveTadpoles = {muH2,muS2};

DEFINITION[MatchingConditions]= {
 {vH, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM}, 
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
 };


BoundaryLowScaleInput={
 {gX,gXINPUT},
 {g1X,g1XINPUT},
 {gX1,0},
 {lamH, LambdaHINPUT},
 {lamS, LambdaSINPUT},
 {lamHS, LambdaHSINPUT},
 {YV1, YV1INPUT},
 {YV2, YV2INPUT},
 {YV3, YV3INPUT},
 {eta1, eta1INPUT},
 {eta2, eta2INPUT},
 {eta3, eta3INPUT},
 {eta4, eta4INPUT},
 {U1Qm, threeTimesU1QmINPUT/3},
 {U1Qk, U1QkINPUT},
 {U1Qb, twoTimesU1QbINPUT/2},
 {vS, vSINPUT},
 {Yx, LHInput[Yx]},
 {Yv, LHInput[Yv]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={LambdaHINPUT -> -0.09,  
                     gXINPUT->0.5,
                     LambdaSINPUT -> -0.03,
                     YV1INPUT -> 0.792,
                     YV2INPUT -> 0.792,
                     YV3INPUT -> 0.792,
                     vSINPUT -> 3000,
                     twoTimesU1QbINPUT -> -2,
                     threeTimesU1QmINPUT -> 1,
                     U1QkINPUT -> 1
                     };
                                    

