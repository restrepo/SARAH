Off[General::spell]
Print["Model file for the Omega Model (Regime-3) loaded"];

ModelName = "Omega";
ModelNameLaTeX ="Omega";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False};
Gauge[[2]]={WL, SU[2], left,        g2,True};
Gauge[[3]]={WR, SU[2], right,       g2,True};
Gauge[[4]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, qL,   1/6, 2, 1, 3};
Fields[[2]] = {{conj[dR], - conj[uR]},  3, qR,  -1/6, 1, 2, -3};  
Fields[[3]] = {{vL,  eL},  3, lL,  -1/2, 2, 1, 1};
Fields[[4]] = {{conj[eR],  - conj[vR]},  3, lR,  1/2, 1, 2, 1};
Fields[[5]] = {{{Hd0, Hup},{Hdm, Hu0}}, 2, Phi, 0, 2, -2, 1};
Fields[[6]] = {{{deltaLp/Sqrt[2], deltaLpp},{deltaL0, - deltaLp/Sqrt[2]}},  1, deltaL,  1, 3, 1, 1};
Fields[[7]] = {{{deltaLbarm/Sqrt[2], deltaLbar0},{deltaLbarmm, - deltaLbarm/Sqrt[2]}},  1, deltaLbar,  -1, 3, 1, 1};
Fields[[8]] = {{{deltaRm/Sqrt[2], deltaR0},{deltaRmm, - deltaRm/Sqrt[2]}},  1, deltaR,  -1, 1, 3, 1};
Fields[[9]] = {{{deltaRbarp/Sqrt[2], deltaRbarpp},{deltaRbar0, - deltaRbarp/Sqrt[2]}},  1, deltaRbar,  1, 1, 3, 1};
Fields[[10]] = {{{omegaL0/Sqrt[2], omegaLp},{omegaLm, - omegaL0/Sqrt[2]}},  1, omegaL,  0, 3, 1, 1};
Fields[[11]] = {{{omegaR0/Sqrt[2], omegaRp},{omegaRm, - omegaR0/Sqrt[2]}},  1, omegaR,  0, 1, 3, 1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)
      
SuperPotential = { {{1, YQ},{qL,qR,Phi}},
		   {{1,YL},{lL,lR,Phi}}, 
		   {{1,f},{lL,deltaL,lL}},
		   {{1,conj[f]},{lR,deltaR,lR}}, 
		   {{1,Mdelta},{deltaL,deltaLbar}},
		   {{1,conj[Mdelta]},{deltaR,deltaRbar}},
		   {{-1/2,Mu3},{Phi,Phi}},
                   {{1,Momega},{omegaL,omegaL}},
                   {{1,conj[Momega]},{omegaR,omegaR}},
                   {{1,a},{deltaL,omegaL,deltaLbar}},
                   {{1,conj[a]},{deltaR,omegaR,deltaRbar}},
                   {{1,AlphaOm},{omegaL,Phi,Phi}},
                  (* {{1,conj[AlphaOm], Delta[rig1b,rig2] epsTensor[lef2,lef3] epsTensor[rig1,rig3]},{omegaR,Phi,Phi}}  *) 
   {{1,conj[AlphaOm]},{omegaR,Phi,Phi}}};

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
		  {Der[VB],   -1/(2 RXi[B])},
  		  {Der[VG],   -1/(2 RXi[G]) }	
											};

