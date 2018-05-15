(* ::Package:: *)

(* SARAH generated template for particles.m file for bMRSSM *)
(* File created at 11:12 on 14.1.2016  *) 




(* ###############            EWSB       ################# *) 

ParticleDefinitions[EWSB] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A^0", 
     Mass -> {0, LesHouches}, 
     OutputName -> "Ah", 
     PDG -> {0, 36, 46, 56, 3000025, 3000026}  , 
     ElectricCharge -> 0, 
     Width -> {0, External}}}, 

{Chi,{ 
     Description -> "Neutralinos", 
     FeynArtsNr -> 11, 
     LaTeX -> "\\tilde{\\chi}^0", 
     Mass -> LesHouches, 
     OutputName -> "N", 
     PDG -> {1000022, 1000023, 1000025, 1000035, 3000031, 3000032, 3000033, 3000034}  , 
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
     PDG -> {1000021, 3000036}  , 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{gP,{ 
     Description -> "Photon Ghost", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^{\\gamma}", 
     Mass -> 0, 
     OutputName -> "gA", 
     PDG -> {0}  , 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWm,{ 
     Description -> "Negative W-Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWm], 
     OutputName -> "gWm", 
     PDG -> {0}  , 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{gWmC,{ 
     Description -> "Positive W-Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWm], 
     OutputName -> "gWpC", 
     PDG -> {0}  , 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{gZ,{ 
     Description -> "Z-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^Z", 
     Mass -> Mass[VZ], 
     OutputName -> "gZ", 
     PDG -> {0}  , 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "h", 
     PDG -> {25, 35, 45, 55, 3000039, 3000040}  , 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hpm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^-","H^+"}, 
     Mass -> {0, LesHouches}, 
     OutputName -> {"Hm","Hp"}, 
     PDG -> {0, -37, -47, -57, 3000043, 3000044}  , 
     ElectricCharge -> -1, 
     Width -> {0, External}}}, 

{phiO,{ 
     FeynArtsNr -> 25, 
     LaTeX -> "\\phi_o", 
     Mass -> LesHouches, 
     OutputName -> "POc", 
     PDG -> {3000021}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

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

{sigmaO,{ 
     FeynArtsNr -> 26, 
     LaTeX -> "\\sigma_o", 
     Mass -> LesHouches, 
     OutputName -> "SOc", 
     PDG -> {3000022}, 
     ElectricCharge -> 0, 
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
     MassDependence -> Sqrt[g2^2*vT^2 + Cos[ThetaW]^2*Mass[VZ]^2], 
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

{Cha,{ 
     FeynArtsNr -> 31   (* auto generated FeynArts number *), 
     LaTeX -> "cha"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "cha"   (* auto generated Output name *), 
     PDG -> {3000049, 3000050, 3000051, 3000052}   (* auto generated PDGs  *), 
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
     PDG -> {0}  , 
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

{SOc,{ 
     FeynArtsNr -> 105, 
     LaTeX -> "O", 
     Mass -> LesHouches, 
     OutputName -> "SOc", 
     PDG -> {1000023}  , 
     Width -> Automatic}}, 

{SRd0,{ 
     FeynArtsNr -> 50, 
     LaTeX -> "R_d^0", 
     Mass -> LesHouches, 
     OutputName -> "SRd0", 
     PDG -> {1000025}  , 
     Width -> Automatic}}, 

{SRdp,{ 
     FeynArtsNr -> 10, 
     LaTeX -> {"R_d^+","R_d^+"}, 
     Mass -> LesHouches, 
     OutputName -> "Rp", 
     PDG -> {404}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{SRu0,{ 
     FeynArtsNr -> 52, 
     LaTeX -> "R_u^0", 
     Mass -> LesHouches, 
     OutputName -> "SRu0", 
     PDG -> {1000027}  , 
     Width -> Automatic}}, 

{SRum,{ 
     FeynArtsNr -> 9, 
     LaTeX -> {"R_u^-","R_u^-"}, 
     Mass -> LesHouches, 
     OutputName -> "Rm", 
     PDG -> {403}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Ss,{ 
     FeynArtsNr -> 101, 
     LaTeX -> "S", 
     Mass -> LesHouches, 
     OutputName -> "SS", 
     PDG -> {1000029}  , 
     Width -> Automatic}}, 

{ST0,{ 
     FeynArtsNr -> 102, 
     LaTeX -> "T^0", 
     Mass -> LesHouches, 
     OutputName -> "ST0", 
     PDG -> {1000031}  , 
     Width -> Automatic}}, 

{STm,{ 
     FeynArtsNr -> 103, 
     LaTeX -> "T^-", 
     Mass -> LesHouches, 
     OutputName -> "STm", 
     PDG -> {1000033}  , 
     Width -> Automatic}}, 

{STp,{ 
     FeynArtsNr -> 104, 
     LaTeX -> "T^+", 
     Mass -> LesHouches, 
     OutputName -> "STp", 
     PDG -> {1000035}  , 
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
     PDG -> {0, 1000038, 1000039}  , 
     Width -> 0}}, 



(*  ----------- Additional particles in the model ---------- *) 

{fB,{ 
     FeynArtsNr -> 132   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{B}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fb"   (* auto generated Output name *), 
     PDG -> {1000041}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FdL,{ 
     FeynArtsNr -> 134   (* auto generated FeynArts number *), 
     LaTeX -> "{d}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdl"   (* auto generated Output name *), 
     PDG -> {1000045, 1000046, 1000047}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FdR,{ 
     FeynArtsNr -> 136   (* auto generated FeynArts number *), 
     LaTeX -> "{d}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fdr"   (* auto generated Output name *), 
     PDG -> {1000051, 1000052, 1000053}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FeL,{ 
     FeynArtsNr -> 138   (* auto generated FeynArts number *), 
     LaTeX -> "{e}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fel"   (* auto generated Output name *), 
     PDG -> {1000057, 1000058, 1000059}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FeR,{ 
     FeynArtsNr -> 140   (* auto generated FeynArts number *), 
     LaTeX -> "{e}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fer"   (* auto generated Output name *), 
     PDG -> {1000063, 1000064, 1000065}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fG,{ 
     FeynArtsNr -> 142   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{G}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fg"   (* auto generated Output name *), 
     PDG -> {1000067}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHd0,{ 
     FeynArtsNr -> 144   (* auto generated FeynArts number *), 
     LaTeX -> "{Hd}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhd0"   (* auto generated Output name *), 
     PDG -> {1000069}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHdm,{ 
     FeynArtsNr -> 146   (* auto generated FeynArts number *), 
     LaTeX -> "Hdm"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhdm"   (* auto generated Output name *), 
     PDG -> {1000071}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHu0,{ 
     FeynArtsNr -> 148   (* auto generated FeynArts number *), 
     LaTeX -> "{Hu}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhu0"   (* auto generated Output name *), 
     PDG -> {1000073}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FHup,{ 
     FeynArtsNr -> 150   (* auto generated FeynArts number *), 
     LaTeX -> "Hup"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fhup"   (* auto generated Output name *), 
     PDG -> {1000075}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FOc,{ 
     FeynArtsNr -> 152   (* auto generated FeynArts number *), 
     LaTeX -> "Oc"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "foc"   (* auto generated Output name *), 
     PDG -> {1000077}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FRd0,{ 
     FeynArtsNr -> 154   (* auto generated FeynArts number *), 
     LaTeX -> "{Rd}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "frd0"   (* auto generated Output name *), 
     PDG -> {1000079}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FRdp,{ 
     FeynArtsNr -> 156   (* auto generated FeynArts number *), 
     LaTeX -> "Rdp"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "frdp"   (* auto generated Output name *), 
     PDG -> {1000081}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FRu0,{ 
     FeynArtsNr -> 158   (* auto generated FeynArts number *), 
     LaTeX -> "{Ru}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fru0"   (* auto generated Output name *), 
     PDG -> {1000083}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FRum,{ 
     FeynArtsNr -> 160   (* auto generated FeynArts number *), 
     LaTeX -> "Rum"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "frum"   (* auto generated Output name *), 
     PDG -> {1000085}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{Fs,{ 
     FeynArtsNr -> 162   (* auto generated FeynArts number *), 
     LaTeX -> "s"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fs"   (* auto generated Output name *), 
     PDG -> {1000087}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FT0,{ 
     FeynArtsNr -> 164   (* auto generated FeynArts number *), 
     LaTeX -> "{T}^0"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ft0"   (* auto generated Output name *), 
     PDG -> {1000089}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FTm,{ 
     FeynArtsNr -> 166   (* auto generated FeynArts number *), 
     LaTeX -> "Tm"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ftm"   (* auto generated Output name *), 
     PDG -> {1000091}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FTp,{ 
     FeynArtsNr -> 168   (* auto generated FeynArts number *), 
     LaTeX -> "Tp"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ftp"   (* auto generated Output name *), 
     PDG -> {1000093}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuL,{ 
     FeynArtsNr -> 170   (* auto generated FeynArts number *), 
     LaTeX -> "{u}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "ful"   (* auto generated Output name *), 
     PDG -> {1000097, 1000098, 1000099}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FuR,{ 
     FeynArtsNr -> 172   (* auto generated FeynArts number *), 
     LaTeX -> "{u}_R"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fur"   (* auto generated Output name *), 
     PDG -> {1000103, 1000104, 1000105}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{FvL,{ 
     FeynArtsNr -> 174   (* auto generated FeynArts number *), 
     LaTeX -> "{v}_L"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fvl"   (* auto generated Output name *), 
     PDG -> {1000109, 1000110, 1000111}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{fWB,{ 
     FeynArtsNr -> 176   (* auto generated FeynArts number *), 
     LaTeX -> "\\tilde{WB}"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "fwb"   (* auto generated Output name *), 
     PDG -> {1000115, 1000116, 1000117}   (* auto generated PDGs  *), 
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

{Fs,{ 
     LaTeX -> "\\tilde{S}"}}, 

{FT0,{ 
     LaTeX -> "\\tilde{T}^0"}}, 

{FTm,{ 
     LaTeX -> "\\tilde{T}^-"}}, 

{FTp,{ 
     LaTeX -> "\\tilde{T}^+"}}, 

{FOc,{ 
     LaTeX -> "\\tilde{O}"}}, 

{FRd0,{ 
     LaTeX -> "R_d^0"}}, 

{FRdp,{ 
     LaTeX -> "R_d^+"}}, 

{FRu0,{ 
     LaTeX -> "R_u^0"}}, 

{FRum,{ 
     LaTeX -> "R_u^-"}}, 

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

{sigmaT,{ 
     LaTeX -> "\\sigma_T"}}, 

{phiT,{ 
     LaTeX -> "\\phi_T"}}, 

{sigmaS,{ 
     LaTeX -> "\\sigma_S"}}, 

{phiS,{ 
     LaTeX -> "\\phi_S"}}, 

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

{S,{ 
     LaTeX -> "\\hat{S}"}}, 

{T,{ 
     LaTeX -> "\\hat{T}"}}, 

{oc,{ 
     LaTeX -> "\\hat{oc}"}}, 

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

{Fs,{ 
     LaTeX -> "\\tilde{S}"}}, 

{FT,{ 
     LaTeX -> "\\tilde{T}"}}, 

{FOc,{ 
     LaTeX -> "\\tilde{O}"}}, 

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

{Gl,{ 
     LaTeX -> "g_{l}"   (* auto generated LaTeX name *)}}, 

{sigmaRd,{ 
     LaTeX -> "{\\sigma}_{rd}"   (* auto generated LaTeX name *)}}, 

{phiRu,{ 
     LaTeX -> "{\\phi}_{ru}"   (* auto generated LaTeX name *)}}, 

{sigmaRu,{ 
     LaTeX -> "{\\sigma}_{ru}"   (* auto generated LaTeX name *)}}, 

{phiRd,{ 
     LaTeX -> "{\\phi}_{rd}"   (* auto generated LaTeX name *)}}, 

{Rd,{ 
     LaTeX -> "\\hat{Rd}"   (* auto generated LaTeX name *)}}, 

{Ru,{ 
     LaTeX -> "\\hat{Ru}"   (* auto generated LaTeX name *)}}, 

{conj[FdR],{ 
     LaTeX -> "conjfdr"   (* auto generated LaTeX name *)}}, 

{conj[FuR],{ 
     LaTeX -> "conjfur"   (* auto generated LaTeX name *)}}, 

{conj[FeR],{ 
     LaTeX -> "conjfer"   (* auto generated LaTeX name *)}}, 

{FRd,{ 
     LaTeX -> "Rd"   (* auto generated LaTeX name *)}}, 

{FRu,{ 
     LaTeX -> "Ru"   (* auto generated LaTeX name *)}}, 

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

{Ss,{ 
     LaTeX -> "\\tilde{s}"   (* auto generated LaTeX name *)}}, 

{ST,{ 
     LaTeX -> "\\tilde{T}"   (* auto generated LaTeX name *)}}, 

{SOc,{ 
     LaTeX -> "\\tilde{Oc}"   (* auto generated LaTeX name *)}}, 

{SRd,{ 
     LaTeX -> "\\tilde{Rd}"   (* auto generated LaTeX name *)}}, 

{SRu,{ 
     LaTeX -> "\\tilde{Ru}"   (* auto generated LaTeX name *)}} 
}; 




