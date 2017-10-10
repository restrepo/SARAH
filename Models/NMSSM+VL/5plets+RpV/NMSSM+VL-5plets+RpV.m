Off[General::spell]

Model`Name = "NMSSM5RpV";
Model`NameLaTeX ="NMSSM extended by a pair of 5 of $SU(5)$ with $R$-parity violation";
Model`Authors = "F.Staub";
Model`Date = "2016-01-14";




(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};
Global[[2]] = {Z[2], ExtraZ2};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,RpM,1};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,RpM,1};


(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL,  dL},    1/6, 2, 3, RpM,1};  
SuperFields[[2]] = {l,  3, {vL,  eL},   -1/2, 2, 1, RpM,1};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, RpP,1};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, RpP,1};

SuperFields[[5]] = {d, 3, conj[dR],  1/3, 1, -3, RpM,1};
SuperFields[[6]] = {u, 3, conj[uR], -2/3, 1, -3, RpM,1};
SuperFields[[7]] = {e, 3, conj[eR],    1, 1,  1, RpM,1};

SuperFields[[8]] = {d5, 1, conj[dR5], 1/3, 1, -3, RpM,-1};
SuperFields[[9]] = {d5p, 1, dR5p,  -1/3, 1,  3, RpM,-1};

SuperFields[[10]] = {l5,  1, {vL5,  eL5},    -1/2, 2, 1, RpM,-1};
SuperFields[[11]] = {l5p,  1, {conj[eL5p],  conj[vL5p]},    1/2, 2, 1, RpM,-1};  

SuperFields[[12]] = {s, 1, sR,     0, 1,  1, RpP,1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd + lambda s.Hu.Hd + MS s.s + kappa/3 s.s.s + tS s \
  + kap5 l5.s.Hu + kap5p l5p.s.Hd + MVD d5.d5p + MVL l5.l5p + lD5 s.d5.d5p + lL5 s.l5.l5p;


(*----------------------------------------------*)
(*   ROTATIONS                                  *)
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
   {SsR, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}},
   {SvL5, {v5, 1/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SvL5p, {v5p, 1/Sqrt[2]}, {sigmaLp, \[ImaginaryI]/Sqrt[2]},{phiLp,1/Sqrt[2]}}
   
   };


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SdR5, SdR5p}, {Sdp, ZDp}},
     {{SvL}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiS, phiL, phiLp}, {hh, ZH}},
     {{sigmad, sigmau, sigmaS, sigmaL, sigmaLp}, {Ah, ZA}},
     {{SHdm,conj[SHup],SeL5,SeL5p},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0, FsR,FvL5, conj[FvL5p]}, {L0, ZN}}, 
     {{{fWm, FHdm,FeL5}, {fWp, FHup, conj[FeL5p]}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}       
     }; 
       
DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu},
     {FdR5, PhaseD},
     {FdR5p, PhaseD}   
    }; 

	
	
DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  FvL, 0},
 Fdp -> {FdR5p, FdR5},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};	
