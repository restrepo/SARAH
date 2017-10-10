ParticleDefinitionsMain = {

(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*           M  S  S  M                   *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)


(*----------------------------------------*)
(* MSSM Gauge Eigenstates                 *)
(*----------------------------------------*)


(* ---------------------------- Squarks --------------------------*)

      {{  Description -> "Left Down-Squarks", 
                PDG ->  {0,0,0},
                PDG.IX -> {0,0,0},
                Mass -> Automatic,   
                LaTeX -> "\\tilde{d}_L",
                FeynArtsNr -> 14,
                OutputName -> "dL" }},
              
              
      {{ Description -> "Right Down-Squarks", 
               PDG -> {0,0,0},
               PDG.IX -> {0,0,0},
               Mass -> Automatic,
               FeynArtsNr -> 15,
               LaTeX -> "\\tilde{d}_R",
               OutputName -> "dR" }},
               
       {{ Description -> "Left Up-Squarks", 
               PDG -> {0, 0, 0},
               PDG.IX -> {0,0,0},
               Mass -> Automatic,
               FeynArtsNr -> 16,
               LaTeX -> "\\tilde{u}_L",
               OutputName -> "uL" }}, 
               
       {{ Description -> "Right Up-Squarks", 
               PDG -> {0, 0, 0},
               PDG.IX -> {0,0,0},
               Mass -> Automatic,
               FeynArtsNr -> 17,
               LaTeX -> "\\tilde{u}_R",
               OutputName -> "uR" }},                
               
(* --------------------------- Sleptons ----------------------------*)
      
       {{ Description -> "Left Selectron", 
               PDG -> {0, 0, 0},
               PDG.IX -> {0,0,0},
               Mass -> Automatic,
               FeynArtsNr -> 12,
               LaTeX -> "\\tilde{e}_L",
               OutputName -> "eL" }}, 
               
       {{ Description -> "Right Selectron", 
               PDG -> {0, 0, 0},
               PDG.IX -> {0,0,0},
               Mass -> Automatic,
               FeynArtsNr -> 13,
               LaTeX -> "\\tilde{e}_R",
               OutputName -> "eR" }},                         
      
     
       {{Description -> "Left Sneutrino",  
               PDG -> {0, 0, 0},
               PDG.IX -> {0,0,0},
               Mass -> Automatic,
               FeynArtsNr -> 10,
               LaTeX -> "\\tilde{\\nu}_L",
               OutputName -> "nL" }},   
               
(* --------------------------- Higgs -------------------------*)                                     
      
      
      {{ Description -> "Neutral Down-Higgs", 
               PDG -> {0},
               PDG.IX -> {0},
               Mass -> Automatic,
               FeynArtsNr -> 1,
               LaTeX -> "H_d^0",
               OutputName -> "Hd0" }},                         
      
      
      {{ Description -> "Charged Down-Higgs",
                                  PDG -> {0},
               PDG.IX -> {0},
               Mass -> Automatic,
               FeynArtsNr -> 2,
               LaTeX -> "H_d^-",
               OutputName -> "Hdm" }}, 
                 
      {{ Description -> "Neutral Up-Higgs",
                                  PDG -> {0},
               PDG.IX -> {0},
               Mass -> Automatic,
               FeynArtsNr -> 3,
               LaTeX -> "H_u^0",
               OutputName -> "Hu0" }},                         
      
      
      {{ Description -> "Charged Up-Higgs",
                                  PDG -> {0},
               PDG.IX -> {0},
               Mass -> Automatic,
               FeynArtsNr -> 4,
               LaTeX -> "H_u^+",
               OutputName -> "Hup" }},                                                   
      
     (* ------------------------- Bosons -------------------------*) 
      
     
      {{ Description -> "B-Boson",
                                  PDG -> {0},
                 PDG.IX -> {0},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 1,
                 LaTeX -> "B",
                 OutputName -> "B" }},                                                   
    
      {{ Description -> "Gluon",
                 PDG -> {21},
                 PDG.IX -> {121110001},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 5,
                 LaTeX -> "g",
                 ElectricCharge -> 0,
                 OutputName -> "g" }},          
     
     
      {{ Description -> "W-Bosons",
                 PDG -> {0},
                 PDG.IX -> {0},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 2,
                 LaTeX -> "W",
                 OutputName -> "W" }}, 
                 
(* ---------------------------------- Ghosts -----------------------------*)                          
     
     
      {{ Description -> "B-Boson Ghost",
                 PDG -> {0},
                 PDG.IX -> {0},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 1,
                 LaTeX -> "\\eta^B",
                 OutputName -> "gB" }},                                                   
    
      {{ Description -> "Gluon Ghost",
                 PDG -> {0},
                 PDG.IX -> {0},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 5,
                 LaTeX -> "\\eta^G",
                 ElectricCharge -> 0,
                 OutputName -> "gG" }},          
     
     
      {{ Description -> "W-Boson Ghost",
                 PDG -> {0},
                 PDG.IX -> {0},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 2,
                 LaTeX -> "\\eta^W",
                 OutputName -> "gW" }},    
                 
                 
(* ---------------------------- Gauginos ---------------------------------*)                 
                 
               
      {{ Description -> "Wino", 
                 PDG -> {0},
                 PDG.IX -> {0},
                 Mass -> Automatic,
                 FeynArtsNr -> 12,
                 LaTeX -> "\\tilde{W}",
                 OutputName -> "w" }},
                 
      {{ Description -> "Bino", 
                 PDG -> {0},
                 PDG.IX -> {0},
                 Mass -> Automatic,
                 FeynArtsNr -> 11,
                 LaTeX -> "\\tilde{B}",
                 OutputName -> "b" }},   
                 
(* ------------------------------ Higgsinos -------------------------------*)                                                                                                            
     
      {{ Description -> "Neutral Higgsinos",
                 PDG -> {0},
                 PDG.IX -> {0},
                 Mass -> Automatic,
                 FeynArtsNr -> 21,
                 LaTeX -> "\\tilde{H}^0",
                 OutputName -> "H0" }},
        
      {{ Description -> "Charged Higgsinos",
                 PDG -> {0},
                 PDG.IX -> {0},
                 Mass -> Automatic,
                 FeynArtsNr -> 22,
                 LaTeX -> "\\tilde{H}^-",
                 OutputName -> "HC" }},
                 
                 
(*----------------------------------------*)
(* MSSM Mass ECP-even Sneutrinoigenstates                  *)
(*----------------------------------------*)
                 
(* --------------------------------------- Squarks --------------------------------------*)                 
         
       {{  Description -> "Down-Squarks",  
                PDG ->  {1000001,1000003,1000005,2000001,2000003,2000005},
                PDG.IX -> {-200890201,-200890202,-200890203,-200890204,-200890205,-200890206},
                Mass -> LesHouches,
                FeynArtsNr -> 14,   
                LaTeX -> "\\tilde{d}",
                ElectricCharge -> -1/3,
                LHPC -> {7, "cyan"},
                OutputName -> "sd" }},
           
      {{  Description -> "Up-Squarks",
                PDG ->  {1000002,1000004,1000006,2000002,2000004,2000006},
                PDG.IX -> {200100401,200100402,200100403,200100404,200100405,200100406},
                Mass -> LesHouches,
                FeynArtsNr -> 13,   
                ElectricCharge -> 2/3,
                LaTeX -> "\\tilde{u}",
                LHPC -> {7, "blue"},
                OutputName -> "su" }},   
                
(* ----------------------------------------- Sleptons -------------------------------------*)                
      
      
     {{  Description -> "Sleptons",   
                PDG ->  {1000011,1000013,1000015,2000011,2000013,2000015},
                PDG.IX -> {-200000601,-200000602,-200000603,-200000604,-200000605,-200000606},
                Mass -> LesHouches,
                FeynArtsNr -> 12,  
                ElectricCharge -> -1, 
                LaTeX -> "\\tilde{e}",
                LHPC -> {5, "green"},
                OutputName -> "se" }}, 
    
    {{   Description -> "Sneutrinos",  
                PDG ->  {1000012,1000014,1000016},
                PDG.IX -> {200000001,200000002,200000003},
                Mass -> LesHouches,
                FeynArtsNr -> 11,   
                ElectricCharge -> 0,
                LaTeX -> "\\tilde{\\nu}",
                LHPC -> {5, "turquoise"},
                OutputName -> "sv" }},
                
(* --------------------------------------- Higgs -----------------------------------------*)                                                
      
    {{   Description -> "Higgs",
                PDG -> {25, 35},
                PDG.IX ->{101000001,101000002},
                Mass -> LesHouches,
                FeynArtsNr -> 1,
                LaTeX -> "h",
                ElectricCharge -> 0,
                LHPC -> {1, "gold"},
                OutputName -> "h" }}, 
                 
     {{   Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0, 36},
                 PDG.IX ->{0,102000001},
                 Width -> {0, External},
                 Mass -> {0, LesHouches},
                 FeynArtsNr -> 2,
                 LaTeX -> "A^0",
                 ElectricCharge -> 0,
                 LHPC -> {1, "gold"},
                 OutputName -> "Ah" }},                       
      
      
    {{   Description -> "Charged Higgs", 
                 PDG -> {0, -37},
                 PDG.IX ->{0, -100000601},
                 Width -> {0, External}, 
                 Mass -> {0, LesHouches},
                 FeynArtsNr -> 3,
                 LaTeX -> {"H^-","H^+"},
                 LHPC -> {2, "orange-red"},
                 ElectricCharge -> -1,
                 OutputName -> {"Hm","Hp"} }},       
                 
