! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fe_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_Fe_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fe(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,              & 
& MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,            & 
& MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,               & 
& lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,               & 
& Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,               & 
& dYh,dmH2,dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,               & 
& dlam8,dlamh,dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,               & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,              & 
& ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhcHmcVWp,    & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFeFeAhL,          & 
& cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,            & 
& cplcFeFvVWpR,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,        & 
& cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplFvFecVWpL,   & 
& cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcVWpVWp,    & 
& cplhhhhhh,cplhhHmcHm,cplhhHmVWp,cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,cplHmVPVWp,            & 
& cplHmVWpVZ,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFeFeetIL,ctcplcFeFeetIR,ctcplcFeFehhL,    & 
& ctcplcFeFehhR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFvcHmL,  & 
& ctcplcFeFvcHmR,ctcplcFeFvVWpL,ctcplcFeFvVWpR,GcplHmVPVWp,GosZcplHmVPVWp,               & 
& GZcplHmVPVWp,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplcFeFehhL,       & 
& ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFvcHmL,        & 
& ZcplcFeFvcHmR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcHmcVWpVP,ZcplcVWpVPVWp,ZcplFvFecVWpL,   & 
& ZcplFvFecVWpR,ZcplFvFeHmL,ZcplFvFeHmR,ZcplHmcHmVP,ZcplHmVPVWp,ZRUZH,ZRUZP,             & 
& ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFe)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(in) :: v,vv

Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: dg1,dg2,dg3,dlam5,dv,dvv,dZH(2,2),dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp),Intent(in) :: depsU(3,3),dYu(3,3),depsD(3,3),depsE(3,3),dYd(3,3),dYe(3,3),dYh(3,3),dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam6,dmh,dlam9,dlam8,dlamh,dmu,              & 
& dlam10,dUV(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp),Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhcHmcVWp(3),cplAhetIetI,cplAhetIhh(2),          & 
& cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVWp(3),cplcFeFeAhL(3,3),            & 
& cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),           & 
& cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp(3),            & 
& cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmcHm(3,3),            & 
& cpletIHmVWp(3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplhhhhhh(2,2,2),    & 
& cplhhHmcHm(2,3,3),cplhhHmVWp(2,3),cplhhVZVZ(2),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),        & 
& cplHmVPVWp(3),cplHmVWpVZ(3),ctcplcFeFeAhL(3,3),ctcplcFeFeAhR(3,3),ctcplcFeFeetIL(3,3), & 
& ctcplcFeFeetIR(3,3),ctcplcFeFehhL(3,3,2),ctcplcFeFehhR(3,3,2),ctcplcFeFeVPL(3,3),      & 
& ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3),ctcplcFeFvcHmL(3,3,3),        & 
& ctcplcFeFvcHmR(3,3,3),ctcplcFeFvVWpL(3,3),ctcplcFeFvVWpR(3,3),GcplHmVPVWp(3),          & 
& GosZcplHmVPVWp(3),GZcplHmVPVWp(3),ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3),ZcplcFeFeetIL(3,3),& 
& ZcplcFeFeetIR(3,3),ZcplcFeFehhL(3,3,2),ZcplcFeFehhR(3,3,2),ZcplcFeFeVPL(3,3),          & 
& ZcplcFeFeVPR(3,3),ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),ZcplcFeFvcHmL(3,3,3),            & 
& ZcplcFeFvcHmR(3,3,3),ZcplcFeFvVWpL(3,3),ZcplcFeFvVWpR(3,3),ZcplcHmcVWpVP(3),           & 
& ZcplcVWpVPVWp,ZcplFvFecVWpL(3,3),ZcplFvFecVWpR(3,3),ZcplFvFeHmL(3,3,3),ZcplFvFeHmR(3,3,3),& 
& ZcplHmcHmVP(3,3),ZcplHmVPVWp(3)

Real(dp), Intent(in) :: em, gs 
Complex(dp),Intent(in) :: ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh(2,2),ZfHm(3,3),ZfVL(3,3),ZfDL(3,3),              & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MHmOS(3),MHm2OS(3),MFvOS(3),MFv2OS(3),MFdOS(3),MFd2OS(3),          & 
& MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,               & 
& MVZ2OS,MVWpOS,MVWp2OS,ZHOS(2,2),ZPOS(3,3)

Complex(dp),Intent(in) :: UVOS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp),Intent(in) :: ZRUZH(2,2),ZRUZP(3,3),ZRUVv(3,3),ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),         & 
& ZRUVe(3,3),ZRUUe(3,3)

Real(dp), Intent(in) :: MLambda, deltaM 
Real(dp), Intent(out) :: gP1LFe(3,24) 
Integer, Intent(out) :: kont 
Real(dp) :: MVG,MVP,MVG2,MVP2, helfactor, phasespacefactor 
Integer :: i1,i2,i3,i4, isave, gt1, gt2, gt3 

Complex(dp) :: ZRUZHc(2, 2) 
Complex(dp) :: ZRUZPc(3, 3) 
Complex(dp) :: ZRUVvc(3, 3) 
Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
Real(dp) :: MRPFeToFeetI(3,3),MRGFeToFeetI(3,3), MRPZFeToFeetI(3,3),MRGZFeToFeetI(3,3) 
Real(dp) :: MVPFeToFeetI(3,3) 
Real(dp) :: RMsqTreeFeToFeetI(3,3),RMsqWaveFeToFeetI(3,3),RMsqVertexFeToFeetI(3,3) 
Complex(dp) :: AmpTreeFeToFeetI(2,3,3),AmpWaveFeToFeetI(2,3,3)=(0._dp,0._dp),AmpVertexFeToFeetI(2,3,3)& 
 & ,AmpVertexIRosFeToFeetI(2,3,3),AmpVertexIRdrFeToFeetI(2,3,3), AmpSumFeToFeetI(2,3,3), AmpSum2FeToFeetI(2,3,3) 
Complex(dp) :: AmpTreeZFeToFeetI(2,3,3),AmpWaveZFeToFeetI(2,3,3),AmpVertexZFeToFeetI(2,3,3) 
Real(dp) :: AmpSqFeToFeetI(3,3),  AmpSqTreeFeToFeetI(3,3) 
Real(dp) :: MRPFeToFehh(3,3,2),MRGFeToFehh(3,3,2), MRPZFeToFehh(3,3,2),MRGZFeToFehh(3,3,2) 
Real(dp) :: MVPFeToFehh(3,3,2) 
Real(dp) :: RMsqTreeFeToFehh(3,3,2),RMsqWaveFeToFehh(3,3,2),RMsqVertexFeToFehh(3,3,2) 
Complex(dp) :: AmpTreeFeToFehh(2,3,3,2),AmpWaveFeToFehh(2,3,3,2)=(0._dp,0._dp),AmpVertexFeToFehh(2,3,3,2)& 
 & ,AmpVertexIRosFeToFehh(2,3,3,2),AmpVertexIRdrFeToFehh(2,3,3,2), AmpSumFeToFehh(2,3,3,2), AmpSum2FeToFehh(2,3,3,2) 
