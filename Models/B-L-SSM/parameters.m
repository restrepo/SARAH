ParameterDefinitions = { 
 
{g1BL,        {Description -> "Mixed Gauge Coupling 1"}},
{gBL1,        {Description -> "Mixed Gauge Coupling 2"}},
{gBL,       {   Description -> "B-L-Coupling"}},
{MZp,       {   Description -> "Z' mass"}},
             

             
{MassBp,     { Description -> "Bino' Mass"}},
{MassBBp,     {  Description -> "Mixed Gaugino Mass 1"}},
{MassBpB,     { Description -> "Mixed Gaugino Mass 2"}},

{MuP,     { Description -> "Mu' Parameter"}},
{B[MuP],     { Description -> "B' Parameter"}},
               
{ThetaWp,  { Description -> "Theta'"  }},

{TBetaP,  { LaTeX -> "\\tan(\\beta')",
             Real ->  True, 
             LesHouches ->  {BL,80},
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
{ZVR,        { LaTeX -> "Z^R",
              OutputName -> ZVR,
              LesHouches -> SNUMIXR }},
{ZVI,        { LaTeX -> "Z^I",
              OutputName -> ZVI,
              LesHouches -> SNUMIXI }},  


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


{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}}

      

 }; 
 