(* ----------------------------------- Bosons -----------------------------------------*)                                                             
      
     
     {{  Description -> "Photon", 
                 PDG -> {22},
                 PDG.IX ->{121000001},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 1,
                 LaTeX -> "\\gamma",
                 ElectricCharge -> 0,
                 OutputName -> "A" }}, 
                 
     {{   Description -> "Z-Boson",
                 PDG -> {23},
                 PDG.IX ->{122000001},
                 Width -> 2.4952, 
                 Mass -> 91.1876,
                 FeynArtsNr -> 2,
                 ElectricCharge -> 0,
                 Goldstone -> Ah[{1}],
                 LaTeX -> "Z",
                 OutputName -> "Z" }}, 
                                                                               
    
      {{   Description -> "Gluon",
                 PDG -> {21},
                 PDG.IX ->{121110001},
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 5,
                 LaTeX -> "g",
                 ElectricCharge -> 0,
                 OutputName -> "g" }},          
     
     
      {{   Description -> "W-Boson",
                 PDG -> {-24},
                 PDG.IX ->{-120000601},
                 Width -> 2.141, 
                 Mass -> Dependence, 
                 FeynArtsNr -> 3,
                 ElectricCharge -> -1,
                 LaTeX -> {"W^-","W^+"},
                 Goldstone -> Hpm[{1}],
                 MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[Mass[VZ]^4/4 - Pi*Mass[VZ]^2/(aEWinv*Gf*Sqrt[2])]], 
                 OutputName -> {"Wm","Wp"} }},       

 
      {{   Description -> "W+ - Boson",
                 PDG -> {24},
                 PDG.IX ->{120000601},
                 Width -> 2.141, 
                 Mass -> Dependence, 
                 FeynArtsNr -> 3,
                 ElectricCharge -> 1,
                 Goldstone -> Hp[{1}],
                 MassDependence -> Sqrt[Mass[VZ]^2/2 + Sqrt[Mass[VZ]^4/4 - Pi*Mass[VZ]^2/(aEWinv*Gf*Sqrt[2])]], 
                 LaTeX -> {"W^+","W^-"},
                 OutputName -> {"Wp","Wm"} }},         
                 
     
