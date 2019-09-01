Off[General::spell]

Model`Name = "SplitMSSMlowMA";
Model`NameLaTeX ="SplitMSSM with low $M_A$";
Model`Authors = "F.Staub";
Model`Date = "2018-07-23";

(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

Global[[1]] = {Z[2],RParity};

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True,1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Chiral Superfields *)

FermionFields[[1]] = {q, 3, {uL,dL},     1/6, 2, 3, 1};  
FermionFields[[2]] = {l, 3, {vL,eL},    -1/2, 2, 1, 1};
FermionFields[[3]] = {d, 3, conj[dR],   1/3, 1, -3, 1};
FermionFields[[4]] = {u, 3, conj[uR],  -2/3, 1, -3, 1};
FermionFields[[5]] = {e, 3, conj[eR],     1, 1,  1, 1};

FermionFields[[6]]  = {FG, 1, fG          ,   0  , 1, 8, -1};
FermionFields[[7]]  = {FW, 1, {{fW0/Sqrt[2],fWp},
                             {fWm,-fW0/Sqrt[2]}}, 0 , 3, 1, -1};
FermionFields[[8]]  = {FB, 1, fB          ,   0  , 1, 1, -1};
FermionFields[[9]]  = {Hd, 1, {FHd0, FHdm},  -1/2, 2, 1, -1};
FermionFields[[10]] = {Hu, 1, {FHup, FHu0},   1/2, 2, 1, -1};

ScalarFields[[1]] =  {H1, 1, {H1p, H10},     1/2, 2,  1, 1};
ScalarFields[[2]] =  {H2, 1, {H2p, H20},     1/2, 2,  1, 1};


     


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, {AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};


LagNoHC = -(M112 conj[H1].H1 + M222 conj[H2].H2 + Lambda1 conj[H1].H1.conj[H1].H1 + \
		Lambda2 conj[H2].H2.conj[H2].H2 + Lambda3 conj[H2].H2.conj[H1].H1 + Lambda4 conj[H2].H1.conj[H1].H2 );


LagHC = -(Lambda5/2 conj[H2].H1.conj[H2].H1 + Lambda6 conj[H1].H1.conj[H1].H2 + Lambda7 conj[H2].H2.conj[H1].H2 + M12 conj[H1].H2  \
 + Yd conj[H1].d.q + Ye conj[H1].e.l - Yu H2.u.q) - MG/2 FG.FG - MW/2 FW.FW - MB/2 FB.FB - MuSplit Hu.Hd \
  - g2u conj[H2].FW.Hu - g1u/Sqrt[2] conj[H2].FB.Hu  + g2d H1.FW.Hd - g1d/Sqrt[2] H1.FB.Hd;
 
 

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWm,conj[VWm]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
{    {H10, {vd, 1/Sqrt[2]}, {sigma1, \[ImaginaryI]/Sqrt[2]},{phi1, 1/Sqrt[2]}},
     {H20, {vu, 1/Sqrt[2]}, {sigma2, \[ImaginaryI]/Sqrt[2]},{phi2, 1/Sqrt[2]}}     };
 

DEFINITION[EWSB][MatterSector]=   
    { {{phi1, phi2}, {hh, ZH}},
      {{sigma1, sigma2}, {Ah, ZA}},
      {{conj[H1p],conj[H2p]},{Hm,ZP}},
      {{fB, fW0, FHd0, FHu0}, {L0, ZN}},
     {{{fWm, FHdm}, {fWp, FHup}}, {{Lm,UM}, {Lp,UP}}},
      {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
      {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
      {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}       };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)

DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Chi -> {L0, conj[L0]},
 Cha -> {Lm, conj[Lp]},
 Glu -> {fG, conj[fG]},
 Fv ->{  vL, 0}};
