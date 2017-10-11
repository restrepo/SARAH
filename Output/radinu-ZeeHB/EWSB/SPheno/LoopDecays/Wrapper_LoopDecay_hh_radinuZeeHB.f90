! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_hh_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_hh_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_hh(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,              & 
& MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,            & 
& MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,               & 
& lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,               & 
& Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,               & 
& dYh,dmH2,dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,               & 
& dlam8,dlamh,dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,               & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,              & 
& ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhetI1,           & 
& cplAhAhAhhh1,cplAhAhcVWpVWp1,cplAhAhetI,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhh,        & 
& cplAhAhhhhh1,cplAhAhHmcHm1,cplAhAhVZVZ1,cplAhcHmcVWp,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,  & 
& cplAhetIetI,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhh,cplAhetIhhhh1,cplAhetIHmcHm1,    & 
& cplAhhhhh,cplAhhhhhhh1,cplAhhhHmcHm1,cplAhhhVZ,cplAhHmcHm,cplAhHmVPVWp1,               & 
& cplAhHmVWp,cplAhHmVWpVZ1,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgAgWCVWp,cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgAHm,cplcgWCgWCAh,cplcgWCgWCetI,       & 
& cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZHm,cplcgWpgAVWp,         & 
& cplcgWpgWpAh,cplcgWpgWpetI,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWpgZcHm,        & 
& cplcgWpgZVWp,cplcgZgAhh,cplcgZgWCcHm,cplcgZgWCVWp,cplcgZgWpcVWp,cplcgZgWpHm,           & 
& cplcgZgZhh,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,          & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,   & 
& cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,      & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cpletIcHmcVWp,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,     & 
& cpletIetIcVWpVWp1,cpletIetIetI,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhh,           & 
& cpletIetIhhhh1,cpletIetIHmcHm1,cpletIetIVZVZ1,cpletIhhhh,cpletIhhhhhh1,cpletIhhHmcHm1, & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVPVWp1,cpletIHmVWp,cpletIHmVWpVZ1,cplFvFecVWpL,         & 
& cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcHmcVWpVP1, & 
& cplhhcHmcVWpVZ1,cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,cplhhhhhhhh1,cplhhhhHmcHm1,     & 
& cplhhhhVZVZ1,cplhhHmcHm,cplhhHmVPVWp1,cplhhHmVWp,cplhhHmVWpVZ1,cplhhVZVZ,              & 
& cplHmcHmcVWpVWp1,cplHmcHmVP,cplHmcHmVPVP1,cplHmcHmVPVZ1,cplHmcHmVZ,cplHmcHmVZVZ1,      & 
& cplHmHmcHmcHm1,cplHmVPVWp,cplHmVWpVZ,ctcplAhAhhh,ctcplAhetIhh,ctcplAhhhhh,             & 
& ctcplAhhhVZ,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,     & 
& ctcplcFuFuhhR,ctcpletIetIhh,ctcpletIhhhh,ctcpletIhhVZ,ctcplhhcVWpVWp,ctcplhhhhhh,      & 
& ctcplhhHmcHm,ctcplhhHmVWp,ctcplhhVZVZ,GcplhhHmcHm,GcplHmVPVWp,GosZcplhhHmcHm,          & 
& GosZcplHmVPVWp,GZcplhhHmcHm,GZcplHmVPVWp,ZcplAhAhhh,ZcplAhetIhh,ZcplAhhhhh,            & 
& ZcplAhhhVZ,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFuFuhhL,           & 
& ZcplcFuFuhhR,ZcpletIetIhh,ZcpletIhhhh,ZcpletIhhVZ,ZcplhhcVWpVWp,Zcplhhhhhh,            & 
& ZcplhhHmcHm,ZcplhhHmVWp,ZcplhhVZVZ,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,          & 
& ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1Lhh)

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

Complex(dp),Intent(in) :: cplAhAhAh,cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1(2),cplAhAhcVWpVWp1,cplAhAhetI,      & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhh(2),cplAhAhhhhh1(2,2),cplAhAhHmcHm1(3,3),     & 
& cplAhAhVZVZ1,cplAhcHmcVWp(3),cplAhcHmcVWpVP1(3),cplAhcHmcVWpVZ1(3),cplAhetIetI,        & 
& cplAhetIetIetI1,cplAhetIetIhh1(2),cplAhetIhh(2),cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3),& 
& cplAhhhhh(2,2),cplAhhhhhhh1(2,2,2),cplAhhhHmcHm1(2,3,3),cplAhhhVZ(2),cplAhHmcHm(3,3),  & 
& cplAhHmVPVWp1(3),cplAhHmVWp(3),cplAhHmVWpVZ1(3),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),     & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),             & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFdFuVWpL(3,3),            & 
& cplcFdFuVWpR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),             & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),             & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),               & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),  & 
& cplcFuFuVZR(3,3),cplcgAgWCVWp,cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgAHm(3),              & 
& cplcgWCgWCAh,cplcgWCgWCetI,cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcVWp,    & 
& cplcgWCgZHm(3),cplcgWpgAVWp,cplcgWpgWpAh,cplcgWpgWpetI,cplcgWpgWphh(2),cplcgWpgWpVP,   & 
& cplcgWpgWpVZ,cplcgWpgZcHm(3),cplcgWpgZVWp,cplcgZgAhh(2),cplcgZgWCcHm(3),               & 
& cplcgZgWCVWp,cplcgZgWpcVWp,cplcgZgWpHm(3),cplcgZgZhh(2),cplcHmcVWpVP(3),               & 
& cplcHmcVWpVZ(3),cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,           & 
& cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,      & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,      & 
& cplcVWpVWpVZVZ3Q,cpletIcHmcVWp(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),             & 
& cpletIetIcVWpVWp1,cpletIetIetI,cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhh(2),     & 
& cpletIetIhhhh1(2,2),cpletIetIHmcHm1(3,3),cpletIetIVZVZ1,cpletIhhhh(2,2),               & 
& cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3),cpletIhhVZ(2),cpletIHmcHm(3,3),             & 
& cpletIHmVPVWp1(3),cpletIHmVWp(3),cpletIHmVWpVZ1(3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),& 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhcHmcVWp(2,3), & 
& cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),cplhhcVWpVWp(2),cplhhhhcVWpVWp1(2,2),        & 
& cplhhhhhh(2,2,2),cplhhhhhhhh1(2,2,2,2),cplhhhhHmcHm1(2,2,3,3),cplhhhhVZVZ1(2,2),       & 
& cplhhHmcHm(2,3,3),cplhhHmVPVWp1(2,3),cplhhHmVWp(2,3),cplhhHmVWpVZ1(2,3),               & 
& cplhhVZVZ(2),cplHmcHmcVWpVWp1(3,3),cplHmcHmVP(3,3),cplHmcHmVPVP1(3,3),cplHmcHmVPVZ1(3,3),& 
& cplHmcHmVZ(3,3),cplHmcHmVZVZ1(3,3),cplHmHmcHmcHm1(3,3,3,3),cplHmVPVWp(3),              & 
& cplHmVWpVZ(3),ctcplAhAhhh(2),ctcplAhetIhh(2),ctcplAhhhhh(2,2),ctcplAhhhVZ(2),          & 
& ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2),ctcplcFeFehhL(3,3,2),ctcplcFeFehhR(3,3,2)

Complex(dp),Intent(in) :: ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2),ctcpletIetIhh(2),ctcpletIhhhh(2,2),          & 
& ctcpletIhhVZ(2),ctcplhhcVWpVWp(2),ctcplhhhhhh(2,2,2),ctcplhhHmcHm(2,3,3),              & 
& ctcplhhHmVWp(2,3),ctcplhhVZVZ(2),GcplhhHmcHm(2,3,3),GcplHmVPVWp(3),GosZcplhhHmcHm(2,3,3),& 
& GosZcplHmVPVWp(3),GZcplhhHmcHm(2,3,3),GZcplHmVPVWp(3),ZcplAhAhhh(2),ZcplAhetIhh(2),    & 
& ZcplAhhhhh(2,2),ZcplAhhhVZ(2),ZcplcFdFdhhL(3,3,2),ZcplcFdFdhhR(3,3,2),ZcplcFeFehhL(3,3,2),& 
& ZcplcFeFehhR(3,3,2),ZcplcFuFuhhL(3,3,2),ZcplcFuFuhhR(3,3,2),ZcpletIetIhh(2),           & 
& ZcpletIhhhh(2,2),ZcpletIhhVZ(2),ZcplhhcVWpVWp(2),Zcplhhhhhh(2,2,2),ZcplhhHmcHm(2,3,3), & 
& ZcplhhHmVWp(2,3),ZcplhhVZVZ(2)

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
Real(dp), Intent(out) :: gP1Lhh(2,60) 
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
Real(dp) :: MRPhhToetIetI(2),MRGhhToetIetI(2), MRPZhhToetIetI(2),MRGZhhToetIetI(2) 
Real(dp) :: MVPhhToetIetI(2) 
Real(dp) :: RMsqTreehhToetIetI(2),RMsqWavehhToetIetI(2),RMsqVertexhhToetIetI(2) 
Complex(dp) :: AmpTreehhToetIetI(2),AmpWavehhToetIetI(2)=(0._dp,0._dp),AmpVertexhhToetIetI(2)& 
 & ,AmpVertexIRoshhToetIetI(2),AmpVertexIRdrhhToetIetI(2), AmpSumhhToetIetI(2), AmpSum2hhToetIetI(2) 
Complex(dp) :: AmpTreeZhhToetIetI(2),AmpWaveZhhToetIetI(2),AmpVertexZhhToetIetI(2) 
Real(dp) :: AmpSqhhToetIetI(2),  AmpSqTreehhToetIetI(2) 
Real(dp) :: MRPhhTohhetI(2,2),MRGhhTohhetI(2,2), MRPZhhTohhetI(2,2),MRGZhhTohhetI(2,2) 
Real(dp) :: MVPhhTohhetI(2,2) 
Real(dp) :: RMsqTreehhTohhetI(2,2),RMsqWavehhTohhetI(2,2),RMsqVertexhhTohhetI(2,2) 
Complex(dp) :: AmpTreehhTohhetI(2,2),AmpWavehhTohhetI(2,2)=(0._dp,0._dp),AmpVertexhhTohhetI(2,2)& 
 & ,AmpVertexIRoshhTohhetI(2,2),AmpVertexIRdrhhTohhetI(2,2), AmpSumhhTohhetI(2,2), AmpSum2hhTohhetI(2,2) 
Complex(dp) :: AmpTreeZhhTohhetI(2,2),AmpWaveZhhTohhetI(2,2),AmpVertexZhhTohhetI(2,2) 
Real(dp) :: AmpSqhhTohhetI(2,2),  AmpSqTreehhTohhetI(2,2) 
Real(dp) :: MRPhhToetIVZ(2),MRGhhToetIVZ(2), MRPZhhToetIVZ(2),MRGZhhToetIVZ(2) 
Real(dp) :: MVPhhToetIVZ(2) 
Real(dp) :: RMsqTreehhToetIVZ(2),RMsqWavehhToetIVZ(2),RMsqVertexhhToetIVZ(2) 
Complex(dp) :: AmpTreehhToetIVZ(2,2),AmpWavehhToetIVZ(2,2)=(0._dp,0._dp),AmpVertexhhToetIVZ(2,2)& 
 & ,AmpVertexIRoshhToetIVZ(2,2),AmpVertexIRdrhhToetIVZ(2,2), AmpSumhhToetIVZ(2,2), AmpSum2hhToetIVZ(2,2) 
Complex(dp) :: AmpTreeZhhToetIVZ(2,2),AmpWaveZhhToetIVZ(2,2),AmpVertexZhhToetIVZ(2,2) 
Real(dp) :: AmpSqhhToetIVZ(2),  AmpSqTreehhToetIVZ(2) 
Real(dp) :: MRPhhTocFdFd(2,3,3),MRGhhTocFdFd(2,3,3), MRPZhhTocFdFd(2,3,3),MRGZhhTocFdFd(2,3,3) 
Real(dp) :: MVPhhTocFdFd(2,3,3) 
Real(dp) :: RMsqTreehhTocFdFd(2,3,3),RMsqWavehhTocFdFd(2,3,3),RMsqVertexhhTocFdFd(2,3,3) 
Complex(dp) :: AmpTreehhTocFdFd(2,2,3,3),AmpWavehhTocFdFd(2,2,3,3)=(0._dp,0._dp),AmpVertexhhTocFdFd(2,2,3,3)& 
 & ,AmpVertexIRoshhTocFdFd(2,2,3,3),AmpVertexIRdrhhTocFdFd(2,2,3,3), AmpSumhhTocFdFd(2,2,3,3), AmpSum2hhTocFdFd(2,2,3,3) 
