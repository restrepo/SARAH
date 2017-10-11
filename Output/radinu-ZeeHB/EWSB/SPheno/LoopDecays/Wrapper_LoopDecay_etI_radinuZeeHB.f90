! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_etI_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_etI_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_etI(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,             & 
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
& cplcgWpgZVWp,cplcgZgWCcHm,cplcgZgWCVWp,cplcgZgWpcVWp,cplcgZgWpHm,cplcHmcVWpVP,         & 
& cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,& 
& cpletIetIcVWpVWp1,cpletIetIetI,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhh,           & 
& cpletIetIhhhh1,cpletIetIHmcHm1,cpletIetIVZVZ1,cpletIhhhh,cpletIhhhhhh1,cpletIhhHmcHm1, & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVPVWp1,cpletIHmVWp,cpletIHmVWpVZ1,cplFvFecVWpL,         & 
& cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplhhcHmcVWp,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,       & 
& cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,cplhhhhhhhh1,cplhhhhHmcHm1,cplhhhhVZVZ1,        & 
& cplhhHmcHm,cplhhHmVPVWp1,cplhhHmVWp,cplhhHmVWpVZ1,cplhhVZVZ,cplHmcHmcVWpVWp1,          & 
& cplHmcHmVP,cplHmcHmVPVP1,cplHmcHmVPVZ1,cplHmcHmVZ,cplHmcHmVZVZ1,cplHmHmcHmcHm1,        & 
& cplHmVPVWp,cplHmVWpVZ,ctcplAhAhetI,ctcplAhetIetI,ctcplAhetIhh,ctcplcFdFdetIL,          & 
& ctcplcFdFdetIR,ctcplcFeFeetIL,ctcplcFeFeetIR,ctcplcFuFuetIL,ctcplcFuFuetIR,            & 
& ctcpletIetIetI,ctcpletIetIhh,ctcpletIhhhh,ctcpletIhhVZ,ctcpletIHmcHm,ctcpletIHmVWp,    & 
& GcplHmVPVWp,GosZcplHmVPVWp,GZcplHmVPVWp,ZcplAhAhetI,ZcplAhetIetI,ZcplAhetIhh,          & 
& ZcplcFdFdetIL,ZcplcFdFdetIR,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,   & 
& ZcpletIetIetI,ZcpletIetIhh,ZcpletIhhhh,ZcpletIhhVZ,ZcpletIHmcHm,ZcpletIHmVWp,          & 
& ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,            & 
& kont,gP1LetI)

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
& cplcgWpgWpVZ,cplcgWpgZcHm(3),cplcgWpgZVWp,cplcgZgWCcHm(3),cplcgZgWCVWp,cplcgZgWpcVWp,  & 
& cplcgZgWpHm(3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVWpVZ,              & 
& cpletIcHmcVWp(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cpletIetIcVWpVWp1,            & 
& cpletIetIetI,cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhh(2),cpletIetIhhhh1(2,2),   & 
& cpletIetIHmcHm1(3,3),cpletIetIVZVZ1,cpletIhhhh(2,2),cpletIhhhhhh1(2,2,2),              & 
& cpletIhhHmcHm1(2,3,3),cpletIhhVZ(2),cpletIHmcHm(3,3),cpletIHmVPVWp1(3),cpletIHmVWp(3), & 
& cpletIHmVWpVZ1(3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFeHmL(3,3,3),               & 
& cplFvFeHmR(3,3,3),cplhhcHmcVWp(2,3),cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),         & 
& cplhhcVWpVWp(2),cplhhhhcVWpVWp1(2,2),cplhhhhhh(2,2,2),cplhhhhhhhh1(2,2,2,2),           & 
& cplhhhhHmcHm1(2,2,3,3),cplhhhhVZVZ1(2,2),cplhhHmcHm(2,3,3),cplhhHmVPVWp1(2,3),         & 
& cplhhHmVWp(2,3),cplhhHmVWpVZ1(2,3),cplhhVZVZ(2),cplHmcHmcVWpVWp1(3,3),cplHmcHmVP(3,3), & 
& cplHmcHmVPVP1(3,3),cplHmcHmVPVZ1(3,3),cplHmcHmVZ(3,3),cplHmcHmVZVZ1(3,3),              & 
& cplHmHmcHmcHm1(3,3,3,3),cplHmVPVWp(3),cplHmVWpVZ(3),ctcplAhAhetI,ctcplAhetIetI,        & 
& ctcplAhetIhh(2),ctcplcFdFdetIL(3,3),ctcplcFdFdetIR(3,3),ctcplcFeFeetIL(3,3),           & 
& ctcplcFeFeetIR(3,3),ctcplcFuFuetIL(3,3),ctcplcFuFuetIR(3,3),ctcpletIetIetI,            & 
& ctcpletIetIhh(2),ctcpletIhhhh(2,2),ctcpletIhhVZ(2),ctcpletIHmcHm(3,3),ctcpletIHmVWp(3),& 
& GcplHmVPVWp(3),GosZcplHmVPVWp(3),GZcplHmVPVWp(3),ZcplAhAhetI,ZcplAhetIetI,             & 
& ZcplAhetIhh(2),ZcplcFdFdetIL(3,3),ZcplcFdFdetIR(3,3),ZcplcFeFeetIL(3,3)

Complex(dp),Intent(in) :: ZcplcFeFeetIR(3,3),ZcplcFuFuetIL(3,3),ZcplcFuFuetIR(3,3),ZcpletIetIetI,ZcpletIetIhh(2),& 
& ZcpletIhhhh(2,2),ZcpletIhhVZ(2),ZcpletIHmcHm(3,3),ZcpletIHmVWp(3)

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
Real(dp), Intent(out) :: gP1LetI(1,56) 
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
Real(dp) :: MRPetIToetIetI,MRGetIToetIetI, MRPZetIToetIetI,MRGZetIToetIetI 
Real(dp) :: MVPetIToetIetI 
Real(dp) :: RMsqTreeetIToetIetI,RMsqWaveetIToetIetI,RMsqVertexetIToetIetI 
Complex(dp) :: AmpTreeetIToetIetI,AmpWaveetIToetIetI=(0._dp,0._dp),AmpVertexetIToetIetI& 
 & ,AmpVertexIRosetIToetIetI,AmpVertexIRdretIToetIetI, AmpSumetIToetIetI, AmpSum2etIToetIetI 
Complex(dp) :: AmpTreeZetIToetIetI,AmpWaveZetIToetIetI,AmpVertexZetIToetIetI 
Real(dp) :: AmpSqetIToetIetI,  AmpSqTreeetIToetIetI 
Real(dp) :: MRPetITohhetI(2),MRGetITohhetI(2), MRPZetITohhetI(2),MRGZetITohhetI(2) 
Real(dp) :: MVPetITohhetI(2) 
Real(dp) :: RMsqTreeetITohhetI(2),RMsqWaveetITohhetI(2),RMsqVertexetITohhetI(2) 
Complex(dp) :: AmpTreeetITohhetI(2),AmpWaveetITohhetI(2)=(0._dp,0._dp),AmpVertexetITohhetI(2)& 
 & ,AmpVertexIRosetITohhetI(2),AmpVertexIRdretITohhetI(2), AmpSumetITohhetI(2), AmpSum2etITohhetI(2) 
Complex(dp) :: AmpTreeZetITohhetI(2),AmpWaveZetITohhetI(2),AmpVertexZetITohhetI(2) 
Real(dp) :: AmpSqetITohhetI(2),  AmpSqTreeetITohhetI(2) 
Real(dp) :: MRPetITocFdFd(3,3),MRGetITocFdFd(3,3), MRPZetITocFdFd(3,3),MRGZetITocFdFd(3,3) 
Real(dp) :: MVPetITocFdFd(3,3) 
Real(dp) :: RMsqTreeetITocFdFd(3,3),RMsqWaveetITocFdFd(3,3),RMsqVertexetITocFdFd(3,3) 
Complex(dp) :: AmpTreeetITocFdFd(2,3,3),AmpWaveetITocFdFd(2,3,3)=(0._dp,0._dp),AmpVertexetITocFdFd(2,3,3)& 
 & ,AmpVertexIRosetITocFdFd(2,3,3),AmpVertexIRdretITocFdFd(2,3,3), AmpSumetITocFdFd(2,3,3), AmpSum2etITocFdFd(2,3,3) 
Complex(dp) :: AmpTreeZetITocFdFd(2,3,3),AmpWaveZetITocFdFd(2,3,3),AmpVertexZetITocFdFd(2,3,3) 
Real(dp) :: AmpSqetITocFdFd(3,3),  AmpSqTreeetITocFdFd(3,3) 
Real(dp) :: MRPetITocFeFe(3,3),MRGetITocFeFe(3,3), MRPZetITocFeFe(3,3),MRGZetITocFeFe(3,3) 
Real(dp) :: MVPetITocFeFe(3,3) 
Real(dp) :: RMsqTreeetITocFeFe(3,3),RMsqWaveetITocFeFe(3,3),RMsqVertexetITocFeFe(3,3) 
Complex(dp) :: AmpTreeetITocFeFe(2,3,3),AmpWaveetITocFeFe(2,3,3)=(0._dp,0._dp),AmpVertexetITocFeFe(2,3,3)& 
 & ,AmpVertexIRosetITocFeFe(2,3,3),AmpVertexIRdretITocFeFe(2,3,3), AmpSumetITocFeFe(2,3,3), AmpSum2etITocFeFe(2,3,3) 
Complex(dp) :: AmpTreeZetITocFeFe(2,3,3),AmpWaveZetITocFeFe(2,3,3),AmpVertexZetITocFeFe(2,3,3) 
Real(dp) :: AmpSqetITocFeFe(3,3),  AmpSqTreeetITocFeFe(3,3) 
Real(dp) :: MRPetITocFuFu(3,3),MRGetITocFuFu(3,3), MRPZetITocFuFu(3,3),MRGZetITocFuFu(3,3) 
Real(dp) :: MVPetITocFuFu(3,3) 
Real(dp) :: RMsqTreeetITocFuFu(3,3),RMsqWaveetITocFuFu(3,3),RMsqVertexetITocFuFu(3,3) 
Complex(dp) :: AmpTreeetITocFuFu(2,3,3),AmpWaveetITocFuFu(2,3,3)=(0._dp,0._dp),AmpVertexetITocFuFu(2,3,3)& 
 & ,AmpVertexIRosetITocFuFu(2,3,3),AmpVertexIRdretITocFuFu(2,3,3), AmpSumetITocFuFu(2,3,3), AmpSum2etITocFuFu(2,3,3) 
Complex(dp) :: AmpTreeZetITocFuFu(2,3,3),AmpWaveZetITocFuFu(2,3,3),AmpVertexZetITocFuFu(2,3,3) 
Real(dp) :: AmpSqetITocFuFu(3,3),  AmpSqTreeetITocFuFu(3,3) 
Real(dp) :: MRPetITohhhh(2,2),MRGetITohhhh(2,2), MRPZetITohhhh(2,2),MRGZetITohhhh(2,2) 
Real(dp) :: MVPetITohhhh(2,2) 
Real(dp) :: RMsqTreeetITohhhh(2,2),RMsqWaveetITohhhh(2,2),RMsqVertexetITohhhh(2,2) 
Complex(dp) :: AmpTreeetITohhhh(2,2),AmpWaveetITohhhh(2,2)=(0._dp,0._dp),AmpVertexetITohhhh(2,2)& 
 & ,AmpVertexIRosetITohhhh(2,2),AmpVertexIRdretITohhhh(2,2), AmpSumetITohhhh(2,2), AmpSum2etITohhhh(2,2) 
Complex(dp) :: AmpTreeZetITohhhh(2,2),AmpWaveZetITohhhh(2,2),AmpVertexZetITohhhh(2,2) 
Real(dp) :: AmpSqetITohhhh(2,2),  AmpSqTreeetITohhhh(2,2) 
Real(dp) :: MRPetITohhVZ(2),MRGetITohhVZ(2), MRPZetITohhVZ(2),MRGZetITohhVZ(2) 
Real(dp) :: MVPetITohhVZ(2) 
Real(dp) :: RMsqTreeetITohhVZ(2),RMsqWaveetITohhVZ(2),RMsqVertexetITohhVZ(2) 
Complex(dp) :: AmpTreeetITohhVZ(2,2),AmpWaveetITohhVZ(2,2)=(0._dp,0._dp),AmpVertexetITohhVZ(2,2)& 
 & ,AmpVertexIRosetITohhVZ(2,2),AmpVertexIRdretITohhVZ(2,2), AmpSumetITohhVZ(2,2), AmpSum2etITohhVZ(2,2) 
Complex(dp) :: AmpTreeZetITohhVZ(2,2),AmpWaveZetITohhVZ(2,2),AmpVertexZetITohhVZ(2,2) 
Real(dp) :: AmpSqetITohhVZ(2),  AmpSqTreeetITohhVZ(2) 
Real(dp) :: MRPetIToHmVWp(3),MRGetIToHmVWp(3), MRPZetIToHmVWp(3),MRGZetIToHmVWp(3) 
Real(dp) :: MVPetIToHmVWp(3) 
Real(dp) :: RMsqTreeetIToHmVWp(3),RMsqWaveetIToHmVWp(3),RMsqVertexetIToHmVWp(3) 
Complex(dp) :: AmpTreeetIToHmVWp(2,3),AmpWaveetIToHmVWp(2,3)=(0._dp,0._dp),AmpVertexetIToHmVWp(2,3)& 
 & ,AmpVertexIRosetIToHmVWp(2,3),AmpVertexIRdretIToHmVWp(2,3), AmpSumetIToHmVWp(2,3), AmpSum2etIToHmVWp(2,3) 
Complex(dp) :: AmpTreeZetIToHmVWp(2,3),AmpWaveZetIToHmVWp(2,3),AmpVertexZetIToHmVWp(2,3) 
Real(dp) :: AmpSqetIToHmVWp(3),  AmpSqTreeetIToHmVWp(3) 
Real(dp) :: MRPetITocHmHm(3,3),MRGetITocHmHm(3,3), MRPZetITocHmHm(3,3),MRGZetITocHmHm(3,3) 
Real(dp) :: MVPetITocHmHm(3,3) 
Real(dp) :: RMsqTreeetITocHmHm(3,3),RMsqWaveetITocHmHm(3,3),RMsqVertexetITocHmHm(3,3) 
Complex(dp) :: AmpTreeetITocHmHm(3,3),AmpWaveetITocHmHm(3,3)=(0._dp,0._dp),AmpVertexetITocHmHm(3,3)& 
 & ,AmpVertexIRosetITocHmHm(3,3),AmpVertexIRdretITocHmHm(3,3), AmpSumetITocHmHm(3,3), AmpSum2etITocHmHm(3,3) 
Complex(dp) :: AmpTreeZetITocHmHm(3,3),AmpWaveZetITocHmHm(3,3),AmpVertexZetITocHmHm(3,3) 
Real(dp) :: AmpSqetITocHmHm(3,3),  AmpSqTreeetITocHmHm(3,3) 
Real(dp) :: MRPetIToetIVP,MRGetIToetIVP, MRPZetIToetIVP,MRGZetIToetIVP 
Real(dp) :: MVPetIToetIVP 
Real(dp) :: RMsqTreeetIToetIVP,RMsqWaveetIToetIVP,RMsqVertexetIToetIVP 
Complex(dp) :: AmpTreeetIToetIVP(2),AmpWaveetIToetIVP(2)=(0._dp,0._dp),AmpVertexetIToetIVP(2)& 
 & ,AmpVertexIRosetIToetIVP(2),AmpVertexIRdretIToetIVP(2), AmpSumetIToetIVP(2), AmpSum2etIToetIVP(2) 
Complex(dp) :: AmpTreeZetIToetIVP(2),AmpWaveZetIToetIVP(2),AmpVertexZetIToetIVP(2) 
Real(dp) :: AmpSqetIToetIVP,  AmpSqTreeetIToetIVP 
Real(dp) :: MRPetIToetIVZ,MRGetIToetIVZ, MRPZetIToetIVZ,MRGZetIToetIVZ 
Real(dp) :: MVPetIToetIVZ 
Real(dp) :: RMsqTreeetIToetIVZ,RMsqWaveetIToetIVZ,RMsqVertexetIToetIVZ 
Complex(dp) :: AmpTreeetIToetIVZ(2),AmpWaveetIToetIVZ(2)=(0._dp,0._dp),AmpVertexetIToetIVZ(2)& 
 & ,AmpVertexIRosetIToetIVZ(2),AmpVertexIRdretIToetIVZ(2), AmpSumetIToetIVZ(2), AmpSum2etIToetIVZ(2) 
Complex(dp) :: AmpTreeZetIToetIVZ(2),AmpWaveZetIToetIVZ(2),AmpVertexZetIToetIVZ(2) 
Real(dp) :: AmpSqetIToetIVZ,  AmpSqTreeetIToetIVZ 
Real(dp) :: MRPetIToFvFv(3,3),MRGetIToFvFv(3,3), MRPZetIToFvFv(3,3),MRGZetIToFvFv(3,3) 
Real(dp) :: MVPetIToFvFv(3,3) 
Real(dp) :: RMsqTreeetIToFvFv(3,3),RMsqWaveetIToFvFv(3,3),RMsqVertexetIToFvFv(3,3) 
Complex(dp) :: AmpTreeetIToFvFv(2,3,3),AmpWaveetIToFvFv(2,3,3)=(0._dp,0._dp),AmpVertexetIToFvFv(2,3,3)& 
 & ,AmpVertexIRosetIToFvFv(2,3,3),AmpVertexIRdretIToFvFv(2,3,3), AmpSumetIToFvFv(2,3,3), AmpSum2etIToFvFv(2,3,3) 
Complex(dp) :: AmpTreeZetIToFvFv(2,3,3),AmpWaveZetIToFvFv(2,3,3),AmpVertexZetIToFvFv(2,3,3) 
Real(dp) :: AmpSqetIToFvFv(3,3),  AmpSqTreeetIToFvFv(3,3) 
Real(dp) :: MRPetITohhVP(2),MRGetITohhVP(2), MRPZetITohhVP(2),MRGZetITohhVP(2) 
Real(dp) :: MVPetITohhVP(2) 
Real(dp) :: RMsqTreeetITohhVP(2),RMsqWaveetITohhVP(2),RMsqVertexetITohhVP(2) 
Complex(dp) :: AmpTreeetITohhVP(2,2),AmpWaveetITohhVP(2,2)=(0._dp,0._dp),AmpVertexetITohhVP(2,2)& 
 & ,AmpVertexIRosetITohhVP(2,2),AmpVertexIRdretITohhVP(2,2), AmpSumetITohhVP(2,2), AmpSum2etITohhVP(2,2) 
Complex(dp) :: AmpTreeZetITohhVP(2,2),AmpWaveZetITohhVP(2,2),AmpVertexZetITohhVP(2,2) 
Real(dp) :: AmpSqetITohhVP(2),  AmpSqTreeetITohhVP(2) 
Real(dp) :: MRPetIToVGVG,MRGetIToVGVG, MRPZetIToVGVG,MRGZetIToVGVG 
Real(dp) :: MVPetIToVGVG 
Real(dp) :: RMsqTreeetIToVGVG,RMsqWaveetIToVGVG,RMsqVertexetIToVGVG 
Complex(dp) :: AmpTreeetIToVGVG(2),AmpWaveetIToVGVG(2)=(0._dp,0._dp),AmpVertexetIToVGVG(2)& 
 & ,AmpVertexIRosetIToVGVG(2),AmpVertexIRdretIToVGVG(2), AmpSumetIToVGVG(2), AmpSum2etIToVGVG(2) 
Complex(dp) :: AmpTreeZetIToVGVG(2),AmpWaveZetIToVGVG(2),AmpVertexZetIToVGVG(2) 
Real(dp) :: AmpSqetIToVGVG,  AmpSqTreeetIToVGVG 
Real(dp) :: MRPetIToVPVP,MRGetIToVPVP, MRPZetIToVPVP,MRGZetIToVPVP 
Real(dp) :: MVPetIToVPVP 
Real(dp) :: RMsqTreeetIToVPVP,RMsqWaveetIToVPVP,RMsqVertexetIToVPVP 
Complex(dp) :: AmpTreeetIToVPVP(2),AmpWaveetIToVPVP(2)=(0._dp,0._dp),AmpVertexetIToVPVP(2)& 
 & ,AmpVertexIRosetIToVPVP(2),AmpVertexIRdretIToVPVP(2), AmpSumetIToVPVP(2), AmpSum2etIToVPVP(2) 
Complex(dp) :: AmpTreeZetIToVPVP(2),AmpWaveZetIToVPVP(2),AmpVertexZetIToVPVP(2) 
Real(dp) :: AmpSqetIToVPVP,  AmpSqTreeetIToVPVP 
Real(dp) :: MRPetIToVPVZ,MRGetIToVPVZ, MRPZetIToVPVZ,MRGZetIToVPVZ 
Real(dp) :: MVPetIToVPVZ 
Real(dp) :: RMsqTreeetIToVPVZ,RMsqWaveetIToVPVZ,RMsqVertexetIToVPVZ 
Complex(dp) :: AmpTreeetIToVPVZ(2),AmpWaveetIToVPVZ(2)=(0._dp,0._dp),AmpVertexetIToVPVZ(2)& 
 & ,AmpVertexIRosetIToVPVZ(2),AmpVertexIRdretIToVPVZ(2), AmpSumetIToVPVZ(2), AmpSum2etIToVPVZ(2) 
Complex(dp) :: AmpTreeZetIToVPVZ(2),AmpWaveZetIToVPVZ(2),AmpVertexZetIToVPVZ(2) 
Real(dp) :: AmpSqetIToVPVZ,  AmpSqTreeetIToVPVZ 
Real(dp) :: MRPetIToVWpcVWp,MRGetIToVWpcVWp, MRPZetIToVWpcVWp,MRGZetIToVWpcVWp 
Real(dp) :: MVPetIToVWpcVWp 
Real(dp) :: RMsqTreeetIToVWpcVWp,RMsqWaveetIToVWpcVWp,RMsqVertexetIToVWpcVWp 
Complex(dp) :: AmpTreeetIToVWpcVWp(2),AmpWaveetIToVWpcVWp(2)=(0._dp,0._dp),AmpVertexetIToVWpcVWp(2)& 
 & ,AmpVertexIRosetIToVWpcVWp(2),AmpVertexIRdretIToVWpcVWp(2), AmpSumetIToVWpcVWp(2), AmpSum2etIToVWpcVWp(2) 
Complex(dp) :: AmpTreeZetIToVWpcVWp(2),AmpWaveZetIToVWpcVWp(2),AmpVertexZetIToVWpcVWp(2) 
Real(dp) :: AmpSqetIToVWpcVWp,  AmpSqTreeetIToVWpcVWp 
Real(dp) :: MRPetIToVZVZ,MRGetIToVZVZ, MRPZetIToVZVZ,MRGZetIToVZVZ 
Real(dp) :: MVPetIToVZVZ 
Real(dp) :: RMsqTreeetIToVZVZ,RMsqWaveetIToVZVZ,RMsqVertexetIToVZVZ 
Complex(dp) :: AmpTreeetIToVZVZ(2),AmpWaveetIToVZVZ(2)=(0._dp,0._dp),AmpVertexetIToVZVZ(2)& 
 & ,AmpVertexIRosetIToVZVZ(2),AmpVertexIRdretIToVZVZ(2), AmpSumetIToVZVZ(2), AmpSum2etIToVZVZ(2) 
Complex(dp) :: AmpTreeZetIToVZVZ(2),AmpWaveZetIToVZVZ(2),AmpVertexZetIToVZVZ(2) 
Real(dp) :: AmpSqetIToVZVZ,  AmpSqTreeetIToVZVZ 
Write(*,*) "Calculating one-loop decays of etI " 
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
! etI etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etIToetIetI(cpletIetIetI,MetI,MetI2,AmpTreeetIToetIetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_etIToetIetI(ZcpletIetIetI,MetI,MetI2,AmpTreeetIToetIetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etIToetIetI(MLambda,em,gs,cpletIetIetI,MetIOS,            & 
& MRPetIToetIetI,MRGetIToetIetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etIToetIetI(MLambda,em,gs,ZcpletIetIetI,MetIOS,           & 
& MRPetIToetIetI,MRGetIToetIetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etIToetIetI(MLambda,em,gs,cpletIetIetI,MetI,              & 
& MRPetIToetIetI,MRGetIToetIetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etIToetIetI(MLambda,em,gs,ZcpletIetIetI,MetI,             & 
& MRPetIToetIetI,MRGetIToetIetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etIToetIetI(cpletIetIetI,ctcpletIetIetI,              & 
& MetI,MetI2,ZfetI,AmpWaveetIToetIetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,            & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplAhAhetIetI1,cplAhetIetIetI1,       & 
& cplAhetIetIhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,        & 
& AmpVertexetIToetIetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,            & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplAhAhetIetI1,cplAhetIetIetI1,       & 
& cplAhetIetIhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,        & 
& AmpVertexIRdretIToetIetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI(MAhOS,MetIOS,MFdOS,MFeOS,            & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,ZcpletIetIetI,cpletIetIhh,     & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplAhAhetIetI1,cplAhetIetIetI1,cplAhetIetIhh1,cpletIetIetIetI1,          & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,AmpVertexIRosetIToetIetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,ZcpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,           & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplAhAhetIetI1,cplAhetIetIetI1,       & 
& cplAhetIetIhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,        & 
& AmpVertexIRosetIToetIetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI(MAhOS,MetIOS,MFdOS,MFeOS,            & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,      & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplAhAhetIetI1,cplAhetIetIetI1,cplAhetIetIhh1,cpletIetIetIetI1,          & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,AmpVertexIRosetIToetIetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,            & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplAhAhetIetI1,cplAhetIetIetI1,       & 
& cplAhetIetIhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,        & 
& AmpVertexIRosetIToetIetI)

 End if 
 End if 
AmpVertexetIToetIetI = AmpVertexetIToetIetI -  AmpVertexIRdretIToetIetI! +  AmpVertexIRosetIToetIetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
End if
If (ShiftIRdiv) Then 
AmpVertexetIToetIetI = AmpVertexetIToetIetI  +  AmpVertexIRosetIToetIetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->etI etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetIToetIetI = AmpTreeetIToetIetI 
 AmpSum2etIToetIetI = AmpTreeetIToetIetI + 2._dp*AmpWaveetIToetIetI + 2._dp*AmpVertexetIToetIetI  
Else 
 AmpSumetIToetIetI = AmpTreeetIToetIetI + AmpWaveetIToetIetI + AmpVertexetIToetIetI
 AmpSum2etIToetIetI = AmpTreeetIToetIetI + AmpWaveetIToetIetI + AmpVertexetIToetIetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToetIetI = AmpTreeetIToetIetI
 AmpSum2etIToetIetI = AmpTreeetIToetIetI 
End if 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(MetIOS+MetIOS))).or.((.not.OSkinematics).and.(MetI.gt.(MetI+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*)  
  AmpSum2etIToetIetI = AmpTreeetIToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MetIOS,MetIOS,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
Else  
  Call SquareAmp_StoSS(MetI,MetI,MetI,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetIToetIetI 
  AmpSum2etIToetIetI = 2._dp*AmpWaveetIToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MetIOS,MetIOS,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
Else  
  Call SquareAmp_StoSS(MetI,MetI,MetI,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetIToetIetI 
  AmpSum2etIToetIetI = 2._dp*AmpVertexetIToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MetIOS,MetIOS,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
Else  
  Call SquareAmp_StoSS(MetI,MetI,MetI,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetIToetIetI 
  AmpSum2etIToetIetI = AmpTreeetIToetIetI + 2._dp*AmpWaveetIToetIetI + 2._dp*AmpVertexetIToetIetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MetIOS,MetIOS,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
Else  
  Call SquareAmp_StoSS(MetI,MetI,MetI,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetIToetIetI 
 End if 
If (OSkinematics) Then 
  AmpSum2etIToetIetI = AmpTreeetIToetIetI
  Call SquareAmp_StoSS(MetIOS,MetIOS,MetIOS,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
  AmpSqTreeetIToetIetI = AmpSqetIToetIetI  
  AmpSum2etIToetIetI = + 2._dp*AmpWaveetIToetIetI + 2._dp*AmpVertexetIToetIetI
  Call SquareAmp_StoSS(MetIOS,MetIOS,MetIOS,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
  AmpSqetIToetIetI = AmpSqetIToetIetI + AmpSqTreeetIToetIetI  
Else  
  AmpSum2etIToetIetI = AmpTreeetIToetIetI
  Call SquareAmp_StoSS(MetI,MetI,MetI,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
  AmpSqTreeetIToetIetI = AmpSqetIToetIetI  
  AmpSum2etIToetIetI = + 2._dp*AmpWaveetIToetIetI + 2._dp*AmpVertexetIToetIetI
  Call SquareAmp_StoSS(MetI,MetI,MetI,AmpSumetIToetIetI,AmpSum2etIToetIetI,AmpSqetIToetIetI) 
  AmpSqetIToetIetI = AmpSqetIToetIetI + AmpSqTreeetIToetIetI  
End if  
Else  
  AmpSqetIToetIetI = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToetIetI.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp/2._dp*GammaTPS(MetIOS,MetIOS,MetIOS,helfactor*AmpSqetIToetIetI)
Else 
  gP1LetI(gt1,i4) = 1._dp/2._dp*GammaTPS(MetI,MetI,MetI,helfactor*AmpSqetIToetIetI)
End if 
If ((Abs(MRPetIToetIetI).gt.1.0E-20_dp).or.(Abs(MRGetIToetIetI).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetIToetIetI).gt.1.0E-20_dp).or.(Abs(MRGetIToetIetI).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPetIToetIetI + MRGetIToetIetI) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPetIToetIetI + MRGetIToetIetI)
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh etI
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITohhetI(cpletIetIhh,MetI,Mhh,MetI2,Mhh2,           & 
& AmpTreeetITohhetI)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITohhetI(ZcpletIetIhh,MetI,Mhh,MetI2,               & 
& Mhh2,AmpTreeetITohhetI)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhetI(MLambda,em,gs,cpletIetIhh,MetIOS,              & 
& MhhOS,MRPetITohhetI,MRGetITohhetI)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhetI(MLambda,em,gs,ZcpletIetIhh,MetIOS,             & 
& MhhOS,MRPetITohhetI,MRGetITohhetI)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITohhetI(MLambda,em,gs,cpletIetIhh,MetI,Mhh,            & 
& MRPetITohhetI,MRGetITohhetI)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhetI(MLambda,em,gs,ZcpletIetIhh,MetI,               & 
& Mhh,MRPetITohhetI,MRGetITohhetI)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITohhetI(cpletIetIhh,ctcpletIetIhh,MetI,            & 
& MetI2,Mhh,Mhh2,ZfetI,Zfhh,AmpWaveetITohhetI)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,            & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,          & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexetITohhetI)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,             & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRdretITohhetI)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,ZcpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,            & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhetIetI1,    & 
& cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cpletIetIetIetI1,           & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,cpletIetIcVWpVWp1,cpletIetIVZVZ1,       & 
& cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRosetITohhetI)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,             & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,ZcpletIetIhh,cplcFdFdetIL,     & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRosetITohhetI)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhetIetI1,    & 
& cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cpletIetIetIetI1,           & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,cpletIetIcVWpVWp1,cpletIetIVZVZ1,       & 
& cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRosetITohhetI)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI(MAh,MetI,MFd,MFe,MFu,Mhh,             & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,              & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,AmpVertexIRosetITohhetI)

 End if 
 End if 
AmpVertexetITohhetI = AmpVertexetITohhetI -  AmpVertexIRdretITohhetI! +  AmpVertexIRosetITohhetI ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITohhetI=0._dp 
AmpVertexZetITohhetI=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZetITohhetI(gt2) = AmpWaveZetITohhetI(gt2)+ZRUZH(gt2,gt1)*AmpWaveetITohhetI(gt1) 
AmpVertexZetITohhetI(gt2)= AmpVertexZetITohhetI(gt2)+ZRUZH(gt2,gt1)*AmpVertexetITohhetI(gt1) 
 End Do 
End Do 
AmpWaveetITohhetI=AmpWaveZetITohhetI 
AmpVertexetITohhetI= AmpVertexZetITohhetI
End if
If (ShiftIRdiv) Then 
AmpVertexetITohhetI = AmpVertexetITohhetI  +  AmpVertexIRosetITohhetI
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->hh etI -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITohhetI = AmpTreeetITohhetI 
 AmpSum2etITohhetI = AmpTreeetITohhetI + 2._dp*AmpWaveetITohhetI + 2._dp*AmpVertexetITohhetI  
Else 
 AmpSumetITohhetI = AmpTreeetITohhetI + AmpWaveetITohhetI + AmpVertexetITohhetI
 AmpSum2etITohhetI = AmpTreeetITohhetI + AmpWaveetITohhetI + AmpVertexetITohhetI 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITohhetI = AmpTreeetITohhetI
 AmpSum2etITohhetI = AmpTreeetITohhetI 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MetIOS.gt.(MhhOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(MetI.gt.(Mhh(gt2)+MetI)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2etITohhetI = AmpTreeetITohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MetIOS,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),MetI,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITohhetI(gt2) 
  AmpSum2etITohhetI = 2._dp*AmpWaveetITohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MetIOS,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),MetI,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITohhetI(gt2) 
  AmpSum2etITohhetI = 2._dp*AmpVertexetITohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MetIOS,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),MetI,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITohhetI(gt2) 
  AmpSum2etITohhetI = AmpTreeetITohhetI + 2._dp*AmpWaveetITohhetI + 2._dp*AmpVertexetITohhetI
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MetIOS,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),MetI,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITohhetI(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITohhetI = AmpTreeetITohhetI
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MetIOS,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
  AmpSqTreeetITohhetI(gt2) = AmpSqetITohhetI(gt2)  
  AmpSum2etITohhetI = + 2._dp*AmpWaveetITohhetI + 2._dp*AmpVertexetITohhetI
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MetIOS,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
  AmpSqetITohhetI(gt2) = AmpSqetITohhetI(gt2) + AmpSqTreeetITohhetI(gt2)  
Else  
  AmpSum2etITohhetI = AmpTreeetITohhetI
  Call SquareAmp_StoSS(MetI,Mhh(gt2),MetI,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
  AmpSqTreeetITohhetI(gt2) = AmpSqetITohhetI(gt2)  
  AmpSum2etITohhetI = + 2._dp*AmpWaveetITohhetI + 2._dp*AmpVertexetITohhetI
  Call SquareAmp_StoSS(MetI,Mhh(gt2),MetI,AmpSumetITohhetI(gt2),AmpSum2etITohhetI(gt2),AmpSqetITohhetI(gt2)) 
  AmpSqetITohhetI(gt2) = AmpSqetITohhetI(gt2) + AmpSqTreeetITohhetI(gt2)  
End if  
Else  
  AmpSqetITohhetI(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetITohhetI(gt2).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MhhOS(gt2),MetIOS,helfactor*AmpSqetITohhetI(gt2))
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,Mhh(gt2),MetI,helfactor*AmpSqetITohhetI(gt2))
End if 
If ((Abs(MRPetITohhetI(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetITohhetI(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITohhetI(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetITohhetI(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPetITohhetI(gt2) + MRGetITohhetI(gt2)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPetITohhetI(gt2) + MRGetITohhetI(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fd) Fd
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITocFdFd(cplcFdFdetIL,cplcFdFdetIR,MetI,            & 
& MFd,MetI2,MFd2,AmpTreeetITocFdFd)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITocFdFd(ZcplcFdFdetIL,ZcplcFdFdetIR,               & 
& MetI,MFd,MetI2,MFd2,AmpTreeetITocFdFd)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFdFd(MLambda,em,gs,cplcFdFdetIL,cplcFdFdetIR,       & 
& MetIOS,MFdOS,MRPetITocFdFd,MRGetITocFdFd)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFdFd(MLambda,em,gs,ZcplcFdFdetIL,ZcplcFdFdetIR,     & 
& MetIOS,MFdOS,MRPetITocFdFd,MRGetITocFdFd)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITocFdFd(MLambda,em,gs,cplcFdFdetIL,cplcFdFdetIR,       & 
& MetI,MFd,MRPetITocFdFd,MRGetITocFdFd)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFdFd(MLambda,em,gs,ZcplcFdFdetIL,ZcplcFdFdetIR,     & 
& MetI,MFd,MRPetITocFdFd,MRGetITocFdFd)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITocFdFd(cplcFdFdetIL,cplcFdFdetIR,ctcplcFdFdetIL,  & 
& ctcplcFdFdetIR,MetI,MetI2,MFd,MFd2,ZfDL,ZfDR,ZfetI,AmpWaveetITocFdFd)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,           & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexetITocFdFd)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexIRdretITocFdFd)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd(MAhOS,MetIOS,MFdOS,MFuOS,             & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cpletIetIetI,cpletIetIhh,ZcplcFdFdetIL,ZcplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,        & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosetITocFdFd)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& ZcplcFdFdetIL,ZcplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexIRosetITocFdFd)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd(MAhOS,MetIOS,MFdOS,MFuOS,             & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,          & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosetITocFdFd)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,AmpVertexIRosetITocFdFd)

 End if 
 End if 
AmpVertexetITocFdFd = AmpVertexetITocFdFd -  AmpVertexIRdretITocFdFd! +  AmpVertexIRosetITocFdFd ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITocFdFd=0._dp 
AmpVertexZetITocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocFdFd(1,gt2,:) = AmpWaveZetITocFdFd(1,gt2,:)+ZRUUd(gt2,gt1)*AmpWaveetITocFdFd(1,gt1,:) 
AmpVertexZetITocFdFd(1,gt2,:)= AmpVertexZetITocFdFd(1,gt2,:)+ZRUUd(gt2,gt1)*AmpVertexetITocFdFd(1,gt1,:) 
AmpWaveZetITocFdFd(2,gt2,:) = AmpWaveZetITocFdFd(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpWaveetITocFdFd(2,gt1,:) 
AmpVertexZetITocFdFd(2,gt2,:)= AmpVertexZetITocFdFd(2,gt2,:)+ZRUVdc(gt2,gt1)*AmpVertexetITocFdFd(2,gt1,:) 
 End Do 
End Do 
AmpWaveetITocFdFd=AmpWaveZetITocFdFd 
AmpVertexetITocFdFd= AmpVertexZetITocFdFd
! Final State 2 
AmpWaveZetITocFdFd=0._dp 
AmpVertexZetITocFdFd=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocFdFd(1,:,gt2) = AmpWaveZetITocFdFd(1,:,gt2)+ZRUVd(gt2,gt1)*AmpWaveetITocFdFd(1,:,gt1) 
AmpVertexZetITocFdFd(1,:,gt2)= AmpVertexZetITocFdFd(1,:,gt2)+ZRUVd(gt2,gt1)*AmpVertexetITocFdFd(1,:,gt1) 
AmpWaveZetITocFdFd(2,:,gt2) = AmpWaveZetITocFdFd(2,:,gt2)+ZRUUd(gt2,gt1)*AmpWaveetITocFdFd(2,:,gt1) 
AmpVertexZetITocFdFd(2,:,gt2)= AmpVertexZetITocFdFd(2,:,gt2)+ZRUUd(gt2,gt1)*AmpVertexetITocFdFd(2,:,gt1) 
 End Do 
End Do 
AmpWaveetITocFdFd=AmpWaveZetITocFdFd 
AmpVertexetITocFdFd= AmpVertexZetITocFdFd
End if
If (ShiftIRdiv) Then 
AmpVertexetITocFdFd = AmpVertexetITocFdFd  +  AmpVertexIRosetITocFdFd
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->bar[Fd] Fd -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITocFdFd = AmpTreeetITocFdFd 
 AmpSum2etITocFdFd = AmpTreeetITocFdFd + 2._dp*AmpWaveetITocFdFd + 2._dp*AmpVertexetITocFdFd  
Else 
 AmpSumetITocFdFd = AmpTreeetITocFdFd + AmpWaveetITocFdFd + AmpVertexetITocFdFd
 AmpSum2etITocFdFd = AmpTreeetITocFdFd + AmpWaveetITocFdFd + AmpVertexetITocFdFd 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITocFdFd = AmpTreeetITocFdFd
 AmpSum2etITocFdFd = AmpTreeetITocFdFd 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MetIOS.gt.(MFdOS(gt2)+MFdOS(gt3)))).or.((.not.OSkinematics).and.(MetI.gt.(MFd(gt2)+MFd(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2etITocFdFd = AmpTreeetITocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFdOS(gt2),MFdOS(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFd(gt2),MFd(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITocFdFd(gt2, gt3) 
  AmpSum2etITocFdFd = 2._dp*AmpWaveetITocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFdOS(gt2),MFdOS(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFd(gt2),MFd(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITocFdFd(gt2, gt3) 
  AmpSum2etITocFdFd = 2._dp*AmpVertexetITocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFdOS(gt2),MFdOS(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFd(gt2),MFd(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITocFdFd(gt2, gt3) 
  AmpSum2etITocFdFd = AmpTreeetITocFdFd + 2._dp*AmpWaveetITocFdFd + 2._dp*AmpVertexetITocFdFd
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFdOS(gt2),MFdOS(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFd(gt2),MFd(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITocFdFd(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITocFdFd = AmpTreeetITocFdFd
  Call SquareAmp_StoFF(MetIOS,MFdOS(gt2),MFdOS(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
  AmpSqTreeetITocFdFd(gt2, gt3) = AmpSqetITocFdFd(gt2, gt3)  
  AmpSum2etITocFdFd = + 2._dp*AmpWaveetITocFdFd + 2._dp*AmpVertexetITocFdFd
  Call SquareAmp_StoFF(MetIOS,MFdOS(gt2),MFdOS(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
  AmpSqetITocFdFd(gt2, gt3) = AmpSqetITocFdFd(gt2, gt3) + AmpSqTreeetITocFdFd(gt2, gt3)  
Else  
  AmpSum2etITocFdFd = AmpTreeetITocFdFd
  Call SquareAmp_StoFF(MetI,MFd(gt2),MFd(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
  AmpSqTreeetITocFdFd(gt2, gt3) = AmpSqetITocFdFd(gt2, gt3)  
  AmpSum2etITocFdFd = + 2._dp*AmpWaveetITocFdFd + 2._dp*AmpVertexetITocFdFd
  Call SquareAmp_StoFF(MetI,MFd(gt2),MFd(gt3),AmpSumetITocFdFd(:,gt2, gt3),AmpSum2etITocFdFd(:,gt2, gt3),AmpSqetITocFdFd(gt2, gt3)) 
  AmpSqetITocFdFd(gt2, gt3) = AmpSqetITocFdFd(gt2, gt3) + AmpSqTreeetITocFdFd(gt2, gt3)  
End if  
Else  
  AmpSqetITocFdFd(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqetITocFdFd(gt2, gt3).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 3._dp*GammaTPS(MetIOS,MFdOS(gt2),MFdOS(gt3),helfactor*AmpSqetITocFdFd(gt2, gt3))
Else 
  gP1LetI(gt1,i4) = 3._dp*GammaTPS(MetI,MFd(gt2),MFd(gt3),helfactor*AmpSqetITocFdFd(gt2, gt3))
End if 
If ((Abs(MRPetITocFdFd(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocFdFd(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITocFdFd(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocFdFd(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPetITocFdFd(gt2, gt3) + MRGetITocFdFd(gt2, gt3)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPetITocFdFd(gt2, gt3) + MRGetITocFdFd(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fe) Fe
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITocFeFe(cplcFeFeetIL,cplcFeFeetIR,MetI,            & 
& MFe,MetI2,MFe2,AmpTreeetITocFeFe)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITocFeFe(ZcplcFeFeetIL,ZcplcFeFeetIR,               & 
& MetI,MFe,MetI2,MFe2,AmpTreeetITocFeFe)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFeFe(MLambda,em,gs,cplcFeFeetIL,cplcFeFeetIR,       & 
& MetIOS,MFeOS,MRPetITocFeFe,MRGetITocFeFe)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFeFe(MLambda,em,gs,ZcplcFeFeetIL,ZcplcFeFeetIR,     & 
& MetIOS,MFeOS,MRPetITocFeFe,MRGetITocFeFe)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITocFeFe(MLambda,em,gs,cplcFeFeetIL,cplcFeFeetIR,       & 
& MetI,MFe,MRPetITocFeFe,MRGetITocFeFe)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFeFe(MLambda,em,gs,ZcplcFeFeetIL,ZcplcFeFeetIR,     & 
& MetI,MFe,MRPetITocFeFe,MRGetITocFeFe)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITocFeFe(cplcFeFeetIL,cplcFeFeetIR,ctcplcFeFeetIL,  & 
& ctcplcFeFeetIR,MetI,MetI2,MFe,MFe2,ZfEL,ZfER,ZfetI,AmpWaveetITocFeFe)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,            & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,        & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,cplcFeFeetIL,              & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexetITocFeFe)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,cplcFeFeetIL,              & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRdretITocFeFe)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe(MAhOS,MetIOS,MFeOS,MFvOS,             & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,         & 
& cpletIetIetI,cpletIetIhh,ZcplcFeFeetIL,ZcplcFeFeetIR,cpletIhhhh,cpletIhhVZ,            & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,              & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosetITocFeFe)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,ZcplcFeFeetIL,             & 
& ZcplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosetITocFeFe)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe(MAhOS,MetIOS,MFeOS,MFvOS,             & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,         & 
& cpletIetIetI,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,              & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,              & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosetITocFeFe)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe(MAh,MetI,MFe,MFv,Mhh,MHm,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,    & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,cplcFeFeetIL,              & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,              & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexIRosetITocFeFe)

 End if 
 End if 
AmpVertexetITocFeFe = AmpVertexetITocFeFe -  AmpVertexIRdretITocFeFe! +  AmpVertexIRosetITocFeFe ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITocFeFe=0._dp 
AmpVertexZetITocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocFeFe(1,gt2,:) = AmpWaveZetITocFeFe(1,gt2,:)+ZRUUe(gt2,gt1)*AmpWaveetITocFeFe(1,gt1,:) 
AmpVertexZetITocFeFe(1,gt2,:)= AmpVertexZetITocFeFe(1,gt2,:)+ZRUUe(gt2,gt1)*AmpVertexetITocFeFe(1,gt1,:) 
AmpWaveZetITocFeFe(2,gt2,:) = AmpWaveZetITocFeFe(2,gt2,:)+ZRUVec(gt2,gt1)*AmpWaveetITocFeFe(2,gt1,:) 
AmpVertexZetITocFeFe(2,gt2,:)= AmpVertexZetITocFeFe(2,gt2,:)+ZRUVec(gt2,gt1)*AmpVertexetITocFeFe(2,gt1,:) 
 End Do 
End Do 
AmpWaveetITocFeFe=AmpWaveZetITocFeFe 
AmpVertexetITocFeFe= AmpVertexZetITocFeFe
! Final State 2 
AmpWaveZetITocFeFe=0._dp 
AmpVertexZetITocFeFe=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocFeFe(1,:,gt2) = AmpWaveZetITocFeFe(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveetITocFeFe(1,:,gt1) 
AmpVertexZetITocFeFe(1,:,gt2)= AmpVertexZetITocFeFe(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexetITocFeFe(1,:,gt1) 
AmpWaveZetITocFeFe(2,:,gt2) = AmpWaveZetITocFeFe(2,:,gt2)+ZRUUe(gt2,gt1)*AmpWaveetITocFeFe(2,:,gt1) 
AmpVertexZetITocFeFe(2,:,gt2)= AmpVertexZetITocFeFe(2,:,gt2)+ZRUUe(gt2,gt1)*AmpVertexetITocFeFe(2,:,gt1) 
 End Do 
End Do 
AmpWaveetITocFeFe=AmpWaveZetITocFeFe 
AmpVertexetITocFeFe= AmpVertexZetITocFeFe
End if
If (ShiftIRdiv) Then 
AmpVertexetITocFeFe = AmpVertexetITocFeFe  +  AmpVertexIRosetITocFeFe
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->bar[Fe] Fe -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITocFeFe = AmpTreeetITocFeFe 
 AmpSum2etITocFeFe = AmpTreeetITocFeFe + 2._dp*AmpWaveetITocFeFe + 2._dp*AmpVertexetITocFeFe  
Else 
 AmpSumetITocFeFe = AmpTreeetITocFeFe + AmpWaveetITocFeFe + AmpVertexetITocFeFe
 AmpSum2etITocFeFe = AmpTreeetITocFeFe + AmpWaveetITocFeFe + AmpVertexetITocFeFe 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITocFeFe = AmpTreeetITocFeFe
 AmpSum2etITocFeFe = AmpTreeetITocFeFe 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MetIOS.gt.(MFeOS(gt2)+MFeOS(gt3)))).or.((.not.OSkinematics).and.(MetI.gt.(MFe(gt2)+MFe(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2etITocFeFe = AmpTreeetITocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFeOS(gt2),MFeOS(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFe(gt2),MFe(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITocFeFe(gt2, gt3) 
  AmpSum2etITocFeFe = 2._dp*AmpWaveetITocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFeOS(gt2),MFeOS(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFe(gt2),MFe(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITocFeFe(gt2, gt3) 
  AmpSum2etITocFeFe = 2._dp*AmpVertexetITocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFeOS(gt2),MFeOS(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFe(gt2),MFe(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITocFeFe(gt2, gt3) 
  AmpSum2etITocFeFe = AmpTreeetITocFeFe + 2._dp*AmpWaveetITocFeFe + 2._dp*AmpVertexetITocFeFe
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFeOS(gt2),MFeOS(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFe(gt2),MFe(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITocFeFe(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITocFeFe = AmpTreeetITocFeFe
  Call SquareAmp_StoFF(MetIOS,MFeOS(gt2),MFeOS(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
  AmpSqTreeetITocFeFe(gt2, gt3) = AmpSqetITocFeFe(gt2, gt3)  
  AmpSum2etITocFeFe = + 2._dp*AmpWaveetITocFeFe + 2._dp*AmpVertexetITocFeFe
  Call SquareAmp_StoFF(MetIOS,MFeOS(gt2),MFeOS(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
  AmpSqetITocFeFe(gt2, gt3) = AmpSqetITocFeFe(gt2, gt3) + AmpSqTreeetITocFeFe(gt2, gt3)  
Else  
  AmpSum2etITocFeFe = AmpTreeetITocFeFe
  Call SquareAmp_StoFF(MetI,MFe(gt2),MFe(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
  AmpSqTreeetITocFeFe(gt2, gt3) = AmpSqetITocFeFe(gt2, gt3)  
  AmpSum2etITocFeFe = + 2._dp*AmpWaveetITocFeFe + 2._dp*AmpVertexetITocFeFe
  Call SquareAmp_StoFF(MetI,MFe(gt2),MFe(gt3),AmpSumetITocFeFe(:,gt2, gt3),AmpSum2etITocFeFe(:,gt2, gt3),AmpSqetITocFeFe(gt2, gt3)) 
  AmpSqetITocFeFe(gt2, gt3) = AmpSqetITocFeFe(gt2, gt3) + AmpSqTreeetITocFeFe(gt2, gt3)  
End if  
Else  
  AmpSqetITocFeFe(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqetITocFeFe(gt2, gt3).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MFeOS(gt2),MFeOS(gt3),helfactor*AmpSqetITocFeFe(gt2, gt3))
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,MFe(gt2),MFe(gt3),helfactor*AmpSqetITocFeFe(gt2, gt3))
End if 
If ((Abs(MRPetITocFeFe(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocFeFe(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITocFeFe(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocFeFe(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPetITocFeFe(gt2, gt3) + MRGetITocFeFe(gt2, gt3)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPetITocFeFe(gt2, gt3) + MRGetITocFeFe(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! bar(Fu) Fu
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITocFuFu(cplcFuFuetIL,cplcFuFuetIR,MetI,            & 
& MFu,MetI2,MFu2,AmpTreeetITocFuFu)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITocFuFu(ZcplcFuFuetIL,ZcplcFuFuetIR,               & 
& MetI,MFu,MetI2,MFu2,AmpTreeetITocFuFu)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFuFu(MLambda,em,gs,cplcFuFuetIL,cplcFuFuetIR,       & 
& MetIOS,MFuOS,MRPetITocFuFu,MRGetITocFuFu)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFuFu(MLambda,em,gs,ZcplcFuFuetIL,ZcplcFuFuetIR,     & 
& MetIOS,MFuOS,MRPetITocFuFu,MRGetITocFuFu)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITocFuFu(MLambda,em,gs,cplcFuFuetIL,cplcFuFuetIR,       & 
& MetI,MFu,MRPetITocFuFu,MRGetITocFuFu)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocFuFu(MLambda,em,gs,ZcplcFuFuetIL,ZcplcFuFuetIR,     & 
& MetI,MFu,MRPetITocFuFu,MRGetITocFuFu)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITocFuFu(cplcFuFuetIL,cplcFuFuetIR,ctcplcFuFuetIL,  & 
& ctcplcFuFuetIR,MetI,MetI2,MFu,MFu2,ZfetI,ZfUL,ZfUR,AmpWaveetITocFuFu)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,MVG,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,           & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexetITocFuFu)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexIRdretITocFuFu)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu(MAhOS,MetIOS,MFdOS,MFuOS,             & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,    & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,        & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,               & 
& cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosetITocFuFu)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexIRosetITocFuFu)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu(MAhOS,MetIOS,MFdOS,MFuOS,             & 
& MhhOS,MHmOS,MVG,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFu2OS,Mhh2OS,MHm2OS,           & 
& MVG2,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,    & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,          & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,               & 
& cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,AmpVertexIRosetITocFuFu)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu(MAh,MetI,MFd,MFu,Mhh,MHm,             & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhetI,       & 
& cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,AmpVertexIRosetITocFuFu)

 End if 
 End if 
AmpVertexetITocFuFu = AmpVertexetITocFuFu -  AmpVertexIRdretITocFuFu! +  AmpVertexIRosetITocFuFu ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITocFuFu=0._dp 
AmpVertexZetITocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocFuFu(1,gt2,:) = AmpWaveZetITocFuFu(1,gt2,:)+ZRUUu(gt2,gt1)*AmpWaveetITocFuFu(1,gt1,:) 
AmpVertexZetITocFuFu(1,gt2,:)= AmpVertexZetITocFuFu(1,gt2,:)+ZRUUu(gt2,gt1)*AmpVertexetITocFuFu(1,gt1,:) 
AmpWaveZetITocFuFu(2,gt2,:) = AmpWaveZetITocFuFu(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpWaveetITocFuFu(2,gt1,:) 
AmpVertexZetITocFuFu(2,gt2,:)= AmpVertexZetITocFuFu(2,gt2,:)+ZRUVuc(gt2,gt1)*AmpVertexetITocFuFu(2,gt1,:) 
 End Do 
End Do 
AmpWaveetITocFuFu=AmpWaveZetITocFuFu 
AmpVertexetITocFuFu= AmpVertexZetITocFuFu
! Final State 2 
AmpWaveZetITocFuFu=0._dp 
AmpVertexZetITocFuFu=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocFuFu(1,:,gt2) = AmpWaveZetITocFuFu(1,:,gt2)+ZRUVu(gt2,gt1)*AmpWaveetITocFuFu(1,:,gt1) 
AmpVertexZetITocFuFu(1,:,gt2)= AmpVertexZetITocFuFu(1,:,gt2)+ZRUVu(gt2,gt1)*AmpVertexetITocFuFu(1,:,gt1) 
AmpWaveZetITocFuFu(2,:,gt2) = AmpWaveZetITocFuFu(2,:,gt2)+ZRUUu(gt2,gt1)*AmpWaveetITocFuFu(2,:,gt1) 
AmpVertexZetITocFuFu(2,:,gt2)= AmpVertexZetITocFuFu(2,:,gt2)+ZRUUu(gt2,gt1)*AmpVertexetITocFuFu(2,:,gt1) 
 End Do 
End Do 
AmpWaveetITocFuFu=AmpWaveZetITocFuFu 
AmpVertexetITocFuFu= AmpVertexZetITocFuFu
End if
If (ShiftIRdiv) Then 
AmpVertexetITocFuFu = AmpVertexetITocFuFu  +  AmpVertexIRosetITocFuFu
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->bar[Fu] Fu -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITocFuFu = AmpTreeetITocFuFu 
 AmpSum2etITocFuFu = AmpTreeetITocFuFu + 2._dp*AmpWaveetITocFuFu + 2._dp*AmpVertexetITocFuFu  
Else 
 AmpSumetITocFuFu = AmpTreeetITocFuFu + AmpWaveetITocFuFu + AmpVertexetITocFuFu
 AmpSum2etITocFuFu = AmpTreeetITocFuFu + AmpWaveetITocFuFu + AmpVertexetITocFuFu 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITocFuFu = AmpTreeetITocFuFu
 AmpSum2etITocFuFu = AmpTreeetITocFuFu 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=1,3
If (((OSkinematics).and.(MetIOS.gt.(MFuOS(gt2)+MFuOS(gt3)))).or.((.not.OSkinematics).and.(MetI.gt.(MFu(gt2)+MFu(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2etITocFuFu = AmpTreeetITocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFuOS(gt2),MFuOS(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFu(gt2),MFu(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITocFuFu(gt2, gt3) 
  AmpSum2etITocFuFu = 2._dp*AmpWaveetITocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFuOS(gt2),MFuOS(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFu(gt2),MFu(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITocFuFu(gt2, gt3) 
  AmpSum2etITocFuFu = 2._dp*AmpVertexetITocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFuOS(gt2),MFuOS(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFu(gt2),MFu(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITocFuFu(gt2, gt3) 
  AmpSum2etITocFuFu = AmpTreeetITocFuFu + 2._dp*AmpWaveetITocFuFu + 2._dp*AmpVertexetITocFuFu
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFuOS(gt2),MFuOS(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFu(gt2),MFu(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITocFuFu(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITocFuFu = AmpTreeetITocFuFu
  Call SquareAmp_StoFF(MetIOS,MFuOS(gt2),MFuOS(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
  AmpSqTreeetITocFuFu(gt2, gt3) = AmpSqetITocFuFu(gt2, gt3)  
  AmpSum2etITocFuFu = + 2._dp*AmpWaveetITocFuFu + 2._dp*AmpVertexetITocFuFu
  Call SquareAmp_StoFF(MetIOS,MFuOS(gt2),MFuOS(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
  AmpSqetITocFuFu(gt2, gt3) = AmpSqetITocFuFu(gt2, gt3) + AmpSqTreeetITocFuFu(gt2, gt3)  
Else  
  AmpSum2etITocFuFu = AmpTreeetITocFuFu
  Call SquareAmp_StoFF(MetI,MFu(gt2),MFu(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
  AmpSqTreeetITocFuFu(gt2, gt3) = AmpSqetITocFuFu(gt2, gt3)  
  AmpSum2etITocFuFu = + 2._dp*AmpWaveetITocFuFu + 2._dp*AmpVertexetITocFuFu
  Call SquareAmp_StoFF(MetI,MFu(gt2),MFu(gt3),AmpSumetITocFuFu(:,gt2, gt3),AmpSum2etITocFuFu(:,gt2, gt3),AmpSqetITocFuFu(gt2, gt3)) 
  AmpSqetITocFuFu(gt2, gt3) = AmpSqetITocFuFu(gt2, gt3) + AmpSqTreeetITocFuFu(gt2, gt3)  
End if  
Else  
  AmpSqetITocFuFu(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (AmpSqetITocFuFu(gt2, gt3).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 3._dp*GammaTPS(MetIOS,MFuOS(gt2),MFuOS(gt3),helfactor*AmpSqetITocFuFu(gt2, gt3))
Else 
  gP1LetI(gt1,i4) = 3._dp*GammaTPS(MetI,MFu(gt2),MFu(gt3),helfactor*AmpSqetITocFuFu(gt2, gt3))
End if 
If ((Abs(MRPetITocFuFu(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocFuFu(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITocFuFu(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocFuFu(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPetITocFuFu(gt2, gt3) + MRGetITocFuFu(gt2, gt3)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPetITocFuFu(gt2, gt3) + MRGetITocFuFu(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh hh
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITohhhh(cpletIhhhh,MetI,Mhh,MetI2,Mhh2,             & 
& AmpTreeetITohhhh)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITohhhh(ZcpletIhhhh,MetI,Mhh,MetI2,Mhh2,            & 
& AmpTreeetITohhhh)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhhh(MLambda,em,gs,cpletIhhhh,MetIOS,MhhOS,          & 
& MRPetITohhhh,MRGetITohhhh)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhhh(MLambda,em,gs,ZcpletIhhhh,MetIOS,               & 
& MhhOS,MRPetITohhhh,MRGetITohhhh)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITohhhh(MLambda,em,gs,cpletIhhhh,MetI,Mhh,              & 
& MRPetITohhhh,MRGetITohhhh)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhhh(MLambda,em,gs,ZcpletIhhhh,MetI,Mhh,             & 
& MRPetITohhhh,MRGetITohhhh)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITohhhh(cpletIhhhh,ctcpletIhhhh,MetI,               & 
& MetI2,Mhh,Mhh2,ZfetI,Zfhh,AmpWaveetITohhhh)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,             & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,          & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexetITohhhh)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRdretITohhhh)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,ZcpletIhhhh,        & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplAhAhetIhh1,               & 
& cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,cpletIetIhhhh1, & 
& cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRosetITohhhh)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,ZcpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRosetITohhhh)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,             & 
& MHm2OS,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,           & 
& cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplAhAhetIhh1,               & 
& cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,cpletIetIhhhh1, & 
& cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRosetITohhhh)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIetIhh1,  & 
& cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,cplhhhhHmcHm1,AmpVertexIRosetITohhhh)

 End if 
 End if 
AmpVertexetITohhhh = AmpVertexetITohhhh -  AmpVertexIRdretITohhhh! +  AmpVertexIRosetITohhhh ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITohhhh=0._dp 
AmpVertexZetITohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZetITohhhh(gt2,:) = AmpWaveZetITohhhh(gt2,:)+ZRUZH(gt2,gt1)*AmpWaveetITohhhh(gt1,:) 
AmpVertexZetITohhhh(gt2,:)= AmpVertexZetITohhhh(gt2,:)+ZRUZH(gt2,gt1)*AmpVertexetITohhhh(gt1,:) 
 End Do 
End Do 
AmpWaveetITohhhh=AmpWaveZetITohhhh 
AmpVertexetITohhhh= AmpVertexZetITohhhh
! Final State 2 
AmpWaveZetITohhhh=0._dp 
AmpVertexZetITohhhh=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZetITohhhh(:,gt2) = AmpWaveZetITohhhh(:,gt2)+ZRUZH(gt2,gt1)*AmpWaveetITohhhh(:,gt1) 
AmpVertexZetITohhhh(:,gt2)= AmpVertexZetITohhhh(:,gt2)+ZRUZH(gt2,gt1)*AmpVertexetITohhhh(:,gt1) 
 End Do 
End Do 
AmpWaveetITohhhh=AmpWaveZetITohhhh 
AmpVertexetITohhhh= AmpVertexZetITohhhh
End if
If (ShiftIRdiv) Then 
AmpVertexetITohhhh = AmpVertexetITohhhh  +  AmpVertexIRosetITohhhh
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->hh hh -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITohhhh = AmpTreeetITohhhh 
 AmpSum2etITohhhh = AmpTreeetITohhhh + 2._dp*AmpWaveetITohhhh + 2._dp*AmpVertexetITohhhh  
Else 
 AmpSumetITohhhh = AmpTreeetITohhhh + AmpWaveetITohhhh + AmpVertexetITohhhh
 AmpSum2etITohhhh = AmpTreeetITohhhh + AmpWaveetITohhhh + AmpVertexetITohhhh 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITohhhh = AmpTreeetITohhhh
 AmpSum2etITohhhh = AmpTreeetITohhhh 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,2
    Do gt3=gt2,2
If (((OSkinematics).and.(MetIOS.gt.(MhhOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MetI.gt.(Mhh(gt2)+Mhh(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2etITohhhh = AmpTreeetITohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MhhOS(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),Mhh(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITohhhh(gt2, gt3) 
  AmpSum2etITohhhh = 2._dp*AmpWaveetITohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MhhOS(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),Mhh(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITohhhh(gt2, gt3) 
  AmpSum2etITohhhh = 2._dp*AmpVertexetITohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MhhOS(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),Mhh(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITohhhh(gt2, gt3) 
  AmpSum2etITohhhh = AmpTreeetITohhhh + 2._dp*AmpWaveetITohhhh + 2._dp*AmpVertexetITohhhh
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MhhOS(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,Mhh(gt2),Mhh(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITohhhh(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITohhhh = AmpTreeetITohhhh
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MhhOS(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
  AmpSqTreeetITohhhh(gt2, gt3) = AmpSqetITohhhh(gt2, gt3)  
  AmpSum2etITohhhh = + 2._dp*AmpWaveetITohhhh + 2._dp*AmpVertexetITohhhh
  Call SquareAmp_StoSS(MetIOS,MhhOS(gt2),MhhOS(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
  AmpSqetITohhhh(gt2, gt3) = AmpSqetITohhhh(gt2, gt3) + AmpSqTreeetITohhhh(gt2, gt3)  
Else  
  AmpSum2etITohhhh = AmpTreeetITohhhh
  Call SquareAmp_StoSS(MetI,Mhh(gt2),Mhh(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
  AmpSqTreeetITohhhh(gt2, gt3) = AmpSqetITohhhh(gt2, gt3)  
  AmpSum2etITohhhh = + 2._dp*AmpWaveetITohhhh + 2._dp*AmpVertexetITohhhh
  Call SquareAmp_StoSS(MetI,Mhh(gt2),Mhh(gt3),AmpSumetITohhhh(gt2, gt3),AmpSum2etITohhhh(gt2, gt3),AmpSqetITohhhh(gt2, gt3)) 
  AmpSqetITohhhh(gt2, gt3) = AmpSqetITohhhh(gt2, gt3) + AmpSqTreeetITohhhh(gt2, gt3)  
End if  
Else  
  AmpSqetITohhhh(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqetITohhhh(gt2, gt3).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp/2._dp*GammaTPS(MetIOS,MhhOS(gt2),MhhOS(gt3),helfactor*AmpSqetITohhhh(gt2, gt3))
Else 
  gP1LetI(gt1,i4) = 1._dp/2._dp*GammaTPS(MetI,Mhh(gt2),Mhh(gt3),helfactor*AmpSqetITohhhh(gt2, gt3))
End if 
If ((Abs(MRPetITohhhh(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITohhhh(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITohhhh(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITohhhh(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp/4._dp*helfactor*(MRPetITohhhh(gt2, gt3) + MRGetITohhhh(gt2, gt3)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*1._dp/4._dp*helfactor*(MRPetITohhhh(gt2, gt3) + MRGetITohhhh(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! hh VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITohhVZ(cpletIhhVZ,MetI,Mhh,MVZ,MetI2,              & 
& Mhh2,MVZ2,AmpTreeetITohhVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITohhVZ(ZcpletIhhVZ,MetI,Mhh,MVZ,MetI2,             & 
& Mhh2,MVZ2,AmpTreeetITohhVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhVZ(MLambda,em,gs,cpletIhhVZ,MetIOS,MhhOS,          & 
& MVZOS,MRPetITohhVZ,MRGetITohhVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhVZ(MLambda,em,gs,ZcpletIhhVZ,MetIOS,               & 
& MhhOS,MVZOS,MRPetITohhVZ,MRGetITohhVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITohhVZ(MLambda,em,gs,cpletIhhVZ,MetI,Mhh,              & 
& MVZ,MRPetITohhVZ,MRGetITohhVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITohhVZ(MLambda,em,gs,ZcpletIhhVZ,MetI,Mhh,             & 
& MVZ,MRPetITohhVZ,MRGetITohhVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITohhVZ(cpletIhhVZ,ctcpletIhhVZ,MetI,               & 
& MetI2,Mhh,Mhh2,MVZ,MVZ2,ZfetI,Zfhh,ZfVZ,AmpWaveetITohhVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITohhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,             & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,          & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexetITohhVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexIRdretITohhVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ(MAhOS,MetIOS,MFdOS,MFeOS,              & 
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
& AmpVertexIRosetITohhVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,ZcpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexIRosetITohhVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ(MAhOS,MetIOS,MFdOS,MFeOS,              & 
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
& AmpVertexIRosetITohhVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,              & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhAhhh,      & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,      & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,AmpVertexIRosetITohhVZ)

 End if 
 End if 
AmpVertexetITohhVZ = AmpVertexetITohhVZ -  AmpVertexIRdretITohhVZ! +  AmpVertexIRosetITohhVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITohhVZ=0._dp 
AmpVertexZetITohhVZ=0._dp 
Do gt1=1,2
  Do gt2=1,2
AmpWaveZetITohhVZ(:,gt2) = AmpWaveZetITohhVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpWaveetITohhVZ(:,gt1) 
AmpVertexZetITohhVZ(:,gt2)= AmpVertexZetITohhVZ(:,gt2)+ZRUZH(gt2,gt1)*AmpVertexetITohhVZ(:,gt1) 
 End Do 
End Do 
AmpWaveetITohhVZ=AmpWaveZetITohhVZ 
AmpVertexetITohhVZ= AmpVertexZetITohhVZ
End if
If (ShiftIRdiv) Then 
AmpVertexetITohhVZ = AmpVertexetITohhVZ  +  AmpVertexIRosetITohhVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->hh VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITohhVZ = AmpTreeetITohhVZ 
 AmpSum2etITohhVZ = AmpTreeetITohhVZ + 2._dp*AmpWaveetITohhVZ + 2._dp*AmpVertexetITohhVZ  
Else 
 AmpSumetITohhVZ = AmpTreeetITohhVZ + AmpWaveetITohhVZ + AmpVertexetITohhVZ
 AmpSum2etITohhVZ = AmpTreeetITohhVZ + AmpWaveetITohhVZ + AmpVertexetITohhVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITohhVZ = AmpTreeetITohhVZ
 AmpSum2etITohhVZ = AmpTreeetITohhVZ 
End if 
gt1=1 
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MetIOS.gt.(MhhOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MetI.gt.(Mhh(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2etITohhVZ = AmpTreeetITohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),MVZOS,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVZ,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITohhVZ(gt2) 
  AmpSum2etITohhVZ = 2._dp*AmpWaveetITohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),MVZOS,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVZ,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITohhVZ(gt2) 
  AmpSum2etITohhVZ = 2._dp*AmpVertexetITohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),MVZOS,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVZ,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITohhVZ(gt2) 
  AmpSum2etITohhVZ = AmpTreeetITohhVZ + 2._dp*AmpWaveetITohhVZ + 2._dp*AmpVertexetITohhVZ
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),MVZOS,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVZ,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITohhVZ(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITohhVZ = AmpTreeetITohhVZ
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),MVZOS,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
  AmpSqTreeetITohhVZ(gt2) = AmpSqetITohhVZ(gt2)  
  AmpSum2etITohhVZ = + 2._dp*AmpWaveetITohhVZ + 2._dp*AmpVertexetITohhVZ
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),MVZOS,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
  AmpSqetITohhVZ(gt2) = AmpSqetITohhVZ(gt2) + AmpSqTreeetITohhVZ(gt2)  
Else  
  AmpSum2etITohhVZ = AmpTreeetITohhVZ
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVZ,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
  AmpSqTreeetITohhVZ(gt2) = AmpSqetITohhVZ(gt2)  
  AmpSum2etITohhVZ = + 2._dp*AmpWaveetITohhVZ + 2._dp*AmpVertexetITohhVZ
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVZ,AmpSumetITohhVZ(:,gt2),AmpSum2etITohhVZ(:,gt2),AmpSqetITohhVZ(gt2)) 
  AmpSqetITohhVZ(gt2) = AmpSqetITohhVZ(gt2) + AmpSqTreeetITohhVZ(gt2)  
End if  
Else  
  AmpSqetITohhVZ(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetITohhVZ(gt2).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MhhOS(gt2),MVZOS,helfactor*AmpSqetITohhVZ(gt2))
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,Mhh(gt2),MVZ,helfactor*AmpSqetITohhVZ(gt2))
End if 
If ((Abs(MRPetITohhVZ(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetITohhVZ(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITohhVZ(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetITohhVZ(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPetITohhVZ(gt2) + MRGetITohhVZ(gt2)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPetITohhVZ(gt2) + MRGetITohhVZ(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Hm VWp
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etIToHmVWp(cpletIHmVWp,MetI,MHm,MVWp,MetI2,           & 
& MHm2,MVWp2,AmpTreeetIToHmVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_etIToHmVWp(ZcpletIHmVWp,MetI,MHm,MVWp,MetI2,          & 
& MHm2,MVWp2,AmpTreeetIToHmVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etIToHmVWp(MLambda,em,gs,cpletIHmVWp,MetIOS,              & 
& MHmOS,MVWpOS,MRPetIToHmVWp,MRGetIToHmVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etIToHmVWp(MLambda,em,gs,ZcpletIHmVWp,MetIOS,             & 
& MHmOS,MVWpOS,MRPetIToHmVWp,MRGetIToHmVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etIToHmVWp(MLambda,em,gs,cpletIHmVWp,MetI,MHm,            & 
& MVWp,MRPetIToHmVWp,MRGetIToHmVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etIToHmVWp(MLambda,em,gs,ZcpletIHmVWp,MetI,               & 
& MHm,MVWp,MRPetIToHmVWp,MRGetIToHmVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etIToHmVWp(cpletIHmVWp,ctcpletIHmVWp,MetI,            & 
& MetI2,MHm,MHm2,MVWp,MVWp2,ZfetI,ZfHm,ZfVWp,AmpWaveetIToHmVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cpletIetIetI,cpletIetIhh,      & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,cplcgAgWCVWp,           & 
& cplcgZgWCVWp,cplcgWCgZHm,cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIetIcVWpVWp1,& 
& cpletIHmVPVWp1,cpletIHmVWpVZ1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexetIToHmVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cpletIetIetI,             & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,           & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,              & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,        & 
& AmpVertexIRdretIToHmVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmVWp,cplAhHmcHm,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,ZcpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,              & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,            & 
& cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,GosZcplHmVPVWp,cplHmcHmVP,             & 
& cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIetIcVWpVWp1,cpletIHmVPVWp1,      & 
& cpletIHmVWpVZ1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRosetIToHmVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cpletIetIetI,             & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,ZcpletIHmVWp,           & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,           & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,              & 
& cplhhcVWpVWp,GZcplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,               & 
& cplcVWpVWpVZ,cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cplhhHmVWpVZ1,            & 
& cplHmcHmcVWpVWp1,AmpVertexIRosetIToHmVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp(MAhOS,MetIOS,MFdOS,MFeOS,             & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmVWp,cplAhHmcHm,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,               & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,            & 
& cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,GcplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,     & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,  & 
& cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,AmpVertexIRosetIToHmVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp(MAh,MetI,MFd,MFe,MFu,MFv,             & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cpletIetIetI,             & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,           & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,              & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,        & 
& AmpVertexIRosetIToHmVWp)

 End if 
 End if 
AmpVertexetIToHmVWp = AmpVertexetIToHmVWp -  AmpVertexIRdretIToHmVWp! +  AmpVertexIRosetIToHmVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetIToHmVWp=0._dp 
AmpVertexZetIToHmVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetIToHmVWp(:,gt2) = AmpWaveZetIToHmVWp(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveetIToHmVWp(:,gt1) 
AmpVertexZetIToHmVWp(:,gt2)= AmpVertexZetIToHmVWp(:,gt2)+ZRUZP(gt2,gt1)*AmpVertexetIToHmVWp(:,gt1) 
 End Do 
End Do 
AmpWaveetIToHmVWp=AmpWaveZetIToHmVWp 
AmpVertexetIToHmVWp= AmpVertexZetIToHmVWp
End if
If (ShiftIRdiv) Then 
AmpVertexetIToHmVWp = AmpVertexetIToHmVWp  +  AmpVertexIRosetIToHmVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->Hm VWp -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetIToHmVWp = AmpTreeetIToHmVWp 
 AmpSum2etIToHmVWp = AmpTreeetIToHmVWp + 2._dp*AmpWaveetIToHmVWp + 2._dp*AmpVertexetIToHmVWp  
Else 
 AmpSumetIToHmVWp = AmpTreeetIToHmVWp + AmpWaveetIToHmVWp + AmpVertexetIToHmVWp
 AmpSum2etIToHmVWp = AmpTreeetIToHmVWp + AmpWaveetIToHmVWp + AmpVertexetIToHmVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToHmVWp = AmpTreeetIToHmVWp
 AmpSum2etIToHmVWp = AmpTreeetIToHmVWp 
End if 
gt1=1 
i4 = isave 
  Do gt2=2,3
If (((OSkinematics).and.(MetIOS.gt.(MHmOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(MetI.gt.(MHm(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2 
  AmpSum2etIToHmVWp = AmpTreeetIToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MHmOS(gt2),MVWpOS,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,MHm(gt2),MVWp,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetIToHmVWp(gt2) 
  AmpSum2etIToHmVWp = 2._dp*AmpWaveetIToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MHmOS(gt2),MVWpOS,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,MHm(gt2),MVWp,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetIToHmVWp(gt2) 
  AmpSum2etIToHmVWp = 2._dp*AmpVertexetIToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MHmOS(gt2),MVWpOS,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,MHm(gt2),MVWp,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetIToHmVWp(gt2) 
  AmpSum2etIToHmVWp = AmpTreeetIToHmVWp + 2._dp*AmpWaveetIToHmVWp + 2._dp*AmpVertexetIToHmVWp
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MHmOS(gt2),MVWpOS,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,MHm(gt2),MVWp,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetIToHmVWp(gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2etIToHmVWp = AmpTreeetIToHmVWp
  Call SquareAmp_StoSV(MetIOS,MHmOS(gt2),MVWpOS,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
  AmpSqTreeetIToHmVWp(gt2) = AmpSqetIToHmVWp(gt2)  
  AmpSum2etIToHmVWp = + 2._dp*AmpWaveetIToHmVWp + 2._dp*AmpVertexetIToHmVWp
  Call SquareAmp_StoSV(MetIOS,MHmOS(gt2),MVWpOS,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
  AmpSqetIToHmVWp(gt2) = AmpSqetIToHmVWp(gt2) + AmpSqTreeetIToHmVWp(gt2)  
Else  
  AmpSum2etIToHmVWp = AmpTreeetIToHmVWp
  Call SquareAmp_StoSV(MetI,MHm(gt2),MVWp,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
  AmpSqTreeetIToHmVWp(gt2) = AmpSqetIToHmVWp(gt2)  
  AmpSum2etIToHmVWp = + 2._dp*AmpWaveetIToHmVWp + 2._dp*AmpVertexetIToHmVWp
  Call SquareAmp_StoSV(MetI,MHm(gt2),MVWp,AmpSumetIToHmVWp(:,gt2),AmpSum2etIToHmVWp(:,gt2),AmpSqetIToHmVWp(gt2)) 
  AmpSqetIToHmVWp(gt2) = AmpSqetIToHmVWp(gt2) + AmpSqTreeetIToHmVWp(gt2)  
End if  
Else  
  AmpSqetIToHmVWp(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToHmVWp(gt2).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 2._dp*GammaTPS(MetIOS,MHmOS(gt2),MVWpOS,helfactor*AmpSqetIToHmVWp(gt2))
Else 
  gP1LetI(gt1,i4) = 2._dp*GammaTPS(MetI,MHm(gt2),MVWp,helfactor*AmpSqetIToHmVWp(gt2))
End if 
If ((Abs(MRPetIToHmVWp(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetIToHmVWp(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetIToHmVWp(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetIToHmVWp(gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*2._dp*helfactor*(MRPetIToHmVWp(gt2) + MRGetIToHmVWp(gt2)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*2._dp*helfactor*(MRPetIToHmVWp(gt2) + MRGetIToHmVWp(gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
isave = i4 
End If 
If (.not.CalcLoopDecay_LoopInducedOnly) Then 
!---------------- 
! Conjg(Hm) Hm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_etITocHmHm(cpletIHmcHm,MetI,MHm,MetI2,MHm2,           & 
& AmpTreeetITocHmHm)

  Else 
Call Amplitude_Tree_radinuZeeHB_etITocHmHm(ZcpletIHmcHm,MetI,MHm,MetI2,               & 
& MHm2,AmpTreeetITocHmHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_etITocHmHm(MLambda,em,gs,cpletIHmcHm,MetIOS,              & 
& MHmOS,MRPetITocHmHm,MRGetITocHmHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocHmHm(MLambda,em,gs,ZcpletIHmcHm,MetIOS,             & 
& MHmOS,MRPetITocHmHm,MRGetITocHmHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_etITocHmHm(MLambda,em,gs,cpletIHmcHm,MetI,MHm,            & 
& MRPetITocHmHm,MRGetITocHmHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_etITocHmHm(MLambda,em,gs,ZcpletIHmcHm,MetI,               & 
& MHm,MRPetITocHmHm,MRGetITocHmHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITocHmHm(cpletIHmcHm,ctcpletIHmcHm,MetI,            & 
& MetI2,MHm,MHm2,ZfetI,ZfHm,AmpWaveetITocHmHm)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,             & 
& cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,     & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,     & 
& cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,          & 
& cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,cpletIHmVWpVZ1,            & 
& cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,AmpVertexetITocHmHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,             & 
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
& AmpVertexIRdretITocHmHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm(MAhOS,MetIOS,MFdOS,MFeOS,             & 
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
& cplhhhhHmcHm1,cplHmHmcHmcHm1,AmpVertexIRosetITocHmHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,             & 
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
& AmpVertexIRosetITocHmHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm(MAhOS,MetIOS,MFdOS,MFeOS,             & 
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
& cplhhhhHmcHm1,cplHmHmcHmcHm1,AmpVertexIRosetITocHmHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm(MAh,MetI,MFd,MFe,MFu,MFv,             & 
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
& AmpVertexIRosetITocHmHm)

 End if 
 End if 
AmpVertexetITocHmHm = AmpVertexetITocHmHm -  AmpVertexIRdretITocHmHm! +  AmpVertexIRosetITocHmHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Final State 1 
AmpWaveZetITocHmHm=0._dp 
AmpVertexZetITocHmHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocHmHm(gt2,:) = AmpWaveZetITocHmHm(gt2,:)+ZRUZP(gt2,gt1)*AmpWaveetITocHmHm(gt1,:) 
AmpVertexZetITocHmHm(gt2,:)= AmpVertexZetITocHmHm(gt2,:)+ZRUZP(gt2,gt1)*AmpVertexetITocHmHm(gt1,:) 
 End Do 
End Do 
AmpWaveetITocHmHm=AmpWaveZetITocHmHm 
AmpVertexetITocHmHm= AmpVertexZetITocHmHm
! Final State 2 
AmpWaveZetITocHmHm=0._dp 
AmpVertexZetITocHmHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZetITocHmHm(:,gt2) = AmpWaveZetITocHmHm(:,gt2)+ZRUZP(gt2,gt1)*AmpWaveetITocHmHm(:,gt1) 
AmpVertexZetITocHmHm(:,gt2)= AmpVertexZetITocHmHm(:,gt2)+ZRUZP(gt2,gt1)*AmpVertexetITocHmHm(:,gt1) 
 End Do 
End Do 
AmpWaveetITocHmHm=AmpWaveZetITocHmHm 
AmpVertexetITocHmHm= AmpVertexZetITocHmHm
End if
If (ShiftIRdiv) Then 
AmpVertexetITocHmHm = AmpVertexetITocHmHm  +  AmpVertexIRosetITocHmHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->conj[Hm] Hm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumetITocHmHm = AmpTreeetITocHmHm 
 AmpSum2etITocHmHm = AmpTreeetITocHmHm + 2._dp*AmpWaveetITocHmHm + 2._dp*AmpVertexetITocHmHm  
Else 
 AmpSumetITocHmHm = AmpTreeetITocHmHm + AmpWaveetITocHmHm + AmpVertexetITocHmHm
 AmpSum2etITocHmHm = AmpTreeetITocHmHm + AmpWaveetITocHmHm + AmpVertexetITocHmHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITocHmHm = AmpTreeetITocHmHm
 AmpSum2etITocHmHm = AmpTreeetITocHmHm 
End if 
gt1=1 
i4 = isave 
  Do gt2=2,3
    Do gt3=2,3
If (((OSkinematics).and.(MetIOS.gt.(MHmOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(MetI.gt.(MHm(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt2, gt3 
  AmpSum2etITocHmHm = AmpTreeetITocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MHmOS(gt2),MHmOS(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,MHm(gt2),MHm(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqetITocHmHm(gt2, gt3) 
  AmpSum2etITocHmHm = 2._dp*AmpWaveetITocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MHmOS(gt2),MHmOS(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,MHm(gt2),MHm(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqetITocHmHm(gt2, gt3) 
  AmpSum2etITocHmHm = 2._dp*AmpVertexetITocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MHmOS(gt2),MHmOS(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,MHm(gt2),MHm(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqetITocHmHm(gt2, gt3) 
  AmpSum2etITocHmHm = AmpTreeetITocHmHm + 2._dp*AmpWaveetITocHmHm + 2._dp*AmpVertexetITocHmHm
If (OSkinematics) Then 
  Call SquareAmp_StoSS(MetIOS,MHmOS(gt2),MHmOS(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
Else  
  Call SquareAmp_StoSS(MetI,MHm(gt2),MHm(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqetITocHmHm(gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2etITocHmHm = AmpTreeetITocHmHm
  Call SquareAmp_StoSS(MetIOS,MHmOS(gt2),MHmOS(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
  AmpSqTreeetITocHmHm(gt2, gt3) = AmpSqetITocHmHm(gt2, gt3)  
  AmpSum2etITocHmHm = + 2._dp*AmpWaveetITocHmHm + 2._dp*AmpVertexetITocHmHm
  Call SquareAmp_StoSS(MetIOS,MHmOS(gt2),MHmOS(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
  AmpSqetITocHmHm(gt2, gt3) = AmpSqetITocHmHm(gt2, gt3) + AmpSqTreeetITocHmHm(gt2, gt3)  
Else  
  AmpSum2etITocHmHm = AmpTreeetITocHmHm
  Call SquareAmp_StoSS(MetI,MHm(gt2),MHm(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
  AmpSqTreeetITocHmHm(gt2, gt3) = AmpSqetITocHmHm(gt2, gt3)  
  AmpSum2etITocHmHm = + 2._dp*AmpWaveetITocHmHm + 2._dp*AmpVertexetITocHmHm
  Call SquareAmp_StoSS(MetI,MHm(gt2),MHm(gt3),AmpSumetITocHmHm(gt2, gt3),AmpSum2etITocHmHm(gt2, gt3),AmpSqetITocHmHm(gt2, gt3)) 
  AmpSqetITocHmHm(gt2, gt3) = AmpSqetITocHmHm(gt2, gt3) + AmpSqTreeetITocHmHm(gt2, gt3)  
End if  
Else  
  AmpSqetITocHmHm(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetITocHmHm(gt2, gt3).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MHmOS(gt2),MHmOS(gt3),helfactor*AmpSqetITocHmHm(gt2, gt3))
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,MHm(gt2),MHm(gt3),helfactor*AmpSqetITocHmHm(gt2, gt3))
End if 
If ((Abs(MRPetITocHmHm(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocHmHm(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPetITocHmHm(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetITocHmHm(gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPetITocHmHm(gt2, gt3) + MRGetITocHmHm(gt2, gt3)) 
  gP1LetI(gt1,i4) = gP1LetI(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPetITocHmHm(gt2, gt3) + MRGetITocHmHm(gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LetI(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

    End do
  End do
isave = i4 
End If 
!---------------- 
! etI VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIVP(MetIOS,MFdOS,MFeOS,MFuOS,MHmOS,          & 
& MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,       & 
& AmpVertexetIToetIVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIVP(MetIOS,MFdOS,MFeOS,MFuOS,MHmOS,          & 
& MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,       & 
& AmpVertexetIToetIVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIVP(MetI,MFd,MFe,MFu,MHm,MVP,MVWp,           & 
& MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,           & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,        & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,cplHmcHmVP,               & 
& cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,AmpVertexetIToetIVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->etI VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToetIVP = 0._dp 
 AmpSum2etIToetIVP = 0._dp  
Else 
 AmpSumetIToetIVP = AmpVertexetIToetIVP + AmpWaveetIToetIVP
 AmpSum2etIToetIVP = AmpVertexetIToetIVP + AmpWaveetIToetIVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(MetIOS+0.))).or.((.not.OSkinematics).and.(MetI.gt.(MetI+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MetIOS,0._dp,AmpSumetIToetIVP(:),AmpSum2etIToetIVP(:),AmpSqetIToetIVP) 
Else  
  Call SquareAmp_StoSV(MetI,MetI,MVP,AmpSumetIToetIVP(:),AmpSum2etIToetIVP(:),AmpSqetIToetIVP) 
End if  
Else  
  AmpSqetIToetIVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToetIVP.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MetIOS,0._dp,helfactor*AmpSqetIToetIVP)
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,MetI,MVP,helfactor*AmpSqetIToetIVP)
End if 
If ((Abs(MRPetIToetIVP).gt.1.0E-20_dp).or.(Abs(MRGetIToetIVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! etI VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIVZ(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,          & 
& MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhhhVZ,cpletIetIetI,               & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,AmpVertexetIToetIVZ)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIVZ(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,          & 
& MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhhhVZ,cpletIetIetI,               & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,AmpVertexetIToetIVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToetIVZ(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,            & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,        & 
& cplAhetIhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,               & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,              & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVWpVZ1, & 
& cpletIcHmcVWpVZ1,AmpVertexetIToetIVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->etI VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToetIVZ = 0._dp 
 AmpSum2etIToetIVZ = 0._dp  
Else 
 AmpSumetIToetIVZ = AmpVertexetIToetIVZ + AmpWaveetIToetIVZ
 AmpSum2etIToetIVZ = AmpVertexetIToetIVZ + AmpWaveetIToetIVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(MetIOS+MVZOS))).or.((.not.OSkinematics).and.(MetI.gt.(MetI+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MetIOS,MVZOS,AmpSumetIToetIVZ(:),AmpSum2etIToetIVZ(:),AmpSqetIToetIVZ) 
Else  
  Call SquareAmp_StoSV(MetI,MetI,MVZ,AmpSumetIToetIVZ(:),AmpSum2etIToetIVZ(:),AmpSqetIToetIVZ) 
End if  
Else  
  AmpSqetIToetIVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToetIVZ.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MetIOS,MVZOS,helfactor*AmpSqetIToetIVZ)
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,MetI,MVZ,helfactor*AmpSqetIToetIVZ)
End if 
If ((Abs(MRPetIToetIVZ).gt.1.0E-20_dp).or.(Abs(MRGetIToetIVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! Fv Fv
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToFvFv(MetIOS,MFeOS,MFvOS,MHmOS,MVWpOS,          & 
& MetI2OS,MFe2OS,MFv2OS,MHm2OS,MVWp2OS,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexetIToFvFv)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToFvFv(MetIOS,MFeOS,MFvOS,MHmOS,MVWpOS,          & 
& MetI2OS,MFe2OS,MFv2OS,MHm2OS,MVWp2OS,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexetIToFvFv)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToFvFv(MetI,MFe,MFv,MHm,MVWp,MetI2,              & 
& MFe2,MFv2,MHm2,MVWp2,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,  & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexetIToFvFv)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->Fv Fv -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToFvFv = 0._dp 
 AmpSum2etIToFvFv = 0._dp  
Else 
 AmpSumetIToFvFv = AmpVertexetIToFvFv + AmpWaveetIToFvFv
 AmpSum2etIToFvFv = AmpVertexetIToFvFv + AmpWaveetIToFvFv 
End If 
gt1=1 
i4 = isave 
  Do gt2=1,3
    Do gt3=gt2,3
If (((OSkinematics).and.(MetIOS.gt.(MFvOS(gt2)+MFvOS(gt3)))).or.((.not.OSkinematics).and.(MetI.gt.(MFv(gt2)+MFv(gt3))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoFF(MetIOS,MFvOS(gt2),MFvOS(gt3),AmpSumetIToFvFv(:,gt2, gt3),AmpSum2etIToFvFv(:,gt2, gt3),AmpSqetIToFvFv(gt2, gt3)) 
Else  
  Call SquareAmp_StoFF(MetI,MFv(gt2),MFv(gt3),AmpSumetIToFvFv(:,gt2, gt3),AmpSum2etIToFvFv(:,gt2, gt3),AmpSqetIToFvFv(gt2, gt3)) 
End if  
Else  
  AmpSqetIToFvFv(gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 4._dp 
If (gt2.ne.gt3) helfactor = 2._dp*helfactor 
If (AmpSqetIToFvFv(gt2, gt3).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp/2._dp*GammaTPS(MetIOS,MFvOS(gt2),MFvOS(gt3),helfactor*AmpSqetIToFvFv(gt2, gt3))
Else 
  gP1LetI(gt1,i4) = 1._dp/2._dp*GammaTPS(MetI,MFv(gt2),MFv(gt3),helfactor*AmpSqetIToFvFv(gt2, gt3))
End if 
If ((Abs(MRPetIToFvFv(gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGetIToFvFv(gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
isave = i4 
!---------------- 
! hh VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_etITohhVP(cpletIhhVZ,ctcpletIhhVZ,MetIOS,             & 
& MetI2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfetI,Zfhh,ZfVP,ZfVZVP,AmpWaveetITohhVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_etITohhVP(cpletIhhVZ,ctcpletIhhVZ,MetIOS,             & 
& MetI2OS,MhhOS,Mhh2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfetI,Zfhh,ZfVP,ZfVZVP,AmpWaveetITohhVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etITohhVP(MetIOS,MFdOS,MFeOS,MFuOS,MhhOS,           & 
& MHmOS,MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,              & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,           & 
& cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,AmpVertexetITohhVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etITohhVP(MetIOS,MFdOS,MFeOS,MFuOS,MhhOS,           & 
& MHmOS,MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,              & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,         & 
& cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,               & 
& cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,              & 
& cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,           & 
& cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,AmpVertexetITohhVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_etITohhVP(cpletIhhVZ,ctcpletIhhVZ,MetI,               & 
& MetI2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfetI,Zfhh,ZfVP,ZfVZVP,AmpWaveetITohhVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etITohhVP(MetI,MFd,MFe,MFu,Mhh,MHm,MVP,             & 
& MVWp,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,              & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,             & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,    & 
& cplhhcHmcVWpVP1,AmpVertexetITohhVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->hh VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetITohhVP = 0._dp 
 AmpSum2etITohhVP = 0._dp  
Else 
 AmpSumetITohhVP = AmpVertexetITohhVP + AmpWaveetITohhVP
 AmpSum2etITohhVP = AmpVertexetITohhVP + AmpWaveetITohhVP 
End If 
gt1=1 
i4 = isave 
  Do gt2=1,2
If (((OSkinematics).and.(MetIOS.gt.(MhhOS(gt2)+0.))).or.((.not.OSkinematics).and.(MetI.gt.(Mhh(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoSV(MetIOS,MhhOS(gt2),0._dp,AmpSumetITohhVP(:,gt2),AmpSum2etITohhVP(:,gt2),AmpSqetITohhVP(gt2)) 
Else  
  Call SquareAmp_StoSV(MetI,Mhh(gt2),MVP,AmpSumetITohhVP(:,gt2),AmpSum2etITohhVP(:,gt2),AmpSqetITohhVP(gt2)) 
End if  
Else  
  AmpSqetITohhVP(gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetITohhVP(gt2).le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MhhOS(gt2),0._dp,helfactor*AmpSqetITohhVP(gt2))
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,Mhh(gt2),MVP,helfactor*AmpSqetITohhVP(gt2))
End if 
If ((Abs(MRPetITohhVP(gt2)).gt.1.0E-20_dp).or.(Abs(MRGetITohhVP(gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

  End do
isave = i4 
!---------------- 
! VG VG
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToVGVG(MetIOS,MFdOS,MFuOS,MVG,MetI2OS,           & 
& MFd2OS,MFu2OS,MVG2,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexetIToVGVG)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToVGVG(MetIOS,MFdOS,MFuOS,MVG,MetI2OS,           & 
& MFd2OS,MFu2OS,MVG2,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdVGL,    & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexetIToVGVG)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToVGVG(MetI,MFd,MFu,MVG,MetI2,MFd2,              & 
& MFu2,MVG2,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,AmpVertexetIToVGVG)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->VG VG -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToVGVG = 0._dp 
 AmpSum2etIToVGVG = 0._dp  
Else 
 AmpSumetIToVGVG = AmpVertexetIToVGVG + AmpWaveetIToVGVG
 AmpSum2etIToVGVG = AmpVertexetIToVGVG + AmpWaveetIToVGVG 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(MetI.gt.(MVG+MVG)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MetIOS,0._dp,0._dp,AmpSumetIToVGVG(:),AmpSum2etIToVGVG(:),AmpSqetIToVGVG) 
Else  
  Call SquareAmp_StoVV(MetI,MVG,MVG,AmpSumetIToVGVG(:),AmpSum2etIToVGVG(:),AmpSqetIToVGVG) 
End if  
Else  
  AmpSqetIToVGVG = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToVGVG.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 8._dp*GammaTPS(MetIOS,0._dp,0._dp,helfactor*AmpSqetIToVGVG)
Else 
  gP1LetI(gt1,i4) = 8._dp*GammaTPS(MetI,MVG,MVG,helfactor*AmpSqetIToVGVG)
End if 
If ((Abs(MRPetIToVGVG).gt.1.0E-20_dp).or.(Abs(MRGetIToVGVG).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VP VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToVPVP(MetIOS,MFdOS,MFeOS,MFuOS,MHmOS,           & 
& MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,       & 
& cplHmcHmVPVP1,AmpVertexetIToVPVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToVPVP(MetIOS,MFdOS,MFeOS,MFuOS,MHmOS,           & 
& MVP,MVWpOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWp2OS,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,           & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,             & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,       & 
& cplHmcHmVPVP1,AmpVertexetIToVPVP)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToVPVP(MetI,MFd,MFe,MFu,MHm,MVP,MVWp,            & 
& MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,           & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,        & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,cplHmcHmVP,               & 
& cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplHmcHmVPVP1,               & 
& AmpVertexetIToVPVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->VP VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToVPVP = 0._dp 
 AmpSum2etIToVPVP = 0._dp  
Else 
 AmpSumetIToVPVP = AmpVertexetIToVPVP + AmpWaveetIToVPVP
 AmpSum2etIToVPVP = AmpVertexetIToVPVP + AmpWaveetIToVPVP 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(0.+0.))).or.((.not.OSkinematics).and.(MetI.gt.(MVP+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MetIOS,0._dp,0._dp,AmpSumetIToVPVP(:),AmpSum2etIToVPVP(:),AmpSqetIToVPVP) 
Else  
  Call SquareAmp_StoVV(MetI,MVP,MVP,AmpSumetIToVPVP(:),AmpSum2etIToVPVP(:),AmpSqetIToVPVP) 
End if  
Else  
  AmpSqetIToVPVP = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToVPVP.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,0._dp,0._dp,helfactor*AmpSqetIToVPVP)
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,MVP,MVP,helfactor*AmpSqetIToVPVP)
End if 
If ((Abs(MRPetIToVPVP).gt.1.0E-20_dp).or.(Abs(MRGetIToVPVP).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VP VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToVPVZ(MetIOS,MFdOS,MFeOS,MFuOS,MHmOS,           & 
& MVP,MVWpOS,MVZOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,              & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVP,              & 
& cplcgWpgWpVZ,cplcgWCgWCVP,cplcgWCgWCVZ,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,               & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVPVWp1,         & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplHmcHmVPVZ1,AmpVertexetIToVPVZ)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToVPVZ(MetIOS,MFdOS,MFeOS,MFuOS,MHmOS,           & 
& MVP,MVWpOS,MVZOS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,              & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVP,              & 
& cplcgWpgWpVZ,cplcgWCgWCVP,cplcgWCgWCVZ,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,               & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVPVWp1,         & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplHmcHmVPVZ1,AmpVertexetIToVPVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToVPVZ(MetI,MFd,MFe,MFu,MHm,MVP,MVWp,            & 
& MVZ,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,MVZ2,cplcFdFdetIL,cplcFdFdetIR,               & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWCVP,            & 
& cplcgWCgWCVZ,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,    & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,              & 
& cpletIcHmcVWpVZ1,cplHmcHmVPVZ1,AmpVertexetIToVPVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->VP VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToVPVZ = 0._dp 
 AmpSum2etIToVPVZ = 0._dp  
Else 
 AmpSumetIToVPVZ = AmpVertexetIToVPVZ + AmpWaveetIToVPVZ
 AmpSum2etIToVPVZ = AmpVertexetIToVPVZ + AmpWaveetIToVPVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(0.+MVZOS))).or.((.not.OSkinematics).and.(MetI.gt.(MVP+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MetIOS,0._dp,MVZOS,AmpSumetIToVPVZ(:),AmpSum2etIToVPVZ(:),AmpSqetIToVPVZ) 
Else  
  Call SquareAmp_StoVV(MetI,MVP,MVZ,AmpSumetIToVPVZ(:),AmpSum2etIToVPVZ(:),AmpSqetIToVPVZ) 
End if  
Else  
  AmpSqetIToVPVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToVPVZ.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 2._dp*GammaTPS(MetIOS,0._dp,MVZOS,helfactor*AmpSqetIToVPVZ)
Else 
  gP1LetI(gt1,i4) = 2._dp*GammaTPS(MetI,MVP,MVZ,helfactor*AmpSqetIToVPVZ)
End if 
If ((Abs(MRPetIToVPVZ).gt.1.0E-20_dp).or.(Abs(MRGetIToVPVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VWp Conjg(VWp)
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToVWpcVWp(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmVWp,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,             & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,        & 
& cplcFeFvVWpR,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhHmVWp,cplhhcVWpVWp,cplhhcHmcVWp,          & 
& cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,             & 
& cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,      & 
& cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,cplHmcHmcVWpVWp1,AmpVertexetIToVWpcVWp)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToVWpcVWp(MAhOS,MetIOS,MFdOS,MFeOS,              & 
& MFuOS,MFvOS,MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,          & 
& MFv2OS,Mhh2OS,MHm2OS,MVP2,MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhetIhh,            & 
& cplAhHmVWp,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,             & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,        & 
& cplcFeFvVWpR,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,      & 
& cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,cplhhHmVWp,cplhhcVWpVWp,cplhhcHmcVWp,          & 
& cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,             & 
& cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,      & 
& cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,cplHmcHmcVWpVWp1,AmpVertexetIToVWpcVWp)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToVWpcVWp(MAh,MetI,MFd,MFe,MFu,MFv,              & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWpgAVWp,cplcgWCgAcVWp,        & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,      & 
& cplhhHmVWp,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,               & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,              & 
& cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,       & 
& cplHmcHmcVWpVWp1,AmpVertexetIToVWpcVWp)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->VWp conj[VWp] -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToVWpcVWp = 0._dp 
 AmpSum2etIToVWpcVWp = 0._dp  
Else 
 AmpSumetIToVWpcVWp = AmpVertexetIToVWpcVWp + AmpWaveetIToVWpcVWp
 AmpSum2etIToVWpcVWp = AmpVertexetIToVWpcVWp + AmpWaveetIToVWpcVWp 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(MVWpOS+MVWpOS))).or.((.not.OSkinematics).and.(MetI.gt.(MVWp+MVWp)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MetIOS,MVWpOS,MVWpOS,AmpSumetIToVWpcVWp(:),AmpSum2etIToVWpcVWp(:),AmpSqetIToVWpcVWp) 
Else  
  Call SquareAmp_StoVV(MetI,MVWp,MVWp,AmpSumetIToVWpcVWp(:),AmpSum2etIToVWpcVWp(:),AmpSqetIToVWpcVWp) 
End if  
Else  
  AmpSqetIToVWpcVWp = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToVWpcVWp.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 2._dp*GammaTPS(MetIOS,MVWpOS,MVWpOS,helfactor*AmpSqetIToVWpcVWp)
Else 
  gP1LetI(gt1,i4) = 2._dp*GammaTPS(MetI,MVWp,MVWp,helfactor*AmpSqetIToVWpcVWp)
End if 
If ((Abs(MRPetIToVWpcVWp).gt.1.0E-20_dp).or.(Abs(MRGetIToVWpcVWp).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
!---------------- 
! VZ VZ
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_etIToVZVZ(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,           & 
& MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhhhVZ,cpletIetIetI,cplcFdFdetIL,             & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& cplAhAhVZVZ1,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplHmcHmVZVZ1,AmpVertexetIToVZVZ)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_etIToVZVZ(MAhOS,MetIOS,MFdOS,MFeOS,MFuOS,           & 
& MhhOS,MHmOS,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFd2OS,MFe2OS,MFu2OS,Mhh2OS,MHm2OS,            & 
& MVWp2OS,MVZ2OS,cplAhAhetI,cplAhetIetI,cplAhhhVZ,cpletIetIetI,cplcFdFdetIL,             & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& cplAhAhVZVZ1,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,              & 
& cplHmcHmVZVZ1,AmpVertexetIToVZVZ)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_etIToVZVZ(MAh,MetI,MFd,MFe,MFu,Mhh,MHm,             & 
& MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,        & 
& cplAhhhVZ,cpletIetIetI,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,            & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,             & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,               & 
& cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,           & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,cplHmcHmVZVZ1,AmpVertexetIToVZVZ)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ etI->VZ VZ -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumetIToVZVZ = 0._dp 
 AmpSum2etIToVZVZ = 0._dp  
Else 
 AmpSumetIToVZVZ = AmpVertexetIToVZVZ + AmpWaveetIToVZVZ
 AmpSum2etIToVZVZ = AmpVertexetIToVZVZ + AmpWaveetIToVZVZ 
End If 
gt1=1 
i4 = isave 
If (((OSkinematics).and.(MetIOS.gt.(MVZOS+MVZOS))).or.((.not.OSkinematics).and.(MetI.gt.(MVZ+MVZ)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_StoVV(MetIOS,MVZOS,MVZOS,AmpSumetIToVZVZ(:),AmpSum2etIToVZVZ(:),AmpSqetIToVZVZ) 
Else  
  Call SquareAmp_StoVV(MetI,MVZ,MVZ,AmpSumetIToVZVZ(:),AmpSum2etIToVZVZ(:),AmpSqetIToVZVZ) 
End if  
Else  
  AmpSqetIToVZVZ = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 1._dp 
If (AmpSqetIToVZVZ.le.0._dp) Then 
  gP1LetI(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetIOS,MVZOS,MVZOS,helfactor*AmpSqetIToVZVZ)
Else 
  gP1LetI(gt1,i4) = 1._dp*GammaTPS(MetI,MVZ,MVZ,helfactor*AmpSqetIToVZVZ)
End if 
If ((Abs(MRPetIToVZVZ).gt.1.0E-20_dp).or.(Abs(MRGetIToVZVZ).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LetI(gt1,i4) 
End if 
i4=i4+1

isave = i4 
End Subroutine OneLoopDecay_etI

End Module Wrapper_OneLoopDecay_etI_radinuZeeHB
