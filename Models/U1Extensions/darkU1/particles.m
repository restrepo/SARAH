

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
            
      
    {hh,  { Description -> "Higgs",
                 PDG -> {25,35,45},
                 PDG.IX -> {101000001,101000002,101000003},
                 Width -> {Automatic}, 
                 Mass -> {LesHouches}(*,
                 FeynArtsNr -> {1},
                 LaTeX -> "h",
                 OutputName -> "h" *)}}, 
                 
    {Ah,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0,36},
                 Width -> {0, 0, External}, 
                 Mass ->{0,0,LesHouches},
                 FeynArtsNr -> {2},
                 LaTeX -> "A_h",
                 OutputName -> "Ah"}},

      
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
                               
                 
{Fd,{ 
     Description -> "Down-Quarks", 
     FeynArtsNr -> 4, 
     LaTeX -> "d", 
     Mass -> {0.0035, 0.104, 4.2}, 
     OutputName -> "d", 
     PDG -> {1, 3, 5, 5000018, 5000019, 5000020}, 
     ElectricCharge -> -1/3, 
     Width -> {0, 0, 0}}}, 

{Fe,{ 
     Description -> "Leptons", 
     FeynArtsNr -> 2, 
     LaTeX -> "e", 
     Mass -> {0.000511, 0.105, 1.776}, 
     OutputName -> "e", 
     PDG -> {11, 13, 15, 5000022, 5000023, 5000024}, 
     ElectricCharge -> -1, 
     Width -> {0, 0, 0}}}, 

{Fu,{ 
     Description -> "Up-Quarks", 
     FeynArtsNr -> 3, 
     LaTeX -> "u", 
     Mass -> {0.0015, 1.27, 171.2}, 
     OutputName -> "u", 
     PDG -> {2, 4, 6, 5000027, 5000028, 5000029}, 
     ElectricCharge -> 2/3, 
     Width -> {0, 0, 1.51}}}, 

{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> Automatic, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16, 112, 114, 116, 5000035, 5000036, 5000037, 5000038, 5000039, 5000040}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},
                 

                 
   
                 
   {sigmaH, {LaTeX -> "\\sigma_H"}},              
   {sigmaP, {LaTeX -> "\\sigma_P"}},
   {sigmaX, {LaTeX -> "\\sigma_X"}},
   {phiH, {LaTeX -> "\\phi_H"}},
   {phiP, {LaTeX -> "\\phi_P"}},
   {phiX, {LaTeX -> "\\phi_X"}},
                              
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   {dXL,     {LaTeX -> "d_{XL}" }},
   {uXL,     {LaTeX -> "u_{XL}" }},
   {eXL,     {LaTeX -> "e_{XL}" }},
   {vXL,     {LaTeX -> "\\nu_{XL}" }},
   
   {dXR,     {LaTeX -> "d_{XR}" }},
   {uXR,     {LaTeX -> "u_{XR}" }},
   {eXR,     {LaTeX -> "e_{XR}" }},
   {vXR,     {LaTeX -> "\\nu_{XR}" }},   

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {VL,     {LaTeX -> "V_L" }}
        };       


