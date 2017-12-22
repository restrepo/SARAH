Off[General::spell]

Model`Name = "NInvSeesaw";
Model`NameLaTeX ="Inverse Seesaw NMSSM";
Model`Authors = "A.Vicente, F.Staub";
Model`Date = "2015-11-16";


(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)
(* 2015-11-16: changed SPheno.m *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)


Global[[1]]={Z[2], RParity}; 
Global[[2]]={Z[3], Z3}; 
Global[[3]]={U[1], NLep}; 

(* Charged under global symmetries *)
RpM = {-1,-1,1}; RpP = {1,1,-1};
Z3t = Exp[2*Pi*\[ImaginaryI]/3];

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, RpM, 1, 0};
Gauge[[2]]={WB, SU[2], left,        g2,True,  RpM, 1, 0};
Gauge[[3]]={G,  SU[3], color,       g3,False, RpM, 1, 0};


(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},    1/6, 2, 3, RpM, Z3t,   0};  
SuperFields[[2]] = {l, 3, {vL,  eL},   -1/2, 2, 1, RpM, Z3t, 1/2};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},  -1/2, 2, 1, RpP, Z3t,   0};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},   1/2, 2, 1, RpP, Z3t,   0};

SuperFields[[5]] = {d, 3, conj[dR],   1/3, 1, -3, RpM, Z3t,    0};
SuperFields[[6]] = {u, 3, conj[uR],  -2/3, 1, -3, RpM, Z3t,    0};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1, RpM, Z3t, -1/2};
SuperFields[[8]] = {v, 3, conj[vR],     0, 1,  1, RpM, Z3t, -1/2};
SuperFields[[9]] = {s, 1, sR,           0, 1,  1, RpP, Z3t,    0};
SuperFields[[10]] ={x, 3, x,            0, 1,  1, RpM, Z3t,  1/2};



(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Lambda] s.Hu.Hd \
                 + \[Kappa]/3 s.s.s  + Yv v.l.Hu + \[Lambda]N s.v.x + MUX/2 x.x;


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

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
  Fv1 -> {FvL,0},
  Fx -> {Fx,conj[Fx]},
  FVR -> {FvR,conj[FvR]},
  FS -> {FsR, conj[FsR]}
};


(* ----- After EWSB ----- *)


DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};   
      

        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SsR, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}},
   {SvL, {0, 0}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SvR, {0, 0}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {Sx, {0, 0}, {sigmaX, \[ImaginaryI]/Sqrt[2]},{phiX,1/Sqrt[2]}}
   };


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{sigmaL,sigmaR,sigmaX}, {SvIm, ZVI}},
     {{phiL,phiR,phiX}, {SvRe, ZVR}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiS}, {hh, ZH}},
     {{sigmad, sigmau, sigmaS}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0, FsR}, {L0, ZN}},
     {{FvL,conj[FvR],Fx}, {FV, UV}},  
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}      \
       }; 
       
DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 

	
	
DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  FV, conj[FV]},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};	
