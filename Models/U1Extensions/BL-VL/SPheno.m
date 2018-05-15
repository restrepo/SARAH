OnlyLowEnergySPheno = True;


MINPAR={{1,LambdaHINPUT},
        {2,Lambda2INPUT},
        {3,Lambda3INPUT},
        {4,Lambda6INPUT},
        {5,LambdaH2INPUT},
        {6,LambdaH3INPUT},
        {7,LambdaH6INPUT},
        {8,Lambda23INPUT},
        {9,Lambda26INPUT},
        {10,Lambda36INPUT},
        {11,f36INPUT},
        {12,Lambda26PrimeINPUT},
        {13,fXINPUT},
        {14,fYINPUT},
        {30, mu22INPUT},
        {31, v3INPUT},
        {32, v6INPUT},
        {40, gBLINPUT},
        {42, g1BLINPUT} };

RealParameters = {v3INPUT,v6INPUT,f36INPUT,Lambda26PrimeINPUT};        
        
ParametersToSolveTadpoles = {muH2,mu32,mu62,v2};


Tad1Loop[2] = 0;

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
 {gBL,gBLINPUT},
 {g1BL,g1BLINPUT},
 {gBL1,0},
 {lamH, LambdaHINPUT},
 {lam2, Lambda2INPUT},
 {lam3, Lambda3INPUT},
 {lam6, Lambda6INPUT},
 {lamH2, LambdaH2INPUT},
 {lamH3, LambdaH3INPUT},
 {lamH6, LambdaH6INPUT},
 {lam23, Lambda23INPUT},
 {lam26, Lambda26INPUT},
 {lam36, Lambda36INPUT},
 {f36, f36INPUT},
 {lam26P, Lambda26PrimeINPUT},
 {fX, fXINPUT},
 {fY, fYINPUT},
 {YNR, LHInput[YNR]},
 {fNR, LHInput[fNR]},
 {fNL, LHInput[fNL]}, 
 {fN6, LHInput[fN6]},
 {mN, LHInput[mN]},
 {fN, LHInput[fN]},
 {mu22, mu22INPUT},
 {v3, v3INPUT},
 {v6, v6INPUT}
};



ListDecayParticles = {Fu,Fe,Fd,hh,Ah,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={LambdaHINPUT -> -0.12,  
                     gBLINPUT->0.5,
                     Lambda2INPUT -> -0.6,
                     Lambda3INPUT -> -0.5,
                     Lambda6INPUT -> 0.1,
                     LambdaH2INPUT -> -0.1,
                     LambdaH3INPUT -> 0,
                     LambdaH6INPUT -> -0.01,
                     Lambda23INPUT -> -0.1,
                     Lambda26INPUT -> 0.5,
                     Lambda36INPUT -> -0.8,
                     f36INPUT -> 885,
                     Lambda26PrimeINPUT -> 0.1,
                     fXINPUT -> 0.9,
                     fYINPUT -> 0.9,
                     mu22INPUT -> 1000,
                     v3INPUT -> 2000,
                     v6INPUT -> 50,
                     gBL1INPUT -> 0,
                     g1BLINPUT -> 0                     
                     };
                     
SA`AddOneLoopDecay = False;                     

