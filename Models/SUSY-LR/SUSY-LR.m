Off[General::spell]
Print["Model file for the SUSY-LR loaded"];

ModelName = "SUSYLR";
ModelNameLaTeX ="SUSY-LR";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False};
Gauge[[2]]={WL, SU[2], left,        gL,True};
Gauge[[3]]={WR, SU[2], right,       gR,True};
Gauge[[4]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, qL,   1/6, 2, 1, 3};
Fields[[2]] = {{conj[uR],  conj[dR]},  3, qR,  -1/6, 1, 2, -3};  
Fields[[3]] = {{vL,  eL},  3, lL,  -1/2, 2, 1, 1};
Fields[[4]] = {{conj[vR],  conj[eR]},  3, lR,  1/2, 1, 2, 1};
Fields[[5]] = {{{Hd0, Hup},{Hdm, Hu0}}, 1, Phi, 0, 2, -2, 1};
Fields[[6]] = {{{deltaLp/Sqrt[2], deltaLpp},{deltaL0, - deltaLp/Sqrt[2]}},  1, deltaL,  1, 3, 1, 1};
Fields[[7]] = {{{deltaLbarm/Sqrt[2], deltaLbar0},{deltaLbarmm, - deltaLbarm/Sqrt[2]}},  1, deltaLbar,  -1, 3, 1, 1};
Fields[[8]] = {{{-deltaRm/Sqrt[2], -deltaR0},{-deltaRmm, deltaRm/Sqrt[2]}},  1, deltaR,  -1, 1, 3, 1};
Fields[[9]] = {{{-deltaRbarp/Sqrt[2], -deltaRbarpp},{-deltaRbar0, - deltaRbarp/Sqrt[2]}},  1, deltaRbar,  1, 1, 3, 1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)
      
SuperPotential = { {{1, YQ},{qL,qR,Phi}}, {{1,YL},{lL,lR,Phi}}, 
		   {{I,f,epsTensor[lef1,lef2] epsTensor[lef2b,lef3]},{lL,deltaL,lL}},
		   {{I,conj[f], epsTensor[rig1,rig2] epsTensor[rig2b,rig3]},{lR,deltaR,lR}}, 
		   {{1,M},{deltaL,deltaLbar}}, {{1,conj[M]},{deltaR,deltaRbar}},
		   {{-1/2,\[Mu]},{Phi,Phi}}  };
  

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWL],  -1/(2 RXi[L])},
		  {Der[VWR],  -1/(2 RXi[R])},
  		  {Der[VG],   -1/(2 RXi[G]) }	
											};

