Off[General::spell]


Model`Name = "simpleU1";
Model`NameLaTeX ="simple U(1) model with exotic vectorlike SU(2)L doublet quarks";
Model`Authors = "F. Staub, M.E. Krauss";
Model`Date = "2016-01-10";


(* using the model introduced in 1512.06426 *)
(* not including the dim. 5 operator for the decay of the lightest exotic quark *)

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
(* exotic VL quarks, el. charges: 5/3 and 2/3 *)
FermionFields[[6]] = {X1, 1, {x1u, x1d},   7/6, 2,  3, 1};
FermionFields[[7]] = {X1c, 1, {conj[x1uC], conj[x1dC]},   -7/6, -2,  -3, -1}; 
FermionFields[[8]] = {X2, 1, {x2u, x2d},   7/6, 2,  3, 2};
FermionFields[[9]] = {X2c, 1, {conj[x2uC], conj[x2dC]},   -7/6, -2,  -3, -2};




ScalarFields[[1]] = {H, 1, {H0, Hm},       -1/2, 2,  1,     0};
ScalarFields[[2]] = {SI,   1, si,    0, 1, 1, 1};



(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(muH2 conj[H].H + muS2 conj[SI].SI 
            - lamH conj[H].H.conj[H].H  - lamHS conj[H].H.conj[SI].SI 
            - lamS conj[SI].SI.conj[SI].SI 
             );

LagHC = - (+ Yd H.d.q + Ye H.e.l + Yu conj[H].u.q 
           + M1 X1c.X1 + M2 X2c.X2 + lam1 SI.X1.X2c + lam2 conj[SI].X2.X1c);

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {si, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiS},{hh,ZH}},
     {{sigmaH,sigmaS},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{x1d,x2d}, {conj[x1dC],conj[x2dC]}}, {{DXL,VXd}, {DXR,UXd}}},
     {{{x1u,x2u}, {conj[x1uC],conj[x2uC]}}, {{UXL,VXu}, {UXR,UXu}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][Phases]=
{    {UXR, PhaseU},
     {DXR, PhaseD}
    }; 

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 FXd ->{  DXL, conj[DXR]},
 FXu ->{  UXL, conj[UXR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