Complex(dp) :: AmpTreeZhhTocFdFd(2,2,3,3),AmpWaveZhhTocFdFd(2,2,3,3),AmpVertexZhhTocFdFd(2,2,3,3) 
Real(dp) :: AmpSqhhTocFdFd(2,3,3),  AmpSqTreehhTocFdFd(2,3,3) 
Real(dp) :: MRPhhTocFeFe(2,3,3),MRGhhTocFeFe(2,3,3), MRPZhhTocFeFe(2,3,3),MRGZhhTocFeFe(2,3,3) 
Real(dp) :: MVPhhTocFeFe(2,3,3) 
Real(dp) :: RMsqTreehhTocFeFe(2,3,3),RMsqWavehhTocFeFe(2,3,3),RMsqVertexhhTocFeFe(2,3,3) 
Complex(dp) :: AmpTreehhTocFeFe(2,2,3,3),AmpWavehhTocFeFe(2,2,3,3)=(0._dp,0._dp),AmpVertexhhTocFeFe(2,2,3,3)& 
 & ,AmpVertexIRoshhTocFeFe(2,2,3,3),AmpVertexIRdrhhTocFeFe(2,2,3,3), AmpSumhhTocFeFe(2,2,3,3), AmpSum2hhTocFeFe(2,2,3,3) 
Complex(dp) :: AmpTreeZhhTocFeFe(2,2,3,3),AmpWaveZhhTocFeFe(2,2,3,3),AmpVertexZhhTocFeFe(2,2,3,3) 
Real(dp) :: AmpSqhhTocFeFe(2,3,3),  AmpSqTreehhTocFeFe(2,3,3) 
Real(dp) :: MRPhhTocFuFu(2,3,3),MRGhhTocFuFu(2,3,3), MRPZhhTocFuFu(2,3,3),MRGZhhTocFuFu(2,3,3) 
Real(dp) :: MVPhhTocFuFu(2,3,3) 
Real(dp) :: RMsqTreehhTocFuFu(2,3,3),RMsqWavehhTocFuFu(2,3,3),RMsqVertexhhTocFuFu(2,3,3) 
Complex(dp) :: AmpTreehhTocFuFu(2,2,3,3),AmpWavehhTocFuFu(2,2,3,3)=(0._dp,0._dp),AmpVertexhhTocFuFu(2,2,3,3)& 
 & ,AmpVertexIRoshhTocFuFu(2,2,3,3),AmpVertexIRdrhhTocFuFu(2,2,3,3), AmpSumhhTocFuFu(2,2,3,3), AmpSum2hhTocFuFu(2,2,3,3) 
