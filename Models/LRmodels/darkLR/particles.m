(* SARAH generated template for particles.m file for darkLR *)
(* File created at 20:11 on 15.1.2016  *)

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
     Mass -> {0, 0, LesHouches},
     OutputName -> "Ah",
     PDG -> {0, 0, 36, 6000021, 6000022, 6000023},
     ElectricCharge -> 0,
     Width -> {0, 0, External}}},

{Fd,{
     Description -> "Down-Quarks",
     FeynArtsNr -> 4,
     LaTeX -> "d",
     Mass -> {0.0035, 0.104, 4.2, LesHouches, LesHouches, LesHouches},
     OutputName -> "d",
     PDG -> {1, 3, 5, 6000001, 6000003, 6000005},
     ElectricCharge -> -1/3,
     Width -> {0, 0, 0, External, External, External}}},

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
     Mass -> {LesHouches, LesHouches, LesHouches, LesHouches, LesHouches, LesHouches},
     OutputName -> "nu",
     PDG -> {12, 14, 16, 6000012, 6000014, 6000016},
     ElectricCharge -> 0,
     Width -> {External, External, External, External, External, External}}},

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
     FeynArtsNr -> 1,
     LaTeX -> "\\eta^P",
     Mass -> 0,
     OutputName -> "gP",
     PDG -> {0},
     ElectricCharge -> 0,
     Width -> 0}},

{gWLm,{
     Description -> "Negative W-Boson Ghost",
     FeynArtsNr -> 3,
     LaTeX -> "\\eta_L^-",
     Mass -> Mass[VWLm],
     OutputName -> "gWLm",
     PDG -> {0},
     ElectricCharge -> -1,
     Width -> Automatic}},

{gWLmC,{
     Description -> "Positive W-Boson Ghost",
     FeynArtsNr -> 4,
     LaTeX -> "\\eta_L^+",
     Mass -> Mass[VWLm],
     OutputName -> "gWLp",
     PDG -> {0},
     ElectricCharge -> 1,
     Width -> Automatic}},

{gWRm,{
     Description -> "Negative W'-Boson Ghost",
     FeynArtsNr -> 93,
     LaTeX -> "\\eta_R^-",
     Mass -> Mass[VWRm],
     OutputName -> "gWRm",
     PDG -> {0},
     ElectricCharge -> -1,
     Width -> 0}},

{gWRmC,{
     Description -> "Positive W'-Boson Ghost",
     FeynArtsNr -> 83,
     LaTeX -> "\\eta_R^+",
     Mass -> Mass[VWRm],
     OutputName -> "gWRp",
     PDG -> {0},
     ElectricCharge -> 1,
     Width -> 0}},

{gZ,{
     Description -> "Z-Boson Ghost",
     FeynArtsNr -> 2,
     LaTeX -> "\\eta^Z",
     Mass -> Mass[VZ],
     OutputName -> "gZ",
     PDG -> {0},
     ElectricCharge -> 0,
     Width -> Automatic}},

{gZR,{
     Description -> "Z'-Ghost",
     FeynArtsNr -> 10,
     LaTeX -> "\\eta^{Z'}",
     Mass -> Mass[VZR],
     OutputName -> "gZp",
     PDG -> {0},
     ElectricCharge -> 0,
     Width -> 0}},

{hh,{
     Description -> "Higgs",
     FeynArtsNr -> 1,
     LaTeX -> "h",
     Mass -> LesHouches,
     OutputName -> "hh",
     PDG -> {25, 35, 335, 6000029, 6000030, 6000031},
     ElectricCharge -> 0,
     Width -> Automatic}},

{Hpm,{
     Description -> "Charged Higgs",
     FeynArtsNr -> {0, 0, 3, 3003},
     LaTeX -> {"H^-","H^+"},
     Mass -> {0, 0, LesHouches},
     OutputName -> {"Hm","Hp"},
     PDG -> {0, 0, -37, -6000034, -6000035, -6000036},
     ElectricCharge -> -1,
     Width -> {0, 0, External}}},

{Hppmm,{
     FeynArtsNr -> {2337, 3447},
     LaTeX -> {"\\delta^{c--}","\\delta^{c++}"},
     Mass -> LesHouches,
     OutputName -> {"Hmm","Hpp"},
     PDG -> {-9000055, -9000065},
     ElectricCharge -> -2,
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

{VWLm,{
     Description -> "W-Boson",
     Goldstone -> Hpm[{1}],
     FeynArtsNr -> 3,
     LaTeX -> {"W^-","W^+"},
     Mass -> Dependence,
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]],
     OutputName -> {"WLm","WLp"},
     PDG -> {-24},
     ElectricCharge -> -1,
     Width -> 2.141}},

{VWRm,{
     Goldstone -> Hpm[{2}],
     FeynArtsNr -> 20,
     LaTeX -> {"W_R^-","W_R^+"},
     Mass -> LesHouches,
     OutputName -> {"WRm","WRp"},
     PDG -> {-34},
     ElectricCharge -> -1,
     Width -> Automatic}},

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

