(* SARAH generated template for particles.m file for VLTQ *)
(* File created at 16:00 on 18.1.2016  *) 

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
     PDG -> {1, 3, 5, 28, 29}   (* adjusted number of PDGs to number of generations  *), 
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
     PDG -> {2, 4, 6, 32, 33}   (* adjusted number of PDGs to number of generations  *), 
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
     Description -> "Positive W+ - Boson Ghost"}}, 
(*     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWp], 
     OutputName -> "gWp", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 1, 
     Width -> Automatic}}, *)

{gWpC,{ 
     Description -> "Negative W+ - Boson Ghost"}}, 
(*    FeynArtsNr -> 4, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWp], 
     OutputName -> "gWC", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> -1, 
     Width -> Automatic}}, *)

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
     PDG -> {25, 41}   (* adjusted number of PDGs to number of generations  *), 
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
     Goldstone -> Hp}}, 
(*     FeynArtsNr -> 3, 
     LaTeX -> {"W^+","W^-"}, 
     Mass -> Dependence, 
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]], 
     OutputName -> {"Wp","Wm"}, 
     PDG -> {24}, 
     ElectricCharge -> 1, 
     Width -> 2.141}},*)


{VZ,{ 
     Description -> "Z-Boson", 
     Goldstone -> Ah, 
     FeynArtsNr -> 2, 
     LaTeX -> "Z", 
     Mass -> 91.1876, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> 2.4952}}, 



(*  ----------- Additional particles in the model ---------- *) 

{FX,{ 
     FeynArtsNr -> 6   (* auto generated FeynArts number *), 
     LaTeX -> "X"   (* auto generated LaTeX name *), 
     Mass -> MFX, 
     OutputName -> "fx"   (* auto generated Output name *), 
     PDG -> {35}   (* auto generated PDGs  *), 
     ElectricCharge -> 5/3 (* this is just a dummy value for the electric charge! 				 => CHECK! *), 
     Width -> Automatic}}, 

{FY,{ 
     FeynArtsNr -> 8   (* auto generated FeynArts number *), 
     LaTeX -> "Y"   (* auto generated LaTeX name *), 
     Mass -> MFY, 
     OutputName -> "fy"   (* auto generated Output name *), 
     PDG -> {37}   (* auto generated PDGs  *), 
     ElectricCharge -> -4/3 (* this is just a dummy value for the electric charge! 				 => CHECK! *), 
     Width -> Automatic}}, 

{ss,{ 
     FeynArtsNr -> 10   (* auto generated FeynArts number *), 
     LaTeX -> "S"   (* auto generated LaTeX name *), 
     Mass -> Mss, 
     OutputName -> "ss"   (* auto generated Output name *), 
     PDG -> {39}   (* auto generated PDGs  *), 
     ElectricCharge -> 0 (* this is just a dummy value for the electric charge! 				 => CHECK! *), 
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

(*
{Hp,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^+","H^-"}, 
     Mass -> {0}, 
     OutputName -> {"Hp","Hm"}, 
     PDG -> {0}, 
     ElectricCharge -> -1, 
     Width -> {0}}}, 
*)

{Hp,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 



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
     Description -> "W-Bosons"}}, 
(*     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 24, 25}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, *)



(*  ----------- Additional particles in the model ---------- *) 

