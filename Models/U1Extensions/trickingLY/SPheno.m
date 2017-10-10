OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,LambdaSINPUT},
        {3,LambdaHSINPUT},
        {30, vSINPUT},
        {40, gXINPUT},
        {42, g1XINPUT},
        {100, U1QXINPUT}
        };
    
        
ParametersToSolveTadpoles = {muH2,muS2};


DEFINITION[MatchingConditions]= {
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {Ye, YeSM},
 {Yu, YuSM},
 {Yd, YdSM},
 {vH, vSM}
};


BoundaryLowScaleInput={
 {gX,gXINPUT},
 {g1X,g1XINPUT},
 {gX1,0},
 {lamH, LambdaHINPUT},
 {lamS, LambdaSINPUT},
 {lamHS, LambdaHSINPUT},
 {eta1, LHInput[eta1]},
 {eta2, LHInput[eta2]},
 {eta3, LHInput[eta3]},
 {U1QX, U1QXINPUT},
 {vS, vSINPUT},
 {Yv, LHInput[Yv]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"},{VZp,"VZp.f90"}};


DefaultInputValues ={LambdaHINPUT -> 0.1,  
                     gXINPUT->0.5,
                     vSINPUT -> 500,
                     LambdaSINPUT -> 0.1,
                     U1QXINPUT -> 2
                     };

