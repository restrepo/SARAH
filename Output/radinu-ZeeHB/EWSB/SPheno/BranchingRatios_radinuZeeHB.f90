! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_radinuZeeHB 
 
Use Control 
Use Settings 
Use Couplings_radinuZeeHB 
Use Model_Data_radinuZeeHB 
Use LoopCouplings_radinuZeeHB 
Use Fu3Decays_radinuZeeHB 
Use Fe3Decays_radinuZeeHB 
Use Fd3Decays_radinuZeeHB 
Use TreeLevelDecays_radinuZeeHB 
Use OneLoopDecays_radinuZeeHB


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MetI,MetI2,MFd,            & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,            & 
& lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,            & 
& mEt2,m12,mh,gPFu,gTFu,BRFu,gPFe,gTFe,BRFe,gPFd,gTFd,BRFd,gPFv,gTFv,BRFv,               & 
& gPVZ,gTVZ,BRVZ,gPVWp,gTVWp,BRVWp,gPhh,gThh,BRhh,gPHm,gTHm,BRHm,gPetI,gTetI,BRetI)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,lam5

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(inout) :: v,vv

Real(dp),Intent(inout) :: gPFu(3,162),gTFu(3),BRFu(3,162),gPFe(3,159),gTFe(3),BRFe(3,159),gPFd(3,162),          & 
& gTFd(3),BRFd(3,162),gPFv(3,24),gTFv(3),BRFv(3,24),gPVZ(1,44),gTVZ,BRVZ(1,44),          & 
& gPVWp(1,29),gTVWp,BRVWp(1,29),gPhh(2,60),gThh(2),BRhh(2,60),gPHm(3,32),gTHm(3),        & 
& BRHm(3,32),gPetI(1,56),gTetI,BRetI(1,56)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplPseudoHiggsPP,cplPseudoHiggsGG,cplHiggsZZvirt(2),      & 
& cplHiggsWWvirt(2)

Real(dp) :: gTAh 
Real(dp) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFdcFeFv(3,3,3,3),      & 
& gFuFuFvFv(3,3,3,3),gFeFecFdFd(3,3,3,3),gFeFecFeFe(3,3,3,3),gFeFecFuFu(3,3,3,3),        & 
& gFeFeFvFv(3,3,3,3),gFeFvcFuFd(3,3,3,3),gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),        & 
& gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,3,3),gFdFuFvFe(3,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWp = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LFu,gP1LFe,gP1LFd,gP1LFv,gP1Lhh,gP1LHm,gP1LetI,        & 
& Mhh,Mhh2,MHm,MHm2,MFv,MFv2,MFd,MFd2,MFu,MFu2,MFe,MFe2,MAh,MAh2,MetI,MetI2,             & 
& MVZ,MVZ2,MVWp,MVWp2,ZH,ZP,UV,ZDL,ZDR,ZUL,ZUR,ZEL,ZER,v,vv,g1,g2,g3,lam1,               & 
& lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,               & 
& Ye,Yh,mu,mH2,mEt2,m12,mh,epsI,deltaM,kont)

End if 


gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPFu(:,1:27)        & 
& ,gTFu,BRFu(:,1:27))

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
If (OneLoopDecays) Then 
gT1LFu(i1) =Sum(gP1LFu(i1,:)) 
If (gT1LFu(i1).Gt.0._dp) BR1LFu(i1,: ) =gP1LFu(i1,:)/gT1LFu(i1) 
End if
End Do 
 

gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
Call FeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPFe(:,1:24)        & 
& ,gTFe,BRFe(:,1:24))

Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
If (OneLoopDecays) Then 
gT1LFe(i1) =Sum(gP1LFe(i1,:)) 
If (gT1LFe(i1).Gt.0._dp) BR1LFe(i1,: ) =gP1LFe(i1,:)/gT1LFe(i1) 
End if
End Do 
 

gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
Call FdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPFd(:,1:27)        & 
& ,gTFd,BRFd(:,1:27))

Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
If (OneLoopDecays) Then 
gT1LFd(i1) =Sum(gP1LFd(i1,:)) 
If (gT1LFd(i1).Gt.0._dp) BR1LFd(i1,: ) =gP1LFd(i1,:)/gT1LFd(i1) 
End if
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPFv,               & 
& gTFv,BRFv)

Do i1=1,3
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
If (OneLoopDecays) Then 
gT1LFv(i1) =Sum(gP1LFv(i1,:)) 
If (gT1LFv(i1).Gt.0._dp) BR1LFv(i1,: ) =gP1LFv(i1,:)/gT1LFv(i1) 
End if
End Do 
 

gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
Call VZTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPVZ,               & 
& gTVZ,BRVZ)

