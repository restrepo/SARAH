Off[General::spell]
Print["Model file for the Omega Model (Regime-2) loaded"];

ModelName = "Omega";
ModelNameLaTeX ="Omega";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], bminl,       gBL,False};
Gauge[[2]]={WL, SU[2], left,        gL,True};
Gauge[[3]]={WR0, U[1], right,       gR,False};
Gauge[[4]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, qL,   1/6, 2, 0, 3};
Fields[[2]] = {conj[dR],  3, dR,  -1/6, 1, 1/2, -3};  
Fields[[3]] = {conj[uR],  3, uR,  -1/6, 1, -1/2, -3};  
Fields[[4]] = {{vL,  eL},  3, lL,  -1/2, 2, 0, 1};
Fields[[5]] = {conj[eR],  3, eR,  1/2, 1, 1/2, 1};
Fields[[6]] = {conj[vR],  3, vR,  1/2, 1, -1/2, 1};
Fields[[7]] = {{Hd0, Hdm}, 1, Hd, 0, 2, -1/2, 1};
Fields[[8]] = {{Hup, Hu0}, 1, Hu, 0, 2, 1/2, 1};
Fields[[9]] = {deltaR0,  1, deltaR0,  -1, 1, 1, 1};
Fields[[10]] = {deltaRbar0,  1, deltaRbar0,  1, 1, -1, 1};
Fields[[11]] = {{{omegaL0r2/Sqrt[2], omegaLp},{omegaLm, - \
omegaL0r2/Sqrt[2]}},  1, omegaL,  0, 3, 0, 1};
Fields[[12]] = {omegaR0,  1, omegaR0,  0, 1, 0, 1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)
      

SuperPotential = { {{1,Yu},{qL,uR,Hu}},
		   {{1,Yd},{qL,dR,Hd}},
		   {{1,Ye},{lL,eR,Hd}},
		   {{1,Yv},{lL,vR,Hu}},
		   {{1,fc1},{vR,deltaR0,vR}},
		   {{1,Mdeltac1},{deltaR0,deltaRbar0}},
		   {{1,Momega},{omegaL,omegaL}},
                   {{1,conj[Momega]},{omegaR0,omegaR0}},
                   {{1,ac1},{deltaR0,omegaR0,deltaRbar0}},
		   {{1,b},{omegaL,Hd,Hu}},
                   {{1,bc},{omegaR0,Hd,Hu}},
		   {{1,\[Mu]},{Hu,Hd}}   };
  

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
		  {Der[VWR0],  -1/(2 RXi[R])},
		  {Der[VB],   -1/(2 RXi[B])},
  		  {Der[VG],   -1/(2 RXi[G]) }	
											};


(* ----- After EWSB ----- *)


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{{VB, {1,{VBY,Cos[\[Xi]]},{VZ2, Sin[\[Xi]]}}},
 {VWR0, {1,{VBY, -Sin[\[Xi]]},{VZ2, Cos[\[Xi]]}}}};
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
  {{SomegaR0, {vR, 1/Sqrt[2]}, {sigmaOmR, \
\[ImaginaryI]/Sqrt[2]},{phiOmR,1/Sqrt[2]}},
  {SdeltaR0, {vBL, 1/Sqrt[2]}, {sigmaR, \
\[ImaginaryI]/Sqrt[2]},{phiR,1/Sqrt[2]}},
  {SdeltaRbar0, {vBL, 1/Sqrt[2]}, {sigmaRbar, \
\[ImaginaryI]/Sqrt[2]},{phiRbar,1/Sqrt[2]}}};

 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
  {  {{phiR, phiRbar, phiOmR}, {hhR2, ZH}},
     {{sigmaR, sigmaRbar, sigmaOmR}, {AhR2, ZP}},
     {{fB, fWR0, FdeltaR0, FdeltaRbar0, FomegaR0}, {L0, ZN}},
     {{FvL, conj[FvR]}, {N0, Znu}},
     {{SdL},{SDLr2,UDL}},
     {{SuL},{SULr2,UUL}},
     {{SdR},{SDRr2,UDR}},
     {{SuR},{SURr2,UUR}},
     {{SeL},{SELr2,UEL}},                    
     {{SeR},{SERr2,UER}},     
     {{SvL},{SVLr2,UVL}},
     {{SvR},{SVRr2,UVR}},
     {{SHd0,conj[SHu0]},{SH0r2,UH0}},
     {{SHdm,conj[SHup]},{SHCr2,UHC}}, 
     {{SomegaLp,conj[SomegaLm]},{SOmLpR2,UDLp}}
  };

(*--- Gauge Fixing ---- *)

DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VWL],                                              - 1/(2 RXi[L])},
        {Der[VZ2] - Mass[VZ2] RXi[Z2] AhR2[{1}],               - 1/(2 \
RXi[Z2])},		  
	{Der[VBY],                                              - 1/(2 RXi[Y])},
	{Der[VG],                                               - 1/(2 RXi[G])}
																	};


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd1r2,  FdL, 0};
dirac[[2]] = {Fd2r2,  0, FdR};
dirac[[3]] = {Fe1r2,  FeL, 0};
dirac[[4]] = {Fe2r2,  0, FeR};
dirac[[5]] = {Fu1r2,  FuL, 0};
dirac[[6]] = {Fu2r2,  0, FuR};
dirac[[7]] = {FvR2,  N0, conj[N0]};
dirac[[8]] = {ChiR2, L0, conj[L0]}; 
dirac[[9]] = {ChaR2, FomegaLm, conj[FomegaLp]};
dirac[[10]] = {GluR2, fG, conj[fG]}; 
dirac[[11]] = {BinoR2, fB, conj[fB]};
dirac[[12]] = {WinoLR2, fWL, conj[fWL]};
dirac[[13]] = {H0r2, FHd0, conj[FHu0]};
dirac[[14]] = {HCr2, FHdm, conj[FHup]};
dirac[[15]] = {Fomega0, FomegaL0r2, conj[FomegaL0r2]};



(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile=None;		

	