{dL,{ 
     FeynArtsNr -> 6   (* auto generated FeynArts number *), 
     LaTeX -> "d_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl"   (* auto generated Output name *), 
     PDG -> {29, 30, 31}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dL4,{ 
     FeynArtsNr -> 8   (* auto generated FeynArts number *), 
     LaTeX -> "D_{1L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl4"   (* auto generated Output name *), 
     PDG -> {33}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dL5,{ 
     FeynArtsNr -> 10   (* auto generated FeynArts number *), 
     LaTeX -> "D_{2L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl5"   (* auto generated Output name *), 
     PDG -> {35}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 12   (* auto generated FeynArts number *), 
     LaTeX -> "d_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {39, 40, 41}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR4,{ 
     FeynArtsNr -> 14   (* auto generated FeynArts number *), 
     LaTeX -> "D_{1R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr4"   (* auto generated Output name *), 
     PDG -> {43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR5,{ 
     FeynArtsNr -> 16   (* auto generated FeynArts number *), 
     LaTeX -> "D_{2R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr5"   (* auto generated Output name *), 
     PDG -> {45}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 18   (* auto generated FeynArts number *), 
     LaTeX -> "e_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {49, 50, 51}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 20   (* auto generated FeynArts number *), 
     LaTeX -> "e_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {55, 56, 57}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{ss,{ 
     FeynArtsNr -> 22   (* auto generated FeynArts number *), 
     LaTeX -> "S"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ss"   (* auto generated Output name *), 
     PDG -> {59}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 24   (* auto generated FeynArts number *), 
     LaTeX -> "u_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul"   (* auto generated Output name *), 
     PDG -> {63, 64, 65}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL4,{ 
     FeynArtsNr -> 26   (* auto generated FeynArts number *), 
     LaTeX -> "U_{1L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul4"   (* auto generated Output name *), 
     PDG -> {67}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL5,{ 
     FeynArtsNr -> 28   (* auto generated FeynArts number *), 
     LaTeX -> "U_{2L}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul5"   (* auto generated Output name *), 
     PDG -> {69}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 30   (* auto generated FeynArts number *), 
     LaTeX -> "u_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {73, 74, 75}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR4,{ 
     FeynArtsNr -> 32   (* auto generated FeynArts number *), 
     LaTeX -> "U_{1R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur4"   (* auto generated Output name *), 
     PDG -> {77}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR5,{ 
     FeynArtsNr -> 34   (* auto generated FeynArts number *), 
     LaTeX -> "U_{2R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur5"   (* auto generated Output name *), 
     PDG -> {79}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 36   (* auto generated FeynArts number *), 
     LaTeX -> "\\nu_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {83, 84, 85}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{XL,{ 
     FeynArtsNr -> 38   (* auto generated FeynArts number *), 
     LaTeX -> "X_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xl"   (* auto generated Output name *), 
     PDG -> {87}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{XR,{ 
     FeynArtsNr -> 40   (* auto generated FeynArts number *), 
     LaTeX -> "X_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "xr"   (* auto generated Output name *), 
     PDG -> {89}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{YL,{ 
     FeynArtsNr -> 42   (* auto generated FeynArts number *), 
     LaTeX -> "Y_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "yl"   (* auto generated Output name *), 
     PDG -> {91}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{YR,{ 
     FeynArtsNr -> 44   (* auto generated FeynArts number *), 
     LaTeX -> "Y_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "yr"   (* auto generated Output name *), 
     PDG -> {93}   (* auto generated PDGs  *), 
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

{dL4,{ 
     LaTeX -> "D_{1L}"   (* auto generated LaTeX name *)}}, 

{uL4,{ 
     LaTeX -> "U_{1L}"   (* auto generated LaTeX name *)}}, 

{XL,{ 
     LaTeX -> "X_L"   (* auto generated LaTeX name *)}}, 

{dR4,{ 
     LaTeX -> "D_{1R}"   (* auto generated LaTeX name *)}}, 

{uR4,{ 
     LaTeX -> "U_{1R}"   (* auto generated LaTeX name *)}}, 

{XR,{ 
     LaTeX -> "X_R"   (* auto generated LaTeX name *)}}, 

{dL5,{ 
     LaTeX -> "D_{2L}"   (* auto generated LaTeX name *)}}, 

{uL5,{ 
     LaTeX -> "U_{2L}"   (* auto generated LaTeX name *)}}, 

{YL,{ 
     LaTeX -> "Y_L"   (* auto generated LaTeX name *)}}, 

{dR5,{ 
     LaTeX -> "D_{2R}"   (* auto generated LaTeX name *)}}, 

{uR5,{ 
     LaTeX -> "U_{2R}"   (* auto generated LaTeX name *)}}, 

{YR,{ 
     LaTeX -> "Y_R"   (* auto generated LaTeX name *)}}, 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{F1L,{ 
     LaTeX -> "F_{1L}"   (* auto generated LaTeX name *)}}, 

{F1R,{ 
     LaTeX -> "F_{1R}"   (* auto generated LaTeX name *)}}, 

{F2L,{ 
     LaTeX -> "F_{2L}"   (* auto generated LaTeX name *)}}, 

{F2R,{ 
     LaTeX -> "F_{2R}"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "l"   (* auto generated LaTeX name *)}}, 

{S,{ 
     LaTeX -> "S"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}},

{phiH,{ 
     LaTeX -> "{\\phi}_{h}"   (* auto generated LaTeX name *)}} 
}; 




