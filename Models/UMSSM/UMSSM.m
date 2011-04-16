Off[General::spell]
Print["Model file for the UMSSM loaded"];

ModelName = "UMSSM";
ModelNameLaTeX ="UMSSM";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};
Gauge[[4]]={U,   U[1], additional,  gp,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL,  dL},  3, q,   1/6, 2, 3, Qq};  
Fields[[2]] = {{vL,  eL},  3, l,  -1/2, 2, 1, Ql};
Fields[[3]] = {{Hd0, Hdm}, 1, Hd, -1/2, 2, 1, QHd};
Fields[[4]] = {{Hup, Hu0}, 1, Hu,  1/2, 2, 1, QHu};

Fields[[5]] = {conj[dR], 3, d,  1/3, 1, -3, Qd};
Fields[[6]] = {conj[uR], 3, u, -2/3, 1, -3, Qu};
Fields[[7]] = {conj[eR], 3, e,    1, 1,  1, Qe};
Fields[[8]] = {sR, 1, s,    0, 1,  1, Qs};


(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = { {{1, Yu},{q,Hu,u}}, {{-1,Yd},{q,Hd,d}},
                   {{-1,Ye},{l,Hd,e}}, 
                   {{1,\[Lambda]},{Hu,Hd,s}}};


(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={};


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES,EWSB};

(* ----- Before EWSB ----- *)


DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};

(* ----- After EWSB ----- *)

      
DEFINITION[EWSB][GaugeSector]= 
{ {VWB, {1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
        {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
        {3,{VP, Sin[ThetaW]},{VZ, Cos[ThetaW] Cos[ThetaWp]},{VZp,-Cos[ThetaW] Sin[ThetaWp]}}},
  {VB, {1,{VP, Cos[ThetaW]},{VZ,-Sin[ThetaW] Cos[ThetaWp]},{VZp,Sin[ThetaW] Sin[ThetaWp]}}},
  {fWB, {1,{fWm,1/Sqrt[2]}, {fWp,1/Sqrt[2]}}, 
        {2,{fWm,-\[ImaginaryI]/Sqrt[2]},{fWp,\[ImaginaryI]/Sqrt[2]}},
        {3,{fW0,1}}},
  {VU,  {1,{VP, 0},{VZ,-Sin[ThetaWp] },{VZp, Cos[ThetaWp]}}}    }; 
        
       
        
        
 
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
     {{fU,fB, fW0, FHd0, FHu0,FsR}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}            
   }; 

DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
    }; 

DEFINITION[EWSB][GaugeFixing]=
  { {Der[VP],                                     - 1/(2 RXi[P])},	
	{Der[VWm]+\[ImaginaryI] Mass[VWm] RXi[W] Hpm[{1}], - 1/(RXi[W])},
	{Der[VZ] - Mass[VZ] RXi[Z1] Ah[{1}],                - 1/(2 RXi[Z])},
	{Der[VG],                                     - 1/(2 RXi[G])}   	};

(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

dirac[[1]] = {Fd,  FDL, conj[FDR]};
dirac[[2]] = {Fe,  FEL, conj[FER]};
dirac[[3]] = {Fu,  FUL, conj[FUR]};
dirac[[4]] = {Fv,  FvL, 0};
dirac[[5]] = {Chi, L0, conj[L0]};
dirac[[6]] = {Cha, Lm, conj[Lp]};
dirac[[7]] = {Glu, fG, conj[fG]};
dirac[[8]] = {Bino, fB, conj[fB]};
dirac[[9]] = {Wino, fWB, conj[fWB]};
dirac[[10]] = {H0, FHu0, conj[FHd0]};
dirac[[11]] = {HC, FHup, conj[FHdm]};
dirac[[12]] = {S, FsR, conj[FsR]};

(* Unbroken EW *)

dirac[[13]] = {Fd1, FdL, 0};
dirac[[14]] = {Fd2, 0, FdR};
dirac[[15]] = {Fu1, FuL, 0};
dirac[[16]] = {Fu2, 0, FuR};
dirac[[17]] = {Fe1, FeL, 0};
dirac[[18]] = {Fe2, 0, FeR};
dirac[[19]] = {FU, fU, conj[fU]};

(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            
            *)
            
SpectrumFile= None;		

	



