Off[General::spell]

Model`Name = "SSMVLeven";
Model`NameLaTeX ="Singlet Extended Standard Model (CP-even) with vectorlike quarks";
Model`Authors = "F.Staub, M.E. Krauss, K. Nickel, T. Opferkuch";
Model`Date = "2016-01-25";




(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

Global[[1]]={Z[2], Z2};
Z2even = 1;
Z2odd = -1;


(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False, Z2even};
Gauge[[2]]={WB, SU[2], left,        g2,True,  Z2even};
Gauge[[3]]={G,  SU[3], color,       g3,False, Z2even};


(* Chiral Superfields *)

FermionFields[[1]] = {q,3, {uL, dL},    1/6, 2, 3, Z2even};  
FermionFields[[2]] = {l,3, {vL,  eL},  -1/2, 2, 1, Z2even};
FermionFields[[3]] = {d,3, conj[dR],    1/3, 1, -3, Z2even};
FermionFields[[4]] = {u,3, conj[uR],   -2/3, 1, -3, Z2even};
FermionFields[[5]] = {e,3, conj[eR],      1, 1,  1, Z2even};

(* additional vectorlike fermions *)

FermionFields[[8]] = {F1L, 1, {x1L, y1L},       7/6, 2,   3, Z2odd};
FermionFields[[9]] = {F1R, 1, {conj[x1R], conj[y1R]}, -7/6, -2,  -3, Z2odd};

FermionFields[[10]] = {F2L, 1, {{y2L/Sqrt[2], x2L}, {z2L, -y2L/Sqrt[2]}},  2/3, 3,   3, Z2odd};
FermionFields[[11]] = {F2R, 1, {{conj[y2R]/Sqrt[2], conj[z2R]}, {conj[x2R], -conj[y2R]/Sqrt[2]}}, -2/3, 3,  -3, Z2odd};

FermionFields[[12]] = {F3L, 1, {x3L, y3L},       -5/6, 2,   3, Z2odd};
FermionFields[[13]] = {F3R, 1, {conj[x3R],conj[y3R]},  5/6, -2,  -3, Z2odd};

FermionFields[[14]] = {F4L, 1, {{y4L/Sqrt[2], x4L}, {z4L, -y4L/Sqrt[2]}},        -1/3, 3,   3, Z2odd};
FermionFields[[15]] = {F4R, 1, {{conj[y4R]/Sqrt[2], conj[z4R]}, {conj[x4R], -conj[y4R]/Sqrt[2]}}, 1/3, 3,  -3, Z2odd};

FermionFields[[16]] = {F5L, 1, x5L,        2/3, 1,   3, Z2odd};
FermionFields[[17]] = {F5R, 1, conj[x5R], -2/3, 1,  -3, Z2odd};

FermionFields[[18]] = {F6L, 1, {x6L, y6L},        1/6, 2,   3, Z2odd};
FermionFields[[19]] = {F6R, 1, {conj[x6R], conj[y6R]}, -1/6, -2,  -3, Z2odd};

FermionFields[[20]] = {F7L, 1, x7L,       -1/3, 1,   3, Z2odd};
FermionFields[[21]] = {F7R, 1, conj[x7R],  1/3, 1,  -3, Z2odd};

FermionFields[[22]] = {F8L, 1, x8L,  1, 1, 1, Z2odd};
FermionFields[[23]] = {F8R, 1, conj[x8R],  -1, 1, 1, Z2odd};

FermionFields[[24]] = {F9L, 1, {x9L,y9L},  -3/2, 2, 1, Z2odd};
FermionFields[[25]] = {F9R, 1, {conj[x9R], conj[y9R]},  3/2, -2, 1, Z2odd};

FermionFields[[26]] = {F10L, 1, {{y10L/Sqrt[2], x10L}, {z10L, -y10L/Sqrt[2]}},  1, 3, 1, Z2odd};
FermionFields[[27]] = {F10R, 1, {{conj[y10R]/Sqrt[2], conj[z10R]}, {conj[x10R], -conj[y10R]/Sqrt[2]}},  -1, 3, 1, Z2odd};

FermionFields[[28]] = {F11L, 1, {x11L,y11L},  -1/2, 2, 1, Z2odd};
FermionFields[[29]] = {F11R, 1, {conj[x11R],conj[y11R]},  1/2, -2, 1, Z2odd};

FermionFields[[30]] = {F12L, 1, {{y12L/Sqrt[2], x12L}, {z12L, -y12L/Sqrt[2]}},  0, 3, 1, Z2odd};
FermionFields[[31]] = {F12R, 1, {{conj[y12R]/Sqrt[2], conj[z12R]}, {conj[x12R], -conj[y12R]/Sqrt[2]}},  0, 3, 1, Z2odd};

FermionFields[[32]] = {F13L, 1, x13L,   5/3, 1, 3, Z2odd};
FermionFields[[33]] = {F13R, 1, conj[x13R], -5/3, 1, -3, Z2odd};

(* Scalar sector *)

ScalarFields[[1]] = {H, 1, {Hp, H0},      1/2, 2, 1, Z2even};
ScalarFields[[2]] = {s, 1, phi,             0, 1, 1, Z2even};


RealScalars = {s};



        


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};


