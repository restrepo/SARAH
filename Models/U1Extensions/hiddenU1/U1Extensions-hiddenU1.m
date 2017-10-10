Off[General::spell]


Model`Name = "hiddenU1";
Model`NameLaTeX ="hidden U(1) model";
Model`Authors = "F. Staub, M.E. Krauss";
Model`Date = "2015-12-27";


(* using the model introduced in 1512.07789 *)
(* underlying basic model: B-L-SM *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], chargeX,     gX, False};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2, 3, 0};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2, 1, 0};
FermionFields[[3]] = {d, 3, conj[dR], 1/3, 1, -3, 0};
FermionFields[[4]] = {u, 3, conj[uR],-2/3, 1, -3, 0};
FermionFields[[5]] = {e, 3, conj[eR],   1, 1,  1, 0};
FermionFields[[6]] = {xQL, 1, xqL,   2/3, 1,  3, 1};
FermionFields[[7]] = {xQR, 1, conj[xqR],   -2/3, 1,  -3, -1};





ScalarFields[[1]] = {H, 1, {H0, Hm},       -1/2, 2,  1,     0};
ScalarFields[[2]] = {s1,   1, S1,    0, 1, 1, 1};
ScalarFields[[3]] = {s2,   1, S2,    0, 1, 1, 0};

RealScalars={s2};

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}},
	{LagExtra, {AddHC->False}}
};

LagNoHC = -(muH2 conj[H].H + muS12 conj[s1].s1 + muS22 s2.s2
            - lamH conj[H].H.conj[H].H  - lamHS1 conj[H].H.conj[s1].s1 - lamHS2 conj[H].H.s2.s2
            - lamS1 conj[s1].s1.conj[s1].s1 - lamS2 s2.s2.s2.s2 - lamS1S2 conj[s1].s1.s2.s2
            - sigma1 s2.s2.s2    - sigma2 conj[H].H.s2   - sigma3 conj[s1].s1.s2            
             );

LagHC = - (+ Yd H.d.q + Ye H.e.l + Yu conj[H].u.q + YxL conj[s1].xQL.u  + Mxq xQL.xQR);

LagExtra = -( fX (s2.xQL.xQR + s2.conj[xQL].conj[xQR] ));
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {S1, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}},
     {S2, {vS2, 1}, {0,0},{phiS2, 1}}};
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiS,phiS2},{hh,ZH}},
     {{sigmaH,sigmaS},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL,xqL}, {conj[uR],conj[xqR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



