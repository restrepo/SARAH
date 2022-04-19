OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1IN},
        {2,LamSHIN},
        {3,LamSIN},
        {4,MS2Input},
        {5,MDFInput}
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
   
  {Lambda1,Lambda1IN},
  {LamSH,LamSHIN},
  {LamS,LamSIN},
  {MS2, MS2Input},
  {MDF, MDFInput},
  {YDF, LHInput[YDF]}
};

AddTreeLevelUnitarityLimits=True;

ListDecayParticles = {Fu,Fe,Fd,hh,ss,Fxe,Fxv};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;  

DefaultInputValues ={Lambda1IN -> 0.28, LamSHIN -> 0.01, LamSIN -> 0., MS2Input -> 200., MDFInput->200. };

(* turn off RGEs for loop-decays *)
(*SA`NoRGEsforDecays=True;*)

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
