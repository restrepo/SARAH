Off[General::spell]

Model`Name = "bMRSSM";
Model`NameLaTeX ="minimal R-symmetric SSM with broken R-symmetry";
Model`Authors = "F.Staub";
Model`Date = "2016-01-14";



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)


Global[[1]] = {U[1],RSymmetry};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, {0,1,0}};
Gauge[[2]]={WB, SU[2], left,        g2,True,  {0,1,0}};
Gauge[[3]]={G,  SU[3], color,       g3,False, {0,1,0}};


(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL,  dL},    1/6, 2, 3, {1,1,0}};  
SuperFields[[2]] = {l,  3, {vL,  eL},   -1/2, 2, 1, {1,1,0}};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, {0,0,-1}};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, {0,0,-1}};

SuperFields[[5]] = {d, 3, conj[dR],  1/3, 1, -3, {1,1,0}};
SuperFields[[6]] = {u, 3, conj[uR], -2/3, 1, -3, {1,1,0}};
SuperFields[[7]] = {e, 3, conj[eR],    1, 1,  1, {1,1,0}};

SuperFields[[8]] =  {S,  1, s,                                   0, 1, 1, {0,0,-1}};
SuperFields[[9]] =  {T,  1, {{T0/Sqrt[2],Tp},{Tm, -T0/Sqrt[2]}}, 0, 3, 1, {0,0,-1}};
SuperFields[[10]] = {oc, 1, Oc,                                  0, 1, 8, {0,0,-1}}; 

SuperFields[[11]] = {Rd, 1, {Rdp,Rd0},    1/2, 2, 1, {2,2,1}};
SuperFields[[12]] = {Ru, 1, {Ru0,Rum},   -1/2, 2, 1, {2,2,1}};


AddDiracGauginos = True;

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + MuD Rd.Hd + MuU Ru.Hu +\[Mu] Hu.Hd  \
                 + LamSD S.Rd.Hd + LamSU S.Ru.Hu + LamTD Rd.T.Hd + LamTU Ru.T.Hu;

(* Included mu-term to get B_mu which is allowed by R-Symmetry *)


(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


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
   {SRd0, {vRd, 1/Sqrt[2]}, {sigmaRd, \[ImaginaryI]/Sqrt[2]},{phiRu,1/Sqrt[2]}},
   {SRu0, {vRu, 1/Sqrt[2]}, {sigmaRu, \[ImaginaryI]/Sqrt[2]},{phiRd,1/Sqrt[2]}},
   {SOc, {0,0}, {sigmaO, \[ImaginaryI]/Sqrt[2]},{phiO,1/Sqrt[2]}}
 };


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SvL}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiS, phiT,phiRd,phiRu}, {hh, ZH}},
     {{sigmad, sigmau, sigmaS, sigmaT,sigmaRd,sigmaRu}, {Ah, ZA}},
     {{SHdm,conj[SHup],STm,conj[STp],SRum,conj[SRdp]},{Hpm,ZP}},
     {{fB, fW0, FRd0, FRu0, Fs, FT0, FHd0,FHu0}, {L0,ZN}},
     {{{fWm, FRum, FTm, FHdm},{fWp, FRdp,FTp, FHup}}, {{Lm,UM1}, {Lp,UP1}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}},
     {{fG,FOc},{Gl,ZG}}    
     
     
       }; 
       
       
	
DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  FvL, 0},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lp, conj[Lm]},
 Glu ->{ Gl, conj[Gl]}
};	
