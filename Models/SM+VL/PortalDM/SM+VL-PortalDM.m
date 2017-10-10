Off[General::spell]

Model`Name = "PortalDM";
Model`NameLaTeX ="Singlet Extended Standard Model with vectorlike quarks and fermionic as well as scalar dark matter candidates";
Model`Authors = "F.Staub, M.E. Krauss, K. Nickel";
Model`Date = "2015-12-28";




(*-------------------------------------------*)
(*   Particle Content*)
(*-------------------------------------------*)

Global[[1]]={Z[2], DMParity};

(* Gauge Superfields *)

Gauge[[1]]={B,   U[1], hypercharge, g1,False,1};
Gauge[[2]]={WB, SU[2], left,        g2,True, 1};
Gauge[[3]]={G,  SU[3], color,       g3,False,1};


(* Chiral Superfields *)

FermionFields[[1]] = {q,3, {uL, dL},    1/6, 2, 3, 1};  
FermionFields[[2]] = {l,3, {vL,  eL},  -1/2, 2, 1, 1};
FermionFields[[3]] = {d,3, conj[dR],   1/3, 1, -3, 1};
FermionFields[[4]] = {u,3, conj[uR],  -2/3, 1, -3, 1};
FermionFields[[5]] = {e,3, conj[eR],     1, 1,  1, 1};

FermionFields[[6]] = {PSIL, 1, psiL,       0, 1,  1, -1}; (* DM *)
FermionFields[[7]] = {PSIR, 1, conj[psiR],       0, 1,  1, -1}; (* DM *)


FermionFields[[8]] = {TL, 1, tL,         2/3, 1,   3, -1}; (* vectorlike top *)
FermionFields[[9]] = {TR, 1, conj[tR],  -2/3, 1,  -3, -1}; (* vectorlike top *) 

FermionFields[[10]] = {QL, 1, {quL, qdL}, 1/6, 2,  3, -1};              (* vectorlike quark doublet *)
FermionFields[[11]] = {QR, 1, {conj[quR], conj[qdR]},-1/6, -2, -3, -1}; (* vectorlike quark doublet *)

FermionFields[[12]] = {XL, 1, xL,       5/3, 1,  3, 1};
FermionFields[[13]] = {XR, 1, conj[xR],       -5/3, 1,  -3, 1};


ScalarFields[[1]] = {H, 1, {Hp, H0},      1/2, 2, 1, 1};
ScalarFields[[2]] = {s, 1, phi,             0, 1, 1, 1};

ScalarFields[[3]] = {SDM, 1, sDM,           0, 1, 1, -1};

RealScalars = {s,SDM};



        


(*----------------------------------------------*)
(*   DEFINITION                                 *)
(*----------------------------------------------*)

NameOfStates={GaugeES, EWSB};

(* ----- Before EWSB ----- *)

DEFINITION[GaugeES][Additional]= {
	{LagHC, { AddHC->True}},
	{LagNoHC,{ AddHC->False}}
};

(* 1:MS, 2:lamS, 3:kapS, 4:lamHS, 5: kapHS, 6:lamDM, 
7:lamSDM, 8:lamHDM, 9:mDMS, 10:kapSDM *)

LagNoHC = -(-mu2 conj[H].H +  1/2 MS s.s +  1/2 mDMS SDM.SDM
            + 1/2 \[Lambda] conj[H].H.conj[H].H 
            + 1/4 lamDM SDM.SDM.SDM.SDM + 1/4 lamS s.s.s.s
            + lamHS conj[H].H.s.s + lamHDM conj[H].H.SDM.SDM 
            + lamSDM s.s.SDM.SDM + 
            + kapSDM s.SDM.SDM 
            + kapHS conj[H].H.s
            + 1/3 kapS s.s.s  
            );

(* 11:YX, 12:mX, 13:YT, 14:mT, 15:YQ, 16:mQ, 17:YQT, 
18:YQTp, 19:mDMF, 20:YDMF *)
            
LagHC = - ( Yd conj[H].d.q + Ye conj[H].e.l - Yu H.u.q 
          + mDMF PSIR.PSIL
          + YDMF s.PSIR.PSIL 
          + YT s.TL.TR + mT TL.TR
          + YTDM SDM.TL.u
          + YQ s.QL.QR + mQ QL.QR
          + YQT H.QL.TR + YQTp conj[H].QR.TL
          + YQDM SDM.q.QR
          + YX s.XL.XR + mX XL.XR     
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

DEFINITION[EWSB][MatterSector]={
     {{phiH,phiS},{hh,ZH}},
     {{{dL}, {conj[dR]}}, {{DL,Vd}, {DR,Ud}}},
     {{{uL}, {conj[uR]}}, {{UL,Vu}, {UR,Uu}}},
     {{{eL}, {conj[eR]}}, {{EL,Ve}, {ER,Ue}}},
     {{{tL, quL}, {conj[tR], conj[quR]}}, {{TQL, VQT}, {TQR, UQT}}}
     };  


(*------------------------------------------------------*)
(* Dirac-Spinors *)
(*------------------------------------------------------*)


DEFINITION[EWSB][Phases]=
{    {psiR, PhasepsiR},
     {xR, PhaseXR},
     {qdR, PhaseQDR}
    }; 



DEFINITION[EWSB][DiracSpinors]={
 Fd ->{  DL, conj[DR]},
 Fe ->{  EL, conj[ER]},
 Fu ->{  UL, conj[UR]},
 Fx ->{  xL, xR}, 
 FQT -> {TQL, conj[TQR]}, (* mixed *)
 Fqd -> {qdL, qdR}, (* unmixed *) 
 Fdm ->{ psiL, psiR},
 Fv ->{  vL, 0}
};

DEFINITION[GaugeES][DiracSpinors]={
 Fd1 ->{  dL, 0},
 Fd2 ->{  0, dR},
 Fu1 ->{  uL, 0},
 Fu2 ->{  0, uR},
 Fe1 ->{  eL, 0},
 Fe2 ->{  0, eR},
 Fv1 -> {vL, 0},
 Fx1 -> {xL, 0},
 Fx2 -> {0, xR},
 Fpsi1 -> {psiL, 0},
 Fpsi2 -> {0, psiR},
 Ft1 -> {tL, 0},
 Ft2 -> {0, tR},
 Fqd1 -> {qdL, 0},
 Fqd2 -> {0, qdR},
 Fqu1 -> {quL, 0},
 Fqu2 -> {0, quR}
};



