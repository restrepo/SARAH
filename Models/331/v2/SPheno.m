
OnlyLowEnergySPheno = True;

MINPAR={
  {1,Lambda1Input},
  {2,Lambda2Input},
  {3,Lambda3Input},
  {4,Lambda12Input},
  {5,Lambda13Input},
  {6,Lambda23Input},
  {7,Lambda12tInput},
  {8,Lambda13tInput},
  {9,Lambda23tInput},
  {10,fInput},
  {11,TanBeta},
  {12,v3Input}
};

ParametersToSolveTadpoles = {mu12,mu22,mu32};

DEFINITION[MatchingConditions]= {
  {v1,vSM*Cos[ArcTan[TanBeta]]},
  {v2,vSM*Sin[ArcTan[TanBeta]]},
  {v3,v3Input},
  {g1, g2SM/0.24},
  {g2, g2SM},
  {g3, g3SM},
    {yl, YeSM*vSM/v2} 
 };

BoundaryLowScaleInput={
  {l1,Lambda1Input},
  {l2,Lambda2Input},
  {l3,Lambda3Input},
  {l12,Lambda12Input},
  {l13,Lambda13Input},
  {l23,Lambda23Input},
  {l12t,Lambda12tInput},
  {l13t,Lambda13tInput},
  {l23t,Lambda23tInput},
  {ftri,fInput},
  {yE, LHInput[yE]},
  {yu1, LHInput[yu1]},
  {yu2, LHInput[yu2]},
  {yu3, LHInput[yu3]},
  {yd1, LHInput[yd1]},
  {yd2, LHInput[yd2]},
  {yd3, LHInput[yd3]},
  {yJ1, LHInput[yJ1]},
  {yJ2, LHInput[yJ2]},
  {yJ3, LHInput[yJ3]}
};


ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hpm,Dpm,VZ,VZp,VXp,VYpp,FEE,FUU,FDD};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues = {
  Lambda1Input -> 0.1,
  Lambda2Input -> 0.13,
  Lambda3Input -> 0.1,
  Lambda12Input -> 0.5,
  Lambda13Input -> 0.5,
  Lambda23Input -> 0.05,
  Lambda12tInput -> 0.5,
  Lambda13tInput -> 0.5,
  Lambda23tInput -> 0.5,
  fInput -> -27,
  TanBeta -> 10,
  v3Input -> 2500,
  yE[a_,a_] -> 0.45,
  yu1[1] -> 0.1,
  yu2[2] -> 0.1,
  yu3[3] -> 0.1,
  yd1[1] -> 0.1,
  yd2[2] -> 0.1,
  yd3[3] -> 0.1,
  yJ1[1] -> 0.455,
  yJ2[2] -> 0.455,
  yJ3[1] -> 0.455
};


(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;