Complex(dp) :: AmpTreeZhhTocFuFu(2,2,3,3),AmpWaveZhhTocFuFu(2,2,3,3),AmpVertexZhhTocFuFu(2,2,3,3) 
Real(dp) :: AmpSqhhTocFuFu(2,3,3),  AmpSqTreehhTocFuFu(2,3,3) 
Real(dp) :: MRPhhTohhhh(2,2,2),MRGhhTohhhh(2,2,2), MRPZhhTohhhh(2,2,2),MRGZhhTohhhh(2,2,2) 
Real(dp) :: MVPhhTohhhh(2,2,2) 
Real(dp) :: RMsqTreehhTohhhh(2,2,2),RMsqWavehhTohhhh(2,2,2),RMsqVertexhhTohhhh(2,2,2) 
Complex(dp) :: AmpTreehhTohhhh(2,2,2),AmpWavehhTohhhh(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhhh(2,2,2)& 
 & ,AmpVertexIRoshhTohhhh(2,2,2),AmpVertexIRdrhhTohhhh(2,2,2), AmpSumhhTohhhh(2,2,2), AmpSum2hhTohhhh(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhhh(2,2,2),AmpWaveZhhTohhhh(2,2,2),AmpVertexZhhTohhhh(2,2,2) 
Real(dp) :: AmpSqhhTohhhh(2,2,2),  AmpSqTreehhTohhhh(2,2,2) 
Real(dp) :: MRPhhToHmVWp(2,3),MRGhhToHmVWp(2,3), MRPZhhToHmVWp(2,3),MRGZhhToHmVWp(2,3) 
Real(dp) :: MVPhhToHmVWp(2,3) 
Real(dp) :: RMsqTreehhToHmVWp(2,3),RMsqWavehhToHmVWp(2,3),RMsqVertexhhToHmVWp(2,3) 
Complex(dp) :: AmpTreehhToHmVWp(2,2,3),AmpWavehhToHmVWp(2,2,3)=(0._dp,0._dp),AmpVertexhhToHmVWp(2,2,3)& 
 & ,AmpVertexIRoshhToHmVWp(2,2,3),AmpVertexIRdrhhToHmVWp(2,2,3), AmpSumhhToHmVWp(2,2,3), AmpSum2hhToHmVWp(2,2,3) 
Complex(dp) :: AmpTreeZhhToHmVWp(2,2,3),AmpWaveZhhToHmVWp(2,2,3),AmpVertexZhhToHmVWp(2,2,3) 
Real(dp) :: AmpSqhhToHmVWp(2,3),  AmpSqTreehhToHmVWp(2,3) 
Real(dp) :: MRPhhTocHmHm(2,3,3),MRGhhTocHmHm(2,3,3), MRPZhhTocHmHm(2,3,3),MRGZhhTocHmHm(2,3,3) 
Real(dp) :: MVPhhTocHmHm(2,3,3) 
Real(dp) :: RMsqTreehhTocHmHm(2,3,3),RMsqWavehhTocHmHm(2,3,3),RMsqVertexhhTocHmHm(2,3,3) 
Complex(dp) :: AmpTreehhTocHmHm(2,3,3),AmpWavehhTocHmHm(2,3,3)=(0._dp,0._dp),AmpVertexhhTocHmHm(2,3,3)& 
 & ,AmpVertexIRoshhTocHmHm(2,3,3),AmpVertexIRdrhhTocHmHm(2,3,3), AmpSumhhTocHmHm(2,3,3), AmpSum2hhTocHmHm(2,3,3) 
Complex(dp) :: AmpTreeZhhTocHmHm(2,3,3),AmpWaveZhhTocHmHm(2,3,3),AmpVertexZhhTocHmHm(2,3,3) 
Real(dp) :: AmpSqhhTocHmHm(2,3,3),  AmpSqTreehhTocHmHm(2,3,3) 
Real(dp) :: MRPhhTocVWpVWp(2),MRGhhTocVWpVWp(2), MRPZhhTocVWpVWp(2),MRGZhhTocVWpVWp(2) 
Real(dp) :: MVPhhTocVWpVWp(2) 
Real(dp) :: RMsqTreehhTocVWpVWp(2),RMsqWavehhTocVWpVWp(2),RMsqVertexhhTocVWpVWp(2) 
Complex(dp) :: AmpTreehhTocVWpVWp(2,2),AmpWavehhTocVWpVWp(2,2)=(0._dp,0._dp),AmpVertexhhTocVWpVWp(2,2)& 
 & ,AmpVertexIRoshhTocVWpVWp(2,2),AmpVertexIRdrhhTocVWpVWp(2,2), AmpSumhhTocVWpVWp(2,2), AmpSum2hhTocVWpVWp(2,2) 
Complex(dp) :: AmpTreeZhhTocVWpVWp(2,2),AmpWaveZhhTocVWpVWp(2,2),AmpVertexZhhTocVWpVWp(2,2) 
Real(dp) :: AmpSqhhTocVWpVWp(2),  AmpSqTreehhTocVWpVWp(2) 
Real(dp) :: MRPhhToVZVZ(2),MRGhhToVZVZ(2), MRPZhhToVZVZ(2),MRGZhhToVZVZ(2) 
Real(dp) :: MVPhhToVZVZ(2) 
Real(dp) :: RMsqTreehhToVZVZ(2),RMsqWavehhToVZVZ(2),RMsqVertexhhToVZVZ(2) 
Complex(dp) :: AmpTreehhToVZVZ(2,2),AmpWavehhToVZVZ(2,2)=(0._dp,0._dp),AmpVertexhhToVZVZ(2,2)& 
 & ,AmpVertexIRoshhToVZVZ(2,2),AmpVertexIRdrhhToVZVZ(2,2), AmpSumhhToVZVZ(2,2), AmpSum2hhToVZVZ(2,2) 
Complex(dp) :: AmpTreeZhhToVZVZ(2,2),AmpWaveZhhToVZVZ(2,2),AmpVertexZhhToVZVZ(2,2) 
Real(dp) :: AmpSqhhToVZVZ(2),  AmpSqTreehhToVZVZ(2) 
Real(dp) :: MRPhhToetIVP(2),MRGhhToetIVP(2), MRPZhhToetIVP(2),MRGZhhToetIVP(2) 
Real(dp) :: MVPhhToetIVP(2) 
Real(dp) :: RMsqTreehhToetIVP(2),RMsqWavehhToetIVP(2),RMsqVertexhhToetIVP(2) 
Complex(dp) :: AmpTreehhToetIVP(2,2),AmpWavehhToetIVP(2,2)=(0._dp,0._dp),AmpVertexhhToetIVP(2,2)& 
 & ,AmpVertexIRoshhToetIVP(2,2),AmpVertexIRdrhhToetIVP(2,2), AmpSumhhToetIVP(2,2), AmpSum2hhToetIVP(2,2) 
Complex(dp) :: AmpTreeZhhToetIVP(2,2),AmpWaveZhhToetIVP(2,2),AmpVertexZhhToetIVP(2,2) 
Real(dp) :: AmpSqhhToetIVP(2),  AmpSqTreehhToetIVP(2) 
Real(dp) :: MRPhhToFvFv(2,3,3),MRGhhToFvFv(2,3,3), MRPZhhToFvFv(2,3,3),MRGZhhToFvFv(2,3,3) 
Real(dp) :: MVPhhToFvFv(2,3,3) 
Real(dp) :: RMsqTreehhToFvFv(2,3,3),RMsqWavehhToFvFv(2,3,3),RMsqVertexhhToFvFv(2,3,3) 
Complex(dp) :: AmpTreehhToFvFv(2,2,3,3),AmpWavehhToFvFv(2,2,3,3)=(0._dp,0._dp),AmpVertexhhToFvFv(2,2,3,3)& 
 & ,AmpVertexIRoshhToFvFv(2,2,3,3),AmpVertexIRdrhhToFvFv(2,2,3,3), AmpSumhhToFvFv(2,2,3,3), AmpSum2hhToFvFv(2,2,3,3) 
Complex(dp) :: AmpTreeZhhToFvFv(2,2,3,3),AmpWaveZhhToFvFv(2,2,3,3),AmpVertexZhhToFvFv(2,2,3,3) 
Real(dp) :: AmpSqhhToFvFv(2,3,3),  AmpSqTreehhToFvFv(2,3,3) 
Real(dp) :: MRPhhTohhVP(2,2),MRGhhTohhVP(2,2), MRPZhhTohhVP(2,2),MRGZhhTohhVP(2,2) 
Real(dp) :: MVPhhTohhVP(2,2) 
Real(dp) :: RMsqTreehhTohhVP(2,2),RMsqWavehhTohhVP(2,2),RMsqVertexhhTohhVP(2,2) 
Complex(dp) :: AmpTreehhTohhVP(2,2,2),AmpWavehhTohhVP(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhVP(2,2,2)& 
 & ,AmpVertexIRoshhTohhVP(2,2,2),AmpVertexIRdrhhTohhVP(2,2,2), AmpSumhhTohhVP(2,2,2), AmpSum2hhTohhVP(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhVP(2,2,2),AmpWaveZhhTohhVP(2,2,2),AmpVertexZhhTohhVP(2,2,2) 
Real(dp) :: AmpSqhhTohhVP(2,2),  AmpSqTreehhTohhVP(2,2) 
Real(dp) :: MRPhhTohhVZ(2,2),MRGhhTohhVZ(2,2), MRPZhhTohhVZ(2,2),MRGZhhTohhVZ(2,2) 
Real(dp) :: MVPhhTohhVZ(2,2) 
Real(dp) :: RMsqTreehhTohhVZ(2,2),RMsqWavehhTohhVZ(2,2),RMsqVertexhhTohhVZ(2,2) 
Complex(dp) :: AmpTreehhTohhVZ(2,2,2),AmpWavehhTohhVZ(2,2,2)=(0._dp,0._dp),AmpVertexhhTohhVZ(2,2,2)& 
 & ,AmpVertexIRoshhTohhVZ(2,2,2),AmpVertexIRdrhhTohhVZ(2,2,2), AmpSumhhTohhVZ(2,2,2), AmpSum2hhTohhVZ(2,2,2) 
Complex(dp) :: AmpTreeZhhTohhVZ(2,2,2),AmpWaveZhhTohhVZ(2,2,2),AmpVertexZhhTohhVZ(2,2,2) 
Real(dp) :: AmpSqhhTohhVZ(2,2),  AmpSqTreehhTohhVZ(2,2) 
Real(dp) :: MRPhhToVGVG(2),MRGhhToVGVG(2), MRPZhhToVGVG(2),MRGZhhToVGVG(2) 
Real(dp) :: MVPhhToVGVG(2) 
Real(dp) :: RMsqTreehhToVGVG(2),RMsqWavehhToVGVG(2),RMsqVertexhhToVGVG(2) 
Complex(dp) :: AmpTreehhToVGVG(2,2),AmpWavehhToVGVG(2,2)=(0._dp,0._dp),AmpVertexhhToVGVG(2,2)& 
 & ,AmpVertexIRoshhToVGVG(2,2),AmpVertexIRdrhhToVGVG(2,2), AmpSumhhToVGVG(2,2), AmpSum2hhToVGVG(2,2) 
Complex(dp) :: AmpTreeZhhToVGVG(2,2),AmpWaveZhhToVGVG(2,2),AmpVertexZhhToVGVG(2,2) 
Real(dp) :: AmpSqhhToVGVG(2),  AmpSqTreehhToVGVG(2) 
Real(dp) :: MRPhhToVPVP(2),MRGhhToVPVP(2), MRPZhhToVPVP(2),MRGZhhToVPVP(2) 
Real(dp) :: MVPhhToVPVP(2) 
Real(dp) :: RMsqTreehhToVPVP(2),RMsqWavehhToVPVP(2),RMsqVertexhhToVPVP(2) 
Complex(dp) :: AmpTreehhToVPVP(2,2),AmpWavehhToVPVP(2,2)=(0._dp,0._dp),AmpVertexhhToVPVP(2,2)& 
 & ,AmpVertexIRoshhToVPVP(2,2),AmpVertexIRdrhhToVPVP(2,2), AmpSumhhToVPVP(2,2), AmpSum2hhToVPVP(2,2) 
Complex(dp) :: AmpTreeZhhToVPVP(2,2),AmpWaveZhhToVPVP(2,2),AmpVertexZhhToVPVP(2,2) 
Real(dp) :: AmpSqhhToVPVP(2),  AmpSqTreehhToVPVP(2) 
Real(dp) :: MRPhhToVPVZ(2),MRGhhToVPVZ(2), MRPZhhToVPVZ(2),MRGZhhToVPVZ(2) 
Real(dp) :: MVPhhToVPVZ(2) 
Real(dp) :: RMsqTreehhToVPVZ(2),RMsqWavehhToVPVZ(2),RMsqVertexhhToVPVZ(2) 
Complex(dp) :: AmpTreehhToVPVZ(2,2),AmpWavehhToVPVZ(2,2)=(0._dp,0._dp),AmpVertexhhToVPVZ(2,2)& 
 & ,AmpVertexIRoshhToVPVZ(2,2),AmpVertexIRdrhhToVPVZ(2,2), AmpSumhhToVPVZ(2,2), AmpSum2hhToVPVZ(2,2) 
Complex(dp) :: AmpTreeZhhToVPVZ(2,2),AmpWaveZhhToVPVZ(2,2),AmpVertexZhhToVPVZ(2,2) 
Real(dp) :: AmpSqhhToVPVZ(2),  AmpSqTreehhToVPVZ(2) 
Write(*,*) "Calculating one-loop decays of hh " 
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
isave = 5

If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! etI etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhToetIetI(cpletIetIhh,MetI,Mhh,MetI2,Mhh2,           & 
& AmpTreehhToetIetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhToetIetI(ZcpletIetIhh,MetI,Mhh,MetI2,               & 
& Mhh2,AmpTreehhToetIetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhToetIetI(MLambda,em,gs,cpletIetIhh,MetIOS,              & 
& MhhOS,MRPhhToetIetI,MRGhhToetIetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToetIetI(MLambda,em,gs,ZcpletIetIhh,MetIOS,             & 
& MhhOS,MRPhhToetIetI,MRGhhToetIetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhToetIetI(MLambda,em,gs,cpletIetIhh,MetI,Mhh,            & 
& MRPhhToetIetI,MRGhhToetIetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToetIetI(MLambda,em,gs,ZcpletIetIhh,MetI,               & 
& Mhh,MRPhhToetIetI,MRGhhToetIetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhToetIetI(cpletIetIhh,ctcpletIetIhh,MetI,            & 
& MetI2,Mhh,Mhh2,ZfetI,Zfhh,AmpWavehhToetIetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,            & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,          & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexhhToetIetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,             & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRdrhhToetIetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,ZcpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,            & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhetIetI1,    & 
& cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cpletIetIetIetI1,           & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,cpletIetIcVWpVWp1,cpletIetIVZVZ1,       & 
& cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRoshhToetIetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,             & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,ZcpletIetIhh,cplcFdFdetIL,     & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRoshhToetIetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhetIetI1,    & 
& cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cpletIetIetIetI1,           & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,cpletIetIcVWpVWp1,cpletIetIVZVZ1,       & 
& cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRoshhToetIetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,             & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRoshhToetIetI)

 End if 
 End if 
AmpVertexhhToetIetI = AmpVertexhhToetIetI -  AmpVertexIRdrhhToetIetI! +  AmpVertexIRoshhToetIetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToetIetI=0._dp 
AmpVertexZhhToetIetI=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToetIetI(gt2) = AmpWaveZhhToetIetI(gt2)+ZRUZH(gt2,gt1)*AmpWavehhToetIetI(gt1) 
AmpVertexZhhToetIetI(gt2)= AmpVertexZhhToetIetI(gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToetIetI(gt1) 
 End Do 
End Do 
AmpWavehhToetIetI=AmpWaveZhhToetIetI 
AmpVertexhhToetIetI= AmpVertexZhhToetIetI
End if
If (ShiftIRdiv) Then 
AmpVertexhhToetIetI = AmpVertexhhToetIetI  +  AmpVertexIRoshhToetIetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->etI etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToetIetI = AmpTreehhToetIetI 
 AmpSum2hhToetIetI = AmpTreehhToetIetI + 2._dp*AmpWavehhToetIetI + 2._dp*AmpVertexhhToetIetI  
Else 
 AmpSumhhToetIetI = AmpTreehhToetIetI + AmpWavehhToetIetI + AmpVertexhhToetIetI
 AmpSum2hhToetIetI = AmpTreehhToetIetI + AmpWavehhToetIetI + AmpVertexhhToetIetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToetIetI = AmpTreehhToetIetI
 AmpSum2hhToetIetI = AmpTreehhToetIetI 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MetIOS+MetIOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MetI+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToetIetI = AmpTreehhToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MetIOS,MetIOS,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MetI,MetI,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToetIetI(gt1) 
  AmpSum2hhToetIetI = 2._dp*AmpWavehhToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MetIOS,MetIOS,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MetI,MetI,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToetIetI(gt1) 
  AmpSum2hhToetIetI = 2._dp*AmpVertexhhToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MetIOS,MetIOS,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MetI,MetI,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToetIetI(gt1) 
  AmpSum2hhToetIetI = AmpTreehhToetIetI + 2._dp*AmpWavehhToetIetI + 2._dp*AmpVertexhhToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MetIOS,MetIOS,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MetI,MetI,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToetIetI(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToetIetI = AmpTreehhToetIetI
  Call SquareAmp_StoSS(MhhOS(gt1),MetIOS,MetIOS,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
  AmpSqTreehhToetIetI(gt1) = AmpSqhhToetIetI(gt1)  
  AmpSum2hhToetIetI = + 2._dp*AmpWavehhToetIetI + 2._dp*AmpVertexhhToetIetI
  Call SquareAmp_StoSS(MhhOS(gt1),MetIOS,MetIOS,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
  AmpSqhhToetIetI(gt1) = AmpSqhhToetIetI(gt1) + AmpSqTreehhToetIetI(gt1)  
Else  
  AmpSum2hhToetIetI = AmpTreehhToetIetI
  Call SquareAmp_StoSS(Mhh(gt1),MetI,MetI,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
  AmpSqTreehhToetIetI(gt1) = AmpSqhhToetIetI(gt1)  
  AmpSum2hhToetIetI = + 2._dp*AmpWavehhToetIetI + 2._dp*AmpVertexhhToetIetI
  Call SquareAmp_StoSS(Mhh(gt1),MetI,MetI,AmpSumhhToetIetI(gt1),AmpSum2hhToetIetI(gt1),AmpSqhhToetIetI(gt1)) 
  AmpSqhhToetIetI(gt1) = AmpSqhhToetIetI(gt1) + AmpSqTreehhToetIetI(gt1)  
End if  
Else  
  AmpSqhhToetIetI(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToetIetI(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MetIOS,MetIOS,helfactor*AmpSqhhToetIetI(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MetI,MetI,helfactor*AmpSqhhToetIetI(gt1))
End if 
If ((Abs(MRPhhToetIetI(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToetIetI(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToetIetI(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToetIetI(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToetIetI(gt1) + MRGhhToetIetI(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhToetIetI(gt1) + MRGhhToetIetI(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTohhetI(cpletIhhhh,MetI,Mhh,MetI2,Mhh2,             & 
& AmpTreehhTohhetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTohhetI(ZcpletIhhhh,MetI,Mhh,MetI2,Mhh2,            & 
& AmpTreehhTohhetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTohhetI(MLambda,em,gs,cpletIhhhh,MetIOS,MhhOS,          & 
& MRPhhTohhetI,MRGhhTohhetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTohhetI(MLambda,em,gs,ZcpletIhhhh,MetIOS,               & 
& MhhOS,MRPhhTohhetI,MRGhhTohhetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTohhetI(MLambda,em,gs,cpletIhhhh,MetI,Mhh,              & 
& MRPhhTohhetI,MRGhhTohhetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTohhetI(MLambda,em,gs,ZcpletIhhhh,MetI,Mhh,             & 
& MRPhhTohhetI,MRGhhTohhetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTohhetI(cpletIhhhh,ctcpletIhhhh,MetI,               & 
& MetI2,Mhh,Mhh2,ZfetI,Zfhh,AmpWavehhTohhetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,             & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,          & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexhhTohhetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRdrhhTohhetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,ZcpletIhhhh,        & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplAhAhetIhh1,               & 
& cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,cpletIetIhhhh1, & 
& cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRoshhTohhetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,ZcpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRoshhTohhetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplAhAhetIhh1,               & 
& cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,cpletIetIhhhh1, & 
& cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRoshhTohhetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRoshhTohhetI)

 End if 
 End if 
AmpVertexhhTohhetI = AmpVertexhhTohhetI -  AmpVertexIRdrhhTohhetI! +  AmpVertexIRoshhTohhetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhetI=0._dp 
AmpVertexZhhTohhetI=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhetI(gt2,:) = AmpWaveZhhTohhetI(gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhetI(gt1,:) 
AmpVertexZhhTohhetI(gt2,:)= AmpVertexZhhTohhetI(gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhetI(gt1,:) 
 End Do 
End Do 
AmpWavehhTohhetI=AmpWaveZhhTohhetI 
AmpVertexhhTohhetI= AmpVertexZhhTohhetI
! Final State 1 
AmpWaveZhhTohhetI=0._dp 
AmpVertexZhhTohhetI=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhetI(:,gt2) = AmpWaveZhhTohhetI(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTohhetI(:,gt1) 
AmpVertexZhhTohhetI(:,gt2)= AmpVertexZhhTohhetI(:,gt2)+ZRUZH(gt2,gt1)*AmpVertexhhTohhetI(:,gt1) 
 End Do 
End Do 
AmpWavehhTohhetI=AmpWaveZhhTohhetI 
AmpVertexhhTohhetI= AmpVertexZhhTohhetI
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhetI = AmpVertexhhTohhetI  +  AmpVertexIRoshhTohhetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhetI = AmpTreehhTohhetI 
 AmpSum2hhTohhetI = AmpTreehhTohhetI + 2._dp*AmpWavehhTohhetI + 2._dp*AmpVertexhhTohhetI  
Else 
 AmpSumhhTohhetI = AmpTreehhTohhetI + AmpWavehhTohhetI + AmpVertexhhTohhetI
 AmpSum2hhTohhetI = AmpTreehhTohhetI + AmpWavehhTohhetI + AmpVertexhhTohhetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhetI = AmpTreehhTohhetI
 AmpSum2hhTohhetI = AmpTreehhTohhetI 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhTohhetI = AmpTreehhTohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MetIOS,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MetI,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhetI(gt1, gt2) 
  AmpSum2hhTohhetI = 2._dp*AmpWavehhTohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MetIOS,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MetI,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhetI(gt1, gt2) 
  AmpSum2hhTohhetI = 2._dp*AmpVertexhhTohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MetIOS,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MetI,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhetI(gt1, gt2) 
  AmpSum2hhTohhetI = AmpTreehhTohhetI + 2._dp*AmpWavehhTohhetI + 2._dp*AmpVertexhhTohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MetIOS,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MetI,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhetI(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhetI = AmpTreehhTohhetI
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MetIOS,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
  AmpSqTreehhTohhetI(gt1, gt2) = AmpSqhhTohhetI(gt1, gt2)  
  AmpSum2hhTohhetI = + 2._dp*AmpWavehhTohhetI + 2._dp*AmpVertexhhTohhetI
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MetIOS,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
  AmpSqhhTohhetI(gt1, gt2) = AmpSqhhTohhetI(gt1, gt2) + AmpSqTreehhTohhetI(gt1, gt2)  
Else  
  AmpSum2hhTohhetI = AmpTreehhTohhetI
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MetI,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
  AmpSqTreehhTohhetI(gt1, gt2) = AmpSqhhTohhetI(gt1, gt2)  
  AmpSum2hhTohhetI = + 2._dp*AmpWavehhTohhetI + 2._dp*AmpVertexhhTohhetI
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),MetI,AmpSumhhTohhetI(gt1, gt2),AmpSum2hhTohhetI(gt1, gt2),AmpSqhhTohhetI(gt1, gt2)) 
  AmpSqhhTohhetI(gt1, gt2) = AmpSqhhTohhetI(gt1, gt2) + AmpSqTreehhTohhetI(gt1, gt2)  
End if  
Else  
  AmpSqhhTohhetI(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhetI(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MetIOS,helfactor*AmpSqhhTohhetI(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MetI,helfactor*AmpSqhhTohhetI(gt1, gt2))
End if 
If ((Abs(MRPhhTohhetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTohhetI(gt1, gt2) + MRGhhTohhetI(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTohhetI(gt1, gt2) + MRGhhTohhetI(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! etI VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhToetIVZ(cpletIhhVZ,MetI,Mhh,MVZ,MetI2,              & 
& Mhh2,MVZ2,AmpTreehhToetIVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhToetIVZ(ZcpletIhhVZ,MetI,Mhh,MVZ,MetI2,             & 
& Mhh2,MVZ2,AmpTreehhToetIVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhToetIVZ(MLambda,em,gs,cpletIhhVZ,MetIOS,MhhOS,          & 
& MVZOS,MRPhhToetIVZ,MRGhhToetIVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToetIVZ(MLambda,em,gs,ZcpletIhhVZ,MetIOS,               & 
& MhhOS,MVZOS,MRPhhToetIVZ,MRGhhToetIVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhToetIVZ(MLambda,em,gs,cpletIhhVZ,MetI,Mhh,              & 
& MVZ,MRPhhToetIVZ,MRGhhToetIVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToetIVZ(MLambda,em,gs,ZcpletIhhVZ,MetI,Mhh,             & 
& MVZ,MRPhhToetIVZ,MRGhhToetIVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhToetIVZ(cpletIhhVZ,ctcpletIhhVZ,MetI,               & 
& MetI2,Mhh,Mhh2,MVZ,MVZ2,ZfetI,Zfhh,ZfVZ,AmpWavehhToetIVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToetIVZ(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,             & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,          & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexhhToetIVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexIRdrhhToetIVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& ZcpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIetIVZVZ1,           & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,            & 
& AmpVertexIRoshhToetIVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,ZcpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexIRoshhToetIVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIetIVZVZ1,           & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,            & 
& AmpVertexIRoshhToetIVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexIRoshhToetIVZ)

 End if 
 End if 
AmpVertexhhToetIVZ = AmpVertexhhToetIVZ -  AmpVertexIRdrhhToetIVZ! +  AmpVertexIRoshhToetIVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToetIVZ=0._dp 
AmpVertexZhhToetIVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToetIVZ(:,gt2) = AmpWaveZhhToetIVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToetIVZ(:,gt1) 
AmpVertexZhhToetIVZ(:,gt2)= AmpVertexZhhToetIVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToetIVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToetIVZ=AmpWaveZhhToetIVZ 
AmpVertexhhToetIVZ= AmpVertexZhhToetIVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToetIVZ = AmpVertexhhToetIVZ  +  AmpVertexIRoshhToetIVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->etI VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToetIVZ = AmpTreehhToetIVZ 
 AmpSum2hhToetIVZ = AmpTreehhToetIVZ + 2._dp*AmpWavehhToetIVZ + 2._dp*AmpVertexhhToetIVZ  
Else 
 AmpSumhhToetIVZ = AmpTreehhToetIVZ + AmpWavehhToetIVZ + AmpVertexhhToetIVZ
 AmpSum2hhToetIVZ = AmpTreehhToetIVZ + AmpWavehhToetIVZ + AmpVertexhhToetIVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToetIVZ = AmpTreehhToetIVZ
 AmpSum2hhToetIVZ = AmpTreehhToetIVZ 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MetIOS+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MetI+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToetIVZ = AmpTreehhToetIVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,MVZOS,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVZ,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToetIVZ(gt1) 
  AmpSum2hhToetIVZ = 2._dp*AmpWavehhToetIVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,MVZOS,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVZ,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToetIVZ(gt1) 
  AmpSum2hhToetIVZ = 2._dp*AmpVertexhhToetIVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,MVZOS,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVZ,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToetIVZ(gt1) 
  AmpSum2hhToetIVZ = AmpTreehhToetIVZ + 2._dp*AmpWavehhToetIVZ + 2._dp*AmpVertexhhToetIVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,MVZOS,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVZ,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToetIVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToetIVZ = AmpTreehhToetIVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,MVZOS,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
  AmpSqTreehhToetIVZ(gt1) = AmpSqhhToetIVZ(gt1)  
  AmpSum2hhToetIVZ = + 2._dp*AmpWavehhToetIVZ + 2._dp*AmpVertexhhToetIVZ
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,MVZOS,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
  AmpSqhhToetIVZ(gt1) = AmpSqhhToetIVZ(gt1) + AmpSqTreehhToetIVZ(gt1)  
Else  
  AmpSum2hhToetIVZ = AmpTreehhToetIVZ
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVZ,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
  AmpSqTreehhToetIVZ(gt1) = AmpSqhhToetIVZ(gt1)  
  AmpSum2hhToetIVZ = + 2._dp*AmpWavehhToetIVZ + 2._dp*AmpVertexhhToetIVZ
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVZ,AmpSumhhToetIVZ(:,gt1),AmpSum2hhToetIVZ(:,gt1),AmpSqhhToetIVZ(gt1)) 
  AmpSqhhToetIVZ(gt1) = AmpSqhhToetIVZ(gt1) + AmpSqTreehhToetIVZ(gt1)  
End if  
Else  
  AmpSqhhToetIVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToetIVZ(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MetIOS,MVZOS,helfactor*AmpSqhhToetIVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MetI,MVZ,helfactor*AmpSqhhToetIVZ(gt1))
End if 
If ((Abs(MRPhhToetIVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToetIVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToetIVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToetIVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToetIVZ(gt1) + MRGhhToetIVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToetIVZ(gt1) + MRGhhToetIVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,MFd,Mhh,            & 
& MFd2,Mhh2,AmpTreehhTocFdFd)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTocFdFd(ZcplcFdFdhhL,ZcplcFdFdhhR,MFd,              & 
& Mhh,MFd2,Mhh2,AmpTreehhTocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,          & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,        & 
& MFdOS,MhhOS,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,          & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFdFd(MLambda,em,gs,ZcplcFdFdhhL,ZcplcFdFdhhR,        & 
& MFd,Mhh,MRPhhTocFdFd,MRGhhTocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,ctcplcFdFdhhL,      & 
& ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,AmpWavehhTocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,            & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexhhTocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRdrhhTocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,              & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,ZcplcFdFdhhL,ZcplcFdFdhhR,cplcFuFdHmL,              & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRoshhTocFdFd)

 End if 
 End if 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd -  AmpVertexIRdrhhTocFdFd! +  AmpVertexIRoshhTocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocFdFd(:,gt2,:,:) = AmpWaveZhhTocFdFd(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFdFd(:,gt1,:,:) 
AmpVertexZhhTocFdFd(:,gt2,:,:)= AmpVertexZhhTocFdFd(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFdFd(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 1 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,gt2,:) = AmpWaveZhhTocFdFd(1,:,gt2,:)+ZRUUd(gt2,gt1)*AmpWavehhTocFdFd(1,:,gt1,:) 
AmpVertexZhhTocFdFd(1,:,gt2,:)= AmpVertexZhhTocFdFd(1,:,gt2,:)+ZRUUd(gt2,gt1)*AmpVertexhhTocFdFd(1,:,gt1,:) 
AmpWaveZhhTocFdFd(2,:,gt2,:) = AmpWaveZhhTocFdFd(2,:,gt2,:)+ZRUVdc(gt2,gt1)*AmpWavehhTocFdFd(2,:,gt1,:) 
AmpVertexZhhTocFdFd(2,:,gt2,:)= AmpVertexZhhTocFdFd(2,:,gt2,:)+ZRUVdc(gt2,gt1)*AmpVertexhhTocFdFd(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
! Final State 2 
AmpWaveZhhTocFdFd=0._dp 
AmpVertexZhhTocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFdFd(1,:,:,gt2) = AmpWaveZhhTocFdFd(1,:,:,gt2)+ZRUVd(gt2,gt1)*AmpWavehhTocFdFd(1,:,:,gt1) 
AmpVertexZhhTocFdFd(1,:,:,gt2)= AmpVertexZhhTocFdFd(1,:,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexhhTocFdFd(1,:,:,gt1) 
AmpWaveZhhTocFdFd(2,:,:,gt2) = AmpWaveZhhTocFdFd(2,:,:,gt2)+ZRUUd(gt2,gt1)*AmpWavehhTocFdFd(2,:,:,gt1) 
AmpVertexZhhTocFdFd(2,:,:,gt2)= AmpVertexZhhTocFdFd(2,:,:,gt2)+ZRUUd(gt2,gt1)*AmpVertexhhTocFdFd(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFdFd=AmpWaveZhhTocFdFd 
AmpVertexhhTocFdFd= AmpVertexZhhTocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFdFd = AmpVertexhhTocFdFd  +  AmpVertexIRoshhTocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd 
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd  
Else 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd + AmpWavehhTocFdFd + AmpVertexhhTocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFdFd = AmpTreehhTocFdFd
 AmpSum2hhTocFdFd = AmpTreehhTocFdFd 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFdOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFd(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpWavehhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFdFd(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFdFd = AmpTreehhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqTreehhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3)  
  AmpSum2hhTocFdFd = + 2._dp*AmpWavehhTocFdFd + 2._dp*AmpVertexhhTocFdFd
  Call SquareAmp_StoFF(Mhh(gt1),MFd(gt2),MFd(gt3),AmpSumhhTocFdFd(:,gt1, gt2, gt3),AmpSum2hhTocFdFd(:,gt1, gt2, gt3),AmpSqhhTocFdFd(gt1, gt2, gt3)) 
  AmpSqhhTocFdFd(gt1, gt2, gt3) = AmpSqhhTocFdFd(gt1, gt2, gt3) + AmpSqTreehhTocFdFd(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFdFd(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFdFd(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFd(gt2),MFd(gt3),helfactor*AmpSqhhTocFdFd(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFdFd(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFdFd(gt1, gt2, gt3) + MRGhhTocFdFd(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,MFe,Mhh,            & 
& MFe2,Mhh2,AmpTreehhTocFeFe)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTocFeFe(ZcplcFeFehhL,ZcplcFeFehhR,MFe,              & 
& Mhh,MFe2,Mhh2,AmpTreehhTocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,          & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,        & 
& MFeOS,MhhOS,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,          & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFeFe(MLambda,em,gs,ZcplcFeFehhL,ZcplcFeFehhR,        & 
& MFe,Mhh,MRPhhTocFeFe,MRGhhTocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,ctcplcFeFehhL,      & 
& ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,AmpWavehhTocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,             & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,          & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexhhTocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRdrhhTocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,            & 
& cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cplFvFeHmL,      & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,ZcplcFeFehhL,ZcplcFeFehhR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,      & 
& AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,ZcplcFeFehhL,    & 
& ZcplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,             & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe(MAhOS,MetIOS,MFeOS,MFvOS,              & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,            & 
& cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cplFvFeHmL,      & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,      & 
& AmpVertexIRoshhTocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFeFe)

 End if 
 End if 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe -  AmpVertexIRdrhhTocFeFe! +  AmpVertexIRoshhTocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocFeFe(:,gt2,:,:) = AmpWaveZhhTocFeFe(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFeFe(:,gt1,:,:) 
AmpVertexZhhTocFeFe(:,gt2,:,:)= AmpVertexZhhTocFeFe(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFeFe(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 1 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,gt2,:) = AmpWaveZhhTocFeFe(1,:,gt2,:)+ZRUUe(gt2,gt1)*AmpWavehhTocFeFe(1,:,gt1,:) 
AmpVertexZhhTocFeFe(1,:,gt2,:)= AmpVertexZhhTocFeFe(1,:,gt2,:)+ZRUUe(gt2,gt1)*AmpVertexhhTocFeFe(1,:,gt1,:) 
AmpWaveZhhTocFeFe(2,:,gt2,:) = AmpWaveZhhTocFeFe(2,:,gt2,:)+ZRUVec(gt2,gt1)*AmpWavehhTocFeFe(2,:,gt1,:) 
AmpVertexZhhTocFeFe(2,:,gt2,:)= AmpVertexZhhTocFeFe(2,:,gt2,:)+ZRUVec(gt2,gt1)*AmpVertexhhTocFeFe(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
! Final State 2 
AmpWaveZhhTocFeFe=0._dp 
AmpVertexZhhTocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFeFe(1,:,:,gt2) = AmpWaveZhhTocFeFe(1,:,:,gt2)+ZRUVe(gt2,gt1)*AmpWavehhTocFeFe(1,:,:,gt1) 
AmpVertexZhhTocFeFe(1,:,:,gt2)= AmpVertexZhhTocFeFe(1,:,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexhhTocFeFe(1,:,:,gt1) 
AmpWaveZhhTocFeFe(2,:,:,gt2) = AmpWaveZhhTocFeFe(2,:,:,gt2)+ZRUUe(gt2,gt1)*AmpWavehhTocFeFe(2,:,:,gt1) 
AmpVertexZhhTocFeFe(2,:,:,gt2)= AmpVertexZhhTocFeFe(2,:,:,gt2)+ZRUUe(gt2,gt1)*AmpVertexhhTocFeFe(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFeFe=AmpWaveZhhTocFeFe 
AmpVertexhhTocFeFe= AmpVertexZhhTocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFeFe = AmpVertexhhTocFeFe  +  AmpVertexIRoshhTocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe 
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe  
Else 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe + AmpWavehhTocFeFe + AmpVertexhhTocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFeFe = AmpTreehhTocFeFe
 AmpSum2hhTocFeFe = AmpTreehhTocFeFe 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFeOS(gt2)+MFeOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFe(gt2)+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpWavehhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFeFe(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFeFe = AmpTreehhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqTreehhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3)  
  AmpSum2hhTocFeFe = + 2._dp*AmpWavehhTocFeFe + 2._dp*AmpVertexhhTocFeFe
  Call SquareAmp_StoFF(Mhh(gt1),MFe(gt2),MFe(gt3),AmpSumhhTocFeFe(:,gt1, gt2, gt3),AmpSum2hhTocFeFe(:,gt1, gt2, gt3),AmpSqhhTocFeFe(gt1, gt2, gt3)) 
  AmpSqhhTocFeFe(gt1, gt2, gt3) = AmpSqhhTocFeFe(gt1, gt2, gt3) + AmpSqTreehhTocFeFe(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFeFe(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFeFe(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MFe(gt2),MFe(gt3),helfactor*AmpSqhhTocFeFe(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFeFe(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFeFe(gt1, gt2, gt3) + MRGhhTocFeFe(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,MFu,Mhh,            & 
& MFu2,Mhh2,AmpTreehhTocFuFu)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTocFuFu(ZcplcFuFuhhL,ZcplcFuFuhhR,MFu,              & 
& Mhh,MFu2,Mhh2,AmpTreehhTocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,          & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,        & 
& MFuOS,MhhOS,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,          & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocFuFu(MLambda,em,gs,ZcplcFuFuhhL,ZcplcFuFuhhR,        & 
& MFu,Mhh,MRPhhTocFuFu,MRGhhTocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,ctcplcFuFuhhL,      & 
& ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,AmpWavehhTocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,            & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexhhTocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRdrhhTocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,ZcplcFuFuhhL,          & 
& ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,             & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,              & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,ZcplcFuFuhhL,ZcplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,         & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRoshhTocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu(MAhOS,MetIOS,MFdOS,MFuOS,              & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,       & 
& cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,     & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,              & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,AmpVertexIRoshhTocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,              & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,AmpVertexIRoshhTocFuFu)

 End if 
 End if 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu -  AmpVertexIRdrhhTocFuFu! +  AmpVertexIRoshhTocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocFuFu(:,gt2,:,:) = AmpWaveZhhTocFuFu(:,gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocFuFu(:,gt1,:,:) 
AmpVertexZhhTocFuFu(:,gt2,:,:)= AmpVertexZhhTocFuFu(:,gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocFuFu(:,gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 1 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,gt2,:) = AmpWaveZhhTocFuFu(1,:,gt2,:)+ZRUUu(gt2,gt1)*AmpWavehhTocFuFu(1,:,gt1,:) 
AmpVertexZhhTocFuFu(1,:,gt2,:)= AmpVertexZhhTocFuFu(1,:,gt2,:)+ZRUUu(gt2,gt1)*AmpVertexhhTocFuFu(1,:,gt1,:) 
AmpWaveZhhTocFuFu(2,:,gt2,:) = AmpWaveZhhTocFuFu(2,:,gt2,:)+ZRUVuc(gt2,gt1)*AmpWavehhTocFuFu(2,:,gt1,:) 
AmpVertexZhhTocFuFu(2,:,gt2,:)= AmpVertexZhhTocFuFu(2,:,gt2,:)+ZRUVuc(gt2,gt1)*AmpVertexhhTocFuFu(2,:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
! Final State 2 
AmpWaveZhhTocFuFu=0._dp 
AmpVertexZhhTocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocFuFu(1,:,:,gt2) = AmpWaveZhhTocFuFu(1,:,:,gt2)+ZRUVu(gt2,gt1)*AmpWavehhTocFuFu(1,:,:,gt1) 
AmpVertexZhhTocFuFu(1,:,:,gt2)= AmpVertexZhhTocFuFu(1,:,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexhhTocFuFu(1,:,:,gt1) 
AmpWaveZhhTocFuFu(2,:,:,gt2) = AmpWaveZhhTocFuFu(2,:,:,gt2)+ZRUUu(gt2,gt1)*AmpWavehhTocFuFu(2,:,:,gt1) 
AmpVertexZhhTocFuFu(2,:,:,gt2)= AmpVertexZhhTocFuFu(2,:,:,gt2)+ZRUUu(gt2,gt1)*AmpVertexhhTocFuFu(2,:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocFuFu=AmpWaveZhhTocFuFu 
AmpVertexhhTocFuFu= AmpVertexZhhTocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocFuFu = AmpVertexhhTocFuFu  +  AmpVertexIRoshhTocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu 
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu  
Else 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu + AmpWavehhTocFuFu + AmpVertexhhTocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocFuFu = AmpTreehhTocFuFu
 AmpSum2hhTocFuFu = AmpTreehhTocFuFu 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFuOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFu(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpWavehhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocFuFu(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocFuFu = AmpTreehhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqTreehhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3)  
  AmpSum2hhTocFuFu = + 2._dp*AmpWavehhTocFuFu + 2._dp*AmpVertexhhTocFuFu
  Call SquareAmp_StoFF(Mhh(gt1),MFu(gt2),MFu(gt3),AmpSumhhTocFuFu(:,gt1, gt2, gt3),AmpSum2hhTocFuFu(:,gt1, gt2, gt3),AmpSqhhTocFuFu(gt1, gt2, gt3)) 
  AmpSqhhTocFuFu(gt1, gt2, gt3) = AmpSqhhTocFuFu(gt1, gt2, gt3) + AmpSqTreehhTocFuFu(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocFuFu(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqhhTocFuFu(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(MhhOS(gt1),MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 3._dp*GammaTPS(Mhh(gt1),MFu(gt2),MFu(gt3),helfactor*AmpSqhhTocFuFu(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocFuFu(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocFuFu(gt1, gt2, gt3) + MRGhhTocFuFu(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTohhhh(cplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTohhhh(Zcplhhhhhh,Mhh,Mhh2,AmpTreehhTohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTohhhh(MLambda,em,gs,cplhhhhhh,MhhOS,MRPhhTohhhh,       & 
& MRGhhTohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,MhhOS,MRPhhTohhhh,      & 
& MRGhhTohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,MRPhhTohhhh,         & 
& MRGhhTohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTohhhh(MLambda,em,gs,Zcplhhhhhh,Mhh,MRPhhTohhhh,        & 
& MRGhhTohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,Mhh2,              & 
& Zfhh,AmpWavehhTohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,              & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,          & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,        & 
& cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,     & 
& cplhhhhHmcHm1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexhhTohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,        & 
& cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,     & 
& cplhhhhHmcHm1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexIRdrhhTohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,            & 
& cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,Zcplhhhhhh,cplhhHmVWp,cplhhHmcHm,     & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,           & 
& cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,cplhhhhHmcHm1,cplhhhhcVWpVWp1,               & 
& cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,Zcplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,       & 
& cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,     & 
& cplhhhhHmcHm1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,            & 
& cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,      & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,           & 
& cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,cplhhhhHmcHm1,cplhhhhcVWpVWp1,               & 
& cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,        & 
& cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,     & 
& cplhhhhHmcHm1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,AmpVertexIRoshhTohhhh)

 End if 
 End if 
AmpVertexhhTohhhh = AmpVertexhhTohhhh -  AmpVertexIRdrhhTohhhh! +  AmpVertexIRoshhTohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhhh(gt2,:,:) = AmpWaveZhhTohhhh(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(gt1,:,:) 
AmpVertexZhhTohhhh(gt2,:,:)= AmpVertexZhhTohhhh(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 1 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhhh(:,gt2,:) = AmpWaveZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,gt1,:) 
AmpVertexZhhTohhhh(:,gt2,:)= AmpVertexZhhTohhhh(:,gt2,:)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
! Final State 2 
AmpWaveZhhTohhhh=0._dp 
AmpVertexZhhTohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTohhhh(:,:,gt2) = AmpWaveZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTohhhh(:,:,gt1) 
AmpVertexZhhTohhhh(:,:,gt2)= AmpVertexZhhTohhhh(:,:,gt2)+ZRUZH(gt2,gt1)*AmpVertexhhTohhhh(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTohhhh=AmpWaveZhhTohhhh 
AmpVertexhhTohhhh= AmpVertexZhhTohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexhhTohhhh = AmpVertexhhTohhhh  +  AmpVertexIRoshhTohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh 
 AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh  
Else 
 AmpSumhhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh + AmpWavehhTohhhh + AmpVertexhhTohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhhh = AmpTreehhTohhhh
 AmpSum2hhTohhhh = AmpTreehhTohhhh 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
    Do gt3=gt2,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpWavehhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTohhhh(gt1, gt2, gt3) 
  AmpSum2hhTohhhh = AmpTreehhTohhhh + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTohhhh(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
Else  
  AmpSum2hhTohhhh = AmpTreehhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqTreehhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3)  
  AmpSum2hhTohhhh = + 2._dp*AmpWavehhTohhhh + 2._dp*AmpVertexhhTohhhh
  Call SquareAmp_StoSS(Mhh(gt1),Mhh(gt2),Mhh(gt3),AmpSumhhTohhhh(gt1, gt2, gt3),AmpSum2hhTohhhh(gt1, gt2, gt3),AmpSqhhTohhhh(gt1, gt2, gt3)) 
  AmpSqhhTohhhh(gt1, gt2, gt3) = AmpSqhhTohhhh(gt1, gt2, gt3) + AmpSqTreehhTohhhh(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTohhhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhTohhhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),Mhh(gt2),Mhh(gt3),helfactor*AmpSqhhTohhhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPhhTohhhh(gt1, gt2, gt3) + MRGhhTohhhh(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hm VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhToHmVWp(cplhhHmVWp,Mhh,MHm,MVWp,Mhh2,               & 
& MHm2,MVWp2,AmpTreehhToHmVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhToHmVWp(ZcplhhHmVWp,Mhh,MHm,MVWp,Mhh2,              & 
& MHm2,MVWp2,AmpTreehhToHmVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhToHmVWp(MLambda,em,gs,cplhhHmVWp,MhhOS,MHmOS,           & 
& MVWpOS,MRPhhToHmVWp,MRGhhToHmVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToHmVWp(MLambda,em,gs,ZcplhhHmVWp,MhhOS,MHmOS,          & 
& MVWpOS,MRPhhToHmVWp,MRGhhToHmVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhToHmVWp(MLambda,em,gs,cplhhHmVWp,Mhh,MHm,               & 
& MVWp,MRPhhToHmVWp,MRGhhToHmVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToHmVWp(MLambda,em,gs,ZcplhhHmVWp,Mhh,MHm,              & 
& MVWp,MRPhhToHmVWp,MRGhhToHmVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhToHmVWp(cplhhHmVWp,ctcplhhHmVWp,Mhh,Mhh2,           & 
& MHm,MHm2,MVWp,MVWp2,Zfhh,ZfHm,ZfVWp,AmpWavehhToHmVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,             & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,            & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,            & 
& cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cplAhHmVWpVZ1,cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,              & 
& cplHmcHmcVWpVWp1,AmpVertexhhToHmVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,            & 
& cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cplAhHmVWpVZ1,cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,              & 
& cplHmcHmcVWpVWp1,AmpVertexIRdrhhToHmVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,         & 
& cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,cplcgWpgWphh,cplcgZgWpHm,             & 
& cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZVWp,            & 
& cplhhhhhh,ZcplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,GosZcplHmVPVWp,   & 
& cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhHmVWpVZ1,              & 
& cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,           & 
& AmpVertexIRoshhToHmVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,            & 
& cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZVWp,cplhhhhhh,ZcplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,GZcplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,               & 
& cplcVWpVWpVZ,cplAhHmVWpVZ1,cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,               & 
& cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRoshhToHmVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,         & 
& cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,cplcgWpgWphh,cplcgZgWpHm,             & 
& cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZVWp,            & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,GcplHmVPVWp,       & 
& cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cplAhHmVWpVZ1,              & 
& cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,           & 
& AmpVertexIRoshhToHmVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,            & 
& cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cplAhHmVWpVZ1,cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,              & 
& cplHmcHmcVWpVWp1,AmpVertexIRoshhToHmVWp)

 End if 
 End if 
AmpVertexhhToHmVWp = AmpVertexhhToHmVWp -  AmpVertexIRdrhhToHmVWp! +  AmpVertexIRoshhToHmVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToHmVWp=0._dp 
AmpVertexZhhToHmVWp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToHmVWp(:,gt2,:) = AmpWaveZhhToHmVWp(:,gt2,:)+ZRUZH(gt2,gt1)*AmpWavehhToHmVWp(:,gt1,:) 
AmpVertexZhhToHmVWp(:,gt2,:)= AmpVertexZhhToHmVWp(:,gt2,:) + ZRUZH(gt2,gt1)*AmpVertexhhToHmVWp(:,gt1,:) 
 End Do 
End Do 
AmpWavehhToHmVWp=AmpWaveZhhToHmVWp 
AmpVertexhhToHmVWp= AmpVertexZhhToHmVWp
! Final State 1 
AmpWaveZhhToHmVWp=0._dp 
AmpVertexZhhToHmVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhToHmVWp(:,:,gt2) = AmpWaveZhhToHmVWp(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhToHmVWp(:,:,gt1) 
AmpVertexZhhToHmVWp(:,:,gt2)= AmpVertexZhhToHmVWp(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhToHmVWp(:,:,gt1) 
 End Do 
End Do 
AmpWavehhToHmVWp=AmpWaveZhhToHmVWp 
AmpVertexhhToHmVWp= AmpVertexZhhToHmVWp
End if
If (ShiftIRdiv) Then 
AmpVertexhhToHmVWp = AmpVertexhhToHmVWp  +  AmpVertexIRoshhToHmVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Hm VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToHmVWp = AmpTreehhToHmVWp 
 AmpSum2hhToHmVWp = AmpTreehhToHmVWp + 2._dp*AmpWavehhToHmVWp + 2._dp*AmpVertexhhToHmVWp  
Else 
 AmpSumhhToHmVWp = AmpTreehhToHmVWp + AmpWavehhToHmVWp + AmpVertexhhToHmVWp
 AmpSum2hhToHmVWp = AmpTreehhToHmVWp + AmpWavehhToHmVWp + AmpVertexhhToHmVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToHmVWp = AmpTreehhToHmVWp
 AmpSum2hhToHmVWp = AmpTreehhToHmVWp 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MHmOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MHm(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2hhToHmVWp = AmpTreehhToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHmOS(gt2),MVWpOS,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHm(gt2),MVWp,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToHmVWp(gt1, gt2) 
  AmpSum2hhToHmVWp = 2._dp*AmpWavehhToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHmOS(gt2),MVWpOS,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHm(gt2),MVWp,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToHmVWp(gt1, gt2) 
  AmpSum2hhToHmVWp = 2._dp*AmpVertexhhToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHmOS(gt2),MVWpOS,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHm(gt2),MVWp,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToHmVWp(gt1, gt2) 
  AmpSum2hhToHmVWp = AmpTreehhToHmVWp + 2._dp*AmpWavehhToHmVWp + 2._dp*AmpVertexhhToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MHmOS(gt2),MVWpOS,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MHm(gt2),MVWp,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToHmVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToHmVWp = AmpTreehhToHmVWp
  Call SquareAmp_StoSV(MhhOS(gt1),MHmOS(gt2),MVWpOS,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
  AmpSqTreehhToHmVWp(gt1, gt2) = AmpSqhhToHmVWp(gt1, gt2)  
  AmpSum2hhToHmVWp = + 2._dp*AmpWavehhToHmVWp + 2._dp*AmpVertexhhToHmVWp
  Call SquareAmp_StoSV(MhhOS(gt1),MHmOS(gt2),MVWpOS,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
  AmpSqhhToHmVWp(gt1, gt2) = AmpSqhhToHmVWp(gt1, gt2) + AmpSqTreehhToHmVWp(gt1, gt2)  
Else  
  AmpSum2hhToHmVWp = AmpTreehhToHmVWp
  Call SquareAmp_StoSV(Mhh(gt1),MHm(gt2),MVWp,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
  AmpSqTreehhToHmVWp(gt1, gt2) = AmpSqhhToHmVWp(gt1, gt2)  
  AmpSum2hhToHmVWp = + 2._dp*AmpWavehhToHmVWp + 2._dp*AmpVertexhhToHmVWp
  Call SquareAmp_StoSV(Mhh(gt1),MHm(gt2),MVWp,AmpSumhhToHmVWp(:,gt1, gt2),AmpSum2hhToHmVWp(:,gt1, gt2),AmpSqhhToHmVWp(gt1, gt2)) 
  AmpSqhhToHmVWp(gt1, gt2) = AmpSqhhToHmVWp(gt1, gt2) + AmpSqTreehhToHmVWp(gt1, gt2)  
End if  
Else  
  AmpSqhhToHmVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToHmVWp(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MHmOS(gt2),MVWpOS,helfactor*AmpSqhhToHmVWp(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MHm(gt2),MVWp,helfactor*AmpSqhhToHmVWp(gt1, gt2))
End if 
If ((Abs(MRPhhToHmVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHmVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToHmVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhToHmVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhToHmVWp(gt1, gt2) + MRGhhToHmVWp(gt1, gt2)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhToHmVWp(gt1, gt2) + MRGhhToHmVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Hm) Hm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTocHmHm(cplhhHmcHm,Mhh,MHm,Mhh2,MHm2,               & 
& AmpTreehhTocHmHm)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTocHmHm(ZcplhhHmcHm,Mhh,MHm,Mhh2,MHm2,              & 
& AmpTreehhTocHmHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocHmHm(MLambda,em,gs,cplhhHmcHm,MhhOS,MHmOS,           & 
& MRPhhTocHmHm,MRGhhTocHmHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocHmHm(MLambda,em,gs,ZcplhhHmcHm,MhhOS,MHmOS,          & 
& MRPhhTocHmHm,MRGhhTocHmHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTocHmHm(MLambda,em,gs,cplhhHmcHm,Mhh,MHm,               & 
& MRPhhTocHmHm,MRGhhTocHmHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocHmHm(MLambda,em,gs,ZcplhhHmcHm,Mhh,MHm,              & 
& MRPhhTocHmHm,MRGhhTocHmHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTocHmHm(cplhhHmcHm,ctcplhhHmcHm,Mhh,Mhh2,           & 
& MHm,MHm2,Zfhh,ZfHm,AmpWavehhTocHmHm)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,             & 
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
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexhhTocHmHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,              & 
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
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexIRdrhhTocHmHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm(MAhOS,MetIOS,MFdOS,MFeOS,              & 
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
& cplHmcHmVZVZ1,AmpVertexIRoshhTocHmHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,              & 
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
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexIRoshhTocHmHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm(MAhOS,MetIOS,MFdOS,MFeOS,              & 
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
& cplHmcHmVZVZ1,AmpVertexIRoshhTocHmHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,              & 
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
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,AmpVertexIRoshhTocHmHm)

 End if 
 End if 
AmpVertexhhTocHmHm = AmpVertexhhTocHmHm -  AmpVertexIRdrhhTocHmHm! +  AmpVertexIRoshhTocHmHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocHmHm=0._dp 
AmpVertexZhhTocHmHm=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocHmHm(gt2,:,:) = AmpWaveZhhTocHmHm(gt2,:,:)+ZRUZH(gt2,gt1)*AmpWavehhTocHmHm(gt1,:,:) 
AmpVertexZhhTocHmHm(gt2,:,:)= AmpVertexZhhTocHmHm(gt2,:,:) + ZRUZH(gt2,gt1)*AmpVertexhhTocHmHm(gt1,:,:) 
 End Do 
End Do 
AmpWavehhTocHmHm=AmpWaveZhhTocHmHm 
AmpVertexhhTocHmHm= AmpVertexZhhTocHmHm
! Final State 1 
AmpWaveZhhTocHmHm=0._dp 
AmpVertexZhhTocHmHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocHmHm(:,gt2,:) = AmpWaveZhhTocHmHm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpWavehhTocHmHm(:,gt1,:) 
AmpVertexZhhTocHmHm(:,gt2,:)= AmpVertexZhhTocHmHm(:,gt2,:)+ZRUZP(gt2,gt1)*AmpVertexhhTocHmHm(:,gt1,:) 
 End Do 
End Do 
AmpWavehhTocHmHm=AmpWaveZhhTocHmHm 
AmpVertexhhTocHmHm= AmpVertexZhhTocHmHm
! Final State 2 
AmpWaveZhhTocHmHm=0._dp 
AmpVertexZhhTocHmHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZhhTocHmHm(:,:,gt2) = AmpWaveZhhTocHmHm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpWavehhTocHmHm(:,:,gt1) 
AmpVertexZhhTocHmHm(:,:,gt2)= AmpVertexZhhTocHmHm(:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexhhTocHmHm(:,:,gt1) 
 End Do 
End Do 
AmpWavehhTocHmHm=AmpWaveZhhTocHmHm 
AmpVertexhhTocHmHm= AmpVertexZhhTocHmHm
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocHmHm = AmpVertexhhTocHmHm  +  AmpVertexIRoshhTocHmHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[Hm] Hm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocHmHm = AmpTreehhTocHmHm 
 AmpSum2hhTocHmHm = AmpTreehhTocHmHm + 2._dp*AmpWavehhTocHmHm + 2._dp*AmpVertexhhTocHmHm  
Else 
 AmpSumhhTocHmHm = AmpTreehhTocHmHm + AmpWavehhTocHmHm + AmpVertexhhTocHmHm
 AmpSum2hhTocHmHm = AmpTreehhTocHmHm + AmpWavehhTocHmHm + AmpVertexhhTocHmHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocHmHm = AmpTreehhTocHmHm
 AmpSum2hhTocHmHm = AmpTreehhTocHmHm 
End if 
Do gt1=1,2
i4 = isave 
  Do gt2=2,3
    Do gt3=2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MHmOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MHm(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2hhTocHmHm = AmpTreehhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHm(gt2),MHm(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocHmHm(gt1, gt2, gt3) 
  AmpSum2hhTocHmHm = 2._dp*AmpWavehhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHm(gt2),MHm(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocHmHm(gt1, gt2, gt3) 
  AmpSum2hhTocHmHm = 2._dp*AmpVertexhhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHm(gt2),MHm(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocHmHm(gt1, gt2, gt3) 
  AmpSum2hhTocHmHm = AmpTreehhTocHmHm + 2._dp*AmpWavehhTocHmHm + 2._dp*AmpVertexhhTocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(Mhh(gt1),MHm(gt2),MHm(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocHmHm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocHmHm = AmpTreehhTocHmHm
  Call SquareAmp_StoSS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHmHm(gt1, gt2, gt3) = AmpSqhhTocHmHm(gt1, gt2, gt3)  
  AmpSum2hhTocHmHm = + 2._dp*AmpWavehhTocHmHm + 2._dp*AmpVertexhhTocHmHm
  Call SquareAmp_StoSS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
  AmpSqhhTocHmHm(gt1, gt2, gt3) = AmpSqhhTocHmHm(gt1, gt2, gt3) + AmpSqTreehhTocHmHm(gt1, gt2, gt3)  
Else  
  AmpSum2hhTocHmHm = AmpTreehhTocHmHm
  Call SquareAmp_StoSS(Mhh(gt1),MHm(gt2),MHm(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
  AmpSqTreehhTocHmHm(gt1, gt2, gt3) = AmpSqhhTocHmHm(gt1, gt2, gt3)  
  AmpSum2hhTocHmHm = + 2._dp*AmpWavehhTocHmHm + 2._dp*AmpVertexhhTocHmHm
  Call SquareAmp_StoSS(Mhh(gt1),MHm(gt2),MHm(gt3),AmpSumhhTocHmHm(gt1, gt2, gt3),AmpSum2hhTocHmHm(gt1, gt2, gt3),AmpSqhhTocHmHm(gt1, gt2, gt3)) 
  AmpSqhhTocHmHm(gt1, gt2, gt3) = AmpSqhhTocHmHm(gt1, gt2, gt3) + AmpSqTreehhTocHmHm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqhhTocHmHm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocHmHm(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MHmOS(gt2),MHmOS(gt3),helfactor*AmpSqhhTocHmHm(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MHm(gt2),MHm(gt3),helfactor*AmpSqhhTocHmHm(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhTocHmHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHmHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocHmHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhTocHmHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPhhTocHmHm(gt1, gt2, gt3) + MRGhhTocHmHm(gt1, gt2, gt3)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPhhTocHmHm(gt1, gt2, gt3) + MRGhhTocHmHm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(VWp) VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhTocVWpVWp(cplhhcVWpVWp,Mhh,MVWp,Mhh2,               & 
& MVWp2,AmpTreehhTocVWpVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhTocVWpVWp(ZcplhhcVWpVWp,Mhh,MVWp,Mhh2,              & 
& MVWp2,AmpTreehhTocVWpVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,MhhOS,             & 
& MVWpOS,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocVWpVWp(MLambda,em,gs,ZcplhhcVWpVWp,MhhOS,            & 
& MVWpOS,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,Mhh,               & 
& MVWp,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhTocVWpVWp(MLambda,em,gs,ZcplhhcVWpVWp,Mhh,              & 
& MVWp,MRPhhTocVWpVWp,MRGhhTocVWpVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhTocVWpVWp(cplhhcVWpVWp,ctcplhhcVWpVWp,              & 
& Mhh,Mhh2,MVWp,MVWp2,Zfhh,ZfVWp,AmpWavehhTocVWpVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTocVWpVWp(MAh,MetI,MFd,MFe,MFu,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,        & 
& cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,          & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,        & 
& cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,        & 
& cpletIetIcVWpVWp1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,         & 
& cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexhhTocVWpVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,        & 
& cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,          & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,        & 
& cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,        & 
& cpletIetIcVWpVWp1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,         & 
& cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRdrhhTocVWpVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp(MAhOS,MetIOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,       & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,        & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,             & 
& cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,          & 
& cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,GosZcplhhHmcHm,             & 
& ZcplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,GosZcplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,           & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,              & 
& cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,           & 
& cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,          & 
& cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,        & 
& cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,          & 
& cplhhhhhh,cplhhHmVWp,GZcplhhHmcHm,ZcplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,GZcplHmVPVWp,   & 
& cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,        & 
& cpletIetIcVWpVWp1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,         & 
& cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp(MAhOS,MetIOS,MFdOS,MFeOS,            & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,       & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,        & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,             & 
& cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,          & 
& cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,    & 
& cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,   & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,          & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,    & 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,             & 
& cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,        & 
& cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,cplcgWCgZcVWp,          & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,        & 
& cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,        & 
& cpletIetIcVWpVWp1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,         & 
& cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhTocVWpVWp)

 End if 
 End if 
AmpVertexhhTocVWpVWp = AmpVertexhhTocVWpVWp -  AmpVertexIRdrhhTocVWpVWp! +  AmpVertexIRoshhTocVWpVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhTocVWpVWp=0._dp 
AmpVertexZhhTocVWpVWp=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhTocVWpVWp(:,gt2) = AmpWaveZhhTocVWpVWp(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhTocVWpVWp(:,gt1) 
AmpVertexZhhTocVWpVWp(:,gt2)= AmpVertexZhhTocVWpVWp(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhTocVWpVWp(:,gt1) 
 End Do 
End Do 
AmpWavehhTocVWpVWp=AmpWaveZhhTocVWpVWp 
AmpVertexhhTocVWpVWp= AmpVertexZhhTocVWpVWp
End if
If (ShiftIRdiv) Then 
AmpVertexhhTocVWpVWp = AmpVertexhhTocVWpVWp  +  AmpVertexIRoshhTocVWpVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->conj[VWp] VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp 
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp  
Else 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp + AmpWavehhTocVWpVWp + AmpVertexhhTocVWpVWp
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + AmpWavehhTocVWpVWp + AmpVertexhhTocVWpVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTocVWpVWp = AmpTreehhTocVWpVWp
 AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MVWpOS+MVWpOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVWp+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhTocVWpVWp(gt1) 
  AmpSum2hhTocVWpVWp = 2._dp*AmpWavehhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhTocVWpVWp(gt1) 
  AmpSum2hhTocVWpVWp = 2._dp*AmpVertexhhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhTocVWpVWp(gt1) 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhTocVWpVWp(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqTreehhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1)  
  AmpSum2hhTocVWpVWp = + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
  Call SquareAmp_StoVV(MhhOS(gt1),MVWpOS,MVWpOS,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqhhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1) + AmpSqTreehhTocVWpVWp(gt1)  
Else  
  AmpSum2hhTocVWpVWp = AmpTreehhTocVWpVWp
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqTreehhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1)  
  AmpSum2hhTocVWpVWp = + 2._dp*AmpWavehhTocVWpVWp + 2._dp*AmpVertexhhTocVWpVWp
  Call SquareAmp_StoVV(Mhh(gt1),MVWp,MVWp,AmpSumhhTocVWpVWp(:,gt1),AmpSum2hhTocVWpVWp(:,gt1),AmpSqhhTocVWpVWp(gt1)) 
  AmpSqhhTocVWpVWp(gt1) = AmpSqhhTocVWpVWp(gt1) + AmpSqTreehhTocVWpVWp(gt1)  
End if  
Else  
  AmpSqhhTocVWpVWp(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTocVWpVWp(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),MVWpOS,MVWpOS,helfactor*AmpSqhhTocVWpVWp(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVWp,MVWp,helfactor*AmpSqhhTocVWpVWp(gt1))
End if 
If ((Abs(MRPhhTocVWpVWp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWpVWp(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhTocVWpVWp(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhTocVWpVWp(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPhhTocVWpVWp(gt1) + MRGhhTocVWpVWp(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPhhTocVWpVWp(gt1) + MRGhhTocVWpVWp(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! VZ VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_hhToVZVZ(ZcplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,AmpTreehhToVZVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,MhhOS,MVZOS,             & 
& MRPhhToVZVZ,MRGhhToVZVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,MhhOS,MVZOS,            & 
& MRPhhToVZVZ,MRGhhToVZVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,     & 
& MRGhhToVZVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_hhToVZVZ(MLambda,em,gs,ZcplhhVZVZ,Mhh,MVZ,MRPhhToVZVZ,    & 
& MRGhhToVZVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,Mhh2,              & 
& MVZ,MVZ2,Zfhh,ZfVZ,AmpWavehhToVZVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToVZVZ(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,              & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,          & 
& cplAhhhVZ,cpletIetIhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,        & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,         & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,         & 
& cplcVWpVWpVZVZ1Q,AmpVertexhhToVZVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhVZ,cpletIetIhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,        & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,         & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,         & 
& cplcVWpVWpVZVZ1Q,AmpVertexIRdrhhToVZVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhVZ,cpletIetIhh,cpletIhhVZ,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,ZcplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,    & 
& cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,   & 
& cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhVZ,cpletIetIhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,ZcplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,       & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,         & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,         & 
& cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ(MAhOS,MetIOS,MFdOS,MFeOS,               & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhVZ,cpletIetIhh,cpletIhhVZ,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,   & 
& cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhVZ,cpletIetIhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,        & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,         & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,         & 
& cplcVWpVWpVZVZ1Q,AmpVertexIRoshhToVZVZ)

 End if 
 End if 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ -  AmpVertexIRdrhhToVZVZ! +  AmpVertexIRoshhToVZVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZhhToVZVZ=0._dp 
AmpVertexZhhToVZVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZhhToVZVZ(:,gt2) = AmpWaveZhhToVZVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWavehhToVZVZ(:,gt1) 
AmpVertexZhhToVZVZ(:,gt2)= AmpVertexZhhToVZVZ(:,gt2) + ZRUZH(gt2,gt1)*AmpVertexhhToVZVZ(:,gt1) 
 End Do 
End Do 
AmpWavehhToVZVZ=AmpWaveZhhToVZVZ 
AmpVertexhhToVZVZ= AmpVertexZhhToVZVZ
End if
If (ShiftIRdiv) Then 
AmpVertexhhToVZVZ = AmpVertexhhToVZVZ  +  AmpVertexIRoshhToVZVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VZ VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ 
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ  
Else 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ + AmpWavehhToVZVZ + AmpVertexhhToVZVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVZVZ = AmpTreehhToVZVZ
 AmpSum2hhToVZVZ = AmpTreehhToVZVZ 
End if 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MVZOS+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVZ+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpWavehhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqhhToVZVZ(gt1) 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqhhToVZVZ(gt1) 
 End if 
If (OSkinematics) Then 
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(MhhOS(gt1),MVZOS,MVZOS,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
Else  
  AmpSum2hhToVZVZ = AmpTreehhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqTreehhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1)  
  AmpSum2hhToVZVZ = + 2._dp*AmpWavehhToVZVZ + 2._dp*AmpVertexhhToVZVZ
  Call SquareAmp_StoVV(Mhh(gt1),MVZ,MVZ,AmpSumhhToVZVZ(:,gt1),AmpSum2hhToVZVZ(:,gt1),AmpSqhhToVZVZ(gt1)) 
  AmpSqhhToVZVZ(gt1) = AmpSqhhToVZVZ(gt1) + AmpSqTreehhToVZVZ(gt1)  
End if  
Else  
  AmpSqhhToVZVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVZVZ(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MVZOS,MVZOS,helfactor*AmpSqhhToVZVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVZ,MVZ,helfactor*AmpSqhhToVZVZ(gt1))
End if 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPhhToVZVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVZVZ(gt1)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1)) 
  gP1Lhh(gt1,i4) = gP1Lhh(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPhhToVZVZ(gt1) + MRGhhToVZVZ(gt1))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1Lhh(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End If 
!---------------- 
! etI VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_hhToetIVP(cpletIhhVZ,ctcpletIhhVZ,MetIOS,             & 
& MetI2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfetI,Zfhh,ZfVP,ZfVZVP,AmpWavehhToetIVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_hhToetIVP(cpletIhhVZ,ctcpletIhhVZ,MetIOS,             & 
& MetI2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfetI,Zfhh,ZfVP,ZfVZVP,AmpWavehhToetIVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhToetIVP(MetIOS,MFdOS,MFeOS,MFuOS,MhhOS,           & 
& MHmOS,MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,              & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,           & 
& cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,AmpVertexhhToetIVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhToetIVP(MetIOS,MFdOS,MFeOS,MFuOS,MhhOS,           & 
& MHmOS,MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,              & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,           & 
& cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,AmpVertexhhToetIVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_hhToetIVP(cpletIhhVZ,ctcpletIhhVZ,MetI,               & 
& MetI2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfetI,Zfhh,ZfVP,ZfVZVP,AmpWavehhToetIVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToetIVP(MetI,MFd,MFe,MFu,Mhh,MHm,MVP,             & 
& MVWp,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,             & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,    & 
& cplhhcHmcVWpVP1,AmpVertexhhToetIVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->etI VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToetIVP = 0._dp 
 AmpSum2hhToetIVP = 0._dp  
Else 
 AmpSumhhToetIVP = AmpVertexhhToetIVP + AmpWavehhToetIVP
 AmpSum2hhToetIVP = AmpVertexhhToetIVP + AmpWavehhToetIVP 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(MetIOS+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MetI+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MetIOS,0._dp,AmpSumhhToetIVP(:,gt1),AmpSum2hhToetIVP(:,gt1),AmpSqhhToetIVP(gt1)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),MetI,MVP,AmpSumhhToetIVP(:,gt1),AmpSum2hhToetIVP(:,gt1),AmpSqhhToetIVP(gt1)) 
End if  
Else  
  AmpSqhhToetIVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToetIVP(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MetIOS,0._dp,helfactor*AmpSqhhToetIVP(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MetI,MVP,helfactor*AmpSqhhToetIVP(gt1))
End if 
If ((Abs(MRPhhToetIVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToetIVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
!---------------- 
! Fv Fv
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhToFvFv(MFeOS,MFvOS,MhhOS,MHmOS,MVWpOS,            & 
& MVZOS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,MVWp2OS,MVZ2OS,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,   & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,               & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexhhToFvFv)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhToFvFv(MFeOS,MFvOS,MhhOS,MHmOS,MVWpOS,            & 
& MVZOS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,MVWp2OS,MVZ2OS,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,   & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,               & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexhhToFvFv)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToFvFv(MFe,MFv,Mhh,MHm,MVWp,MVZ,MFe2,             & 
& MFv2,Mhh2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,   & 
& AmpVertexhhToFvFv)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->Fv Fv -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToFvFv = 0._dp 
 AmpSum2hhToFvFv = 0._dp  
Else 
 AmpSumhhToFvFv = AmpVertexhhToFvFv + AmpWavehhToFvFv
 AmpSum2hhToFvFv = AmpVertexhhToFvFv + AmpWavehhToFvFv 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,3
    Do gt3=gt2,3
If (((OSkinematics).and.(MhhOS(gt1).gt.(MFvOS(gt2)+MFvOS(gt3)))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MFv(gt2)+MFv(gt3))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(Mhh(gt1),MFv(gt2),MFv(gt3),AmpSumhhToFvFv(:,gt1, gt2, gt3),AmpSum2hhToFvFv(:,gt1, gt2, gt3),AmpSqhhToFvFv(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqhhToFvFv(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqhhToFvFv(gt1, gt2, gt3).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(MhhOS(gt1),MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
Else 
  gP1Lhh(gt1,i4) = 1._dp/2._dp*GammaTPS(Mhh(gt1),MFv(gt2),MFv(gt3),helfactor*AmpSqhhToFvFv(gt1, gt2, gt3))
End if 
If ((Abs(MRPhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGhhToFvFv(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhVP(MFdOS,MFeOS,MFuOS,MhhOS,MHmOS,             & 
& MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,         & 
& AmpVertexhhTohhVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhVP(MFdOS,MFeOS,MFuOS,MhhOS,MHmOS,             & 
& MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,         & 
& AmpVertexhhTohhVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhVP(MFd,MFe,MFu,Mhh,MHm,MVP,MVWp,              & 
& MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,AmpVertexhhTohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVP = 0._dp 
 AmpSum2hhTohhVP = 0._dp  
Else 
 AmpSumhhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP
 AmpSum2hhTohhVP = AmpVertexhhTohhVP + AmpWavehhTohhVP 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),0._dp,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVP,AmpSumhhTohhVP(:,gt1, gt2),AmpSum2hhTohhVP(:,gt1, gt2),AmpSqhhTohhVP(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVP(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),0._dp,helfactor*AmpSqhhTohhVP(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVP,helfactor*AmpSqhhTohhVP(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! hh VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhVZ(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,            & 
& MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,        & 
& cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexhhTohhVZ)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhVZ(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,            & 
& MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& MVWp2OS,MVZ2OS,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,        & 
& cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexhhTohhVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhTohhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,              & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,          & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVWpVZ1,            & 
& cplhhcHmcVWpVZ1,AmpVertexhhTohhVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->hh VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhTohhVZ = 0._dp 
 AmpSum2hhTohhVZ = 0._dp  
Else 
 AmpSumhhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ
 AmpSum2hhTohhVZ = AmpVertexhhTohhVZ + AmpWavehhTohhVZ 
End If 
Do gt1=1,2
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MhhOS(gt1).gt.(MhhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(Mhh(gt2)+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MhhOS(gt1),MhhOS(gt2),MVZOS,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
Else  
  Call SquareAmp_StoSV(Mhh(gt1),Mhh(gt2),MVZ,AmpSumhhTohhVZ(:,gt1, gt2),AmpSum2hhTohhVZ(:,gt1, gt2),AmpSqhhTohhVZ(gt1, gt2)) 
End if  
Else  
  AmpSqhhTohhVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhTohhVZ(gt1, gt2).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),MhhOS(gt2),MVZOS,helfactor*AmpSqhhTohhVZ(gt1, gt2))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),Mhh(gt2),MVZ,helfactor*AmpSqhhTohhVZ(gt1, gt2))
End if 
If ((Abs(MRPhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGhhTohhVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhToVGVG(MFdOS,MFuOS,MhhOS,MVG,MFd2OS,              & 
& MFu2OS,Mhh2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhToVGVG(MFdOS,MFuOS,MhhOS,MVG,MFd2OS,              & 
& MFu2OS,Mhh2OS,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,MFu2,Mhh2,            & 
& MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,          & 
& cplcFuFuVGL,cplcFuFuVGR,AmpVertexhhToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVGVG = 0._dp 
 AmpSum2hhToVGVG = 0._dp  
Else 
 AmpSumhhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG
 AmpSum2hhToVGVG = AmpVertexhhToVGVG + AmpWavehhToVGVG 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVG+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVG,MVG,AmpSumhhToVGVG(:,gt1),AmpSum2hhToVGVG(:,gt1),AmpSqhhToVGVG(gt1)) 
End if  
Else  
  AmpSqhhToVGVG(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVGVG(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVGVG(gt1))
Else 
  gP1Lhh(gt1,i4) = 8._dp*GammaTPS(Mhh(gt1),MVG,MVG,helfactor*AmpSqhhToVGVG(gt1))
End if 
If ((Abs(MRPhhToVGVG(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVGVG(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhToVPVP(MFdOS,MFeOS,MFuOS,MhhOS,MHmOS,             & 
& MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,         & 
& cplHmcHmVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,AmpVertexhhToVPVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhToVPVP(MFdOS,MFeOS,MFuOS,MhhOS,MHmOS,             & 
& MVP,MVWpOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,         & 
& cplHmcHmVPVP1,cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,AmpVertexhhToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToVPVP(MFd,MFe,MFu,Mhh,MHm,MVP,MVWp,              & 
& MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,cplHmcHmVPVP1,      & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,AmpVertexhhToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVP = 0._dp 
 AmpSum2hhToVPVP = 0._dp  
Else 
 AmpSumhhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP
 AmpSum2hhToVPVP = AmpVertexhhToVPVP + AmpWavehhToVPVP 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(0.+0.))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVP+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,0._dp,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVP,AmpSumhhToVPVP(:,gt1),AmpSum2hhToVPVP(:,gt1),AmpSqhhToVPVP(gt1)) 
End if  
Else  
  AmpSqhhToVPVP(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVP(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(MhhOS(gt1),0._dp,0._dp,helfactor*AmpSqhhToVPVP(gt1))
Else 
  gP1Lhh(gt1,i4) = 1._dp*GammaTPS(Mhh(gt1),MVP,MVP,helfactor*AmpSqhhToVPVP(gt1))
End if 
If ((Abs(MRPhhToVPVP(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVP(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_hhToVPVZ(MFdOS,MFeOS,MFuOS,MhhOS,MHmOS,             & 
& MVP,MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,         & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVPVWp1,          & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplcVWpVPVWpVZ3Q,          & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,AmpVertexhhToVPVZ)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_hhToVPVZ(MFdOS,MFeOS,MFuOS,MhhOS,MHmOS,             & 
& MVP,MVWpOS,MVZOS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,         & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVPVWp1,          & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplcVWpVPVWpVZ3Q,          & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,AmpVertexhhToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_hhToVPVZ(MFd,MFe,MFu,Mhh,MHm,MVP,MVWp,              & 
& MVZ,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,            & 
& cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,    & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1, & 
& cplHmcHmVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,AmpVertexhhToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ hh->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumhhToVPVZ = 0._dp 
 AmpSum2hhToVPVZ = 0._dp  
Else 
 AmpSumhhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ
 AmpSum2hhToVPVZ = AmpVertexhhToVPVZ + AmpWavehhToVPVZ 
End If 
Do gt1=1,2
i4 = isave 
If (((OSkinematics).and.(MhhOS(gt1).gt.(0.+MVZOS))).or.((.not.OSkinematics).and.(Mhh(gt1).gt.(MVP+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MhhOS(gt1),0._dp,MVZOS,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
Else  
  Call SquareAmp_StoVV(Mhh(gt1),MVP,MVZ,AmpSumhhToVPVZ(:,gt1),AmpSum2hhToVPVZ(:,gt1),AmpSqhhToVPVZ(gt1)) 
End if  
Else  
  AmpSqhhToVPVZ(gt1) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqhhToVPVZ(gt1).le.0._dp) Then 
  gP1Lhh(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(MhhOS(gt1),0._dp,MVZOS,helfactor*AmpSqhhToVPVZ(gt1))
Else 
  gP1Lhh(gt1,i4) = 2._dp*GammaTPS(Mhh(gt1),MVP,MVZ,helfactor*AmpSqhhToVPVZ(gt1))
End if 
If ((Abs(MRPhhToVPVZ(gt1)).gt.1.0E-20_dp).or.(Abs(MRGhhToVPVZ(gt1)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1Lhh(gt1,i4) 
End if 
i4=i4+1

If (gt1.eq.2) isave = i4 
End do
End Subroutine OneLoopDecay_hh

End Module Wrapper_OneLoopDecay_hh_radinuZeeHB
