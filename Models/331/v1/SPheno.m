
OnlyLowEnergySPheno = True;

MINPAR={
  {1,Lambda1IN},
  {2,Lambda2IN},
  {3,Lambda3IN},
  {4,LambdaXIN},
  {5,Lambda12IN},
  {6,Lambda13IN},
  {7,Lambda23IN},
  {8,Lambda1XIN},
  {9,Lambda2XIN},
  {10,Lambda3XIN},
  {11,fInput},
  {12,kapIinput},
  {13,muX2Input},
  {14,TanBeta},
  {15,nIN}
};

ParametersToSolveTadpoles = {mu12,mu22,mu32};

QuadruplePrecision = {Fv};

DEFINITION[MatchingConditions]= {
  {vevk1,vSM*Cos[ArcTan[TanBeta]]},
  {vevk3,vSM*Sin[ArcTan[TanBeta]]},
  {g1, g2SM/0.57},
  {g2, g2SM},
  {g3, g3SM},
  {yl, YeSM*vSM/vevk1}
 };

BoundaryLowScaleInput={

  {l1,Lambda1IN},
  {l2,Lambda2IN},
  {l3,Lambda3IN},
  {lX,LambdaXIN},
  {l12,Lambda12IN},
  {l13,Lambda13IN},
  {l23,Lambda23IN},
  {l1X,Lambda1XIN},
  {l2X,Lambda2XIN},
  {l3X,Lambda3XIN},
  {f,fInput},
  {kap,kapIinput},
  {muX2,muX2Input},
  {vevn,nIN},

  {ya, LHInput[ya]},
  {ys, LHInput[ys]},
  {mS, LHInput[mS]},
  {yu1, LHInput[yu1]},
  {yu2, LHInput[yu2]},
  {yu3, LHInput[yu3]},
  {yu3t, LHInput[yu3t]},
  {yu3Xt, LHInput[yu3Xt]},
  {yd1, LHInput[yd1]},
  {yd2, LHInput[yd2]},
  {yd3, LHInput[yd3]},
  {yd1t, LHInput[yd1t]},
  {yd2t, LHInput[yd2t]},
  {yd1Xt, LHInput[yd1Xt]},
  {yd2Xt, LHInput[yd2Xt]}
};


ListDecayParticles = {Fu,Fe,Fd,Fv,hh,hhd,rhoX,rhoXt,Ah,Ahd,sigmaX,sigmaXt,Hpm,Hpmd,phiXp,VZ,VZp,VX,VY,VWpp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};

DefaultInputValues = {
  Lambda1IN -> 0.1,
  Lambda2IN -> 0.1,
  Lambda3IN -> 0.1,
  LambdaXIN -> 0.1,
  Lambda12IN -> 0.1,
  Lambda13IN -> 0.1,
  Lambda23IN -> 0.1,
  Lambda1XIN -> 0.1,
  Lambda2XIN -> 0.1,
  Lambda3XIN -> 0.0,
  fInput -> 2000,
  kapIinput -> 0.0,
  muX2Input -> 400,
  TanBeta -> 10,
  nIN -> 2000,
  ya[a_,a_] -> 0.1,
  ys[a_,a_] -> 1.0,
  mS[a_,a_] -> 10^(-7),
  yu3t[1] -> 0.2,
  yu3Xt[1] -> 0.2
};

(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;
