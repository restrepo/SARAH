(* SARAH generated template for particles.m file for NMSSM10 *)
(* File created at 16:00 on 14.1.2016  *) 


(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A^0", 
     Mass -> {0, LesHouches}, 
     OutputName -> "Ah", 
     PDG -> {0, 36, 88888890}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> {0, External}}}, 

{Cha,{ 
     Description -> "Charginos", 
     FeynArtsNr -> 12, 
     LaTeX -> {"\\tilde{\\chi}^-","\\tilde{\\chi}^-"}, 
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
     PDG -> {1000022, 1000023, 1000025, 1000035, 88888892}   (* adjusted number of PDGs to number of generations  *), 
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
     PDG -> {2, 4, 6}   (* adjusted number of PDGs to number of generations  *), 
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
     PDG -> {25, 35, 88888894}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hpm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^-","H^+"}, 
     Mass -> {0, LesHouches}, 
     OutputName -> {"Hm","Hp"}, 
     PDG -> {0, -37}, 
     ElectricCharge -> -1, 
     Width -> {0, External}}}, 

{Sd,{ 
     Description -> "Down-Squarks", 
     FeynArtsNr -> 14, 
     LaTeX -> "\\tilde{d}", 
     Mass -> LesHouches, 
     OutputName -> "sd", 
     PDG -> {1000001, 1000003, 1000005, 2000001, 2000003, 2000005}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{Se,{ 
     Description -> "Sleptons", 
     FeynArtsNr -> 12, 
     LaTeX -> "\\tilde{e}", 
     Mass -> LesHouches, 
     OutputName -> "se", 
     PDG -> {1000011, 1000013, 1000015, 2000011, 2000013, 2000015}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Su,{ 
     Description -> "Up-Squarks", 
     FeynArtsNr -> 13, 
     LaTeX -> "\\tilde{u}", 
     Mass -> LesHouches, 
     OutputName -> "su", 
     PDG -> {1000002, 1000004, 1000006, 2000002, 2000004, 2000006}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{Sv,{ 
     Description -> "Sneutrinos", 
     FeynArtsNr -> 11, 
     LaTeX -> "\\tilde{\\nu}", 
     Mass -> LesHouches, 
     OutputName -> "sv", 
     PDG -> {1000012, 1000014, 1000016}, 
     ElectricCharge -> 0, 
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
     Goldstone -> Hpm[{1}], 
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



(*  ----------- Additional particles in the model ---------- *) 

{Fdp,{ 
     FeynArtsNr -> 89   (* auto generated FeynArts number *), 
     LaTeX -> "dp"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdp"   (* auto generated Output name *), 
     PDG -> {88888896}   (* auto generated PDGs  *), 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{Fep,{ 
     FeynArtsNr -> 91   (* auto generated FeynArts number *), 
     LaTeX -> "ep"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fep"   (* auto generated Output name *), 
     PDG -> {88888898}   (* auto generated PDGs  *), 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Fup,{ 
     FeynArtsNr -> 93   (* auto generated FeynArts number *), 
     LaTeX -> "up"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fup"   (* auto generated Output name *), 
     PDG -> {88888901, 88888902}   (* auto generated PDGs  *), 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{Sdp,{ 
     FeynArtsNr -> 95   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{dp}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sdp"   (* auto generated Output name *), 
     PDG -> {88888905, 88888906}   (* auto generated PDGs  *), 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{Sep,{ 
     FeynArtsNr -> 97   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{ep}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sep"   (* auto generated Output name *), 
     PDG -> {88888909, 88888910}   (* auto generated PDGs  *), 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Sup,{ 
     FeynArtsNr -> 99   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{up}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sup"   (* auto generated Output name *), 
     PDG -> {88888915, 88888916, 88888917, 88888918}   (* auto generated PDGs  *), 
     ElectricCharge -> 2/3, 
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

{SdL,{ 
     Description -> "Left Down-Squarks", 
     FeynArtsNr -> 14, 
     LaTeX -> "\\tilde{d}_L", 
     Mass -> Automatic, 
     OutputName -> "dL", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SdR,{ 
     Description -> "Right Down-Squarks", 
     FeynArtsNr -> 15, 
     LaTeX -> "\\tilde{d}_R", 
     Mass -> Automatic, 
     OutputName -> "dR", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SeL,{ 
     Description -> "Left Selectron", 
     FeynArtsNr -> 12, 
     LaTeX -> "\\tilde{e}_L", 
     Mass -> Automatic, 
     OutputName -> "eL", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SeR,{ 
     Description -> "Right Selectron", 
     FeynArtsNr -> 13, 
     LaTeX -> "\\tilde{e}_R", 
     Mass -> Automatic, 
     OutputName -> "eR", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SHd0,{ 
     Description -> "Neutral Down-Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "H_d^0", 
     Mass -> Automatic, 
     OutputName -> "Hd0", 
     PDG -> {0}, 
     Width -> Automatic}}, 

{SHdm,{ 
     Description -> "Charged Down-Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "H_d^-", 
     Mass -> Automatic, 
     OutputName -> "Hdm", 
     PDG -> {0}, 
     Width -> Automatic}}, 

{SHu0,{ 
     Description -> "Neutral Up-Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> "H_u^0", 
     Mass -> Automatic, 
     OutputName -> "Hu0", 
     PDG -> {0}, 
     Width -> Automatic}}, 

{SHup,{ 
     Description -> "Charged Up-Higgs", 
     FeynArtsNr -> 4, 
     LaTeX -> "H_u^+", 
     Mass -> Automatic, 
     OutputName -> "Hup", 
     PDG -> {0}, 
     Width -> Automatic}}, 

{SuL,{ 
     Description -> "Left Up-Squarks", 
     FeynArtsNr -> 16, 
     LaTeX -> "\\tilde{u}_L", 
     Mass -> Automatic, 
     OutputName -> "uL", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SuR,{ 
     Description -> "Right Up-Squarks", 
     FeynArtsNr -> 17, 
     LaTeX -> "\\tilde{u}_R", 
     Mass -> Automatic, 
     OutputName -> "uR", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SvL,{ 
     Description -> "Left Sneutrino", 
     FeynArtsNr -> 10, 
     LaTeX -> "\\tilde{\\nu}_L", 
     Mass -> Automatic, 
     OutputName -> "nL", 
     PDG -> {0, 0, 0}, 
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

{VWB,{ 
     Description -> "W-Bosons", 
     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 1000024, 1000025}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 



(*  ----------- Additional particles in the model ---------- *) 

{fB,{ 
     FeynArtsNr -> 132   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{B}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fb"   (* auto generated Output name *), 
     PDG -> {1000027}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FdL,{ 
     FeynArtsNr -> 134   (* auto generated FeynArts number *), 
     LaTeX -> "{d}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdl"   (* auto generated Output name *), 
     PDG -> {1000031, 1000032, 1000033}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FdL10,{ 
     FeynArtsNr -> 136   (* auto generated FeynArts number *), 
     LaTeX -> "{dL1}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdl10"   (* auto generated Output name *), 
     PDG -> {1000035}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FdL10p,{ 
     FeynArtsNr -> 138   (* auto generated FeynArts number *), 
     LaTeX -> "dL10p"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdl10p"   (* auto generated Output name *), 
     PDG -> {1000037}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FdR,{ 
     FeynArtsNr -> 140   (* auto generated FeynArts number *), 
     LaTeX -> "{d}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdr"   (* auto generated Output name *), 
     PDG -> {1000041, 1000042, 1000043}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FeL,{ 
     FeynArtsNr -> 142   (* auto generated FeynArts number *), 
     LaTeX -> "{e}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fel"   (* auto generated Output name *), 
     PDG -> {1000047, 1000048, 1000049}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FeR,{ 
     FeynArtsNr -> 144   (* auto generated FeynArts number *), 
     LaTeX -> "{e}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fer"   (* auto generated Output name *), 
     PDG -> {1000053, 1000054, 1000055}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FeR10,{ 
     FeynArtsNr -> 146   (* auto generated FeynArts number *), 
     LaTeX -> "{eR1}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fer10"   (* auto generated Output name *), 
     PDG -> {1000057}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FeR10p,{ 
     FeynArtsNr -> 148   (* auto generated FeynArts number *), 
     LaTeX -> "eR10p"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fer10p"   (* auto generated Output name *), 
     PDG -> {1000059}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fG,{ 
     FeynArtsNr -> 150   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{G}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fg"   (* auto generated Output name *), 
     PDG -> {1000061}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHd0,{ 
     FeynArtsNr -> 152   (* auto generated FeynArts number *), 
     LaTeX -> "{Hd}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhd0"   (* auto generated Output name *), 
     PDG -> {1000063}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHdm,{ 
     FeynArtsNr -> 154   (* auto generated FeynArts number *), 
     LaTeX -> "Hdm"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhdm"   (* auto generated Output name *), 
     PDG -> {1000065}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHu0,{ 
     FeynArtsNr -> 156   (* auto generated FeynArts number *), 
     LaTeX -> "{Hu}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhu0"   (* auto generated Output name *), 
     PDG -> {1000067}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHup,{ 
     FeynArtsNr -> 158   (* auto generated FeynArts number *), 
     LaTeX -> "Hup"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhup"   (* auto generated Output name *), 
     PDG -> {1000069}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FsR,{ 
     FeynArtsNr -> 160   (* auto generated FeynArts number *), 
     LaTeX -> "{s}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fsr"   (* auto generated Output name *), 
     PDG -> {1000071}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuL,{ 
     FeynArtsNr -> 162   (* auto generated FeynArts number *), 
     LaTeX -> "{u}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ful"   (* auto generated Output name *), 
     PDG -> {1000075, 1000076, 1000077}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuL10,{ 
     FeynArtsNr -> 164   (* auto generated FeynArts number *), 
     LaTeX -> "{uL1}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ful10"   (* auto generated Output name *), 
     PDG -> {1000079}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuL10p,{ 
     FeynArtsNr -> 166   (* auto generated FeynArts number *), 
     LaTeX -> "uL10p"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ful10p"   (* auto generated Output name *), 
     PDG -> {1000081}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuR,{ 
     FeynArtsNr -> 168   (* auto generated FeynArts number *), 
     LaTeX -> "{u}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fur"   (* auto generated Output name *), 
     PDG -> {1000085, 1000086, 1000087}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuR10,{ 
     FeynArtsNr -> 170   (* auto generated FeynArts number *), 
     LaTeX -> "{uR1}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fur10"   (* auto generated Output name *), 
     PDG -> {1000089}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuR10p,{ 
     FeynArtsNr -> 172   (* auto generated FeynArts number *), 
     LaTeX -> "uR10p"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fur10p"   (* auto generated Output name *), 
     PDG -> {1000091}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FvL,{ 
     FeynArtsNr -> 174   (* auto generated FeynArts number *), 
     LaTeX -> "{v}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fvl"   (* auto generated Output name *), 
     PDG -> {1000095, 1000096, 1000097}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fWB,{ 
     FeynArtsNr -> 176   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{WB}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fwb"   (* auto generated Output name *), 
     PDG -> {1000101, 1000102, 1000103}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SdL10,{ 
     FeynArtsNr -> 178   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{{dL1}^0}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sdl10"   (* auto generated Output name *), 
     PDG -> {1000105}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SdL10p,{ 
     FeynArtsNr -> 180   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{dL10p}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sdl10p"   (* auto generated Output name *), 
     PDG -> {1000107}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SeR10,{ 
     FeynArtsNr -> 182   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{{eR1}^0}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ser10"   (* auto generated Output name *), 
     PDG -> {1000109}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SeR10p,{ 
     FeynArtsNr -> 184   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{eR10p}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ser10p"   (* auto generated Output name *), 
     PDG -> {1000111}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SsR,{ 
     FeynArtsNr -> 186   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{{s}_R}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ssr"   (* auto generated Output name *), 
     PDG -> {1000113}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SuL10,{ 
     FeynArtsNr -> 188   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{{uL1}^0}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sul10"   (* auto generated Output name *), 
     PDG -> {1000115}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SuL10p,{ 
     FeynArtsNr -> 190   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{uL10p}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sul10p"   (* auto generated Output name *), 
     PDG -> {1000117}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SuR10,{ 
     FeynArtsNr -> 192   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{{uR1}^0}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sur10"   (* auto generated Output name *), 
     PDG -> {1000119}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{SuR10p,{ 
     FeynArtsNr -> 194   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{uR10p}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "sur10p"   (* auto generated Output name *), 
     PDG -> {1000121}   (* auto generated PDGs  *), 
     Width -> Automatic}} 
}; 




(* ###############            Weyl Spinors and intermediate states       ################# *) 

WeylFermionAndIndermediate = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{fB,{ 
     Description -> "Bino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{B}}"}}, 

{fWB,{ 
     Description -> "Wino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{W}}"}}, 

{fG,{ 
     Description -> "Gluino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{g}}"}}, 

{FdL,{ 
     Description -> "Left Down-Quark", 
     LaTeX -> "d_L"}}, 

{FuL,{ 
     Description -> "Left Up-Quark", 
     LaTeX -> "u_L"}}, 

{FeL,{ 
     Description -> "Left Electron", 
     LaTeX -> "e_L"}}, 

{FvL,{ 
     Description -> "Left Neutrino", 
     LaTeX -> "\\nu_L"}}, 

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

{fWm,{ 
     Description -> "Negative Wino", 
     LaTeX -> "\\tilde{W}^-"}}, 

{fWp,{ 
     Description -> "Positive Wino", 
     LaTeX -> "\\tilde{W}^+"}}, 

{fW0,{ 
     Description -> "Neutral Wino", 
     LaTeX -> "\\tilde{W}^0"}}, 

{L0,{ 
     Description -> "Neutralino Weyl-Spinor", 
     LaTeX -> "\\lambda^0"}}, 

{Lm,{ 
     Description -> "Negative Chargino Weyl-Spinor", 
     LaTeX -> "\\lambda^-"}}, 

{Lp,{ 
     Description -> "Positive Chargino Weyl-Spinor", 
     LaTeX -> "\\lambda^+"}}, 

{FEL,{ 
     Description -> "Rotated Left Electron", 
     LaTeX -> "E_L"}}, 

{FER,{ 
     Description -> "Rotated Right Electron", 
     LaTeX -> "E_R"}}, 

{FDL,{ 
     Description -> "Rotated Left Up-Quark", 
     LaTeX -> "D_L"}}, 

{FDR,{ 
     Description -> "Rotated Right Up-Quark", 
     LaTeX -> "D_R"}}, 

{FUL,{ 
     Description -> "Rotated Left Down-Quark", 
     LaTeX -> "U_L"}}, 

{FUR,{ 
     Description -> "Rotated Right Down-Quark", 
     LaTeX -> "U_R"}}, 

{sigmad,{ 
     Description -> "Pseudo Scalar Down", 
     LaTeX -> "\\sigma_{d}"}}, 

{phid,{ 
     Description -> "Scalar Down", 
     LaTeX -> "\\phi_{d}"}}, 

{sigmau,{ 
     Description -> "Pseudo Scalar Up", 
     LaTeX -> "\\sigma_{u}"}}, 

{phiu,{ 
     Description -> "Scalar Up", 
     LaTeX -> "\\phi_{u}"}}, 

{q,{ 
     Description -> "Left Quark Superfield", 
     LaTeX -> "\\hat{q}"}}, 

{l,{ 
     Description -> "left Lepton Superfield", 
     LaTeX -> "\\hat{l}"}}, 

{Hd,{ 
     Description -> "Down-Higgs Superfield", 
     LaTeX -> "\\hat{H}_d"}}, 

{Hu,{ 
     Description -> "Up-Higgs Superfield", 
     LaTeX -> "\\hat{H}_u"}}, 

{d,{ 
     Description -> "Right Down-Quark Superfield", 
     LaTeX -> "\\hat{d}"}}, 

{u,{ 
     Description -> "Right Up-Quark Superfield", 
     LaTeX -> "\\hat{u}"}}, 

{e,{ 
     Description -> "Right Electron Superfield", 
     LaTeX -> "\\hat{e}"}}, 

{B,{ 
     Description -> "B Superfield", 
     LaTeX -> "\\hat{B}"}}, 

{WB,{ 
     Description -> "W Superfield", 
     LaTeX -> "\\hat{W}"}}, 

{G,{ 
     Description -> "Gluon Superfield", 
     LaTeX -> "\\hat{g}"}}, 

{Fq,{ 
     Description -> "Left Quarks", 
     LaTeX -> "q"}}, 

{Fl,{ 
     Description -> "Left Leptons", 
     LaTeX -> "l"}}, 

{FHd,{ 
     Description -> "Down-Higgsino", 
     LaTeX -> "\\tilde{H}_d"}}, 

{FHu,{ 
     Description -> "Up-Higgsino", 
     LaTeX -> "\\tilde{H}_u"}}, 

{fB,{ 
     Description -> "Bino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{B}}"}}, 

{fWB,{ 
     Description -> "Wino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{W}}"}}, 

{fG,{ 
     Description -> "Gluino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{g}}"}}, 

{Sq,{ 
     Description -> "Left Squark", 
     LaTeX -> "\\tilde{q}"}}, 

{Sl,{ 
     Description -> "Left Slepton", 
     LaTeX -> "\\tilde{l}"}}, 

{SHd,{ 
     Description -> "Down-Higgs", 
     LaTeX -> "H_d"}}, 

{SHu,{ 
     Description -> "Up-Higgs", 
     LaTeX -> "H_u"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{FuR10,{ 
     LaTeX -> "{uR1}^0"   (* auto generated LaTeX name *)}}, 

{FuR10p,{ 
     LaTeX -> "uR10p"   (* auto generated LaTeX name *)}}, 

{FdL10,{ 
     LaTeX -> "{dL1}^0"   (* auto generated LaTeX name *)}}, 

{FuL10,{ 
     LaTeX -> "{uL1}^0"   (* auto generated LaTeX name *)}}, 

{FdL10p,{ 
     LaTeX -> "dL10p"   (* auto generated LaTeX name *)}}, 

{FuL10p,{ 
     LaTeX -> "uL10p"   (* auto generated LaTeX name *)}}, 

{FeR10,{ 
     LaTeX -> "{eR1}^0"   (* auto generated LaTeX name *)}}, 

{FeR10p,{ 
     LaTeX -> "eR10p"   (* auto generated LaTeX name *)}}, 

{FsR,{ 
     LaTeX -> "{s}_R"   (* auto generated LaTeX name *)}}, 

{FULp,{ 
     LaTeX -> "ULp"   (* auto generated LaTeX name *)}}, 

{FURp,{ 
     LaTeX -> "URp"   (* auto generated LaTeX name *)}}, 

{sigmaS,{ 
     LaTeX -> "{\\sigma}_{s}"   (* auto generated LaTeX name *)}}, 

{phiS,{ 
     LaTeX -> "{\\phi}_{s}"   (* auto generated LaTeX name *)}}, 

{u10,{ 
     LaTeX -> "\\hat{{u1}^0}"   (* auto generated LaTeX name *)}}, 

{u10p,{ 
     LaTeX -> "\\hat{u10p}"   (* auto generated LaTeX name *)}}, 

{q10,{ 
     LaTeX -> "\\hat{{q1}^0}"   (* auto generated LaTeX name *)}}, 

{q10p,{ 
     LaTeX -> "\\hat{q10p}"   (* auto generated LaTeX name *)}}, 

{e10,{ 
     LaTeX -> "\\hat{{e1}^0}"   (* auto generated LaTeX name *)}}, 

{e10p,{ 
     LaTeX -> "\\hat{e10p}"   (* auto generated LaTeX name *)}}, 

{s,{ 
     LaTeX -> "\\hat{s}"   (* auto generated LaTeX name *)}}, 

{conj[FdR],{ 
     LaTeX -> "conjfdr"   (* auto generated LaTeX name *)}}, 

{conj[FuR],{ 
     LaTeX -> "conjfur"   (* auto generated LaTeX name *)}}, 

{conj[FeR],{ 
     LaTeX -> "conjfer"   (* auto generated LaTeX name *)}}, 

{conj[FuR10],{ 
     LaTeX -> "{conjfur1}^0"   (* auto generated LaTeX name *)}}, 

{conj[FuR10p],{ 
     LaTeX -> "conjfur10p"   (* auto generated LaTeX name *)}}, 

{Fq10,{ 
     LaTeX -> "{q1}^0"   (* auto generated LaTeX name *)}}, 

{Fq10p,{ 
     LaTeX -> "q10p"   (* auto generated LaTeX name *)}}, 

{conj[FeR10],{ 
     LaTeX -> "{conjfer1}^0"   (* auto generated LaTeX name *)}}, 

{conj[FeR10p],{ 
     LaTeX -> "conjfer10p"   (* auto generated LaTeX name *)}}, 

{FsR,{ 
     LaTeX -> "{s}_R"   (* auto generated LaTeX name *)}}, 

{VB,{ 
     LaTeX -> "B"   (* auto generated LaTeX name *)}}, 

{VWB,{ 
     LaTeX -> "WB"   (* auto generated LaTeX name *)}}, 

{VG,{ 
     LaTeX -> "G"   (* auto generated LaTeX name *)}}, 

{conj[SdR],{ 
     LaTeX -> "conjsdr"   (* auto generated LaTeX name *)}}, 

{conj[SuR],{ 
     LaTeX -> "conjsur"   (* auto generated LaTeX name *)}}, 

{conj[SeR],{ 
     LaTeX -> "conjser"   (* auto generated LaTeX name *)}}, 

{conj[SuR10],{ 
     LaTeX -> "{conjsur1}^0"   (* auto generated LaTeX name *)}}, 

{conj[SuR10p],{ 
     LaTeX -> "conjsur10p"   (* auto generated LaTeX name *)}}, 

{Sq10,{ 
     LaTeX -> "\\tilde{{q1}^0}"   (* auto generated LaTeX name *)}}, 

{Sq10p,{ 
     LaTeX -> "\\tilde{q10p}"   (* auto generated LaTeX name *)}}, 

{conj[SeR10],{ 
     LaTeX -> "{conjser1}^0"   (* auto generated LaTeX name *)}}, 

{conj[SeR10p],{ 
     LaTeX -> "conjser10p"   (* auto generated LaTeX name *)}}, 

{SsR,{ 
     LaTeX -> "\\tilde{{s}_R}"   (* auto generated LaTeX name *)}} 
}; 




