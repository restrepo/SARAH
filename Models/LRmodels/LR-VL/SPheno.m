(* ::Package:: *)

OnlyLowEnergySPheno = True;

MINPAR={{1, vRinput},
        {2, gRinput},
        {3, vSinput},
        {11, LAM1input},
        {12, LAM2Linput},
        {13, LAM2Rinput},
        {14, LAM3input},
        {15, LAM4Linput},
        {16, LAM4Rinput},
        {17, MU3Linput},
        {18, MU3Rinput}
        };

RealParameters = {vRinput,gRinput};

(*AuxiliaryHyperchargeCoupling = True;
ExpressionAuxHypercharge = Sqrt[(gBL*gR)^2/(gBL^2 + gR^2)];*)


ParametersToSolveTadpoles = {muL2,muR2,mu12}; 

DEFINITION[MatchingConditions]= {
 {g3, g3SM},
 {g2, g2SM},
 {gR, gRinput},
 {gBL, (g1SM*gR)/Sqrt[-g1SM^2 + gR^2]},
  {vR, vRinput},
 {vS, vSinput},
 {vL, vSM}
 };

BoundaryLowScaleInput={
 {lamU, LHInput[lamU]},
 {lamD, LHInput[lamD]},
 {lamE, LHInput[lamE]},
 {lamV, LHInput[lamV]},
 {lam1, LAM1input},
 {lam2L, LAM2Linput},
 {lam2R, LAM2Rinput},
 {lam3, LAM3input},
 {lam4L, LAM4Linput},
 {lam4R, LAM4Rinput},
 {mu3L, MU3Linput},
 {mu3R, MU3Rinput}
 };


ListDecayParticles = {Fu,Fe,Fd,hh,Fv,VZ,VZR,VWLm,VWRm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fv,"Fv.f90"}};

DefaultInputValues ={
LAM1input -> -0.3, 
LAM2Linput -> -0.03,
LAM2Rinput -> -0.9,
LAM3input -> 0,
LAM4Linput -> 0,
LAM4Rinput -> 0,
MU3Linput -> 18,
MU3Rinput -> -1000,
vRinput -> 8000,
gRinput -> 0.5,
vSinput -> 1000
};

(* loop decays not supported for this model *)                     
SA`AddOneLoopDecay = False;
