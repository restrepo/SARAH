RenameParameters ={
{f,fOm},
{a,aOm},
{b,bOm},
{\[Alpha], alphaOm},
{T[\[Alpha]], TalphaOm},
{\[Alpha]c, alphaOmC},
{T[\[Alpha]c], TalphaOmC}
};


RegimeNr = 1;
IntermediateScale = True;

(* Gauge groups below threshold scale and representations 
of fields which are integrated to calculate finits shifts *)

HeavyFields = {Hpm1R1,DR2r1,Hpm2R1,Cha1r1,SDRmmR1,DR3r1,SDLpR1,SDLppR1,SDL0r1,DL1r1,DL2r1,DL3r1,SH0r1[3],SHCr1[3],H0r1[3],HCr1[3]};

NextGauge={U[1],SU[2],SU[3]};
NextQN = { {Hpm1R1,-1,1,1},
	   {DR2r1,-1,1,1},
	   {Hpm2R1,-1,1,1},
	   {Cha1r1,-1,1,1},
	   {SDRmmR1,-2,1,1},
	   {DR3r1,-2,1,1},
	   {SDLpR1,1,1,1},
	   {SDLppR1,2,1,1},
	   {SDL0r1,1,3,1},
	   {DL1r1,1,1,1},
	   {DL2r1,1,1,1},
	   {DL3r1,1,3,1},
	   {SH0r1,-1/2,1,1},
	   {SHCr1,1/2,2,1},
	   {H0r1,-1/2,1,1},
	   {HCr1,1/2,2,1}
};

ParametersToSolveTadpoles = {Mdelta,Momega};

SubSolutionsTadpolesTree={
Mdelta -> - SignumMdelta ac1 vR/Sqrt[2],
Momega-> - SignumMomega ac1 vBL^2/(2 Sqrt[2] vR)  
};

MinimalParameterSetUp={gBL,g2,g3,YQ,YL};

UseGivenTadpoleSolution = True;

SubSolutionsTadpolesTree={
Mdelta -> SignumMdelta aInput vR/2
}; 

SubSolutionsTadpolesLoop={};



