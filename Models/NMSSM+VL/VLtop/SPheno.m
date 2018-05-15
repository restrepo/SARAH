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
	{67,LTInput},
	{68,LVInput},
	{69,AYTInput},
	{70,ATInput},
	{71,AVInput}
	 };

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {mHd2,mHu2,ms2};

UseParameterAsGUTscale = {m0};   

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = Sqrt[(mq2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)*(mu2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)-((vd*vS*\[Lambda]/Sqrt[2]*conj[Yu[3, 3]] - vu*conj[T[Yu][3, 3]])*(vd*vS*\[Lambda]/Sqrt[2]*Yu[3, 3] - vu*T[Yu][3, 3]))/2];

DEFINITION[MatchingConditions]=Default[THDMII];

ConditionGUTscale = g1 == g2;


BoundarySUSYScale = {
    {Yt,0},
{Yt[3],YTInput},
{vS, Sqrt[2]*MuEffinput/LambdaInput},  
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput}
};



BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
    {T[Yu], Azero*Yu},
    {T[Yt],AYTInput*Yt},
    {LamT,LTInput},
    {LamV,0},
    {LamV[3],LVInput},
    {T[LamT],ATInput*LamT},
    {T[LamV],AVInput*LamV},
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


BoundaryLowScaleInput={
 {\[Kappa], KappaInput},
 {\[Lambda], LambdaInput},    
 {T[\[Kappa]], AKappaInput*KappaInput},
 {T[\[Lambda]], ALambdaInput*LambdaInput},
    {Yt,0},
    {Yt[3],YTInput},
    {LamT,LTInput},
    {LamV,0},
    {LamV[3],LVInput},
    {T[Yt],0},
    {T[Yt][3],AYTInput*YTInput},
    {T[LamT],ATInput*LamT},
    {T[LamV],AVInput*LamV},
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]},
    {vS, Sqrt[2]*MuEffinput/LambdaInput}
    
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;




(* --------- Examples for input values ---------- *)
DefaultInputValues = {m0 -> 1000, m12 -> 1000, TanBeta -> 10, Azero ->-2500, LambdaInput -> 0.3, KappaInput -> 0.21,  ALambdaInput -> 1500,  AKappaInput -> -260,  MuEffinput -> 965,LTInput->0.3,LVInput->0.3};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

