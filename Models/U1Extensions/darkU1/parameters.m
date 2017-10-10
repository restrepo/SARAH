ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},

{g1X,        {Description -> "Mixed Gauge Coupling 2",
               LesHouches -> {gauge, 10},
                LaTeX -> "g_{Y X}",
             OutputName -> gYX}},
{gX1,        {Description -> "Mixed Gauge Coupling 1",
               LesHouches -> {gauge, 11},
                 LaTeX -> "g_{X Y}",
                 OutputName -> gXY}},
                 
(* {g1p,       {   Description -> "B-L-Coupling"}}, *)

{gX,        {Description -> "chargeX-Coupling", 
		 LaTeX -> "g_{X}",
             Dependence -> None, 
             LesHouches -> {gauge,4},
             OutputName -> gX }},

{MZp,       {   Description -> "Z' mass"}},


{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}},
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
 

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/vH* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/vH* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/vH* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}}, 
                                                                            
{Yv, {OutputName -> YV,
      LaTeX -> "Y_{v}",
      LesHouches -> YV}},    
      
{YPE, {OutputName -> YPE,
      LaTeX -> "Y_{PE}",
      LesHouches -> YPE}},         
      
{YPN, {OutputName -> YPN,
      LaTeX -> "Y_{PN}",
      LesHouches -> YPN}},       
     
{YPU, {OutputName -> YPU,
      LaTeX -> "Y_{PU}",
      LesHouches -> YPU}},         
      
{YPD, {OutputName -> YPD,
      LaTeX -> "Y_{PD}",
      LesHouches -> YPD}},      
      
{YXE, {OutputName -> YXE,
      LaTeX -> "Y_{XE}",
      LesHouches -> YXE}},         
      
{YXN, {OutputName -> YXN,
      LaTeX -> "Y_{XN}",
      LesHouches -> YXN}},       
     
{YXU, {OutputName -> YXU,
      LaTeX -> "Y_{XU}",
      LesHouches -> YXU}},         
      
{YXD, {OutputName -> YXD,
      LaTeX -> "Y_{XD}",
      LesHouches -> YXD}},        
      
{U1Qa,{ 
     Real -> True, 
     LesHouches -> {darkCharges,1}  (* auto generated Les Houches entry *), 
     LaTeX -> "U1Qa"  (* auto generated LaTeX name *), 
     OutputName -> U1Qa  (* auto generated Output name *)}}, 

{U1Qb,{ 
     Real -> True, 
     LesHouches -> {darkCharges,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "U1Qb"  (* auto generated LaTeX name *), 
     OutputName -> U1Qb  (* auto generated Output name *)}}, 
 
 
      
(*{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}}, *)
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},

             
{vP,      {  LaTeX -> "vP",
             Dependence ->  None, 
             OutputName -> vP,
             Real -> True,
             LesHouches -> {dark,30} }},      
             
{vX,      {  LaTeX -> "vX",
             Dependence ->  None, 
             OutputName -> vX,
             Real -> True,
             LesHouches -> {dark,31} }},              
        

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}}, 
      
   
 

{lamH, {Description -> "SM Higgs Selfcouplings",
      OutputName -> lamH,
      LaTeX -> "\\lambda_H",
      LesHouches -> {dark,1}}},

{lamP, {OutputName -> lamP,
      LaTeX -> "\\lambda_{P}",
      LesHouches -> {dark,2}}},      

{lamX, {OutputName -> lamX,
      LaTeX -> "\\lambda_{X}",
      LesHouches -> {dark,3}}}, 
  
{lamHP, {OutputName -> lamHP,
      LaTeX -> "\\lambda_{HP}",
      LesHouches -> {dark,4}}},

{lamHX, {OutputName -> lamHX,
      LaTeX -> "\\lambda_{HX}",
      LesHouches -> {dark,5}}},      

{lamPX, {OutputName -> lamPX,
      LaTeX -> "\\lambda_{PX}",
      LesHouches -> {dark,6}}},   
  


      
{muH2,     {Description -> "SM Mu Parameter",
      OutputName -> muH2,
      LaTeX -> "\\mu_{H}^2",
      LesHouches -> {dark,25}}},     

{muP2,     {OutputName -> muP2,
      LaTeX -> "\\mu_{P}^2",
      LesHouches -> {dark,26}}},       
{muX2,     {OutputName -> muX2,
      LaTeX -> "\\mu_{X}^2",
      LesHouches -> {dark,27}}},       
     
      
     
{YV1,     {OutputName -> YV1,
      LaTeX -> "YV1",
      LesHouches -> {dark,10}}},     

{YV2,     {OutputName -> YV2,
      LaTeX -> "YV2",
      LesHouches -> {dark,11}}},        
      
{YV3,     {OutputName -> YV3,
      LaTeX -> "YV3",
      LesHouches -> {dark,12}}},          
   
      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},



{ZM,	    {Description -> "Neutrino-Mixing-Matrix"}},

{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},

{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", LesHouches -> PSEUDOSCALARMIX,
             OutputName-> ZA, LaTeX -> "Z^A",
             Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}}

 }; 
 