Complex(dp) :: AmpTreeZFeToFehh(2,3,3,2),AmpWaveZFeToFehh(2,3,3,2),AmpVertexZFeToFehh(2,3,3,2) 
Real(dp) :: AmpSqFeToFehh(3,3,2),  AmpSqTreeFeToFehh(3,3,2) 
Real(dp) :: MRPFeToFeVZ(3,3),MRGFeToFeVZ(3,3), MRPZFeToFeVZ(3,3),MRGZFeToFeVZ(3,3) 
Real(dp) :: MVPFeToFeVZ(3,3) 
Real(dp) :: RMsqTreeFeToFeVZ(3,3),RMsqWaveFeToFeVZ(3,3),RMsqVertexFeToFeVZ(3,3) 
Complex(dp) :: AmpTreeFeToFeVZ(4,3,3),AmpWaveFeToFeVZ(4,3,3)=(0._dp,0._dp),AmpVertexFeToFeVZ(4,3,3)& 
 & ,AmpVertexIRosFeToFeVZ(4,3,3),AmpVertexIRdrFeToFeVZ(4,3,3), AmpSumFeToFeVZ(4,3,3), AmpSum2FeToFeVZ(4,3,3) 
Complex(dp) :: AmpTreeZFeToFeVZ(4,3,3),AmpWaveZFeToFeVZ(4,3,3),AmpVertexZFeToFeVZ(4,3,3) 
Real(dp) :: AmpSqFeToFeVZ(3,3),  AmpSqTreeFeToFeVZ(3,3) 
Real(dp) :: MRPFeToFvVWp(3,3),MRGFeToFvVWp(3,3), MRPZFeToFvVWp(3,3),MRGZFeToFvVWp(3,3) 
Real(dp) :: MVPFeToFvVWp(3,3) 
Real(dp) :: RMsqTreeFeToFvVWp(3,3),RMsqWaveFeToFvVWp(3,3),RMsqVertexFeToFvVWp(3,3) 
Complex(dp) :: AmpTreeFeToFvVWp(4,3,3),AmpWaveFeToFvVWp(4,3,3)=(0._dp,0._dp),AmpVertexFeToFvVWp(4,3,3)& 
 & ,AmpVertexIRosFeToFvVWp(4,3,3),AmpVertexIRdrFeToFvVWp(4,3,3), AmpSumFeToFvVWp(4,3,3), AmpSum2FeToFvVWp(4,3,3) 
Complex(dp) :: AmpTreeZFeToFvVWp(4,3,3),AmpWaveZFeToFvVWp(4,3,3),AmpVertexZFeToFvVWp(4,3,3) 
Real(dp) :: AmpSqFeToFvVWp(3,3),  AmpSqTreeFeToFvVWp(3,3) 
Real(dp) :: MRPFeToFvcHm(3,3,3),MRGFeToFvcHm(3,3,3), MRPZFeToFvcHm(3,3,3),MRGZFeToFvcHm(3,3,3) 
Real(dp) :: MVPFeToFvcHm(3,3,3) 
Real(dp) :: RMsqTreeFeToFvcHm(3,3,3),RMsqWaveFeToFvcHm(3,3,3),RMsqVertexFeToFvcHm(3,3,3) 
Complex(dp) :: AmpTreeFeToFvcHm(2,3,3,3),AmpWaveFeToFvcHm(2,3,3,3)=(0._dp,0._dp),AmpVertexFeToFvcHm(2,3,3,3)& 
 & ,AmpVertexIRosFeToFvcHm(2,3,3,3),AmpVertexIRdrFeToFvcHm(2,3,3,3), AmpSumFeToFvcHm(2,3,3,3), AmpSum2FeToFvcHm(2,3,3,3) 
Complex(dp) :: AmpTreeZFeToFvcHm(2,3,3,3),AmpWaveZFeToFvcHm(2,3,3,3),AmpVertexZFeToFvcHm(2,3,3,3) 
Real(dp) :: AmpSqFeToFvcHm(3,3,3),  AmpSqTreeFeToFvcHm(3,3,3) 
Real(dp) :: MRPFeToFeVP(3,3),MRGFeToFeVP(3,3), MRPZFeToFeVP(3,3),MRGZFeToFeVP(3,3) 
Real(dp) :: MVPFeToFeVP(3,3) 
Real(dp) :: RMsqTreeFeToFeVP(3,3),RMsqWaveFeToFeVP(3,3),RMsqVertexFeToFeVP(3,3) 
Complex(dp) :: AmpTreeFeToFeVP(4,3,3),AmpWaveFeToFeVP(4,3,3)=(0._dp,0._dp),AmpVertexFeToFeVP(4,3,3)& 
 & ,AmpVertexIRosFeToFeVP(4,3,3),AmpVertexIRdrFeToFeVP(4,3,3), AmpSumFeToFeVP(4,3,3), AmpSum2FeToFeVP(4,3,3) 
Complex(dp) :: AmpTreeZFeToFeVP(4,3,3),AmpWaveZFeToFeVP(4,3,3),AmpVertexZFeToFeVP(4,3,3) 
Real(dp) :: AmpSqFeToFeVP(3,3),  AmpSqTreeFeToFeVP(3,3) 
Write(*,*) "Calculating one-loop decays of Fe " 
kont = 0 
MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

ZRUZHc = Conjg(ZRUZH)
ZRUZPc = Conjg(ZRUZP)
ZRUVvc = Conjg(ZRUVv)
ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)

 ! Counter 
