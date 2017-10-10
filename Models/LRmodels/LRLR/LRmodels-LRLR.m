(* ::Package:: *)

Off[General::spell]

Model`Name = "LRLR";
Model`NameLaTeX ="Left-Right Symmetric Model with SU(2)L x SU(2)R x U(1)L x U(1)R";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-15";


(* model as proposed in 1512.07541 *)
(* corrected several conjugates in the Lagrangian as the original version in 1512.07541 is not gauge invariant *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Groups *)

Gauge[[1]]={BL,   U[1], u1l,       g1L,False};
Gauge[[2]]={BR,   U[1], u1r,       g1R,False};
Gauge[[3]]={WL, SU[2], left,        g2,True};
Gauge[[4]]={WR, SU[2], right,       gR,True};
Gauge[[5]]={G,  SU[3], color,       g3,False};


(* Matter Fields: Using a U(1) normalization where Q = T_3L + T_3R + Q_L + Q_R *)


FermionFields[[1]] = {QLbar, 3, {conj[uL], conj[dL]},        -1/6,    0, -2,  1, -3};  
FermionFields[[2]] = {LLbar, 3, {conj[nuL], conj[eL]},        1/2,    0, -2,  1,  1};
FermionFields[[3]] = {QR,  3, {uR,  dR},                        0,  1/6,  1,  2,  3};
FermionFields[[4]] = {LR,  3, {nuR, eR},                        0, -1/2,  1,  2,  1};


FermionFields[[5]] = {UVLbar,  3, conj[uVL],                  2/3,    0,  1,  1, 3};
FermionFields[[6]] = {UVR,     3, uVR,                          0, -2/3,  1,  1,  -3};
FermionFields[[7]] = {DVLbar,  3, conj[dVL],                 -1/3,    0,  1,  1, 3};
FermionFields[[8]] = {DVR,     3, dVR,                          0,  1/3,  1,  1,  -3};

FermionFields[[9]] = {EVLbar,  3, conj[eVL],                   -1,    0,  1,  1,  1};
FermionFields[[10]] = {EVR,    3, eVR,                          0,    1,  1,  1,  1};


ScalarFields[[1]]  = {HL,      1, {hL0, hLm},                -1/2,    0,  2,  1,  1};
ScalarFields[[2]]  = {HR,      1, {hR0, hRm},                   0, -1/2,  1,  2,  1};
ScalarFields[[3]]  = {deltaL,1, {{deltaLp/Sqrt[2], deltaLpp},
                                 {deltaL0, - deltaLp/Sqrt[2]}},  1,   0,  3,  1,  1};
ScalarFields[[4]]  = {deltaR,1, {{deltaRp/Sqrt[2], deltaRpp},
                                 {deltaR0, - deltaRp/Sqrt[2]}},  0,   1,  1,  3,  1};
ScalarFields[[5]]  = {sigmaU,  1, sU,                          2/3, -2/3, 1,  1,  1};                                
ScalarFields[[6]]  = {sigmaD,  1, sD,                         -1/3,  1/3, 1,  1,  1};                                    
ScalarFields[[7]]  = {sigmaE,  1, sE,                           -1,    1, 1,  1,  1};     



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}};


(*Contractions*)

contraction1=Delta[lef1b,lef2b] Delta[lef2,lef1] Delta[lef3b,lef4b] Delta[lef4,lef3];
contraction2=Delta[lef1b,lef2] Delta[lef2b,lef1] Delta[lef3,lef4b] Delta[lef4,lef3b];
contraction4=Delta[lef1b,lef2b] Delta[lef2,lef1] Delta[rig3b,rig4b] Delta[rig4,rig3];
contraction6=Delta[rig1b,rig2b] Delta[rig2,rig1] Delta[rig3b,rig4b] Delta[rig4,rig3];
contraction7=Delta[rig1b,rig2] Delta[rig2b,rig1] Delta[rig3,rig4b] Delta[rig4,rig3b];


(*Contractions end*)

