(* ::Package:: *)

Off[General::spell]

Model`Name = "U1leptophobic";
Model`NameLaTeX ="U1leptophobic";
Model`Authors = "L. Ubaldi";
Model`Date = "2016-22-01";

(* Implementing the model based on 1601.00586 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)


(* Global symmetries *)

Global[[1]]={Z[2], Z2ex};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1};
Gauge[[4]]={Bp,   U[1], leptophobic, gX,False, 1};


(* Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, -1/3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 0, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1/3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, -2/3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 0, 1};
FermionFields[[6]] = {ni, 3, conj[niR],       0, 1,  1, -1, 1};

ScalarFields[[1]] =  {H1, 1, {H10, H1m},     -1/2, 2,  1, -1, 1};
ScalarFields[[2]] =  {H2, 1, {H20, H2m},     -1/2, 2,  1, 0, 1};
ScalarFields[[3]] =  {Phi, 1, Phi0,     0, 1,  1, -1, 1};


FermionFields[[7]] = {DtilL, 3, DTL, -1/3,  1,  3, 2/3, -1};
FermionFields[[8]] = {DtilR, 3, conj[DTR], 1/3,  1, -3, 1/3, -1};
FermionFields[[9]] = {HtilL, 3, {HtilL0, HtilLm}, -1/2,  2,  1, 0, -1};
FermionFields[[10]] = {HtilR, 3, {conj[HtilR0],conj[HtilRm]}, 1/2,  -2,  1, 1, -1};
FermionFields[[11]] = {Ni, 3, NiL, 0,  1,  1, -1, -1};
  
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------	-----*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagScalar, {AddHC->False}},
	{LagSMYuk, {AddHC->True}},
    {LagnewYuk, {AddHC->True}} 
};

LagScalar = -(m1til2 conj[H1].H1 + m2til2 conj[H2].H2 
	       + 1/2 lam1 conj[H1].H1.conj[H1].H1 + 1/2 lam2 conj[H2].H2.conj[H2].H2 + lam3 conj[H1].H1.conj[H2].H2
               + mPhi2 conj[Phi].Phi + 1/2 lamPhi conj[Phi].Phi.conj[Phi].Phi
               + MuPhi (Phi.conj[H1].H2 + conj[Phi].H1.conj[H2]) 
               + lamt1 conj[H1].H1.conj[Phi].Phi + lamt2 conj[H2].H2.conj[Phi].Phi);

LagSMYuk =  -(Yu conj[H1].u.q + Yd H2.d.q + Ye H2.e.l + Yn conj[H1].ni.l);

LagnewYuk = - (YDt Phi.DtilL.DtilR + YHt Phi.HtilL.HtilR + YN1 conj[H1].Ni.HtilL + YN2 H2.Ni.HtilR );



(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H10, {v1,  1/Sqrt[2]}, {sigmaH1, I/Sqrt[2]}, {phiH1, 1/Sqrt[2]}},
     {H20, {v2,  1/Sqrt[2]}, {sigmaH2, I/Sqrt[2]}, {phiH2, 1/Sqrt[2]}},
     {Phi0, {vPhi,  1/Sqrt[2]}, {sigmaPhi, I/Sqrt[2]}, {phiPhi, 1/Sqrt[2]}}
     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH1,phiH2,phiPhi},{hh,ZH}},
     {{sigmaH1,sigmaH2,sigmaPhi},{Ah,ZA}}, 
     {{conj[H1m],conj[H2m]},{Hp,ZP}}, 
	 {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{vL}, {conj[niR]}}, {{nuL,Vv}, {nuR,Un}}},
	 {{{DTL}, {conj[DTR]}}, {{DML,VDV},{DMR,UDV}}},
     {{{HtilLm}, {conj[HtilRm]}}, {{HL,VH},{HR,UH}}},
     {{HtilL0, conj[HtilR0],NiL}, {Htil0,ZHt0}}
	 };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd    ->{  DL, conj[DR]},
 Fe    ->{  EL, conj[ER]},
 Fu    ->{  UL, conj[UR]},
 Fv    ->{  nuL, conj[nuR]},
 FDt ->{  DML, conj[DMR]},
 FHc ->{  HL, conj[HR]},
 FH0 ->{  Htil0, conj[Htil0]}
};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  FuL, 0},
 Fu2 ->{  0, FuR},
 Fe1 ->{  FeL, 0},
 Fe2 ->{  0, FeR},
 Fv1 -> { FvL, 0},
 Fn1 -> { 0, FniR},
 FDt1 -> { FDTL, 0},
 FDt2 -> { 0 , FDTR},
 FH01 -> {FHtilL0, 0},
 FH02 -> {0, FHtilR0},
 FHm1 -> {FHtilLm,0},
 FHm2 -> {0, FHtilRm},
 FN1 -> {FNiL,0}
 };



