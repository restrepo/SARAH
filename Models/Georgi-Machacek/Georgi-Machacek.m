Off[General::spell]

Model`Name = "GM";
Model`NameLaTeX ="Georgi-Machacek Model";
Model`Authors = "F.Staub";
Model`Date = "2016-01-19";


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
ScalarFields[[3]] = {xi, 1, {{xiM/Sqrt[2], conj[xi0]},{-xiMM,-xiM/Sqrt[2]}},    -1, 3, 1};

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


LagNoHC = -(mu2 conj[H].H  + MXi conj[xi].xi  + 1/2 Meta conj[eta].eta  + 4 Lambda1 conj[H].H.conj[H].H + \
             4 Lambda2a conj[H].H.conj[xi].xi + 2 Lambda2b  conj[H].H.conj[eta].eta + \
             Lambda3a (2 epsTensor[lef1b, lef2] epsTensor[lef2b, lef3] epsTensor[lef3b,lef4] epsTensor[lef4b, lef1]) conj[eta].eta.conj[eta].eta + \
                Lambda3b (2 epsTensor[lef1b, lef2] epsTensor[lef2b, lef3] epsTensor[lef3b,lef4] epsTensor[lef4b, lef1] -  6  epsTensor[lef1b, lef2] Delta[lef2b, lef4] epsTensor[lef4b, lef3] Delta[lef3b, lef1]) conj[xi].xi.conj[xi].xi + \
                Lambda3c (4 epsTensor[lef1b, lef2] epsTensor[lef2b, lef3] epsTensor[lef3b,lef4] epsTensor[lef4b, lef1] -  4 epsTensor[lef1b, lef4] Delta[lef4b, lef2] epsTensor[lef2b,lef3] Delta[lef3b, lef1]) conj[xi].xi.conj[eta].eta +\
             Expand[ (epsTensor[lef1b, lef2] epsTensor[lef2b, lef1] epsTensor[lef3b,lef4] epsTensor[lef4b, lef3]) (Lambda4a conj[eta].eta.conj[eta].eta + 4 Lambda4b conj[xi].xi.conj[xi].xi + 4 Lambda4c conj[xi].xi.conj[eta].eta)]  \
             -Lambda5a (Delta[lef1, lef3b] Delta[lef2, lef4b] Delta[lef3, lef4] -  Delta[lef1, lef4] Delta[lef2, lef3] Delta[lef3b, lef4b]) conj[H].H.conj[xi].xi + \
             -M1a (- 1/Sqrt[2] epsTensor[lef1, lef2b] epsTensor[lef2, lef3] ) conj[H].eta.H );
LagHC = - (Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q \
         - Lambda5b (-Sqrt[2] epsTensor[lef1, lef3] epsTensor[lef2, lef4] epsTensor[lef3b, lef4b]) H.H.xi.eta \
         - M1b (- 1/2 epsTensor[lef1, lef2] Delta[lef2b, lef3] ) H.xi.H \
         - M2 (3 Sqrt[2] (- Delta[lef1, lef2] Delta[lef2b, lef3] Delta[lef1b,lef3b])) conj[xi].xi.eta);

subLRlimit = {Lambda2a -> Lambda2, Lambda2b -> Lambda2,  \
  Lambda3a -> Lambda3, Lambda3b -> Lambda3, Lambda3c -> Lambda3,  \
  Lambda4a -> Lambda4, Lambda4b -> Lambda4, Lambda4c -> Lambda4, \
  Lambda5a -> Lambda5, Lambda5b -> Lambda5, \
  M1a -> M1, M1b -> M1,  M2a -> M2, M2b -> M2, \
  vEta->vX, vPhi-> vX};

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
     {{Hp,conj[etaM], conj[xiM]},{Hpm,ZP}},
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



