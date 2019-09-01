(* ::Package:: *)

ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},  
		
{AlphaS,    { Description -> "Alpha Strong"}},

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling"}}, 

{T[Ye],     { Description -> "Trilinear-Lepton-Coupling"}},
{T[Yd],     { Description -> "Trilinear-Down-Coupling"}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling"}}, 

{\[Mu],     { Description -> "Mu-parameter" }}, 
{B[\[Mu]],  { Description -> "Bmu-parameter" }},        

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
{ZZ, {Description ->   "Photon-Z-Z' Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},

     
{ZG,       { LaTeX -> "Z^G",
             OutputName ->  ZG,
             LesHouches->ZG}},	      

{mS2,       { Description -> "Softbreaking Singlet Mass" }},

{vS,        { Description -> "Singlet-VEV" }},

{MDBS,   { LesHouches -> {MSOFT,300},
           Real -> True,
           LaTeX -> "m_{2}",
           OutputName->MDB }},

{MDBpS,  { LesHouches -> {MSOFT,310},
           Real -> True,
           LaTeX -> "m_{1}",
           OutputName->MDBp }},
              
{ThetaWp,  { Description -> "Theta'",
             DependenceNum -> None,
             DependenceSPheno -> ArcSin[Abs[ZZ[3,3]]] }},

{gp,       {Description -> "U(1)' Gauge Coupling"}},             
              
{M2a, {LaTeX -> "m_{2}",
          Real -> True,
          LesHouches->None,
          OutputName ->  M2a,
          Dependence->MDBS}},              
{M1a, {LaTeX -> "m_{1}",
          Real -> True,
          LesHouches->None,
          OutputName ->  M1a,
          Dependence-> MDBpS}},
         
{M2a2, {LaTeX -> "m^{2}_{2} ",
           Real -> True,
           LesHouches->None,
           OutputName ->  M2a2,
           Dependence->MDBS^2}},              
{M1a2, {LaTeX -> "m^{2}_{1} ",
           Real -> True,
           LesHouches->None,
           OutputName ->  M1a2,
           Dependence->MDBpS^2}}, 

(*{M1aM2a, {LaTeX -> "m_{1}m_{2} ",
           LesHouches->None,
           OutputName ->  M1aM2a,
           Dependence->MDBS*MDBpS}}, *)

{g1p,  { LesHouches -> {gauge, 15},
         LaTeX -> "g_{Y B}",
         OutputName -> gYB }},
{gp1,  { LesHouches -> {gauge, 16},
         LaTeX -> "g_{B Y}",
         OutputName -> gBY}},

{MZp,  { Description -> "Z' mass"}},

{MassBBp,   { Description -> "Mixed Gaugino Mass 1"}},
{MassBpB,   { Description -> "Mixed Gaugino Mass 2"}},
{MassBp,    { LaTeX -> "M_X",
              Form -> Scalar,
              OutputName -> MX,
              LesHouches -> {MSOFT,311} }}
            
 }; 
