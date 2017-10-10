(* ::Package:: *)

RegimeNr = 2;
IntermediateScale = False;

(* Quiver input parameters to be read from a LesHouches file by SPheno *)
             
MINPAR = {
          {1,LambdaInput},
          {2,MessengerScale},
          {3,TanBeta},
          {4,SignumMu},
          {6,cGrav},
          {7,n5plets},
          {8,n10plets},
          {9,vlvInput},
          {10,Lambda3Input}
         };

(*-----additional parameters for the LesHouches input   ----*)

 EXTPAR={
          {102,TScale}, 
          {103,YKInput},
          {104,YAInput},
          {105,The1},
          {106,The2},
          {107,mLd2Input}
         };

RealParameters = {TanBeta,LambdaInput,Lambda3Input, MessengerScale,mLd2Input, n5plets, n10plets,cGrav,vlvInput,TScale,The1,The2,YAInput,vlv,mLd2,mLdt2};

UseParameterAsGUTscale = MessengerScale;

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

DEFINITION[MatchingConditions]=Default[THDMII];

RenormalizationScaleFirstGuess = (vlvInput)^2;
RenormalizationScale = MSu[1]*MSu[6];

(* Moronic GUT conditions Quiver *)
 ConditionGUTscale = {gB1 == -gB2, g1 == 10 };

