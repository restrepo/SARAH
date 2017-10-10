(* SARAH generated template for particles.m file for phiPortalDM *)
(* File created at 15:39 on 28.1.2016  *) 

(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A^0", 
     Mass -> {0}, 
     OutputName -> "Ah", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> {0}}}, 

{Fd,{ 
     Description -> "Down-Quarks", 
     FeynArtsNr -> 4, 
     LaTeX -> "d", 
     Mass -> {0.0035, 0.104, 4.2}, 
     OutputName -> "d", 
     PDG -> {1, 3, 5}, 
     ElectricCharge -> -1/3, 
     Width -> {0, 0, 0}}}, 

{Fdm,{ 
     Description -> "fermionic-Dark-Matter", 
     FeynArtsNr -> 101, 
     LaTeX -> "\\psi_{DM}", 
     Mass -> LesHouches, 
     OutputName -> "fDM", 
     PDG -> {101}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Fe,{ 
     Description -> "Leptons", 
     FeynArtsNr -> 2, 
     LaTeX -> "e", 
     Mass -> {0.000511, 0.105, 1.776}, 
     OutputName -> "e", 
     PDG -> {11, 13, 15}, 
     ElectricCharge -> -1, 
     Width -> {0, 0, 0}}}, 

{Fqd,{ 
     FeynArtsNr -> 107, 
     LaTeX -> "qd", 
     Mass -> LesHouches, 
     OutputName -> "fqd", 
     PDG -> {109}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{FQT,{ 
     FeynArtsNr -> 109, 
     LaTeX -> "Fqt", 
     Mass -> LesHouches, 
     OutputName -> "fqt", 
     PDG -> {112, 113}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{Fu,{ 
     Description -> "Up-Quarks", 
     FeynArtsNr -> 3, 
     LaTeX -> "u", 
     Mass -> {0.0015, 1.27, 171.2}, 
     OutputName -> "u", 
     PDG -> {2, 4, 6}, 
     ElectricCharge -> 2/3, 
     Width -> {0, 0, 1.51}}}, 

{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> {0, 0, 0}, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16}, 
     ElectricCharge -> 0, 
     Width -> {0, 0, 0}}}, 

{Fx,{ 
     Description -> "vectorlike-Quarks", 
     FeynArtsNr -> 7, 
     LaTeX -> "Fx", 
     Mass -> LesHouches, 
     OutputName -> "Fx", 
     PDG -> {7}, 
     ElectricCharge -> 5/3, 
     Width -> Automatic}}, 

{gG,{ 
     Description -> "Gluon Ghost", 
     FeynArtsNr -> 5, 
     LaTeX -> "\\eta^G", 
     Mass -> 0, 
     OutputName -> "gG", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gP,{ 
     Description -> "Photon Ghost", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^{\\gamma}", 
     Mass -> 0, 
     OutputName -> "gA", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWp,{ 
     Description -> "Positive W+ - Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWp], 
     OutputName -> "gWp", 
     PDG -> {0}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{gWpC,{ 
     Description -> "Negative W+ - Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWp], 
     OutputName -> "gWC", 
     PDG -> {0}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{gZ,{ 
     Description -> "Z-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^Z", 
     Mass -> Mass[VZ], 
     OutputName -> "gZ", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "hh", 
     PDG -> {25, 35}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 
     
     
{sDM,{ 
     FeynArtsNr -> 20, 
     LaTeX -> "sdm", 
     Mass -> LesHouches, 
     OutputName -> "sdm", 
     PDG -> {45}, 
     ElectricCharge->0,
     Width -> Automatic}},      
     

{Hp,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^+","H^-"}, 
     Mass -> {0}, 
     OutputName -> {"Hp","Hm"}, 
     PDG -> {0}, 
     ElectricCharge -> 1, 
     Width -> {0}}}, 

{VG,{ 
     Description -> "Gluon", 
     FeynArtsNr -> 5, 
     LaTeX -> "g", 
     Mass -> 0, 
     OutputName -> "g", 
     PDG -> {21}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{VP,{ 
     Description -> "Photon", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\gamma", 
     Mass -> 0, 
     OutputName -> "A", 
     PDG -> {22}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{VWp,{ 
     Description -> "W+ - Boson", 
     Goldstone -> Hp, 
     FeynArtsNr -> 3, 
     LaTeX -> {"W^+","W^-"}, 
     Mass -> Dependence, 
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]], 
     OutputName -> {"Wp","Wm"}, 
     PDG -> {24}, 
     ElectricCharge -> 1, 
     Width -> 2.141}}, 

{VZ,{ 
     Description -> "Z-Boson", 
     Goldstone -> Ah, 
     FeynArtsNr -> 2, 
     LaTeX -> "Z", 
     Mass -> 91.1876, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> 2.4952}} 
}; 




(* ###############            GaugeES       ################# *) 

ParticleDefinitions[GaugeES] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{Fd1,{ 
     FeynArtsNr -> 31, 
     LaTeX -> "d1", 
     Mass -> LesHouches, 
     OutputName -> "fd1", 
     PDG -> {83, 84, 85}, 
     Width -> Automatic}}, 

{Fd2,{ 
     FeynArtsNr -> 33, 
     LaTeX -> "d2", 
     Mass -> LesHouches, 
     OutputName -> "fd2", 
     PDG -> {89, 90, 91}, 
     Width -> Automatic}}, 

{Fe1,{ 
     FeynArtsNr -> 35, 
     LaTeX -> "e1", 
     Mass -> LesHouches, 
     OutputName -> "fe1", 
     PDG -> {95, 96, 97}, 
     Width -> Automatic}}, 

{Fe2,{ 
     FeynArtsNr -> 37, 
     LaTeX -> "e2", 
     Mass -> LesHouches, 
     OutputName -> "fe2", 
     PDG -> {101, 102, 103}, 
     Width -> Automatic}}, 

{Fu1,{ 
     FeynArtsNr -> 39, 
     LaTeX -> "u1", 
     Mass -> LesHouches, 
     OutputName -> "fu1", 
     PDG -> {107, 108, 109}, 
     Width -> Automatic}}, 

{Fu2,{ 
     FeynArtsNr -> 41, 
     LaTeX -> "u2", 
     Mass -> LesHouches, 
     OutputName -> "fu2", 
     PDG -> {113, 114, 115}, 
     Width -> Automatic}}, 

{gB,{ 
     Description -> "B-Boson Ghost", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^B", 
     Mass -> 0, 
     OutputName -> "gB", 
     PDG -> {0}, 
     Width -> 0}}, 

{gG,{ 
     Description -> "Gluon Ghost", 
     FeynArtsNr -> 5, 
     LaTeX -> "\\eta^G", 
     Mass -> 0, 
     OutputName -> "gG", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWB,{ 
     Description -> "W-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^W", 
     Mass -> 0, 
     OutputName -> "gW", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 

{H0,{ 
     FeynArtsNr -> 1, 
     LaTeX -> "H^0", 
     Mass -> Automatic, 
     OutputName -> "H0", 
     PDG -> {0}, 
     Width -> 0}}, 

{Hp,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^+","H^-"}, 
     Mass -> {0}, 
     OutputName -> {"Hp","Hm"}, 
     PDG -> {0}, 
     ElectricCharge -> 1, 
     Width -> {0}}}, 

{phi,{ 
     FeynArtsNr -> 14, 
     LaTeX -> "\\phi", 
     Mass -> LesHouches, 
     OutputName -> "phi", 
     PDG -> {51}, 
     Width -> Automatic}}, 

{sDM,{ 
     FeynArtsNr -> 20, 
     LaTeX -> "sdm", 
     Mass -> LesHouches, 
     OutputName -> "sdm", 
     PDG -> {57}, 
     Width -> Automatic}}, 

{VB,{ 
     Description -> "B-Boson", 
     FeynArtsNr -> 1, 
     LaTeX -> "B", 
     Mass -> 0, 
     OutputName -> "B", 
     PDG -> {0}, 
     Width -> 0}}, 

{VG,{ 
     Description -> "Gluon", 
     FeynArtsNr -> 5, 
     LaTeX -> "g", 
     Mass -> 0, 
     OutputName -> "g", 
     PDG -> {21}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{VWB,{ 
     Description -> "W-Bosons", 
     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 24, 25}, 
     Width -> 0}}, 



(*  ----------- Additional particles in the model ---------- *) 

{Fpsi1,{ 
     FeynArtsNr -> 54   (* auto generated FeynArts number *), 
     LaTeX -> "psi1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fpsi1"   (* auto generated Output name *), 
     PDG -> {129}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fpsi2,{ 
     FeynArtsNr -> 56   (* auto generated FeynArts number *), 
     LaTeX -> "psi2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fpsi2"   (* auto generated Output name *), 
     PDG -> {131}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fqd1,{ 
     FeynArtsNr -> 58   (* auto generated FeynArts number *), 
     LaTeX -> "qd1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fqd1"   (* auto generated Output name *), 
     PDG -> {133}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fqd2,{ 
     FeynArtsNr -> 60   (* auto generated FeynArts number *), 
     LaTeX -> "qd2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fqd2"   (* auto generated Output name *), 
     PDG -> {135}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fqu1,{ 
     FeynArtsNr -> 62   (* auto generated FeynArts number *), 
     LaTeX -> "qu1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fqu1"   (* auto generated Output name *), 
     PDG -> {137}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fqu2,{ 
     FeynArtsNr -> 64   (* auto generated FeynArts number *), 
     LaTeX -> "qu2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fqu2"   (* auto generated Output name *), 
     PDG -> {139}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Ft1,{ 
     FeynArtsNr -> 66   (* auto generated FeynArts number *), 
     LaTeX -> "t1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ft1"   (* auto generated Output name *), 
     PDG -> {141}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Ft2,{ 
     FeynArtsNr -> 68   (* auto generated FeynArts number *), 
     LaTeX -> "t2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ft2"   (* auto generated Output name *), 
     PDG -> {143}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fv1,{ 
     FeynArtsNr -> 70   (* auto generated FeynArts number *), 
     LaTeX -> "v_{1}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fv1"   (* auto generated Output name *), 
     PDG -> {147, 148, 149}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fx1,{ 
     FeynArtsNr -> 72   (* auto generated FeynArts number *), 
     LaTeX -> "x1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fx1"   (* auto generated Output name *), 
     PDG -> {151}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fx2,{ 
     FeynArtsNr -> 74   (* auto generated FeynArts number *), 
     LaTeX -> "x2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fx2"   (* auto generated Output name *), 
     PDG -> {153}   (* auto generated PDGs  *), 
     Width -> Automatic}} 
}; 




(* ###############            Weyl Spinors and intermediate states       ################# *) 

WeylFermionAndIndermediate = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{dL,{ 
     LaTeX -> "d_L"}}, 

{uL,{ 
     LaTeX -> "u_L"}}, 

{eL,{ 
     LaTeX -> "e_L"}}, 

{vL,{ 
     LaTeX -> "\\nu_L"}}, 

{dR,{ 
     LaTeX -> "d_R"}}, 

{uR,{ 
     LaTeX -> "u_R"}}, 

{eR,{ 
     LaTeX -> "e_R"}}, 

{xL,{ 
     LaTeX -> "XL"}}, 

{xR,{ 
     LaTeX -> "XR"}}, 

{psiL,{ 
     LaTeX -> "\\psi_L"}}, 

{psiR,{ 
     LaTeX -> "\\psi_R"}}, 

{tL,{ 
     LaTeX -> "tl"}}, 

{tR,{ 
     LaTeX -> "tr"}}, 

{qdL,{ 
     LaTeX -> "qdl"}}, 

{quL,{ 
     LaTeX -> "qul"}}, 

{qdR,{ 
     LaTeX -> "qdr"}}, 

{quR,{ 
     LaTeX -> "qur"}}, 

{DL,{ 
     LaTeX -> "D_L"}}, 

{DR,{ 
     LaTeX -> "D_R"}}, 

{UL,{ 
     LaTeX -> "U_L"}}, 

{UR,{ 
     LaTeX -> "U_R"}}, 

{EL,{ 
     LaTeX -> "E_L"}}, 

{ER,{ 
     LaTeX -> "E_R"}}, 

{TQL,{ 
     LaTeX -> "tql"}}, 

{TQR,{ 
     LaTeX -> "tqr"}}, 

{phiH,{ 
     LaTeX -> "H"}}, 

{phiS,{ 
     LaTeX -> "S"}}, 

{d,{ 
     LaTeX -> "d"}}, 

{e,{ 
     LaTeX -> "e"}}, 

{H,{ 
     LaTeX -> "h"}}, 

{l,{ 
     LaTeX -> "l"}}, 

{PSIL,{ 
     LaTeX -> "psil"}}, 

{PSIR,{ 
     LaTeX -> "psir"}}, 

{q,{ 
     LaTeX -> "q"}}, 

{QL,{ 
     LaTeX -> "ql"}}, 

{QR,{ 
     LaTeX -> "qr"}}, 

{s,{ 
     LaTeX -> "s"}}, 

{SDM,{ 
     LaTeX -> "sdm"}}, 

{TL,{ 
     LaTeX -> "tl"}}, 

{TR,{ 
     LaTeX -> "tr"}}, 

{u,{ 
     LaTeX -> "u"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

{VWB,{ 
     LaTeX -> "WB"}}, 

{XL,{ 
     LaTeX -> "xl"}}, 

{XR,{ 
     LaTeX -> "xr"}} 
}; 




