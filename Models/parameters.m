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

{{ Description -> "inverse weak coupling constant at mZ",
              Value ->  137.035999679,
              LaTeX -> "\\alpha^{-1}",
              Real -> True,
              OutputName -> aEWinv,
              LesHouches -> {SMINPUTS,1} }},


{{ Description -> "Fermi's constant",
              Value ->  0.0000116639,
              LaTeX -> "G_f",
              Real -> True,
              OutputName -> Gf,
              LesHouches -> {SMINPUTS,2} }},

             
{{ Description -> "electric charge",
	      LaTeX -> "e",
(*              Value -> Sqrt[4 Pi 1/137.035999679], *)
              DependenceNum -> Sqrt[4 Pi/aEWinv],
              Real -> True,
              LesHouches -> None,
             OutputName-> el
			         }},     

 {{ Description -> "Weinberg-Angle",
             LaTeX -> "\\Theta_W",
             Real ->True,
 (*            DependenceNum -> ArcCos[g2/Sqrt[g1^2+g2^2]], *)
             DependenceNum -> ArcSin[Sqrt[1 - Mass[VWm]^2/Mass[VZ]^2]],
             DependenceSPheno -> ArcCos[Abs[ZZ[1,1]]],
 (*            Value -> 0.511621, *)
             OutputName-> TW,
             LesHouches -> None      }},             
             
{{ Description -> "Strong-Coupling", 
             LaTeX -> "g_3",
             Dependence ->  None,
             DependenceNum -> Sqrt[AlphaS 4 Pi], 
             Value -> None, 
             LesHouches -> {gauge, 3},
             OutputName-> g3  }}, 
             
{{ Description -> "Alpha Strong", 
			 LaTeX -> "\\alpha_S",
             Value -> 0.119, 
             Real -> True,
             LesHouches -> {SMINPUTS,3},
             OutputName-> aS  }}, 
             
             
               


(*----------------------------------------*)
(* Yukawa Couplings                       *)
(*----------------------------------------*)

             
 
{{ Description -> "Up-Yukawa-Coupling",
			 LaTeX -> "Y_u",
             LesHouches -> Yu,
             OutputName-> Yu
             }},  
             
{{  Description -> "Down-Yukawa-Coupling",
			 LaTeX -> "Y_d",
             LesHouches -> Yd,
             OutputName-> Yd             }},
             
{{  Description -> "Lepton-Yukawa-Coupling",
			 LaTeX -> "Y_e",
             LesHouches -> Ye,
             OutputName-> Ye            }},             


(*----------------------------------------*)
(* Trilinear Soft-breaking Couplings      *)
(*----------------------------------------*)



{{ Description -> "Trilinear-Lepton-Coupling",
			 LaTeX -> "T_e",
             LesHouches -> Te,
             OutputName-> Te             }},

  
{{  Description -> "Trilinear-Down-Coupling",
			 LaTeX -> "T_d",
             LesHouches -> Td,
             OutputName-> Td             }},     
             

{{  Description -> "Trilinear-Up-Coupling",
			 LaTeX -> "T_u",
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

{{   Description -> "Hypercharge FI-Term", 
	     LaTeX -> "\\xi_Y",
             LesHouches -> {FITERMS,1},
             OutputName-> XiY }},
             
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
			 DependenceSPheno -> ArcSin[Abs[ZP[1,2]]],
  (*           DependenceNum -> ArcTan[TanBeta],  *)
             Real -> True, 
             LesHouches -> {HMIX, 10},
             OutputName-> betaH      }},
             
{{Description -> "Tan Beta" ,
			 LaTeX -> "\\tan(beta)",
   			 Real ->True,
             LesHouches -> {HMIX,2},
             OutputName-> tb      }},                
             
{{Description -> "Scalar mixing angle",
			 LaTeX -> "\\alpha",
             DependenceSPheno -> ArcTan[ZH[2,2]/ZH[1,2]], 
             Real -> True, 
             LesHouches -> {HMIX, 11},
             OutputName-> alphaH     }},  

