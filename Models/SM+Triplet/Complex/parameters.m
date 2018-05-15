ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

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

{LH,  { Description -> "SM Higgs Selfcouplings",
               DependenceNum -> Mass[hh]^2/(v^2)},
        LesHouches -> {HMIX,1} },

{v,          { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
               DependenceSPheno -> None  }},

{vT,  { LaTeX -> "v_T",
        Real -> True,
        OutputName -> vT,
        LesHouches -> {HMIX,20} }},

{MT,  { LaTeX -> "\\mu_T",
        OutputName -> MT,
        LesHouches -> {HMIX,15} }},

{KHT,  { LaTeX -> "\\kappa",
        OutputName -> Kap,
        LesHouches -> {HMIX,20} }},

{LT,  { LaTeX -> "\\lambda_T",
        OutputName -> LT,
        LesHouches -> {HMIX,17} }},

{LT2,  { LaTeX -> "{\\lambda'}_T",
        OutputName -> LT2,
        LesHouches -> {HMIX,18} }},        

{LHT,  { LaTeX -> "\\lambda_{HT}",
        OutputName -> LHT,
        LesHouches -> {HMIX,19} }},        
        
{LHT2,  { LaTeX -> "\\lambda_{HT'}",
        OutputName -> LHT2,
        LesHouches -> {HMIX,16} }},       

{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

{ZZ, {Description -> "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }},

{ZH,  { Description->"Scalar-Mixing-Matrix",
        Real->True,
        LesHouches -> ZH,
        OutputName -> ZH,
        LaTeX->"Z^H", 
        Dependence -> None,
        DependenceOptional -> None,
        DependenceNum -> None}},
        
{ZA,         { Description->"Pseudo-Scalar-Mixing-Matrix", 
               LaTeX -> "Z^A",
               Real -> True,
               LesHouches -> PSEUDOSCALARMIX,
               OutputName-> ZA, 
        Dependence -> None,
        DependenceOptional -> None,
        DependenceNum -> None      }},        

{ZP,        { Description->"Charged-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}}, 


{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}}

 }; 
 

