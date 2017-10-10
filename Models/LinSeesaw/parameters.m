(* ::Package:: *)

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
{ms2,       { Description -> "Softbreaking Singlet Mass" }},
{mvR2,       { Description -> "Softbreaking right Sneutrino Mass"}},

{mvRs2,       { Description -> "B parameter right Sneutrino S field",
             LaTeX -> "B_{\\nu_RS}",
             DependenceNum ->  None, 
             LesHouches -> BvRs,
             OutputName-> BvRs}},




{MassB,     { Description -> "Bino Mass parameter"}},
{MassWB,    { Description -> "Wino Mass parameter"}},
{MassG,     { Description -> "Gluino Mass parameter"}},
                           
{vd,        { Description -> "Down-VEV"}}, 
{vu,        { Description -> "Up-VEV"}},       
{v,         { Description -> "EW-VEV"}},
{vL,        { Description -> "Sneutrino-VEV"}},
{vR,        { Description -> "Right Sneutrino-VEV"}},
{vs,        { Description -> "Singlet-VEV"}},
             
{\[Beta],   { Description -> "Pseudo Scalar mixing angle"  }},             
{TanBeta,   { Description -> "Tan Beta" }},              
{\[Alpha],  { Description -> "Scalar mixing angle" }},
{AlphaS,  { Description -> "Alpha Strong" }},                          
             
    
{ZD,        { Description -> "Down-Squark-Mixing-Matrix" }},             
{ZU,        { Description -> "Up-Squark-Mixing-Matrix"}},             
{ZE,        { Description -> "Slepton-Mixing-Matrix"}}, 
{ZV,        { Description->"Sneutrino Mixing-Matrix"}},   
{ZH,        { Description->"Scalar-Mixing-Matrix"}}, 
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix"}},
{ZP,        { Description->"Charged-Mixing-Matrix"}},                      
{Zphiv,        { Description->"SnuS-Mixing-Matrix",
 LaTeX -> "Z_{\\phi v}",
             Dependence ->  None, 
             Value -> None, 
             LesHouches-> Zphv,
             OutputName-> Zphv 

}},
{Zsigmav,        { Description->"Pseudo SvuS-Mixing-Matrix",
LaTeX -> "Z_{\\sigma v}",
             Dependence ->  None, 
             Value -> None, 
             LesHouches-> Zsiv,
             OutputName-> Zsiv }},                                        
 
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

{MUS, {OutputName -> MUS,
       LesHouches -> MUS,
       LaTeX -> "\\mu_S"}},
       

{YSL, {OutputName -> YSL,
       LesHouches -> YSL,
     LaTeX -> "Y_{SL}"}},

       
{B[MUS], {OutputName -> BMUS,
       LesHouches -> BMUS,
       LaTeX -> "B_S"}},

       


{T[YSL],{  Description -> "Trilinear-YLS-Coupling",
			 LaTeX -> "T_{Y_{SL}}",
             Value -> None, 
             LesHouches -> TYSL,
             OutputName-> TYSL             }},     
             



{Yv,     { Description -> "Neutrino-Yukawa-Coupling"}},
{T[Yv],     { Description -> "Trilinear-Neutrino-Coupling"}},
{UV,	    {Description -> "Neutrino-Mixing-Matrix"}},

{MR,     { LaTeX -> "M_R",
             OutputName -> MR,
			 LesHouches -> MR}},

{B[MR],     { LaTeX -> "B_{M_R}",
             OutputName -> BMR,
		LesHouches -> BMR}},

 {WOp,       {Description -> "Weinberg Operator"}},
{Q[WOp],       {Description -> "Soft Breaking Weinberg Operator"}}

                                 
 }; 
 

