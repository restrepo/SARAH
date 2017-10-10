Off[General::spell]

Model`Name = "OmegaShort";
Model`NameLaTeX ="short form of Omega model";
Model`Authors = "F.Staub";
Model`Date = "2012-09-01";

(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False, RpM};
Gauge[[2]]={WL, SU[2], left,        g2,True,   RpM};
Gauge[[3]]={WR, SU[2], right,       g2,True,   RpM};
Gauge[[4]]={G,  SU[3], color,       g3,False,  RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {qL, 3, {uL,  dL},                1/6, 2, 1,  3, RpM};
SuperFields[[2]] = {qR, 3, {conj[dR], - conj[uR]},  -1/6, 1, 2, -3, RpM};  
SuperFields[[3]] = {lL, 3, {vL,  eL},               -1/2, 2, 1,  1, RpM};
SuperFields[[4]] = {lR, 3, {conj[eR],  - conj[vR]},  1/2, 1, 2,  1, RpM};

SuperFields[[5]] = {Phi,       2, {{Hd0, Hup},{Hdm, Hu0}},                                                   0, 2, -2, 1, RpP};
SuperFields[[6]] = {deltaL,    1, {{deltaLp/Sqrt[2], deltaLpp},{deltaL0, - deltaLp/Sqrt[2]}},                1, 3,  1, 1, RpP};
SuperFields[[7]] = {deltaLbar, 1, {{deltaLbarm/Sqrt[2], deltaLbar0},{deltaLbarmm, - deltaLbarm/Sqrt[2]}},   -1, 3,  1, 1, RpP};
SuperFields[[8]] = {deltaR,    1, {{deltaRm/Sqrt[2], deltaR0},{deltaRmm, - deltaRm/Sqrt[2]}},               -1, 1,  3, 1, RpP};
SuperFields[[9]] = {deltaRbar, 1, {{deltaRbarp/Sqrt[2], deltaRbarpp},{deltaRbar0, - deltaRbarp/Sqrt[2]}},    1, 1,  3, 1, RpP};
SuperFields[[10]] = {omegaL,   1, {{omegaL0/Sqrt[2], omegaLp},{omegaLm, - omegaL0/Sqrt[2]}},                 0, 3,  1, 1, RpP};
SuperFields[[11]] = {omegaR,   1, {{omegaR0/Sqrt[2], omegaRp},{omegaRm, - omegaR0/Sqrt[2]}},                 0, 1,  3, 1, RpP};



(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)
      
SuperPotential = YQ qL.qR.Phi + YL lL.lR.Phi + f lL.deltaL.lL + conj[f] lR.deltaR.lR + Mdelta deltaL.deltaLbar \
             + conj[Mdelta] deltaR.deltaRbar - Mu3/2 Phi.Phi+Momega omegaL.omegaL+conj[Momega] omegaR.omegaR \
             + a deltaL.omegaL.deltaLbar + conj[a] deltaR.omegaR.deltaRbar + AlphaOm omegaL.Phi.Phi+conj[AlphaOm] omegaR.Phi.Phi



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


(* ----- After EWSB ----- *)


(* Gauge Sector *)


DEFINITION[EWSB][GaugeSector]= 
{ {{VWR[1],VWR[2]},{VWRm,conj[VWRm]},ZW},
  {{VB,VWR[3]},{VBY,VZ2},ZZ},
  {{fWR[1],fWR[2],fWR[3]},{fWRm,fWRp,fWR0},ZfW}
};

         	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SomegaR0, {vR, 1/Sqrt[2]}, {sigmaOmR,\[ImaginaryI]/Sqrt[2]},{phiOmR,1/Sqrt[2]}},
  {SdeltaR0, {vBL, 1/Sqrt[2]}, {sigmaR,\[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
  {SdeltaRbar0, {vBL, 1/Sqrt[2]}, {sigmaRbar,\[ImaginaryI]/Sqrt[2]},{phiRbar,1/Sqrt[2]}}};

 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdeltaRm, conj[SdeltaRbarp],SomegaRm, conj[SomegaRp]},{Hpm1R1,ZC1}},
     {{fB,fWR0, FomegaR0,FdeltaR0, FdeltaRbar0}, {L0, ZN}},
     {{{fWRm, FomegaRm}, {fWRp, FomegaRp}}, {{Lm,UM}, {Lp,UP}}},
     {{phiR, phiRbar, phiOmR}, {hhR1, ZH}},
     {{sigmaR, sigmaRbar, sigmaOmR}, {AhR1, ZP}},
     {{FvL, conj[FvR]}, {N0, Znu}},
     {{SdL},{SDLr1,UDL}},
     {{SuL},{SULr1,UUL}},
     {{SdR},{SDRr1,UDR}},
     {{SuR},{SURr1,UUR}},
     {{SeL},{SELr1,UEL}},                    
     {{SeR},{SERr1,UER}},     
     {{SvL},{SVLr1,UVL}},
     {{SvR},{SVRr1,UVR}},
     {{SHd0,conj[SHu0]},{SH0r1,UH0}},
     {{SHdm,conj[SHup]},{SHCr1,UHC}}, 
     {{SomegaLm,conj[SomegaLp]},{SO1r1,UO1}},
     {{SdeltaLp,conj[SdeltaLbarm]},{SDLpR1,UDLp}},
     {{SdeltaLpp,conj[SdeltaLbarmm]},{SDLppR1,UDLpp}},
     {{SdeltaL0,conj[SdeltaLbar0]},{SDL0r1,UDL0}},
     {{SdeltaRmm,conj[SdeltaRbarpp]},{SDRmmR1,UDRmm}}
      };



(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[GaugeES][DiracSpinors]={
 Fd1r1 ->{  FdL, 0},
 Fd2r1 ->{  0, FdR},
 Fe1r1 ->{  FeL, 0},
 Fe2r1 ->{  0, FeR},
 Fu1r1 ->{  FuL, 0},
 Fu2r1 ->{  0, FuR},
 GluR1 ->{ fG, conj[fG]}, 
 BinoR1 ->{ fB, conj[fB]},
 WinoLr1 ->{ fWL, conj[fWL]}
};

DEFINITION[EWSB][DiracSpinors]={
 Fd1r1 ->{  FdL, 0},
 Fd2r1 ->{  0, FdR},
 Fe1r1 ->{  FeL, 0},
 Fe2r1 ->{  0, FeR},
 Fu1r1 ->{  FuL, 0},
 Fu2r1 ->{  0, FuR},
 FvR1 ->{ N0, conj[N0]},
 ChiR1 ->{ L0, conj[L0]}, 
 Cha1r1 ->{ Lm, conj[Lp]},
 GluR1 ->{ fG, conj[fG]}, 
 BinoR1 ->{ fB, conj[fB]},
 WinoLr1 ->{ fWL, conj[fWL]},
 H0r1 ->{ FHd0, conj[FHu0]},
 HCr1 ->{ FHdm, conj[FHup]},
 Om1r1 ->{ FomegaL0, conj[FomegaL0]},
 Om2r1 ->{ FomegaLm, conj[FomegaLp]},
 DL1r1 ->{ FdeltaLp, conj[FdeltaLbarm]},
 DL2r1 ->{ FdeltaLpp, conj[FdeltaLbarmm]},
 DL3r1 ->{ FdeltaL0, conj[FdeltaLbar0]},
 DR1r1 ->{ FdeltaR0, conj[FdeltaRbar0]},
 DR2r1 ->{ FdeltaRm, conj[FdeltaRbarp]},
 DR3r1 ->{ FdeltaRmm, conj[FdeltaRbarpp]}
};


