

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
                 
      {chi2, {     PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 98,
                 LaTeX -> "\\chi_2",
                 OutputName -> "chi2" }},     
                 
      {chi3, {     PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 99,
                 LaTeX -> "\\chi_3",
                 OutputName -> "chi3" }},    
                 
      {chi6, {     PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 100,
                 LaTeX -> "\\chi_6",
                 OutputName -> "chi6" }},           
    
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
                 PDG -> {25,35,45,55},
                 Width -> Automatic, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 1,
                 LaTeX -> "h",
                 OutputName -> "hh" }}, 
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0,36,46},
                 Width -> {0, 0, External, External}, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 2,
                 LaTeX -> "A_h",
                 OutputName -> "Ah" }},                      
      
      
     {Hm,     {   Description -> "Charged Higgs", 
                 PDG -> {0},
                 Width -> 0, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 3,
                 LaTeX -> {"H^-","H^+"},
                 OutputName -> {"Hm","Hp"} }},                                              
      
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
      {Fu,   { Description -> "Up-Quarks",
               PDG->{2,4,6,8}, PDG.IX->{110100401,110100402,110100403,110100404}}},   
      {FuV,   { Description -> "vectorlike Up-Quarks",
                ElectricCharge -> -2/3,
                PDG -> {102},
                PDG.IX->{-210100401},
                FeynArtsNr -> 9,
                OutputName -> "uV",
                LaTeX -> "FuV"
                }},         
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos", PDG ->{12,14,16,60000012,60000014,60000016,80000012,80000014,80000016,90000012,90000014,90000016}}}                                                              
     
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},
                 
    {Chi2,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "Chi2",
                 OutputName -> "" }},
                 
    {Chi3,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "Chi3",
                 OutputName -> "" }},
                 
    {Chi6,      {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "Chi6",
                 OutputName -> "" }},      
                 
   {sigmaH, {LaTeX -> "\\sigma_H"}},              
   {sigma2, {LaTeX -> "\\sigma_2"}},
   {sigma3, {LaTeX -> "\\sigma_3"}},
   {sigma6, {LaTeX -> "\\sigma_6"}},
   {phiH, {LaTeX -> "\\phi_H"}},
   {phi2, {LaTeX -> "\\phi_2"}},
   {phi3, {LaTeX -> "\\phi_3"}},              
   {phi6, {LaTeX -> "\\phi_6"}},              
                              
   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {vL,     {LaTeX -> "\\nu_L" }},
   {xL,     {LaTeX -> "x_L" }},
   {xR,     {LaTeX -> "x_R" }},
   {yL,     {LaTeX -> "y_L" }},
   {yR,     {LaTeX -> "y_R" }},

   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }},
   {VL,     {LaTeX -> "V_L" }}
        };       


