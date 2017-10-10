ParameterDefinitions = { 

{gBL,       {   Description -> "B-L-Coupling"}},
{g2,        { LaTeX -> "g_2",
              OutputName -> g2,
              LesHouches -> {gauge,2} }},

{ZW, {Dependence ->   1/Sqrt[2] {{1, 1},
	                  {-\[ImaginaryI],\[ImaginaryI]} } }},

{ZZ, {Dependence ->    {{Cos[\[Xi]], Sin[\[Xi]]},
	                  {-Sin[\[Xi]],Cos[\[Xi]]} } }},


{ZfW, {Dependence ->   1/Sqrt[2] {{1, 1, 0},
	                  {-\[ImaginaryI],\[ImaginaryI],0},
	                  {0,0,Sqrt[2]} } }},

{g3,        { Description -> "Strong-Coupling"}},  
{AlphaS,    {Description -> "Alpha Strong"}},	

{YQ,       { LaTeX -> "Y_Q",
             OutputName -> YQ, 
             LesHouches ->  YQ      }},
 
{YL,       { LaTeX -> "Y_L",
             OutputName -> YL,
             LesHouches ->  YL      }},
 
{T[YQ],    { LaTeX -> "T_Q",
             OutputName -> TQ,
             LesHouches -> TQ      }},


{T[YL],    { LaTeX -> "T_L",
             OutputName -> TL,
             LesHouches -> TL      }},

                                                                          
{Mu3,    { LaTeX -> "\\mu",
             OutputName -> Mu3,
             LesHouches -> Mu3        }},
               
{B[Mu3], { LaTeX -> "B_{\\mu}",
             OutputName -> BMu3,
             LesHouches -> BMu3       }},

{f,        { LaTeX -> "f",
             OutputName->fOm,
             LesHouches ->  FO      }},

{T[f],     { LaTeX -> "T^f",
             OutputName -> Tf,
             LesHouches -> TFO       }},

{a,        { LaTeX -> "a",
             OutputName->aOm,
             LesHouches ->  AOM      }},

{b,        { LaTeX -> "b",
             OutputName->bOm,
             LesHouches ->  BOM      }},

{T[b],     { LaTeX -> "T^b",
             OutputName -> Tb,
             LesHouches -> TBOM       }},



{T[a],     { LaTeX -> "T^a",
             OutputName -> Ta,
             LesHouches -> TAOM       }},

{AlphaOm, { LaTeX -> "\\alpha",
             OutputName -> AlphaOM,
             LesHouches ->  ALPHAOM      }},

{T[AlphaOm], { LaTeX -> "T^{\\alpha}",
               OutputName -> Tal,
               LesHouches -> TALPHAOM       }},

{Mdelta,   { LaTeX -> "M_{\\Delta}",
             OutputName -> MD,
             LesHouches ->  MDELTA      }},

{B[Mdelta],{ LaTeX -> "B_{M_{\\Delta}}",
             OutputName -> BD,
             LesHouches -> BDELTA       }},

{Momega,   { LaTeX -> "M_{\\Omega}",
             OutputName -> MO,
             LesHouches ->  MOMEGA      }},

{B[Momega],{ LaTeX -> "B_{M_{\\Omega}}",
             OutputName -> BO,
             LesHouches -> BOMEGA       }},
             
{Yv,     { Description -> "Neutrino-Yukawa-Coupling"}},
{T[Yv],     { Description -> "Trilinear-Neutrino-Coupling"}},

{mqL2,     { LaTeX -> "m_{Q}^2",
	OutputName -> mqL2,
             LesHouches -> MQL2 }},
              
{mqR2,     { LaTeX -> "m_{Q^c}^2",
	OutputName -> mqR2,
             LesHouches -> MQR2  }},                                                 

{mlL2,     { LaTeX -> "m_{L}^2",
	OutputName -> mlL2,
             LesHouches -> MLL2 }},
			  
{mlR2,     { LaTeX -> "m_{L^c}^2",
	OutputName -> mlR2,
	   	     LesHouches -> MLR2 }},

{mPhi2,    { LaTeX -> "m_\\Phi^2",
	OutputName -> mPhi2,
             Real -> True,
             LesHouches -> MPHI2         }},
             
{MassB,    { LaTeX -> "M_1",
	OutputName -> M1,
             Form -> Scalar,
             LesHouches -> {MSOFT,1} }},
              
{MassWL,   { LaTeX -> "M_{2L}",
	OutputName -> M2L,
             Form -> Scalar,
             LesHouches -> {MSOFT,2} }},

{MassWR,   { LaTeX -> "M_{2R}",
	OutputName -> M2R,
             Form -> Scalar,
             LesHouches -> {MSOFT,5} }},

{MassG,     { Description -> "Gluino Mass parameter"}},

{mdeltaL2, { LaTeX -> "m_{\\Delta}^2",
	OutputName -> mdeltaL2,
             LesHouches -> {MSOFT,41}}},

{mdeltaLbar2, { LaTeX -> "m_{\\overline{\\Delta}}^2",
	OutputName -> mdeltaLbar2,
             LesHouches -> {MSOFT,42} }},

{mdeltaR2, { LaTeX -> "m_{\\Delta^c}^2",
	OutputName ->mdeltaR2,
             LesHouches -> {MSOFT,43}}},

{mdeltaRbar2, { LaTeX -> "m_{\\overline{\\Delta}^c}^2",
	OutputName -> mdeltaRbar2,
             LesHouches -> {MSOFT,44}}},

{momegaL2, { LaTeX -> "m_{\\Omega}^2",
	OutputName ->momegaL2,
             LesHouches -> {MSOFT,45}}},

{momegaR2, { LaTeX -> "m_{\\Omega^c}^2",
	OutputName -> momegaR2,
             LesHouches -> {MSOFT,46}}},

{\[Xi],    { LaTeX -> "\\xi", 
             OutputName -> Xi, 
             LesHouches -> None,
             DependenceNum -> ArcCos[g2/Sqrt[gBL^2+g2^2]]       }},    

                           
{vR,       { LaTeX -> "v_R",
             LesHouches -> None,
	OutputName -> vR         }}, 

{vBL,      { LaTeX -> "v_{BL}", 
             LesHouches -> None,
	OutputName -> vBL         }}, 

{ZH,       { LaTeX -> "Z^H",
             LesHouches -> None,
	OutputName -> ZH      }},
             
{ZP,       { LaTeX -> "Z^P",
             LesHouches -> None,
	OutputName -> ZP      }},
             
{ZC1,      { LaTeX -> "Z^{\\pm \\pm}",
             LesHouches -> None,
	OutputName -> ZC1         }}, 
 
{ZN,       { LaTeX -> "Z^0",
             LesHouches ->  None,
	OutputName -> ZN 	   }}, 

{Znu,     { LaTeX -> "Z_{\\nu}^0",
             LesHouches ->  None,
	OutputName -> Znu   	   }}, 
             
{UP,       { LaTeX -> "U^+",
             LesHouches -> None,
   	     OutputName -> UP      }}, 
             
{UM,       { LaTeX -> "U^-",
             LesHouches -> None,
	     OutputName -> UM      }},

            
 {YQ[1], {LaTeX -> "Y_Q^1",
	OutputName -> YQ1}},
 {YQ[2], {LaTeX -> "Y_Q^2",
	OutputName -> YQ2}},

 {T[YQ][1], {LaTeX -> "T_Q^1",
	OutputName -> TQ1}},
 {T[YQ][2], {LaTeX -> "T_Q^2",
	OutputName -> TQ2}},

{YL[1], {LaTeX -> "Y_L^1",
	OutputName -> YL1}},
{YL[2], {LaTeX -> "Y_L^2",
	OutputName -> YL2}},

{T[YL][1], {LaTeX -> "T_L^1",
	OutputName -> TL1}},
{T[YL][2], {LaTeX -> "T_L^2",
	OutputName -> TL2}},
    
             
{UDL, {LaTeX -> "Z^{D,L}",
             LesHouches -> None,
	OutputName -> UDL}},
{UUL, {LaTeX -> "Z^{U,L}",
             LesHouches -> None,
	OutputName -> UUL}},
{UDR, {LaTeX -> "Z^{D,R}",
             LesHouches -> None,
	OutputName -> UDR}},
{UUR, {LaTeX -> "Z^{U,R}",
             LesHouches -> None,
	OutputName -> UUR}},
{UEL, {LaTeX -> "Z^{E,L}",
             LesHouches -> None,
	OutputName -> UEL}},
{UER, {LaTeX -> "Z^{E,R}",
             LesHouches -> None,
	OutputName -> UER}},
{UVL, {LaTeX -> "Z^{V,L}",
             LesHouches -> None,
	OutputName -> UVL}},
{UVR, {LaTeX -> "Z^{V,R}",
             LesHouches -> None,
	OutputName -> UVR}},
{UH0, {LaTeX -> "Z^H",
             LesHouches -> None,
	OutputName -> UH0}},
{UHC, {LaTeX -> "Z^C",
             LesHouches -> None,
	OutputName -> UHC}},
{ZC1, {LaTeX -> "Z^+",
             LesHouches -> None,
	OutputName -> ZC1}},
{UO1, {LaTeX -> "U^{\\Omega}",
             LesHouches -> None,
	OutputName -> UO1}},
{UDLp, {LaTeX -> "U^{+}",
             LesHouches -> None,
	OutputName -> UDLp}},
{UDLpp, {LaTeX -> "U^{++}",
             LesHouches -> None,
	OutputName -> UDLpp}},
{UDL0, {LaTeX -> "U^{0}",
             LesHouches -> None,
	OutputName -> UDL0}},
{UDRmm, {LaTeX -> "U^{--}",
             LesHouches -> None,
	OutputName -> UDRmm}},
{UDR0, {LaTeX -> "U",
             LesHouches -> None,
	OutputName -> UDR0}},
{UDLp, {LaTeX -> "Z^{\\Omega}",
             LesHouches -> None,
	OutputName -> UDLp}}                                

 }; 
 

