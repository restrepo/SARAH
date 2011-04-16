ParameterDefinitions = { 

{gBL,      { Description -> "B-L-Coupling" }},

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
{ZH,        { Description->"Scalar-Mixing-Matrix",
              Dependence -> None,
              DependenceNum -> None,
              DependenceOptional -> None}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix",
              Dependence -> None,
              DependenceNum -> None,
              DependenceOptional -> None}},
{ZP,        { Description->"Charged-Mixing-Matrix",
              Dependence -> None,
              DependenceNum -> None,
              DependenceOptional -> None}},                      
                                          
 
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
                           
{gL,       { LaTeX -> "g_L",
             LesHouches -> {Gauge,6}  }},

{gR,       { LaTeX -> "g_R",
             LesHouches -> {Gauge,7}  }},


{YQ,       { LaTeX -> "Y_Q",
             LesHouches ->  YQ      }},
 
{YL,       { LaTeX -> "Y_L",
             LesHouches ->  YL      }},
 
{T[YQ],    { LaTeX -> "T_Q",
             LesHouches -> TQ      }},

{T[YL],    { LaTeX -> "T_L",
             LesHouches -> TL      }},

                                                                         
{f,        { LaTeX -> "f",
             LesHouches ->  F      }},

{T[f],     { LaTeX -> "T_f",
             LesHouches -> TF       }},


{M,        { LaTeX -> "M",
             LesHouches ->  M      }},

{B[M],     { LaTeX -> "B_M",
             LesHouches -> BM       }},

             
{mqL2,     { LaTeX -> "m_{q_L}^2",
             Value -> MQL }},
              

{mqR2,     { LaTeX -> "m_{q_R}^2",
             Value -> MQR }},                                                 

{mlL2,     { LaTeX -> "m_{l_L}^2",
	     Value -> MLL }},
			  

{mlR2,     { LaTeX -> "m_{l_R}^2",
	     Value -> MLR }},

{mPhi2,    { LaTeX -> "m_\\Phi^2",
             Real -> True,
             LesHouches -> MPHI         }},
             
              
{MassWL,   { LaTeX -> "M_L",
             Form -> Scalar,
             LesHouches -> {MSOFT,4} }},

{MassWR,   { LaTeX -> "M_R",
             Form -> Scalar,
             LesHouches -> {MSOFT,5}        }},

{mdeltaL2, { LaTeX -> "m_{\\Delta_L}^2",
	     LesHouches -> {MSOFT,30} }},

{mdeltaLbar2, { LaTeX -> "m_{\\overline{\\Delta}_L}^2",
	        LesHouches -> {MSOFT,31} }},

{mdeltaR2, { LaTeX -> "m_{\\Delta_R}^2",
	     LesHouches -> {MSOFT,32}}},

{mdeltaRbar2, { LaTeX -> "m_{\\overline{\\Delta}_R}^2",
	        LesHouches -> {MSOFT,33} }},

{vR,       { LaTeX -> "v_R",
             Real -> True,
             LesHouches -> {HMIX,51}         }}, 
            
{vRbar,    { LaTeX -> "\\overline{v}_R", 
             Real -> True,
             LesHouches -> {HMIX,52}         }},

{vL,       { LaTeX -> "v_L", 
             Real -> True,
             LesHouches -> {HMIX,53}        }}, 
             
{vLbar,    { LaTeX -> "\\overline{v}_L", 
             Real -> True,
             LesHouches -> {HMIX,54}         }},
             
             
{ZC,       { LaTeX -> "Z^\\pm",
             LesHouches -> chargemix      }}, 

{ZC2,      { LaTeX -> "Z^{\\pm \\pm}",
             LesHouches -> ZC         }}, 
 
{UPP,      { LaTeX -> "U^{++}",
             LesHouches -> UPP      }}, 
             
{UMM,      { LaTeX -> "U^{--}",
             LesHouches -> UMM      }},
              

{\[Eta],   { LaTeX -> "\\eta", 
             Value -> None, 
             LesHouches -> None      }},

{\[Xi],    { LaTeX -> "\\xi", 
             Value -> None, 
             LesHouches -> None      }}                    

 }; 
 

