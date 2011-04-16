ParameterDefinitionsMain = { 


(*----------------------------------------*)
(* Gauge Couplings                        *)
(*----------------------------------------*)

{{   Description -> "Hypercharge-Coupling", 
			 LaTeX -> "g_1",
             DependenceOptional -> e/Cos[ThetaW], 
             DependenceNum -> e/Cos[ThetaW], 
             LesHouches -> {gauge,1},
             GUTnormalization -> Sqrt[3/5],
             OutputName-> g1 }},

                          
{{ Description -> "Left-Coupling", 
			LaTeX -> "g_2",
             DependenceOptional -> e/Sin[ThetaW],  
             DependenceNum -> e/Sin[ThetaW], 
             LesHouches -> {gauge, 2},
             OutputName-> g2 }},
             
{{ Description -> "electric charge",
			 LaTeX -> "e",
			 Value -> Sqrt[4 Pi 1/137.035999679],
			 Real -> True,
 			 LesHouches -> None,
             OutputName-> el
			         }},                 
             
{{ Description -> "Strong-Coupling", 
			 LaTeX -> "g_3",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {gauge, 3},
             OutputName-> g3  }}, 
             
 {{ Description -> "Weinberg-Angle",
 			 LaTeX -> "\\Theta_W",
 			 Real ->True,
             DependenceNum -> ArcCos[g2/Sqrt[g1^2+g2^2]],
             Value -> 0.511621,
             OutputName-> TW,
             LesHouches -> None      }},                


(*----------------------------------------*)
(* Yukawa Couplings                       *)
(*----------------------------------------*)

             
 
{{ Description -> "Up-Yukawa-Coupling",
			 LaTeX -> "Y_u",
             Dependence ->  None, 
             DependenceNum ->  Sqrt[2]/vu  {{Mass[Fu,1],0,0},
             							    {0, Mass[Fu,2],0},
             								{0, 0, Mass[Fu,3]}}, 
             Value -> None, 
             LesHouches -> Yu,
             OutputName-> Yu
             }},  
             
{{  Description -> "Down-Yukawa-Coupling",
			 LaTeX -> "Y_d",
             Dependence ->  None, 
             DependenceNum ->  Sqrt[2]/vd {{Mass[Fd,1],0,0},
             								{0, Mass[Fd,2],0},
             								{0, 0, Mass[Fd,3]}}, 
            Value -> None, 
             LesHouches -> Yd,
             OutputName-> Yd             }},
             
{{  Description -> "Lepton-Yukawa-Coupling",
			 LaTeX -> "Y_e",
             Dependence ->  None, 
             DependenceNum ->  Sqrt[2]/vd {{Mass[Fe,1],0,0},
             								{0, Mass[Fe,2],0},
             								{0, 0, Mass[Fe,3]}}, 
             Value -> None, 
             LesHouches -> Ye,
             OutputName-> Ye            }},             


(*----------------------------------------*)
(* Trilinear Soft-breaking Couplings      *)
(*----------------------------------------*)



{{ Description -> "Trilinear-Lepton-Coupling",
			 LaTeX -> "T_e",
             Value -> None, 
             LesHouches -> Te,
             OutputName-> Te             }},

  
{{  Description -> "Trilinear-Down-Coupling",
			 LaTeX -> "T_d",
             Value -> None, 
             LesHouches -> Td,
             OutputName-> Td             }},     
             

{{  Description -> "Trilinear-Up-Coupling",
			 LaTeX -> "T_u",
             Value -> None, 
             LesHouches -> Tu,
             OutputName-> Tu             }}, 


(*----------------------------------------*)
(* Mu / B_Mu Parameter                    *)
(*----------------------------------------*)


                                                                           
{{  Description -> "Mu-parameter",
			 LaTeX -> "\\mu",
             Real -> False,
			 Dependence -> None, 
             Value -> None, 
             LesHouches -> {HMIX,1},
             OutputName-> Mu }},                               \
               
{{  Description -> "Bmu-parameter",
 		 	 LaTeX -> "B_{\\mu}",
             Real -> False,
          (*  DependenceNum ->  Sin[2 \[Beta]]/(2\[Mu])*(mHd2 + mHu2 + 2Abs[\[Mu]])^2,  *)
			 LesHouches ->{HMIX,101},
             Value -> None,
             OutputName-> Bmu }},        
             
(*----------------------------------------*)
(* Soft-breaking masses                   *)
(*----------------------------------------*)
             
             
{{  Description -> "Softbreaking left Squark Mass",
			 LaTeX -> "m_q^2",
             Real -> False,
			 DependenceNum -> None, 
             Value -> None,
             LesHouches -> MSQ2,
             OutputName-> mq2}},
                          

{{ Description -> "Softbreaking right Slepton Mass",
		     LaTeX -> "m_e^2",
             Real ->False,
			 DependenceNum ->  None, 
             Value -> None,
             LesHouches -> MSE2,
             OutputName-> me2}},
              

{{  Description -> "Softbreaking left Slepton Mass",
		     LaTeX -> "m_l^2",
             DependenceNum ->  None, 
             Real -> False,
			 Value -> None,
             LesHouches -> MSL2,
             OutputName-> ml2}},

             
{{  Description -> "Softbreaking right Up-Squark Mass",
 			 LaTeX -> "m_u^2",
             DependenceNum ->  None, 
             Real -> False,
			 Value -> None,
             LesHouches -> MSU2,
             OutputName-> mu2}},
			  
             
{{   Description -> "Softbreaking right Down-Squark Mass",
			 LaTeX -> "m_d^2",
             DependenceNum ->  None, 
             Real -> False,
             Value -> None,
             LesHouches -> MSD2,
             OutputName-> md2}},

{{  Description -> "Softbreaking Down-Higgs Mass",
			LaTeX -> "m_{H_d}^2",
             Real -> True,
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {MSOFT,21},
             OutputName-> mHd2        }},       


{{ Description -> "Softbreaking Up-Higgs Mass",
			 LaTeX -> "m_{H_u}^2",
             Real -> True,
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> {MSOFT,22},
             OutputName-> mHu2        }}, 
             
{{  Description -> "Bino Mass parameter",
			LaTeX -> "M_1",
              Real ->False,
              Form -> Scalar,
              LesHouches -> {MSOFT,1},
             OutputName-> M1 }},
              
{{  Description -> "Wino Mass parameter",
				LaTeX -> "M_2",
              Real -> False,
              Form -> Scalar,
              LesHouches -> {MSOFT,2},
             OutputName-> M2}},

{{  Description -> "Gluino Mass parameter",
			LaTeX -> "M_3",
              Real -> False,
              Form -> Scalar,
              LesHouches -> {MSOFT,3},
             OutputName-> M3 }},


(*----------------------------------------*)
(* Vacuum expectation values              *)
(*----------------------------------------*)

                           
{{  Description -> "Down-VEV",
			 LaTeX -> "v_d",
			 Real ->True,
             DependenceNum ->  Cos[\[Beta]]*v, 
             Value -> None, 
             LesHouches -> {HMIX,102},
             OutputName-> vd         }}, 
             
{{ Description -> "Up-VEV", 
			 LaTeX -> "v_u",
			 Real ->True,
             DependenceNum ->  Sin[\[Beta]]*v, 
             Value -> None, 
             LesHouches ->  {HMIX,103},
             OutputName-> vu         }},
             
{{  Description -> "EW-VEV",
			 LaTeX -> "v",
             Dependence ->  None, 
             Real -> True,
             DependenceNum -> Sqrt[4*Mass[VWm]^2/(g2^2)],
             DependenceSPheno -> Sqrt[vu^2 + vd^2],
             Value -> None, 
             LesHouches -> {HMIX,3},
             OutputName-> v      }},
             
(*----------------------------------------*)
(* Mixing Angles                          *)
(*----------------------------------------*)
             
             
{{Description -> "Pseudo Scalar mixing angle",
			 LaTeX -> "\\beta",
			 DependenceSPheno -> ArcSin[ZA[1,2]],
  (*           DependenceNum -> ArcTan[TanBeta],  *)
             Real -> True, 
             LesHouches -> {HMIX, 10},
             OutputName-> beta      }},
             
{{Description -> "Tan Beta" ,
			 LaTeX -> "\\tan(beta)",
   			 Real ->True,
             LesHouches -> {HMIX,2},
             OutputName-> tb      }},                
             
{{Description -> "Scalar mixing angle",
			 LaTeX -> "\\alpha",
             DependenceSPheno -> ArcCos[ZH[1,2]], 
(*             DependenceNum ->1/2 ArcTan[Tan[2 \[Beta]] (Mass[Ah,2]^2+Mass[VZ]^2)/(Mass[Ah,2]^2-Mass[VZ]^2)], *)
             Real -> True, 
             LesHouches -> {HMIX, 11},
             OutputName-> alpha     }},                          
             
(*----------------------------------------*)
(* Mixing matrices (SUSY sector)          *)
(*----------------------------------------*)
             
    
{{ Description -> "Down-Squark-Mixing-Matrix",
			 LaTeX -> "Z^D",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> DSQMIX,
             OutputName-> ZD    }},
             
{{ Description -> "Up-Squark-Mixing-Matrix",
			 LaTeX -> "Z^U",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> USQMIX,
             OutputName-> ZU     }},
             
{{ Description -> "Slepton-Mixing-Matrix",
			 LaTeX -> "Z^E",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> SELMIX,
             OutputName-> ZE     }}, 
             
{{ Description->"Neutralino Mixing-Matrix",
			 LaTeX -> "N",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  NMIX,
             OutputName-> ZN 			        }}, 
             
{{ Description->"Sneutrino Mixing-Matrix",
			 LaTeX -> "Z^V",
             Dependence ->  None, 
             Value -> None, 
             LesHouches ->  SNUMIX,
             OutputName-> ZV 			        }}, 
             
{{ Description->"Chargino-plus Mixing-Matrix",
			 LaTeX -> "V",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UMIX,
             OutputName-> UP      }}, 
             
{{  Description->"Chargino-minus Mixing-Matrix",
			 LaTeX -> "U",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> VMIX,
             OutputName-> UM      }},              

(*----------------------------------------*)
(* Mixing matrices (Higgs sector)         *)
(*----------------------------------------*)
             
             
{{ Description->"Scalar-Mixing-Matrix", 
			 LaTeX -> "Z^H",
             Real -> True, 
             DependenceOptional ->   {{-Sin[\[Alpha]],Cos[\[Alpha]]},
                              {Cos[\[Alpha]],Sin[\[Alpha]]}}, 
             Value -> None, 
             LesHouches -> SCALARMIX,
             OutputName-> ZH     }},
             
{{   Description->"Pseudo-Scalar-Mixing-Matrix", 
   			 LaTeX -> "Z^A",
             Real -> True,
             DependenceOptional -> {{-Cos[\[Beta]],Sin[\[Beta]]},
                            {Sin[\[Beta]],Cos[\[Beta]]}}, 
             Value -> None, 
             LesHouches -> PSEUDOSCALARMIX,
             OutputName-> ZA      }},
             
{{  Description->"Charged-Mixing-Matrix", 
 			 LaTeX -> "Z^+",
             Real ->False,
             DependenceOptional -> {{-Cos[\[Beta]],Sin[\[Beta]]},
                            {Sin[\[Beta]],Cos[\[Beta]]}}, 
             Value -> None, 
             LesHouches -> CHARGEMIX,
             OutputName-> ZP      }},                       
                                          
 
(*----------------------------------------*)
(* Mixing matrices (SM sector)            *)
(*----------------------------------------*)

 {{Description ->"Left-Lepton-Mixing-Matrix", 
 			 LaTeX -> "U^e_L",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UELMIX,
             OutputName-> ZEL      }},            
            
 {{Description ->"Right-Lepton-Mixing-Matrix", 
 			 LaTeX -> "U^e_R",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UERMIX,
             OutputName-> ZER      }},              
             
 
 {{Description ->"Left-Down-Mixing-Matrix", 
 			 LaTeX -> "U^d_L",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UDLMIX,
             OutputName-> ZDL      }},            
            
 {{Description ->"Right-Down-Mixing-Matrix", 
 			 LaTeX -> "U^d_R",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UDRMIX,
             OutputName-> ZDR      }},
             
 {{Description ->"Left-Up-Mixing-Matrix", 
 			 LaTeX -> "U^u_L",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UULMIX,
             OutputName-> ZUL      }},            
            
 {{Description ->"Right-Up-Mixing-Matrix", 
 			 LaTeX -> "U^u_R",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UURMIX,
             OutputName-> ZUR      }},                   
             
(*----------------------------------------*)
(* CKM Matrix                             *)
(*----------------------------------------*)
             
{{Description ->"CKM Matrix", 
			 LaTeX -> "V^{CKM}",
             MatrixProduct -> {Vd,Vu},
             Dependence ->  None, 
             DependenceNum -> {{1-1/2*lWolf^2,lWolf,aWolf*lWolf^3*Sqrt[rWolf^2+nWolf^2]},
                               {-lWolf,1-1/2*lWolf^2, aWolf*lWolf^2},
                               {aWolf*lWolf^3*Sqrt[(1-rWolf)^2 +nWolf^2],-aWolf*lWolf^2,1}},
             LesHouches -> VCKM,
             OutputName-> CKM      }}, 
             
{{Description ->"Complex CKM Matrix", 
			 LaTeX -> "V^{CKM}",
             MatrixProduct -> {Vd,Vu},
             Dependence ->  None, 
             DependenceNum -> {{1-1/2*lWolf^2,lWolf,aWolf*lWolf^3*(rWolf-I*nWolf)},
                               {-lWolf,1-1/2*lWolf^2, aWolf*lWolf^2},
                               {aWolf*lWolf^3*(1-rWolf-I*nWolf),-aWolf*lWolf^2,1}},
             LesHouches -> VCKM,
             OutputName-> CKM      }},              
             

{{Description->"Wolfenstein Parameter eta", 
             Value -> 0.341,
             Real -> True,
             OutputName-> nWolf,
             LesHouches -> {WOLFENSTEIN,4} 	            }},
             
{{Description->"Wolfenstein Parameter A", 
             Value -> 0.8080,
             Real -> True,
             OutputName-> aWolf,
             LesHouches -> {WOLFENSTEIN,2}           }},
             
{{Description->"Wolfenstein Parameter lambda", 
             Value -> 0.22253,
             Real -> True,
             OutputName-> lWolf,
             LesHouches -> {WOLFENSTEIN,1}          }},
             
{{Description->"Wolfenstein Parameter rho", 
             Value -> 0.132,
             Real -> True,
             OutputName-> rWolf,
             LesHouches -> {WOLFENSTEIN,3}            }},


(*----------------------------------------*)
(* CKM related                            *)
(*----------------------------------------*)

             
{{ Description->"Offdiagonal Up-Yukawa Coupling",
			 Dependence -> sum[i001,1,3]*sum[i002,1,3]*Yu[i001,i002]*Delta[i001, i002]* \
                             Vu[i001,index1]*conj[Uu[i002,index2]],
             LaTeX -> "Y_u^0",
             OutputName -> Yu0 }},    

{{ Description->"Offdiagonal Down-Yukawa Coupling",
			 Dependence -> sum[i003,1,3]*sum[i004,1,3]*Yd[i003,i004]*Delta[i003, i004]* \
                             Vd[i003,index1]*conj[Ud[i004,index2]],
              LaTeX -> "Y_d^0",
             OutputName -> Yd0}},    

{{ Description->"Offdiagonal Trilinear Down-Coupling",
			 Dependence -> sum[i005,1,3]*sum[i006,1,3]*T[Yd][i005,i006]*Delta[i005, i006]* \
                             Vd[i005,index1]*conj[Ud[i006,index2]],
              LaTeX -> "T_d^0",
             OutputName -> Td0 }},   

{{ Description->"Offdiagonal Trilinear Up-Coupling",
			   Dependence -> sum[i007,1,3]*sum[i008,1,3]*T[Yu][i007,i008]*Delta[i007, i008]* \
                             Vu[i007,index1]*conj[Uu[i008,index2]],
              LaTeX -> "T_u^0",
             OutputName -> Tu0 }},


{{Description->"Offdiagonal Softbreaking left Squark Mass",
			 Dependence -> sum[i001,1,3]*sum[i002,1,3]*mq2[i001,i002]*Delta[i001, i002]* \
                             Vd[i001,index1]*conj[Vd[i002,index2]],
               LaTeX -> "m^{0,2}_{\\tilde{q}}",
               OutputName -> mq02 }},	


{{Description->"Offdiagonal Softbreaking right Up-Squark Mass",
			  Dependence -> sum[i001,1,3]*sum[i002,1,3]*mu2[i001,i002]*Delta[i001, i002]* \
                             conj[Uu[i001,index1]]*Uu[i002,index2],
               LaTeX -> "m^{0,2}_{\\tilde{u}}",
               OutputName -> mu02 }},             
             
{{Description->"Offdiagonal Softbreaking right Up-Squark Mass",
			 Dependence -> sum[i001,1,3]*sum[i002,1,3]*md2[i001,i002]*Delta[i001, i002]* \
                             conj[Ud[i001,index1]]*Ud[i002,index2],
               LaTeX -> "m^{0,2}_{\\tilde{d}}",
               OutputName -> md02 }},             
             
        



(*----------------------------------------*)
(* Gluino Phase                           *)
(*----------------------------------------*)          
 
                
 {{ Description -> "Gluino-Phase",
 			 LaTeX -> "\\phi_{\\tilde{g}}",
             Value -> None,
             LesHouches -> {Phases, 1},
             OutputName-> pG      }},


(*----------------------------------------*)
(* For U(1) x U(1)                        *)
(*----------------------------------------*)          

             
{{Description -> "Theta'",
 			 LaTeX -> "{\\Theta'}_W",
 			 DependenceNum ->ArcTan[(2 g1g1p Sqrt[g1^2+g2^2])/(g1g1p^2 + 16 (x1^2+x2^2)/(vd^2+vu^2) -g1^2-g2^2)]/2,
 			 Real ->True,
             OutputName-> TWp      }},  
             
{{Description -> "U(1)' Gauge Coupling",
              LaTeX -> "g_p",
              Real ->True,
              LesHouches -> {GAUGE,5} }}, 
              
(*----------------------------------------*)
(* Additional B-L Coupling                *)
(*----------------------------------------*)  
              
{{Description -> "B-L-Coupling", 
			 LaTeX -> "g_{B}",
			 GUTnormalization -> Sqrt[3/2],
             Dependence -> None, 
             LesHouches -> {gauge,4} }},              
              
{{Description -> "Mixed Gauge Coupling 1",
                LesHouches -> {Gauge, 10},
                LaTeX -> "g_{Y B}" }},
                
{{Description -> "Mixed Gauge Coupling 2",
                 LesHouches -> {Gauge, 11},
                 Dependence -> 0,
                LaTeX -> "g_{B Y}"}},
                
{{Description -> "Z' mass", 
			 LaTeX -> "M_{Z'}",
             Dependence -> None, 
             Real -> True,
             Value -> 1500, 
             LesHouches -> None }},
             
{{Description -> "Bino' Mass",
              LaTeX -> "{M}_{BL}",
              LesHouches -> {BL,31} }},

{{Description -> "Mixed Gaugino Mass 1",
         LaTeX -> "{M}_{B B'}",
         LesHouches -> {BL,32} }},

{{Description -> "Mixed Gaugino Mass 2",
               LaTeX -> "{M}_{B' B}",
 		       LesHouches -> {BL,32} }},

{{Description -> "Mu' Parameter",
               LaTeX -> "{\\mu_X}",
               LesHouches -> {BL,1} }},
               
{{Description -> "B' Parameter",
               LaTeX -> "B_X",
               LesHouches -> {BL,2}}},
               
                           


(*----------------------------------------*)
(* NMSSM specific                         *)
(*----------------------------------------*)          


{{  Description -> "Singlet Self-Interaction",
              LaTeX -> "\\kappa",
             Real ->False,
             Dependence -> None, 
             Value -> None, 
             LesHouches -> {NMSSMRUN,2},
             OutputName-> kap         }},                               
               
{{ Description -> "Softbreaking Singlet Self-Interaction",
               LaTeX -> "T_{\\kappa}",
              Real -> False,
             Dependence -> None, 
             Value -> None, 
             LesHouches ->{NMSSMRUN,4},
             OutputName-> Tk         }}, 

{{ Description -> "Singlet-Higgs-Interaction",
             LaTeX -> "\\lambda",
             Real -> False,
	     Dependence -> None, 
             Value -> None, 
             LesHouches -> {NMSSMRUN,1},
             OutputName-> lam          }},                               
               
{{Description -> "Softbreaking Singlet-Higgs-Interaction",
                LaTeX -> "T_{\\lambda}",
              Real -> False,
             Dependence -> None, 
             Value -> None, 
             LesHouches ->{NMSSMRUN,3},
             OutputName-> Tlam         }},        
             
{{ Description -> "Softbreaking Singlet Mass", 
              LaTeX -> "m_S^2",
             DependenceNum ->  None, 
             Real -> True,
             Form -> Diagonal,
             LesHouches -> {NMSSMRUN,10},
             OutputName-> ms2 }},
              
{{ Description -> "Singlet-VEV", 
			 LaTeX -> "v_s",
             Value -> None, 
             LesHouches -> {NMSSMRUN,5},
             OutputName-> vS         }},


(*----------------------------------------*)
(* R-parity violation                     *)
(*----------------------------------------*)          

{{ Description -> "Sneutrino-VEV",
             LaTeX -> "v_L",
             Real -> True,
             LesHouches ->  RVSNVEV,
             OutputName-> vL }},   


{{ Description -> "Right Sneutrino-VEV",
             LaTeX -> "v_R",
             Real -> True,
             OutputName-> vR,
             LesHouches -> RIGHTVEV }}, 

{{ Description -> "Bilinear RpV-Parameter",
              LaTeX -> "\\epsilon",
             LesHouches -> RVKAPPA,
             OutputName-> Eps }}, 
               
{{ Description -> "Softbreaking Bilinear RpV-Parameter",
               LaTeX -> "B_\\epsilon",
             LesHouches -> RVD,
             OutputName-> Beps  }},
             
{{ Description -> "Soft-breaking Higgs Slepton Mixing Term",
            LaTeX ->"m_{l H}^2",
            LesHouches -> RVM2LH1}},
             
             
(*----------------------------------------*)
(* Neutrino Couplings                     *)
(*----------------------------------------*)          
             

{{ Description -> "Neutrino-Yukawa-Coupling",
             LaTeX -> "Y_v",
             LesHouches -> Yv,
             OutputName-> Yv
             }},     

{{  Description -> "Trilinear-Neutrino-Coupling",
              LaTeX -> "T_v",
             LesHouches -> Tv,
             OutputName-> Tv             }},

{{ Description -> "Softbreaking right Sneutrino Mass",
             LaTeX -> "{m_v^2}",
             DependenceNum ->  None, 
             LesHouches -> mv2,
             OutputName-> mv2
			}},
			
			
(*----------------------------------------*)
(* SM Parameters                          *)
(*----------------------------------------*)   


{{Description -> "SM Mu Parameter",
            LaTeX -> "\\mu",
	        OutputName -> Mu,
	        LesHouches -> None }},                                        

{{ Description -> "SM Higgs Selfcouplings",
            LaTeX -> "\\lambda",
	        OutputName -> Lam,
	        LesHouches -> None }}

			                                 
 }; 
 

