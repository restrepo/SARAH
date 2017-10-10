MINPAR = { {1, m0},
           {2, m12},
           {3, TanBeta},
           {5, Azero}
         };

EXTPAR = { 
                     
           
           {50, muPrimeInput},
           {51, BmuPrimeInput},
           
           {61, LambdaInput},
           {62, KappaInput},
           {63, ALambdaInput},
           {64, AKappaInput},
           {65, vSInput},


	   {71, LambdaPrimeInput},
	   {72, KappaPrimeInput},
	   {73, ALambdaPrimeInput},
	   {74, AKappaPrimeInput},
           {75, vSPrimeInput},	   
	   
           {81, Lambda12Input},	   
	   {82, LambdaPrime12Input},           
           {83, ALambda12Input},	   
	   {84, ALambdaPrime12Input}

         };

ConditionGUTscale =  (g1*gN-g1N*gN1)/Sqrt[gN^2+gN1^2] == g2;         
         
RealParameters = {TanBeta, m0};         

ParametersToSolveTadpoles = { mHd2, mHu2, ms2, msp2 };

DEFINITION[MatchingConditions]=Default[THDMII];

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];


BoundaryHighScale = {
    {g1,(g1*gN-g1N*gN1)/Sqrt[gN^2+gN1^2]},
    {g1,Sqrt[(g1^2+g2^2)/2]},
    {g2, g1},
    {gN, g1},
    {g1N,0},
   {gN1,0},
   {T[Ye], Azero*Ye},
   {T[Yd], Azero*Yd},
   {T[Yu], Azero*Yu},
   {mq2, DIAGONAL m0^2},
   {ml2, DIAGONAL m0^2},
   {md2, DIAGONAL m0^2},
   {mu2, DIAGONAL m0^2},
   {me2, DIAGONAL m0^2},
   {mDx2, DIAGONAL m0^2},
   {mDxbar2, DIAGONAL m0^2},
   {mH1I2, DIAGONAL m0^2},
   {mH2I2, DIAGONAL m0^2},
   {msI2, m0^2},
   {mHp2, m0^2},
   {mHpbar2, m0^2},
   {\[Mu]Pr, muPrimeInput},
   {B[\[Mu]Pr], BmuPrimeInput},
   {\[Kappa]p, DIAGONAL KappaPrimeInput},
   {\[Lambda]p12, DIAGONAL LambdaPrime12Input},
   {\[Lambda]p, LambdaPrimeInput},
   {T[\[Kappa]p], AKappaPrimeInput \[Kappa]p},
   {T[\[Lambda]p12], ALambdaPrime12Input \[Lambda]p12},
   {T[\[Lambda]p], ALambdaPrimeInput LambdaPrimeInput},
   {\[Kappa],  DIAGONAL KappaInput},
   {\[Lambda]12, DIAGONAL Lambda12Input},
   {\[Lambda], LambdaInput},
   {T[\[Kappa]], AKappaInput \[Kappa]},
   {T[\[Lambda]12], ALambda12Input \[Lambda]12},
   {T[\[Lambda]], ALambdaInput \[Lambda]},
   {gQL, LHInput[gQL]},
   {gQR, LHInput[gQR]},
   {T[gQL], Azero gQL},
   {T[gQR], Azero gQR},
   {MassB, m12},
   {MassWB,m12},
   {MassG,m12},
   {MassBp,m12},
   {MassBBp,0}
};

BoundarySUSYScale={
 {g1T,(g1*gN-g1N*gN1)/Sqrt[gN^2+gN1^2]},
 {gNT, Sqrt[gN^2+gN1^2]},
 {g1NT,(g1N*gN+gN1*g1)/Sqrt[gN^2+gN1^2]},
 {g1, g1T},
 {gN, gNT},
 {g1N, g1NT},
 {gN1,0},
 {vs, vSInput},
 {vsp, vSPrimeInput}
};

BoundaryEWSBScale={
 {g1T,(g1*gN-g1N*gN1)/Sqrt[gN^2+gN1^2]},
 {gNT, Sqrt[gN^2+gN1^2]},
 {g1NT,(g1N*gN+gN1*g1)/Sqrt[gN^2+gN1^2]},
 {g1, g1T},
 {gN, gNT},
 {g1N, g1NT},
 {gN1,0} };
 
InitializationValues = {
 {gN, 0.5},
 {g1N, -0.02},
 {gN1, -0.02}
 } 

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


DefaultInputValues = {m0->4000, m12->2000, TanBeta->10, Azero->415, 
muPrimeInput -> 2000,
BmuPrimeInput -> 4000,
LambdaInput -> 0.02,
KappaInput -> 0.2,
ALambdaInput -> 2000,
AKappaInput -> 2000,
vSInput -> 1000,
LambdaPrimeInput ->0.01,
KappaPrimeInput ->0.001,
ALambdaPrimeInput -> 2000,
AKappaPrimeInput -> -2000,
vSPrimeInput -> 10^4,
Lambda12Input -> 0.1,
LambdaPrime12Input -> 0.1,
ALambda12Input -> -5000,
ALambdaPrime12Input -> -5000
};


