MINPAR={{ 1, m0},
        { 2, mGaugino},
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
 {me2, DIAGONAL m0^2}
};


ParametersToSolveTadpoles = {m2};

DEFINITION[MatchingConditions]=Default[OHDM];

ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

DefaultInputValues ={m0 -> 10^6, mGaugino -> 10^6, Azero -> 0, Muinput->10^6, MAinput->10^6, TanBeta->2};


(*---------------------------------------------------*)
(* information for matching to THDM -- THDM + EWkinos -- MSSM at three threshold scales *)
(*---------------------------------------------------*)

MatchingToModel= {"THDMnoZ2","THDM+EWkinos","MSSM"};
MatchingScale = {MAinput,mGaugino,m0};

IncludeParticlesInThresholds={
 {hh,Ah,Hpm},
 {Chi,Cha },
 {Su,Sd,Se,Sv}
};

AssumptionsMatchingScale={
 {
  {v1,epsUV*Cos[ArcTan[TanBeta]]}, 
  {v2,epsUV*Sin[ArcTan[TanBeta]]}
 },
 {
  {vd,epsUV}, 
  {vu,epsUV},
  {M12,epsUV^2}
 },
 {
  {vd,epsUV}, 
  {vu,epsUV},
  {B[\[Mu]],epsUV^2},
  {\[Mu],epsUV},
  {MassB,epsUV},
  {MassWB,epsUV}  
 }
};

BoundaryMatchingScaleUp={
  (* SM -> THDM *)
{
 {M12, -MAinput^2 TanBeta/(1+TanBeta^2)},
  {Yu, Sqrt[1+TanBeta^2]/TanBeta*Yu - Sqrt[2]*ShiftCoupNLO[bar[Fu].Fu.hh[1]][PL]/ZH[1,2]},
  {Yd, Sqrt[1+TanBeta^2]*Yd - Sqrt[2]*ShiftCoupNLO[bar[Fd].Fd.hh[1]][PL]/ZH[1,1]},
  {Ye, Sqrt[1+TanBeta^2]*Ye - Sqrt[2]*ShiftCoupNLO[bar[Fe].Fe.hh[1]][PL]/ZH[1,1]}
},
  (* THDM -> THDM +EWkinos *)
{  
 {Yu, (Yu - Sqrt[2]*ShiftCoupNLO[bar[Fu].Fu.hh[2]][PL])},
 {Yd, (Yd - Sqrt[2]*ShiftCoupNLO[bar[Fd].Fd.hh[1]][PL])},
 {Ye, (Ye - Sqrt[2]*ShiftCoupNLO[bar[Fe].Fe.hh[1]][PL])},
 {MuSplit,MuInput},
 {MG, mGaugino},
 {MW, mGaugino},
 {MB, mGaugino}
},
  (* THDM + EWkinos -> MSSM *)
{
 {Yu, (Yu - Sqrt[2]*ShiftCoupNLO[bar[Fu].Fu.hh[2]][PL])},
 {Yd, (Yd - Sqrt[2]*ShiftCoupNLO[bar[Fd].Fd.hh[1]][PL])},
 {Ye, (Ye - Sqrt[2]*ShiftCoupNLO[bar[Fe].Fe.hh[1]][PL])},
 {B[\[Mu]], -M12},
 {MassB, MB},
 {MassWB, MW},
 {MassG, MG}
 }
};

BoundaryMatchingScaleDown={
 (* THDM -> SM *)
{
 (* {M12, -MAinput^2 TanBeta/(1+TanBeta^2)}, *)
  {lamSM, -1/3 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]}
},
 (* THDM + EWkinos-> THDM *)
{
 (* {MuSplit,MuInput},
  {MG, mGaugino},
  {MW, mGaugino},
  {MB, mGaugino},  *)
  {Lambda1, -1/6 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]},
  {Lambda2, -1/6 EFTcoupNLO[hh[2].hh[2].hh[2].hh[2]]},
  {Lambda3, -EFTcoupNLO[hh[1].hh[1].Hm[2].conj[Hm[2]]]},
  {Lambda4,  -EFTcoupNLO[hh[1].hh[2].conj[Hm[1]].Hm[2]] - I*EFTcoupNLO[hh[1].Ah[2].conj[Hm[2]].Hm[1]]},
  {Lambda5,  -EFTcoupNLO[hh[1].hh[2].conj[Hm[1]].Hm[2]] + I*EFTcoupNLO[hh[1].Ah[2].conj[Hm[2]].Hm[1]]},
  {Lambda6, -EFTcoupNLO[hh[1].hh[2].Hm[1].conj[Hm[1]]]},
  {Lambda7, -EFTcoupNLO[hh[1].hh[2].Hm[2].conj[Hm[2]]]}
 },
 (* MSSM -> THDM + EWkinos *)
 {
 {MG, MassG},
 {MW, MassWB},
 {MB, MassB},
 {MuSplit,\[Mu]},
 {M12, -B[\[Mu]]},
 {g1u,-2*(EFTcoupNLO[Chi[fB].Chi[FHu0].hh[2]][PL])},
 {g2u,2*(EFTcoupNLO[Chi[fW0].Chi[FHu0].hh[2]][PL])}, 
 {g1d,2*(EFTcoupNLO[Chi[fB].Chi[FHd0].hh[1]][PL])},
 {g2d,-2*(EFTcoupNLO[Chi[fW0].Chi[FHd0].hh[1]][PL])},
 {Lew1, -1/6 EFTcoupNLO[hh[1].hh[1].hh[1].hh[1]]},
 {Lew2, -1/6 EFTcoupNLO[hh[2].hh[2].hh[2].hh[2]]},
 {Lew3, -EFTcoupNLO[hh[1].hh[1].Hpm[2].conj[Hpm[2]]]},
 {Lew4,  EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[1]]] + I*EFTcoupNLO[hh[1].Ah[2].Hpm[1].conj[Hpm[2]]]},
 {Lew5,  EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[1]]] - I*EFTcoupNLO[hh[1].Ah[2].Hpm[1].conj[Hpm[2]]]},
 {Lew6, -EFTcoupNLO[hh[1].hh[2].Hpm[1].conj[Hpm[1]]]},
 {Lew7, -EFTcoupNLO[hh[1].hh[2].Hpm[2].conj[Hpm[2]]]}
 }
};

ParametersToSolveTadpoleMatchingScale={
 {M112,M222}, 
 {M112,M222},
 {mHd2,mHu2}
};
 


