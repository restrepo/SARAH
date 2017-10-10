OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1Input},
        {2,Lambda2Input},
        {3,Lambda3Input},
        {4,Lambda4Input},
        {5,Lambda5Input},
        {6,Lambda6Input},
        {7,Lambda7Input},
        {9,M12input},
        {10,TanBeta},
        {11,etaInput} };

RealParameters = {TanBeta,etaInput};

ParametersToSolveTadpoles = {M112,M222,im[M12]};
Tad1Loop[4]=-Tad1Loop[3]*v1/v2;

DEFINITION[MatchingConditions]= {
 {v1,vSM*Cos[ArcTan[TanBeta]]},
 {v2,vSM*Sin[ArcTan[TanBeta]]},
 {Ye, YeSM*vSM/v1- v2/v1*epsE},
 {Yd, YdSM*vSM/v1- v2/v1*epsD},
 {Yu, YuSM*vSM/v2- v1/v2*epsU},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
 };

BoundaryLowScaleInput={
 {Lambda1,Lambda1Input},
 {Lambda2,Lambda2Input},
 {Lambda3,Lambda3Input},
 {Lambda4,Lambda4Input},
 {Lambda5,Lambda5Input},
 {Lambda6,Lambda6Input},
 {Lambda7,Lambda7Input},
 {re[M12], M12input},

 {eta, etaInput}
};

AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,hh,Hm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};


DefaultInputValues ={Lambda1Input -> 0.1, Lambda2Input -> 0.13, Lambda3Input -> 1.1, Lambda4Input ->-0.5, Lambda5Input ->0.5,  M12input -> 40000, TanBeta->50};

(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;

