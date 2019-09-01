(* ::Package:: *)

Off[General::spell]

Model`Name = "GTHDM";
Model`NameLaTeX ="Gauged Two Higgs Doublet Model";
Model`Authors = "F. Staub";
Model`Date = "2016-01-17";




(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Groups *)

Gauge[[1]]={B,   U[1], hypercharge,       g1,False,0};
Gauge[[2]]={WL, SU[2], left,        g2,True,0};
Gauge[[3]]={G,  SU[3], color,       g3,False,0};
Gauge[[4]]={EH, SU[2], uhiggs,       gH,True,0};

(* For gauged U(1)_X *)
(* Gauge[[5]]={EX,  U[1], extra,       gX,True,0}; *)


Global[[1]]={U[1], extra}; 


FermionFields[[1]] = {QL, 3, {uL, dL},     1/6, 2,  3, 1, 0};  
FermionFields[[2]] = {LL, 3, {vL, eL},    -1/2, 2,  1, 1, 0};
FermionFields[[3]] = {DR,  3, {conj[dRH],  conj[dR]},    1/3, 1,  -3, 2, 1};
FermionFields[[4]] = {UR,  3, {conj[uR],  conj[uRH]},    -2/3, 1,  -3, 2, -1};
FermionFields[[5]] = {NuR,  3, {conj[vR], conj[vRH]},     0, 1,  1, 2, -1};
FermionFields[[6]] = {ER,  3, {conj[eRH], conj[eR]},     1, 1,  1, 2, 1};


FermionFields[[7]] = {XD,  3, xd,    -1/3, 1,  3, 1, 0};
FermionFields[[8]] = {XU,  3, xu,    2/3,  1,  3, 1, 0};
FermionFields[[9]] = {XN,  3, xv,     0, 1,  1, 1, 0};
FermionFields[[10]] = {XE,  3, xe,     -1, 1,  1, 1, 0};


ScalarFields[[1]]  = {H, 1, {{H2c, H1p},{H20, H10}},       1/2,  2,  1, 2,  1};


ScalarFields[[2]]  = {DeltaH,1, {{delta0/Sqrt[2], conj[deltaM]},
                                  {deltaM, - delta0/Sqrt[2]}},  0, 1, 1, 3, 0};
                                  
ScalarFields[[3]]  = {Phi,1, {PhiP,Phi0}, 0, 1, 1, 2, -1};

RealScalars = {delta0};

        
(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{AddHC->False}}};
	
LagNoHC=-(VH+VPH+VDH+VMIX);

VH = muH2 H.conj[H] + LambdaH conj[H].H.conj[H].H;
VPH= muP2 Phi.conj[Phi] + LambdaP conj[Phi].Phi.conj[Phi].Phi;
VDH=-muD2 DeltaH.conj[DeltaH] + LambdaD Delta[hig1,hig2] Delta[hig1b,hig2b] Delta[hig3,hig4] Delta[hig3b,hig4b] conj[DeltaH].DeltaH.conj[DeltaH].DeltaH;
VMIX=MHD conj[H].DeltaH.H - MPD conj[Phi]. DeltaH.Phi + LambdaHD conj[H].H.DeltaH.conj[DeltaH] + LambdaHP conj[H].H.conj[Phi].Phi + LambdaPD conj[Phi].Phi.conj[DeltaH].DeltaH;

LagHC=Yd QL.DR.conj[H] +  Yu QL.UR.H - Ydp XD.DR.Phi - Yup XU.UR.conj[Phi] + Ye LL.ER.conj[H] + Yv LL.NuR.H - Yep XE.ER.Phi - Yvp XN.NuR.conj[Phi];


(* Gauge Sector *)
DEFINITION[EWSB][GaugeSector] =
{ {{VB,VWL[3],VEH[3]},{VP,VZ,VZP},ZZ},
  {{VWL[1],VWL[2]},{VWp,conj[VWp]},ZW}, 
  {{VEH[1],VEH[2]},{VWpr,conj[VWpr]},ZW} 
  
  };    
  

        
(* ----- VEVs ---- *)
DEFINITION[EWSB][VEVs]={
{H10,       {v, 1/Sqrt[2]}, {sigmaH10, I/Sqrt[2]},{phiH10, 1/Sqrt[2]}},
{Phi0,       {vP, 1/Sqrt[2]}, {sigmaP, I/Sqrt[2]},{phiP, 1/Sqrt[2]}},
{delta0,       {vD, 1/Sqrt[2]}, {0,0},{phiD, 1/Sqrt[2]}} };
 
DEFINITION[EWSB][MatterSector]=   
    { 
     {{phiH10,phiD,phiP},{hh,ZH}},
     {{sigmaH10,sigmaP},{Ah,UP}},
     {{PhiP, conj[deltaM], H20},{Hpm,UC}}, 

     (*Fermions*)
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{vL}, {conj[vR]}}, {{VL,Vnu}, {VR,Unu}}},
     {{{xd}, {conj[dRH]}}, {{DLp,Vdp}, {DRp,Udp}}},
     {{{xu}, {conj[uRH]}}, {{ULp,Vup}, {URp,Uup}}},
     {{{xe}, {conj[eRH]}}, {{ELp,Vep}, {ERp,Uep}}},
     {{{xv}, {conj[vRH]}}, {{VLp,Vvp}, {VRp,Uvp}}}
     
     
     
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
  Fv1  -> {vL,0},
  Fv2 -> {0,vR} };



DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{VL, conj[VR]},
 Fdp ->{  DLp, conj[DRp]},
 Fep ->{  ELp, conj[ERp]},
 Fup ->{  ULp, conj[URp]},
 Fvp ->{VLp, conj[VRp]}
 
 
 
 };





