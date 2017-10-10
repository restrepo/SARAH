OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,LambdaPINPUT},
        {3,LambdaXINPUT},
        {4,LambdaHPINPUT},
        {5,LambdaHXINPUT},
        {6,LambdaPXINPUT},
        {30, vPINPUT},
        {31, muX2INPUT},
        {40, gXINPUT},
        {41, gX1INPUT},
        {42, g1XINPUT},
        {100, U1QaINPUT},
        {101, U1QbINPUT}
        };
    
        
ParametersToSolveTadpoles = {muH2,muP2,vX};
(*
Tad1Loop[2]=0;
*)

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
 {lamP, LambdaPINPUT},
 {lamX, LambdaXINPUT},
 {lamHP, LambdaHPINPUT},
 {lamHX, LambdaHXINPUT},
 {lamPX, LambdaPXINPUT}, 
 {muX2, muX2INPUT},
 {YPE, LHInput[YPE]},
 {YPN, LHInput[YPN]},
 {YPU, LHInput[YPU]},
 {YPD, LHInput[YPD]},
 {YXE, LHInput[YXE]},
 {YXN, LHInput[YXN]},
 {YXU, LHInput[YXU]},
 {YXD, LHInput[YXD]},
 {U1Qa, U1QaINPUT},
 {U1Qb, U1QbINPUT},
 {vP, vPINPUT},
 {Yv, LHInput[Yv]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,Ah,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={LambdaHINPUT -> -0.08,  
                     gXINPUT->0.08, 
                     muX2INPUT -> 300^2, 
                     vPINPUT -> 1400, 
                     LambdaPINPUT -> -0.1, 
                     LambdaXINPUT -> -0.12,
                     U1QaINPUT -> 1,
                     U1QbINPUT -> 1
                     (* in addition, use e.g.
                     YPEIN -> {{1,0,0},{0,1,0},{0,0,1}}
                     *)
                     };

