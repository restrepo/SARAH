(* SARAH generated template for particles.m file for GTHDM *)
(* File created at 16:35 on 18.1.2016  *) 

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
     Mass -> {0, 0}, 
     OutputName -> "Ah", 
     PDG -> {0, 0}, 
     ElectricCharge -> 0, 
     Width -> {0, 0}}}, 

{Fd,{ 
     Description -> "Down-Quarks", 
     FeynArtsNr -> 4, 
     LaTeX -> "d", 
     Mass -> {0.0035, 0.104, 4.2}, 
     OutputName -> "d", 
     PDG -> {1, 3, 5}, 
     ElectricCharge -> -1/3, 
     Width -> {0, 0, 0}}}, 

{Fdp,{ 
     FeynArtsNr -> 94, 
     LaTeX -> "d^\\prime", 
     Mass -> LesHouches, 
     OutputName -> "fdp", 
     PDG -> {6000020, 6000021, 6000022}, 
     ElectricCharge -> -1/3, 
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

{Fep,{ 
     FeynArtsNr -> 96, 
     LaTeX -> "e^\\prime", 
     Mass -> LesHouches, 
     OutputName -> "fep", 
     PDG -> {6000026, 6000027, 6000028}, 
     ElectricCharge -> -1, 
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

{Fup,{ 
     FeynArtsNr -> 98, 
     LaTeX -> "u^\\prime", 
     Mass -> LesHouches, 
     OutputName -> "fup", 
     PDG -> {6000032, 6000033, 6000034}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> LesHouches, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16}, 
     ElectricCharge -> 0, 
     Width -> External}}, 

{Fvp,{ 
     FeynArtsNr -> 100, 
     LaTeX -> "\\nu^\\prime", 
     Mass -> LesHouches, 
     OutputName -> "fvp", 
     PDG -> {6000038, 6000039, 6000040}, 
     ElectricCharge -> 0, 
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
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^P", 
     Mass -> 0, 
     OutputName -> "gP", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWp,{ 
     Description -> "Negative W-Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta_L^-", 
     Mass -> Mass[VWp], 
     OutputName -> "gWp", 
     PDG -> {0}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{gWpC,{ 
     Description -> "Positive W-Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta_L^+", 
     Mass -> Mass[VWp], 
     OutputName -> "gWpp", 
     PDG -> {0}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{gWpr,{ 
     FeynArtsNr -> 102, 
     LaTeX -> "\\eta_{W^\\prime}", 
     Mass -> Mass[VWpr], 
     OutputName -> "gwpr", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{gWprC,{ 
     FeynArtsNr -> 104, 
     LaTeX -> "\\eta_{W^{\\prime C}}", 
     Mass -> Mass[VWpr], 
     OutputName -> "gwpr2", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
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

{gZP,{ 
     FeynArtsNr -> 106, 
     LaTeX -> "\\eta_{Z^\\prime}", 
     Mass -> Mass[VZP], 
     OutputName -> "gzp", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "h", 
     PDG -> {25, 35, 335}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hpm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> "H_x", 
     Mass -> LesHouches, 
     OutputName -> "Hx", 
     PDG -> {0, -37, -47}, 
     ElectricCharge -> 0, 
     Width -> External}}, 

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
     Description -> "W-Boson", 
     Goldstone ->H1p, 
     FeynArtsNr -> 3, 
     LaTeX -> {"W^+","W^-"}, 
     Mass -> Dependence, 
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]], 
     OutputName -> {"Wp","Wm"}, 
     PDG -> {24}, 
     ElectricCharge -> 1, 
     Width -> 2.141}}, 

{VWpr,{ 
     Goldstone -> Hpm[{1}], 
     FeynArtsNr -> 112, 
     LaTeX -> "W^\\prime", 
     Mass -> LesHouches, 
     OutputName -> "vwpr", 
     PDG -> {6000046}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{VZ,{ 
     Description -> "Z-Boson", 
     Goldstone -> Ah[{1}], 
     FeynArtsNr -> 2, 
     LaTeX -> "Z", 
     Mass -> 91.1876, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> 2.4952}}, 

{VZP,{ 
     Goldstone -> Ah[{2}], 
     FeynArtsNr -> 114, 
     LaTeX -> "Z^\\prime", 
     Mass -> LesHouches, 
     OutputName -> "vzp", 
     PDG -> {6000048}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 



     {H1p,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 FeynArtsNr -> 7,
                 ElectricCharge->+1,                 
                 LaTeX -> {"H^+","H^-"},
                 OutputName -> {"Hp","Hm"}
                 }},      

{H2c,{ 
     FeynArtsNr -> 117   (* auto generated FeynArts number *), 
     LaTeX -> "h_2^c"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h2c"   (* auto generated Output name *), 
     PDG -> {6000052}   (* auto generated PDGs  *), 
     ElectricCharge -> 1 , 
     Width -> Automatic}} 
}; 




(* ###############            GaugeES       ################# *) 

ParticleDefinitions[GaugeES] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{delta0,{ 
     FeynArtsNr -> 142, 
     LaTeX -> "{\\delta}^0", 
     Mass -> LesHouches, 
     OutputName -> "del0", 
     PDG -> {27}, 
     Width -> Automatic}}, 

{deltaM,{ 
     FeynArtsNr -> 144, 
     LaTeX -> "{\\delta}^{-}", 
     Mass -> LesHouches, 
     OutputName -> "delm", 
     PDG -> {29}, 
     Width -> Automatic}}, 

{dRH,{ 
     FeynArtsNr -> 146, 
     LaTeX -> "d_R^H", 
     Mass -> LesHouches, 
     OutputName -> "drh", 
     PDG -> {33, 34, 35}, 
     Width -> Automatic}}, 

{eRH,{ 
     FeynArtsNr -> 148, 
     LaTeX -> "e_R^H", 
     Mass -> LesHouches, 
     OutputName -> "erh", 
     PDG -> {39, 40, 41}, 
     Width -> Automatic}}, 

{Fd1,{ 
     Description -> "Dirac Left Down-Quark", 
     FeynArtsNr -> 120, 
     LaTeX -> "d^1", 
     Mass -> LesHouches, 
     OutputName -> "d1", 
     PDG -> {1, 3, 5}, 
     Width -> {0, 0, 0}}}, 

{Fd2,{ 
     Description -> "Dirac Right Down-Quark", 
     FeynArtsNr -> 121, 
     LaTeX -> "d^2", 
     Mass -> LesHouches, 
     OutputName -> "d2", 
     PDG -> {0, 0, 0}, 
     Width -> {0, 0, 0}}}, 

{Fe1,{ 
     Description -> "Dirac Left Electron", 
     FeynArtsNr -> 130, 
     LaTeX -> "e^1", 
     Mass -> LesHouches, 
     OutputName -> "e1", 
     PDG -> {11, 13, 15}, 
     Width -> {0, 0, 0}}}, 

{Fe2,{ 
     Description -> "Dirac Right Electron", 
     FeynArtsNr -> 131, 
     LaTeX -> "e^2", 
     Mass -> LesHouches, 
     OutputName -> "e2", 
     PDG -> {0, 0, 0}, 
     Width -> {0, 0, 0}}}, 

{Fu1,{ 
     Description -> "Dirac Left Up-Quark", 
     FeynArtsNr -> 110, 
     LaTeX -> "u^1", 
     Mass -> LesHouches, 
     OutputName -> "u1", 
     PDG -> {2, 4, 6}, 
     Width -> {0, 0, 0}}}, 

{Fu2,{ 
     Description -> "Dirac Right Up-Quark", 
     FeynArtsNr -> 111, 
     LaTeX -> "u^2", 
     Mass -> LesHouches, 
     OutputName -> "u2", 
     PDG -> {0, 0, 0}, 
     Width -> {0, 0, 0}}}, 

{Fv1,{ 
     Description -> "Dirac Left Neutrino", 
     FeynArtsNr -> 140, 
     LaTeX -> "\\nu^1", 
     Mass -> LesHouches, 
     OutputName -> "v1", 
     PDG -> {12, 14, 16}, 
     Width -> {0, 0, 0}}}, 

{Fv2,{ 
     Description -> "Dirac Right Neutrino", 
     FeynArtsNr -> 141, 
     LaTeX -> "\\nu^2", 
     Mass -> LesHouches, 
     OutputName -> "v2", 
     PDG -> {0, 0, 0}, 
     Width -> {0, 0, 0}}}, 

{gB,{ 
     Description -> "B-Boson Ghost", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^B", 
     Mass -> 0, 
     OutputName -> "gB", 
     PDG -> {0}, 
     Width -> 0}}, 

{gEH,{ 
     FeynArtsNr -> 150, 
     LaTeX -> "\\eta_{H}", 
     Mass -> LesHouches, 
     OutputName -> "geh", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
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

{gWL,{ 
     Description -> "W-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^W", 
     Mass -> 0, 
     OutputName -> "gW", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 

{H10,{ 
     FeynArtsNr -> 152, 
     LaTeX -> "h_1^0", 
     Mass -> LesHouches, 
     OutputName -> "h10", 
     PDG -> {43}, 
     Width -> Automatic}}, 

{H20,{ 
     FeynArtsNr -> 108, 
     LaTeX -> "h_2^0", 
     Mass -> LesHouches, 
     OutputName -> "h20", 
     PDG -> {6000042}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Phi0,{ 
     FeynArtsNr -> 158, 
     LaTeX -> "{\\phi}^0", 
     Mass -> LesHouches, 
     OutputName -> "phi0", 
     PDG -> {49}, 
     Width -> Automatic}}, 

{PhiP,{ 
     FeynArtsNr -> 160, 
     LaTeX -> "{\\phi}^{+}", 
     Mass -> LesHouches, 
     OutputName -> "phip", 
     PDG -> {51}, 
     Width -> Automatic}}, 

{uRH,{ 
     FeynArtsNr -> 162, 
     LaTeX -> "u_R^H", 
     Mass -> LesHouches, 
     OutputName -> "urh", 
     PDG -> {55, 56, 57}, 
     Width -> Automatic}}, 

{VB,{ 
     Description -> "B-Boson", 
     FeynArtsNr -> 1, 
     LaTeX -> "B", 
     Mass -> 0, 
     OutputName -> "B", 
     PDG -> {0}, 
     Width -> 0}}, 

{VEH,{ 
     FeynArtsNr -> 164, 
     LaTeX -> "W_H", 
     Mass -> LesHouches, 
     OutputName -> "veh", 
     PDG -> {61, 62, 63}, 
     Width -> Automatic}}, 

{VG,{ 
     Description -> "Gluon", 
     FeynArtsNr -> 5, 
     LaTeX -> "g", 
     Mass -> 0, 
     OutputName -> "g", 
     PDG -> {21}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{vRH,{ 
     FeynArtsNr -> 166, 
     LaTeX -> "\\nu_R^H", 
     Mass -> LesHouches, 
     OutputName -> "vrh", 
     PDG -> {67, 68, 69}, 
     Width -> Automatic}}, 

{VWL,{ 
     Description -> "W-Bosons", 
     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 24, 25}, 
     Width -> 0}}, 

{xd,{ 
     FeynArtsNr -> 168, 
     LaTeX -> "\\chi_d", 
     Mass -> LesHouches, 
     OutputName -> "xd", 
     PDG -> {73, 74, 75}, 
     Width -> Automatic}}, 

{xe,{ 
     FeynArtsNr -> 170, 
     LaTeX -> "\\chi_e", 
     Mass -> LesHouches, 
     OutputName -> "xe", 
     PDG -> {79, 80, 81}, 
     Width -> Automatic}}, 

{xu,{ 
     FeynArtsNr -> 172, 
     LaTeX -> "\\chi_u", 
     Mass -> LesHouches, 
     OutputName -> "xu", 
     PDG -> {85, 86, 87}, 
     Width -> Automatic}}, 

{xv,{ 
     FeynArtsNr -> 174, 
     LaTeX -> "\\chi_\\nu", 
     Mass -> LesHouches, 
     OutputName -> "xv", 
     PDG -> {91, 92, 93}, 
     Width -> Automatic}}, 



(*  ----------- Additional particles in the model ---------- *) 

     {H1p,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 LaTeX -> {"H^+","H^-"},
                 OutputName -> {"Hp","Hm"}
                 }},      

{H2c,{ 
     FeynArtsNr -> 177   (* auto generated FeynArts number *), 
     LaTeX -> "h_2^c"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h2c"   (* auto generated Output name *), 
     PDG -> {6000048}   (* auto generated PDGs  *), 
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

{dRH,{ 
     LaTeX -> "d_R^H"}}, 

{uR,{ 
     LaTeX -> "u_R"}}, 

{uRH,{ 
     LaTeX -> "u_R^H"}}, 

{vR,{ 
     LaTeX -> "\\nu_R"}}, 

{vRH,{ 
     LaTeX -> "\\nu_R^H"}}, 

{eR,{ 
     LaTeX -> "e_R"}}, 

{eRH,{ 
     LaTeX -> "e_R^H"}}, 

{xd,{ 
     LaTeX -> "\\chi_d"}}, 

{xu,{ 
     LaTeX -> "\\chi_u"}}, 

{xv,{ 
     LaTeX -> "\\chi_\\nu"}}, 

{xe,{ 
     LaTeX -> "\\chi_e"}}, 

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

{VL,{ 
     LaTeX -> "V_L"}}, 

{VR,{ 
     LaTeX -> "V_R"}}, 

{DLp,{ 
     LaTeX -> "D_L^\\prime"}}, 

{DRp,{ 
     LaTeX -> "D_R^\\prime"}}, 

{ULp,{ 
     LaTeX -> "U_L^\\prime"}}, 

{URp,{ 
     LaTeX -> "U_R^\\prime"}}, 

{ELp,{ 
     LaTeX -> "E_L^\\prime"}}, 

{ERp,{ 
     LaTeX -> "E_R^\\prime"}}, 

{VLp,{ 
     LaTeX -> "V_L^\\prime"}}, 

{VRp,{ 
     LaTeX -> "V_R^\\prime"}}, 

{sigmaH10,{ 
     LaTeX -> "\\sigma_{H_1^0}"}}, 

{phiH10,{ 
     LaTeX -> "\\phi_{H_1^0}"}}, 

{sigmaP,{ 
     LaTeX -> "\\sigma_\\phi"}},

{phiP,{ 
     LaTeX -> "\\phi_\\phi"}}, 

{phiD,{ 
     LaTeX -> "{\\phi}_\\Delta"}}, 

{DeltaH,{ 
     LaTeX -> "{\\Delta}_{H}"}}, 

{DR,{ 
     LaTeX -> "D_R"}}, 

{ER,{ 
     LaTeX -> "E_R"}}, 

{H,{ 
     LaTeX -> "H"}}, 

{LL,{ 
     LaTeX -> "L_L"}}, 

{NR,{ 
     LaTeX -> "N_R"}}, 

{Phi,{ 
     LaTeX -> "\\phi"}}, 

{QL,{ 
     LaTeX -> "Q_L"}}, 

{UR,{ 
     LaTeX -> "U_R"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VEH,{ 
     LaTeX -> "W_H"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

{VWL,{ 
     LaTeX -> "{W}_L"}}, 

{XD,{ 
     LaTeX -> "\\chi_d"}}, 

{XE,{ 
     LaTeX -> "\\chi_e"}}, 

{XN,{ 
     LaTeX -> "\\chi_\\nu"}}, 

{XU,{ 
     LaTeX -> "\\chi_u"}} 
}; 




