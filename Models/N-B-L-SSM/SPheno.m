MINPAR={ 
          {1,m0},
          {2,m12},
          {3,TanBeta},
          {5,Azero},
          {6,TBetaP},
          {7,MZp}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
           {65,vSInput},

           {71, Lambda2Input},
           {73, ALambda2Input}
	 };




RealParameters = {TanBeta, TBetaP,m0};
ParametersToSolveTadpoles = {mHd2,mHu2,mC12,mC22,mSf2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

UseHiggs2LoopMSSM = False;

ConditionGUTscale = (g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2] == g2;

DEFINITION[MatchingConditions]=Default[THDMII];

BoundaryHighScale={{g1,(g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2]},
{g1,Sqrt[(g1^2+g2^2)/2]},
{g2,g1},
{gBL, g1},
{g1BL,0},
{gBL1,0},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{T[Yv], Azero*Yv},
{T[Yn], Azero*Yn},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mvR2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{mC12, m0^2},
{mC22, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MassBp,m12},
{MassBBp,0},
{MassBpB,0},

{L1, LambdaInput},
{L2, Lambda2Input},
{T[L1], LambdaInput*ALambdaInput},
{T[L2], Lambda2Input*ALambda2Input},
{kappa, KappaInput},
{T[kappa], KappaInput*AKappaInput}

};



BoundarySUSYScale = {
 {g1T,(g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2]},
 {gBLT, Sqrt[gBL^2+gBL1^2]},
 {g1BLT,(g1BL*gBL+gBL1*g1)/Sqrt[gBL^2+gBL1^2]},
 {g1, g1T},
 {gBL, gBLT},
 {g1BL, g1BLT},
 {gBL1,0},
 {vevP, MZp/gBL},
 {betaP,ArcTan[TBetaP]},
 {x2,vevP*Cos[betaP]},
 {x1,vevP*Sin[betaP]},
 {vs, vSInput},
 {Yv,  LHInput[Yv]},
 {Yn,  LHInput[Yn]}
};


BoundaryEWSBScale = {
 {g1T,(g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2]},
 {gBLT, Sqrt[gBL^2+gBL1^2]},
 {g1BLT,(g1BL*gBL+gBL1*g1)/Sqrt[gBL^2+gBL1^2]},
 {g1, g1T},
 {gBL, gBLT},
 {g1BL, g1BLT},
 {gBL1,0},
 {vevP, MZp/gBL},
 {betaP,ArcTan[TBetaP]},
 {x2,vevP*Cos[betaP]},
 {x1,vevP*Sin[betaP]}
};



InitializationValues = {
 {gBL, 0.5},
 {g1BL, -0.06},
 {gBL1, -0.06}
 }

ConditionForMassOrdering={
{Ah,
"If ((Abs(ZA(1,2))+Abs(ZA(1,3))).le.(Abs(ZA(1,3))+Abs(ZA(1,4)))) Then \n
 MAh2temp = MAh2 \n
 ZAtemp = ZA \n
 ZA(1,:) = ZAtemp(2,:) \n
 ZA(2,:) = ZAtemp(1,:) \n
 MAh2(2) = MAh2temp(1) \n
 MAh2(1) = MAh2temp(2) \n
End If \n" }
}




ListDecayParticles = Automatic;
ListDecayParticles3B =Automatic;


DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta->10,  Azero -> -2500,  TBetaP -> 1.06, MZp -> 2500, Yn[a_,a_]->0.42, LambdaInput -> -0.1, KappaInput->0.1, ALambdaInput->-500, vSInput->300, Lambda2Input->0.6, Yv[a_,a_]->0.0001};

