OnlyLowEnergySPheno = True;

MINPAR={
  {1,lambda1Input},
  {2,lambda2Input},
  {3,lambda3Input},
  {4,lambda4Input},
  {5,lambda5Input},
  {6,lambda6Input},
  {7,lambda7Input},
  {8,lambda8Input},
  {9,lambda9Input},
  {10,lambda10Input},
  {11,lambdahInput},
  {12,MhInput},
  {13,MuInput},
  {14,mEt2Input}
  
};

ParametersToSolveTadpoles = {mH2,M12};

BoundaryLowScaleInput={
  {Yh, LHInput[Yh]},
  {lambda1,lambda1Input},
  {lambda2,lambda2Input},
  {lambda3,lambda3Input},
  {lambda4,lambda4Input},
  {lambda5,lambda5Input},
  {lambda6,lambda6Input},
  {lambda7,lambda7Input},
  {lambda8,lambda8Input},
  {lambda9,lambda9Input},
  {lambda10,lambda10Input},
  {lambdah,lambdahInput},
  {Mh, MhInput},
  {Mu, MuInput},
  {mEt2,mEt2Input}
};

DEFINITION[MatchingConditions]= {
  {v, vSM},
  {vv, 0},
  {Ye, YeSM},
  {Yd, YdSM},
  {Yu, YuSM},
  {g1, g1SM},
  {g2, g2SM},
  {g3, g3SM}
    };

ListDecayParticles = {Fu,Fe,Fd,Fv,VZ,VWp,hh,Hm,etI};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

(*ConditionGUTscale = g1 == g2;*)

DefaultInputValues ={
  lambda1Input -> 0.1,
  lambda2Input -> 0.13,
  lambda3Input -> 1.1,
  lambda4Input -> -0.5,
  lambda5Input -> 0.5,
     mEt2Input -> 40000.
};