DEFINITION[GaugeES][Additional]= {
	{LagHC, { AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

LagNoHC = -(-mu2 conj[H].H +  1/2 MS2 s.s 
            + 1/2 \[Lambda] conj[H].H.conj[H].H 
             + 1/4 lamS s.s.s.s
            + lamHS conj[H].H.s.s 
            + kapHS conj[H].H.s
            + 1/3 kapS s.s.s  
            );

LagHC = - ( Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q 
          + YF1 s.F1L.F1R + m1F F1L.F1R 
          + YF2 s.F2L.F2R + m2F F2L.F2R 
          + YF3 s.F3L.F3R + m3F F3L.F3R 
          + YF4 s.F4L.F4R + m4F F4L.F4R 
          + YF5 s.F5L.F5R + m5F F5L.F5R 
          + YF6 s.F6L.F6R + m6F F6L.F6R 
          + YF7 s.F7L.F7R + m7F F7L.F7R 
          + YF8 s.F8L.F8R + m8F F8L.F8R
          + YF9 s.F9L.F9R + m9F F9L.F9R
          + YF10 s.F10L.F10R + m10F F10L.F10R
          + YF11 s.F11L.F11R + m11F F11L.F11R 
          + YF12 s.F12L.F12R + m12F F12L.F12R
          + YF13 s.F13L.F13R + m13F F13L.F13R  
          );
			  		  

(* Gauge Sector *)

DEFINITION[EWSB][GaugeSector] =
{ 
  {{VB,VWB[3]},{VP,VZ},ZZ},
  {{VWB[1],VWB[2]},{VWp,conj[VWp]},ZW}
};     
        
        
          	

(* ----- VEVs ---- *)

DEFINITION[EWSB][VEVs]= 
 {    {H0, {v, 1/Sqrt[2]}, {Ah, \[ImaginaryI]/Sqrt[2]},{phiH, 1/Sqrt[2]}},
      {phi, {vS, 1}, {0, 0},{phiS, 1}}
 };

DEFINITION[EWSB][MatterSector]=   
    {{{phiH,phiS},{hh,ZH}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}}};  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)


DEFINITION[EWSB][Phases]=
{   
     {x1R, PhaseX1R},
     {x2R, PhaseX2R},
     {x3R, PhaseX3R},
     {x4R, PhaseX4R},
     {x5R, PhaseX5R},
     {x6R, PhaseX6R},
     {x7R, PhaseX7R},
     {x8R, PhaseX8R},
     {x9R, PhaseX9R},
     {x10R, PhaseX10R},
     {x11R, PhaseX11R},
     {x12R, PhaseX12R},
     {x13R, PhaseX13R},
     
     {y1R, PhaseY1R},
     {y2R, PhaseY2R},
     {y3R, PhaseY3R},
     {y4R, PhaseY4R},
     {y6R, PhaseY6R},
     {y9R, PhaseY9R},
     {y10R, PhaseY10R},
     {y11R, PhaseY11R},
     {y12R, PhaseY12R},
     
     {z2R, PhaseZ2R},
     {z4R, PhaseZ4R},
     {z10R, PhaseZ10R},
     {z12R, PhaseZ12R}
    }; 


DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fv ->{  vL, 0},
 
 F1x -> { x1L, x1R },
 F2x -> { x2L, x2R },
 F3x -> { x3L, x3R },
 F4x -> { x4L, x4R },
 F5x -> { x5L, x5R },
 F6x -> { x6L, x6R },
 F7x -> { x7L, x7R },
 F8x -> { x8L, x8R },
 F9x -> { x9L, x9R },
 F10x -> { x10L, x10R },
 F11x -> { x11L, x11R },
 F12x -> { x12L, x12R },
 F13x -> { x13L, x13R },

 F1y -> { y1L, y1R },
 F2y -> { y2L, y2R },
 F3y -> { y3L, y3R },
 F4y -> { y4L, y4R },
 F6y -> { y6L, y6R },
 F9y -> { y9L, y9R },
 F10y -> { y10L, y10R },
 F11y -> { y11L, y11R },
 F12y -> { y12L, y12R },
 
 F2z -> { z2L, z2R },
 F4z -> { z4L, z4R },
 F10z -> { z10L, z10R },
 F12z -> { z12L, z12R }
 };
 
