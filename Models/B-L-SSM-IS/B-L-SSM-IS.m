Off[General::spell]

Model`Name = "BLSSMIS";
Model`NameLaTeX ="B-L-SSM with inverse seesaw";
Model`Authors = "L.Basso, F.Staub";
Model`Date = "2012-09-01";

(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],MParity};
Global[[2]] = {Z[2],Z2IS};
MpM = {-1,-1,1};
MpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,  False, MpM, 0};
Gauge[[2]]={WB, SU[2], left,        g2,  True,  MpM, 0};
Gauge[[3]]={G,  SU[3], color,       g3,  False, MpM, 0};
Gauge[[4]]={Bp,  U[1], BminusL,     gBL, False, MpM, 0};

(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},    1/6, 2, 3,  1/6, MpM, 1};  
SuperFields[[2]] = {l, 3, {vL,  eL},   -1/2, 2, 1, -1/2, MpM, 1};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},  -1/2, 2, 1,    0, MpP, 1};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},   1/2, 2, 1,    0, MpP, 1};

SuperFields[[5]] = {d, 3, conj[dR],   1/3, 1, -3, -1/6, MpM, 1};
SuperFields[[6]] = {u, 3, conj[uR],  -2/3, 1, -3, -1/6, MpM, 1};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1,  1/2, MpM, 1};
SuperFields[[8]] = {vR,3, conj[vR],     0, 1,  1,  1/2, MpM, 1};

SuperFields[[9]]  = {C1, 1, C10,  0, 1, 1,   -1, MpP, -1};
SuperFields[[10]] = {C2, 1, C20,  0, 1, 1,    1, MpP, -1};
SuperFields[[11]] = {s1, 3, S1,   0, 1, 1, -1/2, MpM,  1};
SuperFields[[12]] = {s2, 3, S2,    0, 1, 1, 1/2, MpM, -1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd + \
                 Yv vR.l.Hu - MuP C1.C2 + Yn vR.C1.s2 + MUS s2.s2;


DeleteParticles={FS1,SS1};


(*----------------------------------------------*)
(*   DEFINITION                                  *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};



DEFINITION[GaugeES][DiracSpinors]={
  Bino ->{fB, conj[fB]},
  Wino -> {fWB, conj[fWB]},
  Glu -> {fG, conj[fG]},
  H0 -> {FHd0, conj[FHu0]},
  HC -> {FHdm, conj[FHup]},
  Fd1 -> {FdL, 0},
  Fd2 -> {0, FdR},
  Fu1 -> {FuL, 0},
  Fu2 -> {0, FuR},
  Fe1 -> {FeL, 0},
  Fe2 -> {0, FeR},
  Fv1 -> {FvL, 0},
  Fv2 -> {0, FvR},
  FC -> {FC10, FC20},
  FB -> {fBp, conj[fBp]},
  FS -> {FS1,conj[FS1]},
  FI -> {FS2,conj[FS2]}
};

(*--- Gauge Sector ---- *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};
        
 

       
(*--- VEVs ---- *)
        
          	
DEFINITION[EWSB][VEVs]= 
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
     {SC10, {x1, 1/Sqrt[2]}, {sigma1, \[ImaginaryI]/Sqrt[2]},{phi1, 1/Sqrt[2]}},
     {SC20, {x2, 1/Sqrt[2]}, {sigma2, \[ImaginaryI]/Sqrt[2]},{phi2, 1/Sqrt[2]}},
     {SvL, {0, 0}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SvR, {0, 0}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SS2, {0, 0}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}}     
};
 

 
(*--- Matter Sector ---- *)
 
 
DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{sigmaL,sigmaR,sigmaS}, {SvIm, ZVI}},
     {{phiL,phiR,phiS}, {SvRe, ZVR}},
     {{phid, phiu,phi1, phi2}, {hh, ZH}},
     {{sigmad, sigmau,sigma1, sigma2}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0,fBp,FC10,FC20}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{FvL,conj[FvR],FS2},{Fvm,UV}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}                    \
       }; 




DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  Fvm, conj[Fvm]},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]},
 FS -> {FS1,conj[FS1]}
};