isave = 1 

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FeToFeetI(cplcFeFeetIL,cplcFeFeetIR,MetI,             & 
& MFe,MetI2,MFe2,AmpTreeFeToFeetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_FeToFeetI(ZcplcFeFeetIL,ZcplcFeFeetIR,MetI,           & 
& MFe,MetI2,MFe2,AmpTreeFeToFeetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFeetI(MLambda,em,gs,cplcFeFeetIL,cplcFeFeetIR,        & 
& MetIOS,MFeOS,MRPFeToFeetI,MRGFeToFeetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFeetI(MLambda,em,gs,ZcplcFeFeetIL,ZcplcFeFeetIR,      & 
& MetIOS,MFeOS,MRPFeToFeetI,MRGFeToFeetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FeToFeetI(MLambda,em,gs,cplcFeFeetIL,cplcFeFeetIR,        & 
& MetI,MFe,MRPFeToFeetI,MRGFeToFeetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFeetI(MLambda,em,gs,ZcplcFeFeetIL,ZcplcFeFeetIR,      & 
& MetI,MFe,MRPFeToFeetI,MRGFeToFeetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FeToFeetI(cplcFeFeetIL,cplcFeFeetIR,ctcplcFeFeetIL,   & 
& ctcplcFeFeetIR,MetI,MetI2,MFe,MFe2,ZfEL,ZfER,ZfetI,AmpWaveFeToFeetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FeToFeetI(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,             & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,        & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,cplcFeFeetIL,              & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexFeToFeetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,cplcFeFeetIL,              & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRdrFeToFeetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,         & 
& cpletIetIetI,cpletIetIhh,ZcplcFeFeetIL,ZcplcFeFeetIR,cpletIhhhh,cpletIhhVZ,            & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,              & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosFeToFeetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,ZcplcFeFeetIL,             & 
& ZcplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosFeToFeetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,         & 
& cpletIetIetI,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,              & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,              & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosFeToFeetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,cplcFeFeetIL,              & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosFeToFeetI)

 End if 
 End if 
AmpVertexFeToFeetI = AmpVertexFeToFeetI -  AmpVertexIRdrFeToFeetI! +  AmpVertexIRosFeToFeetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFeetI=0._dp 
AmpVertexZFeToFeetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFeetI(1,gt2,:) = AmpWaveZFeToFeetI(1,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeetI(1,gt1,:) 
AmpVertexZFeToFeetI(1,gt2,:)= AmpVertexZFeToFeetI(1,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeetI(1,gt1,:) 
AmpWaveZFeToFeetI(2,gt2,:) = AmpWaveZFeToFeetI(2,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeetI(2,gt1,:) 
AmpVertexZFeToFeetI(2,gt2,:)= AmpVertexZFeToFeetI(2,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeetI(2,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFeetI=AmpWaveZFeToFeetI 
AmpVertexFeToFeetI= AmpVertexZFeToFeetI
! Final State 1 
AmpWaveZFeToFeetI=0._dp 
AmpVertexZFeToFeetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFeetI(1,:,gt2) = AmpWaveZFeToFeetI(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeetI(1,:,gt1) 
AmpVertexZFeToFeetI(1,:,gt2)= AmpVertexZFeToFeetI(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeetI(1,:,gt1) 
AmpWaveZFeToFeetI(2,:,gt2) = AmpWaveZFeToFeetI(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeetI(2,:,gt1) 
AmpVertexZFeToFeetI(2,:,gt2)= AmpVertexZFeToFeetI(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeetI(2,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFeetI=AmpWaveZFeToFeetI 
AmpVertexFeToFeetI= AmpVertexZFeToFeetI
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFeetI = AmpVertexFeToFeetI  +  AmpVertexIRosFeToFeetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFeetI = AmpTreeFeToFeetI 
 AmpSum2FeToFeetI = AmpTreeFeToFeetI + 2._dp*AmpWaveFeToFeetI + 2._dp*AmpVertexFeToFeetI  
Else 
 AmpSumFeToFeetI = AmpTreeFeToFeetI + AmpWaveFeToFeetI + AmpVertexFeToFeetI
 AmpSum2FeToFeetI = AmpTreeFeToFeetI + AmpWaveFeToFeetI + AmpVertexFeToFeetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeetI = AmpTreeFeToFeetI
 AmpSum2FeToFeetI = AmpTreeFeToFeetI 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFeOS(gt1).gt.(MFeOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(MFe(gt1).gt.(MFe(gt2)+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFeetI = AmpTreeFeToFeetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MetIOS,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),MetI,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFeetI(gt1, gt2) 
  AmpSum2FeToFeetI = 2._dp*AmpWaveFeToFeetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MetIOS,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),MetI,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFeetI(gt1, gt2) 
  AmpSum2FeToFeetI = 2._dp*AmpVertexFeToFeetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MetIOS,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),MetI,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFeetI(gt1, gt2) 
  AmpSum2FeToFeetI = AmpTreeFeToFeetI + 2._dp*AmpWaveFeToFeetI + 2._dp*AmpVertexFeToFeetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MetIOS,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),MetI,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFeetI(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFeetI = AmpTreeFeToFeetI
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MetIOS,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
  AmpSqTreeFeToFeetI(gt1, gt2) = AmpSqFeToFeetI(gt1, gt2)  
  AmpSum2FeToFeetI = + 2._dp*AmpWaveFeToFeetI + 2._dp*AmpVertexFeToFeetI
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MetIOS,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
  AmpSqFeToFeetI(gt1, gt2) = AmpSqFeToFeetI(gt1, gt2) + AmpSqTreeFeToFeetI(gt1, gt2)  
Else  
  AmpSum2FeToFeetI = AmpTreeFeToFeetI
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),MetI,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
  AmpSqTreeFeToFeetI(gt1, gt2) = AmpSqFeToFeetI(gt1, gt2)  
  AmpSum2FeToFeetI = + 2._dp*AmpWaveFeToFeetI + 2._dp*AmpVertexFeToFeetI
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),MetI,AmpSumFeToFeetI(:,gt1, gt2),AmpSum2FeToFeetI(:,gt1, gt2),AmpSqFeToFeetI(gt1, gt2)) 
  AmpSqFeToFeetI(gt1, gt2) = AmpSqFeToFeetI(gt1, gt2) + AmpSqTreeFeToFeetI(gt1, gt2)  
End if  
Else  
  AmpSqFeToFeetI(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeetI(gt1, gt2).le.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MetIOS,helfactor*AmpSqFeToFeetI(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MetI,helfactor*AmpSqFeToFeetI(gt1, gt2))
End if 
If ((Abs(MRPFeToFeetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFeetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFeetI(gt1, gt2) + MRGFeToFeetI(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFeetI(gt1, gt2) + MRGFeToFeetI(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FeToFehh(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,             & 
& MFe2,Mhh2,AmpTreeFeToFehh)

  Else 
Call Amplitude_Tree_radinuZeeHB_FeToFehh(ZcplcFeFehhL,ZcplcFeFehhR,MFe,               & 
& Mhh,MFe2,Mhh2,AmpTreeFeToFehh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,           & 
& MFeOS,MhhOS,MRPFeToFehh,MRGFeToFehh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFehh(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,         & 
& MFeOS,MhhOS,MRPFeToFehh,MRGFeToFehh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,           & 
& MFe,Mhh,MRPFeToFehh,MRGFeToFehh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFehh(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,         & 
& MFe,Mhh,MRPFeToFehh,MRGFeToFehh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FeToFehh(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,       & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,AmpWaveFeToFehh)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FeToFehh(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,              & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,          & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexFeToFehh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRdrFeToFehh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh(MAhOS,MetIOS,MFeOS,MFvOS,               & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,            & 
& cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cplFvFeHmL,      & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,ZcplcFeFehhL,ZcplcFeFehhR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,      & 
& AmpVertexIRosFeToFehh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,ZcplcFeFehhL,    & 
& ZcplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,             & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFeToFehh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh(MAhOS,MetIOS,MFeOS,MFvOS,               & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,            & 
& cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cplFvFeHmL,      & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,      & 
& AmpVertexIRosFeToFehh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFeToFehh)

 End if 
 End if 
AmpVertexFeToFehh = AmpVertexFeToFehh -  AmpVertexIRdrFeToFehh! +  AmpVertexIRosFeToFehh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFehh(1,gt2,:,:) = AmpWaveZFeToFehh(1,gt2,:,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFehh(1,gt1,:,:) 
AmpVertexZFeToFehh(1,gt2,:,:)= AmpVertexZFeToFehh(1,gt2,:,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFehh(1,gt1,:,:) 
AmpWaveZFeToFehh(2,gt2,:,:) = AmpWaveZFeToFehh(2,gt2,:,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFehh(2,gt1,:,:) 
AmpVertexZFeToFehh(2,gt2,:,:)= AmpVertexZFeToFehh(2,gt2,:,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFehh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
! Final State 1 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFehh(1,:,gt2,:) = AmpWaveZFeToFehh(1,:,gt2,:)+ZRUVe(gt2,gt1)*AmpWaveFeToFehh(1,:,gt1,:) 
AmpVertexZFeToFehh(1,:,gt2,:)= AmpVertexZFeToFehh(1,:,gt2,:)+ZRUVe(gt2,gt1)*AmpVertexFeToFehh(1,:,gt1,:) 
AmpWaveZFeToFehh(2,:,gt2,:) = AmpWaveZFeToFehh(2,:,gt2,:)+ZRUUec(gt2,gt1)*AmpWaveFeToFehh(2,:,gt1,:) 
AmpVertexZFeToFehh(2,:,gt2,:)= AmpVertexZFeToFehh(2,:,gt2,:)+ZRUUec(gt2,gt1)*AmpVertexFeToFehh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
! Final State 2 
AmpWaveZFeToFehh=0._dp 
AmpVertexZFeToFehh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFeToFehh(:,:,:,gt2) = AmpWaveZFeToFehh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveFeToFehh(:,:,:,gt1) 
AmpVertexZFeToFehh(:,:,:,gt2)= AmpVertexZFeToFehh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexFeToFehh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFehh=AmpWaveZFeToFehh 
AmpVertexFeToFehh= AmpVertexZFeToFehh
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFehh = AmpVertexFeToFehh  +  AmpVertexIRosFeToFehh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFehh = AmpTreeFeToFehh 
 AmpSum2FeToFehh = AmpTreeFeToFehh + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh  
Else 
 AmpSumFeToFehh = AmpTreeFeToFehh + AmpWaveFeToFehh + AmpVertexFeToFehh
 AmpSum2FeToFehh = AmpTreeFeToFehh + AmpWaveFeToFehh + AmpVertexFeToFehh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFehh = AmpTreeFeToFehh
 AmpSum2FeToFehh = AmpTreeFeToFehh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(MFeOS(gt1).gt.(MFeOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MFe(gt1).gt.(MFe(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FeToFehh = AmpTreeFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFehh(gt1, gt2, gt3) 
  AmpSum2FeToFehh = 2._dp*AmpWaveFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFehh(gt1, gt2, gt3) 
  AmpSum2FeToFehh = 2._dp*AmpVertexFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFehh(gt1, gt2, gt3) 
  AmpSum2FeToFehh = AmpTreeFeToFehh + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFehh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFehh = AmpTreeFeToFehh
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqTreeFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3)  
  AmpSum2FeToFehh = + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
  Call SquareAmp_FtoFS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3) + AmpSqTreeFeToFehh(gt1, gt2, gt3)  
Else  
  AmpSum2FeToFehh = AmpTreeFeToFehh
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqTreeFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3)  
  AmpSum2FeToFehh = + 2._dp*AmpWaveFeToFehh + 2._dp*AmpVertexFeToFehh
  Call SquareAmp_FtoFS(MFe(gt1),MFe(gt2),Mhh(gt3),AmpSumFeToFehh(:,gt1, gt2, gt3),AmpSum2FeToFehh(:,gt1, gt2, gt3),AmpSqFeToFehh(gt1, gt2, gt3)) 
  AmpSqFeToFehh(gt1, gt2, gt3) = AmpSqFeToFehh(gt1, gt2, gt3) + AmpSqTreeFeToFehh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFeToFehh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFehh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MhhOS(gt3),helfactor*AmpSqFeToFehh(gt1, gt2, gt3))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),Mhh(gt3),helfactor*AmpSqFeToFehh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFeToFehh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFehh(gt1, gt2, gt3) + MRGFeToFehh(gt1, gt2, gt3)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFehh(gt1, gt2, gt3) + MRGFeToFehh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fe VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FeToFeVZ(cplcFeFeVZL,cplcFeFeVZR,MFe,MVZ,             & 
& MFe2,MVZ2,AmpTreeFeToFeVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_FeToFeVZ(ZcplcFeFeVZL,ZcplcFeFeVZR,MFe,               & 
& MVZ,MFe2,MVZ2,AmpTreeFeToFeVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,           & 
& MFeOS,MVZOS,MRPFeToFeVZ,MRGFeToFeVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFeVZ(MLambda,em,gs,ZcplcFeFeVZL,ZcplcFeFeVZR,         & 
& MFeOS,MVZOS,MRPFeToFeVZ,MRGFeToFeVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,           & 
& MFe,MVZ,MRPFeToFeVZ,MRGFeToFeVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFeVZ(MLambda,em,gs,ZcplcFeFeVZL,ZcplcFeFeVZR,         & 
& MFe,MVZ,MRPFeToFeVZ,MRGFeToFeVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FeToFeVZ(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFe,               & 
& MFe2,MVP,MVP2,MVZ,MVZ2,ZfEL,ZfER,ZfVPVZ,ZfVZ,AmpWaveFeToFeVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FeToFeVZ(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,              & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,     & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexFeToFeVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,      & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRdrFeToFeVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ(MAhOS,MetIOS,MFeOS,MFvOS,               & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,       & 
& cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFeFeVPL,cplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,              & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFeToFeVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,      & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& ZcplcFeFeVZL,ZcplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRosFeToFeVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ(MAhOS,MetIOS,MFeOS,MFvOS,               & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,       & 
& cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,    & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,   & 
& cplcHmcVWpVZ,AmpVertexIRosFeToFeVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,      & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRosFeToFeVZ)

 End if 
 End if 
AmpVertexFeToFeVZ = AmpVertexFeToFeVZ -  AmpVertexIRdrFeToFeVZ! +  AmpVertexIRosFeToFeVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFeVZ=0._dp 
AmpVertexZFeToFeVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFeVZ(1,gt2,:) = AmpWaveZFeToFeVZ(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZ(1,gt1,:) 
AmpVertexZFeToFeVZ(1,gt2,:)= AmpVertexZFeToFeVZ(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZ(1,gt1,:) 
AmpWaveZFeToFeVZ(2,gt2,:) = AmpWaveZFeToFeVZ(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZ(2,gt1,:) 
AmpVertexZFeToFeVZ(2,gt2,:)= AmpVertexZFeToFeVZ(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZ(2,gt1,:) 
AmpWaveZFeToFeVZ(3,gt2,:) = AmpWaveZFeToFeVZ(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFeVZ(3,gt1,:) 
AmpVertexZFeToFeVZ(3,gt2,:)= AmpVertexZFeToFeVZ(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFeVZ(3,gt1,:) 
AmpWaveZFeToFeVZ(4,gt2,:) = AmpWaveZFeToFeVZ(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFeVZ(4,gt1,:) 
AmpVertexZFeToFeVZ(4,gt2,:)= AmpVertexZFeToFeVZ(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFeVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFeVZ=AmpWaveZFeToFeVZ 
AmpVertexFeToFeVZ= AmpVertexZFeToFeVZ
! Final State 1 
AmpWaveZFeToFeVZ=0._dp 
AmpVertexZFeToFeVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFeVZ(1,:,gt2) = AmpWaveZFeToFeVZ(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZ(1,:,gt1) 
AmpVertexZFeToFeVZ(1,:,gt2)= AmpVertexZFeToFeVZ(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZ(1,:,gt1) 
AmpWaveZFeToFeVZ(2,:,gt2) = AmpWaveZFeToFeVZ(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZ(2,:,gt1) 
AmpVertexZFeToFeVZ(2,:,gt2)= AmpVertexZFeToFeVZ(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZ(2,:,gt1) 
AmpWaveZFeToFeVZ(3,:,gt2) = AmpWaveZFeToFeVZ(3,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFeToFeVZ(3,:,gt1) 
AmpVertexZFeToFeVZ(3,:,gt2)= AmpVertexZFeToFeVZ(3,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFeToFeVZ(3,:,gt1) 
AmpWaveZFeToFeVZ(4,:,gt2) = AmpWaveZFeToFeVZ(4,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFeToFeVZ(4,:,gt1) 
AmpVertexZFeToFeVZ(4,:,gt2)= AmpVertexZFeToFeVZ(4,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFeToFeVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFeVZ=AmpWaveZFeToFeVZ 
AmpVertexFeToFeVZ= AmpVertexZFeToFeVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFeVZ = AmpVertexFeToFeVZ  +  AmpVertexIRosFeToFeVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ 
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ  
Else 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ + AmpWaveFeToFeVZ + AmpVertexFeToFeVZ
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + AmpWaveFeToFeVZ + AmpVertexFeToFeVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVZ = AmpTreeFeToFeVZ
 AmpSum2FeToFeVZ = AmpTreeFeToFeVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFeOS(gt1).gt.(MFeOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MFe(gt1).gt.(MFe(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = 2._dp*AmpWaveFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = 2._dp*AmpVertexFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFeVZ(gt1, gt2) 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFeVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqTreeFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2)  
  AmpSum2FeToFeVZ = + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),MVZOS,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2) + AmpSqTreeFeToFeVZ(gt1, gt2)  
Else  
  AmpSum2FeToFeVZ = AmpTreeFeToFeVZ
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqTreeFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2)  
  AmpSum2FeToFeVZ = + 2._dp*AmpWaveFeToFeVZ + 2._dp*AmpVertexFeToFeVZ
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVZ,AmpSumFeToFeVZ(:,gt1, gt2),AmpSum2FeToFeVZ(:,gt1, gt2),AmpSqFeToFeVZ(gt1, gt2)) 
  AmpSqFeToFeVZ(gt1, gt2) = AmpSqFeToFeVZ(gt1, gt2) + AmpSqTreeFeToFeVZ(gt1, gt2)  
End if  
Else  
  AmpSqFeToFeVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVZ(gt1, gt2).le.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),MVZOS,helfactor*AmpSqFeToFeVZ(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVZ,helfactor*AmpSqFeToFeVZ(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZ(gt1, gt2) + MRGFeToFeVZ(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFeVZ(gt1, gt2) + MRGFeToFeVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FeToFvVWp(cplcFeFvVWpL,cplcFeFvVWpR,MFe,              & 
& MFv,MVWp,MFe2,MFv2,MVWp2,AmpTreeFeToFvVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_FeToFvVWp(ZcplcFeFvVWpL,ZcplcFeFvVWpR,MFe,            & 
& MFv,MVWp,MFe2,MFv2,MVWp2,AmpTreeFeToFvVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFvVWp(MLambda,em,gs,cplcFeFvVWpL,cplcFeFvVWpR,        & 
& MFeOS,MFvOS,MVWpOS,MRPFeToFvVWp,MRGFeToFvVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFvVWp(MLambda,em,gs,ZcplcFeFvVWpL,ZcplcFeFvVWpR,      & 
& MFeOS,MFvOS,MVWpOS,MRPFeToFvVWp,MRGFeToFvVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FeToFvVWp(MLambda,em,gs,cplcFeFvVWpL,cplcFeFvVWpR,        & 
& MFe,MFv,MVWp,MRPFeToFvVWp,MRGFeToFvVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFvVWp(MLambda,em,gs,ZcplcFeFvVWpL,ZcplcFeFvVWpR,      & 
& MFe,MFv,MVWp,MRPFeToFvVWp,MRGFeToFvVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FeToFvVWp(cplcFeFvVWpL,cplcFeFvVWpR,ctcplcFeFvVWpL,   & 
& ctcplcFeFvVWpR,MFe,MFe2,MFv,MFv2,MVWp,MVWp2,ZfEL,ZfER,ZfVL,ZfVWp,AmpWaveFeToFvVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FeToFvVWp(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,             & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,   & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,               & 
& cplcVWpVWpVZ,AmpVertexFeToFvVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cplFvFeHmL,               & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRdrFeToFvVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,      & 
& cpletIHmVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& ZcplcFeFvVWpL,ZcplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,         & 
& GosZcplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFeToFvVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cplFvFeHmL,               & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,ZcplcFeFvVWpL,               & 
& ZcplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,GZcplHmVPVWp,          & 
& cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFeToFvVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,      & 
& cpletIHmVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,           & 
& GcplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFeToFvVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cplFvFeHmL,               & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFeToFvVWp)

 End if 
 End if 
AmpVertexFeToFvVWp = AmpVertexFeToFvVWp -  AmpVertexIRdrFeToFvVWp! +  AmpVertexIRosFeToFvVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFvVWp=0._dp 
AmpVertexZFeToFvVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFvVWp(1,gt2,:) = AmpWaveZFeToFvVWp(1,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvVWp(1,gt1,:) 
AmpVertexZFeToFvVWp(1,gt2,:)= AmpVertexZFeToFvVWp(1,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvVWp(1,gt1,:) 
AmpWaveZFeToFvVWp(2,gt2,:) = AmpWaveZFeToFvVWp(2,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvVWp(2,gt1,:) 
AmpVertexZFeToFvVWp(2,gt2,:)= AmpVertexZFeToFvVWp(2,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvVWp(2,gt1,:) 
AmpWaveZFeToFvVWp(3,gt2,:) = AmpWaveZFeToFvVWp(3,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvVWp(3,gt1,:) 
AmpVertexZFeToFvVWp(3,gt2,:)= AmpVertexZFeToFvVWp(3,gt2,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvVWp(3,gt1,:) 
AmpWaveZFeToFvVWp(4,gt2,:) = AmpWaveZFeToFvVWp(4,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvVWp(4,gt1,:) 
AmpVertexZFeToFvVWp(4,gt2,:)= AmpVertexZFeToFvVWp(4,gt2,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFvVWp=AmpWaveZFeToFvVWp 
AmpVertexFeToFvVWp= AmpVertexZFeToFvVWp
! Final State 1 
AmpWaveZFeToFvVWp=0._dp 
AmpVertexZFeToFvVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFvVWp(1,:,gt2) = AmpWaveZFeToFvVWp(1,:,gt2)+ZRUVv(gt2,gt1)*AmpWaveFeToFvVWp(1,:,gt1) 
AmpVertexZFeToFvVWp(1,:,gt2)= AmpVertexZFeToFvVWp(1,:,gt2)+ZRUVv(gt2,gt1)*AmpVertexFeToFvVWp(1,:,gt1) 
AmpWaveZFeToFvVWp(2,:,gt2) = AmpWaveZFeToFvVWp(2,:,gt2)+ZRUVvc(gt2,gt1)*AmpWaveFeToFvVWp(2,:,gt1) 
AmpVertexZFeToFvVWp(2,:,gt2)= AmpVertexZFeToFvVWp(2,:,gt2)+ZRUVvc(gt2,gt1)*AmpVertexFeToFvVWp(2,:,gt1) 
AmpWaveZFeToFvVWp(3,:,gt2) = AmpWaveZFeToFvVWp(3,:,gt2)+ZRUVv(gt2,gt1)*AmpWaveFeToFvVWp(3,:,gt1) 
AmpVertexZFeToFvVWp(3,:,gt2)= AmpVertexZFeToFvVWp(3,:,gt2)+ZRUVv(gt2,gt1)*AmpVertexFeToFvVWp(3,:,gt1) 
AmpWaveZFeToFvVWp(4,:,gt2) = AmpWaveZFeToFvVWp(4,:,gt2)+ZRUVvc(gt2,gt1)*AmpWaveFeToFvVWp(4,:,gt1) 
AmpVertexZFeToFvVWp(4,:,gt2)= AmpVertexZFeToFvVWp(4,:,gt2)+ZRUVvc(gt2,gt1)*AmpVertexFeToFvVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFvVWp=AmpWaveZFeToFvVWp 
AmpVertexFeToFvVWp= AmpVertexZFeToFvVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFvVWp = AmpVertexFeToFvVWp  +  AmpVertexIRosFeToFvVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fv VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFvVWp = AmpTreeFeToFvVWp 
 AmpSum2FeToFvVWp = AmpTreeFeToFvVWp + 2._dp*AmpWaveFeToFvVWp + 2._dp*AmpVertexFeToFvVWp  
Else 
 AmpSumFeToFvVWp = AmpTreeFeToFvVWp + AmpWaveFeToFvVWp + AmpVertexFeToFvVWp
 AmpSum2FeToFvVWp = AmpTreeFeToFvVWp + AmpWaveFeToFvVWp + AmpVertexFeToFvVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFvVWp = AmpTreeFeToFvVWp
 AmpSum2FeToFvVWp = AmpTreeFeToFvVWp 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFeOS(gt1).gt.(MFvOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(MFe(gt1).gt.(MFv(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FeToFvVWp = AmpTreeFeToFvVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFvVWp(gt1, gt2) 
  AmpSum2FeToFvVWp = 2._dp*AmpWaveFeToFvVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFvVWp(gt1, gt2) 
  AmpSum2FeToFvVWp = 2._dp*AmpVertexFeToFvVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFvVWp(gt1, gt2) 
  AmpSum2FeToFvVWp = AmpTreeFeToFvVWp + 2._dp*AmpWaveFeToFvVWp + 2._dp*AmpVertexFeToFvVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFvVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFvVWp = AmpTreeFeToFvVWp
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
  AmpSqTreeFeToFvVWp(gt1, gt2) = AmpSqFeToFvVWp(gt1, gt2)  
  AmpSum2FeToFvVWp = + 2._dp*AmpWaveFeToFvVWp + 2._dp*AmpVertexFeToFvVWp
  Call SquareAmp_FtoFV(MFeOS(gt1),MFvOS(gt2),MVWpOS,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
  AmpSqFeToFvVWp(gt1, gt2) = AmpSqFeToFvVWp(gt1, gt2) + AmpSqTreeFeToFvVWp(gt1, gt2)  
Else  
  AmpSum2FeToFvVWp = AmpTreeFeToFvVWp
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
  AmpSqTreeFeToFvVWp(gt1, gt2) = AmpSqFeToFvVWp(gt1, gt2)  
  AmpSum2FeToFvVWp = + 2._dp*AmpWaveFeToFvVWp + 2._dp*AmpVertexFeToFvVWp
  Call SquareAmp_FtoFV(MFe(gt1),MFv(gt2),MVWp,AmpSumFeToFvVWp(:,gt1, gt2),AmpSum2FeToFvVWp(:,gt1, gt2),AmpSqFeToFvVWp(gt1, gt2)) 
  AmpSqFeToFvVWp(gt1, gt2) = AmpSqFeToFvVWp(gt1, gt2) + AmpSqTreeFeToFvVWp(gt1, gt2)  
End if  
Else  
  AmpSqFeToFvVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFvVWp(gt1, gt2).le.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFvOS(gt2),MVWpOS,helfactor*AmpSqFeToFvVWp(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFv(gt2),MVWp,helfactor*AmpSqFeToFvVWp(gt1, gt2))
End if 
If ((Abs(MRPFeToFvVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFvVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFvVWp(gt1, gt2) + MRGFeToFvVWp(gt1, gt2)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFvVWp(gt1, gt2) + MRGFeToFvVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Fv Conjg(Hm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FeToFvcHm(cplcFeFvcHmL,cplcFeFvcHmR,MFe,              & 
& MFv,MHm,MFe2,MFv2,MHm2,AmpTreeFeToFvcHm)

  Else 
Call Amplitude_Tree_radinuZeeHB_FeToFvcHm(ZcplcFeFvcHmL,ZcplcFeFvcHmR,MFe,            & 
& MFv,MHm,MFe2,MFv2,MHm2,AmpTreeFeToFvcHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFvcHm(MLambda,em,gs,cplcFeFvcHmL,cplcFeFvcHmR,        & 
& MFeOS,MFvOS,MHmOS,MRPFeToFvcHm,MRGFeToFvcHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFvcHm(MLambda,em,gs,ZcplcFeFvcHmL,ZcplcFeFvcHmR,      & 
& MFeOS,MFvOS,MHmOS,MRPFeToFvcHm,MRGFeToFvcHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FeToFvcHm(MLambda,em,gs,cplcFeFvcHmL,cplcFeFvcHmR,        & 
& MFe,MFv,MHm,MRPFeToFvcHm,MRGFeToFvcHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FeToFvcHm(MLambda,em,gs,ZcplcFeFvcHmL,ZcplcFeFvcHmR,      & 
& MFe,MFv,MHm,MRPFeToFvcHm,MRGFeToFvcHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FeToFvcHm(cplcFeFvcHmL,cplcFeFvcHmR,ctcplcFeFvcHmL,   & 
& ctcplcFeFvcHmR,MFe,MFe2,MFv,MFv2,MHm,MHm2,ZfEL,ZfER,ZfHm,ZfVL,AmpWaveFeToFvcHm)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FeToFvcHm(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,             & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,cpletIcHmcVWp,           & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,    & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,             & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexFeToFvcHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRdrFeToFvcHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,      & 
& cplcFeFeetIR,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,             & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,ZcplcFeFvcHmL,             & 
& ZcplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,              & 
& cplcHmcVWpVZ,AmpVertexIRosFeToFvcHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,ZcplcFeFvcHmL,ZcplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,         & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosFeToFvcHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,      & 
& cplcFeFeetIR,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,             & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexIRosFeToFvcHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosFeToFvcHm)

 End if 
 End if 
AmpVertexFeToFvcHm = AmpVertexFeToFvcHm -  AmpVertexIRdrFeToFvcHm! +  AmpVertexIRosFeToFvcHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFeToFvcHm=0._dp 
AmpVertexZFeToFvcHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFvcHm(1,gt2,:,:) = AmpWaveZFeToFvcHm(1,gt2,:,:)+ZRUUe(gt2,gt1)*AmpWaveFeToFvcHm(1,gt1,:,:) 
AmpVertexZFeToFvcHm(1,gt2,:,:)= AmpVertexZFeToFvcHm(1,gt2,:,:) + ZRUUe(gt2,gt1)*AmpVertexFeToFvcHm(1,gt1,:,:) 
AmpWaveZFeToFvcHm(2,gt2,:,:) = AmpWaveZFeToFvcHm(2,gt2,:,:)+ZRUVec(gt2,gt1)*AmpWaveFeToFvcHm(2,gt1,:,:) 
AmpVertexZFeToFvcHm(2,gt2,:,:)= AmpVertexZFeToFvcHm(2,gt2,:,:) + ZRUVec(gt2,gt1)*AmpVertexFeToFvcHm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFeToFvcHm=AmpWaveZFeToFvcHm 
AmpVertexFeToFvcHm= AmpVertexZFeToFvcHm
! Final State 1 
AmpWaveZFeToFvcHm=0._dp 
AmpVertexZFeToFvcHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFvcHm(1,:,gt2,:) = AmpWaveZFeToFvcHm(1,:,gt2,:)+ZRUVv(gt2,gt1)*AmpWaveFeToFvcHm(1,:,gt1,:) 
AmpVertexZFeToFvcHm(1,:,gt2,:)= AmpVertexZFeToFvcHm(1,:,gt2,:)+ZRUVv(gt2,gt1)*AmpVertexFeToFvcHm(1,:,gt1,:) 
AmpWaveZFeToFvcHm(2,:,gt2,:) = AmpWaveZFeToFvcHm(2,:,gt2,:)+ZRUVvc(gt2,gt1)*AmpWaveFeToFvcHm(2,:,gt1,:) 
AmpVertexZFeToFvcHm(2,:,gt2,:)= AmpVertexZFeToFvcHm(2,:,gt2,:)+ZRUVvc(gt2,gt1)*AmpVertexFeToFvcHm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFeToFvcHm=AmpWaveZFeToFvcHm 
AmpVertexFeToFvcHm= AmpVertexZFeToFvcHm
! Final State 2 
AmpWaveZFeToFvcHm=0._dp 
AmpVertexZFeToFvcHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFeToFvcHm(:,:,:,gt2) = AmpWaveZFeToFvcHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveFeToFvcHm(:,:,:,gt1) 
AmpVertexZFeToFvcHm(:,:,:,gt2)= AmpVertexZFeToFvcHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexFeToFvcHm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFeToFvcHm=AmpWaveZFeToFvcHm 
AmpVertexFeToFvcHm= AmpVertexZFeToFvcHm
End if
If (ShiftIRdiv) Then 
AmpVertexFeToFvcHm = AmpVertexFeToFvcHm  +  AmpVertexIRosFeToFvcHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fv conj[Hm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFeToFvcHm = AmpTreeFeToFvcHm 
 AmpSum2FeToFvcHm = AmpTreeFeToFvcHm + 2._dp*AmpWaveFeToFvcHm + 2._dp*AmpVertexFeToFvcHm  
Else 
 AmpSumFeToFvcHm = AmpTreeFeToFvcHm + AmpWaveFeToFvcHm + AmpVertexFeToFvcHm
 AmpSum2FeToFvcHm = AmpTreeFeToFvcHm + AmpWaveFeToFvcHm + AmpVertexFeToFvcHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFvcHm = AmpTreeFeToFvcHm
 AmpSum2FeToFvcHm = AmpTreeFeToFvcHm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=2,3
If (((OSkinematics).and.(MFeOS(gt1).gt.(MFvOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(MFe(gt1).gt.(MFv(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FeToFvcHm = AmpTreeFeToFvcHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFv(gt2),MHm(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFeToFvcHm(gt1, gt2, gt3) 
  AmpSum2FeToFvcHm = 2._dp*AmpWaveFeToFvcHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFv(gt2),MHm(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFeToFvcHm(gt1, gt2, gt3) 
  AmpSum2FeToFvcHm = 2._dp*AmpVertexFeToFvcHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFv(gt2),MHm(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFeToFvcHm(gt1, gt2, gt3) 
  AmpSum2FeToFvcHm = AmpTreeFeToFvcHm + 2._dp*AmpWaveFeToFvcHm + 2._dp*AmpVertexFeToFvcHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFe(gt1),MFv(gt2),MHm(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFeToFvcHm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FeToFvcHm = AmpTreeFeToFvcHm
  Call SquareAmp_FtoFS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
  AmpSqTreeFeToFvcHm(gt1, gt2, gt3) = AmpSqFeToFvcHm(gt1, gt2, gt3)  
  AmpSum2FeToFvcHm = + 2._dp*AmpWaveFeToFvcHm + 2._dp*AmpVertexFeToFvcHm
  Call SquareAmp_FtoFS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
  AmpSqFeToFvcHm(gt1, gt2, gt3) = AmpSqFeToFvcHm(gt1, gt2, gt3) + AmpSqTreeFeToFvcHm(gt1, gt2, gt3)  
Else  
  AmpSum2FeToFvcHm = AmpTreeFeToFvcHm
  Call SquareAmp_FtoFS(MFe(gt1),MFv(gt2),MHm(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
  AmpSqTreeFeToFvcHm(gt1, gt2, gt3) = AmpSqFeToFvcHm(gt1, gt2, gt3)  
  AmpSum2FeToFvcHm = + 2._dp*AmpWaveFeToFvcHm + 2._dp*AmpVertexFeToFvcHm
  Call SquareAmp_FtoFS(MFe(gt1),MFv(gt2),MHm(gt3),AmpSumFeToFvcHm(:,gt1, gt2, gt3),AmpSum2FeToFvcHm(:,gt1, gt2, gt3),AmpSqFeToFvcHm(gt1, gt2, gt3)) 
  AmpSqFeToFvcHm(gt1, gt2, gt3) = AmpSqFeToFvcHm(gt1, gt2, gt3) + AmpSqTreeFeToFvcHm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFeToFvcHm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFvcHm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFvOS(gt2),MHmOS(gt3),helfactor*AmpSqFeToFvcHm(gt1, gt2, gt3))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFv(gt2),MHm(gt3),helfactor*AmpSqFeToFvcHm(gt1, gt2, gt3))
End if 
If ((Abs(MRPFeToFvcHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvcHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFeToFvcHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFeToFvcHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFeToFvcHm(gt1, gt2, gt3) + MRGFeToFvcHm(gt1, gt2, gt3)) 
  gP1LFe(gt1,i4) = gP1LFe(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFeToFvcHm(gt1, gt2, gt3) + MRGFeToFvcHm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFe(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
End If 
!---------------- 
! Fe VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_FeToFeVP(ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,      & 
& ZcplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFeOS,            & 
& MFe2OS,MVP,MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,AmpWaveFeToFeVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFeOS,             & 
& MFe2OS,MVP,MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,AmpWaveFeToFeVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FeToFeVP(MAhOS,MetIOS,MFeOS,MFvOS,MhhOS,            & 
& MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,        & 
& MVZ2OS,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplFvFeHmL,              & 
& ZcplFvFeHmR,ZcplFvFecVWpL,ZcplFvFecVWpR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,        & 
& ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcFeFvcHmL,      & 
& ZcplcFeFvcHmR,ZcplHmVPVWp,ZcplHmcHmVP,ZcplcVWpVPVWp,ZcplcHmcVWpVP,AmpVertexFeToFeVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FeToFeVP(MAhOS,MetIOS,MFeOS,MFvOS,MhhOS,            & 
& MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,        & 
& MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,cplFvFeHmR,        & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,AmpVertexFeToFeVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,         & 
& cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,MFe,               & 
& MFe2,MVP,MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,AmpWaveFeToFeVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FeToFeVP(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,              & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVPVWp,cplHmcHmVP,             & 
& cplcVWpVPVWp,cplcHmcVWpVP,AmpVertexFeToFeVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fe->Fe VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFeToFeVP = 0._dp 
 AmpSum2FeToFeVP = 0._dp  
Else 
 AmpSumFeToFeVP = AmpVertexFeToFeVP + AmpWaveFeToFeVP
 AmpSum2FeToFeVP = AmpVertexFeToFeVP + AmpWaveFeToFeVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFeOS(gt1).gt.(MFeOS(gt2)+0.))).or.((.not.OSkinematics).and.(MFe(gt1).gt.(MFe(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFeOS(gt1),MFeOS(gt2),0._dp,AmpSumFeToFeVP(:,gt1, gt2),AmpSum2FeToFeVP(:,gt1, gt2),AmpSqFeToFeVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFe(gt1),MFe(gt2),MVP,AmpSumFeToFeVP(:,gt1, gt2),AmpSum2FeToFeVP(:,gt1, gt2),AmpSqFeToFeVP(gt1, gt2)) 
End if  
Else  
  AmpSqFeToFeVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFeToFeVP(gt1, gt2).le.0._dp) Then 
  gP1LFe(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFeOS(gt1),MFeOS(gt2),0._dp,helfactor*AmpSqFeToFeVP(gt1, gt2))
Else 
  gP1LFe(gt1,i4) = 1._dp*GammaTPS(MFe(gt1),MFe(gt2),MVP,helfactor*AmpSqFeToFeVP(gt1, gt2))
End if 
If ((Abs(MRPFeToFeVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFeToFeVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFe(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_Fe

End Module Wrapper_OneLoopDecay_Fe_radinuZeeHB
