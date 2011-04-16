ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling"}}, 

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
                           
{vd,        { Description -> "Down-VEV"}}, 
{vu,        { Description -> "Up-VEV"}},       
{v,         { Description -> "EW-VEV"}},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},                          
             
    
{ZD,        { Description -> "Down-Squark-Mixing-Matrix" }},             
{ZU,        { Description -> "Up-Squark-Mixing-Matrix"}},             
{ZE,        { Description -> "Slepton-Mixing-Matrix"}}, 
{ZV,        { Description->"Sneutrino Mixing-Matrix"}},   
{ZH,        { Description->"Scalar-Mixing-Matrix"}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix"}},
{ZP,        { Description->"Charged-Mixing-Matrix"}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix" }}, 
{UP,        { Description->"Chargino-plus Mixing-Matrix"}}, 
{UM,        { Description->"Chargino-minus Mixing-Matrix"}}, 

{ZEL,       { Description ->"Left-Lepton-Mixing-Matrix"}},
{ZER,       { Description ->"Right-Lepton-Mixing-Matrix" }},                          
{ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
{ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
{ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
{ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           
              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},
   


{MT,       { LaTeX -> "M_T",
             Dependence ->  None, 
             Value -> None,
             LesHouches ->{MSEESAW, 1}
             }},  
             
{B[MT],       { LaTeX -> "B_T",
             Dependence ->  None, 
             Value -> None,
	     LesHouches ->{BSEESAW, 1}
             }},  
             
{MZ,       { LaTeX -> "M_Z",
             Dependence ->  None, 
             Value -> None,
	     LesHouches ->{MSEESAW, 2}
             }},  
             
{B[MZ],       { LaTeX -> "B_Z",
             Dependence ->  None, 
             Value -> None,
	     LesHouches ->{BSEESAW, 2}
             }},   
             
{MS,       { LaTeX -> "M_S",
             Dependence ->  None, 
             Value -> None,
	     LesHouches ->{MSEESAW, 3}
             }},  
             
{B[MS],       { LaTeX -> "B_S",
             Dependence ->  None, 
             Value -> None,
	     LesHouches ->{BSEESAW, 3}
             }},
             
{Yt,       { LaTeX -> "Y_t",
             Dependence ->  None, 
             Value -> None, 
             Symmetry ->Symmetric,
	     LesHouches ->YT
             }},  
             
{Ys,       { LaTeX -> "Y_s",
             Dependence ->  None, 
             Value -> None, 
             Symmetry ->Symmetric,
             LesHouches ->YS
             }},  
             
{Yz,       { LaTeX -> "Y_z",
             Dependence ->  None, 
             Value -> None,
             LesHouches ->YZ 
             }}, 
             

{L1,       { LaTeX -> "\\lambda_1",
             Dependence ->  None, 
             Value -> None,
             LesHouches -> {LSeesaw, 1} 
             }}, 
             

{L2,       { LaTeX -> "\\lambda_2",
             Dependence ->  None, 
             Value -> None,
	     LesHouches -> {LSeesaw, 2} 
             }},                                                       


{T[Yt],       { LaTeX -> "T_t",
             Dependence ->  None, 
             Value -> None, 
             Symmetry ->Symmetric,
	     LesHouches ->TT
             }},  
             
{T[Ys],       { LaTeX -> "T_s",
             Dependence ->  None, 
             Value -> None, 
             Symmetry ->Symmetric,
	     LesHouches ->TS
             }},  
             
{T[Yz],       { LaTeX -> "T_z",
             Dependence ->  None, 
             Value -> None,
	     LesHouches ->TZ 
             }}, 
             

{T[L1],       { LaTeX -> "T_{\\lambda_1}",
             Dependence ->  None, 
             Value -> None,
	     LesHouches -> {TSEESAW, 1}
             }}, 
             

{T[L2],       { LaTeX -> "T_{\\lambda_2}",
             Dependence ->  None, 
             Value -> None,
	     LesHouches -> {TSEESAW, 2}
             }}, 


{ms2,       { LaTeX -> "m_s^2",
	      LesHouches->{MSOFT,100}}},

{msb2,       { LaTeX -> "m_{\\bar{s}}^2",
	      LesHouches->{MSOFT,101}}},

{mt2,       { LaTeX -> "m_t^2",
	      LesHouches->{MSOFT,110}}},

{mtb2,       { LaTeX -> "m_{\\bar{t}}^2",
	      LesHouches->{MSOFT,111}}},

{mz2,       { LaTeX -> "m_z^2",
	      LesHouches->{MSOFT,120}}},

{mzb2,       { LaTeX -> "m_{\\bar{z}}^2",
	      LesHouches->{MSOFT,121}}},

{MNuL,       { LaTeX -> "m_{\\nu_L}",
	     LesHouches -> MNUL }}                

 }; 
 

