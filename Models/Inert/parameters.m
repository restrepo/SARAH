ParameterDefinitions = { 

{g1,       { LaTeX -> "g_1",
             DependenceNum ->  Sqrt[5/3]gP,
             DependenceOptional -> e/Cos[ThetaW], 
             Value -> None, 
             LesHouches -> None,
	     GUTnormalization -> Sqrt[3/5] }},

{gP,       { LaTeX -> "g'",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {gauge, 2}  }},                                
                           
{g2,       { LaTeX -> "g_2",
             Dependence -> None,
             DependenceOptional -> e/Sin[ThetaW],  
             Value -> None, 
             LesHouches -> {gauge, 1} }},
             
{e,        { LaTeX -> "e",
             Dependence -> None,
             DependenceNum -> Sin[ThetaW]*g2}},                 
             
{g3,       { LaTeX -> "g_3",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {gauge, 3}  }},    
             
 
             
{Yu0,      { Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yu[i001,i002]*Delta[i001, i002]* \
                             Vu[i001,index1]*conj[Uu[i002,index2]] }},                  
             
 
{Yu,       { LaTeX -> "Y^u",
			 Real -> True,
			 Dependence ->  None, 
             Value -> None            }},  

{Yd0,      { Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yd[i001,i002]*Delta[i001, i002]* \
                             Vd[i001,index1]*conj[Ud[i002,index2]] }},             
                  
{Yd,       { LaTeX -> "Y^d",
			 Real -> True,
			 Dependence ->  None, 
             Value -> None 
             }},
             
            
{Ye,       { LaTeX -> "Y^e",
             Real -> True,
			 Form -> Diagonal,
             Dependence ->  None, 
             Value -> None 
             }},
                                                                            
                                                                           
{\[Kappa],  { LaTeX -> "\\kappa",
             Real -> True,
			 Dependence -> None, 
             Value -> None, 
             LesHouches -> {Hmix,1}         }},                                        
                           
{vd,        { LaTeX -> "v_d",
             Dependence -> v, 
             Value -> None, 
             LesHouches -> None         }}, 
             
{vu,        { LaTeX -> "v_u",
             Dependence -> v, 
             Value -> None, 
             LesHouches -> None         }},
             
{v,        { LaTeX -> "v",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {Hmix,3}      }},
             
         
    
            
{UH,        { LaTeX -> "Z^H",
             Real -> True, 
             Value -> None, 
             LesHouches -> None      }},
             
{UA,        { LaTeX -> "Z^A",
             Real -> True,
             Value -> None, 
             LesHouches -> None      }},
             
{UP,        { LaTeX -> "Z^\\pm",
             Real ->True,
             Value -> None, 
             LesHouches -> None      }},                                                                            
 
          
{CKM,        { LaTeX -> "V^{CKM}",
             MatrixProduct -> {Vd,Vu},
             Value -> {{{1,1}, 0.97383}, 
                       {{1,2}, 0.2272}, 
                       {{1,3}, 0.00396},
                       {{2,1}, 0.2271},
                       {{2,2}, 0.97296},
                       {{2,3}, 0.04221},
                       {{3,1}, 0.00814},
                       {{3,2}, 0.04161},
                       {{3,3}, 0.999100}},
             LesHouches -> None      }},
              
 {ThetaW,   { LaTeX -> "\\Theta_W",
             DependenceNum -> ArcCos[g2/Sqrt[g1^2+g2^2]], 
             Value -> None,
             LesHouches -> None      }}                    

 }; 
 

