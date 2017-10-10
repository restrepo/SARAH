(* ::Package:: *)

ParameterDefinitions = 
{

(**********************************)
(* Gauge group coupling constants *)
(**********************************)
  {gA1,   {Description -> "U(1) A coupling",
           LaTeX -> "g_{A1}",
           Real -> True,
           LesHouches -> gA1,
           GUTnormalization -> Sqrt[3/5], 
           OutputName -> gA1 }},
  {gA2,   {Description -> "SU(2) A coupling",
           LaTeX -> "g_{A2}",
           Real -> True,
           LesHouches -> gB2,
           OutputName -> gA2 }},
  {gB1,   {Description -> "U(1) B coupling",
           LaTeX -> "g_{B1}",
           Real -> True,
           LesHouches -> gB1,
           GUTnormalization -> Sqrt[3/5], 
           OutputName -> gB1 }},
  {gB2,   {Description -> "SU(2) B coupling",
           LaTeX -> "g_{B2}",
           Real -> True,
           LesHouches -> gB2,
           OutputName -> gB2 }},

  {g3,    {Description -> "Strong-Coupling",
           LaTeX->  "g_{3}"}},
  {AlphaS,{Description -> "Alpha Strong",
           LaTeX -> "\\alpha_s"}},

(*****************************)
(* Superpotential parameters *)
(*****************************)

  {Yu3,    { Description -> "Up3-Yukawa-Coupling",
	     LaTeX -> "Y_{u3}",
             LesHouches -> Yu3,
             OutputName-> Yu3
             }},

  {Yd3,    { Description -> "Down3-Yukawa-Coupling",
	     LaTeX -> "Y_{d3}",
             LesHouches -> Yd3,
             OutputName-> Yd3}},

  {Ye3,    { Description -> "Lepton3-Yukawa-Coupling",
	     LaTeX -> "Y_{e3}",
             LesHouches -> Ye3,
             OutputName-> Ye3}},


  {\[Mu], {Description -> "Mu-parameter"}}, 
  {B[\[Mu]], { Description -> "Bmu-parameter"}},        

  {YK,    {Description -> "KLL coupling", 
           LaTeX -> "Y_{K}",
           OutputName -> YK, 
           LesHouches->YK }},
  {Tod,   {Description -> "linking scale", 
           LaTeX -> "\\Omega",
           Real -> True,
           OutputName -> Tod,
           LesHouches->Tod }},
  {YA,    {Description -> "LAL coupling", 
           LaTeX -> "Y_{A}",
           OutputName -> YA,
           LesHouches->YA }},
  {vlv,   {Description -> "linking field vev", 
           LaTeX -> "v_{Lv}", 
           Real -> True,
           OutputName -> vlv,
           LesHouches->vlv }},

(*********************************)
(* Soft SUSY breaking parameters *)
(*********************************)
  {mLd2,  {Description -> "squared softbreaking L mass", 
           LaTeX -> "m_{L}^2", 
           Form -> Scalar, 
           OutputName -> mLd2, 
           LesHouches -> mLd2}},
  {mLdt2, {Description -> "squared softbreaking Ltilde mass", 
           LaTeX -> "m_{\\tilde{L}}^2", 
           Form -> Scalar, 
           OutputName -> mLdt2,
           LesHouches->mLdt2}},
  {mKd2,  {Description -> "squared softbreaking K mass", 
           LaTeX -> "m_{K}^2", 
           Form -> Scalar, 
           OutputName -> mKd2, 
           LesHouches -> mKd2}},
  {mAd2,  {Description -> "squared softbreaking Ad mass", 
           LaTeX -> "m_{Ad}^2", 
           Form -> Scalar, 
           OutputName -> mAd2, 
           LesHouches -> mAd2}},
  {MassAB,{Description -> "softbreaking B_A mass", 
           LaTeX -> "m_{B_A}", 
           Form -> Scalar, 
           OutputName -> MassAB}},
  {MassAW,{Description -> "softbreaking W_A mass", 
           LaTeX -> "m_{W_A}", 
           Form -> Scalar, 
           OutputName -> MassAW}},
  {MassBB,{Description -> "softbreaking B_B mass", 
           LaTeX -> "m_{B_B}", 
           Form -> Scalar, 
           OutputName -> MassBB}},
  {MassBW,{Description -> "softbreaking W_B mass", 
           LaTeX -> "m_{W_B}", 
           Form -> Scalar, 
           OutputName -> MassBW}},

  {MassG, {Description -> "Gluino Mass parameter"}},

  {T[YK], {Description -> "KLL trilinear couplings", 
           LaTeX -> "T_{K}",
           OutputName -> TYK}},
  {T[YA], {Description -> "LAL trilinear couplings", 
           LaTeX -> "T_{A}",
           OutputName -> TYA}},
  {L[Tod],{Description -> "V_2^2 linear term", 
           LaTeX -> "L_{\\Omega}",
           OutputName -> LTod}},


(* Usual MSSM stuff *)

   {mHd2,      { Description -> "Softbreaking Down-Higgs Mass"}},
   {mHu2,      { Description -> "Softbreaking Up-Higgs Mass"}},
   {MassG,     { Description -> "Gluino Mass parameter"}},
   {\[Beta],   { Description -> "Pseudo Scalar mixing angle"}},
   {TanBeta,   { Description -> "Tan Beta"}},
   {\[Alpha],  { Description -> "Scalar mixing angle"}},
   {ZH,        { Description -> "Scalar-Mixing-Matrix"}},
   {ZA,        { Description -> "Pseudo-Scalar-Mixing-Matrix"}},
   {ZP,        { Description -> "Charged-Mixing-Matrix"}},                      

(*Squark slepton soft masses*)

 {mq122, { Description -> "Softbreaking left Squark Mass 12",
             LaTeX -> "m_{q12}^2",
             OutputName -> mq122,
             LesHouches -> mq122}},
   {me122, { Description -> "Softbreaking right Slepton Mass 12",
             LaTeX -> "m_{e12}^2",
             OutputName -> me122,
             LesHouches -> me122}},
   {ml122,       { Description -> "Softbreaking left Slepton Mass 12",
           LaTeX -> "m_{l12}^2",
           OutputName -> ml122,
           LesHouches -> ml122}},
   {mu122,       { Description -> "Softbreaking right Up-Squark Mass 12",
           LaTeX -> "m_{u12}^2",
           OutputName -> mu122,
           LesHouches -> mu122}},
   {md122,       { Description -> "Softbreaking right Down-Squark Mass 12",
           LaTeX -> "m_{d12}^2",
           OutputName -> md122,
           LesHouches -> md122}},

   {mq32, { Description -> "Softbreaking left Squark Mass 3",
            LaTeX -> "m_{q3}^2",
            Form -> Scalar,
            OutputName -> mq32,
            LesHouches -> mq32}},
   {me32, { Description -> "Softbreaking right Slepton Mass 3",
            LaTeX -> "m_{e3}^2",
            Form -> Scalar,
            OutputName -> me32,
            LesHouches -> me32}},
   {ml32, { Description -> "Softbreaking left Slepton Mass 3",
            LaTeX -> "m_{l3}^2",
            Form -> Scalar,
            OutputName -> ml32,
            LesHouches -> ml32}},
   {mu32, { Description -> "Softbreaking right Up-Squark Mass 3",
            LaTeX -> "m_{u3}^2",
            Form -> Scalar,
            OutputName -> mu32,
            LesHouches -> mu32}},
   {md32, { Description -> "Softbreaking right Down-Squark Mass 3",
            LaTeX -> "m_{d3}^2",
            Form -> Scalar,
            OutputName -> md32,
            LesHouches -> md32}},

  {T[Ye3], { Description -> "Trilinear-Lepton3-Coupling",
	     LaTeX -> "T_{e3}",
             LesHouches -> Te3,
             OutputName-> Te3 }},
  {T[Yu3], { Description -> "Trilinear-Up3-Coupling",
	     LaTeX -> "T_{u3}",
             LesHouches -> Tu3,
             OutputName-> Tu3 }},
  {T[Yd3], { Description -> "Trilinear-Down3-Coupling",
	     LaTeX -> "T_{d3}",
             LesHouches -> Td3,
             OutputName-> Td3 }},

(*********************)
(* Mixing parameters *)
(*********************)
(* Pure gauge sector mixings *)
  {Theta1, {Description -> "U(1) mixing angle", 
            Real -> True,
            Dependence -> ArcCos[gB1/Sqrt[gA1^2 + gB1^2]],  
            LaTeX -> "\\theta_{1}",
            OutputName -> Theta1 }}, 
  {Theta2, {Description -> "SU(2) mixing angle", 
            Real -> True,
            Dependence -> ArcCos[gB2/Sqrt[gA2^2 + gB2^2]],  
            LaTeX -> "\\theta_{2}",
            OutputName -> Theta2 }}, 

  {ZZB,    {Description -> "B gauge boson/gaugino rotation matrix", 
            Real -> True,
            Dependence ->    {{Cos[Theta1], -Sin[Theta1]},
                              {Sin[Theta1],  Cos[Theta1]}},
            LaTeX -> "Z_{V}^{B}",
            OutputName -> ZZB }}, 
  {ZZW,    {Description -> "W gauge boson/gaugino rotation matrix", 
            Real -> True,
            Dependence ->    {{Cos[Theta2], -Sin[Theta2]},
                              {Sin[Theta2],  Cos[Theta2]}},
            LaTeX -> "Z_{V}^{W}",
            OutputName -> ZZW }}, 


(* Scalar mixings *)
  {ZPH, {Description -> "Linking fields diagonal real scalar part mixing", 
         LaTeX -> "Z_{Ls}^{DR}",
         OutputName -> ZPH }}, 
  {ZSI, {Description -> "Linking fields diagonal imaginary scalar part mixing", 
         LaTeX -> "Z_{Ls}^{DI}",
         OutputName -> ZSI }}, 
  {ZOM, {Description -> "Linking fields off-diagonal scalar part mixing", 
         LaTeX -> "Z_{Ls}^{od}",
         OutputName -> ZOM }},
  {ZSaF,{Description -> "A1 Kd scalar part mixing",
         LaTeX -> "S_{A}^{s}",
         OutputName -> ZSaF }},
  {ZBaF,{Description -> "A2 conjA3 scalar part mixing",
         LaTeX -> "B_{A}^{s}",
         OutputName -> ZBaF }},

(* Fermion mixings *)
  {ZPo,    {Description -> "Linking/Ad/K-ino diagonal part mixing", 
            LaTeX -> "Z_{Po}",
            OutputName -> ZPo}}, 
  {ZGo,    {Description -> "Linking/Ad/K-ino off-diagonal part mixing", 
            LaTeX -> "Z_{Go}",
            OutputName -> ZGo }}, 

(* Usual sfermion mixing *)
  {ZD,        { Description -> "Down-Squark-Mixing-Matrix" }},             
  {ZU,        { Description -> "Up-Squark-Mixing-Matrix"}},             
  {ZE,        { Description -> "Slepton-Mixing-Matrix"}}, 
  {ZV,        { Description->"Sneutrino Mixing-Matrix"}},   

(* Usual fermion mixing *) 
  {ZEL,       { Description ->"Left-Lepton-Mixing-Matrix"}},
  {ZER,       { Description ->"Right-Lepton-Mixing-Matrix" }},                          
  {ZDL,       { Description ->"Left-Down-Mixing-Matrix"}},                       
  {ZDR,       { Description ->"Right-Down-Mixing-Matrix"}},              
  {ZUL,       { Description ->"Left-Up-Mixing-Matrix"}},                        
  {ZUR,       { Description ->"Right-Up-Mixing-Matrix"}},           
              

(***********************************)
(* Basic Standard Model parameters *)
(***********************************)
    
  {ThetaW,    { Description -> "Weinberg-Angle"}},
  {PhaseGlu,  { Description -> "Gluino-Phase" }}
    
};
 