Do i1=1,1
gTVZ =Sum(gPVZ(i1,:)) 
If (gTVZ.Gt.0._dp) BRVZ(i1,: ) =gPVZ(i1,:)/gTVZ 
End Do 
 

! Set Goldstone Widhts 


gPVWp = 0._dp 
gTVWp = 0._dp 
BRVWp = 0._dp 
Call VWpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPVWp,              & 
& gTVWp,BRVWp)

Do i1=1,1
gTVWp =Sum(gPVWp(i1,:)) 
If (gTVWp.Gt.0._dp) BRVWp(i1,: ) =gPVWp(i1,:)/gTVWp 
End Do 
 

! Set Goldstone Widhts 
gTHm(1)=gTVWp


gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPhh,               & 
& gThh,BRhh)

Do i1=1,2
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
If (OneLoopDecays) Then 
gT1Lhh(i1) =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh(i1).Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh(i1) 
End if
End Do 
 

gPHm = 0._dp 
gTHm = 0._dp 
BRHm = 0._dp 
Call HmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPHm,               & 
& gTHm,BRHm)

Do i1=1,3
gTHm(i1) =Sum(gPHm(i1,:)) 
If (gTHm(i1).Gt.0._dp) BRHm(i1,: ) =gPHm(i1,:)/gTHm(i1) 
If (OneLoopDecays) Then 
gT1LHm(i1) =Sum(gP1LHm(i1,:)) 
If (gT1LHm(i1).Gt.0._dp) BR1LHm(i1,: ) =gP1LHm(i1,:)/gT1LHm(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTHm(1)=gTVWp


gPetI = 0._dp 
gTetI = 0._dp 
BRetI = 0._dp 
Call etITwoBodyDecay(-1,DeltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,            & 
& ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gPetI,              & 
& gTetI,BRetI)

Do i1=1,1
gTetI =Sum(gPetI(i1,:)) 
If (gTetI.Gt.0._dp) BRetI(i1,: ) =gPetI(i1,:)/gTetI 
If (OneLoopDecays) Then 
gT1LetI =Sum(gP1LetI(i1,:)) 
If (gT1LetI.Gt.0._dp) BR1LetI(i1,: ) =gP1LetI(i1,:)/gT1LetI 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fu)) Then 
If (MaxVal(gTFu).Lt.MaxVal(fac3*Abs(MFu))) Then 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,epsI,            & 
& deltaM,.False.,gTFu,gPFu(:,28:162),BRFu(:,28:162))

Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,epsI,            & 
& deltaM,.True.,gTFu,gPFu(:,28:162),BRFu(:,28:162))

End If 
 
End If 
Else 
Call FuThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,epsI,            & 
& deltaM,.False.,gTFu,gPFu(:,28:162),BRFu(:,28:162))

End If 
Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fe)) Then 
If (MaxVal(gTFe).Lt.MaxVal(fac3*Abs(MFe))) Then 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,            & 
& deltaM,.False.,gTFe,gPFe(:,25:159),BRFe(:,25:159))

Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,            & 
& deltaM,.True.,gTFe,gPFe(:,25:159),BRFe(:,25:159))

End If 
 
End If 
Else 
Call FeThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFeFecFdFd,gFeFecFeFe,gFeFecFuFu,gFeFeFvFv,gFeFvcFuFd,epsI,            & 
& deltaM,.False.,gTFe,gPFe(:,25:159),BRFe(:,25:159))

End If 
Do i1=1,3
gTFe(i1) =Sum(gPFe(i1,:)) 
If (gTFe(i1).Gt.0._dp) BRFe(i1,: ) =gPFe(i1,:)/gTFe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fd)) Then 
If (MaxVal(gTFd).Lt.MaxVal(fac3*Abs(MFd))) Then 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,             & 
& deltaM,.False.,gTFd,gPFd(:,28:162),BRFd(:,28:162))

Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,             & 
& deltaM,.True.,gTFd,gPFd(:,28:162),BRFd(:,28:162))

End If 
 
End If 
Else 
Call FdThreeBodyDecay(-1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,           & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,gTetI,gThh,              & 
& gTHm,gTVWp,gTVZ,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,gFdFdFvFv,gFdFuFvFe,epsI,             & 
& deltaM,.False.,gTFd,gPFd(:,28:162),BRFd(:,28:162))

End If 
Do i1=1,3
gTFd(i1) =Sum(gPFd(i1,:)) 
If (gTFd(i1).Gt.0._dp) BRFd(i1,: ) =gPFd(i1,:)/gTFd(i1) 
End Do 
 

! No 3-body decays for Fv  
! No 3-body decays for VZ  
! No 3-body decays for VWp  
! No 3-body decays for hh  
! No 3-body decays for Hm  
! No 3-body decays for etI  
Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_radinuZeeHB 
 