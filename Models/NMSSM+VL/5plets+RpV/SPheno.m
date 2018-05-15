(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)



MINPAR={{1,mSUSY},
        {2,MV},
        {3,TanBeta},
        {5,Azero},
        {6,Bzero}, 
        {7, Lzero} };
        
EXTPAR = {
         {1,M1input},
         {2,M2input},
         {3,M3input},
         
         {10, MuInput},
         {11, BMuInput},

         {61,LambdaInput},
         {62,KappaInput},
         {63,ALambdaInput},
         {64,AKappaInput},
         {65,vSInput},
         {66,TadInput},
         {67,MSInput},         
         

          {40, kappa5input},
          {41, kappa5pinput},
          {50, lDinput},
          {51, lLinput},

          {91, vLinput},
          {92, vLpinput}

          };
          
          
RealParameters = {TanBeta, mSUSY};

ParametersToSolveTadpoles = {mHd2, mHu2, ms2,ml52,ml5p2};


RealParameters = {TanBeta,mSUSY};
UseParameterAsGUTscale = {mSUSY};  

RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;

BoundarySUSYScale={
{vS, vSinput},
{v5, vLinput},
{v5p, vLpinput}
};

BoundaryHighScale={
{kappa, KappaInput},
{lambda, LambdaInput},
{T[kappa], AKappaInput*KappaInput},
{T[lambda], ALambdaInput*LambdaInput},
{tS, TadInput},
{L[tS], Lzero*TadInput},
{MS, MSInput},
{B[MS],Bzero*MSInput},

{lD5, lDinput},
{lL5, lLinput},
{kap5, kappa5input},
{kap5p, kappa5pinput},
{T[lD5], Azero*lDinput},
{T[lL5], Azero*lLinput},
{T[kap5], Azero*kappa5input},
{T[kap5p], Azero*kappa5pinput},

{T[Yu], Azero*Yu},
{T[Yd], Azero*Yd},
{T[Ye], Azero*Ye},

{MVD, MV},
{MVL, MV},
{B[MVD], Bzero*MV},
{B[MVL], Bzero*MV},

{B[\[Mu]], BmuInput},
{\[Mu], MuInput},

{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{md52, mSUSY^2},
{md5p2, mSUSY^2},
{MassB, M1input},
{MassWB, M2input},
{MassG, M3input}
};

DEFINITION[MatchingConditions]=Default[THDMII];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues = {mSUSY->1000, MV->2000, TanBeta->10, Azero->-2000, Bzero->0, M1input->100, M2input->200, M3input->1500, MuInput->-500, BMuInput->7 10^6,vSInput->150, MSInput->-2500,
KappaInput->0.2, AKappaInput->1000,ALambdaInput->3000, LambdaInput->0.3,kappa5input->0.01,lDinput->0.4,lLinput->0.4,vLinput->3,vLpinput->3};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
