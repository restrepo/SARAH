

Off[General::spell]
Print["Model file for the SM loaded"];

ModelNameLaTeX ="Standard Model";


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

         
SuperPotential = { };
  

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={SdL, SdR,  SuL, SuR, SeL, SeR, SvL, 
                FHd0, FHdm, FHu0, FHup,
                fB, fWB, fG};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};
NoFTerms=True;
NoDTerms=True;

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};
  		  
DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->True, AddHC->True}},
	{LagNoHC,{Overwrite->True, AddHC->False}}
};

LagNoHC = Mu1 conj[SHd].SHd + Mu2 conj[SHu].SHu + Lambda1 conj[SHd].SHd.conj[SHd].SHd +
		Lambda2 conj[SHu].SHu.conj[SHu].SHu + Lambda3 conj[SHu].SHu.conj[SHd].SHd +
		Lambda5 conj[SHu].SHd.SHu.conj[SHd];

LagHC = Lambda5/2 conj[SHu].SHd.conj[SHu].SHd - Yd SHd.Fq.conj[FdR] -
			Ye SHd.Fl.conj[FeR] + Yu conj[SHd].Fq.conj[FuR];


(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{ {VWB, {1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
        {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
        {3,{VP, Sin[ThetaW]},{VZ, Cos[ThetaW]}}},
  {VB,  {1,{VP, Cos[ThetaW]},{VZ,-Sin[ThetaW]}}}                         };     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
1/Sqrt[2]}}     };
 
(* ---- Mixings ---- *)


DEFINITION[EWSB][MatterSector]= 
{    {{phid, phiu}, {hh, UH}},
     {{sigmad, sigmau}, {Ah, UA}},
     {{conj[SHup],SHdm},{Hpm,UP}}
           
 }; 


(*--- Gauge Fixing ---- *)


DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VP],                                            - 1/(2 RXi[P])},	
	{Der[VWm]+\[ImaginaryI] Mass[VWm] RXi[W] Hpm[{1}],   - 1/(RXi[W])},
	{Der[VZ] - Mass[VZ] RXi[Z] Ah[{1}],                  - 1/(2 RXi[Z])},
	{Der[VG],                                            - 1/(2 RXi[G])}};

 (* Re-Define Couplings *)
 

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FdL, FdR};
dirac[[2]] = {Fe,  FeL, FeR};
dirac[[3]] = {Fu,  FuL, FuR};
dirac[[4]] = {Fv,  FvL, 0};




(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile= None;		

	


