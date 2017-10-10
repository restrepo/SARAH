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
    
    
{U1Qm,{ 
     Real -> True, 
     LesHouches -> {U1charges,1}  (* auto generated Les Houches entry *), 
     LaTeX -> "U1Qm"  (* auto generated LaTeX name *), 
     OutputName -> U1Qm  (* auto generated Output name *)}}, 

{U1Qk,{ 
     Real -> True, 
     LesHouches -> {U1charges,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "U1Qk"  (* auto generated LaTeX name *), 
     OutputName -> U1Qk  (* auto generated Output name *)}},      
     
     
{U1Qb,{ 
     Real -> True, 
     LesHouches -> {U1charges,3}  (* auto generated Les Houches entry *), 
     LaTeX -> "U1Qb"  (* auto generated LaTeX name *), 
     OutputName -> U1Qb  (* auto generated Output name *)}},     
    
    
    
{ZA,{ 
     Description -> "Pseudo-Scalar-Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> PSEUDOSCALARMIX, 
     LaTeX -> "Z^A", 
     OutputName -> ZA}},     
    
{Yv, {OutputName -> YV,
      LaTeX -> "Y_{v}",
      LesHouches -> YV}},    
      
{Yx, {OutputName -> YX,
      LaTeX -> "Y_{x}",
      LesHouches -> YX}},         
                                       
(*{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}}, *)
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},
{vS,      {  LaTeX -> "vS",
             Dependence ->  None, 
             OutputName -> vS,
             Real -> True,
             LesHouches -> {U1VLsample,30} }},
        

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}}, 
      
   
 

{lamH, {Description -> "SM Higgs Selfcouplings",
      OutputName -> lamH,
      LaTeX -> "\\lambda_H",
      LesHouches -> {U1VLsample,1}}},

{lamS, {OutputName -> lamS,
      LaTeX -> "\\lambda_{S}",
      LesHouches -> {U1VLsample,2}}},      

{lamHS, {OutputName -> lamHS,
      LaTeX -> "\\lambda_{HS}",
      LesHouches -> {U1VLsample,3}}}, 
      


      
{muH2,     {Description -> "SM Mu Parameter",
      OutputName -> muH2,
      LaTeX -> "\\mu_{H}^2",
      LesHouches -> {U1VLsample,25}}},     

{muS2,     {OutputName -> muS2,
      LaTeX -> "\\mu_{S}^2",
      LesHouches -> {U1VLsample,26}}},       
      
{eta1,     {OutputName -> eta1,
      LaTeX -> "\\eta_1",
      LesHouches -> {U1VLsample,15}}}, 
{eta2,     {OutputName -> eta2,
      LaTeX -> "\\eta_2",
      LesHouches -> {U1VLsample,16}}}, 
{eta3,     {OutputName -> eta3,
      LaTeX -> "\\eta_3",
      LesHouches -> {U1VLsample,17}}}, 
{eta4,     {OutputName -> eta4,
      LaTeX -> "\\eta_4",
      LesHouches -> {U1VLsample,18}}},       
      
     
{YV1,     {OutputName -> YV1,
      LaTeX -> "YV1",
      LesHouches -> {U1VLsample,10}}},     

{YV2,     {OutputName -> YV2,
      LaTeX -> "YV2",
      LesHouches -> {U1VLsample,11}}},        
      
{YV3,     {OutputName -> YV3,
      LaTeX -> "YV3",
      LesHouches -> {U1VLsample,12}}},          
   
      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

{V1L,        {Description ->"Left-exotics-1-Mixing-Matrix", OutputName -> V1L, LesHouches -> V1L}},
{U1R,        {Description ->"Right-exotics-1-Mixing-Matrix", OutputName -> U1R, LesHouches -> U1R}},
{U2R,        {Description ->"Right-exotics-2-Mixing-Matrix", OutputName -> U2R, LesHouches -> U2R}},
{V2L,        {Description ->"Left-exotics-2-Mixing-Matrix", OutputName -> V2L, LesHouches -> V2L}},


{ZM,	    {Description -> "Neutrino-Mixing-Matrix"}},

{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }}



 }; 
 

