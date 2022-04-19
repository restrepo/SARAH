Off[General::spell]

Model`Name = "SDdiracDM";
Model`NameLaTeX ="Singlet doublet Dirac dark matter";
Model`Authors = "Andres Rivera. Base in SM by F.Staub";
Model`Date = "2018-12-10";

(* 2013-01-24: changed normalization of lambda term to convention of hep-ph/0207271 *)
(* 2013-06-24: using new name conventions (without inital "S" and "F" for scalar and matter fields) *)
(* 2013-09-01: changing to new conventions for FermionFields/MatterFields *)
(* 2014-11-06: Changed sign in Lagrangian to fit standard conventions *)
(* 2016-05-03: Changed sign of Yu *)



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)

Global[[1]] = {Z[2], Z2};


(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Matter Fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};  
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

FermionFields[[6]] = {nl1, 1, nL1,            0, 1,  1,-1};
FermionFields[[7]] = {nr2, 1, nR2,            0, 1,  1,-1};
FermionFields[[8]] = {rd, 1, {vd, ed},   -1/2, 2,  1,-1};
FermionFields[[9]] = {ru, 1, {-eu,vu},    1/2, 2,  1,-1};
FermionFields[[10]] = {vr, 3, conj[vR],      0, 1,  1,1};

ScalarFields[[1]] = {H, 1, {Hp, H0},      1/2, 2,  1, 1};
ScalarFields[[2]] = {SP, 1, S0,             0, 1,  1, 1};
ScalarFields[[3]] = {S1, 1, ss1,             0, 1,  1, -1};
ScalarFields[[4]] = {S2, 1, ss2,             0, 1,  1, -1};

RealScalars = {SP,S1,S2};

        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC,       {AddHC->True}},
	{LagNoHC,     {AddHC->False}},
    {Lagdoublet , {AddHC->True}},
    {LagS , {AddHC->False}},
    {LagSP , {AddHC->False}},
    {Lagint , {AddHC->True}}
};


LagNoHC = -( -mu2 conj[H].H + 1/2 Lambda1 conj[H].H.conj[H].H );

LagHC =  -(Yd conj[H].d.q + Ye conj[H].e.l + Yu u.q.H);

Lagdoublet =  - ( MDF rd.ru  + YRD nr2.rd.H );

LagS = -( 1/2 MS12 S1.S1 + LamS1H S1.S1.conj[H].H  + LamS/2 S1.S1.S1.S1 +
          1/2 MS22 S2.S2 + LamS2H S2.S2.conj[H].H  + LamS/2 S2.S2.S2.S2 );

LagSP = -( 1/2 mP2 SP.SP + LamSPH SP.SP.conj[H].H + 1/2 LamSP SP.SP.SP.SP  ); 

Lagint = -( YRA1 ru.l.S1 + YRA2 ru.l.S2 + YRB1 nl1.vr.S1 + YRB2 nl1.vr.S2 + YRC nr2.nl1.SP + YNU vr.l.H );

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     



(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {S0, {vS, 1/Sqrt[2]}, {0, 0}, {phiS, 1/Sqrt[2]}}
};
 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiS},{hh,ZH}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},     
     {{{vL}, {conj[vR]}}, {{VL, Vv}, {VR, Vvr}}},
     {{{vd, nL1}, {vu, nR2}}, {{xVL,XV}, {xVR,XU}}},
     {{ss1,ss2}, {Ssc, VSs}}
    };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]}, 
 Fv ->{  VL, conj[VR]},
 Fxe ->{  ed, conj[eu]},
 Fxv ->{  xVL, conj[xVR]}  
};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



