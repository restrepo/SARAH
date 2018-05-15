Off[General::spell]

Model`Name = "GGM";
Model`NameLaTeX ="Generalised Georgi-Machacek Model";
Model`Authors = "F.Staub";
Model`Date = "2017-8-19";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},    1/6, 2,  3};  
FermionFields[[2]] = {l, 3, {vL,  eL},  -1/2, 2,  1};
FermionFields[[3]] = {d, 3, conj[dR],    1/3, 1, -3};
FermionFields[[4]] = {u, 3, conj[uR],   -2/3, 1, -3};
FermionFields[[5]] = {e, 3, conj[eR],      1, 1,  1};

ScalarFields[[1]] = {H,    1, {Hp, H0},                           1/2, 2, 1};
ScalarFields[[2]] = {eta, 1, {{eta0/Sqrt[2],-conj[etaM]},{-etaM,-eta0/Sqrt[2]}},    0, 3, 1};
ScalarFields[[3]] = {xi, 1, {{xiP/Sqrt[2], -xiPP},{xi0,-xiP/Sqrt[2]}},    1, 3, 1};

RealScalars = {eta0};



        


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};


LagNoHC = -(mH2 conj[H].H  + mX2 conj[xi].xi  + 1/2 mE2 conj[eta].eta  + Lambda1 conj[H].H.conj[H].H + \
 mu1 conj[H].eta.H \
 +  rho1 Delta[lef1, lef2] Delta[lef2b, lef1b] Delta[lef3, lef4] Delta[lef4b, lef3b] conj[xi].xi.conj[xi].xi \
 + rho2 Delta[lef1, lef2] Delta[lef2b, lef3b] Delta[lef3, lef4] Delta[lef4b, lef1b] conj[xi].xi.conj[xi].xi \
 +   rho3 Delta[lef1, lef2b] Delta[lef2, lef3b] Delta[lef3, lef4b] Delta[lef4, lef1b] eta.eta.eta.eta \
 +   rho4 Delta[lef1, lef2] Delta[lef2b, lef1b] Delta[lef3b, lef4] Delta[lef4b, lef3] conj[xi].xi.eta.eta \
 +   rho5 Delta[lef1, lef2] Delta[lef2b, lef1b] Delta[lef3, lef4b] Delta[lef4, lef3b] conj[xi].eta.xi.eta \
 + sig1 Delta[lef1,lef2] Delta[lef2b,lef1b] Delta[lef3,lef4] conj[xi].xi.conj[H].H \
 + sig2 Delta[lef1,lef2] Delta[lef2b,lef3b] Delta[lef3,lef4] conj[H].xi.conj[xi].H \
 + sig3 Delta[lef1,lef2b] Delta[lef2,lef1b] Delta[lef3,lef4] eta.eta.conj[H].H \
 + mu3 Delta[lef1, lef2] Delta[lef2b, lef3] Delta[lef1b,lef3b] conj[xi].xi.eta);


LagHC = - (Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q \
        + sig4 Delta[lef1, lef2] Delta[lef2b, lef3] epsTensor[lef3b, lef4]  conj[H].xi.eta.conj[H]  \
        + mu2 (epsTensor[lef1, lef2b] Delta[lef2, lef3] ) H.conj[xi].H);
 
 
(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	


(* ----- VEVs ---- *)


DEFINITION[EWSB][VEVs]= 
{     {H0, {vDoub, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
      {eta0, {vEta, 1}, {0, 0},{phiEta, 1}}, 
      {xi0, {vPhi, 1}, {sigmaXi,  \[ImaginaryI]/Sqrt[2]},{phiXi, 1/Sqrt[2]}} 
      }; 
 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiEta,phiXi},{hh,ZH}},
     {{sigmaH,sigmaXi},{Ah,ZA}},
     {{Hp,conj[etaM], xiP},{Hpm,ZP}},
     {{{dL}, {conj[dR]}}, {{FDL,Vd}, {FDR,Ud}}},
     {{{uL}, {conj[uR]}}, {{FUL,Vu}, {FUR,Uu}}},
     {{{eL}, {conj[eR]}}, {{FEL,Ve}, {FER,Ue}}}};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};
 
 
 SetOptions[MakeSPheno, TwoLoop -> False]



