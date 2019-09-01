(* SARAH generated template for particles.m file for SplitMSSM *)
(* File created at 10:28 on 29.2.2016  *) 

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

{Cha,{ 
     Description -> "Charginos", 
     FeynArtsNr -> 12, 
     LaTeX -> {"\\tilde{\\chi}^-","\\tilde{\\chi}^+"}, 
     Mass -> LesHouches, 
     OutputName -> "C", 
     PDG -> {-1000024, -1000037}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Chi,{ 
     Description -> "Neutralinos", 
     FeynArtsNr -> 11, 
     LaTeX -> "\\tilde{\\chi}^0", 
     Mass -> LesHouches, 
     OutputName -> "N", 
     PDG -> {1000022, 1000023, 1000025, 1000035}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Fd,{ 
     Description -> "Down-Quarks", 
     FeynArtsNr -> 4, 
     LaTeX -> "d", 
     Mass -> {0.0035, 0.104, 4.2}, 
     OutputName -> "d", 
     PDG -> {1, 3, 5}, 
     ElectricCharge -> -1/3, 
     Width -> {0, 0, 0}}}, 

{Fe,{ 
     Description -> "Leptons", 
     FeynArtsNr -> 2, 
     LaTeX -> "e", 
     Mass -> {0.000511, 0.105, 1.776}, 
     OutputName -> "e", 
     PDG -> {11, 13, 15}, 
     ElectricCharge -> -1, 
     Width -> {0, 0, 0}}}, 

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

{gG,{ 
     Description -> "Gluon Ghost", 
     FeynArtsNr -> 5, 
     LaTeX -> "\\eta^G", 
     Mass -> 0, 
     OutputName -> "gG", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{Glu,{ 
     Description -> "Gluino", 
     FeynArtsNr -> 15, 
     LaTeX -> "\\tilde{g}", 
     Mass -> LesHouches, 
     OutputName -> "go", 
     PDG -> {1000021}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{gP,{ 
     Description -> "Photon Ghost", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^{\\gamma}", 
     Mass -> 0, 
     OutputName -> "gA", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWp,{ 
     Description -> "Positive W+ - Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWp], 
     OutputName -> "gWp", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{gWpC,{ 
     Description -> "Negative W+ - Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWp], 
     OutputName -> "gWC", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{gZ,{ 
     Description -> "Z-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^Z", 
     Mass -> Mass[VZ], 
     OutputName -> "gZ", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "h", 
     PDG -> {25}, 
     ElectricCharge -> 0, 
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
     ElectricCharge -> -1, 
     Width -> {0}}}, 

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
     PDG -> {0, 24, 25}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 



(*  ----------- Additional particles in the model ---------- *) 

{dL,{ 
     FeynArtsNr -> 132   (* auto generated FeynArts number *), 
     LaTeX -> "dl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl"   (* auto generated Output name *), 
     PDG -> {29, 30, 31}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 134   (* auto generated FeynArts number *), 
     LaTeX -> "dr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {35, 36, 37}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 136   (* auto generated FeynArts number *), 
     LaTeX -> "el"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {41, 42, 43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 138   (* auto generated FeynArts number *), 
     LaTeX -> "er"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {47, 48, 49}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fB,{ 
     FeynArtsNr -> 140   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{B}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fb"   (* auto generated Output name *), 
     PDG -> {51}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fG,{ 
     FeynArtsNr -> 142   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{G}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fg"   (* auto generated Output name *), 
     PDG -> {53}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHd0,{ 
     FeynArtsNr -> 144   (* auto generated FeynArts number *), 
     LaTeX -> "{Hd}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhd0"   (* auto generated Output name *), 
     PDG -> {55}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHdm,{ 
     FeynArtsNr -> 146   (* auto generated FeynArts number *), 
     LaTeX -> "Hdm"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhdm"   (* auto generated Output name *), 
     PDG -> {57}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHu0,{ 
     FeynArtsNr -> 148   (* auto generated FeynArts number *), 
     LaTeX -> "{Hu}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhu0"   (* auto generated Output name *), 
     PDG -> {59}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHup,{ 
     FeynArtsNr -> 150   (* auto generated FeynArts number *), 
     LaTeX -> "Hup"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhup"   (* auto generated Output name *), 
     PDG -> {61}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fW0,{ 
     FeynArtsNr -> 152   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{{W}^0}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fw0"   (* auto generated Output name *), 
     PDG -> {63}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fWm,{ 
     FeynArtsNr -> 154   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{Wm}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fwm"   (* auto generated Output name *), 
     PDG -> {65}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fWp,{ 
     FeynArtsNr -> 156   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{Wp}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fwp"   (* auto generated Output name *), 
     PDG -> {67}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 158   (* auto generated FeynArts number *), 
     LaTeX -> "ul"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul"   (* auto generated Output name *), 
     PDG -> {71, 72, 73}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 160   (* auto generated FeynArts number *), 
     LaTeX -> "ur"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {77, 78, 79}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 162   (* auto generated FeynArts number *), 
     LaTeX -> "v_{l}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {83, 84, 85}   (* auto generated PDGs  *), 
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

{fG,{ 
     Description -> "Gluino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{g}}"}}, 

{fW0,{ 
     Description -> "Neutral Wino", 
     LaTeX -> "\\tilde{W}^0"}}, 

{fWm,{ 
     Description -> "Negative Wino", 
     LaTeX -> "\\tilde{W}^-"}}, 

{fWp,{ 
     Description -> "Positive Wino", 
     LaTeX -> "\\tilde{W}^+"}}, 

{fB,{ 
     Description -> "Bino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{B}}"}}, 

{FHd0,{ 
     Description -> "Neutral Down-Higgsino", 
     LaTeX -> "\\tilde{H}_d^0"}}, 

{FHdm,{ 
     Description -> "Charged Down-Higgsino", 
     LaTeX -> "\\tilde{H}_d^-"}}, 

{FHu0,{ 
     Description -> "Neutral Up-Higgsino", 
     LaTeX -> "\\tilde{H}_u^0"}}, 

{FHup,{ 
     Description -> "Charged Up-Higgsino", 
     LaTeX -> "\\tilde{H}_u^+"}}, 

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

{L0,{ 
     Description -> "Neutralino Weyl-Spinor", 
     LaTeX -> "\\lambda^0"}}, 

{Lm,{ 
     Description -> "Negative Chargino Weyl-Spinor", 
     LaTeX -> "\\lambda^-"}}, 

{Lp,{ 
     Description -> "Positive Chargino Weyl-Spinor", 
     LaTeX -> "\\lambda^+"}}, 

{FB,{ 
     Description -> "Bino field", 
     LaTeX -> "\\tilde{B}"}}, 

{FG,{ 
     Description -> "Gluino field", 
     LaTeX -> "\\tilde{g}"}}, 

{FW,{ 
     Description -> "Wino field", 
     LaTeX -> "\\tilde{W}"}}, 

{H,{ 
     LaTeX -> "H"}}, 

{Hd,{ 
     Description -> "Down-Higgs Superfield", 
     LaTeX -> "H_d"}}, 

{Hu,{ 
     Description -> "Up-Higgs Superfield", 
     LaTeX -> "H_u"}}, 

{q,{ 
     LaTeX -> "q"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "l"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}} 
}; 




