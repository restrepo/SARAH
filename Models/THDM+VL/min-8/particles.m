

ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  {             PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 
                 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
      {hh ,  { Description -> "Higgs"}}, 
      {Ah ,  { Description -> "Pseudo-Scalar Higgs"}}, 
      
      {Hm,  { Description -> "Charged Higgs"}},                                                  
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson"}}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson",
               Goldstone -> Hm[{1}] }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},             
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},
      {FdV,   { Description -> "vectorlike Down-Quarks",
                ElectricCharge -> 2,
                PDG -> {101,103},
                 PDG.IX->{210890201,210890202},
                 LaTeX -> "FdV",
                 FeynArtsNr -> 7,
                 OutputName -> "dV",
                LaTeX -> "FdV",
                Mass -> {LesHouches}
                }},   
      {FuV,   { Description -> "vectorlike Down-Quarks",
                ElectricCharge -> 3,
                PDG -> {102},
                PDG.IX->{210100401},
                LaTeX -> "FuV",
                FeynArtsNr -> 9,
                OutputName -> "uV",
                LaTeX -> "FuV",
                Mass -> {LesHouches}
                }}
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},

   {H10, {LaTeX -> "H_1^0", FeynArtsNr -> 1001, OutputName -> H10}},
   {H20, {LaTeX -> "H_2^0", FeynArtsNr -> 1002, OutputName -> H20}},
   {H1p, {LaTeX -> "H_1^+", FeynArtsNr -> 1003, OutputName -> H1p}},
   {H2p, {LaTeX -> "H_2^+", FeynArtsNr -> 1004, OutputName -> H2p}},

   {sigma1, {LaTeX -> "\\sigma_1"}},
   {sigma2, {LaTeX -> "\\sigma_2"}},

   {phi1, {LaTeX -> "\\phi_1"}},
   {phi2, {LaTeX -> "\\phi_2"}},


   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {QVL,     {LaTeX -> "qVL" }},
   {QVR,     {LaTeX -> "qVR" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {dVL,     {LaTeX -> "d_{VL}" }},
   {uVL,     {LaTeX -> "u_{VL}" }},
   {sL,     {LaTeX -> "s_{L}" }},
   {dVR,     {LaTeX -> "d_{VLR}" }},
   {uVR,     {LaTeX -> "u_{VR}" }},
   {sR,     {LaTeX -> "s_{R}" }},

   
   {eV1L,     {LaTeX -> "e_{V1L}" }},
   {vV1L,     {LaTeX -> "v_{V1L}" }},
   {eV2L,     {LaTeX -> "e_{V2L}" }},
   {vV2L,     {LaTeX -> "v_{V2L}" }},
   {eV1R,     {LaTeX -> "e_{V1LR}" }},
   {vV1R,     {LaTeX -> "v_{V1R}" }},
   {eV2R,     {LaTeX -> "e_{V2R}" }},
   {vV2R,     {LaTeX -> "v_{V2R}" }},
   
   {vL,     {LaTeX -> "\\nu_L" }},

   {DR,     {LaTeX -> "D_R" }},
   {DVR,     {LaTeX -> "D_{VR}" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {UVR,     {LaTeX -> "U_{VR}" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {DVL,     {LaTeX -> "D_{VL}" }},
   {UVL,     {LaTeX -> "U_{VL}" }},
   {EVL,     {LaTeX -> "E_{VL}" }},
   {VVL,     {LaTeX -> "V_{VL}" }},
   {EVR,     {LaTeX -> "E_{VR}" }},
   {VVR,     {LaTeX -> "V_{VR}" }}
        };       


