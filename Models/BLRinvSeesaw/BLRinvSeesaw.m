(* ::Package:: *)

Off[General::spell]
Print["U(1)_BL  U(1)_R symmetric model with inverse Seesaw"];
Print["From GUT scale to electroweak scale (only important if using SPheno)"];

Model`Name = "BLRinvSeesaw";
Model`NameLaTeX ="$U(1)_R \times U(1)_{B-L}$ with inverse seesaw";
Model`Authors = "M. Hirsch, L. Reicher, F. Staub";
Model`Date = "2012-09-01";

(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],MParity};
MpM = {-1,-1,1};
MpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]] = {B,   U[1], bminl,   gBL, False, MpM};
Gauge[[2]] = {WL, SU[2], left,    gL,  True , MpM};
Gauge[[3]] = {BR,  U[1], right,   gR,  False, MpM};
Gauge[[4]] = {G,  SU[3], color,   g3,  False, MpM};


(* Chiral Superfields *)

SuperFields[[1]]  = {q,       3, {uL,  dL},    +1/6,   2,     0,     3, MpM};
SuperFields[[2]]  = {l,       3, {vL,  eL},    -1/2,   2,     0,     1, MpM};
SuperFields[[3]]  = {Hd,      1, {Hd0, Hdm},      0,   2,  -1/2,     1, MpP};
SuperFields[[4]]  = {Hu,      1, {Hup, Hu0},      0,   2,  +1/2,     1, MpP};
SuperFields[[5]]  = {ChiR,    1, chiR0,        -1/2,   1,  +1/2,     1, MpP};
SuperFields[[6]]  = {ChiRbar, 1, chiRbar0,     +1/2,   1,  -1/2,     1, MpP};

SuperFields[[7]]  = {S, 3, si,                    0,   1,     0,     1, MpM};

SuperFields[[8]]  = {u, 3, conj[uR],      -1/6,   1,  -1/2,    -3, MpM};
SuperFields[[9]]  = {d, 3, conj[dR],      -1/6,   1,  +1/2,    -3, MpM};
SuperFields[[10]] = {v, 3, conj[vR],      +1/2,   1,  -1/2,     1, MpM};
SuperFields[[11]] = {e, 3, conj[eR],      +1/2,   1,  +1/2,     1, MpM};

(*------------------------------------------------------*)
(* Superpotential                                       *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd - MuR ChiRbar.ChiR + Ys v.ChiR.S + Yv v.l.Hu;



NameOfStates={GaugeES, EWSB};


(********************************************************)
(*                   Before EWSB                        *)
(********************************************************)


(*------------------------------------------------------*)
(* Dirac-Spinors (GaugeES)                              *)
(*------------------------------------------------------*)

DEFINITION[GaugeES][DiracSpinors]=
{
  Bino   -> {fB, conj[fB]},
  BinoR  -> {fBR, conj[fBR]}, 
  Wino   -> {fWL, conj[fWL]},
  Glu    -> {fG, conj[fG]},
  H0     -> {FHd0, conj[FHu0]},
  HC     -> {FHdm, conj[FHup]},
  ChiR0  -> {FchiR0, conj[FchiRbar0]}, 
  Fd1    -> {FdL, 0},
  Fd2    -> {0, FdR},
  Fu1    -> {FuL, 0},
  Fu2    -> {0, FuR},
  Fe1    -> {FeL, 0},
  Fe2    -> {0, FeR},
  Fv1    -> {FvL,0},
  Fv2    -> {0,FvR},
  FS0    -> {Fsi, conj[Fsi]}
};


(********************************************************)
(*                   After EWSB                         *)
(********************************************************)

(*------------------------------------------------------*)
(* VEVs                                                 *)
(*------------------------------------------------------*)

DEFINITION[EWSB][VEVs]=
{
  {SchiR0, {vChiR, 1/Sqrt[2]}, {sigmaChiR, I/Sqrt[2]},{phiChiR,1/Sqrt[2]}},
  {SchiRbar0, {vChiRb, 1/Sqrt[2]}, {sigmaChiRbar, I/Sqrt[2]},{phiChiRbar,1/Sqrt[2]}},
  
  {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, 1/Sqrt[2]}},
  {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, 1/Sqrt[2]}}
};


(*------------------------------------------------------*)
(* Mixing Gauge Sector                                  *)
(*------------------------------------------------------*)

(* new definition of the gauge sector: *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VWL[3],VB,VBR},{VP,VZ,VZR},ZZ},
  {{VWL[1],VWL[2]},{VWm,conj[VWm]},ZW},
  {{fWL[1],fWL[2],fWL[3]},{fWm,fWp,fW0},ZfW}
};




(*------------------------------------------------------*)
(* Mixing Matter Sector                                 *)
(*------------------------------------------------------*)

DEFINITION[EWSB][MatterSector]= 
{ 
  {{SdL, SdR}, {Sd, ZD}},
  {{SvL, SvR, Ssi}, {Sv, ZV}},
  {{SuL, SuR}, {Su, ZU}},
  {{SeL, SeR}, {Se, ZE}},
  
  {{phid, phiu, phiChiRbar, phiChiR}, {hh, ZH}},
  {{sigmad, sigmau, sigmaChiRbar, sigmaChiR}, {Ah, ZA}},
  {{SHdm, conj[SHup]}, {Hpm,ZP}},
  
  {{fB, fW0, FHd0, FHu0,fBR, FchiRbar0, FchiR0}, {L0, ZN}},
  {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
  
  {{FvL, conj[FvR], Fsi},{Fv0,ZFV}},
  {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
  {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
  {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}
};


(*------------------------------------------------------*)
(* Dirac-Spinors (EWSB)                                 *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]=
{
  Fd   -> {FDL, conj[FDR]},
  Fe   -> {FEL, conj[FER]},
  Fu   -> {FUL, conj[FUR]},
  Fv   -> {Fv0, conj[Fv0]},
  Chi  -> {L0, conj[L0]}, 
  Cha  -> {Lm, conj[Lp]},
  Glu  -> {fG, conj[fG]}
};

           
SpectrumFile = None;


