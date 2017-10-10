OnlyLowEnergySPheno = True;


MINPAR={
        {1, gHinput},
        {2,LambdaHinput},
        {3,LambdaPinput},
        {4,LambdaDinput},
        {5,LambdaHDinput},        
        {6,LambdaHPinput},        
        {7,LambdaPDinput},

               
        {10, MHDinput},
        {11, MPDinput},
        {20, vDeltaInput},
        {21, vPhiInput} };

RealParameters = {};

ParametersToSolveTadpoles = {muH2,muP2,muD2};

DEFINITION[MatchingConditions]= {
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {Ye, YeSM},
 {Yd, YdSM}, 
 {Yu, YuSM},
 {v, vSM}
 };


BoundaryLowScaleInput={ 
 {gH, gHinput},

 {LambdaH,LambdaHinput},
 {LambdaP,LambdaPinput},
 {LambdaD,LambdaDinput},
 {LambdaHD,LambdaHDinput}, 
 {LambdaHP,LambdaHPinput}, 
 {LambdaPD,LambdaPDinput}, 
 {MHD, MHDinput},
 {MPD, MPDinput},
 {vD, vDeltaInput},
 {vP, vPhiInput},
 {Ydp, LHInput[Ydp]},
 {Yep, LHInput[Yep]},
 {Yup, LHInput[Yup]},
 {Yvp, LHInput[Yvp]},
 {Yv, LHInput[Yv]}
 
};

AddTreeLevelUnitarityLimits=True;


ListDecayParticles = {Fu,Fe,Fd,Fup,Fdp,Fep,hh,Hpm,H2c,VWpr,VZ,VZP};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"},{Fup,"Fup.f90"},{Fep,"Fep.f90"},{Fdp,"Fdp.f90"}};


DefaultInputValues = {gHinput->0.3, LambdaHinput->0.1, LambdaPinput->0.5, LambdaDinput->1.0, LambdaHDinput->0.2, LambdaHPinput->0.2, LambdaPDinput->0.2,MHDinput->100, MPDinput->-100,vDeltaInput->1000,vPhiInput->1000, Ydp[a_,a_]->0.1, Yep[a_,a_]->0.1, Yup[a_,a_]->0.1, Yvp[a_,a_]->0.1};

