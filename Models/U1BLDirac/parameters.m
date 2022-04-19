ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},

{g11p,        {Description -> "Mixed Gauge Coupling 2"}},
{g1p1,        {Description -> "Mixed Gauge Coupling 1"}},
{g1p,       {   Description -> "B-L-Coupling"}},

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
                                                                            
                                                                           
{Mu,         { Description -> "SM Mu Parameter"}},                                        
{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}},
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},
{vX,      {  LaTeX -> "x",
             Dependence ->  None, 
             OutputName -> vX,
             Real -> True,
             LesHouches -> {BL,43} }},

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}},

{Yx, {OutputName -> Yx,
      LaTeX -> "Y_x",
      LesHouches -> YX}},

{Yv, {OutputName -> Yv,
      LaTeX -> "Y_\\nu",
      LesHouches -> Yv}},

{Lh, {OutputName -> lamh,
      LaTeX -> "\\lambda_h",
      LesHouches -> {BL,1}}},

{Ls, {OutputName -> lams,
      LaTeX -> "\\lambda_s",
      LesHouches -> {BL,2}}},  
  
{L1, {OutputName -> lam1,
      LaTeX -> "\\lambda_1",
      LesHouches -> {BL,3}}},


{L2, {OutputName -> lam2,
      LaTeX -> "\\lambda_2",
      LesHouches -> {BL,4}}},

{L3, {OutputName -> lam3,
      LaTeX -> "\\lambda_3",
      LesHouches -> {BL,5}}},

{L4, {OutputName -> lam4,
      LaTeX -> "\\lambda_4",
      LesHouches -> {BL,6}}},

{L5, {OutputName -> lam5,
      LaTeX -> "\\lambda_5",
      LesHouches -> {BL,7}}},

{L6, {OutputName -> lam6,
      LaTeX -> "\\lambda_6",
      LesHouches -> {BL,8}}},

{L7, {OutputName -> lam7,
      LaTeX -> "\\lambda_7",
      LesHouches -> {BL,9}}},

{L8, {OutputName -> lam8,
      LaTeX -> "\\lambda_8",
      LesHouches -> {BL,10}}},
  
{MuP, {OutputName -> MUP,
      LaTeX -> "\\mu'",
      LesHouches -> {BL,11}}},

{mu1, {OutputName -> mu1,
      LaTeX -> "\\mu_1",
      LesHouches -> {BL,12}}},
  
{mu2, {OutputName -> mu2,
      LaTeX -> "\\mu_2",
      LesHouches -> {BL,13}}},

{mu3, {OutputName -> mu3,
      LaTeX -> "\\mu_3",
      LesHouches -> {BL,14}}},

{muh, {OutputName -> muh,
      LaTeX -> "\\mu_h",
      LesHouches -> {BL,15}}},
  
{mH2, {OutputName -> mH2,
      LaTeX -> "\\m^2_H",
      LesHouches -> {BL,20}}},

{mchi2, {OutputName -> mX2,
      LaTeX -> "\\m^2_\\chi",
      LesHouches -> {BL,21}}},

{MUS, {OutputName -> muS,
      LaTeX -> "\\mu_s",
      LesHouches -> {BL,30}}},

{fl,     {OutputName -> fl,
      Real -> False,       
      LaTeX -> "f_{l}",
      LesHouches -> fl}},     

{hl,     {OutputName -> hl,
      Real -> False, 
      LaTeX -> "h_l",
      LesHouches -> hl}},     
  
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

  (*{ZM,	    {Description -> "Neutrino-Mixing-Matrix"}},*)
  
{ZVL,	    {Description -> "Neutrino-Mixing-Matrix",
             LaTeX->"Z^{V_L}", 
             LesHouches ->  SNUMIX,
             OutputName-> ZVL             
             }},

{ZVR,	    {LaTeX -> "Z^{V_R}",
             LesHouches ->  SNURMIX,
             OutputName-> ZVR }},  	
  

{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},
  
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},

{ZP,        { Description->"Charged-Mixing-Matrix", 
		LaTeX -> "Z^+",
		Real ->True,
		DependenceOptional -> None, 
		Value -> None, 
		LesHouches -> CHARGEMIX,
		OutputName-> ZP      }}                       
  



 }; 
 

