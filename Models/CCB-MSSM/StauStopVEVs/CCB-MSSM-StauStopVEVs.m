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
Gauge[[3]]={G,  SU[3], color,       g3,True,RpM};



(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {{uLr,uLg,uLb},  {dLr,dLg,dLb}},   1/6, 2, 3, RpM};  
SuperFields[[2]] = {l, 3, {vL,  eL},    -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},  -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},   1/2, 2, 1, RpP};

SuperFields[[5]] = {d, 3, {conj[dRr],conj[dRg],conj[dRb]},   1/3, 1, -3, RpM};
SuperFields[[6]] = {u, 3, {conj[uRr],conj[uRg],conj[uRb]},  -2/3, 1, -3, RpM};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1, RpM};


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
  {{VB,VWB[1],VWB[2],VWB[3],VG[1],VG[2],VG[3],VG[4],VG[5],VG[6],VG[7],VG[8]},{VP1,VP2,VP3,VP4,VP5,VP6,VP7,VP8,VP9,VP10,VP11,VP12},ZZ}
};      
   	

(* ----- VEVs ---- *)

(* complex VEVs *)
(*
DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vdR, 1/Sqrt[2]},{vdI, \[ImaginaryI]/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vuR, 1/Sqrt[2]}, {vuI, \[ImaginaryI]/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SeL, {vLR[3], 1/Sqrt[2]}, {vLI[1], \[ImaginaryI]/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SeR, {vRR[3], 1/Sqrt[2]}, {vRI[1], \[ImaginaryI]/Sqrt[2]}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SHdm, {0, 1/Sqrt[2]}, {sigmaM, \[ImaginaryI]/Sqrt[2]},{phiM,1/Sqrt[2]}},
   {SHup, {0, 1/Sqrt[2]}, {sigmaP, \[ImaginaryI]/Sqrt[2]},{phiP,1/Sqrt[2]}},
   {SvL, {0, 1/Sqrt[2]}, {sigmaV, \[ImaginaryI]/Sqrt[2]},{phiV,1/Sqrt[2]}},
   {SuLr, {vuLr[3], 1/Sqrt[2]}, {sigmauLr, \[ImaginaryI]/Sqrt[2]},{phiuLr,1/Sqrt[2]}},
   {SuRr, {vuRr[3], 1/Sqrt[2]}, {sigmauRr, \[ImaginaryI]/Sqrt[2]},{phiuRr,1/Sqrt[2]}},
   {SuLg, {0, 1/Sqrt[2]}, {sigmauLg, \[ImaginaryI]/Sqrt[2]},{phiuLg,1/Sqrt[2]}},
   {SuRg, {0, 1/Sqrt[2]}, {sigmauRg, \[ImaginaryI]/Sqrt[2]},{phiuRg,1/Sqrt[2]}},
   {SuLb, {0, 1/Sqrt[2]}, {sigmauLb, \[ImaginaryI]/Sqrt[2]},{phiuLb,1/Sqrt[2]}},
   {SuRb, {0, 1/Sqrt[2]}, {sigmauRb, \[ImaginaryI]/Sqrt[2]},{phiuRb,1/Sqrt[2]}},
   {SdLr, {0, 1/Sqrt[2]}, {sigmadLr, \[ImaginaryI]/Sqrt[2]},{phidLr,1/Sqrt[2]}},
   {SdRr, {0, 1/Sqrt[2]}, {sigmadRr, \[ImaginaryI]/Sqrt[2]},{phidRr,1/Sqrt[2]}},
   {SdLg, {0, 1/Sqrt[2]}, {sigmadLg, \[ImaginaryI]/Sqrt[2]},{phidLg,1/Sqrt[2]}},
   {SdRg, {0, 1/Sqrt[2]}, {sigmadRg, \[ImaginaryI]/Sqrt[2]},{phidRg,1/Sqrt[2]}},
   {SdLb, {0, 1/Sqrt[2]}, {sigmadLb, \[ImaginaryI]/Sqrt[2]},{phidLb,1/Sqrt[2]}},
   {SdRb, {0, 1/Sqrt[2]}, {sigmadRb, \[ImaginaryI]/Sqrt[2]},{phidRb,1/Sqrt[2]}}};
