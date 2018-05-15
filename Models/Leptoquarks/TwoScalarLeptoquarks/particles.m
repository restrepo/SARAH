(* SARAH generated template for particles.m file for SM *)
(* File created at 19:04 on 26.1.2016  *) 

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
     PDG -> {0, 26}   (* adjusted number of PDGs to number of generations  *), 
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
     PDG -> {25, 35}   (* adjusted number of PDGs to number of generations  *), 
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
     Goldstone -> Ah[{1}], 
     FeynArtsNr -> 2, 
     LaTeX -> "Z", 
     Mass -> 91.1876, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> 2.4952}}, 



(*  ----------- Additional particles in the model ---------- *) 

{OmegaLQ,{ 
     FeynArtsNr -> 6   , 
     LaTeX -> "{\\Omega}"   , 
     Mass -> LesHouches, 
     OutputName -> "olq"   , 
     PDG -> {31}   , 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{PhiLQ,{ 
     FeynArtsNr -> 8   , 
     LaTeX -> "{\\Phi}"   , 
     Mass -> LesHouches, 
     OutputName -> "plq" ,   
     PDG -> {33}   , 
     ElectricCharge -> -4/3, 
     Width -> Automatic}}, 

{theta,{ 
     FeynArtsNr -> 10   , 
     LaTeX -> "{\\Theta}"   , 
     Mass -> LesHouches, 
     OutputName -> "th",    
     PDG -> {36}   , 
     ElectricCharge -> 1, 
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
     FeynArtsNr -> 6   , 
     LaTeX -> "dl"   , 
     Mass -> LesHouches, 
     OutputName -> "dl" ,   
     PDG -> {29, 30, 31}   , 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 8   , 
     LaTeX -> "dr"   , 
     Mass -> LesHouches, 
     OutputName -> "dr",    
     PDG -> {35, 36, 37}   , 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 10   , 
     LaTeX -> "el"   , 
     Mass -> LesHouches, 
     OutputName -> "el",    
     PDG -> {41, 42, 43}   , 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 12   , 
     LaTeX -> "er"   , 
     Mass -> LesHouches, 
     OutputName -> "er" ,   
     PDG -> {47, 48, 49}   , 
     Width -> Automatic}}, 

{OmegaLQ,{ 
     FeynArtsNr -> 14   , 
     LaTeX -> "{\\omega}_{lq}"   , 
     Mass -> LesHouches, 
     OutputName -> "omlq"   , 
     PDG -> {51}   , 
     Width -> Automatic}}, 

{PhiLQ,{ 
     FeynArtsNr -> 16   , 
     LaTeX -> "{\\phi}_{lq}"   , 
     Mass -> LesHouches, 
     OutputName -> "philq" , 
     PDG -> {53}   , 
     Width -> Automatic}}, 

{Sing,{ 
     FeynArtsNr -> 18   , 
     LaTeX -> "S"   , 
     Mass -> LesHouches, 
     OutputName -> "Sing",
     PDG -> {55}, 
     Width -> Automatic}}, 

{theta,{ 
     FeynArtsNr -> 20   , 
     LaTeX -> "\\theta"   , 
     Mass -> LesHouches, 
     OutputName -> "theta",
     PDG -> {57}   , 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 22   , 
     LaTeX -> "ul"   , 
     Mass -> LesHouches, 
     OutputName -> "ul",
     PDG -> {61, 62, 63}   , 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 24   , 
     LaTeX -> "ur"   , 
     Mass -> LesHouches, 
     OutputName -> "ur",
     PDG -> {67, 68, 69}   , 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 26   , 
     LaTeX -> "v_{l}"   , 
     Mass -> LesHouches, 
     OutputName -> "vl",
     PDG -> {73, 74, 75}   , 
     Width -> Automatic}},
     
     
{Fd1,{ 
     FeynArtsNr -> 27   (* auto generated FeynArts number *), 
     LaTeX -> "d1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fd1"   (* auto generated Output name *), 
     PDG -> {79, 80, 81}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fd2,{ 
     FeynArtsNr -> 29   (* auto generated FeynArts number *), 
     LaTeX -> "d2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fd2"   (* auto generated Output name *), 
     PDG -> {85, 86, 87}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fe1,{ 
     FeynArtsNr -> 31   (* auto generated FeynArts number *), 
     LaTeX -> "e1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fe1"   (* auto generated Output name *), 
     PDG -> {91, 92, 93}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fe2,{ 
     FeynArtsNr -> 33   (* auto generated FeynArts number *), 
     LaTeX -> "e2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fe2"   (* auto generated Output name *), 
     PDG -> {97, 98, 99}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fu1,{ 
     FeynArtsNr -> 35   (* auto generated FeynArts number *), 
     LaTeX -> "u1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fu1"   (* auto generated Output name *), 
     PDG -> {103, 104, 105}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fu2,{ 
     FeynArtsNr -> 37   (* auto generated FeynArts number *), 
     LaTeX -> "u2"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fu2"   (* auto generated Output name *), 
     PDG -> {109, 110, 111}   (* auto generated PDGs  *), 
     Width -> Automatic}},      
     
     
 {Fv1,{ 
     FeynArtsNr -> 39   (* auto generated FeynArts number *), 
     LaTeX -> "v1"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "v1"   (* auto generated Output name *), 
     PDG -> {115, 116, 117}   (* auto generated PDGs  *), 
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

{sigmaH,{ 
     LaTeX -> "{\\sigma}_{h}"   }}, 

{phiH,{ 
     LaTeX -> "{\\phi}_{h}"   }}, 

{sigmaS,{ 
     LaTeX -> "{\\sigma}_{s}"   }}, 

{phiS,{ 
     LaTeX -> "{\\phi}_{s}"   }}, 

{d,{ 
     LaTeX -> "d"   }}, 

{e,{ 
     LaTeX -> "e"   }}, 

{l,{ 
     LaTeX -> "l"   }}, 

{Omega,{ 
     LaTeX -> "\\omega"   }}, 

{Phi,{ 
     LaTeX -> "\\phi"   }}, 

{s,{ 
     LaTeX -> "s"   }}, 

{The,{ 
     LaTeX -> "the"   }}, 

{u,{ 
     LaTeX -> "u"   }}, 

{VB,{ 
     LaTeX -> "B"   }}, 

{VG,{ 
     LaTeX -> "G"   }}, 

{VWB,{ 
     LaTeX -> "WB"   }} 
}; 




