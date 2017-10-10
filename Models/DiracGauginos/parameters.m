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
              OutputName->MDO}}                  
 }; 
 

