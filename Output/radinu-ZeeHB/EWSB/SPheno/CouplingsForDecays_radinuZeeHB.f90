! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:05 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_radinuZeeHB
 
Use Control 
Use Settings 
Use Model_Data_radinuZeeHB 
Use Couplings_radinuZeeHB 
Use LoopCouplings_radinuZeeHB 
Use Tadpoles_radinuZeeHB 
 Use TreeLevelMasses_radinuZeeHB 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),            & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),            & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),& 
& cplcFdFucHmR(3,3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_Fv_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplFvFvVZL,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_2B
 
Subroutine CouplingsFor_VZ_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,    & 
& cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cpletIhhVZ(2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),    & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhVZVZ(2),        & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZ_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplHmVWpVZ(gt1))

End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZ_decays_2B
 
Subroutine CouplingsFor_VWp_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,           & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplhhcVWpVWp,      & 
& cplhhcHmcVWp,cplcVWpVWpVZ,cplcHmcVWpVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),             & 
& cplFvFecVWpR(3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWp_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpT(gt2,g2,ZP,cpletIcHmcVWp(gt2))

End Do 


cplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpT(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVZ(gt1))

End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWp_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cpletIetIhh,cpletIhhhh,            & 
& cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,    & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplHiggsPP(2),cplHiggsGG(2),cplHiggsZZvirt(2),cplHiggsWWvirt(2),cpletIetIhh(2),       & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplhhhhhh(2,2,2),             & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHm(3),ratVWp

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHm(3),ratPVWp

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,v,vv,g1,g2,              & 
& g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,               & 
& epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.False.)

! Run always SM gauge couplings if present 
! alphaS(mH/2) for NLO corrections to diphoton rate 
Call RunSMgauge(m_in/2._dp,deltaM, g1,g2,g3) 
AlphaSQhlf=g3**2/(4._dp*Pi) 
! alphaS(mH) for digluon rate 
Call RunSMgauge(m_in,deltaM, g1,g2,g3) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,vv,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cplhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpT(gt1,gt2,g2,ZH,ZP,cplhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWpVWp/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
rHB_S_VWp(i1) = Abs(-0.5_dp*cplhhcVWpVWp(i1)*vev/MVWp2) 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 3
ratHm(i2) = 0.5_dp*cplhhHmcHm(i1,i2,i2)*vev/MHm2(i2) 
End Do 
ratVWp = -0.5_dp*cplhhcVWpVWp(i1)*vev/MVWp2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratFd,ratFe,ratFu,ratHm,ratVWp,MFd,MFe,MFu,            & 
& MHm,MVWp,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHm,MVWp,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = 0 
CPL_H_H_Z = 0._dp 
End if 
cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,vv,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cplhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpT(gt1,gt2,g2,ZH,ZP,cplhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Hm_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,         & 
& cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVZ,cplcHmcVWpVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),            & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),           & 
& cplHmcHmVZ(3,3),cplcHmcVWpVZ(3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hm_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpT(gt2,g2,ZP,cpletIcHmcVWp(gt2))

End Do 


cplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpT(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVZ(gt1))

End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hm_decays_2B
 
Subroutine CouplingsFor_etI_decays_2B(m_in,i1,MAhinput,MAh2input,MetIinput,           & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),    & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2),   & 
& cpletIHmVWp(3),cpletIHmcHm(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_etI_2B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cpletIetIetI = 0._dp 
Call CouplingetIetIetIT(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpT(gt2,g2,ZP,cpletIHmVWp(gt2))

End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_etI_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFeetIL,cplcFeFeetIR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplFvFvVZL,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),           & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,       & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,               & 
& cplFvFvVZL,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHmL(3,3,3),              & 
& cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFuFdcVWpL(3,3),            & 
& cplcFuFdcVWpR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFuetIL(3,3),            & 
& cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),              & 
& cplcFuFuVZR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MetIinput,            & 
& MetI2input,MFdinput,MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,          & 
& MFv2input,Mhhinput,Mhh2input,MHminput,MHm2input,MVWpinput,MVWp2input,MVZinput,         & 
& MVZ2input,TWinput,ZDRinput,ZERinput,ZURinput,ZDLinput,ZELinput,ZULinput,               & 
& UVinput,ZHinput,ZPinput,ZWinput,ZZinput,alphaHinput,g1input,g2input,g3input,           & 
& lam1input,lam2input,lam4input,lam3input,lam7input,lam5input,lam6input,lam9input,       & 
& lam8input,lamhinput,lam10input,epsUinput,Yuinput,epsDinput,epsEinput,Ydinput,          & 
& Yeinput,Yhinput,muinput,mH2input,mEt2input,m12input,mhinput,vinput,vvinput,            & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFeetIL,cplcFeFeetIR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,           & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,               & 
& cplFvFvVZL,cplFvFvVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: g1input,g2input,g3input,lam5input,vinput,vvinput

Complex(dp),Intent(in) :: lam1input,lam2input,lam4input,lam3input,lam7input,lam6input,lam9input,lam8input,      & 
& lamhinput,lam10input,epsUinput(3,3),Yuinput(3,3),epsDinput(3,3),epsEinput(3,3),        & 
& Ydinput(3,3),Yeinput(3,3),Yhinput(3,3),muinput,mH2input,mEt2input,m12input,mhinput

Real(dp),Intent(in) :: MAhinput,MAh2input,MetIinput,MetI2input,MFdinput(3),MFd2input(3),MFeinput(3),         & 
& MFe2input(3),MFuinput(3),MFu2input(3),MFvinput(3),MFv2input(3),Mhhinput(2),            & 
& Mhh2input(2),MHminput(3),MHm2input(3),MVWpinput,MVWp2input,MVZinput,MVZ2input,         & 
& TWinput,ZHinput(2,2),ZPinput(3,3),ZZinput(2,2),alphaHinput

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& UVinput(3,3),ZWinput(2,2)

Real(dp) :: g1,g2,g3,lam5,v,vv

Complex(dp) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Complex(dp),Intent(out) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFeHmL(3,3,3),& 
& cplFvFeHmR(3,3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
g1 = g1input 
g2 = g2input 
g3 = g3input 
lam1 = lam1input 
lam2 = lam2input 
lam4 = lam4input 
lam3 = lam3input 
lam7 = lam7input 
lam5 = lam5input 
lam6 = lam6input 
lam9 = lam9input 
lam8 = lam8input 
lamh = lamhinput 
lam10 = lam10input 
epsU = epsUinput 
Yu = Yuinput 
epsD = epsDinput 
epsE = epsEinput 
Yd = Ydinput 
Ye = Yeinput 
Yh = Yhinput 
mu = muinput 
mH2 = mH2input 
mEt2 = mEt2input 
m12 = m12input 
mh = mhinput 
v = vinput 
vv = vvinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UV = UVinput 
ZH = ZHinput 
ZP = ZPinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MetI = MetIinput 
MetI2 = MetI2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHm = MHminput 
MHm2 = MHm2input 
MVWp = MVWpinput 
MVWp2 = MVWp2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
End if 
cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_radinuZeeHB
