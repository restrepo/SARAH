Off[General::spell]

Model`Name = "331v1";
Model`NameLaTeX ="3-3-1 Model with inverse seesaw for neutrino masses";
Model`Authors = "A. Vicente";
Model`Date = "2016-01-11";

(* 2016-01-11 : model implemented, based on 1512.06878 *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]]={U[1], Lspecial};  
Global[[2]]={Z[2], Parity}; 

(* Gauge Superfields *)

Gauge[[1]]={B,  U[1],  xcharge,     g1,False, 0, 1};
Gauge[[2]]={WB, SU[3], left,        g2,True,  0, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 0, 1};


(* Chiral Superfields *)

FermionFields[[1]] = {q1, 1, {dpL, dL, uL},   0, 3, 3, -2/3, 1};  
FermionFields[[2]] = {q2, 1, {spL, sL, cL},   0, 3, 3, -2/3, 1};
FermionFields[[3]] = {q3, 1, {tpL, -tL, bL},   1/3, -3, 3, 2/3, -1};
FermionFields[[4]] = {u, 3, conj[uR],   -2/3, 1, -3, 0, 1};
FermionFields[[5]] = {ut, 1, conj[utR],   -2/3, 1, -3, 0, -1};
FermionFields[[6]] = {d, 3, conj[dR],  1/3, 1, -3, 0, -1};
FermionFields[[7]] = {dt, 2, conj[dtR],  1/3, 1, -3, 0, 1};

FermionFields[[8]] = {l, 3, {NL, -vL, eL},  -1/3, -3, 1, -1/3, 1};
FermionFields[[9]] = {e, 3, conj[eR],     1, 1,  1, 1, 1};
FermionFields[[10]] = {s, 3, conj[sR],     0, 1,  1, -1, 1};

ScalarFields[[1]] =  {phi1,  1, {phi1mt, -phi1m, phi10},  2/3, -3, 1,  2/3,  1};
ScalarFields[[2]] =  {phi2,  1, {phi20t, -phi20, phi2p}, -1/3, -3, 1, -4/3,  1};
ScalarFields[[3]] =  {phi3,  1, {phi30t, -phi30, phi3p}, -1/3, -3, 1,  2/3, -1};

ScalarFields[[4]] =  {phiX,  1, {phiX0t, -phiX0, phiXp}, -1/3, -3, 1, -4/3,  1};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->True, AddHC->True}},
	{LagNoHC,{Overwrite->True, AddHC->False}}
};

Laglep = yl conj[l].conj[e].phi1 + ya l.l.phi1 + ys conj[l].conj[s].phi2 + mS/2 s.s;
Lagquark1 = yu1 conj[q1].conj[u].conj[phi1] + yu2 conj[q2].conj[u].conj[phi1] + yu3 conj[q3].conj[u].phi3 + yd1 conj[q1].conj[d].conj[phi3] + yd2 conj[q2].conj[d].conj[phi3] + yd3 conj[q3].conj[d].phi1;
Lagquark2 = yu3t conj[q3].conj[ut].phi2 + yd1t conj[q1].conj[dt].conj[phi2] + yd2t conj[q2].conj[dt].conj[phi2] + yu3Xt conj[q3].conj[ut].phiX + yd1Xt conj[q1].conj[dt].conj[phiX] + yd2Xt conj[q2].conj[dt].conj[phiX];

Vpot1 = mu12 conj[phi1].phi1 + mu22 conj[phi2].phi2 + mu32 conj[phi3].phi3 + muX2 conj[phiX].phiX + l1 conj[phi1].phi1.conj[phi1].phi1 + l2 conj[phi2].phi2.conj[phi2].phi2 + l3 conj[phi3].phi3.conj[phi3].phi3 + lX conj[phiX].phiX.conj[phiX].phiX + l12 conj[phi1].phi1.conj[phi2].phi2 + l13 conj[phi1].phi1.conj[phi3].phi3 + l23 conj[phi2].phi2.conj[phi3].phi3 + l1X conj[phi1].phi1.conj[phiX].phiX + l2X conj[phi2].phi2.conj[phiX].phiX + l3X conj[phi3].phi3.conj[phiX].phiX;
Vpot2 = f phi1.phi2.phi3;
Vpot3 = 1/2 kap conj[phi2].phiX.conj[phi2].phiX;

LagNoHC = - Vpot1;
LagHC = Laglep + Lagquark1 + Lagquark2 - Vpot2 - Vpot3;
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[7],VWB[8],VWB[1],VWB[4]},{VP,VZ,VZp,VX,VY},ZZ},
  {{VWB[2],VWB[5],VWB[6],VWB[3]},{VWp,conj[VWp],VWpp,conj[VWpp]},ZW}
};     	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{
{phi10,  {vevk1, 1/Sqrt[2]}, {sigma1, \[ImaginaryI]/Sqrt[2]},{rho1, 1/Sqrt[2]}},
{phi20,  {0, 0}, {sigma2, \[ImaginaryI]/Sqrt[2]},{rho2, 1/Sqrt[2]}},
{phi20t, {vevn, 1/Sqrt[2]}, {sigma3, \[ImaginaryI]/Sqrt[2]},{rho3, 1/Sqrt[2]}},
{phi30,  {vevk3, -1/Sqrt[2]}, {sigma4, \[ImaginaryI]/Sqrt[2]},{rho4, 1/Sqrt[2]}},
{phi30t, {0, 0}, {sigma5, \[ImaginaryI]/Sqrt[2]},{rho5, 1/Sqrt[2]}},
{phiX0,  {0, 0}, {sigmaX, \[ImaginaryI]/Sqrt[2]},{rhoX, 1/Sqrt[2]}},
{phiX0t, {0, 0}, {sigmaXt, \[ImaginaryI]/Sqrt[2]},{rhoXt, 1/Sqrt[2]}}
    };

DEFINITION[EWSB][MatterSector]=   
  {
    {{rho1,rho3,rho4},{hh,ZH}},
    {{rho2,rho5},{hhd,ZHd}},
    {{sigma1,sigma3,sigma4},{Ah,ZA}},    
    {{sigma2,sigma5},{Ahd,ZAd}},
    {{phi1m,conj[phi3p]},{Hpm,ZP}},
    {{phi1mt,conj[phi2p]},{Hpmd,ZPd}},
    {{{dL, sL, bL, dpL, spL}, {conj[dR],conj[dtR]}}, {{FDL,Vd}, {FDR,Ud}}},
    {{{uL, cL, tL, tpL}, {conj[uR],conj[utR]}}, {{FUL,Vu}, {FUR,Uu}}},
    {{vL,NL,conj[sR]}, {FV, UV}},
    {{{eL}, {conj[eR]}}, {{FEL,Ve}, {FER,Ue}}}
  };

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  FV,  conj[FV]}};

DEFINITION[GaugeES][DiracSpinors]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  FuL, 0},
 Fu2 ->{  0, FuR},
 Fe1 ->{  FeL, 0},
 Fe2 ->{  0, FeR}};



