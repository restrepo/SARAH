Off[General::spell]

Model`Name = "SM8C";
Model`NameLaTeX ="Standard Model with color octet";
Model`Authors = "F.Staub";
Model`Date = "2015-11-16";

(* 2014-11-06: Changed sign in Lagrangian *)
(* 2015-11-16: changed SPheno.m *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2, 3};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2, 1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3};
FermionFields[[5]] = {e, 3, conj[eR],     1, 1,  1};

ScalarFields[[1]] =  {H,  1, {Hp, H0},    1/2, 2, 1};
ScalarFields[[2]] =  {s,  1, Sing,          0, 1, 1};
ScalarFields[[3]] =  {oc, 1, Oc,            0, 1, 8};

RealScalars = {s};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, { AddHC->True}},
	{LagNoHC,{AddHC->False}}
};

LagNoHC = -(mu2 conj[H].H + 1/2 MS s.s - 1/4 LS s.s.s.s - LHc conj[H].H.conj[oc].oc - 1/2 L conj[H].H.conj[H].H \
    - 1/2 LHs conj[H].H.s.s - 1/2 LCs conj[oc].oc.s.s - eS s.s.s - eC conj[oc].oc.s - eH conj[H].H.s);

LagHC = - ( Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q);
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{     {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
      {Sing, {vS, 1}, {0, 0},{phiS, 1}}    };
 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiS},{hh,ZH}},
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


(* Model not supported by CalcHep *)
SetOptions[MakeAll, IncludeCalcHep->False];

