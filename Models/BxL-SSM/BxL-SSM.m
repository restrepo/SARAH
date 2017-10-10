Off[General::spell]

Model`Name = "BxLSSM";
Model`NameLaTeX ="BxL-SSM";
Model`Authors = "F.Staub";
Model`Date = "2014-04-15";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)

Global[[1]] = {Z[2],MParity};
MpM = {-1,-1,1};
MpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,  False, MpM};
Gauge[[2]]={WB, SU[2], left,        g2,  True,  MpM};
Gauge[[3]]={G,  SU[3], color,       g3,  False, MpM};
Gauge[[4]]={Bp,  U[1], baryon,      gCB,  False, MpM};
Gauge[[5]]={Lp,  U[1], lepton,      gCL,  False, MpM};

(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},    1/6, 2, 3,  1/6,    0, MpM};  
SuperFields[[2]] = {l, 3, {vL,  eL},   -1/2, 2, 1,    0, -1/2, MpM};
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},  -1/2, 2, 1,    0,    0, MpP};
SuperFields[[4]] = {Hu,1, {Hup, Hu0},   1/2, 2, 1,    0,    0, MpP};

SuperFields[[5]] = {d, 3, conj[dR],   1/3, 1, -3, -1/6,     0, MpM};
SuperFields[[6]] = {u, 3, conj[uR],  -2/3, 1, -3, -1/6,     0, MpM};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1,    0,   1/2, MpM};
SuperFields[[8]] = {vR,3, conj[vR],     0, 1,  1,    0,   1/2, MpM};

SuperFields[[9]] =  {q4,1, {uL4,  dL4},    1/6, 2, 3,  B4,    0, MpM};  
SuperFields[[10]] = {d4, 1, conj[dR4],   1/3, 1, -3, -B4,     0, MpM};
SuperFields[[11]] = {u4, 1, conj[uR4],  -2/3, 1, -3, -B4,     0, MpM};

SuperFields[[12]] = {q5,1, {dL5,  uL5},  -1/6, 2, -3, -(1/2+B4),    0, MpM};  
SuperFields[[13]] = {d5, 1, conj[dR5],   -1/3, 1, 3, 1/2+B4,     0, MpM};
SuperFields[[14]] = {u5, 1, conj[uR5],    2/3, 1, 3, 1/2+B4,     0, MpM};


SuperFields[[15]] = {l4, 1, {vL4,  eL4},   -1/2, 2, 1,    0, L4, MpM};
SuperFields[[16]] = {e4, 1, conj[eR4],     1, 1,  1,    0,   -L4, MpM};
SuperFields[[17]] = {vR4,1, conj[vR4],     0, 1,  1,    0,   -L4, MpM};

SuperFields[[18]] = {l5, 1, {eL5,  vL5},   1/2, 2, 1,    0, -(3/2+L4), MpM};
SuperFields[[19]] = {e5, 1, conj[eR5],     -1, 1,  1,    0,   3/2+L4, MpM};
SuperFields[[20]] = {vR5,1, conj[vR5],     0, 1,  1,    0,   3/2+L4, MpM};


SuperFields[[21]]  = {p1B, 1, P1B,  0, 1, 1,  1/2, 0, MpP};
SuperFields[[22]]  = {p2B, 1, P2B,  0, 1, 1,  -1/2, 0, MpP};

SuperFields[[23]]  = {p1L, 1, P1L,  0, 1, 1,    0,  1, MpP};
SuperFields[[24]]  = {p2L, 1, P2L,  0, 1, 1,    0, -1, MpP};

SuperFields[[25]]  = {C1, 1, chi1,  0, 1, 1,    2/6 + B4, 0, MpP};
SuperFields[[26]]  = {C2, 1, chi2,  0, 1, 1,   -(2/6+B4), 0, MpP};



(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

WMSSM =  Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Mu] Hu.Hd + Yv vR.l.Hu + LambdaNu vR.vR.p2L;
WBaryon = LambdaQ q4.q5.p1B    + LambdaU u4.u5.p2B +  LambdaD d4.d5.p2B + MuB p1B.p2B + Yu4 q4.Hu.u4 + Yd4 q4.Hd.d4 + Yu5 q5.Hd.u5 + Yd5 q5.Hu.d5;
WLepton = Ye4 l4.Hd.e4 + Ynu4 l4.Hu.vR4 + Ye5 l5.Hu.e5 + Ynu5 l5.Hd.vR5 + MuL p1L.p2L;
Wchi = Lambda1 q.q5.C1 + Lambda2 u.u5.C2 + Lambda3 d.d5.C2 + MuX C1.C2;


SuperPotential = WMSSM + WBaryon + WLepton + Wchi;

NoU1Mixing=True;

