OnlyLowEnergySPheno = True;

SkipFlavorKit=True;
AddTreeLevelUnitarityLimits=True;

RealParameters = {MP2,MM2,MS2,LambdaH,MQP2input,MQM2input,MS2input,LambdaHinput,Kappinput};

MINPAR={

        {1,LambdaHinput},
        {2,Kappainput},       
        {22, MQP2input},
        {23, MQM2input},
        {24, MS2input}
};


ParametersToSolveTadpoles = {mu2};

DEFINITION[MatchingConditions]= {
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {v, vSM}
 };

BoundaryLowScaleInput={

    { LambdaH, LambdaHinput},
    { Kappa1, Kappainput},
    { MP2, MQP2input},
    { MM2, MQM2input},
    { MS2, MS2input}

};

 

ListDecayParticles = {Fu,Fe,Fd,hh, QM, QP};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{QM,"Qm.f90"}};



DefaultInputValues ={};

RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWp/(MVWp^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWp/MVWp^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

(* turn off RGEs for loop-decays *)                     
SA`NoRGEsforDecays=True;

