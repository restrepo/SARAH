RegimeNr = 3;
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


EXTPAR = {{100, vRinput},
	  {200, vBLinput},
	  {999, g1RBLFactor}}; 	

RealParameters = {TanBeta, vRinput,vBLinput,g1RBLFactor,m0};

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = {gBL==g2, gBL==gL, g1 == g2};

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
(* {MassWR,m12}, *)
{MassG,m12}
};

DEFINITION[MatchingConditions]=Default[THDMII];



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;


(* Definition of thresholds and boundary conditions *)

ThresholdScales = {vRinput,VBLinput};

BoundaryConditionsUp = Table[{},{Length[ThresholdScales]}];
BoundaryConditionsDown = Table[{},{Length[ThresholdScales]}];

BoundaryConditionsUp[[1]] = { 
 {YQ[index1,index2,1],   (Yu[index1,index2] Sin[Theta1] + Yd[index1,index2] Sin[Theta2])/Sin[Theta2-Theta1] },
 {YQ[index1,index2,2],   (Yu[index1,index2] Cos[Theta1] + Yd[index1,index2] Cos[Theta2])/Sin[Theta2-Theta1] },
 {YL[index1,index2,1],   (Yv[index1,index2] Sin[Theta1] + Ye[index1,index2] Sin[Theta2])/Sin[Theta2-Theta1] },
 {YL[index1,index2,2],   (Yv[index1,index2] Cos[Theta1] + Ye[index1,index2] Cos[Theta2])/Sin[Theta2-Theta1] },
 {g2, (gL+gR)/2}
};


BoundaryConditionsDown[[1]] = {
 {vR,vRinput}, 
 {AlphaOm, LHInput[AlphaOm]},
 {a, aInput},
 {Mu3, LHInput[Mu3]},
 {Mu3IN[1,1],((vR*AlphaOm[1,2])/2 + Mu3IN[1,2])*(-(vR*AlphaOm[1,2])/2 + Mu3IN[1,2])/Mu3IN[2,2]}, 
 {Mu3,Mu3IN},
 {Theta1, ArcTan[RealPart[((vR*AlphaOm[1,2])/2 + Mu3[1,2])/Mu3[2,2]]]},
 {Theta2, ArcTan[RealPart[(-(vR*AlphaOm[1,2])/2 + Mu3[1,2])/Mu3[2,2]]]},
 {Rfactor, Sin[Theta1] Cos[Theta2] - Cos[Theta1] Sin[Theta2]},
 {gL, g2},
 {gR, g2},
 {Yd[index1,index2], YQ[index1,index2,1] Cos[Theta1] - YQ[index1,index2,2] Sin[Theta1]},
 {Yu[index1,index2], - YQ[index1,index2,1] Cos[Theta2] + YQ[index1,index2,2] Sin[Theta2]},
 {Ye[index1,index2], YL[index1,index2,1] Cos[Theta1] - YL[index1,index2,2] Sin[Theta1]},
 {Yv[index1,index2], - YL[index1,index2,1] Cos[Theta2] + YL[index1,index2,2] Sin[Theta2]},
 {T[Yd][index1,index2], T[YQ][index1,index2,1] Cos[Theta1] - T[YQ][index1,index2,2] Sin[Theta1]},
 {T[Yu][index1,index2], - T[YQ][index1,index2,1] Cos[Theta2] + T[YQ][index1,index2,2] Sin[Theta2]},
 {T[Ye][index1,index2], T[YL][index1,index2,1] Cos[Theta1] - T[YL][index1,index2,2] Sin[Theta1]},
 {T[Yv][index1,index2], - T[YL][index1,index2,1] Cos[Theta2] + T[YL][index1,index2,2] Sin[Theta2]},
 {fc1, -conj[f]},
 {T[fc1], -conj[T[f]]},
 {Mdeltac1,conj[Mdelta]},
 {B[Mdeltac1],conj[B[Mdelta]]},
 {ac1,-conj[a]/Sqrt[2]},
 {b,2 AlphaOm[1,2] Rfactor},
 {bc,Sqrt[2] conj[AlphaOm[1,2]] Rfactor},
 {T[ac1],-conj[T[a]]/Sqrt[2]},
 {T[b],2 T[AlphaOm][1,1] Rfactor},
 {T[bc],Sqrt[2] conj[T[AlphaOm][1,1]] Rfactor},
 {muR2,mqR2},
 {mdR2,mqR2},
 {meR2,mlR2},
 {mvR2,mlR2},
 {mdeltaR02,mdeltaR2},
 {mdeltaRbar02,mdeltaRbar2},
 {momegaR02,momegaR2},
 {mHd2, Cos[Theta1]^2 mPhi2[1,1] + Sin[Theta1]^2 mPhi2[2,2] - Sin[Theta1] Cos[Theta1]( mPhi2[1,2] +  mPhi2[2,1] )},
 {mHu2, Cos[Theta2]^2 mPhi2[1,1] + Sin[Theta2]^2 mPhi2[2,2] - Sin[Theta2] Cos[Theta2]( mPhi2[1,2] +  mPhi2[2,1] )},
 {MassWR0, MassWL}
 };

BoundaryConditionsUp[[2]] = { 
{gR, g1RBLFactor g1}, 
{gBL, Sqrt[2] g1 gR /Sqrt[5 gR^2 -3 g1^2]},
{gL, g2},
{Yv, LHInput[Yv]}
};

BoundaryConditionsDown[[2]] = {
{vBL,vBLinput},
{g1, Sqrt[5] gR gBL/Sqrt[2 gR^2 + 3 gBL^2]},
{g1RBLFactor, gR/g1},
{g2, gL},
{MassB, (2 gR^2 MassB + 3 gBL^2 MassWR0)/(2 gR^2 + 3 gBL^2)},
{MassWB,MassWL},
{ml2,mlL2},
{me2,meR2},
{mq2,mqL2},
{md2,mdR2},
{mu2,muR2},
{WOp,MatMul2[MatMul2[Yv,InverseMatrix[fc1],FortranFalse],Transpose[Yv],FortranFalse]/vR}
};

InitializationValues = {
 {Mu3IN[1,1], (Mu3IN[1,2]^2 - AlphaOmIN[1,2]^2 vRInput^2/4)/Mu3IN[2,2]},
 {Theta1, ArcTan[RealPart[-(Mu3IN[1,2]+AlphaOmIN[1,2] vRInput/2)/Mu3IN[2,2]]]},
 {Theta2, ArcTan[RealPart[(Mu3IN[1,2]-AlphaOmIN[1,2] vRInput/2)/Mu3IN[2,2]]]},
 {Mdelta, aInput*SignumMdelta*vRinput/2 },
 {Momega, SignumMomega*(aInput^2*vBLinput^2)/(8 Mdelta)}
};


RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWM^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};
