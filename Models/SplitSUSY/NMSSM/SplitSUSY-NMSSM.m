Off[General::spell]

Model`Name = "SplitNMSSM";
Model`NameLaTeX ="Split SUSY version of NMSSM";
Model`Authors = "F.Staub, M. Gabelmann";
Model`Date = "2018-04-05";

(* Based on the SplitSUSY_MSSM model *)

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, 1};
Gauge[[2]]={WB, SU[2], left,        g2,True,  1};
Gauge[[3]]={G,  SU[3], color,       g3,False, 1};

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
FermionFields[[11]] = {Fs, 1, fS,               0, 1, 1, -1}

ScalarFields[[1]]  = {H, 1, {Hp, H0}, 1/2, 2,  1, 1};
ScalarFields[[2]]  = {Sr, 1, S0,         0, 1,  1, 1};
ScalarFields[[3]]  = {Si, 1, Sm,         0, 1,  1, 1};
RealScalars = {Sr,Si}
(*----------------------------------------------*)
(*   ROTATIONS                                  *)
(*----------------------------------------------*)

NameOfStates = {GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][LagrangianInput] = {
    {LagNoHC, {AddHC->False}},
    {LagHC  , {AddHC->True }}
};

LagNoHC = - m2 conj[H].H - 1/2 LambdaH conj[H].H.conj[H].H \
        - 1/2 mSr2 Sr.Sr - 1/2 mSi2 Si.Si \
        - 1/8 LambdaSr Sr.Sr.Sr.Sr - 1/8 LambdaSi Si.Si.Si.Si - 1/4 LambdaSri Sr.Sr.Si.Si \
        - 1/2 LambdaSHr Sr.Sr.conj[H].H - 1/2 LambdaSHi Si.Si.conj[H].H \
        - Sqrt[2] KappaSHr Sr.H.conj[H] \
        - 1/Sqrt[2] KappaSr Sr.Sr.Sr + 3/Sqrt[2] KappaSri Sr.Si.Si;

LagHC = - Yd conj[H].d.q - Ye conj[H].e.l + Yu H.u.q \
  - MG/2 FG.FG - MW/2 FW.FW - MB/2 FB.FB \
  - g2u conj[H].FW.Hu - g1u/Sqrt[2] conj[H].FB.Hu \
  + g2d H.FW.Hd - g1d/Sqrt[2] H.FB.Hd \
  - 1/Sqrt[2] Ysrud Sr.Hu.Hd - 1/Sqrt[2] \[ImaginaryI] Ysiud Si.Hu.Hd \
  + Ysu conj[H].Fs.Hu - Ysd H.Fs.Hd \
  - 1/Sqrt[2] Ysr Sr.Fs.Fs - \[ImaginaryI]/Sqrt[2] Ysi Si.Fs.Fs;


(* ----- After EWSB ----- *)

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] = {
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};

DEFINITION[EWSB][VEVs] = {
    {H0, {v,1/Sqrt[2]},  {sigmaH,\[ImaginaryI]/Sqrt[2]},  {phiH,1/Sqrt[2]}},
    {S0, {vS,1}, {0,0},                           {phiS,1}}
};

(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector] = {
    {{phiH,phiS}, {hh, ZH}},
    {{sigmaH, Sm}, {Ah, ZA}},
    {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
    {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
    {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
    {{fB, fW0, FHd0, FHu0, fS}, {L0, ZN}},
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
