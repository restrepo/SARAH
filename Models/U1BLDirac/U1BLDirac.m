Off[General::spell]


Model`Name = "U1BLDirac";
Model`NameLaTeX ="U1BL Model Dirac neutrinos";
Model`Authors = "Based in F.Staub implementation";
Model`Date = "2019-01-16";

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

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  1/3};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,   -1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, -1/3};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, -1/3};
FermionFields[[5]] = {e, 3, conj[eR],     1, 1,  1,    1};
FermionFields[[6]] = {v, 2, conj[vR],     0, 1,  1,    4};
FermionFields[[7]] = {v3, 1, conj[vR3],   0, 1,  1,   -5};


ScalarFields[[1]] = {H,  1, {Hp, H0},   1/2, 2,  1,  0};
ScalarFields[[2]] = {S,  1, s,            0, 1,  1,  3};
ScalarFields[[4]] = {S1, 1, s1,          -1, 1,  1, -2};
ScalarFields[[5]] = {S2, 1, s2,          -1, 1,  1, -5};



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagH,{ AddHC->False}},
	{LagS,{ AddHC->False}},
	{LagS1,{ AddHC->False}},	
	{LagS2,{ AddHC->False}},
	{LagS12,{ AddHC->True}},
	{LagS21,{ AddHC->False}},
	{LagH12,{ AddHC->False}},
	{LagSS12,{ AddHC->False}},	
	{LagHS,{ AddHC->False}}
};

LagH = -muh conj[H].H + Lh conj[H].H.conj[H].H;
LagS = -MuP conj[S].S + Ls conj[S].S.conj[S].S;
LagS1 = -mu1 conj[S1].S1 + L1 conj[S1].S1.conj[S1].S1;
LagS2 = -mu2 conj[S2].S2 + L2 conj[S2].S2.conj[S2].S2;
LagS12 = -mu3 conj[S1].S2.S;
LagS21 = L4 conj[S1].S1.conj[S2].S2;
LagH12 = L5 conj[H].H.conj[S1].S1 + L6 conj[H].H.conj[S2].S2;
LagSS12 = L7 conj[S].S.conj[S1].S1 + L8 conj[S].S.conj[S2].S2;
LagHS = L3 conj[S].S.conj[H].H;

LagHC = - (+ Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q + fl conj[S1].l.l + hl S2.e.v );


			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {s,{vX, 1/Sqrt[2]}, {sigmaB, \[ImaginaryI]/Sqrt[2]},{phiB, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiB},{hh,ZH}},
     {{sigmaH,sigmaB},{Ah,ZA}},
     {{conj[Hp],s1,s2},{Hm,ZP}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{vL},{conj[vR],conj[vR3]}}, {{VL,ZVL},{VR,ZVR}}}

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



