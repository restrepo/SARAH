MINPAR={{ 1, m0},
        { 2, mGauginos},
        { 3, TanBeta},                
        { 4, Muinput},        
        { 5, Azero},
        { 6, MAinput}     
        };

RealParameters = {TanBeta};

UseParameterAsGUTscale = {m0};

ParametersToSolveTadpoles = {M112,M222};

RenormalizationScaleFirstGuess = 175.^2;
RenormalizationScale = 175.^2;

BoundaryHighScale={
 {T[Ye], Azero*Ye},
 {T[Yd], Azero*Yd},
 {T[Yu], Azero*Yu},
 {mq2, DIAGONAL m0^2},
 {ml2, DIAGONAL m0^2},
 {md2, DIAGONAL m0^2},
 {mu2, DIAGONAL m0^2},
 {me2, DIAGONAL m0^2}
};


AddTreeLevelUnitarityLimits=True;

DEFINITION[MatchingConditions]={ 
 {v1,vSM*Cos[ArcTan[TanBeta]]},
 {v2,vSM*Sin[ArcTan[TanBeta]]},
 {Ye, YeSM*vSM/v1},
 {Yd, YdSM*vSM/v1},
 {Yu, YuSM*vSM/v2},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


DefaultInputValues ={m0 -> 10^6, mGauginos -> 10^6,Azero -> 0, Muinput->10^6, MAinput->500, TanBeta->2.};

(* ------------------------------------ *)
(* Matching to the MSSM                 *)
(* ------------------------------------ *)


MatchingToModel={"MSSM"};
MatchingScale = {m0};


IncludeParticlesInThresholds={
 {Su,Sd,Se,Sv}
};

BoundaryMatchingScaleUp={
 {
  {MassB, mGauginos},
  {MassWB,mGauginos},
  {MassG, mGauginos},
  {\[Mu], Muinput}
 }
};
 
BoundaryMatchingScaleDown={
{
 {MG, mGauginos},
 {MW, mGauginos},
 {MB, mGauginos},
 {MuSplit,\[Mu]},
 {M12, -MAinput^2 TanBeta/(1+TanBeta^2)},
 {g1u,Sqrt[3/5] g1 Sin[ArcTan[TanBeta]]   },
 {g2u,g2 Sin[ArcTan[TanBeta]]   }, 
 {g1d,Sqrt[3/5] g1 Cos[ArcTan[TanBeta]]   },
 {g2d,g2 Cos[ArcTan[TanBeta]]   } ,
 {Lambda1, -1/6 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]},
 {Lambda2, -1/6 EFTcoupNLO[hh[2].hh[2].hh[2].hh[2]]},
 {Lambda3, -EFTcoupNLO[hh[1].hh[1].Hpm[2].conj[Hpm[2]]]},
 {Lambda4,  EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[1]]] + I*EFTcoupNLO[hh[1].Ah[2].Hpm[1].conj[Hpm[2]]]},
 {Lambda5,  EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[1]]] - I*EFTcoupNLO[hh[1].Ah[2].Hpm[1].conj[Hpm[2]]]},
 {Lambda6, -EFTcoupNLO[hh[1].hh[2].Hpm[1].conj[Hpm[1]]]},
 {Lambda7, -EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[2]]]}
 }
};

AssumptionsHighScale={
{
 {vd, epsUV},
 {vu, epsUV},
 {B[\[Mu]],epsUV^2}
 }
};

ParametersToSolveTadpoleMatchingScale={
 {mHd2,mHu2}
};
 
