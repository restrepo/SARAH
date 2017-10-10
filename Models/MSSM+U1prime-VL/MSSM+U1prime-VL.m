Off[General::spell]

Model`Name = "MSSMU1VL";
Model`NameLaTeX ="MSSM + U(1) and exotic fermions";
Model`Authors = "F.Staub, M.E. Krauss";
Model`Date = "2016-01-04";



(* Using the model proposed in 1207.2473 and used in 1512.09127 for explaining the diphoton excess *)



(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Global symmetries *)


Global[[1]] = {Z[2],MParity};
Global[[2]] = {Z[2],VLParity};
MpM = {-1,-1,1};
MpP = {1,1,-1};

(* Vector Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,  False , MpM, 1 };
Gauge[[2]]={WB, SU[2], left,        g2,  True ,  MpM, 1 };
Gauge[[3]]={G,  SU[3], color,       g3,  False , MpM, 1 };
Gauge[[4]]={Bp,  U[1], chargeX,     gX,  False , MpM, 1 };

(* Chiral Superfields *)

SuperFields[[1]] = {q, 3, {uL,  dL},    1/6, 2, 3,  1/2 , MpM, 1 };  
SuperFields[[2]] = {l, 3, {vL,  eL},   -1/2, 2, 1,  1/2 , MpM, 1 };
SuperFields[[3]] = {Hd,1, {Hd0, Hdm},  -1/2, 2, 1,   -1 , MpP, 1 };
SuperFields[[4]] = {Hu,1, {Hup, Hu0},   1/2, 2, 1,   -1 , MpP, 1 };

SuperFields[[5]] = {d, 3, conj[dR],   1/3, 1, -3,   1/2 , MpM, 1 };
SuperFields[[6]] = {u, 3, conj[uR],  -2/3, 1, -3,   1/2 , MpM, 1};
SuperFields[[7]] = {e, 3, conj[eR],     1, 1,  1,   1/2 , MpM, 1 };
SuperFields[[8]] = {vR,3, conj[vR],     0, 1,  1,   1/2 , MpM, 1 };

SuperFields[[9]]  =  {S,    1, s,    0, 1, 1,  2 , MpP, 1 };
SuperFields[[10]] =  {Sc,   1, sc,   0, 1, 1, -2 , MpP, 1 };
SuperFields[[11]] =  {S1,   1, s1,   0, 1, 1, -4 , MpP, 1 };
SuperFields[[12]] =  {S1c,  1, s1c,  0, 1, 1,  4 , MpP, 1 };
SuperFields[[13]] =  {S2,   1, s2,   0, 1, 1, -2 , MpP, 1 };

SuperFields[[14]] =  {T,    2, t,    2/3, 1,  3, -1 , MpM, -1 };
SuperFields[[15]] =  {Tc,   2, conj[tc],  -2/3, 1, -3, -1 , MpM, -1 };

SuperFields[[16]] =  {T3,    1, t3,   -1/3, 1,  3, -1 , MpM, -1 };
SuperFields[[17]] =  {T3c,   1, conj[t3c],   1/3, 1, -3, -1 , MpM , -1};

SuperFields[[18]] =  {D1,   2, {dp, d0},     1/2,  2, 1, -1 , MpM, -1 };
SuperFields[[19]] =  {Dc,  2, {conj[dcp], conj[dc0]},  -1/2,  -2, 1, -1 , MpM, -1 };

SuperFields[[20]] =  {X,   1, x,   1, 1, 1,  2 , MpM, -1};
SuperFields[[21]] =  {Xc,  1, conj[xc], -1, 1, 1,  2 , MpM, -1 };
SuperFields[[22]] =  {N,   1, n,   0, 1, 1,  2 , MpM, -1 };
SuperFields[[23]] =  {Nc,  1, conj[nc],  0, 1, 1,  2 , MpM, -1 };

NoU1Mixing = True;

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = Yu u.q.Hu - Yd d.q.Hd - Ye e.l.Hd + \[Lambda] S.Hu.Hd + Yv vR.l.Hu  + lamN S1.N.Nc + lamD S.D1.Dc + lamX S1.X.Xc + lamT S.Tc.T + lamT3 S.T3c.T3 + muS2 S.Sc + mu1S2 S1.S1c + mu2S2 S.S2 + kap2 Sc.S2.S1c + kap1 S.S.S1;

(* exclude for simplicity 
+ kap1 l.q.T3c + kap2 vR.u.T 
+ gamXc Hu.D1.Xc + gamNc Hd.D1.Nc + gamX Hd.Dc.X + gamN Hu.Dc.N 
*)

(* exclude for Z2 reasons: *)
(* YuP u.q.D1 - YdP d.q.Dc - YeP e.l.Dc + YvP vR.l.D1 *)

