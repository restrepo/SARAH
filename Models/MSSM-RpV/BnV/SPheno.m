

MINPAR={m0,m12,TanBeta,SignumMu,Azero};
ParametersToSolveTadpoles = {\[Mu],B[\[Mu]]};

RenormalizationScaleFirstGuess = m0^2 + 4 m12^2;
RenormalizationScale = MSu[1]*MSu[6];

RenameParameters ={
{\[Epsilon],epsRpV},
{B[\[Epsilon]],BepsRpV}
};



BoundaryHighScale={
{T[Ye], Azero*Ye},
{T[Yd], Azero*Yd},
{T[Yu], Azero*Yu},
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




ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

UseStandardLowEnergy = True;
mueEff = mue;
LoopTadpolesForTreeMasses=True;

HiggsCouplingsRatio[Cha]="cplcChaChahhL(i2,i2,i1)*mW/(g2*MCha(i2))";
HiggsCouplingsRatio[Hpm]="cplhhcHpmHpm(i1,i2,i2)*mW/(g2*MHpm2(i2))";
HiggsCouplingsRatio[Sd]="-0.5_dp*cplSdcSdhh(i2,i2,i1)*vd/(MSd2(i2))";
HiggsCouplingsRatio[Su]="-0.5_dp*cplSucSuhh(i2,i2,i1)*vd/(MSu2(i2))";
HiggsCouplingsRatio[Fu]="ZH(i1,2)*sqrt(vd**2+vu**2)/vu";
HiggsCouplingsRatio[Fd]="ZH(i1,1)*sqrt(vd**2+vu**2)/vd";
HiggsCouplingsRatio[Fe]="ZH(i1,1)*sqrt(vd**2+vu**2)/vd";
HiggsCouplingsRatio[VWm]="(vd*ZH(i1,2)+vu*ZH(i1,2))/(vd**2+vu**2)";