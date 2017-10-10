OnlyLowEnergySPheno = True;


MINPAR={{1,Lambdainput},
        {2,lamSinput},
        {3,lamHSinput},
        {4,kapSinput},
        {5,vSinput},
        {6,MSinput},
        {11,m1Finput},
	{12,m2Finput},
	{13,m3Finput},
	{14,m4Finput},
	{15,m5Finput},
	{16,m6Finput},
	{17,m7Finput},
	{18,m8Finput},
	{19,m9Finput},
	{110,m10Finput},
	{111,m11Finput},
	{112,m12Finput},
	{113,m13Finput},
	{114,YF1input},
	{115,YF2input},
	{116,YF3input},
	{117,YF4input},
	{118,YF5input},
	{119,YF6input},
	{120,YF7input},
	{121,YF8input},
	{122,YF9input},
	{123,YF10input},
	{124,YF11input},
	{125,YF12input},
	{126,YF13input}
};


ParametersToSolveTadpoles = {mu2,kapHS};

DEFINITION[MatchingConditions]= {
  {v, vSM}, 
  {Ye, YeSM},
  {Yd, YdSM},
  {Yu, YuSM},
  {g1, g1SM},
  {g2, g2SM},
  {g3, g3SM}
 };


BoundaryLowScaleInput={

  {\[Lambda],Lambdainput},
  {lamS, lamSinput},
  {lamHS, lamHSinput},
  {kapS, kapSinput},
  {MS2, MSinput^2},
  {vS, vSinput},
  {m1F, m1Finput},
  {m2F, m2Finput},
  {m3F, m3Finput},
  {m4F, m4Finput},
  {m5F, m5Finput},
  {m6F, m6Finput},
  {m7F, m7Finput},
  {m8F, m8Finput},
  {m9F, m9Finput},
  {m10F, m10Finput},
  {m11F, m11Finput},
  {m12F, m12Finput},
  {m13F, m13Finput},
  {YF1, YF1input},
  {YF2, YF2input},
  {YF3, YF3input},
  {YF4, YF4input},
  {YF5, YF5input},
  {YF6, YF6input},
  {YF7, YF7input},
  {YF8, YF8input},
  {YF9, YF9input},
  {YF10, YF10input},
  {YF11, YF11input},
  {YF12, YF12input},
  {YF13, YF13input}
};




ListDecayParticles = {Fu,Fe,Fd,hh,Ah};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

largeMass2 = 1.0*10^12;

DefaultInputValues ={Lambdainput -> 0.17, 
                     lamHSinput -> 0,
                     kapSinput -> 0,
                     lamS -> 0.1,
                     MSinput -> 750,
                     m1Finput -> 1000,
                     m2Finput -> largeMass2,
                     m3Finput -> largeMass2,
                     m4Finput -> largeMass2,
                     m5Finput -> largeMass2,
                     m6Finput -> largeMass2,
                     m7Finput -> largeMass2,
                     m8Finput -> largeMass2,
                     m9Finput -> largeMass2,
                     m10Finput -> largeMass2,
                     m11Finput -> largeMass2,
                     m12Finput -> largeMass2,
                     m13Finput -> largeMass2,
                     YF1input -> 1,
                     YF2input -> 0,
                     YF3input -> 0,
                     YF4input -> 0,
                     YF5input -> 0,
                     YF6input -> 0,
                     YF7input -> 0,
                     YF8input -> 0,
                     YF9input -> 0,
                     YF10input -> 0,
                     YF11input -> 0,
                     YF12input -> 0,
                     YF13input -> 0
                     };
                

(* turn off loop-decays => one should study them in a model with selected VL states *)                                         
SA`AddOneLoopDecay = False;

(* loop matching not working because of arbitrarily large masses *)
ForceSimplifiedMatching=True;

                     