(*----------------------------------------*)
(* Rotations EWSB                         *)
(*----------------------------------------*) 

{{Description -> "Photon-Z Mixing Matrix",
       Dependence ->  {{Cos[ThetaW],-Sin[ThetaW]},                             
                       {Sin[ThetaW],Cos[ThetaW]}},
       Real ->True,
       LaTeX -> "Z^{\\gamma Z}",
       LesHouches -> None,
       OutputName -> ZZ }},

{{Description -> "W Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1},
                  {-\[ImaginaryI],\[ImaginaryI]}},
       LaTeX -> "Z^{W}",
       LesHouches -> None,
       OutputName -> ZW }},


{{Description -> "Wino Mixing Matrix",
       Dependence ->   1/Sqrt[2] {{1, 1, 0},
	                  {-\[ImaginaryI],\[ImaginaryI],0},
	                  {0,0,Sqrt[2]} },
       LaTeX -> "Z^{\\tilde{W}}",
       LesHouches -> None,
       OutputName -> ZfW }},


     
       
             
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
             LesHouches -> VMIX,
             OutputName-> UP      }}, 
             
{{  Description->"Chargino-minus Mixing-Matrix",
			 LaTeX -> "U",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UMIX,
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
             Real ->True,
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
             
 {{Description ->"Neutrino-Mixing-Matrix", 
 			 LaTeX -> "U^V",
             Dependence ->  None, 
             Value -> None, 
             LesHouches -> UVMIX,
             OutputName-> UV      }},  
             
             
(*----------------------------------------*)
(* PMNS Matrix                             *)
(*----------------------------------------*)
             
{{Description ->"PMNS Matrix", 
			 LaTeX -> "V^{PMNS}",
             MatrixProduct -> {Ve,Vv},
             Dependence ->  None, 
             LesHouches -> VPMNS,
             OutputName-> PMNS      }},                               
                                            
             
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
             DependenceSPheno -> MatMul[Transpose[conj[Vd]],Vu],
             OutputName-> VCKM      }}, 
             
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

             
{{ Description->"SCKM Up-Yukawa-Coupling",
             DependenceNum ->  Sqrt[2]/vu  {{Mass[Fu,1],0,0},
					    {0, Mass[Fu,2],0},
  				            {0, 0, Mass[Fu,3]}}, 
             LaTeX -> "\\hat{Y}_u^0",
             DependenceSPheno -> MatMul[MatMul[conj[Uu],Yu0],Transpose[Vu]],
             LesHouches -> Yu,
             OutputName -> ckYu }},    

{{ Description->"SCKM Down-Yukawa-Coupling",
             DependenceNum ->  Sqrt[2]/vd {{Mass[Fd,1],0,0},
 				{0, Mass[Fd,2],0},
 				{0, 0, Mass[Fd,3]}}, 
              LaTeX -> "\\hat{Y}_d^0",
             DependenceSPheno -> MatMul[MatMul[conj[Ud],Yd0],Transpose[Vd]],
             LesHouches -> Yd,
             OutputName -> ckYd}},    


{{ Description->"SCKM Trilinear-Down-Coupling",
              LaTeX -> "\\hat{T}_d^0",
             LesHouches -> Td,
             DependenceSPheno -> MatMul[MatMul[conj[Ud],T[Yd0]],Transpose[Vd]],
             OutputName -> ckTd }},   

{{ Description->"SCKM Trilinear-Up-Coupling",
              LaTeX -> "\\hat{T}_u^0",
             LesHouches -> Tu,
             DependenceSPheno -> MatMul[MatMul[conj[Uu],T[Yu0]],Transpose[Vu]],
             OutputName -> ckTu }},
             
            

{{Description->"SCKM Softbreaking left Squark Mass",
               LaTeX -> "\\hat{m}^{2}_{\\tilde{q}}",
               LesHouches -> mq2,
               DependenceSPheno -> MatMul[MatMul[Vd,mq02],Transpose[conj[Vd]]],               
               OutputName -> mq02 }},	


