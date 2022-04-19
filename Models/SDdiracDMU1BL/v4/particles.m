
ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                               
      
      {Hp,  {    PDG -> {0},
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
      {gWB,  { Description -> "W-Boson Ghost"}},
                 
      {S0,  {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "S^0",
                 OutputName -> "S0" }},
                 
      {ssi,  {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "si",
                 OutputName -> "si" }}              
      
      };
      
      
  ParticleDefinitions[EWSB] = {
            
      
     {hh   ,  {  Description -> "Higgs",
                 PDG -> {25,35},
                 Width -> Automatic, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 1,
                 LaTeX -> "h",
                 OutputName -> "h" }}, 
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0},
                 Width -> {0, External}, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 2,
                 LaTeX -> "A_h",
                 OutputName -> "Ah" }},                       
      
     {Hp,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 Width -> 0, 
                 Mass -> LesHouches,
                 FeynArtsNr -> 3,
                 LaTeX -> "H^+",
                 ElectricCharge->1,
                 OutputName -> "Hp"  }},      

      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah[{1}] }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWp,  { Description -> "W+ - Boson",
      			Goldstone -> Hp }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},
      (*NEW*)
      {VZp,    { Description -> "Z'-Boson",
      			 Goldstone -> Ah[{2}]}},  
      {gZp,    { Description -> "Z'-Ghost" }}, 
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" ,
          PDG ->{12,14,16}    }},
      
     {Ssc,   {  Description -> "Singlet",
               PDG -> {635,636},
               PDG.IX -> {-1010000003,-1010000004},
               Mass -> LesHouches,
               Width -> {0,0},
               FeynArtsNr -> 4,
               LaTeX -> "\\sigma",
               ElectricCharge -> 0,
               (*LHPC -> {"gold"},*)
               OutputName -> "Ssc" }},         
      
      {Fxe,  { PDG -> {210004},
               PDG.IX -> {-1111601},
               Mass -> LesHouches,
               Width -> Automatic,
               LaTeX -> "\\chi^{\\pm}",
               ElectricCharge -> -1,
               FeynArtsNr -> 5,
               OutputName -> "Cha" }},
      
      {Fxv,  {  PDG -> {210001,210002},
                PDG.IX ->{-2110001,-2110002},
                Mass -> LesHouches,
                Width -> Automatic,
                LaTeX -> "\\chi^{0}",
                ElectricCharge -> 0,
                FeynArtsNr -> 6,
                OutputName -> "Chi0" }}
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {phiH,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi^0_{H}",
                 OutputName -> "" }},
 
    {phiS,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi^0_{S}",
                 OutputName -> "" }},   
                 
    {ssi,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "si",
                 OutputName -> "" }},                 

   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,    {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,      {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},    
   {VL,     {LaTeX -> "V_L" }},
   
   {vr,     {LaTeX -> "\\nu_R" }},    
   {VR,     {LaTeX -> "V_R" }},
   
   {vr3,     {LaTeX -> "\\nu_R3" }},    
   {VR3,     {LaTeX -> "V_R3" }},
   
   (*{rd,     {LaTeX -> "rd" }},
   {ru,     {LaTeX -> "ru" }},*)
   {vd,     {LaTeX -> "V_d" }},
   {vu,     {LaTeX -> "V_u" }},
   {ed,     {LaTeX -> "e_d" }},
   {eu,     {LaTeX -> "e_u" }},
 
   {nL1,     {LaTeX -> "NL_1" }},
   {nR2,     {LaTeX -> "NR_2" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   
   {xVL,     {LaTeX -> "\\tilde{\\chi}_L",
              OutputName -> "xVL",
              Width -> 0, 
              Mass -> Automatic,
              PDG -> 0 }},
             
   {xVR,     {LaTeX -> "\\tilde{\\chi}_R",
              OutputName -> "xVR",
              Width -> 0, 
              Mass -> Automatic,
              PDG -> 0 }}
      
        };       


