(* ::Package:: *)

ParameterDefinitions = {

  {g1,        { Description -> "Hypercharge-Coupling"}},
  {g2,        { Description -> "Left-Coupling"}},
  {g3,        { Description -> "Strong-Coupling"}},

  {AlphaS,    {Description -> "Alpha Strong"}},
  {e,         { Description -> "electric charge"}},
  {Gf,        { Description -> "Fermi's constant"}},
  {aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

  {Yu,        { Description -> "Up-Yukawa-Coupling",
		DependenceNum ->  Sqrt[2]/v*{ {Mass[Fu,1],0,0},
					      {0,Mass[Fu,2],0},
					      {0,0,Mass[Fu,3]}}}},
  {Yd,        { Description -> "Down-Yukawa-Coupling",
		DependenceNum ->  Sqrt[2]/v* {{Mass[Fd,1],0,0},
					      {0, Mass[Fd,2],0},
					      {0, 0, Mass[Fd,3]}}}},
  {Ye,        { Description -> "Lepton-Yukawa-Coupling",
		DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
					      {0, Mass[Fe,2],0},
					      {0, 0, Mass[Fe,3]}}}},

  {Yh,        {Latex ->"\\Y_h",
	       Outputname -> YH,
	       LesHouches -> Yh }}, 
  
  {epsE,  {LaTeX ->"\\epsilon_e",
	   OutputName -> epsE,
	   LesHouches -> epsE }},                                                                           

  {epsD,  {LaTeX ->"\\epsilon_d",
	   OutputName -> epsD,
	   LesHouches -> epsD }},

  {epsU,  {LaTeX ->"\\epsilon_u",
	   OutputName -> epsU,
	   LesHouches -> epsU }},

  {ZH,        { Description->"Scalar-Mixing-Matrix"}},
  {ZP,        { Description->"Charged-Mixing-Matrix", 
		LaTeX -> "Z^+",
		Real ->True,
		DependenceOptional -> None, 
		Value -> None, 
		LesHouches -> CHARGEMIX,
		OutputName-> ZP      }},                       
    
  
  {ThetaW,    { Description -> "Weinberg-Angle",
		DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

  {ZZ, {Description -> "Photon-Z Mixing Matrix"}},
  {ZW, {Description -> "W Mixing Matrix" }},

  {Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
  {Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
  {Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
  {Ud,        {Description ->"Right-Down-Mixing-Matrix"}},
  {Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
  {Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},

  (* Scalar sector *)

  {v,          { Description -> "EW-VEV",
		 DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
		 DependenceSPheno -> None  }},

  {vv,          { Description -> "EW-VEV0",
		  DependenceNum -> 0,
		  LesHouches -> vv,
		  DependenceSPheno -> None,
		  OutputName-> vv }},
  
  {\[Alpha],  { Description -> "Scalar mixing angle",
		LaTeX -> "\\alpha",
		DependenceSPheno -> ArcCos[ZH[1,2]], 
		Real -> True, 
		LesHouches -> {HMIX, 11},
		OutputName-> alphaH     }},  
  
  {mH2,        { Description -> "SM Higgs Mass Parameter"}},

  {mEt2,       {LaTeX -> "m_\\eta^2",
		LesHouches -> {HDM,1},
		OutputName-> mEt2 }},
  
  {lambda1,   {LaTeX -> "\\lambda_1",
	       LesHouches -> {HDM,2},
	       OutputName-> lam1 }},

  {lambda2,   {LaTeX -> "\\lambda_2",
	       LesHouches -> {HDM,3},
	       OutputName-> lam2 }},

  {lambda3,   {LaTeX -> "\\lambda_3",
	       LesHouches -> {HDM,4},
	       OutputName-> lam3 }},

  {lambda4,   {LaTeX -> "\\lambda_4",
	       LesHouches -> {HDM,5},
	       OutputName-> lam4 }},

  {lambda5,   {Real -> True,
	       LaTeX -> "\\lambda_5",
	       LesHouches -> {HDM,6},
	       OutputName-> lam5 }},

  {lambda6,   {LaTeX -> "\\lambda_6",
	       LesHouches -> {HDM,7},
	       OutputName-> lam6 }},

  {lambda7,   {LaTeX -> "\\lambda_7",
	       LesHouches -> {HDM,8},
	       OutputName-> lam7 }},

  {lambda8,   {LaTeX -> "\\lambda_8",
	       LesHouches -> {HDM,9},
	       OutputName-> lam8 }},

  {lambda9,   {LaTeX -> "\\lambda_9",
	       LesHouches -> {HDM,10},
	       OutputName-> lam9 }},

  {lambda10,   {LaTeX -> "\\lambda_10",
	       LesHouches -> {HDM,11},
	       OutputName-> lam10 }},

  {lambdah,   {LaTeX -> "\\lambda_h",
	       LesHouches -> {HDM,12},
	       OutputName-> lamh }},

  {M12,       {LaTeX -> "m_{12}",
               OutputName -> m12,
               LesHouches -> {HDM,13}}},

  {Mh,        {LaTeX -> "m_h",
	       OutputName -> mh,
	       LesHouches -> {HDM,14}}},

  {Mu,        {LaTeX -> "\\mu",
	       OutputName -> mu,
	       LesHouches -> {HDM,15}}},  

  
  (* Fermion sector *)

  {Yn,   {LaTeX -> "Y_N",
	  LesHouches -> YN,
	  OutputName->Yn }},

  {Mn,   {LaTeX -> "M_N",
	  LesHouches -> MN,
	  OutputName->Mn }},

  {ZX, {LaTeX -> "Z^{\\chi^0}",
	LesHouches -> ZXMIX,
	OutputName -> ZX }},

  {Vv, {Description ->"Neutrino-Mixing-Matrix"}}

};
