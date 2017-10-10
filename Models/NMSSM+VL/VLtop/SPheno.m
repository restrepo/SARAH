MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {5,Azero}	
};
 
EXTPAR = {
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
           (* {65,vSInput} *)
           {65,MuEffinput},
        {66,YTInput},
	{67,LRInput},
	{68,LVInput},
	{69,AYTInput},
	{70,ALRInput},
	{71,ALVInput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = Sqrt[(mq2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)*(mu2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)-((vd*vS*\[Lambda]/Sqrt[2]*conj[Yu[3, 3]] - vu*conj[T[Yu][3, 3]])*(vd*vS*\[Lambda]/Sqrt[2]*Yu[3, 3] - vu*T[Yu][3, 3]))/2];

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
    {Yt,0},
{Yt[3],YTInput},
{vS, Sqrt[2]*MuEffinput/LambdaInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};


BoundarySUSYScale[[2]] = {
    {Yt,0},
{Yt[3],YTInput},
{vS, Sqrt[2]*MuEffinput/LambdaInput}
};

BoundarySUSYScale[[3]] = {
    {Yt,0},
{Yt[3],YTInput},
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
    {T[Yt],AYTInput*Yt},
    {LR,LRInput},
    {LV,0},
    {LV[3],LVInput},
    {T[LR],ALRInput*LR},
    {T[LV],ALVInput*LV},
    {mt12, m0^2},
    {mt22, m0^2},
    {mut12, 0},
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
    {T[Yt],AYTInput*Yt},
    {LR,LRInput},
    {LV,0},
    {LV[3],LVInput},
    {T[LR],ALRInput*LR},
    {T[LV],ALVInput*LV},
    {mt12, m0^2},
    {mt22, m0^2},
    {mut12, 0},
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
    {T[Yt],AYTInput*Yt},
    {LR,LRInput},
    {LV,0},
    {LV[3],LVInput},
    {T[LR],ALRInput*LRInput},
    {T[LV],ALVInput*LV},
    {mt12, m0^2},
    {mt22, m0^2},
    {mut12, 0},
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
    {Yt,0},
    {Yt[3],YTInput},
    {LR,LRInput},
    {LV,0},
    {LV[3],LVInput},
    {T[Yt],0},
    {T[Yt][3],AYTInput*YTInput},
    {T[LR],ALRInput*LR},
    {T[LV],ALVInput*LV},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
    {vS, Sqrt[2]*MuEffinput/LambdaInput}
    
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


UseHiggs2LoopMSSM = False;

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



