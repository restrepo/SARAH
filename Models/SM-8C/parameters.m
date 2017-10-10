ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{\[Alpha],  { Description -> "Scalar mixing angle" }},  

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/v* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}}, 
                                                                            
                                                                           
{mu2,         { Description -> "SM Mu Parameter",
        LesHouches -> {HMIX,2}}},                                        

{L,  { Description -> "SM Higgs Selfcouplings",
               DependenceNum -> Mass[hh]^2/(2 v^2)},
        LesHouches -> {HMIX,1} },

{v,          { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
               DependenceSPheno -> None  }},

{vS,  { LaTeX -> "v_S",
        Real -> True,
        OutputName -> vS,
        LesHouches -> {HMIX,20} }},

{MS,  { LaTeX -> "\\mu_S",
        OutputName -> MS,
        LesHouches -> {HMIX,15} }},


{LHc,  { LaTeX -> "\\lambda_{HC}",
        OutputName -> LHC,
        LesHouches -> {HMIX,10} }},

{LHs,  { LaTeX -> "\\lambda_{HS}",
        OutputName -> LHS,
        LesHouches -> {HMIX,11} }},

{LS,  { LaTeX -> "\\lambda_{S}",
        OutputName -> LS,
        LesHouches -> {HMIX,12} }},

{LCs,  { LaTeX -> "\\lambda_{Cs}",
        OutputName -> LCS,
        LesHouches -> {HMIX,13} }},

{eS,  { LaTeX -> "eS",
        OutputName -> ES,
        LesHouches -> {HMIX,14} }},

{eC,  { LaTeX -> "eC",
        OutputName -> EC,
        LesHouches -> {HMIX,15} }},

{eH,  { LaTeX -> "eH",
        OutputName -> EH,
        LesHouches -> {HMIX,16} }},


{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

{ZZ, {Description -> "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }},

{ZH,     {Description -> "Scalar-Mixing-Matrix" }},


{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}}

 }; 
 

