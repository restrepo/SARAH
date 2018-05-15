MINPAR ={{1,m0},
             {2,m12},
             {3,TanBeta},
             {4,SignumMu},
             {5,Azero}};
             
         

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

DEFINITION[MatchingConditions]=Default[THDMII];


(* GUT conditions CMSSM *)

BoundaryHighScale={
{g1, Sqrt[(g1^2 + g2^2)/2]},
{g2, g1},
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{L1,LHInput[L1]},
{L2,LHInput[L2]},
{T[L1],Azero*L1},
{T[L2],Azero*L2},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
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




(*----------------------------------*)
(* Information for SUSY scale input *)
(*----------------------------------*)


EXTPAR={{1,M1input},
        {2,M2input},
        {3,M3input},
        {23,Muinput},
        {25,TanBeta},
        {26,MAinput}};


ParametersToSolveTadpolesLowScaleInput = {mHd2,mHu2};

BoundaryLowScaleInput={
 {MassB, M1input},
 {MassWB, M2input},
 {MassG, M3input},
 {\[Mu], Muinput},
 {B[\[Mu]], MAinput^2/(TanBeta + 1/TanBeta)},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


SetOptions[CalcRGEs,IgnoreAt2Loop->{L1, L2, T[L1], T[L2]}]; 
SetOptions[MakeSPheno,IncludeLoopDecays->False];


DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta -> 10, SignumMu -> 1, Azero->-2000 };


(* loop decays won't work unless the neutralino-neutrino and electron-chargino mixing 
is included; if you want to study this, use the other RpV files with this mixing *)                     
SA`AddOneLoopDecay = False;