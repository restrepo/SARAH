Off[General::spell]


Model`Name = "BLVL";
Model`NameLaTeX ="U(1)B-L extension with unconventional B-L charges";
Model`Authors = "F. Staub, M.E. Krauss";
Model`Date = "2016-01-07";


(* last update: 2016-01-18: removed terms linear in chi2 because of assumed Z_3 symmetry in 1507.03943 *)
(* cross-check by: L. Basso *)
(* using the model introduced in 1601.00836 *)
(* which itself builds upon 1507.03943 *)
(* underlying basic model: B-L-SM *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], BminusL,     gBL, False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  1/3};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,   -1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, -1/3};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, -1/3};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1,    1};
FermionFields[[6]] = {v1, 1, conj[vR1], 0,   1,  1,   -5};
FermionFields[[7]] = {v23, 2, conj[vR23], 0,   1,  1,    4};

FermionFields[[8]] = {NL, 3, nL,           0,   1,  1,   -1};
FermionFields[[9]] = {NR, 3, conj[nR],     0,   1,  1,    1};

FermionFields[[10]] = {XL, 1, xL,        2/3,   1,  3,    3};
FermionFields[[11]] = {YL, 1, yL,       -2/3,   1,  3,   -3};
FermionFields[[12]] = {XR, 1, conj[xR], -2/3,   1,  -3,   0};
FermionFields[[13]] = {YR, 1, conj[yR],  2/3,   1,  -3,   0};



ScalarFields[[1]] = {H,      1, {H0, Hm},      -1/2, 2, 1, 0};
ScalarFields[[2]] = {Chi2,   1, chi2,             0, 1, 1, 2};
ScalarFields[[3]] = {Chi3,   1, chi3,             0, 1, 1, 3};
ScalarFields[[4]] = {Chi6,   1, chi6,            0, 1, 1, -6};




(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}},
	{LagExtra, {AddHC->True}}
};

LagNoHC = -(muH2 conj[H].H - mu22 conj[Chi2].Chi2 + mu32 conj[Chi3].Chi3 + mu62 conj[Chi6].Chi6
            - 1/2 lamH conj[H].H.conj[H].H  - 1/2 lam2 conj[Chi2].Chi2.conj[Chi2].Chi2 - 1/2 lam3 conj[Chi3].Chi3.conj[Chi3].Chi3 - 1/2 lam6 conj[Chi6].Chi6.conj[Chi6].Chi6
            - lamH2 conj[Chi2].Chi2.conj[H].H - lamH3 conj[Chi3].Chi3.conj[H].H - lamH6 conj[Chi6].Chi6.conj[H].H - lam23 conj[Chi2].Chi2.conj[Chi3].Chi3  - lam26 conj[Chi2].Chi2.conj[Chi6].Chi6
            - lam36 conj[Chi3].Chi3.conj[Chi6].Chi6 
             );

LagHC = - (+ Yd H.d.q + Ye H.e.l + Yu conj[H].u.q 
           + YNR conj[H].NR.l 
           + fX conj[Chi3].XR.XL + fY Chi3.YR.YL + fN conj[Chi3].v23.NL 
           + fNR conj[Chi2].NR.NR + fNL Chi2.NL.NL 
           + fN6 conj[Chi6].v1.NL 
            + mN NL.NR 
           );
           
LagExtra = (1/2 f36 Chi3.Chi3.Chi6 + 1/6 lam26P Chi2.Chi2.Chi2.Chi6);

			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {chi2, {v2, 1/Sqrt[2]}, {sigma2, \[ImaginaryI]/Sqrt[2]},{phi2, 1/Sqrt[2]}},
     {chi3, {v3, 1/Sqrt[2]}, {sigma3, \[ImaginaryI]/Sqrt[2]},{phi3, 1/Sqrt[2]}},
     {chi6, {v6, 1/Sqrt[2]}, {sigma6, \[ImaginaryI]/Sqrt[2]},{phi6, 1/Sqrt[2]}} 
     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phi2,phi3,phi6},{hh,ZH}},
     {{sigmaH,sigma2,sigma3,sigma6},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL,xL}, {conj[uR],conj[xR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{vL,conj[vR1],conj[vR23],nL,conj[nR]}, {VL,ZM}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][Phases]=
{    {yR, PhaseY}
    }; 

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 FuV -> {yL, yR},
 Fv ->{  VL, conj[VL]}};
 


 

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