BoundaryHighScale={
    {YK,     YKInput},
    {YA,     YAInput},
    {L[Tod], 0},
    {T[YA],  0},
    {T[YK],  0},
    {T[Ye3], 0},
    {T[Yd3], 0},
    {T[Yu3], 0},
    {mHd2, (n5plets + 3*n10plets)*(SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA2^2+gB2^2])/MessengerScale]*
                                     3./4*(gA2 gB2 /Sqrt[gB2^2 +gA2^2])^4 +
                                   SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                     3./5*(1/2)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                2*(LambdaInput/(16*Pi^2))^2},
    {mHu2, (n5plets + 3*n10plets)*(SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA2^2+gB2^2])/MessengerScale]*
                                     3./4*(gA2 gB2 /Sqrt[gB2^2 +gA2^2])^4 +
                                   SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                     3./5*(1/2)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                2*(LambdaInput/(16*Pi^2))^2},
    {mq32, (n5plets + 3*n10plets)*((SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA2^2+gB2^2])/MessengerScale]*
                                      3./4*(gA2 gB2 /Sqrt[gB2^2 +gA2^2])^4 +
                                    SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                      3./5*(1/6)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                  2*(LambdaInput/(16*Pi^2))^2 +
                                    fGMSB[Lambda3Input/MessengerScale]*4./3.*g3^4*2*(Lambda3Input/(16*Pi^2))^2)},
    {md32, (n5plets + 3*n10plets)*((SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                     3./5*(1/3)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                  2*(LambdaInput/(16*Pi^2))^2 +
                                   fGMSB[Lambda3Input/MessengerScale]*4./3.*g3^4*2*(Lambda3Input/(16*Pi^2))^2)},
    {mu32, (n5plets + 3*n10plets)*((SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                     3./5*(2/3)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                  2*(LambdaInput/(16*Pi^2))^2 +
                                    fGMSB[Lambda3Input/MessengerScale]*4./3.*g3^4*2*(Lambda3Input/(16*Pi^2))^2)},
    {ml32, mHd2},
    {me32, (n5plets + 3*n10plets)*(SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                     3./5*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*2*(LambdaInput/(16*Pi^2))^2},
    {mq122, DIAGONAL (n5plets + 3*n10plets)*((fGMSB[LambdaInput/MessengerScale]*3./4*(gB2)^4+
                                              fGMSB[LambdaInput/MessengerScale]*3./5*(1/6)^2*(gB1)^4)*
                                            2*(LambdaInput/(16*Pi^2))^2 +
                                              fGMSB[Lambda3Input/MessengerScale]*4./3.*g3^4*2*(Lambda3Input/(16*Pi^2))^2)},
    {md122, DIAGONAL (n5plets + 3*n10plets)*(fGMSB[LambdaInput/MessengerScale]*3./5*(1/3)^2*(gB1)^4*
                                            2*(LambdaInput/(16*Pi^2))^2 +
                                             fGMSB[Lambda3Input/MessengerScale]*4./3.*g3^4*2*(Lambda3Input/(16*Pi^2))^2)},
    {mu122, DIAGONAL (n5plets + 3*n10plets)*(fGMSB[LambdaInput/MessengerScale]*3./5*(2/3)^2*(gB1)^4*
                                            2*(LambdaInput/(16*Pi^2))^2 +
                                             fGMSB[Lambda3Input/MessengerScale]*4./3.*g3^4*2*(Lambda3Input/(16*Pi^2))^2)},
    {ml122, DIAGONAL (n5plets + 3*n10plets)*((fGMSB[LambdaInput/MessengerScale]*3./4*(gB2)^4+
                                              fGMSB[LambdaInput/MessengerScale]*3./5*(1/2)^2*(gB1)^4)*
                                            2*(LambdaInput/(16*Pi^2))^2)},
    {me122, DIAGONAL (n5plets + 3*n10plets)*(fGMSB[LambdaInput/MessengerScale]*3./5*(gB1)^4)*2*(LambdaInput/(16*Pi^2))^2},
    {MassAB, 0},
    {MassBB, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*gB1^2*LambdaInput/(16*Pi^2)},
    {MassAW,0},
    {MassBW, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*gB2^2*LambdaInput/(16*Pi^2)},
    {MassG,  gGMSB[Lambda3Input/MessengerScale]*(n5plets + 3*n10plets)*g3^2*Lambda3Input/(16*Pi^2)},
    {mLd2,  mLd2Input},
    {mLdt2, mLd2Input},
    {mAd2, fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(2.*gB2^4)*2*(LambdaInput/(16*Pi^2))^2},
    {mKd2,   0}
 };
   
    
InitializationValues = {
                        {\[Mu],    100},
                        {B[\[Mu]], 6400}
                       };



(* Definition of thresholds and boundary conditions *)

ThresholdScales = {TScale};

BoundaryConditionsUp = Table[{},{Length[ThresholdScales]}];
BoundaryConditionsDown = Table[{},{Length[ThresholdScales]}];




BoundaryConditionsUp[[1]] = {
    {gA1,        g1/Cos[The1]},
    {gA2,        g2/Cos[The2]},
    {gB1,        g1/Sin[The1]},
    {gB2,        g2/Sin[The2]},
    {vlv,        vlvInput},
    {Yu3,        Yu[3,3]},
    {Yd3,        Yd[3,3]},
    {Ye3,        Ye[3,3]},
    {T[Ye3],     T[Ye][3,3]},
    {T[Yd3],     T[Yd][3,3]},
    {T[Yu3],     T[Yu][3,3]},
    {K1,         1/(1/gA1^2+1/gB1^2)*1/(4 Pi)^2*2*(Sin[The1]^2*(1-3*Sin[The1]^2)*MassBB^2+(gA1^2+gB1^2)*vlv^2*Tan[The1]^2*Log[1+mLd2/((gA1^2+gB1^2)*vlv^2)])},
    {K2,         1/(1/gA2^2+1/gB2^2)*1/(4 Pi)^2*2*(Sin[The2]^2*(1-3*Sin[The2]^2)*MassBW^2+(gA2^2+gB2^2)*vlv^2*Tan[The2]^2*Log[1+mLd2/((gA2^2+gB2^2)*vlv^2)])},
    {ml122[1,1], ml2[1,1]},
    {ml122[2,2], ml2[2,2]},
    {ml32,       ml2[3,3]-3/4 K2-1/4 K1},
    {me122[1,1], me2[1,1]},
    {me122[2,2], me2[2,2]},
    {me32,       me2[3,3]-K1},
    {mq122[1,1], mq2[1,1]},
    {mq122[2,2], mq2[2,2]},
    {mq32,       mq2[3,3]-3/4 K2-1/36 K1},
    {mu122[1,1], mu2[1,1]},
    {mu122[2,2], mu2[2,2]},
    {mu32,       mu2[3,3]-4/9 K1},
    {md122[1,1], md2[1,1]},
    {md122[2,2], md2[2,2]},
    {md32,       md2[3,3]-1/9 K1},
    {mHu2,       mHu2-3/4 K2-1/4 K1},
    {mHd2,       mHd2-3/4 K2-1/4 K1}
};

BoundaryConditionsDown[[1]] = {
    {g1,      gA1 gB1 /Sqrt[gB1^2 +gA1^2]},
    {g2,      gA2 gB2 /Sqrt[gB2^2 +gA2^2]},
    {MassB,   MPofSAVE[1]}, 
    {MassWB,  MGofSAVE[1]},
    {pz1,     (1/(1/gA1^2+1/gB1^2)*gA1^2*(mLd2))/(gB1^2*(mLd2+(gA1^2+gB1^2)*vlv^2))},
    {pz2,     (1/(1/gA2^2+1/gB2^2)*gA2^2*(mLd2))/(gB2^2*(mLd2+(gA2^2+gB2^2)*vlv^2))},
    {K1,      1/(1/gA1^2+1/gB1^2)*1/(4 Pi)^2*2*(Sin[The1]^2*(1-3*Sin[The1]^2)*MassBB^2+(gA1^2+gB1^2)*vlv^2*Tan[The1]^2*Log[1+mLd2/((gA1^2+gB1^2)*vlv^2)])},
    {K2,      1/(1/gA2^2+1/gB2^2)*1/(4 Pi)^2*2*(Sin[The2]^2*(1-3*Sin[The2]^2)*MassBW^2+(gA2^2+gB2^2)*vlv^2*Tan[The2]^2*Log[1+mLd2/((gA2^2+gB2^2)*vlv^2)])},
    {ml2[1,1],ml122[1,1]},
    {ml2[2,2],ml122[2,2]},
    {ml2[3,3],ml32+3/4 K2+1/4 K1},
    {me2[1,1],me122[1,1]},
    {me2[2,2],me122[2,2]},
    {me2[3,3],me32+K1},
    {mq2[1,1],mq122[1,1]},
    {mq2[2,2],mq122[2,2]},
    {mq2[3,3],mq32+3/4 K2+1/36 K1},
    {mu2[1,1],mu122[1,1]},
    {mu2[2,2],mu122[2,2]},
    {mu2[3,3],mu32+4/9 K1},
    {md2[1,1],md122[1,1]},
    {md2[2,2],md122[2,2]},
    {md2[3,3],md32+1/9 K1},
    {mHu2,    mHu2+3/4 K2+1/4 K1},
    {mHd2,    mHd2+3/4 K2+1/4 K1}
};



UseHiggs2LoopMSSM = True;
(* UseHiggs2LoopMSSM = False; *)

QuadruplePrecision = {};

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

FlagLoopContributions = False;  

 (* Example for QMSB input values *)
DefaultInputValues = {
    LambdaInput -> 10^5,
    Lambda3Input -> 10^6,
    MessengerScale -> 2*10^5,
    TanBeta -> 10,
    SignumMu -> 1,
    n5plets -> 1,
    cGrav -> 1,
    n10plets ->0,
    The1 -> 0.23,
    The2 -> 0.23,
    TScale -> 2*10^5,
    vlvInput ->2*10^5,
    YKInput -> 1/2,
    YAInput -> 1/2,
    mLd2Input->1.0*10^7
    };


(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;