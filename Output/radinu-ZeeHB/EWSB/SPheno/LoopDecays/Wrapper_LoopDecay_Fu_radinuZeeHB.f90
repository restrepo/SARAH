! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fu_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_Fu_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fu(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,              & 
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
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,              & 
& cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,        & 
& cplcFuFdHmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,         & 
& cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhcHmcVWp,   & 
& cplhhcVWpVWp,cplhhhhhh,cplhhHmcHm,cplhhHmVWp,cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,          & 
& cplHmVPVWp,cplHmVWpVZ,cplVGVGVG,ctcplcFuFdcVWpL,ctcplcFuFdcVWpR,ctcplcFuFdHmL,         & 
& ctcplcFuFdHmR,ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplcFuFuetIL,ctcplcFuFuetIR,               & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFuFuVZL,ctcplcFuFuVZR,GcplHmVPVWp,GosZcplHmVPVWp,GZcplHmVPVWp,ZcplcFdFdVGL,      & 
& ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFucHmL,ZcplcFdFucHmR,ZcplcFdFuVWpL,      & 
& ZcplcFdFuVWpR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFuFuAhL,    & 
& ZcplcFuFuAhR,ZcplcFuFuetIL,ZcplcFuFuetIR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,       & 
& ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcHmcVWpVP,        & 
& ZcplcVWpVPVWp,ZcplHmcHmVP,ZcplHmVPVWp,ZcplVGVGVG,ZRUZH,ZRUZP,ZRUVv,ZRUVd,              & 
& ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFu)

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
& cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVWp(3),cplcFdFdAhL(3,3),            & 
& cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),               & 
& cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),             & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),               & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVWpVZ,            & 
& cpletIcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),            & 
& cpletIHmcHm(3,3),cpletIHmVWp(3),cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplhhhhhh(2,2,2),    & 
& cplhhHmcHm(2,3,3),cplhhHmVWp(2,3),cplhhVZVZ(2),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),        & 
& cplHmVPVWp(3),cplHmVWpVZ(3),cplVGVGVG,ctcplcFuFdcVWpL(3,3),ctcplcFuFdcVWpR(3,3),       & 
& ctcplcFuFdHmL(3,3,3),ctcplcFuFdHmR(3,3,3),ctcplcFuFuAhL(3,3),ctcplcFuFuAhR(3,3),       & 
& ctcplcFuFuetIL(3,3),ctcplcFuFuetIR(3,3),ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2),     & 
& ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),           & 
& ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3),GcplHmVPVWp(3),GosZcplHmVPVWp(3),GZcplHmVPVWp(3),& 
& ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),               & 
& ZcplcFdFucHmL(3,3,3),ZcplcFdFucHmR(3,3,3),ZcplcFdFuVWpL(3,3),ZcplcFdFuVWpR(3,3),       & 
& ZcplcFuFdcVWpL(3,3),ZcplcFuFdcVWpR(3,3),ZcplcFuFdHmL(3,3,3),ZcplcFuFdHmR(3,3,3),       & 
& ZcplcFuFuAhL(3,3),ZcplcFuFuAhR(3,3),ZcplcFuFuetIL(3,3),ZcplcFuFuetIR(3,3),             & 
& ZcplcFuFuhhL(3,3,2),ZcplcFuFuhhR(3,3,2),ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),           & 
& ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),               & 
& ZcplcHmcVWpVP(3),ZcplcVWpVPVWp,ZcplHmcHmVP(3,3),ZcplHmVPVWp(3),ZcplVGVGVG

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
Real(dp), Intent(out) :: gP1LFu(3,27) 
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
Real(dp) :: MRPFuToFuetI(3,3),MRGFuToFuetI(3,3), MRPZFuToFuetI(3,3),MRGZFuToFuetI(3,3) 
Real(dp) :: MVPFuToFuetI(3,3) 
Real(dp) :: RMsqTreeFuToFuetI(3,3),RMsqWaveFuToFuetI(3,3),RMsqVertexFuToFuetI(3,3) 
Complex(dp) :: AmpTreeFuToFuetI(2,3,3),AmpWaveFuToFuetI(2,3,3)=(0._dp,0._dp),AmpVertexFuToFuetI(2,3,3)& 
 & ,AmpVertexIRosFuToFuetI(2,3,3),AmpVertexIRdrFuToFuetI(2,3,3), AmpSumFuToFuetI(2,3,3), AmpSum2FuToFuetI(2,3,3) 
Complex(dp) :: AmpTreeZFuToFuetI(2,3,3),AmpWaveZFuToFuetI(2,3,3),AmpVertexZFuToFuetI(2,3,3) 
Real(dp) :: AmpSqFuToFuetI(3,3),  AmpSqTreeFuToFuetI(3,3) 
Real(dp) :: MRPFuToFdHm(3,3,3),MRGFuToFdHm(3,3,3), MRPZFuToFdHm(3,3,3),MRGZFuToFdHm(3,3,3) 
Real(dp) :: MVPFuToFdHm(3,3,3) 
Real(dp) :: RMsqTreeFuToFdHm(3,3,3),RMsqWaveFuToFdHm(3,3,3),RMsqVertexFuToFdHm(3,3,3) 
Complex(dp) :: AmpTreeFuToFdHm(2,3,3,3),AmpWaveFuToFdHm(2,3,3,3)=(0._dp,0._dp),AmpVertexFuToFdHm(2,3,3,3)& 
 & ,AmpVertexIRosFuToFdHm(2,3,3,3),AmpVertexIRdrFuToFdHm(2,3,3,3), AmpSumFuToFdHm(2,3,3,3), AmpSum2FuToFdHm(2,3,3,3) 
Complex(dp) :: AmpTreeZFuToFdHm(2,3,3,3),AmpWaveZFuToFdHm(2,3,3,3),AmpVertexZFuToFdHm(2,3,3,3) 
Real(dp) :: AmpSqFuToFdHm(3,3,3),  AmpSqTreeFuToFdHm(3,3,3) 
Real(dp) :: MRPFuToFdcVWp(3,3),MRGFuToFdcVWp(3,3), MRPZFuToFdcVWp(3,3),MRGZFuToFdcVWp(3,3) 
Real(dp) :: MVPFuToFdcVWp(3,3) 
Real(dp) :: RMsqTreeFuToFdcVWp(3,3),RMsqWaveFuToFdcVWp(3,3),RMsqVertexFuToFdcVWp(3,3) 
Complex(dp) :: AmpTreeFuToFdcVWp(4,3,3),AmpWaveFuToFdcVWp(4,3,3)=(0._dp,0._dp),AmpVertexFuToFdcVWp(4,3,3)& 
 & ,AmpVertexIRosFuToFdcVWp(4,3,3),AmpVertexIRdrFuToFdcVWp(4,3,3), AmpSumFuToFdcVWp(4,3,3), AmpSum2FuToFdcVWp(4,3,3) 
