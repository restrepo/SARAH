Off[General::spell]


Model`Name = "U1VLsample";
Model`NameLaTeX ="sample of generic U(1) models using different U(1) assignments";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-11";


(* using the model introduced in 1512.06297 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], chargeX,     gX, False};


(*

SOME REMARKS:

THIS MODEL FILE IS VALID FOR SEVERAL KINDS OF U(1)' MODELS.
DEPENDING ON THE ASSIGNMENTS OF b, k AND m, IT'S:

B-L: b=0, k=-1, m=1/3
B+L: b=-1, k=1, m=1/3
B: b=-1/2, k=0, m=1/3
L: b=-1/2, k=1, m=0

THE HYPERCHARGE PARAMETER a OF THE EXOTIC QUARKS CAN BE CHOSEN AT WISH

THE GENERIC ASSIGNMENTS ARE:

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  U1Qm};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,  U1Qk};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, -U1Qm};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, -U1Qm};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1, -U1Qk};
FermionFields[[6]] = {nu, 3, conj[vR],  0,   1,  1, -U1Qk};

FermionFields[[8]] = {XL, 1, {x1L, x2L},                 a,   2,   3,   U1Qb};
FermionFields[[9]] = {XR, 1, {conj[x1R], conj[x2R]},    -a,  -2,  -3,   U1Qb};

FermionFields[[10]] = {Y1L, 1, y1L,        a+1/2,   1,  3,  -U1Qb};
FermionFields[[11]] = {Y2L, 1, y2L,        a-1/2,   1,  3,  -U1Qb};
FermionFields[[12]] = {Y1R, 1, conj[y1R], -a-1/2,   1, -3,  -U1Qb};
FermionFields[[13]] = {Y2R, 1, conj[y2R], -a+1/2,   1, -3,  -U1Qb};

ScalarFields[[1]] = {H,    1, {H0, Hm},    -1/2, 2, 1,   0};
ScalarFields[[2]] = {SI,   1, si,             0, 1, 1, -2U1Qb};

*)

(*
   here we assume a = 3/2. NOTE THAT THIS RESULTS IN A SINGLY- AND A DOUBLY-CHARGED
   EXOTIC QUARK. FOR OTHER a ASSIGNMENTS, CHANGE THE ElectricCharge ASSIGNMENT OF Fx1 and Fx2
   IN particles.m
*)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  U1Qm};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,  U1Qk};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, -U1Qm};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, -U1Qm};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1, -U1Qk};
FermionFields[[6]] = {nu, 3, conj[vR],  0,   1,  1, -U1Qk};

FermionFields[[8]] = {XL, 1, {x1L, x2L},                 3/2,   2,   3,   U1Qb};
FermionFields[[9]] = {XR, 1, {conj[x1R], conj[x2R]},    -3/2,  -2,  -3,   U1Qb};

FermionFields[[10]] = {Y1L, 1, y1L,        2,   1,  3,  -U1Qb};
FermionFields[[11]] = {Y2L, 1, y2L,        1,   1,  3,  -U1Qb};
FermionFields[[12]] = {Y1R, 1, conj[y1R], -2,   1, -3,  -U1Qb};
FermionFields[[13]] = {Y2R, 1, conj[y2R], -1,   1, -3,  -U1Qb};

ScalarFields[[1]] = {H,    1, {H0, Hm},    -1/2, 2, 1,   0};
ScalarFields[[2]] = {SI,   1, si,             0, 1, 1, -2U1Qb};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(muH2 conj[H].H + muS2 conj[SI].SI 
            - lamH conj[H].H.conj[H].H  - lamS conj[SI].SI.conj[SI].SI 
            - lamHS conj[SI].SI.conj[H].H
             );

LagHC = - (+ Yd H.d.q + Ye H.e.l + Yu conj[H].u.q + Yv conj[H].nu.l + Yx SI.nu.nu
           + YV1 conj[SI].Y1R.Y1L + YV2 conj[SI].Y2R.Y2L 
           + YV3 SI.XR.XL
           + eta1 H.XR.Y1L + eta2 conj[H].XR.Y2L
           + eta3 H.Y2R.XL + eta4 conj[H].Y1R.XL
           );


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {si, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}}
     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiS},{hh,ZH}},
     {{sigmaH,sigmaS},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     (* VL fermions *)
     {{{x1L,y1L},{conj[x1R],conj[y1R]}}, {{X1L,V1L}, {X1R,U1R}}},
     {{{x2L,y2L},{conj[x2R],conj[y2R]}}, {{X2L,V2L}, {X2R,U2R}}},
     {{vL,conj[vR]}, {VL,ZM}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fx1 ->{  X1L, conj[X1R]},
 Fx2 ->{  X2L, conj[X2R]},
 Fv ->{  VL, conj[VL]}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



