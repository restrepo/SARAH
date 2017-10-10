

ParticleDefinitions[GaugeES] = {
      {H0,  {   PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      
      {Hm,  {    PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H^-",
                 OutputName -> "Hm" }}, 
                 
               
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}}
      
      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
      
    {hh   ,  { Description -> "Higgs",
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
      
      
     {Hm,     {   Description -> "Charged Higgs", 
                 PDG -> {0},
                 Width -> 0, 
                 Mass ->LesHouches,
                 FeynArtsNr -> 3,
                 LaTeX -> "H^-",
                 OutputName -> "Hm" }},                                                   
    
     {Fs,     {   Description -> "s neutrino", 
		   PDG -> {99198,99199,99197},
                   FeynArtsNr -> 20,                  
		   LaTeX -> "S_1",
                   ElectricCharge -> 0,
                 OutputName -> "S1" }},                                                   
    
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
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos",
	       PDG ->{12,14,16,8810012,8810014,8810016,9910012,9910014,9910016} }}                                                                             
   };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }}

        };       


