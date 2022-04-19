Off[General::spell]

Model`Name = "MulticompSFDFDS";
Model`NameLaTeX = "Multicomponent DM SFDFDS";
Model`Authors = "A. Rivera (based on F.Staub, A. Vicente works)";
Model`Date = "2018-10-25";

(* 25-10-2018: First version *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global Symmetries *)
Global[[1]] = {Z[2], Z2};
Global[[2]] = {Z[2], Z22};

(*--------------Gauge Groups-----------------*)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1,1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1,1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1,1};

(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL, dL},    1/6, 2,  3,1,1};  
FermionFields[[2]] = {l, 3, {vL,  eL},  -1/2, 2,  1,1,1};
FermionFields[[3]] = {d, 3, conj[dR],    1/3, 1, -3,1,1};
FermionFields[[4]] = {u, 3, conj[uR],   -2/3, 1, -3,1,1};
FermionFields[[5]] = {e, 3, conj[eR],      1, 1,  1,1,1};

FermionFields[[6]] = {n, 1, conj[nR],       0, 1,  1,-1,1};
FermionFields[[7]] = {rd, 1, {vd, ed},   -1/2, 2,  1,-1,1};
FermionFields[[8]] = {ru, 1, {-eu,vu},     1/2, 2,  1,-1,1};


ScalarFields[[1]] = {H,    1,{Hp, H0},                           1/2, 2, 1,1,1};
ScalarFields[[2]] = {Et, 1, {etp,et0},    1/2, 2,  1, 1,-1};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}},
	{LagEt    ,      {AddHC->False}},
        {LagHEt   ,      {AddHC->False}},
        {LagHEtHC ,      {AddHC->True}},
        {Lagsinglet , {AddHC->True}},
        {Lagdoublet , {AddHC->True}}

};

LagNoHC = -(-mu2 conj[H].H + 1/2 LH conj[H].H.conj[H].H );

LagHC = - (Yd conj[H].d.q + Ye conj[H].e.l + Yu H.u.q );
			  		  
LagEt = -(+ mEt2 conj[Et].Et  + 1/2 lambda2 conj[Et].Et.conj[Et].Et );
LagHEt   = -(+ lambda3 conj[H].H.conj[Et].Et + lambda4 conj[H].Et.conj[Et].H );
LagHEtHC = -(+ 1/2 lambda5 conj[H].Et.conj[H].Et );

Lagsinglet = - Mn n.n/2  ;
Lagdoublet =  - MDF rd.ru  - YR1 H.n.rd - YR2 conj[H].n.ru ;
			  		  
(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
                
             
(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{     {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}},
      {et0, {0, 0}, {etI, \[ImaginaryI]/Sqrt[2]}, {etR, 1/Sqrt[2]}}
    }; 
 

DEFINITION[EWSB][MatterSector]=   
    {
     {{{dL}, {conj[dR]}}, {{FDL,Vd}, {FDR,Ud}}},
     {{{uL}, {conj[uR]}}, {{FUL,Vu}, {FUR,Uu}}},
     {{{eL}, {conj[eR]}}, {{FEL,Ve}, {FER,Ue}}},     
     {{conj[nR], vd, vu}, {Rv0, ZvN}},
     {{vL}, {VL, Vv}}
    };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  VL, conj[VL]}, 
 Fre ->{ ed, conj[eu] },
 Nv0 ->{ Rv0, conj[Rv0]}
};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



