ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/v* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}}, 
                                                                                                                                                                                                                                               
{mu2,         { Description -> "SM Mu Parameter",
                OutputName->m2SM,
                Real -> True }},  
                
{Lambda1,  { Description -> "SM Higgs Selfcouplings",
               DependenceNum -> Mass[hh]^2/(v^2)}},
               
{v,          { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)],
               DependenceSPheno -> None,
               OutputName -> vvSM}},

{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]  }},

{ZZ, {Description -> "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }},


{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 
{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}},


(*New parameters*)

{Vv, {Description ->"Neutrino-Mixing-Matrix"}},

{Vvr, {Description ->"right-Neutrino-Mixing-Matrix",
             LaTeX -> "U^{UR}",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UVRMIX,
             OutputName-> UVR }},

{XV,        {(*Description ->"x-Left--Mixing-Matrix",*)
             LesHouches -> XV,
             OutputName -> XV }},
             
{XU,        {(*Description ->"x-Right-Lepton-Mixing-Matrix",*)
             LesHouches -> XU,
             OutputName -> XU }},
             
{YRD1,       { LaTeX -> "hd_1", 
              Real -> True, 
              LesHouches -> YRD1,
              OutputName-> YRD1 }}, 

{YRD2,       { LaTeX -> "hd_2",   
              Real -> True, 
              LesHouches -> YRD2,
              OutputName-> YRD2 }},   
              
{YRA1,       { LaTeX -> "ha_1",   
              Real -> True, 
              LesHouches -> YRA1,
              OutputName-> YRA1 }},  

{YRA2,       { LaTeX -> "ha_2",   
              Real -> True, 
              LesHouches -> YRA2,
              OutputName-> YRA2 }},  
              
{YRB1,       { LaTeX -> "hb_1",   
              Real -> True, 
              LesHouches -> YRB1,
              OutputName-> YRB1 }},      
 
{YRB2,       { LaTeX -> "hb_2",   
              Real -> True, 
              LesHouches -> YRB2,
              OutputName-> YRB2 }},  

{YRC1,       { LaTeX -> "hc_1",   
              Real -> True, 
              LesHouches -> YRC1,
              OutputName-> YRC1 }},  
              
{YRC2,       { LaTeX -> "hc_2",   
              Real -> True, 
              LesHouches -> YRC2,
              OutputName-> YRC2 }},               
              

{MDF,       { LaTeX -> "m_3",
              Real -> True, 
              LesHouches -> MDF,
              OutputName -> MDF }},

{Mn1,       { LaTeX -> "m_1",
              Real -> True, 
              LesHouches -> Mn1,
              OutputName -> Mn1 }},

{Mn2,       { LaTeX -> "m_2",
              Real -> True, 
              LesHouches -> Mn2,
              OutputName -> Mn2 }},
              
{MS12,       { LaTeX -> "ms_{1}^{2}",
              Real -> True, 
              (*DependenceNum -> Sqrt[Mass[Ss[1]]^2-v^2*LamS1H]*)
              LesHouches -> MS12,
              OutputName-> MS12 }} ,

{MS22,       { LaTeX -> "ms_{2}^{2}",
              Real -> True, 
              LesHouches -> MS22,
              OutputName-> MS22 }} ,
              
{LamS1H,     { LaTeX -> "\\lambda^{S1H}",
              Real -> True, 
              LesHouches -> LS1H,
              OutputName -> "LS1H" }},

{LamS2H,     { LaTeX -> "\\lambda^{S2H}",
              Real -> True, 
              LesHouches -> LS2H,
              OutputName -> "LS2H" }},

{LamS,      { LaTeX -> "\\lambda^{S}",
              Real -> True, 
              LesHouches -> LS,
              OutputName -> "LS" }},  
              
{LamSPH,     { LaTeX -> "\\lambda^{SPH}",
              Real -> True, 
              LesHouches -> LSPH,
              OutputName -> "LSPH" }},                          

{mP2,       { (*Description -> "mP2-parameter",*)
              LaTeX -> "m_{SP}^{2}",
              Real -> True, 
              LesHouches -> mP2,
              OutputName-> mP2 }},              
              
{LamSP,      { LaTeX -> "\\lambda^{SP}",
              Real -> True, 
              (*DependenceNum -> Mass[phiS]^2/(4*vS^2),*)
              LesHouches -> LSP,
              OutputName ->"LSP" }},      
              
{vS,{ 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> vS, 
     LaTeX -> "v_{\\sigma}", 
     OutputName -> vS}},
        
{ZH,     { Description -> "Scalar-Mixing-Matrix"}},
{\[Alpha],  { Description -> "Scalar mixing angle" }},

{YNU,       { LaTeX -> "y_v",   
              Real -> True, 
              LesHouches -> YNU,
              OutputName-> YNU }},

{VSs,       {   (* Rotation matrix *)
                LaTeX -> "VS",
                Real -> True,                 
                LesHouches ->  VSs,
                OutputName-> VSs }}

 }; 
 