(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{{VWL,{1,{VW1m,1/Sqrt[2] Cos[\[Eta]]},{conj[VW1m],1/Sqrt[2] Cos[\[Eta]]},
         {VW2m,-1/Sqrt[2] Sin[\[Eta]]},{conj[VW2m],-1/Sqrt[2] Sin[\[Eta]]}},
      {2,{VW1m,-\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]},{conj[VW1m],\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]},
         {VW2m,\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]},{conj[VW2m],-\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]}},
      {3,{VP,Sin[ThetaW]},{VZ1,Cos[ThetaW] Cos[\[Xi]]},{VZ2,- Cos[ThetaW] Sin[\[Xi]]}}},
 {VWR,{1,{VW1m,1/Sqrt[2] Sin[\[Eta]]},{conj[VW1m],1/Sqrt[2] Sin[\[Eta]]},
         {VW2m,1/Sqrt[2] Cos[\[Eta]]},{conj[VW2m],1/Sqrt[2] Cos[\[Eta]]}},
      {2,{VW1m,-\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]},{conj[VW1m],\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]},
         {VW2m,-\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]},{conj[VW2m],\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]}},
      {3,{VP,Sin[ThetaW]},{VZ1,Sqrt[Cos[2 ThetaW]] Sin[\[Xi]]/Cos[ThetaW] - Cos[\[Xi]] Sin[ThetaW] Tan[ThetaW]},
         {VZ2,Cos[ThetaW] Sqrt[Cos[2 ThetaW]] Cos[\[Xi]] + Sin[ThetaW] Tan[ThetaW](Sin[\[Xi]] + Cos[\[Xi]]Sqrt[Cos[2 ThetaW]])}}},
 {VB, {1,{VP,Sqrt[Cos[2 ThetaW]]},{VZ1,- Tan[ThetaW](Sin[\[Xi]] + Cos[\[Xi]]Sqrt[Cos[2 ThetaW]])},
         {VZ2,Tan[ThetaW](Sin[\[Xi]] Sqrt[Cos[2 ThetaW]] - Cos[\[Xi]])}}},
 {fWL,{1,{fW1m,1/Sqrt[2] Cos[\[Eta]]},{fW1p,1/Sqrt[2] Cos[\[Eta]]},
         {fW2m,-1/Sqrt[2] Sin[\[Eta]]},{fW2p,-1/Sqrt[2] Sin[\[Eta]]}},
      {2,{fW1m,-\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]},{fW1p,\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]},
         {fW2m,\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]},{fW2p,-\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]}},
      {3,{fWL0,1}}},
 {fWR,{1,{fW1m,1/Sqrt[2] Sin[\[Eta]]},{fW1p,1/Sqrt[2] Sin[\[Eta]]},
         {fW2m,1/Sqrt[2] Cos[\[Eta]]},{fW2p,1/Sqrt[2] Cos[\[Eta]]}},
      {2,{fW1m,-\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]},{fW1p,\[ImaginaryI]/Sqrt[2] Sin[\[Eta]]},
         {fW2m,-\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]},{fW2p,\[ImaginaryI]/Sqrt[2] Cos[\[Eta]]}},
      {3,{fWR0,1}}}};
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SdeltaR0, {vR, 1/Sqrt[2]}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SdeltaRbar0, {vRbar, 1/Sqrt[2]}, {sigmaRbar, \[ImaginaryI]/Sqrt[2]},{phiRbar,1/Sqrt[2]}},
   {SdeltaL0, {vL, 1/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SdeltaLbar0, {vLbar, 1/Sqrt[2]}, {sigmaLbar, \[ImaginaryI]/Sqrt[2]},{phiLbar,1/Sqrt[2]}}};


(* -- with R-parity violation -- *)

(* DEFINITION[EWSB][VEVs]= 
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid,1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu,1/Sqrt[2]}},
   {SdeltaR0, {vR, 1/Sqrt[2]}, {sigmaR, \[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
   {SdeltaRbar0, {vRbar, 1/Sqrt[2]}, {sigmaRbar, \[ImaginaryI]/Sqrt[2]},{phiRbar,1/Sqrt[2]}},
   {SdeltaL0, {vL, 1/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL,1/Sqrt[2]}},
   {SdeltaLbar0, {vLbar, 1/Sqrt[2]}, {sigmaLbar, \[ImaginaryI]/Sqrt[2]},{phiLbar,1/Sqrt[2]}},
   {SvL, {vnuL, 1/Sqrt[2]}, {sigmanuL, \[ImaginaryI]/Sqrt[2]},{phinuL,1/Sqrt[2]}},
   {SvR, {vnuR, 1/Sqrt[2]}, {sigmanuR, \[ImaginaryI]/Sqrt[2]},{phinuR,1/Sqrt[2]}}}; *)

 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiR, phiRbar, phiL, phiLbar}, {hh, ZH}},
     {{sigmad, sigmau, sigmaR, sigmaRbar, sigmaL, sigmaLbar}, {Ah, ZP}},
     {{SHdm, conj[SHup], SdeltaRm, conj[SdeltaRbarp], conj[SdeltaLp], SdeltaLbarm},{Hpm,ZC}},
     {{SdeltaRmm, conj[SdeltaRbarpp], conj[SdeltaLpp], SdeltaLbarmm},{Hppmm,ZC2}},
     {{fB, fWL0, fWR0, FHd0, FHu0, FdeltaR0, FdeltaRbar0, FdeltaL0, FdeltaLbar0}, {L0, ZN}}, 
     {{{fW1m, fW2m, FHdm, FdeltaRm, FdeltaLbarm}, {fW1p, fW2p, FHup, FdeltaRbarp, FdeltaLp}}, {{Lm,UM}, {Lp,UP}}},
     {{{FdeltaRmm, FdeltaLbarmm}, {FdeltaRbarpp, FdeltaLpp}}, {{Dmm,UMM}, {Dpp,UPP}}}};

