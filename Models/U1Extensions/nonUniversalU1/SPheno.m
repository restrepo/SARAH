OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1Input},
        {2,Lambda2Input},
        {3,Lambda3Input},
        {4,Lambda4Input},
        {5,LambdaH1SInput},
        {6,LambdaH2SInput},
        {7,LambdaSInput},
        {8,KapHSInput},
        {10, gXINPUT},
        {12, g1XINPUT},
        {20,TanBeta},
        {30, vSinput},
        {40, h2Tinput},
        {41, hXTinput}
        };

ParametersToSolveTadpoles = {M112,M222,muS2};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM*vSM/v1},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {v1,vSM*Cos[ArcTan[TanBeta]]},
 {v2,vSM*Sin[ArcTan[TanBeta]]}
 };


BoundaryLowScaleInput={
 {gX,gXINPUT},
 {g1X,g1XINPUT},
 {gX1,0},
 {Lambda1, Lambda1Input},
 {Lambda2, Lambda2Input},
 {Lambda3, Lambda3Input},
 {Lambda4, Lambda4Input},
 {lamH1S, LambdaH1SInput},
 {lamH2S, LambdaH2SInput},
 {lamS, LambdaSInput},
 {kapHS, KapHSInput},
 {vS,vSinput},
 {Yv, LHInput[Yv]},
 {h1D, LHInput[h1D]},
 {h2D, LHInput[h2D]},
 {h1U, LHInput[h1U]},
 {h2U, LHInput[h2U]},
 {h1T, LHInput[h1T]},
 {h2T, h2Tinput},
 {h1J, LHInput[h1J]},
 {h2J, LHInput[h2J]},
 {hXU, LHInput[hXU]},
 {hXT, hXTinput},
 {hXD, LHInput[hXD]},
 {hXJ, LHInput[hXJ]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hm,VZp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={Lambda1Input -> 0.22,
                     Lambda2Input -> 0.22,
                     Lambda3Input -> 0.0,
                     Lambda4Input -> -0.0,
                     LambdaSInput -> -0.0000878906,
                     KapHSInput -> -0.04,
                     TanBeta -> 10,
                     gXINPUT->0.5, 
                     vSinput->56568.5,
                     hXTinput -> 0.1};

