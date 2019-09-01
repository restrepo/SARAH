MINPAR={
        { 1, m0},
        { 2, m12},
        { 3, TanBeta},
        { 4, Muinput},
        { 5, Azero},
        { 6, MAinput}     
        };
        

RenormalizationScaleFirstGuess = m12^2;
RenormalizationScale = m12^2;


UseParameterAsGUTscale = {m0};

BoundaryHighScale={
 {T[Ye], Azero*Ye},
 {T[Yd], Azero*Yd},
 {T[Yu], Azero*Yu},
 {mq2, DIAGONAL m0^2},
 {ml2, DIAGONAL m0^2},
 {md2, DIAGONAL m0^2},
 {mu2, DIAGONAL m0^2},
 {me2, DIAGONAL m0^2},
 {B[\[Mu]], MAinput^2/(TanBeta + 1/TanBeta)}
};


ParametersToSolveTadpoles = {m2};

DEFINITION[MatchingConditions]=Default[OHDM];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues ={m0 -> 10^6, m12 -> 10^3, Azero -> 0, Muinput->10^3, MAinput->10^6, TanBeta->2};


(*---------------------------------------------------*)
(* information for matching to MSSM *)
(*---------------------------------------------------*)

MatchingToModel= {"MSSM"};
MatchingScale = {m0};

IncludeParticlesInThresholds={
 {hh,Ah,Hpm,Su,Sd,Se,Sv}
};


AssumptionsMatchingScale={
 {
  {vd,epsUV*Cos[ArcTan[TanBeta]]}, 
  {vu,epsUV*Sin[ArcTan[TanBeta]]},
  {\[Mu], epsUV},
  {MassB, epsUV},
  {MassWB, epsUV}
 }
};


BoundaryMatchingScaleUp={
{
  {Yu, Sqrt[1+TanBeta^2]/TanBeta*Yu},
  {Yd, Sqrt[1+TanBeta^2]*Yd},
  {Ye, Sqrt[1+TanBeta^2]*Ye},
  {MassB, m12},
  {MassWB,m12},
  {MassG, m12},
  {\[Mu], Muinput}
 }
};

BoundaryMatchingScaleDown={
{ 
 {MG, m12},
 {MW, m12},
 {MB, m12},
 {MuSplit,\[Mu]},
 {g1u,-2*(EFTcoupNLO[Chi[fB].Chi[FHu0].hh[1]][PL])},
 {g2u, 2*(EFTcoupNLO[Chi[fW0].Chi[FHu0].hh[1]][PL])}, 
 {g1d, 2*(EFTcoupNLO[Chi[fB].Chi[FHd0].hh[1]][PL])},
 {g2d,-2*(EFTcoupNLO[Chi[fW0].Chi[FHd0].hh[1]][PL])},
 {\[Lambda], -1/3 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]}
 }
};

ParametersToSolveTadpoleMatchingScale={
 {mHd2,mHu2}
};



