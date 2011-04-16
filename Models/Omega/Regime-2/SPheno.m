
IntermediateScale = True;
RegimeNr = 2;

RenameParameters ={
{b,bparameter},
{\[Alpha], alphaOm},
{\[Alpha]c, alphaOmC}
};



ParametersToSolveTadpoles = {Mdeltac1, Momega};

(* Gauge groups below threshold scale and representations 
of fields which are integrated to calculate finits shifts *)

HeavyFields = {hhR2, AhR2, ChiR2[2], FvR2[4], SVRr2, SomegaL0r2, SOmLpR2, Fomega0, ChaR2};

NextGauge={U[1],SU[2],SU[3]};
NextQN = { {hhR2,0,1,1},
	   {AhR2,0,1,1},
	   {ChiR2,0,1,1},
	   {FvR2,0,1,1},
	   {SVRr2,0,1,1},
	   {SomegaL0r2,0,1,1},
	   {SOmLpR2,0,3,1},
	   {Fomega0,0,1,1},
	   {ChaR2,0,3,1}
};


MinimalParameterSetUp={gBL,gR,gL,g3,Yu,Yd,Ye,Yv};

UseGivenTadpoleSolution = True;

SubSolutionsTadpolesTree={
Mdelta -> - SignumMdelta ac1 vR/Sqrt[2],
Momega-> - SignumMomega ac1 vBL^2/(2 Sqrt[2] vR)  
};

SubSolutionsTadpolesLoop={};


