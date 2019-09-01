MINPAR = {{1,m0},
         {2,m12},
         {3,TanBeta},
         {4,SignumMu},
         {5,Azero},
         {107,M1Input},
         {108,M2Input},
         {109,MXInput}};

RealParameters = {TanBeta,vSInput,m0};

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]],vS};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

DEFINITION[MatchingConditions]=Default[THDMII];

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{gp, g1},
{gp1, 0},
{g1p, 0},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12},
{MassBp,MXInput},
{MDBS,M2Input},
{MDBpS,M1Input},
{mS2,0}
};


EXTPAR = {{120,MuInput},
          {130,BMuInput}       
};

ParametersToSolveTadpolesLowScaleInput = {mHd2,mHu2,vS}; 

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
 {B[\[Mu]],BMuInput},
 {\[Mu],MuInput}
};


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


(* Example for mSugra input values *)
DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta -> 10, SignumMu -> 1, Azero->-2000, vSInput->-20,M1Input->1, M2Input->10, MXInput->200. };
