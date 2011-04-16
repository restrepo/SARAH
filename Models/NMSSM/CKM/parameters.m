ParameterDefinitions = { 

{Yu0,      { Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yu[i001,i002]*Delta[i001, i002]* \
                             Vu[i001,index1]*conj[Uu[i002,index2]],
             LaTeX -> "Y_u^0" }},    

{Yd0,      { Dependence -> sum[i003,1,3]*sum[i004,1,3]*Yd[i003,i004]*Delta[i003, i004]* \
                             Vd[i003,index1]*conj[Ud[i004,index2]],
              LaTeX -> "Y_d^0"}},    

{T[Yd0],   { Dependence -> sum[i005,1,3]*sum[i006,1,3]*T[Yd][i005,i006]*Delta[i005, i006]* \
                             Vd[i005,index1]*conj[Ud[i006,index2]],
              LaTeX -> "T_d^0" }},   

{T[Yu0],      { Dependence -> sum[i007,1,3]*sum[i008,1,3]*T[Yu][i007,i008]*Delta[i007, i008]* \
                             Vu[i007,index1]*conj[Uu[i008,index2]],
              LaTeX -> "T_u^0" }},


{mq02,      {Dependence -> sum[i001,1,3]*sum[i002,1,3]*mq2[i001,i002]*Delta[i001, i002]* \
                             Vd[i001,index1]*conj[Vd[i002,index2]],
               LaTeX -> "m^{0,2}_{\\tilde{q}}" }},	


{mu02,      {Dependence -> sum[i001,1,3]*sum[i002,1,3]*mu2[i001,i002]*Delta[i001, i002]* \
                             conj[Uu[i001,index1]]*Uu[i002,index2],
               LaTeX -> "m^{0,2}_{\\tilde{u}}" }},             
             
{md02,      {Dependence -> sum[i001,1,3]*sum[i002,1,3]*md2[i001,i002]*Delta[i001, i002]* \
                             conj[Ud[i001,index1]]*Ud[i002,index2],
               LaTeX -> "m^{0,2}_{\\tilde{d}}" }},

{CKM,        { Description ->"CKM Matrix"}},

{nWolf, {Description->"Wolfenstein Parameter eta" }},
{aWolf, {Description->"Wolfenstein Parameter A"   }},
{lWolf, {Description->"Wolfenstein Parameter lambda"  }},
{rWolf, {Description->"Wolfenstein Parameter rho"  }},           
             
{Vu,        {LaTeX -> "V_u"}},
{Vd,        {LaTeX -> "V_d"}},
{Uu,        {LaTeX -> "U_u"}},
{Ud,        {LaTeX -> "U_d"}},             


{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "Down-Yukawa-Coupling"}},
{Ye,        { Description -> "Lepton-Yukawa-Coupling"}}, 

{T[Ye],     { Description -> "Trilinear-Lepton-Coupling"}},
{T[Yd],     { Description -> "Trilinear-Down-Coupling"}}, 
{T[Yu],     { Description -> "Trilinear-Up-Coupling"}}, 

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
              Real -> True, 
              Dependence -> None,
              DependenceOptional -> None,
              DependenceNum -> None,
              LesHouches -> NMHMIX      }},
{ZA,        { Description->"Pseudo-Scalar-Mixing-Matrix", 
               Real ->True,
               Dependence -> None,
               DependenceOptional -> None,
               DependenceNum -> None,
               LesHouches -> NMAMIX     }},
{ZP,        { Description->"Charged-Mixing-Matrix"}},                      
                                          
 
{ZN,        { Description->"Neutralino Mixing-Matrix",
              LesHouches -> NMNMIX   }}, 

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
                                                                      
{\[Kappa],   {Description -> "Singlet Self-Interaction"}},                               
{T[\[Kappa]],  { Description -> "Softbreaking Singlet Self-Interaction" }}, 
{\[Lambda],   { Description -> "Singlet-Higgs-Interaction"   }},                               
{T[\[Lambda]],  {Description -> "Softbreaking Singlet-Higgs-Interaction"}},        
             
{ms2,       { Description -> "Softbreaking Singlet Mass" }},
{vS,        { Description -> "Singlet-VEV"}}                         

 }; 
 


