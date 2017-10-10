Off[General::spell]

Model`Name = "SeesawIII";
Model`NameLaTeX ="MSSM with Seesaw III";
Model`Authors = "F.Staub";
Model`Date = "2012-09-01";

(* 2013-09-01: changing to new conventions for Superfields, Superpotential and global symmetries *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};


(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True,  RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False, RpM};

(* Chiral Superfields *)

SuperFields[[1]] = {q,  3, {uL,  dL},    1/6, 2, 3, RpM};  
SuperFields[[2]] = {l,  3, {vL,  eL},   -1/2, 2, 1, RpM};
SuperFields[[3]] = {Hd, 1, {Hd0, Hdm},  -1/2, 2, 1, RpP};
SuperFields[[4]] = {Hu, 1, {Hup, Hu0},   1/2, 2, 1, RpP};

SuperFields[[5]] = {d, 3, conj[dR],  1/3, 1, -3, RpM};
SuperFields[[6]] = {u, 3, conj[uR], -2/3, 1, -3, RpM};
SuperFields[[7]] = {e, 3, conj[eR],    1, 1,  1, RpM};


SuperFields[[8]] = {Hw3,   3, {{HW0/Sqrt[2],HWp},{HWm, -HW0/Sqrt[2]}}, 0, 3, 1, RpM};
SuperFields[[9]] =  {Hg3,  3, HG,                                      0, 1, 8, RpM};
SuperFields[[10]] = {Hb3,  3, HB,                                      0, 1, 1, RpM};
SuperFields[[11]] = {Hx3,  3, {HXu,HXd},                            5/6, 2, -3, RpM};
SuperFields[[12]] = {Hxb3, 3, {HXub,HXdb},                          -5/6, 2, 3, RpM};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd -Ye e.l.Hd + \[Mu] Hu.Hd \
                 + Sqrt[6/20] Yb3 Hu.Hb3.l + Yw3 Hu.Hw3.l + Yx3 Hu.Hxb3.d \
                 + MXM3 Hx3.Hxb3 + MWM3/2 Hw3.Hw3 + MGM3/2 Hg3.Hg3+ MBM3/2 Hb3.Hb3 + WOp/2 l.Hu.l.Hu;

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={Hw3,Hg3,Hb3,Hx3,Hxb3};

NameOfStates={GaugeES,EWSB};


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
  Fv -> {FvL, 0}
};

(*----------------------------------------------*)
(*   Symmetry Breaking                          *)
(*----------------------------------------------*)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};       
        
DEFINITION[EWSB][VEVs]=
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
     {SvL,  {0,0}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{sigmaL}, {SvIm, ZVI}},
     {{phiL},   {SvRe, ZVR}},
     {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}},
     {{FvL}, {FV, UV}},  
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}                   \
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
