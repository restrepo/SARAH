ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},


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
{ZVR,        { LaTeX -> "Z^R",
              OutputName -> ZVR,
              LesHouches -> SNUMIXR }},
{ZVI,        { LaTeX -> "Z^I",
              OutputName -> ZVI,
              LesHouches -> SNUMIXI }},
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
{UV,       { Description ->"Neutrino-Mixing-Matrix"}},  
              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},
   


{MTT,       { LaTeX -> "M_T",
             OutputName ->  MTII,
             LesHouches ->{MSEESAW, 1}
             }},  
             
{B[MTT],       { LaTeX -> "B_T",
             OutputName ->  BMTII,
	     LesHouches ->{BSEESAW, 1}
             }},  
             
{MZZ,       { LaTeX -> "M_Z",
             OutputName ->  MZII,
             LesHouches ->{MSEESAW, 2}
             }},  
             
{B[MZZ],       { LaTeX -> "B_Z",
             OutputName ->  BMZII,
	     LesHouches ->{BSEESAW, 2}
             }},   
             
{MSS,       { LaTeX -> "M_S",
             OutputName ->  MSII,
	     LesHouches ->{MSEESAW, 3}
             }},  
             
{B[MSS],       { LaTeX -> "B_S",
             OutputName ->  BMSII,
	     LesHouches ->{BSEESAW, 3}
             }},
             
{Yt,       { LaTeX -> "Y_t",
             OutputName ->  YtII,
	     LesHouches ->YT
             }},  
             
{Ys,       { LaTeX -> "Y_s",
             OutputName ->  YsII,
             LesHouches ->YS
             }},  
             
{Yz,       { LaTeX -> "Y_z",
             OutputName ->  YzII,
             LesHouches ->YZ 
             }}, 
             

{L1,       { LaTeX -> "\\lambda_1",
             OutputName ->  L1II,
             LesHouches -> {LSeesaw, 1} 
             }}, 
             

{L2,       { LaTeX -> "\\lambda_2",
             OutputName ->  L2II,
	     LesHouches -> {LSeesaw, 2} 
             }},                                                       


{T[Yt],       { LaTeX -> "T_t",
             OutputName ->  TtII,
	     LesHouches ->TT
             }},  
             
{T[Ys],       { LaTeX -> "T_s",
             OutputName ->  TsII,
	     LesHouches ->TS
             }},  
             
{T[Yz],       { LaTeX -> "T_z",
             OutputName ->  TzII,
	     LesHouches ->TZ 
             }}, 
             

{T[L1],       { LaTeX -> "T_{\\lambda_1}",
             OutputName ->  TL1II,
	     LesHouches -> {TSEESAW, 1}
             }}, 
             

{T[L2],       { LaTeX -> "T_{\\lambda_2}",
             OutputName ->  TL2II,
	     LesHouches -> {TSEESAW, 2}
             }}, 


{ms2,       { LaTeX -> "m_s^2",
             OutputName ->  ms2,
	      LesHouches->{MSOFT,100}}},

{msb2,       { LaTeX -> "m_{\\bar{s}}^2",
             OutputName ->  msb2,
	      LesHouches->{MSOFT,101}}},

{mt2,       { LaTeX -> "m_t^2",
             OutputName ->  mt2,
	      LesHouches->{MSOFT,110}}},

{mtb2,       { LaTeX -> "m_{\\bar{t}}^2",
             OutputName ->  mtb2,
	      LesHouches->{MSOFT,111}}},

{mz2,       { LaTeX -> "m_z^2",
             OutputName ->  mzz2,
	      LesHouches->{MSOFT,120}}},

{mzb2,       { LaTeX -> "m_{\\bar{z}}^2",
             OutputName ->  mzb2,
	      LesHouches->{MSOFT,121}}},

{WOp,       {Description -> "Weinberg Operator"}},
{Q[WOp],       {Description -> "Soft Breaking Weinberg Operator"}}
                     

 }; 
 

