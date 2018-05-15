Off[General::spell]

Model`Name = "TSM";
Model`NameLaTeX ="real Triplet Extended Standard Model";
Model`Authors = "F.Staub";
Model`Date = "2016-03-01";


(* 2014-11-01: Removed CP odd component of neutral triplet *)
(* 2014-11-06: Changed sign in Lagrangian *)
(* 2015-04-20: Changed definition of triplet and added additional terms to Lagrangian *)
(* 2015-11-16: changed SPheno.m *)
(* 2016-03-01: removed LT2 term *)
(* 2018-04-02: Changed sign of quartic term; fix normalization of phiS *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},    1/6, 2,  3};  
FermionFields[[2]] = {l, 3, {vL,  eL},  -1/2, 2,  1};
FermionFields[[3]] = {d, 3, conj[dR],    1/3, 1, -3};
FermionFields[[4]] = {u, 3, conj[uR],   -2/3, 1, -3};
FermionFields[[5]] = {e, 3, conj[eR],      1, 1,  1};

ScalarFields[[1]] = {H,    1, {Hp, H0},                           1/2, 2, 1};
ScalarFields[[2]] = {trip, 1, {{T0/Sqrt[2],conj[Tm]},{Tm,-T0/Sqrt[2]}},    0, 3, 1};

RealScalars = {T0};



        


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(mu2 conj[H].H  + 1/2 MT trip.trip  + 1/2 LT  Delta[lef1b,lef2] Delta[lef2b,lef3] Delta[lef3b,lef4] Delta[lef4b,lef1] trip.trip.trip.trip \
 + KHT conj[H].trip.H + 1/2 LH conj[H].H.conj[H].H + 1/2 LHT conj[H].H.trip.trip);

LagHC = - (Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q);
			  		  
ContractionRGE[LT]=Delta[lef1,lef2] Delta[lef3, lef4];
			  		  
(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	


(* ----- VEVs ---- *)


DEFINITION[EWSB][VEVs]= 
{     {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
      {T0, {vT, 1/Sqrt[2]}, {0, 0},{phiT,1}} }; 
 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiT},{hh,ZH}},
     {{Hp,conj[Tm]},{Hpm,ZP}},
     {{{dL}, {conj[dR]}}, {{FDL,Vd}, {FDR,Ud}}},
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



