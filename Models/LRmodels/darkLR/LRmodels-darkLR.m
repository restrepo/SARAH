(* ::Package:: *)

Off[General::spell]

Model`Name = "darkLR";
Model`NameLaTeX ="dark Left-Right Symmetric Model with global U(1) and extra quarks, Higgs sector including a bidoublet, two triplets and two doublets";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-15";

(* using the model defined in 1512.07212.
   Added terms that aren't present in the presented Lagrangian like conj[Phi].deltaR.conj[Phi].conj[deltaL]
   as well as all the left terms which they don't write down *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]]={U[1], SParity};

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False, 0};
Gauge[[2]]={WL, SU[2], left,        g2,True, 0};
Gauge[[3]]={WR, SU[2], right,       gR,True, 0};
Gauge[[4]]={G,  SU[3], color,       g3,False, 0};


(* Matter Fields: Using Q=T3L+T3R+QBL)*)

FermionFields[[1]] = {QLbar, 3, {conj[uL], conj[dL]},        -1/6, -2,  1, -3,     0};
FermionFields[[2]] = {LLbar, 3, {conj[nuL], conj[eL]},        1/2, -2,  1,  1,    -1};
FermionFields[[3]] = {QR,  3, {uR,  dR},                      1/6,  1,  2,  3,   1/2};
FermionFields[[4]] = {LR,  3, {nuR, eR},                     -1/2,  1,  2,  1,   1/2};

FermionFields[[5]] = {DVR,  3, dVR,                          -1/3,  1,  1,  3,     0};
FermionFields[[6]] = {XVLbar,  3, conj[xL],                   1/3,  1,  1, -3,    -1};

ScalarFields[[1]]  = {Phi, 1, {{H0, Hp},{Hm, HPrime0}},         0,  2, -2,  1,  1/2};
ScalarFields[[2]]  = {deltaL,1, {{deltaLp/Sqrt[2], deltaLpp},
                                 {deltaL0, - deltaLp/Sqrt[2]}}, 1,  3,  1,  1,   -2};
ScalarFields[[3]]  = {deltaR,1, {{deltaRp/Sqrt[2], deltaRpp},
                                 {deltaR0, - deltaRp/Sqrt[2]}}, 1,  1,  3,  1,   -1};
ScalarFields[[4]]  = {HL,      1, {hLp, hL0},                 1/2,  2,  1,  1,    0};
ScalarFields[[5]]  = {HR,      1, {hRp, hR0},                 1/2,  1,  2,  1, -1/2};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}};


(*Contractions*)

