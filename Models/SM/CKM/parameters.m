ParameterDefinitions = { 

{g1,        { Description -> "Hypercharge-Coupling"}},
{g2,        { Description -> "Left-Coupling"}},
{g3,        { Description -> "Strong-Coupling"}},    
{AlphaS,    {Description -> "Alpha Strong"}},	
{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},
{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},


{Yu0,      { Description->"Up-Yukawa-Coupling",
                Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yu[i001,i002]*Delta[i001, i002]* \
                             Uu[i001,index1]*Vu[i002,index2],
                LesHouches -> Yu0               }},    
{Yd0,      { Description->"Down-Yukawa-Coupling",
                Dependence -> sum[i003,1,3]*sum[i004,1,3]*Yd[i003,i004]*Delta[i003, i004]* \
                             Ud[i003,index1]*Vd[i004,index2],
                                             LesHouches -> Yd0               }},    

{Ye0,      { Description->"Lepton-Yukawa-Coupling",
                Dependence -> sum[i003,1,3]*sum[i004,1,3]*Ye[i003,i004]*Delta[i003, i004]* \
                             Ue[i003,index1]*Ve[i004,index2],
                LesHouches -> Ye0 }},   

{Yu,        { Description -> "SCKM Up-Yukawa-Coupling",
             DependenceNum ->  Sqrt[2]/v  {{Mass[Fu,1],0,0},
					    {0, Mass[Fu,2],0},
  				            {0, 0, Mass[Fu,3]}}}}, 
{Yd,        { Description -> "SCKM Down-Yukawa-Coupling",
             DependenceNum ->  Sqrt[2]/v {{Mass[Fd,1],0,0},
 				{0, Mass[Fd,2],0},
 				{0, 0, Mass[Fd,3]}}}},
{Ye,        { Description -> "PMNS Electron-Yukawa-Coupling",
			  DependenceNum ->  Sqrt[2]/v* {{Mass[Fe,1],0,0},
             									{0, Mass[Fe,2],0},
             									{0, 0, Mass[Fe,3]}}  }}, 


             
{CKM,        { Description ->"CKM Matrix"}},   
{nWolf, {Description->"Wolfenstein Parameter eta" }},
{aWolf, {Description->"Wolfenstein Parameter A"   }},
{lWolf, {Description->"Wolfenstein Parameter lambda"  }},
{rWolf, {Description->"Wolfenstein Parameter rho"  }},              
                                                                            
                                                                           
{mu2,         { Description -> "SM Mu Parameter"}},                                        
{\[Lambda],  { Description -> "SM Higgs Selfcouplings"}},
{v,          { Description -> "EW-VEV",
               DependenceNum -> Sqrt[4*Mass[VWp]^2/(g2^2)] }},

{mH2,        { Description -> "SM Higgs Mass Parameter"}},

             
{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},
{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},
{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},
{Ud,        {Description ->"Right-Down-Mixing-Matrix"}},  

{Ve,       { Description ->"Left-Lepton-Mixing-Matrix"}},
{Ue,       { Description ->"Right-Lepton-Mixing-Matrix" }},         
              
{ThetaW,    { Description -> "Weinberg-Angle",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWp]^2/Mass[VZ]^2]]  }},

{ZZ, {Description ->   "Photon-Z Mixing Matrix"}},
{ZW, {Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {\[ImaginaryI],-\[ImaginaryI]}} }}

 }; 
 

