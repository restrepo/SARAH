OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,LambdaSINPUT},
        {3,LambdaHSINPUT},
        {4,LambdaHPINPUT},
        {5,LambdaHPSINPUT},
        {6,Lambda3INPUT},
        {7,Lambda4INPUT},
        {8,eta1INPUT},
        {9,eta2INPUT},
        {10,eta3INPUT},  
        {11,mXTINPUT},
        {12,mXNINPUT},
        {20, muHP2INPUT},
        {30, vSINPUT},
        (*{31, vHPINPUT},*)
        {40, gXINPUT},
        {41, gX1INPUT},
        {42, g1XINPUT} };
    
        
ParametersToSolveTadpoles = {muH2,muS2,vHP};

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
 {gX1,gX1INPUT},
 {lamH, LambdaHINPUT},
 {lamS, LambdaSINPUT},
 {lamHS, LambdaHSINPUT},
 {lamHP, LambdaHPINPUT},
 {lamHPS, LambdaHPSINPUT}, 
 {lam3, Lambda3INPUT},
 {lam4, Lambda4INPUT}, 
 {eta1, eta1INPUT},
 {eta2, eta2INPUT},
 {eta3, eta3INPUT},
 {muHP2, muHP2INPUT},
 {mXT, mXTINPUT},
 {mXN, mXNINPUT},
 {vS, vSINPUT},
 (*{vHP, vHPINPUT},*)
 {Yv, LHInput[Yv]},
 {Yt, LHInput[Yt]},
 {Yn, LHInput[Yn]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,Hm,Ah,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={LambdaHINPUT -> 0.12,  
                     gXINPUT->0.5,
                     LambdaSINPUT -> 0.28,
                     LambdaHPINPUT -> 0.1,
                     eta1INPUT -> 0.1,
                     eta2NPUT -> 0.1,
                     eta3INPUT -> 0.1,
                     mXTINPUT -> 1000,
                     mXNINPUT -> 1000,
                     muHP2INPUT -> 10^6,
                     vSINPUT -> 1000
                     };


SA`AddOneLoopDecay = False;