contraction1=Delta[rig1,rig2] Delta[lef2,lef1];
contraction2=Delta[rig1,rig2] Delta[lef2,lef1] Delta[rig3,rig4] Delta[lef4,lef3];
contraction3=epsTensor[lef2,lef1] epsTensor[rig2,rig1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];
contraction4a=Delta[rig1b,rig2b] Delta[rig2,rig1] Delta[rig3b,rig4b] Delta[rig4,rig3];
contraction4b=Delta[lef1b,lef2b] Delta[lef2,lef1] Delta[lef3b,lef4b] Delta[lef4,lef3];
contraction5a=Delta[rig1b,rig2] Delta[rig2b,rig1] Delta[rig3,rig4b] Delta[rig4,rig3b];
contraction5b=Delta[lef1b,lef2] Delta[lef2b,lef1] Delta[lef3,lef4b] Delta[lef4,lef3b];
contraction6a=Delta[rig1,rig2] Delta[lef2,lef1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contraction6b=Delta[rig1,rig2] Delta[lef2,lef1] Delta[lef3b,lef4b] Delta[lef4,lef3];
contraction7a=Delta[lef1,lef2] Delta[rig2,rig3] Delta[rig3b,rig4b] Delta[rig4,rig1];
contraction7b=Delta[rig1,rig2] Delta[lef2,lef3] Delta[lef3b,lef4b] Delta[lef4,lef1];
contraction8a= epsTensor[rig1,rig2] Delta[rig2b,rig3] Delta[lef3,lef4b] epsTensor[lef4,lef1];
contraction8b= epsTensor[lef2,lef1] Delta[lef2b,lef3] Delta[rig3,rig4b] epsTensor[rig1,rig4];

(*Contractions end*)


LagNoHC = -( mu12 contraction1 Phi.conj[Phi]
          + mudR2 deltaR.conj[deltaR] + mudL2 deltaL.conj[deltaL]
          + muL2 conj[HL].HL + muR2 conj[HR].HR
          + lam1 contraction2 Phi.conj[Phi].Phi.conj[Phi]
          + lam3 contraction3 conj[Phi].conj[Phi].Phi.Phi
          + rho1 ( contraction4a deltaR.conj[deltaR].deltaR.conj[deltaR] + contraction4b deltaL.conj[deltaL].deltaL.conj[deltaL] )
          + rho2 ( contraction5a deltaR.deltaR.conj[deltaR].conj[deltaR] + contraction5b deltaL.deltaL.conj[deltaL].conj[deltaL] )
          + rho3 deltaL.conj[deltaL].deltaR.conj[deltaR]
          + alp1 ( contraction6a Phi.conj[Phi].deltaR.conj[deltaR] + contraction6b Phi.conj[Phi].deltaL.conj[deltaL] )
          + alp3 ( contraction7a conj[Phi].Phi.deltaR.conj[deltaR] + contraction7b Phi.conj[Phi].deltaL.conj[deltaL] )
          + beta2 ( contraction8a conj[Phi].deltaR.conj[Phi].conj[deltaL] + contraction8b Phi.deltaL.Phi.conj[deltaR] )
          + etaLL conj[HL].HL.conj[deltaL].deltaL + etaRL conj[HR].HR.conj[deltaL].deltaL
          + etaLR conj[HL].HL.conj[deltaR].deltaR + etaRR conj[HR].HR.conj[deltaR].deltaR
          + eRR1 conj[HR].conj[deltaR].deltaR.HR - eRR2 conj[HR].deltaR.conj[deltaR].HR

          + lamL conj[HL].HL.conj[HL].HL + lamR conj[HR].HR.conj[HR].HR
          + lamLR conj[HL].HL.conj[HR].HR
          + betaL conj[HL].HL.conj[Phi].Phi + betaR conj[HR].HR.conj[Phi].Phi

          );



LagHC = - ( YL1 Phi.LLbar.LR
          + YQ1 conj[Phi].QLbar.QR
          + YQ2 HL.QLbar.DVR
          + YQ3 conj[HR].XVLbar.QR
          + YDL conj[LLbar].deltaL.conj[LLbar]
          + YDR LR.deltaR.LR
          (*  scalar [+h.c.] parts *)
          + alp conj[HL].Phi.deltaR.conj[HR]
          + xiR HR.conj[deltaR].HR + xiLR HR.Phi.conj[HL]
          );


(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ {{VB,VWL[3],VWR[3]},{VP,VZ,VZR},ZZ},
  {{VWL[1],VWL[2],VWR[1],VWR[2]},{VWLm,conj[VWLm],VWRm,conj[VWRm]},ZW} };

(* ----- VEVs ---- *)
DEFINITION[EWSB][VEVs]={
{H0,      {v1, 1/Sqrt[2]},
                     {sigmaH10, I/Sqrt[2]},{phiH10, 1/Sqrt[2]}},
{HPrime0, {v2, 1/Sqrt[2]},
                     {sigmaH20, I/Sqrt[2]},{phiH20,1/Sqrt[2]}},
{deltaL0, {vtL, 1/Sqrt[2]},
                     {sigmadL, I/Sqrt[2]},{phidL,1/Sqrt[2]}},
{deltaR0, {vtR, 1/Sqrt[2]},
                     {sigmadR, I/Sqrt[2]},{phidR,1/Sqrt[2]}},
{hL0,     {vHL, 1/Sqrt[2]},
                     {sigmaHL, I/Sqrt[2]},{phiHL, 1/Sqrt[2]}},
{hR0,     {vHR, 1/Sqrt[2]},
                     {sigmaHR, I/Sqrt[2]},{phiHR,1/Sqrt[2]}}
                     };

DEFINITION[EWSB][MatterSector]=
    {
     {{phiH10,phiH20,phiHL,phidL,phiHR,phidR},{hh,ZH}},
     {{sigmaH10,sigmaH20,sigmaHL,sigmadL,sigmaHR,sigmadR},{Ah,UP}},
     {{Hm,conj[Hp],conj[hLp],conj[hRp],conj[deltaLp],conj[deltaRp]},{Hpm,UC}},
     {{conj[deltaLpp],conj[deltaRpp]},{Hppmm,UCC}},
     {{{dL,xL}, {conj[dR],conj[dVR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{nuL, conj[nuR]},{Fv0,PMNS}}
     };


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
  Fv1  -> {nuL,0},
  Fv2 -> {0,nuR} };



DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{Fv0, conj[Fv0]}
 };





