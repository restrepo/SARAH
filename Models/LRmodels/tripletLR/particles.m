(* ::Package:: *)

ParticleDefinitions[GaugeES] = {
{H0,  { PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "H^0",
                 OutputName -> "H0" }},                         
      
      {HPrime0,{    (*Description -> "Neutral Up-Higgs",*)
                 PDG -> {0},
		 PDG.IX -> {0},
                 Mass -> Automatic,
              (* FeynArtsNr -> 21,*)
                 FeynArtsNr -> 301,
                 LaTeX -> "{H'}^0",
                 OutputName -> "Hp0" }},

     {Hp,     { Description -> "Charged Higgs", 
                PDG -> {0},
		PDG.IX ->{0},
		Width -> {0}, 
		Mass -> {0},
		ElectricCharge -> 1,
		FeynArtsNr -> {500},
		LaTeX -> {"H^+","H^-"},
		OutputName -> {"Hp","Hm"}
                 }},                                
                  
     {Hm,     { Description -> "Charged Higgs", 
                 PDG -> {0},
                 PDG.IX ->{0},
                 Width -> {0}, 
                 Mass -> {0},
                 ElectricCharge -> -1,
		 FeynArtsNr -> {4},
                 LaTeX -> {"H_1^-","H_1^+"},
                 OutputName -> {"Hm","Hp"}
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
		PDG -> {25,35,335},
		PDG.IX -> {101000001,101000002,101000003},
		OutputName -> "hh",
                LaTeX -> "h" }}, 
                 
    {Ah   ,  {  Description -> "Pseudo-Scalar Higgs",
                 PDG -> {0,0,36},
		PDG.IX ->{0,0,101000011},
		Mass -> {0,0,LesHouches},
                Width -> {0,0,External} }},

    {Hpm,    {Description -> "Charged Higgs",
             OutputName -> {"Hm","Hp"}, 
             (*RParity -> 1,*) 
             LaTeX -> {"H^-", "H^+"}, 
             ElectricCharge -> -1,
             PDG -> {0, 0,-37},
             PDG.IX -> {0, 0,-100000601},
             FeynArtsNr -> {0, 0, 3},
             Width -> {0, 0,External}, 
	      Mass -> {0, 0,LesHouches} }},

      
     (* {Hppmm, {OutputName -> {"Hmm","Hpp"}, 
	       PDG -> {-9000055,-9000065},
	       FeynArtsNr -> {2337,3447},
	       ElectricCharge -> -2,
	       LaTeX -> {"\\delta^{c--}","\\delta^{c++}"}}},*)
	       
      {deltaRpp, {OutputName -> {"Hmm","Hpp"}, 
	       PDG -> {9000055},
	       FeynArtsNr -> {2337},
	       ElectricCharge -> 2,
	       Mass -> {LesHouches},
	       LaTeX -> {"\\delta^{c--}","\\delta^{c++}"}}},       
      
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
                               
                 
      {Fd,   { Description -> "Down-Quarks"}}, (*, ElectricCharge -> 1/3, PDG -> {1,3,5}, PDG.IX->{110890201,110890202,110890203}}},  *) 
      {Fu,   { Description -> "Up-Quarks"}}, (*, ElectricCharge -> -2/3, PDG -> {2,4,6}, PDG.IX->{-110100401,-110100402,-110100403}}},  *) 
      {Fe,   { Description -> "Leptons", ElectricCharge -> 1, PDG -> {11,13,15}, PDG.IX -> {110000601,110000602,110000603} }},
      {Fv,   { Description -> "Neutrinos",
	       LaTeX -> "\\nu",
	       OutputName -> "nu",
	       PDG -> {12,14,16,6000012,6000014,6000016},
	       PDG.IX ->{990000001,990000002,990000003,990000004,990000005,990000006},
                 Width -> {External,External,External,External,External,External}, 
                 Mass -> {LesHouches,LesHouches,LesHouches,LesHouches,LesHouches,LesHouches}
                 }},
       {Fcpp,   { Description -> "doubly charged exotic fermions",
	       LaTeX -> "\\chi^{++}",
	       OutputName -> "cpp",
	       PDG -> {6000055},
	       PDG.IX ->{990000001},
	       ElectricCharge -> 2,
	       FeynArtsNr -> 990000001,
                 Width -> External, 
                 Mass -> LesHouches
                 }},
         {Fcp,   { Description -> "singly charged exotic fermions",
	       LaTeX -> "\\chi^{+}",
	       OutputName -> "cp",
	       PDG -> {17,19},
	       PDG.IX ->{110000604,110000605},
	       ElectricCharge -> 1,
	       FeynArtsNr -> {110000604},
                 Width -> {External}, 
                 Mass -> {LesHouches}
                 }},         
         {Fc,   { Description -> "neutral exotic fermions",
	       LaTeX -> "\\chi^{0}",
	       OutputName -> "c0",
	       PDG -> {9000012,9000014,9000016},
	       PDG.IX ->{990000007,990000008,990000009},
	       ElectricCharge -> 0,
	       FeynArtsNr -> {990000007},
                 Width -> {External}, 
                 Mass -> {LesHouches}
                 }}  
        };    
        
        
        
 WeylFermionAndIndermediate = {
     
    {H,      {   PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "H",
                 OutputName -> "" }},
   {Phi,     {  PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\Phi",
                 OutputName -> "" }},
   {sigmaH10,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{H10}",
                 OutputName -> "" }},
   {sigmaH20,  { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{H20}",
                 OutputName -> "" }},
   {phiH10,    { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{H10}",
                 OutputName -> "" }},
   {phiH20,    { (*RParity -> 1,*)  
                 PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\phi_{H20}",
	         OutputName -> "" }},
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
   {sigmaR0,  { (*RParity -> 1,*)  
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
   {UL,     {LaTeX -> "U_L" }},
   {TPL,     {LaTeX -> "TP_L" }},
   {TMR,     {LaTeX -> "TM_R" }},
   {Ft0,     {LaTeX -> "T_0" }}
        };       


