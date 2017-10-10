MINPAR={{1,m0},
        {2,m12},
        {3,TanBeta},
        {4,SignumMu},
        {5,Azero},
        {6,MTinput}};
        
EXTPAR = {{80, LambdaInput},
          {85, vTinput}
          };        

RealParameters = {TanBeta,m0};

ParametersToSolveTadpoles = {\[Mu],B[\[Mu]],mT2};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

ConditionGUTscale = g1 == g2;

BoundarySUSYScale={
{vT, vTInput},  
{\[Lambda], LambdaInput}
};

BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
{MT, MTinput},
{B[MT], Azero*MT},
{T[\[Lambda]], Azero*\[Lambda]},
{mq2, DIAGONAL m0^2},
{ml2, DIAGONAL m0^2},
{md2, DIAGONAL m0^2},
{mu2, DIAGONAL m0^2},
{me2, DIAGONAL m0^2},
{mHd2, m0^2},
{mHu2, m0^2},
{MassB, m12},
{MassWB,m12},
{MassG,m12}
};

InitializationValues = {
 {\[Mu],0},
 {B[\[Mu]],0}
};

BoundaryLowScaleInput={
 {vd,Sqrt[4 mz2/(g1^2+g2^2)]*Cos[ArcTan[TanBeta]]},
 {vu,Sqrt[4 mz2/(g1^2+g2^2)]*Sin[ArcTan[TanBeta]]}
};


UseHiggs2LoopMSSM = False;

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;



