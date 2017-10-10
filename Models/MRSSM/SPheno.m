OnlyLowEnergySPheno = True;


MINPAR={{3,  TanBeta}};

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {mHd2, mHu2, mS2, mT2};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


ListDecayParticles =  {hh,Ah,Rh,Hpm,SRdp,SRum, Sd, Su, Se, Sv, Chi, Cha1,Cha2,Fv,Glu};
ListDecayParticles3B = {{Glu,"Glu.f90"},{Chi,"Chi.f90"},{Cha1,"Cha1.f90"},{Cha2,"Cha2.f90"}};

