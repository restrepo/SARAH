Off[General::spell]


Model`Name = "SDdiracDMU1BL";
Model`NameLaTeX =" U1 B-L extession of the Singlet doublet Dirac dark matter";
Model`Authors = "Andres Rivera. Base in SM by F.Staub";
Model`Date = "2019-01-22";

(* 2014-11-06: Changed sign in Lagrangian *)
(* 2015-11-16: fixed particles.m *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], BminusL,     g1p, False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2, 3,1/3};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2, 1,-1};
FermionFields[[3]] = {d, 3, conj[dR], 1/3, 1, -3,-1/3};
FermionFields[[4]] = {u, 3, conj[uR],-2/3, 1, -3,-1/3};
FermionFields[[5]] = {e, 3, conj[eR],   1, 1,  1,1};
FermionFields[[6]] = {v, 2, conj[vR],   0, 1,  1,8/5};
FermionFields[[7]] = {vr3, 1, conj[vR3], 0, 1, 1, 2/5};

FermionFields[[8]] = {nl1, 1, nL1,            0, 1,  1,   	  7/5};
FermionFields[[9]] = {nr2, 1, conj[nR2],            0, 1,  1,  	-10/5};
(*FermionFields[[10]] = {rd, 1, {vd, ed},   -1/2, 2,  1,    	 10/5};
FermionFields[[11]] = {ru, 1, {-conj[eu],conj[vu]},  1/2, 2,  1, -10/5};*)

ScalarFields[[1]] = {H, 1, {H0, Hm}, -1/2, 2,  1, 0};
ScalarFields[[2]] = {bi,   1, BiD,    0, 1, 1, 3/5};
ScalarFields[[3]] = {S1, 1, ss1,             0, 1,  1,   	 15/5};
ScalarFields[[4]] = {S2, 1, ss2,             0, 1,  1,   	 15/5};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}},
     {LagSi , {AddHC->False}},
     {Lagint , {AddHC->True}}
};

LagHC = - (+ Yd H.d.q + Ye H.e.l - Yu conj[H].u.q (*+ Yv conj[H].l.v + Yx bi.v.v *)   );

LagNoHC = -(mu2 conj[H].H - L1 conj[H].H.conj[H].H + MuP conj[bi].bi - L2 conj[bi].bi.conj[bi].bi - L3 conj[bi].bi.conj[H].H);

LagSi = -( MS2 conj[S1].S1 + MS2 conj[S2].S2 );

Lagint = -( (*YRB nl1.v.conj[S1] +*) YRC nr2.nl1.bi );


			  		  
(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {BiD,{vX, 1/Sqrt[2]}, {sigmaB, \[ImaginaryI]/Sqrt[2]},{phiB, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiB},{hh,ZH}},
     {{sigmaH,sigmaB},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{vL},{conj[vR],conj[vR3]}}, {{VL,ZM},{VR, Vvr}}},
     {{ss1,ss2}, {Ssc, VSs}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  VL, conj[VR]}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



