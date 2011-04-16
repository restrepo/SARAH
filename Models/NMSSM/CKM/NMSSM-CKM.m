Off[General::spell]
Print["Model file for the NMSSM (CKM) loaded"];

ModelName = "NMSSMCKM";
ModelNameLaTeX ="NMSSM (CKM)";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL0,  dL0},  3, q0,   1/6, 2, 3};  
Fields[[2]] = {{vL,  eL},  3, l,  -1/2, 2, 1};
Fields[[3]] = {{Hd0, Hdm}, 1, Hd, -1/2, 2, 1};
Fields[[4]] = {{Hup, Hu0}, 1, Hu,  1/2, 2, 1};

Fields[[5]] = {conj[dR0], 3, d0,  1/3, 1, -3};
Fields[[6]] = {conj[uR0], 3, u0, -2/3, 1, -3};
Fields[[7]] = {conj[eR], 3, e,    1, 1,  1};
Fields[[8]] = {sR, 1, s,    0, 1,  1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = { {{1, Yu0},{q0,Hu,u0}}, {{-1,Yd0},{q0,Hd,d0}},
                   {{-1,Ye},{l,Hd,e}}, 
                   {{1,\[Lambda]},{Hu,Hd,s}},
                   {{1/3,\[Kappa]},{s,s,s}}  };


(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,SCKM, EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};

(* SCKM *)

DEFINITION[SCKM][MatterSector]=   
    {{{SdL0}, {SdL, Vd}},
     {{SuL0}, {SuL, Vu}},
     {{SdR0}, {SdR, Ud}},
     {{SuR0}, {SuR, Uu}},
     {{AdL0}, {AdL, Vd}},
     {{AuL0}, {AuL, Vu}},
     {{AdR0}, {AdR, Ud}},
     {{AuR0}, {AuR, Uu}},
     {{{FdL0}, {FdR0}}, {{FdL,Vd}, {FdR,Ud}}},
     {{{FuL0}, {FuR0}}, {{FuL,Vu}, {FuR,Uu}}}};


(* ----- After EWSB ----- *)

DEFINITION[EWSB][GaugeSector]= 
{{VWB,{1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
      {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
      {3,{VP,Sin[ThetaW]},{VZ,Cos[ThetaW]}}},
 {VB, {1,{VP,Cos[ThetaW]},{VZ,-Sin[ThetaW]}}},
 {fWB,{1,{fWm,1/Sqrt[2]},{fWp,1/Sqrt[2]}},
      {2,{fWm,-\[ImaginaryI]/Sqrt[2]},{fWp,\[ImaginaryI]/Sqrt[2]}},
      {3,{fW0,1}}}};
        
        
 
DEFINITION[EWSB][VEVs]= 
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
\
1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
\
1/Sqrt[2]}},
     {SsR, {vS, 1/Sqrt[2]}, {sigmaS, \[ImaginaryI]/Sqrt[2]},{phiS, \
\
1/Sqrt[2]}}     };


 
DEFINITION[EWSB][MatterSector]= 

{    {{SdL, SdR}, {Sd, ZD}},
     {{SvL}, {Sv, ZV}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{phid, phiu, phiS}, {hh, ZH}},
     {{sigmad, sigmau,sigmaS}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0,FsR}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}}           
   }; 


DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VP],                                            - 1/(2 RXi[P])},	
	{Der[VWm]+\[ImaginaryI] Mass[VWm] RXi[W] Hpm[{1}],   - 1/(RXi[W])},
	{Der[VZ] - Mass[VZ] RXi[Z] Ah[{1}],                  - 1/(2 RXi[Z])},
	{Der[VG],                                            - 1/(2 RXi[G])}};


DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FdL, FdR};
dirac[[2]] = {Fe,  FEL, conj[FER]};
dirac[[3]] = {Fu,  FuL, FuR};
dirac[[4]] = {Fv,  FvL, 0};
dirac[[5]] = {Chi, L0, conj[L0]};
dirac[[6]] = {Cha, Lm, conj[Lp]};
dirac[[7]] = {Glu, fG, conj[fG]};
dirac[[8]] = {Bino, fB, conj[fB]};
dirac[[9]] = {Wino, fWB, conj[fWB]};
dirac[[10]] = {H0, FHd0, conj[FHu0]};
dirac[[11]] = {HC, FHdm, conj[FHup]};
dirac[[12]] = {S, FsR, conj[FsR]};

(* Unbroken EW *)

dirac[[13]] = {Fd1, FdL0, 0};
dirac[[14]] = {Fd2, 0, FdR0};
dirac[[15]] = {Fu1, FuL0, 0};
dirac[[16]] = {Fu2, 0, FuR0};
dirac[[17]] = {Fe1, FeL, 0};
dirac[[18]] = {Fe2, 0, FeR};


(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            
            *)
            
SpectrumFile= None;		

	



