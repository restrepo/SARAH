(* ::Package:: *)

Off[General::spell]

Model`Name = "tripletLR";
Model`NameLaTeX ="Left-Right Symmetric Model with fermionic and scalar triplets";
Model`Authors = "M.E. Krauss, C. Bonilla";
Model`Date = "2016-01-08";




(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False};
Gauge[[2]]={WL, SU[2], left,        g2,True};
Gauge[[3]]={WR, SU[2], right,       gR,True};
Gauge[[4]]={G,  SU[3], color,       g3,False};


(* Matter Fields: Using Q=T3L+T3R+QBL)*)

FermionFields[[1]] = {QLbar, 3, {conj[uL], conj[dL]},        -1/6, -2,  1, -3};  
FermionFields[[2]] = {LLbar, 3, {conj[nuL], conj[eL]},        1/2, -2,  1,  1};
FermionFields[[3]] = {QR,  3, {uR,  dR},                      1/6,  1,  2,  3};
FermionFields[[4]] = {LR,  3, {nuR, eR},                     -1/2,  1,  2,  1};
FermionFields[[5]] = {T1,1, {{t10/Sqrt[2], t1p},
                                 {t1m, - t10/Sqrt[2]}},         0,  1,  3,  1};
FermionFields[[6]] = {T2,1, {{t2p/Sqrt[2], t2pp},
                                 {t20, - t2p/Sqrt[2]}},         1,  1,  3,  1};
FermionFields[[7]] = {T3,1, {{t3m/Sqrt[2], t30},
                                 {t3mm, - t3m/Sqrt[2]}},       -1,  1,  3,  1};                                 

ScalarFields[[1]]  = {Phi, 1, {{H0, Hp},{Hm, HPrime0}},         0,  2, -2,  1}; 
ScalarFields[[2]]  = {deltaR,1, {{deltaRp/Sqrt[2], deltaRpp},
                                 {deltaR0, - deltaRp/Sqrt[2]}}, 1,  1,  3,  1};

        
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
contraction3a=epsTensor[lef2,lef1] epsTensor[rig2,rig1] epsTensor[lef4,lef3] epsTensor[rig4,rig3];
contraction3b=epsTensor[rig2,rig1] epsTensor[lef2,lef1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];
contraction4=epsTensor[lef2,lef1] epsTensor[rig2,rig1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];
contraction5a=- Delta[rig1,rig2] Delta[lef2,lef1] epsTensor[lef4,lef3] epsTensor[rig4,rig3];
contraction5b=- Delta[rig1,rig2] Delta[lef2,lef1] epsTensor[rig4,rig3] epsTensor[lef4,lef3];
contraction6=Delta[rig1b,rig2b] Delta[rig2,rig1] Delta[rig3b,rig4b] Delta[rig4,rig3];
contraction7=Delta[rig1b,rig2] Delta[rig2b,rig1] Delta[rig3,rig4b] Delta[rig4,rig3b];
contraction8=Delta[rig1,rig2] Delta[lef2,lef1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contraction9a=- epsTensor[rig2,rig1] epsTensor[lef2,lef1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contraction9b=- epsTensor[lef2,lef1] epsTensor[rig2,rig1] Delta[rig3,rig4] Delta[rig4b,rig3b];
contraction10=Delta[lef1,lef2] Delta[rig2,rig3] Delta[rig3b,rig4b] Delta[rig4,rig1]; 

(*Contractions end*)


LagNoHC = ( mu12 contraction1 Phi.conj[Phi]           
           - mu22 ( conj[Phi].conj[Phi] +  Phi.Phi )
           + mu32 deltaR.conj[deltaR]  
           - lam1 contraction2 Phi.conj[Phi].Phi.conj[Phi] 
          - lam2 ( contraction3a conj[Phi].conj[Phi].conj[Phi].conj[Phi] + contraction3b Phi.Phi.Phi.Phi )
          - lam3 contraction4 conj[Phi].conj[Phi].Phi.Phi
          - lam4 ( contraction5a Phi.conj[Phi].conj[Phi].conj[Phi] + contraction5b Phi.conj[Phi].Phi.Phi )                     
          - rho1 contraction6 deltaR.conj[deltaR].deltaR.conj[deltaR] 
          - rho2  contraction7 deltaR.deltaR.conj[deltaR].conj[deltaR]       
          - alp1 contraction8 Phi.conj[Phi].deltaR.conj[deltaR] 
          - alp2 ( contraction9a Phi.Phi.deltaR.conj[deltaR] + contraction9b conj[Phi].conj[Phi].deltaR.conj[deltaR] )     
          - alp3 contraction10 conj[Phi].Phi.deltaR.conj[deltaR]  
          );



LagHC = - ( YL1 Phi.LLbar.LR 
          + YL2 conj[Phi].LLbar.LR  
          + YQ1 Phi.QLbar.QR 
          + YQ2 conj[Phi].QLbar.QR 
          + YDR LR.deltaR.LR 
          + 1/2 M1 T1.T1 + M23 T2.T3 + lamT1 deltaR.T3.T1 + lamT2 conj[deltaR].T2.T1
          );


(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ {{VB,VWL[3],VWR[3]},{VP,VZ,VZR},ZZ},
  {{VWL[1],VWL[2],VWR[1],VWR[2]},{VWLm,conj[VWLm],VWRm,conj[VWRm]},ZW} };     
        
(* ----- VEVs ---- *)
DEFINITION[EWSB][VEVs]={
{H0,       {v1, 1/Sqrt[2]}, 
                     {sigmaH10, I/Sqrt[2]},{phiH10, 1/Sqrt[2]}},
{HPrime0, {v2, 1/Sqrt[2]}, 
                     {sigmaH20, I/Sqrt[2]},{phiH20,1/Sqrt[2]}},
{deltaR0, {vR, 1/Sqrt[2]}, 
                     {sigmaR0, I/Sqrt[2]},{phiR0,1/Sqrt[2]}}
                     };
 
DEFINITION[EWSB][MatterSector]=   
    { (*Neutral scalars*)
     {{phiH10,phiH20,phiR0},{hh,ZH}},
      (*Pseudoscalars*)
     {{sigmaH10,sigmaH20,sigmaR0},{Ah,UP}},
      (*Singly charged scalars*)
     {{Hm,conj[Hp],conj[deltaRp]},{Hpm,UC}},
      (*Fermions*)
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{conj[eL]}, {eR}}, {{EL,Ve}, {ER,Ue}}},
     {{conj[nuL], nuR},{Fv0,PMNS}},
     {{t10, t20, t30},{Ft0,UT}},
     {{{t1p, t2p}, {t1m, t3m}}, {{TPL,VTe}, {TMR,UTe}}}
     };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][Phases]=
{    {t3mm, PhaseT}
    }; 


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
 Fv ->{Fv0, conj[Fv0]},
 Fc ->{Ft0, conj[Ft0]},
 Fcpp -> {t2pp, conj[t3mm]},
 Fcp ->{ TPL, conj[TMR]}
 };





