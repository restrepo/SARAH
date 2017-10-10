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
  
 {PhaseN,{ 
     Real -> False, 
     LesHouches -> PhaseN (* auto generated Les Houches entry *), 
     LaTeX -> "PhaseN"  (* auto generated LaTeX name *), 
     OutputName -> phaseN  (* auto generated Output name *)}},  
  
{Yt, {OutputName -> YT,
      LaTeX -> "Y_{t}",
      LesHouches -> YT}},    
{Yn, {OutputName -> YN,
      LaTeX -> "Y_{n}",
      LesHouches -> YN}},   
  
{Yv, {OutputName -> YV,
      LaTeX -> "Y_{v}",
      LesHouches -> YV}},    
      
{eta1, {OutputName -> ETA1,
      LaTeX -> "\\eta_{1}",
      LesHouches -> {scoto, 62}}},         
{eta2, {OutputName -> ETA2,
      LaTeX -> "\\eta_{2}",
      LesHouches -> {scoto, 63}}}, 
{eta3, {OutputName -> ETA3,
      LaTeX -> "\\eta_{3}",
      LesHouches -> {scoto, 64}}},       

{mXT, {OutputName -> MXT,
      LaTeX -> "m_{XT}",
      LesHouches -> {scoto, 60}}}, 
{mXN, {OutputName -> MXN,
      LaTeX -> "m_{XN}",
      LesHouches -> {scoto, 61}}},         
      
      
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},
               
               
{vS,      {  LaTeX -> "vS",
             Dependence ->  None, 
             OutputName -> vS,
             Real -> True,
             LesHouches -> {scoto,30} }},
        
{vHP,      {  LaTeX -> "vHP",
             Dependence ->  None, 
             OutputName -> vHP,
             Real -> True,
             LesHouches -> {scoto,31} }},
             
{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}}, 
      
   
 

{lamH, {Description -> "SM Higgs Selfcouplings",
      OutputName -> lamH,
      LaTeX -> "\\lambda_{H}",
      LesHouches -> {scoto,1}}},

{lamS, {OutputName -> lamS,
      LaTeX -> "\\lambda_{S}",
      LesHouches -> {scoto,2}}},      

{lamHS, {OutputName -> lamHS,
      LaTeX -> "\\lambda_{HS}",
      LesHouches -> {scoto,3}}}, 
      
{lamHP, {OutputName -> lamHP,
      LaTeX -> "\\lambda_{HP}",
      LesHouches -> {scoto,4}}}, 

{lamHPS, {OutputName -> lamHPS,
      LaTeX -> "\\lambda_{HPS}",
      LesHouches -> {scoto,5}}},  

{lam3, {OutputName -> lam3,
      LaTeX -> "\\lambda_{3}",
      LesHouches -> {scoto,6}}}, 

{lam4, {OutputName -> lam4,
      LaTeX -> "\\lambda_{4}",
      LesHouches -> {scoto,7}}},        
 
{lam5, {OutputName -> lam5,
      LaTeX -> "\\lambda_{5}",
      LesHouches -> {scoto,8}}},   
 
{muH2,     {Description -> "SM Mu Parameter",
      OutputName -> muH2,
      LaTeX -> "\\mu_{H}^2",
      LesHouches -> {scoto,25}}},     

{muS2,     {OutputName -> muS2,
      LaTeX -> "\\mu_{S}^2",
      LesHouches -> {scoto,26}}},       
 
{muHP2,     {OutputName -> muHP2,
      LaTeX -> "\\mu_{HP}^2",
      LesHouches -> {scoto,27}}},    
 
 (*
{eta1,     {OutputName -> eta1,
      LaTeX -> "\\eta_{1}",
      LesHouches -> {scoto,15}}}, 
{eta2,     {OutputName -> eta2,
      LaTeX -> "\\eta_{2}",
      LesHouches -> {scoto,16}}}, 
{eta3,     {OutputName -> eta3,
      LaTeX -> "\\eta_{3}",
      LesHouches -> {scoto,17}}}, 
{eta4,     {OutputName -> eta4,
      LaTeX -> "\\eta_{4}",
      LesHouches -> {scoto,18}}},       
*)      
     
{YV1,     {OutputName -> YV1,
      LaTeX -> "YV1",
      LesHouches -> {scoto,10}}},     

{YV2,     {OutputName -> YV2,
      LaTeX -> "YV2",
      LesHouches -> {scoto,11}}},        
      
{YV3,     {OutputName -> YV3,
      LaTeX -> "YV3",
      LesHouches -> {scoto,12}}},          
   
   
   
{ZNL,{ 
     Description -> "Left-Dirac-Neutrino-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZNL, 
     LaTeX -> "{ZN}_L"  (* auto generated LaTeX name *), 
     OutputName -> ZNL}}, 

{ZNR,{ 
     Description -> "Right-Dirac-Neutrino-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> ZNR, 
     LaTeX -> "{ZN}_R"  (* auto generated LaTeX name *), 
     OutputName -> ZNR}},    
   
   
      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

{V1L,        {Description ->"Left-exotics-1-Mixing-Matrix", OutputName -> V1L, LesHouches -> V1L, LaTeX -> "V_{1}^{L}"}},
{U1R,        {Description ->"Right-exotics-1-Mixing-Matrix", OutputName -> U1R, LesHouches -> U1R, LaTeX -> "U_{1}^{R}"}},


{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},
             
{ZP,        { Description->"Charged-Mixing-Matrix",
              OutputName-> ZP, LaTeX -> "Z^P",
             Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}},               
             
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", LesHouches -> PSEUDOSCALARMIX,
             OutputName-> ZA, LaTeX -> "Z^A",
             Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}}


 }; 
 

