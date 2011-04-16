Off[General::spell]
Print["Model file for the SM (CKM) loaded"];

ModelName = "SMCKM";
ModelNameLaTeX ="Standard Model (CKM)";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL, dL},  3, q,   1/6, 2, 3};  
Fields[[2]] = {{vL,  eL},  3, l,  -1/2, 2, 1};
Fields[[3]] = {{H0, Hm}, 1, H,     -1/2, 2, 1};


Fields[[4]] = {conj[dR], 3, d,  1/3, 1, -3};
Fields[[5]] = {conj[uR], 3, u, -2/3, 1, -3};
Fields[[6]] = {conj[eR], 3, e,    1, 1,  1};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

         
SuperPotential = { };
NoDTerms = True; 


(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={SdL, SdR,  SuL, SuR, SeL, SeR, SvL, 
                FH0, FHm, fB, fWB, fG, aB, aWB, aG, 
                AdL, AdR, AuL, AuR, AeL, AeR, AvL, AHm, AH0};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};
  		  
  		  
  		  
DEFINITION[GaugeES][Additional]= {
	{LagHC, {Overwrite->True, AddHC->True}},
	{LagNoHC,{Overwrite->True, AddHC->False}}
};

LagNoHC = -(Mu conj[SH].SH + 1/24 \[Lambda] conj[SH].SH.conj[SH].SH);

LagHC = -(- Yd0 SH.Fq.conj[FdR] -	Ye SH.Fl.conj[FeR] + Yu0 conj[SH].Fq.conj[FuR]);
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector]= 
{ {VWB, {1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
        {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
        {3,{VP, Sin[ThetaW]},{VZ, Cos[ThetaW]}}},
  {VB,  {1,{VP, Cos[ThetaW]},{VZ,-Sin[ThetaW]}}}                         };     
        
        
     
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {SH0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{hh, 1/Sqrt[2]}}     };
 
(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]=   
    {{{{FdL}, {FdR}}, {{FDL,Vd}, {FDR,Ud}}},
     {{{FuL}, {FuR}}, {{FUL,Vu}, {FUR,Uu}}}};   



(*--- Gauge Fixing ---- *)


DEFINITION[EWSB][GaugeFixing]=
  {	{Der[VP],                                            - 1/(2 RXi[P])},	
	{Der[VWm]+\[ImaginaryI] Mass[VWm] RXi[W] SHm,  - 1/(RXi[W])},
	{Der[VZ] - Mass[VZ] RXi[Z] Ah,                       - 1/(2 RXi[Z])},
	{Der[VG],                                            - 1/(2 RXi[G])}};


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FDL, FDR};
dirac[[2]] = {Fe,  FeL, FeR};
dirac[[3]] = {Fu,  FUL, FUR};
dirac[[4]] = {Fv,  FvL, 0};


(* before EWSB *)

dirac[[5]] = {Fd1,  FdL, 0};
dirac[[6]] = {Fd2,  0, FdR};
dirac[[7]] = {Fu1,  FuL, 0};
dirac[[8]] = {Fu2,  0, FuR};



(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile= None;		

	