(*----------------------------------------------*)
(*   DEFINITION                                  *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


DEFINITION[GaugeES][DiracSpinors]={
  Bino ->{fB, conj[fB]},
  Wino -> {fWB, conj[fWB]},
  Glu -> {fG, conj[fG]},
(*  H0 -> {FHd0, conj[FHu0]},
  HC -> {FHdm, conj[FHup]},*)
  Fd1 -> {FdL, 0},
  Fd2 -> {0, FdR},
  Fu1 -> {FuL, 0},
  Fu2 -> {0, FuR},
  Fe1 -> {FeL, 0},
  Fe2 -> {0, FeR},
  Fv1 -> {FvL, 0},
  Fv2 -> {0, FvR},
(*  FC -> {FC10, conj[FC20]},*)
  FB -> {fBp, conj[fBp]}
};



(*--- Gauge Sector ---- *)



DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3],VBp},{VP,VZ,VZp},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW},
  {{fWB[1],fWB[2],fWB[3]},{fWm,fWp,fW0},ZfW}
};


       
(*--- VEVs ---- *)
        
          	
DEFINITION[EWSB][VEVs]=
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
     {Ss, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, 1/Sqrt[2]}},
     {Ssc, {vSc, 1/Sqrt[2]}, {sigmaSc, \[ImaginaryI]/Sqrt[2]},{phiSc, 1/Sqrt[2]}},
     {Ss1, {vS1, 1/Sqrt[2]}, {sigmaS1, \[ImaginaryI]/Sqrt[2]},{phiS1, 1/Sqrt[2]}},
     {Ss1c, {vS1c, 1/Sqrt[2]}, {sigmaS1c, \[ImaginaryI]/Sqrt[2]},{phiS1c, 1/Sqrt[2]}},
     {Ss2, {vS2, 1/Sqrt[2]}, {sigmaS2, \[ImaginaryI]/Sqrt[2]},{phiS2, 1/Sqrt[2]}},
     {SvL, {0, 0}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
     {SvR, {0, 0}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
     {Sd0,{0, 0}, {sigmad0, \[ImaginaryI]/Sqrt[2]},{phid0,1/Sqrt[2]}},
     {Sdc0, {0, 0}, {sigmad0c, \[ImaginaryI]/Sqrt[2]},{phid0c,1/Sqrt[2]}},
     {Sn, {0, 0}, {sigman, \[ImaginaryI]/Sqrt[2]},{phin,1/Sqrt[2]}},
     {Snc, {0, 0}, {sigmanc, \[ImaginaryI]/Sqrt[2]},{phinc,1/Sqrt[2]}}  };
 

 
(*--- Matter Sector ---- *)
 
 
DEFINITION[EWSB][MatterSector]={  {{SdL, SdR}, {Sd, ZD}},
     {{St3, St3c}, {SdV, ZDV}},
     {{SuL, SuR}, {Su, ZU}},
     {{St, Stc}, {SuV, ZUV}},
     {{SeL, SeR}, {Se, ZE}},
     {{conj[Sxc], conj[Sdcp], conj[Sx], conj[Sdp]}, {SeV, ZEV}},
     {{sigmaL, sigmaR}, {SvIm, ZVI}},
     {{conj[sigmad0], conj[sigmad0c], sigman, sigmanc}, {SvVI, ZVVI}},
     {{phiL, phiR}, {SvRe, ZVR}}, 
     {{conj[phid0], conj[phid0c], phin, phinc}, {SvVR, ZVVR}}, 
     {{phid, phiu, phiS, phiSc, phiS1, phiS1c, phiS2}, {hh, ZH}}, 
     {{sigmad, sigmau, sigmaS, sigmaSc, sigmaS1, sigmaS1c, sigmaS2}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0,fBp, Fs, Fsc, Fs1, Fs1c, Fs2}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{FvL,conj[FvR]},{Fvm,UV}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}},
     {{{Ft},{conj[Ftc]}},{{FTL,ZTL},{FTR,ZTR}}},
     {{{Fdp},{conj[Fdcp]}},{{FEPL,ZEPL},{FEPR,ZEPR}}},
     {{{Fd0},{conj[Fdc0]}},{{FNL,ZNL},{FNR,ZNR}}}
     }; 



DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu},
     {Ft3c, PhaseFt3c},
     {Fnc, PhaseFnc},
     {Fxc, PhaseFxc}
    }; 

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  FDL, conj[FDR]},
 Fe ->{  FEL, conj[FER]},
 Fu ->{  FUL, conj[FUR]},
 Fv ->{  Fvm, conj[Fvm]},
 FdV -> {Ft3, Ft3c},
 FuV -> {FTL, conj[FTR]}, 
 Fe1V -> {Fx, Fxc},
 Fe2V -> {FEPL, conj[FEPR]},
 Fn1V -> {Fn, Fnc},
 Fn2V -> {FNL, conj[FNR]},
 Chi ->{ L0, conj[L0]},
 Cha ->{ Lm, conj[Lp]},
 Glu ->{ fG, conj[fG]}
};	
