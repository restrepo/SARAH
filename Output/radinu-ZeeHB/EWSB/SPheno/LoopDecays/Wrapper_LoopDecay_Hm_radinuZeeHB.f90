! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Hm_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_Hm_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Hm(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,              & 
& MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,            & 
& MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,               & 
& lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,               & 
& Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,               & 
& dYh,dmH2,dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,               & 
& dlam8,dlamh,dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,               & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,              & 
& ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhcVWpVWp1,cplAhAhetI,           & 
& cplAhAhhh,cplAhAhHmcHm1,cplAhcHmcVWp,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cplAhetIetI,      & 
& cplAhetIhh,cplAhetIHmcHm1,cplAhhhhh,cplAhhhHmcHm1,cplAhhhVZ,cplAhHmcHm,cplAhHmVPVWp1,  & 
& cplAhHmVWp,cplAhHmVWpVZ1,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgAgWpcVWp,cplcgWCgWCAh,cplcgWCgWCetI,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,       & 
& cplcgWCgZcVWp,cplcgWCgZHm,cplcgWpgAcHm,cplcgWpgWpAh,cplcgWpgWpetI,cplcgWpgWphh,        & 
& cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgZcHm,cplcgZgAhh,cplcgZgWCcHm,cplcgZgWpcVWp,          & 
& cplcgZgWpHm,cplcgZgZhh,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,        & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,      & 
& cplcVWpVWpVZVZ3Q,cpletIcHmcVWp,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cpletIetIcVWpVWp1,    & 
& cpletIetIetI,cpletIetIhh,cpletIetIHmcHm1,cpletIhhhh,cpletIhhHmcHm1,cpletIhhVZ,         & 
& cpletIHmcHm,cpletIHmVPVWp1,cpletIHmVWp,cpletIHmVWpVZ1,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcHmcVWpVP1,              & 
& cplhhcHmcVWpVZ1,cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,cplhhhhHmcHm1,cplhhHmcHm,       & 
& cplhhHmVPVWp1,cplhhHmVWp,cplhhHmVWpVZ1,cplhhVZVZ,cplHmcHmcVWpVWp1,cplHmcHmVP,          & 
& cplHmcHmVPVP1,cplHmcHmVPVZ1,cplHmcHmVZ,cplHmcHmVZVZ1,cplHmHmcHmcHm1,cplHmVPVWp,        & 
& cplHmVWpVZ,ctcplAhcHmcVWp,ctcplAhHmcHm,ctcplcFdFucHmL,ctcplcFdFucHmR,ctcplcFeFvcHmL,   & 
& ctcplcFeFvcHmR,ctcplcHmcVWpVP,ctcplcHmcVWpVZ,ctcpletIcHmcVWp,ctcpletIHmcHm,            & 
& ctcplhhcHmcVWp,ctcplhhHmcHm,ctcplHmcHmVP,ctcplHmcHmVZ,GcplHmVPVWp,GosZcplHmVPVWp,      & 
& GZcplHmVPVWp,ZcplAhcHmcVWp,ZcplAhHmcHm,ZcplcFdFucHmL,ZcplcFdFucHmR,ZcplcFeFvcHmL,      & 
& ZcplcFeFvcHmR,ZcplcHmcVWpVZ,ZcpletIcHmcVWp,ZcpletIHmcHm,ZcplhhcHmcVWp,ZcplhhHmcHm,     & 
& ZcplHmcHmVZ,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,             & 
& em,gs,deltaM,kont,gP1LHm)

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

Complex(dp),Intent(in) :: cplAhAhAh,cplAhAhcVWpVWp1,cplAhAhetI,cplAhAhhh(2),cplAhAhHmcHm1(3,3),cplAhcHmcVWp(3), & 
& cplAhcHmcVWpVP1(3),cplAhcHmcVWpVZ1(3),cplAhetIetI,cplAhetIhh(2),cplAhetIHmcHm1(3,3),   & 
& cplAhhhhh(2,2),cplAhhhHmcHm1(2,3,3),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVPVWp1(3),     & 
& cplAhHmVWp(3),cplAhHmVWpVZ1(3),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),    & 
& cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),              & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),           & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),           & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgAgWpcVWp,cplcgWCgWCAh,cplcgWCgWCetI,            & 
& cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZHm(3),cplcgWpgAcHm(3),& 
& cplcgWpgWpAh,cplcgWpgWpetI,cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgZcHm(3),  & 
& cplcgZgAhh(2),cplcgZgWCcHm(3),cplcgZgWpcVWp,cplcgZgWpHm(3),cplcgZgZhh(2),              & 
& cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,        & 
& cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,      & 
& cpletIcHmcVWp(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cpletIetIcVWpVWp1,            & 
& cpletIetIetI,cpletIetIhh(2),cpletIetIHmcHm1(3,3),cpletIhhhh(2,2),cpletIhhHmcHm1(2,3,3),& 
& cpletIhhVZ(2),cpletIHmcHm(3,3),cpletIHmVPVWp1(3),cpletIHmVWp(3),cpletIHmVWpVZ1(3),     & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),               & 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhcHmcVWp(2,3),cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),& 
& cplhhcVWpVWp(2),cplhhhhcVWpVWp1(2,2),cplhhhhhh(2,2,2),cplhhhhHmcHm1(2,2,3,3),          & 
& cplhhHmcHm(2,3,3),cplhhHmVPVWp1(2,3),cplhhHmVWp(2,3),cplhhHmVWpVZ1(2,3),               & 
& cplhhVZVZ(2),cplHmcHmcVWpVWp1(3,3),cplHmcHmVP(3,3),cplHmcHmVPVP1(3,3),cplHmcHmVPVZ1(3,3),& 
& cplHmcHmVZ(3,3),cplHmcHmVZVZ1(3,3),cplHmHmcHmcHm1(3,3,3,3),cplHmVPVWp(3),              & 
& cplHmVWpVZ(3),ctcplAhcHmcVWp(3),ctcplAhHmcHm(3,3),ctcplcFdFucHmL(3,3,3),               & 
& ctcplcFdFucHmR(3,3,3),ctcplcFeFvcHmL(3,3,3),ctcplcFeFvcHmR(3,3,3),ctcplcHmcVWpVP(3),   & 
& ctcplcHmcVWpVZ(3),ctcpletIcHmcVWp(3),ctcpletIHmcHm(3,3),ctcplhhcHmcVWp(2,3),           & 
& ctcplhhHmcHm(2,3,3),ctcplHmcHmVP(3,3),ctcplHmcHmVZ(3,3),GcplHmVPVWp(3),GosZcplHmVPVWp(3),& 
& GZcplHmVPVWp(3),ZcplAhcHmcVWp(3),ZcplAhHmcHm(3,3),ZcplcFdFucHmL(3,3,3),ZcplcFdFucHmR(3,3,3),& 
& ZcplcFeFvcHmL(3,3,3),ZcplcFeFvcHmR(3,3,3),ZcplcHmcVWpVZ(3),ZcpletIcHmcVWp(3),          & 
& ZcpletIHmcHm(3,3),ZcplhhcHmcVWp(2,3),ZcplhhHmcHm(2,3,3),ZcplHmcHmVZ(3,3)

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
Real(dp), Intent(out) :: gP1LHm(3,32) 
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
Real(dp) :: MRPHmToHmetI(3,3),MRGHmToHmetI(3,3), MRPZHmToHmetI(3,3),MRGZHmToHmetI(3,3) 
Real(dp) :: MVPHmToHmetI(3,3) 
Real(dp) :: RMsqTreeHmToHmetI(3,3),RMsqWaveHmToHmetI(3,3),RMsqVertexHmToHmetI(3,3) 
Complex(dp) :: AmpTreeHmToHmetI(3,3),AmpWaveHmToHmetI(3,3)=(0._dp,0._dp),AmpVertexHmToHmetI(3,3)& 
 & ,AmpVertexIRosHmToHmetI(3,3),AmpVertexIRdrHmToHmetI(3,3), AmpSumHmToHmetI(3,3), AmpSum2HmToHmetI(3,3) 
Complex(dp) :: AmpTreeZHmToHmetI(3,3),AmpWaveZHmToHmetI(3,3),AmpVertexZHmToHmetI(3,3) 
Real(dp) :: AmpSqHmToHmetI(3,3),  AmpSqTreeHmToHmetI(3,3) 
Real(dp) :: MRPHmToetIcVWp(3),MRGHmToetIcVWp(3), MRPZHmToetIcVWp(3),MRGZHmToetIcVWp(3) 
Real(dp) :: MVPHmToetIcVWp(3) 
Real(dp) :: RMsqTreeHmToetIcVWp(3),RMsqWaveHmToetIcVWp(3),RMsqVertexHmToetIcVWp(3) 
Complex(dp) :: AmpTreeHmToetIcVWp(2,3),AmpWaveHmToetIcVWp(2,3)=(0._dp,0._dp),AmpVertexHmToetIcVWp(2,3)& 
 & ,AmpVertexIRosHmToetIcVWp(2,3),AmpVertexIRdrHmToetIcVWp(2,3), AmpSumHmToetIcVWp(2,3), AmpSum2HmToetIcVWp(2,3) 
Complex(dp) :: AmpTreeZHmToetIcVWp(2,3),AmpWaveZHmToetIcVWp(2,3),AmpVertexZHmToetIcVWp(2,3) 
Real(dp) :: AmpSqHmToetIcVWp(3),  AmpSqTreeHmToetIcVWp(3) 
Real(dp) :: MRPHmTocFdFu(3,3,3),MRGHmTocFdFu(3,3,3), MRPZHmTocFdFu(3,3,3),MRGZHmTocFdFu(3,3,3) 
Real(dp) :: MVPHmTocFdFu(3,3,3) 
Real(dp) :: RMsqTreeHmTocFdFu(3,3,3),RMsqWaveHmTocFdFu(3,3,3),RMsqVertexHmTocFdFu(3,3,3) 
Complex(dp) :: AmpTreeHmTocFdFu(2,3,3,3),AmpWaveHmTocFdFu(2,3,3,3)=(0._dp,0._dp),AmpVertexHmTocFdFu(2,3,3,3)& 
 & ,AmpVertexIRosHmTocFdFu(2,3,3,3),AmpVertexIRdrHmTocFdFu(2,3,3,3), AmpSumHmTocFdFu(2,3,3,3), AmpSum2HmTocFdFu(2,3,3,3) 
