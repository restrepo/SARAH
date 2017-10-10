Off[General::spell]

Model`Name = "331v2";
Model`NameLaTeX ="3-3-1 Model with exotic electric charges";
Model`Authors = "A. Vicente";
Model`Date = "2016-01-20";

(* 2016-01-20 : model implemented, based on 1512.08441 *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,  U[1],  xcharge,     g1,False, 0, 1};
Gauge[[2]]={WB, SU[3], left,        g2,True,  0, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 0, 1};


(* Chiral Superfields *)

FermionFields[[1]] = {q1, 1, {DL, dL, uL},   2/3, 3, 3};
FermionFields[[2]] = {q2, 1, {SL, sL, cL},   2/3, 3, 3};
FermionFields[[3]] = {q3, 1, {TL, -tL, bL}, -1/3, -3, 3};
FermionFields[[4]] = {u, 3, conj[uR],   -2/3, 1, -3};
FermionFields[[5]] = {T, 1, conj[TR],    4/3, 1, -3};
FermionFields[[6]] = {d, 3, conj[dR],  1/3, 1, -3};
FermionFields[[7]] = {dt, 2, conj[dtR], -5/3, 1, -3};

FermionFields[[8]] = {l, 3, {RL, -vL, eL},  -1, -3, 1};
FermionFields[[9]] = {e, 3, conj[eR],     1, 1,  1};
FermionFields[[10]] = {R, 3, conj[RR],     2, 1,  1};

ScalarFields[[1]] =  {rho,  1, {rhopp, rho0, rhop},  1, 3, 1};
ScalarFields[[2]] =  {eta,  1, {eta2p, eta1m, eta0},  0, 3, 1};
ScalarFields[[3]] =  {chi,  1, {chi0, chimm, chim}, -1, 3, 1};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->True, AddHC->True}},
	{LagNoHC,{Overwrite->True, AddHC->False}}
};

Laglep = yl conj[l].conj[e].conj[eta] + yE conj[l].conj[R].conj[chi];
Lagquark1 = yd1 conj[q1].conj[d].rho + yd2 conj[q2].conj[d].rho + yd3 conj[q3].conj[d].conj[eta];
Lagquark2 = yu1 conj[q1].conj[u].eta + yu2 conj[q2].conj[u].eta + yu3 conj[q3].conj[u].conj[rho];
Lagquark3 = yJ1 conj[q1].conj[dt].chi + yJ2 conj[q2].conj[dt].chi + yJ3 conj[q3].conj[T].conj[chi];

Vpot1a = mu12 conj[rho].rho + mu22 conj[eta].eta + mu32 conj[chi].chi;
Vpot1b = l1 conj[rho].rho.conj[rho].rho + l2 conj[eta].eta.conj[eta].eta + l3 conj[chi].chi.conj[chi].chi;
Vpot2 = l12 conj[rho].rho.conj[eta].eta + l13 conj[rho].rho.conj[chi].chi + l23 conj[eta].eta.conj[chi].chi;
Vpot3 = l12t conj[rho].eta.conj[eta].rho + l13t conj[rho].chi.conj[chi].rho + l23t conj[eta].chi.conj[chi].eta;
Vpot4 = Sqrt[2] ftri rho.eta.chi;

LagNoHC = - Vpot1a - Vpot1b - Vpot2 - Vpot3;
LagHC = Laglep + Lagquark1 + Lagquark2 + Lagquark3 - Vpot4;


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{
  {{VB,VWB[7],VWB[8]},{VP,VZ,VZp},ZZ},
  {{VWB[2],VWB[5],VWB[6],VWB[3]},{VWp,conj[VWp],VXp,conj[VXp]},ZW},
  {{VWB[1],VWB[4]},{VYpp,conj[VYpp]},ZX}
};

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]=
{
{rho0,  {v1, 1/Sqrt[2]}, {sigma1, \[ImaginaryI]/Sqrt[2]}, {rho1, 1/Sqrt[2]}},
{eta0,  {v2, 1/Sqrt[2]}, {sigma2, \[ImaginaryI]/Sqrt[2]}, {rho2, 1/Sqrt[2]}},
{chi0,  {v3, 1/Sqrt[2]}, {sigma3, \[ImaginaryI]/Sqrt[2]}, {rho3, 1/Sqrt[2]}}
    };

DEFINITION[EWSB][MatterSector]=
  {
    {{rho1,rho2,rho3},{hh,ZH}},
    {{sigma1,sigma2,sigma3},{Ah,ZA}},
    {{conj[rhop],eta1m,conj[eta2p],chim},{Hpm,ZP}},
    {{conj[rhopp],chimm},{Dpm,ZY}},
    {{{dL, sL, bL}, {conj[dR]}}, {{FDL,Vd}, {FDR,Ud}}},
    {{{DL, SL}, {conj[dtR]}}, {{DDL,VD}, {DDR,UD}}},
    {{{uL, cL, tL}, {conj[uR]}}, {{FUL,Vu}, {FUR,Uu}}},
    {{{eL}, {conj[eR]}}, {{FEL,Ve}, {FER,Ue}}},
    {{{RL}, {conj[RR]}}, {{EEL,VE}, {EER,UE}}}
  };

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 FDD ->{  DDL, conj[DDR]},
 Fe ->{  FEL, conj[FER]},
 FEE ->{  EEL, conj[EER]},
 Fu ->{  FUL, conj[FUR]},
 FUU ->{  TL,  TR},
 Fv ->{  vL,  0}};

DEFINITION[EWSB][Phases]={
     {TL, PhaseT}
    };

DEFINITION[GaugeES][DiracSpinors]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  FuL, 0},
 Fu2 ->{  0, FuR},
 Fe1 ->{  FeL, 0},
 Fe2 ->{  0, FeR}};



