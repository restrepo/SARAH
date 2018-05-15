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

ConditionGUTscale = (g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2] == g2;

DEFINITION[MatchingConditions]=Default[THDMII];

BoundaryHighScale={
{g1,(g1*gBL-g1BL*gBL1)/Sqrt[gBL^2+gBL1^2]},
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
{MassBBp,0}
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
 };
 

EXTPAR={{1,gBLinput},
        {2,g1BLinput},
        {3,MZp},
        {10,TBetaP},
        {11,MuInput},
        {12,MuPInput},        
        {13,BMuInput},
        {14,BMuPInput}        
        
        };


ParametersToSolveTadpolesLowScaleInput = {mHd2,mHu2,mC12,mC22}; 

BoundaryLowScaleInput={
 {gBL,gBLinput},
 {g1BL, g1BLinput},
 {gBL1, 0},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
 {vevP, MZp/gBL},
 {betaP,ArcTan[TBetaP]},
 {x2,vevP*Cos[betaP]},
 {x1,vevP*Sin[betaP]},
 {B[\[Mu]],BMuInput},
 {B[MuP],BMuPInput},
 {\[Mu],MuInput},
 {MuP,MuPInput}
};


ListDecayParticles = Automatic;
ListDecayParticles3B =Automatic;

(* Example for mSugra input values *)
DefaultInputValues = {m0 -> 1000, m12 -> 1500, TanBeta->20, SignumMu ->1, Azero -> -1500, SignumMuP -> 1, TBetaP -> 1.15, MZp -> 2500, Yn[1,1]->0.37, Yn[2,2]->0.4, Yn[3,3]->0.4, Yv[a_,a_]->0.0001};
