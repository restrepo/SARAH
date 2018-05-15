Off[General::spell]


Model`Name = "StSM";
Model`NameLaTeX ="Stueckelberg Extension of the Standard Model";
Model`Authors = "A. Aboubrahim";
Model`Date = "2017-09-22";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], extra,       gp,False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2, 3, 0};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2, 1, 0};
FermionFields[[3]] = {d, 3, conj[dR],  1/3, 1, -3, 0};
FermionFields[[4]] = {u, 3, conj[uR], -2/3, 1, -3, 0};
FermionFields[[5]] = {e, 3, conj[eR],   1, 1,  1, 0};

ScalarFields[[1]] = {H, 1, {H0, Hm}, -1/2, 2, 1, 0};
ScalarFields[[2]] = {S, 1, s, 0, 1, 1, 0};

RealScalars = {S};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][Additional]= {
        {LagNoHC,{AddHC->False}},
        {LagHC, {AddHC->True}}        
};

LagNoHC = mu2 conj[H].H - 1/2 \[Lambda] conj[H].H.conj[H].H + 1/2 (M2a2 VB.VB + M1a2 VBp.VBp); 

LagHC = -(Yd H.d.q + Ye H.e.l + Yu conj[H].u.q) + 1/2 (M1a M2a VBp.conj[VB]) - 1/2 (M2a Delta[lor1,lor2] Der[S,lor1].VB + M1a Delta[lor1,lor2] Der[S,lor1].VBp);(* FS: I/2 replaced by 1/2 !! *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {v, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}}};

DEFINITION[EWSB][MatterSector]=   
    { 
     {{sigmaH,s},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
  Fd1 -> {FdL, 0},
  Fd2 -> {0, FdR},
  Fu1 -> {Fu1, 0},
  Fu2 -> {0, Fu2},
  Fe1 -> {Fe1, 0},
  Fe2 -> {0, Fe2}
};