*)


DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vdR, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vuR, 1/Sqrt[2]},  {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SeL, {vLR[3], 1/Sqrt[2]},  {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SeR, {vRR[3], 1/Sqrt[2]},  {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SHdm, {0, 1/Sqrt[2]}, {sigmaM, \[ImaginaryI]/Sqrt[2]},{phiM,1/Sqrt[2]}},
   {SHup, {0, 1/Sqrt[2]}, {sigmaP, \[ImaginaryI]/Sqrt[2]},{phiP,1/Sqrt[2]}},
   {SvL, {0, 1/Sqrt[2]}, {sigmaV, \[ImaginaryI]/Sqrt[2]},{phiV,1/Sqrt[2]}},
   {SuLr, {vuLr[3], 1/Sqrt[2]}, {sigmauLr, \[ImaginaryI]/Sqrt[2]},{phiuLr,1/Sqrt[2]}},
   {SuRr, {vuRr[3], 1/Sqrt[2]}, {sigmauRr, \[ImaginaryI]/Sqrt[2]},{phiuRr,1/Sqrt[2]}},
   {SuLg, {0, 1/Sqrt[2]}, {sigmauLg, \[ImaginaryI]/Sqrt[2]},{phiuLg,1/Sqrt[2]}},
   {SuRg, {0, 1/Sqrt[2]}, {sigmauRg, \[ImaginaryI]/Sqrt[2]},{phiuRg,1/Sqrt[2]}},
   {SuLb, {0, 1/Sqrt[2]}, {sigmauLb, \[ImaginaryI]/Sqrt[2]},{phiuLb,1/Sqrt[2]}},
   {SuRb, {0, 1/Sqrt[2]}, {sigmauRb, \[ImaginaryI]/Sqrt[2]},{phiuRb,1/Sqrt[2]}},
   {SdLr, {0, 1/Sqrt[2]}, {sigmadLr, \[ImaginaryI]/Sqrt[2]},{phidLr,1/Sqrt[2]}},
   {SdRr, {0, 1/Sqrt[2]}, {sigmadRr, \[ImaginaryI]/Sqrt[2]},{phidRr,1/Sqrt[2]}},
   {SdLg, {0, 1/Sqrt[2]}, {sigmadLg, \[ImaginaryI]/Sqrt[2]},{phidLg,1/Sqrt[2]}},
   {SdRg, {0, 1/Sqrt[2]}, {sigmadRg, \[ImaginaryI]/Sqrt[2]},{phidRg,1/Sqrt[2]}},
   {SdLb, {0, 1/Sqrt[2]}, {sigmadLb, \[ImaginaryI]/Sqrt[2]},{phidLb,1/Sqrt[2]}},
   {SdRb, {0, 1/Sqrt[2]}, {sigmadRb, \[ImaginaryI]/Sqrt[2]},{phidRb,1/Sqrt[2]}}};


IgnoreGaugeFixing = True;

 
(* ---- Mixings ---- *)


DEFINITION[EWSB][MatterSector]= 
{    {{phid, phiu,phiL,phiR,phiV,phiP,phiM,phiuLr,phiuLg,phiuLb,phiuRr,phiuRg,phiuRb,phidLr,phidLg,phidLb,phidRr,phidRg,phidRb}, {hh, ZH}},
     {{sigmad, sigmau,sigmaL,sigmaR,sigmaV,sigmaP,sigmaM,sigmauLr,sigmauLg,sigmauLb,sigmauRr,sigmauRg,sigmauRb,sigmadLr,sigmadLg,sigmadLb,sigmadRr,sigmadRg,sigmadRb}, {Ah, ZA}}, 
     {{fB, fWB, FHd0, FHu0, FHdm, FHup, FvL, FeL, conj[FeR],fG,conj[FdRr],conj[FdRg],conj[FdRb],FdLr,FdLg,FdLb,conj[FuRr],conj[FuRg],conj[FuRb],FuLr,FuLg,FuLb}, {L0, ZN}}
       }; 





	
	
DEFINITION[EWSB][DiracSpinors]={
 Chi ->{ L0, conj[L0]}
};	
