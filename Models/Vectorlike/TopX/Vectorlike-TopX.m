Off[General::spell]

Model`Name = "VLTopX";
Model`NameLaTeX ="Standard Model with vector-like Top and X";
Model`Authors = "F.Staub";
Model`Date = "2015-10-03";




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

FermionFields[[6]] = {q1, 1, {X1, tL1},     7/6, 2,  3};
FermionFields[[7]] = {q2, 1, {-tL2, X2},    -7/6, 2, -3};

ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1};


        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}
};


LagNoHC = mu2 conj[H].H - 1/2 \[Lambda] conj[H].H.conj[H].H;
LagHC =  -(Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q  + Yt conj[H].u.q1 + mQ q1.q2 );



			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {{{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL, tL1}, {conj[uR], tL2}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}};  

DEFINITION[EWSB][Phases]=
{    {X1, phaseX},
     {X2, phaseX}
    };
     
     

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fx -> {X1,conj[X2] },
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};

(* No SPheno.m written so far *)
(* Should be simple in principle; it you need it, please contact the author *)
SetOptions[MakeAll, IncludeSPheno->False];


