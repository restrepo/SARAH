Off[General::spell]

Model`Name = "yTSM";
Model`NameLaTeX ="complex $Y=1$ Triplet Extended Standard Model";
Model`Authors = "F.Staub";
Model`Date = "2018-04-06";



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
ScalarFields[[2]] = {trip, 1, {{Tp/Sqrt[2],-Tpp},{T0,-Tp/Sqrt[2]}},    1, 3, 1};





        


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(mu2 conj[H].H  + 1/2 MT conj[trip].trip  + 1/2 LT  epsTensor[lef1b,lef2] epsTensor[lef2b,lef3] epsTensor[lef3b,lef4] epsTensor[lef4b,lef1] trip.conj[trip].trip.conj[trip] \
+ 1/2 LT2  epsTensor[lef1b,lef2] epsTensor[lef2b,lef1] epsTensor[lef3b,lef4] epsTensor[lef4b,lef3] trip.conj[trip].trip.conj[trip] \
+ 1/2 LH conj[H].H.conj[H].H - 1/2 LHT conj[H].H.conj[trip].trip + 1/2 LHT2 conj[H].conj[trip].trip.H);

LagHC = - (Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q + KHT H.conj[trip].H);

ContractionRGE[LT]=Delta[lef1,lef2] Delta[lef3, lef4];
ContractionRGE[LT2]=(Delta[lef1, lef2] Delta[lef3, lef4] - Delta[lef1, lef3] Delta[lef2, lef4] +  Delta[lef1, lef4] Delta[lef2, lef3]);
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	


(* ----- VEVs ---- *)


DEFINITION[EWSB][VEVs]= 
{     {H0, {v, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
      {T0, {vT, 1/Sqrt[2]}, {sigmaT, \[ImaginaryI]/Sqrt[2]},{phiT, 1/Sqrt[2]}} }; 

 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiT},{hh,ZH}},
     {{sigmaH,sigmaT},{Ah,ZA}},
     {{Hp,Tp},{Hpm,ZP}},
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



