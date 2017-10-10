ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},

{g1BL,        {Description -> "Mixed Gauge Coupling 2",
               LesHouches -> {gauge, 10},
                LaTeX -> "g_{Y X}",
             OutputName -> gYX}},
{gBL1,        {Description -> "Mixed Gauge Coupling 1",
               LesHouches -> {gauge, 11},
                 LaTeX -> "g_{X Y}",
                 OutputName -> gXY}},
                 
(* {g1p,       {   Description -> "B-L-Coupling"}}, *)

{gBL,        {Description -> "B-L-Coupling", 
		 LaTeX -> "g_{BL}",
             Dependence -> None, 
             LesHouches -> {gauge,4},
             OutputName -> gBL }},

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
                                                                            
                                                                           
                                       
(*{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}}, *)
{vH,          { Description -> "EW-VEV",
               DependenceSPheno -> None }},
{v2,      {  LaTeX -> "v2",
             Dependence ->  None, 
             OutputName -> v2,
             Real -> True,
             LesHouches -> {BL,30} }},
             
{v3,      {  LaTeX -> "v3",
             Dependence ->  None, 
             OutputName -> v3,
             Real -> True,
             LesHouches -> {BL,31} }},
             
{v6,      {  LaTeX -> "v6",
             Dependence ->  None, 
             OutputName -> v6,
             Real -> True,
             LesHouches -> {BL,32} }},             

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}}, 
      
   
      

{YNR, {OutputName -> YNR,
      LaTeX -> "Y_{NR}",
      LesHouches -> YNR}},
      
{YNL, {OutputName -> YNL,
      LaTeX -> "Y_{NL}",
      LesHouches -> YNL}},      

{lamH, {Description -> "SM Higgs Selfcouplings",
      OutputName -> lamH,
      LaTeX -> "\\lambda_H",
      LesHouches -> {BL,1}}},

{lam2, {OutputName -> lam2,
      LaTeX -> "\\lambda_{2}",
      LesHouches -> {BL,2}}},      

{lam3, {OutputName -> lam3,
      LaTeX -> "\\lambda_{3}",
      LesHouches -> {BL,3}}}, 
      
{lam6, {OutputName -> lam6,
      LaTeX -> "\\lambda_{6}",
      LesHouches -> {BL,4}}},      

{lamH2, {OutputName -> lamH2,
      LaTeX -> "\\lambda_{H2}",
      LesHouches -> {BL,5}}},    
      
{lamH3, {OutputName -> lamH3,
      LaTeX -> "\\lambda_{H3}",
      LesHouches -> {BL,6}}},  
      
{lamH6,     {OutputName -> lamH6,
      LaTeX -> "\\lambda_{H6}",
      LesHouches -> {BL,7}}},     
      
 {lam23,     {OutputName -> lam23,
      LaTeX -> "\\lambda_{23}",
      LesHouches -> {BL,8}}},  
      
 {lam26,     {OutputName -> lam26,
      LaTeX -> "\\lambda_{26}",
      LesHouches -> {BL,9}}},       
      
{lam36, {OutputName -> lam36,
      LaTeX -> "\\lambda_{36}",
      LesHouches -> {BL,10}}},

{f36, {OutputName -> f36,
      Real -> True,
      LaTeX -> "f_{36}",
      LesHouches -> {BL,11}}},
      
      
{lam26P, {OutputName -> lam26P,
      Real -> True,
      LaTeX -> "\\lambda_{26'}",
      LesHouches -> {BL,12}}},

{fX,     {OutputName -> fX,
      LaTeX -> "f_X",
      LesHouches -> {BL,13}}},  
{fY,     {OutputName -> fY,
      LaTeX -> "f_Y",
      LesHouches -> {BL,14}}},    
{fNR,     {OutputName -> fNR,
      LaTeX -> "f_{NR}",
      LesHouches -> fNR}},     
{fNL,     {OutputName -> fNL,
      LaTeX -> "f_{NL}",
      LesHouches -> fNL}},    
{fN6,     {OutputName -> fN6,
      LaTeX -> "f_{N6}",
      LesHouches -> fN6}},    
{fN6R,     {OutputName -> fN6R,
      LaTeX -> "f_{N6R}",
      LesHouches -> fN6R}}, 
{fNLR,     {OutputName -> fNLR,
      LaTeX -> "f_{NLR}",
      LesHouches -> fNLR}},       
      
{fXY1,     {OutputName -> fXY1,
      LaTeX -> "f_{XY1}",
      LesHouches -> {BL,20}}}, 
{fXY2,     {OutputName -> fXY2,
      LaTeX -> "f_{XY2}",
      LesHouches -> {BL,21}}},     

{mN,     {OutputName -> mN,
      LaTeX -> "m_{N}",
      LesHouches -> mN}},       
      
{mXY1,     {OutputName -> mXY1,
      LaTeX -> "m_{XY1}",
      LesHouches -> {BL,23}}}, 
{mXY2,     {OutputName -> mXY2,
      LaTeX -> "m_{XY2}",
      LesHouches -> {BL,24}}},  
      
   (*   {Mu,         { Description -> "SM Mu Parameter"}}, *)
      
{muH2,     {Description -> "SM Mu Parameter",
      OutputName -> muH2,
      LaTeX -> "\\mu_{H}^2",
      LesHouches -> {BL,25}}},     

{mu22,     {OutputName -> mu22,
      LaTeX -> "\\mu_{2}^2",
      LesHouches -> {BL,26}}},       
      
{mu32,     {OutputName -> mu32,
      LaTeX -> "\\mu_{3}^2",
      LesHouches -> {BL,27}}}, 
{mu62,     {OutputName -> mu62,
      LaTeX -> "\\mu_{6}^2",
      LesHouches -> {BL,28}}},       
      
      
{fN,     {OutputName -> fN,
      LaTeX -> "f_N",
      LesHouches -> FN}},   
      
{fNP,     {OutputName -> fNP,
      LaTeX -> "f_{N'}",
      LesHouches -> FNP}},     
      
{PhaseY,{ 
     Real -> False, 
     LesHouches -> {BLVL,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "PhaseY"  (* auto generated LaTeX name *), 
     OutputName -> phasey  (* auto generated Output name *)}},       
      
      
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
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }}



 }; 
 

