

ParticleDefinitions[GaugeES] = {
      {H0,  {    PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hm,  {    PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^-",
                 OutputName -> "Hm" }}, 
                 
      {si, {     PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 98,
                 LaTeX -> "s",
                 OutputName -> "si" }},     
       
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},
      {gWB,  { Description -> "W-Boson Ghost"}},
      {VBp,  { Description -> "B'-Boson"}},
      {gBp,  { Description -> "B'-Boson Ghost"}}      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  { Description -> "Higgs",
                 PDG -> {25,35},
                 Width -> Automatic, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 1,
                 LaTeX -> "h",
                 OutputName -> "hh" }}, 
                 
 
 
 {Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "Ah", 
     Mass -> {0, 0}, 
     OutputName -> "Ah", 
     PDG -> {0, 0}, 
     ElectricCharge -> 0, 
     Width -> {0, 0}}}, 
 
 (*
                 
     {sigmaH   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 Width -> {0}, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 2,
                 LaTeX -> "\\sigma_H",
                 OutputName -> "sigmaH" }},     
                 
                 
     {sigmaS   ,  {  Description -> "Pseudo-Scalar X-Higgs",
                 PDG -> {0},
                 Width -> {0}, 
                 Mass ->LesHouches,
                 ElectricCharge -> 0,
                 FeynArtsNr -> 2001,
                 LaTeX -> "\\sigma_S",
                 OutputName -> "sigmaS" }},              *)
      
      
     {Hm,     {   Description -> "Charged Higgs", 
                 PDG -> {0},
                 Width -> 0, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 3,
                 LaTeX -> "H^-",
                 OutputName -> "Hm" }},                                              
      
       {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah[{1}] }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson",
                Goldstone->Hm }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
      {VZp,    { Description -> "Z'-Boson",
      			 Goldstone -> Ah[{2}]}},  
      {gZp,    { Description -> "Z'-Ghost" }},    
                               
                 
      {Fd,   { Description -> "Down-Quarks" }},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos", PDG ->{12,14,16,60000012,60000014,60000016}}},
      
      
      {Fx1,   { Description -> "exotic Quarks-1",
                ElectricCharge -> 2,    (* CAUTION: this charge is specific to a= 3/2 ! adjust to your needs!  *)
                PDG -> {101,103},               
                 PDG.IX->{-210890201,-210890202},
                 LaTeX -> "x_1",
                 FeynArtsNr -> 7,
                 OutputName -> "x1" 
                }},   
      {Fx2,   { Description -> "exotic Quarks-2",
                ElectricCharge -> 1,    (* CAUTION: this charge is specific to a= 3/2 ! adjust to your needs!  *)
                PDG -> {102,104},
                PDG.IX->{210100401,210100402},
                LaTeX -> "x_2",
                FeynArtsNr -> 9,
                OutputName -> "x2" 
                }}
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},
                 
    {SI,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "SI",
                 OutputName -> "" }},
                 
   
                 
   {sigmaH, {LaTeX -> "\\sigma_H"}},              
   {sigmaS, {LaTeX -> "\\sigma_S"}},
   {phiH, {LaTeX -> "\\phi_H"}},
   {phiS, {LaTeX -> "\\phi_S"}},

                              
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   {x1L,     {LaTeX -> "x_{1L}" }},
   {x1R,     {LaTeX -> "x_{1R}" }},
   {y1L,     {LaTeX -> "y_{1L}" }},
   {y1R,     {LaTeX -> "y_{1R}" }},
   
   {x2L,     {LaTeX -> "x_{2L}" }},
   {x2R,     {LaTeX -> "x_{2R}" }},
   {y2L,     {LaTeX -> "y_{2L}" }},
   {y2R,     {LaTeX -> "y_{2R}" }},   

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {X1L,     {LaTeX -> "X1_L" }},
   {X2L,     {LaTeX -> "X2_L" }},
   {X1R,     {LaTeX -> "X1_R" }},
   {X2R,     {LaTeX -> "X2_R" }},
   {VL,     {LaTeX -> "V_L" }}
        };       


