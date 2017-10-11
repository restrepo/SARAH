! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Wrapper_OneLoopDecay_Fv_radinuZeeHB
Use Model_Data_radinuZeeHB 
Use Kinematics 
Use OneLoopDecay_Fv_radinuZeeHB 
Use Control 
Use Settings 

 
Contains

 
Subroutine OneLoopDecay_Fv(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,              & 
& MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,            & 
& MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,               & 
& lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,               & 
& Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,               & 
& dYh,dmH2,dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,               & 
& dlam8,dlamh,dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,               & 
& dSinTW,dCosTW,dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,              & 
& ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhcHmcVWp,cplAhHmcHm,cplAhHmVWp,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,         & 
& cpletIcHmcVWp,cpletIHmcHm,cpletIHmVWp,cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,            & 
& cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,      & 
& cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,ctcplFvFecVWpL,ctcplFvFecVWpR,   & 
& ctcplFvFeHmL,ctcplFvFeHmR,ctcplFvFvVZL,ctcplFvFvVZR,GcplHmVPVWp,GosZcplHmVPVWp,        & 
& GZcplHmVPVWp,ZcplAhcHmcVWp,ZcplAhHmcHm,ZcplAhHmVWp,ZcplcFeFeAhL,ZcplcFeFeAhR,          & 
& ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,       & 
& ZcplcFeFvcHmL,ZcplcFeFvcHmR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcHmcVWpVP,ZcplcVWpVPVWp,   & 
& ZcpletIcHmcVWp,ZcpletIHmcHm,ZcpletIHmVWp,ZcplFvFecVWpL,ZcplFvFecVWpR,ZcplFvFeHmL,      & 
& ZcplFvFeHmR,ZcplFvFvVZL,ZcplFvFvVZR,ZcplhhcHmcVWp,ZcplhhcVWpVWp,ZcplhhHmcHm,           & 
& ZcplhhHmVWp,ZcplhhVZVZ,ZcplHmcHmVP,ZcplHmVPVWp,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,          & 
& ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFv)

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

