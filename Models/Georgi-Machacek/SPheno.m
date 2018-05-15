OnlyLowEnergySPheno = True;

MINPAR={
        {1,Lambda1input},
        {2,Lambda2input},
        {3,Lambda3input},
        {4,Lambda4input},
        {5,Lambda5input},

        {11, M1input},
        {12, M2input},
        
        {14, sHinput}

       };

ParametersToSolveTadpoles = {mu2,Meta,MXi};

DEFINITION[MatchingConditions]= {
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {vPhi,(sHinput vSM)/(2 Sqrt[2])},
 {vDoub, Sqrt[vSM^2-8*vPhi^2]},
 {Ye, YeSM vSM/vDoub},
 {Yd, YdSM vSM/vDoub},
 {Yu, YuSM vSM/vDoub}
 };

BoundaryLowScaleInput={
  {Lambda1, Lambda1input},
  {Lambda2a, Lambda2input},
  {Lambda2b, Lambda2input},
  {Lambda3a, Lambda3input},
  {Lambda3b, Lambda3input},
  {Lambda3c, Lambda3input},
  {Lambda4a, Lambda4input},
  {Lambda4b, Lambda4input},
  {Lambda4c, Lambda4input},
  {Lambda5a, Lambda5input},
  {Lambda5b, Lambda5input},    
  {M1a, M1input},
  {M1b, M1input},
  {M2, M2input},
  {vEta,vPhi}
   
};


ListDecayParticles = {Fu,Fe,Fd,hh,Hpm,xiMM,Ah};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={M1input->1000, M2input->1000,Lambda1input->0.2,Lambda2input->0.5,Lambda3input->0.5,Lambda4input->0.5,Lambda5input->0.5,sHinput->0.2 };

AddTreeLevelUnitarityLimits=True;

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

(* turn off RGEs for loop-decays *)                     
SA`NoRGEsforDecays=True;
