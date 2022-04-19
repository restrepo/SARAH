
ParticleDefinitions[GaugeES] = {
      {H0,  { 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hp,  {   
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }},

      {et0, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\eta^0",
                 OutputName -> "et0" }},

      {etp, {    PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\eta^+",
                 OutputName -> "etp" }}, 
                 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
      };
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  {  Description -> "Higgs",
                 ElectricCharge->0,
                 PDG -> {25},
                 PDG.IX -> {101000001},
                 Mass -> Automatic  }}, 
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                    ElectricCharge->0,
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0} }},                       
          
    {Hp,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 LaTeX -> {"H^+","H^-"},
                 ElectricCharge -> 1,                 
                 OutputName -> {"Hp","Hm"}
      }},


       {etR,   {  Description -> "CP-even eta scalar", 
		 PDG -> {1001},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\\eta_R",
		 OutputName -> "etR" }}, 
         
      {etI,   {  Description -> "CP-odd eta scalar", 
		 PDG -> {1002},
		 Mass -> LesHouches,
		 ElectricCharge -> 0,
		 LaTeX -> "\\eta_I",
		 OutputName -> "etI" }}, 
         
      {etp,   {  Description -> "Charged eta scalar", 
		 PDG -> {1003},
		 Mass -> LesHouches,
		 ElectricCharge -> 1,
		 LaTeX -> "\\eta^+",
                 OutputName -> "etp" }}, 
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
      			 Goldstone -> Ah }}, 
      {VG,   { Description -> "Gluon" }},          
      {VWp,  { Description -> "W+ - Boson",
      			Goldstone -> Hp }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, 
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},          
                               
                 
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos" }},
      {Fre,  {   PDG -> {210000601},
                 PDG.IX -> {-111100601},
                 Mass -> LesHouches,
                 Width -> {0},
                 LaTeX -> "\\tilde{\\chi}^{\\pm}",
                 ElectricCharge -> -1,
                 OutputName -> "Fre" 
                }},
     {Nv0,  {      
                   
               	PDG -> {210000001,210000002,210000003},
	  	PDG.IX -> {220000001,220000002,220000003},
		Mass ->	LesHouches,
		Width -> 0,
                LaTeX -> "\\tilde{\\chi}^0",
                ElectricCharge -> 0,
		OutputName -> "Nv0"}}
                                            
        };    
        
                
 WeylFermionAndIndermediate = {
     
    {H,      { 
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},
    {Et,     {LaTeX -> "\\eta"}},
    {vL,     {LaTeX -> "\\nu_L" }},
    {VL,     {LaTeX -> "V_L" }},

   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,    {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,      {LaTeX -> "q" }},
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {FDR,     {LaTeX -> "D_R" }},
   {FER,     {LaTeX -> "E_R" }},
   {FUR,     {LaTeX -> "U_R" }},
   {FEL,     {LaTeX -> "E_L" }},
   {FDL,     {LaTeX -> "D_L" }},
   {FUL,     {LaTeX -> "U_L" }},
    {n,      {LaTeX -> "N" }},    
   {nR,     {LaTeX -> "N_R" }},
   {rd,     {LaTeX -> "R^d" }},
   {vd,     {LaTeX -> "R_v^d" }},
   {ed,     {LaTeX -> "R_e^d" }},
   {ru,     {LaTeX -> "R^u" }},
   {vu,     {LaTeX -> "R_v^u" }},
   {eu,     {LaTeX -> "R_e^u" }},
   {Rv0,    {LaTeX -> "\\tilde{\\chi}^0",
             OutputName -> "Rv0",
             PDG -> 0 }}

};       


