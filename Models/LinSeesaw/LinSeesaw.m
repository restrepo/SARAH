Off[General::spell]

Model`Name = "LinSeesaw";
Model`NameLaTeX ="Linear Seesaw";
Model`Authors = "M. Hirsch";
Model`Date = "2015-11-16";


(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)
(* 2015-11-16: changed SPheno.m *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)


Global[[1]]={Z[2],RParity};
Global[[2]]={U[1],NLep};  
RpM = {-1,-1,1}; RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, RpM, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True,  RpM, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, RpM, 1};


(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},    1/6, 2, 3, RpM,   0};  
SuperFields[[2]] = {l, 3, {vL,  eL},   -1/2, 2, 1, RpM, 1/2};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},  -1/2, 2, 1, RpP,   0};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},   1/2, 2, 1, RpP,   0};

SuperFields[[5]] = {d, 3, conj[dR],   1/3, 1, -3, RpM,    0};
SuperFields[[6]] = {u, 3, conj[uR],  -2/3, 1, -3, RpM,    0};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1, RpM, -1/2};
SuperFields[[8]] = {vR,3, conj[vR],     0, 1,  1, RpM, -1/2};
SuperFields[[9]] = {s, 3, sR,           0, 1,  1, RpM,  1/2};



(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd  + Yv vR.l.Hu + MR vR.s + YSL s.l.Hu;

AddMixedSofts=False;

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
  Fv -> {FvL,0}
};


(* ----- After EWSB ----- *)
(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};


(* Gauge Sector 

DEFINITION[EWSB][GaugeSectorOld]= 
{{VWB,{1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
      {2,{VWm,-I/Sqrt[2]},{conj[VWm],I/Sqrt[2]}},
      {3,{VP,Sin[ThetaW]},{VZ,Cos[ThetaW]}}},
 {VB, {1,{VP,Cos[ThetaW]},{VZ,-Sin[ThetaW]}}},
 {fWB,{1,{fWm,1/Sqrt[2]},{fWp,1/Sqrt[2]}},
      {2,{fWm,-I/Sqrt[2]},{fWp,I/Sqrt[2]}},
      {3,{fW0,1}}}};
      
 *)

        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, I/Sqrt[2]},{phid, 1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, I/Sqrt[2]},{phiu, 1/Sqrt[2]}},
   {SvL,  {0,0}, {sigmaL, I/Sqrt[2]},{phiL, 1/Sqrt[2]}},
   {SvR, {0, 0}, {sigmaR, I/Sqrt[2]},{phiR, 1/Sqrt[2]}},
   {SsR, {0, 0}, {sigmaS, I/Sqrt[2]},{phis, 1/Sqrt[2]}}

};


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{phiL,phiR,phis}, {SvsRe,Zphiv}},
     {{sigmaL,sigmaR,sigmaS},{SvsI,Zsigmav}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}},
     {{FvL,conj[FvR],FsR}, {FV, UV}},  
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