Complex(dp) :: AmpTreeZHmTocFdFu(2,3,3,3),AmpWaveZHmTocFdFu(2,3,3,3),AmpVertexZHmTocFdFu(2,3,3,3) 
Real(dp) :: AmpSqHmTocFdFu(3,3,3),  AmpSqTreeHmTocFdFu(3,3,3) 
Real(dp) :: MRPHmTocFeFv(3,3,3),MRGHmTocFeFv(3,3,3), MRPZHmTocFeFv(3,3,3),MRGZHmTocFeFv(3,3,3) 
Real(dp) :: MVPHmTocFeFv(3,3,3) 
Real(dp) :: RMsqTreeHmTocFeFv(3,3,3),RMsqWaveHmTocFeFv(3,3,3),RMsqVertexHmTocFeFv(3,3,3) 
Complex(dp) :: AmpTreeHmTocFeFv(2,3,3,3),AmpWaveHmTocFeFv(2,3,3,3)=(0._dp,0._dp),AmpVertexHmTocFeFv(2,3,3,3)& 
 & ,AmpVertexIRosHmTocFeFv(2,3,3,3),AmpVertexIRdrHmTocFeFv(2,3,3,3), AmpSumHmTocFeFv(2,3,3,3), AmpSum2HmTocFeFv(2,3,3,3) 
Complex(dp) :: AmpTreeZHmTocFeFv(2,3,3,3),AmpWaveZHmTocFeFv(2,3,3,3),AmpVertexZHmTocFeFv(2,3,3,3) 
Real(dp) :: AmpSqHmTocFeFv(3,3,3),  AmpSqTreeHmTocFeFv(3,3,3) 
Real(dp) :: MRPHmToHmhh(3,3,2),MRGHmToHmhh(3,3,2), MRPZHmToHmhh(3,3,2),MRGZHmToHmhh(3,3,2) 
Real(dp) :: MVPHmToHmhh(3,3,2) 
Real(dp) :: RMsqTreeHmToHmhh(3,3,2),RMsqWaveHmToHmhh(3,3,2),RMsqVertexHmToHmhh(3,3,2) 
Complex(dp) :: AmpTreeHmToHmhh(3,3,2),AmpWaveHmToHmhh(3,3,2)=(0._dp,0._dp),AmpVertexHmToHmhh(3,3,2)& 
 & ,AmpVertexIRosHmToHmhh(3,3,2),AmpVertexIRdrHmToHmhh(3,3,2), AmpSumHmToHmhh(3,3,2), AmpSum2HmToHmhh(3,3,2) 
Complex(dp) :: AmpTreeZHmToHmhh(3,3,2),AmpWaveZHmToHmhh(3,3,2),AmpVertexZHmToHmhh(3,3,2) 
Real(dp) :: AmpSqHmToHmhh(3,3,2),  AmpSqTreeHmToHmhh(3,3,2) 
Real(dp) :: MRPHmTohhcVWp(3,2),MRGHmTohhcVWp(3,2), MRPZHmTohhcVWp(3,2),MRGZHmTohhcVWp(3,2) 
Real(dp) :: MVPHmTohhcVWp(3,2) 
Real(dp) :: RMsqTreeHmTohhcVWp(3,2),RMsqWaveHmTohhcVWp(3,2),RMsqVertexHmTohhcVWp(3,2) 
Complex(dp) :: AmpTreeHmTohhcVWp(2,3,2),AmpWaveHmTohhcVWp(2,3,2)=(0._dp,0._dp),AmpVertexHmTohhcVWp(2,3,2)& 
 & ,AmpVertexIRosHmTohhcVWp(2,3,2),AmpVertexIRdrHmTohhcVWp(2,3,2), AmpSumHmTohhcVWp(2,3,2), AmpSum2HmTohhcVWp(2,3,2) 
Complex(dp) :: AmpTreeZHmTohhcVWp(2,3,2),AmpWaveZHmTohhcVWp(2,3,2),AmpVertexZHmTohhcVWp(2,3,2) 
Real(dp) :: AmpSqHmTohhcVWp(3,2),  AmpSqTreeHmTohhcVWp(3,2) 
Real(dp) :: MRPHmToHmVZ(3,3),MRGHmToHmVZ(3,3), MRPZHmToHmVZ(3,3),MRGZHmToHmVZ(3,3) 
Real(dp) :: MVPHmToHmVZ(3,3) 
Real(dp) :: RMsqTreeHmToHmVZ(3,3),RMsqWaveHmToHmVZ(3,3),RMsqVertexHmToHmVZ(3,3) 
Complex(dp) :: AmpTreeHmToHmVZ(2,3,3),AmpWaveHmToHmVZ(2,3,3)=(0._dp,0._dp),AmpVertexHmToHmVZ(2,3,3)& 
 & ,AmpVertexIRosHmToHmVZ(2,3,3),AmpVertexIRdrHmToHmVZ(2,3,3), AmpSumHmToHmVZ(2,3,3), AmpSum2HmToHmVZ(2,3,3) 
Complex(dp) :: AmpTreeZHmToHmVZ(2,3,3),AmpWaveZHmToHmVZ(2,3,3),AmpVertexZHmToHmVZ(2,3,3) 
Real(dp) :: AmpSqHmToHmVZ(3,3),  AmpSqTreeHmToHmVZ(3,3) 
Real(dp) :: MRPHmTocVWpVZ(3),MRGHmTocVWpVZ(3), MRPZHmTocVWpVZ(3),MRGZHmTocVWpVZ(3) 
Real(dp) :: MVPHmTocVWpVZ(3) 
Real(dp) :: RMsqTreeHmTocVWpVZ(3),RMsqWaveHmTocVWpVZ(3),RMsqVertexHmTocVWpVZ(3) 
Complex(dp) :: AmpTreeHmTocVWpVZ(2,3),AmpWaveHmTocVWpVZ(2,3)=(0._dp,0._dp),AmpVertexHmTocVWpVZ(2,3)& 
 & ,AmpVertexIRosHmTocVWpVZ(2,3),AmpVertexIRdrHmTocVWpVZ(2,3), AmpSumHmTocVWpVZ(2,3), AmpSum2HmTocVWpVZ(2,3) 
Complex(dp) :: AmpTreeZHmTocVWpVZ(2,3),AmpWaveZHmTocVWpVZ(2,3),AmpVertexZHmTocVWpVZ(2,3) 
Real(dp) :: AmpSqHmTocVWpVZ(3),  AmpSqTreeHmTocVWpVZ(3) 
Real(dp) :: MRPHmToHmVP(3,3),MRGHmToHmVP(3,3), MRPZHmToHmVP(3,3),MRGZHmToHmVP(3,3) 
Real(dp) :: MVPHmToHmVP(3,3) 
Real(dp) :: RMsqTreeHmToHmVP(3,3),RMsqWaveHmToHmVP(3,3),RMsqVertexHmToHmVP(3,3) 
Complex(dp) :: AmpTreeHmToHmVP(2,3,3),AmpWaveHmToHmVP(2,3,3)=(0._dp,0._dp),AmpVertexHmToHmVP(2,3,3)& 
 & ,AmpVertexIRosHmToHmVP(2,3,3),AmpVertexIRdrHmToHmVP(2,3,3), AmpSumHmToHmVP(2,3,3), AmpSum2HmToHmVP(2,3,3) 
