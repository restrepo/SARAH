Off[General::spell]

Model`Name = "ScalarLeptoquarks";
Model`NameLaTeX ="Scalar Leptoquarks";
Model`Authors = "T.Opferkuch";
Model`Date = "2016-12-01";

SetOptions[MakeAll,IncludeCalcHep->False,IncludeWHIZARD->False];

(* Implementing the model based on 1511.01900 and 1512.06828 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)


(* Global symmetries *)

Global[[1]]={Z[2], DMParity};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1};


(* SM Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

ScalarFields[[1]] =  {H, 1, {Hp, H0},     1/2, 2,  1, 1};

(* New Fields *)

(* Scalar Leptoquark *)
ScalarFields[[2]] = {Phi, 1, Phi0, -1/3, 1, 3, 1};

(* Singlet responsible for the resonance *)
ScalarFields[[3]] = {S, 1, S0, 0, 1, 1, 1};

(* Here we choose the parameters for the benchmark point *)
(* N_\Chi = 2, Q_{\Chi^+} = +1 *)
FermionFields[[6]] = {Chi, 2, {{Chi0/Sqrt[2], Chip},
                                 {Chim, - Chi0/Sqrt[2]}}, 0,  3,  1, -1};
			 
RealScalars = {S};    
  
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------	-----*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagSMYuk, {AddHC->True}},
	{LagSMHiggs, {AddHC->False}},
	{LagLQNoHC, {AddHC->False}},
    {LagLQ, {AddHC->True}} 
};

LagSMHiggs = mu2 conj[H].H - 1/2 \[Lambda] conj[H].H.conj[H].H ;

LagSMYuk =  -(Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q );

LagLQNoHC = -(MPhi2 conj[Phi].Phi + 1/2 MS2 S.S
			+ gSH S.S.conj[H].H + gHP conj[H].H.conj[Phi].Phi + gSP S.S.conj[Phi].Phi 
			+ 1/3 LS3 S.S.S + 1/4 LS4 S.S.S.S
                        + 1/2 LPhi Delta[col1,col2] Delta[col3,col4] conj[Phi].Phi.conj[Phi].Phi
			+ KSP S.conj[Phi].Phi + KSH S.conj[H].H );

LagLQ = -(lamL q.l.conj[Phi] + lamR conj[u].conj[e].conj[Phi] + 1/2 MChi Chi.Chi + gSC S.Chi.Chi ); 

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {v,  1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]}, {phiH, 1/Sqrt[2]}},
     {S0, {vS, 1}, {0,0}, {phiS, 1}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiS,phiH},{hh,ZH}},
	 {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
	 {{{Chip}, {Chim}}, {{ChiL,VChi}, {ChiR,UChi}}},
      {{Chi0},{L0,ZC0}}	 
	 };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd    ->{  DL, conj[DR]},
 Fe    ->{  EL, conj[ER]},
 Fu    ->{  UL, conj[UR]},
 Fv    ->{  vL, 0},
 FChip ->{  ChiL, conj[ChiR]},
 FChi0 ->{  L0, conj[L0]}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  FuL, 0},
 Fu2 ->{  0, FuR},
 Fe1 ->{  FeL, 0},
 Fe2 ->{  0, FeR},
 FChip1 -> {FChip,0},
 FChip2 -> {0,FChim},
 FChi01 -> {FChi0,0},
 FChi02 -> {0, conj[FChi0]}};



