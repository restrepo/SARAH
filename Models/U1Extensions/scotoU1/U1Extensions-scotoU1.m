Off[General::spell]


Model`Name = "scotoU1";
Model`NameLaTeX ="Combination of scotogenic and neutrino flavour dark matter model featuring a U(1)D";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-13";


(* using the model introduced in 1601.02609 *)
(* changed the U(1)_D charge of H' w.r.t. 1601.02609 as the Yukawa terms are not gauge invariant in that paper *)
(* also dropping lambda5 term as it's not gauge invariant *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Global[[1]]={Z[2], DMParity};

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};
Gauge[[4]]={Bp,  U[1], chargeX,     gX, False,1};




FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  0, 1};
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,  0, 1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3,  0, 1};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3,  0, 1};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1,  0, 1};
FermionFields[[6]] = {nu, 3, conj[vR],  0,   1,  1,  0, 1};

FermionFields[[7]] = {T1L, 1, t1L,           2/3,   1,   3,   -1, -1};
FermionFields[[8]] = {T1R, 1, conj[t1R],    -2/3,   1,  -3,    1, -1};
FermionFields[[9]] = {T2L, 1, t2L,           2/3,   1,   3,    1, -1};
FermionFields[[10]] = {T2R, 1, conj[t2R],    -2/3,   1,  -3,   -1, -1};
FermionFields[[11]] = {NL, 1, nL,               0,   1,   1,   -1, -1};
FermionFields[[12]] = {NR, 1, conj[nR],         0,   1,   1,    1, -1};


ScalarFields[[1]] = {H,    1, {Hp, H0},     1/2, 2, 1,   0, 1};
ScalarFields[[2]] = {SI,   1, si,             0, 1, 1,   2, 1}; 
ScalarFields[[3]] = {HP,   1, {HPp, HP0},   1/2, 2, 1,  -1, -1}; 

(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(-muH2 conj[H].H + muHP2 conj[HP].HP - muS2 conj[SI].SI 
            + lamH conj[H].H.conj[H].H + lamHP conj[HP].HP.conj[HP].HP + lamS conj[SI].SI.conj[SI].SI 
            + lamHS conj[SI].SI.conj[H].H + lamHPS conj[SI].SI.conj[HP].HP 
            + lam3 conj[HP].HP.conj[H].H + lam4 conj[H].HP.conj[HP].H
           (* - lam5 (conj[H].HP.conj[H].HP + conj[HP].H.conj[HP].H) *)
             );

LagHC = - (+ Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q + Yv H.nu.l 
           + Yt HP.T1R.q + Yn HP.NR.l
           + mXT (T1R.T1L + T2R.T2L) + mXN NR.NL
           + eta1 SI.T2R.T1L + eta2 conj[SI].T1R.T2L + eta3 SI.conj[NR].NL
           );


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H0, {vH, 1/Sqrt[2]}, {sigmaH, \[ImaginaryI]/Sqrt[2]}, {phiH, 1/Sqrt[2]}},
     {si, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]}, {phiS, 1/Sqrt[2]}},
     {HP0, {vHP, 1/Sqrt[2]}, {sigmaHP, \[ImaginaryI]/Sqrt[2]}, {phiHP, 1/Sqrt[2]}}
     };
 

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiHP,phiS},{hh,ZH}},
     {{sigmaH,sigmaHP,sigmaS},{Ah,ZA}},
     {{conj[Hp],conj[HPp]},{Hm,ZP}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{t1L,t2L}, {conj[t1R],conj[t2R]}}, {{UVL,V1L}, {UVR,U1R}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{vL}, {conj[vR]}}, {{VL,ZNL},{VR,ZNR}}}(*,
     {{{nL}, {conj[nR]}}, {{VVL,V2L},{VVR,U2R}}}*)
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][Phases]=
{    {nR, PhaseN}
    }; 

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 FuV ->{  UVL, conj[UVR]},
 Fv ->{  VL, conj[VR]},
 FvV -> {nL, nR}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



