ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{AlphaS,    {Description -> "Alpha Strong"}},	

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

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
 

{Yb3,       { LaTeX -> "Y_b",
             OutputName -> Yb3,
             LesHouches -> YB3
             }},     



{Yw3,       { LaTeX -> "Y_w",
             OutputName -> Yw3,
             LesHouches -> YW3
             }},     


{Yx3,       { LaTeX -> "Y_x",
             OutputName -> Yx3,
             LesHouches -> YX3
             }},  


{T[Yb3],       { LaTeX -> "T_b",
             OutputName -> Tb3,
             LesHouches -> TB3
             }},     



{T[Yw3],       { LaTeX -> "T_w",
             OutputName -> Tw3,
             LesHouches -> TW3
             }},     


{T[Yx3],       { LaTeX -> "T_x",
             OutputName -> Tx3,
             LesHouches -> TX3
             }},  
               
{MXM3,     { LaTeX -> "M_X",
             OutputName -> MXM3,
             LesHouches -> MXM3        }},                
             
{MWM3,     { LaTeX -> "M_W",
             OutputName -> MWM3,
             LesHouches -> MWM3        }},              
             
{MGM3,     { LaTeX -> "M_G",
             OutputName -> MGM3,
             LesHouches -> MGM3        }},             
             
{MBM3,     { LaTeX -> "M_B",
             OutputName -> MBM3,
             LesHouches -> MBM3         }},  
             
             
{B[MXM3],     { LaTeX -> "B_X",
             OutputName -> BXM,
             LesHouches -> BXM3     }},                
             
{B[MWM3],     { LaTeX -> "B_W",
             OutputName -> BWM,
             LesHouches -> BWM3      }},                
             
             
{B[MGM3],     { LaTeX -> "B_G",
             OutputName -> BGM,
             LesHouches -> BGM3     }},             
             
{B[MBM3],     { LaTeX -> "B_B",
             OutputName -> BBM,
             LesHouches -> BBM3        }},               
                          
{mHw32,       { LaTeX -> "m_{W}^2",
             OutputName -> mhw2,
	     LesHouches -> MHW32  }}, 
             
             
{mHg32,       { LaTeX -> "m_{G}^2",
             OutputName -> mhg2,
	     LesHouches -> MHG32}}, 
             
{mHx32,       { LaTeX -> "m_{X}^2",
             OutputName -> mhx2,
	     LesHouches -> MHX32}},              

{mHb32,       { LaTeX -> "m_{B}^2",
             OutputName -> mhb2,
	     LesHouches -> MHB32 }}, 
             
{mHxb32,       { LaTeX -> "m_{\\bar{X}}^2",
             OutputName -> mxb2,
	     LesHouches -> MHXB32 }},

{WOp,       {Description -> "Weinberg Operator"}},
{Q[WOp],       {Description -> "Soft Breaking Weinberg Operator"}}

                
 }; 
 

