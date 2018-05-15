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
{ZH,        { Description->"Scalar-Mixing-Matrix"}},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix"}},
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
              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},
{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix"}},
{ZfW, {Description ->    "Wino Mixing Matrix"}},

{m32, {Description -> "Gravitino Mass"}},
{MP, {Description -> "Planck Mass"}},

{Xi[B], {Description -> "Hypercharge FI-Term"}},

{Yt,  {LaTeX -> "Y_{t'}",
       LesHouches -> Yt,
       OutputName->Yt }},


{T[Yt], {  LaTeX -> "T_{t'}",
       LesHouches -> Tt,
       OutputName->Tt }},
       

{ZUp, { LaTeX -> "{Z^{U'}}",
       LesHouches -> ZUP,
       OutputName->ZUP }},       
{ZEp, { LaTeX -> "{Z^{E'}}",
       LesHouches -> ZEP,
       OutputName->ZeP }}, 
{ZDp, { LaTeX -> "{Z^{D'}}",
       LesHouches -> ZDP,
       OutputName->ZDP }},        

{mT, { LaTeX -> "M_{T'}",
       LesHouches -> {VectorTop,1},
       OutputName->MTp }},

{B[mT],{  LaTeX -> "B_{T'}",
       LesHouches -> {VectorTop,2},
       OutputName->BTp }},
       
{mQ, { LaTeX -> "M_{Q'}",
       LesHouches -> {VectorTop,3},
       OutputName->MQp }},

{B[mQ],{  LaTeX -> "B_{Q'}",
       LesHouches -> {VectorTop,4},
       OutputName->BQp }},
       
{mTau, { LaTeX -> "M_{E'}",
       LesHouches -> {VectorTop,5},
       OutputName->MEp }},

{B[mTau],{  LaTeX -> "B_{E'}",
       LesHouches -> {VectorTop,6},
       OutputName->BEp }},       

{mUT, { LaTeX -> "m_{t'}",
       LesHouches -> mUT,
       OutputName->mUT }},

{B[mUT],{  LaTeX -> "B_{t'}",
       LesHouches -> bUT,
       OutputName->BUT }},

{mt12, { LaTeX -> "m_{\\tilde{t}'}^2",
       LesHouches -> {VectorTop,10},
       OutputName->mt12 }},

{mt22, { LaTeX -> "m_{\\tilde{\\bar{t}}'}^2",
       LesHouches -> {VectorTop,11},
       OutputName->mt22 }},

{mut12, { LaTeX -> "m_{\\tilde u \\tilde t'}^2",
       LesHouches -> mut2,
       OutputName->mut12 }},
       
       
{mq12, { LaTeX -> "m_{\\tilde{q}'}^2",
       LesHouches -> {VectorTop,101},
       OutputName->mq12 }},

{mq22, { LaTeX -> "m_{\\tilde{\\bar{q}}'}^2",
       LesHouches -> {VectorTop,102},
       OutputName->mq22 }},       

{mb12, { LaTeX -> "m_{\\tilde{d}'}^2",
       LesHouches -> {VectorTop,103},
       OutputName->md12 }},

{mb22, { LaTeX -> "m_{\\tilde{\\bar{d}}'}^2",
       LesHouches -> {VectorTop,104},
       OutputName->md22 }},       

{mtau12, { LaTeX -> "m_{\\tilde{e}'}^2",
       LesHouches -> {VectorTop,105},
       OutputName->me12 }},

{mtau22, { LaTeX -> "m_{\\tilde{\\bar{e}}'}^2",
       LesHouches -> {VectorTop,106},
       OutputName->me22 }},       

{ml12, { LaTeX -> "m_{\\tilde{l}'}^2",
       LesHouches -> {VectorTop,107},
       OutputName->ml12 }},

{ml22, { LaTeX -> "m_{\\tilde{\\bar{l}}'}^2",
       LesHouches -> {VectorTop,108},
       OutputName->ml22 }},
       
{mqq12, {OutputName -> mqq12,
         LesHouches -> mqq12,
         LaTeX -> "m_{\\tilde q \\tilde q'}^2"}},
{mdb12, {OutputName -> mdd12,
         LesHouches -> mdd12,
         LaTeX -> "m_{\\tilde d \\tilde d'}^2"}},
{metau12, {OutputName -> mee12,
         LesHouches -> mee12,
         LaTeX -> "m_{\\tilde e \\tilde e'}^2"}},
{mll12, {OutputName -> mll12,
         LesHouches -> mll12,
         LaTeX -> "m_{\\tilde l \\tilde q'}^2"}},
         
{PhaseTR, {OutputName -> PhiTR,
         LesHouches -> {PHASES,1},
         LaTeX -> "\\phi_{\\tau_R}"}},
         
{PhaseTL, {OutputName -> PhiTL,
         LesHouches -> {PHASES,2},
         LaTeX -> "\\phi_{T_L}"}},
         
{PhaseBL, {OutputName -> PhiBL,
         LesHouches -> {PHASES,3},
         LaTeX -> "\\phi_{B_L}"}}                 
         
                                  
 }; 
 