(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{{VWR,{1,{VWRm,1/Sqrt[2]},{conj[VWRm],1/Sqrt[2]}},
      {2,{VWRm,-I/Sqrt[2]},{conj[VWRm],I/Sqrt[2]}},
      {3,{VWR0,1}}},
 {fWR,{1,{fWRm,1/Sqrt[2]},{fWRp,1/Sqrt[2]}},
      {2,{fWRm,-I/Sqrt[2]},{fWRp,I/Sqrt[2]}},
      {3,{fWR0,1}}}};
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SomegaR0, {vR, 1/Sqrt[2]}, {sigmaOmR, I/Sqrt[2]},{phiOmR,1/Sqrt[2]}}};

 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdeltaRm, conj[SdeltaRbarp]},{Hpm1R1,ZC1}},
     {{SomegaRm, conj[SomegaRp]},{Hpm2R1,ZC2}},
     {{fWR0, FomegaR0}, {L0, ZN}},
     {{{fWRm, FomegaRm}, {fWRp, FomegaRp}}, {{Lm,UM}, {Lp,UP}}},
     {{SdL},{SDLr1,UDL}},
     {{SuL},{SULr1,UUL}},
     {{SdR},{SDRr1,UDR}},
     {{SuR},{SURr1,UUR}},
     {{SeL},{SELr1,UEL}},                    
     {{SeR},{SERr1,UER}},     
     {{SvL},{SVLr1,UVL}},
     {{SvR},{SVRr1,UVR}},
     {{SHd0,conj[SHu0]},{SH0r1,UH0}},
     {{SHdm,conj[SHup]},{SHCr1,UHC}}, 
     {{SomegaLm,conj[SomegaLp]},{SO1r1,UO1}},
     {{SdeltaLp,conj[SdeltaLbarm]},{SDLpR1,UDLp}},
     {{SdeltaLpp,conj[SdeltaLbarmm]},{SDLppR1,UDLpp}},
     {{SdeltaL0,conj[SdeltaLbar0]},{SDL0r1,UDL0}},
     {{SdeltaRmm,conj[SdeltaRbarpp]},{SDRmmR1,UDRmm}},
     {{SdeltaR0,conj[SdeltaRbar0]},{SDR0r1,UDR0}}
      };


(*--- Gauge Fixing ---- *)

DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VWL],                                              - 1/(2 RXi[L])},
	{Der[VWRm]+\[ImaginaryI] Mass[VWRm] RXi[R] Hpm[{1}], - 1/(RXi[R])},
	{Der[VWR0],                                             - 1/(2 RXi[R0])},		  
	{Der[VB],                                               - 1/(2 RXi[B])},
	{Der[VG],                                               - 1/(2 RXi[G])}
																	};


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)


dirac[[1]] = {Fd1r1,  FdL, 0};
dirac[[2]] = {Fd2r1,  0, FdR};
dirac[[3]] = {Fe1r1,  FeL, 0};
dirac[[4]] = {Fe2r1,  0, FeR};
dirac[[5]] = {Fu1r1,  FuL, 0};
dirac[[6]] = {Fu2r1,  0, FuR};
dirac[[7]] = {FvR1,  N0, conj[N0]};
dirac[[8]] = {ChiR1, L0, conj[L0]}; 
dirac[[9]] = {Cha1r1, Lm, conj[Lp]};
dirac[[10]] = {GluR1, fG, conj[fG]}; 
dirac[[11]] = {BinoR1, fB, conj[fB]};
dirac[[12]] = {WinoLr1, fWL, conj[fWL]};
dirac[[13]] = {H0r1, FHd0, conj[FHu0]};
dirac[[14]] = {HCr1, FHdm, conj[FHup]};
dirac[[15]] = {Om1r1, FomegaL0, conj[FomegaL0]};
dirac[[16]] = {Om2r1, FomegaLm, conj[FomegaLp]};
dirac[[17]] = {DL1r1, FdeltaLp, conj[FdeltaLbarm]};
dirac[[18]] = {DL2r1, FdeltaLpp, conj[FdeltaLbarmm]};
dirac[[19]] = {DL3r1, FdeltaL0, conj[FdeltaLbar0]};
dirac[[20]] = {DR1r1, FdeltaR0, conj[FdeltaRbar0]};
dirac[[21]] = {DR2r1, FdeltaRm, conj[FdeltaRbarp]};
dirac[[22]] = {DR3r1, FdeltaRmm, conj[FdeltaRbarpp]};




(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile=None;		

	


