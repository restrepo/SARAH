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


BoundaryHighScale={
{gX, gXinput},
{g1X,g1Xinput},
{gX1,0},

{Yn, LHInput[Yn]},
{Yv,  LHInput[Yv]},
{Yup,LHInput[Yup]},
{Yep,LHInput[Yep]},
{lambdaE, lEinput},
{lambdaU, lUinput},

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
{MVU, MVUinput-(lambdaU*vSinput)/Sqrt[2]},
{MVE, MVEinput-(lambdaE*vSinput)/Sqrt[2]},
{MS, MSInput},
{B[\[Mu]], BMuInput},
{B[MS], BMSInput},
{B[MVU], -lUinput*lw},
{B[MVE], -lEinput*lw},




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
{mUX2, mSUSY^2},
{mUXp2, mSUSY^2},
{mEX2, mSUSY^2},
{mEXp2, mSUSY^2},
{meEX2, 0},
{muUX2, 0},


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
 {gX1,0}
};


BoundaryEWSBScale = {
 {g1T,(g1*gX-g1X*gX1)/Sqrt[gX^2+gX1^2]},
 {gXT, Sqrt[gX^2+gX1^2]},
 {g1XT,(g1X*gX+gX1*g1)/Sqrt[gX^2+gX1^2]},
 {g1, g1T},
 {gX, gXT},
 {g1X, g1XT},
 {gX1,0}
};

InitializationValues = {
 {gX, 0.5},
 {g1X, -0.06},
 {gX1, -0.06}
 }




ListDecayParticles = Automatic; 
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Chi,"Chi.f90"},{Cha,"Cha.f90"},{Glu,"Glu.f90"}};


