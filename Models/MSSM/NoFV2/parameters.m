ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},


{Yu,        { Description -> "Up-Yukawa-Coupling",
              Form -> Diagonal}}, 
{Yd,        { Description -> "Down-Yukawa-Coupling",
              Form -> Diagonal}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
              Form -> Diagonal}}, 
{T[Ye],     { Description -> "Trilinear-Lepton-Coupling",
              Form -> Diagonal }},
{T[Yd],     { Description -> "Trilinear-Down-Coupling",
              Form -> Diagonal}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling",
              Form -> Diagonal}}, 

{\[Mu],     { Description -> "Mu-parameter",
		      OutputName -> "Mue"}}, 
{B[\[Mu]],  { Description -> "Bmu-parameter"}},        

{mq2,       { Description -> "Softbreaking left Squark Mass",
              Form -> Diagonal}},
{me2,       { Description -> "Softbreaking right Slepton Mass",
              Form -> Diagonal}},
{ml2,       { Description -> "Softbreaking left Slepton Mass",
              Form -> Diagonal}},
{mu2,       { Description -> "Softbreaking right Up-Squark Mass",
              Form -> Diagonal}},
{md2,       { Description -> "Softbreaking right Down-Squark Mass",
              Form -> Diagonal}},
{mHd2,      { Description -> "Softbreaking Down-Higgs Mass"}}, 
{mHu2,      { Description -> "Softbreaking Up-Higgs Mass"}}, 

{MassB,     { Description -> "Bino Mass parameter"}},
{MassWB,    { Description -> "Wino Mass parameter"}},
{MassG,     { Description -> "Gluino Mass parameter"}},
                           
{vd,        { Description -> "Down-VEV"}}, 
{vu,        { Description -> "Up-VEV"}},       
{v,         { Description -> "EW-VEV"}},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},                          
             
    
{ZH,        { Description->"Scalar-Mixing-Matrix"}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix"}},
{ZP,        { Description->"Charged-Mixing-Matrix"}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix" }}, 
{UP,        { Description->"Chargino-plus Mixing-Matrix"}}, 
{UM,        { Description->"Chargino-minus Mixing-Matrix"}}, 

             
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},   

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},
       
       
{ZD,        { LaTeX -> "Z^D",
             OutputName -> ZD, 
             LesHouches -> sdownmix			  }},
             
{ZU,        { LaTeX -> "Z^U",
             OutputName -> ZU, 
             LesHouches ->  supmix			       }},
             
{ZE,        { LaTeX -> "Z^E",
             OutputName -> ZE, 
             LesHouches -> selemix			        }}
             
             
                            

 }; 
 

