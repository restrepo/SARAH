

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
      
                                       
      {Hm,  { Description -> "Charged Higgs"}},   
       {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah[{1}] }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson",
               Goldstone -> Hm[{1}] }},     
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
      {VZp,    { Description -> "Z'-Boson",
      			 Goldstone -> Ah[{2}]}},  
      {gZp,    { Description -> "Z'-Ghost" }},    
                               
                 
      {Fd,   { Description -> "Down-Quarks" }},   

{Fu,{ 
     Description -> "Up-Quarks", 
     FeynArtsNr -> 3, 
     LaTeX -> "u", 
     Mass -> {0.0015, 1.27, 171.2}, 
     OutputName -> "u", 
     PDG -> {2, 4, 6(*, 5000027, 5000028*)}, 
     ElectricCharge -> 2/3, 
     Width -> {0, 0, 1.51}}}, 
 
{FuV,{ 
     Description -> "Exotic-Up-Quarks", 
     FeynArtsNr -> 333, 
     LaTeX -> "u_V", 
     Mass -> {LesHouches}, 
     OutputName -> "uV", 
     PDG -> {5000027, 5000028}, 
     ElectricCharge -> 2/3}},  
      
      
      {Fe,   { Description -> "Leptons" }},
{Fv,{ 
     Description -> "Neutrinos", 
     FeynArtsNr -> 1, 
     LaTeX -> "\\nu", 
     Mass -> Automatic, 
     OutputName -> "nu", 
     PDG -> {12, 14, 16(*, 112, 114, 116, 5000035, 5000036*)}, 
     ElectricCharge -> 0, 
     Width -> Automatic}},
 {FvV,{ 
     Description -> "Exotic-Neutrinos", 
     FeynArtsNr -> 133, 
     LaTeX -> "\\nu_{V}", 
     Mass -> Automatic, 
     OutputName -> "nuV", 
     PDG -> {18}, 
     ElectricCharge -> 0, 
     Width -> Automatic}}    
     
     
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
   {vL,     {LaTeX -> "\\nu_{L}" }},
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


