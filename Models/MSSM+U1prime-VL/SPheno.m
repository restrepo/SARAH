(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)


MINPAR={{1,  TanBeta},
        {2, mSUSY},
        {3, Azero},
        {4, Bzero},
        {5, gXinput},
        {6, g1Xinput}
	};
	
	
EXTPAR = {
         {1,M1input},
         {2,M2input},
         {3,M3input},
         {4,M4input},
         {5, vSinput},
	{6, vScinput},
	{7, vS1input},
	{8, vS1cinput},
	{9, vS2input},
         {10, muS2input},
	{11, mu1S2input},
	{12, mu2S2input},
	{13, kap1input},
	{14, Tkap1input},
	{15, kap2input},
	{16, Tkap2input},
	{17, Laminput},
	{18, Tlaminput},
	{19, LamNinput},
	{20, LamXinput},
	{21, lamDdiag},
	{22, lamTdiag},
	{23, lamT3input}
          };	

RealParameters = {mSUSY, TanBeta};
ParametersToSolveTadpoles = {mHd2, mHu2, mS2, mSc2, mS12, mS1c2, mS22};

RealParameters = {mSUSY, TanBeta}; 
UseParameterAsGUTscale = {mSUSY};  


RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;




BoundaryHighScale={
 {g1,(g1*gX-g1X*gX1)/Sqrt[gX^2+gX1^2]},
 {gX, gXinput},
 {g1X, g1Xinput},
 {gX1,0},
 {\[Lambda], Laminput},
 {lamN, LamNinput},
 {lamD, DIAGONAL lamDdiag},
 {lamX, LamXinput},
 {lamT, DIAGONAL lamTdiag},
 {lamT3, lamT3input},
 {muS2, muS2input},
 {mu1S2, mu1S2input},
 {mu2S2, mu2S2input},
 {kap1, kap1input},
 {kap2, kap2input}, 
 {Yv, LHInput[Yv]},
 {B[mu2S2], Bzero*mu2S2},
 {B[muS2], Bzero*muS2},
 {B[mu1S2], Bzero*mu1S2},
 {T[kap1], Tkap1input},
 {T[kap2], Tkap2input},
 {T[\[Lambda]], Tlaminput},
 {T[lamN], LamNinput},
 {T[lamD], DIAGONAL Azero*lamDdiag},
 {T[lamX], Azero*LamXinput},
 {T[lamT], DIAGONAL Azero*lamTdiag}, 
 {T[lamT3], Azero*lamT3},
 {T[Yu], Azero*Yu},
{T[Yd], Azero*Yd},
{T[Ye], Azero*Ye},
{T[Yv], Azero*Yv},
 {mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{mvR2, DIAGONAL mSUSY^2},
{mD12, DIAGONAL mSUSY^2},
{mDc2, DIAGONAL mSUSY^2},
 {mN2, mSUSY^2},
 {mNc2, mSUSY^2},
 {mNNc2, 0},
 {mT2, DIAGONAL mSUSY^2},
 {mTc2, DIAGONAL mSUSY^2},
 {mT3c2, mSUSY^2},
 {mT32, mSUSY^2},
 {mX2, mSUSY^2},
 {mXc2, mSUSY^2},
 (*{mS2, mSUSY^2},
 {mS22, mSUSY^2},
 {mSc2, mSUSY^2},
 {mS12, mSUSY^2},
 {mS1c2, mSUSY^2},*)
 {mScS22, 0},
 {MassB, M1input},
 {MassWB, M2input},
 {MassG, M3input},
 {MassBp, M4input},
 {MassBBp, 0}
};


BoundarySUSYScale={
 {g1T,(g1*gX-g1X*gX1)/Sqrt[gX^2+gX1^2]},
 {gXT, Sqrt[gX^2+gX1^2]},
 {g1XT,(g1X*gX+gX1*g1)/Sqrt[gX^2+gX1^2]},
 {g1, g1T},
 {gX, gXT},
 {g1X, g1XT},
 {gX1,0},
 {vS, vSinput},
 {vSc, vScinput},
 {vS1, vS1input},
 {vS1c, vS1cinput},
 {vS2, vS2input}
};



BoundaryEWSBScale = {
 {g1T,(g1*gX-g1X*gX1)/Sqrt[gX^2+gX1^2]},
 {gXT, Sqrt[gX^2+gX1^2]},
 {g1XT,(g1X*gX+gX1*g1)/Sqrt[gX^2+gX1^2]},
 {g1, g1T},
 {gX, gXT},
 {g1X, g1XT},
 {gX1,0},
 {vS, vSinput},
 {vSc, vScinput},
 {vS1, vS1input},
 {vS1c, vS1cinput},
 {vS2, vS2input}
};



InitializationValues = {
 {gX, 0.1},
 {g1X, -0.0},
 {gX1, -0.0}
 }


BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


ListDecayParticles = Automatic;
ListDecayParticles3B =Automatic;

DEFINITION[MatchingConditions]=Default[THDMII];
