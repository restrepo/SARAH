(* SARAH generated template for particles.m file for 331v2 *)
(* File created at 13:09 on 20.1.2016  *)

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
     PDG -> {0, 0, 36},
     ElectricCharge -> 0,
     Width -> {0, External}}},

{Fd,{
     Description -> "Down-Quarks",
     FeynArtsNr -> 4,
     LaTeX -> "d",
     Mass -> {0.0035, 0.104, 4.2},
     OutputName -> "d",
     PDG -> {1, 3, 5}   (* adjusted number of PDGs to number of generations  *),
     ElectricCharge -> -1/3,
     Width -> {0, 0, 0, 0, 0}}},

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
     Width -> {0, 0, 1.51, 0}}},

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

{gXp,{
     Description -> "Positive W-Boson prime Ghost",
     FeynArtsNr -> 4,
     LaTeX -> "\\eta^{\\prime +}",
     Mass -> Mass[VWpm],
     OutputName -> "gXp",
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *),
     ElectricCharge -> 1,
     Width -> Automatic}},

{gXpC,{
     Description -> "Negative W-Boson prime Ghost",
     FeynArtsNr -> 3,
     LaTeX -> "\\eta^{\\prime -}",
     Mass -> Mass[VWpm],
     OutputName -> "gXm",
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

{gZp,{
     Description -> "Z-boson prime Ghost",
     FeynArtsNr -> 1,
     LaTeX -> "\\eta^{Z^\\prime}",
     Mass -> 0,
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
     PDG -> {25, 35, 1035},
     ElectricCharge -> 0,
     Width -> Automatic}},

{Hpm,{
     Description -> "Charged Higgs",
     FeynArtsNr -> 3,
     LaTeX -> "H^\\pm",
     Mass -> LesHouches,
     OutputName -> "Hpm",
     PDG -> {0, 0, -37, -39},
     ElectricCharge -> -1,
     Width -> External}},

{Dpm,{
     Description -> "Doubly Charged Higgs",
     FeynArtsNr -> 6   (* auto generated FeynArts number *),
     LaTeX -> "H^{\\pm\\pm}",
     Mass -> LesHouches,
     OutputName -> "Dpm",
     PDG -> {0, -41},
     ElectricCharge -> 2,
     Width -> External}},

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
     Goldstone -> Hpm[{1}],
     FeynArtsNr -> 3,
     LaTeX -> {"W^+","W^-"},
     Mass -> Dependence,
     MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[-((Pi*Mass[VZ]^2)/(Sqrt[2]*aEWinv*Gf)) + Mass[VZ]^4/4]],
     OutputName -> {"Wp","Wm"},
     PDG -> {24},
     ElectricCharge -> 1,
     Width -> 2.141}},

{VXp,{
     Description -> "W+ - Boson prime",
     Goldstone -> Hpm[{2}],
     FeynArtsNr -> 3,
     LaTeX -> {"{W^\\prime}^+","{W^\\prime}^-"},
     Mass -> LesHouches,
     OutputName -> {"Xp","Xm"},
     PDG -> {224},
     ElectricCharge -> 1,
     Width -> External}},

{VYpp,{
     Description -> "Doubly-charged gauge boson",
     Goldstone -> Dpm[{1}],
     FeynArtsNr -> 2,
     LaTeX -> {"Y^{++}","Y^{--}"},
     Mass -> LesHouches,
     OutputName -> {"Ypp","Ymm"},
     PDG -> {3023},
     ElectricCharge -> 2,
     Width -> External}},

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
     Description -> "Z-Boson prime",
     Goldstone -> Ah[{2}],
     FeynArtsNr -> 2,
     LaTeX -> "Z^\\prime",
     Mass -> LesHouches,
     OutputName -> "Zp",
     PDG -> {2023},
     ElectricCharge -> 0,
     Width -> External}},



(*  ----------- Additional particles in the model ---------- *)

{FDD,{
     FeynArtsNr -> 8   (* auto generated FeynArts number *),
     LaTeX -> "D"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "fdd"   (* auto generated Output name *),
     PDG -> {3026, 3027}   (* auto generated PDGs  *),
     ElectricCharge -> 5/3,
     Width -> Automatic}},

{FEE,{
     FeynArtsNr -> 10   (* auto generated FeynArts number *),
     LaTeX -> "E"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "fee"   (* auto generated Output name *),
     PDG -> {3031, 3032, 3033}   (* auto generated PDGs  *),
     ElectricCharge -> -2,
     Width -> Automatic}},