Complex(dp) :: AmpTreeZFuToFdcVWp(4,3,3),AmpWaveZFuToFdcVWp(4,3,3),AmpVertexZFuToFdcVWp(4,3,3) 
Real(dp) :: AmpSqFuToFdcVWp(3,3),  AmpSqTreeFuToFdcVWp(3,3) 
Real(dp) :: MRPFuToFuhh(3,3,2),MRGFuToFuhh(3,3,2), MRPZFuToFuhh(3,3,2),MRGZFuToFuhh(3,3,2) 
Real(dp) :: MVPFuToFuhh(3,3,2) 
Real(dp) :: RMsqTreeFuToFuhh(3,3,2),RMsqWaveFuToFuhh(3,3,2),RMsqVertexFuToFuhh(3,3,2) 
Complex(dp) :: AmpTreeFuToFuhh(2,3,3,2),AmpWaveFuToFuhh(2,3,3,2)=(0._dp,0._dp),AmpVertexFuToFuhh(2,3,3,2)& 
 & ,AmpVertexIRosFuToFuhh(2,3,3,2),AmpVertexIRdrFuToFuhh(2,3,3,2), AmpSumFuToFuhh(2,3,3,2), AmpSum2FuToFuhh(2,3,3,2) 
Complex(dp) :: AmpTreeZFuToFuhh(2,3,3,2),AmpWaveZFuToFuhh(2,3,3,2),AmpVertexZFuToFuhh(2,3,3,2) 
Real(dp) :: AmpSqFuToFuhh(3,3,2),  AmpSqTreeFuToFuhh(3,3,2) 
Real(dp) :: MRPFuToFuVZ(3,3),MRGFuToFuVZ(3,3), MRPZFuToFuVZ(3,3),MRGZFuToFuVZ(3,3) 
Real(dp) :: MVPFuToFuVZ(3,3) 
Real(dp) :: RMsqTreeFuToFuVZ(3,3),RMsqWaveFuToFuVZ(3,3),RMsqVertexFuToFuVZ(3,3) 
Complex(dp) :: AmpTreeFuToFuVZ(4,3,3),AmpWaveFuToFuVZ(4,3,3)=(0._dp,0._dp),AmpVertexFuToFuVZ(4,3,3)& 
 & ,AmpVertexIRosFuToFuVZ(4,3,3),AmpVertexIRdrFuToFuVZ(4,3,3), AmpSumFuToFuVZ(4,3,3), AmpSum2FuToFuVZ(4,3,3) 
Complex(dp) :: AmpTreeZFuToFuVZ(4,3,3),AmpWaveZFuToFuVZ(4,3,3),AmpVertexZFuToFuVZ(4,3,3) 
Real(dp) :: AmpSqFuToFuVZ(3,3),  AmpSqTreeFuToFuVZ(3,3) 
Real(dp) :: MRPFuToFuVG(3,3),MRGFuToFuVG(3,3), MRPZFuToFuVG(3,3),MRGZFuToFuVG(3,3) 
Real(dp) :: MVPFuToFuVG(3,3) 
Real(dp) :: RMsqTreeFuToFuVG(3,3),RMsqWaveFuToFuVG(3,3),RMsqVertexFuToFuVG(3,3) 
Complex(dp) :: AmpTreeFuToFuVG(4,3,3),AmpWaveFuToFuVG(4,3,3)=(0._dp,0._dp),AmpVertexFuToFuVG(4,3,3)& 
 & ,AmpVertexIRosFuToFuVG(4,3,3),AmpVertexIRdrFuToFuVG(4,3,3), AmpSumFuToFuVG(4,3,3), AmpSum2FuToFuVG(4,3,3) 
Complex(dp) :: AmpTreeZFuToFuVG(4,3,3),AmpWaveZFuToFuVG(4,3,3),AmpVertexZFuToFuVG(4,3,3) 
Real(dp) :: AmpSqFuToFuVG(3,3),  AmpSqTreeFuToFuVG(3,3) 
Real(dp) :: MRPFuToFuVP(3,3),MRGFuToFuVP(3,3), MRPZFuToFuVP(3,3),MRGZFuToFuVP(3,3) 
Real(dp) :: MVPFuToFuVP(3,3) 
Real(dp) :: RMsqTreeFuToFuVP(3,3),RMsqWaveFuToFuVP(3,3),RMsqVertexFuToFuVP(3,3) 
Complex(dp) :: AmpTreeFuToFuVP(4,3,3),AmpWaveFuToFuVP(4,3,3)=(0._dp,0._dp),AmpVertexFuToFuVP(4,3,3)& 
 & ,AmpVertexIRosFuToFuVP(4,3,3),AmpVertexIRdrFuToFuVP(4,3,3), AmpSumFuToFuVP(4,3,3), AmpSum2FuToFuVP(4,3,3) 
