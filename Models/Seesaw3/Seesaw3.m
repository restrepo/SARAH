Off[General::spell]
Print["Model file for the MSSM with Seesaw III loaded"];

ModelName = "SeesawIII";
ModelNameLaTeX ="MSSM with Seesaw III";


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

Fields[[8]] = {{{HW0/Sqrt[2],HWp},{HWm, HW0/Sqrt[2]}}, 3, Hw3, 0, 3, 1};
Fields[[9]] =  {HG, 3, Hg3, 0, 1, 8};
Fields[[10]] = {HB, 3, Hb3, 0, 1, 1};
Fields[[11]] = {{HXu,HXd}, 3, Hx3, 5/6, 2, -3};
Fields[[12]] = {{HXub,HXdb}, 3, Hxb3, -5/6, 2, 3};

(*------------------------------------------------------*)
(* Superpotential *)
(*------------------------------------------------------*)

SuperPotential = { {{1, Yu},{u,q,Hu}}, {{-1,Yd},{d,q,Hd}},
                   {{-1,Ye},{e,l,Hd}}, {{1,\[Mu]},{Hu,Hd}},
                   {{Sqrt[6/20],Yb3},{Hu,Hb3,l}},
                   {{1,Yw3},{Hu,Hw3,l}},
                   {{1,Yx3},{Hu,Hxb3,d}},              
                   {{1,MXM3},{Hx3,Hxb3}},{{1/2,MWM3},{Hw3,Hw3}},{{1/2,MGM3},{Hg3,Hg3}},
                   {{1/2,MBM3},{Hb3,Hb3}},{{1,MNuL},{l,Hu,l,Hu}}};

(*-------------------------------------------*)
(* Integrate Out or Delete Particles         *)
(*-------------------------------------------*)

IntegrateOut={};
DeleteParticles={Hw3,Hg3,Hb3,Hx3,Hxb3};

NameOfStates={GaugeES,EWSB}

DEFINITION[GaugeES][GaugeFixing]=
		{ {Der[VWB],  -1/(2 RXi[W])},
  		  {Der[VG],   -1/(2 RXi[G]) }};


(*----------------------------------------------*)
(*   Symmetry Breaking                          *)
(*----------------------------------------------*)
DEFINITION[EWSB][GaugeSector]=
{ {VWB, {1,{VWm,1/Sqrt[2]},{conj[VWm],1/Sqrt[2]}},
        {2,{VWm,-\[ImaginaryI]/Sqrt[2]},{conj[VWm],\[ImaginaryI]/Sqrt[2]}},
        {3,{VP, Sin[ThetaW]},{VZ, Cos[ThetaW]}}},
  {VB,  {1,{VP, Cos[ThetaW]},{VZ,-Sin[ThetaW]}}},
  {fWB, {1,{fWm,1/Sqrt[2]}, {fWp,1/Sqrt[2]}}, 
        {2,{fWm,-\[ImaginaryI]/Sqrt[2]},{fWp,\[ImaginaryI]/Sqrt[2]}},
        {3,{fW0,1}}}                                                          \
      };     
        
DEFINITION[EWSB][VEVs]=
{    {SHd0, {vd, 1/Sqrt[2]}, {sigmad, \[ImaginaryI]/Sqrt[2]},{phid, \
1/Sqrt[2]}},
     {SHu0, {vu, 1/Sqrt[2]}, {sigmau, \[ImaginaryI]/Sqrt[2]},{phiu, \
1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=
{    {{SdL, SdR}, {Sd, ZD}},
     {{SuL, SuR}, {Su, ZU}},
     {{SeL, SeR}, {Se, ZE}},
     {{SvL}, {Sv, ZV}},
     {{phid, phiu}, {hh, ZH}},
     {{sigmad, sigmau}, {Ah, ZA}},
     {{SHdm,conj[SHup]},{Hpm,ZP}},
     {{fB, fW0, FHd0, FHu0}, {L0, ZN}}, 
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
     {{{FeL},{conj[FeR]}},{{FEL,ZEL},{FER,ZER}}},
     {{{FdL},{conj[FdR]}},{{FDL,ZDL},{FDR,ZDR}}},
     {{{FuL},{conj[FuR]}},{{FUL,ZUL},{FUR,ZUR}}}                   \
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

dirac[[1]] = {Fd,  FDL, conj[FDR]};
dirac[[2]] = {Fe,  FEL, conj[FER]};
dirac[[3]] = {Fu,  FUL, conj[FUR]};
dirac[[4]] = {Fv,  FvL, 0};
dirac[[5]] = {Chi, L0, conj[L0]}; 
dirac[[6]] = {Cha, Lm, conj[Lp]};
dirac[[7]] = {Glu, fG, conj[fG]}; 


(* Unbroken EW *)

dirac[[8]] = {Bino, fB, conj[fB]};
dirac[[9]] = {Wino, fWB, conj[fWB]};
dirac[[10]] = {H0, FHd0, conj[FHu0]};
dirac[[11]] = {HC, FHdm, conj[FHup]};
dirac[[12]] = {Fd1, FdL, 0};
dirac[[13]] = {Fd2, 0, FdR};
dirac[[14]] = {Fu1, FuL, 0};
dirac[[15]] = {Fu2, 0, FuR};
dirac[[16]] = {Fe1, FeL, 0};
dirac[[17]] = {Fe2, 0, FeR};





(*------------------------------------------------------*)
(* Automatized Output        *)
(*------------------------------------------------------*)

(* 
makeOutput = {
                   {EWSB, {TeX, FeynArts}}
             };   
            *)
            
SpectrumFile= None;		

	


