Off[General::spell]


Model`Name = "trickingLY";
Model`NameLaTeX ="sample of generic U(1) models using different U(1) assignments";
Model`Authors = "M.E. Krauss";
Model`Date = "2016-01-12";


(* using the model introduced in 1512.06833 *)


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={Bp,  U[1], chargeX,     gX, False};


(* ========================================================================= *)
(*
    === GENERIC ASSIGNMENTS: === 
    
    THE CHARGES {Y1, Y2, Y3} CAN BE
    {\pm 1/2, \pm 1, 0} OR {\pm 1/6, \pm 2/3, \mp 1/3}.
    THE ONLY REQUIREMENT ON Q1 AND Q2 IS Q1-Q2=-3.
    
    1512.06833, WORKS WITH U(1)_X CHARGES ONLY FOR THE THIRD-GENERATION QUARKS HERE.
    OF COURSE, THAT CANNOT INCORPORATE THE CKM MATRIX IN THIS SIMPLE REALIZATION. HENCE, 
    WE'LL WORK WITH FAMILY-UNIVERSAL U(1) CHARGES. fOR THIS PURPOSE, THE NEW FIELDS NEED TO HAVE THREE GENERATIONS.
    
    THE GENERIC ASSIGNMENTS OF THE NEW FIELDS ARE THE FOLLOWING (HERE THERE'S ONLY ONE GENERATION EACH)

     FermionFields[[10]] = {XL, 3, {x1L, x2L},                 Y1,   2,   1,   Q1};
     FermionFields[[11]] = {XR, 3, {conj[x1R], conj[x2R]},    -Y1,  -2,   1,  -Q2};
     FermionFields[[12]] = {RL, 3, rL,          Y2,   1,  1,  Q2};
     FermionFields[[13]] = {RR, 3, conj[rR],   -Y2,   1,  1, -Q1};
     FermionFields[[14]] = {XIL, 3, xiL,        Y3,   1,  1,  Q2};
     FermionFields[[15]] = {XIR, 3, conj[xiR], -Y3,   1,  1, -Q1};
     ScalarFields[[1]] = {H,    1, {H0, Hm},    -1/2, 2, 1,   0};
     ScalarFields[[2]] = {SI,   1, si,             0, 1, 1,  Q1-Q2}; 
*)

(* ========================================================================= *)
(* SPECIFIC REALIZATION: USING {Y1, Y2, Y3} = {1/2, 1, 0}, THREE GENERATIONS *) 


FermionFields[[1]] = {q, 3, {uL, dL},   1/6, 2,  3,  1};
FermionFields[[2]] = {l, 3, {vL, eL},  -1/2, 2,  1,  0};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, -1};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, -1};
FermionFields[[5]] = {e, 3, conj[eR],   1,   1,  1,  0};
FermionFields[[6]] = {nu, 3, conj[vR],  0,   1,  1,  0};

FermionFields[[7]] = {XL, 3, {x1L, x2L},                 1/2,   2,   1,   -3+U1QX};
FermionFields[[8]] = {XR, 3, {conj[x1R], conj[x2R]},    -1/2,  -2,   1,  -U1QX};
FermionFields[[9]] = {RL, 3, rL,          1,   1,  1,   U1QX};
FermionFields[[10]] = {RR, 3, conj[rR],   -1,   1,  1, 3-U1QX};
FermionFields[[11]] = {XIL, 3, xiL,        0,   1,  1,  U1QX};
FermionFields[[12]] = {XIR, 3, conj[xiR],  0,   1,  1, 3-U1QX};



ScalarFields[[1]] = {H,    1, {H0, Hm},    -1/2, 2, 1,   0};
ScalarFields[[2]] = {SI,   1, si,             0, 1, 1,  -3}; 


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(-muH2 conj[H].H - muS2 conj[SI].SI 
            + lamH conj[H].H.conj[H].H  + lamS conj[SI].SI.conj[SI].SI 
            + lamHS conj[SI].SI.conj[H].H
             );

LagHC = - (+ Yd H.d.q + Ye H.e.l + Yu conj[H].u.q + Yv conj[H].nu.l 
           + eta1 conj[SI].XR.XL + eta2 SI.RR.RL + eta3 SI.XIR.XIL
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
     {si, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}}
     };
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{phiH,phiS},{hh,ZH}},
     {{sigmaH,sigmaS},{Ah,ZA}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     (* VL fermions *)
     {{{x1L},{conj[x1R]}}, {{X1L,V1L}, {X1R,U1R}}},
     {{{x2L},{conj[x2R]}}, {{X2L,V2L}, {X2R,U2R}}},
     {{{rL},{conj[rR]}}, {{X3L,V3L}, {X3R,U3R}}},
     {{{xiL},{conj[xiR]}}, {{X4L,V4L}, {X4R,U4R}}},
     {{{vL}, {conj[vR]}}, {{VL,ZNL},{VR,ZNR}}}
};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fx1 ->{  X1L, conj[X1R]},
 Fx2 ->{  X2L, conj[X2R]},
 Fx3 ->{  X3L, conj[X3R]},
 Fx4 ->{  X4L, conj[X4R]},  
 Fv ->{  VL, conj[VR]}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



