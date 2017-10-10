Off[General::spell]

Model`Name = "E6SSMalt";
Model`NameLaTeX ="E6SSMalt";
Model`Authors = "G.Hellwig, P.Diessner, P.Athron, A.Voigt";
Model`Date = "2014-03-10";

SetOptions[MakeAll,IncludeCalcHep->False,IncludeWHIZARD->False];

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],RParity};
RpM = {-1,-1,1};
RpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,RpM};
Gauge[[2]]={WB, SU[2], left,        g2,True, RpM};
Gauge[[3]]={G,  SU[3], color,       g3,False,RpM};
Gauge[[4]]={Bp,  U[1], Ncharge,    gN,False,RpM};

(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},     1/6, 2, 3, 1/Sqrt[40], RpM};  
SuperFields[[2]] = {l, 3, {vL,  eL},    -1/2, 2, 1, 2/Sqrt[40], RpM};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},   -1/2, 2, 1, -3/Sqrt[40], RpP};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},    1/2, 2, 1, -2/Sqrt[40], RpP};

SuperFields[[5]] = {d, 3, conj[dR],    1/3, 1, -3, 2/Sqrt[40], RpM};
SuperFields[[6]] = {u, 3, conj[uR],   -2/3, 1, -3, 1/Sqrt[40], RpM};
SuperFields[[7]] = {e, 3, conj[eR],      1, 1,  1, 1/Sqrt[40], RpM};
SuperFields[[8]] = {s, 1, sR,     0, 1,  1, 5/Sqrt[40], RpP};

SuperFields[[9]] = {H1I, 2, {H1I0, H1Im},  -1/2, 2, 1, -3/Sqrt[40], RpP};
SuperFields[[10]] = {H2I, 2, {H2Ip, H2I0},   1/2, 2, 1, -2/Sqrt[40], RpP};
SuperFields[[11]] = {sI, 1, sIR,    0, 1,  1, 5/Sqrt[40], RpP};

SuperFields[[12]] = {Dx, 3, DxL,  -1/3, 1, 3, -2/Sqrt[40], RpP};
SuperFields[[13]] = {Dxbar, 3, conj[DxbarR],  1/3, 1, -3, -3/Sqrt[40], RpP};

SuperFields[[14]] = {Hp, 1, {Hpd0, Hpdm},  -1/2, 2,  1, 2/Sqrt[40], RpP};
SuperFields[[15]] = {Hpbar, 1, {Hpup, Hpu0}, 1/2, 2,  1, -2/Sqrt[40], RpP};
SuperFields[[16]] = {sp, 1, spR,    0, 1,  1, 5/Sqrt[40], RpP};
NoU1Mixing=False;
AddMixedSofts = False;

(*------------------------------------------------------*)
(*Z2H exact Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Lambda] s.Hu.Hd + \[Lambda]p sp.Hu.Hd + \[Lambda]12 s.H2I.H1I + \[Lambda]p12 sp.H2I.H1I + \
+ \[Kappa] s.Dx.Dxbar + \[Kappa]p sp.Dx.Dxbar + \[Mu]Pr Hpbar.Hp + gQL Dx.q.q + gQR Dxbar.d.u;

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   ROTATIONS                                  *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
   {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};      
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  { {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
    {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
    {SsR,  {vs, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS,1/Sqrt[2]}},
    {SspR,  {vsp, 1/Sqrt[2]}, {sigmaSp, \[ImaginaryI]/Sqrt[2]},{phiSp,1/Sqrt[2]}}   
};


 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SvL}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{SDxL, SDxbarR}, {SDX, ZDX}},
     {{phid, phiu, phiS, phiSp}, {hh, ZH}},
     {{sigmad, sigmau, sigmaS, sigmaSp}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0, FsR, fBp, FspR}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}}, 
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}},
     {{{FDxL},{conj[FDxbarR]}},{{FDXL,ZDXL},{FDXR,ZDXR}}},
     {{SH1I0,conj[SH2I0]},{SHI0,UHI0}},
     {{SH1Im,conj[SH2Ip]},{SHIp,UHIp}},
     {{{FH1Im},{FH2Ip}},{{LmI,ZMI},{LpI,ZPI}}},
     {{FH1I0,FH2I0},{L0I,ZNI}},
     {{SHpd0,conj[SHpu0]},{SHp0,UHp0}},
     {{SHpdm,conj[SHpup]},{SHpp,UHpp}},
     {{FHpd0,FHpu0},{L0p,ZNp}}
}; 
       
DEFINITION[EWSB][Phases]= 
   {    {fG, PhaseGlu},
        {FsIR, PhaseS},
        {ChaP, PhaseFHpup}
}; 

DEFINITION[EWSB][DiracSpinors]={
 Fd -> {FDL, conj[FDR]},
 Fe -> {FEL, conj[FER]},
 Fu -> {FUL, conj[FUR]},
 Fv -> {FvL, 0},
 Chi -> {L0, conj[L0]},
 Cha -> {Lm, conj[Lp]},
 Glu -> {fG, conj[fG]},
 ChiI -> {L0I, conj[L0I]},
 ChaI -> {LmI, conj[LpI]},
 ChiP -> {L0p, conj[L0p]},
 ChaP -> {FHpdm, conj[FHpup]}, 
 FDX -> {FDXL, conj[FDXR]},
 FSI -> {FsIR, conj[FsIR]}
};	
