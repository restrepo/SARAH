Off[General::spell]
Print["Model file for the MSSM with bilinear RpV and no FV loaded"];

ModelName = "MSSMBiRpVNoFV";
ModelNameLaTeX ="MSSM-BiRpV without Flavor violation";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, q,   1/6, 2, 3};  
Fields[[2]] = {{vL,  eL},  3, l,  -1/2, 2, 1};
Fields[[3]] = {{Hd0, Hdm}, 1, Hd, -1/2, 2, 1};
Fields[[4]] = {{Hup, Hu0}, 1, Hu,  1/2, 2, 1};

Fields[[5]] = {conj[dR], 3, d,  1/3, 1, -3};
Fields[[6]] = {conj[uR], 3, u, -2/3, 1, -3};
Fields[[7]] = {conj[eR], 3, e,    1, 1,  1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = { {{1, Yu},{q,Hu,u}}, {{-1,Yd},{q,Hd,d}},
                   {{-1,Ye},{l,Hd,e}}, {{1,\[Mu]},{Hu,Hd}},
                   {{1,\[Epsilon]},{l,Hu}}};
                   
               


(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

RParityConservation = False;
IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   DEFINITION                                  *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{{VWB,{1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
      {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
      {3,{VP,Sin[ThetaW]},{VZ,Cos[ThetaW]}}},
 {VB, {1,{VP,Cos[ThetaW]},{VZ,-Sin[ThetaW]}}},
 {fWB,{1,{fWm,1/Sqrt[2]},{fWp,1/Sqrt[2]}},
      {2,{fWm,-\[ImaginaryI]/Sqrt[2]},{fWp,\[ImaginaryI]/Sqrt[2]}},
      {3,{fW0,1}}}};
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
1/Sqrt[2]}},
     {SvL, {vL, 1/Sqrt[2]}, {sigmaL, \[ImaginaryI]/Sqrt[2]},{phiL, \
1/Sqrt[2]}}     };


DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 

 
DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{phid, phiu,phiL}, {hh, ZH}},
     {{sigmad, sigmau,sigmaL}, {Ah, ZA}},
     {{SHdm,conj[SHup],SeL,SeR},{Hpm,ZP}},
     {{FvL,fB, fW0, FHd0, FHu0}, {L0, ZN}}, 
     {{{FeL,fWm, FHdm}, {conj[FeR],fWp, FHup}},  {{Lm,UM}, {Lp,UP}}}
       }; 


(*--- Gauge Fixing ---- *)

DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VP],                                            - 1/(2 RXi[P])},	
	{Der[VWm]+\[ImaginaryI] Mass[VWm] RXi[W] Hpm[{1}],   - 1/(RXi[W])},
	{Der[VZ] - Mass[VZ] RXi[Z] Ah[{1}],                  - 1/(2 RXi[Z])},
	{Der[VG],                                            - 1/(2 RXi[G])}};

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FdL, FdR};
dirac[[2]] = {Fu,  FuL, FuR};
dirac[[3]] = {Chi, L0, conj[L0]}; 
dirac[[4]] = {Cha, Lm, conj[Lp]};
dirac[[5]] = {Glu, fG, conj[fG]}; 


(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile= None;		

	


