! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fd_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_Fd_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fd(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,              & 
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
& cplHmVPVWp,cplHmVWpVZ,cplVGVGVG,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFdFdetIL,            & 
& ctcplcFdFdetIR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,  & 
& ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFucHmL,ctcplcFdFucHmR,               & 
& ctcplcFdFuVWpL,ctcplcFdFuVWpR,GcplHmVPVWp,GosZcplHmVPVWp,GZcplHmVPVWp,ZcplcFdFdAhL,    & 
& ZcplcFdFdAhR,ZcplcFdFdetIL,ZcplcFdFdetIR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFdFdVGL,       & 
& ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFucHmL,        & 
& ZcplcFdFucHmR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,               & 
& ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,         & 
& ZcplcHmcVWpVP,ZcplcVWpVPVWp,ZcplHmcHmVP,ZcplHmVPVWp,ZcplVGVGVG,ZRUZH,ZRUZP,            & 
& ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFd)

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
& cplHmVPVWp(3),cplHmVWpVZ(3),cplVGVGVG,ctcplcFdFdAhL(3,3),ctcplcFdFdAhR(3,3),           & 
& ctcplcFdFdetIL(3,3),ctcplcFdFdetIR(3,3),ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2),     & 
& ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),           & 
& ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3),ctcplcFdFucHmL(3,3,3),ctcplcFdFucHmR(3,3,3),     & 
& ctcplcFdFuVWpL(3,3),ctcplcFdFuVWpR(3,3),GcplHmVPVWp(3),GosZcplHmVPVWp(3),              & 
& GZcplHmVPVWp(3),ZcplcFdFdAhL(3,3),ZcplcFdFdAhR(3,3),ZcplcFdFdetIL(3,3),ZcplcFdFdetIR(3,3),& 
& ZcplcFdFdhhL(3,3,2),ZcplcFdFdhhR(3,3,2),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),           & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFdFucHmL(3,3,3),ZcplcFdFucHmR(3,3,3),ZcplcFdFuVWpL(3,3),ZcplcFdFuVWpR(3,3),       & 
& ZcplcFuFdcVWpL(3,3),ZcplcFuFdcVWpR(3,3),ZcplcFuFdHmL(3,3,3),ZcplcFuFdHmR(3,3,3),       & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),               & 
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
Real(dp), Intent(out) :: gP1LFd(3,27) 
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
Real(dp) :: MRPFdToFdetI(3,3),MRGFdToFdetI(3,3), MRPZFdToFdetI(3,3),MRGZFdToFdetI(3,3) 
Real(dp) :: MVPFdToFdetI(3,3) 
Real(dp) :: RMsqTreeFdToFdetI(3,3),RMsqWaveFdToFdetI(3,3),RMsqVertexFdToFdetI(3,3) 
Complex(dp) :: AmpTreeFdToFdetI(2,3,3),AmpWaveFdToFdetI(2,3,3)=(0._dp,0._dp),AmpVertexFdToFdetI(2,3,3)& 
 & ,AmpVertexIRosFdToFdetI(2,3,3),AmpVertexIRdrFdToFdetI(2,3,3), AmpSumFdToFdetI(2,3,3), AmpSum2FdToFdetI(2,3,3) 
Complex(dp) :: AmpTreeZFdToFdetI(2,3,3),AmpWaveZFdToFdetI(2,3,3),AmpVertexZFdToFdetI(2,3,3) 
Real(dp) :: AmpSqFdToFdetI(3,3),  AmpSqTreeFdToFdetI(3,3) 
Real(dp) :: MRPFdToFdhh(3,3,2),MRGFdToFdhh(3,3,2), MRPZFdToFdhh(3,3,2),MRGZFdToFdhh(3,3,2) 
Real(dp) :: MVPFdToFdhh(3,3,2) 
Real(dp) :: RMsqTreeFdToFdhh(3,3,2),RMsqWaveFdToFdhh(3,3,2),RMsqVertexFdToFdhh(3,3,2) 
Complex(dp) :: AmpTreeFdToFdhh(2,3,3,2),AmpWaveFdToFdhh(2,3,3,2)=(0._dp,0._dp),AmpVertexFdToFdhh(2,3,3,2)& 
 & ,AmpVertexIRosFdToFdhh(2,3,3,2),AmpVertexIRdrFdToFdhh(2,3,3,2), AmpSumFdToFdhh(2,3,3,2), AmpSum2FdToFdhh(2,3,3,2) 
Complex(dp) :: AmpTreeZFdToFdhh(2,3,3,2),AmpWaveZFdToFdhh(2,3,3,2),AmpVertexZFdToFdhh(2,3,3,2) 
Real(dp) :: AmpSqFdToFdhh(3,3,2),  AmpSqTreeFdToFdhh(3,3,2) 
Real(dp) :: MRPFdToFdVZ(3,3),MRGFdToFdVZ(3,3), MRPZFdToFdVZ(3,3),MRGZFdToFdVZ(3,3) 
Real(dp) :: MVPFdToFdVZ(3,3) 
Real(dp) :: RMsqTreeFdToFdVZ(3,3),RMsqWaveFdToFdVZ(3,3),RMsqVertexFdToFdVZ(3,3) 
Complex(dp) :: AmpTreeFdToFdVZ(4,3,3),AmpWaveFdToFdVZ(4,3,3)=(0._dp,0._dp),AmpVertexFdToFdVZ(4,3,3)& 
 & ,AmpVertexIRosFdToFdVZ(4,3,3),AmpVertexIRdrFdToFdVZ(4,3,3), AmpSumFdToFdVZ(4,3,3), AmpSum2FdToFdVZ(4,3,3) 
Complex(dp) :: AmpTreeZFdToFdVZ(4,3,3),AmpWaveZFdToFdVZ(4,3,3),AmpVertexZFdToFdVZ(4,3,3) 
Real(dp) :: AmpSqFdToFdVZ(3,3),  AmpSqTreeFdToFdVZ(3,3) 
Real(dp) :: MRPFdToFuVWp(3,3),MRGFdToFuVWp(3,3), MRPZFdToFuVWp(3,3),MRGZFdToFuVWp(3,3) 
Real(dp) :: MVPFdToFuVWp(3,3) 
Real(dp) :: RMsqTreeFdToFuVWp(3,3),RMsqWaveFdToFuVWp(3,3),RMsqVertexFdToFuVWp(3,3) 
Complex(dp) :: AmpTreeFdToFuVWp(4,3,3),AmpWaveFdToFuVWp(4,3,3)=(0._dp,0._dp),AmpVertexFdToFuVWp(4,3,3)& 
 & ,AmpVertexIRosFdToFuVWp(4,3,3),AmpVertexIRdrFdToFuVWp(4,3,3), AmpSumFdToFuVWp(4,3,3), AmpSum2FdToFuVWp(4,3,3) 
