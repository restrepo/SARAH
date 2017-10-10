OnlyLowEnergySPheno = True;


MINPAR={

        {1,Lambda1input},
        {2,Lambda2input},
        {3,Lambda3input},

        (* include these lines when you want to consider O^3 and O^4 terms *)        
        (*   
        {4,Lambda4input},
        {5,Lambda5input},
        {6,Lambda6input}, 
        {7,Lambda7input}, 
        {8,Lambda8input}, 
        {9,Lambda9input},         
        {10,Lambda10input},
        {11,Lambda11input},     *)     

        
    


         {16, mHinput},
    {17,m750input},
    {18,sthetainput},
        {21, LambdaSinput},        
    {23,Kappa2input},
        {24, MO2input}
};


ParametersToSolveTadpoles = {mu2, MS2};

BoundaryLowScaleInput={
 {v, vSM}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},


 { Lambda1,            Lambda1input},
 { Lambda2,            Lambda2input},
 { Lambda3,            Lambda3input},
 
 (* include these lines when you want to consider O^4 terms *)
 (*
 { Lambda4,            Lambda4input},
 { Lambda5,            Lambda5input},
 { Lambda6,            Lambda6input}, 
 { Lambda7,            Lambda7input}, 
 { Lambda8,            Lambda8input}, 
 { Lambda9,            Lambda9input},         
 { Lambda10,            Lambda10input},
 { Lambda11,            Lambda11input},   
 *)

 
 
 { Kappa2,             Kappa2input},           
 { LambdaH,            (mHinput^2+sthetainput^2*(m750input^2-mHinput^2))/(2*vSM^2)},
 { LambdaS,            LambdaSinput},
   {vS, Sqrt[(m750input^2+sthetainput^2*(mHinput^2-m750input^2))/(8*LambdaSinput)]},
    { Kappa1,      sthetainput*Sqrt[2*LambdaSinput*(1-sthetainput^2)/((m750input^2+sthetainput^2*(mHinput^2-m750input^2)))]*(mHinput^2-m750input^2)/vSM },  
 { MO2, MO2input}

};

 

ListDecayParticles = {Fu,Fe,Fd,hh, OcI, OcP, OcR};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};



DefaultInputValues ={LambdaHinput -> 0.1, LambdaSinput->0.1, Kappa2input ->0.1, MSinput->750, MOinput->1000, Lambda1input->0.1, vSinput->-1000 };