{VZR,{
     Description -> "Z'-Boson",
     Goldstone -> Ah[{2}],
     FeynArtsNr -> 10,
     LaTeX -> "{Z'}",
     Mass -> LesHouches,
     OutputName -> "Zp",
     PDG -> {32},
     ElectricCharge -> 0,
     Width -> Automatic}}
};




(* ###############            GaugeES       ################# *)

ParticleDefinitions[GaugeES] = {

(* ----------- Already defined particles in existing particles.m -------------- *)

{deltaL0,{
     FeynArtsNr -> {511},
     LaTeX -> "\\Delta_{1L0}",
     Mass -> Automatic,
     OutputName -> "dlt1L0",
     PDG -> {0},
     ElectricCharge -> 0,
     Width -> {0}}},

{deltaLp,{
     FeynArtsNr -> {512},
     LaTeX -> {"\\Delta_{L}^+","\\Delta_{L}^+"},
     Mass -> Automatic,
     OutputName -> {"dlt1Lp","dlt1Lp"},
     PDG -> {0},
     ElectricCharge -> 1,
     Width -> {0}}},

{deltaLpp,{
     Description -> "LH Doubly-Charged Higgs",
     FeynArtsNr -> {5053},
     LaTeX -> {"HL^{++}","HL^{++}"},
     Mass -> {0},
     OutputName -> {"HLpp","HLpp"},
     PDG -> {0},
     ElectricCharge -> 2,
     Width -> {0}}},

{deltaR0,{
     FeynArtsNr -> {501},
     LaTeX -> "\\Delta_{1R0}",
     Mass -> Automatic,
     OutputName -> "dlt1R0",
     PDG -> {0},
     ElectricCharge -> 0,
     Width -> {0}}},

{deltaRp,{
     FeynArtsNr -> {502},
     LaTeX -> {"\\Delta_{R}^+","\\Delta_{R}^+"},
     Mass -> Automatic,
     OutputName -> {"dlt1Rp","dlt1Rp"},
     PDG -> {0},
     ElectricCharge -> 1,
     Width -> {0}}},

{deltaRpp,{
     Description -> "RH Doubly-Charged Higgs",
     FeynArtsNr -> {5052},
     LaTeX -> {"HR^{++}","HR^{++}"},
     Mass -> {0},
     OutputName -> {"HRpp","HRpp"},
     PDG -> {0},
     ElectricCharge -> 2,
     Width -> {0}}},

{dVR,{
     FeynArtsNr -> {5053},
     LaTeX -> "dvr",
     Mass -> LesHouches,
     OutputName -> "dvr",
     PDG -> {35, 36, 37},
     Width -> Automatic}},

{Fd1,{
     Description -> "Dirac Left Down-Quark",
     FeynArtsNr -> 120,
     LaTeX -> "d^1",
     Mass -> LesHouches,
     OutputName -> "d1",
     PDG -> {1, 3, 5},
     Width -> {0, 0, 0}}},

{Fd2,{
     Description -> "Dirac Right Down-Quark",
     FeynArtsNr -> 121,
     LaTeX -> "d^2",
     Mass -> LesHouches,
     OutputName -> "d2",
     PDG -> {0, 0, 0},
     Width -> {0, 0, 0}}},

{Fe1,{
     Description -> "Dirac Left Electron",
     FeynArtsNr -> 130,
     LaTeX -> "e^1",
     Mass -> LesHouches,
     OutputName -> "e1",
     PDG -> {11, 13, 15},
     Width -> {0, 0, 0}}},

{Fe2,{
     Description -> "Dirac Right Electron",
     FeynArtsNr -> 131,
     LaTeX -> "e^2",
     Mass -> LesHouches,
     OutputName -> "e2",
     PDG -> {0, 0, 0},
     Width -> {0, 0, 0}}},

{Fu1,{
     Description -> "Dirac Left Up-Quark",
     FeynArtsNr -> 110,
     LaTeX -> "u^1",
     Mass -> LesHouches,
     OutputName -> "u1",
     PDG -> {2, 4, 6},
     Width -> {0, 0, 0}}},

{Fu2,{
     Description -> "Dirac Right Up-Quark",
     FeynArtsNr -> 111,
     LaTeX -> "u^2",
     Mass -> LesHouches,
     OutputName -> "u2",
     PDG -> {0, 0, 0},
     Width -> {0, 0, 0}}},

{Fv1,{
     Description -> "Dirac Left Neutrino",
     FeynArtsNr -> 140,
     LaTeX -> "\\nu^1",
     Mass -> LesHouches,
     OutputName -> "v1",
     PDG -> {12, 14, 16},
     Width -> {0, 0, 0}}},

{Fv2,{
     Description -> "Dirac Right Neutrino",
     FeynArtsNr -> 141,
     LaTeX -> "\\nu^2",
     Mass -> LesHouches,
     OutputName -> "v2",
     PDG -> {0, 0, 0},
     Width -> {0, 0, 0}}},

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

{gWL,{
     Description -> "W-Boson Ghost",
     FeynArtsNr -> 2,
     LaTeX -> "\\eta^W",
     Mass -> 0,
     OutputName -> "gW",
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *),
     Width -> 0}},

{gWR,{
     FeynArtsNr -> 3,
     LaTeX -> "\\eta^{WR}",
     Mass -> LesHouches,
     OutputName -> "gWR",
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{H0,{
     FeynArtsNr -> {1191},
     LaTeX -> "{h}^0",
     Mass -> LesHouches,
     OutputName -> "h0",
     PDG -> {39},
     Width -> Automatic}},

{hL0,{
     FeynArtsNr -> 1,
     LaTeX -> "HL^0",
     Mass -> Automatic,
     OutputName -> "HL0",
     PDG -> {0},
     Width -> 0}},

{hLp,{
     Description -> "Charged Left Higgs",
     FeynArtsNr -> {500},
     LaTeX -> {"HL^+","HL^+"},
     Mass -> {0},
     OutputName -> {"HLp","HLp"},
     PDG -> {0},
     ElectricCharge -> 1,
     Width -> {0}}},

{Hm,{
     FeynArtsNr -> {1192},
     LaTeX -> "hm",
     Mass -> LesHouches,
     OutputName -> "hm",
     PDG -> {41},
     Width -> Automatic}},

{Hp,{
     FeynArtsNr -> {1193},
     LaTeX -> "hp",
     Mass -> LesHouches,
     OutputName -> "hp",
     PDG -> {43},
     Width -> Automatic}},

{HPrime0,{
    FeynArtsNr -> {1194},
     LaTeX -> "{hprime}^0",
     Mass -> LesHouches,
     OutputName -> "hprime0",
     PDG -> {45},
     Width -> Automatic}},

{hR0,{
     FeynArtsNr -> 301,
     LaTeX -> "{HR}^0",
     Mass -> Automatic,
     OutputName -> "HR0",
     PDG -> {0},
     Width -> Automatic}},

{hRp,{
     Description -> "Charged Right Higgs",
     FeynArtsNr -> {4},
     LaTeX -> {"HR^+","HR^+"},
     Mass -> {0},
     OutputName -> {"HRp","HRp"},
     PDG -> {0},
     ElectricCharge -> 1,
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

{VWL,{
     Description -> "W-Bosons",
     FeynArtsNr -> 2,
     LaTeX -> "W",
     Mass -> 0,
     OutputName -> "W",
     PDG -> {0, 24, 25},
     Width -> 0}},

{VWR,{
     FeynArtsNr -> 20,
     LaTeX -> "W_R",
     Mass -> LesHouches,
     OutputName -> "WR",
     PDG -> {29, 30, 31},
     Width -> Automatic}},
{xL,{FeynArtsNr -> {9878},
     LaTeX -> "x_L",
     Mass -> LesHouches,
     OutputName -> "xL",
     PDG -> {7,8,9}}}

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

{nuL,{
     LaTeX -> "\\nu_L"}},

{dR,{
     LaTeX -> "d_R"}},

{uR,{
     LaTeX -> "u_R"}},

{eR,{
     LaTeX -> "e_R"}},

{nuR,{
     LaTeX -> "\\nu_R"}},

{dVR,{
     LaTeX -> "dvr"}},

{xL,{
     LaTeX -> "evl"}},

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

{Fv0,{
     LaTeX -> "\\nu_0"}},

{sigmaH10,{
     LaTeX -> "{{\\sigma}_{h1}}^0"}},

{phiH10,{
     LaTeX -> "{{\\phi}_{h1}}^0"}},

{sigmaH20,{
     LaTeX -> "{{\\sigma}_{h2}}^0"}},

{phiH20,{
     LaTeX -> "{{\\phi}_{h2}}^0"}},

{sigmadL,{
     LaTeX -> "{\\sigma}_{dl}"}},

{phidL,{
     LaTeX -> "{\\phi}_{dl}"}},

{sigmadR,{
     LaTeX -> "{\\sigma}_{dr}"}},

{phidR,{
     LaTeX -> "{\\phi}_{dr}"}},

{sigmaHL,{
     LaTeX -> "{\\sigma}_{hl}"}},

{phiHL,{
     LaTeX -> "{\\phi}_{hl}"}},

{sigmaHR,{
     LaTeX -> "{\\sigma}_{hr}"}},

{phiHR,{
     LaTeX -> "{\\phi}_{hr}"}},

{deltaL,{
     LaTeX -> "{\\delta}_{l}"}},

{deltaR,{
     LaTeX -> "\\hat{\\Delta}^c"}},

{DVR,{
     LaTeX -> "dvr"}},

{HL,{
     LaTeX -> "hl"}},

{HR,{
     LaTeX -> "hr"}},

{LLbar,{
     LaTeX -> "\\bar{ll}"}},

{LR,{
     LaTeX -> "lr"}},

{Phi,{
     LaTeX -> "\\phi"}},

{QLbar,{
     LaTeX -> "\\bar{ql}"}},

{QR,{
     LaTeX -> "qr"}},

{VB,{
     LaTeX -> "B"}},

{VG,{
     LaTeX -> "G"}},

{VWL,{
     LaTeX -> "{W}_L"}},

{VWR,{
     LaTeX -> "{W}_R"}},

{XVLbar,{
     LaTeX -> "\\bar{xvl}"}}
};




