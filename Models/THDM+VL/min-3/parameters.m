ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/v2* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v1* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v1* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}}, 
                                                                            
{YuV,    { LaTeX -> "Y_{u}^V",
           OutputName -> YuV,
           LesHouches -> YuV}},
           
{YdV,    { LaTeX -> "Y_{d}^V",
           OutputName -> YdV,
           LesHouches -> YdV}},
           
{YLFV,    { LaTeX -> "Y_{LFV}",
           OutputName -> YLFV,
           LesHouches -> YLFV}},           
           
           
{MQV,    {LaTeX -> "M_Q^V",
          OutputName -> MQV,
          LesHouches -> MQV}},
{MdV,    {LaTeX -> "M_d^V",
          OutputName -> MdV,
          LesHouches -> MDV}},
{MuV,    {LaTeX -> "M_u^V",
          OutputName -> MuV,
          LesHouches -> MUV}},          
 
{MS,    { LaTeX -> "M_S",
           OutputName -> MS,
           LesHouches -> MS}},
           
{lam1S,    { LaTeX -> "\\lambda_{1}^S",
           OutputName -> lam1S,
           LesHouches -> lam1S}},
           
{lam2S,    {LaTeX -> "\\lambda_{2}^S",
          OutputName -> lam2S,
          LesHouches -> lam2S}},
{lam1D,    {LaTeX -> "\\lambda_{1}^D",
          OutputName -> lam1D,
          LesHouches -> lam1D}},
{lam2D,    {LaTeX -> "\\lambda_{2}^D",
          OutputName -> lam2D,
          LesHouches -> lam2D}}, 
 
 
{Lambda1,    { LaTeX -> "\\lambda_1",
               OutputName -> Lam1,
               LesHouches -> {HMIX,31}}},
{Lambda2,    { LaTeX -> "\\lambda_2",
               OutputName -> Lam2,
               LesHouches -> {HMIX,32}}},
{Lambda3,    { LaTeX -> "\\lambda_3",
               OutputName -> Lam3,
               LesHouches -> {HMIX,33}}},
{Lambda4,    { LaTeX -> "\\lambda_4",
               OutputName -> Lam4,
               LesHouches -> {HMIX,34}}},
{Lambda5,    { LaTeX -> "\\lambda_5",
               OutputName -> Lam5,
               Real -> True,
               LesHouches -> {HMIX,35}}},

{Lambda6,    { LaTeX -> "\\lambda_6",
               OutputName -> Lam6,
               LesHouches -> {HMIX,36}}},

{Lambda7,    { LaTeX -> "\\lambda_7",
               OutputName -> Lam7,
               LesHouches -> {HMIX,37}}},


{M112,    {    LaTeX -> "m^2_1",
               OutputName -> M112,
               LesHouches -> {HMIX,20}}},


{M222,    {    LaTeX -> "m^2_2",
               OutputName -> M222,
               LesHouches -> {HMIX,21}}},

{M12,    {    LaTeX -> "m_{12}",
               OutputName -> M12,
               Real -> True,
               LesHouches -> {HMIX,22}}},

               
{PhaseD,{ 
     Real -> False, 
     LesHouches -> PHASED, 
     LaTeX -> "PhaseD", 
     OutputName -> phaD}},
 
{PhaseU,{ 
     Real -> False, 
     LesHouches -> PHASEU, 
     LaTeX -> "PhaseU", 
     OutputName -> phaU}}, 
     
{v1,        { Description -> "Down-VEV", LaTeX -> "v_1"}}, 
{v2,        { Description -> "Up-VEV", LaTeX -> "v_2"}},       
{v,         { Description -> "EW-VEV",
              DependenceSPheno -> Sqrt[v1^2 + v2^2] }},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},  

{ZH,        { Description->"Scalar-Mixing-Matrix"}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix"}},
{ZP,        { Description->"Charged-Mixing-Matrix"}},  


{ThetaW,    { Description -> "Weinberg-Angle"}}, 

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},


{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 

{VuV,        {Description ->"vectorlike Left-Up-Mixing-Matrix",
              OutputName -> VuV,
              LesHouches -> VuV}},
{VdV,        {Description ->"vectorlike Left-Down-Mixing-Matrix",
              OutputName -> VdV,
              LesHouches -> VdV}},
{UuV,        {Description ->"vectorlike Right-Up-Mixing-Matrix",
              OutputName -> UuV,
              LesHouches -> UuV}},
{UdV,        {Description ->"vectorlike Right-Down-Mixing-Matrix",
              OutputName -> UdV,
              LesHouches -> UdV}}, 
              
              
{VvV,        {Description ->"vectorlike Left-singly-charged-lepton-Mixing-Matrix",
              OutputName -> VvV,
              LesHouches -> VvV}},
{VlV,        {Description ->"vectorlike Left-doubly-charged-lepton-Mixing-Matrix",
              OutputName -> VlV,
              LesHouches -> VlV}},
{UvV,        {Description ->"vectorlike Right-singly-charged-lepton-Mixing-Matrix",
              OutputName -> UvV,
              LesHouches -> UvV}},
{UlV,        {Description ->"vectorlike Right-doubly-charged-lepton-Mixing-Matrix",
              OutputName -> UlV,
              LesHouches -> UlV}},               

{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}}

 }; 
 

