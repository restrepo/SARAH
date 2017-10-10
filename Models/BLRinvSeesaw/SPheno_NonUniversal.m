(* -------------------------------------------------------- *)
(* Input parameters                                         *)
(* -------------------------------------------------------- *)

MINPAR = {
  {1,  m0},
  {2,  m12},
  {4,  SignumMu},
  {5,  Azero},
  {7,  TanBeta},
  {9,  TanBetaRinput},
  {10, mARinput},
  {11, vR},
  {12, MuRinput}};

RealParameters = {TanBeta,TanBetaRinput,g1RBLFactor};

(* -------------------------------------------------------- *)
(* Tadpole equations                                        *)
(* -------------------------------------------------------- *)

ParametersToSolveTadpoles = {B[\[Mu]], \[Mu], mChiR2, mChiRbar2};


AuxiliaryHyperchargeCoupling = True;

ExpressionAuxHypercharge =Sqrt[(gBL*gR - gBLR*gRBL)^2/((gBLR - gR)^2 + (gBL - gRBL)^2)];

(* -------------------------------------------------------- *)
(* Renormalization scale                                    *)
(* -------------------------------------------------------- *)

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

(* -------------------------------------------------------- *)
(* Boundary conditions                                      *)
(* -------------------------------------------------------- *)
 
(* Definition of the GUT scale  *)
  
ConditionGUTscale = (gBL*gR - gBLR*gRBL)/Sqrt[gR^2 + gRBL^2] == gL;

(* Boundary conditions at the GUT scale  *)

BoundaryHighScale = {  
  {gBL, (gBL*gR - gBLR*gRBL)/Sqrt[gR^2 + gRBL^2]},
  {gL, gBL},
  {gR, gBL},
  {gBLR, 0},
  {gRBL, 0},
  {T[Yu], Azero*Yu},
  {T[Yd], Azero*Yd},
  {T[Yv], Azero*Yv},
  {T[Ye], Azero*Ye},
  {T[Ys], Azero*Ys},
  {mq2, DIAGONAL m0^2},
  {ml2, DIAGONAL m0^2},
  {mu2, DIAGONAL m0^2},
  {md2, DIAGONAL m0^2},
  {mv2, DIAGONAL m0^2},
  {me2, DIAGONAL m0^2},
  {mS2, DIAGONAL m0^2},
  {mHu2,      m0^2},
  {mHd2,      m0^2},
  {MassB,   m12},
  {MassBR,  m12},
  {MassWL,  m12},
  {MassG,   m12},
  {MassBBR, 0},
  {MassBRB, 0}};

(* Boundary conditions at the SUSY scale  *)

BoundarySUSYScale = {
  {TanBetaR, TanBetaRinput},
  {vChiR, vR*TanBetaR/Sqrt[1 + TanBetaR^2]},
  {vChiRb, vR*1/Sqrt[1 + TanBetaR^2]},
  {MuR, MuRinput},
  {B[MuR], mARinput^2/(TanBetaR + 1/TanBetaR)},
  {Yv, LHInput[Yv]},
  {Ys, LHInput[Ys]}};

(* Boundary conditions at the EWSB scale  *)


BoundaryEWSBScale = {
  {gYauxt, Sqrt[5/3]*gYaux},
  {gR, g1RBLFactor*gYauxt}, 
  {gRBLt, 1*gRBL},
  {gBLRt, Sqrt[2/3]*gBLR},
  {gBLt, (5 gBLRt gR gRBLt - Sqrt[6] gRBLt gYauxt^2 + Sqrt[(3 gBLRt^2 - 2 Sqrt[6] gBLRt gR + 2 gR^2) (5 (gR^2 + gRBLt^2) - 3 gYauxt^2) gYauxt^2])/(5 gR^2 - 3 gYauxt^2)},
  {gBL, Sqrt[3/2]*gBLt},
  {TanBetaR, TanBetaRinput},
  {vChiR, vR*TanBetaR/Sqrt[1 + TanBetaR^2]},
  {vChiRb, vR*1/Sqrt[1 + TanBetaR^2]},
  {MuR, MuRinput},
  {B[MuR], mARinput^2/(TanBetaR + 1/TanBetaR)}};


(* Save factor which is used in the next iteration for running up *)

BoundaryEWSBScaleRunningDown = {
  {gBLt, gBL*Sqrt[2/3]},
  {gRBLt, 1*gRBL},
  {gBLRt, Sqrt[2/3]*gBLR},
  {gYauxt, Sqrt[5*(gBLt*gR - gBLRt*gRBLt)^2/(3*(gBLt^2 + gBLRt^2) + 2*(gR^2 + gRBLt^2) - 2*Sqrt[6]*(gR*gBLRt + gBLt*gRBLt))]},
  {g1RBLFactor, gR/gYauxt},
  {gYaux,Sqrt[3/5]*gYauxt}
 };

(* Boundary conditions for SUSY scale input *)

BoundaryLowScaleInput = {
  {vu, vuexp},
  {vd, vdexp}};

(* -------------------------------------------------------- *)
(* Mass ordering for pseudo-scalars                         *)
(* -------------------------------------------------------- *)

InitializationValues = {
  {g1RBLFactor,1.0},
  {gBLR, -0.06},
  {gRBL, -0.06}};


(* -------------------------------------------------------- *)
(* Two and three body decays                                *)
(* -------------------------------------------------------- *)

ListDecayParticles =  {hh, Ah, Hpm, Sd, Su, Se, Sv, Chi, Cha, Glu, Fu, Fv, VZ, VZR};

ListDecayParticles3B = Automatic;


(* -------------------------------------------------------- *)
(* Definitions                                              *)
(* -------------------------------------------------------- *)

(* vu and vd with TanBeta, TanBetaR, v and vR = Sqrt[vChiR^2 + vChiRb^2] *)

vuexp =                                                        \
(2 Sqrt[mz2 (-4 mz2 + (gBL^2 + gR^2) vR^2)])/                  \
  Sqrt[-(1 + 1/TanBeta^2) (gR^2 (4 mz2 - gBL^2 vR^2) +         \
   gL^2 (4 mz2 - (gBL^2 + gR^2) vR^2))];


vdexp =                                                        \
(2 Sqrt[mz2 (-4 mz2 + (gBL^2 + gR^2) vR^2)])/                  \
 Sqrt[-(1 + TanBeta^2) (gR^2 (4 mz2 - gBL^2 vR^2) +            \
   gL^2 (4 mz2 - (gBL^2 + gR^2) vR^2))];

DefaultInputValues = {m0 -> 420, m12 -> 780, TanBeta->10, TanBetaRinput-> 1.15, SignumMu ->1, Azero -> -300, mARinput->820, vR->6000, MuRinput->-1230,Yv[1,1]-> 0.1, Yv[1,2]->0.147*10^-8, Yv[1,3]->0.167*10^-8, Yv[2,1]->0, Yv[2,2]->0.1, Yv[2,3]->0, Yv[3,1]->0.162*10^-7, Yv[3,2]->0,Yv[3,3]->0.1, Ys[1,1]->0.3, Ys[2,2]->0.3, Ys[3,3]->0.3}; 




