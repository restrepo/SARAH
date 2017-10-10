Off[General::spell]

Model`Name = "MDGSSM";
Model`NameLaTeX ="Minimal-Dirac-Gaugino-SSM with UV completion";
Model`Authors = "M.D. Goodsell, F.Staub";
Model`Date = "2013-03-27";



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True,  RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False, RpM};


(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL,  dL},    1/6, 2, 3, RpM};  
SuperFields[[2]] = {l,  3, {vL,  eL},   -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, RpP};

SuperFields[[5]] = {d,   3, conj[dR],  1/3, 1, -3, RpM};
SuperFields[[6]] = {u,   3, conj[uR], -2/3, 1, -3, RpM};
SuperFields[[7]] = {e,   3, conj[eR],    1, 1,  1, RpM};

SuperFields[[8]] = {S,   1, s, 0, 1, 1, RpP};
SuperFields[[9]] = {T,   1, {{T0/Sqrt[2],Tp},{Tm, -T0/Sqrt[2]}},  0, 3, 1, RpP};
SuperFields[[10]] = {oc, 1, Oc, 0, 1, 8, RpP}; 

SuperFields[[11]] = {ru,  1, {Ru0,Rum}, -1/2, 2, 1, RpM};
SuperFields[[12]] = {rd,  1, {Rdp,Rd0},  1/2, 2, 1, RpM};
SuperFields[[13]] = {er1, 2, conj[ER1],    1, 1, 1, RpM};
SuperFields[[14]] = {er2, 2, conj[ER2],   -1, 1, 1, RpM};


AddDiracGauginos = True;
AddMixedSofts = False;

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)


SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd + MS/2 S.S \
                + \[Lambda] S.Hd.Hu + LT Hd.T.Hu  + LS/2 S.T.T \
                + LambdaSR S.ru.rd + MuR ru.rd + LambdaTR ru.T.rd + LambdaSE S.er1.er2 \
                +  MuE er1.er2 + YE1 ru.Hd.er1 + YE2 rd.Hu.er2 + YL l.Hd.er1;

AddSoftGauginoMasses = False;
AddTterms = False;
  

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
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {ST0, {vT, 1/Sqrt[2]}, {sigmaT, \[ImaginaryI]/Sqrt[2]},{phiT,1/Sqrt[2]}},
   {Ss, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}},
  {SOc, {0,0}, {sigmaO, \[ImaginaryI]/Sqrt[2]},{phiO,1/Sqrt[2]}}
 };


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SvL, SRu0, conj[SRd0]}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR, SRum, conj[SRdp],SER1,conj[SER2]}, {Se, ZE}},
     {{phid, phiu, phiS, phiT}, {hh, ZH}},
     {{sigmad, sigmau, sigmaS, sigmaT}, {Ah, ZA}},
     {{SHdm,conj[SHup],STm,conj[STp]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0, Fs, FT0}, {L0, ZN}}, 
     {{{fWm, FHdm,FTm}, {fWp, FHup,FTp}}, {{Lm,UM}, {Lp,UP}}},
     {{FvL,FRu0, FRd0}, {RN, UV}},
     {{{FeL,FRum,conj[FER2]},{conj[FeR],FRdp,conj[FER1]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}},
     {{fG,FOc},{Gl,ZG}}      
       }; 
       
       
	
DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  RN, conj[RN]},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ Gl, conj[Gl]}
};	
