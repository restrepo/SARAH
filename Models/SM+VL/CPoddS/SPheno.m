OnlyLowEnergySPheno = True;


MINPAR={{1,Lambdainput},
        {2,lamSinput},
        {3,lamHSinput},
        {4,MSinput},
        {5,kapSinput},
        {6,kapHSinput}
        };
        
EXTPAR={{1,m1Finput},
	{2,m2Finput},
	{3,m3Finput},
	{4,m4Finput},
	{5,m5Finput},
	{6,m6Finput},
	{7,m7Finput},
	{8,m8Finput},
	{9,m9Finput},
	{10,m10Finput},
	{11,m11Finput},
	{12,m12Finput},
	{13,m13Finput},
	{14,YF1input},
	{15,YF2input},
	{16,YF3input},
	{17,YF4input},
	{18,YF5input},
	{19,YF6input},
	{20,YF7input},
	{21,YF8input},
	{22,YF9input},
	{23,YF10input},
	{24,YF11input},
	{25,YF12input},
	{26,YF13input}
};


ParametersToSolveTadpoles = {mu2};

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
  {kapS,kapSinput},
  {kapHS,kapHSinput},
  {MS2, MSinput^2},
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




ListDecayParticles = {Fu,Fe,Fd,Ah,hh};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

largeMass2 = 1.0*10^12;

DefaultInputValues ={Lambdainput -> 0.17, 
                     lamHSinput -> 0,
		     lamSinput -> 0.1,
                     MSinput -> 750,
                     kapHSinput -> 0,
                     kapSinput -> 0,
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
