MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}};

EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
           (* {65,vSInput} *)
           {65,MuEffinput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

DEFINITION[MatchingConditions]=Default[THDMII];

(* 

Three different sets of boundary conditions are used:
1) Kappa, Lambda defined at SUSY scale, AKappa, ALambda at GUT scale
2) Kappa, Lambda, AKappa, ALambda defined at GUT scale
3) Kappa, Lambda, AKappa, ALambda defined at SUSY scale 


Switch in SPheno happens by flag 2 in MODSEL 
*)

ConditionGUTscale = g1 == g2;


BoundaryEWSBScale = Table[{},{3}];
BoundarySUSYScale = Table[{},{3}];
BoundaryHighScale = Table[{},{3}];


BoundarySUSYScale[[1]] = {
{vS, Sqrt[2]*MuEffinput/LambdaInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};


BoundarySUSYScale[[2]] = {
{vS, Sqrt[2]*MuEffinput/LambdaInput}
};

BoundarySUSYScale[[3]] = {
{vS, Sqrt[2]*MuEffinput/LambdaInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput}
};

BoundaryHighScale[[1]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

BoundaryHighScale[[2]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{T[\[Kappa]], AKappaInput*KappaInput},
{T[\[Lambda]], ALambdaInput*LambdaInput},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryHighScale[[3]]={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};


BoundaryLowScaleInput={
 {\[Kappa], KappaInput},
 {\[Lambda], LambdaInput},
 {T[\[Kappa]], AKappaInput*KappaInput},
 {T[\[Lambda]], ALambdaInput*LambdaInput},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
 {vS, Sqrt[2]*MuEffinput/LambdaInput}
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


UseHiggs2LoopMSSM = True;

(*
UseAuxiliaryMu2Loop = True;
AuxiliaryMu2Loop = vS*\[Lambda]/Sqrt[2];
*)


(* --------- Examples for input values ---------- *)

(* Boundary condition type 1 *)
DefaultInputValues[1] = {m0 -> 1000, m12 -> 1000, TanBeta -> 10, Azero ->-2500, LambdaInput -> 0.1, KappaInput -> 0.11,  ALambdaInput -> -1500,  AKappaInput -> -36,  MuEffinput -> 965};

(* Boundary condition type 2 *)
DefaultInputValues[2] = {};


(* Boundary condition type 3 *)
DefaultInputValues[3] = {};



RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

AddTreeLevelUnitarityLimits=True;
(*RemoveParticlesFromScattering={Su,Sd,Se,Sv};*)

RemoveParticlesFromScattering={Se,Sv};
UNITARITYCP=True;
