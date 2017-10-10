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

RealParameters = {TanBeta,mLd2Input, LambdaInput,Lambda3Input, MessengerScale, n5plets, n10plets,cGrav,vlvInput,TScale,The1,The2,YKInput,YAInput};

UseParameterAsGUTscale = MessengerScale;

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

 
RenormalizationScaleFirstGuess = (vlvInput)^2;
RenormalizationScale = MSu[1]*MSu[6];

(* Moronic GUT conditions Quiver *)
 ConditionGUTscale = {gB1 == -gB2, g1 == 10 };
 
 DEFINITION[MatchingConditions]=Default[THDMII];
 
 (* loop decays not supported for this model *)                     
SetOptions[MakeSPheno, IncludeLoopDecays -> False];

BoundaryHighScale={
    {YK,     YKInput},
    {YA,     YAInput},
    {L[Tod], 0},
    {T[YA],  0},
    {T[YK],  0},
    {T[Ye],  0},
    {T[Yd],  0},
    {T[Yu],  0},
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
    {mq2, DIAGONAL (n5plets + 3*n10plets)*((SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA2^2+gB2^2])/MessengerScale]*
                                              3./4*(gA2 gB2 /Sqrt[gB2^2 +gA2^2])^4 +
                                            SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                              3./5*(1/6)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                           2*(LambdaInput/(16*Pi^2))^2 +
                                            fGMSB[Lambda3Input/MessengerScale]*(4./3.*g3^4)*2*(Lambda3Input/(16*Pi^2))^2)},
    {md2, DIAGONAL (n5plets + 3*n10plets)*((SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                              3./5*(1/3)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                           2*(LambdaInput/(16*Pi^2))^2 +
                                            fGMSB[Lambda3Input/MessengerScale]*(4./3.*g3^4)*2*(Lambda3Input/(16*Pi^2))^2) },
    {mu2, DIAGONAL (n5plets + 3*n10plets)*((SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                              3./5*(2/3)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*
                                           2*(LambdaInput/(16*Pi^2))^2 +
                                            fGMSB[Lambda3Input/MessengerScale]*(4./3.*g3^4)*2*(Lambda3Input/(16*Pi^2))^2) },
    {ml2, DIAGONAL (n5plets + 3*n10plets)*(SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA2^2+gB2^2])/MessengerScale]*
                                             3./4*(gA2 gB2 /Sqrt[gB2^2 +gA2^2])^4 +
                                           SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                             3./5*(1/2)^2*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*2*(LambdaInput/(16*Pi^2))^2},
    {me2, DIAGONAL (n5plets + 3*n10plets)*(SQuiver[LambdaInput/MessengerScale,(2*vlvInput*Sqrt[gA1^2+gB1^2])/MessengerScale]*
                                             3./5*(gA1 gB1 /Sqrt[gB1^2 +gA1^2])^4)*2*(LambdaInput/(16*Pi^2))^2},
    {MassAB, 0},
    {MassBB, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*gB1^2*LambdaInput/(16*Pi^2)},
    {MassAW, 0},
    {MassBW, gGMSB[LambdaInput/MessengerScale]*(n5plets + 3*n10plets)*gB2^2*LambdaInput/(16*Pi^2)},
    {MassG,  gGMSB[Lambda3Input/MessengerScale]*(n5plets + 3*n10plets)*g3^2*Lambda3Input/(16*Pi^2)},
    {mLd2,   mLd2Input},
    {mLdt2,  mLd2Input},
    {mAd2,   fGMSB[LambdaInput/MessengerScale]*(n5plets+3*n10plets)*(2.*gB2^4)*2*(LambdaInput/(16*Pi^2))^2},
    {mKd2,   0}
 };
   
    
InitializationValues = {{\[Mu], 100},{B[\[Mu]], 6400}};


(* Definition of thresholds and boundary conditions *)

ThresholdScales = {TScale};

BoundaryConditionsUp = Table[{},{Length[ThresholdScales]}];
BoundaryConditionsDown = Table[{},{Length[ThresholdScales]}];




