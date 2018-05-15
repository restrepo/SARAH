ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},

{g1p,  { LesHouches -> {gauge, 15},
         LaTeX -> "g_{Y B}",
         OutputName -> gYB }},
{gp1,  { LesHouches -> {gauge, 16},
         LaTeX -> "g_{B Y}",
         OutputName -> gBY}},
{gp,       {   Description -> "U(1)' Gauge Coupling"}},

{MZp,       {   Description -> "Z' mass"}},


{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}},
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
 

{Yu,        { Description -> "Up-Yukawa-Coupling"   }},
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling"}},
                                                                           
{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}},
{v,          { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWm]^2/(g2^2)],
               DependenceSPheno -> None  }},

{vS,         { Description -> "Singlet-VEV"}},

{ThetaW,    { Description -> "Weinberg-Angle"}},
{ThetaWp,  { Description -> "Theta'", DependenceNum -> None  }},

{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}},

{mu2,         { Description -> "SM Mu Parameter"}},
{mH2,        { Description -> "SM Higgs Mass Parameter"}},
      
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

{M2a, {LaTeX -> "m_{2}",
          Real -> True,
          LesHouches->{HMIX,200},
          OutputName ->  M2a}},

{M1a, {LaTeX -> "m_{1}",
          Real -> True,
          LesHouches->{HMIX,11},
          OutputName ->  M1a}},

{M2a2, {LaTeX -> "m^{2}_{2} ",
           Real -> True,
           LesHouches->None,
           OutputName ->  M2a2,
           Dependence->M2a^2}},

{M1a2, {LaTeX -> "m^{2}_{1} ",
           Real -> True,
           LesHouches->None,
           OutputName ->  M1a2,
           Dependence->M1a^2}},

{ZH,        { Description->"Scalar-Mixing-Matrix",
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix",
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None   }}
 }; 
 

