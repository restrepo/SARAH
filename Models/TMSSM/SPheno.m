(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)

MINPAR={{1,mSUSY},
        {3,TanBeta},
        {5,Azero}};
        
EXTPAR = {
          {1, M1input},
          {2, M2input},
          {3, M3input},
          {30, MuInput},
          {31, BMuInput},
          {35, ALambdaInput}, 
          {40, MTinput},
          {41, BMTinput},
          {80, LambdaInput},
          {85, vTinput}
          };        



RealParameters = {TanBeta,mSUSY};
UseParameterAsGUTscale = {mSUSY};  

ParametersToSolveTadpoles = {mHd2, mHu2,mT2};

DEFINITION[MatchingConditions]=Default[THDMII];

RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;

ConditionGUTscale = g1 == g2;

BoundarySUSYScale={
{vT, vTinput},  
{\[Lambda], LambdaInput}
};

BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{MT, MTinput},
{B[MT], BMTinput},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{MassB, M1input},
{MassWB,M2input},
{MassG,M3input},
{B[\[Mu]], BMuInput},
{\[Mu], MuInput}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues[1] = {mSUSY -> 1500, TanBeta -> 10, Azero->-2000, M1input -> 200, M2input->400, M3input->1500, MTinput->500, BMTinput->-10^6, MuInput->200, BMuInput->10^6, vTinput->2,LambdaInput-> -0.2, ALambdaInput->-1500 };



RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