{FUU,{
     FeynArtsNr -> 12   (* auto generated FeynArts number *),
     LaTeX -> "T"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "ft"   (* auto generated Output name *),
     PDG -> {3035}   (* auto generated PDGs  *),
     ElectricCharge -> -4/3,
     Width -> Automatic}},

{gYpp,{
     FeynArtsNr -> 14   (* auto generated FeynArts number *),
     LaTeX -> "\\eta_{{Y}^{++}}"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "gYpp"   (* auto generated Output name *),
     PDG -> {0}   (* auto generated PDGs  *),
     ElectricCharge -> 2,
     Width -> Automatic}},

{gYppC,{
     FeynArtsNr -> 16   (* auto generated FeynArts number *),
     LaTeX -> "\\eta_{{Y}^{--}}"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "gYmm"   (* auto generated Output name *),
     PDG -> {0}   (* auto generated PDGs  *),
     ElectricCharge -> -2,
     Width -> Automatic}}
};




(* ###############            GaugeES       ################# *)

ParticleDefinitions[GaugeES] = {

(* ----------- Already defined particles in existing particles.m -------------- *)

{bL,{
     FeynArtsNr -> 6   (* auto generated FeynArts number *),
     LaTeX -> "b_L",
     Mass -> LesHouches,
     OutputName -> "bl"   (* auto generated Output name *),
     PDG -> {23}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{cL,{
     FeynArtsNr -> 8   (* auto generated FeynArts number *),
     LaTeX -> "c_L",
     Mass -> LesHouches,
     OutputName -> "cl"   (* auto generated Output name *),
     PDG -> {25}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{dL,{
     FeynArtsNr -> 10   (* auto generated FeynArts number *),
     LaTeX -> "d_L",
     Mass -> LesHouches,
     OutputName -> "dl"   (* auto generated Output name *),
     PDG -> {27}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{dR,{
     FeynArtsNr -> 12   (* auto generated FeynArts number *),
     LaTeX -> "d_R",
     Mass -> LesHouches,
     OutputName -> "dr"   (* auto generated Output name *),
     PDG -> {31, 32, 33}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{eL,{
     FeynArtsNr -> 14   (* auto generated FeynArts number *),
     LaTeX -> "e_L",
     Mass -> LesHouches,
     OutputName -> "el"   (* auto generated Output name *),
     PDG -> {37, 38, 39}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{eR,{
     FeynArtsNr -> 16   (* auto generated FeynArts number *),
     LaTeX -> "e_R",
     Mass -> LesHouches,
     OutputName -> "er"   (* auto generated Output name *),
     PDG -> {43, 44, 45}   (* adjusted number of PDGs to number of generations  *),
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
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *),
     Width -> 0}},

{sL,{
     FeynArtsNr -> 18   (* auto generated FeynArts number *),
     LaTeX -> "s_L",
     Mass -> LesHouches,
     OutputName -> "sl"   (* auto generated Output name *),
     PDG -> {47}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{tL,{
     FeynArtsNr -> 20   (* auto generated FeynArts number *),
     LaTeX -> "t_L",
     Mass -> LesHouches,
     OutputName -> "tl"   (* auto generated Output name *),
     PDG -> {49}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{uL,{
     FeynArtsNr -> 22   (* auto generated FeynArts number *),
     LaTeX -> "u_L",
     Mass -> LesHouches,
     OutputName -> "ul"   (* auto generated Output name *),
     PDG -> {51}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{uR,{
     FeynArtsNr -> 24   (* auto generated FeynArts number *),
     LaTeX -> "u_R",
     Mass -> LesHouches,
     OutputName -> "ur"   (* auto generated Output name *),
     PDG -> {55, 56, 57}   (* adjusted number of PDGs to number of generations  *),
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

{vL,{
     FeynArtsNr -> 26   (* auto generated FeynArts number *),
     LaTeX -> "\\nu_L",
     Mass -> LesHouches,
     OutputName -> "vl"   (* auto generated Output name *),
     PDG -> {61, 62, 63}   (* adjusted number of PDGs to number of generations  *),
     Width -> Automatic}},

{VWB,{
     Description -> "W-Bosons",
     FeynArtsNr -> 2,
     LaTeX -> "W",
     Mass -> 0,
     OutputName -> "W",
     PDG -> {0, 71, 72, 73, 74, 75, 76, 77}   (* adjusted number of PDGs to number of generations  *),
     Width -> 0}},



(*  ----------- Additional particles in the model ---------- *)

{chi0,{
     FeynArtsNr -> 28   (* auto generated FeynArts number *),
     LaTeX -> "{\\chi}^0"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "chi0"   (* auto generated Output name *),
     PDG -> {79}   (* auto generated PDGs  *),
     Width -> Automatic}},

{chim,{
     FeynArtsNr -> 30   (* auto generated FeynArts number *),
     LaTeX -> "{\\chi}^{-}"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "chim"   (* auto generated Output name *),
     PDG -> {81}   (* auto generated PDGs  *),
     Width -> Automatic}},

{chimm,{
     FeynArtsNr -> 32   (* auto generated FeynArts number *),
     LaTeX -> "{\\chi}^{--}"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "chimm"   (* auto generated Output name *),
     PDG -> {83}   (* auto generated PDGs  *),
     Width -> Automatic}},

{DL,{
     FeynArtsNr -> 34   (* auto generated FeynArts number *),
     LaTeX -> "D_L"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "dl"   (* auto generated Output name *),
     PDG -> {85}   (* auto generated PDGs  *),
     Width -> Automatic}},

{dtR,{
     FeynArtsNr -> 36   (* auto generated FeynArts number *),
     LaTeX -> "\\hat d_R"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "dtr"   (* auto generated Output name *),
     PDG -> {88, 89}   (* auto generated PDGs  *),
     Width -> Automatic}},

{eta0,{
     FeynArtsNr -> 38   (* auto generated FeynArts number *),
     LaTeX -> "{\\eta}^0"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "eta0"   (* auto generated Output name *),
     PDG -> {91}   (* auto generated PDGs  *),
     Width -> Automatic}},

{eta1m,{
     FeynArtsNr -> 40   (* auto generated FeynArts number *),
     LaTeX -> "{\\eta}_{1}^-"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "eta1m"   (* auto generated Output name *),
     PDG -> {93}   (* auto generated PDGs  *),
     Width -> Automatic}},

{eta2p,{
     FeynArtsNr -> 42   (* auto generated FeynArts number *),
     LaTeX -> "{\\eta}_{2}^+"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "eta2p"   (* auto generated Output name *),
     PDG -> {95}   (* auto generated PDGs  *),
     Width -> Automatic}},

{rho0,{
     FeynArtsNr -> 44   (* auto generated FeynArts number *),
     LaTeX -> "{\\rho}^0"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "rh0"   (* auto generated Output name *),
     PDG -> {97}   (* auto generated PDGs  *),
     Width -> Automatic}},

{rhop,{
     FeynArtsNr -> 46   (* auto generated FeynArts number *),
     LaTeX -> "{\\rho}^{+}"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "rhp"   (* auto generated Output name *),
     PDG -> {99}   (* auto generated PDGs  *),
     Width -> Automatic}},

{rhopp,{
     FeynArtsNr -> 48   (* auto generated FeynArts number *),
     LaTeX -> "{\\rho}^{++}"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "rhpp"   (* auto generated Output name *),
     PDG -> {101}   (* auto generated PDGs  *),
     Width -> Automatic}},

{RL,{
     FeynArtsNr -> 50   (* auto generated FeynArts number *),
     LaTeX -> "R_L"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "rl"   (* auto generated Output name *),
     PDG -> {105, 106, 107}   (* auto generated PDGs  *),
     Width -> Automatic}},

{RR,{
     FeynArtsNr -> 52   (* auto generated FeynArts number *),
     LaTeX -> "R_R"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "rr"   (* auto generated Output name *),
     PDG -> {111, 112, 113}   (* auto generated PDGs  *),
     Width -> Automatic}},

{SL,{
     FeynArtsNr -> 54   (* auto generated FeynArts number *),
     LaTeX -> "S_L"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "sl"   (* auto generated Output name *),
     PDG -> {115}   (* auto generated PDGs  *),
     Width -> Automatic}},

{TL,{
     FeynArtsNr -> 56   (* auto generated FeynArts number *),
     LaTeX -> "T_L"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "tl"   (* auto generated Output name *),
     PDG -> {117}   (* auto generated PDGs  *),
     Width -> Automatic}},

{TR,{
     FeynArtsNr -> 58   (* auto generated FeynArts number *),
     LaTeX -> "T_R"   (* auto generated LaTeX name *),
     Mass -> LesHouches,
     OutputName -> "tr"   (* auto generated Output name *),
     PDG -> {119}   (* auto generated PDGs  *),
     Width -> Automatic}}
};




(* ###############            Weyl Spinors and intermediate states       ################# *)

WeylFermionAndIndermediate = {

(* ----------- Already defined particles in existing particles.m -------------- *)

{dL,{
     LaTeX -> "d_L"}},

{uL,{
     LaTeX -> "u_L"}},

{cL,{
     LaTeX -> "c_L"}},

{sL,{
     LaTeX -> "s_L"}},

{bL,{
     LaTeX -> "b_L"}},

{tL,{
     LaTeX -> "t_L"}},

{uR,{
     LaTeX -> "u_R"}},

{dR,{
     LaTeX -> "d_R"}},

{dtR,{
     LaTeX -> "\\hat{d}_R"}},

{eL,{
     LaTeX -> "e_L"}},

{vL,{
     LaTeX -> "\\nu_L"}},

{eR,{
     LaTeX -> "e_R"}},

{FDL,{
     LaTeX -> "D_L"}},

{FDR,{
     LaTeX -> "D_R"}},

{FUL,{
     LaTeX -> "U_L"}},

{FUR,{
     LaTeX -> "U_R"}},

{FEL,{
     LaTeX -> "E_L"}},

{FER,{
     LaTeX -> "E_R"}},

{sigma1,{
     Description -> "CP-odd state 1",
     LaTeX -> "\\sigma_1"}},

{rho1,{
     Description -> "CP-even state 1",
     LaTeX -> "\\rho_1"}},

{sigma2,{
     Description -> "CP-odd state 2",
     LaTeX -> "\\sigma_2"}},

{rho2,{
     Description -> "CP-even state 2",
     LaTeX -> "\\rho_2"}},

{sigma3,{
     Description -> "CP-odd state 3",
     LaTeX -> "\\sigma_3"}},

{rho3,{
     Description -> "CP-even state 3",
     LaTeX -> "\\rho_3"}},

{q1,{
     Description -> "Quark triplet 1",
     LaTeX -> "Q_L^1"}},

{q2,{
     Description -> "Quark triplet 2",
     LaTeX -> "Q_L^2"}},

{q3,{
     Description -> "Quark triplet 3",
     LaTeX -> "Q_L^3"}},



(*  ----------- Additional particles in the model ---------- *)

{DL,{
     LaTeX -> "D_L"   (* auto generated LaTeX name *)}},

{SL,{
     LaTeX -> "S_L"   (* auto generated LaTeX name *)}},

{TL,{
     LaTeX -> "T_L"   (* auto generated LaTeX name *)}},

{TR,{
     LaTeX -> "T_R"   (* auto generated LaTeX name *)}},

{RL,{
     LaTeX -> "R_L"   (* auto generated LaTeX name *)}},

{RR,{
     LaTeX -> "R_R"   (* auto generated LaTeX name *)}},

{DDL,{
     LaTeX -> "\\psi_{D_L}"   (* auto generated LaTeX name *)}},

{DDR,{
     LaTeX -> "\\psi_{D_R}"   (* auto generated LaTeX name *)}},

{EEL,{
     LaTeX -> "\\psi_{E_L}"   (* auto generated LaTeX name *)}},

{EER,{
     LaTeX -> "\\psi_{E_R}"   (* auto generated LaTeX name *)}},

{chi,{
     LaTeX -> "\\chi"   (* auto generated LaTeX name *)}},

{d,{
     LaTeX -> "d"   (* auto generated LaTeX name *)}},

{dt,{
     LaTeX -> "\\hat d"   (* auto generated LaTeX name *)}},

{e,{
     LaTeX -> "e"   (* auto generated LaTeX name *)}},

{eta,{
     LaTeX -> "\\eta"   (* auto generated LaTeX name *)}},

{l,{
     LaTeX -> "\\ell"   (* auto generated LaTeX name *)}},

{R,{
     LaTeX -> "R"   (* auto generated LaTeX name *)}},

{rho,{
     LaTeX -> "\\rho"   (* auto generated LaTeX name *)}},

{T,{
     LaTeX -> "T"   (* auto generated LaTeX name *)}},

{u,{
     LaTeX -> "u"   (* auto generated LaTeX name *)}},

{VB,{
     LaTeX -> "B"   (* auto generated LaTeX name *)}},

{VG,{
     LaTeX -> "G"   (* auto generated LaTeX name *)}},

{VWB,{
     LaTeX -> "WB"   (* auto generated LaTeX name *)}}
};




