(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)



MINPAR={{1,mSUSY},
        {3,TanBeta} };

EXTPAR = {
          {1, MDBinput},
          {2, MDWinput},
          {3, MDOinput},
          {20, MuInput},
          {21, BMuInput},

          {30, MSinput},
          {31, MTinput},
          {32, MOinput},
          {33, BMSinput},
          {34, BMTinput},
          {35, BMOinput},

          {80, LSinput},
          {81, ALSinput},
          {82, LTinput},
          {83, ALTinput},
          {84, LSTinput},
          {85, ALSTinput},
          {86, KapInput},
          {87, AKapInput},

          {91, vSinput},
          {92, vTinput},

          {95, TadInput},
          {96, LTadInput}   
          };

RealParameters = {TanBeta, mSUSY};

ParametersToSolveTadpoles = {mHd2, mHu2, mS2, mT2};


RealParameters = {TanBeta,mSUSY};
UseParameterAsGUTscale = {mSUSY};  

RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;

BoundarySUSYScale={
{vT, vTinput},  
{vS, vSinput}
};

BoundaryHighScale={
{\[Lambda], LSinput},
{T[\[Lambda]], ALSinput*LSinput},
{LT, LTinput},
{T[LT], ALTinput*LTinput},
{LS, LSTinput},
{T[LS], ALSTinput*LSTinput},
{\[Kappa],KapInput},
{T[\[Kappa]],AKapInput*KapInput},

{L1, TadInput},
{L[L1], LTadInput},

{B[\[Mu]], BMuInput},
{\[Mu], MuInput},


{MS, MSinput},
{MT, MTinput},
{MO, MOinput},
{B[MS], BMSinput},
{B[MT], BMTinput},
{B[MO], BMOinput},



{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{moc2, mSUSY^2},

{T[Ye],0},
{T[Yd],0},
{T[Yu],0},
{MassB, 0},
{MassWB, 0},
{MassG, 0},

{MDBS, MDBinput},
{MDWBT,MDWinput},
{MDGoc,MDOinput}
};

DEFINITION[MatchingConditions]=Default[THDMII];



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues = {mSUSY->1500, TanBeta->2, vSinput ->-400, vTinput->1, LSinput->0.6, ALSinput->0,KapInput->-0.3, AKapInput->0,  \
BMuInput->10^6, MuInput->0, MSinput->0, MTinput->0, MOinput->0, BMSinput->-10^6, BMTinput->10^6,BMOinput->10^6, MDBinput->200, MDWinput->500, MDOinput->1400, LTinput-> -0.001, ALTinput -> 0,LSTinput-> 0, ALSTinput -> 0,  TadInput->0,LTadInput ->0};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
