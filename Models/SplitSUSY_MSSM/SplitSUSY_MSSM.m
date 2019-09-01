Off[General::spell]

Model`Name = "SplitMSSM";
Model`NameLaTeX ="Split SUSY version of MSSM";
Model`Authors = "F.Staub";
Model`Date = "2016-02-29";

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};

(* Matter fields *)

FermionFields[[1]] = {q, 3, {uL, dL},     1/6, 2,  3, 1};
FermionFields[[2]] = {l, 3, {vL, eL},    -1/2, 2,  1, 1};
FermionFields[[3]] = {d, 3, conj[dR],     1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],    -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],       1, 1,  1, 1};

FermionFields[[6]]  = {FG, 1, fG          ,   0  , 1, 8, -1};
FermionFields[[7]]  = {FW, 1, {{fW0/Sqrt[2],fWp},
                             {fWm,-fW0/Sqrt[2]}}, 0 , 3, 1, -1};
FermionFields[[8]]  = {FB, 1, fB          ,   0  , 1, 1, -1};
FermionFields[[9]]  = {Hd, 1, {FHd0, FHdm},  -1/2, 2, 1, -1};
FermionFields[[10]] = {Hu, 1, {FHup, FHu0},   1/2, 2, 1, -1};

ScalarFields[[1]]  = {H, 1, {Hp, H0},     1/2, 2,  1, 1};

(*----------------------------------------------*)
(*   ROTATIONS                                  *)
(*----------------------------------------------*)

NameOfStates = {GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput] = {
    {LagHC  , {AddHC->True }},
    {LagNoHC, {AddHC->False}}
};

LagNoHC = m2 conj[H].H - 1/2 \[Lambda] conj[H].H.conj[H].H;
LagHC = - Yd conj[H].d.q - Ye conj[H].e.l + Yu H.u.q \
  - MG/2 FG.FG - MW/2 FW.FW - MB/2 FB.FB - MuSplit Hu.Hd \
  - g2u conj[H].FW.Hu - g1u/Sqrt[2] conj[H].FB.Hu  + g2d H.FW.Hd - g1d/Sqrt[2] H.FB.Hd;

(* ----- After EWSB ----- *)

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] = {
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs] = {
    {H0, {v,1/Sqrt[2]}, {Ah,\[ImaginaryI]/Sqrt[2]}, {hh,1/Sqrt[2]}}
};

(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector] = {
    {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
    {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
    {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
    {{fB, fW0, FHd0, FHu0}, {L0, ZN}},
    {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}}
};

DEFINITION[EWSB][Phases] = {
    {fG, PhaseGlu}
};

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors] = {
    Fd -> {DL, conj[DR]},
    Fe -> {EL, conj[ER]},
    Fu -> {UL, conj[UR]},
    Fv -> {vL, 0},
    Chi -> {L0, conj[L0]},
    Cha -> {Lm, conj[Lp]},
    Glu -> {fG, conj[fG]}
};
