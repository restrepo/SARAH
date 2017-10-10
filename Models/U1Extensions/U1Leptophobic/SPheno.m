OnlyLowEnergySPheno = True;

MINPAR={{1,Lam1input},
        {2,Lam2input},
        {3,Lam3input},
        {4,LamPinput},   
        {5,Lamt1input},
        {6,Lamt2input},
        {7,TanBeta},
        {8,vPhiinput},
        {9,MuPhiinput},
        {10,gXinput},
        {11,g1Xinput}
        };
        
RealParameters = {TanBeta, vPhiinput, gXinput, g1Xinput};
ParametersToSolveTadpoles = {m1til2,m2til2,mPhi2};

DEFINITION[MatchingConditions]= {
 {v1, vSM*Cos[ArcTan[TanBeta]]},
 {v2, vSM*Sin[ArcTan[TanBeta]]}, 
 {Ye, YeSM*vSM/v2},
 {Yd, YdSM*vSM/v2},
 {Yu, YuSM*vSM/v1},
 {g1, g1SM},
 {g2, g2SM},
 {g3, g3SM}
 };

BoundaryLowScaleInput={

 {vPhi, vPhiinput},
 {MuPhi, MuPhiinput},

 {lam1,Lam1input},
 {lam2,Lam2input},
 {lam3,Lam3input},
 {lamPhi,LamPinput},
 {lamt1,Lamt1input},
 {lamt2,Lamt2input},
 {gX,gXinput},
 {g1X,g1Xinput},
 {gX1,0},
 {Yn,LHInput[Yn]},
 {YDt,LHInput[YDt]},
 {YHt,LHInput[YHt]},
 {YN1,LHInput[YN1]},
 {YN2,LHInput[YN2]}
};



ListDecayParticles = {Fu,Fe,Fd,Fv,FDt,FHc,FH0,hh,Ah,Hp,VZ,VZp,VWp};
ListDecayParticles3B = {{Fu,"Fu.f90"},{Fe,"Fe.f90"},{Fd,"Fd.f90"}};

DefaultInputValues =   {Lam1input -> 0.5,
			Lam2input -> 0.5,
			Lam3input -> 0.0,
			LamPinput -> 0.55,
			Lamt1input-> 0.0,
			Lamt2input-> 0.0,
			TanBeta -> 3.0,
			vPhiinput -> 1000.0,
			MuPhiinput -> -100.0,
			gXinput -> 0.5,
			g1Xinput -> 0.0 
		    };