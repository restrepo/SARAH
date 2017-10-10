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
{B[\[Mu]],  { Description -> "Bmu-parameter",
             Real -> False}},        

{mq2,       { Description -> "Softbreaking left Squark Mass"}},
{me2,       { Description -> "Softbreaking right Slepton Mass"}},
{ml2,       { Description -> "Softbreaking left Slepton Mass"}},
{mu2,       { Description -> "Softbreaking right Up-Squark Mass"}},
{md2,       { Description -> "Softbreaking right Down-Squark Mass"}},
{mHd2,      { Description -> "Softbreaking Down-Higgs Mass"}}, 
{mHu2,      { Description -> "Softbreaking Up-Higgs Mass"}}, 

{MassB,     { Description -> "Bino Mass parameter",
              Value->0}},
{MassWB,    { Description -> "Wino Mass parameter",
              Value->0}},
{MassG,     { Description -> "Gluino Mass parameter",
              Value->0}},
                           
{vd,        { Description -> "Down-VEV"}}, 
{vu,        { Description -> "Up-VEV"}},       
{v,         { Description -> "EW-VEV",
              DependenceNum -> Sqrt[4*Mass[VZ]^2/(g1^2+g2^2)]}},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},                          
             
    
{ZD,        { Description -> "Down-Squark-Mixing-Matrix" }},             
{ZU,        { Description -> "Up-Squark-Mixing-Matrix"}},             
{ZE,        { Description -> "Slepton-Mixing-Matrix"}}, 
{ZV,        { Description->"Sneutrino Mixing-Matrix"}},   
{ZH,        { Description->"Scalar-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}},
{ZP,        { Description->"Charged-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix" }}, 
{UP,        { Description->"Chargino-plus Mixing-Matrix"}}, 
{UM,        { Description->"Chargino-minus Mixing-Matrix"}}, 

{ZEL,       { Description ->"Left-Lepton-Mixing-Matrix"}},
{ZER,       { Description ->"Right-Lepton-Mixing-Matrix" }},                          
{ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
{ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
{ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
{ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           


(*              
{ThetaW,    { Description -> "Weinberg-Angle",
             DependenceNum -> ArcSin[Sqrt[1 - (Mass[VWm]^2 - g2^2*vT^2)/Mass[VZ]^2]]}},       
*)


{ThetaW,    { Description -> "Weinberg-Angle",
             DependenceNum -> None,
	      Value -> 0.511621}}, 

                    
{PhaseGlu,  { Description -> "Gluino-Phase" }},
{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},


{\[Kappa],   {Description -> "Singlet Self-Interaction"}},                               
{T[\[Kappa]],  { Description -> "Softbreaking Singlet Self-Interaction" }}, 
{\[Lambda],   { Description -> "Singlet-Higgs-Interaction"   }},                               
{T[\[Lambda]],  {Description -> "Softbreaking Singlet-Higgs-Interaction"}},        
             
{mS2,       { Description -> "Softbreaking Singlet Mass" }},

{mT2,       { LaTeX -> "m_t^2",
             OutputName ->  mt2,
	      LesHouches->{MSOFT,110}}},
	      
{moc2,       { LaTeX -> "m_O^2",
             OutputName ->  mo2,
	      LesHouches->{MSOFT,111}}},	      
	      
{ZG,       { LaTeX -> "Z^G",
             OutputName ->  ZG,
	      LesHouches->ZG}},	      

{vS,        { Description -> "Singlet-VEV"}},

{vT,  { LaTeX -> "v_T",
        Real -> True,
        OutputName -> vT,
        LesHouches -> {HMIX,310} }},
        
        

{MDBS,   { LesHouches -> {MSOFT,300},
              LaTeX -> "M^{B}_D",
              OutputName->MDB}},

{MDWBT,  { LesHouches -> {MSOFT,301},
              LaTeX -> "M^{W}_D",
              OutputName->MDW}},
              
{MDGoc,  { LesHouches -> {MSOFT,302},
              LaTeX -> "M^{O}_D",
              OutputName->MDO}},


{MuD, {    LaTeX -> "\\mu_D",
             Real -> False,
   	     LesHouches ->{HMIX,201},
             OutputName-> MuD }},  

{MuU, {    LaTeX -> "\\mu_U",
             Real -> False,
   	     LesHouches ->{HMIX,202},
             OutputName-> MuU }},  

{B[MuD], {    LaTeX -> "B_D",
             Real -> False,
   	     LesHouches ->{HMIX,203},
             OutputName-> BmuD }},  

{B[MuU], {    LaTeX -> "B_U",
             Real -> False,
   	     LesHouches ->{HMIX,204},
             OutputName-> BmuU }},  


{LamSD,  { LaTeX -> "\\lambda_D",
        OutputName -> LSD,
        LesHouches -> {HMIX,301} }},
        
{LamSU,  { LaTeX -> "\\lambda_U",
        OutputName -> LSU,
        LesHouches -> {HMIX,302} }},

{LamTD,  { LaTeX -> "\\Lambda_D",
        OutputName -> LTD,
        LesHouches -> {HMIX,303} }},
        
{LamTU,  { LaTeX -> "\\Lambda_U",
        OutputName -> LTU,
        LesHouches -> {HMIX,304} }},

{T[LamSD],  { LaTeX -> "t_D",
        OutputName -> TSD,
        LesHouches -> {HMIX,311} }},
        
{T[LamSU],  { LaTeX -> "t_U",
        OutputName -> TSU,
        LesHouches -> {HMIX,312} }},

{T[LamTD],  { LaTeX -> "T_D",
        OutputName -> TTD,
        LesHouches -> {HMIX,313} }},
        
{T[LamTU],  { LaTeX -> "T_U",
        OutputName -> TTU,
        LesHouches -> {HMIX,314} }},

{ZHR, {       LaTeX -> "Z^R",
             Real -> True, 
             LesHouches -> RHMIX,
             OutputName-> ZHR     }},

{ZRP, {       LaTeX -> "Z^{R+}",
             LesHouches -> RPMIX,
             OutputName-> ZRP     }},

{ZN1, {      LaTeX -> "N^1",
             LesHouches ->  N1MIX,
             OutputName-> ZN1 			        }}, 

{ZN2, {      LaTeX -> "N^2",
             LesHouches ->  N2MIX,
             OutputName-> ZN2 			        }},

{UP1, {      LaTeX -> "V^1",
             LesHouches -> V1MIX,
             OutputName-> UP1      }}, 
             
{UM1, {      LaTeX -> "U^1",
             LesHouches -> U1MIX,
             OutputName-> UM1      }},    


{UP2, {      LaTeX -> "V^2",
             LesHouches -> V2MIX,
             OutputName-> UP2      }}, 
             
{UM2, {      LaTeX -> "U^2",
             LesHouches -> U2MIX,
             OutputName-> UM2      }},

{mRd2, {    LaTeX -> "m_{R_d}^2",
             Real -> True,
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {MSOFT,50},
             OutputName-> mRd2        }},      
             
{mRu2, {    LaTeX -> "m_{R_u}^2",
             Real -> True,
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {MSOFT,51},
             OutputName-> mRu2        }}
                  
 }; 
 

