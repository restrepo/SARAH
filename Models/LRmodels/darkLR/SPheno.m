(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, gRinput},
        {2, vtRinput},
        {3, vHRinput},
        {4, vHLinput},
        {5, vtLinput},
        {6, TanBeta},
        {10, lam1INPUT},
        {11, rho1INPUT},
        {12, rho2INPUT},
        {13, rho3INPUT},
        {14, alp1INPUT},
        {15, alp3INPUT},
        {16, beta2INPUT},
        {17, etaLLINPUT},
        {18, etaLRINPUT},
        {19, etaRLINPUT},
        {20, etaRRINPUT},
        {21, etaRR1INPUT},
        {22, etaRR2INPUT},
        {23, lamLINPUT},
        {24, lamRINPUT},
        {25, lamLRINPUT},
        {26, betaLINPUT},
        {27, betaRINPUT},
        {28, alpINPUT},
        {29, xiRINPUT},
        {30, xiLRINPUT}
        };


ParametersToSolveTadpoles = {mu12, lam3, mudL2, mudR2, muL2, muR2};

DEFINITION[MatchingConditions]= {
{g3, g3SM},
 {g2, g2SM},
 {gR, gRinput},
 {gBL, (g1SM*gR)/Sqrt[-g1SM^2 + gR^2]},
 {vtR, vtRinput},
 {vHR, vHRinput},
 {vtL, vtLinput},
 {vHL, vHLinput},
 {v2, TanBeta*Sqrt[vSM^2 - vHL^2 - 2*vtL^2]/Sqrt[1 + TanBeta^2]},
 {v1, v2/TanBeta},
{YQ1, Transpose[YuSM]*vSM/v2},
 {YL1, Transpose[YeSM]*vSM/v2}
  
  };


BoundaryLowScaleInput={
 {lam1, lam1INPUT},
 {rho1, rho1INPUT},
 {rho2, rho2INPUT},
 {rho3, rho3INPUT},
 {alp1, alp1INPUT},
 {alp3, alp3INPUT},
 {beta2, beta2INPUT},
 {etaLL, etaLLINPUT},
 {etaLR, etaLRINPUT},
 {etaRL, etaRLINPUT},
 {etaRR, etaRRINPUT},
 {eRR1, etaRR1INPUT},
 {eRR2, etaRR2INPUT},
 {lamL, lamLINPUT},
 {lamR, lamRINPUT},
 {lamLR, lamLRINPUT},
 {betaL, betaLINPUT},
 {betaR, betaRINPUT},
 {alp, alpINPUT},
 {xiR, xiRINPUT},
 {xiLR, xiLRINPUT}
 };



ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZR,Hppmm,Hpm,Ah,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};

(*
This default point works with a renormalization scale of 1 TeV,
i.e. with the automatically generated LesHouches.in.darkLR_low.
Note that this point merely gives a valid spectrum, it does not feature,
e.g., correct Higgs masses.
*)

DefaultInputValues ={gRinput -> 0.5,
        vtRinput -> 2000,
        vHRinput -> 5000,
        vHLinput -> 1.1,
        vtLinput -> 2.2,
        TanBeta -> 10,
        lam1INPUT -> 0.12,
        rho1INPUT -> 0.2,
        rho2INPUT -> 1,
        rho3INPUT -> 0.1,
        alp1INPUT -> 0.2,
        alp3INPUT -> 0.0,
        beta2INPUT -> 0.0,
        etaLLINPUT -> 0.1,
        etaLRINPUT -> 0.0,
        etaRLINPUT -> 0.0,
        etaRRINPUT -> 0.1,
        etaRR1INPUT -> 0.0,
        etaRR2INPUT -> 0.0,
        lamLINPUT -> 1,
        lamRINPUT -> 0.05,
        lamLRINPUT -> 0.0,
        betaLINPUT -> 0.2,
        betaRINPUT -> 0.0,
        alpINPUT -> 0.0,
        xiRINPUT -> 300,
        xiLRINPUT -> 0.0
                     };
                     
(* loop decays not supported for this model *)                     
SetOptions[MakeSPheno, IncludeLoopDecays -> False];


