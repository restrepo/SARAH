(* SARAH generated template for particles.m file for MSSMU1VL *)
(* File created at 9:08 on 28.1.2016  *) 

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
     Mass -> {0, 0, LesHouches, LesHouches, LesHouches, LesHouches, LesHouches}, 
     OutputName -> "Ah", 
     PDG -> {0, 0, 36, 46, 56, 66, 76}, 
     ElectricCharge -> 0, 
     Width -> {0, 0, External, External, External, External, External}}}, 

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
     PDG -> {1000022, 1000023, 1000025, 1000035, 1000032, 1000036, 1000039, 1000049, 1000059, 1000069}, 
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

{FdV,{ 
     FeynArtsNr -> 42, 
     LaTeX -> "dV", 
     Mass -> LesHouches, 
     OutputName -> "fdv", 
     PDG -> {5000090}, 
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

{Fe1V,{ 
     FeynArtsNr -> 44, 
     LaTeX -> "e1V", 
     Mass -> LesHouches, 
     OutputName -> "e1v", 
     PDG -> {5000092}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{Fe2V,{ 
     FeynArtsNr -> 46, 
     LaTeX -> "e2V", 
     Mass -> LesHouches, 
     OutputName -> "e2v", 
     PDG -> {5000095, 5000096}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{Fn1V,{ 
     FeynArtsNr -> 48, 
     LaTeX -> "n1V", 
     Mass -> LesHouches, 
     OutputName -> "n1v", 
     PDG -> {5000098}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Fn2V,{ 
     FeynArtsNr -> 50, 
     LaTeX -> "n2V", 
     Mass -> LesHouches, 
     OutputName -> "n2v", 
     PDG -> {5000101, 5000102}, 
     ElectricCharge -> 0, 
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
     FeynArtsNr -> 52, 
     LaTeX -> "uV", 
     Mass -> LesHouches, 
     OutputName -> "fuv", 
     PDG -> {5000105, 5000106}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> Automatic, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16, 112, 114, 116}, 
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

{gZp,{ 
     Description -> "Z'-Ghost", 
     FeynArtsNr -> 10, 
     LaTeX -> "\\eta^{Z'}", 
     Mass -> Automatic, 
     OutputName -> "gZp", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "h", 
     PDG -> {25, 35, 45, 55, 65, 75, 85}, 
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

     
{SdV,{ 
     Description -> "VL-Down-Squarks", 
     FeynArtsNr -> 1004, 
     LaTeX -> "\\tilde{d}_V", 
     Mass -> LesHouches, 
     OutputName -> "sdV", 
     PDG -> {5000043, 5000044}, 
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

     
{SeV,{ 
     Description -> "VL-Sleptons", 
     FeynArtsNr -> 1002, 
     LaTeX -> "\\tilde{e}_V", 
     Mass -> LesHouches, 
     OutputName -> "seV", 
     PDG -> {5000051, 5000052, 5000053, 5000054, 5000055, 5000056}, 
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

     
{SuV,{ 
     Description -> "VL-Up-Squarks", 
     FeynArtsNr -> 1003, 
     LaTeX -> "\\tilde{u}_V", 
     Mass -> LesHouches, 
     OutputName -> "suV", 
     PDG -> {5000061, 5000062, 5000063, 5000064}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 
     
{SvIm,{ 
     Description -> "CP-odd Sneutrino", 
     FeynArtsNr -> 40, 
     LaTeX -> "\\nu^I", 
     Mass -> LesHouches, 
     OutputName -> "nI", 
     PDG -> {4000012, 4000014, 4000016, 5000012, 5000014, 5000016}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{SvRe,{ 
     Description -> "CP-even Sneutrino", 
     FeynArtsNr -> 41, 
     LaTeX -> "\\nu^R", 
     Mass -> LesHouches, 
     OutputName -> "nR", 
     PDG -> {1000012, 1000014, 1000016, 2000012, 2000014, 2000016}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

     
{SvVI,{ 
     Description -> "VL-CP-odd Sneutrino", 
     FeynArtsNr -> 4000, 
     LaTeX -> "\\nu^I_V", 
     Mass -> LesHouches, 
     OutputName -> "nIV", 
     PDG -> {5000071, 5000072, 5000073, 5000074, 5000075, 5000076}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{SvVR,{ 
     Description -> "VL-CP-even Sneutrino", 
     FeynArtsNr -> 4001, 
     LaTeX -> "\\nu^R_V", 
     Mass -> LesHouches, 
     OutputName -> "nRV", 
     PDG -> {5000083, 5000084, 5000085, 5000086, 5000087, 5000088}, 
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

{Bino,{ 
     Description -> "Bino", 
     FeynArtsNr -> 11, 
     LaTeX -> "\\tilde{B}", 
     Mass -> Automatic, 
     OutputName -> "b", 
     PDG -> {0}, 
     Width -> Automatic}}, 

{FB,{ 
     Description -> "Bino'", 
     FeynArtsNr -> 10, 
     LaTeX -> "{\\tilde{B}'}", 
     Mass -> LesHouches, 
     OutputName -> "FBp", 
     PDG -> {0}, 
     Width -> Automatic}}, 

{Fd0,{ 
     FeynArtsNr -> 142, 
     LaTeX -> "{d}^0", 
     Mass -> LesHouches, 
     OutputName -> "fd0", 
     PDG -> {9910075, 9910076}, 
     Width -> Automatic}}, 

{Fd1,{ 
     Description -> "Dirac Left Down-Quark", 
     FeynArtsNr -> 120, 
     LaTeX -> "d^1", 
     Mass -> LesHouches, 
     OutputName -> "d1", 
     PDG -> {9910020, 9910021, 9910022}, 
     Width -> Automatic}}, 

{Fd2,{ 
     Description -> "Dirac Right Down-Quark", 
     FeynArtsNr -> 121, 
     LaTeX -> "d^2", 
     Mass -> LesHouches, 
     OutputName -> "d2", 
     PDG -> {9910026, 9910027, 9910028}, 
     Width -> Automatic}}, 

{Fdc0,{ 
     FeynArtsNr -> 144, 
     LaTeX -> "{dc}^0", 
     Mass -> LesHouches, 
     OutputName -> "fdc0", 
     PDG -> {9910079, 9910080}, 
     Width -> Automatic}}, 

{Fdcp,{ 
     FeynArtsNr -> 209, 
     LaTeX -> "dcp", 
     Mass -> LesHouches, 
     OutputName -> "fdcp", 
     PDG -> {9910167, 9910168}, 
     Width -> Automatic}}, 

{Fdp,{ 
     FeynArtsNr -> 148, 
     LaTeX -> "dp", 
     Mass -> LesHouches, 
     OutputName -> "fdp", 
     PDG -> {9910087, 9910088}, 
     Width -> Automatic}}, 

{Fe1,{ 
     Description -> "Dirac Left Electron", 
     FeynArtsNr -> 130, 
     LaTeX -> "e^1", 
     Mass -> LesHouches, 
     OutputName -> "e1", 
     PDG -> {9910032, 9910033, 9910034}, 
     Width -> Automatic}}, 

{Fe2,{ 
     Description -> "Dirac Right Electron", 
     FeynArtsNr -> 131, 
     LaTeX -> "e^2", 
     Mass -> LesHouches, 
     OutputName -> "e2", 
     PDG -> {9910038, 9910039, 9910040}, 
     Width -> Automatic}}, 

{FHd0,{ 
     FeynArtsNr -> 211, 
     LaTeX -> "{Hd}^0", 
     Mass -> LesHouches, 
     OutputName -> "fhd0", 
     PDG -> {9910170}, 
     Width -> Automatic}}, 

{FHdm,{ 
     FeynArtsNr -> 213, 
     LaTeX -> "Hdm", 
     Mass -> LesHouches, 
     OutputName -> "fhdm", 
     PDG -> {9910172}, 
     Width -> Automatic}}, 

{FHu0,{ 
     FeynArtsNr -> 215, 
     LaTeX -> "{Hu}^0", 
     Mass -> LesHouches, 
     OutputName -> "fhu0", 
     PDG -> {9910174}, 
     Width -> Automatic}}, 

{FHup,{ 
     FeynArtsNr -> 217, 
     LaTeX -> "Hup", 
     Mass -> LesHouches, 
     OutputName -> "fhup", 
     PDG -> {9910176}, 
     Width -> Automatic}}, 

{Fn,{ 
     FeynArtsNr -> 150, 
     LaTeX -> "n", 
     Mass -> LesHouches, 
     OutputName -> "fn", 
     PDG -> {9910090}, 
     Width -> Automatic}}, 

{Fnc,{ 
     FeynArtsNr -> 152, 
     LaTeX -> "nc", 
     Mass -> LesHouches, 
     OutputName -> "fnc", 
     PDG -> {9910092}, 
     Width -> Automatic}}, 

{Fs,{ 
     FeynArtsNr -> 154, 
     LaTeX -> "s", 
     Mass -> LesHouches, 
     OutputName -> "fs", 
     PDG -> {9910094}, 
     Width -> Automatic}}, 

{Fs1,{ 
     FeynArtsNr -> 156, 
     LaTeX -> "s1", 
     Mass -> LesHouches, 
     OutputName -> "fs1", 
     PDG -> {9910096}, 
     Width -> Automatic}}, 

{Fs1c,{ 
     FeynArtsNr -> 158, 
     LaTeX -> "s1c", 
     Mass -> LesHouches, 
     OutputName -> "fs1c", 
     PDG -> {9910098}, 
     Width -> Automatic}}, 

{Fs2,{ 
     FeynArtsNr -> 160, 
     LaTeX -> "s2", 
     Mass -> LesHouches, 
     OutputName -> "fs2", 
     PDG -> {9910100}, 
     Width -> Automatic}}, 

{Fsc,{ 
     FeynArtsNr -> 162, 
     LaTeX -> "sc", 
     Mass -> LesHouches, 
     OutputName -> "fsc", 
     PDG -> {9910102}, 
     Width -> Automatic}}, 

{Ft,{ 
     FeynArtsNr -> 164, 
     LaTeX -> "t", 
     Mass -> LesHouches, 
     OutputName -> "ft", 
     PDG -> {9910105, 9910106}, 
     Width -> Automatic}}, 

{Ft3,{ 
     FeynArtsNr -> 166, 
     LaTeX -> "t3", 
     Mass -> LesHouches, 
     OutputName -> "ft3", 
     PDG -> {9910108}, 
     Width -> Automatic}}, 

{Ft3c,{ 
     FeynArtsNr -> 168, 
     LaTeX -> "t3c", 
     Mass -> LesHouches, 
     OutputName -> "ft3c", 
     PDG -> {9910110}, 
     Width -> Automatic}}, 

{Ftc,{ 
     FeynArtsNr -> 170, 
     LaTeX -> "tc", 
     Mass -> LesHouches, 
     OutputName -> "ftc", 
     PDG -> {9910113, 9910114}, 
     Width -> Automatic}}, 

{Fu1,{ 
     Description -> "Dirac Left Up-Quark", 
     FeynArtsNr -> 110, 
     LaTeX -> "u^1", 
     Mass -> LesHouches, 
     OutputName -> "u1", 
     PDG -> {9910044, 9910045, 9910046}, 
     Width -> Automatic}}, 

{Fu2,{ 
     Description -> "Dirac Right Up-Quark", 
     FeynArtsNr -> 111, 
     LaTeX -> "u^2", 
     Mass -> LesHouches, 
     OutputName -> "u2", 
     PDG -> {9910050, 9910051, 9910052}, 
     Width -> Automatic}}, 

{Fv1,{ 
     Description -> "Dirac Left Neutrino", 
     FeynArtsNr -> 140, 
     LaTeX -> "\\nu^1", 
     Mass -> LesHouches, 
     OutputName -> "v1", 
     PDG -> {9910056, 9910057, 9910058}, 
     Width -> Automatic}}, 

{Fv2,{ 
     Description -> "Dirac Right Neutrino", 
     FeynArtsNr -> 141, 
     LaTeX -> "\\nu^2", 
     Mass -> LesHouches, 
     OutputName -> "v2", 
     PDG -> {9910062, 9910063, 9910064}, 
     Width -> Automatic}}, 

{Fx,{ 
     FeynArtsNr -> 172, 
     LaTeX -> "x", 
     Mass -> LesHouches, 
     OutputName -> "fx", 
     PDG -> {9910116}, 
     Width -> Automatic}}, 

{Fxc,{ 
     FeynArtsNr -> 174, 
     LaTeX -> "xc", 
     Mass -> LesHouches, 
     OutputName -> "fxc", 
     PDG -> {9910118}, 
     Width -> Automatic}}, 

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

{Glu,{ 
     Description -> "Gluino", 
     FeynArtsNr -> 15, 
     LaTeX -> "\\tilde{g}", 
     Mass -> LesHouches, 
     OutputName -> "go", 
     PDG -> {1000021}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{gWB,{ 
     Description -> "W-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^W", 
     Mass -> 0, 
     OutputName -> "gW", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 

{Sd0,{ 
     FeynArtsNr -> 176, 
     LaTeX -> "\\tilde{{d}^0}", 
     Mass -> LesHouches, 
     OutputName -> "sd0", 
     PDG -> {9910121, 9910122}, 
     Width -> Automatic}}, 

{Sdc0,{ 
     FeynArtsNr -> 178, 
     LaTeX -> "\\tilde{{dc}^0}", 
     Mass -> LesHouches, 
     OutputName -> "sdc0", 
     PDG -> {9910125, 9910126}, 
     Width -> Automatic}}, 

{Sdcp,{ 
     FeynArtsNr -> 219, 
     LaTeX -> "\\tilde{dcp}", 
     Mass -> LesHouches, 
     OutputName -> "sdcp", 
     PDG -> {9910179, 9910180}, 
     Width -> Automatic}}, 

{SdL,{ 
     Description -> "Left Down-Squarks", 
     FeynArtsNr -> 14, 
     LaTeX -> "\\tilde{d}_L^0", 
     Mass -> Automatic, 
     OutputName -> "dL", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{Sdp,{ 
     FeynArtsNr -> 182, 
     LaTeX -> "\\tilde{dp}", 
     Mass -> LesHouches, 
     OutputName -> "sdp", 
     PDG -> {9910133, 9910134}, 
     Width -> Automatic}}, 

{SdR,{ 
     Description -> "Right Down-Squarks", 
     FeynArtsNr -> 15, 
     LaTeX -> "\\tilde{d}_R^0", 
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

{Sn,{ 
     FeynArtsNr -> 184, 
     LaTeX -> "\\tilde{n}", 
     Mass -> LesHouches, 
     OutputName -> "sn", 
     PDG -> {9910136}, 
     Width -> Automatic}}, 

{Snc,{ 
     FeynArtsNr -> 186, 
     LaTeX -> "\\tilde{nc}", 
     Mass -> LesHouches, 
     OutputName -> "snc", 
     PDG -> {9910138}, 
     Width -> Automatic}}, 

{Ss,{ 
     FeynArtsNr -> 188, 
     LaTeX -> "\\tilde{s}", 
     Mass -> LesHouches, 
     OutputName -> "ss", 
     PDG -> {9910140}, 
     Width -> Automatic}}, 

{Ss1,{ 
     FeynArtsNr -> 190, 
     LaTeX -> "\\tilde{s1}", 
     Mass -> LesHouches, 
     OutputName -> "ss1", 
     PDG -> {9910142}, 
     Width -> Automatic}}, 

{Ss1c,{ 
     FeynArtsNr -> 192, 
     LaTeX -> "\\tilde{s1c}", 
     Mass -> LesHouches, 
     OutputName -> "ss1c", 
     PDG -> {9910144}, 
     Width -> Automatic}}, 

{Ss2,{ 
     FeynArtsNr -> 194, 
     LaTeX -> "\\tilde{s2}", 
     Mass -> LesHouches, 
     OutputName -> "ss2", 
     PDG -> {9910146}, 
     Width -> Automatic}}, 

{Ssc,{ 
     FeynArtsNr -> 196, 
     LaTeX -> "\\tilde{sc}", 
     Mass -> LesHouches, 
     OutputName -> "ssc", 
     PDG -> {9910148}, 
     Width -> Automatic}}, 

{St,{ 
     FeynArtsNr -> 198, 
     LaTeX -> "\\tilde{t}", 
     Mass -> LesHouches, 
     OutputName -> "st", 
     PDG -> {9910151, 9910152}, 
     Width -> Automatic}}, 

{St3,{ 
     FeynArtsNr -> 200, 
     LaTeX -> "\\tilde{t3}", 
     Mass -> LesHouches, 
     OutputName -> "st3", 
     PDG -> {9910154}, 
     Width -> Automatic}}, 

{St3c,{ 
     FeynArtsNr -> 202, 
     LaTeX -> "\\tilde{t3c}", 
     Mass -> LesHouches, 
     OutputName -> "st3c", 
     PDG -> {9910156}, 
     Width -> Automatic}}, 

{Stc,{ 
     FeynArtsNr -> 204, 
     LaTeX -> "\\tilde{tc}", 
     Mass -> LesHouches, 
     OutputName -> "stc", 
     PDG -> {9910159, 9910160}, 
     Width -> Automatic}}, 

{SuL,{ 
     Description -> "Left Up-Squarks", 
     FeynArtsNr -> 16, 
     LaTeX -> "\\tilde{u}_L^0", 
     Mass -> Automatic, 
     OutputName -> "uL", 
     PDG -> {0, 0, 0}, 
     Width -> Automatic}}, 

{SuR,{ 
     Description -> "Right Up-Squarks", 
     FeynArtsNr -> 17, 
     LaTeX -> "\\tilde{u}_R^0", 
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

{SvR,{ 
     Description -> "Right Sneutrino", 
     FeynArtsNr -> 18, 
     LaTeX -> "\\tilde{\\nu}_R", 
     Mass -> Automatic, 
     OutputName -> "vR", 
     PDG -> {0, 0, 0}, 
     Width -> 0}}, 

{Sx,{ 
     FeynArtsNr -> 206, 
     LaTeX -> "\\tilde{x}", 
     Mass -> LesHouches, 
     OutputName -> "sx", 
     PDG -> {9910162}, 
     Width -> Automatic}}, 

{Sxc,{ 
     FeynArtsNr -> 208, 
     LaTeX -> "\\tilde{xc}", 
     Mass -> LesHouches, 
     OutputName -> "sxc", 
     PDG -> {9910164}, 
     Width -> Automatic}}, 

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
     PDG -> {0, 9910067, 9910068}, 
     Width -> 0}}, 

{Wino,{ 
     Description -> "Wino", 
     FeynArtsNr -> 12, 
     LaTeX -> "\\tilde{W}", 
     Mass -> Automatic, 
     OutputName -> "w", 
     PDG -> {0, 9910071, 9910072}, 
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

{fBp,{ 
     LaTeX -> "\\lambda_{B'}"}}, 

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

{FvR,{ 
     LaTeX -> "{v}_R"}}, 

{Fs,{ 
     LaTeX -> "s"}}, 

{Fsc,{ 
     LaTeX -> "sc"}}, 

{Fs1,{ 
     LaTeX -> "s1"}}, 

{Fs1c,{ 
     LaTeX -> "s1c"}}, 

{Fs2,{ 
     LaTeX -> "s2"}}, 

{Ft,{ 
     LaTeX -> "t"}}, 

{Ftc,{ 
     LaTeX -> "conjftc"}}, 

{Ft3,{ 
     LaTeX -> "t3"}}, 

{Ft3c,{ 
     LaTeX -> "conjft3c"}}, 

{Fd0,{ 
     LaTeX -> "{d}^0"}}, 

{Fdp,{ 
     LaTeX -> "dp"}}, 

{Fdc0,{ 
     LaTeX -> "{dc}^0"}}, 

{Fdcp,{ 
     LaTeX -> "dcp"}}, 

{Fx,{ 
     LaTeX -> "x"}}, 

{Fxc,{ 
     LaTeX -> "conjfxc"}}, 

{Fn,{ 
     LaTeX -> "n"}}, 

{Fnc,{ 
     LaTeX -> "conjfnc"}}, 

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

{Fvm,{ 
     LaTeX -> "\\lambda_\\nu"}}, 

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
     LaTeX -> "\\sigma_{S}"}}, 

{phiS,{ 
     LaTeX -> "\\phi_{S}"}}, 

{sigmaSc,{ 
     LaTeX -> "\\sigma_{Sc}"}}, 

{phiSc,{ 
     LaTeX -> "\\phi_{Sc}"}}, 

{sigmaS1,{ 
     LaTeX -> "\\sigma_{S1}"}}, 

{phiS1,{ 
     LaTeX -> "\\phi_{S1}"}}, 

{sigmaS1c,{ 
     LaTeX -> "\\sigma_{S1c}"}}, 

{phiS1c,{ 
     LaTeX -> "\\phi_{S1c}"}}, 

{sigmaS2,{ 
     LaTeX -> "\\sigma_{S2}"}}, 

{phiS2,{ 
     LaTeX -> "\\phi_{S2}"}}, 

{sigmaL,{ 
     LaTeX -> "{\\sigma}_{l}"}}, 

{phiL,{ 
     LaTeX -> "{\\phi}_{l}"}}, 

{sigmaR,{ 
     LaTeX -> "{\\sigma}_{r}"}}, 

{phiR,{ 
     LaTeX -> "{\\phi}_{r}"}}, 

{sigmad0,{ 
     LaTeX -> "\\sigma_{d0}"}}, 

{phid0,{ 
     LaTeX -> "\\phi_{d0}"}}, 

{sigmad0c,{ 
     LaTeX -> "\\sigma_{d0c}"}}, 

{phid0c,{ 
     LaTeX -> "\\phi_{d0c}"}}, 

{sigman,{ 
     LaTeX -> "\\sigma_{n}"}}, 

{phin,{ 
     LaTeX -> "\\phi_{n}"}}, 

{sigmanc,{ 
     LaTeX -> "\\sigma_{nc}"}}, 

{phinc,{ 
     LaTeX -> "\\phi_{nc}"}}, 

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

{vR,{ 
     Description -> "Right Neutrino Superfield", 
     LaTeX -> "\\hat{\\nu}"}}, 

{S,{ 
     LaTeX -> "\\hat{S}"}}, 

{Sc,{ 
     LaTeX -> "\\hat{Sc}"}}, 

{S1,{ 
     LaTeX -> "\\hat{S1}"}}, 

{S1c,{ 
     LaTeX -> "\\hat{S1c}"}}, 

{S2,{ 
     LaTeX -> "\\hat{S2}"}}, 

{T,{ 
     LaTeX -> "T"}}, 

{Tc,{ 
     LaTeX -> "\\hat{Tc}"}}, 

{T3,{ 
     LaTeX -> "\\hat{T3}"}}, 

{T3c,{ 
     LaTeX -> "\\hat{T3c}"}}, 

{D1,{ 
     LaTeX -> "\\hat{D1}"}}, 

{Dc,{ 
     LaTeX -> "\\hat{Dc}"}}, 

{X,{ 
     LaTeX -> "\\hat{X}"}}, 

{Xc,{ 
     LaTeX -> "\\hat{Xc}"}}, 

{N,{ 
     LaTeX -> "\\hat{N}"}}, 

{Nc,{ 
     LaTeX -> "\\hat{Nc}"}}, 

{B,{ 
     Description -> "B Superfield", 
     LaTeX -> "\\hat{B}"}}, 

{WB,{ 
     Description -> "W Superfield", 
     LaTeX -> "\\hat{W}"}}, 

{G,{ 
     Description -> "Gluon Superfield", 
     LaTeX -> "\\hat{g}"}}, 

{Bp,{ 
     LaTeX -> "\\hat{B}'"}}, 

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

{conj[FvR],{ 
     LaTeX -> "conjfvr"}}, 

{Fs,{ 
     LaTeX -> "s"}}, 

{Fsc,{ 
     LaTeX -> "sc"}}, 

{Fs1,{ 
     LaTeX -> "s1"}}, 

{Fs1c,{ 
     LaTeX -> "s1c"}}, 

{Fs2,{ 
     LaTeX -> "s2"}}, 

{Ft,{ 
     LaTeX -> "t"}}, 

{conj[Ftc],{ 
     LaTeX -> "conjftc"}}, 

{Ft3,{ 
     LaTeX -> "t3"}}, 

{conj[Ft3c],{ 
     LaTeX -> "conjft3c"}}, 

{FD1,{ 
     LaTeX -> "D1"}}, 

{FDc,{ 
     LaTeX -> "Dc"}}, 

{Fx,{ 
     LaTeX -> "x"}}, 

{conj[Fxc],{ 
     LaTeX -> "conjfxc"}}, 

{Fn,{ 
     LaTeX -> "n"}}, 

{conj[Fnc],{ 
     LaTeX -> "conjfnc"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VWB,{ 
     LaTeX -> "WB"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

{VBp,{ 
     LaTeX -> "Bp"}}, 

{fB,{ 
     Description -> "Bino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{B}}"}}, 

{fWB,{ 
     Description -> "Wino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{W}}"}}, 

{fG,{ 
     Description -> "Gluino Weyl-Spinor", 
     LaTeX -> "\\lambda_{\\tilde{g}}"}}, 

{fBp,{ 
     LaTeX -> "\\lambda_{B'}"}}, 

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

{conj[SvR],{ 
     LaTeX -> "conjsvr"}}, 

{Ss,{ 
     LaTeX -> "\\tilde{s}"}}, 

{Ssc,{ 
     LaTeX -> "\\tilde{sc}"}}, 

{Ss1,{ 
     LaTeX -> "\\tilde{s1}"}}, 

{Ss1c,{ 
     LaTeX -> "\\tilde{s1c}"}}, 

{Ss2,{ 
     LaTeX -> "\\tilde{s2}"}}, 

{St,{ 
     LaTeX -> "\\tilde{t}"}}, 

{conj[Stc],{ 
     LaTeX -> "conjstc"}}, 

{St3,{ 
     LaTeX -> "\\tilde{t3}"}}, 

{conj[St3c],{ 
     LaTeX -> "conjst3c"}}, 

{SD1,{ 
     LaTeX -> "\\tilde{D1}"}}, 

{SDc,{ 
     LaTeX -> "\\tilde{Dc}"}}, 

{Sx,{ 
     LaTeX -> "\\tilde{x}"}}, 

{conj[Sxc],{ 
     LaTeX -> "conjsxc"}}, 

{Sn,{ 
     LaTeX -> "\\tilde{n}"}}, 

{conj[Snc],{ 
     LaTeX -> "conjsnc"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{FTL,{ 
     LaTeX -> "{T}_L"   (* auto generated LaTeX name *)}}, 

{FTR,{ 
     LaTeX -> "{T}_R"   (* auto generated LaTeX name *)}}, 

{FEPL,{ 
     LaTeX -> "{EP}_L"   (* auto generated LaTeX name *)}}, 

{FEPR,{ 
     LaTeX -> "{EP}_R"   (* auto generated LaTeX name *)}}, 

{FNL,{ 
     LaTeX -> "{N}_L"   (* auto generated LaTeX name *)}}, 

{FNR,{ 
     LaTeX -> "{N}_R"   (* auto generated LaTeX name *)}} 
}; 




