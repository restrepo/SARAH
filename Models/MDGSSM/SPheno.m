MINPAR={{1,m0},
        {3,TanBeta},
        {7,MDirac},
        {8,MSinput},
        {9,BMSinput},
        {10, MuInput},
        {11, BMuInput},
        {12, mSingletInput},
        {13, mAdjointInput} };

EXTPAR = {
       { 61, LambdaInput},
       { 71, LambdaSRInput},
       { 81, LambdaSTInput},
       {161, LambdaTInput},
       {171, LambdaTRInput},
       {200, MRinput},
       {201, BMRinput}
	 };


RealParameters = {TanBeta,vTInput, vSInput};

ParametersToSolveTadpoles = {mHd2, mHu2, vS, vT};

NumericalSolutionTadpoleEquations = True;
InitializationTadpoleParameters = { \[Mu] -> Sqrt[mHd2], B[\[Mu]]-> mHd2, vS->0.1, vT->0.1};
InitializationTadpoleParametersLowScaleInput = { mHd2 -> 100009, mHu2->-10000, vS->0.1, vT->0.1}; 


RenormalizationScaleFirstGuess = m0^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundaryHighScale={
(* trilinear terms *)
{\[Lambda], LambdaInput},
{LT, LambdaTInput},
{LS, LambdaSTInput},
{LambdaSR, LambdaSRInput},
{LambdaTR, LambdaTRInput},
{YE1, LHInput[YE1]},
{YE2, LHInput[YE2]},
{YL, LHInput[YL]},
{LambdaSE, LHInput[LambdaSE]},



(* soft masses *)
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mS2, mSingletInput^2},
{mT2, mAdjointInput^2},
{moc2, mAdjointInput^2},
{mru2, m0^2},
{mrd2, m0^2},
{mer12, DIAGONAL m0^2},
{mer22, DIAGONAL m0^2},

(* bilinear terms *)
{MS, MSinput},
{B[MS], BMSinput},
{MuR, MRinput},
{MuE, LHInput[MuE]},
{\[Mu], MuInput},

(* bilinear soft terms *)
{B[MuR], BMRinput},
{B[MuE], LHInput[B[MuE]]},
{B[\[Mu]], BMuInput},


(* Dirac masses *)
{MDWBT,MDirac},
{MDBS,MDirac},
{MDGoc,MDirac}
};

BoundarySUSYScale = {
};


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

FlagLoopContributions = False;  

ListDecayParticles =  Automatic;
ListDecayParticles3B = Automatic;

DEFINITION[MatchingConditions]=Default[THDMII];


DefaultInputValues = {m0 -> 2000, MDirac->500,  TanBeta->2.5, MuInput->200, BMuInput->9*10^5, mSingletInput->1000, mAdjointInput->3500, LambdaInput->0.324, MRinput ->1000, BMRinput -> 10^6, MuE[a_,a_]->1500};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
