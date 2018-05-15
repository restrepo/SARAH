Off[General::spell]

Model`Name = "TwoSLQ";
Model`NameLaTeX ="Standard Model extended by two scalar lepto-quarks";
Model`Authors = "F.Staub";
Model`Date = "2016-01-26";


SetOptions[MakeAll,IncludeCalcHep->False,IncludeWHIZARD->False];

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1};

ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1};

ScalarFields[[2]] =  {Phi, 1, PhiLQ,     -4/3, 1,  3};
ScalarFields[[3]] =  {Omega, 1, OmegaLQ,     -1/3, 1,  3};
ScalarFields[[4]] =  {The, 1, theta,     1, 1, 1};
ScalarFields[[5]] =  {s, 1, Sing,     0, 1, 1};


        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}
};


LagNoHC =  -(-muH2 conj[H].H 
+ muS2 conj[s].s 
+ muP2 conj[Phi].Phi 
+ muO2 conj[Omega].Omega 
+ muT2 conj[The].The 
+ LambdaH/2 conj[H].H.conj[H].H 
+ LambdaS/2 conj[s].s.conj[s].s 
+ LambdaOS conj[Omega].Omega.conj[s].s 
+ LambdaSP conj[Phi].Phi.conj[s].s 
+ LambdaTS conj[The].The.conj[s].s 
+ LambdaHS conj[H].H.conj[s].s 
+ LambdaHO conj[H].H.conj[Omega].Omega 
+ LambdaHT conj[H].H.conj[The].The 
+ LambdaHP conj[H].H.conj[Phi].Phi 
+ LambdaOP Delta[col1,col2] Delta[col3,col4] conj[Omega].Omega.conj[Phi].Phi 
+ LambdaOT conj[Omega].Omega.conj[The].The 
+ LambdaPT conj[Phi].Phi.conj[The].The 
+ LambdaO Delta[col1,col2] Delta[col3,col4] conj[Omega].Omega.conj[Omega].Omega 
+ LambdaT conj[The].The.conj[The].The 
+ LambdaP Delta[col1,col2] Delta[col3,col4] conj[Phi].Phi.conj[Phi].Phi);
    
LagHC =  -(Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q 
+ YT l.l.The 
+ YO q.l.conj[Omega] 
+ YP e.d.Phi 
+ Sqrt[2] LambdaHat s.The.Phi.conj[Omega] );

(* e.Omega.u would be allowed, but might lead to proton decay *)


			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {v, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {Sing, {vS, 1/Sqrt[2]},  {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}}};
 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiS},{hh,ZH}},
     {{sigmaH,sigmaS},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}
 };

DEFINITION[GaugeES][DiracSpinors]={
 Fd1 ->{  dL, 0},
 Fd2 ->{  0, dR},
 Fu1 ->{  uL, 0},
 Fu2 ->{  0, uR},
 Fe1 ->{  eL, 0},
 Fe2 ->{  0, eR},
 Fv1 ->{  vL, 0}
 };



