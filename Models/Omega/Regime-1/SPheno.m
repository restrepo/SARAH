RegimeNr = 1;
IntermediateScale = True;

(* Gauge groups below threshold scale and representations 
of fields which are integrated to calculate finits shifts *)

HeavyFields = {Hpm1R1,DR2r1,Hpm2R1,Cha1r1,SDRmmR1,DR3r1,SDLpR1,SDLppR1,SDL0r1,DL1r1,DL2r1,DL3r1,SH0r1[3],SHCr1[3],H0r1[3],HCr1[3]};

NextGauge={U[1],SU[2],U[1],SU[3]};
NextQN = { {Hpm1R1,-1,1,0,1},
	   {DR2r1,-1,1,0,1},
	   {Hpm2R1,0,1,-1,1},
	   {Cha1r1,0,1,-1,1},
	   {SDRmmR1,-1,1,-1,1},
	   {DR3r1,-1,1,-1,1},
	   {SDLpR1,1,1,0,1},
	   {SDLppR1,2,1,0,1},
	   {SDL0r1,1,3,0,1},
	   {DL1r1,1,1,0,1},
	   {DL2r1,1,1,0,1},
	   {DL3r1,1,3,0,1},
	   {SH0r1,0,1,-1/2,1},
	   {SHCr1,0,2,1/2,1},
	   {H0r1,0,1,-1/2,1},
	   {HCr1,0,2,1/2,1}
};

ParametersToSolveTadpoles = {Mdelta};

MinimalParameterSetUp={gBL,g2,g3,YQ,YL};

UseGivenTadpoleSolution = True;

SubSolutionsTadpolesTree={
Mdelta -> SignumMdelta aInput vR/2
}; 

SubSolutionsTadpolesLoop={};



