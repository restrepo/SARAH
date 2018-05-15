MINPAR={{1,Mino},
        {2,MuInput},
        {3,TanBeta},
        {10,CutOffScale}

};

RenormalizationScaleFirstGuess = 100^2;
RenormalizationScale = v^2;

UseParameterAsGUTscale = {CutOffScale};

RealParameters = {TanBeta,CutOffScale};

ConditionGUTscale = g1 == g2; 


BoundaryHighScale={
 {\[Lambda],1/4 (g2^2+3/5 g1^2) Cos[2 ArcTan[TanBeta]]^2 },
 {MG,Mino},
 {MW,Mino},
 {MB,Mino},
 {\[Mu],MuInput},
 {g1u,Sqrt[3/5] g1 Sin[ArcTan[TanBeta]]   },
 {g2u,g2 Sin[ArcTan[TanBeta]]   }, 
 {g1d,Sqrt[3/5] g1 Cos[ArcTan[TanBeta]]   },
 {g2d,g2 Cos[ArcTan[TanBeta]]   }  
};


ParametersToSolveTadpoles = {m2};

DEFINITION[MatchingConditions]=Default[OHDM];

AlwaysInclude2Loop=True;



ListDecayParticles = Automatic;
ListDecayParticles3B = Automatic;