Complex(dp) :: AmpTreeZFdToFuVWp(4,3,3),AmpWaveZFdToFuVWp(4,3,3),AmpVertexZFdToFuVWp(4,3,3) 
Real(dp) :: AmpSqFdToFuVWp(3,3),  AmpSqTreeFdToFuVWp(3,3) 
Real(dp) :: MRPFdToFucHm(3,3,3),MRGFdToFucHm(3,3,3), MRPZFdToFucHm(3,3,3),MRGZFdToFucHm(3,3,3) 
Real(dp) :: MVPFdToFucHm(3,3,3) 
Real(dp) :: RMsqTreeFdToFucHm(3,3,3),RMsqWaveFdToFucHm(3,3,3),RMsqVertexFdToFucHm(3,3,3) 
Complex(dp) :: AmpTreeFdToFucHm(2,3,3,3),AmpWaveFdToFucHm(2,3,3,3)=(0._dp,0._dp),AmpVertexFdToFucHm(2,3,3,3)& 
 & ,AmpVertexIRosFdToFucHm(2,3,3,3),AmpVertexIRdrFdToFucHm(2,3,3,3), AmpSumFdToFucHm(2,3,3,3), AmpSum2FdToFucHm(2,3,3,3) 
Complex(dp) :: AmpTreeZFdToFucHm(2,3,3,3),AmpWaveZFdToFucHm(2,3,3,3),AmpVertexZFdToFucHm(2,3,3,3) 
Real(dp) :: AmpSqFdToFucHm(3,3,3),  AmpSqTreeFdToFucHm(3,3,3) 
Real(dp) :: MRPFdToFdVG(3,3),MRGFdToFdVG(3,3), MRPZFdToFdVG(3,3),MRGZFdToFdVG(3,3) 
Real(dp) :: MVPFdToFdVG(3,3) 
Real(dp) :: RMsqTreeFdToFdVG(3,3),RMsqWaveFdToFdVG(3,3),RMsqVertexFdToFdVG(3,3) 
Complex(dp) :: AmpTreeFdToFdVG(4,3,3),AmpWaveFdToFdVG(4,3,3)=(0._dp,0._dp),AmpVertexFdToFdVG(4,3,3)& 
 & ,AmpVertexIRosFdToFdVG(4,3,3),AmpVertexIRdrFdToFdVG(4,3,3), AmpSumFdToFdVG(4,3,3), AmpSum2FdToFdVG(4,3,3) 
Complex(dp) :: AmpTreeZFdToFdVG(4,3,3),AmpWaveZFdToFdVG(4,3,3),AmpVertexZFdToFdVG(4,3,3) 
Real(dp) :: AmpSqFdToFdVG(3,3),  AmpSqTreeFdToFdVG(3,3) 
Real(dp) :: MRPFdToFdVP(3,3),MRGFdToFdVP(3,3), MRPZFdToFdVP(3,3),MRGZFdToFdVP(3,3) 
Real(dp) :: MVPFdToFdVP(3,3) 
Real(dp) :: RMsqTreeFdToFdVP(3,3),RMsqWaveFdToFdVP(3,3),RMsqVertexFdToFdVP(3,3) 
Complex(dp) :: AmpTreeFdToFdVP(4,3,3),AmpWaveFdToFdVP(4,3,3)=(0._dp,0._dp),AmpVertexFdToFdVP(4,3,3)& 
 & ,AmpVertexIRosFdToFdVP(4,3,3),AmpVertexIRdrFdToFdVP(4,3,3), AmpSumFdToFdVP(4,3,3), AmpSum2FdToFdVP(4,3,3) 
