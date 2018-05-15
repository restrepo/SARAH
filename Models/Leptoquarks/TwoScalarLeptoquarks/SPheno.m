OnlyLowEnergySPheno = True;

MINPAR={
 {1, mhIN},
 {2, msIN},
 {3, LambdaTinput},
 {4, LambdaPinput},
 {5, LambdaOinput},
 {6, LambdaHSinput},
 {7, LambdaHTinput},
 {8, LambdaHPinput},
 {9, LambdaHOinput},
 {10, LambdaSTinput},
 {11, LambdaSPinput},
 {12, LambdaSOinput}, 
 {13, LambdaTPinput},
 {14, LambdaTOinput},
 {15, LambdaPOinput},
 {16, LambdaHATinput},
 
 {21, mTinput},
 {22, mPinput},
 {23, mOinput},
 
 {25, vSinput}
};


ParametersToSolveTadpoles = {muH2, muS2};

DEFINITION[MatchingConditions]= {
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
 };

BoundaryLowScaleInput={

 {vS,          vSinput},
 {LambdaT,           LambdaTinput},
 {LambdaP,           LambdaPinput},
 {LambdaO,           LambdaOinput},
 {LambdaHS,           LambdaHSinput},
 {LambdaH,         (mhIN^2*v^2 + msIN^2*v^2 - Sqrt[mhIN^4*v^4 - 2*mhIN^2*msIN^2*v^4 + msIN^4*v^4 - 4*LambdaHS^2*v^6*vS^2])/(2*v^4)},
 {LambdaS,         (mhIN^2 + msIN^2 + Sqrt[v^4*(mhIN^4 - 2*mhIN^2*msIN^2 + msIN^4 - 4*LambdaHS^2*v^2*vS^2)]/v^2)/(4*vS^2)},
 {LambdaHT,           LambdaHTinput},
 {LambdaHP,           LambdaHPinput},
 {LambdaHO,           LambdaHOinput},
 {LambdaTS,           LambdaSTinput},
 {LambdaSP,           LambdaSPinput},
 {LambdaOS,           LambdaSOinput}, 
 {LambdaPT,           LambdaTPinput},
 {LambdaOT,           LambdaTOinput},
 {LambdaOP,           LambdaPOinput},
 {LambdaHat,           LambdaHATinput},
             
 {muT2,          (2*mTinput^2 - LambdaHT*v^2 - LambdaTS*vS^2)/2},
 {muP2,          (2*mPinput^2 - LambdaHP*v^2 - LambdaSP*vS^2)/2},
 {muO2,          (2*mOinput^2 - LambdaHO*v^2 - LambdaOS*vS^2)/2},
             

 {YT, LHInput[YT]},
 {YO, LHInput[YO]},
 {YP, LHInput[YP]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,Ah,PhiLQ,theta,OmegaLQ};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={
mhIN -> 125.,
msIN -> 750.,
LambdaHinput -> 0.1, 
LambdaSinput->0.2, 
vSinput->1000, 
mTinput->500, 
mPinput->500, 
mOinput->500, 
LambdaSTinput->1, 
LambdaSOinput->1, 
LambdaSPinput->1, 
LambdaSTinput->1, 
YT[a_,a_]->0.1
};

(* loop decays not working as long as neutrinos in the model are not mixed *)                     
SA`AddOneLoopDecay = False;
