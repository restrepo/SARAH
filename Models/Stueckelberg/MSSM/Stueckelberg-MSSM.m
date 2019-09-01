(* ::Package:: *)

Off[General::spell]

Model`Name = "StMSSM";
Model`NameLaTeX ="Supersymmetric Stueckelberg Extension";
Model`Authors = "F.Staub";
Model`Date = "2017-09-05";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False,RpM};
Gauge[[4]]={Bp,  U[1], extra,       gp,False,RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL,  dL},    1/6, 2, 3, 0, RpM};  
SuperFields[[2]] = {l,  3, {vL,  eL},   -1/2, 2, 1, 0, RpM};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, 0, RpP};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, 0, RpP};

SuperFields[[5]] = {d, 3, conj[dR],  1/3, 1, -3, 0, RpM};
SuperFields[[6]] = {u, 3, conj[uR], -2/3, 1, -3, 0, RpM};
SuperFields[[7]] = {e, 3, conj[eR],    1, 1,  1, 0, RpM};

SuperFields[[8]] =  {S,  1, s, 0, 1, 1, 0, RpP};


AddDiracGauginos = True;
StueckelbergDTerms = True;
NoU1Mixing = True;

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd;
                
DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->False, AddHC->True}},
	{LagNoHC, {Overwrite->False, AddHC->False}}	
};
                
                
LagHC = -I/2 (M2a Delta[lor1,lor2] Der[Ss,lor1].VB + M1a Delta[lor1,lor2] Der[Ss,lor1].VBp) + 1/2(M1a M2a VBp.conj[VB]);                
LagNoHC = 1/2(M2a2 VB.VB + M1a2 VBp.VBp); 


(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


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
  Fv -> {FvL, 0},
  FS -> {Fs, conj[Fs]},
  FB -> {fBp, conj[fBp]}
};

(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};      
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, I/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, I/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {Ss, {vS, 1/Sqrt[2]}, {sigmaS, I/Sqrt[2]},{phiS,1/Sqrt[2]}} 
 };


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SvL}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiS}, {hh, ZH}},
     {{sigmad, sigmau, sigmaS}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{Fs, fBp, fB, fW0, FHd0, FHu0}, {L0, ZN}}, 
     {{{fWm,FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
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
