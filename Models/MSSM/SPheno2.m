

(* CMSSM input parameters *)

MINPAR=     {{1,m0},
             {2,m12},
             {3,TanBeta},
             {4,MuInput},
             {5,Azero},
             {6,Bzero}};
             
(* GMSB input parameters *)             
             
EXTPAR={
    {1, M1input},
 {2, M2input},
 {3, M3input},
 {4, mA2input}
       }

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {mHd2,mHu2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;


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
{\[Mu], MuInput},
{B[\[Mu]], MuInput*Bzero},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


UseHiggs2LoopMSSM = True;
(* UseHiggs2LoopMSSM = False; *)

QuadruplePrecision = {};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;





BoundaryLowScaleInput={
 {MassB, M1input},
 {MassWB, M2input},
 {MassG, M3input},
 {\[Mu], Muinput},
 {B[\[Mu]], mA2input/(TanBeta + 1/TanBeta)},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};

(* FlagLoopContributions = True; *)


