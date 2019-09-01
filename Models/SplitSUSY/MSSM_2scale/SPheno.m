MINPAR={{ 1, m0},
        { 2, m12},
        { 3, TanBeta},
        { 5, Azero},
        {23, Muinput},
        {24, MAinput}     
        };
        
RealParameters = {TanBeta,m0,MAinput};        

RenormalizationScaleFirstGuess = 100^2;
RenormalizationScale = v^2;


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

DefaultInputValues ={m0 -> 10^6, m12 -> 10^6, Azero -> 0, Muinput->10^6, MAinput->10^6, TanBeta->2};


(*---------------------------------------------------*)
(* information for matching to MSSM *)
(*---------------------------------------------------*)

MatchingToModel= {"SplitSUSY_MSSM","MSSM"};
MatchingScale = {m12,m0};

IncludeParticlesInThresholds={
 {Chi,Cha },
 {hh,Ah,Hpm,Su,Sd,Se,Sv}
};


AssumptionsMatchingScale={
 {
  {v, epsUV}
 },
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
 {Yu, (Yu - Sqrt[2]*ShiftCoupNLO[bar[Fu].Fu.hh[1]][PL])},
 {Yd, (Yd - Sqrt[2]*ShiftCoupNLO[bar[Fd].Fd.hh[1]][PL])},
 {Ye, (Ye - Sqrt[2]*ShiftCoupNLO[bar[Fe].Fe.hh[1]][PL])},
 {MB, m12},
 {MW ,m12},
 {MG, m12},
 {MuSplit,MuInput}
},
{
  {Yu, Sqrt[1+TanBeta^2]/TanBeta*Yu - Sqrt[2]*ShiftCoupNLO[bar[Fu].Fu.hh[1]][PL]/ZH[1,2]},
  {Yd, Sqrt[1+TanBeta^2]*Yd - Sqrt[2]*ShiftCoupNLO[bar[Fd].Fd.hh[1]][PL]/ZH[1,1]},
  {Ye, Sqrt[1+TanBeta^2]*Ye - Sqrt[2]*ShiftCoupNLO[bar[Fe].Fe.hh[1]][PL]/ZH[1,1]},
  {MassB, MB},
  {MassWB,MW},
  {MassG, MG},
  {\[Mu], MuSplit}
 }
};

BoundaryMatchingScaleDown={
{
 {lamSM, -1/3 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]}
},
{
 {MG, m12},
 {MW, m12},
 {MB, m12},
 {MuSplit,\[Mu]},
 {g1u,-2*(EFTcoupNLO[Chi[fB].Chi[FHu0].hh[1]][PL])},
 {g2u,2*(EFTcoupNLO[Chi[fW0].Chi[FHu0].hh[1]][PL])}, 
 {g1d,2*(EFTcoupNLO[Chi[fB].Chi[FHd0].hh[1]][PL])},
 {g2d,-2*(EFTcoupNLO[Chi[fW0].Chi[FHd0].hh[1]][PL])},
 {\[Lambda], -1/3 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]}
 }
};

ParametersToSolveTadpoleMatchingScale={
 {m2},
 {mHd2,mHu2}
};
 


