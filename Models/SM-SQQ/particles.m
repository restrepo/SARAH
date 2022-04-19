(* SARAH generated template for particles.m file for SM8C *)
(* File created at 13:10 on 25.1.2016  *) 

(* IMPORTANT: *)
(* check/adjust in particular the lines which contain "CHECK!" *)
(* the correct information is needed there to have correct results! *)


(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 


(*
{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A^0", 
     Mass -> {0}, 
     OutputName -> "Ah", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> {0}}}, 
*)

{Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0} }},  


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
     PDG -> {25}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

(*
{Hp,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> { "H^+", "H^-"}, 
     Mass -> MHpm, 
     OutputName -> { "Hp", "Hm"}, 
     PDG -> {0}, 
     (*ElectricCharge -> -1, *)
     Width -> {0}}}, 
*)

{Hp,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 LaTeX -> {"H^+","H^-"},
                 ElectricCharge -> 1,
                 OutputName -> {"Hp","Hm"}
                 }}, 



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

(*
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

*)

{VWp,  { Description -> "W+ - Boson",
      			Goldstone -> Hp }},  

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

{Sing,{ 
     FeynArtsNr -> 18   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{s}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sing"   (* auto generated Output name *), 
    PDG -> {55}   (* auto generated PDGs  *),
    ElectricCharge -> 0,
     Width -> Automatic}}, 
{QM,{ 
     FeynArtsNr -> 19   (* auto generated FeynArts number *), 
     LaTeX -> "qm"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "qm"   (* auto generated Output name *), 
     PDG -> {103}   (* auto generated PDGs  *), 
     ElectricCharge -> -1/3 (* this is just a dummy value for the electric charge! 				 => CHECK! *), 
     Width -> Automatic}}, 

{QP,{ 
     FeynArtsNr -> 21   (* auto generated FeynArts number *), 
     LaTeX -> "qp"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "qp"   (* auto generated Output name *), 
     PDG -> {105}   (* auto generated PDGs  *), 
     ElectricCharge -> -1/3 (* this is just a dummy value for the electric charge! 				 => CHECK! *), 
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
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 

(*
{Hp,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^+","H^-"}, 
     Mass -> MHpm, 
     OutputName -> {"Hp","Hm"}, 
     PDG -> {0}, 
     (*ElectricCharge -> -1, *)
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
     LaTeX -> "dl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dl"   (* auto generated Output name *), 
     PDG -> {29, 30, 31}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 8   (* auto generated FeynArts number *), 
     LaTeX -> "dr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dr"   (* auto generated Output name *), 
     PDG -> {35, 36, 37}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 10   (* auto generated FeynArts number *), 
     LaTeX -> "el"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "el"   (* auto generated Output name *), 
     PDG -> {41, 42, 43}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 12   (* auto generated FeynArts number *), 
     LaTeX -> "er"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "er"   (* auto generated Output name *), 
     PDG -> {47, 48, 49}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{QM,{ 
     FeynArtsNr -> 25   (* auto generated FeynArts number *), 
     LaTeX -> "qm"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "qm"   (* auto generated Output name *), 
     PDG -> {75}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{QP,{ 
     FeynArtsNr -> 27   (* auto generated FeynArts number *), 
     LaTeX -> "qp"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "qp"   (* auto generated Output name *), 
     PDG -> {77}   (* auto generated PDGs  *), 
     Width -> Automatic}},

{Sing,{ 
     FeynArtsNr -> 18   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{ing}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sing"   (* auto generated Output name *), 
     PDG -> {55}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 20   (* auto generated FeynArts number *), 
     LaTeX -> "ul"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ul"   (* auto generated Output name *), 
     PDG -> {59, 60, 61}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 22   (* auto generated FeynArts number *), 
     LaTeX -> "ur"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ur"   (* auto generated Output name *), 
     PDG -> {65, 66, 67}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{vL,{ 
     FeynArtsNr -> 24   (* auto generated FeynArts number *), 
     LaTeX -> "v_{l}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vl"   (* auto generated Output name *), 
     PDG -> {71, 72, 73}   (* auto generated PDGs  *), 
     Width -> Automatic}} 
}; 




(* ###############            Weyl Spinors and intermediate states       ################# *) 

WeylFermionAndIndermediate = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 
(*
{H,{ 
     LaTeX -> "H"}}, 
*)

{H,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},



(*  ----------- Additional particles in the model ---------- *) 

{dL,{ 
     LaTeX -> "dl"   (* auto generated LaTeX name *)}}, 

{uL,{ 
     LaTeX -> "ul"   (* auto generated LaTeX name *)}}, 

{eL,{ 
     LaTeX -> "el"   (* auto generated LaTeX name *)}}, 

{vL,{ 
     LaTeX -> "v_{l}"   (* auto generated LaTeX name *)}}, 

{dR,{ 
     LaTeX -> "dr"   (* auto generated LaTeX name *)}}, 

{uR,{ 
     LaTeX -> "ur"   (* auto generated LaTeX name *)}}, 

{eR,{ 
     LaTeX -> "er"   (* auto generated LaTeX name *)}}, 

{FDL,{ 
     LaTeX -> "{D}_L"   (* auto generated LaTeX name *)}}, 

{FDR,{ 
     LaTeX -> "{D}_R"   (* auto generated LaTeX name *)}}, 

{FUL,{ 
     LaTeX -> "{U}_L"   (* auto generated LaTeX name *)}}, 

{FUR,{ 
     LaTeX -> "{U}_R"   (* auto generated LaTeX name *)}}, 

{FEL,{ 
     LaTeX -> "{E}_L"   (* auto generated LaTeX name *)}}, 

{FER,{ 
     LaTeX -> "{E}_R"   (* auto generated LaTeX name *)}}, 

{phiH,{ 
     LaTeX -> "{\\phi}_{h}"   (* auto generated LaTeX name *)}}, 

{phiS,{ 
     LaTeX -> "{\\phi}_{s}"   (* auto generated LaTeX name *)}}, 

{d,{ 
     LaTeX -> "d"   (* auto generated LaTeX name *)}}, 

{e,{ 
     LaTeX -> "e"   (* auto generated LaTeX name *)}}, 

{l,{ 
     LaTeX -> "l"   (* auto generated LaTeX name *)}}, 

{oc,{ 
     LaTeX -> "oc"   (* auto generated LaTeX name *)}}, 

{q,{ 
     LaTeX -> "q"   (* auto generated LaTeX name *)}}, 

{s,{ 
     LaTeX -> "s"   (* auto generated LaTeX name *)}}, 

{u,{ 
     LaTeX -> "u"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
    LaTeX -> "WB"   (* auto generated LaTeX name *)}},

{qM,{ 
     LaTeX -> "qm"   (* auto generated LaTeX name *)}}, 

{qP,{ 
     LaTeX -> "qp"   (* auto generated LaTeX name *)}} 
    
}; 




