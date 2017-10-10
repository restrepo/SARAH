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

(* Scalar sector *)
{mu12,         { Description -> "SM Mu Parameter",
                LaTeX -> "\\mu_1^2",
	        OutputName -> M12,
                LesHouches -> {HMIX,20}}},

{mu22,         { Description -> "SM Mu Parameter",
                LaTeX -> "\\mu_2^2",
	        OutputName -> M22,
                LesHouches -> {HMIX,21}}},

{muS,       {LaTeX -> "\\mu_S^2",
	     OutputName-> MS2,
             LesHouches->{HMIX,22}}}, 


{Lambda1, { Description -> "SM Higgs Selfcouplings",
               DependenceNum -> Mass[hh]^2/(2 v^2),
             LesHouches -> {HMIX,1}}},

{Lambda2, {OutputName ->"L2",
             LaTeX -> "\\lambda_2",
             LesHouches -> {HMIX,2}}},

{Lambda3, {OutputName ->"L3",
             LaTeX -> "\\lambda_3",
             LesHouches -> {HMIX,3}}},
{Lambda4, {OutputName ->"L4",
             LaTeX -> "\\lambda_4",
             LesHouches -> {HMIX,4}}},
{Lambda5, {OutputName ->"L5",
             LaTeX -> "\\lambda_5",
             LesHouches -> {HMIX,5}}},

{LamS4, {OutputName ->"LS4",
             LaTeX -> "\\lambda^S_2",
             LesHouches -> {HMIX,14}}},

{LamS4c, {OutputName ->"LS4c",
             LaTeX -> "\\bar{\\lambda}^S_2",
             LesHouches -> {HMIX,15}}},

{LamS1, {OutputName ->"LS1",
             LaTeX -> "\\lambda^S_1",
             LesHouches -> {HMIX,11}}},

{LamS2, {OutputName ->"LS2",
             LaTeX -> "\\lambda^S_2",
             LesHouches -> {HMIX,12}}},

{LamS12, {OutputName ->"LS12",
             LaTeX -> "\\lambda^S_{12}",
             LesHouches -> {HMIX,13}}},


{LamS21, {OutputName ->"LS21",
             LaTeX -> "\\lambda^S_{21}",
             LesHouches -> {HMIX,14}}}


 }; 
 

