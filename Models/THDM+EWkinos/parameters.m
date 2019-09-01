ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  None}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  None}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  None}}, 

{epsE,  {LaTeX ->"\\epsilon_e",
       OutputName -> epYE,
       LesHouches -> epsE }},                                                                           

{epsD,  {LaTeX ->"\\epsilon_d",
       OutputName -> epYD,
       LesHouches -> epsD }},

{epsU,  {LaTeX ->"\\epsilon_u",
       OutputName -> epYU,
       LesHouches -> epsU }},
                                                                           
{Lew1,    { LaTeX -> "\\lambda_1",
               OutputName -> Lew1,
               LesHouches -> {HMIX,31}}},
{Lew2,    { LaTeX -> "\\lambda_2",
               OutputName -> Lew2,
               LesHouches -> {HMIX,32}}},
{Lew3,    { LaTeX -> "\\lambda_3",
               OutputName  -> Lew3,
               LesHouches -> {HMIX,33}}},
{Lew4,    { LaTeX -> "\\lambda_4",
               OutputName -> Lew4,
               LesHouches -> {HMIX,34}}},
{Lew5,    { LaTeX -> "\\lambda_5",
               OutputName -> Lew5,
               LesHouches -> {HMIX,35}}},

{Lew6,    { LaTeX -> "\\lambda_6",
               OutputName -> Lew6,
               LesHouches -> {HMIX,36}}},

{Lew7,    { LaTeX -> "\\lambda_7",
               OutputName -> Lew7,
               LesHouches -> {HMIX,37}}},


{M112,    {    LaTeX -> "m^2_1",
               OutputName -> M112,
               LesHouches -> {HMIX,20}}},


{M222,    {    LaTeX -> "m^2_2",
               OutputName -> M222,
               LesHouches -> {HMIX,21}}},

{M12,    {    LaTeX -> "m_{12}",
               OutputName -> M12,
               LesHouches -> {HMIX,22}}},


{vd,        { Description -> "Down-VEV", LaTeX -> "v_1"}}, 
{vu,        { Description -> "Up-VEV", LaTeX -> "v_2"}},       
{v,         { Description -> "EW-VEV"}},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},  

{ZH,        { Description->"Scalar-Mixing-Matrix"}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix"}},
{ZP,        { Description->"Charged-Mixing-Matrix"}},  


{ThetaW,    { Description -> "Weinberg-Angle"}}, 

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},

{ZN,{ 
     Description -> "Neutralino Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> NMIX, 
     LaTeX -> "N", 
     OutputName -> ZN}}, 
     

{MB,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,2}  (* auto generated Les Houches entry *), 
     LaTeX -> "MB"  (* auto generated LaTeX name *), 
     OutputName -> mbino  (* auto generated Output name *)}}, 

{MG,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,4}  (* auto generated Les Houches entry *), 
     LaTeX -> "MG"  (* auto generated LaTeX name *), 
     OutputName -> mgluino  (* auto generated Output name *)}}, 

{MW,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,6}  (* auto generated Les Houches entry *), 
     LaTeX -> "MW"  (* auto generated LaTeX name *), 
     OutputName -> mwino  (* auto generated Output name *)}}, 

{MuSplit,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,8}  (* auto generated Les Houches entry *), 
     LaTeX -> "\\mu"  (* auto generated LaTeX name *), 
     OutputName -> muSplit  (* auto generated Output name *)}}, 

{g1d,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,10}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{1d}"  (* auto generated LaTeX name *), 
     OutputName -> gc1d  (* auto generated Output name *)}}, 

{g2d,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,12}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{2d}"  (* auto generated LaTeX name *), 
     OutputName -> gc2d  (* auto generated Output name *)}}, 

{g1u,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,14}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{1u}"  (* auto generated LaTeX name *), 
     OutputName -> gc1u  (* auto generated Output name *)}}, 

{g2u,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,16}  (* auto generated Les Houches entry *), 
     LaTeX -> "g_{2u}"  (* auto generated LaTeX name *), 
     OutputName -> gc2u  (* auto generated Output name *)}}, 

{PhaseGlu,{ 
     Real -> False, 
     LesHouches -> {SPLITMSSM,18}  (* auto generated Les Houches entry *), 
     LaTeX -> "PhaseGlu"  (* auto generated LaTeX name *), 
     OutputName -> phaseglu  (* auto generated Output name *)}}, 
     
{UM,{ 
     Description -> "Chargino-minus Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> UMIX, 
     LaTeX -> "U", 
     OutputName -> UM}}, 

{UP,{ 
     Description -> "Chargino-plus Mixing-Matrix", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> False, 
     LesHouches -> VMIX, 
     LaTeX -> "V", 
     OutputName -> UP}},      


{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}}

 }; 
 

