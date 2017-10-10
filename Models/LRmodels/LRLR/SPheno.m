(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, vHRinput},
        {2, vtLinput},
        {3, vtRinput},
        {4, vSUinput},
        {5, vSDinput},
        {6, vSEinput},
        {10, rho1Rinput},
        {11, rho2Rinput},
        {12, rho1Linput},
        {13, rho2Linput},
        {14, rho3input},
        {15, lamDDinput},
        {16, lamUUinput},
        {17, lamEEinput},
        {18, lamDUinput},
        {19, lamDEinput},
        {20, lamUEinput},
        {21, lam2Linput},
        {22, lam2Rinput},
        {23, lamLRinput},
        {24, lamULinput},
        {25, lamDLinput},
        {26, lamELinput},
        {27, lamURinput},
        {28, lamDRinput},
        {29, lamERinput},
        {30, lamUdLinput},
        {31, lamDdLinput},
        {32, lamEdLinput},
        {33, lamUdRinput},
        {34, lamDdRinput},
        {35, lamEdRinput},
        {36, etaLLinput},
        {37, etaRLinput},
        {38, etaLRinput},
        {39, etaRRinput},
        {40, eRR1input},
        {41, eRR2input},
        {42, eLL1input},
        {43, eLL2input},
        {50, rhoLinput},
        {51, rhoRinput},
        {52, laminput},
        {53, xiSinput},
        {54, etainput},
        {55, kapinput}
        };

ParametersToSolveTadpoles = {muL2,muR2,mudL2,mudR2,muU,muD,muE}; 

DEFINITION[MatchingConditions]= {
 {g3, g3SM},
 {g2, g2SM},
 {g1L1R, 0},      (* assuming for simplicity no gauge kinetic mixing *)
 {g1R1L, g1L1R},     
 {gR, g2SM},                                (* assuming for simplicity gR = gL *)
 {g1L, (g1SM*gR)/Sqrt[2*(-g1SM^2 + gR^2)]}, (* assuming for simplicity g1L = g1R *) 
 {g1R, g1L},
 {vHR, vHRinput},
 {vSE, vSEinput},
 {vSD, vSDinput},
 {vSU, vSUinput},
 {vtL, vtLinput},
 {vtR, vtRinput},
 {vHL, Sqrt[vSM^2 - 2*vtL^2]}
 };


BoundaryLowScaleInput={

 {rho1R, rho1Rinput},
 {rho2R, rho2Rinput},
 {rho1L, rho1Linput},
 {rho2L, rho2Linput},
 {rho3, rho3input},
 {lamDD, lamDDinput},
 {lamUU, lamUUinput},
 {lamEE, lamEEinput},
 {lamDU, lamDUinput},
 {lamDE, lamDEinput},
 {lamUE, lamUEinput},
 {lam2L, lam2Linput},
 {lam2R, lam2Rinput},
 {lamLR, lamLRinput},
 {lamUL, lamULinput},
 {lamDL, lamDLinput},
 {lamEL, lamELinput},
 {lamUR, lamURinput},
 {lamDR, lamDRinput},
 {lamER, lamERinput},
 {lamUdL, lamUdLinput},
 {lamDdL, lamDdLinput},
 {lamEdL, lamEdLinput},
 {lamUdR, lamUdRinput},
 {lamDdR, lamDdRinput},
 {lamEdR, lamEdRinput},
 {etaLL, etaLLinput},
 {etaRL, etaRLinput},
 {etaLR, etaLRinput},
 {etaRR, etaRRinput},
 {eRR1, eRR1input},
 {eRR2, eRR2input},
 {eLL1, eLL1input},
 {eLL2, eLL2input},
 {rhoL, rhoLinput},
 {rhoR, rhoRinput},
 {lam, laminput},
 {xiS, xiSinput},
 {eta, etainput},
 {kap, kapinput}
 };


ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZ1p,VZ2p,Hppmm,Hpm,Ah,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};

(* 
This point works with the automatically generated LesHouches.in.LRLR. 
It is just an example of a working point but does not, e.g., reproduce the correct Higgs mass.
*)

DefaultInputValues ={vHRinput -> 1000,
        vtLinput -> 0.01,
        vtRinput -> 1000,
        vSUinput -> 2000,
        vSDinput -> 1000,
        vSEinput -> 1000,
        rho1Rinput -> 0.1,
        rho2Rinput -> 0,
        rho1Linput -> 1,
        rho2Linput -> 0,
        rho3input -> 0,
        lamDDinput -> 0.1,
        lamUUinput -> 0.1,
        lamEEinput -> 0.1,
        lamDUinput -> 0,
        lamDEinput -> 0,
        lamUEinput -> 0,
        lam2Linput -> 0.3,
        lam2Rinput -> 1,
        lamLRinput -> 0,
        lamULinput -> 0,
        lamDLinput -> 0,
        lamELinput -> 0,
        lamURinput -> 0,
        lamDRinput -> 0,
        lamERinput -> 0,
        lamUdLinput -> 0,
        lamDdLinput -> 0,
        lamEdLinput -> 0,
        lamUdRinput -> 0,
        lamDdRinput -> 0,
        lamEdRinput -> 0,
        etaLLinput -> 0,
        etaRLinput -> 0,
        etaLRinput -> 0,
        etaRRinput -> 0.1,
        eRR1input -> -0.1,
        eRR2input -> 0,
        eLL1input -> 0,
        eLL2input -> 0,
        rhoLinput -> -0.1,
        rhoRinput -> -0.0001,
        laminput -> -0.001,
        xiSinput -> 0,
        etainput -> 0,
        kapinput -> -0.1
                     };
                     
(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;
                     