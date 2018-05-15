(* Some simplified setup with universal Sfermion masses at the SUSY scale *)
(* For a more general input, use the '_low' input !*)



MINPAR={{1,mSUSY},
        {5,Azero},
        {6,Bzero},
        {3,TanBeta} };

EXTPAR = {
          {1, M1input},
          {2, M2input},
          {3, M3input},
          
          {4, MDBinput},
          {5, MDWinput},
          {6, MDOinput},
          

          {40, MuDinput},
          {41, MuUinput},
          {45, BmuInput},

          {80, LSDinput},
          {81, LSUinput},
          {82, LTDinput},
          {83, LTUinput},

          {91, vSinput},
          {92, vTinput},
          {93, vRdInput},
          {94, vRuInput}
          };

RealParameters = {TanBeta, mSUSY};

ParametersToSolveTadpoles = {mHd2, mHu2, mS2, mT2, mRd2, mRu2};

DEFINITION[MatchingConditions]=Default[THDMII];


RealParameters = {TanBeta,mSUSY};
UseParameterAsGUTscale = {mSUSY};  

RenormalizationScaleFirstGuess = mSUSY^2;
RenormalizationScale = mSUSY^2;

BoundarySUSYScale={
{vT, vTinput},  
{vS, vSinput},
{vRd, vRdInput},
{vRu, vRuInput}
};

BoundaryHighScale={
{LamSD, LSDinput},
{LamSU, LSUinput},  
{LamTD, LTDinput},
{LamTU, LTUinput},

{T[LamSD], Azero*LamSD},
{T[LamSU], Azero*LamSU},  
{T[LamTD], Azero*LamTD},
{T[LamTU], Azero*LamTU},

{T[Yu], Azero*Yu},
{T[Yd], Azero*Yd},
{T[Ye], Azero*Ye},

{MuD, MuDinput},
{MuU, MuUinput},
{B[MuD],Bzero*MuD},
{B[MuU],Bzero*MuU},
{B[\[Mu]], BmuInput},
{\[Mu], 0},

{mq2, DIAGONAL mSUSY^2},
{ml2, DIAGONAL mSUSY^2},
{md2, DIAGONAL mSUSY^2},
{mu2, DIAGONAL mSUSY^2},
{me2, DIAGONAL mSUSY^2},
{moc2, mSUSY^2},
{MDBS, MDBinput},
{MDWBT,MDWinput},
{MDGoc,MDOinput},
{MassB, M1input},
{MassWB, M2input},
{MassG, M3input}
};



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues = {mSUSY->1500, TanBeta->10, Azero->-1000, Bzero->20, vSinput ->1, vTinput->1, vRdInput->1, vRuInput->-1, MDBinput->200, MDWinput->500, MDOinput->1400, LSDinput->0.7, LSUinput->-0.7, LTDinput->-0.7, LTUinput->-0.7, MuDinput->400, MuUinput->400,BmuInput->10^5};


(* loop decays are not really necessary  *)                     
SA`AddOneLoopDecay = False;