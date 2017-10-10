(* ::Package:: *)

ParticleDefinitions[GaugeES] = {
{hL0,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "HL^0",
                 OutputName -> "HL0" }},                         
      
      {hR0,{    (*Description -> "Neutral Up-Higgs",*)
                 PDG -> {0},
		 PDG.IX -> {0},
                 Mass -> Automatic,
              (* FeynArtsNr -> 21,*)
                 FeynArtsNr -> 301,
                 LaTeX -> "{HR}^0",
                 OutputName -> "HR0" }},

     {hLm,     { Description -> "Charged Left Higgs", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> -1,
		FeynArtsNr -> {500},
		LaTeX -> {"HL^-","H^+"},
		OutputName -> {"HLm","HLp"}
                 }},                                
                  
     {hRm,     { Description -> "Charged Right Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 ElectricCharge -> -1,
		 FeynArtsNr -> {4},
                 LaTeX -> {"HR^-","HR^+"},
                 OutputName -> {"HRm","HRp"}
                 }},     

     {deltaRpp,     { Description -> "RH Doubly-Charged Higgs", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> 2,
		FeynArtsNr -> {5052},
		LaTeX -> {"HR^{++}","HR^{--}"},
		OutputName -> {"HRpp","HRmm"}
                 }},  

     {deltaLpp,     { Description -> "LH Doubly-Charged Higgs", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> 2,
		FeynArtsNr -> {5053},
		LaTeX -> {"HL^{++}","HL^{--}"},
		OutputName -> {"HLpp","HLmm"}
                 }},                                                         

    {deltaR0,{(*RParity -> 1,*)  
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 ElectricCharge -> 0,
		 FeynArtsNr -> {501},
                 LaTeX -> "\\Delta_{1R0}",
                 OutputName -> "dlt1R0" }},  

     {deltaL0,{(*RParity -> 1,*)  
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 ElectricCharge -> 0,
		 FeynArtsNr -> {511},
                 LaTeX -> "\\Delta_{1L0}",
                 OutputName -> "dlt1L0" }},                   

      {deltaRp,{(*RParity -> 1,*)  
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 ElectricCharge -> 1,
		 FeynArtsNr -> {502},
                 LaTeX -> {"\\Delta_{R}^+","\\Delta_{R}^-"},
                 OutputName -> {"dlt1Rp","dlt1Rm"} }},    

      {deltaLp,{(*RParity -> 1,*)  
                 PDG -> {0},
                 Width -> {0}, 
                 Mass -> Automatic,
                 ElectricCharge -> 1,
		 FeynArtsNr -> {512},
                 LaTeX -> {"\\Delta_{L}^+","\\Delta_{L}^-"},
                 OutputName -> {"dlt1Lp", "dlt1Lm"} }},                
                 
      {sU,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 99991,
                 LaTeX -> "sU",
                 OutputName -> "sU" }},             
      {sD,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 99992,
                 LaTeX -> "sD",
                 OutputName -> "sD" }},            
      {sE,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 99993,
                 LaTeX -> "sE",
                 OutputName -> "sE" }},             
                 
    
      {VBL,   { Description -> "BL-Boson",
               FeynArtsNr -> 201,
	       LaTeX -> "B_L",
	       OutputName -> "BL"}},    
      {VBR,   { Description -> "BR-Boson",
               FeynArtsNr -> 202,
	       LaTeX -> "B_R",
	       OutputName -> "BR"}}, 
      {VG,   { Description -> "Gluon"}},          
      {VWL,  { Description -> "W-Bosons"}},
      {VWR,  { (*Description -> "W-Bosons",*)
	       FeynArtsNr -> 20,
	       LaTeX -> "W_R",
	       OutputName -> "WR"}},          
      {gBL,   { Description -> "BL-Boson Ghost",
                FeynArtsNr -> 301,
	       LaTeX -> "\\eta^{BL}",
               OutputName -> "gBL"}},    
      {gBR,   { Description -> "BR-Boson Ghost",
                FeynArtsNr -> 302,
	       LaTeX -> "\\eta^{BR}",
               OutputName -> "gBR"}}, 
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
            
