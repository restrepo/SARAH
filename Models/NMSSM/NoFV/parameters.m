ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling",
              Form -> Diagonal, 
              DependenceNum ->  1/(Sqrt[2] vu)* {{Mass[Fu,1],0,0},
             									{0, Mass[Fc,1],0},
             									{0, 0, Mass[Ft,1]}} }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling",
              Form -> Diagonal, 
              DependenceNum ->  1/(Sqrt[2] vd)* {{Mass[Fd,1],0,0},
             									{0, Mass[Fs,1],0},
             									{0, 0, Mass[Fb,1]}}}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
              Form -> Diagonal, 
              DependenceNum ->  1/(Sqrt[2] vd)* {{Mass[Fe,1],0,0},
             									{0, Mass[Fm,1],0},
             									{0, 0, Mass[Ftau,1]}}}}, 

{T[Ye],     { Description -> "Trilinear-Lepton-Coupling",
              Form -> Diagonal }},
{T[Yd],     { Description -> "Trilinear-Down-Coupling",
              Form -> Diagonal}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling",
              Form -> Diagonal}}, 

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
             
    
{ZD,        { LaTeX -> "Z^D",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> sdownmix			  }},
             
{ZS,        { LaTeX -> "Z^S",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> sstrmix			  }},             
             
{ZB,        { LaTeX -> "Z^B",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> sbotmix			  }},
     
         
             
{ZU,        { LaTeX -> "Z^U",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  supmix			       }},
             
         
             
{ZC,        { LaTeX -> "Z^C",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  scharmmix			       }},


         
             
{ZT,        { LaTeX -> "Z^T",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  stopmix			       }},
             
             
{ZE,        { LaTeX -> "Z^E",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> selemix			        }}, 
             
{ZM,        { LaTeX -> "Z^\\mu",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> smumix			        }}, 

{ZTau,        { LaTeX -> "Z^\\tau",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> staumix,
		OutputName->ZTa			        }},

{ZH,        { Description->"Scalar-Mixing-Matrix", 
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None,
              LesHouches -> NMHMIX      }},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
                Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None,
               LesHouches -> NMAMIX     }},
{ZP,        { Description->"Charged-Mixing-Matrix"}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix",
              LesHouches -> NMNMIX   }}, 

{UP,        { Description->"Chargino-plus Mixing-Matrix"}}, 
{UM,        { Description->"Chargino-minus Mixing-Matrix"}}, 

              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},   
                                                                      
{\[Kappa],   {Description -> "Singlet Self-Interaction"}},                               
{T[\[Kappa]],  { Description -> "Softbreaking Singlet Self-Interaction" }}, 
{\[Lambda],   { Description -> "Singlet-Higgs-Interaction"   }},                               
{T[\[Lambda]],  {Description -> "Softbreaking Singlet-Higgs-Interaction"}},        
             
{ms2,       { Description -> "Softbreaking Singlet Mass" }},
{vS,        { Description -> "Singlet-VEV"}}             
             
 }; 
 


