(* ::Package:: *)

RegimeNr = 1;
IntermediateScale = True;

(* Gauge groups below threshold scale and representations 
of fields which are integrated to calculate finite shifts *)

 (*---List of the heavy component fields to be integrated out ----*)
 HeavyFields = {VBM,VW1M,VW2M,VW3M,phif,omegaf,sigmaf,Pof[3],Gof[3],SaF,BaF};
 
 
 (*---List of the heavy fields to be integrated out ---*)
 (*The numbers threes etc are what we think the component is part of *)
 NextGauge={U[1],SU[2],SU[3]};
 NextQN = {
    
    {VBM,           0,1,1},
    {VW1M,          0,3,1},
    {VW2M,          0,3,1},
    {VW3M,          0,3,1},
    
    {phif,          0,1,1},
    {omegaf,        0,2,1},
    {sigmaf,        0,3,1},
    {Pof,           0,3,1},
    {Gof,           0,3,1},
    {SaF,           0,3,1},
    {BaF,           0,3,1}
};
 (* ----- Vacuum conditions --- *)
 
 ParametersToSolveTadpoles = {Tod};
 
 InitializationValues = {Tod, 10^3};


UseGivenTadpoleSolution = True;
                                             
SubSolutionsTadpolesTree = {
                              Tod -> 2 (4 mLd2+2 vlv^2 YK conj[YK])/(YK+conj[YK])
                           };  (* We chose positive solution that sets tadpole to vanish *)

AssumptionsTadpoleEquations = {mLdt2->mLd2};


SubSolutionsTadpolesLoop={};


