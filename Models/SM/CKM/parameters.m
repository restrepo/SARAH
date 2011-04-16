ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    

{e,         { Description -> "electric charge"}}, 

{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum -> Sqrt[2]/v* {{Mass[Fu,1],0,0},
             									{0, Mass[Fu,2],0},
             									{0, 0, Mass[Fu,3]}}}}, 
             									
{Yd,        { Description -> "Down-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fd,1],0,0},
             									{0, Mass[Fd,2],0},
             									{0, 0, Mass[Fd,3]}}}},
             									
{Ye,        { Description -> "Lepton-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}}},  

{Yu0,      { Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yu[i001,i002]*Delta[i001, i002]* \
                             Vu[i001,index1]*conj[Uu[i002,index2]],
             LaTeX -> "Y_u^0" }},    

{Yd0,      { Dependence -> sum[i003,1,3]*sum[i004,1,3]*Yd[i003,i004]*Delta[i003, i004]* \
                             Vd[i003,index1]*conj[Ud[i004,index2]],
              LaTeX -> "Y_d^0"}}, 
              
{CKM,        { Description ->"CKM Matrix"}},   
{nWolf, {Description->"Wolfenstein Parameter eta" }},
{aWolf, {Description->"Wolfenstein Parameter A"   }},
{lWolf, {Description->"Wolfenstein Parameter lambda"  }},
{rWolf, {Description->"Wolfenstein Parameter rho"  }},              
                                                                            
                                                                           
{Mu,         { Description -> "SM Mu Parameter"}},                                        
{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}},
{v,          { Description -> "EW-VEV" }},

             
         
{ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
{ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
{ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
{ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           
              
{ThetaW,    { Description -> "Weinberg-Angle"}}

 }; 
 

