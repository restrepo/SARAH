OnlyLowEnergySPheno = True;

MINPAR={
        {1,lambda1Input},
        {2,lambda2Input},
        {3,lambda3Input},
        {4,lambda4Input},
        {5,lambda5Input},
        {6,mEt2Input},
	{7,YR1Input},
	{8,YR2Input}
       };

ParametersToSolveTadpoles = {mu2};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {v, vSM}
 };

BoundaryLowScaleInput={
  {LH, lambda1Input},
  {lambda2,lambda2Input},
  {lambda3,lambda3Input},
  {lambda4,lambda4Input},
  {lambda5,lambda5Input},
  {mEt2,mEt2Input},
  {Mn, LHInput[Mn]},
  {MDF, LHInput[MDF]},
  {YR1,YR1Input},
  {YR2,YR2Input}
};

AddTreeLevelUnitarityLimits=True;



ListDecayParticles = {Fu,Fe,Fd,hh,Hp,etR,etI,etp,Fre,Nv0};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={lambda1Input -> 0.27, mEt2Input->10000, YR1Input->0.01, YR2Input->0.01 };

(* turn off RGEs for loop-decays *)
(*SA`NoRGEsforDecays=True;*)

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};





