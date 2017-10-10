RegimeNr = 2;
IntermediateScale = False;

MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero},
        {6,Bzero},
        {7,SignumMomega},
        {8,SignumMdelta},
        {9,aInput}};

EXTPAR = {
      {100, vRinput},
	  {101, vBLinput},
	  {200, TScale},
	  {999, g1RBLFactor}}; 	

RealParameters = {TanBeta, vRinput,vBLinput,Theta1,Theta2,TScale,m0};

AdditionalVariablesSPheno={Yv[3,3]};

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = {gBL==g2, g1 == g2};

BoundaryHighScale={
{T[YQ], Azero*YQ},
{T[YL], Azero*YL},
{f, LHInput[f]},
{T[f], Azero*fOm},
{T[AlphaOm], Azero*AlphaOmIN},
{T[a], Azero*aInput},
{B[Mdelta],Bzero*Mdelta},
{B[Momega],Bzero*Momega},
{B[Mu3],Bzero*Mu3IN},
{mqL2, DIAGONAL m0^2},
{mqR2, DIAGONAL m0^2},
{mlL2, DIAGONAL m0^2},
{mlR2, DIAGONAL m0^2},
{mPhi2, DIAGONAL m0^2},
{mdeltaL2, m0^2},
{mdeltaLbar2, m0^2},
{mdeltaR2, m0^2},
{mdeltaRbar2, m0^2},
{momegaL2, m0^2},
{momegaR2, m0^2},
{MassB, m12},
{MassWL,m12},
{MassG,m12}
};


DEFINITION[MatchingConditions]=Default[THDMII];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


(* Definition of thresholds and boundary conditions *)

ThresholdScales = {TScale};

BoundaryConditionsUp = Table[{},{Length[ThresholdScales]}];
BoundaryConditionsDown = Table[{},{Length[ThresholdScales]}];

BoundaryConditionsUp[[1]] = { 
 {YQ[index1,index2,1],   (Yu[index1,index2] Sin[Theta1] + Yd[index1,index2] Sin[Theta2])/Sin[Theta2-Theta1] },
 {YQ[index1,index2,2],   (Yu[index1,index2] Cos[Theta1] + Yd[index1,index2] Cos[Theta2])/Sin[Theta2-Theta1] },
 {YL[index1,index2,1],   (Yv[index1,index2] Sin[Theta1] + Ye[index1,index2] Sin[Theta2])/Sin[Theta2-Theta1] },
 {YL[index1,index2,2],   (Yv[index1,index2] Cos[Theta1] + Ye[index1,index2] Cos[Theta2])/Sin[Theta2-Theta1] },
 {gBL, Sqrt[2] g1 g2 /Sqrt[5 g2^2 -3 g1^2]},
 {Yv, LHInput[Yv]}
};


BoundaryConditionsDown[[1]] = {
 {vR,vRinput}, 
 {vBL,vBLinput},
 {AlphaOm, LHInput[AlphaOm]},
 {a, aInput},
 {Mu3, LHInput[Mu3]},
 {Mu3IN[1,1],((vR*AlphaOm[1,2])/2 + Mu3IN[1,2])*(-(vR*AlphaOm[1,2])/2 +Mu3IN[1,2])/Mu3IN[2,2]}, 
 {Mu3,Mu3IN},
 {Theta1, ArcTan[RealPart[((vR*AlphaOm[1,2])/2 + Mu3[1,2])/Mu3[2,2]]]},
 {Theta2, ArcTan[RealPart[(-(vR*AlphaOm[1,2])/2 + Mu3[1,2])/Mu3[2,2]]]},
 {g1, Sqrt[5] g2 gBL/Sqrt[2 g2^2 + 3 gBL^2]},
 {MassB, (2 g2^2 MassB + 3 gBL^2 MassWL)/(2 g2^2 + 3 gBL^2)},
 {MassWB,MassWL},
 {Yd[index1,index2], YQ[index1,index2,1] Cos[Theta1] - YQ[index1,index2,2] Sin[Theta1]},
 {Yu[index1,index2], - YQ[index1,index2,1] Cos[Theta2] + YQ[index1,index2,2] Sin[Theta2]},
 {Ye[index1,index2], YL[index1,index2,1] Cos[Theta1] - YL[index1,index2,2] Sin[Theta1]},
 {Yv[index1,index2], - YL[index1,index2,1] Cos[Theta2] + YL[index1,index2,2] Sin[Theta2]},
 {T[Yd][index1,index2], T[YQ][index1,index2,1] Cos[Theta1] - T[YQ][index1,index2,2] Sin[Theta1]},
 {T[Yu][index1,index2], - T[YQ][index1,index2,1] Cos[Theta2] + T[YQ][index1,index2,2] Sin[Theta2]},
 {T[Ye][index1,index2], T[YL][index1,index2,1] Cos[Theta1] - T[YL][index1,index2,2] Sin[Theta1]},
 {mq2,mqR2},
 {mu2,mqR2},
 {md2,mqR2},
 {me2,mlR2},
 {ml2,mlR2},
 {mHd2, Cos[Theta1]^2 mPhi2[1,1] + Sin[Theta1]^2 mPhi2[2,2] - Sin[Theta1] Cos[Theta1]( mPhi2[1,2] +  mPhi2[2,1] )},
 {mHu2, Cos[Theta2]^2 mPhi2[1,1] + Sin[Theta2]^2 mPhi2[2,2] - Sin[Theta2] Cos[Theta2]( mPhi2[1,2] +  mPhi2[2,1] )},
 {WOp,MatMul2[MatMul2[Yv,InverseMatrix[f],FortranFalse],Transpose[Yv],FortranFalse]/vR}
 };


InitializationValues = {
 {Mu3IN[1,1], (Mu3IN[1,2]^2 - AlphaOmIN[1,2]^2 vRInput^2/4)/Mu3IN[2,2]},
 {Theta1, ArcTan[RealPart[-(Mu3IN[1,2]+AlphaOmIN[1,2] vRInput/2)/Mu3IN[2,2]]]},
 {Theta2, ArcTan[RealPart[(Mu3IN[1,2]-AlphaOmIN[1,2] vRInput/2)/Mu3IN[2,2]]]},
 {Mdelta, aInput*SignumMdelta*vRinput/2 },
 {Momega, SignumMomega*(aInput^2*vBLinput^2)/(8 Mdelta)}
};

SA`AddOneLoopDecay = True;

