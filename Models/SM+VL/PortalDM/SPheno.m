OnlyLowEnergySPheno = True;


MINPAR={{1,MSInput},
        {2,lamSInput},
        {3,kapSInput},
        {4,lamHSInput},
        {5,kapHSInput},
        {6,lamDMInput},
        {7,lamSDMInput},
        {8,lamHDMInput},
        {9,mDMSInput},
        {10,kapSDMInput},
        {11,YXInput},
        {12,mXInput},
        {13,YTInput},
        {14,mTInput},
        {15,YQInput},
        {16,mQInput},
        {17,YQTInput},
        {18,YQTpInput},
        {19,mDMFInput},
        {20,YDMFInput},
        {21,LambdaInput}
        };


ParametersToSolveTadpoles = {mu2,vS};

DEFINITION[MatchingConditions]= {
  {v, vSM}, 
  {Ye, YeSM},
  {Yd, YdSM},
  {Yu, YuSM},
  {g1, g1SM},
  {g2, g2SM},
  {g3, g3SM}
 };


BoundaryLowScaleInput={

  {\[Lambda],LambdaInput},
  {MS, MSInput^2},
  {mX, mXInput},
  {mDMS, mDMSInput^2},
  {kapSDM, kapSDMInput},
  {lamS, lamSInput},
  {lamDM, lamDMInput},
  {lamHS, lamHSInput},
  {lamHDM, lamHDMInput},
  {lamSDM, lamSDMInput},
  {kapHS,kapHSInput},
  {kapS, kapSInput},
  {YX, YXInput},
  {YT,YTInput},
  {mT,mTInput},
  {YQ,YQInput},
  {mQ,mQInput},
  {YQT,YQTInput},
  {YQTp,YQTpInput},
  {mDMF,mDMFInput},
  {YDMF,YDMFInput}
};




ListDecayParticles = {Fu,Fe,Fd,hh,sDM};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues ={LambdaInput -> 0.17,
		     MSInput -> 750,
                     lamSInput -> 1,
                     kapSInput -> 3600,
                     lamHSInput -> 0,
                     kapHSInput -> 0,
                     lamDMInput -> 1.,
                     lamSDMInput -> 0.1,
                     lamHDMInput -> 0.,
                     mDMSInput -> 100.,
                     kapSDMInput -> 0,
                     YXInput -> 1., 
                     mXInput -> 500.,
                     YTInput -> 1.,
                     mTInput -> 500,
                     YQInput -> 1,
                     mQInput -> 500,
                     YQTInput -> 0.1,
                     YQTpInput -> 0.1,
                     mDMFInput -> 100,
                     YDMFInput -> 0.
                     };
                     
RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

(* turn off RGEs for loop-decays *)                     
SA`NoRGEsforDecays=True;