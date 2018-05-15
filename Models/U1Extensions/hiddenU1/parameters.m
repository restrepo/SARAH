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
             LesHouches -> {hiddenU1,43} }},
             
{vS2,      {  LaTeX -> "vS2",
             Dependence ->  None, 
             OutputName -> vS2,
             Real -> True,
             LesHouches -> {hiddenU1,44} }},
             
             
{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None,
	   DependenceNum -> None }},

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
      LesHouches -> {hiddenU1,30}}},  

{Yv, {OutputName -> Yv,
      LaTeX -> "Y_\\nu",
      LesHouches -> Yv}},

{lamH, {OutputName -> lamH,
      LaTeX -> "\\lambda_H",
      LesHouches -> {hiddenU1,1}}},

{lamHS1, {OutputName -> lamHS1,
      LaTeX -> "\\lambda_{HS1}",
      LesHouches -> {hiddenU1,2}}},      

{lamHS2, {OutputName -> lamHS2,
      LaTeX -> "\\lambda_{HS2}",
      LesHouches -> {hiddenU1,3}}}, 
      
{lamS1, {OutputName -> lamS1,
      LaTeX -> "\\lambda_{S1}",
      LesHouches -> {hiddenU1,4}}},      

{lamS2, {OutputName -> lamS2,
      LaTeX -> "\\lambda_{S2}",
      LesHouches -> {hiddenU1,5}}},    
      
{lamS1S2, {OutputName -> laS1S2,
      LaTeX -> "\\lambda_{S1S2}",
      LesHouches -> {hiddenU1,6}}},  
      
{sigma1,     {OutputName -> sigma1,
      LaTeX -> "\\sigma_{1}",
      LesHouches -> {hiddenU1,7}}},     
      
 {sigma2,     {OutputName -> sigma2,
      LaTeX -> "\\sigma_{2}",
      LesHouches -> {hiddenU1,8}}},  
      
 {sigma3,     {OutputName -> sigma3,
      LaTeX -> "\\sigma_{3}",
      LesHouches -> {hiddenU1,9}}},       
      
{MuP, {OutputName -> MUP,
      LaTeX -> "\\mu'",
      LesHouches -> {hiddenU1,10}}},

{muH2, {OutputName -> muH2,
      LaTeX -> "\\muH_2",
      LesHouches -> {hiddenU1,11}}},
      
      
{muS12, {OutputName -> muS12,
      LaTeX -> "\\muS1_2",
      LesHouches -> {hiddenU1,12}}},
{muS22, {OutputName -> muS22,
      LaTeX -> "\\muS2_2",
      LesHouches -> {hiddenU1,13}}},     
      
{Mxq,    {OutputName -> MXq,
      LaTeX -> "\\m_X",
      LesHouches -> {hiddenU1,31}}},   
           

{mH2, {OutputName -> mH2,
      LaTeX -> "\\m^2_H",
      LesHouches -> {hiddenU1,20}}},


      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
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
 

