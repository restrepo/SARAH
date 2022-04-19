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

{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

{ZZ, {Description -> "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }},
 

{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},
						       
{mEt2, {LaTeX -> "m_\\eta^2",
	LesHouches -> {HDM,1},
      OutputName-> mEt2 }},

{lambda2,   {LaTeX -> "\\lambda_2",
	     LesHouches -> {HDM,2},
	     OutputName-> lam2 }},

{lambda3,   {LaTeX -> "\\lambda_3",
	     LesHouches -> {HDM,3},
	     OutputName-> lam3 }},

{lambda4,   {LaTeX -> "\\lambda_4",
	     LesHouches -> {HDM,4},
	     OutputName-> lam4 }},

{lambda5,   {Real -> True,
	     LaTeX -> "\\lambda_5",
	     LesHouches -> {HDM,5},
             OutputName-> lam5 }},

{Vv, {Description ->"Neutrino-Mixing-Matrix"}},

{MDF,       { LaTeX -> "M_D",
              Real -> True, 
              OutputName -> MDF,
              LesHouches -> MDF}},

{Mn,        { LaTeX -> "M_N",
              Real -> True, 
              OutputName -> Mn,
              LesHouches -> Mn}},
              
{ZvN,       { LaTeX -> "Z_\\mu^N",
              LesHouches ->  ZvN,
              OutputName->ZvN }},

{YR1,       { LaTeX -> "\\lambda_d",
              Real->True,
              LesHouches -> YR1,
              OutputName-> YR1 }},

{YR2,       { LaTeX -> "\\lambda_u",
              Real->True,
              LesHouches -> YR2,
              OutputName-> YR2 }}

 }; 
 

