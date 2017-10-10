MINPAR= {{1,LambdaInput},   
             {2,MessengerScale},   
             {3,TanBeta},
             {4,SignumMu},
             {6,cGrav},
             {7,n5plets},
             {8,n10plets},
             {9, MTinput},
             {10, YTinput}};
             
RealParameters = {TanBeta,  LambdaInput, MessengerScale, n5plets, n10plets, cGrav};
ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};
UseParameterAsGUTscale = {MessengerScale};   

RenormalizationScaleFirstGuess = 1000^2;
RenormalizationScale = Sqrt[(mq2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)*(mu2[3, 3] + (vu^2*conj[Yu[3, 3]]*Yu[3, 3])/2)-((vd*\[Mu]*conj[Yu[3, 3]] - vu*conj[T[Yu][3, 3]])*(vd*conj[\[Mu]]*Yu[3, 3] - vu*T[Yu][3, 3]))/2];

ConditionGUTscale = g1 == g2;

DEFINITION[MatchingConditions]=Default[THDMII];

(* GUT conditions CMSSM *)

BoundaryHighScale={
{T[Ye],0},
{T[Yd],0},
{T[Yu],0},
{T[Yt],0},
{mHd2, fGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*(1.5*g2^4+0.3*g1^4)*(LambdaInput/(16*Pi^2))^2},
{mHu2, mHd2},
{mq2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.5*g2^4+1/30.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mq12, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.5*g2^4+1/30.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mq22, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.5*g2^4+1/30.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{ml2, DIAGONAL mHd2},
{md2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(2/15.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mu2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(8/15.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mt12, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(8/15.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mt22, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(8/15.*g1^4+8./3.*g3^4)*(LambdaInput/(16*Pi^2))^2},
{mut12,0},
{mqq12,0},
{metau12,0},
{me2, DIAGONAL fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.2*g1^4)*(LambdaInput/(16*Pi^2))^2},
{mtau12, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.2*g1^4)*(LambdaInput/(16*Pi^2))^2},
{mtau22, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(1.2*g1^4)*(LambdaInput/(16*Pi^2))^2},
{MassB, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*g1^2*LambdaInput/(16*Pi^2)},
{MassWB,gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*g2^2*LambdaInput/(16*Pi^2)},
{MassG, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*g3^2*LambdaInput/(16*Pi^2)},
{mT, MTinput},
{mQ, MTinput},
{mTau, MTinput},
{B[mT], 0},
{B[mQ], 0},
{B[mTau], 0},
{B[mUT], 0},
{mUT,0} 
};

IncludeFineTuning = True;
FineTuningParameters={
{LambdaInput,1},{MessengerScale,1},{MTinput,1},{\[Mu],1},{B[\[Mu]],1/2},{Yu[3,3],1},{Yt[3],1},{g3,1}
};


BoundarySUSYScale={
{Yt,0},
{Yt[3],YTinput}
};

InitializationValues = {
 {\[Mu],1000},
 {B[\[Mu]],1000^2}
};


QuadruplePrecision = {};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


DefaultInputValues = {LambdaInput -> 2*10^7, MessengerScale->5*10^7, TanBeta->10, SignumMu->1,n5plets->1, MTinput->1000, YTinput->0.1};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
