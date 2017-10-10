

ParameterDefinitions = {  

{aEWinv, 	{Description -> "inverse weak coupling constant at mZ"}}, 
{AlphaS, 	{Description -> "Alpha Strong"}}, 
{e,			{Description -> "electric charge"}}, 
{g1,		{Description -> "Hypercharge-Coupling"}}, 
{g2,		{Description -> "Left-Coupling"}}, 
{g3,		{Description -> "Strong-Coupling"}}, 
{Gf,		{Description -> "Fermi's constant"}}, 
{mu2,		{Description -> "SM Mu Parameter"}}, 
{ThetaW,	{Description -> "Weinberg-Angle",
			 DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]}},

{Ud,		{Description -> "Right-Down-Mixing-Matrix"}}, 
{Ue,		{Description -> "Right-Lepton-Mixing-Matrix"}}, 
{Uu,		{Description -> "Right-Up-Mixing-Matrix"}}, 
{Vd,		{Description -> "Left-Down-Mixing-Matrix"}}, 
{Ve,		{Description -> "Left-Lepton-Mixing-Matrix"}}, 
{Vu,		{Description -> "Left-Up-Mixing-Matrix"}}, 

{v,         {Description -> "EW-VEV",
             DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
             DependenceSPheno -> None}},
               
{\[Lambda],	{Description -> "SM Higgs Selfcouplings",
     		 DependenceNum -> Mass[hh]^2/v^2}}, 

{Yd,		{Description -> "Down-Yukawa-Coupling", 
    	 	 DependenceNum -> {{(Sqrt[2]*Mass[Fd, 1])/v, 0, 0}, {0, (Sqrt[2]*Mass[Fd, 2])/v, 0}, {0, 0, (Sqrt[2]*Mass[Fd, 3])/v}}}}, 
{Ye,		{Description -> "Lepton-Yukawa-Coupling",
 			 DependenceNum -> {{(Sqrt[2]*Mass[Fe, 1])/v, 0, 0}, {0, (Sqrt[2]*Mass[Fe, 2])/v, 0}, {0, 0, (Sqrt[2]*Mass[Fe, 3])/v}}}}, 
{Yu,		{Description -> "Up-Yukawa-Coupling",
    	 	 DependenceNum -> {{(Sqrt[2]*Mass[Fu, 1])/v, 0, 0}, {0, (Sqrt[2]*Mass[Fu, 2])/v, 0}, {0, 0, (Sqrt[2]*Mass[Fu, 3])/v}}}}, 

{ZW,		{Description -> "W Mixing Matrix", 
     		 Dependence -> {{1/Sqrt[2], 1/Sqrt[2]}, {I/Sqrt[2], (-I)/Sqrt[2]}}}}, 
{ZZ,		{Description -> "Photon-Z Mixing Matrix", 
     		 Dependence -> {{Cos[ThetaW], -Sin[ThetaW]}, {Sin[ThetaW], Cos[ThetaW]}}}}, 
{ZH,        {Description->"Scalar-Mixing-Matrix",
			 Dependence -> None,
			 DependenceOptional -> None,
			 DependenceNum -> None}},


(* BSM Parameters *)

{MPhi2,		{Real -> False, 
 			 LesHouches -> {SCALARLEPTOQUARKS,2}, 
    		 LaTeX -> "{M}_{\\Phi}^2", 
     		 OutputName -> MPhi2}}, 

{MS2,		{Real -> False, 
   	  		 LesHouches -> {SCALARLEPTOQUARKS,4},
    		 LaTeX -> "M_{S}^2",
     		 OutputName -> MS2}},
			 
{MChi,		{Real -> False, 
			 LesHouches -> MCHI, 
			 LaTeX -> "{M}_{\\chi}",
			 OutputName -> MChi}}, 

{LPhi,		{Real -> False, 
			 LesHouches -> {SCALARLEPTOQUARKS,6},
			 LaTeX -> "\\lambda_{\\phi}",
			 OutputName -> LPhi}},

{LS3,		{Real -> False, 
			 LesHouches -> {SCALARLEPTOQUARKS,8},
			 LaTeX -> "\\lambda_{S_3}",
			 OutputName -> LS3}},
			  
{LS4,		{Real -> False, 
     		 LesHouches -> {SCALARLEPTOQUARKS,10},
    		 LaTeX -> "\\lambda_{S_4}",
    		 OutputName -> LS4}}, 

{KSP,		{Real -> False, 
     		 LesHouches -> {SCALARLEPTOQUARKS,12},
   		  	 LaTeX -> "\\kappa_{SP}",
    		 OutputName -> kSP}}, 
			 
{KSH,		{Real -> False, 
			 LesHouches -> {SCALARLEPTOQUARKS,14},
			 LaTeX -> "\\kappa_{SH}",
			 OutputName -> kSH}}, 

{gSP,		{Real -> False, 
     		 LesHouches -> {SCALARLEPTOQUARKS,16},
   		  	 LaTeX -> "g_{SP}",
   			 OutputName -> gSP}}, 

{gHP,		{Real -> False, 
   	  		 LesHouches -> {SCALARLEPTOQUARKS,18},
 			 LaTeX -> "g_{HP}",
    		 OutputName -> gHP}}, 

{gSH,		{Real -> False, 
     		 LesHouches -> {SCALARLEPTOQUARKS,20},
    		 LaTeX -> "g_{SH}", 
    		 OutputName -> gSH}},  

{gSC,		{Real -> False, 
			 LesHouches -> GSC,
			 LaTeX -> "g_{SC}",
			 OutputName -> gSC}}, 

{lamL,		{Real -> False, 
  	   		 LesHouches -> LAML, 
  		   	 LaTeX -> "\\lambda_L", 
  		   	 OutputName -> lamL}}, 

{lamR,		{Real -> False, 
     		 LesHouches -> LAMR,
     		 LaTeX -> "{lam}_R",
     		 OutputName -> lamR}}, 
			 
{vS,        {LaTeX -> "vS",
			 Dependence ->  None, 
			 OutputName -> vS,
			 Real -> True,
			 LesHouches ->{SCALARLEPTOQUARKS,22}}},

{VChi,		{Real -> False, 
     		 LesHouches -> VCHI, 
     		 LaTeX -> "{V}_{\\chi}", 
     		 OutputName -> VChi}}, 

{UChi,		{Real -> False, 
    	 	 LesHouches -> UCHI, 
   		  	 LaTeX -> "{U}_{\\chi}", 
    		 OutputName -> UChi}},
    		 
{ZC0,    {Real -> False, 
    	 	 LesHouches -> ZCHI0, 
   		  	 LaTeX -> "{Z}_{0}", 
    		 OutputName -> ZC0}},   		 
			 
{Mass[VWp],	{Real -> False, 
			 LesHouches -> {SCALARLEPTOQUARKS,24},
			 LaTeX -> "M_{VWp}",
			 OutputName -> Mvwp}} 
} 
