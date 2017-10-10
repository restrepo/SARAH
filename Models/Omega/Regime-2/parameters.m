ParameterDefinitions = { 

{gBL,      { LaTeX -> "g_{BL}",
             LesHouches -> {gauge,4},
             GUTnormalization -> Sqrt[3/2] }},
	     
                          
{gL,       { LaTeX -> "g_L", 
             LesHouches -> {gauge,6}  }},

{gR,       { LaTeX -> "g_R",  
            LesHouches -> {gauge,7} }},                
             
{g3,       { LaTeX -> "g_3",
             LesHouches -> {gauge, 3} }},
{AlphaS,    {Description -> "Alpha Strong"}},	
{Yu,       { Description -> "Up-Yukawa-Coupling"}},               
{Yd,       { Description -> "Down-Yukawa-Coupling"}},             
{Ye,       { Description -> "Lepton-Yukawa-Coupling"}},
{T[Ye],    { Description -> "Trilinear-Lepton-Coupling"}},
{T[Yd],   {  Description -> "Trilinear-Down-Coupling"}},     
{T[Yu],   { Description -> "Trilinear-Up-Coupling"}}, 

{\[Mu],     { Description -> "Mu-parameter"}}, 
{B[\[Mu]],  { Description -> "Bmu-parameter"}}, 

{fc1,       { LaTeX -> "f^1_c",
             LesHouches ->  FC1}},

{T[fc1],    { LaTeX -> "T_{f_{c_1}}",
              LesHouches -> TFC1       }},


{Mdeltac1,  { LaTeX -> "M_{\\Delta_R}^1",
             LesHouches ->  MDELTAC1      }},

{B[Mdeltac1], { LaTeX -> "B_{M_{\\Delta_R}^1}",
             LesHouches -> BDELTAC1       }},

            
{mqL2,     { LaTeX -> "m_{Q}^2",
             LesHouches -> MQL2 }},
              
{muR2,     { LaTeX -> "m_{u^c}^2",
             LesHouches -> MUR2  }}, 

{mdR2,     { LaTeX -> "m_{d^c}^2",
             LesHouches -> MDR2  }},                                            

{mlL2,     { LaTeX -> "m_{L}^2",
             LesHouches -> MLL2 }},
			  
{meR2,     { LaTeX -> "m_{e^c}^2",
             LesHouches -> MER2 }},

{mvR2,     { LaTeX -> "m_{\\nu^c}^2",
             LesHouches -> MVR2 }},

{mHd2,       { LaTeX -> "m_{H_d}^2",
             Real -> True,
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {MSOFT,21}        }},       

{mHu2,       { LaTeX -> "m_{H_u}^2",
             Real -> True,
             LesHouches -> {MSOFT,22}        }},
             
{MassB,    { LaTeX -> "M_1",
             Form -> Scalar,
             LesHouches -> {MSOFT,1} }},
              
{MassWL,   { LaTeX -> "M_{L}",
             Form -> Scalar,
             LesHouches -> {MSOFT,2}}},

{MassWR0,   { LaTeX -> "M_{R}",
             Form -> Scalar,
             LesHouches -> {MSOFT,12} }},

{MassG,    { LaTeX -> "M_3",
             Form -> Scalar,
             LesHouches -> {MSOFT,3}}},

{mdeltaR02, { LaTeX -> "m_{\\Delta^{c 0}}^2",
             LesHouches -> {MSOFT,51}}},

{mdeltaRbar02, { LaTeX -> "m_{\\overline{\\Delta}^{c 0}}^2",
             LesHouches -> {MSOFT,51}}},

{vBL,      { LaTeX -> "v_{BL}", 
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
{UDLp, {LaTeX -> "Z^{\\Omega}"}},

{Momega,{LaTeX ->"M_{\\Omega}"}},

{B[Momega],{LaTeX -> "B_{\\Omega}",
			OutputName -> Bomega}},

{momegaL2, {LaTeX -> "m^2_{\\Omega_L}",
             LesHouches -> {MSOFT,61}}},

{momegaR02,{LaTeX -> "m^2_{\\Omega^0_R}",
             LesHouches -> {MSOFT,61}}},

{Yv,{LaTeX -> "Y_\\nu",
	 LesHouches -> Yv}},

{T[Yv],{LaTeX ->"T_\\nu",
	 LesHouches -> Tv}},

{bc,{LaTeX -> "b_c",
	   LesHouches -> BCOM}},

{ac1,{LaTeX->"a^1_c",
	   LesHouches -> AC1}},

{T[ac1],{LaTeX ->"T_{a_{c_1}}",
	   LesHouches -> TAC1}},

{T[bc],{LaTeX ->"T_{b_c}",
	   LesHouches -> TBCOM}},

{b,   {LaTeX ->"b",
	   LesHouches -> BOM}},

{T[b],{LaTeX ->"T_{b}",
	   LesHouches -> TBOM}},

{vR, {LaTeX ->"v_R"}},

{ZZ, {Dependence -> {{Cos[\[Xi]],Sin[\[Xi]]},{-Sin[\[Xi]],Cos[\[Xi]]} } }},


{\[Xi],    { LaTeX -> "\\xi", 
             OutputName -> Xi, 
             LesHouches -> None,
             DependenceNum -> ArcCos[gR/Sqrt[gBL^2+gR^2]]       }}                    

 }; 
 

