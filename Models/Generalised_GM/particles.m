(* SARAH generated template for particles.m file for GM *)
(* File created at 9:27 on 7.3.2018  *) 

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
     PDG -> {0, 39}, 
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
     OutputName -> "h", 
     PDG -> {25, 35, 41}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hpm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^+","H^-"}, 
     Mass -> {0, LesHouches}, 
     OutputName -> {"Hp","Hm"}, 
     PDG -> {0, 37, 43}, 
     ElectricCharge -> 1, 
     Width -> {0, External}}}, 

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
     Goldstone -> Hpm[{1}], 
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
     Goldstone -> Ah[{1}], 
     FeynArtsNr -> 2, 
     LaTeX -> "Z", 
     Mass -> 91.1876, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> 2.4952}}, 



(*  ----------- Additional particles in the model ---------- *) 

{xiPP,{ 
     FeynArtsNr -> 7   (* auto generated FeynArts number *), 
     LaTeX -> "{\\xi}^{++}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xipp"   (* auto generated Output name *), 
     PDG -> {47}   (* auto generated PDGs  *), 
     ElectricCharge -> 2, 
     Width -> Automatic}} 
}; 




(* ###############            GaugeES       ################# *) 

ParticleDefinitions[GaugeES] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{dL,{ 
     FeynArtsNr -> 6, 
     LaTeX -> "dl", 
     Mass -> LesHouches, 
     OutputName -> "dl", 
     PDG -> {29, 30, 31}, 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 8, 
     LaTeX -> "dr", 
     Mass -> LesHouches, 
     OutputName -> "dr", 
     PDG -> {35, 36, 37}, 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 10, 
     LaTeX -> "el", 
     Mass -> LesHouches, 
     OutputName -> "el", 
     PDG -> {41, 42, 43}, 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 12, 
     LaTeX -> "er", 
     Mass -> LesHouches, 
     OutputName -> "er", 
     PDG -> {47, 48, 49}, 
     Width -> Automatic}}, 

{eta0,{ 
     FeynArtsNr -> 14, 
     LaTeX -> "{\\eta}^0", 
     Mass -> LesHouches, 
     OutputName -> "eta0", 
     PDG -> {51}, 
     Width -> Automatic}}, 

{etaM,{ 
     FeynArtsNr -> 16, 
     LaTeX -> "{\\eta}_{m}", 
     Mass -> LesHouches, 
     OutputName -> "etam", 
     PDG -> {53}, 
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
     FeynArtsNr -> 2, 
     LaTeX -> "H^+", 
     Mass -> Automatic, 
     OutputName -> "Hp", 
     PDG -> {0}, 
     Width -> 0}}, 

{uL,{ 
     FeynArtsNr -> 18, 
     LaTeX -> "ul", 
     Mass -> LesHouches, 
     OutputName -> "ul", 
     PDG -> {57, 58, 59}, 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 20, 
     LaTeX -> "ur", 
     Mass -> LesHouches, 
     OutputName -> "ur", 
     PDG -> {63, 64, 65}, 
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

{vL,{ 
     FeynArtsNr -> 22, 
     LaTeX -> "v_{l}", 
     Mass -> LesHouches, 
     OutputName -> "vl", 
     PDG -> {69, 70, 71}, 
     Width -> Automatic}}, 

{VWB,{ 
     Description -> "W-Bosons", 
     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 24, 25}, 
     Width -> 0}}, 

{xi0,{ 
     FeynArtsNr -> 24, 
     LaTeX -> "{\\xi}^0", 
     Mass -> LesHouches, 
     OutputName -> "xi0", 
     PDG -> {73}, 
     Width -> Automatic}}, 



(*  ----------- Additional particles in the model ---------- *) 

{xiP,{ 
     FeynArtsNr -> 29   (* auto generated FeynArts number *), 
     LaTeX -> "{\\xi}_{p}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xip"   (* auto generated Output name *), 
     PDG -> {79}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{xiPP,{ 
     FeynArtsNr -> 31   (* auto generated FeynArts number *), 
     LaTeX -> "{\\xi}^{++}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xipp"   (* auto generated Output name *), 
     PDG -> {81}   (* auto generated PDGs  *), 
     Width -> Automatic}} 
}; 




(* ###############            Weyl Spinors and intermediate states       ################# *) 

WeylFermionAndIndermediate = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{dL,{ 
     LaTeX -> "dl"}}, 

{uL,{ 
     LaTeX -> "ul"}}, 

{eL,{ 
     LaTeX -> "el"}}, 

{vL,{ 
     LaTeX -> "v_{l}"}}, 

{dR,{ 
     LaTeX -> "dr"}}, 

{uR,{ 
     LaTeX -> "ur"}}, 

{eR,{ 
     LaTeX -> "er"}}, 

{FDL,{ 
     LaTeX -> "{D}_L"}}, 

{FDR,{ 
     LaTeX -> "{D}_R"}}, 

{FUL,{ 
     LaTeX -> "{U}_L"}}, 

{FUR,{ 
     LaTeX -> "{U}_R"}}, 

{FEL,{ 
     LaTeX -> "{E}_L"}}, 

{FER,{ 
     LaTeX -> "{E}_R"}}, 

{sigmaH,{ 
     LaTeX -> "{\\sigma}_{h}"}}, 

{phiH,{ 
     LaTeX -> "{\\phi}_{h}"}}, 

{phiEta,{ 
     LaTeX -> "{\\phi}_{\\eta}"}}, 

{sigmaXi,{ 
     LaTeX -> "{\\sigma}_{\\xi}"}}, 

{phiXi,{ 
     LaTeX -> "{\\phi}_{\\xi}"}}, 

{d,{ 
     LaTeX -> "d"}}, 

{e,{ 
     LaTeX -> "e"}}, 

{eta,{ 
     LaTeX -> "\\eta"}}, 

{H,{ 
     LaTeX -> "H"}}, 

{l,{ 
     LaTeX -> "l"}}, 

{q,{ 
     LaTeX -> "q"}}, 

{u,{ 
     LaTeX -> "u"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

{VWB,{ 
     LaTeX -> "WB"}}, 

{xi,{ 
     LaTeX -> "\\xi"}} 
}; 