Complex(dp) :: AmpTreeZFdToFdVP(4,3,3),AmpWaveZFdToFdVP(4,3,3),AmpVertexZFdToFdVP(4,3,3) 
Real(dp) :: AmpSqFdToFdVP(3,3),  AmpSqTreeFdToFdVP(3,3) 
Write(*,*) "Calculating one-loop decays of Fd " 
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
! Fd etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FdToFdetI(cplcFdFdetIL,cplcFdFdetIR,MetI,             & 
& MFd,MetI2,MFd2,AmpTreeFdToFdetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_FdToFdetI(ZcplcFdFdetIL,ZcplcFdFdetIR,MetI,           & 
& MFd,MetI2,MFd2,AmpTreeFdToFdetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdetI(MLambda,em,gs,cplcFdFdetIL,cplcFdFdetIR,        & 
& MetIOS,MFdOS,MRPFdToFdetI,MRGFdToFdetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdetI(MLambda,em,gs,ZcplcFdFdetIL,ZcplcFdFdetIR,      & 
& MetIOS,MFdOS,MRPFdToFdetI,MRGFdToFdetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FdToFdetI(MLambda,em,gs,cplcFdFdetIL,cplcFdFdetIR,        & 
& MetI,MFd,MRPFdToFdetI,MRGFdToFdetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdetI(MLambda,em,gs,ZcplcFdFdetIL,ZcplcFdFdetIR,      & 
& MetI,MFd,MRPFdToFdetI,MRGFdToFdetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFdetI(cplcFdFdetIL,cplcFdFdetIR,ctcplcFdFdetIL,   & 
& ctcplcFdFdetIR,MetI,MetI2,MFd,MFd2,ZfDL,ZfDR,ZfetI,AmpWaveFdToFdetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdetI(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,           & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexFdToFdetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexIRdrFdToFdetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cpletIetIetI,cpletIetIhh,ZcplcFdFdetIL,ZcplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,        & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosFdToFdetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& ZcplcFdFdetIL,ZcplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexIRosFdToFdetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,          & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosFdToFdetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexIRosFdToFdetI)

 End if 
 End if 
AmpVertexFdToFdetI = AmpVertexFdToFdetI -  AmpVertexIRdrFdToFdetI! +  AmpVertexIRosFdToFdetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFdetI=0._dp 
AmpVertexZFdToFdetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFdetI(1,gt2,:) = AmpWaveZFdToFdetI(1,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdetI(1,gt1,:) 
AmpVertexZFdToFdetI(1,gt2,:)= AmpVertexZFdToFdetI(1,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdetI(1,gt1,:) 
AmpWaveZFdToFdetI(2,gt2,:) = AmpWaveZFdToFdetI(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdetI(2,gt1,:) 
AmpVertexZFdToFdetI(2,gt2,:)= AmpVertexZFdToFdetI(2,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdetI(2,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFdetI=AmpWaveZFdToFdetI 
AmpVertexFdToFdetI= AmpVertexZFdToFdetI
! Final State 1 
AmpWaveZFdToFdetI=0._dp 
AmpVertexZFdToFdetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFdetI(1,:,gt2) = AmpWaveZFdToFdetI(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdetI(1,:,gt1) 
AmpVertexZFdToFdetI(1,:,gt2)= AmpVertexZFdToFdetI(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdetI(1,:,gt1) 
AmpWaveZFdToFdetI(2,:,gt2) = AmpWaveZFdToFdetI(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdetI(2,:,gt1) 
AmpVertexZFdToFdetI(2,:,gt2)= AmpVertexZFdToFdetI(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdetI(2,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFdetI=AmpWaveZFdToFdetI 
AmpVertexFdToFdetI= AmpVertexZFdToFdetI
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFdetI = AmpVertexFdToFdetI  +  AmpVertexIRosFdToFdetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFdetI = AmpTreeFdToFdetI 
 AmpSum2FdToFdetI = AmpTreeFdToFdetI + 2._dp*AmpWaveFdToFdetI + 2._dp*AmpVertexFdToFdetI  
Else 
 AmpSumFdToFdetI = AmpTreeFdToFdetI + AmpWaveFdToFdetI + AmpVertexFdToFdetI
 AmpSum2FdToFdetI = AmpTreeFdToFdetI + AmpWaveFdToFdetI + AmpVertexFdToFdetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdetI = AmpTreeFdToFdetI
 AmpSum2FdToFdetI = AmpTreeFdToFdetI 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFdOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFd(gt2)+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FdToFdetI = AmpTreeFdToFdetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MetIOS,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),MetI,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFdetI(gt1, gt2) 
  AmpSum2FdToFdetI = 2._dp*AmpWaveFdToFdetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MetIOS,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),MetI,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFdetI(gt1, gt2) 
  AmpSum2FdToFdetI = 2._dp*AmpVertexFdToFdetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MetIOS,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),MetI,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFdetI(gt1, gt2) 
  AmpSum2FdToFdetI = AmpTreeFdToFdetI + 2._dp*AmpWaveFdToFdetI + 2._dp*AmpVertexFdToFdetI
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MetIOS,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),MetI,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFdetI(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFdetI = AmpTreeFdToFdetI
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MetIOS,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
  AmpSqTreeFdToFdetI(gt1, gt2) = AmpSqFdToFdetI(gt1, gt2)  
  AmpSum2FdToFdetI = + 2._dp*AmpWaveFdToFdetI + 2._dp*AmpVertexFdToFdetI
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MetIOS,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
  AmpSqFdToFdetI(gt1, gt2) = AmpSqFdToFdetI(gt1, gt2) + AmpSqTreeFdToFdetI(gt1, gt2)  
Else  
  AmpSum2FdToFdetI = AmpTreeFdToFdetI
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),MetI,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
  AmpSqTreeFdToFdetI(gt1, gt2) = AmpSqFdToFdetI(gt1, gt2)  
  AmpSum2FdToFdetI = + 2._dp*AmpWaveFdToFdetI + 2._dp*AmpVertexFdToFdetI
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),MetI,AmpSumFdToFdetI(:,gt1, gt2),AmpSum2FdToFdetI(:,gt1, gt2),AmpSqFdToFdetI(gt1, gt2)) 
  AmpSqFdToFdetI(gt1, gt2) = AmpSqFdToFdetI(gt1, gt2) + AmpSqTreeFdToFdetI(gt1, gt2)  
End if  
Else  
  AmpSqFdToFdetI(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdetI(gt1, gt2).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),MetIOS,helfactor*AmpSqFdToFdetI(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),MetI,helfactor*AmpSqFdToFdetI(gt1, gt2))
End if 
If ((Abs(MRPFdToFdetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFdetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFdetI(gt1, gt2) + MRGFdToFdetI(gt1, gt2)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFdetI(gt1, gt2) + MRGFdToFdetI(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fd hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,             & 
& MFd2,Mhh2,AmpTreeFdToFdhh)

  Else 
Call Amplitude_Tree_radinuZeeHB_FdToFdhh(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,               & 
& Mhh,MFd2,Mhh2,AmpTreeFdToFdhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdhh(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,           & 
& MFdOS,MhhOS,MRPFdToFdhh,MRGFdToFdhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdhh(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,         & 
& MFdOS,MhhOS,MRPFdToFdhh,MRGFdToFdhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FdToFdhh(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,           & 
& MFd,Mhh,MRPFdToFdhh,MRGFdToFdhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdhh(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,         & 
& MFd,Mhh,MRPFdToFdhh,MRGFdToFdhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,       & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,AmpWaveFdToFdhh)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdhh(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,            & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexFdToFdhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRdrFdToFdhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFdToFdhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHmL,              & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFdToFdhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRosFdToFdhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRosFdToFdhh)

 End if 
 End if 
AmpVertexFdToFdhh = AmpVertexFdToFdhh -  AmpVertexIRdrFdToFdhh! +  AmpVertexIRosFdToFdhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFdhh=0._dp 
AmpVertexZFdToFdhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFdhh(1,gt2,:,:) = AmpWaveZFdToFdhh(1,gt2,:,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdhh(1,gt1,:,:) 
AmpVertexZFdToFdhh(1,gt2,:,:)= AmpVertexZFdToFdhh(1,gt2,:,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdhh(1,gt1,:,:) 
AmpWaveZFdToFdhh(2,gt2,:,:) = AmpWaveZFdToFdhh(2,gt2,:,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdhh(2,gt1,:,:) 
AmpVertexZFdToFdhh(2,gt2,:,:)= AmpVertexZFdToFdhh(2,gt2,:,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdhh(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFdToFdhh=AmpWaveZFdToFdhh 
AmpVertexFdToFdhh= AmpVertexZFdToFdhh
! Final State 1 
AmpWaveZFdToFdhh=0._dp 
AmpVertexZFdToFdhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFdhh(1,:,gt2,:) = AmpWaveZFdToFdhh(1,:,gt2,:)+ZRUVd(gt2,gt1)*AmpWaveFdToFdhh(1,:,gt1,:) 
AmpVertexZFdToFdhh(1,:,gt2,:)= AmpVertexZFdToFdhh(1,:,gt2,:)+ZRUVd(gt2,gt1)*AmpVertexFdToFdhh(1,:,gt1,:) 
AmpWaveZFdToFdhh(2,:,gt2,:) = AmpWaveZFdToFdhh(2,:,gt2,:)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdhh(2,:,gt1,:) 
AmpVertexZFdToFdhh(2,:,gt2,:)= AmpVertexZFdToFdhh(2,:,gt2,:)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdhh(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFdhh=AmpWaveZFdToFdhh 
AmpVertexFdToFdhh= AmpVertexZFdToFdhh
! Final State 2 
AmpWaveZFdToFdhh=0._dp 
AmpVertexZFdToFdhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZFdToFdhh(:,:,:,gt2) = AmpWaveZFdToFdhh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveFdToFdhh(:,:,:,gt1) 
AmpVertexZFdToFdhh(:,:,:,gt2)= AmpVertexZFdToFdhh(:,:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexFdToFdhh(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFdhh=AmpWaveZFdToFdhh 
AmpVertexFdToFdhh= AmpVertexZFdToFdhh
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFdhh = AmpVertexFdToFdhh  +  AmpVertexIRosFdToFdhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFdhh = AmpTreeFdToFdhh 
 AmpSum2FdToFdhh = AmpTreeFdToFdhh + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh  
Else 
 AmpSumFdToFdhh = AmpTreeFdToFdhh + AmpWaveFdToFdhh + AmpVertexFdToFdhh
 AmpSum2FdToFdhh = AmpTreeFdToFdhh + AmpWaveFdToFdhh + AmpVertexFdToFdhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdhh = AmpTreeFdToFdhh
 AmpSum2FdToFdhh = AmpTreeFdToFdhh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFdOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFd(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FdToFdhh = AmpTreeFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFdhh(gt1, gt2, gt3) 
  AmpSum2FdToFdhh = 2._dp*AmpWaveFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFdhh(gt1, gt2, gt3) 
  AmpSum2FdToFdhh = 2._dp*AmpVertexFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFdhh(gt1, gt2, gt3) 
  AmpSum2FdToFdhh = AmpTreeFdToFdhh + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFdhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFdhh = AmpTreeFdToFdhh
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqTreeFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3)  
  AmpSum2FdToFdhh = + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh
  Call SquareAmp_FtoFS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3) + AmpSqTreeFdToFdhh(gt1, gt2, gt3)  
Else  
  AmpSum2FdToFdhh = AmpTreeFdToFdhh
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqTreeFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3)  
  AmpSum2FdToFdhh = + 2._dp*AmpWaveFdToFdhh + 2._dp*AmpVertexFdToFdhh
  Call SquareAmp_FtoFS(MFd(gt1),MFd(gt2),Mhh(gt3),AmpSumFdToFdhh(:,gt1, gt2, gt3),AmpSum2FdToFdhh(:,gt1, gt2, gt3),AmpSqFdToFdhh(gt1, gt2, gt3)) 
  AmpSqFdToFdhh(gt1, gt2, gt3) = AmpSqFdToFdhh(gt1, gt2, gt3) + AmpSqTreeFdToFdhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFdToFdhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),MhhOS(gt3),helfactor*AmpSqFdToFdhh(gt1, gt2, gt3))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),Mhh(gt3),helfactor*AmpSqFdToFdhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFdhh(gt1, gt2, gt3) + MRGFdToFdhh(gt1, gt2, gt3)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFdhh(gt1, gt2, gt3) + MRGFdToFdhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fd VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FdToFdVZ(cplcFdFdVZL,cplcFdFdVZR,MFd,MVZ,             & 
& MFd2,MVZ2,AmpTreeFdToFdVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_FdToFdVZ(ZcplcFdFdVZL,ZcplcFdFdVZR,MFd,               & 
& MVZ,MFd2,MVZ2,AmpTreeFdToFdVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdVZ(MLambda,em,gs,cplcFdFdVZL,cplcFdFdVZR,           & 
& MFdOS,MVZOS,MRPFdToFdVZ,MRGFdToFdVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdVZ(MLambda,em,gs,ZcplcFdFdVZL,ZcplcFdFdVZR,         & 
& MFdOS,MVZOS,MRPFdToFdVZ,MRGFdToFdVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FdToFdVZ(MLambda,em,gs,cplcFdFdVZL,cplcFdFdVZR,           & 
& MFd,MVZ,MRPFdToFdVZ,MRGFdToFdVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFdVZ(MLambda,em,gs,ZcplcFdFdVZL,ZcplcFdFdVZR,         & 
& MFd,MVZ,MRPFdToFdVZ,MRGFdToFdVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVZ(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,MFd,               & 
& MFd2,MVP,MVP2,MVZ,MVZ2,ZfDL,ZfDR,ZfVPVZ,ZfVZ,AmpWaveFdToFdVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVZ(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexFdToFdVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRdrFdToFdVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,             & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRosFdToFdVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& ZcplcFdFdVZL,ZcplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,       & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFdToFdVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ(MAhOS,MetIOS,MFdOS,MFuOS,               & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,               & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& AmpVertexIRosFdToFdVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ(MAh,MetI,MFd,MFu,Mhh,MHm,               & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFdToFdVZ)

 End if 
 End if 
AmpVertexFdToFdVZ = AmpVertexFdToFdVZ -  AmpVertexIRdrFdToFdVZ! +  AmpVertexIRosFdToFdVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFdVZ=0._dp 
AmpVertexZFdToFdVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFdVZ(1,gt2,:) = AmpWaveZFdToFdVZ(1,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdVZ(1,gt1,:) 
AmpVertexZFdToFdVZ(1,gt2,:)= AmpVertexZFdToFdVZ(1,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdVZ(1,gt1,:) 
AmpWaveZFdToFdVZ(2,gt2,:) = AmpWaveZFdToFdVZ(2,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdVZ(2,gt1,:) 
AmpVertexZFdToFdVZ(2,gt2,:)= AmpVertexZFdToFdVZ(2,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdVZ(2,gt1,:) 
AmpWaveZFdToFdVZ(3,gt2,:) = AmpWaveZFdToFdVZ(3,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFdVZ(3,gt1,:) 
AmpVertexZFdToFdVZ(3,gt2,:)= AmpVertexZFdToFdVZ(3,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFdVZ(3,gt1,:) 
AmpWaveZFdToFdVZ(4,gt2,:) = AmpWaveZFdToFdVZ(4,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFdVZ(4,gt1,:) 
AmpVertexZFdToFdVZ(4,gt2,:)= AmpVertexZFdToFdVZ(4,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFdVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFdVZ=AmpWaveZFdToFdVZ 
AmpVertexFdToFdVZ= AmpVertexZFdToFdVZ
! Final State 1 
AmpWaveZFdToFdVZ=0._dp 
AmpVertexZFdToFdVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFdVZ(1,:,gt2) = AmpWaveZFdToFdVZ(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdVZ(1,:,gt1) 
AmpVertexZFdToFdVZ(1,:,gt2)= AmpVertexZFdToFdVZ(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdVZ(1,:,gt1) 
AmpWaveZFdToFdVZ(2,:,gt2) = AmpWaveZFdToFdVZ(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdVZ(2,:,gt1) 
AmpVertexZFdToFdVZ(2,:,gt2)= AmpVertexZFdToFdVZ(2,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdVZ(2,:,gt1) 
AmpWaveZFdToFdVZ(3,:,gt2) = AmpWaveZFdToFdVZ(3,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveFdToFdVZ(3,:,gt1) 
AmpVertexZFdToFdVZ(3,:,gt2)= AmpVertexZFdToFdVZ(3,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexFdToFdVZ(3,:,gt1) 
AmpWaveZFdToFdVZ(4,:,gt2) = AmpWaveZFdToFdVZ(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpWaveFdToFdVZ(4,:,gt1) 
AmpVertexZFdToFdVZ(4,:,gt2)= AmpVertexZFdToFdVZ(4,:,gt2)+ZRUUdc(gt2,gt1)*AmpVertexFdToFdVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFdVZ=AmpWaveZFdToFdVZ 
AmpVertexFdToFdVZ= AmpVertexZFdToFdVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFdVZ = AmpVertexFdToFdVZ  +  AmpVertexIRosFdToFdVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFdVZ = AmpTreeFdToFdVZ 
 AmpSum2FdToFdVZ = AmpTreeFdToFdVZ + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ  
Else 
 AmpSumFdToFdVZ = AmpTreeFdToFdVZ + AmpWaveFdToFdVZ + AmpVertexFdToFdVZ
 AmpSum2FdToFdVZ = AmpTreeFdToFdVZ + AmpWaveFdToFdVZ + AmpVertexFdToFdVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVZ = AmpTreeFdToFdVZ
 AmpSum2FdToFdVZ = AmpTreeFdToFdVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFdOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFd(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFdVZ(gt1, gt2) 
  AmpSum2FdToFdVZ = 2._dp*AmpWaveFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFdVZ(gt1, gt2) 
  AmpSum2FdToFdVZ = 2._dp*AmpVertexFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFdVZ(gt1, gt2) 
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFdVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqTreeFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2)  
  AmpSum2FdToFdVZ = + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),MVZOS,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2) + AmpSqTreeFdToFdVZ(gt1, gt2)  
Else  
  AmpSum2FdToFdVZ = AmpTreeFdToFdVZ
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqTreeFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2)  
  AmpSum2FdToFdVZ = + 2._dp*AmpWaveFdToFdVZ + 2._dp*AmpVertexFdToFdVZ
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVZ,AmpSumFdToFdVZ(:,gt1, gt2),AmpSum2FdToFdVZ(:,gt1, gt2),AmpSqFdToFdVZ(gt1, gt2)) 
  AmpSqFdToFdVZ(gt1, gt2) = AmpSqFdToFdVZ(gt1, gt2) + AmpSqTreeFdToFdVZ(gt1, gt2)  
End if  
Else  
  AmpSqFdToFdVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVZ(gt1, gt2).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),MVZOS,helfactor*AmpSqFdToFdVZ(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),MVZ,helfactor*AmpSqFdToFdVZ(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFdVZ(gt1, gt2) + MRGFdToFdVZ(gt1, gt2)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFdVZ(gt1, gt2) + MRGFdToFdVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fu VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FdToFuVWp(cplcFdFuVWpL,cplcFdFuVWpR,MFd,              & 
& MFu,MVWp,MFd2,MFu2,MVWp2,AmpTreeFdToFuVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_FdToFuVWp(ZcplcFdFuVWpL,ZcplcFdFuVWpR,MFd,            & 
& MFu,MVWp,MFd2,MFu2,MVWp2,AmpTreeFdToFuVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFuVWp(MLambda,em,gs,cplcFdFuVWpL,cplcFdFuVWpR,        & 
& MFdOS,MFuOS,MVWpOS,MRPFdToFuVWp,MRGFdToFuVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFuVWp(MLambda,em,gs,ZcplcFdFuVWpL,ZcplcFdFuVWpR,      & 
& MFdOS,MFuOS,MVWpOS,MRPFdToFuVWp,MRGFdToFuVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FdToFuVWp(MLambda,em,gs,cplcFdFuVWpL,cplcFdFuVWpR,        & 
& MFd,MFu,MVWp,MRPFdToFuVWp,MRGFdToFuVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFuVWp(MLambda,em,gs,ZcplcFdFuVWpL,ZcplcFdFuVWpR,      & 
& MFd,MFu,MVWp,MRPFdToFuVWp,MRGFdToFuVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFuVWp(cplcFdFuVWpL,cplcFdFuVWpR,ctcplcFdFuVWpL,   & 
& ctcplcFdFuVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,ZfUR,ZfVWp,AmpWaveFdToFuVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFuVWp(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhHmVWp,             & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexFdToFuVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhHmVWp,             & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRdrFdToFuVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,           & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhHmVWp,cplhhcVWpVWp,GosZcplHmVPVWp,cplHmVWpVZ,           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFdToFuVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,ZcplcFdFuVWpL,             & 
& ZcplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhHmVWp,            & 
& cplhhcVWpVWp,GZcplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFdToFuVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhHmVWp,cplhhcVWpVWp,GcplHmVPVWp,cplHmVWpVZ,              & 
& cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFdToFuVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhHmVWp,             & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,AmpVertexIRosFdToFuVWp)

 End if 
 End if 
AmpVertexFdToFuVWp = AmpVertexFdToFuVWp -  AmpVertexIRdrFdToFuVWp! +  AmpVertexIRosFdToFuVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFuVWp=0._dp 
AmpVertexZFdToFuVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFuVWp(1,gt2,:) = AmpWaveZFdToFuVWp(1,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFuVWp(1,gt1,:) 
AmpVertexZFdToFuVWp(1,gt2,:)= AmpVertexZFdToFuVWp(1,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFuVWp(1,gt1,:) 
AmpWaveZFdToFuVWp(2,gt2,:) = AmpWaveZFdToFuVWp(2,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFuVWp(2,gt1,:) 
AmpVertexZFdToFuVWp(2,gt2,:)= AmpVertexZFdToFuVWp(2,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFuVWp(2,gt1,:) 
AmpWaveZFdToFuVWp(3,gt2,:) = AmpWaveZFdToFuVWp(3,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFuVWp(3,gt1,:) 
AmpVertexZFdToFuVWp(3,gt2,:)= AmpVertexZFdToFuVWp(3,gt2,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFuVWp(3,gt1,:) 
AmpWaveZFdToFuVWp(4,gt2,:) = AmpWaveZFdToFuVWp(4,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFuVWp(4,gt1,:) 
AmpVertexZFdToFuVWp(4,gt2,:)= AmpVertexZFdToFuVWp(4,gt2,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFuVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFuVWp=AmpWaveZFdToFuVWp 
AmpVertexFdToFuVWp= AmpVertexZFdToFuVWp
! Final State 1 
AmpWaveZFdToFuVWp=0._dp 
AmpVertexZFdToFuVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFuVWp(1,:,gt2) = AmpWaveZFdToFuVWp(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFdToFuVWp(1,:,gt1) 
AmpVertexZFdToFuVWp(1,:,gt2)= AmpVertexZFdToFuVWp(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFdToFuVWp(1,:,gt1) 
AmpWaveZFdToFuVWp(2,:,gt2) = AmpWaveZFdToFuVWp(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFdToFuVWp(2,:,gt1) 
AmpVertexZFdToFuVWp(2,:,gt2)= AmpVertexZFdToFuVWp(2,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFdToFuVWp(2,:,gt1) 
AmpWaveZFdToFuVWp(3,:,gt2) = AmpWaveZFdToFuVWp(3,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveFdToFuVWp(3,:,gt1) 
AmpVertexZFdToFuVWp(3,:,gt2)= AmpVertexZFdToFuVWp(3,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexFdToFuVWp(3,:,gt1) 
AmpWaveZFdToFuVWp(4,:,gt2) = AmpWaveZFdToFuVWp(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpWaveFdToFuVWp(4,:,gt1) 
AmpVertexZFdToFuVWp(4,:,gt2)= AmpVertexZFdToFuVWp(4,:,gt2)+ZRUUuc(gt2,gt1)*AmpVertexFdToFuVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFuVWp=AmpWaveZFdToFuVWp 
AmpVertexFdToFuVWp= AmpVertexZFdToFuVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFuVWp = AmpVertexFdToFuVWp  +  AmpVertexIRosFdToFuVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fu VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFuVWp = AmpTreeFdToFuVWp 
 AmpSum2FdToFuVWp = AmpTreeFdToFuVWp + 2._dp*AmpWaveFdToFuVWp + 2._dp*AmpVertexFdToFuVWp  
Else 
 AmpSumFdToFuVWp = AmpTreeFdToFuVWp + AmpWaveFdToFuVWp + AmpVertexFdToFuVWp
 AmpSum2FdToFuVWp = AmpTreeFdToFuVWp + AmpWaveFdToFuVWp + AmpVertexFdToFuVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFuVWp = AmpTreeFdToFuVWp
 AmpSum2FdToFuVWp = AmpTreeFdToFuVWp 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFuOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFu(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FdToFuVWp = AmpTreeFdToFuVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFuVWp(gt1, gt2) 
  AmpSum2FdToFuVWp = 2._dp*AmpWaveFdToFuVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFuVWp(gt1, gt2) 
  AmpSum2FdToFuVWp = 2._dp*AmpVertexFdToFuVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFuVWp(gt1, gt2) 
  AmpSum2FdToFuVWp = AmpTreeFdToFuVWp + 2._dp*AmpWaveFdToFuVWp + 2._dp*AmpVertexFdToFuVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFuVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFuVWp = AmpTreeFdToFuVWp
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
  AmpSqTreeFdToFuVWp(gt1, gt2) = AmpSqFdToFuVWp(gt1, gt2)  
  AmpSum2FdToFuVWp = + 2._dp*AmpWaveFdToFuVWp + 2._dp*AmpVertexFdToFuVWp
  Call SquareAmp_FtoFV(MFdOS(gt1),MFuOS(gt2),MVWpOS,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
  AmpSqFdToFuVWp(gt1, gt2) = AmpSqFdToFuVWp(gt1, gt2) + AmpSqTreeFdToFuVWp(gt1, gt2)  
Else  
  AmpSum2FdToFuVWp = AmpTreeFdToFuVWp
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
  AmpSqTreeFdToFuVWp(gt1, gt2) = AmpSqFdToFuVWp(gt1, gt2)  
  AmpSum2FdToFuVWp = + 2._dp*AmpWaveFdToFuVWp + 2._dp*AmpVertexFdToFuVWp
  Call SquareAmp_FtoFV(MFd(gt1),MFu(gt2),MVWp,AmpSumFdToFuVWp(:,gt1, gt2),AmpSum2FdToFuVWp(:,gt1, gt2),AmpSqFdToFuVWp(gt1, gt2)) 
  AmpSqFdToFuVWp(gt1, gt2) = AmpSqFdToFuVWp(gt1, gt2) + AmpSqTreeFdToFuVWp(gt1, gt2)  
End if  
Else  
  AmpSqFdToFuVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFuVWp(gt1, gt2).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFuOS(gt2),MVWpOS,helfactor*AmpSqFdToFuVWp(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFu(gt2),MVWp,helfactor*AmpSqFdToFuVWp(gt1, gt2))
End if 
If ((Abs(MRPFdToFuVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFuVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFuVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFuVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFuVWp(gt1, gt2) + MRGFdToFuVWp(gt1, gt2)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFuVWp(gt1, gt2) + MRGFdToFuVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fu Conjg(Hm)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FdToFucHm(cplcFdFucHmL,cplcFdFucHmR,MFd,              & 
& MFu,MHm,MFd2,MFu2,MHm2,AmpTreeFdToFucHm)

  Else 
Call Amplitude_Tree_radinuZeeHB_FdToFucHm(ZcplcFdFucHmL,ZcplcFdFucHmR,MFd,            & 
& MFu,MHm,MFd2,MFu2,MHm2,AmpTreeFdToFucHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFucHm(MLambda,em,gs,cplcFdFucHmL,cplcFdFucHmR,        & 
& MFdOS,MFuOS,MHmOS,MRPFdToFucHm,MRGFdToFucHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFucHm(MLambda,em,gs,ZcplcFdFucHmL,ZcplcFdFucHmR,      & 
& MFdOS,MFuOS,MHmOS,MRPFdToFucHm,MRGFdToFucHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FdToFucHm(MLambda,em,gs,cplcFdFucHmL,cplcFdFucHmR,        & 
& MFd,MFu,MHm,MRPFdToFucHm,MRGFdToFucHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FdToFucHm(MLambda,em,gs,ZcplcFdFucHmL,ZcplcFdFucHmR,      & 
& MFd,MFu,MHm,MRPFdToFucHm,MRGFdToFucHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFucHm(cplcFdFucHmL,cplcFdFucHmR,ctcplcFdFucHmL,   & 
& ctcplcFdFucHmR,MFd,MFd2,MFu,MFu2,MHm,MHm2,ZfDL,ZfDR,ZfHm,ZfUL,ZfUR,AmpWaveFdToFucHm)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFucHm(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexFdToFucHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexIRdrFdToFucHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,           & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,ZcplcFdFucHmL,ZcplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosFdToFucHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,ZcplcFdFucHmL,           & 
& ZcplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,              & 
& cplcHmcVWpVZ,AmpVertexIRosFdToFucHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,           & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,             & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosFdToFucHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexIRosFdToFucHm)

 End if 
 End if 
AmpVertexFdToFucHm = AmpVertexFdToFucHm -  AmpVertexIRdrFdToFucHm! +  AmpVertexIRosFdToFucHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFdToFucHm=0._dp 
AmpVertexZFdToFucHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFucHm(1,gt2,:,:) = AmpWaveZFdToFucHm(1,gt2,:,:)+ZRUUd(gt2,gt1)*AmpWaveFdToFucHm(1,gt1,:,:) 
AmpVertexZFdToFucHm(1,gt2,:,:)= AmpVertexZFdToFucHm(1,gt2,:,:) + ZRUUd(gt2,gt1)*AmpVertexFdToFucHm(1,gt1,:,:) 
AmpWaveZFdToFucHm(2,gt2,:,:) = AmpWaveZFdToFucHm(2,gt2,:,:)+ZRUVdc(gt2,gt1)*AmpWaveFdToFucHm(2,gt1,:,:) 
AmpVertexZFdToFucHm(2,gt2,:,:)= AmpVertexZFdToFucHm(2,gt2,:,:) + ZRUVdc(gt2,gt1)*AmpVertexFdToFucHm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFdToFucHm=AmpWaveZFdToFucHm 
AmpVertexFdToFucHm= AmpVertexZFdToFucHm
! Final State 1 
AmpWaveZFdToFucHm=0._dp 
AmpVertexZFdToFucHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFucHm(1,:,gt2,:) = AmpWaveZFdToFucHm(1,:,gt2,:)+ZRUVu(gt2,gt1)*AmpWaveFdToFucHm(1,:,gt1,:) 
AmpVertexZFdToFucHm(1,:,gt2,:)= AmpVertexZFdToFucHm(1,:,gt2,:)+ZRUVu(gt2,gt1)*AmpVertexFdToFucHm(1,:,gt1,:) 
AmpWaveZFdToFucHm(2,:,gt2,:) = AmpWaveZFdToFucHm(2,:,gt2,:)+ZRUUuc(gt2,gt1)*AmpWaveFdToFucHm(2,:,gt1,:) 
AmpVertexZFdToFucHm(2,:,gt2,:)= AmpVertexZFdToFucHm(2,:,gt2,:)+ZRUUuc(gt2,gt1)*AmpVertexFdToFucHm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFdToFucHm=AmpWaveZFdToFucHm 
AmpVertexFdToFucHm= AmpVertexZFdToFucHm
! Final State 2 
AmpWaveZFdToFucHm=0._dp 
AmpVertexZFdToFucHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFdToFucHm(:,:,:,gt2) = AmpWaveZFdToFucHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveFdToFucHm(:,:,:,gt1) 
AmpVertexZFdToFucHm(:,:,:,gt2)= AmpVertexZFdToFucHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexFdToFucHm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFdToFucHm=AmpWaveZFdToFucHm 
AmpVertexFdToFucHm= AmpVertexZFdToFucHm
End if
If (ShiftIRdiv) Then 
AmpVertexFdToFucHm = AmpVertexFdToFucHm  +  AmpVertexIRosFdToFucHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fu conj[Hm] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFdToFucHm = AmpTreeFdToFucHm 
 AmpSum2FdToFucHm = AmpTreeFdToFucHm + 2._dp*AmpWaveFdToFucHm + 2._dp*AmpVertexFdToFucHm  
Else 
 AmpSumFdToFucHm = AmpTreeFdToFucHm + AmpWaveFdToFucHm + AmpVertexFdToFucHm
 AmpSum2FdToFucHm = AmpTreeFdToFucHm + AmpWaveFdToFucHm + AmpVertexFdToFucHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFucHm = AmpTreeFdToFucHm
 AmpSum2FdToFucHm = AmpTreeFdToFucHm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=2,3
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFuOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFu(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FdToFucHm = AmpTreeFdToFucHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFu(gt2),MHm(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFdToFucHm(gt1, gt2, gt3) 
  AmpSum2FdToFucHm = 2._dp*AmpWaveFdToFucHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFu(gt2),MHm(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFdToFucHm(gt1, gt2, gt3) 
  AmpSum2FdToFucHm = 2._dp*AmpVertexFdToFucHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFu(gt2),MHm(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFdToFucHm(gt1, gt2, gt3) 
  AmpSum2FdToFucHm = AmpTreeFdToFucHm + 2._dp*AmpWaveFdToFucHm + 2._dp*AmpVertexFdToFucHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFd(gt1),MFu(gt2),MHm(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFdToFucHm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FdToFucHm = AmpTreeFdToFucHm
  Call SquareAmp_FtoFS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
  AmpSqTreeFdToFucHm(gt1, gt2, gt3) = AmpSqFdToFucHm(gt1, gt2, gt3)  
  AmpSum2FdToFucHm = + 2._dp*AmpWaveFdToFucHm + 2._dp*AmpVertexFdToFucHm
  Call SquareAmp_FtoFS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
  AmpSqFdToFucHm(gt1, gt2, gt3) = AmpSqFdToFucHm(gt1, gt2, gt3) + AmpSqTreeFdToFucHm(gt1, gt2, gt3)  
Else  
  AmpSum2FdToFucHm = AmpTreeFdToFucHm
  Call SquareAmp_FtoFS(MFd(gt1),MFu(gt2),MHm(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
  AmpSqTreeFdToFucHm(gt1, gt2, gt3) = AmpSqFdToFucHm(gt1, gt2, gt3)  
  AmpSum2FdToFucHm = + 2._dp*AmpWaveFdToFucHm + 2._dp*AmpVertexFdToFucHm
  Call SquareAmp_FtoFS(MFd(gt1),MFu(gt2),MHm(gt3),AmpSumFdToFucHm(:,gt1, gt2, gt3),AmpSum2FdToFucHm(:,gt1, gt2, gt3),AmpSqFdToFucHm(gt1, gt2, gt3)) 
  AmpSqFdToFucHm(gt1, gt2, gt3) = AmpSqFdToFucHm(gt1, gt2, gt3) + AmpSqTreeFdToFucHm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFdToFucHm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFucHm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFuOS(gt2),MHmOS(gt3),helfactor*AmpSqFdToFucHm(gt1, gt2, gt3))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFu(gt2),MHm(gt3),helfactor*AmpSqFdToFucHm(gt1, gt2, gt3))
End if 
If ((Abs(MRPFdToFucHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFdToFucHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFdToFucHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFdToFucHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFdToFucHm(gt1, gt2, gt3) + MRGFdToFucHm(gt1, gt2, gt3)) 
  gP1LFd(gt1,i4) = gP1LFd(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFdToFucHm(gt1, gt2, gt3) + MRGFdToFucHm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFd(gt1,i4) 
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
! Fd VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVG(ZcplcFdFdVGL,ZcplcFdFdVGR,ctcplcFdFdVGL,     & 
& ctcplcFdFdVGR,MFdOS,MFd2OS,MVG,MVG2,ZfDL,ZfDR,ZfVG,AmpWaveFdToFdVG)

 Else 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVG(cplcFdFdVGL,cplcFdFdVGR,ctcplcFdFdVGL,       & 
& ctcplcFdFdVGR,MFdOS,MFd2OS,MVG,MVG2,ZfDL,ZfDR,ZfVG,AmpWaveFdToFdVG)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVG(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFdFdetIL,ZcplcFdFdetIR,             & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFdFdVGL,ZcplcFdFdVGR,         & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,     & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFdFucHmL,ZcplcFdFucHmR,     & 
& ZcplVGVGVG,AmpVertexFdToFdVG)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVG(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,             & 
& AmpVertexFdToFdVG)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVG(cplcFdFdVGL,cplcFdFdVGR,ctcplcFdFdVGL,       & 
& ctcplcFdFdVGR,MFd,MFd2,MVG,MVG2,ZfDL,ZfDR,ZfVG,AmpWaveFdToFdVG)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVG(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVGL,cplcFuFuVGR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,AmpVertexFdToFdVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVG = 0._dp 
 AmpSum2FdToFdVG = 0._dp  
Else 
 AmpSumFdToFdVG = AmpVertexFdToFdVG + AmpWaveFdToFdVG
 AmpSum2FdToFdVG = AmpVertexFdToFdVG + AmpWaveFdToFdVG 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFdOS(gt2)+0.))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFd(gt2)+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),0._dp,AmpSumFdToFdVG(:,gt1, gt2),AmpSum2FdToFdVG(:,gt1, gt2),AmpSqFdToFdVG(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVG,AmpSumFdToFdVG(:,gt1, gt2),AmpSum2FdToFdVG(:,gt1, gt2),AmpSqFdToFdVG(gt1, gt2)) 
End if  
Else  
  AmpSqFdToFdVG(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVG(gt1, gt2).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 4._dp/3._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),0._dp,helfactor*AmpSqFdToFdVG(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 4._dp/3._dp*GammaTPS(MFd(gt1),MFd(gt2),MVG,helfactor*AmpSqFdToFdVG(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVG(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVG(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! Fd VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVP(ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,      & 
& ZcplcFdFdVZR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,MFdOS,            & 
& MFd2OS,MVP,MVP2,ZfDL,ZfDR,ZfVP,ZfVZVP,AmpWaveFdToFdVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVP(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,MFdOS,             & 
& MFd2OS,MVP,MVP2,ZfDL,ZfDR,ZfVP,ZfVZVP,AmpWaveFdToFdVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVP(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,ZcplcFdFdAhL,ZcplcFdFdAhR,ZcplcFdFdetIL,ZcplcFdFdetIR,             & 
& ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFdFdVGL,ZcplcFdFdVGR,         & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,     & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFdFucHmL,ZcplcFdFucHmR,     & 
& ZcplHmVPVWp,ZcplHmcHmVP,ZcplcVWpVPVWp,ZcplcHmcVWpVP,AmpVertexFdToFdVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVP(MAhOS,MetIOS,MFdOS,MFuOS,MhhOS,            & 
& MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,MVG2,            & 
& MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVPL,           & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,            & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,AmpVertexFdToFdVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FdToFdVP(cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,         & 
& cplcFdFdVZR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,MFd,               & 
& MFd2,MVP,MVP2,ZfDL,ZfDR,ZfVP,ZfVZVP,AmpWaveFdToFdVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FdToFdVP(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,             & 
& cplcHmcVWpVP,AmpVertexFdToFdVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fd->Fd VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFdToFdVP = 0._dp 
 AmpSum2FdToFdVP = 0._dp  
Else 
 AmpSumFdToFdVP = AmpVertexFdToFdVP + AmpWaveFdToFdVP
 AmpSum2FdToFdVP = AmpVertexFdToFdVP + AmpWaveFdToFdVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFdOS(gt1).gt.(MFdOS(gt2)+0.))).or.((.not.OSkinematics).and.(MFd(gt1).gt.(MFd(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFdOS(gt1),MFdOS(gt2),0._dp,AmpSumFdToFdVP(:,gt1, gt2),AmpSum2FdToFdVP(:,gt1, gt2),AmpSqFdToFdVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFd(gt1),MFd(gt2),MVP,AmpSumFdToFdVP(:,gt1, gt2),AmpSum2FdToFdVP(:,gt1, gt2),AmpSqFdToFdVP(gt1, gt2)) 
End if  
Else  
  AmpSqFdToFdVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFdToFdVP(gt1, gt2).le.0._dp) Then 
  gP1LFd(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFdOS(gt1),MFdOS(gt2),0._dp,helfactor*AmpSqFdToFdVP(gt1, gt2))
Else 
  gP1LFd(gt1,i4) = 1._dp*GammaTPS(MFd(gt1),MFd(gt2),MVP,helfactor*AmpSqFdToFdVP(gt1, gt2))
End if 
If ((Abs(MRPFdToFdVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFdToFdVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFd(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_Fd

End Module Wrapper_OneLoopDecay_Fd_radinuZeeHB
