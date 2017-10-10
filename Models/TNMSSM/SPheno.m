(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)


MINPAR={{1,mSUSY},
        {3,TanBeta},
        {5,Azero},
        {6,AzeroX}};

EXTPAR = {
          {1, M1input},
          {2, M2input},
          {3, M3input},
     
	   {61,LambdaInput},
	   {62,KappaInput},
	   {63,ALambdaInput},
	   {64,AKappaInput},
       {65,vSInput},
       {71, XiDinput},
       {72, XiUinput},
       {73, LamTinput},
       {78, vTinput},
       {79, vTbinput}
	 };

RealParameters = {TanBeta,m0,mSUSY};

UseParameterAsGUTscale = {mSUSY};  

ParametersToSolveTadpoles = {mHd2,mHu2,ms2,mt2,mtb2};

RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;

ConditionGUTscale = g1 == g2;


BoundarySUSYScale = {
{vS, vSInput},  
{vT, vTinput},
{vTb, vTbinput},
{\[Kappa], KappaInput},
{\[Lambda], LambdaInput},
{XiD, XiDinput},
{XiU, XiUinput},
{LamT, LamTinput}
};

BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{T[\[Kappa]], AKappaInput*\[Kappa]},
{T[\[Lambda]], ALambdaInput*\[Lambda]},
{T[XiD], AzeroX* XiD},
{T[XiU], AzeroX* XiU},
{T[LamT], AzeroX* LamT},
{MassB, M1input},
{MassWB,M2input},
{MassG,M3input}
};

DEFINITION[MatchingConditions]=Default[THDMII];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues = {TanBeta -> 2.0, mSUSY->2500, Azero->-2500, AzeroX -> -900, M1input->200, M2input->500, M3input->1500, AKappaInput->-500, ALambdaInput->50,KappaInput->0.3,LambdaInput->0.45, LamTinput->0.1, XiDinput->0.1, XiUinput->0.1, vTinput->2, vTbinput->0.1, vSInput-> 20  };


(* loop decays not yet working because of double-charged Higgs *)                     
SA`AddOneLoopDecay = False;

(*
RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
*)
