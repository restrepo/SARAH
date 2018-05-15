
ParticleDefinitions[EWSB] = { 

{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A^0", 
     Mass -> {0, LesHouches}, 
     OutputName -> "Ah", 
     PDG -> {0,36}, 
     ElectricCharge -> 0, 
     Width -> {0, Automatic}}}, 

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

{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "hh", 
     PDG -> {25, 35}, 
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

{F1x,{ 
     FeynArtsNr -> 6, 
     LaTeX -> "{\\Psi_{1x}}", 
     Mass -> LesHouches, 
     OutputName -> "F1x", 
     PDG -> {60}, 
     ElectricCharge -> 5/3, 
     Width -> Automatic}}, 

{F2x,{ 
     FeynArtsNr -> 16, 
     LaTeX -> "{\\Psi_{2x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx2", 
     PDG -> {62}, 
     ElectricCharge -> 5/3, 
     Width -> Automatic}}, 

{F3x,{ 
     FeynArtsNr -> 18, 
     LaTeX -> "{\\Psi_{3x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx3", 
     PDG -> {65}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{F4x,{ 
     FeynArtsNr -> 20, 
     LaTeX -> "{\\Psi_{4x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx4", 
     PDG -> {67}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{F5x,{ 
     FeynArtsNr -> 22, 
     LaTeX -> "{\\Psi_{5x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx5", 
     PDG -> {70}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{F6x,{ 
     FeynArtsNr -> 24, 
     LaTeX -> "{\\Psi_{6x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx6", 
     PDG -> {71}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{F7x,{ 
     FeynArtsNr -> 26, 
     LaTeX -> "{\\Psi_{7x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx7", 
     PDG -> {73}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{F8x,{ 
     FeynArtsNr -> 28, 
     LaTeX -> "{\\Psi_{8x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx8", 
     PDG -> {74}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{F9x,{ 
     FeynArtsNr -> 30, 
     LaTeX -> "{\\Psi_{9x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx9", 
     PDG -> {75}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{F10x,{ 
     FeynArtsNr -> 8, 
     LaTeX -> "{\\Psi_{10x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx10", 
     PDG -> {77}, 
     ElectricCharge -> 2, 
     Width -> Automatic}}, 

{F11x,{ 
     FeynArtsNr -> 10, 
     LaTeX -> "{\\Psi_{11x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx11", 
     PDG -> {80}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{F12x,{ 
     FeynArtsNr -> 12, 
     LaTeX -> "{\\Psi_{12x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx12", 
     PDG -> {82}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{F13x,{ 
     FeynArtsNr -> 14, 
     LaTeX -> "{\\Psi_{13x}}", 
     Mass -> LesHouches, 
     OutputName -> "Fx13", 
     PDG -> {85}, 
     ElectricCharge -> 5/3, 
     Width -> Automatic}}, 



{F1y,{ 
     FeynArtsNr -> 32, 
     LaTeX -> "{\\Psi_{1y}}", 
     Mass -> LesHouches, 
     OutputName -> "F1y", 
     PDG -> {61}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{F2y,{ 
     FeynArtsNr -> 40, 
     LaTeX -> "{\\Psi_{2y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy2", 
     PDG -> {63}, 
     ElectricCharge -> 2/3, 
     Width -> Automatic}}, 

{F3y,{ 
     FeynArtsNr -> 42, 
     LaTeX -> "{\\Psi_{3y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy3", 
     PDG -> {66}, 
     ElectricCharge -> -4/3, 
     Width -> Automatic}}, 

{F4y,{ 
     FeynArtsNr -> 44, 
     LaTeX -> "{\\Psi_{4y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy4", 
     PDG -> {68}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{F6y,{ 
     FeynArtsNr -> 46, 
     LaTeX -> "{\\Psi_{6y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy6", 
     PDG -> {72}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{F9y,{ 
     FeynArtsNr -> 48, 
     LaTeX -> "{\\Psi_{9y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy9", 
     PDG -> {76}, 
     ElectricCharge -> -2, 
     Width -> Automatic}}, 
{F10y,{ 
     FeynArtsNr -> 34, 
     LaTeX -> "{\\Psi_{10y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy10", 
     PDG -> {78}, 
     ElectricCharge -> 1, 
     Width -> Automatic}}, 

{F11y,{ 
     FeynArtsNr -> 36, 
     LaTeX -> "{\\Psi_{11y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy11", 
     PDG -> {81}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}, 

{F12y,{ 
     FeynArtsNr -> 38, 
     LaTeX -> "{\\Psi_{12y}}", 
     Mass -> LesHouches, 
     OutputName -> "Fy12", 
     PDG -> {83}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{F2z,{ 
     FeynArtsNr -> 54, 
     LaTeX -> "{\\Psi_{2z}}", 
     Mass -> LesHouches, 
     OutputName -> "Fz2", 
     PDG -> {64}, 
     ElectricCharge -> -1/3, 
     Width -> Automatic}}, 

{F4z,{ 
     FeynArtsNr -> 56, 
     LaTeX -> "{\\Psi_{4z}}", 
     Mass -> LesHouches, 
     OutputName -> "Fz4", 
     PDG -> {69}, 
     ElectricCharge -> -4/3, 
     Width -> Automatic}},

{F10z,{ 
     FeynArtsNr -> 50, 
     LaTeX -> "{\\Psi_{10z}}", 
     Mass -> LesHouches, 
     OutputName -> "Fz10", 
     PDG -> {79}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 

{F12z,{ 
     FeynArtsNr -> 52, 
     LaTeX -> "{\\Psi_{12z}}", 
     Mass -> LesHouches, 
     OutputName -> "Fz12", 
     PDG -> {84}, 
     ElectricCharge -> -1, 
     Width -> Automatic}}

}; 




(* ###############            GaugeES       ################# *) 

ParticleDefinitions[GaugeES] = { 

{Fd1,{ 
     FeynArtsNr -> 31, 
     LaTeX -> "d1", 
     Mass -> LesHouches, 
     OutputName -> "fd1", 
     PDG -> {83, 84, 85}, 
     Width -> Automatic}}, 

{Fd2,{ 
     FeynArtsNr -> 33, 
     LaTeX -> "d2", 
     Mass -> LesHouches, 
     OutputName -> "fd2", 
     PDG -> {89, 90, 91}, 
     Width -> Automatic}}, 

{Fe1,{ 
     FeynArtsNr -> 35, 
     LaTeX -> "e1", 
     Mass -> LesHouches, 
     OutputName -> "fe1", 
     PDG -> {95, 96, 97}, 
     Width -> Automatic}}, 

{Fe2,{ 
     FeynArtsNr -> 37, 
     LaTeX -> "e2", 
     Mass -> LesHouches, 
     OutputName -> "fe2", 
     PDG -> {101, 102, 103}, 
     Width -> Automatic}}, 

{Fu1,{ 
     FeynArtsNr -> 43, 
     LaTeX -> "u1", 
     Mass -> LesHouches, 
     OutputName -> "fu1", 
     PDG -> {111, 112, 113}, 
     Width -> Automatic}}, 

{Fu2,{ 
     FeynArtsNr -> 45, 
     LaTeX -> "u2", 
     Mass -> LesHouches, 
     OutputName -> "fu2", 
     PDG -> {117, 118, 119}, 
     Width -> Automatic}}, 

{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> {0, 0, 0}, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16}, 
     ElectricCharge -> 0, 
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
     LaTeX -> {"H^+","H^+"}, 
     Mass -> {0}, 
     OutputName -> {"Hp","Hp"}, 
     PDG -> {0}, 
     ElectricCharge -> 1, 
     Width -> {0}}}, 

{phi,{ 
     FeynArtsNr -> 14, 
     LaTeX -> "\\phi", 
     Mass -> LesHouches, 
     OutputName -> "phi", 
     PDG -> {51}, 
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
     PDG -> {0, 24, 25}, 
     Width -> 0}}, 


{Fx10L,{ 
     FeynArtsNr -> 46, 
     LaTeX -> "{{x1}^0}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx10l", 
     PDG -> {121}, 
     Width -> Automatic}}, 

{Fx10R,{ 
     FeynArtsNr -> 48, 
     LaTeX -> "{{x1}^0}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx10r", 
     PDG -> {123}, 
     Width -> Automatic}}, 

{Fx11L,{ 
     FeynArtsNr -> 50, 
     LaTeX -> "{x11}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx11l", 
     PDG -> {125}, 
     Width -> Automatic}}, 

{Fx11R,{ 
     FeynArtsNr -> 52, 
     LaTeX -> "{x11}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx11r", 
     PDG -> {127}, 
     Width -> Automatic}}, 

{Fx12L,{ 
     FeynArtsNr -> 54, 
     LaTeX -> "{x12}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx12l", 
     PDG -> {129}, 
     Width -> Automatic}}, 

{Fx12R,{ 
     FeynArtsNr -> 56, 
     LaTeX -> "{x12}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx12r", 
     PDG -> {131}, 
     Width -> Automatic}}, 

{Fx13L,{ 
     FeynArtsNr -> 58, 
     LaTeX -> "{x13}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx13l", 
     PDG -> {133}, 
     Width -> Automatic}}, 

{Fx13R,{ 
     FeynArtsNr -> 60, 
     LaTeX -> "{x13}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx13r", 
     PDG -> {135}, 
     Width -> Automatic}}, 

{Fx1L,{ 
     FeynArtsNr -> 62, 
     LaTeX -> "{x1}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx1l", 
     PDG -> {137}, 
     Width -> Automatic}}, 

{Fx1R,{ 
     FeynArtsNr -> 64, 
     LaTeX -> "{x1}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx1r", 
     PDG -> {139}, 
     Width -> Automatic}}, 

{Fx2L,{ 
     FeynArtsNr -> 66, 
     LaTeX -> "{x2}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx2l", 
     PDG -> {141}, 
     Width -> Automatic}}, 

{Fx2R,{ 
     FeynArtsNr -> 68, 
     LaTeX -> "{x2}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx2r", 
     PDG -> {143}, 
     Width -> Automatic}}, 

{Fx3L,{ 
     FeynArtsNr -> 70, 
     LaTeX -> "{x3}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx3l", 
     PDG -> {145}, 
     Width -> Automatic}}, 

{Fx3R,{ 
     FeynArtsNr -> 72, 
     LaTeX -> "{x3}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx3r", 
     PDG -> {147}, 
     Width -> Automatic}}, 

{Fx4L,{ 
     FeynArtsNr -> 74, 
     LaTeX -> "{x4}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx4l", 
     PDG -> {149}, 
     Width -> Automatic}}, 

{Fx4R,{ 
     FeynArtsNr -> 76, 
     LaTeX -> "{x4}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx4r", 
     PDG -> {151}, 
     Width -> Automatic}}, 

{Fx5L,{ 
     FeynArtsNr -> 78, 
     LaTeX -> "{x5}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx5l", 
     PDG -> {153}, 
     Width -> Automatic}}, 

{Fx5R,{ 
     FeynArtsNr -> 80, 
     LaTeX -> "{x5}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx5r", 
     PDG -> {155}, 
     Width -> Automatic}}, 

{Fx6L,{ 
     FeynArtsNr -> 82, 
     LaTeX -> "{x6}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx6l", 
     PDG -> {157}, 
     Width -> Automatic}}, 

{Fx6R,{ 
     FeynArtsNr -> 84, 
     LaTeX -> "{x6}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx6r", 
     PDG -> {159}, 
     Width -> Automatic}}, 

{Fx7L,{ 
     FeynArtsNr -> 86, 
     LaTeX -> "{x7}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx7l", 
     PDG -> {161}, 
     Width -> Automatic}}, 

{Fx7R,{ 
     FeynArtsNr -> 88, 
     LaTeX -> "{x7}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx7r", 
     PDG -> {163}, 
     Width -> Automatic}}, 

{Fx8L,{ 
     FeynArtsNr -> 90, 
     LaTeX -> "{x8}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx8l", 
     PDG -> {165}, 
     Width -> Automatic}}, 

{Fx8R,{ 
     FeynArtsNr -> 92, 
     LaTeX -> "{x8}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx8r", 
     PDG -> {167}, 
     Width -> Automatic}}, 

{Fx9L,{ 
     FeynArtsNr -> 94, 
     LaTeX -> "{x9}_L", 
     Mass -> LesHouches, 
     OutputName -> "fx9l", 
     PDG -> {169}, 
     Width -> Automatic}}, 

{Fx9R,{ 
     FeynArtsNr -> 96, 
     LaTeX -> "{x9}_R", 
     Mass -> LesHouches, 
     OutputName -> "fx9r", 
     PDG -> {171}, 
     Width -> Automatic}}, 

{Fy10L,{ 
     FeynArtsNr -> 98, 
     LaTeX -> "{{Y_{1}}^0}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy10l", 
     PDG -> {173}, 
     Width -> Automatic}}, 

{Fy10R,{ 
     FeynArtsNr -> 100, 
     LaTeX -> "{{Y_{1}}^0}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy10r", 
     PDG -> {175}, 
     Width -> Automatic}}, 

{Fy11L,{ 
     FeynArtsNr -> 102, 
     LaTeX -> "{Y_{11}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy11l", 
     PDG -> {177}, 
     Width -> Automatic}}, 

{Fy11R,{ 
     FeynArtsNr -> 104, 
     LaTeX -> "{Y_{11}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy11r", 
     PDG -> {179}, 
     Width -> Automatic}}, 

{Fy12L,{ 
     FeynArtsNr -> 106, 
     LaTeX -> "{Y_{12}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy12l", 
     PDG -> {181}, 
     Width -> Automatic}}, 

{Fy12R,{ 
     FeynArtsNr -> 108, 
     LaTeX -> "{Y_{12}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy12r", 
     PDG -> {183}, 
     Width -> Automatic}}, 

{Fy1L,{ 
     FeynArtsNr -> 110, 
     LaTeX -> "{Y_{1}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy1l", 
     PDG -> {185}, 
     Width -> Automatic}}, 

{Fy1R,{ 
     FeynArtsNr -> 112, 
     LaTeX -> "{Y_{1}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy1r", 
     PDG -> {187}, 
     Width -> Automatic}}, 

{Fy2L,{ 
     FeynArtsNr -> 114, 
     LaTeX -> "{Y_{2}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy2l", 
     PDG -> {189}, 
     Width -> Automatic}}, 

{Fy2R,{ 
     FeynArtsNr -> 116, 
     LaTeX -> "{Y_{2}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy2r", 
     PDG -> {191}, 
     Width -> Automatic}}, 

{Fy3L,{ 
     FeynArtsNr -> 118, 
     LaTeX -> "{Y_{3}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy3l", 
     PDG -> {193}, 
     Width -> Automatic}}, 

{Fy3R,{ 
     FeynArtsNr -> 120, 
     LaTeX -> "{Y_{3}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy3r", 
     PDG -> {195}, 
     Width -> Automatic}}, 

{Fy4L,{ 
     FeynArtsNr -> 122, 
     LaTeX -> "{Y_{4}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy4l", 
     PDG -> {197}, 
     Width -> Automatic}}, 

{Fy4R,{ 
     FeynArtsNr -> 124, 
     LaTeX -> "{Y_{4}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy4r", 
     PDG -> {199}, 
     Width -> Automatic}}, 

{Fy6L,{ 
     FeynArtsNr -> 126, 
     LaTeX -> "{Y_{6}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy6l", 
     PDG -> {201}, 
     Width -> Automatic}}, 

{Fy6R,{ 
     FeynArtsNr -> 128, 
     LaTeX -> "{Y_{6}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy6r", 
     PDG -> {203}, 
     Width -> Automatic}}, 

{Fy9L,{ 
     FeynArtsNr -> 130, 
     LaTeX -> "{Y_{9}}_L", 
     Mass -> LesHouches, 
     OutputName -> "fy9l", 
     PDG -> {205}, 
     Width -> Automatic}}, 

{Fy9R,{ 
     FeynArtsNr -> 132, 
     LaTeX -> "{Y_{9}}_R", 
     Mass -> LesHouches, 
     OutputName -> "fy9r", 
     PDG -> {207}, 
     Width -> Automatic}}, 

{Fz10L,{ 
     FeynArtsNr -> 134, 
     LaTeX -> "{{z1}^0}_L", 
     Mass -> LesHouches, 
     OutputName -> "fz10l", 
     PDG -> {209}, 
     Width -> Automatic}}, 

{Fz10R,{ 
     FeynArtsNr -> 136, 
     LaTeX -> "{{z1}^0}_R", 
     Mass -> LesHouches, 
     OutputName -> "fz10r", 
     PDG -> {211}, 
     Width -> Automatic}}, 

{Fz12L,{ 
     FeynArtsNr -> 138, 
     LaTeX -> "{z12}_L", 
     Mass -> LesHouches, 
     OutputName -> "fz12l", 
     PDG -> {213}, 
     Width -> Automatic}}, 

{Fz12R,{ 
     FeynArtsNr -> 140, 
     LaTeX -> "{z12}_R", 
     Mass -> LesHouches, 
     OutputName -> "fz12r", 
     PDG -> {215}, 
     Width -> Automatic}}, 

{Fz2L,{ 
     FeynArtsNr -> 142, 
     LaTeX -> "{z2}_L", 
     Mass -> LesHouches, 
     OutputName -> "fz2l", 
     PDG -> {217}, 
     Width -> Automatic}}, 

{Fz2R,{ 
     FeynArtsNr -> 144, 
     LaTeX -> "{z2}_R", 
     Mass -> LesHouches, 
     OutputName -> "fz2r", 
     PDG -> {219}, 
     Width -> Automatic}}, 

{Fz4L,{ 
     FeynArtsNr -> 146, 
     LaTeX -> "{z4}_L", 
     Mass -> LesHouches, 
     OutputName -> "fz4l", 
     PDG -> {221}, 
     Width -> Automatic}}, 

{Fz4R,{ 
     FeynArtsNr -> 148, 
     LaTeX -> "{z4}_R", 
     Mass -> LesHouches, 
     OutputName -> "fz4r", 
     PDG -> {223}, 
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

{phiH,{ 
     LaTeX -> "H"}}, 

{phiS,{ 
     LaTeX -> "S"}}, 

{d,{ 
     LaTeX -> "d"}}, 

{e,{ 
     LaTeX -> "e"}}, 

{H,{ 
     LaTeX -> "h"}}, 

{l,{ 
     LaTeX -> "l"}}, 

{q,{ 
     LaTeX -> "q"}}, 

{s,{ 
     LaTeX -> "s"}}, 

{u,{ 
     LaTeX -> "u"}}, 

{VB,{ 
     LaTeX -> "B"}}, 

{VG,{ 
     LaTeX -> "G"}}, 

{VWB,{ 
     LaTeX -> "WB"}}, 



(*  ----------- Additional particles in the model ---------- *) 

{x1L,{ 
     LaTeX -> "x1l"}}, 

{y1L,{ 
     LaTeX -> "Y_{1l}"}}, 

{x1R,{ 
     LaTeX -> "x1r"}}, 

{y1R,{ 
     LaTeX -> "Y_{1r}"}}, 

{x2L,{ 
     LaTeX -> "x2l"}}, 

{y2L,{ 
     LaTeX -> "Y_{2l}"}}, 

{z2L,{ 
     LaTeX -> "z2l"}}, 

{x2R,{ 
     LaTeX -> "x2r"}}, 

{y2R,{ 
     LaTeX -> "Y_{2r}"}}, 

{z2R,{ 
     LaTeX -> "z2r"}}, 

{x3L,{ 
     LaTeX -> "x3l"}}, 

{y3L,{ 
     LaTeX -> "Y_{3l}"}}, 

{x3R,{ 
     LaTeX -> "x3r"}}, 

{y3R,{ 
     LaTeX -> "Y_{3r}"}}, 

{x4L,{ 
     LaTeX -> "x4l"}}, 

{y4L,{ 
     LaTeX -> "Y_{4l}"}}, 

{z4L,{ 
     LaTeX -> "z4l"}}, 

{x4R,{ 
     LaTeX -> "x4r"}}, 

{y4R,{ 
     LaTeX -> "Y_{4r}"}}, 

{z4R,{ 
     LaTeX -> "z4r"}}, 

{x5L,{ 
     LaTeX -> "x5l"}}, 

{x5R,{ 
     LaTeX -> "x5r"}}, 

{x6L,{ 
     LaTeX -> "x6l"}}, 

{y6L,{ 
     LaTeX -> "Y_{6l}"}}, 

{x6R,{ 
     LaTeX -> "x6r"}}, 

{y6R,{ 
     LaTeX -> "Y_{6r}"}}, 

{x7L,{ 
     LaTeX -> "x7l"}}, 

{x7R,{ 
     LaTeX -> "x7r"}}, 

{x8L,{ 
     LaTeX -> "x8l"}}, 

{x8R,{ 
     LaTeX -> "x8r"}}, 

{x9L,{ 
     LaTeX -> "x9l"}}, 

{y9L,{ 
     LaTeX -> "Y_{9l}"}}, 

{x9R,{ 
     LaTeX -> "x9r"}}, 

{y9R,{ 
     LaTeX -> "Y_{9r}"}}, 

{x10L,{ 
     LaTeX -> "x10l"}}, 

{y10L,{ 
     LaTeX -> "Y_{10l}"}}, 

{z10L,{ 
     LaTeX -> "z10l"}}, 

{x10R,{ 
     LaTeX -> "x10r"}}, 

{y10R,{ 
     LaTeX -> "Y_{10r}"}}, 

{z10R,{ 
     LaTeX -> "z10r"}}, 

{x11L,{ 
     LaTeX -> "x11l"}}, 

{y11L,{ 
     LaTeX -> "Y_{11l}"}}, 

{x11R,{ 
     LaTeX -> "x11r"}}, 

{y11R,{ 
     LaTeX -> "Y_{11r}"}}, 

{x12L,{ 
     LaTeX -> "x12l"}}, 

{y12L,{ 
     LaTeX -> "Y_{12l}"}}, 

{z12L,{ 
     LaTeX -> "z12l"}}, 

{x12R,{ 
     LaTeX -> "x12r"}}, 

{y12R,{ 
     LaTeX -> "Y_{12r}"}}, 

{z12R,{ 
     LaTeX -> "z12r"}}, 

{x13L,{ 
     LaTeX -> "x13l"}}, 

{x13R,{ 
     LaTeX -> "x13r"}}, 

{F10L,{ 
     LaTeX -> "{{1}^0}_L"}}, 

{F10R,{ 
     LaTeX -> "{{1}^0}_R"}}, 

{F11L,{ 
     LaTeX -> "{11}_L"}}, 

{F11R,{ 
     LaTeX -> "{11}_R"}}, 

{F12L,{ 
     LaTeX -> "{12}_L"}}, 

{F12R,{ 
     LaTeX -> "{12}_R"}}, 

{F13L,{ 
     LaTeX -> "{13}_L"}}, 

{F13R,{ 
     LaTeX -> "{13}_R"}}, 

{F1L,{ 
     LaTeX -> "{1}_L"}}, 

{F1R,{ 
     LaTeX -> "{1}_R"}}, 

{F2L,{ 
     LaTeX -> "{2}_L"}}, 

{F2R,{ 
     LaTeX -> "{2}_R"}}, 

{F3L,{ 
     LaTeX -> "{3}_L"}}, 

{F3R,{ 
     LaTeX -> "{3}_R"}}, 

{F4L,{ 
     LaTeX -> "{4}_L"}}, 

{F4R,{ 
     LaTeX -> "{4}_R"}}, 

{F5L,{ 
     LaTeX -> "{5}_L"}}, 

{F5R,{ 
     LaTeX -> "{5}_R"}}, 

{F6L,{ 
     LaTeX -> "{6}_L"}}, 

{F6R,{ 
     LaTeX -> "{6}_R"}}, 

{F7L,{ 
     LaTeX -> "{7}_L"}}, 

{F7R,{ 
     LaTeX -> "{7}_R"}}, 

{F8L,{ 
     LaTeX -> "{8}_L"}}, 

{F8R,{ 
     LaTeX -> "{8}_R"}}, 

{F9L,{ 
     LaTeX -> "{9}_L"}}, 

{F9R,{ 
     LaTeX -> "{9}_R"}} 
}; 




