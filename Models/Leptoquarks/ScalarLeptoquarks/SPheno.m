OnlyLowEnergySPheno = True;

MINPAR={
	{1, vSinput},
	{2, MPhiinput}
};

EXTPAR={
	{1, Linput},
	{2, LS3input},
	{3, LS4input},
	{4, LPhiinput},
	{5, gSHinput},
	{6, gHPinput},
	{7, gSPinput},
	{8, KSPinput},
	{9, KSHinput}
};

ParametersToSolveTadpoles = {mu2, MS2};

BoundaryLowScaleInput={
 {v, vSM},
 {vS, vSinput}, 
 {Ye, YeSM},
 {Yd, YdSM},
 {Yu, YuSM},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM},
 {\[Lambda],Linput},
 {LS3, LS3input},
 {LS4, LS4input},
 {LPhi, LPhiinput},
 {MPhi2, MPhiinput^2},
 {gSH, gSHinput},
 {gHP, gHPinput},
 {gSP, gSPinput},
 {KSP, KSPinput},
 {KSH, KSHinput},
 {MChi, LHInput[MChi]},
 {lamL, LHInput[lamL]},
 {lamR, LHInput[lamR]}, 
 {gSC, LHInput[gSC]}
};



ListDecayParticles = {Fu,Fe,Fd,hh,Phi0};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues={
	Linput -> 0.27,
	gSC[1,1] -> 3,
	gSC[2,2] -> 3
};
