ParameterDefinitions = { 

{gBL,      { LaTeX -> "g_{BL}",
             DependenceNum ->  Sqrt[5/3]gP,
             DependenceOptional -> e/Sqrt[Cos[2 ThetaW]], 
             LesHouches -> {Gauge,4},
             GUTnormalization -> Sqrt[3/2] }},

{g2,       { LaTeX -> "g_2",
    	     DependenceOptional -> e/Sin[ThetaW],
             LesHouches -> {gauge, 2}  }},
             
{e,        { LaTeX -> "e",
             Dependence -> None,
             DependenceNum -> Sin[ThetaW]*g2}},                 
             
{g3,       { LaTeX -> "g_3",
             LesHouches -> {gauge, 3}  }},

{YQ,       { LaTeX -> "Y_Q",
             LesHouches ->  YQ      }},
{YL,       { LaTeX -> "Y_L",
             LesHouches ->  YL      }},
 
{T[YQ],    { LaTeX -> "T_Q",
             LesHouches -> TQ      }},

{T[YL],    { LaTeX -> "T_L",
             LesHouches -> TL      }},

{Mu3,    { LaTeX -> "\\mu",
             Symmetry ->Symmetric,
             LesHouches -> MU3      }},
               
{B[Mu3], { LaTeX -> "B_{\\mu}",
             Symmetry ->Symmetric,
             LesHouches -> BMu3     }},

{f,        { LaTeX -> "f",
            Symmetry ->Symmetric,
             LesHouches ->  F      }},

{T[f],     { LaTeX -> "T^f",
             Symmetry -> Symmetric,
             LesHouches -> TF       }},

{fc,       { LaTeX -> "f^*",
             LesHouches ->  FC      }},

{T[fc],    { LaTeX -> "{T^{f}}^*",
             LesHouches -> TFC       }},

{a,        { LaTeX -> "a",
             LesHouches ->  A      }},

{T[a],     { LaTeX -> "T^a",
             LesHouches -> TA       }},

{ac,       { LaTeX -> "a^*",
             LesHouches ->  AC      }},

{T[ac],    { LaTeX -> "{T^{a}}^*",
             LesHouches -> TAC       }},

{AlphaOm, { LaTeX -> "\\alpha",
             Symmetry ->AntiSymmetric,
             LesHouches ->  ALPHAOM      }},

{T[AlphaOm], { LaTeX -> "T^{\\alpha}",
                 Symmetry ->AntiSymmetric,
             LesHouches -> TALPHAOM       }},

{\[Alpha]c,   { LaTeX -> "\\alpha^*",
                LesHouches ->  ALPHAC      }},

{T[\[Alpha]c], { LaTeX -> "{T^{\\alpha}}^*",
             LesHouches -> TALPHAC       }},

{Mdelta,   { LaTeX -> "M_{\\Delta}",
             LesHouches ->  MDELTA      }},

{B[Mdelta],{ LaTeX -> "B_{M_{\\Delta}}",
             Real -> False, 
             Value -> None, 
             LesHouches -> BMDELTA       }},

{Mdeltac,  { LaTeX -> "M_{\\Delta}^*",
	     Real -> False,
             Value -> None, 
             LesHouches ->  None      }},

{B[Mdeltac], { LaTeX -> "{B_{M_{\\Delta}}}^*",
             Real -> False,
             Value -> None, 
             LesHouches -> None       }},

{Momega,   { LaTeX -> "M_{\\Omega}",
	     Real -> False,
	     Dependence ->  None, 
             Value -> None, 
             LesHouches ->  None      }},

{B[Momega],{ LaTeX -> "B_{M_{\\Omega}}",
             Real -> False, 
             Value -> None, 
             LesHouches -> None       }},

{Momegac,  { LaTeX -> "M_{\\Omega}^*",
	     Real -> False,
             Value -> None, 
             LesHouches ->  None      }},

{B[Momegac], { LaTeX -> "{B_{M_{\\Omega}}}^*",
             Real -> False,
             Value -> None, 
             LesHouches -> None       }},       
             
{mqL2,     { LaTeX -> "m_{Q}^2",
             Real -> False,
	     DependenceNum ->  mqL[index1,index2]^2, 
             Value -> None,
             Input -> {HighScale, MSQ2} }},
              
{mqL,      { LesHouches -> {{{1,1}, {MSOFT,41}},
                            {{2,2}, {MSOFT,42}},
                            {{3,3}, {MSOFT,43}}}}},

{mqR2,     { LaTeX -> "m_{Q^c}^2",
             Real -> False,
	     Dependence ->  None, 
             Value -> None }},                                                 

{mlL2,     { LaTeX -> "m_{L}^2",
             DependenceNum ->  mlL[index1,index2]^2, 
             Real -> False,
	     Value -> None,
             Input -> {HighScale, MSL2}}},
			  
{mlL,      { LesHouches -> {{{1,1}, {MSOFT,31}},
                            {{2,2}, {MSOFT,32}},
                            {{3,3}, {MSOFT,33}}}}},

{mlR2,     { LaTeX -> "m_{L^c}^2",
             Dependence ->  None, 
             Real -> False,
	     Value -> None }},

{mPhi2,    { LaTeX -> "m_\\Phi^2",
             Real -> True,
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> None         }},
             
{MassB,    { LaTeX -> "M_1",
             Real ->False,
             Form -> Scalar,
             LesHouches -> {MSOFT,1},
             Input -> {HighScale, MB} }},
              
{MassWL,   { LaTeX -> "M_{2L}",
             Real -> False,
             Form -> Scalar,
             LesHouches -> {MSOFT,2},
             Input -> {HighScale, MW} }},

{MassWR,   { LaTeX -> "M_{2R}",
             Real -> False,
             Form -> Scalar }},

{MassG,    { LaTeX -> "M_3",
             Real -> False,
             Form -> Scalar,
             LesHouches -> {MSOFT,3},
             Input -> {HighScale, MG} }},

{mdeltaL2, { LaTeX -> "m_{\\Delta}^2",
             Dependence ->  None, 
             Real -> False,
	     Value -> None }},

{mdeltaLbar2, { LaTeX -> "m_{\\overline{\\Delta}}^2",
                Dependence ->  None, 
                Real -> False,
	        Value -> None }},

{mdeltaR2, { LaTeX -> "m_{\\Delta^c}^2",
             Dependence ->  None, 
             Real -> False,
	     Value -> None }},

{mdeltaRbar2, { LaTeX -> "m_{\\overline{\\Delta}^c}^2",
                Dependence ->  None, 
                Real -> False,
	        Value -> None }},

{momegaL2, { LaTeX -> "m_{\\Omega}^2",
             Dependence ->  None, 
             Real -> False,
	     Value -> None }},

{momegaR2, { LaTeX -> "m_{\\Omega^c}^2",
             Dependence ->  None, 
             Real -> False,
	     Value -> None }},
                           
{vd,       { LaTeX -> "v_d",
             DependenceNum ->  Cos[\[Beta]]*v, 
             Value -> None, 
             LesHouches -> None         }}, 
             
{vu,       { LaTeX -> "v_u",
             DependenceNum ->  Sin[\[Beta]]*v, 
             Value -> None, 
             LesHouches -> None         }},
             
{v,        { LaTeX -> "v",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {Hmix,3}      }},

{vR,       { LaTeX -> "v_R",
             Value -> None, 
             LesHouches -> None         }}, 

{vL,       { LaTeX -> "v_L", 
             Value -> None, 
             LesHouches -> None         }},

{vBL,      { LaTeX -> "v_{BL}", 
             Value -> None, 
             LesHouches -> None         }}, 
             
{vBLbar,   { LaTeX -> "\\overline{v}_{BL}", 
             Value -> None, 
             LesHouches -> None         }},

{vBLL,     { LaTeX -> "v_{BL}^L", 
             Value -> None, 
             LesHouches -> None         }}, 
             
{vBLbarL,  { LaTeX -> "\\overline{v}_{BL}^L", 
             Value -> None, 
             LesHouches -> None         }},
             
{\[Beta],  { LaTeX -> "\\beta",
             DependenceNum -> ArcTan[TanBeta], 
             Value -> None, 
             LesHouches -> None      }},
             
{TanBeta,  { LaTeX -> "\\tan(\\beta)",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {Hmix,2}      }},                
    
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
              
{ThetaW,   { LaTeX -> "\\theta_W",
             DependenceNum -> ArcCos[g2/Sqrt[g1^2+g2^2]], 
             Value -> None,
             LesHouches -> None      }},

{\[Eta],   { LaTeX -> "\\eta", 
             Value -> None, 
             LesHouches -> None      }},

{\[Xi],    { LaTeX -> "\\xi", 
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
 

