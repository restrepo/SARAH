Off[General::spell]

Model`Name = "sMSSM";
Model`NameLaTeX ="secluded MSSM";
Model`Authors = "F.Staub";
Model`Date = "2018-04-12";


(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)
(* 2015-11-16: changed SPheno.m *)
(* 2018-04-12: modified U(1)' charges; adjustes SPheno *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)


Global[[1]]={Z[2],RParity}; 
RpM = {-1,-1,1}; RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False, RpM};
Gauge[[4]]={U,   U[1], additional,  gp,False, RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},     1/6, 2, 3, -QH/2, RpM};  
SuperFields[[2]] = {l, 3, {vL,  eL},    -1/2, 2, 1, -QH/2, RpM};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},   -1/2, 2, 1, QH, RpP};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},    1/2, 2, 1, QH, RpP};

SuperFields[[5]] = {d, 3, conj[dR],   1/3, 1, -3, -QH/2, RpM};
SuperFields[[6]] = {u, 3, conj[uR],  -2/3, 1, -3, -QH/2, RpM};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1, -QH/2, RpM};

SuperFields[[8]] =  {s, 1, sR,     0, 1,  1, -2 QH,  RpP};
SuperFields[[9]] =  {s1,1, S1,     0, 1,  1, -2 QH, RpP};
SuperFields[[10]] = {s2, 1, S2,    0, 1,  1, -2 QH, RpP};
SuperFields[[11]] = {s3, 1, S3,    0, 1,  1, 4 QH, RpP};

NoU1Mixing=True;

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Lambda] Hu.Hd.s + \[Kappa]/3 s1.s2.s3;

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

(* ----- Before EWSB ----- *)



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
  Fv -> {FvL, 0},
  FU -> {fU, conj[fU]},
  FS -> {FsR, conj[FsR]},
  Fs1 -> {FS1, conj[FS1]},
  Fs2 -> {FS2, conj[FS2]},
  Fs3 -> {FS3, conj[FS3]}
};


(* ----- After EWSB ----- *)


DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VU},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};
  		  
  		  
   
        
 
DEFINITION[EWSB][VEVs]= 
{{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
 {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
 {SsR, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}},
 {SS1, {vS1, 1/Sqrt[2]}, {sigma1, \[ImaginaryI]/Sqrt[2]},{phi1,1/Sqrt[2]}},
 {SS2, {vS2, 1/Sqrt[2]}, {sigma2, \[ImaginaryI]/Sqrt[2]},{phi2,1/Sqrt[2]}},
 {SS3, {vS3, 1/Sqrt[2]}, {sigma3, \[ImaginaryI]/Sqrt[2]},{phi3,1/Sqrt[2]}}
         };


 
DEFINITION[EWSB][MatterSector]= 

{    {{SdL, SdR}, {Sd, ZD}},
     {{SvL}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiS,phi1,phi2,phi3}, {hh, ZH}},
     {{sigmad, sigmau,sigmaS,sigma1,sigma2,sigma3}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fU,fB, fW0, FHd0, FHu0,FsR,FS1,FS2,FS3}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}            
   }; 

DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  FvL, 0},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};	
