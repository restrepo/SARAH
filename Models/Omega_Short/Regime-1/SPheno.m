RegimeNr = 1;
IntermediateScale = True;

(* Gauge groups below threshold scale and representations 
of fields which are integrated to calculate finits shifts *)

HeavyFields = {Hpm1R1,ChiR1,Cha1r1,hhR1,AhR1,FvR1,SVRr1,SH0r1[3],SHCr1[3],SO1r1,SDLpR1,SDLppR1,SDL0r1,SDRmmR1,DR3r1,DL1r1,DL2r1,DL3r1,H0r1,HCr1};


NextGauge={U[1],SU[2],SU[3]};
NextQN = { {Hpm1R1,-1,1,1},
           {ChiR1, 0,1,1},
	   {Cha1r1,-1,1,1},
           {hhR1,0,1,1},
           {AhR1,0,1,1},
           {FvR1,0,1,1},
           {SVRr1,0,1,1},
	   {SH0r1,-1/2,1,1},
	   {SHCr1,1/2,2,1},
	   {SO1r1,0,1,1},
	   {SDLpR1,1,1,1},
	   {SDLppR1,2,1,1},
	   {SDL0r1,1,3,1},
	   {SDRmmR1,-2,1,1},
	   {DR3r1,-2,1,1},
	   {DL1r1,1,1,1},
	   {DL2r1,1,1,1},
	   {DL3r1,1,3,1},
	   {H0r1,-1/2,1,1},
	   {HCr1,1/2,2,1}
};


ParametersToSolveTadpoles = {Mdelta, Momega};

UseGivenTadpoleSolution = True;

SubSolutionsTadpolesTree={
Mdelta -> - SignumMdelta aInput vR/Sqrt[2],
Momega-> - SignumMomega aInput vBL^2/(2 Sqrt[2] vR)  
};

SubSolutionsTadpolesLoop={};



