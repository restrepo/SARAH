(* ::Package:: *)

ParameterDefinitions = { 

 (*{g1,        { Description -> "Hypercharge-Coupling"}},*)


 (*{gBL,      { LaTeX -> "g_{BL}",
             LesHouches -> {gauge,4},
		GUTnormalization -> Sqrt[3/2] }},*)

{gBL,{ 
     Description -> "B-L-Coupling",  (* for explicit relations, choose the following *)
     Dependence -> None,             (*  remove that line *)
     DependenceNum -> None,          (* e/(Cos[ThetaW]*Cos[ThetaBL]) *)
     DependenceOptional -> None,     (* e/(Cos[ThetaW]*Cos[ThetaBL]) *) 
     DependenceSPheno -> None, 
     GUTnormalization -> Sqrt[3/2], 
     Real -> True, 
     LesHouches -> {gauge, 4}, 
     LaTeX -> "g_{B}", 
     OutputName -> gBL}},          

{g2,        { Description -> "Left-Coupling"}},

{gR,{ 
     Description -> "LeftR-Coupling",  (* for explicit relations, choose the following *)
     Dependence -> None,               (* remove that line *)
     DependenceNum -> None,            (* e/(Sin[ThetaBL]*Cos[ThetaW]) *)
     DependenceOptional -> None,       (* e/(Sin[ThetaBL]*Cos[ThetaW]) *)
     DependenceSPheno -> None, 
     Real -> True, 
     LesHouches -> {GAUGE, 5}, 
     LaTeX -> "g_R", 
     OutputName -> gR}}, 

{g3,        { Description -> "Strong-Coupling"}},    

{AlphaS,    { Description -> "Alpha Strong"}},	

{e,         { Description -> "electric charge"}}, 

{Gf,        { Description -> "Fermi's constant"}},

{aEWinv,    { Description -> "inverse weak coupling constant at mZ"}},

(*{Yu,        { Description -> "Up-Yukawa-Coupling",
			 DependenceNum ->  Sqrt[2]/v* {{Mass[Fu,1],0,0},
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
  *)

  
(*

{YL1,       { Description -> "Lepton-Yukawa-Coupling",
             LaTeX -> "Y_{L1}",
             OutputName -> YL1,
	         LesHouches ->  YL1      }},

{YL2,       { LaTeX -> "Y_{L2}",
             OutputName -> YL2,
             LesHouches ->  YL2      }},


{YQ1,       { Description -> "Down-Yukawa-Coupling",
              LaTeX -> "Y_{Q1}",
              OutputName -> YQ1,
             LesHouches ->  YQ1      }},

{YQ2,       { Description -> "Up-Yukawa-Coupling",
              LaTeX -> "Y_{Q2}",
              OutputName -> YQ2,
             LesHouches ->  YQ2      }},
             
*)             


{YL1,       { Description -> "Lepton-Doublet Yukawa One",
             LaTeX -> "Y_{L1}",
             OutputName -> YL1,
	         LesHouches ->  YL1      }},

{YL2,       { Description -> "Lepton-Doublet Yukawa Two",
             LaTeX -> "Y_{L2}",
             OutputName -> YL2,
             LesHouches ->  YL2      }},


{YQ1,       { Description -> "Quark-Doublet Yukawa One",
              LaTeX -> "Y_{Q1}",
              OutputName -> YQ1,
             LesHouches ->  YQ1      }},

{YQ2,       { Description -> "Quark-Doublet Yukawa Two",
              LaTeX -> "Y_{Q2}",
              OutputName -> YQ2,
             LesHouches ->  YQ2      }},


{YDR,       { Description -> "DeltaR-lRs",
              LaTeX -> "Y_{DR}",
              OutputName -> YDR,
             LesHouches ->  YDR      }},

{YDL,       { Description -> "DeltaL-lLs",
              LaTeX -> "Y_{DL}",
              OutputName -> YDL,
             LesHouches ->  YDL      }},
 
{CKMR,      { Description -> "right-handed CKM matrix",
              Real -> False,
              Dependence ->  None, 
              (*Dependence -> {{1-1/2*lWolfR^2,lWolfR,aWolfR*lWolfR^3*(rWolfR-I*nWolfR)},
                               {-lWolfR,1-1/2*lWolfR^2, aWolfR*lWolfR^2},
                               {aWolfR*lWolfR^3*(1-rWolfR-I*nWolfR),-aWolfR*lWolfR^2,1}},*)
              OutputName -> CKMR,
              LesHouches -> CKMR }},

{nWolfR,    {Description->"R-Wolfenstein Parameter eta", 
             (*Value -> 0.341,*)
             Real -> True,
             OutputName-> nWolfR,
             LesHouches -> {WOLFENSTEINR,4} 	            }},
             
{aWolfR,    {Description->"R-Wolfenstein Parameter A", 
             (*Value -> 0.8080,*)
             Real -> True,
             OutputName-> aWolfR,
             LesHouches -> {WOLFENSTEINR,2}           }},
             
{lWolfR,    {Description->"R-Wolfenstein Parameter lambda", 
             (*Value -> 0.22253,*)
             Real -> True,
             OutputName-> lWolfR,
             LesHouches -> {WOLFENSTEINR,1}          }},
             
{rWolfR,    {Description->"R-Wolfenstein Parameter rho", 
             (*Value -> 0.132,*)
             Real -> True,
             OutputName-> rWolfR,
             LesHouches -> {WOLFENSTEINR,3}            }},              
              
              
{mu12,    { Description -> "SM Mu Parameter",
           Real -> True,
           OutputName -> MU12,
           LesHouches -> {LRINPUT,100}
           }},   
           

{M1,   { LaTeX -> "M_1",
		Real -> True,
               OutputName -> M1,
               LesHouches -> {LRINPUT,200} }},              
               
{M23,   { LaTeX -> "M_{23}",
		Real -> True,
               OutputName -> M23,
               LesHouches -> {LRINPUT,201} }},    
               
{lamT1,   { LaTeX -> "\\lambda^T_{1}",
               OutputName -> LAMT1,
               Real -> True,
               LesHouches -> {LRINPUT,202} }},  
               
{lamT2,   { LaTeX -> "\\lambda^T_{2}",
               OutputName -> LAMT2,
               Real -> True,
               LesHouches -> {LRINPUT,203} }},                 
               
{mu32,   { LaTeX -> "\\mu_{3}^2",
		Real -> True,
               OutputName -> mu32,
               LesHouches -> {LRINPUT,103} }},
               
{mu3b2,   { LaTeX -> "\\mu_{3b}^2",
		Real -> True,	
               OutputName -> mu3b2,
               LesHouches -> {LRINPUT,104} }},   
               
{mu22,   { LaTeX -> "\\mu_{2}^2",
           Real -> True,       
           OutputName -> MU22,
           LesHouches -> {LRINPUT,98} }},        
               
{mu2b2,   { LaTeX -> "\\mu_{2b}^2",
           Real -> True,       
           OutputName -> MU2b2,
           LesHouches -> {LRINPUT,99} }},        
  
  
{lam1,{ Description -> "SM Higgs Selfcouplings",
              Real -> True,
              OutputName -> LAM1,
              LesHouches ->  {LRINPUT,1}}},                                                                           
                                                                           
{lam2,   { LaTeX -> "\\lambda_2",
             OutputName -> LAM2,
             Real -> True,
             LesHouches ->  {LRINPUT,2}}},
             
{lam2b,   { LaTeX -> "\\lambda_2b",
             OutputName -> LAM2b,
             Real -> True,
             LesHouches ->  {LRINPUT,3}}},             

               
             
{lam3,   { LaTeX -> "\\lambda_3",
             OutputName -> LAM3,
             Real -> True,
             LesHouches ->  {LRINPUT,4}}},

{lam4,   { LaTeX -> "\\lambda_4",
             OutputName -> LAM4,
             Real -> True,
             LesHouches ->  {LRINPUT,5}}},
             
{lam4b,   { LaTeX -> "\\lambda_4b",
             OutputName -> LAM4b,
             Real -> True,
             LesHouches ->  {LRINPUT,6}}},             

{rho1,   { LaTeX -> "\\rho_1",
             OutputName -> RHO1,
             Real -> True,
             LesHouches ->  {LRINPUT,7}}},

{rho1b,   { LaTeX -> "\\rho_1b",
             OutputName -> RHO1b,
             Real -> True,
             LesHouches ->  {LRINPUT,8}}},             
             
{rho2,   { LaTeX -> "\\rho_2",
             OutputName -> RHO2,
             Real -> True,
             LesHouches ->  {LRINPUT,9}}},
             
{rho2b,   { LaTeX -> "\\rho_2b",
             OutputName -> RHO2b,
             Real -> True,
             LesHouches ->  {LRINPUT,10}}},
             
{rho3,   { LaTeX -> "\\rho_3",
             OutputName -> RHO3,
             Real -> True,
             LesHouches ->  {LRINPUT,11}}},

{rho4,   { LaTeX -> "\\rho_4",
             OutputName -> RHO4,
             Real -> True,
             LesHouches ->  {LRINPUT,12}}},
             
{rho4b,   { LaTeX -> "\\rho_4b",
             OutputName -> RHO4b,
             Real -> True,
             LesHouches ->  {LRINPUT,13}}},
             
{alp1,   { LaTeX -> "\\alpha_1",
             OutputName -> ALP1,
             Real -> True,
             LesHouches ->  {LRINPUT,14}}},
             
{alp1b,   { LaTeX -> "\\alpha_1b",
             OutputName -> ALP1b,
             Real -> True,
             LesHouches ->  {LRINPUT,15}}},
             
{alp2,   { LaTeX -> "\\alpha_2",
             OutputName -> ALP2,
             Real -> True,
             LesHouches ->  {LRINPUT,16}}},
             
{alp2b,   { LaTeX -> "\\alpha_2b",
             OutputName -> ALP2b,
             Real -> True,
             LesHouches ->  {LRINPUT,17}}},
             
{alp2c,   { LaTeX -> "\\alpha_2c",
             OutputName -> ALP2c,
             Real -> True,
             LesHouches ->  {LRINPUT,18}}},
             
{alp2d,   { LaTeX -> "\\alpha_2d",
             OutputName -> ALP2d,
             Real -> True,
             LesHouches ->  {LRINPUT,19}}},   
             
{alp3,   { LaTeX -> "\\alpha_3",
             OutputName -> ALP3,
             Real -> True,
             LesHouches ->  {LRINPUT,20}}},   
             
{alp3b,   { LaTeX -> "\\alpha_3b",
             OutputName -> ALP3b,
             Real -> True,
             LesHouches ->  {LRINPUT,21}}},
             
{beta1,   { LaTeX -> "\\beta_1",
             OutputName -> BETA1,
             Real -> True,
             LesHouches ->  {LRINPUT,22}}},

{beta2,   { LaTeX -> "\\beta_2",
             OutputName -> BETA2,
             Real -> True,
             LesHouches ->  {LRINPUT,24}}},

{beta3,   { LaTeX -> "\\beta_3",
             OutputName -> BETA3,
             Real -> True,
             LesHouches ->  {LRINPUT,26}}},

{beta1b,   { LaTeX -> "\\beta_1b",
             OutputName -> BETA1b,
             Real -> True,
             LesHouches ->  {LRINPUT,23}}},

{beta2b,   { LaTeX -> "\\beta_2b",
             OutputName -> BETA2b,
             Real -> True,
             LesHouches ->  {LRINPUT,25}}},

{beta3b,   { LaTeX -> "\\beta_3b",
             OutputName -> BETA3b,
             Real -> True,
             LesHouches ->  {LRINPUT,27}}},
             
{v1,        { Description -> "Down-VEV", 
              LaTeX -> "v_1",
              DependenceNum ->  None,  (* Cos[\[Beta]]*v *)
              LesHouches -> {VEV,1}}}, 

{v2,        { Description -> "Up-VEV", 
              LaTeX -> "v_2",
              DependenceNum ->  None,
              LesHouches -> {VEV,2}}},       

              
{PhaseT,{ 
     Real -> False, 
     LesHouches -> PHASET, 
     LaTeX -> "PhaseT",
     OutputName -> phaT}},               
              
              
(* v depends on v_1 v_2 *)

{v,         { Description -> "EW-VEV",
              LesHouches -> {VEV,3}}},

{\[Beta],   { Description -> "Pseudo Scalar mixing angle",
              DependenceSPheno -> ArcTan[TanBeta],
              DependenceNum -> ArcTan[TanBeta]}},       
              
{TanBeta,   { Description -> "Tan Beta" }},              
    
{vR,       {  (*Description -> "EW-VEV",*)
	     LaTeX -> "vR",
             Dependence ->  None, 
             Real -> True,
             DependenceNum -> None, 
             DependenceSPheno -> None,
             Value -> None, 
             LesHouches -> {VEV,4},
             OutputName-> vR      }},

             (*
{vL,       {  (*Description -> "EW-VEV",*)
	     LaTeX -> "vL",
             Dependence ->  None, 
             Real -> True,
             DependenceNum -> None, 
             DependenceSPheno -> None,
             Value -> None, 
             LesHouches -> {VEV,4},
             OutputName-> vL      }}, *)

{mH2,        { Description -> "SM Higgs Mass Parameter"}},

{ThetaW,{ 
     Description -> "Weinberg-Angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcSin[Abs[ZZ[2, 1]]], 
     Real -> True, 
     LesHouches -> ThetaW, 
     LaTeX -> "\\Theta_W", 
     OutputName -> TW}}, 
     
{ThetaBL,{ 
     Description -> "BL-R mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[1, 1]/Cos[ArcSin[Abs[ZZ[2, 1]]]]]], 
     Real -> True, 
     LesHouches -> ThetaBL, 
     LaTeX -> "\\Theta_{BL}", 
     OutputName -> TBL}},      

{ThetaZZp,{ 
     Description -> "Z-Z' mixing angle", 
     Dependence -> None, 
     DependenceNum -> None, 
     DependenceOptional -> None, 
     DependenceSPheno -> ArcCos[Abs[ZZ[2, 2]/Cos[ArcSin[Abs[ZZ[2, 1]]]]]], 
     Real -> True, 
     LesHouches -> ThetaZZp, 
     LaTeX -> "\\Theta_{ZZ'}", 
     OutputName -> TZZp}},      


{ZZ,{ 
     Description -> "Photon-Z-Z' Mixing Matrix",                                (* for explicit relations, choose the following *)
     Dependence -> (* {{Cos[ThetaBL] Cos[ThetaW], -Sin[ThetaBL] Sin[ThetaZZp] - (* use this explicit mixing matrix *)
   Cos[ThetaBL] Cos[ThetaZZp] Sin[ThetaW], -Cos[ThetaZZp] Sin[ThetaBL] + 
   Cos[ThetaBL] Sin[ThetaZZp] Sin[ThetaW]}, {Sin[ThetaW], 
  Cos[ThetaZZp] Cos[ThetaW], -Cos[ThetaW] Sin[ThetaZZp]}, {Cos[ThetaW] Sin[
    ThetaBL], 
  Cos[ThetaBL] Sin[ThetaZZp] - Cos[ThetaZZp] Sin[ThetaBL] Sin[ThetaW], 
  Cos[ThetaBL] Cos[ThetaZZp] + Sin[ThetaBL] Sin[ThetaZZp] Sin[ThetaW]}}, 
  *)None,
     DependenceNum -> None,                                                      (* remove that line *)
     DependenceSPheno -> None,                                                   (* remove that line *)
     Real -> True, 
     LesHouches -> ZZMIX, 
     LaTeX -> "Z^Z", 
     OutputName -> ZZ}}, 
	    
	    
	    
(*	    
{ZW, {LesHouches -> ZWMIX,
      OutputName -> ZW  }}, *)
      
{ZW,      {   Description -> "W Mixing Matrix",
              Dependence -> 1/Sqrt[2] {{Cos[PhiW], Cos[PhiW], -Sin[PhiW], -Sin[PhiW]}, 
              {-\[ImaginaryI] Cos[PhiW], \[ImaginaryI] Cos[PhiW], \[ImaginaryI] Sin[PhiW], -\[ImaginaryI] Sin[PhiW]}, 
              {Sin[PhiW], Sin[PhiW], Cos[PhiW], Cos[PhiW]}, 
              {-\[ImaginaryI] Sin[PhiW], \[ImaginaryI] Sin[PhiW], -\[ImaginaryI] Cos[PhiW], \[ImaginaryI] Cos[PhiW]}},
              (*Dependence -> 1/Sqrt[2] {{1, 1, 0, 0},
                  {-\[ImaginaryI],\[ImaginaryI], 0, 0},
                  {0, 0, 1, 1},
                  {0, 0, -\[ImaginaryI],\[ImaginaryI]}}*)
              LesHouches -> ZWMIX,
              OutputName -> ZW }},                
      
 
{PhiW,     {Real ->True,
              DependenceNum -> None,
              DependenceSPheno -> ArcCos[Sqrt[Abs[ZW[1,1]]^2+Abs[ZW[1,2]]^2]],
              LaTeX -> "\\phi_W",
              OutputName -> PhiW,
              LesHouches -> PhiW}},       
 
      
{ZWR, {Dependence ->   1/Sqrt[2] {{1, 1, 0, 0},
	{I,-I, 0, 0},
        {0, 0, 1, 1},
        {0, 0, I,-I}},
      LesHouches -> ZWRMIX,
      OutputName -> ZWR  }},

{PMNS, {LaTeX -> "U^V",
        Dependence ->  None, 
        Value -> None, 
        LesHouches -> UVMIX,
        OutputName-> UV ,
        LesHouches -> PMNS}},
        
{ZH,  { Description->"Scalar-Mixing-Matrix", 
	LaTeX -> "Z^H",
	Real -> True, 
	DependenceOptional -> None,(*  {{-Sin[\[Alpha]],Cos[\[Alpha]]},
        {Cos[\[Alpha]],Sin[\[Alpha]]}}, *)
        Value -> None, 
        LesHouches -> SCALARMIX,
        OutputName-> ZH}},
        
{UP, {OutputName -> UP,
      LaTeX -> "Z^{Ah}",
      LesHouches -> AMIX,
      Real -> True}},             

{UC, {OutputName -> UC,
      LaTeX -> "Z^+",
      LesHouches -> CHMIX,
      Real -> True}},

{UCC, {OutputName -> UCC,
      LaTeX -> "Z^{++}",
      LesHouches -> CHCHMIX,
      Real -> True}},
      
{UT, {OutputName -> UT,
      LaTeX -> "U^{0}_T",
      LesHouches -> UTMIX}},      
      
{UTe, {OutputName -> UTE,
      LaTeX -> "U^{-}_T",
      LesHouches -> UTEMIX}},  
      
{VTe, {OutputName -> VTE,
      LaTeX -> "V^{-}_T",
      LesHouches -> VTEMIX}},        

{Vu,        {Description ->"Left-Up-Mixing-Matrix"}},

{Vd,        {Description ->"Left-Down-Mixing-Matrix"}},

{Uu,        {Description ->"Right-Up-Mixing-Matrix"}},

{Ud,        {Description ->"Right-Down-Mixing-Matrix"}}, 

{Ve,        {Description ->"Left-Lepton-Mixing-Matrix"}},

{Ue,        {Description ->"Right-Lepton-Mixing-Matrix"}}

 }; 
 
thetaWexp  = (g2 Sqrt[gBL^2 + gR^2])/Sqrt[gBL^2 g2^2 + gBL^2 gR^2 + g2^2 gR^2]; 