Complex(dp),Intent(in) :: cplAhcHmcVWp(3),cplAhHmcHm(3,3),cplAhHmVWp(3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),      & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcHmcVWpVP(3),               & 
& cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp(3),cpletIHmcHm(3,3),           & 
& cpletIHmVWp(3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplhhHmcHm(2,3,3),   & 
& cplhhHmVWp(2,3),cplhhVZVZ(2),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplHmVPVWp(3),            & 
& cplHmVWpVZ(3),ctcplFvFecVWpL(3,3),ctcplFvFecVWpR(3,3),ctcplFvFeHmL(3,3,3),             & 
& ctcplFvFeHmR(3,3,3),ctcplFvFvVZL(3,3),ctcplFvFvVZR(3,3),GcplHmVPVWp(3),GosZcplHmVPVWp(3),& 
& GZcplHmVPVWp(3),ZcplAhcHmcVWp(3),ZcplAhHmcHm(3,3),ZcplAhHmVWp(3),ZcplcFeFeAhL(3,3),    & 
& ZcplcFeFeAhR(3,3),ZcplcFeFeetIL(3,3),ZcplcFeFeetIR(3,3),ZcplcFeFehhL(3,3,2),           & 
& ZcplcFeFehhR(3,3,2),ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFeFvcHmL(3,3,3),          & 
& ZcplcFeFvcHmR(3,3,3),ZcplcFeFvVWpL(3,3),ZcplcFeFvVWpR(3,3),ZcplcHmcVWpVP(3),           & 
& ZcplcVWpVPVWp,ZcpletIcHmcVWp(3),ZcpletIHmcHm(3,3),ZcpletIHmVWp(3),ZcplFvFecVWpL(3,3),  & 
& ZcplFvFecVWpR(3,3),ZcplFvFeHmL(3,3,3),ZcplFvFeHmR(3,3,3),ZcplFvFvVZL(3,3),             & 
& ZcplFvFvVZR(3,3),ZcplhhcHmcVWp(2,3),ZcplhhcVWpVWp(2),ZcplhhHmcHm(2,3,3),               & 
& ZcplhhHmVWp(2,3),ZcplhhVZVZ(2),ZcplHmcHmVP(3,3),ZcplHmVPVWp(3)

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
Real(dp), Intent(out) :: gP1LFv(3,24) 
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
Real(dp) :: MRPFvToFeHm(3,3,3),MRGFvToFeHm(3,3,3), MRPZFvToFeHm(3,3,3),MRGZFvToFeHm(3,3,3) 
Real(dp) :: MVPFvToFeHm(3,3,3) 
Real(dp) :: RMsqTreeFvToFeHm(3,3,3),RMsqWaveFvToFeHm(3,3,3),RMsqVertexFvToFeHm(3,3,3) 
Complex(dp) :: AmpTreeFvToFeHm(2,3,3,3),AmpWaveFvToFeHm(2,3,3,3)=(0._dp,0._dp),AmpVertexFvToFeHm(2,3,3,3)& 
 & ,AmpVertexIRosFvToFeHm(2,3,3,3),AmpVertexIRdrFvToFeHm(2,3,3,3), AmpSumFvToFeHm(2,3,3,3), AmpSum2FvToFeHm(2,3,3,3) 
Complex(dp) :: AmpTreeZFvToFeHm(2,3,3,3),AmpWaveZFvToFeHm(2,3,3,3),AmpVertexZFvToFeHm(2,3,3,3) 
Real(dp) :: AmpSqFvToFeHm(3,3,3),  AmpSqTreeFvToFeHm(3,3,3) 
Real(dp) :: MRPFvToFecVWp(3,3),MRGFvToFecVWp(3,3), MRPZFvToFecVWp(3,3),MRGZFvToFecVWp(3,3) 
Real(dp) :: MVPFvToFecVWp(3,3) 
Real(dp) :: RMsqTreeFvToFecVWp(3,3),RMsqWaveFvToFecVWp(3,3),RMsqVertexFvToFecVWp(3,3) 
Complex(dp) :: AmpTreeFvToFecVWp(4,3,3),AmpWaveFvToFecVWp(4,3,3)=(0._dp,0._dp),AmpVertexFvToFecVWp(4,3,3)& 
 & ,AmpVertexIRosFvToFecVWp(4,3,3),AmpVertexIRdrFvToFecVWp(4,3,3), AmpSumFvToFecVWp(4,3,3), AmpSum2FvToFecVWp(4,3,3) 
Complex(dp) :: AmpTreeZFvToFecVWp(4,3,3),AmpWaveZFvToFecVWp(4,3,3),AmpVertexZFvToFecVWp(4,3,3) 
Real(dp) :: AmpSqFvToFecVWp(3,3),  AmpSqTreeFvToFecVWp(3,3) 
Real(dp) :: MRPFvToFvVZ(3,3),MRGFvToFvVZ(3,3), MRPZFvToFvVZ(3,3),MRGZFvToFvVZ(3,3) 
Real(dp) :: MVPFvToFvVZ(3,3) 
Real(dp) :: RMsqTreeFvToFvVZ(3,3),RMsqWaveFvToFvVZ(3,3),RMsqVertexFvToFvVZ(3,3) 
Complex(dp) :: AmpTreeFvToFvVZ(4,3,3),AmpWaveFvToFvVZ(4,3,3)=(0._dp,0._dp),AmpVertexFvToFvVZ(4,3,3)& 
 & ,AmpVertexIRosFvToFvVZ(4,3,3),AmpVertexIRdrFvToFvVZ(4,3,3), AmpSumFvToFvVZ(4,3,3), AmpSum2FvToFvVZ(4,3,3) 
Complex(dp) :: AmpTreeZFvToFvVZ(4,3,3),AmpWaveZFvToFvVZ(4,3,3),AmpVertexZFvToFvVZ(4,3,3) 
Real(dp) :: AmpSqFvToFvVZ(3,3),  AmpSqTreeFvToFvVZ(3,3) 
Real(dp) :: MRPFvToFvetI(3,3),MRGFvToFvetI(3,3), MRPZFvToFvetI(3,3),MRGZFvToFvetI(3,3) 
Real(dp) :: MVPFvToFvetI(3,3) 
Real(dp) :: RMsqTreeFvToFvetI(3,3),RMsqWaveFvToFvetI(3,3),RMsqVertexFvToFvetI(3,3) 
Complex(dp) :: AmpTreeFvToFvetI(2,3,3),AmpWaveFvToFvetI(2,3,3)=(0._dp,0._dp),AmpVertexFvToFvetI(2,3,3)& 
 & ,AmpVertexIRosFvToFvetI(2,3,3),AmpVertexIRdrFvToFvetI(2,3,3), AmpSumFvToFvetI(2,3,3), AmpSum2FvToFvetI(2,3,3) 
Complex(dp) :: AmpTreeZFvToFvetI(2,3,3),AmpWaveZFvToFvetI(2,3,3),AmpVertexZFvToFvetI(2,3,3) 
Real(dp) :: AmpSqFvToFvetI(3,3),  AmpSqTreeFvToFvetI(3,3) 
Real(dp) :: MRPFvToFvhh(3,3,2),MRGFvToFvhh(3,3,2), MRPZFvToFvhh(3,3,2),MRGZFvToFvhh(3,3,2) 
Real(dp) :: MVPFvToFvhh(3,3,2) 
Real(dp) :: RMsqTreeFvToFvhh(3,3,2),RMsqWaveFvToFvhh(3,3,2),RMsqVertexFvToFvhh(3,3,2) 
Complex(dp) :: AmpTreeFvToFvhh(2,3,3,2),AmpWaveFvToFvhh(2,3,3,2)=(0._dp,0._dp),AmpVertexFvToFvhh(2,3,3,2)& 
 & ,AmpVertexIRosFvToFvhh(2,3,3,2),AmpVertexIRdrFvToFvhh(2,3,3,2), AmpSumFvToFvhh(2,3,3,2), AmpSum2FvToFvhh(2,3,3,2) 
Complex(dp) :: AmpTreeZFvToFvhh(2,3,3,2),AmpWaveZFvToFvhh(2,3,3,2),AmpVertexZFvToFvhh(2,3,3,2) 
Real(dp) :: AmpSqFvToFvhh(3,3,2),  AmpSqTreeFvToFvhh(3,3,2) 
Real(dp) :: MRPFvToFvVP(3,3),MRGFvToFvVP(3,3), MRPZFvToFvVP(3,3),MRGZFvToFvVP(3,3) 
Real(dp) :: MVPFvToFvVP(3,3) 
Real(dp) :: RMsqTreeFvToFvVP(3,3),RMsqWaveFvToFvVP(3,3),RMsqVertexFvToFvVP(3,3) 
Complex(dp) :: AmpTreeFvToFvVP(4,3,3),AmpWaveFvToFvVP(4,3,3)=(0._dp,0._dp),AmpVertexFvToFvVP(4,3,3)& 
 & ,AmpVertexIRosFvToFvVP(4,3,3),AmpVertexIRdrFvToFvVP(4,3,3), AmpSumFvToFvVP(4,3,3), AmpSum2FvToFvVP(4,3,3) 
Complex(dp) :: AmpTreeZFvToFvVP(4,3,3),AmpWaveZFvToFvVP(4,3,3),AmpVertexZFvToFvVP(4,3,3) 
Real(dp) :: AmpSqFvToFvVP(3,3),  AmpSqTreeFvToFvVP(3,3) 
Write(*,*) "Calculating one-loop decays of Fv " 
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
! Fe Hm
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FvToFeHm(cplFvFeHmL,cplFvFeHmR,MFe,MFv,               & 
& MHm,MFe2,MFv2,MHm2,AmpTreeFvToFeHm)

  Else 
Call Amplitude_Tree_radinuZeeHB_FvToFeHm(ZcplFvFeHmL,ZcplFvFeHmR,MFe,MFv,             & 
& MHm,MFe2,MFv2,MHm2,AmpTreeFvToFeHm)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFeHm(MLambda,em,gs,cplFvFeHmL,cplFvFeHmR,             & 
& MFeOS,MFvOS,MHmOS,MRPFvToFeHm,MRGFvToFeHm)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFeHm(MLambda,em,gs,ZcplFvFeHmL,ZcplFvFeHmR,           & 
& MFeOS,MFvOS,MHmOS,MRPFvToFeHm,MRGFvToFeHm)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FvToFeHm(MLambda,em,gs,cplFvFeHmL,cplFvFeHmR,             & 
& MFe,MFv,MHm,MRPFvToFeHm,MRGFvToFeHm)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFeHm(MLambda,em,gs,ZcplFvFeHmL,ZcplFvFeHmR,           & 
& MFe,MFv,MHm,MRPFvToFeHm,MRGFvToFeHm)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FvToFeHm(cplFvFeHmL,cplFvFeHmR,ctcplFvFeHmL,          & 
& ctcplFvFeHmR,MFe,MFe2,MFv,MFv2,MHm,MHm2,ZfEL,ZfER,ZfHm,ZfVL,AmpWaveFvToFeHm)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FvToFeHm(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,              & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,               & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,    & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,               & 
& cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexFvToFeHm)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,               & 
& cpletIHmcHm,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,             & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRdrFvToFeHm)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm(MAhOS,MetIOS,MFeOS,MFvOS,               & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,        & 
& cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,ZcplFvFeHmL,ZcplFvFeHmR,cplFvFecVWpL,             & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,        & 
& AmpVertexIRosFvToFeHm)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,               & 
& cpletIHmcHm,ZcplFvFeHmL,ZcplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,             & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRosFvToFeHm)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm(MAhOS,MetIOS,MFeOS,MFvOS,               & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,        & 
& cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,               & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,        & 
& AmpVertexIRosFvToFeHm)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm(MAh,MetI,MFe,MFv,Mhh,MHm,               & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,               & 
& cpletIHmcHm,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,             & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,AmpVertexIRosFvToFeHm)

 End if 
 End if 
