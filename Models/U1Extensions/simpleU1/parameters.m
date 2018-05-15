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
                                                                            
                                                                           
{Mu,         { Description -> "SM Mu Parameter"}},                                        
{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}},
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},
{vS,      {  LaTeX -> "vS",
             Dependence ->  None, 
             OutputName -> vS,
             Real -> True,
             LesHouches -> {simple,43} }},

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'",
	   DependenceNum -> None
	     }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}},

{YxL, {OutputName -> YxL,
      LaTeX -> "Y_{xL}",
      LesHouches -> YXL}},
{YxR, {OutputName -> YxR,
      LaTeX -> "Y_{xR}",
      LesHouches -> YXR}},      
      
{fX,     {OutputName -> fX,
      LaTeX -> "f_x",
      LesHouches -> {simple,30}}},  

{Yv, {OutputName -> Yv,
      LaTeX -> "Y_\\nu",
      LesHouches -> Yv}},

{lamH, {OutputName -> lamH,
      LaTeX -> "\\lambda_H",
      LesHouches -> {simple,1}}},

{lamHS, {OutputName -> lamHS,
      LaTeX -> "\\lambda_{HS}",
      LesHouches -> {simple,2}}},      

      
{lamS, {OutputName -> lamS,
      LaTeX -> "\\lambda_{S}",
      LesHouches -> {simple,3}}},      
  
{lam1, {OutputName -> lam1,
      LaTeX -> "\\lambda_{1}",
      LesHouches -> {simple,4}}},        
      
{lam2, {OutputName -> lam2,
      LaTeX -> "\\lambda_{2}",
      LesHouches -> {simple,5}}},   
      
{M1, {OutputName -> M1,
      LaTeX -> "M_{1}",
      LesHouches -> {simple,6}}},        
      
{M2, {OutputName -> M2,
      LaTeX -> "M_{2}",
      LesHouches -> {simple,7}}},        
      
{MuP, {OutputName -> MUP,
      LaTeX -> "\\mu'",
      LesHouches -> {simple,10}}},

{muH2, {OutputName -> muH2,
      LaTeX -> "\\mu_{H}^{2}",
      LesHouches -> {simple,11}}},
      
      
{muS2, {OutputName -> muS2,
      LaTeX -> "\\mu_{S}^{2}",
      LesHouches -> {simple,12}}},

           

{mH2, {OutputName -> mH2,
      LaTeX -> "m^2_H",
      LesHouches -> {simple,20}}},

{PhaseD,{ 
     Real -> False, 
     LesHouches -> PHASED,
     LaTeX -> "PhaseD",
     OutputName -> phaseD}},    
     
{PhaseU,{ 
     Real -> False, 
     LesHouches -> PHASEU, 
     LaTeX -> "PhaseU",
     OutputName -> phaseU}},         
      

      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 

{VXu,        {LaTeX -> "VXu", OutputName -> VXu, LesHouches -> VXu}},
{VXd,        {LaTeX -> "VXd", OutputName -> VXd, LesHouches -> VXd}},
{UXu,        {LaTeX -> "UXu", OutputName -> UXu, LesHouches -> UXu}},
{UXd,        {LaTeX -> "UXd", OutputName -> UXd, LesHouches -> UXd}}, 

{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }}



 }; 
 

