(* SARAH generated template for particles.m file for ScalarLeptoquarks *)
(* File created at 11:15 on 17.1.2016  *) 

(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{sigmaH,{ 
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
     PDG -> {25, 29}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hp,{ 
	Description -> "Charged Higgs", 
    PDG -> {0},
    PDG.IX ->{0},
    Width -> {0}, 
    Mass -> {0},
    LaTeX -> {"H^+","H^-"},
    ElectricCharge->+1,    
    OutputName -> {"Hp","Hm"}}},
	  
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

{VWp,{ (* Fix the naming scheme *)
     Description -> "W+ - Boson", 
     Goldstone -> Hp, 
     FeynArtsNr -> 3, 
     LaTeX -> {"W^+","W^+"}, 
     Mass -> Dependence, 
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]], 
     OutputName -> {"Wp","Wm"}, 
     PDG -> {24}, 
     ElectricCharge -> 1, 
     Width -> 2.141}}, 

{VZ,{ 
     Description -> "Z-Boson", 
     Goldstone -> sigmaH,
     FeynArtsNr -> 2, 
     LaTeX -> "Z", 
     Mass -> 91.1876, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> 2.4952}}, 



(*  ----------- Additional particles in the model ---------- *) 

{FChi0,{ 
     FeynArtsNr -> 6, 
     LaTeX -> "{\\chi}^0", 
     Mass -> LesHouches, 
     OutputName -> "FChi0", 
     PDG -> {32, 33}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{FChip,{ 
     FeynArtsNr -> 8, 
     LaTeX -> "{\\chi}^+", 
     Mass -> LesHouches, 
     OutputName -> "FChip", 
     PDG -> {36, 37}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{Phi0,{ 
     FeynArtsNr -> 10, 
     LaTeX -> "{\\phi}^0", 
     Mass -> LesHouches, 
     OutputName -> "Phi0", 
     PDG -> {39}, 
     ElectricCharge -> -1/3, 
     Width -> 0}} 
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
     PDG -> {0}, 
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
     LaTeX -> "H^+", 
     Mass -> Automatic, 
     OutputName -> Hp, 
     PDG -> {0}, 
     ElectricCharge -> -1, 
     Width -> 0}}, 

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

{Chi0,{ 
     FeynArtsNr -> 6   (* auto generated FeynArts number *), 
     LaTeX -> "{\\chi}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "Chi0"   (* auto generated Output name *), 
     PDG -> {28, 29}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Chim,{ 
     FeynArtsNr -> 8   (* auto generated FeynArts number *), 
     LaTeX -> "{\\chi}^-"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "Chim"   (* auto generated Output name *), 
     PDG -> {32, 33}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Chip,{ 
     FeynArtsNr -> 10   (* auto generated FeynArts number *), 
     LaTeX -> "{\\chi}^+"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "Chip"   (* auto generated Output name *), 
     PDG -> {36, 37}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dL,{ 
     FeynArtsNr -> 12   (* auto generated FeynArts number *), 
     LaTeX -> "dl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl"   (* auto generated Output name *), 
     PDG -> {41, 42, 43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 14   (* auto generated FeynArts number *), 
     LaTeX -> "dr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {47, 48, 49}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 16   (* auto generated FeynArts number *), 
     LaTeX -> "el"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {53, 54, 55}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 18   (* auto generated FeynArts number *), 
     LaTeX -> "er"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {59, 60, 61}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Phi0,{ 
     FeynArtsNr -> 20   (* auto generated FeynArts number *), 
     LaTeX -> "{\\phi}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "phi0"   (* auto generated Output name *), 
     PDG -> {63}   (* auto generated PDGs  *), 
     Width -> 0}}, 

{S0,{ 
     FeynArtsNr -> 22   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{0}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "s0"   (* auto generated Output name *), 
     PDG -> {65}   (* auto generated PDGs  *), 
     Width -> 0}}, 

{uL,{ 
     FeynArtsNr -> 24   (* auto generated FeynArts number *), 
     LaTeX -> "ul"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul"   (* auto generated Output name *), 
     PDG -> {69, 70, 71}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 26   (* auto generated FeynArts number *), 
     LaTeX -> "ur"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {75, 76, 77}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 28   (* auto generated FeynArts number *), 
     LaTeX -> "v_{l}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {81, 82, 83}   (* auto generated PDGs  *), 
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

{H,{ 
     LaTeX -> "H"}}, 

{q,{ 
     LaTeX -> "q"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{Chi0,{ 
     LaTeX -> "{\\chi}^0"   (* auto generated LaTeX name *)}}, 

{Chim,{ 
     LaTeX -> "{\\chi}_{m}"   (* auto generated LaTeX name *)}}, 

{Chip,{ 
     LaTeX -> "{\\chi}_{p}"   (* auto generated LaTeX name *)}}, 

{ChiL,{ 
     LaTeX -> "{\\chi}_{l}"   (* auto generated LaTeX name *)}}, 

{ChiR,{ 
     LaTeX -> "{\\chi}_{r}"   (* auto generated LaTeX name *)}}, 

{sigmaH,{ 
     LaTeX -> "{\\sigma}_{h}"   (* auto generated LaTeX name *)}}, 

{phiH,{ 
     LaTeX -> "{\\phi}_{h}"   (* auto generated LaTeX name *)}}, 

{sigmaS,{ 
     LaTeX -> "{\\sigma}_{s}"   (* auto generated LaTeX name *)}}, 

{phiS,{ 
     LaTeX -> "{\\phi}_{s}"   (* auto generated LaTeX name *)}}, 

{Chi,{ 
     LaTeX -> "\\chi"   (* auto generated LaTeX name *)}}, 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "l"   (* auto generated LaTeX name *)}}, 

{Phi,{ 
     LaTeX -> "\\phi"   (* auto generated LaTeX name *)}}, 

{S,{ 
     LaTeX -> "\\tilde{}"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}} 
}; 