Complex(dp) :: AmpTreeZHmToHmVP(2,3,3),AmpWaveZHmToHmVP(2,3,3),AmpVertexZHmToHmVP(2,3,3) 
Real(dp) :: AmpSqHmToHmVP(3,3),  AmpSqTreeHmToHmVP(3,3) 
Write(*,*) "Calculating one-loop decays of Hm " 
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
! Hm etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmToHmetI(cpletIHmcHm,MetI,MHm,MetI2,MHm2,            & 
& AmpTreeHmToHmetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmToHmetI(ZcpletIHmcHm,MetI,MHm,MetI2,MHm2,           & 
& AmpTreeHmToHmetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmetI(MLambda,em,gs,cpletIHmcHm,MetIOS,               & 
& MHmOS,MRPHmToHmetI,MRGHmToHmetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmetI(MLambda,em,gs,ZcpletIHmcHm,MetIOS,              & 
& MHmOS,MRPHmToHmetI,MRGHmToHmetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmToHmetI(MLambda,em,gs,cpletIHmcHm,MetI,MHm,             & 
& MRPHmToHmetI,MRGHmToHmetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmetI(MLambda,em,gs,ZcpletIHmcHm,MetI,MHm,            & 
& MRPHmToHmetI,MRGHmToHmetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmToHmetI(cpletIHmcHm,ctcpletIHmcHm,MetI,             & 
& MetI2,MHm,MHm2,ZfetI,ZfHm,AmpWaveHmToHmetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmToHmetI(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,             & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,     & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,     & 
& cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,          & 
& cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,cpletIHmVWpVZ1,            & 
& cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,AmpVertexHmToHmetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,             & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,              & 
& cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,            & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,   & 
& cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,            & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,         & 
& AmpVertexIRdrHmToHmetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,ZcpletIHmcHm,cpletIcHmcVWp,            & 
& cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,           & 
& cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,        & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,  & 
& cpletIhhHmcHm1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,        & 
& cplhhhhHmcHm1,cplHmHmcHmcHm1,AmpVertexIRosHmToHmetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,             & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,ZcpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,             & 
& cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,            & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,   & 
& cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,            & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,         & 
& AmpVertexIRosHmToHmetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,           & 
& cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,        & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,  & 
& cpletIhhHmcHm1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,        & 
& cplhhhhHmcHm1,cplHmHmcHmcHm1,AmpVertexIRosHmToHmetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,             & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,              & 
& cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,            & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,   & 
& cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,            & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,         & 
& AmpVertexIRosHmToHmetI)

 End if 
 End if 
AmpVertexHmToHmetI = AmpVertexHmToHmetI -  AmpVertexIRdrHmToHmetI! +  AmpVertexIRosHmToHmetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmToHmetI=0._dp 
AmpVertexZHmToHmetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToHmetI(gt2,:) = AmpWaveZHmToHmetI(gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHmToHmetI(gt1,:) 
AmpVertexZHmToHmetI(gt2,:)= AmpVertexZHmToHmetI(gt2,:) + ZRUZP(gt2,gt1)*AmpVertexHmToHmetI(gt1,:) 
 End Do 
End Do 
AmpWaveHmToHmetI=AmpWaveZHmToHmetI 
AmpVertexHmToHmetI= AmpVertexZHmToHmetI
! Final State 1 
AmpWaveZHmToHmetI=0._dp 
AmpVertexZHmToHmetI=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToHmetI(:,gt2) = AmpWaveZHmToHmetI(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveHmToHmetI(:,gt1) 
AmpVertexZHmToHmetI(:,gt2)= AmpVertexZHmToHmetI(:,gt2)+ZRUZP(gt2,gt1)*AmpVertexHmToHmetI(:,gt1) 
 End Do 
End Do 
AmpWaveHmToHmetI=AmpWaveZHmToHmetI 
AmpVertexHmToHmetI= AmpVertexZHmToHmetI
End if
If (ShiftIRdiv) Then 
AmpVertexHmToHmetI = AmpVertexHmToHmetI  +  AmpVertexIRosHmToHmetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->Hm etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmToHmetI = AmpTreeHmToHmetI 
 AmpSum2HmToHmetI = AmpTreeHmToHmetI + 2._dp*AmpWaveHmToHmetI + 2._dp*AmpVertexHmToHmetI  
Else 
 AmpSumHmToHmetI = AmpTreeHmToHmetI + AmpWaveHmToHmetI + AmpVertexHmToHmetI
 AmpSum2HmToHmetI = AmpTreeHmToHmetI + AmpWaveHmToHmetI + AmpVertexHmToHmetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmToHmetI = AmpTreeHmToHmetI
 AmpSum2HmToHmetI = AmpTreeHmToHmetI 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MHmOS(gt1).gt.(MHmOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MHm(gt2)+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2HmToHmetI = AmpTreeHmToHmetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MetIOS,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),MetI,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmToHmetI(gt1, gt2) 
  AmpSum2HmToHmetI = 2._dp*AmpWaveHmToHmetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MetIOS,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),MetI,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmToHmetI(gt1, gt2) 
  AmpSum2HmToHmetI = 2._dp*AmpVertexHmToHmetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MetIOS,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),MetI,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmToHmetI(gt1, gt2) 
  AmpSum2HmToHmetI = AmpTreeHmToHmetI + 2._dp*AmpWaveHmToHmetI + 2._dp*AmpVertexHmToHmetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MetIOS,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),MetI,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmToHmetI(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmToHmetI = AmpTreeHmToHmetI
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MetIOS,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
  AmpSqTreeHmToHmetI(gt1, gt2) = AmpSqHmToHmetI(gt1, gt2)  
  AmpSum2HmToHmetI = + 2._dp*AmpWaveHmToHmetI + 2._dp*AmpVertexHmToHmetI
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MetIOS,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
  AmpSqHmToHmetI(gt1, gt2) = AmpSqHmToHmetI(gt1, gt2) + AmpSqTreeHmToHmetI(gt1, gt2)  
Else  
  AmpSum2HmToHmetI = AmpTreeHmToHmetI
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),MetI,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
  AmpSqTreeHmToHmetI(gt1, gt2) = AmpSqHmToHmetI(gt1, gt2)  
  AmpSum2HmToHmetI = + 2._dp*AmpWaveHmToHmetI + 2._dp*AmpVertexHmToHmetI
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),MetI,AmpSumHmToHmetI(gt1, gt2),AmpSum2HmToHmetI(gt1, gt2),AmpSqHmToHmetI(gt1, gt2)) 
  AmpSqHmToHmetI(gt1, gt2) = AmpSqHmToHmetI(gt1, gt2) + AmpSqTreeHmToHmetI(gt1, gt2)  
End if  
Else  
  AmpSqHmToHmetI(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmToHmetI(gt1, gt2).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MHmOS(gt2),MetIOS,helfactor*AmpSqHmToHmetI(gt1, gt2))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),MHm(gt2),MetI,helfactor*AmpSqHmToHmetI(gt1, gt2))
End if 
If ((Abs(MRPHmToHmetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmToHmetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHmToHmetI(gt1, gt2) + MRGHmToHmetI(gt1, gt2)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHmToHmetI(gt1, gt2) + MRGHmToHmetI(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
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
! etI Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmToetIcVWp(cpletIcHmcVWp,MetI,MHm,MVWp,              & 
& MetI2,MHm2,MVWp2,AmpTreeHmToetIcVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmToetIcVWp(ZcpletIcHmcVWp,MetI,MHm,MVWp,             & 
& MetI2,MHm2,MVWp2,AmpTreeHmToetIcVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmToetIcVWp(MLambda,em,gs,cpletIcHmcVWp,MetIOS,           & 
& MHmOS,MVWpOS,MRPHmToetIcVWp,MRGHmToetIcVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToetIcVWp(MLambda,em,gs,ZcpletIcHmcVWp,MetIOS,          & 
& MHmOS,MVWpOS,MRPHmToetIcVWp,MRGHmToetIcVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmToetIcVWp(MLambda,em,gs,cpletIcHmcVWp,MetI,             & 
& MHm,MVWp,MRPHmToetIcVWp,MRGHmToetIcVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToetIcVWp(MLambda,em,gs,ZcpletIcHmcVWp,MetI,            & 
& MHm,MVWp,MRPHmToetIcVWp,MRGHmToetIcVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmToetIcVWp(cpletIcHmcVWp,ctcpletIcHmcVWp,            & 
& MetI,MetI2,MHm,MHm2,MVWp,MVWp2,ZfetI,ZfHm,ZfVWp,AmpWaveHmToetIcVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmToetIcVWp(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,         & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,AmpVertexHmToetIcVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,         & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,AmpVertexIRdrHmToetIcVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp(MAhOS,MetIOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,ZcpletIcHmcVWp,cplcFuFdcVWpL,            & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,        & 
& cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,       & 
& cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,              & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,& 
& cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRosHmToetIcVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,ZcpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,      & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,         & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,AmpVertexIRosHmToetIcVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp(MAhOS,MetIOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,             & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,        & 
& cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,       & 
& cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,              & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,& 
& cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRosHmToetIcVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,         & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,AmpVertexIRosHmToetIcVWp)

 End if 
 End if 
AmpVertexHmToetIcVWp = AmpVertexHmToetIcVWp -  AmpVertexIRdrHmToetIcVWp! +  AmpVertexIRosHmToetIcVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmToetIcVWp=0._dp 
AmpVertexZHmToetIcVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToetIcVWp(:,gt2) = AmpWaveZHmToetIcVWp(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveHmToetIcVWp(:,gt1) 
AmpVertexZHmToetIcVWp(:,gt2)= AmpVertexZHmToetIcVWp(:,gt2) + ZRUZP(gt2,gt1)*AmpVertexHmToetIcVWp(:,gt1) 
 End Do 
End Do 
AmpWaveHmToetIcVWp=AmpWaveZHmToetIcVWp 
AmpVertexHmToetIcVWp= AmpVertexZHmToetIcVWp
End if
If (ShiftIRdiv) Then 
AmpVertexHmToetIcVWp = AmpVertexHmToetIcVWp  +  AmpVertexIRosHmToetIcVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->etI conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmToetIcVWp = AmpTreeHmToetIcVWp 
 AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp + 2._dp*AmpWaveHmToetIcVWp + 2._dp*AmpVertexHmToetIcVWp  
Else 
 AmpSumHmToetIcVWp = AmpTreeHmToetIcVWp + AmpWaveHmToetIcVWp + AmpVertexHmToetIcVWp
 AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp + AmpWaveHmToetIcVWp + AmpVertexHmToetIcVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmToetIcVWp = AmpTreeHmToetIcVWp
 AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp 
End if 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MHmOS(gt1).gt.(MetIOS+MVWpOS))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MetI+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MetIOS,MVWpOS,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MetI,MVWp,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmToetIcVWp(gt1) 
  AmpSum2HmToetIcVWp = 2._dp*AmpWaveHmToetIcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MetIOS,MVWpOS,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MetI,MVWp,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmToetIcVWp(gt1) 
  AmpSum2HmToetIcVWp = 2._dp*AmpVertexHmToetIcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MetIOS,MVWpOS,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MetI,MVWp,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmToetIcVWp(gt1) 
  AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp + 2._dp*AmpWaveHmToetIcVWp + 2._dp*AmpVertexHmToetIcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MetIOS,MVWpOS,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MetI,MVWp,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmToetIcVWp(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp
  Call SquareAmp_StoSV(MHmOS(gt1),MetIOS,MVWpOS,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
  AmpSqTreeHmToetIcVWp(gt1) = AmpSqHmToetIcVWp(gt1)  
  AmpSum2HmToetIcVWp = + 2._dp*AmpWaveHmToetIcVWp + 2._dp*AmpVertexHmToetIcVWp
  Call SquareAmp_StoSV(MHmOS(gt1),MetIOS,MVWpOS,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
  AmpSqHmToetIcVWp(gt1) = AmpSqHmToetIcVWp(gt1) + AmpSqTreeHmToetIcVWp(gt1)  
Else  
  AmpSum2HmToetIcVWp = AmpTreeHmToetIcVWp
  Call SquareAmp_StoSV(MHm(gt1),MetI,MVWp,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
  AmpSqTreeHmToetIcVWp(gt1) = AmpSqHmToetIcVWp(gt1)  
  AmpSum2HmToetIcVWp = + 2._dp*AmpWaveHmToetIcVWp + 2._dp*AmpVertexHmToetIcVWp
  Call SquareAmp_StoSV(MHm(gt1),MetI,MVWp,AmpSumHmToetIcVWp(:,gt1),AmpSum2HmToetIcVWp(:,gt1),AmpSqHmToetIcVWp(gt1)) 
  AmpSqHmToetIcVWp(gt1) = AmpSqHmToetIcVWp(gt1) + AmpSqTreeHmToetIcVWp(gt1)  
End if  
Else  
  AmpSqHmToetIcVWp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmToetIcVWp(gt1).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MetIOS,MVWpOS,helfactor*AmpSqHmToetIcVWp(gt1))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),MetI,MVWp,helfactor*AmpSqHmToetIcVWp(gt1))
End if 
If ((Abs(MRPHmToetIcVWp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHmToetIcVWp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmToetIcVWp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHmToetIcVWp(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPHmToetIcVWp(gt1) + MRGHmToetIcVWp(gt1)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPHmToetIcVWp(gt1) + MRGHmToetIcVWp(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmTocFdFu(cplcFdFucHmL,cplcFdFucHmR,MFd,              & 
& MFu,MHm,MFd2,MFu2,MHm2,AmpTreeHmTocFdFu)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmTocFdFu(ZcplcFdFucHmL,ZcplcFdFucHmR,MFd,            & 
& MFu,MHm,MFd2,MFu2,MHm2,AmpTreeHmTocFdFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocFdFu(MLambda,em,gs,cplcFdFucHmL,cplcFdFucHmR,        & 
& MFdOS,MFuOS,MHmOS,MRPHmTocFdFu,MRGHmTocFdFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocFdFu(MLambda,em,gs,ZcplcFdFucHmL,ZcplcFdFucHmR,      & 
& MFdOS,MFuOS,MHmOS,MRPHmTocFdFu,MRGHmTocFdFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmTocFdFu(MLambda,em,gs,cplcFdFucHmL,cplcFdFucHmR,        & 
& MFd,MFu,MHm,MRPHmTocFdFu,MRGHmTocFdFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocFdFu(MLambda,em,gs,ZcplcFdFucHmL,ZcplcFdFucHmR,      & 
& MFd,MFu,MHm,MRPHmTocFdFu,MRGHmTocFdFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmTocFdFu(cplcFdFucHmL,cplcFdFucHmR,ctcplcFdFucHmL,   & 
& ctcplcFdFucHmR,MFd,MFd2,MFu,MFu2,MHm,MHm2,ZfDL,ZfDR,ZfHm,ZfUL,ZfUR,AmpWaveHmTocFdFu)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmTocFdFu(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexHmTocFdFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexIRdrHmTocFdFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,           & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,ZcplcFdFucHmL,ZcplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosHmTocFdFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,ZcplcFdFucHmL,           & 
& ZcplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,              & 
& cplcHmcVWpVZ,AmpVertexIRosHmTocFdFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,              & 
& cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,           & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,             & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosHmTocFdFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexIRosHmTocFdFu)

 End if 
 End if 
AmpVertexHmTocFdFu = AmpVertexHmTocFdFu -  AmpVertexIRdrHmTocFdFu! +  AmpVertexIRosHmTocFdFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmTocFdFu=0._dp 
AmpVertexZHmTocFdFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocFdFu(:,gt2,:,:) = AmpWaveZHmTocFdFu(:,gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHmTocFdFu(:,gt1,:,:) 
AmpVertexZHmTocFdFu(:,gt2,:,:)= AmpVertexZHmTocFdFu(:,gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHmTocFdFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveHmTocFdFu=AmpWaveZHmTocFdFu 
AmpVertexHmTocFdFu= AmpVertexZHmTocFdFu
! Final State 1 
AmpWaveZHmTocFdFu=0._dp 
AmpVertexZHmTocFdFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocFdFu(1,:,gt2,:) = AmpWaveZHmTocFdFu(1,:,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveHmTocFdFu(1,:,gt1,:) 
AmpVertexZHmTocFdFu(1,:,gt2,:)= AmpVertexZHmTocFdFu(1,:,gt2,:)+ZRUUd(gt2,gt1)*AmpVertexHmTocFdFu(1,:,gt1,:) 
AmpWaveZHmTocFdFu(2,:,gt2,:) = AmpWaveZHmTocFdFu(2,:,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveHmTocFdFu(2,:,gt1,:) 
AmpVertexZHmTocFdFu(2,:,gt2,:)= AmpVertexZHmTocFdFu(2,:,gt2,:)+ZRUVdc(gt2,gt1)*AmpVertexHmTocFdFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveHmTocFdFu=AmpWaveZHmTocFdFu 
AmpVertexHmTocFdFu= AmpVertexZHmTocFdFu
! Final State 2 
AmpWaveZHmTocFdFu=0._dp 
AmpVertexZHmTocFdFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocFdFu(1,:,:,gt2) = AmpWaveZHmTocFdFu(1,:,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveHmTocFdFu(1,:,:,gt1) 
AmpVertexZHmTocFdFu(1,:,:,gt2)= AmpVertexZHmTocFdFu(1,:,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexHmTocFdFu(1,:,:,gt1) 
AmpWaveZHmTocFdFu(2,:,:,gt2) = AmpWaveZHmTocFdFu(2,:,:,gt2)+ZRUUu(gt2,gt1)*AmpWaveHmTocFdFu(2,:,:,gt1) 
AmpVertexZHmTocFdFu(2,:,:,gt2)= AmpVertexZHmTocFdFu(2,:,:,gt2)+ZRUUu(gt2,gt1)*AmpVertexHmTocFdFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveHmTocFdFu=AmpWaveZHmTocFdFu 
AmpVertexHmTocFdFu= AmpVertexZHmTocFdFu
End if
If (ShiftIRdiv) Then 
AmpVertexHmTocFdFu = AmpVertexHmTocFdFu  +  AmpVertexIRosHmTocFdFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->bar[Fd] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmTocFdFu = AmpTreeHmTocFdFu 
 AmpSum2HmTocFdFu = AmpTreeHmTocFdFu + 2._dp*AmpWaveHmTocFdFu + 2._dp*AmpVertexHmTocFdFu  
Else 
 AmpSumHmTocFdFu = AmpTreeHmTocFdFu + AmpWaveHmTocFdFu + AmpVertexHmTocFdFu
 AmpSum2HmTocFdFu = AmpTreeHmTocFdFu + AmpWaveHmTocFdFu + AmpVertexHmTocFdFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmTocFdFu = AmpTreeHmTocFdFu
 AmpSum2HmTocFdFu = AmpTreeHmTocFdFu 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MHmOS(gt1).gt.(MFdOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MFd(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HmTocFdFu = AmpTreeHmTocFdFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFd(gt2),MFu(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmTocFdFu(gt1, gt2, gt3) 
  AmpSum2HmTocFdFu = 2._dp*AmpWaveHmTocFdFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFd(gt2),MFu(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmTocFdFu(gt1, gt2, gt3) 
  AmpSum2HmTocFdFu = 2._dp*AmpVertexHmTocFdFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFd(gt2),MFu(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmTocFdFu(gt1, gt2, gt3) 
  AmpSum2HmTocFdFu = AmpTreeHmTocFdFu + 2._dp*AmpWaveHmTocFdFu + 2._dp*AmpVertexHmTocFdFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFd(gt2),MFu(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmTocFdFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmTocFdFu = AmpTreeHmTocFdFu
  Call SquareAmp_StoFF(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
  AmpSqTreeHmTocFdFu(gt1, gt2, gt3) = AmpSqHmTocFdFu(gt1, gt2, gt3)  
  AmpSum2HmTocFdFu = + 2._dp*AmpWaveHmTocFdFu + 2._dp*AmpVertexHmTocFdFu
  Call SquareAmp_StoFF(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
  AmpSqHmTocFdFu(gt1, gt2, gt3) = AmpSqHmTocFdFu(gt1, gt2, gt3) + AmpSqTreeHmTocFdFu(gt1, gt2, gt3)  
Else  
  AmpSum2HmTocFdFu = AmpTreeHmTocFdFu
  Call SquareAmp_StoFF(MHm(gt1),MFd(gt2),MFu(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
  AmpSqTreeHmTocFdFu(gt1, gt2, gt3) = AmpSqHmTocFdFu(gt1, gt2, gt3)  
  AmpSum2HmTocFdFu = + 2._dp*AmpWaveHmTocFdFu + 2._dp*AmpVertexHmTocFdFu
  Call SquareAmp_StoFF(MHm(gt1),MFd(gt2),MFu(gt3),AmpSumHmTocFdFu(:,gt1, gt2, gt3),AmpSum2HmTocFdFu(:,gt1, gt2, gt3),AmpSqHmTocFdFu(gt1, gt2, gt3)) 
  AmpSqHmTocFdFu(gt1, gt2, gt3) = AmpSqHmTocFdFu(gt1, gt2, gt3) + AmpSqTreeHmTocFdFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHmTocFdFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqHmTocFdFu(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 3._dp*GammaTPS(MHmOS(gt1),MFdOS(gt2),MFuOS(gt3),helfactor*AmpSqHmTocFdFu(gt1, gt2, gt3))
Else 
  gP1LHm(gt1,i4) = 3._dp*GammaTPS(MHm(gt1),MFd(gt2),MFu(gt3),helfactor*AmpSqHmTocFdFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPHmTocFdFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHmTocFdFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmTocFdFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHmTocFdFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHmTocFdFu(gt1, gt2, gt3) + MRGHmTocFdFu(gt1, gt2, gt3)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHmTocFdFu(gt1, gt2, gt3) + MRGHmTocFdFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
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
! bar(Fe) Fv
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmTocFeFv(cplcFeFvcHmL,cplcFeFvcHmR,MFe,              & 
& MFv,MHm,MFe2,MFv2,MHm2,AmpTreeHmTocFeFv)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmTocFeFv(ZcplcFeFvcHmL,ZcplcFeFvcHmR,MFe,            & 
& MFv,MHm,MFe2,MFv2,MHm2,AmpTreeHmTocFeFv)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocFeFv(MLambda,em,gs,cplcFeFvcHmL,cplcFeFvcHmR,        & 
& MFeOS,MFvOS,MHmOS,MRPHmTocFeFv,MRGHmTocFeFv)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocFeFv(MLambda,em,gs,ZcplcFeFvcHmL,ZcplcFeFvcHmR,      & 
& MFeOS,MFvOS,MHmOS,MRPHmTocFeFv,MRGHmTocFeFv)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmTocFeFv(MLambda,em,gs,cplcFeFvcHmL,cplcFeFvcHmR,        & 
& MFe,MFv,MHm,MRPHmTocFeFv,MRGHmTocFeFv)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocFeFv(MLambda,em,gs,ZcplcFeFvcHmL,ZcplcFeFvcHmR,      & 
& MFe,MFv,MHm,MRPHmTocFeFv,MRGHmTocFeFv)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmTocFeFv(cplcFeFvcHmL,cplcFeFvcHmR,ctcplcFeFvcHmL,   & 
& ctcplcFeFvcHmR,MFe,MFe2,MFv,MFv2,MHm,MHm2,ZfEL,ZfER,ZfHm,ZfVL,AmpWaveHmTocFeFv)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmTocFeFv(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,             & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,cpletIcHmcVWp,           & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,    & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,             & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexHmTocFeFv)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRdrHmTocFeFv)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,      & 
& cplcFeFeetIR,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,             & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,ZcplcFeFvcHmL,             & 
& ZcplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,              & 
& cplcHmcVWpVZ,AmpVertexIRosHmTocFeFv)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,ZcplcFeFvcHmL,ZcplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,         & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosHmTocFeFv)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,      & 
& cplcFeFeetIR,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,             & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,               & 
& cplcHmcVWpVZ,AmpVertexIRosHmTocFeFv)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,AmpVertexIRosHmTocFeFv)

 End if 
 End if 
AmpVertexHmTocFeFv = AmpVertexHmTocFeFv -  AmpVertexIRdrHmTocFeFv! +  AmpVertexIRosHmTocFeFv ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmTocFeFv=0._dp 
AmpVertexZHmTocFeFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocFeFv(:,gt2,:,:) = AmpWaveZHmTocFeFv(:,gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHmTocFeFv(:,gt1,:,:) 
AmpVertexZHmTocFeFv(:,gt2,:,:)= AmpVertexZHmTocFeFv(:,gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHmTocFeFv(:,gt1,:,:) 
 End Do 
End Do 
AmpWaveHmTocFeFv=AmpWaveZHmTocFeFv 
AmpVertexHmTocFeFv= AmpVertexZHmTocFeFv
! Final State 1 
AmpWaveZHmTocFeFv=0._dp 
AmpVertexZHmTocFeFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocFeFv(1,:,gt2,:) = AmpWaveZHmTocFeFv(1,:,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveHmTocFeFv(1,:,gt1,:) 
AmpVertexZHmTocFeFv(1,:,gt2,:)= AmpVertexZHmTocFeFv(1,:,gt2,:)+ZRUUe(gt2,gt1)*AmpVertexHmTocFeFv(1,:,gt1,:) 
AmpWaveZHmTocFeFv(2,:,gt2,:) = AmpWaveZHmTocFeFv(2,:,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveHmTocFeFv(2,:,gt1,:) 
AmpVertexZHmTocFeFv(2,:,gt2,:)= AmpVertexZHmTocFeFv(2,:,gt2,:)+ZRUVec(gt2,gt1)*AmpVertexHmTocFeFv(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveHmTocFeFv=AmpWaveZHmTocFeFv 
AmpVertexHmTocFeFv= AmpVertexZHmTocFeFv
! Final State 2 
AmpWaveZHmTocFeFv=0._dp 
AmpVertexZHmTocFeFv=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocFeFv(1,:,:,gt2) = AmpWaveZHmTocFeFv(1,:,:,gt2)+ZRUVv(gt2,gt1)*AmpWaveHmTocFeFv(1,:,:,gt1) 
AmpVertexZHmTocFeFv(1,:,:,gt2)= AmpVertexZHmTocFeFv(1,:,:,gt2)+ZRUVv(gt2,gt1)*AmpVertexHmTocFeFv(1,:,:,gt1) 
AmpWaveZHmTocFeFv(2,:,:,gt2) = AmpWaveZHmTocFeFv(2,:,:,gt2)+ZRUVv(gt2,gt1)*AmpWaveHmTocFeFv(2,:,:,gt1) 
AmpVertexZHmTocFeFv(2,:,:,gt2)= AmpVertexZHmTocFeFv(2,:,:,gt2)+ZRUVv(gt2,gt1)*AmpVertexHmTocFeFv(2,:,:,gt1) 
 End Do 
End Do 
AmpWaveHmTocFeFv=AmpWaveZHmTocFeFv 
AmpVertexHmTocFeFv= AmpVertexZHmTocFeFv
End if
If (ShiftIRdiv) Then 
AmpVertexHmTocFeFv = AmpVertexHmTocFeFv  +  AmpVertexIRosHmTocFeFv
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->bar[Fe] Fv -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmTocFeFv = AmpTreeHmTocFeFv 
 AmpSum2HmTocFeFv = AmpTreeHmTocFeFv + 2._dp*AmpWaveHmTocFeFv + 2._dp*AmpVertexHmTocFeFv  
Else 
 AmpSumHmTocFeFv = AmpTreeHmTocFeFv + AmpWaveHmTocFeFv + AmpVertexHmTocFeFv
 AmpSum2HmTocFeFv = AmpTreeHmTocFeFv + AmpWaveHmTocFeFv + AmpVertexHmTocFeFv 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmTocFeFv = AmpTreeHmTocFeFv
 AmpSum2HmTocFeFv = AmpTreeHmTocFeFv 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MHmOS(gt1).gt.(MFeOS(gt2)+MFvOS(gt3)))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MFe(gt2)+MFv(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HmTocFeFv = AmpTreeHmTocFeFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFe(gt2),MFv(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmTocFeFv(gt1, gt2, gt3) 
  AmpSum2HmTocFeFv = 2._dp*AmpWaveHmTocFeFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFe(gt2),MFv(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmTocFeFv(gt1, gt2, gt3) 
  AmpSum2HmTocFeFv = 2._dp*AmpVertexHmTocFeFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFe(gt2),MFv(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmTocFeFv(gt1, gt2, gt3) 
  AmpSum2HmTocFeFv = AmpTreeHmTocFeFv + 2._dp*AmpWaveHmTocFeFv + 2._dp*AmpVertexHmTocFeFv
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MHm(gt1),MFe(gt2),MFv(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmTocFeFv(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmTocFeFv = AmpTreeHmTocFeFv
  Call SquareAmp_StoFF(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
  AmpSqTreeHmTocFeFv(gt1, gt2, gt3) = AmpSqHmTocFeFv(gt1, gt2, gt3)  
  AmpSum2HmTocFeFv = + 2._dp*AmpWaveHmTocFeFv + 2._dp*AmpVertexHmTocFeFv
  Call SquareAmp_StoFF(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
  AmpSqHmTocFeFv(gt1, gt2, gt3) = AmpSqHmTocFeFv(gt1, gt2, gt3) + AmpSqTreeHmTocFeFv(gt1, gt2, gt3)  
Else  
  AmpSum2HmTocFeFv = AmpTreeHmTocFeFv
  Call SquareAmp_StoFF(MHm(gt1),MFe(gt2),MFv(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
  AmpSqTreeHmTocFeFv(gt1, gt2, gt3) = AmpSqHmTocFeFv(gt1, gt2, gt3)  
  AmpSum2HmTocFeFv = + 2._dp*AmpWaveHmTocFeFv + 2._dp*AmpVertexHmTocFeFv
  Call SquareAmp_StoFF(MHm(gt1),MFe(gt2),MFv(gt3),AmpSumHmTocFeFv(:,gt1, gt2, gt3),AmpSum2HmTocFeFv(:,gt1, gt2, gt3),AmpSqHmTocFeFv(gt1, gt2, gt3)) 
  AmpSqHmTocFeFv(gt1, gt2, gt3) = AmpSqHmTocFeFv(gt1, gt2, gt3) + AmpSqTreeHmTocFeFv(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHmTocFeFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqHmTocFeFv(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MFeOS(gt2),MFvOS(gt3),helfactor*AmpSqHmTocFeFv(gt1, gt2, gt3))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),MFe(gt2),MFv(gt3),helfactor*AmpSqHmTocFeFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPHmTocFeFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHmTocFeFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmTocFeFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHmTocFeFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHmTocFeFv(gt1, gt2, gt3) + MRGHmTocFeFv(gt1, gt2, gt3)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHmTocFeFv(gt1, gt2, gt3) + MRGHmTocFeFv(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
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
! Hm hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmToHmhh(cplhhHmcHm,Mhh,MHm,Mhh2,MHm2,AmpTreeHmToHmhh)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmToHmhh(ZcplhhHmcHm,Mhh,MHm,Mhh2,MHm2,               & 
& AmpTreeHmToHmhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmhh(MLambda,em,gs,cplhhHmcHm,MhhOS,MHmOS,            & 
& MRPHmToHmhh,MRGHmToHmhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmhh(MLambda,em,gs,ZcplhhHmcHm,MhhOS,MHmOS,           & 
& MRPHmToHmhh,MRGHmToHmhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmToHmhh(MLambda,em,gs,cplhhHmcHm,Mhh,MHm,MRPHmToHmhh,    & 
& MRGHmToHmhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmhh(MLambda,em,gs,ZcplhhHmcHm,Mhh,MHm,               & 
& MRPHmToHmhh,MRGHmToHmhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmToHmhh(cplhhHmcHm,ctcplhhHmcHm,Mhh,Mhh2,            & 
& MHm,MHm2,Zfhh,ZfHm,AmpWaveHmToHmhh)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmToHmhh(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,              & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,           & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,             & 
& cplhhhhHmcHm1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,             & 
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexHmToHmhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,      & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,             & 
& cplhhhhHmcHm1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,             & 
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexIRdrHmToHmhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,        & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,          & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,               & 
& cplhhHmVWp,ZcplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,      & 
& cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,          & 
& cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cplhhhhHmcHm1,cplhhHmVPVWp1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,         & 
& cplHmcHmVZVZ1,AmpVertexIRosHmToHmhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,      & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,cplhhHmVWp,ZcplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,             & 
& cplhhhhHmcHm1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,             & 
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexIRosHmToHmhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,        & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,          & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,               & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,       & 
& cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,          & 
& cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cplhhhhHmcHm1,cplhhHmVPVWp1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,         & 
& cplHmcHmVZVZ1,AmpVertexIRosHmToHmhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,      & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,             & 
& cplhhhhHmcHm1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,             & 
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexIRosHmToHmhh)

 End if 
 End if 
AmpVertexHmToHmhh = AmpVertexHmToHmhh -  AmpVertexIRdrHmToHmhh! +  AmpVertexIRosHmToHmhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmToHmhh=0._dp 
AmpVertexZHmToHmhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToHmhh(gt2,:,:) = AmpWaveZHmToHmhh(gt2,:,:)+ZRUZP(gt2,gt1)*AmpWaveHmToHmhh(gt1,:,:) 
AmpVertexZHmToHmhh(gt2,:,:)= AmpVertexZHmToHmhh(gt2,:,:) + ZRUZP(gt2,gt1)*AmpVertexHmToHmhh(gt1,:,:) 
 End Do 
End Do 
AmpWaveHmToHmhh=AmpWaveZHmToHmhh 
AmpVertexHmToHmhh= AmpVertexZHmToHmhh
! Final State 1 
AmpWaveZHmToHmhh=0._dp 
AmpVertexZHmToHmhh=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToHmhh(:,gt2,:) = AmpWaveZHmToHmhh(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHmToHmhh(:,gt1,:) 
AmpVertexZHmToHmhh(:,gt2,:)= AmpVertexZHmToHmhh(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexHmToHmhh(:,gt1,:) 
 End Do 
End Do 
AmpWaveHmToHmhh=AmpWaveZHmToHmhh 
AmpVertexHmToHmhh= AmpVertexZHmToHmhh
! Final State 2 
AmpWaveZHmToHmhh=0._dp 
AmpVertexZHmToHmhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHmToHmhh(:,:,gt2) = AmpWaveZHmToHmhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveHmToHmhh(:,:,gt1) 
AmpVertexZHmToHmhh(:,:,gt2)= AmpVertexZHmToHmhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexHmToHmhh(:,:,gt1) 
 End Do 
End Do 
AmpWaveHmToHmhh=AmpWaveZHmToHmhh 
AmpVertexHmToHmhh= AmpVertexZHmToHmhh
End if
If (ShiftIRdiv) Then 
AmpVertexHmToHmhh = AmpVertexHmToHmhh  +  AmpVertexIRosHmToHmhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->Hm hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmToHmhh = AmpTreeHmToHmhh 
 AmpSum2HmToHmhh = AmpTreeHmToHmhh + 2._dp*AmpWaveHmToHmhh + 2._dp*AmpVertexHmToHmhh  
Else 
 AmpSumHmToHmhh = AmpTreeHmToHmhh + AmpWaveHmToHmhh + AmpVertexHmToHmhh
 AmpSum2HmToHmhh = AmpTreeHmToHmhh + AmpWaveHmToHmhh + AmpVertexHmToHmhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmToHmhh = AmpTreeHmToHmhh
 AmpSum2HmToHmhh = AmpTreeHmToHmhh 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
    Do gt3=1,2
If (((OSkinematics).and.(MHmOS(gt1).gt.(MHmOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MHm(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2HmToHmhh = AmpTreeHmToHmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),Mhh(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmToHmhh(gt1, gt2, gt3) 
  AmpSum2HmToHmhh = 2._dp*AmpWaveHmToHmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),Mhh(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmToHmhh(gt1, gt2, gt3) 
  AmpSum2HmToHmhh = 2._dp*AmpVertexHmToHmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),Mhh(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmToHmhh(gt1, gt2, gt3) 
  AmpSum2HmToHmhh = AmpTreeHmToHmhh + 2._dp*AmpWaveHmToHmhh + 2._dp*AmpVertexHmToHmhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),Mhh(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmToHmhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmToHmhh = AmpTreeHmToHmhh
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
  AmpSqTreeHmToHmhh(gt1, gt2, gt3) = AmpSqHmToHmhh(gt1, gt2, gt3)  
  AmpSum2HmToHmhh = + 2._dp*AmpWaveHmToHmhh + 2._dp*AmpVertexHmToHmhh
  Call SquareAmp_StoSS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
  AmpSqHmToHmhh(gt1, gt2, gt3) = AmpSqHmToHmhh(gt1, gt2, gt3) + AmpSqTreeHmToHmhh(gt1, gt2, gt3)  
Else  
  AmpSum2HmToHmhh = AmpTreeHmToHmhh
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),Mhh(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
  AmpSqTreeHmToHmhh(gt1, gt2, gt3) = AmpSqHmToHmhh(gt1, gt2, gt3)  
  AmpSum2HmToHmhh = + 2._dp*AmpWaveHmToHmhh + 2._dp*AmpVertexHmToHmhh
  Call SquareAmp_StoSS(MHm(gt1),MHm(gt2),Mhh(gt3),AmpSumHmToHmhh(gt1, gt2, gt3),AmpSum2HmToHmhh(gt1, gt2, gt3),AmpSqHmToHmhh(gt1, gt2, gt3)) 
  AmpSqHmToHmhh(gt1, gt2, gt3) = AmpSqHmToHmhh(gt1, gt2, gt3) + AmpSqTreeHmToHmhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqHmToHmhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmToHmhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MHmOS(gt2),MhhOS(gt3),helfactor*AmpSqHmToHmhh(gt1, gt2, gt3))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),MHm(gt2),Mhh(gt3),helfactor*AmpSqHmToHmhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPHmToHmhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmToHmhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPHmToHmhh(gt1, gt2, gt3) + MRGHmToHmhh(gt1, gt2, gt3)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPHmToHmhh(gt1, gt2, gt3) + MRGHmToHmhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
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
! hh Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmTohhcVWp(cplhhcHmcVWp,Mhh,MHm,MVWp,Mhh2,            & 
& MHm2,MVWp2,AmpTreeHmTohhcVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmTohhcVWp(ZcplhhcHmcVWp,Mhh,MHm,MVWp,Mhh2,           & 
& MHm2,MVWp2,AmpTreeHmTohhcVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmTohhcVWp(MLambda,em,gs,cplhhcHmcVWp,MhhOS,              & 
& MHmOS,MVWpOS,MRPHmTohhcVWp,MRGHmTohhcVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTohhcVWp(MLambda,em,gs,ZcplhhcHmcVWp,MhhOS,             & 
& MHmOS,MVWpOS,MRPHmTohhcVWp,MRGHmTohhcVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmTohhcVWp(MLambda,em,gs,cplhhcHmcVWp,Mhh,MHm,            & 
& MVWp,MRPHmTohhcVWp,MRGHmTohhcVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTohhcVWp(MLambda,em,gs,ZcplhhcHmcVWp,Mhh,               & 
& MHm,MVWp,MRPHmTohhcVWp,MRGHmTohhcVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmTohhcVWp(cplhhcHmcVWp,ctcplhhcHmcVWp,               & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,Zfhh,ZfHm,ZfVWp,AmpWaveHmTohhcVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmTohhcVWp(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,          & 
& cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,         & 
& cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,               & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,     & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,               & 
& cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexHmTohhcVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,         & 
& cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,               & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,     & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,               & 
& cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRdrHmTohhcVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,       & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,        & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,             & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,           & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,         & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,ZcplhhcHmcVWp,    & 
& cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,             & 
& cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,AmpVertexIRosHmTohhcVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,         & 
& cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,               & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,ZcplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,    & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,               & 
& cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRosHmTohhcVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,       & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,        & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,             & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,           & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,         & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,     & 
& cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,             & 
& cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,AmpVertexIRosHmTohhcVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,         & 
& cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,               & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,     & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,               & 
& cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRosHmTohhcVWp)

 End if 
 End if 
AmpVertexHmTohhcVWp = AmpVertexHmTohhcVWp -  AmpVertexIRdrHmTohhcVWp! +  AmpVertexIRosHmTohhcVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmTohhcVWp=0._dp 
AmpVertexZHmTohhcVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTohhcVWp(:,gt2,:) = AmpWaveZHmTohhcVWp(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHmTohhcVWp(:,gt1,:) 
AmpVertexZHmTohhcVWp(:,gt2,:)= AmpVertexZHmTohhcVWp(:,gt2,:) + ZRUZP(gt2,gt1)*AmpVertexHmTohhcVWp(:,gt1,:) 
 End Do 
End Do 
AmpWaveHmTohhcVWp=AmpWaveZHmTohhcVWp 
AmpVertexHmTohhcVWp= AmpVertexZHmTohhcVWp
! Final State 1 
AmpWaveZHmTohhcVWp=0._dp 
AmpVertexZHmTohhcVWp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZHmTohhcVWp(:,:,gt2) = AmpWaveZHmTohhcVWp(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWaveHmTohhcVWp(:,:,gt1) 
AmpVertexZHmTohhcVWp(:,:,gt2)= AmpVertexZHmTohhcVWp(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexHmTohhcVWp(:,:,gt1) 
 End Do 
End Do 
AmpWaveHmTohhcVWp=AmpWaveZHmTohhcVWp 
AmpVertexHmTohhcVWp= AmpVertexZHmTohhcVWp
End if
If (ShiftIRdiv) Then 
AmpVertexHmTohhcVWp = AmpVertexHmTohhcVWp  +  AmpVertexIRosHmTohhcVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->hh conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmTohhcVWp = AmpTreeHmTohhcVWp 
 AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp + 2._dp*AmpWaveHmTohhcVWp + 2._dp*AmpVertexHmTohhcVWp  
Else 
 AmpSumHmTohhcVWp = AmpTreeHmTohhcVWp + AmpWaveHmTohhcVWp + AmpVertexHmTohhcVWp
 AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp + AmpWaveHmTohhcVWp + AmpVertexHmTohhcVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmTohhcVWp = AmpTreeHmTohhcVWp
 AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MHmOS(gt1).gt.(MhhOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(Mhh(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MhhOS(gt2),MVWpOS,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),Mhh(gt2),MVWp,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmTohhcVWp(gt1, gt2) 
  AmpSum2HmTohhcVWp = 2._dp*AmpWaveHmTohhcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MhhOS(gt2),MVWpOS,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),Mhh(gt2),MVWp,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmTohhcVWp(gt1, gt2) 
  AmpSum2HmTohhcVWp = 2._dp*AmpVertexHmTohhcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MhhOS(gt2),MVWpOS,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),Mhh(gt2),MVWp,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmTohhcVWp(gt1, gt2) 
  AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp + 2._dp*AmpWaveHmTohhcVWp + 2._dp*AmpVertexHmTohhcVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MhhOS(gt2),MVWpOS,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),Mhh(gt2),MVWp,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmTohhcVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp
  Call SquareAmp_StoSV(MHmOS(gt1),MhhOS(gt2),MVWpOS,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
  AmpSqTreeHmTohhcVWp(gt1, gt2) = AmpSqHmTohhcVWp(gt1, gt2)  
  AmpSum2HmTohhcVWp = + 2._dp*AmpWaveHmTohhcVWp + 2._dp*AmpVertexHmTohhcVWp
  Call SquareAmp_StoSV(MHmOS(gt1),MhhOS(gt2),MVWpOS,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
  AmpSqHmTohhcVWp(gt1, gt2) = AmpSqHmTohhcVWp(gt1, gt2) + AmpSqTreeHmTohhcVWp(gt1, gt2)  
Else  
  AmpSum2HmTohhcVWp = AmpTreeHmTohhcVWp
  Call SquareAmp_StoSV(MHm(gt1),Mhh(gt2),MVWp,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
  AmpSqTreeHmTohhcVWp(gt1, gt2) = AmpSqHmTohhcVWp(gt1, gt2)  
  AmpSum2HmTohhcVWp = + 2._dp*AmpWaveHmTohhcVWp + 2._dp*AmpVertexHmTohhcVWp
  Call SquareAmp_StoSV(MHm(gt1),Mhh(gt2),MVWp,AmpSumHmTohhcVWp(:,gt1, gt2),AmpSum2HmTohhcVWp(:,gt1, gt2),AmpSqHmTohhcVWp(gt1, gt2)) 
  AmpSqHmTohhcVWp(gt1, gt2) = AmpSqHmTohhcVWp(gt1, gt2) + AmpSqTreeHmTohhcVWp(gt1, gt2)  
End if  
Else  
  AmpSqHmTohhcVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmTohhcVWp(gt1, gt2).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MhhOS(gt2),MVWpOS,helfactor*AmpSqHmTohhcVWp(gt1, gt2))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),Mhh(gt2),MVWp,helfactor*AmpSqHmTohhcVWp(gt1, gt2))
End if 
If ((Abs(MRPHmTohhcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmTohhcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmTohhcVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmTohhcVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPHmTohhcVWp(gt1, gt2) + MRGHmTohhcVWp(gt1, gt2)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPHmTohhcVWp(gt1, gt2) + MRGHmTohhcVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
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
! Hm VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmToHmVZ(cplHmcHmVZ,MHm,MVZ,MHm2,MVZ2,AmpTreeHmToHmVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmToHmVZ(ZcplHmcHmVZ,MHm,MVZ,MHm2,MVZ2,               & 
& AmpTreeHmToHmVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmVZ(MLambda,em,gs,cplHmcHmVZ,MHmOS,MVZOS,            & 
& MRPHmToHmVZ,MRGHmToHmVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmVZ(MLambda,em,gs,ZcplHmcHmVZ,MHmOS,MVZOS,           & 
& MRPHmToHmVZ,MRGHmToHmVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmToHmVZ(MLambda,em,gs,cplHmcHmVZ,MHm,MVZ,MRPHmToHmVZ,    & 
& MRGHmToHmVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmToHmVZ(MLambda,em,gs,ZcplHmcHmVZ,MHm,MVZ,               & 
& MRPHmToHmVZ,MRGHmToHmVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmToHmVZ(cplHmcHmVP,cplHmcHmVZ,ctcplHmcHmVP,          & 
& ctcplHmcHmVZ,MHm,MHm2,MVP,MVP2,MVZ,MVZ2,ZfHm,ZfVPVZ,ZfVZ,AmpWaveHmToHmVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmToHmVZ(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,              & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,       & 
& cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeHmL,              & 
& cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,               & 
& cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,              & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,            & 
& cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,         & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,   & 
& cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,            & 
& AmpVertexHmToHmVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,              & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,              & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,            & 
& cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,         & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,   & 
& cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,            & 
& AmpVertexIRdrHmToHmVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,              & 
& cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,     & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,      & 
& cplHmcHmVP,cplHmVWpVZ,ZcplHmcHmVZ,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,              & 
& cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,           & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,AmpVertexIRosHmToHmVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,              & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,              & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,            & 
& cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,ZcplHmcHmVZ,        & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,   & 
& cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,            & 
& AmpVertexIRosHmToHmVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,              & 
& cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,     & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,      & 
& cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,               & 
& cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,           & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,AmpVertexIRosHmToHmVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,              & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,              & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,            & 
& cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,         & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,   & 
& cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,            & 
& AmpVertexIRosHmToHmVZ)

 End if 
 End if 
AmpVertexHmToHmVZ = AmpVertexHmToHmVZ -  AmpVertexIRdrHmToHmVZ! +  AmpVertexIRosHmToHmVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmToHmVZ=0._dp 
AmpVertexZHmToHmVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToHmVZ(:,gt2,:) = AmpWaveZHmToHmVZ(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWaveHmToHmVZ(:,gt1,:) 
AmpVertexZHmToHmVZ(:,gt2,:)= AmpVertexZHmToHmVZ(:,gt2,:) + ZRUZP(gt2,gt1)*AmpVertexHmToHmVZ(:,gt1,:) 
 End Do 
End Do 
AmpWaveHmToHmVZ=AmpWaveZHmToHmVZ 
AmpVertexHmToHmVZ= AmpVertexZHmToHmVZ
! Final State 1 
AmpWaveZHmToHmVZ=0._dp 
AmpVertexZHmToHmVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmToHmVZ(:,:,gt2) = AmpWaveZHmToHmVZ(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveHmToHmVZ(:,:,gt1) 
AmpVertexZHmToHmVZ(:,:,gt2)= AmpVertexZHmToHmVZ(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexHmToHmVZ(:,:,gt1) 
 End Do 
End Do 
AmpWaveHmToHmVZ=AmpWaveZHmToHmVZ 
AmpVertexHmToHmVZ= AmpVertexZHmToHmVZ
End if
If (ShiftIRdiv) Then 
AmpVertexHmToHmVZ = AmpVertexHmToHmVZ  +  AmpVertexIRosHmToHmVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->Hm VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmToHmVZ = AmpTreeHmToHmVZ 
 AmpSum2HmToHmVZ = AmpTreeHmToHmVZ + 2._dp*AmpWaveHmToHmVZ + 2._dp*AmpVertexHmToHmVZ  
Else 
 AmpSumHmToHmVZ = AmpTreeHmToHmVZ + AmpWaveHmToHmVZ + AmpVertexHmToHmVZ
 AmpSum2HmToHmVZ = AmpTreeHmToHmVZ + AmpWaveHmToHmVZ + AmpVertexHmToHmVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmToHmVZ = AmpTreeHmToHmVZ
 AmpSum2HmToHmVZ = AmpTreeHmToHmVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MHmOS(gt1).gt.(MHmOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MHm(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2HmToHmVZ = AmpTreeHmToHmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),MVZOS,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVZ,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmToHmVZ(gt1, gt2) 
  AmpSum2HmToHmVZ = 2._dp*AmpWaveHmToHmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),MVZOS,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVZ,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmToHmVZ(gt1, gt2) 
  AmpSum2HmToHmVZ = 2._dp*AmpVertexHmToHmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),MVZOS,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVZ,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmToHmVZ(gt1, gt2) 
  AmpSum2HmToHmVZ = AmpTreeHmToHmVZ + 2._dp*AmpWaveHmToHmVZ + 2._dp*AmpVertexHmToHmVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),MVZOS,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVZ,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmToHmVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmToHmVZ = AmpTreeHmToHmVZ
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),MVZOS,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
  AmpSqTreeHmToHmVZ(gt1, gt2) = AmpSqHmToHmVZ(gt1, gt2)  
  AmpSum2HmToHmVZ = + 2._dp*AmpWaveHmToHmVZ + 2._dp*AmpVertexHmToHmVZ
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),MVZOS,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
  AmpSqHmToHmVZ(gt1, gt2) = AmpSqHmToHmVZ(gt1, gt2) + AmpSqTreeHmToHmVZ(gt1, gt2)  
Else  
  AmpSum2HmToHmVZ = AmpTreeHmToHmVZ
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVZ,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
  AmpSqTreeHmToHmVZ(gt1, gt2) = AmpSqHmToHmVZ(gt1, gt2)  
  AmpSum2HmToHmVZ = + 2._dp*AmpWaveHmToHmVZ + 2._dp*AmpVertexHmToHmVZ
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVZ,AmpSumHmToHmVZ(:,gt1, gt2),AmpSum2HmToHmVZ(:,gt1, gt2),AmpSqHmToHmVZ(gt1, gt2)) 
  AmpSqHmToHmVZ(gt1, gt2) = AmpSqHmToHmVZ(gt1, gt2) + AmpSqTreeHmToHmVZ(gt1, gt2)  
End if  
Else  
  AmpSqHmToHmVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmToHmVZ(gt1, gt2).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MHmOS(gt2),MVZOS,helfactor*AmpSqHmToHmVZ(gt1, gt2))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),MHm(gt2),MVZ,helfactor*AmpSqHmToHmVZ(gt1, gt2))
End if 
If ((Abs(MRPHmToHmVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmToHmVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPHmToHmVZ(gt1, gt2) + MRGHmToHmVZ(gt1, gt2)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPHmToHmVZ(gt1, gt2) + MRGHmToHmVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
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
! Conjg(VWp) VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_HmTocVWpVZ(cplcHmcVWpVZ,MHm,MVWp,MVZ,MHm2,            & 
& MVWp2,MVZ2,AmpTreeHmTocVWpVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_HmTocVWpVZ(ZcplcHmcVWpVZ,MHm,MVWp,MVZ,MHm2,           & 
& MVWp2,MVZ2,AmpTreeHmTocVWpVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocVWpVZ(MLambda,em,gs,cplcHmcVWpVZ,MHmOS,              & 
& MVWpOS,MVZOS,MRPHmTocVWpVZ,MRGHmTocVWpVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocVWpVZ(MLambda,em,gs,ZcplcHmcVWpVZ,MHmOS,             & 
& MVWpOS,MVZOS,MRPHmTocVWpVZ,MRGHmTocVWpVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_HmTocVWpVZ(MLambda,em,gs,cplcHmcVWpVZ,MHm,MVWp,           & 
& MVZ,MRPHmTocVWpVZ,MRGHmTocVWpVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_HmTocVWpVZ(MLambda,em,gs,ZcplcHmcVWpVZ,MHm,               & 
& MVWp,MVZ,MRPHmTocVWpVZ,MRGHmTocVWpVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmTocVWpVZ(cplcHmcVWpVP,cplcHmcVWpVZ,ctcplcHmcVWpVP,  & 
& ctcplcHmcVWpVZ,MHm,MHm2,MVP,MVP2,MVWp,MVWp2,MVZ,MVZ2,ZfHm,ZfVPVZ,ZfVWp,ZfVZ,           & 
& AmpWaveHmTocVWpVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmTocVWpVZ(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,    & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,         & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplFvFvVZL,              & 
& cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,cplcgAgWpcVWp,          & 
& cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,         & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,     & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,               & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,         & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,  & 
& AmpVertexHmTocVWpVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,      & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,  & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,         & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,  & 
& AmpVertexIRdrHmTocVWpVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,            & 
& cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,            & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,       & 
& cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,             & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,               & 
& cplcVWpVWpVZ,ZcplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,           & 
& cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,        & 
& cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRosHmTocVWpVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,      & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,ZcplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1, & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,         & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,  & 
& AmpVertexIRosHmTocVWpVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,            & 
& cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,            & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,       & 
& cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,             & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,               & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,            & 
& cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,        & 
& cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRosHmTocVWpVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,      & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,  & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,         & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,  & 
& AmpVertexIRosHmTocVWpVZ)

 End if 
 End if 
AmpVertexHmTocVWpVZ = AmpVertexHmTocVWpVZ -  AmpVertexIRdrHmTocVWpVZ! +  AmpVertexIRosHmTocVWpVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZHmTocVWpVZ=0._dp 
AmpVertexZHmTocVWpVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZHmTocVWpVZ(:,gt2) = AmpWaveZHmTocVWpVZ(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveHmTocVWpVZ(:,gt1) 
AmpVertexZHmTocVWpVZ(:,gt2)= AmpVertexZHmTocVWpVZ(:,gt2) + ZRUZP(gt2,gt1)*AmpVertexHmTocVWpVZ(:,gt1) 
 End Do 
End Do 
AmpWaveHmTocVWpVZ=AmpWaveZHmTocVWpVZ 
AmpVertexHmTocVWpVZ= AmpVertexZHmTocVWpVZ
End if
If (ShiftIRdiv) Then 
AmpVertexHmTocVWpVZ = AmpVertexHmTocVWpVZ  +  AmpVertexIRosHmTocVWpVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->conj[VWp] VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumHmTocVWpVZ = AmpTreeHmTocVWpVZ 
 AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ + 2._dp*AmpWaveHmTocVWpVZ + 2._dp*AmpVertexHmTocVWpVZ  
Else 
 AmpSumHmTocVWpVZ = AmpTreeHmTocVWpVZ + AmpWaveHmTocVWpVZ + AmpVertexHmTocVWpVZ
 AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ + AmpWaveHmTocVWpVZ + AmpVertexHmTocVWpVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmTocVWpVZ = AmpTreeHmTocVWpVZ
 AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ 
End if 
Do gt1=1,3
i4 = isave 
If (((OSkinematics).and.(MHmOS(gt1).gt.(MVWpOS+MVZOS))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MVWp+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHmOS(gt1),MVWpOS,MVZOS,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MHm(gt1),MVWp,MVZ,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqHmTocVWpVZ(gt1) 
  AmpSum2HmTocVWpVZ = 2._dp*AmpWaveHmTocVWpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHmOS(gt1),MVWpOS,MVZOS,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MHm(gt1),MVWp,MVZ,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqHmTocVWpVZ(gt1) 
  AmpSum2HmTocVWpVZ = 2._dp*AmpVertexHmTocVWpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHmOS(gt1),MVWpOS,MVZOS,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MHm(gt1),MVWp,MVZ,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqHmTocVWpVZ(gt1) 
  AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ + 2._dp*AmpWaveHmTocVWpVZ + 2._dp*AmpVertexHmTocVWpVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MHmOS(gt1),MVWpOS,MVZOS,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(MHm(gt1),MVWp,MVZ,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqHmTocVWpVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ
  Call SquareAmp_StoVV(MHmOS(gt1),MVWpOS,MVZOS,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
  AmpSqTreeHmTocVWpVZ(gt1) = AmpSqHmTocVWpVZ(gt1)  
  AmpSum2HmTocVWpVZ = + 2._dp*AmpWaveHmTocVWpVZ + 2._dp*AmpVertexHmTocVWpVZ
  Call SquareAmp_StoVV(MHmOS(gt1),MVWpOS,MVZOS,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
  AmpSqHmTocVWpVZ(gt1) = AmpSqHmTocVWpVZ(gt1) + AmpSqTreeHmTocVWpVZ(gt1)  
Else  
  AmpSum2HmTocVWpVZ = AmpTreeHmTocVWpVZ
  Call SquareAmp_StoVV(MHm(gt1),MVWp,MVZ,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
  AmpSqTreeHmTocVWpVZ(gt1) = AmpSqHmTocVWpVZ(gt1)  
  AmpSum2HmTocVWpVZ = + 2._dp*AmpWaveHmTocVWpVZ + 2._dp*AmpVertexHmTocVWpVZ
  Call SquareAmp_StoVV(MHm(gt1),MVWp,MVZ,AmpSumHmTocVWpVZ(:,gt1),AmpSum2HmTocVWpVZ(:,gt1),AmpSqHmTocVWpVZ(gt1)) 
  AmpSqHmTocVWpVZ(gt1) = AmpSqHmTocVWpVZ(gt1) + AmpSqTreeHmTocVWpVZ(gt1)  
End if  
Else  
  AmpSqHmTocVWpVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmTocVWpVZ(gt1).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 2._dp*GammaTPS(MHmOS(gt1),MVWpOS,MVZOS,helfactor*AmpSqHmTocVWpVZ(gt1))
Else 
  gP1LHm(gt1,i4) = 2._dp*GammaTPS(MHm(gt1),MVWp,MVZ,helfactor*AmpSqHmTocVWpVZ(gt1))
End if 
If ((Abs(MRPHmTocVWpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHmTocVWpVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPHmTocVWpVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGHmTocVWpVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPHmTocVWpVZ(gt1) + MRGHmTocVWpVZ(gt1)) 
  gP1LHm(gt1,i4) = gP1LHm(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPHmTocVWpVZ(gt1) + MRGHmTocVWpVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LHm(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.3) isave = i4 
End do
End If 
!---------------- 
! Hm VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_HmToHmVP(cplHmcHmVP,cplHmcHmVZ,ctcplHmcHmVP,          & 
& ctcplHmcHmVZ,MHmOS,MHm2OS,MVP,MVP2,ZfHm,ZfVP,ZfVZVP,AmpWaveHmToHmVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_HmToHmVP(cplHmcHmVP,cplHmcHmVZ,ctcplHmcHmVP,          & 
& ctcplHmcHmVZ,MHmOS,MHm2OS,MVP,MVP2,ZfHm,ZfVP,ZfVZVP,AmpWaveHmToHmVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_HmToHmVP(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,            & 
& MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,         & 
& Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,      & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhHmVPVWp1,cplAhcHmcVWpVP1,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,           & 
& cplhhcHmcVWpVP1,cplHmcHmVPVP1,cplHmcHmVPVZ1,AmpVertexHmToHmVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_HmToHmVP(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,            & 
& MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MFv2OS,         & 
& Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,      & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,cplcFdFdVPR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhHmVPVWp1,cplAhcHmcVWpVP1,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,           & 
& cplhhcHmcVWpVP1,cplHmcHmVPVP1,cplHmcHmVPVZ1,AmpVertexHmToHmVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_HmToHmVP(cplHmcHmVP,cplHmcHmVZ,ctcplHmcHmVP,          & 
& ctcplHmcHmVZ,MHm,MHm2,MVP,MVP2,ZfHm,ZfVP,ZfVZVP,AmpWaveHmToHmVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_HmToHmVP(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,              & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,cplcFdFdVPR,cplFvFeHmL,cplFvFeHmR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVP,cplcgWCgWCVP,cplcgZgWCcHm,cplcgWCgZHm,           & 
& cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhHmVPVWp1,cplAhcHmcVWpVP1,       & 
& cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,cplHmcHmVPVP1,           & 
& cplHmcHmVPVZ1,AmpVertexHmToHmVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Hm->Hm VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumHmToHmVP = 0._dp 
 AmpSum2HmToHmVP = 0._dp  
Else 
 AmpSumHmToHmVP = AmpVertexHmToHmVP + AmpWaveHmToHmVP
 AmpSum2HmToHmVP = AmpVertexHmToHmVP + AmpWaveHmToHmVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MHmOS(gt1).gt.(MHmOS(gt2)+0.))).or.((.not.OSkinematics).and.(MHm(gt1).gt.(MHm(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MHmOS(gt1),MHmOS(gt2),0._dp,AmpSumHmToHmVP(:,gt1, gt2),AmpSum2HmToHmVP(:,gt1, gt2),AmpSqHmToHmVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(MHm(gt1),MHm(gt2),MVP,AmpSumHmToHmVP(:,gt1, gt2),AmpSum2HmToHmVP(:,gt1, gt2),AmpSqHmToHmVP(gt1, gt2)) 
End if  
Else  
  AmpSqHmToHmVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqHmToHmVP(gt1, gt2).le.0._dp) Then 
  gP1LHm(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHmOS(gt1),MHmOS(gt2),0._dp,helfactor*AmpSqHmToHmVP(gt1, gt2))
Else 
  gP1LHm(gt1,i4) = 1._dp*GammaTPS(MHm(gt1),MHm(gt2),MVP,helfactor*AmpSqHmToHmVP(gt1, gt2))
End if 
If ((Abs(MRPHmToHmVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGHmToHmVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LHm(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_Hm

End Module Wrapper_OneLoopDecay_Hm_radinuZeeHB
