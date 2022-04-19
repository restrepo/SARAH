OnlyLowEnergySPheno = True;


MINPAR={{1,LambdahINPUT},
        {2,LambdasINPUT},
        {3,Lambda1INPUT},
	{4,Lambda2INPUT},
        {5,Lambda3INPUT},
        {6,Lambda4INPUT},	
        {7,Lambda5INPUT},
	{8,Lambda6INPUT},
        {9,Lambda7INPUT},
        {10,Lambda8INPUT},
        {11,mu1INPUT},
        {12,mu2INPUT},
        {13,mu3INPUT},
        {20, g1pINPUT},
        {21, g1p1INPUT},
        {22, g11pINPUT},
        {30, vXinput} };

ParametersToSolveTadpoles = {MuP,muh};


DEFINITION[MatchingConditions]= 
{{vH, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}};


BoundaryLowScaleInput={
 {Lh, LambdahINPUT},
 {Ls, LambdasINPUT},
 {L1, Lambda1INPUT},
 {L2, Lambda2INPUT},
 {L3, Lambda3INPUT},
 {L4, Lambda4INPUT},
 {L5, Lambda5INPUT},
 {L6, Lambda6INPUT},
 {L7, Lambda7INPUT},
 {L8, Lambda8INPUT},
 {mu1, mu1INPUT},
 {mu2, mu2INPUT},
 {mu3, mu3INPUT},
 {g1p,g1pINPUT},
 {g11p,g11pINPUT},
 {g1p1,g1p1INPUT},
 {vX,vXinput},
 {fl, LHInput[fl]},
 {hl, LHInput[hl]}
};


AddTreeLevelUnitarityLimits=True;

ListDecayParticles = {Fu,Fe,Fd,Fv,hh,VZp,Hm};
ListDecayParticles3B = {{Fv,"Fv.f90"},{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

FlagLoopContributions = True;

DefaultInputValues ={LambdahINPUT -> -0.127, LambdasINPUT -> -7.2*10^-5, g1pINPUT->0.5, vXinput->2500};


(* turn off RGEs for loop-decays *)
SA`NoRGEsforDecays=True;

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

