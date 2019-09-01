MINPAR=Table[{},{2}];


(* CMSSM input parameters *)

MINPAR[[1]]={{1,m0},
             {2,m12},
             {3,TanBeta},
             {4,SignumMu},
             {5,Azero}};
             
(* GMSB input parameters *)             
             
MINPAR[[2]]={{1,LambdaInput},   
             {2,MessengerScale},   
             {3,TanBeta},
             {4,SignumMu},
             {6,cGrav},
             {7,n5plets},
             {8,n10plets}};


UseParameterAsGUTscale = {MessengerScale};         
RealParameters = {TanBeta, LambdaInput, MessengerScale, n5plets, n10plets, cGrav,m0};
ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};



(*
NumericalSolutionTadpoleEquations = True;
InitializationTadpoleParameters = { \[Mu] -> Sqrt[mHd2], B[\[Mu]]-> mHd2};
InitializationTadpoleParametersLowScaleInput = { mHd2 -> 100009, mHu2->-10000}; 
*)

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = Sqrt[(mq2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)*(mu2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)-((vd*\[Mu]*conj[Yu[3, 3]] - vu*conj[T[Yu][3, 3]])*(vd*conj[\[Mu]]*Yu[3, 3] - vu*T[Yu][3, 3]))/2];

ConditionGUTscale = g1 == g2;

BoundaryHighScale=Table[{},{2}];
BoundarySUSYScale=Table[{},{2}];
BoundaryEWSBScale=Table[{},{2}];

(* GUT conditions CMSSM *)

BoundaryHighScale[[1]]={
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
{MassG,m12}
};

(* GUT conditions GMSB *)

BoundaryHighScale[[2]]={
{T[Ye],0},
{T[Yd],0},
{T[Yu],0},
{mHd2, fGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*(1.5*g2^4+0.3*g1^4)*(LambdaInput/(16*Pi^2))^2},
{mHu2, mHd2},
{mq2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.5*g2^4+1/30.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{ml2, DIAGONAL mHd2},
{md2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(2/15.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mu2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(8/15.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{me2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.2*g1^4)*(LambdaInput/(16*Pi^2))^2},
{MassB, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*g1^2*LambdaInput/(16*Pi^2)},
{MassWB,gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*g2^2*LambdaInput/(16*Pi^2)},
{MassG, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*g3^2*LambdaInput/(16*Pi^2)}
};

InitializationValues = {
 {\[Mu],0},
 {B[\[Mu]],0}
};


UseHiggs2LoopMSSM = True;
(* UseHiggs2LoopMSSM = False; *)

QuadruplePrecision = {};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DEFINITION[MatchingConditions]=Default[THDMII];


(*----------------------------------*)
(* Information for SUSY scale input *)
(*----------------------------------*)


EXTPAR={{1,M1input},
        {2,M2input},
        {3,M3input},
        {23,Muinput},
        {24,MA2input},
        {25,TanBeta}};


ParametersToSolveTadpolesLowScaleInput = {mHd2,mHu2};


BoundaryLowScaleInput={
 {MassB, M1input},
 {MassWB, M2input},
 {MassG, M3input},
 {\[Mu], Muinput},
 {B[\[Mu]], MA2input/(TanBeta + 1/TanBeta)},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

(* Example for mSugra input values *)
DefaultInputValues[1] = {m0 -> 1500, m12 -> 1500, TanBeta -> 10, SignumMu -> 1, Azero->-2000 };


(* Example for GMSB input values *)
DefaultInputValues[2] = {LambdaInput -> 10^5, MessengerScale -> 2*10^5, TanBeta -> 10, SignumMu -> 1, cGrav -> 1, n5plets -> 1, n10plets ->0  };

NeglectLoopsInvolving = {};

IncludeFineTuning = True;
FineTuningParameters={
{m0,1/2},{m12,1},{Azero,1},{\[Mu],1},{B[\[Mu]],1}
};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};


AddTreeLevelUnitarityLimits=True;
RemoveParticlesFromScattering={Sd,Se,Sv};