{{Description->"SCKM Softbreaking right Up-Squark Mass",
               LaTeX -> "\\hat{m}^{2}_{\\tilde{u}}",
               LesHouches -> mu2,
               DependenceSPheno -> MatMul[MatMul[conj[Uu],mu02],Transpose[Uu]],               
               OutputName -> mu02 }},             
             
{{Description->"SCKM Softbreaking right Down-Squark Mass",
               LaTeX -> "\\hat{m}^{2}_{\\tilde{d}}",
               LesHouches -> md2,
               DependenceSPheno -> MatMul[MatMul[conj[Ud],md02],Transpose[Ud]],                              
               OutputName -> md02 }},  
               
(*----------------------------------------*)
(* PMNS related                            *)
(*----------------------------------------*)  

{{ Description->"PMNS Electron-Yukawa-Coupling",
             DependenceNum ->  Sqrt[2]/vd {{Mass[Fe,1],0,0},
					{0, Mass[Fe,2],0},
  				{0, 0, Mass[Fe,3]}}, 
              LaTeX -> "\\hat{Y}_e^0",
             DependenceSPheno ->MatMul[MatMul[Ve,Ye0],Transpose[Ue]] ,
             LesHouches -> Ye,
             OutputName -> pmYe}},  

{{ Description->"PMNS Trilinear-Lepton-Coupling",
              LaTeX -> "\\hat{T}_e^0",
             LesHouches -> Te,
             DependenceSPheno ->MatMul[MatMul[Ue,T[Ye0]],Transpose[conj[Ve]]],
             OutputName -> pmTe }},              
               
{{Description->"PMNS Softbreaking right Slepton Mass",
               LaTeX -> "\\hat{m}^{2}_{\\tilde{e}}",
               LesHouches -> me2,
               DependenceSPheno ->MatMul[MatMul[Ue,me02],Transpose[conj[Ue]]],
               OutputName -> me02 }},             
             
{{Description->"PMNS Softbreaking left Slepton Mass",
               LaTeX -> "\\hat{m}^{2}_{\\tilde{l}}",
               LesHouches -> ml2,
                DependenceSPheno ->MatMul[MatMul[Transpose[Ve],ml02],conj[Ve]],
               OutputName -> ml02 }},                            
             
        



(*----------------------------------------*)
(* Gluino Phase                           *)
(*----------------------------------------*)          
 
                
 {{ Description -> "Gluino-Phase",
 			 LaTeX -> "\\phi_{\\tilde{g}}",
             Value -> None,
             LesHouches -> {Phases, 1},
             OutputName-> pG      }},


(*----------------------------------------*)
(* For U(1)_Y x U(1)_{B-L}                *)
(*----------------------------------------*)          

             
{{Description -> "Theta'",
             LaTeX -> "{\\Theta'}_W",
             DependenceNum ->ArcTan[(2 g1BL Sqrt[g1^2+g2^2])/(g1BL^2 + 4 gBL^2 (x1^2+x2^2)/(vd^2+vu^2) -g1^2-g2^2)]/2,
             Real ->True,
             DependenceSPheno -> ArcCos[Abs[ZZ[3,3]]],
             OutputName-> TWp,
             LesHouches -> {ANGLES,10}      }},  
             
{{Description -> "U(1)' Gauge Coupling",
              LaTeX -> "g_p",
              Real ->True,
              OutputName -> gp,
              LesHouches -> {GAUGE,5} }}, 
              
(*----------------------------------------*)
(* Additional B-L Parameters              *)
(*----------------------------------------*)  

(*
{{Description -> "Photon-Z-Z' Mixing Matrix",
       Dependence ->   {{Cos[ThetaW],Sin[ThetaW] Cos[ThetaWp], -Sin[ThetaW] Sin[ThetaWp] },                             
                        {Sin[ThetaW],-Cos[ThetaW] Cos[ThetaWp],Cos[ThetaW] Sin[ThetaWp]},
                        {0, Sin[ThetaWp], Cos[ThetaWp]}},
       Real ->True,
       LaTeX -> "Z^{\\gamma Z Z'}",
       LesHouches -> None,
       OutputName -> ZZ }},
*)

