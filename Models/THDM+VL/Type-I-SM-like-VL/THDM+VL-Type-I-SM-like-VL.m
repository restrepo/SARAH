Off[General::spell]

Model`Name = "THDMISMlikeVL";
Model`NameLaTeX ="Two Higgs Doublet Model I with 1 generation of SM-like vectorlike fermions";
Model`Authors = "F.Staub, M.E. Krauss";
Model`Date = "2016-01-01";

(* model as proposed in 1512.07497. *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

Global[[1]]={Z[2], VLParity};

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL,dL},     1/6, 2, 3, 1};  
FermionFields[[2]] = {l, 3, {vL,eL},    -1/2, 2, 1, 1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],     1, 1,  1, 1};

FermionFields[[6]] = {QVL, 1, {uV1L,dV1L},     1/6, 2, 3, -1};  
FermionFields[[7]] = {QVR, 1, {conj[uV1R],conj[dV1R]},     -1/6, -2, -3, -1};  
FermionFields[[8]] = {DVL, 1, dV2L,   -1/3, 1, 3, -1};
FermionFields[[9]] = {UVL, 1, uV2L,    2/3, 1, 3, -1};
FermionFields[[10]] = {DVR, 1, conj[dV2R],   1/3, 1, -3, -1};
FermionFields[[11]] = {UVR, 1, conj[uV2R],  -2/3, 1, -3, -1};

FermionFields[[12]] = {LVL, 1, {vV1L,eV1L},     -1/2, 2, 1, -1};  
FermionFields[[13]] = {LVR, 1, {conj[vV1R],conj[eV1R]},     1/2, -2, 1, -1};
FermionFields[[14]] = {EVL, 1, eV2L,    -1, 1, 1, -1};
FermionFields[[15]] = {VVL, 1, vV2L,     0, 1, 1, -1};
FermionFields[[16]] = {EVR, 1, conj[eV2R],   1, 1, 1, -1};
FermionFields[[17]] = {VVR, 1, conj[vV2R],   0, 1, 1, -1};


ScalarFields[[1]] =  {H1, 1, {H1p, H10},     1/2, 2,  1, 1};
ScalarFields[[2]] =  {H2, 1, {H2p, H20},     1/2, 2,  1, 1};


     


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, { AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};


LagNoHC = -(M112 conj[H1].H1 + M222 conj[H2].H2 + Lambda1 conj[H1].H1.conj[H1].H1 + \
		Lambda2 conj[H2].H2.conj[H2].H2 + Lambda3 conj[H2].H2.conj[H1].H1 + Lambda4 conj[H2].H1.conj[H1].H2 );


LagHC = -(M12 conj[H1].H2 + Lambda5/2 conj[H2].H1.conj[H2].H1  + Yd conj[H2].d.q + Ye conj[H2].e.l + Yu H2.u.q 
          + YdVL conj[H1].DVR.QVL + YdVR H1.DVL.QVR + YuVL H2.UVR.QVL + YuVR conj[H2].UVL.QVR
          + MQV QVR.QVL + MdV DVL.DVR + MuV UVL.UVR
          + YeVL conj[H1].EVR.LVL + YeVR H1.EVL.LVR + YvVL H2.VVR.LVL + YvVR conj[H2].VVL.LVR
          + MLV LVR.LVL + MeV EVL.EVR + MvV VVL.VVR
          );

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H10, {v1, 1/Sqrt[2]}, {sigma1, \[ImaginaryI]/Sqrt[2]},{phi1, 1/Sqrt[2]}},
     {H20, {v2, 1/Sqrt[2]}, {sigma2, \[ImaginaryI]/Sqrt[2]},{phi2, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    { {{phi1, phi2}, {hh, ZH}},
      {{sigma1, sigma2}, {Ah, ZA}},
      {{conj[H1p],conj[H2p]},{Hm,ZP}},
      {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
      {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
      (* Vector-like quarks *)
      {{{dV1L, dV2L}, {conj[dV1R], conj[dV2R]}}, {{DVL,VdV}, {DVR,UdV}}},
      {{{uV1L, uV2L}, {conj[uV1R], conj[uV2R]}}, {{UVL,VuV}, {UVR,UuV}}},
            (* Vector-like leptons *)
      {{{eV1L, eV2L}, {conj[eV1R], conj[eV2R]}}, {{EVL,VlV}, {EVR,UlV}}},
      {{{vV1L, vV2L}, {conj[vV1R], conj[vV2R]}}, {{VVL,VvV}, {VVR,UvV}}},
      (* leptons *)
      {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}       };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)


DEFINITION[EWSB][Phases]=
{    {DVR, PhaseD},
     {UVR, PhaseU},
     {EVR, PhaseE},
     {VVR, PhaseV}
    }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 FdV ->{  DVL, conj[DVR]},
 FuV ->{  UVL, conj[UVR]},
 FeV ->{  EVL, conj[EVR]},
 FvV ->{  VVL, conj[VVR]},
 Fv ->{  vL, 0}};

DEFINITION[EWSB][GaugeES]={
 Fd1 ->{  FdL, 0},
 Fd2 ->{  0, FdR},
 Fu1 ->{  Fu1, 0},
 Fu2 ->{  0, Fu2},
 Fe1 ->{  Fe1, 0},
 Fe2 ->{  0, Fe2}};