(*----------------------------------------------*)
(*   DEFINITION                                  *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


DEFINITION[GaugeES][DiracSpinors]={
  Bino ->{fB, conj[fB]},
  Wino -> {fWB, conj[fWB]},
  Glu -> {fG, conj[fG]},
  H0 -> {FHd0, conj[FHu0]},
  HC -> {FHdm, conj[FHup]},
  Fd1 -> {FdL, 0},
  Fd2 -> {0, FdR},
  Fu1 -> {FuL, 0},
  Fu2 -> {0, FuR},
  Fe1 -> {FeL, 0},
  Fe2 -> {0, FeR},
  Fv1 -> {FvL, 0},
  Fv2 -> {0, FvR},
  FB -> {fBp, conj[fBp]}
};



(*--- Gauge Sector ---- *)



DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp, VLp},{VP,VZ,VZp, VZpp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};


       
(*--- VEVs ---- *)
        
          	
DEFINITION[EWSB][VEVs]= 
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
     {SvL, {0, 0}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
     {SvR, {0, 0}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
     {SvL4, {0, 0}, {sigmaL4, \[ImaginaryI]/Sqrt[2]},{phiL4,1/Sqrt[2]}},
     {SvL5, {0, 0}, {sigmaL5, \[ImaginaryI]/Sqrt[2]},{phiL5,1/Sqrt[2]}},
     {SvR4, {0, 0}, {sigmaR4, \[ImaginaryI]/Sqrt[2]},{phiR4,1/Sqrt[2]}},
     {SvR5, {0, 0}, {sigmaR5, \[ImaginaryI]/Sqrt[2]},{phiR5,1/Sqrt[2]}},
     {SP1B, {v1B, 1/Sqrt[2]}, {sigma1B, \[ImaginaryI]/Sqrt[2]},{phi1B, 1/Sqrt[2]}},
     {SP2B, {v2B, 1/Sqrt[2]}, {sigma2B, \[ImaginaryI]/Sqrt[2]},{phi2B, 1/Sqrt[2]}},
     {SP1L, {v1L, 1/Sqrt[2]}, {sigma1L, \[ImaginaryI]/Sqrt[2]},{phi1L, 1/Sqrt[2]}},
     {SP2L, {v2L, 1/Sqrt[2]}, {sigma2L, \[ImaginaryI]/Sqrt[2]},{phi2L, 1/Sqrt[2]}}  
};
 

 
(*--- Matter Sector ---- *)
 
 
DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},


     {{SdL4, SdR4, conj[SdL5], conj[SdR5]}, {Sdp, ZDp}},
     {{SuL4, SuR4, conj[SuL5], conj[SuR5]}, {Sup, ZUp}},
     {{SeL4, SeR4, conj[SeL5], conj[SeR5]}, {Sep, ZEp}},


     {{sigmaL,sigmaR}, {SvIm, ZVI}},
     {{phiL,phiR}, {SvRe, ZVR}}, 

     {{sigmaL4, sigmaR4, sigmaL5, sigmaR5}, {SvImp, ZVIp}},
     {{phiL4, phiR4, phiL5, phiR5}, {SvRep, ZVRp}}, 

     {{phid, phiu,phi1L, phi2L, phi1B, phi2B}, {hh, ZH}}, 
     {{sigmad, sigmau,sigma1L,sigma2L, sigma1B, sigma2B}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{Schi1,Schi2},{SX,ZC}},
     {{fB, fW0, FHd0, FHu0, fBp, fLp, FP1B, FP2B, FP1L, FP2L}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{FvL,conj[FvR]},{Fvm,UV}},

     {{FvL4, conj[FvR4], FvL5, conj[FvR5]},{Fvmp,UVp}},

     {{{FeL4,conj[FeL5]},{conj[FeR4],FeR5}}, {{FELp,ZELp},{FERp,ZERp}}},
     {{{FdL4,conj[FdL5]},{conj[FdR4],FdR5}}, {{FDLp,ZDLp},{FDRp,ZDRp}}},
     {{{FuL4,conj[FuL5]},{conj[FuR4],FuR5}}, {{FULp,ZULp},{FURp,ZURp}}},

     {{{FeL}, {conj[FeR] }},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL}, {conj[FdR] }},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL}, {conj[FuR] }},{{FUL,ZUL},{FUR,ZUR}}}                    
       }; 



DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  Fvm, conj[Fvm]},
 Fdp ->{  FDLp, conj[FDRp]},
 Fep ->{  FELp, conj[FERp]},
 Fup ->{  FULp, conj[FURp]},
 Fvp ->{  Fvmp, conj[Fvmp]},
 Chi ->{ L0, conj[L0]},
 FX ->{ Fchi1, conj[Fchi2]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};	
