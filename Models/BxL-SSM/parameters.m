ParameterDefinitions = { 
 
{MZp,       {   Description -> "Z' mass"}},


{gCB,       {  LesHouches -> {gauge, 4},
                LaTeX -> "g_B",
             OutputName -> gCB }},            

{gCL,       {  LesHouches -> {gauge, 5},
                LaTeX -> "g_L",
             OutputName -> gCL }},

{g1CB,       {  LesHouches -> {gauge, 10},
                LaTeX -> "g_{YB}",
             OutputName -> gYCB }},
             
{g1CL,       {  LesHouches -> {gauge, 11},
                LaTeX -> "g_{YL}",
             OutputName -> gYCL }},

{gCBCL,       {  LesHouches -> {gauge, 12},
                LaTeX -> "g_{BL}",
             OutputName -> gBL }},

{gCB1,       {  LesHouches -> {gauge, 13},
                LaTeX -> "g_{BY}",
             OutputName -> gCBY }},
             
{gCL1,       {  LesHouches -> {gauge, 14},
                LaTeX -> "g_{LY}",
             OutputName -> gCLY }},

{gCLCB,       {  LesHouches -> {gauge, 15},
                LaTeX -> "g_{LB}",
             OutputName -> gLB }},





{MuP,     { Description -> "Mu' Parameter"}},
{B[MuP],     { Description -> "B' Parameter"}},
               
{ThetaWp,  { Description -> "Theta'"  }},

{TBetaP,  { LaTeX -> "\\tan(\\beta')",
             Real ->  True, 
             LesHouches -> None,
             OutputName -> TBp     }},                 
               


{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
{e,         { Description -> "electric charge"}}, 
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
{ZVI,        { LaTeX -> "Z^I",
              OutputName -> ZVI,
              LesHouches -> SNUMIXI }},  
{ZVR,        { LaTeX -> "Z^R",
              OutputName -> ZVR,
              LesHouches -> SNUMIXR }},
{ZVIp,        { LaTeX -> "Z^{I'}",
              OutputName -> ZIP,
              LesHouches -> SNUMIXIP }},  

{ZVRp,        { LaTeX -> "Z^{R'}",
              OutputName -> ZRP,
              LesHouches -> SNUMIXRP }},

{ZC,        { LaTeX -> "Z^X",
              OutputName -> ZX,
              LesHouches -> XMIX }},  

{ZEp,        { LaTeX -> "Z^{E'}",
              OutputName -> ZEP,
              LesHouches -> SEPMIX }},  

{ZDp,        { LaTeX -> "Z^{D'}",
              OutputName -> ZDP,
              LesHouches -> SDPMIX }},  

{ZUp,        { LaTeX -> "Z^{U'}",
              OutputName -> ZUP,
              LesHouches -> SUPMIX }},  

{ZELp,        { LaTeX -> "U^{e'}_L",
              OutputName -> ZELP,
              LesHouches -> ZELPMIX }},  

{ZERp,        { LaTeX -> "U^{e'}_R",
              OutputName -> ZERP,
              LesHouches -> ZERPMIX }}, 

{ZDLp,        { LaTeX -> "U^{d'}_L",
              OutputName -> ZDLP,
              LesHouches -> ZDLPMIX }},  

{ZDRp,        { LaTeX -> "U^{d'}_R",
              OutputName -> ZDRP,
              LesHouches -> ZDRPMIX }}, 

{ZULp,        { LaTeX -> "U^{u'}_L",
              OutputName -> ZULP,
              LesHouches -> ZULPMIX }},  

{ZURp,        { LaTeX -> "U^{u'}_R",
              OutputName -> ZURP,
              LesHouches -> ZURPMIX }}, 

{UVp,        { LaTeX -> "U^{\nu'}",
              OutputName -> UVP,
              LesHouches -> UVPMIX }}, 



{ZH,        { Description->"Scalar-Mixing-Matrix",
			  Dependence->None,
 			  DependenceNum->None,
			  DependenceOptional->None}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix",
			  Dependence->None,
 			  DependenceNum->None,
			  DependenceOptional->None}},
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

{Yv,     { Description -> "Neutrino-Yukawa-Coupling"}},
{T[Yv],     { Description -> "Trilinear-Neutrino-Coupling"}},

{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},                           


{Yn,     { Description -> "Neutrino-X-Yukawa-Coupling"}},
{T[Yn],     {  Description -> "Trilinear-Neutrino-X-Coupling"}},


{mvR2,   {Description -> "Softbreaking right Sneutrino Mass"}},
{mC12,   {Description -> "Bilepton 1 Soft-Breaking mass"}},
{mC22,   {Description -> "Bilepton 2 Soft-Breaking mass" }},
{x1,     {Description -> "Bilepton 1 VEV"}}, 
{x2,     {Description -> "Bilepton 2 VEV" }},
{vX,      { Description -> "Bilepton VEV" }},
{AlphaP, { Description -> "Bilepton Scalar Mixing Angle" }}, 
{BetaP,  {Description -> "Bilepton Pseudo Scalar Mixing Angle"}},

{ZC,        { Description -> "Bilepton Scalar Mixing Matrix" }},
{UV,	    {Description -> "Neutrino-Mixing-Matrix"}},  			           
{ZAC,       {Description -> "Bilepton Pseudo Scalar Mixing Matrix"}},


{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix",
      Dependence -> None }},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},