Complex(dp) :: AmpTreeZFuToFuVP(4,3,3),AmpWaveZFuToFuVP(4,3,3),AmpVertexZFuToFuVP(4,3,3) 
Real(dp) :: AmpSqFuToFuVP(3,3),  AmpSqTreeFuToFuVP(3,3) 
Write(*,*) "Calculating one-loop decays of Fu " 
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
! Fu etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FuToFuetI(cplcFuFuetIL,cplcFuFuetIR,MetI,             & 
& MFu,MetI2,MFu2,AmpTreeFuToFuetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_FuToFuetI(ZcplcFuFuetIL,ZcplcFuFuetIR,MetI,           & 
& MFu,MetI2,MFu2,AmpTreeFuToFuetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuetI(MLambda,em,gs,cplcFuFuetIL,cplcFuFuetIR,        & 
& MetIOS,MFuOS,MRPFuToFuetI,MRGFuToFuetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuetI(MLambda,em,gs,ZcplcFuFuetIL,ZcplcFuFuetIR,      & 
& MetIOS,MFuOS,MRPFuToFuetI,MRGFuToFuetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FuToFuetI(MLambda,em,gs,cplcFuFuetIL,cplcFuFuetIR,        & 
& MetI,MFu,MRPFuToFuetI,MRGFuToFuetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuetI(MLambda,em,gs,ZcplcFuFuetIL,ZcplcFuFuetIR,      & 
& MetI,MFu,MRPFuToFuetI,MRGFuToFuetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFuetI(cplcFuFuetIL,cplcFuFuetIR,ctcplcFuFuetIL,   & 
& ctcplcFuFuetIR,MetI,MetI2,MFu,MFu2,ZfetI,ZfUL,ZfUR,AmpWaveFuToFuetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuetI(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,           & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexFuToFuetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexIRdrFuToFuetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,    & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,        & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,               & 
& cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosFuToFuetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexIRosFuToFuetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,    & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,          & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,               & 
& cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosFuToFuetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexIRosFuToFuetI)

 End if 
 End if 
AmpVertexFuToFuetI = AmpVertexFuToFuetI -  AmpVertexIRdrFuToFuetI! +  AmpVertexIRosFuToFuetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFuetI=0._dp 
AmpVertexZFuToFuetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFuetI(1,gt2,:) = AmpWaveZFuToFuetI(1,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuetI(1,gt1,:) 
AmpVertexZFuToFuetI(1,gt2,:)= AmpVertexZFuToFuetI(1,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuetI(1,gt1,:) 
AmpWaveZFuToFuetI(2,gt2,:) = AmpWaveZFuToFuetI(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuetI(2,gt1,:) 
AmpVertexZFuToFuetI(2,gt2,:)= AmpVertexZFuToFuetI(2,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuetI(2,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFuetI=AmpWaveZFuToFuetI 
AmpVertexFuToFuetI= AmpVertexZFuToFuetI
! Final State 1 
AmpWaveZFuToFuetI=0._dp 
AmpVertexZFuToFuetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFuetI(1,:,gt2) = AmpWaveZFuToFuetI(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuetI(1,:,gt1) 
AmpVertexZFuToFuetI(1,:,gt2)= AmpVertexZFuToFuetI(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuetI(1,:,gt1) 
AmpWaveZFuToFuetI(2,:,gt2) = AmpWaveZFuToFuetI(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuetI(2,:,gt1) 
AmpVertexZFuToFuetI(2,:,gt2)= AmpVertexZFuToFuetI(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuetI(2,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFuetI=AmpWaveZFuToFuetI 
AmpVertexFuToFuetI= AmpVertexZFuToFuetI
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFuetI = AmpVertexFuToFuetI  +  AmpVertexIRosFuToFuetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFuetI = AmpTreeFuToFuetI 
 AmpSum2FuToFuetI = AmpTreeFuToFuetI + 2._dp*AmpWaveFuToFuetI + 2._dp*AmpVertexFuToFuetI  
Else 
 AmpSumFuToFuetI = AmpTreeFuToFuetI + AmpWaveFuToFuetI + AmpVertexFuToFuetI
 AmpSum2FuToFuetI = AmpTreeFuToFuetI + AmpWaveFuToFuetI + AmpVertexFuToFuetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuetI = AmpTreeFuToFuetI
 AmpSum2FuToFuetI = AmpTreeFuToFuetI 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFuOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFu(gt2)+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FuToFuetI = AmpTreeFuToFuetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MetIOS,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),MetI,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFuetI(gt1, gt2) 
  AmpSum2FuToFuetI = 2._dp*AmpWaveFuToFuetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MetIOS,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),MetI,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFuetI(gt1, gt2) 
  AmpSum2FuToFuetI = 2._dp*AmpVertexFuToFuetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MetIOS,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),MetI,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFuetI(gt1, gt2) 
  AmpSum2FuToFuetI = AmpTreeFuToFuetI + 2._dp*AmpWaveFuToFuetI + 2._dp*AmpVertexFuToFuetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MetIOS,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),MetI,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFuetI(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFuetI = AmpTreeFuToFuetI
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MetIOS,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
  AmpSqTreeFuToFuetI(gt1, gt2) = AmpSqFuToFuetI(gt1, gt2)  
  AmpSum2FuToFuetI = + 2._dp*AmpWaveFuToFuetI + 2._dp*AmpVertexFuToFuetI
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MetIOS,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
  AmpSqFuToFuetI(gt1, gt2) = AmpSqFuToFuetI(gt1, gt2) + AmpSqTreeFuToFuetI(gt1, gt2)  
Else  
  AmpSum2FuToFuetI = AmpTreeFuToFuetI
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),MetI,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
  AmpSqTreeFuToFuetI(gt1, gt2) = AmpSqFuToFuetI(gt1, gt2)  
  AmpSum2FuToFuetI = + 2._dp*AmpWaveFuToFuetI + 2._dp*AmpVertexFuToFuetI
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),MetI,AmpSumFuToFuetI(:,gt1, gt2),AmpSum2FuToFuetI(:,gt1, gt2),AmpSqFuToFuetI(gt1, gt2)) 
  AmpSqFuToFuetI(gt1, gt2) = AmpSqFuToFuetI(gt1, gt2) + AmpSqTreeFuToFuetI(gt1, gt2)  
End if  
Else  
  AmpSqFuToFuetI(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuetI(gt1, gt2).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),MetIOS,helfactor*AmpSqFuToFuetI(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),MetI,helfactor*AmpSqFuToFuetI(gt1, gt2))
End if 
If ((Abs(MRPFuToFuetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFuetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFuetI(gt1, gt2) + MRGFuToFuetI(gt1, gt2)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFuetI(gt1, gt2) + MRGFuToFuetI(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fd Hm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FuToFdHm(cplcFuFdHmL,cplcFuFdHmR,MFd,MFu,             & 
& MHm,MFd2,MFu2,MHm2,AmpTreeFuToFdHm)

  Else 
Call Amplitude_Tree_radinuZeeHB_FuToFdHm(ZcplcFuFdHmL,ZcplcFuFdHmR,MFd,               & 
& MFu,MHm,MFd2,MFu2,MHm2,AmpTreeFuToFdHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFdHm(MLambda,em,gs,cplcFuFdHmL,cplcFuFdHmR,           & 
& MFdOS,MFuOS,MHmOS,MRPFuToFdHm,MRGFuToFdHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFdHm(MLambda,em,gs,ZcplcFuFdHmL,ZcplcFuFdHmR,         & 
& MFdOS,MFuOS,MHmOS,MRPFuToFdHm,MRGFuToFdHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FuToFdHm(MLambda,em,gs,cplcFuFdHmL,cplcFuFdHmR,           & 
& MFd,MFu,MHm,MRPFuToFdHm,MRGFuToFdHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFdHm(MLambda,em,gs,ZcplcFuFdHmL,ZcplcFuFdHmR,         & 
& MFd,MFu,MHm,MRPFuToFdHm,MRGFuToFdHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFdHm(cplcFuFdHmL,cplcFuFdHmR,ctcplcFuFdHmL,       & 
& ctcplcFuFdHmR,MFd,MFd2,MFu,MFu2,MHm,MHm2,ZfDL,ZfDR,ZfHm,ZfUL,ZfUR,AmpWaveFuToFdHm)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFdHm(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexFuToFdHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRdrFuToFdHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,             & 
& cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,ZcplcFuFdHmL,ZcplcFuFdHmR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,      & 
& cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRosFuToFdHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,             & 
& ZcplcFuFdHmL,ZcplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRosFuToFdHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,             & 
& cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,      & 
& cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRosFuToFdHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRosFuToFdHm)

 End if 
 End if 
AmpVertexFuToFdHm = AmpVertexFuToFdHm -  AmpVertexIRdrFuToFdHm! +  AmpVertexIRosFuToFdHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFdHm=0._dp 
AmpVertexZFuToFdHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFdHm(1,gt2,:,:) = AmpWaveZFuToFdHm(1,gt2,:,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFdHm(1,gt1,:,:) 
AmpVertexZFuToFdHm(1,gt2,:,:)= AmpVertexZFuToFdHm(1,gt2,:,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFdHm(1,gt1,:,:) 
AmpWaveZFuToFdHm(2,gt2,:,:) = AmpWaveZFuToFdHm(2,gt2,:,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFdHm(2,gt1,:,:) 
AmpVertexZFuToFdHm(2,gt2,:,:)= AmpVertexZFuToFdHm(2,gt2,:,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFdHm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFuToFdHm=AmpWaveZFuToFdHm 
AmpVertexFuToFdHm= AmpVertexZFuToFdHm
! Final State 1 
AmpWaveZFuToFdHm=0._dp 
AmpVertexZFuToFdHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFdHm(1,:,gt2,:) = AmpWaveZFuToFdHm(1,:,gt2,:)+ZRUVd(gt2,gt1)*AmpWaveFuToFdHm(1,:,gt1,:) 
AmpVertexZFuToFdHm(1,:,gt2,:)= AmpVertexZFuToFdHm(1,:,gt2,:)+ZRUVd(gt2,gt1)*AmpVertexFuToFdHm(1,:,gt1,:) 
AmpWaveZFuToFdHm(2,:,gt2,:) = AmpWaveZFuToFdHm(2,:,gt2,:)+ZRUUdc(gt2,gt1)*AmpWaveFuToFdHm(2,:,gt1,:) 
AmpVertexZFuToFdHm(2,:,gt2,:)= AmpVertexZFuToFdHm(2,:,gt2,:)+ZRUUdc(gt2,gt1)*AmpVertexFuToFdHm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFdHm=AmpWaveZFuToFdHm 
AmpVertexFuToFdHm= AmpVertexZFuToFdHm
! Final State 2 
AmpWaveZFuToFdHm=0._dp 
AmpVertexZFuToFdHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFdHm(:,:,:,gt2) = AmpWaveZFuToFdHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveFuToFdHm(:,:,:,gt1) 
AmpVertexZFuToFdHm(:,:,:,gt2)= AmpVertexZFuToFdHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexFuToFdHm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFdHm=AmpWaveZFuToFdHm 
AmpVertexFuToFdHm= AmpVertexZFuToFdHm
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFdHm = AmpVertexFuToFdHm  +  AmpVertexIRosFuToFdHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fd Hm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFdHm = AmpTreeFuToFdHm 
 AmpSum2FuToFdHm = AmpTreeFuToFdHm + 2._dp*AmpWaveFuToFdHm + 2._dp*AmpVertexFuToFdHm  
Else 
 AmpSumFuToFdHm = AmpTreeFuToFdHm + AmpWaveFuToFdHm + AmpVertexFuToFdHm
 AmpSum2FuToFdHm = AmpTreeFuToFdHm + AmpWaveFuToFdHm + AmpVertexFuToFdHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFdHm = AmpTreeFuToFdHm
 AmpSum2FuToFdHm = AmpTreeFuToFdHm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=2,3
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFdOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFd(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FuToFdHm = AmpTreeFuToFdHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFd(gt2),MHm(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFdHm(gt1, gt2, gt3) 
  AmpSum2FuToFdHm = 2._dp*AmpWaveFuToFdHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFd(gt2),MHm(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFdHm(gt1, gt2, gt3) 
  AmpSum2FuToFdHm = 2._dp*AmpVertexFuToFdHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFd(gt2),MHm(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFdHm(gt1, gt2, gt3) 
  AmpSum2FuToFdHm = AmpTreeFuToFdHm + 2._dp*AmpWaveFuToFdHm + 2._dp*AmpVertexFuToFdHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFd(gt2),MHm(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFdHm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFdHm = AmpTreeFuToFdHm
  Call SquareAmp_FtoFS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
  AmpSqTreeFuToFdHm(gt1, gt2, gt3) = AmpSqFuToFdHm(gt1, gt2, gt3)  
  AmpSum2FuToFdHm = + 2._dp*AmpWaveFuToFdHm + 2._dp*AmpVertexFuToFdHm
  Call SquareAmp_FtoFS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
  AmpSqFuToFdHm(gt1, gt2, gt3) = AmpSqFuToFdHm(gt1, gt2, gt3) + AmpSqTreeFuToFdHm(gt1, gt2, gt3)  
Else  
  AmpSum2FuToFdHm = AmpTreeFuToFdHm
  Call SquareAmp_FtoFS(MFu(gt1),MFd(gt2),MHm(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
  AmpSqTreeFuToFdHm(gt1, gt2, gt3) = AmpSqFuToFdHm(gt1, gt2, gt3)  
  AmpSum2FuToFdHm = + 2._dp*AmpWaveFuToFdHm + 2._dp*AmpVertexFuToFdHm
  Call SquareAmp_FtoFS(MFu(gt1),MFd(gt2),MHm(gt3),AmpSumFuToFdHm(:,gt1, gt2, gt3),AmpSum2FuToFdHm(:,gt1, gt2, gt3),AmpSqFuToFdHm(gt1, gt2, gt3)) 
  AmpSqFuToFdHm(gt1, gt2, gt3) = AmpSqFuToFdHm(gt1, gt2, gt3) + AmpSqTreeFuToFdHm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFuToFdHm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFdHm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFdOS(gt2),MHmOS(gt3),helfactor*AmpSqFuToFdHm(gt1, gt2, gt3))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFd(gt2),MHm(gt3),helfactor*AmpSqFuToFdHm(gt1, gt2, gt3))
End if 
If ((Abs(MRPFuToFdHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFuToFdHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFdHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFuToFdHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFdHm(gt1, gt2, gt3) + MRGFuToFdHm(gt1, gt2, gt3)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFdHm(gt1, gt2, gt3) + MRGFuToFdHm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fd Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FuToFdcVWp(cplcFuFdcVWpL,cplcFuFdcVWpR,               & 
& MFd,MFu,MVWp,MFd2,MFu2,MVWp2,AmpTreeFuToFdcVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_FuToFdcVWp(ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,             & 
& MFd,MFu,MVWp,MFd2,MFu2,MVWp2,AmpTreeFuToFdcVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFdcVWp(MLambda,em,gs,cplcFuFdcVWpL,cplcFuFdcVWpR,     & 
& MFdOS,MFuOS,MVWpOS,MRPFuToFdcVWp,MRGFuToFdcVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFdcVWp(MLambda,em,gs,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,   & 
& MFdOS,MFuOS,MVWpOS,MRPFuToFdcVWp,MRGFuToFdcVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FuToFdcVWp(MLambda,em,gs,cplcFuFdcVWpL,cplcFuFdcVWpR,     & 
& MFd,MFu,MVWp,MRPFuToFdcVWp,MRGFuToFdcVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFdcVWp(MLambda,em,gs,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,   & 
& MFd,MFu,MVWp,MRPFuToFdcVWp,MRGFuToFdcVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFdcVWp(cplcFuFdcVWpL,cplcFuFdcVWpR,               & 
& ctcplcFuFdcVWpL,ctcplcFuFdcVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,           & 
& ZfUR,ZfVWp,AmpWaveFuToFdcVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFdcVWp(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,           & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplhhcVWpVWp,              & 
& cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexFuToFdcVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,           & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplhhcVWpVWp,              & 
& cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRdrFuToFdcVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp(MAhOS,MetIOS,MFdOS,MFuOS,             & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,           & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFuToFdcVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,           & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,         & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplhhcVWpVWp,              & 
& cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFuToFdcVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp(MAhOS,MetIOS,MFdOS,MFuOS,             & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,           & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,           & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFuToFdcVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,           & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplhhcVWpVWp,              & 
& cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFuToFdcVWp)

 End if 
 End if 
AmpVertexFuToFdcVWp = AmpVertexFuToFdcVWp -  AmpVertexIRdrFuToFdcVWp! +  AmpVertexIRosFuToFdcVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFdcVWp=0._dp 
AmpVertexZFuToFdcVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFdcVWp(1,gt2,:) = AmpWaveZFuToFdcVWp(1,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFdcVWp(1,gt1,:) 
AmpVertexZFuToFdcVWp(1,gt2,:)= AmpVertexZFuToFdcVWp(1,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFdcVWp(1,gt1,:) 
AmpWaveZFuToFdcVWp(2,gt2,:) = AmpWaveZFuToFdcVWp(2,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFdcVWp(2,gt1,:) 
AmpVertexZFuToFdcVWp(2,gt2,:)= AmpVertexZFuToFdcVWp(2,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFdcVWp(2,gt1,:) 
AmpWaveZFuToFdcVWp(3,gt2,:) = AmpWaveZFuToFdcVWp(3,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFdcVWp(3,gt1,:) 
AmpVertexZFuToFdcVWp(3,gt2,:)= AmpVertexZFuToFdcVWp(3,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFdcVWp(3,gt1,:) 
AmpWaveZFuToFdcVWp(4,gt2,:) = AmpWaveZFuToFdcVWp(4,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFdcVWp(4,gt1,:) 
AmpVertexZFuToFdcVWp(4,gt2,:)= AmpVertexZFuToFdcVWp(4,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFdcVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFdcVWp=AmpWaveZFuToFdcVWp 
AmpVertexFuToFdcVWp= AmpVertexZFuToFdcVWp
! Final State 1 
AmpWaveZFuToFdcVWp=0._dp 
AmpVertexZFuToFdcVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFdcVWp(1,:,gt2) = AmpWaveZFuToFdcVWp(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFuToFdcVWp(1,:,gt1) 
AmpVertexZFuToFdcVWp(1,:,gt2)= AmpVertexZFuToFdcVWp(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFuToFdcVWp(1,:,gt1) 
AmpWaveZFuToFdcVWp(2,:,gt2) = AmpWaveZFuToFdcVWp(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFuToFdcVWp(2,:,gt1) 
AmpVertexZFuToFdcVWp(2,:,gt2)= AmpVertexZFuToFdcVWp(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFuToFdcVWp(2,:,gt1) 
AmpWaveZFuToFdcVWp(3,:,gt2) = AmpWaveZFuToFdcVWp(3,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFuToFdcVWp(3,:,gt1) 
AmpVertexZFuToFdcVWp(3,:,gt2)= AmpVertexZFuToFdcVWp(3,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFuToFdcVWp(3,:,gt1) 
AmpWaveZFuToFdcVWp(4,:,gt2) = AmpWaveZFuToFdcVWp(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFuToFdcVWp(4,:,gt1) 
AmpVertexZFuToFdcVWp(4,:,gt2)= AmpVertexZFuToFdcVWp(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFuToFdcVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFdcVWp=AmpWaveZFuToFdcVWp 
AmpVertexFuToFdcVWp= AmpVertexZFuToFdcVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFdcVWp = AmpVertexFuToFdcVWp  +  AmpVertexIRosFuToFdcVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fd conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFdcVWp = AmpTreeFuToFdcVWp 
 AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp + 2._dp*AmpWaveFuToFdcVWp + 2._dp*AmpVertexFuToFdcVWp  
Else 
 AmpSumFuToFdcVWp = AmpTreeFuToFdcVWp + AmpWaveFuToFdcVWp + AmpVertexFuToFdcVWp
 AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp + AmpWaveFuToFdcVWp + AmpVertexFuToFdcVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFdcVWp = AmpTreeFuToFdcVWp
 AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFdOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFd(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFdcVWp(gt1, gt2) 
  AmpSum2FuToFdcVWp = 2._dp*AmpWaveFuToFdcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFdcVWp(gt1, gt2) 
  AmpSum2FuToFdcVWp = 2._dp*AmpVertexFuToFdcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFdcVWp(gt1, gt2) 
  AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp + 2._dp*AmpWaveFuToFdcVWp + 2._dp*AmpVertexFuToFdcVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFdcVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
  AmpSqTreeFuToFdcVWp(gt1, gt2) = AmpSqFuToFdcVWp(gt1, gt2)  
  AmpSum2FuToFdcVWp = + 2._dp*AmpWaveFuToFdcVWp + 2._dp*AmpVertexFuToFdcVWp
  Call SquareAmp_FtoFV(MFuOS(gt1),MFdOS(gt2),MVWpOS,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
  AmpSqFuToFdcVWp(gt1, gt2) = AmpSqFuToFdcVWp(gt1, gt2) + AmpSqTreeFuToFdcVWp(gt1, gt2)  
Else  
  AmpSum2FuToFdcVWp = AmpTreeFuToFdcVWp
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
  AmpSqTreeFuToFdcVWp(gt1, gt2) = AmpSqFuToFdcVWp(gt1, gt2)  
  AmpSum2FuToFdcVWp = + 2._dp*AmpWaveFuToFdcVWp + 2._dp*AmpVertexFuToFdcVWp
  Call SquareAmp_FtoFV(MFu(gt1),MFd(gt2),MVWp,AmpSumFuToFdcVWp(:,gt1, gt2),AmpSum2FuToFdcVWp(:,gt1, gt2),AmpSqFuToFdcVWp(gt1, gt2)) 
  AmpSqFuToFdcVWp(gt1, gt2) = AmpSqFuToFdcVWp(gt1, gt2) + AmpSqTreeFuToFdcVWp(gt1, gt2)  
End if  
Else  
  AmpSqFuToFdcVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFdcVWp(gt1, gt2).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFdOS(gt2),MVWpOS,helfactor*AmpSqFuToFdcVWp(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFd(gt2),MVWp,helfactor*AmpSqFuToFdcVWp(gt1, gt2))
End if 
If ((Abs(MRPFuToFdcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFdcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFdcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFdcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFdcVWp(gt1, gt2) + MRGFuToFdcVWp(gt1, gt2)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFdcVWp(gt1, gt2) + MRGFuToFdcVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fu hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FuToFuhh(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,             & 
& MFu2,Mhh2,AmpTreeFuToFuhh)

  Else 
Call Amplitude_Tree_radinuZeeHB_FuToFuhh(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,               & 
& Mhh,MFu2,Mhh2,AmpTreeFuToFuhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuhh(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,           & 
& MFuOS,MhhOS,MRPFuToFuhh,MRGFuToFuhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuhh(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,         & 
& MFuOS,MhhOS,MRPFuToFuhh,MRGFuToFuhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FuToFuhh(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,           & 
& MFu,Mhh,MRPFuToFuhh,MRGFuToFuhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuhh(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,         & 
& MFu,Mhh,MRPFuToFuhh,MRGFuToFuhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFuhh(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,       & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,AmpWaveFuToFuhh)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuhh(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,            & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexFuToFuhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRdrFuToFuhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,ZcplcFuFuhhL,          & 
& ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,             & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,              & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFuToFuhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRosFuToFuhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,              & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFuToFuhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRosFuToFuhh)

 End if 
 End if 
AmpVertexFuToFuhh = AmpVertexFuToFuhh -  AmpVertexIRdrFuToFuhh! +  AmpVertexIRosFuToFuhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFuhh=0._dp 
AmpVertexZFuToFuhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFuhh(1,gt2,:,:) = AmpWaveZFuToFuhh(1,gt2,:,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuhh(1,gt1,:,:) 
AmpVertexZFuToFuhh(1,gt2,:,:)= AmpVertexZFuToFuhh(1,gt2,:,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuhh(1,gt1,:,:) 
AmpWaveZFuToFuhh(2,gt2,:,:) = AmpWaveZFuToFuhh(2,gt2,:,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuhh(2,gt1,:,:) 
AmpVertexZFuToFuhh(2,gt2,:,:)= AmpVertexZFuToFuhh(2,gt2,:,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuhh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFuToFuhh=AmpWaveZFuToFuhh 
AmpVertexFuToFuhh= AmpVertexZFuToFuhh
! Final State 1 
AmpWaveZFuToFuhh=0._dp 
AmpVertexZFuToFuhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFuhh(1,:,gt2,:) = AmpWaveZFuToFuhh(1,:,gt2,:)+ZRUVu(gt2,gt1)*AmpWaveFuToFuhh(1,:,gt1,:) 
AmpVertexZFuToFuhh(1,:,gt2,:)= AmpVertexZFuToFuhh(1,:,gt2,:)+ZRUVu(gt2,gt1)*AmpVertexFuToFuhh(1,:,gt1,:) 
AmpWaveZFuToFuhh(2,:,gt2,:) = AmpWaveZFuToFuhh(2,:,gt2,:)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuhh(2,:,gt1,:) 
AmpVertexZFuToFuhh(2,:,gt2,:)= AmpVertexZFuToFuhh(2,:,gt2,:)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuhh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFuhh=AmpWaveZFuToFuhh 
AmpVertexFuToFuhh= AmpVertexZFuToFuhh
! Final State 2 
AmpWaveZFuToFuhh=0._dp 
AmpVertexZFuToFuhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFuToFuhh(:,:,:,gt2) = AmpWaveZFuToFuhh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveFuToFuhh(:,:,:,gt1) 
AmpVertexZFuToFuhh(:,:,:,gt2)= AmpVertexZFuToFuhh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexFuToFuhh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFuhh=AmpWaveZFuToFuhh 
AmpVertexFuToFuhh= AmpVertexZFuToFuhh
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFuhh = AmpVertexFuToFuhh  +  AmpVertexIRosFuToFuhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFuhh = AmpTreeFuToFuhh 
 AmpSum2FuToFuhh = AmpTreeFuToFuhh + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh  
Else 
 AmpSumFuToFuhh = AmpTreeFuToFuhh + AmpWaveFuToFuhh + AmpVertexFuToFuhh
 AmpSum2FuToFuhh = AmpTreeFuToFuhh + AmpWaveFuToFuhh + AmpVertexFuToFuhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuhh = AmpTreeFuToFuhh
 AmpSum2FuToFuhh = AmpTreeFuToFuhh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFuOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFu(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FuToFuhh = AmpTreeFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFuhh(gt1, gt2, gt3) 
  AmpSum2FuToFuhh = 2._dp*AmpWaveFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFuhh(gt1, gt2, gt3) 
  AmpSum2FuToFuhh = 2._dp*AmpVertexFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFuhh(gt1, gt2, gt3) 
  AmpSum2FuToFuhh = AmpTreeFuToFuhh + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFuhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFuhh = AmpTreeFuToFuhh
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqTreeFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3)  
  AmpSum2FuToFuhh = + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh
  Call SquareAmp_FtoFS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3) + AmpSqTreeFuToFuhh(gt1, gt2, gt3)  
Else  
  AmpSum2FuToFuhh = AmpTreeFuToFuhh
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqTreeFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3)  
  AmpSum2FuToFuhh = + 2._dp*AmpWaveFuToFuhh + 2._dp*AmpVertexFuToFuhh
  Call SquareAmp_FtoFS(MFu(gt1),MFu(gt2),Mhh(gt3),AmpSumFuToFuhh(:,gt1, gt2, gt3),AmpSum2FuToFuhh(:,gt1, gt2, gt3),AmpSqFuToFuhh(gt1, gt2, gt3)) 
  AmpSqFuToFuhh(gt1, gt2, gt3) = AmpSqFuToFuhh(gt1, gt2, gt3) + AmpSqTreeFuToFuhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFuToFuhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),MhhOS(gt3),helfactor*AmpSqFuToFuhh(gt1, gt2, gt3))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),Mhh(gt3),helfactor*AmpSqFuToFuhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFuhh(gt1, gt2, gt3) + MRGFuToFuhh(gt1, gt2, gt3)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFuhh(gt1, gt2, gt3) + MRGFuToFuhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
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
! Fu VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FuToFuVZ(cplcFuFuVZL,cplcFuFuVZR,MFu,MVZ,             & 
& MFu2,MVZ2,AmpTreeFuToFuVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_FuToFuVZ(ZcplcFuFuVZL,ZcplcFuFuVZR,MFu,               & 
& MVZ,MFu2,MVZ2,AmpTreeFuToFuVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuVZ(MLambda,em,gs,cplcFuFuVZL,cplcFuFuVZR,           & 
& MFuOS,MVZOS,MRPFuToFuVZ,MRGFuToFuVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuVZ(MLambda,em,gs,ZcplcFuFuVZL,ZcplcFuFuVZR,         & 
& MFuOS,MVZOS,MRPFuToFuVZ,MRGFuToFuVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FuToFuVZ(MLambda,em,gs,cplcFuFuVZL,cplcFuFuVZR,           & 
& MFu,MVZ,MRPFuToFuVZ,MRGFuToFuVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FuToFuVZ(MLambda,em,gs,ZcplcFuFuVZL,ZcplcFuFuVZR,         & 
& MFu,MVZ,MRPFuToFuVZ,MRGFuToFuVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVZ(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,         & 
& cplcFuFuVZR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,MFu,               & 
& MFu2,MVP,MVP2,MVZ,MVZ2,ZfUL,ZfUR,ZfVPVZ,ZfVZ,AmpWaveFuToFuVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVZ(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexFuToFuVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRdrFuToFuVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,               & 
& cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,ZcplcFuFuVZL,ZcplcFuFuVZR,           & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRosFuToFuVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& ZcplcFuFuVZL,ZcplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,              & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFuToFuVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,               & 
& cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRosFuToFuVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFuToFuVZ)

 End if 
 End if 
AmpVertexFuToFuVZ = AmpVertexFuToFuVZ -  AmpVertexIRdrFuToFuVZ! +  AmpVertexIRosFuToFuVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFuToFuVZ=0._dp 
AmpVertexZFuToFuVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFuVZ(1,gt2,:) = AmpWaveZFuToFuVZ(1,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuVZ(1,gt1,:) 
AmpVertexZFuToFuVZ(1,gt2,:)= AmpVertexZFuToFuVZ(1,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuVZ(1,gt1,:) 
AmpWaveZFuToFuVZ(2,gt2,:) = AmpWaveZFuToFuVZ(2,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuVZ(2,gt1,:) 
AmpVertexZFuToFuVZ(2,gt2,:)= AmpVertexZFuToFuVZ(2,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuVZ(2,gt1,:) 
AmpWaveZFuToFuVZ(3,gt2,:) = AmpWaveZFuToFuVZ(3,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveFuToFuVZ(3,gt1,:) 
AmpVertexZFuToFuVZ(3,gt2,:)= AmpVertexZFuToFuVZ(3,gt2,:) + ZRUVuc(gt2,gt1)*AmpVertexFuToFuVZ(3,gt1,:) 
AmpWaveZFuToFuVZ(4,gt2,:) = AmpWaveZFuToFuVZ(4,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveFuToFuVZ(4,gt1,:) 
AmpVertexZFuToFuVZ(4,gt2,:)= AmpVertexZFuToFuVZ(4,gt2,:) + ZRUUu(gt2,gt1)*AmpVertexFuToFuVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFuToFuVZ=AmpWaveZFuToFuVZ 
AmpVertexFuToFuVZ= AmpVertexZFuToFuVZ
! Final State 1 
AmpWaveZFuToFuVZ=0._dp 
AmpVertexZFuToFuVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFuToFuVZ(1,:,gt2) = AmpWaveZFuToFuVZ(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuVZ(1,:,gt1) 
AmpVertexZFuToFuVZ(1,:,gt2)= AmpVertexZFuToFuVZ(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuVZ(1,:,gt1) 
AmpWaveZFuToFuVZ(2,:,gt2) = AmpWaveZFuToFuVZ(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuVZ(2,:,gt1) 
AmpVertexZFuToFuVZ(2,:,gt2)= AmpVertexZFuToFuVZ(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuVZ(2,:,gt1) 
AmpWaveZFuToFuVZ(3,:,gt2) = AmpWaveZFuToFuVZ(3,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFuToFuVZ(3,:,gt1) 
AmpVertexZFuToFuVZ(3,:,gt2)= AmpVertexZFuToFuVZ(3,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFuToFuVZ(3,:,gt1) 
AmpWaveZFuToFuVZ(4,:,gt2) = AmpWaveZFuToFuVZ(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFuToFuVZ(4,:,gt1) 
AmpVertexZFuToFuVZ(4,:,gt2)= AmpVertexZFuToFuVZ(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFuToFuVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFuToFuVZ=AmpWaveZFuToFuVZ 
AmpVertexFuToFuVZ= AmpVertexZFuToFuVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFuToFuVZ = AmpVertexFuToFuVZ  +  AmpVertexIRosFuToFuVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFuToFuVZ = AmpTreeFuToFuVZ 
 AmpSum2FuToFuVZ = AmpTreeFuToFuVZ + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ  
Else 
 AmpSumFuToFuVZ = AmpTreeFuToFuVZ + AmpWaveFuToFuVZ + AmpVertexFuToFuVZ
 AmpSum2FuToFuVZ = AmpTreeFuToFuVZ + AmpWaveFuToFuVZ + AmpVertexFuToFuVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVZ = AmpTreeFuToFuVZ
 AmpSum2FuToFuVZ = AmpTreeFuToFuVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFuOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFu(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFuToFuVZ(gt1, gt2) 
  AmpSum2FuToFuVZ = 2._dp*AmpWaveFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFuToFuVZ(gt1, gt2) 
  AmpSum2FuToFuVZ = 2._dp*AmpVertexFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFuToFuVZ(gt1, gt2) 
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFuToFuVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqTreeFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2)  
  AmpSum2FuToFuVZ = + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),MVZOS,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2) + AmpSqTreeFuToFuVZ(gt1, gt2)  
Else  
  AmpSum2FuToFuVZ = AmpTreeFuToFuVZ
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqTreeFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2)  
  AmpSum2FuToFuVZ = + 2._dp*AmpWaveFuToFuVZ + 2._dp*AmpVertexFuToFuVZ
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVZ,AmpSumFuToFuVZ(:,gt1, gt2),AmpSum2FuToFuVZ(:,gt1, gt2),AmpSqFuToFuVZ(gt1, gt2)) 
  AmpSqFuToFuVZ(gt1, gt2) = AmpSqFuToFuVZ(gt1, gt2) + AmpSqTreeFuToFuVZ(gt1, gt2)  
End if  
Else  
  AmpSqFuToFuVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVZ(gt1, gt2).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),MVZOS,helfactor*AmpSqFuToFuVZ(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),MVZ,helfactor*AmpSqFuToFuVZ(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFuToFuVZ(gt1, gt2) + MRGFuToFuVZ(gt1, gt2)) 
  gP1LFu(gt1,i4) = gP1LFu(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFuToFuVZ(gt1, gt2) + MRGFuToFuVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFu(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
!---------------- 
! Fu VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVG(ZcplcFuFuVGL,ZcplcFuFuVGR,ctcplcFuFuVGL,     & 
& ctcplcFuFuVGR,MFuOS,MFu2OS,MVG,MVG2,ZfUL,ZfUR,ZfVG,AmpWaveFuToFuVG)

 Else 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVG(cplcFuFuVGL,cplcFuFuVGR,ctcplcFuFuVGL,       & 
& ctcplcFuFuVGR,MFuOS,MFu2OS,MVG,MVG2,ZfUL,ZfUR,ZfVG,AmpWaveFuToFuVG)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVG(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFuFuetIL,ZcplcFuFuetIR,             & 
& ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,     & 
& ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,         & 
& ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFdFucHmL,ZcplcFdFucHmR,     & 
& ZcplVGVGVG,AmpVertexFuToFuVG)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVG(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,              & 
& AmpVertexFuToFuVG)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVG(cplcFuFuVGL,cplcFuFuVGR,ctcplcFuFuVGL,       & 
& ctcplcFuFuVGR,MFu,MFu2,MVG,MVG2,ZfUL,ZfUR,ZfVG,AmpWaveFuToFuVG)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVG(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,AmpVertexFuToFuVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVG = 0._dp 
 AmpSum2FuToFuVG = 0._dp  
Else 
 AmpSumFuToFuVG = AmpVertexFuToFuVG + AmpWaveFuToFuVG
 AmpSum2FuToFuVG = AmpVertexFuToFuVG + AmpWaveFuToFuVG 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFuOS(gt2)+0.))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFu(gt2)+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),0._dp,AmpSumFuToFuVG(:,gt1, gt2),AmpSum2FuToFuVG(:,gt1, gt2),AmpSqFuToFuVG(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVG,AmpSumFuToFuVG(:,gt1, gt2),AmpSum2FuToFuVG(:,gt1, gt2),AmpSqFuToFuVG(gt1, gt2)) 
End if  
Else  
  AmpSqFuToFuVG(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVG(gt1, gt2).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 4._dp/3._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),0._dp,helfactor*AmpSqFuToFuVG(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 4._dp/3._dp*GammaTPS(MFu(gt1),MFu(gt2),MVG,helfactor*AmpSqFuToFuVG(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVG(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVG(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! Fu VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVP(ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,      & 
& ZcplcFuFuVZR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,MFuOS,            & 
& MFu2OS,MVP,MVP2,ZfUL,ZfUR,ZfVP,ZfVZVP,AmpWaveFuToFuVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVP(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,         & 
& cplcFuFuVZR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,MFuOS,             & 
& MFu2OS,MVP,MVP2,ZfUL,ZfUR,ZfVP,ZfVZVP,AmpWaveFuToFuVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVP(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFuFuetIL,ZcplcFuFuetIR,             & 
& ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,     & 
& ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,         & 
& ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcFdFucHmL,ZcplcFdFucHmR,     & 
& ZcplHmVPVWp,ZcplHmcHmVP,ZcplcVWpVPVWp,ZcplcHmcVWpVP,AmpVertexFuToFuVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVP(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,             & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,AmpVertexFuToFuVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FuToFuVP(cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,         & 
& cplcFuFuVZR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,MFu,               & 
& MFu2,MVP,MVP2,ZfUL,ZfUR,ZfVP,ZfVZVP,AmpWaveFuToFuVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FuToFuVP(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,          & 
& cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,             & 
& cplcFdFdVPR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,              & 
& cplcHmcVWpVP,AmpVertexFuToFuVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fu->Fu VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFuToFuVP = 0._dp 
 AmpSum2FuToFuVP = 0._dp  
Else 
 AmpSumFuToFuVP = AmpVertexFuToFuVP + AmpWaveFuToFuVP
 AmpSum2FuToFuVP = AmpVertexFuToFuVP + AmpWaveFuToFuVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFuOS(gt1).gt.(MFuOS(gt2)+0.))).or.((.not.OSkinematics).and.(MFu(gt1).gt.(MFu(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFuOS(gt1),MFuOS(gt2),0._dp,AmpSumFuToFuVP(:,gt1, gt2),AmpSum2FuToFuVP(:,gt1, gt2),AmpSqFuToFuVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFu(gt1),MFu(gt2),MVP,AmpSumFuToFuVP(:,gt1, gt2),AmpSum2FuToFuVP(:,gt1, gt2),AmpSqFuToFuVP(gt1, gt2)) 
End if  
Else  
  AmpSqFuToFuVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFuToFuVP(gt1, gt2).le.0._dp) Then 
  gP1LFu(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFuOS(gt1),MFuOS(gt2),0._dp,helfactor*AmpSqFuToFuVP(gt1, gt2))
Else 
  gP1LFu(gt1,i4) = 1._dp*GammaTPS(MFu(gt1),MFu(gt2),MVP,helfactor*AmpSqFuToFuVP(gt1, gt2))
End if 
If ((Abs(MRPFuToFuVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFuToFuVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFu(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_Fu

End Module Wrapper_OneLoopDecay_Fu_radinuZeeHB