DEFINITION[GaugeES][DiracSpinors]={
 Fd1 ->{  dL, 0},
 Fd2 ->{  0, dR},
 Fu1 ->{  uL, 0},
 Fu2 ->{  0, uR},
 Fe1 ->{  eL, 0},
 Fe2 ->{  0, eR},
 Fv -> {vL, 0},

 Fx1L -> {x1L,0},
 Fx2L -> {x2L,0},
 Fx3L -> {x3L,0},
 Fx4L -> {x4L,0},
 Fx5L -> {x5L,0},
 Fx6L -> {x6L,0},
 Fx7L -> {x7L,0},
 Fx8L -> {x8L,0},
 Fx9L -> {x9L,0},
 Fx10L -> {x10L,0},
 Fx11L -> {x11L,0},
 Fx12L -> {x12L,0},
 Fx13L -> {x13L,0},
 Fx1R -> {0, x1R},
 Fx2R -> {0, x2R},
 Fx3R -> {0, x3R},
 Fx4R -> {0, x4R},
 Fx5R -> {0, x5R},
 Fx6R -> {0, x6R},
 Fx7R -> {0, x7R},
 Fx8R -> {0, x8R},
 Fx9R -> {0, x9R},
 Fx10R -> {0, x10R},
 Fx11R -> {0, x11R},
 Fx12R -> {0, x12R},
 Fx13R -> {0, x13R},
 
 Fy1L -> {y1L, 0},
 Fy2L -> {y2L, 0},
 Fy3L -> {y3L, 0},
 Fy4L -> {y4L, 0},
 Fy6L -> {y6L, 0},
 Fy9L -> {y9L, 0},
 Fy10L -> {y10L, 0},
 Fy11L -> {y11L, 0},
 Fy12L -> {y12L, 0},
 
 Fy1R -> {0, y1R},
 Fy2R -> {0, y2R},
 Fy3R -> {0, y3R},
 Fy4R -> {0, y4R},
 Fy6R -> {0, y6R},
 Fy9R -> {0, y9R},
 Fy10R -> {0, y10R},
 Fy11R -> {0, y11R},
 Fy12R -> {0, y12R},
 
 Fz2L -> {z2L, 0},
 Fz4L -> {z4L, 0},
 Fz10L -> {z10L, 0},
 Fz12L -> {z12L, 0},
 
 Fz2R -> {0, z2R},
 Fz4R -> {0, z4R},
 Fz10R -> {0, z10R},
 Fz12R -> {0, z12R}
 };
 

