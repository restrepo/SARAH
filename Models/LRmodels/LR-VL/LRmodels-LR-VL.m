(* ::Package:: *)

Off[General::spell]

Model`Name = "LRVL";
Model`NameLaTeX ="Left-Right Symmetric Model without bidoublets but vectorlike fermions";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-06";

(* update: 2016-01-13: included a vev vS for the singlet, split the L- and R- terms in the potential *)

(* based on the proposal in 1512.09202 and 1001.1341 *)
(* also aplies to 1601.00952 *)
(* in order to obtain the correct fermion mass relations, the Lagrangian from  1001.1341 was taken over, which 
   differs from the one in 1512.09202 by the L/R assignments of the VL fermions in the Yukawa terms *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False};
Gauge[[2]]={WL, SU[2], left,        g2,True};
Gauge[[3]]={WR, SU[2], right,       gR,True};
Gauge[[4]]={G,  SU[3], color,       g3,False};


(* Matter Fields: Using Q=T3L+T3R+QBL)*)

FermionFields[[1]] = {QLbar,   3, {conj[uL], conj[dL]},       -1/6, -2, 1, -3};  
FermionFields[[2]] = {LLbar,   3, {conj[nuL], conj[eL]},       1/2, -2, 1,  1};
FermionFields[[3]] = {QR,      3, {uR,  dR},                     1/6, 1, 2, 3};
FermionFields[[4]] = {LR,      3, {nuR, eR},                   -1/2, 1,  2, 1};

FermionFields[[5]] = {UVLbar,  3, conj[uVL],                 -2/3, 1,  1,  -3};
FermionFields[[6]] = {UVR,     3, uVR,                         2/3, 1,  1,  3};
FermionFields[[7]] = {DVLbar,  3, conj[dVL],                  1/3, 1,  1,  -3};
FermionFields[[8]] = {DVR,     3, dVR,                        -1/3, 1,  1,  3};

FermionFields[[9]] = {EVLbar,  3, conj[eVL],                       1, 1, 1, 1};
FermionFields[[10]] = {EVR,    3, eVR,                            -1, 1, 1, 1};
FermionFields[[11]] = {VVLbar, 3, conj[vVL],                      0, 1,  1, 1};
FermionFields[[12]] = {VVR,    3, vVR,                            0, 1,  1, 1};

ScalarFields[[1]]  = {HL,      1, {hL0, hLm},                   -1/2, 2, 1, 1};
ScalarFields[[2]]  = {HR,      1, {hR0, hRm},                   -1/2, 1, 2, 1};
ScalarFields[[3]]  = {S,       1, s0,                              0, 1, 1, 1};


RealScalars = {S};

        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}};




LagNoHC = - ( mu12 S.S + muL2 conj[HL].HL + muR2 conj[HR].HR - mu3L S.conj[HL].HL + mu3R S.conj[HR].HR - lam1 S.S.S.S
             - lam2L conj[HL].HL.conj[HL].HL -lam2R conj[HR].HR.conj[HR].HR - lam3 conj[HL].HL.conj[HR].HR
             - lam4L S.S.conj[HL].HL -lam4R S.S.conj[HR].HR
            );



LagHC = - ( YVU (HL.QLbar.UVR + HR.conj[QR].conj[UVLbar] )  + YVD ( conj[HL].QLbar.DVR + conj[HR].conj[QR].conj[DVLbar] )
          + MU UVLbar.UVR + MD DVLbar.DVR 
          + YVE (conj[HL].LLbar.EVR + conj[HR].conj[LR].conj[EVLbar]) + ME EVLbar.EVR
          + YVV (HL.LLbar.VVR + HR.conj[LR].conj[VVLbar]) + 1/2 MNM (VVR.VVR + conj[VVLbar].conj[VVLbar]) + MND VVLbar.VVR
          + lamU S.UVLbar.UVR + lamD S.DVLbar.DVR + lamE S.EVLbar.EVR + lamV S.VVLbar.VVR
          );


(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ {{VB,VWL[3],VWR[3]},{VP,VZ,VZR},ZZ},
  {{VWL[1],VWL[2],VWR[1],VWR[2]},{VWLm,conj[VWLm],VWRm,conj[VWRm]},ZW} };     
        
(* ----- VEVs ---- *)
DEFINITION[EWSB][VEVs]={
{hL0,       {vL, 1/Sqrt[2]}, 
                     {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiHL, 1/Sqrt[2]}},
{hR0,       {vR, 1/Sqrt[2]}, 
                     {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiHR,1/Sqrt[2]}},
{s0,       {vS, 1}, 
                     {0, 0},{phiS,1}}                     
                     };
 
DEFINITION[EWSB][MatterSector]=   
    { (*Neutral scalars*)
     {{phiHL,phiHR,phiS},{hh,ZH}},
      (* pseudoscalars *)
     {{sigmaL,sigmaR},{Ah,ZA}}, 
      (* charged Higgs *)
     {{hLm,hRm},{Hpm,UC}}, 
      (*Fermions*)
     {{{dL,dVL}, {conj[dR],conj[dVR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL,uVL}, {conj[uR],conj[uVR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{conj[eL],conj[eVL]}, {eR,eVR}}, {{EL,Ve}, {ER,Ue}}},
     {{conj[nuL],conj[vVL],nuR,vVR},{Fv0,PMNS}} };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)
DEFINITION[GaugeES][DiracSpinors]={
  Fd1 -> {dL, 0},
  Fd2 -> {0, dR},
  Fu1 -> {uL, 0},
  Fu2 -> {0, uR},
  Fe1 -> {eL, 0},
  Fe2 -> {0, eR},
  Fv1 -> {nuL,0},
  Fv2 -> {0,nuR} };



DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{Fv0, conj[Fv0]}};





