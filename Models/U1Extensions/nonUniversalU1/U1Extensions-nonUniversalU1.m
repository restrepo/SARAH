Off[General::spell]


Model`Name = "nonUniversalU1";
Model`NameLaTeX ="U(1)' model with family non-universal U(1)' charges and extra quark states";
Model`Authors = "F. Staub, M.E. Krauss";
Model`Date = "2016-01-10";


(* using the model introduced in 1512.05617 *)
(* more specifically, the model with the charge assignments from 1303.2734 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], chargeX,     gX, False};


(* Chiral Superfields *)

FermionFields[[1]] = {q1, 1, {u1L, d1L},      1/6, 2, 3, 1/3};
FermionFields[[2]] = {q23, 2, {u23L, d23L},   1/6, 2, 3, 0};
FermionFields[[3]] = {l, 3, {vL, eL},  -1/2, 2, 1, -1/3};
FermionFields[[4]] = {d, 3, conj[dR], 1/3, 1, -3,  1/3};
FermionFields[[5]] = {u, 3, conj[uR],-2/3, 1, -3,  -2/3};
FermionFields[[6]] = {e, 3, conj[eR],   1, 1,  1, 1};
FermionFields[[7]] = {nu, 3, conj[nuR],   0, 1,  1, -1/3};

FermionFields[[8]] = {TL, 1, tL, 2/3, 1, 3, 1/3};
FermionFields[[9]] = {TR, 1, conj[tR], -2/3, 1, -3, -2/3};


FermionFields[[10]] = {JL, 2, jL, -1/3, 1, 3, 0};
FermionFields[[11]] = {JR, 2, conj[jR], 1/3, 1, -3, 1/3};



ScalarFields[[1]] = {H1, 1, {H10, H1m},       -1/2, 2,  1,     -2/3};
ScalarFields[[2]] = {H2, 1, {H20, H2m},       -1/2, 2,  1,     -1/3};
ScalarFields[[3]] = {SI,   1, si,    0, 1, 1, -1/3}; 



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(M112 conj[H1].H1 + M222 conj[H2].H2 + Lambda1 conj[H1].H1.conj[H1].H1 
            + Lambda2 conj[H2].H2.conj[H2].H2 + Lambda3 conj[H2].H2.conj[H1].H1 + Lambda4 conj[H2].H1.conj[H1].H2
            + muS2 conj[SI].SI - lamH1S conj[H1].H1.conj[SI].SI - lamH2S conj[H2].H2.conj[SI].SI 
            - lamS conj[SI].SI.conj[SI].SI 
             );

LagHC = - (+ h2D H2.d.q23 + h1U conj[H1].u.q23 + h1D H1.d.q1 + h2U conj[H2].u.q1
           + h1J H1.JR.q1 + h2J H2.JR.q23 + h2T conj[H2].TR.q1 + h1T conj[H1].TR.q23
           + hXU conj[SI].u.TL + hXT conj[SI].TR.TL 
           + hXD SI.d.JL + hXJ SI.JR.JL
           + Ye H1.e.l + Yv conj[H1].nu.l      
           + kapHS conj[H1].H2.SI
           );

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H10, {v1, 1/Sqrt[2]}, {sigmaH1, \[ImaginaryI]/Sqrt[2]},{phiH1, 1/Sqrt[2]}},
     {H20, {v2, 1/Sqrt[2]}, {sigmaH2, \[ImaginaryI]/Sqrt[2]},{phiH2, 1/Sqrt[2]}},
     {si, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH1,phiH2,phiS},{hh,ZH}},
     {{sigmaH1,sigmaH2,sigmaS},{Ah,ZA}},
     {{H1m,H2m},{Hm,ZP}},
     {{{d1L,d23L,jL}, {conj[dR],conj[jR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{u1L,u23L,tL}, {conj[uR],conj[tR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{vL}, {conj[nuR]}}, {{VL,ZNL},{VR,ZNR}}}
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



