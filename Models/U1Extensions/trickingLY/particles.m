(* SARAH generated template for particles.m file for trickingLY *)
(* File created at 14:49 on 21.1.2016  *) 

(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "Ah", 
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

{Fx1,{ 
     Description -> "exotic Quarks-1", 
     FeynArtsNr -> 7, 
     LaTeX -> "x_1", 
     Mass -> LesHouches, 
     OutputName -> "x1", 
     PDG -> {101, 103, 105}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{Fx2,{ 
     Description -> "exotic Quarks-2", 
     FeynArtsNr -> 9, 
     LaTeX -> "x_2", 
     Mass -> LesHouches, 
     OutputName -> "x2", 
     PDG -> {102, 104, 106}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

     
{Fx3,{ 
     Description -> "exotic Quarks-1", 
     FeynArtsNr -> 17, 
     LaTeX -> "x_1", 
     Mass -> LesHouches, 
     OutputName -> "x3", 
     PDG -> {107, 109, 111}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Fx4,{ 
     Description -> "exotic Quarks-2", 
     FeynArtsNr -> 19, 
     LaTeX -> "x_4", 
     Mass -> LesHouches, 
     OutputName -> "x4", 
     PDG -> {108, 110, 112}, 
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
     OutputName -> "h", 
     PDG -> {25, 35}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

    
{Hm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> "H^-", 
     Mass -> LesHouches, 
     OutputName -> "Hm", 
     PDG -> {0}, 
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
     Goldstone -> Hm, 
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

{H0,{ 
     FeynArtsNr -> 1, 
     LaTeX -> "H^0", 
     Mass -> Automatic, 
     OutputName -> "H0", 
     PDG -> {0}, 
     Width -> {0}}}, 

{Hm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> "H^-", 
     Mass -> LesHouches, 
     OutputName -> "Hm", 
     PDG -> {0}, 
     ElectricCharge -> -1, 
     Width -> 0}}, 

{si,{ 
     FeynArtsNr -> 98, 
     LaTeX -> "s", 
     Mass -> Automatic, 
     OutputName -> "si", 
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

{dL,{ 
     FeynArtsNr -> 99   (* auto generated FeynArts number *), 
     LaTeX -> "dl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl"   (* auto generated Output name *), 
     PDG -> {29, 30, 31}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 101   (* auto generated FeynArts number *), 
     LaTeX -> "dr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {35, 36, 37}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 103   (* auto generated FeynArts number *), 
     LaTeX -> "el"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {41, 42, 43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 105   (* auto generated FeynArts number *), 
     LaTeX -> "er"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {47, 48, 49}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{rL,{ 
     FeynArtsNr -> 107   (* auto generated FeynArts number *), 
     LaTeX -> "rl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "rl"   (* auto generated Output name *), 
     PDG -> {53, 54, 55}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{rR,{ 
     FeynArtsNr -> 109   (* auto generated FeynArts number *), 
     LaTeX -> "rr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "rr"   (* auto generated Output name *), 
     PDG -> {59, 60, 61}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 111   (* auto generated FeynArts number *), 
     LaTeX -> "ul"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul"   (* auto generated Output name *), 
     PDG -> {65, 66, 67}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 113   (* auto generated FeynArts number *), 
     LaTeX -> "ur"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {71, 72, 73}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 115   (* auto generated FeynArts number *), 
     LaTeX -> "v_{l}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {77, 78, 79}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vR,{ 
     FeynArtsNr -> 117   (* auto generated FeynArts number *), 
     LaTeX -> "v_{r}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vr"   (* auto generated Output name *), 
     PDG -> {83, 84, 85}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{x1L,{ 
     FeynArtsNr -> 119   (* auto generated FeynArts number *), 
     LaTeX -> "x1l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "x1l"   (* auto generated Output name *), 
     PDG -> {89, 90, 91}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{x1R,{ 
     FeynArtsNr -> 121   (* auto generated FeynArts number *), 
     LaTeX -> "x1r"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "x1r"   (* auto generated Output name *), 
     PDG -> {95, 96, 97}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{x2L,{ 
     FeynArtsNr -> 123   (* auto generated FeynArts number *), 
     LaTeX -> "x2l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "x2l"   (* auto generated Output name *), 
     PDG -> {101, 102, 103}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{x2R,{ 
     FeynArtsNr -> 125   (* auto generated FeynArts number *), 
     LaTeX -> "x2r"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "x2r"   (* auto generated Output name *), 
     PDG -> {107, 108, 109}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{xiL,{ 
     FeynArtsNr -> 127   (* auto generated FeynArts number *), 
     LaTeX -> "{\\xi}_{l}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xil"   (* auto generated Output name *), 
     PDG -> {113, 114, 115}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{xiR,{ 
     FeynArtsNr -> 129   (* auto generated FeynArts number *), 
     LaTeX -> "{\\xi}_{r}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xir"   (* auto generated Output name *), 
     PDG -> {119, 120, 121}   (* auto generated PDGs  *), 
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

{x1L,{ 
     LaTeX -> "x_{1L}"}}, 

{x2L,{ 
     LaTeX -> "x_{2L}"}}, 

{x1R,{ 
     LaTeX -> "x_{1R}"}}, 

{x2R,{ 
     LaTeX -> "x_{2R}"}}, 

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

{X1L,{ 
     LaTeX -> "X1_L"}}, 

{X1R,{ 
     LaTeX -> "X1_R"}}, 

{X2L,{ 
     LaTeX -> "X2_L"}}, 

{X2R,{ 
     LaTeX -> "X2_R"}}, 

{VL,{ 
     LaTeX -> "V_L"}}, 

{sigmaH,{ 
     LaTeX -> "\\sigma_H"}}, 

{phiH,{ 
     LaTeX -> "\\phi_H"}}, 

{sigmaS,{ 
     LaTeX -> "\\sigma_S"}}, 

{phiS,{ 
     LaTeX -> "\\phi_S"}}, 

{H,{ 
     LaTeX -> "H"}}, 

{q,{ 
     LaTeX -> "q"}}, 

{SI,{ 
     LaTeX -> "SI"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{vR,{ 
     LaTeX -> "v_{r}"   (* auto generated LaTeX name *)}}, 

{rL,{ 
     LaTeX -> "rl"   (* auto generated LaTeX name *)}}, 

{rR,{ 
     LaTeX -> "rr"   (* auto generated LaTeX name *)}}, 

{xiL,{ 
     LaTeX -> "{\\xi}_{l}"   (* auto generated LaTeX name *)}}, 

{xiR,{ 
     LaTeX -> "{\\xi}_{r}"   (* auto generated LaTeX name *)}}, 

{VR,{ 
     LaTeX -> "R"   (* auto generated LaTeX name *)}}, 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "l"   (* auto generated LaTeX name *)}}, 

{nu,{ 
     LaTeX -> "\\nu"   (* auto generated LaTeX name *)}}, 

{RL,{ 
     LaTeX -> "rl"   (* auto generated LaTeX name *)}}, 

{RR,{ 
     LaTeX -> "rr"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VBp,{ 
     LaTeX -> "Bp"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}}, 

{XIL,{ 
     LaTeX -> "{\\xi}_{l}"   (* auto generated LaTeX name *)}}, 

{XIR,{ 
     LaTeX -> "{\\xi}_{r}"   (* auto generated LaTeX name *)}}, 

{XL,{ 
     LaTeX -> "xl"   (* auto generated LaTeX name *)}}, 

{XR,{ 
     LaTeX -> "xr"   (* auto generated LaTeX name *)}} 
}; 