{LambdaNu,        { LaTeX -> "\\lambda_{\\nu}",
              OutputName -> LNU,
              LesHouches -> LAMBDANU }},


{T[LambdaNu],        { LaTeX -> "T_{\\lambda_{\\nu}}",
              OutputName -> TLNU,
              LesHouches -> TLAMBDANU }},


{LambdaQ,        { LaTeX -> "\\lambda_{Q}",
              OutputName -> LQ,
              LesHouches -> {BXL,1} }},

{T[LambdaQ],        { LaTeX -> "T_{\\lambda_{Q}}",
              OutputName -> TLQ,
              LesHouches -> {BXLSOFT,1} }},

{LambdaU,        { LaTeX -> "\\lambda_{U}",
              OutputName -> LU,
              LesHouches -> {BXL,2} }},

{T[LambdaU],        { LaTeX -> "T_{\\lambda_{U}}",
              OutputName -> TLU,
              LesHouches -> {BXLSOFT,2} }},

{LambdaD,        { LaTeX -> "\\lambda_{D}",
              OutputName -> LD,
              LesHouches -> {BXL,3} }},

{T[LambdaD],        { LaTeX -> "T_{\\lambda_{D}}",
              OutputName -> TLD,
              LesHouches -> {BXLSOFT,3} }},

{Lambda1,        { LaTeX -> "\\lambda_{1}",
              OutputName -> L1,
              LesHouches -> LAMBDA1 }},

{T[Lambda1],        { LaTeX -> "T_{\\lambda_{1}}",
              OutputName -> TL1,
              LesHouches -> TLAMBDA1 }},

{Lambda2,        { LaTeX -> "\\lambda_{2}",
              OutputName -> L2,
              LesHouches -> LAMBDA2 }},

{T[Lambda2],        { LaTeX -> "T_{\\lambda_{2}}",
              OutputName -> TL2,
              LesHouches -> TLAMBDA2 }},

{Lambda3,        { LaTeX -> "\\lambda_{3}",
              OutputName -> L3,
              LesHouches -> LAMBDA3 }},

{T[Lambda3],        { LaTeX -> "T_{\\lambda_{3}}",
              OutputName -> TL3,
              LesHouches -> TLAMBDA3 }},

{Yu4,        { LaTeX -> "Y_{u_4}",
              OutputName -> YU4,
              LesHouches -> {BXL,4} }},

{T[Yu4],        { LaTeX -> "T_{u_4}}",
              OutputName -> TYU4,
              LesHouches -> {BXLSOFT,4} }},

{Yd4,        { LaTeX -> "Y_{d_4}",
              OutputName -> YD4,
              LesHouches -> {BXL,5} }},

{T[Yd4],        { LaTeX -> "T_{d_4}}",
              OutputName -> TYD4,
              LesHouches -> {BXLSOFT,5} }},

{Yu5,        { LaTeX -> "Y_{u_5}",
              OutputName -> YU5,
              LesHouches -> {BXL,6} }},

{T[Yu5],        { LaTeX -> "T_{u_5}}",
              OutputName -> TYU5,
              LesHouches -> {BXLSOFT,6} }},

{Yd5,        { LaTeX -> "Y_{d_5}",
              OutputName -> YD5,
              LesHouches -> {BXL,7} }},

{T[Yd5],        { LaTeX -> "T_{d_5}}",
              OutputName -> TYD5,
              LesHouches -> {BXLSOFT,7} }},

{Ye4,        { LaTeX -> "Y_{e_4}",
              OutputName -> YE4,
              LesHouches -> {BXL,8} }},

{T[Ye4],        { LaTeX -> "T_{e_4}}",
              OutputName -> TYE4,
              LesHouches -> {BXLSOFT,8} }},

{Ynu4,        { LaTeX -> "Y_{\\nu_4}",
              OutputName -> YNU4,
              LesHouches -> {BXL,9} }},

{T[Ynu4],        { LaTeX -> "T_{\\nu_4}}",
              OutputName -> TYNU4,
              LesHouches -> {BXLSOFT,9} }},

{Ye5,        { LaTeX -> "Y_{e_5}",
              OutputName -> YE5,
              LesHouches -> {BXL,10} }},

{T[Ye5],        { LaTeX -> "T_{e_5}}",
              OutputName -> TYE5,
              LesHouches -> {BXLSOFT,10} }},

{Ynu5,        { LaTeX -> "Y_{\\nu_5}",
              OutputName -> YNU5,
              LesHouches -> {BXL,11} }},

{T[Ynu5],        { LaTeX -> "T_{\\nu_5}}",
              OutputName -> TYNU5,
              LesHouches -> {BXLSOFT,11} }},

{MuB,        { LaTeX -> "\\mu_B",
              OutputName -> MUB,
              LesHouches -> {BXL,20} }},