(* ----------------------------------- Ghosts -----------------------------------*)
     
     
      {{ Description -> "Photon Ghost",
                 PDG -> 0,
                 PDG.IX -> 0,
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 1,
                 ElectricCharge -> 0,
                 LaTeX -> "\\eta^{\\gamma}",
                 OutputName -> "gA" }},                                                   
    
      
      {{ Description -> "Negative W-Boson Ghost",
                 PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VWm],
                 FeynArtsNr -> 3,
                 ElectricCharge -> -1,
                 LaTeX -> "\\eta^-",
                 OutputName -> "gWm" }}, 
                 
      {{ Description -> "Positive W-Boson Ghost", 
                 PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VWm],
                 FeynArtsNr -> 4,
                 ElectricCharge -> 1,
                 LaTeX -> "\\eta^+",
                 OutputName -> "gWpC" }}, 
                 
      {{ Description -> "Positive W+ - Boson Ghost",
                 PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VWp],
                 FeynArtsNr -> 3,
                 ElectricCharge -> 1,
                 LaTeX -> "\\eta^+",
                 OutputName -> "gWp" }}, 
                 
      {{ Description -> "Negative W+ - Boson Ghost", 
                 PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VWp],
                 FeynArtsNr -> 4,
                 ElectricCharge -> -1,
                 LaTeX -> "\\eta^-",
                 OutputName -> "gWC" }}, 
                 
      
       {{ Description -> "Z-Boson Ghost",
                 PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VZ],
                 FeynArtsNr -> 2,
                 ElectricCharge -> 0,
                 LaTeX -> "\\eta^Z",
                 OutputName -> "gZ" }},    
                 
     (* ------------------------------------- Gluino ---------------------------------------*)              
    
      {{   Description -> "Gluino",
                 PDG -> {1000021},
                 PDG.IX ->{211110001},
                 Mass -> LesHouches,
                 FeynArtsNr -> 15,
                 LaTeX -> "\\tilde{g}",
                 ElectricCharge -> 0,
                 LHPC -> {4, "purple"},
                 OutputName -> "go" }},
                 
     (* ------------------------------------ Neutralino/Chargino -----------------------------*)                               
                 
      {{ Description -> "Neutralinos",
                 PDG -> {1000022,1000023,1000025,1000035},
                 PDG.IX ->{211000001,211000002,211000003,211000004},
                 Mass -> LesHouches,
                 FeynArtsNr -> 11,
                 LaTeX -> "\\tilde{\\chi}^0",
                 ElectricCharge -> 0,
                 LHPC -> {3, "orange"},
                 OutputName -> "N" }},
                 
      {{  Description -> "Charginos",
                 PDG -> {-1000024, -1000037},
                 PDG.IX ->{-210000601,-210000602},
                 Mass -> LesHouches,
                 FeynArtsNr -> 12,
                 ElectricCharge -> -1,
                 LaTeX -> {"\\tilde{\\chi}^-","\\tilde{\\chi}^+"},
                 LHPC -> {4, "red"},
                 OutputName -> "C" }},                                                                                              
                 
                 