LagNoHC = - ( rho1R contraction6 deltaR.conj[deltaR].deltaR.conj[deltaR] 
            + rho2R contraction7 deltaR.deltaR.conj[deltaR].conj[deltaR]  
            + rho1L contraction1 deltaL.conj[deltaL].deltaL.conj[deltaL] 
            + rho2L contraction2 deltaL.deltaL.conj[deltaL].conj[deltaL]
            + rho3  contraction4 deltaL.conj[deltaL].deltaR.conj[deltaR]
            + mudR2 deltaR.conj[deltaR] + mudL2 deltaL.conj[deltaL] 
            + muL2 conj[HL].HL + muR2 conj[HR].HR 
            + muD conj[sigmaD].sigmaD + lamDD conj[sigmaD].sigmaD.conj[sigmaD].sigmaD
            + muU conj[sigmaU].sigmaU + lamUU conj[sigmaU].sigmaU.conj[sigmaU].sigmaU
            + muE conj[sigmaE].sigmaE + lamEE conj[sigmaE].sigmaE.conj[sigmaE].sigmaE
            + lamDU conj[sigmaD].sigmaD.conj[sigmaU].sigmaU
            + lamDE conj[sigmaD].sigmaD.conj[sigmaE].sigmaE
            + lamUE conj[sigmaU].sigmaU.conj[sigmaE].sigmaE
            + lam2L conj[HL].HL.conj[HL].HL + lam2R conj[HR].HR.conj[HR].HR 
            + lamLR conj[HL].HL.conj[HR].HR
            + lamUL conj[sigmaU].sigmaU.conj[HL].HL + lamDL conj[sigmaD].sigmaD.conj[HL].HL
            + lamEL conj[sigmaE].sigmaE.conj[HL].HL
            + lamUR conj[sigmaU].sigmaU.conj[HR].HR + lamDR conj[sigmaD].sigmaD.conj[HR].HR
            + lamER conj[sigmaE].sigmaE.conj[HR].HR            
            + lamUdL conj[sigmaU].sigmaU.conj[deltaL].deltaL + lamDdL conj[sigmaD].sigmaD.conj[deltaL].deltaL
            + lamEdL conj[sigmaE].sigmaE.conj[deltaL].deltaL
            + lamUdR conj[sigmaU].sigmaU.conj[deltaR].deltaR + lamDdR conj[sigmaD].sigmaD.conj[deltaR].deltaR 
            + lamEdR conj[sigmaE].sigmaE.conj[deltaR].deltaR             
            + etaLL conj[HL].HL.conj[deltaL].deltaL + etaRL conj[HR].HR.conj[deltaL].deltaL
            + etaLR conj[HL].HL.conj[deltaR].deltaR + etaRR conj[HR].HR.conj[deltaR].deltaR     
            + eRR1 conj[HR].conj[deltaR].deltaR.HR - eRR2 conj[HR].deltaR.conj[deltaR].HR
            + eLL1 conj[HL].conj[deltaL].deltaL.HL - eLL2 conj[HL].deltaL.conj[deltaL].HL
            );



LagHC = - ( YVU (HL.QLbar.UVLbar + HR.conj[QR].conj[UVR] )  
          + YVD ( conj[HL].QLbar.DVLbar + conj[HR].conj[QR].conj[DVR] )
          + fU conj[sigmaU].UVLbar.UVR + fD conj[sigmaD].DVLbar.DVR 
          + YVE (conj[HL].LLbar.EVLbar + conj[HR].conj[LR].conj[EVR]) 
          + fE conj[sigmaE].EVLbar.EVR
          + YL (conj[LLbar].deltaL.conj[LLbar] + LR.deltaR.LR)
          (*
          scalar potential [+ h.c.] part 
          *)
          + rhoL HL.deltaL.HL + rhoR HR.deltaR.HR 
          + lam conj[sigmaE].sigmaD.sigmaD.sigmaD + xiS sigmaU.sigmaD.sigmaD + eta sigmaE.conj[sigmaD].sigmaU
          + kap sigmaD.sigmaE.sigmaU.sigmaU
          );  


          
(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ {{VBL,VBR,VWL[3],VWR[3]},{VP,VZ,VZ1p,VZ2p},ZZ},
  {{VWL[1],VWL[2],VWR[1],VWR[2]},{VWLm,conj[VWLm],VWRm,conj[VWRm]},ZW} };     
        
(* ----- VEVs ---- *)
DEFINITION[EWSB][VEVs]={
{hL0,     {vHL, 1/Sqrt[2]}, 
                     {sigmaHL, I/Sqrt[2]},{phiHL, 1/Sqrt[2]}},
{hR0,     {vHR, 1/Sqrt[2]}, 
                     {sigmaHR, I/Sqrt[2]},{phiHR,1/Sqrt[2]}},
{deltaL0, {vtL, 1/Sqrt[2]}, 
                     {sigmadL, I/Sqrt[2]},{phidL,1/Sqrt[2]}},                        
{deltaR0, {vtR, 1/Sqrt[2]}, 
                     {sigmadR, I/Sqrt[2]},{phidR,1/Sqrt[2]}},
{sU,     {vSU, 1/Sqrt[2]}, 
                     {sigmaSU, I/Sqrt[2]},{phiSU, 1/Sqrt[2]}},
{sD,     {vSD, 1/Sqrt[2]}, 
                     {sigmaSD, I/Sqrt[2]},{phiSD,1/Sqrt[2]}},   
{sE,     {vSE, 1/Sqrt[2]}, 
                     {sigmaSE, I/Sqrt[2]},{phiSE,1/Sqrt[2]}}                     
                     };
 
DEFINITION[EWSB][MatterSector]=   
    { (*Neutral scalars*)
     {{phiHL,phiHR,phidL,phidR,phiSU,phiSD,phiSE},{hh,ZH}},
      (*Pseudoscalars*)
     {{sigmaHL,sigmaHR,sigmadL,sigmadR,sigmaSU,sigmaSD,sigmaSE},{Ah,UP}},
      (*Singly charged scalars*)
     {{hLm,hRm,conj[deltaLp],conj[deltaRp]},{Hpm,UC}},
      (*Doubly charged scalars*)
    {{conj[deltaLpp],conj[deltaRpp]},{Hppmm,UCC}},
      (*Fermions*)
     {{{dL,conj[dVR]}, {conj[dR],dVL}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL,conj[uVR]}, {conj[uR],uVL}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL,conj[eVR]}, {conj[eR],eVL}}, {{EL,Ve}, {ER,Ue}}},
     {{nuL,conj[nuR]},{Fv0,PMNS}}
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





