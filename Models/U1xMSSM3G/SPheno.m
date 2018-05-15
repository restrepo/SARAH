MINPAR={{1, mSUSY},
        {2, mC2input},
        {3, TanBeta},
        {4, TanBetaX},
        {5,Azero},
        {10, gXInput},         
        {11, g1XInput},         
        {12, MZpInput} };
        
EXTPAR = {
         {1,M1input},
         {2,M2input},
         {3,M3input},
         {4,MXinput},
         {5,MYXinput},         
         
         {10, MuInput},
         {11, BMuInput},
         
         {61,LambdaInput},
         {62,KappaInput},
         {63,ALambdaInput},
         {64,AKappaInput},
         {65,vSInput},
         {66, MSInput},         
         {67, BMSInput},                  

          {70, LambdaCinput},
          {71, ALambdaCinput},
         
          {51, lUinput},
          {52, lEinput},
          {53, MVUinput},
          {54, MVEinput}
          
          

          };        


RealParameters = {TanBeta, TanBetaX, mSUSY};
UseParameterAsGUTscale = {mSUSY};  

RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;

ParametersToSolveTadpoles = {mHd2, mHu2, mC12, lw,mS2};

DEFINITION[MatchingConditions]=Default[THDMII];


BoundaryHighScale={
{gX, gXinput},
{g1X,g1Xinput},
{gX1,0},

{Yn, LHInput[Yn]},
{Yv,  LHInput[Yv]},
{Yup,LHInput[Yup]},
{Yep,LHInput[Yep]},
{lambdaE, DIAGONAL*lEinput},
{lambdaU, DIAGONAL*lUinput},

{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{T[Yn], Azero*Yn},
{T[Yup], Azero*Yup},
{T[Yep], Azero*Yep},
{T[lambdaE], Azero*lambdaE},
{T[lambdaU], Azero*lambdaU},

{\[Mu], MuInput},
{MVU, DIAGONAL*(MVUinput-(lUinput*vSinput)/Sqrt[2])},
{MVE, DIAGONAL*(MVEinput-(lEinput*vSinput)/Sqrt[2])},
{MS, MSInput},
{B[\[Mu]], BMuInput},
{B[MS], BMSInput},
{B[MVU], -lambdaU*(lw+Sqrt[2]*MS*xS)},
{B[MVE], -lambdaE*(lw+Sqrt[2]*MS*xS)},




{lambdaH, LambdaInput},
{T[lambdaH], ALambdaInput*lambdaH},
{kappa, KappaInput},
{T[kappa], AKappaInput*kappa},
{lambdaC, lambdaCInput},
{T[lambdaC], ALambdaCinput*LambdaCInput},


{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{mvR2, DIAGONAL mSUSY^2},
{mUX2, DIAGONAL mSUSY^2},
{mUXp2, DIAGONAL mSUSY^2},
{mEX2, DIAGONAL mSUSY^2},
{mEXp2, DIAGONAL mSUSY^2},
{meEX2, 0},
{muUX2, 0},

{MtE,LHInput[MtE]},
{MtU,LHInput[MtU]},
{B[MtE],LHInput[B[MtE]]},
{B[MtU],LHInput[B[MtU]]},


{mC22, mC2input^2},


{MassB, M1input},
{MassWB,M2input},
{MassG,M3input},
{MassBX,MXinput},
{MassBBX,MYXinput},

{L[lw],0}


};

BoundarySUSYScale={
{xS, vSInput},
{x2,Sqrt[4 MZpInput^2 - gX^2 v^2]/(2 gX)*Cos[ArcTan[TanBetaX]]},
{x1,Sqrt[4 MZpInput^2 - gX^2 v^2]/(2 gX)*Sin[ArcTan[TanBetaX]]},
 {g1T,(g1*gX-g1X*gX1)/Sqrt[gX^2+gX1^2]},
 {gXT, Sqrt[gX^2+gX1^2]},
 {g1XT,(g1X*gX+gX1*g1)/Sqrt[gX^2+gX1^2]},
 {g1, g1T},
 {gX, gXT},
 {g1X, g1XT},
 {gX1,0},
 {L[lw],0}
};


BoundaryEWSBScale = {
 {g1T,(g1*gX-g1X*gX1)/Sqrt[gX^2+gX1^2]},
 {gXT, Sqrt[gX^2+gX1^2]},
 {g1XT,(g1X*gX+gX1*g1)/Sqrt[gX^2+gX1^2]},
 {g1, g1T},
 {gX, gXT},
 {g1X, g1XT},
 {gX1,0},
 
 {B[MVU], -lambdaU*(lw+Sqrt[2]*MS*xS)},
 {B[MVE], -lambdaE*(lw+Sqrt[2]*MS*xS)},
 {L[lw],0}
};

InitializationValues = {
 {gX, 0.5},
 {g1X, -0.06},
 {gX1, -0.06}
 }




ListDecayParticles = Automatic; 
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Chi,"Chi.f90"},{Cha,"Cha.f90"},{Glu,"Glu.f90"}};


DefaultInputValues = {mSUSY -> 2500, mC2input->2500, TanBeta->20, TanBetaX->1, gXInput->0.5, MZpInput->3000, M1input->1000, M2input->1000, M3input->1000, \
 MXinput ->1000, MuInput->1000, BMuInput->10^6, LambdaInput->10^-4, ALambdaInput->1000, vSInput->500, MSInput->-100, BMSInput->3.855 10^6, \
 LambdaCinput->-0.2, ALambdaCinput->1000,lUinput->1, lEinput->1, MVUinput->1000, MVEinput->500, Yv[a_,a_]->0.0001};
