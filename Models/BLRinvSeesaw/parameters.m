(* ::Package:: *)

ParameterDefinitions = {

  (* -------------------------------------------------------- *)
  (* Constants                                                *)       
  (* -------------------------------------------------------- *) 
  
  {Gf,      { Description -> "Fermi's constant"}},
  {aEWinv,  { Description -> "inverse weak coupling constant at mZ"}},

  (* -------------------------------------------------------- *)
  (* Gauge couplings                                          *)       
  (* -------------------------------------------------------- *)
 
  (* MSSM couplings *)

  {e,       { Description -> "electric charge"}},	    
 
  (* {g1,      { Description -> "Hypercharge-Coupling"}}, *)

  {gL,      { Description -> "Left-Coupling",
              LaTeX -> "g_L",
              Real -> False,
              DependenceOptional -> e/Sin[ThetaW],  
              DependenceNum -> e/Sin[ThetaW], 
              DependenceNum -> None,
              Value -> None,
              OutputName -> gL,
              LesHouches -> {gauge, 2}}},

  (* SARAH complains when not defined, but warning can be ignored! *)
  (* {g2,      { Description -> "Left-Coupling"}}, *)

  {g3,      { Description -> "Strong-Coupling", 
	      LaTeX -> "g_s",
              Real -> False,
              Value -> None,
              OutputName -> g3,
              LesHouches -> {gauge, 3}}},

  (* SARAH complains when not defined .... *)
  {AlphaS,  {Description -> "Alpha Strong"}},

  (* New couplings *)

  {gBL,     { LaTeX -> "g_{BL}",
              Real -> False,
              Dependence ->  None, 
              Value -> None,
              OutputName -> gBL, 
	      GUTnormalization -> Sqrt[3/2],
              LesHouches ->  {gauge, 1}}},
  
  {gR,      { LaTeX -> "g_R",
              Real -> False,
              Dependence ->  None, 
              Value -> None,
              OutputName -> gR,
              LesHouches ->  {gauge, 4}}},

  {gBLR,   { LaTeX -> "g_{BR}",
              OutputName -> gBLgR,
              LesHouches ->  {gauge, 10}}},
  
  {gRBL,   { LaTeX -> "g_{RB}",
              OutputName -> gRgBL,
              LesHouches ->  {gauge, 11}}},
  
  (* -------------------------------------------------------- *)
  (* VEVs                                                     *)       
  (* -------------------------------------------------------- *) 

  (* MSSM VEVs  *)
 
  {vd,      { Description -> "Down-VEV"}},
 
  {vu,      { Description -> "Up-VEV"}},       
  
  {v,       { Description -> "EW-VEV",
              DependenceNum -> Sqrt[4*Mass[VWm]^2/(gL^2)]}},

  
  {TanBeta, { Description -> "Tan Beta"}},              

  (* New VEVs *)
  
  {vChiR,   { Real -> True,
              LaTeX -> "v_{\\chi_R}",
              Dependence -> None,
	      (* DependenceSPheno -> vR TanBetaR/Sqrt[1 + TanBetaR^2], *)
              OutputName -> vChiR,
              LesHouches -> {HMIX,105}}},
      
  {vChiRb,  { Real -> True,
              LaTeX -> "v_{\\bar{\\chi}_R}",
              Dependence -> None,
	      (* DependenceSPheno -> vR 1/Sqrt[1 + TanBetaR^2], *)
              OutputName -> vChiRb,
              LesHouches -> {HMIX,106}}},
  
  {vR,      { Real -> True,
	      LaTeX -> "v_R",
              Dependence ->  None,
	      (* DependenceSPheno -> Sqrt[vChiR^2 + vChiRb^2], *)
              Value -> None,
              LesHouches -> {HMIX,107},
              OutputName-> vR}},

  {TanBetaR, { 
	      Real -> True,
	      LaTeX -> "\\tan(\\beta_R)",
              LesHouches -> {HMIX,108},
              OutputName -> TanBetaR}},

  (* -------------------------------------------------------- *)
  (* Parameters Superpotential                                *)       
  (* -------------------------------------------------------- *)
 
  (* MSSM Parameters Superpotential *)

  {Yu,      { Description -> "Up-Yukawa-Coupling"   }}, 
  {Yd,      { Description -> "Down-Yukawa-Coupling"}},
  {Ye,      { Description -> "Lepton-Yukawa-Coupling"}}, 
  
  {\[Mu],   { Description -> "Mu-parameter"}}, 
  
  (* New Parameters Superpotential *)

  {Yv,      { LaTeX -> "Y_v",
              Dependence ->  None,
               Value -> None,
              LesHouches -> Yv,
              OutputName-> Yv}},

  {Ys,      { LaTeX -> "Y_s",
              Dependence ->  None,
              Value -> None,
              LesHouches -> Ys,
              OutputName-> Ys}},

  {MuR,     { Real -> False,
              LaTeX -> "\\mu_R",
              Dependence -> None,
              Value -> None,
              LesHouches -> {HMIX,9},
              OutputName-> MuR}},
  
  (* -------------------------------------------------------- *)
  (* Softbreaking mass terms (Scalars)                        *)       
  (* -------------------------------------------------------- *)
 
  (* MSSM Softbreaking terms *)

  {B[\[Mu]], { Description -> "Bmu-parameter"}},        
  
  {mq2,    { Description -> "Softbreaking left Squark Mass"}},
  {me2,    { Description -> "Softbreaking right Slepton Mass"}},
  {ml2,    { Description -> "Softbreaking left Slepton Mass"}},
  {mu2,    { Description -> "Softbreaking right Up-Squark Mass"}},
  {md2,    { Description -> "Softbreaking right Down-Squark Mass"}},
  {mHd2,   { Description -> "Softbreaking Down-Higgs Mass"}},
  {mHu2,   { Description -> "Softbreaking Up-Higgs Mass"}},  

  (* New Softbreaking Terms *)

  {B[MuR], { LaTeX -> "B_{\\mu_R}",
             Real -> False,
             Value -> None,
             OutputName -> BmuR,
             LesHouches -> {HMIX,109}}},
  
  {mv2,    { LaTeX -> "m_{\\nu}^2",
             Real ->False,
             DependenceNum ->  None,
             Value -> None,
             LesHouches -> MSV2,
             OutputName-> mv2}},

  {mS2,    { LaTeX -> "m_{S}^2",
             Real ->False,
             DependenceNum ->  None,
             Value -> None,
             LesHouches -> MSS2,
             OutputName-> mS2}},

  {mChiR2, { LaTeX -> "m_{\\chi}^2",
             Real -> True,
             Dependence ->  None,
             Value -> None,
             LesHouches -> {MSOFT,31},
             OutputName-> mCR2}},

  {mChiRbar2, { 
             LaTeX -> "m_{\\bar{\\chi}}^2",
             Real -> True,
             Dependence ->  None,
             Value -> None,
             LesHouches -> {MSOFT,32},
             OutputName-> mCRb2}},
 
  (* -------------------------------------------------------- *)
  (* Softbreaking mass terms (Gauginos)                       *)       
  (* -------------------------------------------------------- *)
 
  (* MSSM Softbreaking terms  *)

  {MassB,  { Description -> "Bino Mass parameter"}},
  {MassWL, { Description -> "Wino Mass parameter"}},
  {MassG,  { Description -> "Gluino Mass parameter"}},

  (* New Softbreaking terms *)

  {MassBR, { Form -> Scalar,
             LaTeX -> "M_4",
             Real -> False,
             Form -> Scalar,
             LesHouches -> {MSOFT,4},
             OutputName -> M4}},

  (* Since MassBRB = MassBBR it is sufficient to define MassBBR ... *)
  (* {MassBRB, { Form -> Scalar,
             LaTeX -> "M_{R B}",
             Real -> False,
             Form -> Scalar,
             LesHouches -> {MSOFT,8},
             OutputName -> MBRB}}, *)

  {MassBBR, { Form -> Scalar,
             LaTeX -> "M_{B R}",
             Real -> False,
             Form -> Scalar,
             LesHouches -> {MSOFT,8},
             OutputName -> MBBR}},

  (* -------------------------------------------------------- *)
  (* Softbreaking terms (Trilinear couplings)                 *)       
  (* -------------------------------------------------------- *)
 
  (* MSSM Trilinear couplings  *)
  
  {T[Ye],  { Description -> "Trilinear-Lepton-Coupling"}},
  {T[Yd],  { Description -> "Trilinear-Down-Coupling"}}, 
  {T[Yu],  { Description -> "Trilinear-Up-Coupling"}}, 

  (* New Trilinear couplings *)

  {T[Yv],  { Description -> "Trilinear-Neutrino-Coupling"}}, 

  {T[Ys],  { LaTeX -> "T_{s}",
             Value -> None,
             LesHouches -> Ts,
             OutputName-> Ts}},

  (* -------------------------------------------------------- *)
  (* Rotation matrices                                        *)
  (* -------------------------------------------------------- *)

  (* --------------------- Fermion sector ------------------- *)

  (* MSSM rotations *)

  {ZEL,    { Description -> "Left-Lepton-Mixing-Matrix"}},
  {ZER,    { Description -> "Right-Lepton-Mixing-Matrix" }},
  
  {ZDL,    { Description -> "Left-Down-Mixing-Matrix"}},
  {ZDR,    { Description -> "Right-Down-Mixing-Matrix"}},
  
  {ZUL,    { Description -> "Left-Up-Mixing-Matrix"}},
  {ZUR,    { Description -> "Right-Up-Mixing-Matrix"}},

  (* New rotations *)

  {ZFV,    { Description -> "Neutrino-Mixing-Matrix",
             LaTeX -> "Z^V_{\\nu}",
             LesHouches -> NEUTRINOMIX,
             OutputName-> ZFV}},

  (* --------------------- Sfermion sector ------------------ *)

  (* MSSM rotations *)
  
  {ZD,     { Description -> "Down-Squark-Mixing-Matrix" }},             
  {ZU,     { Description -> "Up-Squark-Mixing-Matrix"}},             
  
  {ZE,     { Description -> "Slepton-Mixing-Matrix"}}, 
  {ZV,     { Description -> "Sneutrino Mixing-Matrix"}},   

  (* ---------------------- Higgs sector -------------------- *)

  (* MSSM rotations *)
  
  {ZH,     { Description -> "Scalar-Mixing-Matrix",
             Dependence -> None,
             DependenceNum -> None,
             DependenceOptional -> None}},

  {ZA,     { Description -> "Pseudo-Scalar-Mixing-Matrix",
             Dependence->None,
             DependenceNum->None,
             DependenceOptional->None }},

  {ZP,     { Description -> "Charged-Mixing-Matrix"}},                      
  
  (* ----------------------- Gauge sector ------------------- *)

  (* MSSM rotations *)

  {ZfW,     { Dependence -> 1/Sqrt[2] {{1, 1, 0},
              { -\[ImaginaryI],\[ImaginaryI], 0},
              { 0, 0, Sqrt[2]}},
              LesHouches -> None,
              OutputName -> ZfW }},

  {ZW,      { Dependence -> 1/Sqrt[2] {{1, 1},
              { -\[ImaginaryI],\[ImaginaryI]}},
              LesHouches -> None,
              OutputName -> ZW }},

  {ZZ,      { Dependence -> None,
              LesHouches -> ZZMIX,
              OutputName -> ZZ }},

  (* ---------------- Chargino/Neutralino sector ------------ *)

  (* MSSM rotations *)

  {ZN,     { Description -> "Neutralino Mixing-Matrix" }},
  {UP,     { Description -> "Chargino-plus Mixing-Matrix"}},
  {UM,     { Description -> "Chargino-minus Mixing-Matrix"}},

  (* -------------------------------------------------------- *)
  (* Rotation angles                                          *)
  (* -------------------------------------------------------- *)

  (* MSSM rotation angles *)

  {ThetaW,  { Description->"Weinberg-Angle",
	      Real -> True,
              LaTeX -> "\\Theta_W",
              DependenceNum -> ArcSin[Sqrt[1 - Mass[VWm]^2/Mass[VZ]^2]],
              OutputName -> TW,
              LesHouches -> None}},

  {\[Beta],  { Description -> "Pseudo Scalar mixing angle" }},
  {\[Alpha], { Description -> "Scalar mixing angle" }},

  (* New rotation angles *)

  {ThetaWR, { Real -> True,
              LaTeX -> "\\theta_{W_R}",
              DependenceNum -> ArcCos[thetaWRexp],
              OutputName -> TWR,
              LesHouches -> None}},

  {ThetaZZ, { Real -> True,
              LaTeX -> "\\theta_{ZZ}",
              DependenceNum -> ArcCos[thetaZZexp],
              OutputName -> TZZ,
              LesHouches -> None}},

  (* -------------------------------------------------------- *)
  (* Extra                                                    *)
  (* -------------------------------------------------------- *)
  
  {PhaseGlu,  { Description -> "Gluino-Phase" }},
  {WOp,  { LaTeX -> "O_W" }}

};