(*----------------------------------------*)
(* SM Fermions                            *)
(*----------------------------------------*)                 
                               
                 
      {{   Description -> "Down-Quarks",
                 PDG -> {1,3,5},
                 PDG.IX->{-110890201,-110890202,-110890203},
                 Mass -> {0.0035, 0.104, 4.20},
                 Width -> {0, 0, 0},
                 FeynArtsNr -> 4,
                 LaTeX -> "d",
                 ElectricCharge -> -1/3,
                 OutputName -> "d" }},   
                 
      {{   Description -> "Up-Quarks",
                 PDG -> {2,4,6},
                 PDG.IX->{110100401,110100402,110100403},
                 Mass -> {0.0015, 1.27, 171.2},
                 Width -> {0, 0, 1.51},
                 FeynArtsNr -> 3,
                 LaTeX -> "u",
                 ElectricCharge -> 2/3,
                 OutputName -> "u" }},   
                 
      {{   Description -> "Leptons",
                 PDG -> {11,13,15},
                 PDG.IX -> {-110000601,-110000602,-110000603},
                 Mass -> {0.000511, 0.105, 1.776},
                 Width -> {0, 0, 0},
                 FeynArtsNr -> 2,
                 LaTeX -> "e",
                 ElectricCharge -> -1,
                 OutputName -> "e" }},
                 
      {{    Description -> "Neutrinos",
                 PDG -> {12,14,16},
                 PDG.IX ->{-110000001,-110000002,-110000003},
                 Width -> {0,0,0}, 
                 Mass -> {0,0,0},
                 FeynArtsNr -> 1,
                 ElectricCharge -> 0,
                 LaTeX -> "\\nu",
                 OutputName -> "nu" }},  
                 