AmpVertexFvToFeHm = AmpVertexFvToFeHm -  AmpVertexIRdrFvToFeHm! +  AmpVertexIRosFvToFeHm ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFeHm=0._dp 
AmpVertexZFvToFeHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFeHm(1,gt2,:,:) = AmpWaveZFvToFeHm(1,gt2,:,:)+ZRUVv(gt2,gt1)*AmpWaveFvToFeHm(1,gt1,:,:) 
AmpVertexZFvToFeHm(1,gt2,:,:)= AmpVertexZFvToFeHm(1,gt2,:,:) + ZRUVv(gt2,gt1)*AmpVertexFvToFeHm(1,gt1,:,:) 
AmpWaveZFvToFeHm(2,gt2,:,:) = AmpWaveZFvToFeHm(2,gt2,:,:)+ZRUVvc(gt2,gt1)*AmpWaveFvToFeHm(2,gt1,:,:) 
AmpVertexZFvToFeHm(2,gt2,:,:)= AmpVertexZFvToFeHm(2,gt2,:,:) + ZRUVvc(gt2,gt1)*AmpVertexFvToFeHm(2,gt1,:,:) 
 End Do 
End Do 
AmpWaveFvToFeHm=AmpWaveZFvToFeHm 
AmpVertexFvToFeHm= AmpVertexZFvToFeHm
! Final State 1 
AmpWaveZFvToFeHm=0._dp 
AmpVertexZFvToFeHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFeHm(1,:,gt2,:) = AmpWaveZFvToFeHm(1,:,gt2,:)+ZRUVe(gt2,gt1)*AmpWaveFvToFeHm(1,:,gt1,:) 
AmpVertexZFvToFeHm(1,:,gt2,:)= AmpVertexZFvToFeHm(1,:,gt2,:)+ZRUVe(gt2,gt1)*AmpVertexFvToFeHm(1,:,gt1,:) 
AmpWaveZFvToFeHm(2,:,gt2,:) = AmpWaveZFvToFeHm(2,:,gt2,:)+ZRUUec(gt2,gt1)*AmpWaveFvToFeHm(2,:,gt1,:) 
AmpVertexZFvToFeHm(2,:,gt2,:)= AmpVertexZFvToFeHm(2,:,gt2,:)+ZRUUec(gt2,gt1)*AmpVertexFvToFeHm(2,:,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFeHm=AmpWaveZFvToFeHm 
AmpVertexFvToFeHm= AmpVertexZFvToFeHm
! Final State 2 
AmpWaveZFvToFeHm=0._dp 
AmpVertexZFvToFeHm=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFeHm(:,:,:,gt2) = AmpWaveZFvToFeHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpWaveFvToFeHm(:,:,:,gt1) 
AmpVertexZFvToFeHm(:,:,:,gt2)= AmpVertexZFvToFeHm(:,:,:,gt2)+ZRUZP(gt2,gt1)*AmpVertexFvToFeHm(:,:,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFeHm=AmpWaveZFvToFeHm 
AmpVertexFvToFeHm= AmpVertexZFvToFeHm
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFeHm = AmpVertexFvToFeHm  +  AmpVertexIRosFvToFeHm
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fe Hm -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFeHm = AmpTreeFvToFeHm 
 AmpSum2FvToFeHm = AmpTreeFvToFeHm + 2._dp*AmpWaveFvToFeHm + 2._dp*AmpVertexFvToFeHm  
Else 
 AmpSumFvToFeHm = AmpTreeFvToFeHm + AmpWaveFvToFeHm + AmpVertexFvToFeHm
 AmpSum2FvToFeHm = AmpTreeFvToFeHm + AmpWaveFvToFeHm + AmpVertexFvToFeHm 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFeHm = AmpTreeFvToFeHm
 AmpSum2FvToFeHm = AmpTreeFvToFeHm 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=2,3
If (((OSkinematics).and.(MFvOS(gt1).gt.(MFeOS(gt2)+MHmOS(gt3)))).or.((.not.OSkinematics).and.(MFv(gt1).gt.(MFe(gt2)+MHm(gt3))))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2, gt3 
  AmpSum2FvToFeHm = AmpTreeFvToFeHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHm(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFeHm(gt1, gt2, gt3) 
  AmpSum2FvToFeHm = 2._dp*AmpWaveFvToFeHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHm(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFeHm(gt1, gt2, gt3) 
  AmpSum2FvToFeHm = 2._dp*AmpVertexFvToFeHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHm(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFeHm(gt1, gt2, gt3) 
  AmpSum2FvToFeHm = AmpTreeFvToFeHm + 2._dp*AmpWaveFvToFeHm + 2._dp*AmpVertexFvToFeHm
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHm(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFeHm(gt1, gt2, gt3) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFeHm = AmpTreeFvToFeHm
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
  AmpSqTreeFvToFeHm(gt1, gt2, gt3) = AmpSqFvToFeHm(gt1, gt2, gt3)  
  AmpSum2FvToFeHm = + 2._dp*AmpWaveFvToFeHm + 2._dp*AmpVertexFvToFeHm
  Call SquareAmp_FtoFS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
  AmpSqFvToFeHm(gt1, gt2, gt3) = AmpSqFvToFeHm(gt1, gt2, gt3) + AmpSqTreeFvToFeHm(gt1, gt2, gt3)  
Else  
  AmpSum2FvToFeHm = AmpTreeFvToFeHm
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHm(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
  AmpSqTreeFvToFeHm(gt1, gt2, gt3) = AmpSqFvToFeHm(gt1, gt2, gt3)  
  AmpSum2FvToFeHm = + 2._dp*AmpWaveFvToFeHm + 2._dp*AmpVertexFvToFeHm
  Call SquareAmp_FtoFS(MFv(gt1),MFe(gt2),MHm(gt3),AmpSumFvToFeHm(:,gt1, gt2, gt3),AmpSum2FvToFeHm(:,gt1, gt2, gt3),AmpSqFvToFeHm(gt1, gt2, gt3)) 
  AmpSqFvToFeHm(gt1, gt2, gt3) = AmpSqFvToFeHm(gt1, gt2, gt3) + AmpSqTreeFvToFeHm(gt1, gt2, gt3)  
End if  
Else  
  AmpSqFvToFeHm(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFeHm(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFeOS(gt2),MHmOS(gt3),helfactor*AmpSqFvToFeHm(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFe(gt2),MHm(gt3),helfactor*AmpSqFvToFeHm(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToFeHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFeHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFeHm(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFeHm(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFeHm(gt1, gt2, gt3) + MRGFvToFeHm(gt1, gt2, gt3)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFeHm(gt1, gt2, gt3) + MRGFvToFeHm(gt1, gt2, gt3))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
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
! Fe Conjg(VWp)
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FvToFecVWp(cplFvFecVWpL,cplFvFecVWpR,MFe,             & 
& MFv,MVWp,MFe2,MFv2,MVWp2,AmpTreeFvToFecVWp)

  Else 
Call Amplitude_Tree_radinuZeeHB_FvToFecVWp(ZcplFvFecVWpL,ZcplFvFecVWpR,               & 
& MFe,MFv,MVWp,MFe2,MFv2,MVWp2,AmpTreeFvToFecVWp)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFecVWp(MLambda,em,gs,cplFvFecVWpL,cplFvFecVWpR,       & 
& MFeOS,MFvOS,MVWpOS,MRPFvToFecVWp,MRGFvToFecVWp)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFecVWp(MLambda,em,gs,ZcplFvFecVWpL,ZcplFvFecVWpR,     & 
& MFeOS,MFvOS,MVWpOS,MRPFvToFecVWp,MRGFvToFecVWp)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FvToFecVWp(MLambda,em,gs,cplFvFecVWpL,cplFvFecVWpR,       & 
& MFe,MFv,MVWp,MRPFvToFecVWp,MRGFvToFecVWp)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFecVWp(MLambda,em,gs,ZcplFvFecVWpL,ZcplFvFecVWpR,     & 
& MFe,MFv,MVWp,MRPFvToFecVWp,MRGFvToFecVWp)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FvToFecVWp(cplFvFecVWpL,cplFvFecVWpR,ctcplFvFecVWpL,  & 
& ctcplFvFecVWpR,MFe,MFe2,MFv,MFv2,MVWp,MVWp2,ZfEL,ZfER,ZfVL,ZfVWp,AmpWaveFvToFecVWp)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FvToFecVWp(MAh,MetI,MFe,MFv,Mhh,MHm,MVP,            & 
& MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,cplcFeFeAhR,       & 
& cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,            & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,         & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexFvToFecVWp)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp(MAh,MetI,MFe,MFv,Mhh,MHm,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIcHmcVWp,cplFvFeHmL,           & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,         & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRdrFvToFecVWp)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp(MAhOS,MetIOS,MFeOS,MFvOS,             & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,    & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,ZcplFvFecVWpL,ZcplFvFecVWpR,cplcFeFehhL,           & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,         & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFvToFecVWp)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp(MAh,MetI,MFe,MFv,Mhh,MHm,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIcHmcVWp,cplFvFeHmL,           & 
& cplFvFeHmR,ZcplFvFecVWpL,ZcplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,         & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFvToFecVWp)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp(MAhOS,MetIOS,MFeOS,MFvOS,             & 
& MhhOS,MHmOS,MVP,MVWpOS,MVZOS,MAh2OS,MetI2OS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,               & 
& MVP2,MVWp2OS,MVZ2OS,cplcFeFeAhL,cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,    & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,         & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFvToFecVWp)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp(MAh,MetI,MFe,MFv,Mhh,MHm,             & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIcHmcVWp,cplFvFeHmL,           & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,         & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFvToFecVWp)

 End if 
 End if 
AmpVertexFvToFecVWp = AmpVertexFvToFecVWp -  AmpVertexIRdrFvToFecVWp! +  AmpVertexIRosFvToFecVWp ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFecVWp=0._dp 
AmpVertexZFvToFecVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFecVWp(1,gt2,:) = AmpWaveZFvToFecVWp(1,gt2,:)+ZRUVvc(gt2,gt1)*AmpWaveFvToFecVWp(1,gt1,:) 
AmpVertexZFvToFecVWp(1,gt2,:)= AmpVertexZFvToFecVWp(1,gt2,:) + ZRUVvc(gt2,gt1)*AmpVertexFvToFecVWp(1,gt1,:) 
AmpWaveZFvToFecVWp(2,gt2,:) = AmpWaveZFvToFecVWp(2,gt2,:)+ZRUVv(gt2,gt1)*AmpWaveFvToFecVWp(2,gt1,:) 
AmpVertexZFvToFecVWp(2,gt2,:)= AmpVertexZFvToFecVWp(2,gt2,:) + ZRUVv(gt2,gt1)*AmpVertexFvToFecVWp(2,gt1,:) 
AmpWaveZFvToFecVWp(3,gt2,:) = AmpWaveZFvToFecVWp(3,gt2,:)+ZRUVvc(gt2,gt1)*AmpWaveFvToFecVWp(3,gt1,:) 
AmpVertexZFvToFecVWp(3,gt2,:)= AmpVertexZFvToFecVWp(3,gt2,:) + ZRUVvc(gt2,gt1)*AmpVertexFvToFecVWp(3,gt1,:) 
AmpWaveZFvToFecVWp(4,gt2,:) = AmpWaveZFvToFecVWp(4,gt2,:)+ZRUVv(gt2,gt1)*AmpWaveFvToFecVWp(4,gt1,:) 
AmpVertexZFvToFecVWp(4,gt2,:)= AmpVertexZFvToFecVWp(4,gt2,:) + ZRUVv(gt2,gt1)*AmpVertexFvToFecVWp(4,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFecVWp=AmpWaveZFvToFecVWp 
AmpVertexFvToFecVWp= AmpVertexZFvToFecVWp
! Final State 1 
AmpWaveZFvToFecVWp=0._dp 
AmpVertexZFvToFecVWp=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFecVWp(1,:,gt2) = AmpWaveZFvToFecVWp(1,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFvToFecVWp(1,:,gt1) 
AmpVertexZFvToFecVWp(1,:,gt2)= AmpVertexZFvToFecVWp(1,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFvToFecVWp(1,:,gt1) 
AmpWaveZFvToFecVWp(2,:,gt2) = AmpWaveZFvToFecVWp(2,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFvToFecVWp(2,:,gt1) 
AmpVertexZFvToFecVWp(2,:,gt2)= AmpVertexZFvToFecVWp(2,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFvToFecVWp(2,:,gt1) 
AmpWaveZFvToFecVWp(3,:,gt2) = AmpWaveZFvToFecVWp(3,:,gt2)+ZRUVe(gt2,gt1)*AmpWaveFvToFecVWp(3,:,gt1) 
AmpVertexZFvToFecVWp(3,:,gt2)= AmpVertexZFvToFecVWp(3,:,gt2)+ZRUVe(gt2,gt1)*AmpVertexFvToFecVWp(3,:,gt1) 
AmpWaveZFvToFecVWp(4,:,gt2) = AmpWaveZFvToFecVWp(4,:,gt2)+ZRUUec(gt2,gt1)*AmpWaveFvToFecVWp(4,:,gt1) 
AmpVertexZFvToFecVWp(4,:,gt2)= AmpVertexZFvToFecVWp(4,:,gt2)+ZRUUec(gt2,gt1)*AmpVertexFvToFecVWp(4,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFecVWp=AmpWaveZFvToFecVWp 
AmpVertexFvToFecVWp= AmpVertexZFvToFecVWp
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFecVWp = AmpVertexFvToFecVWp  +  AmpVertexIRosFvToFecVWp
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fe conj[VWp] -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFecVWp = AmpTreeFvToFecVWp 
 AmpSum2FvToFecVWp = AmpTreeFvToFecVWp + 2._dp*AmpWaveFvToFecVWp + 2._dp*AmpVertexFvToFecVWp  
Else 
 AmpSumFvToFecVWp = AmpTreeFvToFecVWp + AmpWaveFvToFecVWp + AmpVertexFvToFecVWp
 AmpSum2FvToFecVWp = AmpTreeFvToFecVWp + AmpWaveFvToFecVWp + AmpVertexFvToFecVWp 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFecVWp = AmpTreeFvToFecVWp
 AmpSum2FvToFecVWp = AmpTreeFvToFecVWp 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFvOS(gt1).gt.(MFeOS(gt2)+MVWpOS))).or.((.not.OSkinematics).and.(MFv(gt1).gt.(MFe(gt2)+MVWp)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FvToFecVWp = AmpTreeFvToFecVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWpOS,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWp,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFecVWp(gt1, gt2) 
  AmpSum2FvToFecVWp = 2._dp*AmpWaveFvToFecVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWpOS,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWp,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFecVWp(gt1, gt2) 
  AmpSum2FvToFecVWp = 2._dp*AmpVertexFvToFecVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWpOS,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWp,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFecVWp(gt1, gt2) 
  AmpSum2FvToFecVWp = AmpTreeFvToFecVWp + 2._dp*AmpWaveFvToFecVWp + 2._dp*AmpVertexFvToFecVWp
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWpOS,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWp,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFecVWp(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFecVWp = AmpTreeFvToFecVWp
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWpOS,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
  AmpSqTreeFvToFecVWp(gt1, gt2) = AmpSqFvToFecVWp(gt1, gt2)  
  AmpSum2FvToFecVWp = + 2._dp*AmpWaveFvToFecVWp + 2._dp*AmpVertexFvToFecVWp
  Call SquareAmp_FtoFV(MFvOS(gt1),MFeOS(gt2),MVWpOS,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
  AmpSqFvToFecVWp(gt1, gt2) = AmpSqFvToFecVWp(gt1, gt2) + AmpSqTreeFvToFecVWp(gt1, gt2)  
Else  
  AmpSum2FvToFecVWp = AmpTreeFvToFecVWp
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWp,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
  AmpSqTreeFvToFecVWp(gt1, gt2) = AmpSqFvToFecVWp(gt1, gt2)  
  AmpSum2FvToFecVWp = + 2._dp*AmpWaveFvToFecVWp + 2._dp*AmpVertexFvToFecVWp
  Call SquareAmp_FtoFV(MFv(gt1),MFe(gt2),MVWp,AmpSumFvToFecVWp(:,gt1, gt2),AmpSum2FvToFecVWp(:,gt1, gt2),AmpSqFvToFecVWp(gt1, gt2)) 
  AmpSqFvToFecVWp(gt1, gt2) = AmpSqFvToFecVWp(gt1, gt2) + AmpSqTreeFvToFecVWp(gt1, gt2)  
End if  
Else  
  AmpSqFvToFecVWp(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFecVWp(gt1, gt2).le.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFvOS(gt1),MFeOS(gt2),MVWpOS,helfactor*AmpSqFvToFecVWp(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 2._dp*GammaTPS(MFv(gt1),MFe(gt2),MVWp,helfactor*AmpSqFvToFecVWp(gt1, gt2))
End if 
If ((Abs(MRPFvToFecVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFecVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFecVWp(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFecVWp(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*1._dp*helfactor*(MRPFvToFecVWp(gt1, gt2) + MRGFvToFecVWp(gt1, gt2)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*1._dp*helfactor*(MRPFvToFecVWp(gt1, gt2) + MRGFvToFecVWp(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
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
! Fv VZ
!---------------- 

!Tree Level 
  If (.not.ExternalZfactors) Then 
Call Amplitude_Tree_radinuZeeHB_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,MFv,MVZ,               & 
& MFv2,MVZ2,AmpTreeFvToFvVZ)

  Else 
Call Amplitude_Tree_radinuZeeHB_FvToFvVZ(ZcplFvFvVZL,ZcplFvFvVZR,MFv,MVZ,             & 
& MFv2,MVZ2,AmpTreeFvToFvVZ)

  End if 


!Real Corrections 
If (OSkinematics) Then 
  If (.not.ExternalZfactors) Then 
 ! OS and no Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,             & 
& MFvOS,MVZOS,MRPFvToFvVZ,MRGFvToFvVZ)

  Else 
 ! OS and Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFvVZ(MLambda,em,gs,ZcplFvFvVZL,ZcplFvFvVZR,           & 
& MFvOS,MVZOS,MRPFvToFvVZ,MRGFvToFvVZ)

  End if 
Else 
 ! DR and no Z-factors 
  If (.not.ExternalZfactors) Then 
Call Gamma_Real_radinuZeeHB_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,             & 
& MFv,MVZ,MRPFvToFvVZ,MRGFvToFvVZ)

  Else 
 ! DR and Z-factors 
Call Gamma_Real_radinuZeeHB_FvToFvVZ(MLambda,em,gs,ZcplFvFvVZL,ZcplFvFvVZR,           & 
& MFv,MVZ,MRPFvToFvVZ,MRGFvToFvVZ)

  End if 
End if 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,          & 
& ctcplFvFvVZR,MFv,MFv2,MVZ,MVZ2,ZfVL,ZfVZ,AmpWaveFvToFvVZ)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvVZ(MFe,MFv,MHm,MVWp,MVZ,MFe2,MFv2,            & 
& MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexFvToFvVZ)

If (ShiftIRdiv) Then 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ(MFe,MFv,MHm,MVWp,MVZ,MFe2,              & 
& MFv2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRdrFvToFvVZ)

 If (ExternalZfactors) Then 
  If (OSkinematics) Then 
 ! OS and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ(MFeOS,MFvOS,MHmOS,MVWpOS,               & 
& MVZOS,MFe2OS,MFv2OS,MHm2OS,MVWp2OS,MVZ2OS,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,          & 
& cplFvFecVWpR,cplcFeFeVZL,cplcFeFeVZR,ZcplFvFvVZL,ZcplFvFvVZR,cplcFeFvVWpL,             & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,AmpVertexIRosFvToFvVZ)

   Else 
 ! DR and Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ(MFe,MFv,MHm,MVWp,MVZ,MFe2,              & 
& MFv2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,      & 
& cplcFeFeVZR,ZcplFvFvVZL,ZcplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFvToFvVZ)

 End if 
 Else 
  If (OSkinematics) Then 
 ! OS and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ(MFeOS,MFvOS,MHmOS,MVWpOS,               & 
& MVZOS,MFe2OS,MFv2OS,MHm2OS,MVWp2OS,MVZ2OS,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,          & 
& cplFvFecVWpR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,               & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,AmpVertexIRosFvToFvVZ)

   Else 
 ! DR and no Z-factors 
Call Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ(MFe,MFv,MHm,MVWp,MVZ,MFe2,              & 
& MFv2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,AmpVertexIRosFvToFvVZ)

 End if 
 End if 
AmpVertexFvToFvVZ = AmpVertexFvToFvVZ -  AmpVertexIRdrFvToFvVZ! +  AmpVertexIRosFvToFvVZ ! Shift added later
End if 


 ! Add Z-factors to have external fields on-shell 
 If (ExternalZfactors) Then 
! Decaying particle 
AmpWaveZFvToFvVZ=0._dp 
AmpVertexZFvToFvVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFvVZ(1,gt2,:) = AmpWaveZFvToFvVZ(1,gt2,:)+ZRUVvc(gt2,gt1)*AmpWaveFvToFvVZ(1,gt1,:) 
AmpVertexZFvToFvVZ(1,gt2,:)= AmpVertexZFvToFvVZ(1,gt2,:) + ZRUVvc(gt2,gt1)*AmpVertexFvToFvVZ(1,gt1,:) 
AmpWaveZFvToFvVZ(2,gt2,:) = AmpWaveZFvToFvVZ(2,gt2,:)+ZRUVv(gt2,gt1)*AmpWaveFvToFvVZ(2,gt1,:) 
AmpVertexZFvToFvVZ(2,gt2,:)= AmpVertexZFvToFvVZ(2,gt2,:) + ZRUVv(gt2,gt1)*AmpVertexFvToFvVZ(2,gt1,:) 
AmpWaveZFvToFvVZ(3,gt2,:) = AmpWaveZFvToFvVZ(3,gt2,:)+ZRUVvc(gt2,gt1)*AmpWaveFvToFvVZ(3,gt1,:) 
AmpVertexZFvToFvVZ(3,gt2,:)= AmpVertexZFvToFvVZ(3,gt2,:) + ZRUVvc(gt2,gt1)*AmpVertexFvToFvVZ(3,gt1,:) 
AmpWaveZFvToFvVZ(4,gt2,:) = AmpWaveZFvToFvVZ(4,gt2,:)+ZRUVv(gt2,gt1)*AmpWaveFvToFvVZ(4,gt1,:) 
AmpVertexZFvToFvVZ(4,gt2,:)= AmpVertexZFvToFvVZ(4,gt2,:) + ZRUVv(gt2,gt1)*AmpVertexFvToFvVZ(4,gt1,:) 
 End Do 
End Do 
AmpWaveFvToFvVZ=AmpWaveZFvToFvVZ 
AmpVertexFvToFvVZ= AmpVertexZFvToFvVZ
! Final State 1 
AmpWaveZFvToFvVZ=0._dp 
AmpVertexZFvToFvVZ=0._dp 
Do gt1=1,3
  Do gt2=1,3
AmpWaveZFvToFvVZ(1,:,gt2) = AmpWaveZFvToFvVZ(1,:,gt2)+ZRUVv(gt2,gt1)*AmpWaveFvToFvVZ(1,:,gt1) 
AmpVertexZFvToFvVZ(1,:,gt2)= AmpVertexZFvToFvVZ(1,:,gt2)+ZRUVv(gt2,gt1)*AmpVertexFvToFvVZ(1,:,gt1) 
AmpWaveZFvToFvVZ(2,:,gt2) = AmpWaveZFvToFvVZ(2,:,gt2)+ZRUVvc(gt2,gt1)*AmpWaveFvToFvVZ(2,:,gt1) 
AmpVertexZFvToFvVZ(2,:,gt2)= AmpVertexZFvToFvVZ(2,:,gt2)+ZRUVvc(gt2,gt1)*AmpVertexFvToFvVZ(2,:,gt1) 
AmpWaveZFvToFvVZ(3,:,gt2) = AmpWaveZFvToFvVZ(3,:,gt2)+ZRUVv(gt2,gt1)*AmpWaveFvToFvVZ(3,:,gt1) 
AmpVertexZFvToFvVZ(3,:,gt2)= AmpVertexZFvToFvVZ(3,:,gt2)+ZRUVv(gt2,gt1)*AmpVertexFvToFvVZ(3,:,gt1) 
AmpWaveZFvToFvVZ(4,:,gt2) = AmpWaveZFvToFvVZ(4,:,gt2)+ZRUVvc(gt2,gt1)*AmpWaveFvToFvVZ(4,:,gt1) 
AmpVertexZFvToFvVZ(4,:,gt2)= AmpVertexZFvToFvVZ(4,:,gt2)+ZRUVvc(gt2,gt1)*AmpVertexFvToFvVZ(4,:,gt1) 
 End Do 
End Do 
AmpWaveFvToFvVZ=AmpWaveZFvToFvVZ 
AmpVertexFvToFvVZ= AmpVertexZFvToFvVZ
End if
If (ShiftIRdiv) Then 
AmpVertexFvToFvVZ = AmpVertexFvToFvVZ  +  AmpVertexIRosFvToFvVZ
End if
 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv VZ -----------------------" 
End if 
If (.not.SquareFullAmplitudeDecays) Then 
 AmpSumFvToFvVZ = AmpTreeFvToFvVZ 
 AmpSum2FvToFvVZ = AmpTreeFvToFvVZ + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ  
Else 
 AmpSumFvToFvVZ = AmpTreeFvToFvVZ + AmpWaveFvToFvVZ + AmpVertexFvToFvVZ
 AmpSum2FvToFvVZ = AmpTreeFvToFvVZ + AmpWaveFvToFvVZ + AmpVertexFvToFvVZ 
End If 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvVZ = AmpTreeFvToFvVZ
 AmpSum2FvToFvVZ = AmpTreeFvToFvVZ 
End if 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFvOS(gt1).gt.(MFvOS(gt2)+MVZOS))).or.((.not.OSkinematics).and.(MFv(gt1).gt.(MFv(gt2)+MVZ)))) Then 
 If (DebugLoopDecays) Then 
  Write(*,*) gt1, gt2 
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x TREE: ",AmpSqFvToFvVZ(gt1, gt2) 
  AmpSum2FvToFvVZ = 2._dp*AmpWaveFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x WAVE: ",AmpSqFvToFvVZ(gt1, gt2) 
  AmpSum2FvToFvVZ = 2._dp*AmpVertexFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x VERTEX: ",AmpSqFvToFvVZ(gt1, gt2) 
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
End if  
  Write(*,*) "TREE x (TREE+WAVE+VERTEX): ",AmpSqFvToFvVZ(gt1, gt2) 
 End if 
If (OSkinematics) Then 
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqTreeFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2)  
  AmpSum2FvToFvVZ = + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),MVZOS,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2) + AmpSqTreeFvToFvVZ(gt1, gt2)  
Else  
  AmpSum2FvToFvVZ = AmpTreeFvToFvVZ
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqTreeFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2)  
  AmpSum2FvToFvVZ = + 2._dp*AmpWaveFvToFvVZ + 2._dp*AmpVertexFvToFvVZ
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVZ,AmpSumFvToFvVZ(:,gt1, gt2),AmpSum2FvToFvVZ(:,gt1, gt2),AmpSqFvToFvVZ(gt1, gt2)) 
  AmpSqFvToFvVZ(gt1, gt2) = AmpSqFvToFvVZ(gt1, gt2) + AmpSqTreeFvToFvVZ(gt1, gt2)  
End if  
Else  
  AmpSqFvToFvVZ(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvVZ(gt1, gt2).le.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MVZOS,helfactor*AmpSqFvToFvVZ(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFv(gt1),MFv(gt2),MVZ,helfactor*AmpSqFvToFvVZ(gt1, gt2))
End if 
If ((Abs(MRPFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
 ! Adding real corrections 
If ((Abs(MRPFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVZ(gt1, gt2)).gt.1.0E-20_dp)) Then 
 If (.not.OnlyTreeLevelContributions) Then 
   If (DebugLoopDecays) Write(*,*) "real", phasespacefactor*0.5_dp*helfactor*(MRPFvToFvVZ(gt1, gt2) + MRGFvToFvVZ(gt1, gt2)) 
  gP1LFv(gt1,i4) = gP1LFv(gt1,i4) + phasespacefactor*0.5_dp*helfactor*(MRPFvToFvVZ(gt1, gt2) + MRGFvToFvVZ(gt1, gt2))
   If (DebugLoopDecays) Write(*,*) "sum",  gP1LFv(gt1,i4) 
  End if 
End if 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End If 
!---------------- 
! Fv etI
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvetI(MetIOS,MFeOS,MFvOS,MHmOS,MVWpOS,          & 
& MetI2OS,MFe2OS,MFv2OS,MHm2OS,MVWp2OS,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcpletIHmVWp,         & 
& ZcpletIHmcHm,ZcpletIcHmcVWp,ZcplFvFeHmL,ZcplFvFeHmR,ZcplFvFecVWpL,ZcplFvFecVWpR,       & 
& ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcFeFvcHmL,ZcplcFeFvcHmR,AmpVertexFvToFvetI)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvetI(MetIOS,MFeOS,MFvOS,MHmOS,MVWpOS,          & 
& MetI2OS,MFe2OS,MFv2OS,MHm2OS,MVWp2OS,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexFvToFvetI)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvetI(MetI,MFe,MFv,MHm,MVWp,MetI2,              & 
& MFe2,MFv2,MHm2,MVWp2,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,  & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,AmpVertexFvToFvetI)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv etI -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvetI = 0._dp 
 AmpSum2FvToFvetI = 0._dp  
Else 
 AmpSumFvToFvetI = AmpVertexFvToFvetI + AmpWaveFvToFvetI
 AmpSum2FvToFvetI = AmpVertexFvToFvetI + AmpWaveFvToFvetI 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFvOS(gt1).gt.(MFvOS(gt2)+MetIOS))).or.((.not.OSkinematics).and.(MFv(gt1).gt.(MFv(gt2)+MetI)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MetIOS,AmpSumFvToFvetI(:,gt1, gt2),AmpSum2FvToFvetI(:,gt1, gt2),AmpSqFvToFvetI(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),MetI,AmpSumFvToFvetI(:,gt1, gt2),AmpSum2FvToFvetI(:,gt1, gt2),AmpSqFvToFvetI(gt1, gt2)) 
End if  
Else  
  AmpSqFvToFvetI(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvetI(gt1, gt2).le.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MetIOS,helfactor*AmpSqFvToFvetI(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFv(gt1),MFv(gt2),MetI,helfactor*AmpSqFvToFvetI(gt1, gt2))
End if 
If ((Abs(MRPFvToFvetI(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvetI(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! Fv hh
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvhh(MFeOS,MFvOS,MhhOS,MHmOS,MVWpOS,            & 
& MVZOS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,MVWp2OS,MVZ2OS,ZcplFvFeHmL,ZcplFvFeHmR,              & 
& ZcplFvFecVWpL,ZcplFvFecVWpR,ZcplcFeFehhL,ZcplcFeFehhR,ZcplFvFvVZL,ZcplFvFvVZR,         & 
& ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcFeFvcHmL,ZcplcFeFvcHmR,ZcplhhHmVWp,ZcplhhHmcHm,       & 
& ZcplhhcVWpVWp,ZcplhhVZVZ,ZcplhhcHmcVWp,AmpVertexFvToFvhh)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvhh(MFeOS,MFvOS,MhhOS,MHmOS,MVWpOS,            & 
& MVZOS,MFe2OS,MFv2OS,Mhh2OS,MHm2OS,MVWp2OS,MVZ2OS,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,   & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,               & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,             & 
& cplhhVZVZ,cplhhcHmcVWp,AmpVertexFvToFvhh)

 End if 
Else 


!Self-energy Corrections 


!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvhh(MFe,MFv,Mhh,MHm,MVWp,MVZ,MFe2,             & 
& MFv2,Mhh2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,   & 
& AmpVertexFvToFvhh)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv hh -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvhh = 0._dp 
 AmpSum2FvToFvhh = 0._dp  
Else 
 AmpSumFvToFvhh = AmpVertexFvToFvhh + AmpWaveFvToFvhh
 AmpSum2FvToFvhh = AmpVertexFvToFvhh + AmpWaveFvToFvhh 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
    Do gt3=1,2
If (((OSkinematics).and.(MFvOS(gt1).gt.(MFvOS(gt2)+MhhOS(gt3)))).or.((.not.OSkinematics).and.(MFv(gt1).gt.(MFv(gt2)+Mhh(gt3))))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
Else  
  Call SquareAmp_FtoFS(MFv(gt1),MFv(gt2),Mhh(gt3),AmpSumFvToFvhh(:,gt1, gt2, gt3),AmpSum2FvToFvhh(:,gt1, gt2, gt3),AmpSqFvToFvhh(gt1, gt2, gt3)) 
End if  
Else  
  AmpSqFvToFvhh(gt1, gt2, gt3) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvhh(gt1, gt2, gt3).le.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),MhhOS(gt3),helfactor*AmpSqFvToFvhh(gt1, gt2, gt3))
Else 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFv(gt1),MFv(gt2),Mhh(gt3),helfactor*AmpSqFvToFvhh(gt1, gt2, gt3))
End if 
If ((Abs(MRPFvToFvhh(gt1, gt2, gt3)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvhh(gt1, gt2, gt3)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
End if 
i4=i4+1

    End do
  End do
If (gt1.eq.3) isave = i4 
End do
!---------------- 
! Fv VP
!---------------- 

If (LoopInducedDecaysOS) Then 


!Self-energy Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_WAVE_radinuZeeHB_FvToFvVP(ZcplFvFvVZL,ZcplFvFvVZR,ctcplFvFvVZL,        & 
& ctcplFvFvVZR,MFvOS,MFv2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfVL,ZfVP,ZfVZVP,AmpWaveFvToFvVP)

 Else 
Call Amplitude_WAVE_radinuZeeHB_FvToFvVP(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,          & 
& ctcplFvFvVZR,MFvOS,MFv2OS,MVP,MVP2,MVZOS,MVZ2OS,ZfVL,ZfVP,ZfVZVP,AmpWaveFvToFvVP)

 End if 


!Vertex Corrections 
 If (ExternalZfactors) Then 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvVP(MFeOS,MFvOS,MHmOS,MVP,MVWpOS,              & 
& MFe2OS,MFv2OS,MHm2OS,MVP2,MVWp2OS,ZcplFvFeHmL,ZcplFvFeHmR,ZcplFvFecVWpL,               & 
& ZcplFvFecVWpR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcFeFvcHmL,     & 
& ZcplcFeFvcHmR,ZcplHmVPVWp,ZcplHmcHmVP,ZcplcVWpVPVWp,ZcplcHmcVWpVP,AmpVertexFvToFvVP)

 Else 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvVP(MFeOS,MFvOS,MHmOS,MVP,MVWpOS,              & 
& MFe2OS,MFv2OS,MHm2OS,MVP2,MVWp2OS,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,     & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,AmpVertexFvToFvVP)

 End if 
Else 


!Self-energy Corrections 
Call Amplitude_WAVE_radinuZeeHB_FvToFvVP(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,          & 
& ctcplFvFvVZR,MFv,MFv2,MVP,MVP2,MVZ,MVZ2,ZfVL,ZfVP,ZfVZVP,AmpWaveFvToFvVP)



!Vertex Corrections 
Call Amplitude_VERTEX_radinuZeeHB_FvToFvVP(MFe,MFv,MHm,MVP,MVWp,MFe2,MFv2,            & 
& MHm2,MVP2,MVWp2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,           & 
& cplcFeFeVPR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVPVWp,            & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,AmpVertexFvToFvVP)

End if 


 !Square the amplitude 
If (DebugLoopDecays) Then 
Write(*,*) "------------------ Fv->Fv VP -----------------------" 
End if 
If (OnlyTreeLevelContributions) Then 
 AmpSumFvToFvVP = 0._dp 
 AmpSum2FvToFvVP = 0._dp  
Else 
 AmpSumFvToFvVP = AmpVertexFvToFvVP + AmpWaveFvToFvVP
 AmpSum2FvToFvVP = AmpVertexFvToFvVP + AmpWaveFvToFvVP 
End If 
Do gt1=1,3
i4 = isave 
  Do gt2=1,3
If (((OSkinematics).and.(MFvOS(gt1).gt.(MFvOS(gt2)+0.))).or.((.not.OSkinematics).and.(MFv(gt1).gt.(MFv(gt2)+MVP)))) Then 
If (OSkinematics) Then 
  Call SquareAmp_FtoFV(MFvOS(gt1),MFvOS(gt2),0._dp,AmpSumFvToFvVP(:,gt1, gt2),AmpSum2FvToFvVP(:,gt1, gt2),AmpSqFvToFvVP(gt1, gt2)) 
Else  
  Call SquareAmp_FtoFV(MFv(gt1),MFv(gt2),MVP,AmpSumFvToFvVP(:,gt1, gt2),AmpSum2FvToFvVP(:,gt1, gt2),AmpSqFvToFvVP(gt1, gt2)) 
End if  
Else  
  AmpSqFvToFvVP(gt1, gt2) = 0._dp 
End if  

! Calculate Partial widths 
helfactor = 2._dp 
If (AmpSqFvToFvVP(gt1, gt2).le.0._dp) Then 
  gP1LFv(gt1,i4) = 0._dp 
Else 
If (OSkinematics) Then 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFvOS(gt1),MFvOS(gt2),0._dp,helfactor*AmpSqFvToFvVP(gt1, gt2))
Else 
  gP1LFv(gt1,i4) = 1._dp*GammaTPS(MFv(gt1),MFv(gt2),MVP,helfactor*AmpSqFvToFvVP(gt1, gt2))
End if 
If ((Abs(MRPFvToFvVP(gt1, gt2)).gt.1.0E-20_dp).or.(Abs(MRGFvToFvVP(gt1, gt2)).gt.1.0E-20_dp)) Then 
  phasespacefactor = 1._dp 
End if 
 If (DebugLoopDecays) Write(*,*) "virtual", gP1LFv(gt1,i4) 
End if 
i4=i4+1

  End do
If (gt1.eq.3) isave = i4 
End do
End Subroutine OneLoopDecay_Fv

End Module Wrapper_OneLoopDecay_Fv_radinuZeeHB
