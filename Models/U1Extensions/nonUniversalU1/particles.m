(* SARAH generated template for particles.m file for nonUniversalU1 *)
(* File created at 17:55 on 10.1.2016  *) 

(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A_h", 
     Mass -> LesHouches, 
     OutputName -> "Ah", 
     PDG -> {0, 0, 600006}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> {0, External}}}, 

{Fd,{ 
     Description -> "Down-Quarks", 
     FeynArtsNr -> 4, 
     LaTeX -> "d", 
     Mass -> {0.0035, 0.104, 4.2}, 
     OutputName -> "d", 
     PDG -> {1, 3, 5, 600009, 600010}   (* adjusted number of PDGs to number of generations  *), 
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
     PDG -> {2, 4, 6, 600012}   (* adjusted number of PDGs to number of generations  *), 
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
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWm,{ 
     Description -> "Negative W-Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWm], 
     OutputName -> "gWm", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{gWmC,{ 
     Description -> "Positive W-Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWm], 
     OutputName -> "gWpC", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 1, 
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

{gZp,{ 
     Description -> "Z'-Ghost", 
     FeynArtsNr -> 10, 
     LaTeX -> "\\eta^{Z'}", 
     Mass -> Automatic, 
     OutputName -> "gZp", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "hh", 
     PDG -> {25, 35, 600020}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> "H^-", 
     Mass -> LesHouches, 
     OutputName -> "Hm", 
     PDG -> {0, 600022}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> -1, 
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

{VP,{ 
     Description -> "Photon", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\gamma", 
     Mass -> 0, 
     OutputName -> "A", 
     PDG -> {22}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{VWm,{ 
     Description -> "W-Boson", 
     Goldstone -> Hm[{1}], 
     FeynArtsNr -> 3, 
     LaTeX -> {"W^-","W^+"}, 
     Mass -> Dependence, 
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]], 
     OutputName -> {"Wm","Wp"}, 
     PDG -> {-24}, 
     ElectricCharge -> -1, 
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

{VZp,{ 
     Description -> "Z'-Boson", 
     Goldstone -> Ah[{2}], 
     FeynArtsNr -> 10, 
     LaTeX -> "{Z'}", 
     Mass -> LesHouches, 
     OutputName -> "Zp", 
     PDG -> {31}, 
     ElectricCharge -> 0, 
     Width -> Automatic}} 
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

{gBp,{ 
     Description -> "B'-Boson Ghost", 
     FeynArtsNr -> 10, 
     LaTeX -> "{g_{B'}}", 
     Mass -> LesHouches, 
     OutputName -> "gBp", 
     PDG -> {0}, 
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

{gWB,{ 
     Description -> "W-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^W", 
     Mass -> 0, 
     OutputName -> "gW", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 

{si,{ 
     FeynArtsNr -> 98, 
     LaTeX -> "si", 
     Mass -> Automatic, 
     OutputName -> "SI", 
     PDG -> {0}, 
     Width -> {0}}}, 

{VB,{ 
     Description -> "B-Boson", 
     FeynArtsNr -> 1, 
     LaTeX -> "B", 
     Mass -> 0, 
     OutputName -> "B", 
     PDG -> {0}, 
     Width -> 0}}, 

{VBp,{ 
     Description -> "B'-Boson", 
     FeynArtsNr -> 10, 
     LaTeX -> "{B'}", 
     Mass -> LesHouches, 
     OutputName -> "Bp", 
     PDG -> {0}, 
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

{VWB,{ 
     Description -> "W-Bosons", 
     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 24, 25}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 



(*  ----------- Additional particles in the model ---------- *) 

{d1L,{ 
     FeynArtsNr -> 99   (* auto generated FeynArts number *), 
     LaTeX -> "d1l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "d1l"   (* auto generated Output name *), 
     PDG -> {27}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{d23L,{ 
     FeynArtsNr -> 101   (* auto generated FeynArts number *), 
     LaTeX -> "d23l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "d23l"   (* auto generated Output name *), 
     PDG -> {30, 31}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 103   (* auto generated FeynArts number *), 
     LaTeX -> "dr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {35, 36, 37}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 105   (* auto generated FeynArts number *), 
     LaTeX -> "el"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {41, 42, 43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 107   (* auto generated FeynArts number *), 
     LaTeX -> "er"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {47, 48, 49}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H10,{ 
     FeynArtsNr -> 109   (* auto generated FeynArts number *), 
     LaTeX -> "{h1}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h10"   (* auto generated Output name *), 
     PDG -> {51}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H1m,{ 
     FeynArtsNr -> 111   (* auto generated FeynArts number *), 
     LaTeX -> "h1m"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h1m"   (* auto generated Output name *), 
     PDG -> {53}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H20,{ 
     FeynArtsNr -> 113   (* auto generated FeynArts number *), 
     LaTeX -> "{h2}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h20"   (* auto generated Output name *), 
     PDG -> {55}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H2m,{ 
     FeynArtsNr -> 115   (* auto generated FeynArts number *), 
     LaTeX -> "h2m"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h2m"   (* auto generated Output name *), 
     PDG -> {57}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{jL,{ 
     FeynArtsNr -> 117   (* auto generated FeynArts number *), 
     LaTeX -> "jl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "jl"   (* auto generated Output name *), 
     PDG -> {60, 61}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{jR,{ 
     FeynArtsNr -> 119   (* auto generated FeynArts number *), 
     LaTeX -> "jr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "jr"   (* auto generated Output name *), 
     PDG -> {64, 65}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{nuR,{ 
     FeynArtsNr -> 121   (* auto generated FeynArts number *), 
     LaTeX -> "{\\nu}_{r}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "nur"   (* auto generated Output name *), 
     PDG -> {69, 70, 71}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{tL,{ 
     FeynArtsNr -> 123   (* auto generated FeynArts number *), 
     LaTeX -> "tl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "tl"   (* auto generated Output name *), 
     PDG -> {73}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{tR,{ 
     FeynArtsNr -> 125   (* auto generated FeynArts number *), 
     LaTeX -> "tr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "tr"   (* auto generated Output name *), 
     PDG -> {75}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{u1L,{ 
     FeynArtsNr -> 127   (* auto generated FeynArts number *), 
     LaTeX -> "u1l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "u1l"   (* auto generated Output name *), 
     PDG -> {77}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{u23L,{ 
     FeynArtsNr -> 129   (* auto generated FeynArts number *), 
     LaTeX -> "u23l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "u23l"   (* auto generated Output name *), 
     PDG -> {80, 81}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 131   (* auto generated FeynArts number *), 
     LaTeX -> "ur"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {85, 86, 87}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 133   (* auto generated FeynArts number *), 
     LaTeX -> "v_{l}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {91, 92, 93}   (* auto generated PDGs  *), 
     Width -> Automatic}} 
}; 




(* ###############            Weyl Spinors and intermediate states       ################# *) 

WeylFermionAndIndermediate = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

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

{SI,{ 
     LaTeX -> "si"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{d1L,{ 
     LaTeX -> "d1l"   (* auto generated LaTeX name *)}}, 

{u1L,{ 
     LaTeX -> "u1l"   (* auto generated LaTeX name *)}}, 

{d23L,{ 
     LaTeX -> "d23l"   (* auto generated LaTeX name *)}}, 

{u23L,{ 
     LaTeX -> "u23l"   (* auto generated LaTeX name *)}}, 

{nuR,{ 
     LaTeX -> "{\\nu}_{r}"   (* auto generated LaTeX name *)}}, 

{tL,{ 
     LaTeX -> "tl"   (* auto generated LaTeX name *)}}, 

{tR,{ 
     LaTeX -> "tr"   (* auto generated LaTeX name *)}}, 

{jL,{ 
     LaTeX -> "jl"   (* auto generated LaTeX name *)}}, 

{jR,{ 
     LaTeX -> "jr"   (* auto generated LaTeX name *)}}, 

{VL,{ 
     LaTeX -> "L"   (* auto generated LaTeX name *)}}, 

{sigmaH1,{ 
     LaTeX -> "{\\sigma}_{h1}"   (* auto generated LaTeX name *)}}, 

{phiH1,{ 
     LaTeX -> "{\\phi}_{h1}"   (* auto generated LaTeX name *)}}, 

{sigmaH2,{ 
     LaTeX -> "{\\sigma}_{h2}"   (* auto generated LaTeX name *)}}, 

{phiH2,{ 
     LaTeX -> "{\\phi}_{h2}"   (* auto generated LaTeX name *)}}, 

{sigmaS,{ 
     LaTeX -> "{\\sigma}_{s}"   (* auto generated LaTeX name *)}}, 

{phiS,{ 
     LaTeX -> "{\\phi}_{s}"   (* auto generated LaTeX name *)}}, 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{H1,{ 
     LaTeX -> "h1"   (* auto generated LaTeX name *)}}, 

{H2,{ 
     LaTeX -> "h2"   (* auto generated LaTeX name *)}}, 

{JL,{ 
     LaTeX -> "jl"   (* auto generated LaTeX name *)}}, 

{JR,{ 
     LaTeX -> "jr"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "l"   (* auto generated LaTeX name *)}}, 

{nu,{ 
     LaTeX -> "\\nu"   (* auto generated LaTeX name *)}}, 

{q1,{ 
     LaTeX -> "q1"   (* auto generated LaTeX name *)}}, 

{q23,{ 
     LaTeX -> "q23"   (* auto generated LaTeX name *)}}, 

{TL,{ 
     LaTeX -> "tl"   (* auto generated LaTeX name *)}}, 

{TR,{ 
     LaTeX -> "tr"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VBp,{ 
     LaTeX -> "Bp"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}} 
}; 




