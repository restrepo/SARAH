(* SARAH generated template for particles.m file for THDMIVL *)
(* File created at 16:00 on 21.1.2016  *) 

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
     Mass -> {0, LesHouches}, 
     OutputName -> "Ah", 
     PDG -> {0, 36}, 
     ElectricCharge -> 0, 
     Width -> {0, External}}}, 

{Fd,{ 
     Description -> "Down-Quarks", 
     FeynArtsNr -> 4, 
     LaTeX -> "d", 
     Mass -> {0.0035, 0.104, 4.2}, 
     OutputName -> "d", 
     PDG -> {1, 3, 5}, 
     ElectricCharge -> -1/3, 
     Width -> {0, 0, 0}}}, 

{FdV,{ 
     Description -> "vectorlike Down-Quarks", 
     FeynArtsNr -> 7, 
     LaTeX -> "Fd^V", 
     Mass -> LesHouches, 
     OutputName -> "dV", 
     PDG -> {101, 103, 105, 201, 203, 205}, 
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

{FeV,{ 
     Description -> "vectorlike doubly-charged-Leptons", 
     FeynArtsNr -> 8, 
     LaTeX -> "Fe^V", 
     Mass -> LesHouches, 
     OutputName -> "eV", 
     PDG -> {111, 113, 115, 211, 213, 215}, 
     ElectricCharge -> -2, 
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

{FuV,{ 
     Description -> "vectorlike Down-Quarks", 
     FeynArtsNr -> 9, 
     LaTeX -> "Fu^V", 
     Mass -> LesHouches, 
     OutputName -> "uV", 
     PDG -> {102, 104, 106, 202, 204, 206}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> {0, 0, 0}, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16}, 
     ElectricCharge -> 0, 
     Width -> {0, 0, 0}}}, 

{FvV,{ 
     Description -> "vectorlike singly-charged-Leptons", 
     FeynArtsNr -> 10, 
     LaTeX -> "Fv^V", 
     Mass -> LesHouches, 
     OutputName -> "vV", 
     PDG -> {112, 114, 116, 212, 214, 216}, 
     ElectricCharge -> -1, 
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
     LaTeX -> {"H^-","H^-"}, 
     Mass -> {0, LesHouches}, 
     OutputName -> {"Hm","Hp"}, 
     PDG -> {0, -37}, 
     ElectricCharge -> -1, 
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
     FeynArtsNr -> 6   (* auto generated FeynArts number *), 
     LaTeX -> "d_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl"   (* auto generated Output name *), 
     PDG -> {29, 30, 31}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 8   (* auto generated FeynArts number *), 
     LaTeX -> "d_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {35, 36, 37}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dV1L,{ 
     FeynArtsNr -> 10   (* auto generated FeynArts number *), 
     LaTeX -> "d^V_{1L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dv1l"   (* auto generated Output name *), 
     PDG -> {41, 42, 43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dV1R,{ 
     FeynArtsNr -> 12   (* auto generated FeynArts number *), 
     LaTeX -> "d^V_{1R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dv1r"   (* auto generated Output name *), 
     PDG -> {47, 48, 49}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dV2L,{ 
     FeynArtsNr -> 14   (* auto generated FeynArts number *), 
     LaTeX -> "d^V_{2L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dv2l"   (* auto generated Output name *), 
     PDG -> {53, 54, 55}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dV2R,{ 
     FeynArtsNr -> 16   (* auto generated FeynArts number *), 
     LaTeX -> "d^V_{2R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dv2r"   (* auto generated Output name *), 
     PDG -> {59, 60, 61}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 18   (* auto generated FeynArts number *), 
     LaTeX -> "e_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {65, 66, 67}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 20   (* auto generated FeynArts number *), 
     LaTeX -> "e_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {71, 72, 73}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eV1L,{ 
     FeynArtsNr -> 22   (* auto generated FeynArts number *), 
     LaTeX -> "e^V_{1L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ev1l"   (* auto generated Output name *), 
     PDG -> {77, 78, 79}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eV1R,{ 
     FeynArtsNr -> 24   (* auto generated FeynArts number *), 
     LaTeX -> "ev1r"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "e^V_{1R}"   (* auto generated Output name *), 
     PDG -> {83, 84, 85}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eV2L,{ 
     FeynArtsNr -> 26   (* auto generated FeynArts number *), 
     LaTeX -> "e^V_{2L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ev2l"   (* auto generated Output name *), 
     PDG -> {89, 90, 91}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eV2R,{ 
     FeynArtsNr -> 28   (* auto generated FeynArts number *), 
     LaTeX -> "e^V_{2R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ev2r"   (* auto generated Output name *), 
     PDG -> {95, 96, 97}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H10,{ 
     FeynArtsNr -> 30   (* auto generated FeynArts number *), 
     LaTeX -> "H_1^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h10"   (* auto generated Output name *), 
     PDG -> {99}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H1p,{ 
     FeynArtsNr -> 32   (* auto generated FeynArts number *), 
     LaTeX -> "H_1^+"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h1p"   (* auto generated Output name *), 
     PDG -> {101}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H20,{ 
     FeynArtsNr -> 34   (* auto generated FeynArts number *), 
     LaTeX -> "H_2^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h20"   (* auto generated Output name *), 
     PDG -> {103}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{H2p,{ 
     FeynArtsNr -> 36   (* auto generated FeynArts number *), 
     LaTeX -> "H_2^+"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "h2p"   (* auto generated Output name *), 
     PDG -> {105}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 38   (* auto generated FeynArts number *), 
     LaTeX -> "u_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul"   (* auto generated Output name *), 
     PDG -> {109, 110, 111}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 40   (* auto generated FeynArts number *), 
     LaTeX -> "u_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {115, 116, 117}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uV1L,{ 
     FeynArtsNr -> 42   (* auto generated FeynArts number *), 
     LaTeX -> "u^V_{1L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "uv1l"   (* auto generated Output name *), 
     PDG -> {121, 122, 123}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uV1R,{ 
     FeynArtsNr -> 44   (* auto generated FeynArts number *), 
     LaTeX -> "u^V_{1R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "uv1r"   (* auto generated Output name *), 
     PDG -> {127, 128, 129}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uV2L,{ 
     FeynArtsNr -> 46   (* auto generated FeynArts number *), 
     LaTeX -> "uv2l"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "u^V_{2L}"   (* auto generated Output name *), 
     PDG -> {133, 134, 135}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uV2R,{ 
     FeynArtsNr -> 48   (* auto generated FeynArts number *), 
     LaTeX -> "u^V_{2R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "uv2r"   (* auto generated Output name *), 
     PDG -> {139, 140, 141}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 50   (* auto generated FeynArts number *), 
     LaTeX -> "\\nu_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {145, 146, 147}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vV1L,{ 
     FeynArtsNr -> 52   (* auto generated FeynArts number *), 
     LaTeX -> "\\nu^V_{1L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vv1l"   (* auto generated Output name *), 
     PDG -> {151, 152, 153}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vV1R,{ 
     FeynArtsNr -> 54   (* auto generated FeynArts number *), 
     LaTeX -> "\\nu^V_{1R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vv1r"   (* auto generated Output name *), 
     PDG -> {157, 158, 159}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vV2L,{ 
     FeynArtsNr -> 56   (* auto generated FeynArts number *), 
     LaTeX -> "\\nu^V_{2L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vv2l"   (* auto generated Output name *), 
     PDG -> {163, 164, 165}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vV2R,{ 
     FeynArtsNr -> 58   (* auto generated FeynArts number *), 
     LaTeX -> "\\nu^V_{2R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vv2r"   (* auto generated Output name *), 
     PDG -> {169, 170, 171}   (* auto generated PDGs  *), 
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

{dV1L,{ 
     LaTeX -> "d^V_{1L}"}}, 

{uV1L,{ 
     LaTeX -> "u^V_{1L}"}}, 

{dV1R,{ 
     LaTeX -> "d^V_{1R}"}}, 

{uV1R,{ 
     LaTeX -> "u^V_{1R}"}}, 

{dV2L,{ 
     LaTeX -> "d^V_{2L}"}}, 

{uV2L,{ 
     LaTeX -> "u^V_{2L}"}}, 

{dV2R,{ 
     LaTeX -> "d^V_{2R}"}}, 

{uV2R,{ 
     LaTeX -> "u^V_{2R}"}}, 

{eV1L,{ 
     LaTeX -> "e^V_{1L}"}}, 

{vV1L,{ 
     LaTeX -> "v^V_{1L}"}}, 

{eV1R,{ 
     LaTeX -> "e^V_{1R}"}}, 

{vV1R,{ 
     LaTeX -> "v^V_{1R}"}}, 

{eV2L,{ 
     LaTeX -> "e^V_{2L}"}}, 

{vV2L,{ 
     LaTeX -> "\\nu^V_{2L}"}}, 

{eV2R,{ 
     LaTeX -> "e^V_{2R}"}}, 

{vV2R,{ 
     LaTeX -> "\\nu^V_{2R}"}}, 

{DL,{ 
     LaTeX -> "D_L"}}, 

{DR,{ 
     LaTeX -> "D_R"}}, 

{UL,{ 
     LaTeX -> "U_L"}}, 

{UR,{ 
     LaTeX -> "U_R"}}, 

{DVL,{ 
     LaTeX -> "D^V_{L}"}}, 

{DVR,{ 
     LaTeX -> "D^V_{R}"}}, 

{UVL,{ 
     LaTeX -> "U^V_{L}"}}, 

{UVR,{ 
     LaTeX -> "U^V_{R}"}}, 

{EVL,{ 
     LaTeX -> "E^V_{L}"}}, 

{EVR,{ 
     LaTeX -> "E^V_{R}"}}, 

{VVL,{ 
     LaTeX -> "V^V_{L}"}}, 

{VVR,{ 
     LaTeX -> "V^V_{R}"}}, 

{EL,{ 
     LaTeX -> "E_L"}}, 

{ER,{ 
     LaTeX -> "E_R"}}, 

{sigma1,{ 
     LaTeX -> "\\sigma_1"}}, 

{phi1,{ 
     LaTeX -> "\\phi_1"}}, 

{sigma2,{ 
     LaTeX -> "\\sigma_2"}}, 

{phi2,{ 
     LaTeX -> "\\phi_2"}}, 

{DVL,{ 
     LaTeX -> "D^V_{L}"}}, 

{DVR,{ 
     LaTeX -> "D^V_{R}"}}, 

{EVL,{ 
     LaTeX -> "E^V_{L}"}}, 

{EVR,{ 
     LaTeX -> "E^V_{R}"}}, 

{q,{ 
     LaTeX -> "q"}}, 

{QVL,{ 
     LaTeX -> "qVL"}}, 

{QVR,{ 
     LaTeX -> "q^V_R"}}, 

{UVL,{ 
     LaTeX -> "U^V_{L}"}}, 

{UVR,{ 
     LaTeX -> "U^V_{R}"}}, 

{VVL,{ 
     LaTeX -> "V^V_{L}"}}, 

{VVR,{ 
     LaTeX -> "V^V_{R}"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{H1,{ 
     LaTeX -> "H_1"   (* auto generated LaTeX name *)}}, 

{H2,{ 
     LaTeX -> "H_2"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "\\ell"   (* auto generated LaTeX name *)}}, 

{LVL,{ 
     LaTeX -> "\\ell^V_L"   (* auto generated LaTeX name *)}}, 

{LVR,{ 
     LaTeX -> "\\ell^V_L"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}} 
}; 




