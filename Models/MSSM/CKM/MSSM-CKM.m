Off[General::spell]

Model`Name = "MSSMCKM";
Model`NameLaTeX ="MSSM (CKM)";
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

SuperFields[[1]] = {q0,  3, {uL0,  dL0},    1/6, 2, 3, RpM};  
SuperFields[[2]] = {l0,  3, {vL0,  eL0},   -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, RpP};

SuperFields[[5]] = {d0, 3, conj[dR0],  1/3, 1, -3, RpM};
SuperFields[[6]] = {u0, 3, conj[uR0], -2/3, 1, -3, RpM};
SuperFields[[7]] = {e0, 3, conj[eR0],    1, 1,  1, RpM};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu0 u0.q0.Hu - Yd0 d0.q0.Hd - Ye0 e0.l0.Hd + \[Mu] Hu.Hd;




(*----------------------------------------------*)
(*   DEFINITION                                  *)
(*----------------------------------------------*)

NameOfStates={GaugeES,SCKM, EWSB};



DEFINITION[GaugeES][DiracSpinors]={
  Bino ->{fB, conj[fB]},
  Wino -> {fWB, conj[fWB]},
  Glu -> {fG, conj[fG]},
  H0 -> {FHd0, conj[FHu0]},
  HC -> {FHdm, conj[FHup]},
  Fd10 -> {FdL0, 0},
  Fd20 -> {0, FdR0},
  Fu10 -> {FuL0, 0},
  Fu20 -> {0, FuR0},
  Fe1 -> {FeL0, 0},
  Fe2 -> {0, FeR0},
  Fv -> {FvL0,0}
};



(*--- Matter Sector ---- *)

DEFINITION[SCKM][MatterSector]=   
    {{{SeL0}, {SeL, Ve}},
     {{SdL0}, {SdL, Vd}},
     {{SuL0}, {SuL, Vu}},
     {{conj[SeR0]}, {conj[SeR], Ue}},
     {{conj[SdR0]}, {conj[SdR], Ud}},
     {{conj[SuR0]}, {conj[SuR], Uu}},
     {{AdL0}, {AdL, Vd}},
     {{AuL0}, {AuL, Vu}},
     {{AeL0}, {AeL, Ve}},
     {{conj[AdR0]}, {conj[AdR], Ud}},
     {{conj[AuR0]}, {conj[AuR], Uu}},
     {{conj[AeR0]}, {conj[AeR], Ue}},
     {{SvL0}, {Sv, ZV}},
     {{{FdL0}, {conj[FdR0]}}, {{FdL,Vd}, {FdR,Ud}}},
     {{{FuL0}, {conj[FuR0]}}, {{FuL,Vu}, {FuR,Uu}}},
     {{{FeL0},{conj[FeR0]}},{{FeL,Ve},{FeR,Ue}}},
     {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}},
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}}
}; 




DEFINITION[SCKM][DiracSpinors]={
  Chi ->{ L0, conj[L0]},
  Cha ->{ Lm, conj[Lp]},
  Glu ->{ fG, conj[fG]},
  Fd -> {FdL, conj[FdR]},
  Fu -> {FuL, conj[FuR]},
  Fe -> {FeL, conj[FeR]},
  Fv -> {FvL0,0}
};



(*--- Gauge Sector ---- *)




DEFINITION[SCKM][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};
 
 
       
(*--- VEVs ---- *)
        
          	
DEFINITION[SCKM][VEVs]= 
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}}     };
 

 
(*--- Matter Sector ---- *)
 
 
DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}}
       }; 


DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FdL, conj[FdR] },
 Fe ->{  FeL, conj[FeR]},
 Fu ->{  FuL, conj[FuR] },
 Fv ->{  FvL0, 0},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};


(* Model not supported by SPheno *)
SetOptions[MakeAll, IncludeSPheno->False];

