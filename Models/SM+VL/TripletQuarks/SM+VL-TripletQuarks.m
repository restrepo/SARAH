Off[General::spell]

Model`Name = "VLTQ";
Model`NameLaTeX ="Singlet extended SM with coloured vector-like triplet";
Model`Authors = "A. Vicente";
Model`Date = "2016-01-15";

(* 2016-01-15: model implemented, based on 1512.06028 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

FermionFields[[6]] = {F1L, 1, {{uL4/Sqrt[2], XL}, {dL4, -uL4/Sqrt[2]}}, 2/3, 3, 3, -1};
FermionFields[[7]] = {F1R, 1, {{uR4/Sqrt[2], dR4}, {XR, -uR4/Sqrt[2]}},  -2/3, 3, -3, 1};

FermionFields[[8]] = {F2L, 1, {{dL5/Sqrt[2], uL5}, {YL, -dL5/Sqrt[2]}}, -1/3, 3, 3, -1};
FermionFields[[9]] = {F2R, 1, {{dR5/Sqrt[2], YR}, {uR5, -dR5/Sqrt[2]}},  1/3, 3, -3, 1};

ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1, 1};
ScalarFields[[2]] =  {S, 1, ss,    0, 1,  1, -1};
RealScalars = {S};

        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagYSM, {AddHC->True}},
	{LagYBSM, {AddHC->True}},
	{LagMass, {AddHC->True}},
	{Vpot, {AddHC->False}}
};

Vpot = -(-mu2 conj[H].H + Lambda1 conj[H].H.conj[H].H + (1/2) mS2 S.S + Lambda2 S.S.S.S + Lambda3 S.S.conj[H].H);
LagYSM =  -(Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q);
LagYBSM = -(y1 conj[q].conj[F1R].conj[H] + y2 conj[q].conj[F2R].H + yy1 F1L.F1R.S + yy2 F2L.F2R.S);
LagMass = -(M1 F1L.F1R + M2 F2L.F2R);

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
             	
(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}}
   };
 

DEFINITION[EWSB][MatterSector]=   
      {{{phiH,ss},{hh,ZH}},
      {{{dL,dL4,dL5}, {conj[dR],dR4,dR5}}, {{DL,Vd}, {DR,Ud}}},
      {{{uL,uL4,uL5}, {conj[uR],uR4,uR5}}, {{UL,Vu}, {UR,Uu}}},
      {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 FX ->{  XL, conj[XR]},
 FY ->{  YL, conj[YR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][Phases]={    
     {XL, PhaseX},
     {YL, PhaseY}
    };

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}
};



