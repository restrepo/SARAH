Off[General::spell]

Model`Name = "SM_SQQ";
Model`NameLaTeX ="Standard Model extended by real singlet and two colourful scalars";
Model`Authors = "M. Goodsell";
Model`Date = "2020-02-20";

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};
Global[[1]]={Z[2],SParity};

(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2, 3,1};
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2, 1,1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3,1};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3,1};
FermionFields[[5]] = {e, 3, conj[eR],     1, 1,  1,1};

ScalarFields[[1]] =  {H,  1, {Hp, H0},    1/2, 2, 1,1};
ScalarFields[[2]] =  {s,  1, Sing,          0, 1, 1,-1};
ScalarFields[[3]] =  {qP, 1, QP,    -1/3, 1, 3,1};
ScalarFields[[4]] =  {qM, 1, QM,    -1/3, 1, 3,-1};

RealScalars = {s};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->False, AddHC->True}},
	{LagNoHC,{Overwrite->False, AddHC->False}}};





LagNoHC = -(mu2 conj[H].H + MS2/2 s.s  + MP2 qP.conj[qP] +MM2 qM.conj[qM] + \
	    LambdaS s.s.s.s + LambdaH conj[H].H.conj[H].H + LambdaHS/2  conj[H].H.s.s  + Lambda1/2 s.s.qM.conj[qM] + Lambda2/2 s.s.qP.conj[qP] + Lambda3 H.conj[H].qM.conj[qM] + Lambda4 H.conj[H].qP.conj[qP] + Lambda5 qP.conj[qP].qP.conj[qP] + Lambda6 qM.conj[qM].qM.conj[qM] + Lambda7 qP.conj[qP].qM.conj[qM]) 

LagHC = - ( Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q + Kappa1 s.qP.conj[qM] + Yq qP.q.q + LambdaC/4 qP.conj[qM].qP.conj[qM] (*+LambdaCH H.conj[H].qP.conj[qM]*));


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};




(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]=
{     {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}}};


DEFINITION[EWSB][MatterSector]=
    {{{{dL}, {conj[dR]}}, {{FDL,Vd}, {FDR,Ud}}},
     {{{uL}, {conj[uR]}}, {{FUL,Vu}, {FUR,Uu}}},
     {{{eL}, {conj[eR]}}, {{FEL,Ve}, {FER,Ue}}}};


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};
