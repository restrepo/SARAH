(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)



MINPAR={{1,mSUSY},
        {3,TanBeta} };

EXTPAR = {
          {1, MDBinput},
          {2, MDWinput},
          {3, MDOinput},
          {10, mRd2input},
          {11, mRu2input},

          {40, MuDinput},
          {41, MuUinput},
          {45, BmuInput},

          {80, LSDinput},
          {81, LSUinput},
          {82, LTDinput},
          {83, LTUinput},

          {91, vSinput},
          {92, vTinput}
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
{LamSD, LSDinput},
{LamSU, LSUinput},  
{LamTD, LTDinput},
{LamTU, LTUinput},

{MuD, MuDinput},
{MuU, MuUinput},
{B[MuD],0},
{B[MuU],0},
{B[\[Mu]], BmuInput},
{\[Mu], 0},
{mRd2, mRd2input},
{mRu2, mRu2input},

{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{moc2, mSUSY^2},
{MDBS, MDBinput},
{MDWBT,MDWinput},
{MDGoc,MDOinput}
};

DEFINITION[MatchingConditions]=Default[THDMII];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues = {mSUSY->1000, TanBeta->10, vSinput ->0.7, vTinput->-0.2, MDBinput->200, MDWinput->500, MDOinput->1400, mRd2input->10^6, mRu2input->10^6, LSDinput->1.1, LSUinput->-1.1, LTDinput->-1.0, LTUinput->-1.0, MuDinput->400, MuUinput->400,BmuInput->9*10^4};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
