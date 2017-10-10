Off[General::spell]

Model`Name = "MSSM";
Model`NameLaTeX ="MSSM";
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

Gauge[[1]]={B,   U[1], hypercharge, g1,False,RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False,RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL,  dL},    1/6, 2, 3, RpM};  
SuperFields[[2]] = {l,  3, {vL,  eL},   -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, RpP};

SuperFields[[5]] = {d, 3, conj[dR],  1/3, 1, -3, RpM};
SuperFields[[6]] = {u, 3, conj[uR], -2/3, 1, -3, RpM};
SuperFields[[7]] = {e, 3, conj[eR],    1, 1,  1, RpM};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd;


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
  {{VB,VWB[1],VWB[2],VWB[3]},{VP,VZ},ZZ},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};      
          	

(* ----- VEVs ---- *)


(*
DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vdR, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vuR, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SeL, {vLR[3], 1/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SeR, {vRR[3], 1/Sqrt[2]}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SHdm, {0, 1/Sqrt[2]}, {sigmaM, \[ImaginaryI]/Sqrt[2]},{phiM,1/Sqrt[2]}},
   {SHup, {vHp, 1/Sqrt[2]}, {sigmaP, \[ImaginaryI]/Sqrt[2]},{phiP,1/Sqrt[2]}},
   {SvL, {vNu[3], 1/Sqrt[2]}, {sigmaV, \[ImaginaryI]/Sqrt[2]},{phiV,1/Sqrt[2]}}
};
*)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vdR, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vuR, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SeL, {vLR[3], 1/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SeR, {vRR[3], 1/Sqrt[2]}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SHdm, {0, 1/Sqrt[2]}, {sigmaM, \[ImaginaryI]/Sqrt[2]},{phiM,1/Sqrt[2]}},
   {SHup, {0, 1/Sqrt[2]}, {sigmaP, \[ImaginaryI]/Sqrt[2]},{phiP,1/Sqrt[2]}},
   {SvL, {0, 1/Sqrt[2]}, {sigmaV, \[ImaginaryI]/Sqrt[2]},{phiV,1/Sqrt[2]}}
};



(*
DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vdR, 1/Sqrt[2]},  {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vuR, 1/Sqrt[2]},  {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SeL, {vLR[3], 1/Sqrt[2]},  {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SeR, {vRR[3], 1/Sqrt[2]},  {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SHdm, {0, 1/Sqrt[2]},  {sigmaM, \[ImaginaryI]/Sqrt[2]},{phiM,1/Sqrt[2]}},
   {SHup, {0, 1/Sqrt[2]}, {sigmaP, \[ImaginaryI]/Sqrt[2]},{phiP,1/Sqrt[2]}},
   {SvL, {vNu[1], 1/Sqrt[2]}, {sigmaV, \[ImaginaryI]/Sqrt[2]},{phiV,1/Sqrt[2]}}
};
*)


 
(* ---- Mixings ---- *)

(*
DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{phid, phiu,phiL,phiR}, {hh, ZH}},
     {{sigmad, sigmau,sigmaL,sigmaR}, {Ah, ZA}},
     {{sigmaV,sigmaM,sigmaP}, {AP, ZAP}},
     {{phiV,phiM,phiP}, {hP, ZHP}},
     {{fB, fW0, FHd0, FHu0, FeL, conj[FeR]}, {L0, ZN}}, 
     {{fWm, FHdm, fWp, FHup, FvL}, {LP, ZP}}, 
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}      \
       }; 
*)



DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{phid, phiu,phiM,phiP,phiV,phiL,phiR}, {hh, ZH}},
     {{sigmad, sigmau,sigmaM,sigmaP,sigmaV,sigmaL,sigmaR}, {Ah, ZA}},
     {{fB, fW0, FHd0, FHu0, FvL, FeL, conj[FeR],fWm, FHdm, fWp, FHup}, {L0, ZN}}, 
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}      \
       }; 
  
       
DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 

	
	
DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fu ->{  FUL, conj[FUR]},
 Chi ->{ L0, conj[L0]},
 Glu ->{ fG, conj[fG]}
};	


GenerateSPhenoCodeForModel = "MSSM"; 