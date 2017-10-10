OnlyLowEnergySPheno = True;


MINPAR={{1,Lambda1Input},
        {2,Lambda2Input},
        {3,Lambda3Input},
        {4,Lambda4Input},
        {5,Lambda5Input},
        {9,M12input},        
        {10,TanBeta},
        {20,MQVINPUT},
        {21,MdVINPUT},
        {22,MuVINPUT},
        {23,MLVINPUT},
        {24,MeVINPUT},
        {25,MvVINPUT},
        {26,YuVLINPUT},
        {27,YuVRINPUT},
        {28,YdVLINPUT},
        {29,YdVRINPUT},
        {30,YeVLINPUT},
        {31,YeVRINPUT},
        {32,YvVLINPUT},
        {33,YvVRINPUT}
        };

RealParameters = {TanBeta};

ParametersToSolveTadpoles = {M112,M222};

DEFINITION[MatchingConditions]= {
 {v1,vSM*Cos[ArcTan[TanBeta]]},
 {v2,vSM*Sin[ArcTan[TanBeta]]},
 {Ye, YeSM*vSM/v2},
 {Yd, YdSM*vSM/v2},
 {Yu, YuSM*vSM/v2},
  {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
 };

BoundaryLowScaleInput={
 {Lambda1,Lambda1Input},
 {Lambda2,Lambda2Input},
 {Lambda3,Lambda3Input},
 {Lambda4,Lambda4Input},
 {Lambda5,Lambda5Input},
 {M12, M12input}, 

 {YvVL, YvVLINPUT},
 {YeVL, YeVLINPUT},
 {YuVL, YuVLINPUT},
 {YdVL, YdVLINPUT},
 {YvVR, YvVRINPUT},
 {YeVR, YeVRINPUT},
 {YuVR, YuVRINPUT},
 {YdVR, YdVRINPUT}, 
 {MvV, MvVINPUT},
 {MeV, MeVINPUT},
 {MuV, MuVINPUT},
 {MdV, MdVINPUT},
 {MLV, MLVINPUT},
 {MQV, MQVINPUT}

};




ListDecayParticles = {Fu,Fe,Fd,hh,Ah,Hm};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};




DefaultInputValues ={Lambda1Input -> 0.12, 
                     Lambda2Input -> 2.5, 
                     Lambda3Input -> 0.45, 
                     Lambda4Input ->-0.0, 
                     Lambda5Input ->0.0,  
                     M12input -> -200, 
                     TanBeta->10,
                     MQVINPUT -> 1000,
                     MdVINPUT -> 1000,
                     MuVINPUT -> 1000,
                     MLVINPUT -> 1000,
                     MeVINPUT -> 1000,
                     MvVINPUT -> 1000,
                     YeVINPUT -> 0.1,
                     YvVINPUT -> 0.1,
                     YuVINPUT -> 0.1,
                     YdVINPUT -> 0.1
                     };
                     
                     
RenConditionsDecays={
{dCosTW, 1/2*Cos[ThetaW] * (PiVWm/(MVWm^2) - PiVZ/(mVZ^2)) },
{dSinTW, -dCosTW/Tan[ThetaW]},
{dg2, 1/2*g2*(derPiVPheavy0 + PiVPlightMZ/MVZ^2 - (-(PiVWm/MVWm^2) + PiVZ/MVZ^2)/Tan[ThetaW]^2 + (2*PiVZVP*Tan[ThetaW])/MVZ^2)  },
{dg1, dg2*Tan[ThetaW]+g2*dSinTW/Cos[ThetaW]- dCosTW*g2*Tan[ThetaW]/Cos[ThetaW]}
};

(* turn off RGEs for loop-decays *)                     
SA`NoRGEsforDecays=True;
                     