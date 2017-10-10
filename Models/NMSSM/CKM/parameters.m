ParameterDefinitions = { 

{Yu0,      { Description->"Up-Yukawa-Coupling",
                Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yu[i001,i002]*Delta[i001, i002]* \
                             Uu[i001,index1]*Vu[i002,index2],
                LesHouches -> Yu0               }},    
{Yd0,      { Description->"Down-Yukawa-Coupling",
                Dependence -> sum[i003,1,3]*sum[i004,1,3]*Yd[i003,i004]*Delta[i003, i004]* \
                             Ud[i003,index1]*Vd[i004,index2],
                LesHouches -> Yd0 }},    

{T[Yd0],   { Description->"Trilinear-Down-Coupling",
			 Dependence -> sum[i005,1,3]*sum[i006,1,3]*T[Yd][i005,i006]* \
                             Ud[i005,index1]*Vd[i006,index2],
                LesHouches -> Td0}},   
{T[Yu0],      { Description->"Trilinear-Up-Coupling",
			   Dependence -> sum[i007,1,3]*sum[i008,1,3]*T[Yu][i007,i008]* \
                             Uu[i007,index1]*Vu[i008,index2],
                LesHouches -> Tu0}},
{mq02,      {Description->"Softbreaking left Squark Mass",
               Dependence -> sum[i001,1,3]*sum[i002,1,3]*mq2[i001,i002]*Delta[i001, i002]* \
                             Vd[i001,index1]*conj[Vd[i002,index2]],
                LesHouches -> mq02 }},	
{mu02,      {Description->"Softbreaking right Up-Squark Mass",
	  Dependence -> sum[i001,1,3]*sum[i002,1,3]*mu2[i001,i002]*Delta[i001, i002]* \
                             Uu[i001,index1]*conj[Uu[i002,index2]],
                LesHouches -> mu02 }},             
{md02,      {Description->"Softbreaking right Down-Squark Mass",
		 Dependence -> sum[i001,1,3]*sum[i002,1,3]*md2[i001,i002]*Delta[i001, i002]* \
                             Ud[i001,index1]*conj[Ud[i002,index2]],
                LesHouches -> md02 }},   
                             
{Ye0,      { Description->"Lepton-Yukawa-Coupling",
                Dependence -> sum[i003,1,3]*sum[i004,1,3]*Ye[i003,i004]*Delta[i003, i004]* \
                             Ue[i003,index1]*Ve[i004,index2],
                LesHouches -> Ye0 }},   

{T[Ye0],      { Description->"Trilinear-Lepton-Coupling",
			   Dependence -> sum[i007,1,3]*sum[i008,1,3]*T[Ye][i007,i008]*Delta[i007, i008]* \
                             Ue[i007,index1]*Ve[i008,index2],
                LesHouches -> Te0}},    
                             
{me02,      {Description->"Softbreaking right Slepton Mass",
               Dependence -> sum[i001,1,3]*sum[i002,1,3]*me2[i001,i002]*Delta[i001, i002]* \
                             Ue[i001,index1]*conj[Ue[i002,index2]],
                LesHouches -> me02 }},	
{ml02,      {Description->"Softbreaking left Slepton Mass",
	  Dependence -> sum[i001,1,3]*sum[i002,1,3]*ml2[i001,i002]*Delta[i001, i002]* \
                             conj[Ve[i001,index1]]*Ve[i002,index2],
                LesHouches -> ml02 }}, 
                             
{CKM,        { Description ->"CKM Matrix"}},

{nWolf, {Description->"Wolfenstein Parameter eta" }},
{aWolf, {Description->"Wolfenstein Parameter A"   }},
{lWolf, {Description->"Wolfenstein Parameter lambda"  }},
{rWolf, {Description->"Wolfenstein Parameter rho"  }},           
             
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}},  

{Ve,       { Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,       { Description ->"Right-Lepton-Mixing-Matrix" }},           


{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},
{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},
	
{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "SCKM Up-Yukawa-Coupling"   }}, 
{Yd,        { Description -> "SCKM Down-Yukawa-Coupling"}},
{Ye,        { Description -> "PMNS Electron-Yukawa-Coupling"}}, 

{T[Ye],     { Description -> "PMNS Trilinear-Lepton-Coupling"}},
{T[Yd],     { Description -> "SCKM Trilinear-Down-Coupling"}}, 
{T[Yu],     { Description -> "SCKM Trilinear-Up-Coupling"}}, 

{mq2,       { Description -> "SCKM Softbreaking left Squark Mass"}},
{me2,       { Description -> "PMNS Softbreaking right Slepton Mass"}},
{ml2,       { Description -> "PMNS Softbreaking left Slepton Mass"}},
{mu2,       { Description -> "SCKM Softbreaking right Up-Squark Mass"}},
{md2,       { Description -> "SCKM Softbreaking right Down-Squark Mass"}},
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

              
{ThetaW,    { Description -> "Weinberg-Angle"}},                           
{PhaseGlu,  { Description -> "Gluino-Phase" }},   

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix" }},
{ZfW, {Description ->    "Wino Mixing Matrix"}},
                                                                      
{\[Kappa],   {Description -> "Singlet Self-Interaction"}},                               
{T[\[Kappa]],  { Description -> "Softbreaking Singlet Self-Interaction" }}, 
{\[Lambda],   { Description -> "Singlet-Higgs-Interaction"   }},                               
{T[\[Lambda]],  {Description -> "Softbreaking Singlet-Higgs-Interaction"}},        
             
{ms2,       { Description -> "Softbreaking Singlet Mass" }},
{vS,        { Description -> "Singlet-VEV"}}                         

 }; 
 


