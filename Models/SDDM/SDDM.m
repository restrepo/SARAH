Off[General::spell]

Model`Name = "SDDM";
Model`NameLaTeX ="Singlet doublet Dark Matter";
Model`Authors = "F. Staub";
Model`Date = "2015-11-16";

(* 2015-11-16: changed SPheno.m *)


(* ############### *)
(* Command to get micrOmegas file with two DM candidates: *)
(* MakeCHep[DMcandidate1 -> Z4 == -1, DMcandidate2 -> Z4 == I]; *)
(* ############### *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[4], Z4};


(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3,1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1,1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3,1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3,1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1,1};

ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1,1};
ScalarFields[[2]] =  {S, 1, ss,     0, 1,  1, Exp[2*Pi*I/4]};
ScalarFields[[3]] =  {H2, 1, {HIp, HI0},     1/2, 2,  1, Exp[2*2*Pi*I/4]};




        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}
};


LagNoHC = -(mu12 conj[H].H + Lambda1/2 conj[H].H.conj[H].H + mu22 conj[H2].H2 + Lambda2/2 conj[H2].H2.conj[H2].H2 + muS/2 S.S + LamS4c S.conj[S].S.conj[S]\
+ LamS1 S.conj[S].conj[H].H + LamS2 S.conj[S].conj[H2].H2 + Lambda3 conj[H].H.conj[H2].H2 + Lambda4 conj[H].H2.conj[H2].H  );
LagHC =  Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q+ LamS4/2 S.S.S.S+Lambda5/2 conj[H].H2.conj[H].H2+ LamS12/2 S.S.conj[H].H2 + LamS21/2 S.S.conj[H2].H;



			  		  

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
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



