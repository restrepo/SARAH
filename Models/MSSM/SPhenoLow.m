OnlyLowEnergySPheno = True;


MINPAR={{3,  TanBeta}};

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {mHd2, mHu2};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

FlagLoopContributions = True;  

ListDecayParticles =  {hh,Ah,Hpm, Sd, Su, Se, Sv, Chi, Cha, Fv};
ListDecayParticles3B = {{Cha,"Cha.f90"},{Chi,"Chi.f90"}};