thetaWexp  = (gL Sqrt[gBL^2 + gR^2])/Sqrt[gBL^2 gL^2 + gBL^2 gR^2 + gL^2 gR^2];

thetaWRexp = gR/Sqrt[gBL^2 + gR^2];

(* thetaZZexp with v and vR = Sqrt[vChiR^2 + vChiRb^2] *)

thetaZZexp =
-1/Sqrt[2] (Sqrt[(gBL^4 vR^2 + gR^2                 \
 (-gL^2 v^2 + gR^2 (v^2 + vR^2) +                   \
  Sqrt[(gL^2 + gR^2)^2 v^4 -                        \
   2 (gBL^2 gL^2 + (gBL^2 + gL^2) gR^2 - gR^4)      \
    v^2 vR^2 + (gBL^2 + gR^2)^2 vR^4]) +            \
     gBL^2 (-(gL^2 + gR^2) v^2 + 2 gR^2 vR^2 +      \
      Sqrt[(gL^2 + gR^2)^2 v^4 -                    \
       2 ((gL - gR) gR^2 (gL + gR) +                \
        gBL^2 (gL^2 + gR^2)) v^2 vR^2 +             \
         (gBL^2 + gR^2)^2 vR^4]))/((gBL^2 + gR^2)   \
          Sqrt[(gL^2 + gR^2)^2 v^4 -                \
	   2 ((gL - gR) gR^2 (gL + gR) +            \
            gBL^2 (gL^2 + gR^2)) v^2 vR^2 +         \
	     (gBL^2 + gR^2)^2 vR^4])]);


