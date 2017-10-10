(* ::Package:: *)

ParticleDefinitions[GaugeES] = {
{hL0,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},   
                 
     {hR0,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 2,
                 LaTeX -> "H_R^0",
                 OutputName -> "HR0" }},             
      

     {hLm,     { Description -> "Charged Higgs", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> -1,
		FeynArtsNr -> {500},
		LaTeX -> {"H^-","H^+"},
		OutputName -> {"Hm","Hp"}
                 }},        
                
     {hRm,     { Description -> "right-Charged Higgs", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> -1,
		FeynArtsNr -> {501},
		LaTeX -> {"H_R^-","H_R^+"},
		OutputName -> {"HRm","HRp"}
                 }},              
                 
                 
      {s0,     {Description -> "singlet", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> 0,
		FeynArtsNr -> {502},
		LaTeX -> {"S"},
		OutputName -> "S"
                 }},             
            
    
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWL,  { Description -> "W-Bosons"}},
      {VWR,  { (*Description -> "W-Bosons",*)
	       FeynArtsNr -> 20,
	       LaTeX -> "W_R",
	       OutputName -> "WR"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWL,  { Description -> "W-Boson Ghost"}},
      {gWR,  { (*Description -> "W-Boson Ghost",*)
	       FeynArtsNr -> 3,
	       LaTeX -> "\\eta^{WR}",
               OutputName -> "gWR"}},
      
      
      {Fu1,  {    Description -> "Dirac Left Up-Quark",
                  LaTeX -> "u^1",
                  PDG -> {2,4,6},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 110,
                  OutputName -> "u1"}},
  
      {Fu2,  {    Description -> "Dirac Right Up-Quark",
                  LaTeX -> "u^2",
                  PDG ->{0,0,0},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 111,
                  OutputName -> "u2"}},

      {Fd1,  {    Description -> "Dirac Left Down-Quark",
                  LaTeX -> "d^1",
                  PDG -> {1,3,5},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 120,
                  OutputName -> "d1" }},  

      {Fd2,  {    Description -> "Dirac Right Down-Quark",
                  LaTeX -> "d^2",
                  PDG ->{0,0,0},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 121,
                  OutputName -> "d2" }},
  
      {Fe1,  {    Description -> "Dirac Left Electron" ,
                  LaTeX -> "e^1",
                  PDG -> {11,13,15},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 130,
                  OutputName -> "e1"}},  

      {Fe2,  {    Description -> "Dirac Right Electron",
                  LaTeX -> "e^2",
                  PDG -> {0,0,0},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 131,
                  OutputName -> "e2" }},  

      {Fv1,   {   Description -> "Dirac Left Neutrino",
                  LaTeX -> "\\nu^1",
                  PDG -> {12,14,16},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 140,
                  OutputName -> "v1" }},

      {Fv2,   {   Description -> "Dirac Right Neutrino",
                  LaTeX -> "\\nu^2",
                  PDG -> {0,0,0},
                  Width -> {0, 0, 0}, 
                  FeynArtsNr -> 141,
                  OutputName -> "v2" }}
                  
                  

      };
      
      
      
      
  ParticleDefinitions[EWSB] = {
            
     {hh   ,  {  Description -> "Higgs",
		PDG -> {25,35,45},
		PDG.IX -> {101000001,101000002,101000003},
		OutputName -> "hh",
                LaTeX -> "h" }}, 
                 
                 
                 (*
     {sigmaL   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0},
                 OutputName -> "sigmaL"}},      
                 
                 *)
                 
     {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0},
                 PDG.IX ->{0,0},
                 Mass -> {0,0},
                 Width -> {0,0} }},  
                 
      {Hpm,     { Description -> "Charged Higgs", 
                 PDG -> {0,0},
                 PDG.IX ->{0,0},
                 Width -> {0,0}, 
                 Mass -> {0,0},
                 LaTeX -> {"H^-","H^+"},
                 ElectricCharge -> -1,
                 OutputName -> {"Hm","Hp"}    
                 }},       
      
      
      (*
      
     {hLm,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 ElectricCharge -> -1,
                 LaTeX -> {"H^-","H^+"},
                 OutputName -> {"Hm","Hp"}
                 }},    

     {sigmaR   ,  {  Description -> "Right-pseudo-Scalar Higgs",
                 PDG -> {0},
                 PDG.IX ->{0},
                 Mass -> {0},
                 Width -> {0},
                 FeynArtsNr -> {1001},
                 ElectricCharge -> 0,
                 OutputName -> "sigmaR"}},                       
      
      
     {hRm,     { Description -> "Right-Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 FeynArtsNr -> {501},
                 ElectricCharge -> -1,
                 LaTeX -> {"H_R^-","H_R^+"},
                 OutputName -> {"HRm","HRp"}
                 }},  
                 
                 
      *)
     
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
	       Goldstone -> Ah[{1}] }},
	       
          	       
	       
	       
      {VZR,  { (*RParity -> 1,*)  
               Description -> "Z'-Boson",
	       Goldstone -> Ah[{2}],
	       PDG -> {32} }},    

      {VG,   { Description -> "Gluon" }},          
      {VWLm,  { Description -> "W-Boson",
	       Goldstone -> Hpm[{1}],
	       OutputName -> {"WLm","WLp"}}},
      {VWRm, { (*RParity -> 1,*)
               Mass -> LesHouches,
	       PDG -> {34},
	       FeynArtsNr -> 20,
	       ElectricCharge -> -1,
	       LaTeX -> {"W_R^-","W_R^+"},
	       Goldstone -> Hpm[{2}],
	       OutputName -> {"WRm","WRp"} }},    

   (*   {gP,   { Description -> "Photon Ghost"}},         *)  
      
      
      {gP,    { (*RParity -> 1,*)  
                 PDG -> 0,
                 ElectricCharge -> 0,
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 1,
                 LaTeX -> "\\eta^P",
                 OutputName -> "gP" }}, 
                 
   (*   {gWp,  { Description -> "Positive W+ - Boson Ghost"}}, 
      {gWpC, { Description -> "Negative W+ - Boson Ghost" }}, *)
      
     {gWLm,    {Description -> "Negative W-Boson Ghost",
                 Mass -> Mass[VWLm],
                 (*
                 (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 FeynArtsNr -> 82,*)
                 LaTeX -> "\\eta_L^-",
                 OutputName -> "gWLm" }},

      {gWLmC,    {Description -> "Positive W-Boson Ghost", 
                 Mass -> Mass[VWLm],
                 (*
                 (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 FeynArtsNr -> 92,*)
                 LaTeX -> "\\eta_L^+",
                 OutputName -> "gWLp" }},
      
      
      {gWRmC, { Description -> "Positive W'-Boson Ghost",
               (*RParity -> 1,*)  
               PDG -> 0,
	       Width -> 0, 
	       Mass -> Mass[VWRm],
	       FeynArtsNr -> 83,
	       ElectricCharge -> 1,
	       LaTeX -> "\\eta_R^+",
	       OutputName -> "gWRp" }}, 
                 
      {gWRm,{ Description -> "Negative W'-Boson Ghost",
               (*RParity -> 1,*)  
               PDG -> 0,
	       Width -> 0, 
	       Mass -> Mass[VWRm],
	       FeynArtsNr -> 93,
	       ElectricCharge -> -1,
	       LaTeX -> "\\eta_R^-",
	       OutputName -> "gWRm" }},

   (*   {gZ,   { Description -> "Z-Boson Ghost" }}, *)
      
      
      {gZ,    {  Description -> "Z-Boson Ghost"(*,
                 (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 FeynArtsNr -> 2,
                 LaTeX -> "\\eta^Z",
                 OutputName -> "gZ" *)}},  
      
      
      {gZR,  { Description -> "Z'-Ghost",
	       Mass -> Mass[VZR]}},

      {gG,   { Description -> "Gluon Ghost" }},          
                               
                 
      {Fd,   { Description -> "Down-Quarks", 
               ElectricCharge -> -1/3, 
               PDG->{1,3,5,6000001,6000003,6000005}, 
               PDG.IX->{-110890201,-110890202,-110890203,-210890201,-210890202,-210890203},
               Mass -> {0.0035, 0.104, 4.2, LesHouches, LesHouches, LesHouches}, 
               Width -> {0, 0, 0, External, External, External}
               }},   
      {Fu,   { Description -> "Up-Quarks", 
               ElectricCharge -> 2/3, 
               PDG->{2,4,6,6000002,6000004,6000006}, 
               PDG.IX->{110100401,110100402,110100403,210100401,210100402,210100403},
               Mass -> {0.0035, 0.104, 4.2, LesHouches, LesHouches, LesHouches},
               Width -> {0, 0, 0, External, External, External}               
               }},   
      {Fe,   { Description -> "Leptons", 
               ElectricCharge -> 1, 
               PDG->{11,13,15,6000011,6000013,6000015}, 
               PDG.IX -> {110000601,110000602,110000603,210000601,210000602,210000603},
               Mass -> {0.000511, 0.105, 1.776, LesHouches, LesHouches, LesHouches}, 
               Width -> {0, 0, 0, External, External, External}
               }},
      {Fv,   { Description -> "Neutrinos",
	       LaTeX -> "\\nu",
	       OutputName -> "nu",
	       PDG -> {12,14,16,6000012,6000014,6000016,7000012,7000014,7000016,8000012,8000014,8000016},
	       PDG.IX ->{990000001,990000002,990000003,990000004,990000005,990000006,990000007,990000008,990000009,990000010,990000011,990000012},
                 Width -> {External,External,External,External,External,External}, 
                 Mass -> {LesHouches,LesHouches,LesHouches,LesHouches,LesHouches,LesHouches}
                 }}
        };    
        
        
        
 WeylFermionAndIndermediate = {
     

   {phiHL,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{HL}",
                 OutputName -> "" }},
                 
   {phiHR,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{HR}",
                 OutputName -> "" }},              

   {phiS,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{S}",
                 OutputName -> "" }},                   
                 
                 
   {AhL,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{HL}",
                 OutputName -> "" }},
                 
   {AhR,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{HR}",
                 OutputName -> "" }}, 
          

   {dR,     {LaTeX -> "d_R" }},
   {eR,     {LaTeX -> "e_R" }},
   {lep,     {LaTeX -> "l" }},
   {uR,     {LaTeX -> "u_R" }},
   {q,     {LaTeX -> "q" }},
   {l,     {LaTeX -> "l" }},
   {qR,     {LaTeX -> "q_R" }},
   {lR,     {LaTeX -> "l_R" }},  
   {eL,     {LaTeX -> "e_L" }},
   {dL,     {LaTeX -> "d_L" }},
   {uL,     {LaTeX -> "u_L" }},
   {nuL,     {LaTeX -> "\\nu_L" }},
   {nuR,    { (*RParity -> 1,*)  
             PDG -> 0,
             Width -> 0, 
             Mass -> Automatic,
             LaTeX -> "\\nu_R",
             OutputName -> "" }},
   {Fv0,  { (*RParity -> 1,*)
            (*PDG -> {0, 0, 0, 0, 0, 0, },*)
            LaTeX -> "\\nu_0",
            OutputName -> "Fv0"}},
   {DR,     {LaTeX -> "D_R" }},
   {ER,     {LaTeX -> "E_R" }},
   {UR,     {LaTeX -> "U_R" }},
   {EL,     {LaTeX -> "E_L" }},
   {DL,     {LaTeX -> "D_L" }},
   {UL,     {LaTeX -> "U_L" }}
        };       