{hh,{ 
     Description -> "Higgs", 
     FeynArtsNr -> 1, 
     LaTeX -> "h", 
     Mass -> LesHouches, 
     OutputName -> "hh", 
     PDG -> {25, 35, 335, 6000029, 6000030, 6000031, 6000032}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> Automatic}}, 
                 
{Ah,{ 
     Description -> "Pseudo-Scalar Higgs", 
     FeynArtsNr -> 2, 
     LaTeX -> "A^0", 
     Mass -> {0, 0, LesHouches, LesHouches, LesHouches, LesHouches, LesHouches}, 
     OutputName -> "Ah", 
     PDG -> {0, 0, 36, 6000021, 6000022, 6000023, 6000024}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> 0, 
     Width -> {0, 0, External, External, External, External, External}}}, 

{Hpm,{ 
     Description -> "Charged Higgs", 
     FeynArtsNr -> {0, 0, 3, 3003}, 
     LaTeX -> {"H^-","H^+"}, 
     Mass -> {0, 0, LesHouches, LesHouches}, 
     OutputName -> {"Hm","Hp"}, 
     PDG -> {0, 0, -37, -6000034}   (* adjusted number of PDGs to number of generations  *), 
     ElectricCharge -> -1, 
     Width -> {0, 0, External, External}}}, 

      
     {Hppmm, {OutputName -> {"Hmm","Hpp"}, 
	       PDG -> {-9000055,-9000065},
	       FeynArtsNr -> {2337,3447},
	       ElectricCharge -> -2,
	       LaTeX -> {"\\delta^{c--}","\\delta^{c++}"}}},
	       
     
      
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson",
	       Goldstone -> Ah[{1}] }},
	       
          	       
	       
	       
      {VZ1p,  { (*RParity -> 1,*)  
               Description -> "Z'-Boson",
	       Goldstone -> Ah[{2}],
	       PDG -> {32} }},   
	       
	
	       
	       
{VZ2p,{ 
     Description -> "Z''-Boson", 
     Goldstone -> Ah[{3}], 
     FeynArtsNr -> 1100,
     LaTeX -> "Z2p"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "vz2p"   (* auto generated Output name *), 
     PDG -> {10032}, 
     ElectricCharge -> 0,
     Width -> Automatic}}, 

	       
	       
	       
	       

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


      {gP,    { (*RParity -> 1,*)  
                 PDG -> 0,
                 ElectricCharge -> 0,
                 Width -> 0, 
                 Mass -> 0,
                 FeynArtsNr -> 1,
                 LaTeX -> "\\eta^P",
                 OutputName -> "gP" }}, 

      
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

      
      
      {gZ,    {  Description -> "Z-Boson Ghost"(*,
                 (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 FeynArtsNr -> 2,
                 LaTeX -> "\\eta^Z",
                 OutputName -> "gZ" *)}},  
      
      
      {gZ1p,  { Description -> "Z'-Ghost",
	       Mass -> Mass[VZ1p],
	       OutputName -> "gZ1p"}},
	       
      {gZ2p,  { Description -> "Z''-Ghost",
                PDG -> 0,
                PDG.IX -> 0,
                Width -> 0, 
                Mass -> Automatic,
                FeynArtsNr -> 1000,
                LaTeX -> "\\eta^{Z''}",
                ElectricCharge -> 0,
                OutputName -> "gZ2p",
	        Mass -> Mass[VZ2p]}},	       


	       
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
               ElectricCharge -> -1, 
               PDG->{11,13,15,6000011,6000013,6000015}, 
               PDG.IX -> {-110000601,-110000602,-110000603,-210000601,-210000602,-210000603},
               Mass -> {0.000511, 0.105, 1.776, LesHouches, LesHouches, LesHouches}, 
               Width -> {0, 0, 0, External, External, External}
               }},
      {Fv,   { Description -> "Neutrinos",
	       LaTeX -> "\\nu",
	       OutputName -> "nu",
	       PDG -> {12,14,16,6000012,6000014,6000016},
	       PDG.IX ->{990000001,990000002,990000003,990000004,990000005,990000006},
                 Width -> {External,External,External,External,External,External}, 
                 Mass -> {LesHouches,LesHouches,LesHouches,LesHouches,LesHouches,LesHouches}
                 }}
        };    
        
        
        
 WeylFermionAndIndermediate = {
     

   {deltaR, {LaTeX -> "\\hat{\\Delta}^c"}},
   {Hp,        { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 322,
                 LaTeX -> "H^+",
                 OutputName -> "Hp" }}, 
   {Hm,       {(*Description -> "Charged Down-Higgs",*)
                 PDG -> {0},
		 PDG.IX -> {0},
		 Mass -> Automatic,
                 (* FeynArtsNr -> 23,*)
		 FeynArtsNr -> 302,
		 LaTeX -> "H_1^-",
		 OutputName -> "Hm" }},
(*   {sigmaR0,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{R0}",
                 OutputName -> "" }},
   {phiR0,    { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{R0}",
                 OutputName -> "" }},
                 
   {sigmaL0,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{L0}",
                 OutputName -> "" }},
   {phiL0,    { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{L0}",
                 OutputName -> "" }},          *)    

