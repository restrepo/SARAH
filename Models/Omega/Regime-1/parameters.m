ParameterDefinitions = { 

{gBL,      { LaTeX -> "g_{BL}",
             LesHouches -> {gauge,4},
             GUTnormalization -> Sqrt[3/2] }},

{g2,       { LaTeX -> "g_2",
             LesHouches -> {gauge,2}  }},

{ZW, {Dependence ->   1/Sqrt[2] {{1, 1, 0},
	                  {-\[ImaginaryI],\[ImaginaryI],0},
	                  {0,0,Sqrt[2]} } }},

{ZfW, {Dependence ->   1/Sqrt[2] {{1, 1, 0},
	                  {-\[ImaginaryI],\[ImaginaryI],0},
	                  {0,0,Sqrt[2]} } }},

           
{g3,       { LaTeX -> "g_3",
             LesHouches -> {gauge, 3}  }},
{AlphaS,    {Description -> "Alpha Strong"}},	
{YQ,       { LaTeX -> "Y_Q",
             LesHouches ->  YQ      }},
 
{YL,       { LaTeX -> "Y_L",
             LesHouches ->  YL      }},
 
{T[YQ],    { LaTeX -> "T_Q",
             LesHouches -> TQ      }},


{T[YL],    { LaTeX -> "T_L",
             LesHouches -> TL      }},

                                                                          
{Mu3,    { LaTeX -> "\\mu",
             LesHouches -> Mu3        }},
               
{B[Mu3], { LaTeX -> "B_{\\mu}",
             LesHouches -> BMu3       }},

{f,        { LaTeX -> "f",
             LesHouches ->  FO,
             OutputName -> fOM      }},

{T[f],     { LaTeX -> "T^f",
             LesHouches -> TFO       }},

{a,        { LaTeX -> "a",
             LesHouches ->  AOM,
             OutputName -> aOM      }},

{T[a],     { LaTeX -> "T^a",
             LesHouches -> TAOM       }},

{AlphaOm, { LaTeX -> "\\alpha",
             LesHouches ->  ALPHAOM,
             OutputName ->alphaOM      }},

{T[AlphaOm], { LaTeX -> "T^{\\alpha}",
               LesHouches -> TALPHAOM       }},

{Mdelta,   { LaTeX -> "M_{\\Delta}",
             LesHouches ->  MDELTA      }},

{B[Mdelta],{ LaTeX -> "B_{M_{\\Delta}}",
             LesHouches -> BDELTA       }},

{Momega,   { LaTeX -> "M_{\\Omega}",
             LesHouches ->  MOMEGA      }},

{B[Momega],{ LaTeX -> "B_{M_{\\Omega}}",
             LesHouches -> BOMEGA       }},

{mqL2,     { LaTeX -> "m_{Q}^2",
             LesHouches -> MQL2 }},
              
{mqR2,     { LaTeX -> "m_{Q^c}^2",
             LesHouches -> MQR2  }},                                                 

{mlL2,     { LaTeX -> "m_{L}^2",
             LesHouches -> MLL2 }},
			  
{mlR2,     { LaTeX -> "m_{L^c}^2",
	   	     LesHouches -> MLR2 }},

{mPhi2,    { LaTeX -> "m_\\Phi^2",
             Real -> True,
             LesHouches -> MPHI2         }},
             
{MassB,    { LaTeX -> "M_1",
             Form -> Scalar,
             LesHouches -> {MSOFT,1} }},
              
{MassWL,   { LaTeX -> "M_{2L}",
             Form -> Scalar,
             LesHouches -> {MSOFT,2} }},

{MassWR,   { LaTeX -> "M_{2R}",
             Form -> Scalar,
             LesHouches -> {MSOFT,5} }},

{MassG,    { LaTeX -> "M_3",
             Form -> Scalar,
             LesHouches -> {MSOFT,3} }},

{mdeltaL2, { LaTeX -> "m_{\\Delta}^2",
             LesHouches -> {MSOFT,41}}},

{mdeltaLbar2, { LaTeX -> "m_{\\overline{\\Delta}}^2",
             LesHouches -> {MSOFT,42} }},

{mdeltaR2, { LaTeX -> "m_{\\Delta^c}^2",
             LesHouches -> {MSOFT,43}}},

{mdeltaRbar2, { LaTeX -> "m_{\\overline{\\Delta}^c}^2",
             LesHouches -> {MSOFT,44}}},

{momegaL2, { LaTeX -> "m_{\\Omega}^2",
             LesHouches -> {MSOFT,45}}},

{momegaR2, { LaTeX -> "m_{\\Omega^c}^2",
             LesHouches -> {MSOFT,46}}},
                           
{vR,       { LaTeX -> "v_R",
             Value -> None, 
             LesHouches -> None         }}, 

{ZD,       { LaTeX -> "Z^D",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> sbotmix	  }},
             
{ZU,       { LaTeX -> "Z^U",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  stopmix	  }},
             
{ZE,       { LaTeX -> "Z^E",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> staumix	  }}, 
                       
{ZH,       { LaTeX -> "Z^H",
             Dependence -> None, 
             Value -> None, 
             LesHouches -> scalarmix      }},
             
{ZP,       { LaTeX -> "Z^P",
             Dependence -> None, 
             Value -> None, 
             LesHouches -> pseudoscalarmix      }},
             
{ZC,       { LaTeX -> "Z^\\pm",
             Real ->False,
             Dependence -> None, 
             Value -> None, 
             LesHouches -> chargemix      }}, 

{ZC2,      { LaTeX -> "Z^{\\pm \\pm}",
             Real ->False,
             Dependence -> None, 
             Value -> None, 
             LesHouches -> None         }}, 
 
{ZN,       { LaTeX -> "Z^0",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  Nmix 	   }}, 

{Znu,     { LaTeX -> "Z_{\\nu}^0",
             Dependence ->  None, 
             Value -> None       	   }}, 
             
{UP,       { LaTeX -> "U^+",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> Umix      }}, 
             
{UM,       { LaTeX -> "U^-",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> Vmix      }},

{UPP,      { LaTeX -> "U^{++}",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> None      }}, 
             
{UMM,      { LaTeX -> "U^{--}",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> None      }},
              
            
 {YQ[1], {LaTeX -> "Y_Q^1"}},
 {YQ[2], {LaTeX -> "Y_Q^2"}},

 {T[YQ][1], {LaTeX -> "T_Q^1"}},
 {T[YQ][2], {LaTeX -> "T_Q^2"}},

{YL[1], {LaTeX -> "Y_L^1"}},
{YL[2], {LaTeX -> "Y_L^2"}},

{T[YL][1], {LaTeX -> "T_L^1"}},
{T[YL][2], {LaTeX -> "T_L^2"}},
    
             
{UDL, {LaTeX -> "Z^{D,L}"}},
{UUL, {LaTeX -> "Z^{U,L}"}},
{UDR, {LaTeX -> "Z^{D,R}"}},
{UUR, {LaTeX -> "Z^{U,R}"}},
{UEL, {LaTeX -> "Z^{E,L}"}},
{UER, {LaTeX -> "Z^{E,R}"}},
{UVL, {LaTeX -> "Z^{V,L}"}},
{UVR, {LaTeX -> "Z^{V,R}"}},
{UH0, {LaTeX -> "Z^H"}},
{UHC, {LaTeX -> "Z^C"}},
{ZC1, {LaTeX -> "Z^+"}},
{UO1, {LaTeX -> "U^{\\Omega}"}},
{UDLp, {LaTeX -> "U^{+}"}},
{UDLpp, {LaTeX -> "U^{++}"}},
{UDL0, {LaTeX -> "U^{0}"}},
{UDRmm, {LaTeX -> "U^{--}"}},
{UDR0, {LaTeX -> "U"}},
{UDLp, {LaTeX -> "Z^{\\Omega}"}}                                

 }; 
 