BoundaryConditionsUp[[1]] = {
    {gA1, g1/Cos[The1]},
    {gA2, g2/Cos[The2]},
    {gB1, g1/Sin[The1]},
    {gB2, g2/Sin[The2]},
    {vlv, vlvInput},
    {K1,1/(1/gA1^2+1/gB1^2)*1/(4 Pi)^2*2*(Sin[The1]^2*(1-3*Sin[The1]^2)*MassBB^2+(gA1^2+gB1^2)*vlv^2*Tan[The1]^2*Log[1+mLd2/((gA1^2+gB1^2)*vlv^2)])},
    {K2,1/(1/gA2^2+1/gB2^2)*1/(4 Pi)^2*2*(Sin[The2]^2*(1-3*Sin[The2]^2)*MassBW^2+(gA2^2+gB2^2)*vlv^2*Tan[The2]^2*Log[1+mLd2/((gA2^2+gB2^2)*vlv^2)])},
    {me2[1,1],me2[1,1]- K1},
    {me2[2,2],me2[2,2]- K1},
    {me2[3,3],me2[3,3]- K1},
    {mu2[1,1],mu2[1,1]- (4/9 K1)},
    {mu2[2,2],mu2[2,2]- (4/9 K1)},
    {mu2[3,3],mu2[3,3]- (4/9 K1)},
    {ml2[1,1],ml2[1,1]- (3/4 K2+1/4 K1)},
    {ml2[2,2],ml2[2,2]- (3/4 K2+1/4 K1)},
    {ml2[3,3],ml2[3,3]- (3/4 K2+1/4 K1)},
    {mq2[1,1],mq2[1,1]- (3/4 K2+1/36 K1)},
    {mq2[2,2],mq2[2,2]- (3/4 K2+1/36 K1)},
    {mq2[3,3],mq2[3,3]- (3/4 K2+1/36 K1)},
    {md2[1,1],md2[1,1]- (1/9 K1)},
    {md2[2,2],md2[2,2]- (1/9 K1)},
    {md2[3,3],md2[3,3]- (1/9 K1)},
    {mHu2,mHu2-3/4 K2-1/4 K1},
    {mHd2,mHd2-3/4 K2-1/4 K1}

};

BoundaryConditionsDown[[1]] = {
    {g1,     gA1 gB1 /Sqrt[gB1^2 +gA1^2]},
    {g2,     gA2 gB2 /Sqrt[gB2^2 +gA2^2]},
    {MassB,  MPofSAVE[1]}, 
    {MassWB, MGofSAVE[1]}, 
    {pz1,    (gA1^2*gB1^2/(gA1^2 + gB1^2))*(gA1^2/gB1^2)*(mLd2/(mLd2 + vlv^2*(gA1^2 + gB1^2)))},
    {pz2,    (gA2^2*gB2^2/(gA2^2 + gB2^2))*(gA2^2/gB2^2)*(mLd2/(mLd2 + vlv^2*(gA2^2 + gB2^2)))},
    {K1,1/(1/gA1^2+1/gB1^2)*1/(4 Pi)^2*2*(Sin[The1]^2*(1-3*Sin[The1]^2)*MassBB^2+(gA1^2+gB1^2)*vlv^2*Tan[The1]^2*Log[1+mLd2/((gA1^2+gB1^2)*vlv^2)])},
    {K2,1/(1/gA2^2+1/gB2^2)*1/(4 Pi)^2*2*(Sin[The2]^2*(1-3*Sin[The2]^2)*MassBW^2+(gA2^2+gB2^2)*vlv^2*Tan[The2]^2*Log[1+mLd2/((gA2^2+gB2^2)*vlv^2)])},
    {me2[1,1],me2[1,1]+ K1},
    {me2[2,2],me2[2,2]+ K1},
    {me2[3,3],me2[3,3]+ K1},
    {mu2[1,1],mu2[1,1]+ (4/9 K1)},
    {mu2[2,2],mu2[2,2]+ (4/9 K1)},
    {mu2[3,3],mu2[3,3]+ (4/9 K1)},
    {ml2[1,1],ml2[1,1]+ (3/4 K2+1/4 K1)},
    {ml2[2,2],ml2[2,2]+ (3/4 K2+1/4 K1)},
    {ml2[3,3],ml2[3,3]+ (3/4 K2+1/4 K1)},
    {mq2[1,1],mq2[1,1]+ (3/4 K2+1/36 K1)},
    {mq2[2,2],mq2[2,2]+ (3/4 K2+1/36 K1)},
    {mq2[3,3],mq2[3,3]+ (3/4 K2+1/36 K1)},
    {md2[1,1],md2[1,1]+ (1/9 K1)},
    {md2[2,2],md2[2,2]+ (1/9 K1)},
    {md2[3,3],md2[3,3]+ (1/9 K1)},
    {mHu2,mHu2 + 3/4 K2 + 1/4 K1},
    {mHd2,mHd2 + 3/4 K2 + 1/4 K1}
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
    Lambda3Input->10^5,
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
    mLd2Input->10^5
};


SA`AddOneLoopDecay = False;