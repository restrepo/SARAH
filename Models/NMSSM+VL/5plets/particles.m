(* SARAH generated template for particles.m file for NMSSM5 *)
(* File created at 11:49 on 15.1.2016  *) 

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
     PDG -> {0, 36, 46}   , 
     ElectricCharge -> 0, 
     Width -> {0, External}}}, 

{Cha,{ 
     Description -> "Charginos", 
     FeynArtsNr -> 12, 
     LaTeX -> {"\\tilde{\\chi}^-","\\tilde{\\chi}^-"}, 
     Mass -> LesHouches, 
     OutputName -> "C", 
     PDG -> {-1000024, -1000037}   , 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Chi,{ 
     Description -> "Neutralinos", 
     FeynArtsNr -> 11, 
     LaTeX -> "\\tilde{\\chi}^0", 
     Mass -> LesHouches, 
     OutputName -> "N", 
     PDG -> {1000022, 1000023, 1000025, 1000035, 1000045}   , 
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

{Fdp,{ 
     FeynArtsNr -> 89, 
     LaTeX -> "dp", 
     Mass -> LesHouches, 
     OutputName -> "fdp", 
     PDG -> {88888896}, 
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
     PDG -> {1000021}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{gP,{ 
     Description -> "Photon Ghost", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\eta^{\\gamma}", 
     Mass -> 0, 
     OutputName -> "gA", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWm,{ 
     Description -> "Negative W-Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWm], 
     OutputName -> "gWm", 
     PDG -> {0}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{gWmC,{ 
     Description -> "Positive W-Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWm], 
     OutputName -> "gWpC", 
     PDG -> {0}, 
     ElectricCharge -> 1, 
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
     PDG -> {25, 35, 45}   , 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hpm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^-","H^+"}, 
     Mass -> {0, LesHouches}, 
     OutputName -> {"Hm","Hp"}, 
     PDG -> {0, -37}   , 
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

{Sdp,{ 
     FeynArtsNr -> 95, 
     LaTeX -> "\\tilde{dp}", 
     Mass -> LesHouches, 
     OutputName -> "sdp", 
     PDG -> {88888905, 88888906}, 
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

{Fep,{ 
     FeynArtsNr -> 96  , 
     LaTeX -> "e'"   , 
     Mass -> LesHouches, 
     OutputName -> "fep" , 
     PDG -> {88888938}   , 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Fvp,{ 
     FeynArtsNr -> 98  , 
     LaTeX -> "v'"   , 
     Mass -> LesHouches, 
     OutputName -> "fvp" , 
     PDG -> {88888940}   , 
     ElectricCharge -> 0 , 
     Width -> Automatic}}, 

{Sep,{ 
     FeynArtsNr -> 100  , 
     LaTeX -> "\\tilde{e'}"   , 
     Mass -> LesHouches, 
     OutputName -> "sep" , 
     PDG -> {88888943, 88888944}   , 
     ElectricCharge -> -1 , 
     Width -> Automatic}}, 

{Svp,{ 
     FeynArtsNr -> 102  , 
     LaTeX -> "\\tilde{v'}"   , 
     Mass -> LesHouches, 
     OutputName -> "svp" , 
     PDG -> {88888947, 88888948}   , 
     ElectricCharge -> 0 , 
     Width -> Automatic}} 
}; 




(* ###############            GaugeES       ################# *) 

ParticleDefinitions[GaugeES] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{fB,{ 
     FeynArtsNr -> 132, 
     LaTeX -> "\\tilde{B}", 
     Mass -> LesHouches, 
     OutputName -> "fb", 
     PDG -> {1000027}, 
     Width -> Automatic}}, 

{FdL,{ 
     FeynArtsNr -> 134, 
     LaTeX -> "{d}_L", 
     Mass -> LesHouches, 
     OutputName -> "fdl", 
     PDG -> {1000031, 1000032, 1000033}, 
     Width -> Automatic}}, 

{FdR,{ 
     FeynArtsNr -> 140, 
     LaTeX -> "{d}_R", 
     Mass -> LesHouches, 
     OutputName -> "fdr", 
     PDG -> {1000041, 1000042, 1000043}, 
     Width -> Automatic}}, 

{FdR5,{ 
     FeynArtsNr -> 195, 
     LaTeX -> "dR5", 
     Mass -> LesHouches, 
     OutputName -> "fdr5", 
     PDG -> {1000123}, 
     Width -> Automatic}}, 

{FdR5p,{ 
     FeynArtsNr -> 197, 
     LaTeX -> "dR5p", 
     Mass -> LesHouches, 
     OutputName -> "fdr5p", 
     PDG -> {1000125}, 
     Width -> Automatic}}, 

{FeL,{ 
     FeynArtsNr -> 142, 
     LaTeX -> "{e}_L", 
     Mass -> LesHouches, 
     OutputName -> "fel", 
     PDG -> {1000047, 1000048, 1000049}, 
     Width -> Automatic}}, 

{FeL5,{ 
     FeynArtsNr -> 199, 
     LaTeX -> "eL5", 
     Mass -> LesHouches, 
     OutputName -> "fel5", 
     PDG -> {1000127}, 
     Width -> Automatic}}, 

{FeL5p,{ 
     FeynArtsNr -> 201, 
     LaTeX -> "eL5p", 
     Mass -> LesHouches, 
     OutputName -> "fel5p", 
     PDG -> {1000129}, 
     Width -> Automatic}}, 

{FeR,{ 
     FeynArtsNr -> 144, 
     LaTeX -> "{e}_R", 
     Mass -> LesHouches, 
     OutputName -> "fer", 
     PDG -> {1000053, 1000054, 1000055}, 
     Width -> Automatic}}, 

{fG,{ 
     FeynArtsNr -> 150, 
     LaTeX -> "\\tilde{G}", 
     Mass -> LesHouches, 
     OutputName -> "fg", 
     PDG -> {1000061}, 
     Width -> Automatic}}, 

{FHd0,{ 
     FeynArtsNr -> 152, 
     LaTeX -> "{Hd}^0", 
     Mass -> LesHouches, 
     OutputName -> "fhd0", 
     PDG -> {1000063}, 
     Width -> Automatic}}, 

{FHdm,{ 
     FeynArtsNr -> 154, 
     LaTeX -> "Hdm", 
     Mass -> LesHouches, 
     OutputName -> "fhdm", 
     PDG -> {1000065}, 
     Width -> Automatic}}, 

{FHu0,{ 
     FeynArtsNr -> 156, 
     LaTeX -> "{Hu}^0", 
     Mass -> LesHouches, 
     OutputName -> "fhu0", 
     PDG -> {1000067}, 
     Width -> Automatic}}, 

{FHup,{ 
     FeynArtsNr -> 158, 
     LaTeX -> "Hup", 
     Mass -> LesHouches, 
     OutputName -> "fhup", 
     PDG -> {1000069}, 
     Width -> Automatic}}, 

{FsR,{ 
     FeynArtsNr -> 160, 
     LaTeX -> "{s}_R", 
     Mass -> LesHouches, 
     OutputName -> "fsr", 
     PDG -> {1000071}, 
     Width -> Automatic}}, 

{FuL,{ 
     FeynArtsNr -> 162, 
     LaTeX -> "{u}_L", 
     Mass -> LesHouches, 
     OutputName -> "ful", 
     PDG -> {1000075, 1000076, 1000077}, 
     Width -> Automatic}}, 

{FuR,{ 
     FeynArtsNr -> 168, 
     LaTeX -> "{u}_R", 
     Mass -> LesHouches, 
     OutputName -> "fur", 
     PDG -> {1000085, 1000086, 1000087}, 
     Width -> Automatic}}, 

{FvL,{ 
     FeynArtsNr -> 174, 
     LaTeX -> "{v}_L", 
     Mass -> LesHouches, 
     OutputName -> "fvl", 
     PDG -> {1000095, 1000096, 1000097}, 
     Width -> Automatic}}, 

{FvL5,{ 
     FeynArtsNr -> 203, 
     LaTeX -> "v_{L5}", 
     Mass -> LesHouches, 
     OutputName -> "fvl5", 
     PDG -> {1000131}, 
     Width -> Automatic}}, 

{FvL5p,{ 
     FeynArtsNr -> 205, 
     LaTeX -> "v_{L5p}", 
     Mass -> LesHouches, 
     OutputName -> "fvl5p", 
     PDG -> {1000133}, 
     Width -> Automatic}}, 

{fWB,{ 
     FeynArtsNr -> 176, 
     LaTeX -> "\\tilde{WB}", 
     Mass -> LesHouches, 
     OutputName -> "fwb", 
     PDG -> {1000101, 1000102, 1000103}, 
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
     PDG -> {0}   , 
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

{SdR5,{ 
     FeynArtsNr -> 207, 
     LaTeX -> "\\tilde{dR5}", 
     Mass -> LesHouches, 
     OutputName -> "sdr5", 
     PDG -> {1000135}, 
     Width -> Automatic}}, 

{SdR5p,{ 
     FeynArtsNr -> 209, 
     LaTeX -> "\\tilde{dR5p}", 
     Mass -> LesHouches, 
     OutputName -> "sdr5p", 
     PDG -> {1000137}, 
     Width -> Automatic}}, 

{SeL,{ 
     Description -> "Left Selectron", 
     FeynArtsNr -> 12, 
     LaTeX -> "\\tilde{e}_L", 
     Mass -> Automatic, 
     OutputName -> "eL", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SeL5,{ 
     FeynArtsNr -> 211, 
     LaTeX -> "\\tilde{eL5}", 
     Mass -> LesHouches, 
     OutputName -> "sel5", 
     PDG -> {1000139}, 
     Width -> Automatic}}, 

{SeL5p,{ 
     FeynArtsNr -> 213, 
     LaTeX -> "\\tilde{eL5p}", 
     Mass -> LesHouches, 
     OutputName -> "sel5p", 
     PDG -> {1000141}, 
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

{SsR,{ 
     FeynArtsNr -> 186, 
     LaTeX -> "\\tilde{{s}_R}", 
     Mass -> LesHouches, 
     OutputName -> "ssr", 
     PDG -> {1000113}, 
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

{SvL5,{ 
     FeynArtsNr -> 215, 
     LaTeX -> "\\tilde{v_{L5}}", 
     Mass -> LesHouches, 
     OutputName -> "svl5", 
     PDG -> {1000143}, 
     Width -> Automatic}}, 

{SvL5p,{ 
     FeynArtsNr -> 217, 
     LaTeX -> "\\tilde{v_{L5p}}", 
     Mass -> LesHouches, 
     OutputName -> "svl5p", 
     PDG -> {1000145}, 
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
     PDG -> {0, 1000024, 1000025}, 
     Width -> 0}} 
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

{FdR,{ 
     LaTeX -> "conjfdr"}}, 

{FuR,{ 
     LaTeX -> "conjfur"}}, 

{FeR,{ 
     LaTeX -> "conjfer"}}, 

{FdR5,{ 
     LaTeX -> "dR5"}}, 

{FdR5p,{ 
     LaTeX -> "dR5p"}}, 

{FeL5,{ 
     LaTeX -> "eL5"}}, 

{FvL5,{ 
     LaTeX -> "v_{L5}"}}, 

{FeL5p,{ 
     LaTeX -> "eL5p"}}, 

{FvL5p,{ 
     LaTeX -> "v_{L5p}"}}, 

{FsR,{ 
     LaTeX -> "{s}_R"}}, 

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

{sigmaS,{ 
     LaTeX -> "{\\sigma}_{s}"}}, 

{phiS,{ 
     LaTeX -> "{\\phi}_{s}"}}, 

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

{d5,{ 
     LaTeX -> "\\hat{d5}"}}, 

{d5p,{ 
     LaTeX -> "\\hat{d5p}"}}, 

{l5,{ 
     LaTeX -> "\\hat{l5}"}}, 

{l5p,{ 
     LaTeX -> "\\hat{l5p}"}}, 

{s,{ 
     LaTeX -> "\\hat{s}"}}, 

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

{conj[FdR],{ 
     LaTeX -> "conjfdr"}}, 

{conj[FuR],{ 
     LaTeX -> "conjfur"}}, 

{conj[FeR],{ 
     LaTeX -> "conjfer"}}, 

{conj[FdR5],{ 
     LaTeX -> "conjfdr5"}}, 

{conj[FdR5p],{ 
     LaTeX -> "conjfdr5p"}}, 

{Fl5,{ 
     LaTeX -> "l5"}}, 

{Fl5p,{ 
     LaTeX -> "l5p"}}, 

{FsR,{ 
     LaTeX -> "{s}_R"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VWB,{ 
     LaTeX -> "WB"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

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

{conj[SdR],{ 
     LaTeX -> "conjsdr"}}, 

{conj[SuR],{ 
     LaTeX -> "conjsur"}}, 

{conj[SeR],{ 
     LaTeX -> "conjser"}}, 

{conj[SdR5],{ 
     LaTeX -> "conjsdr5"}}, 

{conj[SdR5p],{ 
     LaTeX -> "conjsdr5p"}}, 

{Sl5,{ 
     LaTeX -> "\\tilde{l5}"}}, 

{Sl5p,{ 
     LaTeX -> "\\tilde{l5p}"}}, 

{SsR,{ 
     LaTeX -> "\\tilde{{s}_R}"}} 
}; 




