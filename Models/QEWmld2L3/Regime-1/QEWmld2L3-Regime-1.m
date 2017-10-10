(* ::Package:: *)

Off[General::spell]

Model`Name = "QEWmld2L3";
Model`NameLaTeX ="SMxEW Quiver Gauge Model";
Model`Authors = "Aoife Bharucha, Andreas Goudelis, Moritz McGarrie";
Model`Date = "2013-25-09";

(* 2014-08-19 (F. Staub): forcing generators of SU(3) to be equivalent to Gell-Mann matrices *) 


(*****************************************)
(* Gauge structure and gauge superfields *)
(*****************************************)

(* Site B *)
Gauge[[1]]={BB,  U[1], Bhypercharge,  gB1,False};
Gauge[[2]]={BW, SU[2], Bleft,         gB2,True};

(* Site A *)
Gauge[[3]]={AB,   U[1], Ahypercharge,  gA1,False};
Gauge[[4]]={AW,  SU[2], Aleft,         gA2,True};
Gauge[[5]]={G,   SU[3], Acolor,        g3 ,False};



(**********************)
(* Chiral superfields *)
(**********************)

(* Site A *)
Fields[[1]] = {{uL,  dL},  3, q, 0, 1,  1/6, 2,  3};
Fields[[2]] = {{vL,  eL},  3, l, 0, 1, -1/2, 2,  1};
Fields[[5]] = {conj[uR] ,  3, u, 0, 1, -2/3, 1, -3};
Fields[[6]] = {conj[dR],   3, d, 0, 1,  1/3, 1, -3};
Fields[[7]] = {conj[eR],   3, e, 0, 1,  1,   1,  1};

Fields[[3]] = {{Hd0, Hdm}, 1, Hd ,0,1, -1/2, 2,  1};
Fields[[4]] = {{Hup, Hu0}, 1, Hu ,0,1,  1/2, 2,  1};
 

(* Force generators of SU(3) to be Gell-Mann matrices *)
Lambda={{{0,1,0},{1,0,0},{0,0,0}},{{0,-I,0},{I,0,0},{0,0,0}},{{1,0,0},{0,-1,0},{0,0,0}},{{0,0,1},{0,0,0},{1,0,0}},{{0,0,-I},{0,0,0},{I,0,0}},{{0,0,0},{0,0,1},{0,1,0}},{{0,0,0},{0,0,-I},{0,I,0}},1/Sqrt[3] {{1,0,0},{0,1,0},{0,0,-2}}};



(***********************)
(* Linking superfields *)
(***********************)
(* 
Name Coding:
   - L for Linking
   - t or not t for tilde/not tilde
   - A,B for site to which the charge corresponds (including non-abelian charge)
   - u,d for up-type or down-type
*)

(* SU(2), in components since SU(2) indices are expanded *)
Fields[[8]]={{{ld1, ld3},  {ld2, ld4}},  1, Ld,   1/2,-2, -1/2, 2,1};
Fields[[9]]={{{ldt1,ldt3}, {ldt2,ldt4}}, 1, Ldt, -1/2, 2,  1/2,-2,1};

 
(************************************************************)
(* Extra superfields, one singlet and one adjoint of site B *)
(* to give masses to all linking fields' components         *)
(************************************************************)
Fields[[10]]={Kd,                                     1,  Kd, 0, 1, 0, 1, 1};
Fields[[11]]={{{ad1/Sqrt[2],ad2},{ad3,-ad1/Sqrt[2]}}, 1,  Ad, 0, 3, 0, 1, 1};

 
(******************)
(* Superpotential *)
(******************)

SuperPotential = 
{ 
  {{  1,   Yu},    {u,  q,  Hu}}, 
  {{ -1,   Yd},    {d,  q,  Hd}},
  {{ -1,   Ye},    {e,  l,  Hd}},   
  {{  1,   \[Mu]}, {Hu, Hd}},
  {{1/2,   YK},    {Kd, Ld,  Ldt}},
  {{-1/2,  Tod},   {Kd}},
  {{  1,   YA},    {Ld, Ad, Ldt}}
};

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)
NoU1Mixing=True;
IntegrateOut={};
DeleteParticles={}; 


(*****************************************)
(* Eigenstate definitions                *)
(* - Gauge eigenstates with AxB unbroken *)
(* - Mass eigenstates after AxB breaking *)
(*****************************************)

NameOfStates={GaugeESAxB, AxBSB};


(************************)
(* Rotation definitions *)
(************************)

(*** Gauge sector ***)

