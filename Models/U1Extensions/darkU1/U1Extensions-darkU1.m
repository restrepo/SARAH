Off[General::spell]


Model`Name = "darkU1";
Model`NameLaTeX ="dark U(1) sector with SM-VL fermions ";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-12";


(* using the model introduced in 1601.02490 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], chargeX,     gX, False};




(* THE GENERIC ASSIGNMENTS ARE, WITH ARBITRARY a,b: *)

FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  0};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,  0};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3,  0};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3,  0};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1,  0};
FermionFields[[6]] = {nu, 3, conj[vR],  0,   1,  1,  0};


FermionFields[[7]] = {DXL, 3, dXL,  -1/3, 1,  3,  U1Qa};
FermionFields[[8]] = {UXL, 3, uXL,   2/3, 1,  3, -U1Qa};
FermionFields[[9]] = {EXL, 3, eXL,  -1,   1,  1,  U1Qa};
FermionFields[[10]] = {NXL, 3, vXL,   0,   1,  1, -U1Qa};

FermionFields[[11]] = {DXR, 3, conj[dXR],   1/3, 1, -3,  U1Qb};
FermionFields[[12]] = {UXR, 3, conj[uXR],  -2/3, 1, -3, -U1Qb};
FermionFields[[13]] = {EXR, 3, conj[eXR],   1,   1,  1,  U1Qb};
FermionFields[[14]] = {NXR, 3, conj[vXR],   0,   1,  1, -U1Qb};


ScalarFields[[1]] = {H,    1, {H0, Hm},    -1/2, 2, 1,    0};
ScalarFields[[2]] = {Phi,  1, phi,            0, 1, 1,  U1Qa+U1Qb};
ScalarFields[[3]] = {XS,   1, xS,             0, 1, 1,    U1Qa};



(*  HERE WE WILL PROCEED WITH THE EXAMPLE a=b=1   *)
(*
FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  0};  
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,  0};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3,  0};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3,  0};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1,  0};
FermionFields[[6]] = {nu, 3, conj[vR],  0,   1,  1,  0};


FermionFields[[7]] = {DXL, 3, dXL,  -1/3, 1,  3,  1};
FermionFields[[8]] = {UXL, 3, uXL,   2/3, 1,  3, -1};
FermionFields[[9]] = {EXL, 3, eXL,  -1,   1,  1,  1};
FermionFields[[10]] = {NXL, 3, vXL,   0,   1,  1, -1};

FermionFields[[11]] = {DXR, 3, conj[dXR],   1/3, 1, -3,  1};
FermionFields[[12]] = {UXR, 3, conj[uXR],  -2/3, 1, -3, -1};
FermionFields[[13]] = {EXR, 3, conj[eXR],   1,   1,  1,  1};
FermionFields[[14]] = {NXR, 3, conj[vXR],   0,   1,  1, -1};


ScalarFields[[1]] = {H,    1, {H0, Hm},    -1/2, 2, 1,    0};
ScalarFields[[2]] = {Phi,  1, phi,            0, 1, 1,    2};
ScalarFields[[3]] = {XS,   1, xS,             0, 1, 1,    1};

*)

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(muH2 conj[H].H + muP2 conj[Phi].Phi + muX2 conj[XS].XS
            - lamH conj[H].H.conj[H].H  - lamP conj[Phi].Phi.conj[Phi].Phi - lamX conj[XS].XS.conj[XS].XS
            - lamHP conj[Phi].Phi.conj[H].H - lamHX conj[XS].XS.conj[H].H - lamPX conj[Phi].Phi.conj[XS].XS
             );

LagHC = - (+ Yd H.d.q + Ye H.e.l + Yu conj[H].u.q + Yv conj[H].nu.l 
           + YPE conj[Phi].EXR.EXL + YPN  Phi.NXR.NXL 
           + YPU Phi.UXR.UXL + YPD conj[Phi].DXR.DXL
           + YXE conj[XS].e.EXL + YXN XS.nu.NXL
           + YXU XS.u.UXL + YXD conj[XS].d.DXL
           );


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
     {xS, {vX, 1/Sqrt[2]}, {sigmaX, \[ImaginaryI]/Sqrt[2]},{phiX, 1/Sqrt[2]}},
     {phi, {vP, 1/Sqrt[2]}, {sigmaP, \[ImaginaryI]/Sqrt[2]},{phiP, 1/Sqrt[2]}}
     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiX,phiP},{hh,ZH}},
     {{sigmaH,sigmaX,sigmaP},{Ah,ZA}},
     {{{dL,dXL}, {conj[dR],conj[dXR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL,uXL}, {conj[uR],conj[uXR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL,eXL}, {conj[eR],conj[eXR]}}, {{EL,Ve}, {ER,Ue}}},
     {{vL,conj[vR],vXL,conj[vXR]}, {VL,ZM}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  VL, conj[VL]}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