{sigmaHL,{ 
     LaTeX -> "{\\sigma}_{hl}"   (* auto generated LaTeX name *)}}, 

{phiHL,{ 
     LaTeX -> "{\\phi}_{hl}"   (* auto generated LaTeX name *)}}, 

{sigmaHR,{ 
     LaTeX -> "{\\sigma}_{hr}"   (* auto generated LaTeX name *)}}, 

{phiHR,{ 
     LaTeX -> "{\\phi}_{hr}"   (* auto generated LaTeX name *)}}, 

{sigmadL,{ 
     LaTeX -> "{\\sigma}_{dl}"   (* auto generated LaTeX name *)}}, 

{phidL,{ 
     LaTeX -> "{\\phi}_{dl}"   (* auto generated LaTeX name *)}}, 

{sigmadR,{ 
     LaTeX -> "{\\sigma}_{dr}"   (* auto generated LaTeX name *)}}, 

{phidR,{ 
     LaTeX -> "{\\phi}_{dr}"   (* auto generated LaTeX name *)}}, 

{sigmaSU,{ 
     LaTeX -> "{\\sigma}_{su}"   (* auto generated LaTeX name *)}}, 

{phiSU,{ 
     LaTeX -> "{\\phi}_{su}"   (* auto generated LaTeX name *)}}, 

{sigmaSD,{ 
     LaTeX -> "{\\sigma}_{sd}"   (* auto generated LaTeX name *)}}, 

{phiSD,{ 
     LaTeX -> "{\\phi}_{sd}"   (* auto generated LaTeX name *)}}, 

{sigmaSE,{ 
     LaTeX -> "{\\sigma}_{se}"   (* auto generated LaTeX name *)}}, 

{phiSE,{ 
     LaTeX -> "{\\phi}_{se}"   (* auto generated LaTeX name *)}},           
                 
                 
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
   
   {uVL,{ 
     LaTeX -> "uvl"   (* auto generated LaTeX name *)}}, 

{uVR,{ 
     LaTeX -> "uvr"   (* auto generated LaTeX name *)}}, 
     
   {dVL,{ 
     FeynArtsNr -> {9001},
     LaTeX -> "dvl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dvl"   (* auto generated Output name *), 
     PDG -> {39, 40, 41}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{dVR,{ FeynArtsNr -> {9002},
      LaTeX -> "dvr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "dvr"   (* auto generated Output name *), 
     PDG -> {45, 46, 47}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eVL,{ FeynArtsNr -> {9003},
     LaTeX -> "evl"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "evl"   (* auto generated Output name *), 
     PDG -> {51, 52, 53}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 

{eVR,{FeynArtsNr -> {9004},
     LaTeX -> "evr"   (* auto generated LaTeX name *), 
     Mass -> LesHouches, 
     OutputName -> "evr"   (* auto generated Output name *), 
     PDG -> {57, 58, 59}   (* auto generated PDGs  *), 
     Width -> Automatic}}, 
   
   
   
   
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
   {UL,     {LaTeX -> "U_L" }},
   {TPL,     {LaTeX -> "TP_L" }},
   {TMR,     {LaTeX -> "TM_R" }},
   {Ft0,     {LaTeX -> "T_0" }}
        };       


