Off[General::spell]
Print["Model file for the MSSM loaded"];

ModelName = "MSSMNoFV";
ModelNameLaTeX ="MSSM without Flavor violation";


(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False};
Gauge[[2]]={WB, SU[2], left,        g2,True};
Gauge[[3]]={G,  SU[3], color,       g3,False};


(* Chiral Superfields *)

Fields[[1]] = {{uL0,  dL0},  3, q,   1/6, 2, 3};  
Fields[[2]] = {{vL0,  eL0},  3, l,  -1/2, 2, 1};
Fields[[3]] = {{Hd0, Hdm}, 1, Hd, -1/2, 2, 1};
Fields[[4]] = {{Hup, Hu0}, 1, Hu,  1/2, 2, 1};

Fields[[5]] = {conj[dR0], 3, d,  1/3, 1, -3};
Fields[[6]] = {conj[uR0], 3, u, -2/3, 1, -3};
Fields[[7]] = {conj[eR0], 3, e,    1, 1,  1};



(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

         
SuperPotential = { {{1, Yu},{u,q,Hu}}, {{-1,Yd},{d,q,Hd}},
                   {{-1,Ye},{e,l,Hd}}, {{1,\[Mu]},{Hu,Hd}}  };
  

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
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};



(* ----- After EWSB ----- *)


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
  {{SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
1/Sqrt[2]}},
   {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
1/Sqrt[2]}}};


(* ----- Flavors ---- *)
 
DEFINITION[EWSB][Flavors]=
{{FdR0,{FdR,FsR,FbR}}, 
 {FdL0,{FdL,FsL,FbL}},
 {FuL0,{FuL,FcL,FtL}},
 {FuR0,{FuR,FcR,FtR}},
 {FvL0,{FveL,FvmL,FvtL}},
 {SdR0,{SdR,SsR,SbR}}, 
 {SdL0,{SdL,SsL,SbL}},
 {SuL0,{SuL,ScL,StL}},
 {SuR0,{SuR,ScR,StR}},
 {FeL0,{FeL,FmL,FtauL}},
 {FeR0,{FeR,FmR,FtauR}},
 {SeR0,{SeR,SmR,StauR}}, 
 {SeL0,{SeL,SmL,StauL}},
 {SvL0,{SveL,SvmL,SvtL}}};

(* ---- Mixings ---- *)

DEFINITION[EWSB][MatterSector]= 
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{SmL, SmR}, {Sm, ZM}},
     {{StauL, StauR}, {Stau, ZTau}}, 
	 {{SsL, SsR}, {Ss, ZS}},
     {{ScL, ScR}, {Sc, ZC}},
	 {{SbL, SbR}, {Sb, ZB}},
     {{StL, StR}, {St, ZT}},
     {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}}      \
       }; 

DEFINITION[EWSB][Phases]= 
{    {fG, PhaseGlu}
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
dirac[[2]] = {Fb,  FbL, FbR};
dirac[[3]] = {Fs,  FsL, FsR};
dirac[[4]] = {Fc,  FcL, FcR};
dirac[[5]] = {Ft,  FtL, FtR};
dirac[[6]] = {Fm,  FmL, FmR};
dirac[[7]] = {Ftau,  FtauL, FtauR};
dirac[[8]] = {Fe,  FeL, FeR};
dirac[[9]] = {Fu,  FuL, FuR};
dirac[[10]] = {Fve,  FveL, 0};
dirac[[11]] = {Fvm,  FvmL, 0};
dirac[[12]] = {Fvt,  FvtL, 0};
dirac[[13]] = {Chi, L0, conj[L0]}; 
dirac[[14]] = {Cha, Lm, conj[Lp]};
dirac[[15]] = {Glu, fG, conj[fG]}; 
dirac[[16]] = {Bino, fB, conj[fB]};
dirac[[17]] = {Wino, fWB, conj[fWB]};
dirac[[18]] = {H0, FHd0, conj[FHu0]};
dirac[[19]] = {HC, FHdm, conj[FHup]};

dirac[[20]] = {Fd1, FdL0, 0};
dirac[[21]] = {Fd2, 0, FdR0};
dirac[[22]] = {Fu1, FuL0, 0};
dirac[[23]] = {Fu2, 0, FuR0};
dirac[[24]] = {Fe1, FeL0, 0};
dirac[[25]] = {Fe2, 0, FeR0};
dirac[[26]] = {Fv, FvL0,0};



(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile=None;		

	


