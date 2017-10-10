(* ::Package:: *)

Off[General::spell]

(*A model to represent a QUIVER*)
Model`Name = "QEW12";
Model`NameLaTeX ="SMxEW Quiver Gauge Model";
Model`Authors = "Aoife Bharucha, Andreas Goudelis, Moritz McGarrie";
Model`Date = "2012-18-11";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1 ,False};
Gauge[[2]]={WB, SU[2], left,        g2 ,True};
Gauge[[3]]={G,  SU[3], color,       g3 ,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, q,   1/6, 2, 3};  
Fields[[2]] = {{vL,  eL},  3, l,  -1/2, 2, 1};
Fields[[3]] = {{Hd0, Hdm}, 1, Hd, -1/2, 2, 1};
Fields[[4]] = {{Hup, Hu0}, 1, Hu,  1/2, 2, 1};

Fields[[5]] = {conj[dR], 3, d,  1/3, 1, -3};
Fields[[6]] = {conj[uR], 3, u, -2/3, 1, -3};
Fields[[7]] = {conj[eR], 3, e,    1, 1,  1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

         
SuperPotential = { {{1, Yu},{u,q,Hu}}, {{-1,Yd},{d,q,Hd}},
                   {{-1,Ye},{e,l,Hd}}, {{1,\[Mu]},{Hu,Hd}}};
  

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(*-------------------------------------------*)
(* Additional (D-)terms in scalar potential  *)
(* after integrating out the linking fields  *)
(*-------------------------------------------*)

DEFINITION[GaugeES][Additional]= { {LagNoHC, { Overwrite-> False, AddHC->False} }};

LagNoHC=-(
+1/8 pz1 conj[SHd0].SHd0.SHd0.conj[SHd0]
+1/4 pz1 conj[SHd0].SHd0.SHdm.conj[SHdm]
-1/4 pz1 conj[SHd0].SHd0.SHu0.conj[SHu0]
-1/4 pz1 conj[SHd0].SHd0.SHup.conj[SHup]
+1/8 pz1 conj[SHdm].SHdm.SHdm.conj[SHdm]
-1/4 pz1 conj[SHu0].SHu0.SHdm.conj[SHdm]
-1/4 pz1 conj[SHdm].SHdm.SHup.conj[SHup]
+1/8 pz1 conj[SHu0].SHu0.SHu0.conj[SHu0]
+1/4 pz1 conj[SHu0].SHu0.SHup.conj[SHup]
+1/8 pz1 conj[SHup].SHup.SHup.conj[SHup]
+1/8 pz2 conj[SHd0].SHd0.SHd0.conj[SHd0]
+1/4 pz2 conj[SHd0].SHd0.SHdm.conj[SHdm]
-1/4 pz2 conj[SHd0].SHd0.SHu0.conj[SHu0]
+1/4 pz2 conj[SHd0].SHd0.SHup.conj[SHup]
+1/2 pz2 conj[SHdm].SHd0.SHu0.conj[SHup]
+1/2 pz2 conj[SHd0].SHdm.SHup.conj[SHu0]
+1/8 pz2 conj[SHdm].SHdm.SHdm.conj[SHdm]
+1/4 pz2 conj[SHu0].SHu0.SHdm.conj[SHdm]
-1/4 pz2 conj[SHdm].SHdm.SHup.conj[SHup]
+1/8 pz2 conj[SHu0].SHu0.SHu0.conj[SHu0]
+1/4 pz2 conj[SHu0].SHu0.SHup.conj[SHup]
+1/8 pz2 conj[SHup].SHup.SHup.conj[SHup]) ;



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
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, I/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, I/Sqrt[2]},{phiu,1/Sqrt[2]}}};


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL,    SdR},        {Sd, ZD}},
     {{SuL,    SuR},        {Su, ZU}},
     {{SeL,    SeR},        {Se, ZE}},
     {{phid,   phiu},       {hh, ZH}},
     {{sigmad, sigmau},     {Ah, ZA}},
     {{SHdm,   conj[SHup]}, {Hpm,ZP}},
     {{SvL},                {Sv, ZV}},

     {{fB, fW0,FHd0, FHu0},                 {L0, ZN}}, 
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
