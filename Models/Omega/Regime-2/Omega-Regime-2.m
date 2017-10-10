Off[General::spell]
Print["Model file for the Omega Model (Regime-2) loaded"];

ModelName = "Omega";
ModelNameLaTeX ="Omega";
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
Gauge[[2]]={WL, SU[2], left,        gL, True,  RpM};
Gauge[[3]]={WR0, U[1], right,       gR, False, RpM};
Gauge[[4]]={G,  SU[3], color,       g3, False, RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {qL, 3, {uL, dL},   1/6, 2,    0,  3, RpM};
SuperFields[[2]] = {dR, 3, conj[dR],  -1/6, 1,  1/2, -3, RpM};  
SuperFields[[3]] = {uR, 3, conj[uR],  -1/6, 1, -1/2, -3, RpM};  
SuperFields[[4]] = {lL, 3, {vL, eL},  -1/2, 2,    0,  1, RpM};
SuperFields[[5]] = {eR, 3, conj[eR],   1/2, 1,  1/2,  1, RpM};
SuperFields[[6]] = {vR, 3, conj[vR],   1/2, 1, -1/2,  1, RpM};

SuperFields[[7]] =  {Hd,         1, {Hd0, Hdm},                                                    0, 2,-1/2, 1, RpP};
SuperFields[[8]] =  {Hu,         1, {Hup, Hu0},                                                    0, 2, 1/2, 1, RpP};
SuperFields[[9]] =  {deltaR0,    1, deltaR0,                                                      -1, 1,  1,  1, RpP};
SuperFields[[10]] = {deltaRbar0, 1, deltaRbar0,                                                    1, 1, -1,  1, RpP};
SuperFields[[11]] = {omegaL,     1, {{omegaL0r2/Sqrt[2], omegaLp},{omegaLm, -omegaL0r2/Sqrt[2]}},  0, 3,  0,  1, RpP};
SuperFields[[12]] = {omegaR0,    1, omegaR0,                                                       0, 1,  0,  1, RpP};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)
      
 NoU1Mixing=True;  

SuperPotential = Yu qL.uR.Hu + Yd qL.dR.Hd + Ye lL.eR.Hd + Yv lL.vR.Hu + fc1 vR.deltaR0.vR \
                 + Mdeltac1  deltaR0.deltaRbar0 + Momega omegaL.omegaL + conj[Momega] omegaR0.omegaR0 \
                 + ac1 deltaR0.omegaR0.deltaRbar0 + b omegaL.Hd.Hu +bc omegaR0.Hd.Hu + \[Mu] Hu.Hd;
  

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{ { {VB,VWR0},{VBY,VZ2},ZZ} };



          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SomegaR0, {vR, 1/Sqrt[2]}, {sigmaOmR,\[ImaginaryI]/Sqrt[2]},{phiOmR,1/Sqrt[2]}},
  {SdeltaR0, {vBL, 1/Sqrt[2]}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
  {SdeltaRbar0, {vBL, 1/Sqrt[2]}, {sigmaRbar, \[ImaginaryI]/Sqrt[2]},{phiRbar,1/Sqrt[2]}}};

 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
  {  {{phiR, phiRbar, phiOmR}, {hhR2, ZH}},
     {{sigmaR, sigmaRbar, sigmaOmR}, {AhR2, ZP}},
     {{fB, fWR0, FdeltaR0, FdeltaRbar0, FomegaR0}, {L0, ZN}},
     {{FvL, conj[FvR]}, {N0, Znu}},
     {{SdL},{SDLr2,UDL}},
     {{SuL},{SULr2,UUL}},
     {{SdR},{SDRr2,UDR}},
     {{SuR},{SURr2,UUR}},
     {{SeL},{SELr2,UEL}},                    
     {{SeR},{SERr2,UER}},     
     {{SvL},{SVLr2,UVL}},
     {{SvR},{SVRr2,UVR}},
     {{SHd0,conj[SHu0]},{SH0r2,UH0}},
     {{SHdm,conj[SHup]},{SHCr2,UHC}}, 
     {{SomegaLp,conj[SomegaLm]},{SOmLpR2,UDLp}}
  };


DEFINITION[EWSB][DiracSpinors]={
 FvR2 ->{   N0, conj[N0]},
 ChiR2 ->{  L0, conj[L0]},
 ChaR2 ->{  FomegaLm, conj[FomegaLp]},
 GluR2 ->{ fG, conj[fG]},
 BinoR2 ->{ fB, conj[fB]},
 WinoLR2 ->{ fWL, conj[fWL]},
 H0r2 ->{ FHd0, conj[FHu0]},
 HCr2 ->{FHdm, conj[FHup]},
 Fomega0 ->{FomegaL0r2, conj[FomegaL0r2]},
 Fd1r2 ->{   FdL, 0},
 Fd2r2 ->{0, FdR},
 GluR2 ->{ fG, conj[fG]},
 BinoR2 ->{ fB, conj[fB]},
 WinoLR2 ->{ fWL, conj[fWL]},
 Fe1r2 ->{ FeL, 0},
 Fe2r2 ->{0, FeR},
 Fu1r2 ->{FuL, 0},
 Fu2r2 ->{0, FuR}
};

DEFINITION[GaugeES][DiracSpinors]={
 Fd1r2 ->{   FdL, 0},
 Fd2r2 ->{0, FdR},
 GluR2 ->{ fG, conj[fG]},
 BinoR2 ->{ fB, conj[fB]},
 WinoLR2 ->{ fWL, conj[fWL]},
 Fe1r2 ->{ FeL, 0},
 Fe2r2 ->{0, FeR},
 Fu1r2 ->{FuL, 0},
 Fu2r2 ->{0, FuR},
 ChaR2 ->{  FomegaLm, conj[FomegaLp]},
 GluR2 ->{ fG, conj[fG]},
 BinoR2 ->{ fB, conj[fB]},
 WinoLR2 ->{ fWL, conj[fWL]},
 H0r2 ->{ FHd0, conj[FHu0]},
 HCr2 ->{FHdm, conj[FHup]},
 Fomega0 ->{FomegaL0r2, conj[FomegaL0r2]}
};

