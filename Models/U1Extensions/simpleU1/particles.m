

ParticleDefinitions[GaugeES] = {
      {H0,  { 
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  { 
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 
                 
      {Hm,  { 
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^-",
                 OutputName -> "Hm" }},            
                 
      {si, {     PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 98,
                 LaTeX -> "si",
                 OutputName -> "SI" }},     
           
    
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
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0},
                 Width -> {0, External}, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 2,
                 LaTeX -> "A_h",
                 OutputName -> "Ah" }},                      
      
      
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
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {FXd,   { Description -> "exotic Down-Quarks",
                PDG -> {600001,600003},
                PDG.IX -> {1600001,1600003},
                LaTeX -> "x_d",
                ElectricCharge -> 2/3,
                FeynArtsNr -> {600001},
                OutputName -> "FXd" }},   
      {FXu,   { Description -> "exotic Up-Quarks",
                PDG -> {600002,600004},
                PDG.IX -> {1600002,1600004},
                LaTeX -> "x_u",
                ElectricCharge -> 5/3,
                FeynArtsNr -> {600002},
                OutputName -> "FXu" }},
                
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos"}}                                                              
     
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
                 LaTeX -> "si",
                 OutputName -> "" }},
                 
    {s2,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "s2",
                 OutputName -> "" }},
                              
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   {x1d,     {LaTeX -> "x1d" }},
   {x1u,     {LaTeX -> "x1u" }},
   {x2d,     {LaTeX -> "x2d" }},
   {x2u,     {LaTeX -> "x2u" }},
   {x1dC,     {LaTeX -> "x1dC" }},
   {x1uC,     {LaTeX -> "x1uC" }},
   {x2dC,     {LaTeX -> "x2dC" }},
   {x2uC,     {LaTeX -> "x2uC" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {DXL,     {LaTeX -> "DX_L" }},
   {UXL,     {LaTeX -> "UX_L" }}
        };       