{{Description -> "Photon-Z-Z' Mixing Matrix",
       Dependence ->   {{Cos[ThetaW],-Sin[ThetaW] Cos[ThetaWp], Sin[ThetaW] Sin[ThetaWp] },                             
                        {Sin[ThetaW],Cos[ThetaW] Cos[ThetaWp],-Cos[ThetaW] Sin[ThetaWp]},
                        {0, Sin[ThetaWp], Cos[ThetaWp]}},
       Real ->True,
       LaTeX -> "Z^{\\gamma Z Z'}",
       LesHouches -> None,
       OutputName -> ZZ }},

              
{{Description -> "B-L-Coupling", 
		 LaTeX -> "g_{B}",
		GUTnormalization -> Sqrt[3/2],
             Dependence -> None, 
             LesHouches -> {gauge,4},
             OutputName -> gBL }},              
              
{{Description -> "Mixed Gauge Coupling 1",
                LesHouches -> {gauge, 10},
                LaTeX -> "g_{Y B}",
             OutputName -> gYB }},
                
{{Description -> "Mixed Gauge Coupling 2",
                 LesHouches -> {gauge, 11},
                 LaTeX -> "g_{B Y}",
                 OutputName -> gBY}},
                
{{Description -> "Z' mass", 
			 LaTeX -> "M_{Z'}",
             Dependence -> None, 
             Real -> True,
             Value -> 1500, 
             LesHouches -> None,
             OutputName -> MZp }},
             
{{Description -> "Bino' Mass",
              LaTeX -> "{M}_{BL}",
              LesHouches -> {BL,31},
	      OutputName -> MBp }},

{{Description -> "Mixed Gaugino Mass 1",
         LaTeX -> "{M}_{B B'}",
         LesHouches -> {BL,32},
	      OutputName -> MBBp }},

{{Description -> "Mixed Gaugino Mass 2",
               LaTeX -> "{M}_{B' B}",
 		       LesHouches -> {BL,33},
	      OutputName -> MBpB }},

{{Description -> "Mu' Parameter",
               LaTeX -> "{\\mu_{\\eta}}",
               LesHouches -> {BL,1},
	       OutputName -> MuP }},
               
{{Description -> "B' Parameter",
               LaTeX -> "B_{\\eta}",
               LesHouches -> {BL,2},
	       OutputName -> BMuP}},
               

{{Description -> "Bilepton 1 Soft-Breaking mass",
               LaTeX->"m_{\\eta}^2",
	       LesHouches -> {BL,11} ,
	       OutputName -> mC12}},


{{Description -> "Bilepton 2 Soft-Breaking mass",
               LaTeX->"m_{\\bar{\\eta}}^2",
	       LesHouches -> {BL,12} ,
	       OutputName -> mC22}},


{{Description -> "Bilepton 1 VEV",
               LaTeX -> "v_{\\eta}",
          (*   DependenceNum ->  Sin[BetaP]*vX, *)
             OutputName -> x1,
             Real -> True,
             LesHouches -> {BL,41}   }},


{{Description -> "Bilepton 2 VEV",
               LaTeX -> "v_{\\bar{\\eta}}",
         (*     DependenceNum ->  Cos[BetaP]*vX,  *)
             OutputName -> x2,
             Real -> True,
             LesHouches -> {BL,42}   }},


{{Description -> "Bilepton VEV",
              LaTeX -> "x",
             Dependence ->  None, 
             OutputName -> vX,
             DependenceSPheno -> Sqrt[x1^2 + x2^2],
             Real -> True,
             LesHouches -> {BL,43}   }},

{{Description -> "Bilepton Scalar Mixing Angle",
              LaTeX -> "{\\alpha'}",
             OutputName -> AlphaP   }},

