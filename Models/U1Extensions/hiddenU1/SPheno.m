OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,LambdaHS1INPUT},
        {3,LambdaHS2INPUT},
        {4,LambdaS1INPUT},
        {5,LambdaS2INPUT},
        {6,LambdaS1S2INPUT},
        {7,sigma1INPUT},
        {8,sigma2INPUT},
        {9,sigma3INPUT},
        {10, fXINPUT},
        {11, MxqINPUT},
        {20, gXINPUT},
        {22, g1XINPUT},
        {30, vSinput},
        {31, vS2input}};

ParametersToSolveTadpoles = {muS12,muH2,muS22};

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
 {lamHS1, LambdaHS1INPUT},
 {lamHS2, LambdaHS2INPUT},
 {lamS1, LambdaS1INPUT},
 {lamS2, LambdaS2INPUT},
 {lamS1S2, LambdaS1S2INPUT},
 {sigma1, sigma1INPUT},
 {sigma2, sigma2INPUT},
 {sigma3, sigma3INPUT},
 {YxL, LHInput[YxL]},
 {vS,vSinput},
 {vS2,vS2input},
 {fX, fXINPUT},
 {Mxq, MxqINPUT}
};



ListDecayParticles = {Fu,Fe,Fd,hh,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};

DEFINITION[MatchingConditions]=Default[OHDM];


DefaultInputValues ={LambdaHINPUT -> -0.085,  
                     gXINPUT->0.5, 
                     vSinput->2000,
                     LambdaS1INPUT -> -0.1,
                     LambdaS2INPUT -> -0.1,
                     LambdaS1S2INPUT -> -0.3,
                     sigma3INPUT -> 50,
                     fXINPUT -> 0.5,
                     MxqINPUT -> 1000,
                     vS2input -> 100};

