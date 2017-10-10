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

{UV,       { Description ->"Neutrino-Mixing-Matrix"}},                            
                                          
 
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
        
        
{LT,  { LaTeX -> "\\Lambda_T",
        OutputName -> LT,
        LesHouches -> {HMIX,350} }},
        
{T[LT],  { LaTeX -> "T_{\\Lambda_T}",
        OutputName -> TLT,
        LesHouches -> {HMIX,351} }},

{L1,        { Description -> "Tadpole Term",
	      LesHouches -> {HMIX,30},
              LaTeX -> "L_1",
              OutputName->L1}},              

{MS,        { Description -> "Singlet Mass Term",
              LesHouches -> {HMIX,31},
              LaTeX -> "M_S",
              OutputName->MS}}, 


{L[L1],        { Description -> "Softbreaking Tadpole Term",
              LesHouches -> {HMIX,32},
              LaTeX -> "\\xi_1",
              OutputName->LL1}},              

{B[MS],        { Description -> "Softbreaking Singlet Mass Term",
			  LesHouches -> {HMIX,33},
              LaTeX -> "B_S",
              OutputName->BMS}},

{LS,        {      LesHouches -> {HMIX,34},
              LaTeX -> "\\lambda_T",
              OutputName->LS}},              

{MT,        {     LesHouches -> {HMIX,35},
              LaTeX -> "M_T",
              OutputName->MTR}}, 
              
{MO,        {     LesHouches -> {HMIX,45},
              LaTeX -> "M_O",
              OutputName->MO}},

{B[MO],        {     LesHouches -> {HMIX,46},
              LaTeX -> "B_O",
              OutputName->BO}},              
                            


{T[LS],        {  LesHouches -> {HMIX,36},
              LaTeX -> "T_T",
              OutputName->TLS}},              

{B[MT],        {  LesHouches -> {HMIX,37},
              LaTeX -> "B_T",
              OutputName->BMT}},

{MDBS,   { LesHouches -> {MSOFT,300},
              LaTeX -> "M^{B}_D",
              OutputName->MDB}},

{MDWBT,  { LesHouches -> {MSOFT,301},
              LaTeX -> "M^{W}_D",
              OutputName->MDW}},
              
{MDGoc,  { LesHouches -> {MSOFT,302},
              LaTeX -> "M^{O}_D",
              OutputName->MDO}},



{MuR,   {  LesHouches -> {DGUV,51},
              LaTeX -> "\\mu_R",
              OutputName->MUR}},

{B[MuR],   {  LesHouches -> {DGUV,101},
              LaTeX -> "B_R",
              OutputName->BMR}},

{MuU,   {  LesHouches -> {DGUV,52},
              LaTeX -> "\\mu_u",
              OutputName->MUU}},

{B[MuU],   {  LesHouches -> {DGUV,102},
              LaTeX -> "B_u",
              OutputName->BMU}},


{MuD,   {  LesHouches -> {DGUV,53},
              LaTeX -> "\\mu_3",
              OutputName->MUD}},

{B[MuD],   {  LesHouches -> {DGUV,103},
              LaTeX -> "B_d",
              OutputName->BMD}},


{LambdaSR,   {  LesHouches -> {DGUV,1},
              LaTeX -> "\\lambda_{SR}",
              OutputName->LSR}},    

{T[LambdaSR],   {  LesHouches -> {DGUV,21},
              LaTeX -> "T_{SR}",
              OutputName->TSR}},  

{LambdaTR,   {  LesHouches -> {DGUV,2},
              LaTeX -> "\\lambda_{TR}",
              OutputName->LTR}},    

{T[LambdaTR],   {  LesHouches -> {DGUV,22},
              LaTeX -> "T_{TR}",
              OutputName->TTR}},  


{LambdaTu,   {  LesHouches -> {DGUV,3},
              LaTeX -> "\\lambda_{Tu}",
              OutputName->LTU}},    

{T[LambdaTu],   {  LesHouches -> {DGUV,23},
              LaTeX -> "T_{Tu}",
              OutputName->TTU}},  


{LambdaTd,   {  LesHouches -> {DGUV,4},
              LaTeX -> "\\lambda_{Td}",
              OutputName->LTD}},    

{T[LambdaTd],   {  LesHouches -> {DGUV,24},
              LaTeX -> "T_{Td}",
              OutputName->TTD}},

{LambdaSu,   {  LesHouches -> {DGUV,5},
              LaTeX -> "\\lambda_{Su}",
              OutputName->LSU}},    

{T[LambdaSu],   {  LesHouches -> {DGUV,25},
              LaTeX -> "T_{Su}",
              OutputName->TSU}},  


{LambdaSd,   {  LesHouches -> {DGUV,6},
              LaTeX -> "\\lambda_{Sd}",
              OutputName->LSD}},    

{T[LambdaSd],   {  LesHouches -> {DGUV,27},
              LaTeX -> "T_{Sd}",
              OutputName->TSD}},

{LambdaSE,   {  LesHouches ->LSE,
              LaTeX -> "\\lambda_{SE}",
              OutputName->LSE}},    

{T[LambdaSE],   {  LesHouches -> TSE,
              LaTeX -> "T_{SE}",
              OutputName->TSE}},

{YE1,   {  LesHouches ->YE1,
              LaTeX -> "Y_{\\hat{E}}",
              OutputName->YE1}},    

{T[YE1],   {  LesHouches -> TE1,
              LaTeX -> "T_{\\hat{E}}",
              OutputName->TE1}},

{YL,   {  LesHouches ->YL,
              LaTeX -> "Y_{L}",
              OutputName->YL}},    

{T[YL],   {  LesHouches -> TL,
              LaTeX -> "T_{L}",
              OutputName->TL}},

{YE2,   {  LesHouches ->YE2,
              LaTeX -> "Y_{\\hat{Bar{E}}}",
              OutputName->YE2}},    

{T[YE2],   {  LesHouches -> TE1,
              LaTeX -> "T_{\\hat{Bar{E}}}",
              OutputName->TE2}},

{MuE,   {  LesHouches ->MUE,
              LaTeX -> "\\mu_E",
              OutputName->MUE}},    

{B[MuE],   {  LesHouches ->BE,
              LaTeX -> "B_E",
              OutputName->BE}}, 



{mru2,       { LaTeX -> "m_{R_u}^2",
             OutputName ->  mru2,
	      LesHouches->{DGUV,41}}},

{mrd2,       { LaTeX -> "m_{R_d}^2",
             OutputName ->  mrd2,
	      LesHouches->{DGUV,42}}},

{mer12,       { LaTeX -> "m_{\\hat{E}}^2",
             OutputName ->  me12,
	      LesHouches->MER12}},

{mer22,       { LaTeX -> "m_{\\hat{Bar{E}}}^2",
             OutputName ->  me22,
	      LesHouches->MER22}},

{ZR,       { LaTeX -> "Z^R",
             OutputName ->  ZR,
	      LesHouches->ZR}},	      

{ZR,       { LaTeX -> "Z^{Rc}",
             OutputName ->  ZRc,
	      LesHouches->ZRC}},

{Zf,       { LaTeX -> "Z^{f}",
             OutputName ->  Zf,
	      LesHouches->ZF}},

{Zf1,       { LaTeX -> "Z^{C_1}",
             OutputName ->  Zf1,
	      LesHouches->ZF1}},

{Zf2,       { LaTeX -> "Z^{C_2}",
             OutputName ->  Zf2,
	      LesHouches->ZF2}}


                  
 }; 
 

