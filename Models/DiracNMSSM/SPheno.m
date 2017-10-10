MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};

EXTPAR = {
	   {61,LambdaInput},
	   {63,ALambdaInput},
           {65,vSInput},
           {66,vSbInput},
           {70, MSinput},
           {71, BMSinput},
           {80, mS2input},
           {81, mSb2input}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {L[tad],L[tadb],\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];



ConditionGUTscale = g1 == g2;

BoundarySUSYScale = {
{vS, vSinput},
{vSb, vSbinput}
};


BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2,  m0^2},
{ms2,  mS2input},
{msb2,  mSb2input},
{\[Lambda], LambdaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{MS, MSinput},
{B[MS], BMSinput},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{tad, 0},
{tadb, 0}
};



BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DEFINITION[MatchingConditions]=Default[THDMII];

IncludeFineTuning = True;
FineTuningParameters={
{m0,1},{m12,1/2},{B[\[Mu]],1},{\[Mu],1/2},{L[tad],1},{L[tadb],1},{MSinput,1/2},{BMSinput,1},
{mHd2,1},{mHu2,1},{mS2input,1},{mSb2input,1},{LambdaInput,1},{ALambdaInput,1/2}
};

DefaultInputValues = {m0 -> 600, m12 -> 700, TanBeta -> 4, SignumMu -> 1, Azero->4000, LambdaInput->0.4, ALambdaInput->750, vSInput->3, vSbInput->10,MSinput->-900,BMSinput->2*10^6, mS2input->5*10^6, mSb2input->2*10^8    };




RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
