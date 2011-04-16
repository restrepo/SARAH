ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
		 DependenceNum ->   Sqrt[2]/vd * {{Mass[Cha,1],0,0},
                                                    {0, Mass[Cha,2],0},
                                                    {0, 0, Mass[Cha,3]}}
             }}, 

{T[Ye],     { Description -> "Trilinear-Lepton-Coupling"}},
{T[Yd],     { Description -> "Trilinear-Down-Coupling"}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling"}}, 

{\[Mu],     { Description -> "Mu-parameter"}}, 
{B[\[Mu]],  { Description -> "Bmu-parameter"}},        

{mq2,       { Description -> "Softbreaking left Squark Mass"}},
{me2,       { Description -> "Softbreaking right Slepton Mass"}},
{ml2,       { Description -> "Softbreaking left Slepton Mass"}},
{mu2,       { Description -> "Softbreaking right Up-Squark Mass"}},
{md2,       { Description -> "Softbreaking right Down-Squark Mass"}},
{mHd2,      { Description -> "Softbreaking Down-Higgs Mass"}}, 
{mHu2,      { Description -> "Softbreaking Up-Higgs Mass"}}, 

{MassB,     { Description -> "Bino Mass parameter"}},
{MassWB,    { Description -> "Wino Mass parameter"}},
{MassG,     { Description -> "Gluino Mass parameter"}},
                           
{vd,        { Description -> "Down-VEV",
              DependenceNum -> None}}, 
{vu,        { Description -> "Up-VEV",
              DependenceNum -> None}},
{vL,        { Description -> "Sneutrino-VEV"}},              
{v,         { Description -> "EW-VEV"}},
{TanBeta,   { Description -> "Tan Beta" }},              
            
    
{ZD,        { Description -> "Down-Squark-Mixing-Matrix" }},             
{ZU,        { Description -> "Up-Squark-Mixing-Matrix"}},             
{ZH,        { Description->"Scalar-Mixing-Matrix",
				  Dependence->None,
  				  DependenceOptional->None,
  				  DependenceNum->None}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix",
				  Dependence->None,
  				  DependenceOptional->None,
  				  DependenceNum->None}},
{ZP,        { Description->"Charged-Mixing-Matrix",
				  Dependence->None,
  				  DependenceOptional->None,
  				  DependenceNum->None}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix" }}, 
{UP,        { Description->"Chargino-plus Mixing-Matrix"}}, 
{UM,        { Description->"Chargino-minus Mixing-Matrix"}}, 

                   
{ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
{ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
{ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
{ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           
              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},  

{\[Epsilon], { Description -> "Bilinear RpV-Parameter"}}, 
{B[\[Epsilon]], { Description -> "Softbreaking Bilinear RpV-Parameter" }},

{L1, { LaTeX -> "\\lambda_1",
             LesHouches ->  RVLAMLLE,
             Symmetry -> AntiSymmetric,
	     OutputName -> L1}},
{L2, { LaTeX -> "\\lambda_2",
             LesHouches ->  RVLAMLQD,
	     OutputName -> L2}},
{T[L1], { LaTeX -> "T_{\\lambda_1}",
             LesHouches ->  RVTLLE,
             Symmetry -> AntiSymmetric,
	     OutputName -> T1}},
{T[L2], { LaTeX -> "T_{\\lambda_2}",
             LesHouches ->  RVTLQD,
	     OutputName -> T2}},

{mHL2,  { LaTeX ->"m_{l H}^2",
            LesHouches -> RVM2LH1}}



 }; 
 