{{Description -> "Bilepton Pseudo Scalar Mixing Angle",
             LaTeX -> "{\\beta'}",
             (* DependenceNum -> ArcTan[TBetaP],  *)
             Value -> None, 
             OutputName -> Bp,
             LesHouches -> {BL,10}  }},


{{Description -> "Neutrino-X-Yukawa-Coupling",
            LaTeX -> "Y_x",
            OutputName -> Yx,
           LesHouches->Yx }},

{{  Description -> "Trilinear-Neutrino-X-Coupling",
                OutputName -> Tx,
                LaTeX -> "T_x",
           	LesHouches->TX}},




{{Description -> "Bilepton Scalar Mixing Matrix",
             LaTeX -> "Z^{\\chi}",
             Real -> True, 
             OutputName -> ZC,
             Dependence ->   {{-Sin[AlphaP],Cos[AlphaP]},
                              {Cos[AlphaP],Sin[AlphaP]}}, 
             LesHouches -> scalarPrimemix      }},

            
{{Description -> "Bilepton Pseudo Scalar Mixing Matrix", 
             LaTeX -> "Z^{CA}",
             Real -> True,
             OutputName -> ZAC (*,
             Dependence -> {{-Cos[BetaP],Sin[BetaP]},
                            {Sin[BetaP],Cos[BetaP]}},  *)
             LesHouches -> PSPRIMEmix      }},

           

                           


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
             OutputName-> REps }}, 
               
{{ Description -> "Softbreaking Bilinear RpV-Parameter",
               LaTeX -> "B_\\epsilon",
             LesHouches -> RVD,
             OutputName-> Beps  }},
             
{{ Description -> "Soft-breaking Higgs Slepton Mixing Term",
            LaTeX ->"m_{l H}^2",
            OutputName -> mlHd2,
            LesHouches -> RVM2LH1}},
             
             
(*----------------------------------------*)
(* Neutrino Couplings                     *)
(*----------------------------------------*)          
             

{{ Description -> "Neutrino-Yukawa-Coupling",
             LaTeX -> "Y_\\nu",
             LesHouches -> Yv,
             OutputName-> Yv
             }},     

{{  Description -> "Trilinear-Neutrino-Coupling",
              LaTeX -> "T_\\nu",
             LesHouches -> Tv,
             OutputName-> Tv             }},

{{ Description -> "Softbreaking right Sneutrino Mass",
             LaTeX -> "m_{\\nu}^2",
             DependenceNum ->  None, 
             LesHouches -> mv2,
             OutputName-> mv2
			}},

{{Description -> "Weinberg Operator",
             LaTeX -> "\\kappa_{\\nu}",
             OutputName ->  WOp,
   	     LesHouches -> KappaNuL }},
	     
{{Description -> "Soft Breaking Weinberg Operator",
             LaTeX -> "Q_{\\nu}",
             OutputName ->  QWOp,
   	     LesHouches -> QNuL }},  
			
			
(*----------------------------------------*)
(* SM Parameters                          *)
(*----------------------------------------*)   


{{Description -> "SM Mu Parameter",
            LaTeX -> "\\mu",
	        OutputName -> Mu,
	        LesHouches -> {SM,1} }},                                        

{{ Description -> "SM Higgs Selfcouplings",
            LaTeX -> "\\lambda",
	        OutputName -> Lam,
	        LesHouches -> {SM,2} }},
	        
{{ Description -> "SM Higgs Mass Parameter",
            LaTeX -> "m_H^2",
	        OutputName -> mH2,
	        LesHouches -> {SM,3}}},

(*----------------------------------------*)
(* Gravity                               *)
(*----------------------------------------*)   

{{ Description -> "Gravitino Mass",
                LaTeX -> "m_{3/2}",
	        OutputName -> m32,
                Value ->  1,                  (* to circumvent problems when loading file in MadGraph *)
	        LesHouches -> {MSUGRA,2}}},

{{ Description -> "Planck Mass",
            LaTeX -> "M_P",
	        OutputName -> MP,
                Value ->  2.43*10^18,
	        LesHouches -> {MSUGRA,1}}}


			                                 
 }; 
 