(*
Notations : 
- V for vector boson, f for gaugino
- A, B if corresponding to site A, B
- L = Light (surviving AxB breaking), M = Massive (getting mass upon AxB breaking)
*)
DEFINITION[AxBSB][GaugeSector]=
{
(* Gauge boson mixings : due to the model structure *)
(* (linking fields' charges and vev assignment)     *)
(* only "homologous" gauge bosons mix at this stage *)

  {{VAB,    VBB},    {VBL,  VBM},  ZZB},
  {{VAW[1], VBW[1]}, {VW1L, VW1M}, ZZW},
  {{VAW[2], VBW[2]}, {VW2L, VW2M}, ZZW},
  {{VAW[3], VBW[3]}, {VW3L, VW3M}, ZZW}, 

(* Gaugino mixings *)
  {{fAB,    fBB},    {fBL,  fBM},  ZZB},
  {{fAW[1], fBW[1]}, {fW1L, fW1M}, ZZW},
  {{fAW[2], fBW[2]}, {fW2L, fW2M}, ZZW},
  {{fAW[3], fBW[3]}, {fW3L, fW3M}, ZZW}

};
 

(**********************)
(* Linking field vevs *)
(**********************)
DEFINITION[AxBSB][VEVs]=
{
  {Sld1,   {vlv, 1}, {sigmald1,  I},{phild1,  1} },
  {Sld4,   {vlv, 1}, {sigmald4,  I},{phild4,  1} },

  {Sldt1,  {vlv, 1}, {sigmaldt1, I},{phildt1,  1} },
  {Sldt4,  {vlv, 1}, {sigmaldt4, I},{phildt4,  1} }
};


(*** Rotations in matter sector ***)
DEFINITION[AxBSB][MatterSector]=
{
(* Scalar mixings *)
  {{phild1,   phildt1,   phild4,      phildt4},    {phif,   ZPH}}, 
  {{sigmald1, sigmaldt1, sigmald4,    sigmaldt4},  {sigmaf, ZSI}},
  {{Sld2,     Sldt3,     conj[Sldt2], conj[Sld3]}, {omegaf, ZOM}}, 
  {{SKd,      Sad1},                               {SaF,    ZaF}}, 
  {{Sad2,     conj[Sad3]},                         {BaF,    ZBaF}}, 

(* Fermion mixings *)
  {{Fld1, Fldt1, Fld4, Fldt4, fBL, fBM,  fW3L, fW3M, Fad1, FKd},  {Po, ZPo}}, 
  {{Fld2, Fldt2, Fld3, Fldt3, fW1L, fW1M, fW2L, fW2M, Fad2, Fad3}, {Go, ZGo}}
};


(****************************)
(* Dirac spinor definitions *)
(****************************)

DEFINITION[GaugeESAxB][DiracSpinors]=
{
  FdLD -> {FdL,  0},
  FdRD -> {0,    FdR},
  FuLD -> {FuL,  0},
  FuRD -> {0,    FuR},
  FeLD -> {FeL,  0},
  FeRD -> {0,    FeR},
  FvLD -> {FvL,  0},

  fGD  -> {fG,  conj[fG]}, (* To be removed once second SU(3) is implemented *)

  FH0D -> {FHu0, conj[FHd0]},
  FHCD -> {FHup, conj[FHdm]}

};
 
DEFINITION[AxBSB][DiracSpinors]=
{
(* Heavy stuff *)
  Pof -> {Po,  conj[Po]},
  Gof -> {Go,  conj[Go]},

  fBMD  -> {fBM, conj[fBM]}, 
  fW1MD -> {fW1M, conj[fW1M]}, 
  fW2MD -> {fW2M, conj[fW2M]}, 
  fW3MD -> {fW3M, conj[fW3M]}, 

(* Massless stuff *)
  fBLD  -> {fBL, conj[fBL]}, 
  fW1LD -> {fW1L, conj[fW1L]}, 
  fW2LD -> {fW2L, conj[fW2L]}, 
  fW3LD -> {fW3L, conj[fW3L]}, 
  fGD   -> {fG,  conj[fG]},

  FH0D  -> {FHu0, conj[FHd0]},
  FHCD  -> {FHup, conj[FHdm]},

  FdLD -> {FdL,  0},
  FdRD -> {0,    FdR},
  FuLD -> {FuL,  0},
  FuRD -> {0,    FuR},
  FeLD -> {FeL,  0},
  FeRD -> {0,    FeR},
  FvLD -> {FvL,  0}

};
 