(*----------------------------------------*)
(* Weyl Spinors                           *)
(*----------------------------------------*)   

(* ------------------------------------ Higgsinos ----------------------------------*)                                                                            
     
       {{ Description -> "Neutral Down-Higgsino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{H}_d^0",
                 OutputName -> "" }},      
                 
       {{  Description -> "Neutral Up-Higgsino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{H}_u^0",
                 OutputName -> "" }}, 
                 
       {{  Description -> "Charged Down-Higgsino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{H}_d^-",
                 OutputName -> "" }},                                                                                                             
   
       {{ Description -> "Charged Up-Higgsino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{H}_u^+",
                 OutputName -> "" }},
                 
(* ----------------------------------- Neutralino/Charginos ----------------------------------*)                                                                                             
                 
        {{  Description -> "Neutralino Weyl-Spinor",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\lambda^0",
                 OutputName -> "" }},
                 
                 
        {{ Description -> "Negative Chargino Weyl-Spinor",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\lambda^-",
                 OutputName -> "" }},
                 
                 
       {{ Description -> "Positive Chargino Weyl-Spinor",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\lambda^+",
                 OutputName -> "" }}, 
                 
                 
(* ------------------------------------  Gluino / Gauginos ---------------------------------*)                                                                                                              
                 
       {{ Description ->"Gluino Weyl-Spinor",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\lambda_{\\tilde{g}}",
                 OutputName -> "" }},
                 
                 
       {{ Description ->"Wino Weyl-Spinor",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\lambda_{\\tilde{W}}",
                 OutputName -> "" }},
       
       {{ Description ->"Neutral Wino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{W}^0",
                 OutputName -> "" }},
                 
       {{ Description ->"Negative Wino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{W}^-",
                 OutputName -> "" }},
                 
       {{ Description ->"Positive Wino",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{W}^+",
                 OutputName -> "" }},                 
                 
                 
        {{ Description ->"Bino Weyl-Spinor",
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\lambda_{\\tilde{B}}",
                 OutputName -> "" }},   

           
