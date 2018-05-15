OnlyLowEnergySPheno = True;

MINPAR={
        {1,mh1input},
        {2,mh2input},
        {3,mAinput},
        {4,mHpinput},
        {5,mPPinput},
        {6,tanAlpha},

        {10,vTInput}

       };

ParametersToSolveTadpoles = {mu2,MT};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {v, Sqrt[vSM^2-4*vTinput^2]}
 };


BoundaryLowScaleInput={
  {vT, vTInput},
  {LH, (mh1input^2 +    mh2input^2 tanAlpha^2)/((1 + tanAlpha^2) v^2)}, 
  {LHT, -((    2 (mh1input - mh2input) (mh1input + mh2input) tanAlpha)/((1 +   tanAlpha^2) v vTinput)) - (4 mAinput^2)/(  v^2 + 4 vTinput^2)}, 
{KHT, (Sqrt[2] mAinput^2 vTinput)/(  v^2 + 4 vTinput^2)}, 
  {LT2, (   mh2input^2 + mh1input^2 tanAlpha^2 -     4 mHpinput^2 (1 + tanAlpha^2) +     2 mPPinput^2 (1 + tanAlpha^2))/((1 + tanAlpha^2) vTinput^2) + (   8 mHpinput^2)/(v^2 + 2 vTinput^2) + (mAinput^2 v^2)/(   v^2 vTinput^2 + 4 vTinput^4)},
   {LHT2, (8 mHpinput^2)/(   v^2 + 2 vTinput^2) - (8 mAinput^2)/(   v^2 + 4 vTinput^2)},
   {LT, -((    2 (mAinput^2 - 2 mHpinput^2 + mPPinput^2))/vTinput^2) - (   8 mHpinput^2)/(v^2 + 2 vTinput^2) + (8 mAinput^2)/(   v^2 + 4 vTinput^2)}
};


ListDecayParticles = {Fu,Fe,Fd,hh,Hpm,Tpp,Ah};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={mh1input -> 125, mh2input -> 400, mAinput->400., mHpinput->400. tanAlpha -> 0.1, mPPinput -> 400, vTInput->3 };

AddTreeLevelUnitarityLimits=True;



RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};