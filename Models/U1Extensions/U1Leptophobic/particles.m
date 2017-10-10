(* ::Package:: *)

(* SARAH generated template for particles.m file for U1leptophobic *)
(* File created at 18:48 on 5.2.2016  *) 

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
     PDG -> {0, 0, 36}, 
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

{FDt,{ 
     FeynArtsNr -> 6, 
     LaTeX -> "D", 
     Mass -> LesHouches, 
     OutputName -> "fdt", 
     PDG -> {900, 901, 902}, 
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

{FH0,{ 
     FeynArtsNr -> 8, 
     LaTeX -> "{H}^0", 
     Mass -> LesHouches, 
     OutputName -> "fh0", 
     PDG -> {903, 904, 905, 906, 907, 908, 909, 910,911}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{FHc,{ 
     FeynArtsNr -> 10, 
     LaTeX -> "Hc", 
     Mass -> LesHouches, 
     OutputName -> "fhc", 
     PDG -> {912, 913, 914}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{Fv,{Description -> "Neutrinos", 
     FeynArtsNr -> 12, 
     LaTeX -> "\\nu", 
     Mass -> LesHouches, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16}, 
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
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> 0}}, 

{gWp,{ 
     Description -> "Positive W+ - Boson Ghost", 
     FeynArtsNr -> 3, 
     LaTeX -> "\\eta^+", 
     Mass -> Mass[VWp], 
     OutputName -> "gWp", 
     PDG -> {0}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{gWpC,{ 
     Description -> "Negative W+ - Boson Ghost", 
     FeynArtsNr -> 4, 
     LaTeX -> "\\eta^-", 
     Mass -> Mass[VWp], 
     OutputName -> "gWC", 
     PDG -> {0}, 
     ElectricCharge -> -1, 
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
     FeynArtsNr -> 14, 
     LaTeX -> "\\eta_{Zp}", 
     Mass -> LesHouches, 
     OutputName -> "gzp", 
     PDG -> {0}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "h", 
     PDG -> {25, 35, 890}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{Hp,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> 3, 
     LaTeX -> {"H^+","H^-"}, 
     Mass -> {0, LesHouches}, 
     OutputName -> {"Hp","Hm"}, 
     PDG -> {0, -37}, 
     ElectricCharge -> 1, 
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

{VWp,{ 
     Description -> "W+ - Boson", 
     Goldstone -> Hp[{1}], 
     FeynArtsNr -> 3, 
     LaTeX -> {"W^+","W^-"}, 
     Mass -> LesHouches, 
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
     Mass -> LesHouches, 
     OutputName -> "Z", 
     PDG -> {23}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{VZp,{ 
     Goldstone -> Ah[{2}], 
     FeynArtsNr -> 20, 
     LaTeX -> "Zp", 
     Mass -> LesHouches, 
     OutputName -> "vzp", 
     PDG -> {75}, 
     ElectricCharge -> 0, 
     Width -> Automatic}} 
}; 




(* ###############            GaugeES       ################# *) 

ParticleDefinitions[GaugeES] = { 
 
(* ----------- Already defined particles in existing particles.m -------------- *) 

{dL,{ 
     FeynArtsNr -> 6, 
     LaTeX -> "dl", 
     Mass -> LesHouches, 
     OutputName -> "dl", 
     PDG -> {29, 30, 31}, 
     Width -> Automatic}}, 

{dR,{ 
     FeynArtsNr -> 8, 
     LaTeX -> "dr", 
     Mass -> LesHouches, 
     OutputName -> "dr", 
     PDG -> {35, 36, 37}, 
     Width -> Automatic}}, 

{DTL,{ 
     FeynArtsNr -> 10, 
     LaTeX -> "dtl", 
     Mass -> LesHouches, 
     OutputName -> "dtl", 
     PDG -> {41, 42, 43}, 
     Width -> Automatic}}, 

{DTR,{ 
     FeynArtsNr -> 12, 
     LaTeX -> "dtr", 
     Mass -> LesHouches, 
     OutputName -> "dtr", 
     PDG -> {47, 48, 49}, 
     Width -> Automatic}}, 

{eL,{ 
     FeynArtsNr -> 14, 
     LaTeX -> "el", 
     Mass -> LesHouches, 
     OutputName -> "el", 
     PDG -> {53, 54, 55}, 
     Width -> Automatic}}, 

{eR,{ 
     FeynArtsNr -> 16, 
     LaTeX -> "er", 
     Mass -> LesHouches, 
     OutputName -> "er", 
     PDG -> {59, 60, 61}, 
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
     FeynArtsNr -> 18, 
     LaTeX -> "\\eta_{Bp}", 
     Mass -> LesHouches, 
     OutputName -> "gbp", 
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

{gWB,{ 
     Description -> "W-Boson Ghost", 
     FeynArtsNr -> 2, 
     LaTeX -> "\\eta^W", 
     Mass -> 0, 
     OutputName -> "gW", 
     PDG -> {0}   (* adjusted number of PDGs to number of generations  *), 
     Width -> 0}}, 

{H10,{ 
     FeynArtsNr -> 20, 
     LaTeX -> "{h1}^0", 
     Mass -> LesHouches, 
     OutputName -> "h10", 
     PDG -> {63}, 
     Width -> Automatic}}, 

{H1m,{ 
     FeynArtsNr -> 22, 
     LaTeX -> "h1m", 
     Mass -> LesHouches, 
     OutputName -> "h1m", 
     PDG -> {65}, 
     Width -> Automatic}}, 

{H20,{ 
     FeynArtsNr -> 24, 
     LaTeX -> "{h2}^0", 
     Mass -> LesHouches, 
     OutputName -> "h20", 
     PDG -> {67}, 
     Width -> Automatic}}, 

{H2m,{ 
     FeynArtsNr -> 26, 
     LaTeX -> "h2m", 
     Mass -> LesHouches, 
     OutputName -> "h2m", 
     PDG -> {69}, 
     Width -> Automatic}}, 

{HtilL0,{ 
     FeynArtsNr -> 28, 
     LaTeX -> "{htill}^0", 
     Mass -> LesHouches, 
     OutputName -> "htill0", 
     PDG -> {73, 74, 75}, 
     Width -> Automatic}}, 

{HtilLm,{ 
     FeynArtsNr -> 30, 
     LaTeX -> "htillm", 
     Mass -> LesHouches, 
     OutputName -> "htillm", 
     PDG -> {79, 80, 81}, 
     Width -> Automatic}}, 

{HtilR0,{ 
     FeynArtsNr -> 32, 
     LaTeX -> "{htilr}^0", 
     Mass -> LesHouches, 
     OutputName -> "htilr0", 
     PDG -> {85, 86, 87}, 
     Width -> Automatic}}, 

{HtilRm,{ 
     FeynArtsNr -> 34, 
     LaTeX -> "htilrm", 
     Mass -> LesHouches, 
     OutputName -> "htilrm", 
     PDG -> {91, 92, 93}, 
     Width -> Automatic}}, 

{NiL,{ 
     FeynArtsNr -> 36, 
     LaTeX -> "nil", 
     Mass -> LesHouches, 
     OutputName -> "nil", 
     PDG -> {97, 98, 99}, 
     Width -> Automatic}}, 

{niR,{ 
     FeynArtsNr -> 38, 
     LaTeX -> "nir", 
     Mass -> LesHouches, 
     OutputName -> "nir", 
     PDG -> {103, 104, 105}, 
     Width -> Automatic}}, 

{Phi0,{ 
     FeynArtsNr -> 40, 
     LaTeX -> "{\\phi}^0", 
     Mass -> LesHouches, 
     OutputName -> "phi0", 
     PDG -> {107}, 
     Width -> Automatic}}, 

{uL,{ 
     FeynArtsNr -> 42, 
     LaTeX -> "ul", 
     Mass -> LesHouches, 
     OutputName -> "ul", 
     PDG -> {111, 112, 113}, 
     Width -> Automatic}}, 

{uR,{ 
     FeynArtsNr -> 44, 
     LaTeX -> "ur", 
     Mass -> LesHouches, 
     OutputName -> "ur", 
     PDG -> {117, 118, 119}, 
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
     FeynArtsNr -> 46, 
     LaTeX -> "Bp", 
     Mass -> LesHouches, 
     OutputName -> "vbp", 
     PDG -> {121}, 
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

{vL,{ 
     FeynArtsNr -> 48, 
     LaTeX -> "v_{l}", 
     Mass -> LesHouches, 
     OutputName -> "vl", 
     PDG -> {125, 126, 127}, 
     Width -> Automatic}}, 

{VWB,{ 
     Description -> "W-Bosons", 
     FeynArtsNr -> 2, 
     LaTeX -> "W", 
     Mass -> 0, 
     OutputName -> "W", 
     PDG -> {0, 24, 25}, 
     Width -> 0}} 
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

{niR,{ 
     LaTeX -> "nir"}}, 

{DTL,{ 
     LaTeX -> "dtl"}}, 

{DTR,{ 
     LaTeX -> "dtr"}}, 

{HtilL0,{ 
     LaTeX -> "{htill}^0"}}, 

{HtilLm,{ 
     LaTeX -> "htillm"}}, 

{HtilR0,{ 
     LaTeX -> "{htilr}^0"}}, 

{HtilRm,{ 
     LaTeX -> "htilrm"}}, 

{NiL,{ 
     LaTeX -> "nil"}}, 

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

{nuL,{ 
     LaTeX -> "{\\nu}_{l}"}}, 

{nuR,{ 
     LaTeX -> "{\\nu}_{r}"}}, 

{DML,{ 
     LaTeX -> "dml"}}, 

{DMR,{ 
     LaTeX -> "dmr"}}, 

{HL,{ 
     LaTeX -> "hl"}}, 

{HR,{ 
     LaTeX -> "hr"}}, 

{Htil0,{ 
     LaTeX -> "{htil}^0"}}, 

{sigmaH1,{ 
     LaTeX -> "{\\sigma}_{h1}"}}, 

{phiH1,{ 
     LaTeX -> "{\\phi}_{h1}"}}, 

{sigmaH2,{ 
     LaTeX -> "{\\sigma}_{h2}"}}, 

{phiH2,{ 
     LaTeX -> "{\\phi}_{h2}"}}, 

{sigmaPhi,{ 
     LaTeX -> "{\\sigma}_{\\phi}"}}, 

{phiPhi,{ 
     LaTeX -> "{\\phi}_{\\phi}"}}, 

{d,{ 
     LaTeX -> "d"}}, 

{DtilL,{ 
     LaTeX -> "dtill"}}, 

{DtilR,{ 
     LaTeX -> "dtilr"}}, 

{e,{ 
     LaTeX -> "e"}}, 

{H1,{ 
     LaTeX -> "h1"}}, 

{H2,{ 
     LaTeX -> "h2"}}, 

{HtilL,{ 
     LaTeX -> "htill"}}, 

{HtilR,{ 
     LaTeX -> "htilr"}}, 

{l,{ 
     LaTeX -> "l"}}, 

{ni,{ 
     LaTeX -> "ni"}}, 

{Ni,{ 
     LaTeX -> "ni"}}, 

{Phi,{ 
     LaTeX -> "\\phi"}}, 

{q,{ 
     LaTeX -> "q"}}, 

{u,{ 
     LaTeX -> "u"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VBp,{ 
     LaTeX -> "Bp"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

{VWB,{ 
     LaTeX -> "WB"}} 
}; 




