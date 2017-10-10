(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, vRinput},
        {2, TanBeta},
        {3, lam1INPUT},
        {4, lam2INPUT},
        {5, lam3INPUT},
        {6, lam4INPUT},
        {7, rho1INPUT},
        {8, rho2INPUT},
        {9, alp1INPUT},
        {10, alp2INPUT},
        {11, alp3INPUT},
        {12, M1INPUT},
        {13, M23INPUT},
        {14, lamT1INPUT},
        {15, lamT2INPUT}
        };

RealParameters = {TanBeta,vRinput};

ParametersToSolveTadpoles = {mu12,mu22,mu32}; 

(*
AuxiliaryHyperchargeCoupling = True;
ExpressionAuxHypercharge = Sqrt[(gBL*gR)^2/(gBL^2 + gR^2)];
*)

DEFINITION[MatchingConditions]= {
 {g3, g3SM},
 {g2, g2SM},
 {gR, g2},
 {gBL, (g1SM*gR)/Sqrt[-g1SM^2 + gR^2]},
 {v1, vSM*Cos[ArcTan[TanBeta]]},   
 {v2, vSM*Sin[ArcTan[TanBeta]]},
 {vR, vRinput},
 {YQ2, -(Transpose[YdSM]*v1*vSM - Transpose[YuSM]*vSM*v2)/(v2^2-v1^2)},
 {YQ1, (-Transpose[YuSM]*vSM*v1 + Transpose[YdSM]*v2*vSM)/(v2^2-v1^2)}
 };

BoundaryLowScaleInput={

 {lam1, lam1INPUT},
 {lam2, lam2INPUT},
 {lam3, lam3INPUT},
 {lam4, lam4INPUT},
 {rho1, rho1INPUT},
 {rho2, rho2INPUT},
 {alp1, alp1INPUT},
 {alp2, alp2INPUT},
 {alp3, alp3INPUT},
 {M1, M1INPUT},
 {M23, M23INPUT},
 {lamT1, lamT1INPUT},
 {lamT2, lamT2INPUT}
 };


ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZR,deltaRpp,Hpm,Ah,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};


(* this default point works with a renormalization scale of 1 TeV, i.e. with the automatically generated LesHouches.in.tripletLR_low *)
DefaultInputValues ={vRinput -> 4000,
                     TanBeta -> 10,
                     alp3INPUT -> -0.005,
                     lam1INPUT -> 0.1,
                     lam3INPUT -> 0.3,
                     lam4INPUT -> -0.15,
                     lamT1INPUT -> 0.1,
                     lamT2INPUT -> 0.1,
                     M1INPUT -> 1000,
                     M23INPUT -> 1000,
                     rho1INPUT -> 0.0002,
                     rho2INPUT -> 0.005        
                     };
                     
(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = True;
                     