(* /////////////////////////////////  SM Fermions ///////////////////////////////////////*)                    

(*-------------------------------------- Gauge Eigenstates ---------------------------*)
                 
 {{ Description -> "Left Electron", 
                 LaTeX -> "e_L",
                 OutputName -> "" }},
                 
 {{ Description -> "Left Neutrino", 
                 LaTeX -> "\\nu_L",
                 OutputName -> "" }},
                 
                 
  {{  Description -> "Right Electron", 
                 LaTeX -> "e_R",
                 OutputName -> "" }} ,
                 
    
  {{  Description -> "Left Down-Quark", 
                 LaTeX -> "d_L",
                 OutputName -> "" }},
                 
  {{  Description -> "Right Down-Quark", 
                 LaTeX -> "d_R",
                 OutputName -> "" }},              

   
  {{  Description -> "Left Up-Quark", 
                 LaTeX -> "u_L",
                 OutputName -> "" }},
                 
  {{  Description -> "Right Up-Quark", 
                 LaTeX -> "u_R",
                 OutputName -> "" }},
                 
(*-------------------------------------- Mass Eigenstates ---------------------------*)
                 
 {{ Description -> "Left-Neutrino-Masseigenstate", 
                 LaTeX -> "\\nu_M",
                 OutputName -> "" }},                   
                 
                 
  {{  Description -> "Rotated Left Electron", 
                 LaTeX -> "E_L",
                 OutputName -> "" }},
                 
  {{ Description -> "Rotated Right Electron", 
                 LaTeX -> "E_R",
                 OutputName -> "" }} ,
                 
    
  {{ Description -> "Rotated Left Up-Quark", 
                 LaTeX -> "D_L",
                 OutputName -> "" }},
                 
  {{ Description -> "Rotated Right Up-Quark", 
                 LaTeX -> "D_R",
                 OutputName -> "" }},              

   
  {{ Description -> "Rotated Left Down-Quark", 
                 LaTeX -> "U_L",
                 OutputName -> "" }},
                 
  {{  Description -> "Rotated Right Down-Quark", 
                 LaTeX -> "U_R",
                 OutputName -> "" }},  
                 
                 
(* ------------------------------------------------------ *)
(* Dirac Spinors for gauge eigenstates *)                 
(* ------------------------------------------------------ *)

(*-------------------------------------- SM Fermions ---------------------------*)

  {{ Description -> "Dirac Left Up-Quark",
                LaTeX -> "u^1",
                FeynArtsNr -> 110,
                OutputName -> "u1" }},
              
{{ Description -> "Dirac Right Up-Quark",
                LaTeX -> "u^2",
                FeynArtsNr -> 111,
                OutputName -> "u2" }},
    

  {{ Description -> "Dirac Left Down-Quark",
                LaTeX -> "d^1",
                FeynArtsNr -> 120,
                OutputName -> "d1" }},
              
  {{ Description -> "Dirac Right Down-Quark",
                LaTeX -> "d^2",
                FeynArtsNr -> 121,
                OutputName -> "d2" }},


  {{ Description -> "Dirac Left Electron",
                LaTeX -> "e^1",
                FeynArtsNr -> 130,
                OutputName -> "e1" }},
              
{{ Description -> "Dirac Right Electron",
                LaTeX -> "e^2",
                FeynArtsNr -> 131,
                OutputName -> "e2" }},
 

 {{ Description -> "Dirac Left Neutrino",
                LaTeX -> "\\nu^1",
                FeynArtsNr -> 140,
                OutputName -> "v1" }},
              
{{ Description -> "Dirac Right Neutrino",
                LaTeX -> "\\nu^2",
                FeynArtsNr -> 141,
                OutputName -> "v2" }},  
                
  {{ Description -> "Left Leptons", 
                LaTeX -> "l",
                FeynArtsNr -> 150,
                OutputName -> "" }},   
 
 {{ Description -> "Left Quarks", 
                LaTeX -> "q",
                FeynArtsNr -> 151,
                OutputName -> "" }},                             


(*-------------------------------------- Higgsinos ---------------------------*)

 
  {{  Description -> "Down-Higgsino", 
                LaTeX -> "\\tilde{H}_d",
                FeynArtsNr -> 200,
                OutputName -> "" }},
                 
  {{ Description -> "Up-Higgsino", 
                LaTeX -> "\\tilde{H}_u",
                FeynArtsNr -> 201,
                OutputName -> "" }},          

  
                 
(*----------------------------------------*)
(* Real / Imaginary part of Higgs fields  *)
(*----------------------------------------*)                     
                 
       {{ Description -> "Scalar Down", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{d}",
                 OutputName -> "" }},                                                                       
   
   
       {{ Description -> "Scalar Up", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{u}",
                 OutputName -> "" }}, 
                                                                                       
    {{ Description -> "Pseudo Scalar Down", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{d}",
                 OutputName -> "" }},
                                                                                        
    {{ Description -> "Pseudo Scalar Up", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{u}",
                 OutputName -> "" }},                 
                 
(*----------------------------------------*)
(* Higgs Components                       *)
(*----------------------------------------*)                   

    {{ Description -> "Down-Higgs", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H_d",
                 OutputName -> "" }},
                                                                            
   {{ Description -> "Up-Higgs", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H_u",
                 OutputName -> "" }},
      
   {{   Description -> "Left Slepton", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{l}",
                 OutputName -> "" }},
 
  {{    Description -> "Left Squark", 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\tilde{q}",
                 OutputName -> "" }},                 
 
 
(*----------------------------------------*)
(* Superfield Names                       *)
(*----------------------------------------*)   

 
                 
  {{Description -> "Right Electron Superfield", 
                 LaTeX -> "\\hat{e}" }},
                   
  {{Description -> "Right Down-Quark Superfield", 
                  LaTeX -> "\\hat{d}" }},                 
  
  {{Description -> "Left Quark Superfield", 
                  LaTeX -> "\\hat{q}" }},                 
  
  {{Description -> "Right Up-Quark Superfield", 
                  LaTeX -> "\\hat{u}" }},                 
  
  {{Description -> "left Lepton Superfield", 
                  LaTeX -> "\\hat{l}" }},  
  
  {{Description -> "Down-Higgs Superfield", 
                  LaTeX -> "\\hat{H}_d" }},                                         
  
  {{Description -> "Up-Higgs Superfield", 
                     LaTeX -> "\\hat{H}_u" }},                 
  
  {{Description -> "Gluon Superfield", 
                  LaTeX -> "\\hat{g}" }},                 
  
  {{Description -> "B Superfield", 
                  LaTeX -> "\\hat{B}" }},                 
  
  {{Description -> "W Superfield", 
                      LaTeX -> "\\hat{W}" }},


(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*         N  M  S  S  M                  *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)



(* -------- Gauge eigenstates  ------ *)

  {{ Description -> "Singlino", 
                 PDG -> {0},
                 PDG.IX -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 9,
                 LaTeX -> "\\tilde{S}",
                 OutputName -> "Fs"

    }},
    

  {{ Description -> "Singlet", 
                 PDG -> {0},
                 PDG.IX -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 98,
                 LaTeX -> "S",
                 OutputName -> "s"

    }},    
   
   
(* -------- Weyl Spinor  ------ *)   
    
  {{ Description -> "Weyl Spinor of Singlino", 
                 PDG -> 99,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 9,
                 LaTeX -> "\\tilde{S}",
                 OutputName -> "s"

    }},  


(* -------- Real/Imaginary part of Singlet  ------ *)   


 {{  Description -> "Scalar Singlet", 
                 LaTeX -> "\\sigma_s",
                 OutputName -> "" }},
                 
 {{ Description -> "Pseudo Scalar Singlet", 
                 LaTeX -> "\\phi_s",
                 OutputName -> "" }},
                 
(* -------- Superfield  ------ *)                    

 {{ Description -> "Singlet Superfield",
                 LaTeX -> "\\hat{s}" }},


(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*        R PARITY VIOLATION              *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
  
  (* -------- Real/Imaginary part of Sneutrinos  ------ *)   
  

 {{ Description -> "Scalar Sneutrino",
    LaTeX -> "\\phi_L"}},
    
 {{ Description -> "Pseudo Scalar Sneutrino",
    LaTeX -> "\\sigma_L"}},

 {{ Description -> "Right Scalar Sneutrino",
    LaTeX -> "\\phi_R"}},
    
 {{ Description -> "Right Pseudo Scalar Sneutrino",
    LaTeX -> "\\sigma_R"}},
    
 (* -------- Gauge eigenstates  ------ *)                 

 {{ Description -> "Right Neutrino",
               LaTeX -> "\\nu_R"}},

 {{ Description -> "Right Sneutrino",
               PDG -> {0, 0, 0},
               Width -> 0, 
               Mass -> Automatic,
               LaTeX -> "\\tilde{\\nu}_R",
               FeynArtsNr -> 18,
               OutputName -> "vR" }},
               
(* -------- Superfield  ------ *)                 

 {{ Description -> "Right Neutrino Superfield",
    LaTeX -> "\\hat{\\nu}" }},

(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*       CP-even and odd Sneutrinos       *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)

  {{ Description -> "CP-even Sneutrino",
         LaTeX -> "\\nu^R",
         OutputName -> "nR",
         FeynArtsNr -> 41,
         LHPC -> {5, "blue"},
         ElectricCharge->0,
         PDG->{1000012,1000014,1000016,2000012,2000014,2000016},
         PDG.IX ->{200000001,200000002,200000003,200000004,200000005,200000006} }}, 
                               
   {{ Description -> "CP-odd Sneutrino",
         LaTeX -> "\\nu^I",
         OutputName -> "nI",
         FeynArtsNr -> 40,
         ElectricCharge->0,         
         LHPC -> {5, "turquoise"},
         PDG->{4000012,4000014,4000016,5000012,5000014,5000016},
         PDG.IX ->{202000001,202000002,202000003,202000004,202000005,202000006}}},       

    
    
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*       EXTRA U(1)                       *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)

{{ Description -> "Bino'",
      PDG -> {0},
   PDG.IX -> {0},
   FeynArtsNr -> 10,
   LaTeX -> "{\\tilde{B}'}",
   OutputName -> "FBp"}}, 

{{ Description -> "B'-Boson",
      PDG -> {0},
   PDG.IX -> {0},
   FeynArtsNr -> 10,
   LaTeX -> "{B'}",
   OutputName -> "Bp"}}, 

{{ Description -> "B'-Boson Ghost",
      PDG -> {0},
   PDG.IX -> {0},
   FeynArtsNr -> 10,
   LaTeX -> "{g_{B'}}",
   OutputName -> "gBp"}},

{{ Description -> "Z'-Boson",
      PDG -> {31},
   PDG.IX -> {122000002},
   Width -> Automatic, 
   Mass -> LesHouches,
   FeynArtsNr -> 10,
   LaTeX -> "{Z'}",
   Goldstone -> Ah[{2}],
   ElectricCharge -> 0,
   OutputName -> "Zp"}},   
   
{{ Description -> "Z'-Ghost",  
          PDG -> 0,
     PDG.IX -> 0,
     Width -> 0, 
     Mass -> Automatic,
     FeynArtsNr -> 10,
     LaTeX -> "\\eta^{Z'}",
     ElectricCharge -> 0,
     OutputName -> "gZp"}},

(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*       Gravitino/Goldstino             *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)

{{ Description -> "Gravitino",
   PDG -> {7777777},
   Width -> Automatic, 
   Mass -> m32,
   FeynArtsNr -> 77,
   LaTeX -> "{\\tilde{G}_{\\mu}}}",
   ElectricCharge -> 0,
   OutputName -> "GMU"}}, 

{{ Description -> "Goldstino",
   PDG -> {88888888},
   Width -> Automatic, 
   Mass -> m32,
   FeynArtsNr -> 88,
   LaTeX -> "{\\tilde{G}}}",
   ElectricCharge -> 0,
   OutputName -> "GOL"}}, 

{{ Description -> "Weyl Gravitino",
   PDG -> 0,
   Width -> Automatic, 
   Mass -> m32,
   FeynArtsNr -> 77,
   LaTeX -> "{\\Psi_{3/2}}}",
   ElectricCharge -> 0,
   OutputName -> "WGMU"}}, 

{{ Description -> "Weyl Goldstino",
   PDG -> 0,
   Width -> Automatic, 
   Mass -> m32,
   FeynArtsNr -> 88,
   LaTeX -> "{\\Psi}}",
   ElectricCharge -> 0,
   OutputName -> "WGOL"}},


(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)
(*       SU(2)_R                          *)
(* ///////////////////////////////////////*)
(* ///////////////////////////////////////*)

     
 
 {{ Description -> "W'-Boson",
      PDG -> {34},
   PDG.IX -> {120000602},
   FeynArtsNr -> 20,
   LaTeX -> "{W'}",
   ElectricCharge -> -1,
   OutputName -> "Wp"}},   
   
  {{ Description -> "Negative W'-Boson Ghost",
                                  PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VWmP],
                 FeynArtsNr -> 13,
                 LaTeX -> "{\\eta'}^-",
                 ElectricCharge -> -1,
                 OutputName -> "gWmp" }}, 
                 
  {{ Description -> "Positive W'-Boson Ghost", 
                                  PDG -> 0,
                 PDG.IX -> 0,
                 Mass -> Mass[VWmP],
                 FeynArtsNr -> 14,
                 LaTeX -> "{\\eta'}^+",
                 ElectricCharge -> 1,
                 OutputName -> "gWCp" }}


  
  };                 
