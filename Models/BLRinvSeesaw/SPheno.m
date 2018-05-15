(* -------------------------------------------------------- *)
(* Input parameters                                         *)
(* -------------------------------------------------------- *)

MINPAR = {
  {1,  m0},
  {2,  m12},
  {4,  SignumMu},
  {5,  Azero},
  {6,  SignumMuR},
  {7,  TanBeta},
  {9,  TanBetaRinput},
  {11, vR}};

RealParameters = {TanBeta,TanBetaRinput,g1RBLFactor,m0};

(* -------------------------------------------------------- *)
(* Tadpole equations                                        *)
(* -------------------------------------------------------- *)

ParametersToSolveTadpoles = {B[\[Mu]], B[MuR], \[Mu], MuR};


DEFINITION[MatchingConditions]={
 (* Matching for gauge couplings *)
 {gR, Sqrt[5/3]*g1RBLFactor*g1SM},
 {gBL, -((-g1SM^2 gRBL + gBLR gR gRBL + Sqrt[g1SM^2 (gBLR - gR)^2 (-g1SM^2 + gR^2 + gRBL^2)])/(g1SM^2 - gR^2))},
 {gL, g2SM},
 {g3, g3SM},
 
 
 (* Matching for VEVs *) 
 {vd, vSM/Sqrt[1 + TanBeta^2]},
 {vu, VEVSM1*TanBeta},
 
 (* Matching for Yukawas *) 
 {Yu, YuSM vSM/vu},
 {Yd, YdSM vSM/vd},
 {Ye, YeSM vSM/vd}


};



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
  {mChiR2,    m0^2},
  {mChiRbar2, m0^2},
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
  {Yv, LHInput[Yv]},
  {Ys, LHInput[Ys]}};

(* Boundary conditions at the EWSB scale  *)


BoundaryEWSBScale = {
  {TanBetaR, TanBetaRinput},
  {vChiR, vR*TanBetaR/Sqrt[1 + TanBetaR^2]},
  {vChiRb, vR*1/Sqrt[1 + TanBetaR^2]}};

  
(*
BoundaryEWSBScaleRunningDown = {
  {gBLt, gBL*Sqrt[2/3]},
  {gRBLt, 1*gRBL},
  {gBLRt, Sqrt[2/3]*gBLR},
  {gYaux, Sqrt[5*(gBLt*gR - gBLRt*gRBLt)^2/(3*(gBLt^2 + gBLRt^2) + 2*(gR^2 + gRBLt^2) - 2*Sqrt[6]*(gR*gBLRt + gBLt*gRBLt))]},
  {g1RBLFactor, gR/gYaux},
  {gYaux, Sqrt[3/5]*gYaux}
 };
*)


BoundaryEWSBScaleRunningDown = {
  {gBLt, gBL*Sqrt[2/3]},
  {g1RBLFactor, (Sqrt[3/5]*gR*Sqrt[(gBLR - gR)^2 + (gBL - gRBL)^2])/(gBL*gR - gBLR*gRBL)}
 };

 
(* Boundary conditions for SUSY scale input *)

BoundaryLowScaleInput = {
  {vu, vuexp},
  {vd, vdexp}};


InitializationValues = {
  {g1RBLFactor,1.0},
  {gBLR, -0.06},
  {gRBL, -0.06}};



(* -------------------------------------------------------- *)
(* Two and three body decays                                *)
(* -------------------------------------------------------- *)

ListDecayParticles = {hh, Ah, Hpm, Sd, Su, Se, Sv, Chi, Cha, Glu, Fu, Fv, VZ, VZR};  

ListDecayParticles3B = Automatic;


(* to speed up things *)
SA`AddOneLoopDecay = False

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

DefaultInputValues = {m0 -> 1500, m12 -> 1500, TanBeta->10, TanBetaRinput-> 1.04, SignumMu ->1,SignumMuR ->-1, Azero -> 0,  vR->5400, Yv[a_,a_]-> 0.1, Ys[a_,a_]->0.32}; 