{B[MuB],        { LaTeX -> "\\B_B",
              OutputName -> BMuB,
              LesHouches -> {BXLSOFT,20} }},

{MuL,        { LaTeX -> "\\mu_L",
              OutputName -> MUL,
              LesHouches -> {BXL,21} }},

{B[MuL],        { LaTeX -> "\\B_L",
              OutputName -> BMuL,
              LesHouches -> {BXLSOFT,21} }},

{MuX,        { LaTeX -> "\\mu_X",
              OutputName -> MUX,
              LesHouches -> {BXL,22} }},

{B[MuX],        { LaTeX -> "\\B_X",
              OutputName -> BMuX,
              LesHouches -> {BXLSOFT,22} }},

{v1L,       {LaTeX -> "v_{L_1}",
             LesHouches -> {BXL,31},
             OutputName -> "v1L"}},

{v2L,       {LaTeX -> "v_{L_2}",
             LesHouches -> {BXL,32},
             OutputName -> "v2L"}},

{v1B,       {LaTeX -> "v_{B_1}",
             LesHouches -> {BXL,33},
             OutputName -> "v1B"}},

{v2B,       {LaTeX -> "v_{B_2}",
             LesHouches -> {BXL,34},
             OutputName -> "v2B"}},

{MassBp,   {LaTeX -> "M_{B'}",
            LesHouches -> {BXLSOFT,200},
            OutputName -> "MBp"}},

{MassLp,   {LaTeX -> "M_{L'}",
            LesHouches -> {BXLSOFT,201},
            OutputName -> "MLp"}},

{MassBBp,   {LaTeX -> "M_{BB'}",
            LesHouches -> {BXLSOFT,202},
            OutputName -> "MBBp"}},

{MassBLp,   {LaTeX -> "M_{BL'}",
            LesHouches -> {BXLSOFT,203},
            OutputName -> "MBLp"}},

{MassBpLp,   {LaTeX -> "M_{B'L'}",
            LesHouches -> {BXLSOFT,204},
            OutputName -> "MBpLp"}},



{mq42,        { LaTeX -> "m^2_{q_4}",
              OutputName -> MQ42,
              LesHouches -> {BXLSOFT,101} }},

{mq52,        { LaTeX -> "m^2_{q_5}",
              OutputName -> MQ52,
              LesHouches -> {BXLSOFT,102} }},

{md42,        { LaTeX -> "m^2_{d_4}",
              OutputName -> MD42,
              LesHouches -> {BXLSOFT,103} }},

{md52,        { LaTeX -> "m^2_{d_5}",
              OutputName -> MD52,
              LesHouches -> {BXLSOFT,104} }},

{mu42,        { LaTeX -> "m^2_{u_4}",
              OutputName -> MU42,
              LesHouches -> {BXLSOFT,105} }},

{mu52,        { LaTeX -> "m^2_{u_5}",
              OutputName -> MU52,
              LesHouches -> {BXLSOFT,106} }},

{ml42,        { LaTeX -> "m^2_{l_4}",
              OutputName -> ML42,
              LesHouches -> {BXLSOFT,107} }},

{ml52,        { LaTeX -> "m^2_{l_5}",
              OutputName -> ML52,
              LesHouches -> {BXLSOFT,108} }},

{me42,        { LaTeX -> "m^2_{e_4}",
              OutputName -> ME42,
              LesHouches -> {BXLSOFT,109} }},

{me52,        { LaTeX -> "m^2_{e_5}",
              OutputName -> ME52,
              LesHouches -> {BXLSOFT,110} }},

{mvR42,        { LaTeX -> "m^2_{\\nu_4}",
              OutputName -> MVR42,
              LesHouches -> {BXLSOFT,111} }},

{mvR52,        { LaTeX -> "m^2_{\\nu_5}",
              OutputName -> MVR52,
              LesHouches -> {BXLSOFT,112} }},


{mp1B2,        { LaTeX -> "m^2_{B}",
              OutputName -> MB12,
              LesHouches -> {BXLSOFT,120} }},

{mp2B2,        { LaTeX -> "m^2_{B^{'}}",
              OutputName -> MB22,
              LesHouches -> {BXLSOFT,121} }},

{mp1L2,        { LaTeX -> "m^2_{L}",
              OutputName -> ML12,
              LesHouches -> {BXLSOFT,122} }},

{mp2L2,        { LaTeX -> "m^2_{L^{'}}",
              OutputName -> ML22,
              LesHouches -> {BXLSOFT,123} }},


{mC12,        { LaTeX -> "m^2_{X}",
              OutputName -> MX12,
              LesHouches -> {BXLSOFT,130} }},

{mC22,        { LaTeX -> "m^2_{X^{'}}",
              OutputName -> MX22,
              LesHouches -> {BXLSOFT,131} }},

{L4,        { LaTeX -> "L_4",
              Real -> True,
              OutputName -> L4,
              LesHouches -> {XCharge,1}}},
{B4,        { LaTeX -> "B_4",
              Real -> True,
              OutputName -> B4,
              LesHouches -> {XCharge,2}}}
      

 }; 
 

