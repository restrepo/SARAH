ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}},
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
 

{Yu,        { Description -> "Up-Yukawa-Coupling",
			  Form -> Diagonal   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  Form -> Diagonal}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
              DependenceNum ->  Sqrt[2]/vd * {{Mass[Cha,1],0,0},
                                                    {0, Mass[Cha,2],0},
                                                    {0, 0, Mass[Cha,3]}},
			  Form -> Diagonal
             }}, 

{T[Ye],     { Description -> "Trilinear-Lepton-Coupling",
			  Form -> Diagonal}},
{T[Yd],     { Description -> "Trilinear-Down-Coupling",
			  Form -> Diagonal}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling",
			  Form -> Diagonal}}, 

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
              Dependence -> None}}, 
{vu,        { Description -> "Up-VEV",
              Dependence -> None}},
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
				  Dependence->None,
  				  DependenceOptional->None,
  				  DependenceNum->None}},
{ZP,        { Description->"Charged-Mixing-Matrix",
				  Dependence->None,
				  Dependence->None,
  				  DependenceOptional->None,
  				  DependenceNum->None}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix" }}, 
{UP,        { Description->"Left-Lepton-Mixing-Matrix"}}, 
{UM,        { Description->"Right-Lepton-Mixing-Matrix"}}, 

{\[Beta],   { Description -> "Pseudo Scalar mixing angle" }},

                   
{ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
{ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
{ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
{ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           
              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},  

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},

{\[Epsilon], { Description -> "Bilinear RpV-Parameter"}}, 
{B[\[Epsilon]], { Description -> "Softbreaking Bilinear RpV-Parameter" }},

{mlHd2,  { Description -> "Soft-breaking Higgs Slepton Mixing Term"}}

 }; 
 

