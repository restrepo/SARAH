Off[General::spell]
Print["Model file for the SM loaded"];


Model`Name = "BLSMIS";
Model`NameLaTeX ="B-L extended Standard Model with inverse Seesaw";
Model`Authors = "F.Staub, L.Basso, A. Hammad";
Model`Date = "2015-11-16";

(* 2014-09-11: changed B-L charges of s1, s2; added dirac spinor for s1 *)
(* 2014-11-06: Changed sign in Lagrangian *)
(* 2015-11-16: fixed particles.m *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Fields *)



Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], BminusL,     g1p, False};

(* Matter Fields *)


FermionFields[[1]] = {q, 3, {uL,  dL},     1/6, 2,  3,  1/6};  
FermionFields[[2]] = {l, 3, {vL,  eL},    -1/2, 2,  1, -1/2};
FermionFields[[3]] = {d, 3, conj[dR],      1/3, 1, -3, -1/6};
FermionFields[[4]] = {u, 3, conj[uR],     -2/3, 1, -3, -1/6};
FermionFields[[5]] = {e, 3, conj[eR],        1, 1,  1,  1/2};
FermionFields[[6]] = {vR, 3, conj[vR],       0, 1,  1,  1/2};

FermionFields[[7]] = {s1, 3, S1,              0, 1,  1,    1};
FermionFields[[8]] = {s2, 3, S2,              0, 1,  1,   -1};


ScalarFields[[1]] = {H, 1, {H0, Hm},       -1/2, 2,  1,     0};
ScalarFields[[2]] = {chi,1, X1,              0, 1,  1,    1/2};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(Mu1 conj[H].H + Mu2 conj[chi].chi + 1/2 L1 conj[H].H.conj[H].H + \
              L2 conj[chi].chi.conj[chi].chi  + 1/2 L3 conj[H].H.conj[chi].chi  );

LagHC = - (+ Yd H.d.q + Ye H.e.l - Yu conj[H].u.q + Yv conj[H].l.vR + Ys chi.vR.s2 + MUS s2.s2 + MUS1 s1.s1  );

	  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {X1, {vX, 1/Sqrt[2]}, {sigmaX, \[ImaginaryI]/Sqrt[2]},{phiX, 1/Sqrt[2]}}     };

DEFINITION[EWSB][MatterSector]= 
{    {{phiH, phiX}, {hh, ZH}},
     {{sigmaH, sigmaX}, {Ah, ZA}}, 
     {{{dL}, {conj[dR]}}, {{FDL,Vd}, {FDR,Ud}}},
     {{{uL}, {conj[uR]}}, {{FUL,Vu}, {FUR,Uu}}},
     {{{eL}, {conj[eR]}}, {{FEL,Ve}, {FER,Ue}}},  
     {{vL,conj[vR],S2},{Fvm,ZM}} ,
     {{S1},{Fs1,SS}}
};


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  Fvm, conj[Fvm]},
 Fs->{ Fs1, conj[Fs1]}
};


DEFINITION[GaugeES][DiracSpinors]={
  Fd1 -> {dL, 0},
  Fd2 -> {0, dR},
  Fu1 -> {uL, 0},
  Fu2 -> {0, uR},
  Fe1 -> {eL, 0},
  Fe2 -> {0, eR},
  Fv1 -> {vL, 0},
  Fv2 -> {0, vR}
};

