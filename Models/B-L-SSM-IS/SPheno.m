MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero},
        {6,SignumMuP}, 
        {7,TBetaP},
        {8,MZp}};

RealParameters = {TanBeta, TBetaP,m0};
ParametersToSolveTadpoles = {B[\[Mu]],B[MuP],\[Mu],MuP};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

UseHiggs2LoopMSSM = True;

ConditionGUTscale = (g1*gBL-g1BL*gBL1)/Sqrt[gBL^2-gBL1^2] == g2;

DEFINITION[MatchingConditions]=Default[THDMII];


BoundaryHighScale={
{g1,(g1*gBL-g1BL*gBL1)/Sqrt[gBL^2-gBL1^2]},
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
{ms12, DIAGONAL m0^2},
{ms22, DIAGONAL m0^2},
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
{MUS,0},
{B[MUS],0}
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
 {Yv,  LHInput[Yv]},
 {Yn,  LHInput[Yn]},
 {MUS,LHInput[MUS]},
 {B[MUS],0}
};

BoundaryEWSBScale = {
 {g1T,(g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2]},
 {gBLT, Sqrt[gBL^2+gBL1^2]},
 {g1BLT,(g1BL*gBL+gBL1*g1)/Sqrt[gBL^2+gBL1^2]},
 {g1, g1T},
 {gBL, gBLT},
 {g1BL, g1BLT},
 {gBL1,0}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


InitializationValues = {
 {gBL, 0.5},
 {g1BL, -0.06},
 {gBL1, -0.06}
 }





ListDecayParticles = Automatic;
ListDecayParticles3B =Automatic;

UseBoundarySUSYatEWSB = True;

(* Example for mSugra input values *)
DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta->10, SignumMu ->1, Azero -> 1500, SignumMuP -> 1, TBetaP -> 1.10, MZp -> 2500, \
Yn[1,1]->0.37, Yn[2,2]->0.4, Yn[3,3]->0.4, MUS[a_,a_]->10^-5, Yv[a_,a_]->10^-3};


