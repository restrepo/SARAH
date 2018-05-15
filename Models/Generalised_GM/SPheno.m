OnlyLowEnergySPheno = False;

MINPAR={
        {2,Lambda2input},
        {3,Lambda3input},
        {4,Lambda4input},
        {5,Lambda5input},
        
        {10, mh1in},
        {12, mHin},
        {13, AlphaInput},
        {14, sHinput}
        
       };

ParametersToSolveTadpoles = {mH2,mX2,mE2};

ConditionGUTscale = g1 == g2;  (* as place-holder *)

RenormalizationScaleFirstGuess = 91.^2;
RenormalizationScale = 91.^2;

DEFINITION[MatchingConditions]= {
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {vPhi,(sHinput vSM)/(2 Sqrt[2])},
 {vDoub, Sqrt[vSM^2-8*vPhi^2]},
 {Ye, YeSM vSM/vDoub},
 {Yd, YdSM vSM/vDoub},
 {Yu, YuSM vSM/vDoub}
 };
 

 (* Notes: *)
 (* Lambda2 and Lambda4 exchanged in 1704.08512 *)
 (* sign conventions different for M1, M2, Lambda5 *)
 
BoundaryRenScale={
  {vEta,vPhi},
  {mu1, (-2 Sqrt[3] mh1in^2 TA + 2 Sqrt[3] mHin^2 TA + 3 (2 Lambda2input - Lambda5input) sHinput Sqrt[2 - 2 sHinput^2] (1 + TA^2) (vDoub^2 + 8 vEta^2))/(3 Sqrt[1 - sHinput^2] (1 + TA^2) Sqrt[(vDoub^2 + 8 vEta^2)])},
  {mu1, mu1/Sqrt[2]},
  {mu2, mu1/Sqrt[2]},
  {mu3,1/(9 sHinput^2 Sqrt[1 - sHinput^2] (1 + TA^2) (vDoub^2 + 8 vEta^2)) (mHin^2 (-3 sHinput Sqrt[2 - 2 sHinput^2] + 2 Sqrt[3] TA - 2 Sqrt[3] sHinput^2 TA) Sqrt[(vDoub^2 + 8 vEta^2)] + Sqrt[(vDoub^2 + 8 vEta^2)] (mh1in^2 TA (-2 Sqrt[3] + 2 Sqrt[3] sHinput^2 - 3 sHinput Sqrt[2 - 2 sHinput^2] TA) -  3 sHinput Sqrt[2 - 2 sHinput^2] (Lambda5input - (Lambda3input + 3 Lambda4input) sHinput^2 - Lambda5input sHinput^2 + 2 Lambda2input (-1 + sHinput^2)) (1 + TA^2) (vDoub^2 + 8 vEta^2)))},
  {mu3, -6 Sqrt[2] mu3},
  {Lambda1,  -((mh1in^2 + mHin^2 TA^2)/(8 (-1 + sHinput^2) (1 + TA^2) (vDoub^2 + 8 vEta^2)))},  
  {Lambda1,4*Lambda1},
  {rho1, 4*Lambda4input+6 Lambda3input},
  {rho2, -4 Lambda3input},  
  {rho3, 2*(Lambda4input+Lambda3input)},
  {rho4, 2*(Lambda4input)},
  {rho5, 4*(Lambda3input)},
  {sig1, 4 Lambda2input+Lambda5input},
  {sig2, -2 Lambda5input},
  {sig3, 2 Lambda2input},  
  {sig4, -Sqrt[2] Lambda5input}
};

BoundaryLowScaleInput=BoundaryRenScale



BoundaryHighScale={};

TA=Tan[AlphaInput/180.*Pi];


ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues ={mhin->125, mHin->500., AlphaInput->20,sHinput->0.3,Lambda2input->0.5,Lambda3input->0.5,Lambda4input->0.5,Lambda5input->0.5 };

AddTreeLevelUnitarityLimits=True;


(* Speed up the output *)
SA`AddOneLoopDecay = False;

SetOptions[ModelOutput,TwoLoopRGEs -> False]
SetOptions[MakeSPheno,TwoLoop -> False]