(* -- with R-parity violation -- *)

(* DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{phid, phiu, phiR, phiRbar, phiL, phiLbar, phinuR, phinuL}, {hh, ZH}},
     {{sigmad, sigmau, sigmaR, sigmaRbar, sigmaL, sigmaLbar, sigmanuR, sigmanuL}, {Ah, ZP}},
     {{SHdm, conj[SHup], SdeltaRm, conj[SdeltaRbarp], conj[SdeltaLp], SdeltaLbarm, SeR, SeL},{Hpm,ZC}},
     {{fB, fWL0, fWR0, FHd0, FHu0, FdeltaR0, FdeltaRbar0, FdeltaL0, FdeltaLbar0, FvR, FvL}, {L0, ZN}}, 
     {{{fW1m, fW2m, FHdm, FdeltaRm, FdeltaLbarm, FeL}, {fW1p, fW2p, FHup, FdeltaRbarp, FdeltaLp, conj[FeR]}}, {{Lm,UM}, {Lp,UP}}}}; *)


(*--- Gauge Fixing ---- *)

DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VP],                                            - 1/(2 RXi[P])},	
	{Der[VW1m]+\[ImaginaryI] Mass[VW1m] RXi[W1] Hpm[{1}], - 1/(RXi[W1])},
        {Der[VW2m]+\[ImaginaryI] Mass[VW2m] RXi[W2] Hpm[{2}], - 1/(RXi[W2])},
	{Der[VZ1] - Mass[VZ1] RXi[Z1] Ah[{1}],                 - 1/(2 RXi[Z1])},
        {Der[VZ2] - Mass[VZ2] RXi[Z2] Ah[{2}],                 - 1/(2 RXi[Z2])},
	{Der[VG],                                            - 1/(2 RXi[G])}
																	};


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FdL, FdR};
dirac[[2]] = {Fe,  FeL, FeR};
dirac[[3]] = {Fu,  FuL, FuR};
dirac[[4]] = {Fv,  FvL, FvR};
dirac[[5]] = {Chi, L0, conj[L0]}; 
dirac[[6]] = {Cha, Lm, conj[Lp]};
dirac[[7]] = {Glu, fG, conj[fG]}; 
dirac[[8]] = {Bino, fB, conj[fB]};
dirac[[9]] = {WinoL, fWL, conj[fWL]};
dirac[[10]] = {WinoR, fWR, conj[fWR]};
dirac[[11]] = {Cha2, Dmm, conj[Dpp]};

dirac[[12]] = {H0, FHd0, conj[FHu0]};
dirac[[13]] = {HC, FHdm, conj[FHup]};
dirac[[14]] = {Fd1, FdL, 0};
dirac[[15]] = {Fd2, 0, FdR};
dirac[[16]] = {Fu1, FuL, 0};
dirac[[17]] = {Fu2, 0, FuR};
dirac[[18]] = {Fe1, FeL, 0};
dirac[[19]] = {Fe2, 0, FeR};
dirac[[20]] = {Fv1, FvL, 0};
dirac[[21]] = {Fv2, 0, FvR};
dirac[[22]] = {DeltaL1, FdeltaL0, conj[FdeltaLbar0]};
dirac[[24]] = {DeltaL2, FdeltaLp, conj[FdeltaLbarm]};
dirac[[25]] = {DeltaL3, FdeltaLpp, conj[FdeltaLbarmm]};
dirac[[26]] = {DeltaR1, FdeltaR0, conj[FdeltaRbar0]};
dirac[[27]] = {DeltaR2, FdeltaRm, conj[FdeltaRbarp]};
dirac[[28]] = {DeltaR3, FdeltaRmm, conj[FdeltaRbarpp]};


(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile=None;		

	


