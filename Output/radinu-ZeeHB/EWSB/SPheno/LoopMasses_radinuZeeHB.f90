! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_radinuZeeHB 
 
Use Control 
Use Settings 
Use Couplings_radinuZeeHB 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_radinuZeeHB 
Use StandardModel 
Use Tadpoles_radinuZeeHB 
 Use Pole2L_radinuZeeHB 
 Use TreeLevelMasses_radinuZeeHB 
 
Real(dp), Private :: Mhh_1L(2), Mhh2_1L(2)  
Complex(dp), Private :: ZH_1L(2,2)  
Real(dp), Private :: MHm_1L(3), MHm2_1L(3)  
Complex(dp), Private :: ZP_1L(3,3)  
Real(dp), Private :: MFv_1L(3), MFv2_1L(3)  
Complex(dp), Private :: UV_1L(3,3)  
Real(dp), Private :: MFd_1L(3), MFd2_1L(3)  
Complex(dp), Private :: ZDL_1L(3,3),ZDR_1L(3,3)
Real(dp), Private :: MFu_1L(3), MFu2_1L(3)  
Complex(dp), Private :: ZUL_1L(3,3),ZUR_1L(3,3)
Real(dp), Private :: MFe_1L(3), MFe2_1L(3)  
Complex(dp), Private :: ZEL_1L(3,3),ZER_1L(3,3)
Real(dp), Private :: MAh_1L, MAh2_1L  
Real(dp), Private :: MetI_1L, MetI2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVWp_1L, MVWp2_1L  
Real(dp) :: pi2A0  
Real(dp) :: ti_ep2L(2)  
Real(dp) :: pi_ep2L(2,2)
Real(dp) :: Pi2S_EffPot(2,2)
Real(dp) :: PiP2S_EffPot(1,1)
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,              & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,           & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,lam5

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(inout) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(inout) :: v,vv

Complex(dp) :: cplAhAhAh,cplAhAhAhAh,cplAhAhcVWpVWp,cplAhAhetI,cplAhAhetIetI,cplAhAhhh(2),           & 
& cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhAhUhh(2),cplAhAhUhhUhh(2,2),cplAhAhUHmcUHm(3,3),& 
& cplAhAhVZVZ,cplAhcHmcVWp(3),cplAhcUHmcVWp(3),cplAhetIetI,cplAhetIhh(2),cplAhetIUhh(2), & 
& cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmcUHm(3,3),cplAhHmVWp(3),            & 
& cplAhUhhhh(2,2),cplAhUhhVZ(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),     & 
& cplcFdFdetIR(3,3),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFdFdVGL(3,3),            & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFdFucUHmL(3,3,3),cplcFdFucUHmR(3,3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),           & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),           & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvcUHmL(3,3,3),& 
& cplcFeFvcUHmR(3,3,3),cplcFeUFvcHmL(3,3,3),cplcFeUFvcHmR(3,3,3),cplcFeUFvVWpL(3,3),     & 
& cplcFeUFvVWpR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuAhL(3,3),             & 
& cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuUhhL(3,3,2),              & 
& cplcFuFuUhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgAgWpcVWp,cplcgGgGVG,cplcgWCgAcVWp,              & 
& cplcgWCgWCAh,cplcgWCgWCetI,cplcgWCgWCUhh(2),cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcVWp,   & 
& cplcgWCgZUHm(3),cplcgWpgWpAh,cplcgWpgWpetI,cplcgWpgWpUhh(2),cplcgWpgWpVP,              & 
& cplcgWpgWpVZ,cplcgWpgZcUHm(3),cplcgZgWCcUHm(3),cplcgZgWpcVWp,cplcgZgWpUHm(3),          & 
& cplcgZgZUhh(2),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),    & 
& cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),         & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),         & 
& cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3),cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),             & 
& cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),         & 
& cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),               & 
& cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3),       & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),             & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUHmcVWpVP(3),cplcUHmcVWpVZ(3),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,               & 
& cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,       & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,          & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cpletIcHmcVWp(3),cpletIcUHmcVWp(3),cpletIetIcVWpVWp,   & 
& cpletIetIetI,cpletIetIetIetI,cpletIetIhh(2),cpletIetIhhhh(2,2),cpletIetIHmcHm(3,3),    & 
& cpletIetIUhh(2),cpletIetIUhhUhh(2,2),cpletIetIUHmcUHm(3,3),cpletIetIVZVZ,              & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmcHm(3,3),cpletIHmcUHm(3,3),cpletIHmVWp(3)

Complex(dp) :: cpletIUhhhh(2,2),cpletIUhhVZ(2),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFvVZL(3,3),   & 
& cplFvFvVZR(3,3),cplhhcHmcVWp(2,3),cplhhcUHmcVWp(2,3),cplhhcVWpVWp(2),cplhhhhcVWpVWp(2,2),& 
& cplhhhhUHmcUHm(2,2,3,3),cplhhhhVZVZ(2,2),cplhhHmcUHm(2,3,3),cplhhVZVZ(2),              & 
& cplHmcHmcVWpVWp(3,3),cplHmcHmVP(3,3),cplHmcHmVPVP(3,3),cplHmcHmVPVZ(3,3),              & 
& cplHmcHmVZ(3,3),cplHmcHmVZVZ(3,3),cplHmcUHmVP(3,3),cplHmcUHmVZ(3,3),cplHmVPVWp(3),     & 
& cplHmVWpVZ(3),cplUFvFecVWpL(3,3),cplUFvFecVWpR(3,3),cplUFvFeHmL(3,3,3),cplUFvFeHmR(3,3,3),& 
& cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),cplUhhcVWpVWp(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3),& 
& cplUhhHmVWp(2,3),cplUhhUhhcVWpVWp(2,2),cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2,3,3), & 
& cplUhhUhhVZVZ(2,2),cplUhhVZVZ(2),cplUHmcUHmcVWpVWp(3,3),cplUHmcUHmVPVP(3,3),           & 
& cplUHmcUHmVZVZ(3,3),cplUHmHmcUHmcHm(3,3,3,3),cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,      & 
& cplVGVGVGVG3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Integer :: i2L, iFin 
Logical :: Convergence2L 
Real(dp) :: Pi2S_EffPot_save(2,2), diff(2,2)
Complex(dp) :: Tad1Loop(2), dmz2  
Real(dp) :: comp(2), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWp = RXi 
RXiZ = RXi 

 ! Running angles 

 
Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,GenerationMixing,kont)

m12Tree  = m12
mH2Tree  = mH2

 
 If (CalculateOneLoopMasses) Then 
 
If ((DecoupleAtRenScale).and.(Abs(1._dp-RXiNew).lt.0.01_dp)) Then 
vSM=vSM_Q 
v=vSM 
vv=0 
Else 
Call CouplingsForVectorBosons(g1,g2,ZH,TW,ZP,v,vv,ZDL,ZUL,UV,ZEL,cplAhhhVZ,           & 
& cplAhHmVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIhhVZ,cpletIHmVWp,cpletIetIcVWpVWp,         & 
& cpletIetIVZVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,              & 
& cplHmcHmVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcFdFdVZL,              & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplhhhhVZVZ,    & 
& cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplAhcHmcVWp,             & 
& cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,     & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,      & 
& cplcHmcVWpVZ,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,     & 
& cplcVWpcVWpVWpVWp3,cplHmcHmVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)

Call Pi1LoopVZ(mZ2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,   & 
& cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,dmZ2)

vev2=4._dp*Real(mZ2+dmz2,dp)/(g1**2+g2**2) -2*vv**2 
vSM=sqrt(vev2) 
v=vSM 
vv=0 
End if 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,GenerationMixing,kont)

Call CouplingsForLoopMasses(lam1,lam4,lam3,lam5,lam6,v,vv,lam7,ZH,g1,g2,              & 
& TW,lam2,epsD,Yd,ZDL,ZDR,epsE,Ye,ZEL,ZER,epsU,Yu,ZUL,ZUR,lam9,lam8,mu,lam10,            & 
& ZP,Yh,UV,lamh,g3,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,            & 
& cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,           & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,          & 
& cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,        & 
& cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,cplAhcUHmcVWp,             & 
& cplAhHmcUHm,cpletIcUHmcVWp,cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,     & 
& cplcFeFvcUHmR,cplcgZgWCcUHm,cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,     & 
& cplhhHmcUHm,cplHmcUHmVP,cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,        & 
& cpletIetIUHmcUHm,cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,      & 
& cplUHmcUHmVZVZ,cplUFvFecVWpL,cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,        & 
& cplUFvFvVZR,cplcFeUFvVWpL,cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,cplcUFdFdAhL,      & 
& cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,       & 
& cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,        & 
& cplcUFdFucHmR,cplcUFdFuVWpL,cplcUFdFuVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,     & 
& cplcUFuFuetIR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,cplcUFeFehhL,       & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHmL,        & 
& cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,cplAhAhAh,cplAhAhetI,cplAhAhhh,              & 
& cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,    & 
& cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,       & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,         & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmcHm,cpletIHmVWp,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp, & 
& cpletIetIVZVZ,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,              & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcFdFdVPL,cplcFdFdVPR,              & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,             & 
& cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,       & 
& cplcVWpVPVPVWp3,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,           & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,      & 
& cplHmVWpVZ,cplcVWpVWpVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,      & 
& cplcVWpVWpVZVZ3,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,   & 
& cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcHmcVWp,     & 
& cplhhcVWpVWp,cplcHmcVWpVP,cplcHmcVWpVZ,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,cplcVWpcVWpVWpVWp1,& 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplHmcHmVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,    & 
& cplcVWpVPVWpVZ3)

Call OneLoopTadpoleshh(v,vv,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhUhh,cpletIetIUhh,cplcFdFdUhhL,            & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,        & 
& cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhcVWpVWp,cplUhhVZVZ,             & 
& Tad1Loop(1:2))

m12Tree  = m12
mH2Tree  = mH2
If (CalculateTwoLoopHiggsMasses) Then 
    If(GaugelessLimit) Then 
  vFix = 0._dp 
  vvFix = 0._dp 
   g1_saveEP =g1
   g1 = 0._dp 
   g2_saveEP =g2
   g2 = 0._dp 
     Else 
  vFix = v 
  vvFix = vv 
     End if 

SELECT CASE (TwoLoopMethod) 
CASE ( 1 , 2 ) 


 CASE ( 3 ) ! Diagrammatic method 
  ! Make sure that there are no exactly degenerated masses! 
   epsU_saveEP =epsU
   where (aint(Abs(epsU)).eq.epsU) epsU=epsU*(1 + 1*1.0E-12_dp)
   Yu_saveEP =Yu
   where (aint(Abs(Yu)).eq.Yu) Yu=Yu*(1 + 2*1.0E-12_dp)
   epsD_saveEP =epsD
   where (aint(Abs(epsD)).eq.epsD) epsD=epsD*(1 + 3*1.0E-12_dp)
   epsE_saveEP =epsE
   where (aint(Abs(epsE)).eq.epsE) epsE=epsE*(1 + 4*1.0E-12_dp)
   Yd_saveEP =Yd
   where (aint(Abs(Yd)).eq.Yd) Yd=Yd*(1 + 5*1.0E-12_dp)
   Ye_saveEP =Ye
   where (aint(Abs(Ye)).eq.Ye) Ye=Ye*(1 + 6*1.0E-12_dp)
   Yh_saveEP =Yh
   where (aint(Abs(Yh)).eq.Yh) Yh=Yh*(1 + 7*1.0E-12_dp)

If (NewGBC) Then 
Call CalculatePi2S(125._dp**2,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,            & 
& lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,               & 
& kont,ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

Else 
Call CalculatePi2S(0._dp,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,kont,               & 
& ti_ep2L,Pi2S_EffPot,PiP2S_EffPot)

End if 
   epsU =epsU_saveEP 
   Yu =Yu_saveEP 
   epsD =epsD_saveEP 
   epsE =epsE_saveEP 
   Yd =Yd_saveEP 
   Ye =Ye_saveEP 
   Yh =Yh_saveEP 


 CASE ( 8 , 9 ) ! Hard-coded routines 
  
 END SELECT
 
   If(GaugelessLimit) Then 
   g1 =g1_saveEP 
   g2 =g2_saveEP 
   End if 

Else ! Two loop turned off 
Pi2S_EffPot = 0._dp 

Pi2A0 = 0._dp 

ti_ep2L = 0._dp 

End if 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,Tad1Loop)

m121L = m12
mH21L = mH2
Tad1Loop(1:2) = Tad1Loop(1:2) - ti_ep2L 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,Tad1Loop)

m122L = m12
mH22L = mH2
Call OneLoophh(mH22L,lam1,mEt2,lam2,lam4,lam3,m122L,lam7,lam5,lam6,v,vv,              & 
& MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,             & 
& MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,      & 
& cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,          & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,           & 
& cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cplUhhUhhhhhh,      & 
& cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,0.1_dp*delta_mass,Mhh_1L,Mhh2_1L,        & 
& ZH_1L,kont)

Call OneLoopHm(g2,mH21L,lam1,mEt2,lam2,lam4,lam3,m121L,lam7,lam5,lam6,mh,             & 
& lam9,lam8,mu,lam10,v,vv,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,              & 
& MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,cpletIcUHmcVWp, & 
& cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,cplcgZgWCcUHm,    & 
& cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,cplHmcUHmVP,         & 
& cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,               & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,        & 
& 0.1_dp*delta_mass,MHm_1L,MHm2_1L,ZP_1L,kont)

Call OneLoopFv(MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,cplUFvFecVWpL,          & 
& cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvVWpL,           & 
& cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,0.1_dp*delta_mass,MFv_1L,MFv2_1L,            & 
& UV_1L,kont)

Call OneLoopFd(epsD,Yd,v,vv,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,           & 
& MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,    & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,cplcUFdFuVWpR,     & 
& 0.1_dp*delta_mass,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,kont)

Call OneLoopFu(epsU,Yu,v,vv,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,              & 
& MFd2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,               & 
& cplcUFuFuetIR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,0.1_dp*delta_mass,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,kont)

Call OneLoopFe(epsE,Ye,v,vv,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,           & 
& MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,    & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,0.1_dp*delta_mass,             & 
& MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,kont)

Call OneLoopAh(g1,g2,mH22L,lam1,lam4,lam3,lam5,lam6,v,vv,TW,MAh,MAh2,MetI,            & 
& MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,      & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,    & 
& cplAhAhcVWpVWp,cplAhAhVZVZ,0.1_dp*delta_mass,MAh_1L,MAh2_1L,kont)

Call OneLoopetI(g1,g2,mEt2,lam2,lam4,lam3,lam7,lam5,v,vv,TW,MAh,MAh2,MetI,            & 
& MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,     & 
& cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,             & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,           & 
& cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,cpletIetIVZVZ,0.1_dp*delta_mass,         & 
& MetI_1L,MetI2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MHm = MHm_1L 
MHm2 = MHm2_1L 
ZP = ZP_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
MetI = MetI_1L 
MetI2 = MetI2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,              & 
& ZH,ZP,ZW,ZZ,alphaH,kont)

! Set pole masses 
MVWp = mW 
MVWp2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWp = 1._dp 
RXiZ = 1._dp 
MAh=MVZ
MAh2=MVZ2
MHm(1)=MVWp
MHm2(1)=MVWp2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
m12  = m12Tree 
mH2  = mH2Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(v,vv,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhUhh,cpletIetIUhh,cplcFdFdUhhL,   & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,        & 
& cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhcVWpVWp,cplUhhVZVZ,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhUhh(2),cpletIetIUhh(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),cplcFeFeUhhL(3,3,2),& 
& cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),cplcgWpgWpUhh(2),          & 
& cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3),cplUhhcVWpVWp(2), & 
& cplUhhVZVZ(2)

Real(dp), Intent(in) :: v,vv

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(2)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
A0m = SA_A0(MAh2) 
  Do gO1 = 1, 2
   coup = cplAhAhUhh(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! etI 
!------------------------ 
A0m = SA_A0(MetI2) 
  Do gO1 = 1, 2
   coup = cpletIetIUhh(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*SA_A0(MFd2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*SA_A0(MFe2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*SA_A0(MFu2(i1)) 
  Do gO1 = 1, 2
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[gWp] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWpgWpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWpC] 
!------------------------ 
A0m = 1._dp*SA_A0(MVWp2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgWCgWCUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*SA_A0(MVZ2*RXi) 
  Do gO1 = 1, 2
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 2
 A0m = SA_A0(Mhh2(i1)) 
  Do gO1 = 1, 2
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
Do i1 = 1, 3
 A0m = SA_A0(MHm2(i1)) 
  Do gO1 = 1, 2
   coup = cplUhhHmcHm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
A0m = 3._dp*SA_A0(MVWp2)+RXi*SA_A0(MVWp2*RXi) - 2._dp*MVWp2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhcVWpVWp(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*SA_A0(MVZ2)+RXi*SA_A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 2
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,v,               & 
& vv,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,               & 
& MHm2,MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,             & 
& cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,           & 
& cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,          & 
& cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,        & 
& cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MFd(3),MFd2(3),MFe(3),MFe2(3),            & 
& MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam6

Complex(dp), Intent(in) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),               & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3), & 
& cplUhhHmVWp(2,3),cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),& 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Complex(dp) :: mat2a(2,2), mat2(2,2),  PiSf(2,2,2)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(2), test_m2(2),p2, test(2) 
Real(dp), Intent(out) :: mass(2), mass2(2) 
Complex(dp), Intent(out) ::  RS(2,2) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mH2
mat2a(1,1) = mat2a(1,1)+(3*lam1*v**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(3*lam6*v*vv)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam3*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam4*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam5*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(3*v*vv*Conjg(lam6))/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-1._dp*(m12)/2._dp
mat2a(1,2) = mat2a(1,2)+(3*lam6*v**2)/4._dp
mat2a(1,2) = mat2a(1,2)+lam3*v*vv
mat2a(1,2) = mat2a(1,2)+lam4*v*vv
mat2a(1,2) = mat2a(1,2)+lam5*v*vv
mat2a(1,2) = mat2a(1,2)+(3*lam7*vv**2)/4._dp
mat2a(1,2) = mat2a(1,2)+(3*v**2*Conjg(lam6))/4._dp
mat2a(1,2) = mat2a(1,2)+(3*vv**2*Conjg(lam7))/4._dp
mat2a(1,2) = mat2a(1,2)-Conjg(m12)/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mEt2
mat2a(2,2) = mat2a(2,2)+(lam3*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(lam4*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(lam5*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(3*lam7*v*vv)/2._dp
mat2a(2,2) = mat2a(2,2)+(3*lam2*vv**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(3*v*vv*Conjg(lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
Call Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,             & 
& cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,           & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,        & 
& cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,             & 
& cpletIetIUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,           & 
& kont,PiSf(1,:,:))

PiSf(1,:,:) = PiSf(1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,             & 
& cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,           & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,        & 
& cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,             & 
& cpletIetIUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,           & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,2
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,2
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,             & 
& cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,           & 
& cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,        & 
& cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,             & 
& cpletIetIUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ,           & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=2,1,-1 
PiSf(i1,:,:) = PiSf(i1,:,:) - Pi2S_EffPot 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZHOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,2
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,               & 
& cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,             & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,       & 
& cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,               & 
& cplAhAhUhhUhh,cpletIetIUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,           & 
& cplUhhUhhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MFd(3),MFd2(3),MFe(3),MFe2(3),            & 
& MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),               & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3), & 
& cplUhhHmVWp(2,3),cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),& 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MAh2,MAh2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhh(gO1)
coup2 = Conjg(cplAhAhUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MetI2,MAh2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhetIUhh(gO1)
coup2 = Conjg(cplAhetIUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhhh(gO1,i1)
coup2 = Conjg(cplAhUhhhh(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MAh2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZ(gO1)
coup2 =  Conjg(cplAhUhhVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MetI2,MetI2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIetIUhh(gO1)
coup2 = Conjg(cpletIetIUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MetI2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUhhhh(gO1,i1)
coup2 = Conjg(cpletIUhhhh(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VZ, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MetI2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUhhVZ(gO1)
coup2 =  Conjg(cpletIUhhVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUhh(gO1)
coup2 =  cplcgWpgWpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUhh(gO1)
coup2 =  cplcgWCgWCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MHm2(i1),MHm2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHmcHm(gO1,i2,i1)
coup2 = Conjg(cplUhhHmcHm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHm2(i2),MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHmVWp(gO1,i2)
coup2 =  Conjg(cplUhhHmVWp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVWp2,MVWp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhcVWpVWp(gO1)
coup2 =  Conjg(cplUhhcVWpVWp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhhUhh(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MetI2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIetIUhhUhh(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MHm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhHmcHm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine DerPi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,            & 
& MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,               & 
& cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,             & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,       & 
& cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,               & 
& cplAhAhUhhUhh,cpletIetIUhhUhh,cplUhhUhhhhhh,cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,           & 
& cplUhhUhhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MFd(3),MFd2(3),MFe(3),MFe2(3),            & 
& MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),               & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3), & 
& cplUhhHmVWp(2,3),cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),& 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2,2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(2,2) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MAh2,MAh2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhh(gO1)
coup2 = Conjg(cplAhAhUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MetI2,MAh2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhetIUhh(gO1)
coup2 = Conjg(cplAhetIUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhhh(gO1,i1)
coup2 = Conjg(cplAhUhhhh(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = DerFloopRXi(p2,MAh2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhUhhVZ(gO1)
coup2 =  Conjg(cplAhUhhVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MetI2,MetI2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIetIUhh(gO1)
coup2 = Conjg(cpletIetIUhh(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MetI2),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUhhhh(gO1,i1)
coup2 = Conjg(cpletIUhhhh(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VZ, etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = DerFloopRXi(p2,MetI2,MVZ2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIUhhVZ(gO1)
coup2 =  Conjg(cpletIUhhVZ(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWpgWpUhh(gO1)
coup2 =  cplcgWpgWpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgWCgWCUhh(gO1)
coup2 =  cplcgWCgWCUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHm2(i1),MHm2(i2)),dp) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHmcHm(gO1,i2,i1)
coup2 = Conjg(cplUhhHmcHm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,MHm2(i2),MVWp2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhHmVWp(gO1,i2)
coup2 =  Conjg(cplUhhHmVWp(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVWp2,MVWp2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhcVWpVWp(gO1)
coup2 =  Conjg(cplUhhcVWpVWp(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVZ2),dp)   
 Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MAh2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplAhAhUhhUhh(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MetI2) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cpletIetIUhhUhh(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MHm2(i1)) 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhHmcHm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhcVWpVWp(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 2
  Do gO2 = gO1, 2
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 2
  Do gO1 = gO2+1, 2
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1Loophh 
 
Subroutine OneLoopHm(g2,mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,              & 
& mh,lam9,lam8,mu,lam10,v,vv,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,           & 
& MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,cpletIcUHmcVWp, & 
& cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,cplcgZgWCcUHm,    & 
& cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,cplHmcUHmVP,         & 
& cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,               & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,        & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,MHm(3),MHm2(3),MetI,MetI2,MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MVZ,MVZ2

Real(dp), Intent(in) :: g2,lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam6,mh,lam9,lam8,mu,lam10

Complex(dp), Intent(in) :: cplAhcUHmcVWp(3),cplAhHmcUHm(3,3),cpletIcUHmcVWp(3),cpletIHmcUHm(3,3),cplcFdFucUHmL(3,3,3),& 
& cplcFdFucUHmR(3,3,3),cplcFeFvcUHmL(3,3,3),cplcFeFvcUHmR(3,3,3),cplcgZgWCcUHm(3),       & 
& cplcgWCgZUHm(3),cplcgWpgZcUHm(3),cplcgZgWpUHm(3),cplhhcUHmcVWp(2,3),cplhhHmcUHm(2,3,3),& 
& cplHmcUHmVP(3,3),cplHmcUHmVZ(3,3),cplcUHmcVWpVP(3),cplcUHmcVWpVZ(3),cplAhAhUHmcUHm(3,3),& 
& cpletIetIUHmcUHm(3,3),cplhhhhUHmcUHm(2,2,3,3),cplUHmHmcUHmcHm(3,3,3,3),cplUHmcUHmVPVP(3,3),& 
& cplUHmcUHmcVWpVWp(3,3),cplUHmcUHmVZVZ(3,3)

Complex(dp) :: mat2a(3,3), mat2(3,3),  PiSf(3,3,3)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2, test(3) 
Real(dp), Intent(out) :: mass(3), mass2(3) 
Complex(dp), Intent(out) ::  RS(3,3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)+mh
mat2a(1,1) = mat2a(1,1)+(lam8*v**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam10*v*vv)/2._dp
mat2a(1,1) = mat2a(1,1)+(lam9*vv**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(v*vv*Conjg(lam10))/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+(mu*vv)/sqrt(2._dp)
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)-((mu*v)/sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)+mH2
mat2a(2,2) = mat2a(2,2)+(lam1*v**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(lam6*v*vv)/2._dp
mat2a(2,2) = mat2a(2,2)+(lam3*vv**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(v*vv*Conjg(lam6))/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*v**2*RXiWp)/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-1._dp*(m12)
mat2a(2,3) = mat2a(2,3)+(lam6*v**2)/2._dp
mat2a(2,3) = mat2a(2,3)+(lam4*v*vv)/2._dp
mat2a(2,3) = mat2a(2,3)+(lam5*v*vv)/2._dp
mat2a(2,3) = mat2a(2,3)+(lam7*vv**2)/2._dp
mat2a(2,3) = mat2a(2,3)+(g2**2*v*vv*RXiWp)/4._dp
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)+mEt2
mat2a(3,3) = mat2a(3,3)+(lam3*v**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(lam7*v*vv)/2._dp
mat2a(3,3) = mat2a(3,3)+(lam2*vv**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(v*vv*Conjg(lam7))/2._dp
mat2a(3,3) = mat2a(3,3)+(g2**2*vv**2*RXiWp)/4._dp

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
! Rotation matrix for p2=0 
PiSf(1,:,:) = ZeroC 
p2 = 0._dp 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,MFu,               & 
& MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,cpletIcUHmcVWp,     & 
& cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,cplcgZgWCcUHm,    & 
& cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,cplHmcUHmVP,         & 
& cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,               & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,        & 
& kont,PiSf(1,:,:))

mat2 = mat2a - Real(PiSf(1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZPOS_0 = RS 
 
 
! Now with momenta 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 = MHm2(i1)
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,MFu,               & 
& MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,cpletIcUHmcVWp,     & 
& cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,cplcgZgWCcUHm,    & 
& cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,cplHmcUHmVP,         & 
& cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,               & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,        & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,3
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
Call Pi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,MFu,               & 
& MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,cpletIcUHmcVWp,     & 
& cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,cplcgZgWCcUHm,    & 
& cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,cplHmcUHmVP,         & 
& cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,               & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,        & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
ZPOS_p2(i1,:) = RS(i1,:) 
 If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,3
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHm
 
 
Subroutine Pi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,             & 
& MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,cpletIcUHmcVWp, & 
& cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,cplcgZgWCcUHm,    & 
& cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,cplHmcUHmVP,         & 
& cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,               & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,MHm(3),MHm2(3),MetI,MetI2,MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcUHmcVWp(3),cplAhHmcUHm(3,3),cpletIcUHmcVWp(3),cpletIHmcUHm(3,3),cplcFdFucUHmL(3,3,3),& 
& cplcFdFucUHmR(3,3,3),cplcFeFvcUHmL(3,3,3),cplcFeFvcUHmR(3,3,3),cplcgZgWCcUHm(3),       & 
& cplcgWCgZUHm(3),cplcgWpgZcUHm(3),cplcgZgWpUHm(3),cplhhcUHmcVWp(2,3),cplhhHmcUHm(2,3,3),& 
& cplHmcUHmVP(3,3),cplHmcUHmVZ(3,3),cplcUHmcVWpVP(3),cplcUHmcVWpVZ(3),cplAhAhUHmcUHm(3,3),& 
& cpletIetIUHmcUHm(3,3),cplhhhhUHmcUHm(2,2,3,3),cplUHmHmcUHmcHm(3,3,3,3),cplUHmcUHmVPVP(3,3),& 
& cplUHmcUHmcVWpVWp(3,3),cplUHmcUHmVZVZ(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[VWp], Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MAh2,MVWp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhcUHmcVWp(gO1)
coup2 =  Conjg(cplAhcUHmcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(SA_B0(p2,MHm2(i1),MAh2),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhHmcUHm(i1,gO1)
coup2 = Conjg(cplAhHmcUHm(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MetI2,MVWp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpletIcUHmcVWp(gO1)
coup2 =  Conjg(cpletIcUHmcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hm, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(SA_B0(p2,MHm2(i1),MetI2),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpletIHmcUHm(i1,gO1)
coup2 = Conjg(cpletIHmcUHm(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*Real(SA_B0(p2,MFd2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFucUHmL(i1,i2,gO1)
coupR1 = cplcFdFucUHmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFucUHmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFucUHmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_Gloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*Real(SA_B0(p2,MFe2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFvcUHmL(i1,i2,gO1)
coupR1 = cplcFeFvcUHmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFvcUHmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFvcUHmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgWCcUHm(gO1)
coup2 =  cplcgWCgZUHm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_B0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWpgZcUHm(gO1)
coup2 =  cplcgZgWpUHm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhcUHmcVWp(i2,gO1)
coup2 =  Conjg(cplhhcUHmcVWp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,MHm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhHmcUHm(i2,i1,gO1)
coup2 = Conjg(cplhhHmcUHm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHm2(i2),0._dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHmcUHmVP(i2,gO1)
coup2 =  Conjg(cplHmcUHmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHm2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHmcUHmVZ(i2,gO1)
coup2 =  Conjg(cplHmcUHmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,0._dp,MVWp2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHmcVWpVP(gO1)
coup2 =  Conjg(cplcUHmcVWpVP(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(SVVloop(p2,MVZ2,MVWp2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHmcVWpVZ(gO1)
coup2 =  Conjg(cplcUHmcVWpVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MAh2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUHmcUHm(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MetI2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpletIetIUHmcUHm(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhhhUHmcUHm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MHm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmHmcUHmcHm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmcUHmcVWpVWp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmcUHmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHm 
 
Subroutine DerPi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,               & 
& MFd2,MFu,MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcUHmcVWp,cplAhHmcUHm,           & 
& cpletIcUHmcVWp,cpletIHmcUHm,cplcFdFucUHmL,cplcFdFucUHmR,cplcFeFvcUHmL,cplcFeFvcUHmR,   & 
& cplcgZgWCcUHm,cplcgWCgZUHm,cplcgWpgZcUHm,cplcgZgWpUHm,cplhhcUHmcVWp,cplhhHmcUHm,       & 
& cplHmcUHmVP,cplHmcUHmVZ,cplcUHmcVWpVP,cplcUHmcVWpVZ,cplAhAhUHmcUHm,cpletIetIUHmcUHm,   & 
& cplhhhhUHmcUHm,cplUHmHmcUHmcHm,cplUHmcUHmVPVP,cplUHmcUHmcVWpVWp,cplUHmcUHmVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MAh,MAh2,MHm(3),MHm2(3),MetI,MetI2,MFd(3),MFd2(3),MFu(3),MFu2(3),          & 
& MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcUHmcVWp(3),cplAhHmcUHm(3,3),cpletIcUHmcVWp(3),cpletIHmcUHm(3,3),cplcFdFucUHmL(3,3,3),& 
& cplcFdFucUHmR(3,3,3),cplcFeFvcUHmL(3,3,3),cplcFeFvcUHmR(3,3,3),cplcgZgWCcUHm(3),       & 
& cplcgWCgZUHm(3),cplcgWpgZcUHm(3),cplcgZgWpUHm(3),cplhhcUHmcVWp(2,3),cplhhHmcUHm(2,3,3),& 
& cplHmcUHmVP(3,3),cplHmcUHmVZ(3,3),cplcUHmcVWpVP(3),cplcUHmcVWpVZ(3),cplAhAhUHmcUHm(3,3),& 
& cpletIetIUHmcUHm(3,3),cplhhhhUHmcUHm(2,2,3,3),cplUHmHmcUHmcHm(3,3,3,3),cplUHmcUHmVPVP(3,3),& 
& cplUHmcUHmcVWpVWp(3,3),cplUHmcUHmVZVZ(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[VWp], Ah 
!------------------------ 
sumI = 0._dp 
 
F0m2 = DerFloopRXi(p2,MAh2,MVWp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhcUHmcVWp(gO1)
coup2 =  Conjg(cplAhcUHmcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHm2(i1),MAh2),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhHmcUHm(i1,gO1)
coup2 = Conjg(cplAhHmcUHm(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], etI 
!------------------------ 
sumI = 0._dp 
 
F0m2 = DerFloopRXi(p2,MetI2,MVWp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpletIcUHmcVWp(gO1)
coup2 =  Conjg(cpletIcUHmcVWp(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hm, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHm2(i1),MetI2),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpletIHmcUHm(i1,gO1)
coup2 = Conjg(cpletIHmcUHm(i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFd2(i1),MFu2(i2)),dp) 
B0m2 = -2._dp*MFd(i1)*MFu(i2)*Real(SA_DerB0(p2,MFd2(i1),MFu2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFucUHmL(i1,i2,gO1)
coupR1 = cplcFdFucUHmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFucUHmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFucUHmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Real(SA_DerGloop(p2,MFe2(i1),MFv2(i2)),dp) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*Real(SA_DerB0(p2,MFe2(i1),MFv2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFvcUHmL(i1,i2,gO1)
coupR1 = cplcFeFvcUHmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFvcUHmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFvcUHmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVWp2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgWCcUHm(gO1)
coup2 =  cplcgWCgZUHm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWp], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(SA_DerB0(p2,MVZ2*RXi,MVWp2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWpgZcUHm(gO1)
coup2 =  cplcgZgWpUHm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = DerFloopRXi(p2,Mhh2(i2),MVWp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhcUHmcVWp(i2,gO1)
coup2 =  Conjg(cplhhcUHmcVWp(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! Hm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,MHm2(i1),Mhh2(i2)),dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhHmcUHm(i2,i1,gO1)
coup2 = Conjg(cplhhHmcUHm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,MHm2(i2),MVP2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHmcUHmVP(i2,gO1)
coup2 =  Conjg(cplHmcUHmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = DerFloopRXi(p2,MHm2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHmcUHmVZ(i2,gO1)
coup2 =  Conjg(cplHmcUHmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVP2,MVWp2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHmcVWpVP(gO1)
coup2 =  Conjg(cplcUHmcVWpVP(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = Real(DerSVVloop(p2,MVZ2,MVWp2),dp)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHmcVWpVZ(gO1)
coup2 =  Conjg(cplcUHmcVWpVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MAh2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUHmcUHm(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MetI2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpletIetIUHmcUHm(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhhhUHmcUHm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MHm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmHmcUHmcHm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVP2) + 0.25_dp*RXi*SA_DerA0(MVP2*RXi) - 0.5_dp*MVP2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmcUHmVPVP(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmcUHmcVWpVWp(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHmcUHmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopHm 
 
Subroutine OneLoopFv(MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,cplUFvFecVWpL,    & 
& cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvVWpL,           & 
& cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,delta,MFv_1L,MFv2_1L,UV_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MFe(3),MFe2(3),MHm(3),MHm2(3),MVZ,MVZ2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: cplUFvFecVWpL(3,3),cplUFvFecVWpR(3,3),cplUFvFeHmL(3,3,3),cplUFvFeHmR(3,3,3),          & 
& cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),cplcFeUFvVWpL(3,3),cplcFeUFvVWpR(3,3),               & 
& cplcFeUFvcHmL(3,3,3),cplcFeUFvcHmR(3,3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3), mat2(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2 
Real(dp), Intent(out) :: MFv_1L(3),MFv2_1L(3) 
Complex(dp), Intent(out) ::  UV_1L(3,3) 
Real(dp) :: MFv_t(3),MFv2_t(3) 
Complex(dp) ::  UV_t(3,3) 
Complex(dp) ::  phaseM, E3(3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
Real(dp) :: UVa(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,cplUFvFecVWpL,    & 
& cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvVWpL,           & 
& cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
UVOS_0 = UV_1L 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_0 = UV_1L 
 End Do 
End If 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,cplUFvFecVWpL,    & 
& cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvVWpL,           & 
& cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,cplUFvFecVWpL,    & 
& cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,cplcFeUFvVWpL,           & 
& cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - 0.5_dp*(Conjg(SigSL) + SigSR + & 
      & 0.5_dp*(MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL))) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,3
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    UV_1L(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    UV_1L(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E3 = UV_1L(i1,:) 
      UV_1L(i1,:) = UV_1L(i2,:) 
      UV_1L(i2,:) = E3
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
UVOS_p2(il,:) = UV_1L(il,:) 
 Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, UV_1L, ierr, test) 
mat2 = Matmul( Conjg(UV_1L), Matmul( mat1, Transpose( Conjg(UV_1L)))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV_1L(i1,:)= phaseM * UV_1L(i1,:) 
End if 
UVOS_p2(il,:) = UV_1L(il,:) 
   If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,            & 
& cplUFvFecVWpL,cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,           & 
& cplcFeUFvVWpL,cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MFe(3),MFe2(3),MHm(3),MHm2(3),MVZ,MVZ2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: cplUFvFecVWpL(3,3),cplUFvFecVWpR(3,3),cplUFvFeHmL(3,3,3),cplUFvFeHmR(3,3,3),          & 
& cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),cplcFeUFvVWpL(3,3),cplcFeUFvVWpR(3,3),               & 
& cplcFeUFvcHmL(3,3,3),cplcFeUFvcHmR(3,3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! conj[VWp], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i2),MVWp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_B0(p2,MFe2(i2),MVWp2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFecVWpL(gO1,i2)
coupR1 = cplUFvFecVWpR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWpL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! Hm, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHm2(i1)),dp) 
coupL1 = cplUFvFeHmL(gO1,i2,i1)
coupR1 = cplUFvFeHmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFeHmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFeHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -4._dp*(Real(SA_B1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_B0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], VWp 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -4._dp*(Real(SA_B1(p2,MFe2(i1),MVWp2),dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_B0(p2,MFe2(i1),MVWp2),dp) - 0.5_dp*rMS) 
coupL1 = cplcFeUFvVWpL(i1,gO1)
coupR1 = cplcFeUFvVWpR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWpL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWpR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 !------------------------ 
! conj[Hm], bar[Fe] 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MHm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MHm2(i1)),dp) 
coupL1 = cplcFeUFvcHmL(i2,gO1,i1)
coupR1 = cplcFeUFvcHmR(i2,gO1,i1)
coupL2 =  Conjg(cplcFeUFvcHmL(i2,gO2,i1))
coupR2 =  Conjg(cplcFeUFvcHmR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFv 
 
Subroutine DerSigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,              & 
& MFv2,cplUFvFecVWpL,cplUFvFecVWpR,cplUFvFeHmL,cplUFvFeHmR,cplUFvFvVZL,cplUFvFvVZR,      & 
& cplcFeUFvVWpL,cplcFeUFvVWpR,cplcFeUFvcHmL,cplcFeUFvcHmR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MVWp,MVWp2,MFe(3),MFe2(3),MHm(3),MHm2(3),MVZ,MVZ2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: cplUFvFecVWpL(3,3),cplUFvFecVWpR(3,3),cplUFvFeHmL(3,3,3),cplUFvFeHmR(3,3,3),          & 
& cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),cplcFeUFvVWpL(3,3),cplcFeUFvVWpR(3,3),               & 
& cplcFeUFvcHmL(3,3,3),cplcFeUFvcHmR(3,3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! conj[VWp], Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i2),MVWp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i2)*(Real(SA_DerB0(p2,MFe2(i2),MVWp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFecVWpL(gO1,i2)
coupR1 = cplUFvFecVWpR(gO1,i2)
coupL2 =  Conjg(cplUFvFecVWpL(gO2,i2))
coupR2 =  Conjg(cplUFvFecVWpR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! Hm, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MHm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MHm2(i1)),dp) 
coupL1 = cplUFvFeHmL(gO1,i2,i1)
coupR1 = cplUFvFeHmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFeHmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFeHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFv2(i2),MVZ2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFv(i2)*(Real(SA_DerB0(p2,MFv2(i2),MVZ2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumSR(gO1,gO2) = coupL2*coupR1*B0m2 
SumSL(gO1,gO2) = coupR2*coupL1*B0m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
    End Do 
 !------------------------ 
! bar[Fe], VWp 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -4._dp*(Real(SA_DerB1(p2,MFe2(i1),MVWp2),dp) + 0.5_dp*DerrMS) 
B0m2 = -8._dp*MFe(i1)*(Real(SA_DerB0(p2,MFe2(i1),MVWp2),dp) - 0.5_dp*DerrMS) 
coupL1 = cplcFeUFvVWpL(i1,gO1)
coupR1 = cplcFeUFvVWpR(i1,gO1)
coupL2 =  Conjg(cplcFeUFvVWpL(i1,gO2))
coupR2 =  Conjg(cplcFeUFvVWpR(i1,gO2))
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
 !------------------------ 
! conj[Hm], bar[Fe] 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MHm2(i1)),dp) 
B0m2 = 2._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MHm2(i1)),dp) 
coupL1 = cplcFeUFvcHmL(i2,gO1,i1)
coupR1 = cplcFeUFvcHmR(i2,gO1,i1)
coupL2 =  Conjg(cplcFeUFvcHmL(i2,gO2,i1))
coupR2 =  Conjg(cplcFeUFvcHmR(i2,gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigSL = SigSL +1._dp/2._dp* sumSL 
SigSR = SigSR +1._dp/2._dp* sumSR 
      End Do 
     End Do 
 

SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFv 
 
Subroutine OneLoopFd(epsD,Yd,v,vv,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,              & 
& MVZ,MVZ2,MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,         & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,      & 
& cplcUFdFuVWpR,delta,MFd_1L,MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFu(3),MFu2(3),MVWp,MVWp2

Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((vv*epsD(1,1))/sqrt(2._dp))
mat1a(1,1) = mat1a(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((vv*epsD(2,1))/sqrt(2._dp))
mat1a(1,2) = mat1a(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((vv*epsD(3,1))/sqrt(2._dp))
mat1a(1,3) = mat1a(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((vv*epsD(1,2))/sqrt(2._dp))
mat1a(2,1) = mat1a(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((vv*epsD(2,2))/sqrt(2._dp))
mat1a(2,2) = mat1a(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((vv*epsD(3,2))/sqrt(2._dp))
mat1a(2,3) = mat1a(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((vv*epsD(1,3))/sqrt(2._dp))
mat1a(3,1) = mat1a(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((vv*epsD(2,3))/sqrt(2._dp))
mat1a(3,2) = mat1a(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((vv*epsD(3,3))/sqrt(2._dp))
mat1a(3,3) = mat1a(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,        & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,cplcUFdFuVWpR,     & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
ZDROS_0 = ZDR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
ZDLOS_0 = ZDL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,        & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,cplcUFdFuVWpR,     & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,        & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,cplcUFdFuVWpR,     & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDLOS_p2(il,:) = ZDL2(il,:) 
 ZDROS_p2(il,:) = ZDR2(il,:) 
 ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,            & 
& MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,cplcUFdFdetIR,    & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,cplcUFdFuVWpR,     & 
& sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1)
coupR1 = cplcUFdFdAhR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fd, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i1),MetI2),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MetI2),dp) 
coupL1 = cplcUFdFdetIL(gO1,i1)
coupR1 = cplcUFdFdetIR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdetIL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hm], Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHm2(i1)),dp) 
coupL1 = cplcUFdFucHmL(gO1,i2,i1)
coupR1 = cplcUFdFucHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFucHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFucHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWpL(gO1,i2)
coupR1 = cplcUFdFuVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFd 
 
Subroutine DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,              & 
& MVZ2,MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,             & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,      & 
& cplcUFdFuVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i1),MAh2),dp) 
B0m2 = MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MAh2),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1)
coupR1 = cplcUFdFdAhR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fd, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i1),MetI2),dp) 
B0m2 = MFd(i1)*Real(SA_DerB0(p2,MFd2(i1),MetI2),dp) 
coupL1 = cplcUFdFdetIL(gO1,i1)
coupR1 = cplcUFdFdetIR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdetIL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hm], Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),MHm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MHm2(i1)),dp) 
coupL1 = cplcUFdFucHmL(gO1,i2,i1)
coupR1 = cplcUFdFucHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFucHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFucHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVWp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVWp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFdFuVWpL(gO1,i2)
coupR1 = cplcUFdFuVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFd 
 
Subroutine OneLoopFu(epsU,Yu,v,vv,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,            & 
& MFd,MFd2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,           & 
& cplcUFuFuetIR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,delta,MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd(3),MFd2(3),MHm(3),MHm2(3),          & 
& Mhh(2),Mhh2(2),MVZ,MVZ2

Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),            & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vv*epsU(1,1))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vv*epsU(2,1))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vv*epsU(3,1))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vv*epsU(1,2))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vv*epsU(2,2))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vv*epsU(3,2))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vv*epsU(1,3))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vv*epsU(2,3))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vv*epsU(3,3))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,MFd2,MHm,            & 
& MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,cplcUFuFuetIR,          & 
& cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,cplcUFuFuhhR,     & 
& cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,         & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
ZUROS_0 = ZUR2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
ZULOS_0 = ZUL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,MFd2,MHm,            & 
& MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,cplcUFuFuetIR,          & 
& cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,cplcUFuFuhhR,     & 
& cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,         & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,MFd2,MHm,            & 
& MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,cplcUFuFuetIR,          & 
& cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,cplcUFuFuhhR,     & 
& cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,         & 
& sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZULOS_p2(il,:) = ZUL2(il,:) 
 ZUROS_p2(il,:) = ZUR2(il,:) 
 ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,               & 
& MFd2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,               & 
& cplcUFuFuetIR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd(3),MFd2(3),MHm(3),MHm2(3),          & 
& Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),            & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1)
coupR1 = cplcUFuFuAhR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fu, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i1),MetI2),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MetI2),dp) 
coupL1 = cplcUFuFuetIL(gO1,i1)
coupR1 = cplcUFuFuetIR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuetIL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! conj[VWp], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWpL(gO1,i2)
coupR1 = cplcUFuFdcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hm, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHm2(i1)),dp) 
coupL1 = cplcUFuFdHmL(gO1,i2,i1)
coupR1 = cplcUFuFdHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFu 
 
Subroutine DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,            & 
& MFd2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,               & 
& cplcUFuFuetIR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd(3),MFd2(3),MHm(3),MHm2(3),          & 
& Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),            & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MAh2),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MAh2),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1)
coupR1 = cplcUFuFuAhR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fu, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i1),MetI2),dp) 
B0m2 = MFu(i1)*Real(SA_DerB0(p2,MFu2(i1),MetI2),dp) 
coupL1 = cplcUFuFuetIL(gO1,i1)
coupR1 = cplcUFuFuetIR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuetIL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! conj[VWp], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFd2(i2),MVWp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MVWp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFdcVWpL(gO1,i2)
coupR1 = cplcUFuFdcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hm, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFd2(i2),MHm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_DerB0(p2,MFd2(i2),MHm2(i1)),dp) 
coupL1 = cplcUFuFdHmL(gO1,i2,i1)
coupR1 = cplcUFuFdHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVG2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVG2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigSL = SigSL +4._dp/3._dp* sumSL 
SigSR = SigSR +4._dp/3._dp* sumSR 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFu2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_DerB0(p2,MFu2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFu 
 
Subroutine OneLoopFe(epsE,Ye,v,vv,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,              & 
& MVZ,MVZ2,MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,         & 
& cplcUFeFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,        & 
& cplcUFeFeVZR,cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,delta,            & 
& MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFv(3),MFv2(3),MVWp,MVWp2

Real(dp), Intent(in) :: v,vv

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),            & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigSL(3,3), sigSR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)-((vv*epsE(1,1))/sqrt(2._dp))
mat1a(1,1) = mat1a(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)-((vv*epsE(1,2))/sqrt(2._dp))
mat1a(1,2) = mat1a(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)-((vv*epsE(1,3))/sqrt(2._dp))
mat1a(1,3) = mat1a(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)-((vv*epsE(2,1))/sqrt(2._dp))
mat1a(2,1) = mat1a(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)-((vv*epsE(2,2))/sqrt(2._dp))
mat1a(2,2) = mat1a(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)-((vv*epsE(2,3))/sqrt(2._dp))
mat1a(2,3) = mat1a(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)-((vv*epsE(3,1))/sqrt(2._dp))
mat1a(3,1) = mat1a(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)-((vv*epsE(3,2))/sqrt(2._dp))
mat1a(3,2) = mat1a(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)-((vv*epsE(3,3))/sqrt(2._dp))
mat1a(3,3) = mat1a(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
 !---------------------------------------- 
! Rotation matrix for p2=0 
!----------------------------------------- 
 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = 0._dp 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,        & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
ZEROS_0 = ZER2 
 mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
ZELOS_0 = ZEL2 
 
!---------------------------------------- 
! Now, with momenta
!----------------------------------------- 
 
Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,        & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigSL=0._dp 
sigSR=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,        & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,sigL,sigR,sigSL,sigSR)

mat1 = mat1a - SigSL - 0.5_dp*(MatMul(SigR,mat1a) + MatMul(mat1a,SigL)) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZELOS_p2(il,:) = ZEL2(il,:) 
 ZEROS_p2(il,:) = ZER2(il,:) 
 ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,            & 
& MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,    & 
& cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,         & 
& cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFv(3),MFv2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),            & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1)
coupR1 = cplcUFeFeAhR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fe, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i1),MetI2),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MetI2),dp) 
coupL1 = cplcUFeFeetIL(gO1,i1)
coupR1 = cplcUFeFeetIR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeetIL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hm], Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHm2(i1)),dp) 
coupL1 = cplcUFeFvcHmL(gO1,i2,i1)
coupR1 = cplcUFeFvcHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvcHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvcHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWp, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvVWpL(gO1,i2)
coupR1 = cplcUFeFvVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFe 
 
Subroutine DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,              & 
& MVZ2,MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,             & 
& cplcUFeFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,        & 
& cplcUFeFeVZR,cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,sigL,             & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFv(3),MFv2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),            & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i1),MAh2),dp) 
B0m2 = MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MAh2),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1)
coupR1 = cplcUFeFeAhR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fe, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i1),MetI2),dp) 
B0m2 = MFe(i1)*Real(SA_DerB0(p2,MFe2(i1),MetI2),dp) 
coupL1 = cplcUFeFeetIL(gO1,i1)
coupR1 = cplcUFeFeetIR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeetIL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVP2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVP2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFe2(i2),MVZ2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_DerB0(p2,MFe2(i2),MVZ2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hm], Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -Real(SA_DerB1(p2,MFv2(i2),MHm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MHm2(i1)),dp) 
coupL1 = cplcUFeFvcHmL(gO1,i2,i1)
coupR1 = cplcUFeFvcHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvcHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvcHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWp, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -2._dp*Real(SA_DerB1(p2,MFv2(i2),MVWp2)+ 0.5_dp*DerrMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_DerB0(p2,MFv2(i2),MVWp2)-0.5_dp*DerrMS,dp) 
coupL1 = cplcUFeFvVWpL(gO1,i2)
coupR1 = cplcUFeFvVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine DerSigma1LoopFe 
 
Subroutine OneLoopAh(g1,g2,mH2,lam1,lam4,lam3,lam5,lam6,v,vv,TW,MAh,MAh2,             & 
& MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,           & 
& cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,       & 
& cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,lam5,v,vv,TW

Complex(dp), Intent(in) :: mH2,lam1,lam4,lam3,lam6

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVWp(3),   & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhAhcVWpVWp,           & 
& cplAhAhVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mi2 = (2*(2._dp*(mH2) + lam1*v**2 + vv*(lam6*v + (lam3 + lam4 - lam5)*vv)) + 2*v*vv*Conjg(lam6) + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 

 
p2 = 0._dp 
PiSf = ZeroC 
Call Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,               & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,PiSf)

PiSf=PiSf- real(pip2s_effpot(1,1),dp)
mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,               & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,PiSf)

PiSf=PiSf- real(pip2s_effpot(1,1),dp)
mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,      & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVWp(3),   & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhAhcVWpVWp,           & 
& cplAhAhVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MAh2,MAh2),dp) 
coup1 = cplAhAhAh
coup2 = Conjg(cplAhAhAh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MetI2,MAh2),dp) 
coup1 = cplAhAhetI
coup2 = Conjg(cplAhAhetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2),dp) 
coup1 = cplAhAhhh(i1)
coup2 = Conjg(cplAhAhhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MetI2,MetI2),dp) 
coup1 = cplAhetIetI
coup2 = Conjg(cplAhetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MetI2),dp) 
coup1 = cplAhetIhh(i1)
coup2 = Conjg(cplAhetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*SA_B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdAhL(i1,i2)
coupR1 = cplcFdFdAhR(i1,i2)
coupL2 =  Conjg(cplcFdFdAhL(i1,i2))
coupR2 =  Conjg(cplcFdFdAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*SA_B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeAhL(i1,i2)
coupR1 = cplcFeFeAhR(i1,i2)
coupL2 =  Conjg(cplcFeFeAhL(i1,i2))
coupR2 =  Conjg(cplcFeFeAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*SA_B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuAhL(i1,i2)
coupR1 = cplcFuFuAhR(i1,i2)
coupL2 =  Conjg(cplcFuFuAhL(i1,i2))
coupR2 =  Conjg(cplcFuFuAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgWpAh
coup2 =  cplcgWpgWpAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWCAh
coup2 =  cplcgWCgWCAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
coup1 = cplAhhhhh(i1,i2)
coup2 = Conjg(cplAhhhhh(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = Real(FloopRXi(p2,Mhh2(i2),MVZ2),dp) 
coup1 = cplAhhhVZ(i2)
coup2 =  Conjg(cplAhhhVZ(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MHm2(i1),MHm2(i2)),dp) 
coup1 = cplAhHmcHm(i2,i1)
coup2 = Conjg(cplAhHmcHm(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = Real(FloopRXi(p2,MHm2(i2),MVWp2),dp) 
coup1 = cplAhHmVWp(i2)
coup2 =  Conjg(cplAhHmVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MAh2) 
coup1 = cplAhAhAhAh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MetI2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
coup1 = cplAhAhhhhh(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MHm2(i1)) 
coup1 = cplAhAhHmcHm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cplAhAhcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cplAhAhVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine DerPi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,      & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVWp(3),   & 
& cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhAhcVWpVWp,           & 
& cplAhAhVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MAh2,MAh2),dp) 
coup1 = cplAhAhAh
coup2 = Conjg(cplAhAhAh)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MetI2,MAh2),dp) 
coup1 = cplAhAhetI
coup2 = Conjg(cplAhAhetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2),dp) 
coup1 = cplAhAhhh(i1)
coup2 = Conjg(cplAhAhhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MetI2,MetI2),dp) 
coup1 = cplAhetIetI
coup2 = Conjg(cplAhetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MetI2),dp) 
coup1 = cplAhetIhh(i1)
coup2 = Conjg(cplAhetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_DerGloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*SA_DerB0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdAhL(i1,i2)
coupR1 = cplcFdFdAhR(i1,i2)
coupL2 =  Conjg(cplcFdFdAhL(i1,i2))
coupR2 =  Conjg(cplcFdFdAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_DerGloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*SA_DerB0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeAhL(i1,i2)
coupR1 = cplcFeFeAhR(i1,i2)
coupL2 =  Conjg(cplcFeFeAhL(i1,i2))
coupR2 =  Conjg(cplcFeFeAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_DerGloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*SA_DerB0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuAhL(i1,i2)
coupR1 = cplcFuFuAhR(i1,i2)
coupL2 =  Conjg(cplcFuFuAhL(i1,i2))
coupR2 =  Conjg(cplcFuFuAhR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgWpAh
coup2 =  cplcgWpgWpAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWCAh
coup2 =  cplcgWCgWCAh 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
coup1 = cplAhhhhh(i1,i2)
coup2 = Conjg(cplAhhhhh(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = Real(DerFloopRXi(p2,Mhh2(i2),MVZ2),dp) 
coup1 = cplAhhhVZ(i2)
coup2 =  Conjg(cplAhhhVZ(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHm2(i1),MHm2(i2)),dp) 
coup1 = cplAhHmcHm(i2,i1)
coup2 = Conjg(cplAhHmcHm(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = Real(DerFloopRXi(p2,MHm2(i2),MVWp2),dp) 
coup1 = cplAhHmVWp(i2)
coup2 =  Conjg(cplAhHmVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MAh2) 
coup1 = cplAhAhAhAh
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MetI2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
coup1 = cplAhAhhhhh(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MHm2(i1)) 
coup1 = cplAhAhHmcHm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
coup1 = cplAhAhcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
coup1 = cplAhAhVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine DerPi1LoopAh 
 
Subroutine OneLoopetI(g1,g2,mEt2,lam2,lam4,lam3,lam7,lam5,v,vv,TW,MAh,MAh2,           & 
& MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,           & 
& cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplAhAhetIetI,             & 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,cpletIetIVZVZ,           & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,lam5,v,vv,TW

Complex(dp), Intent(in) :: mEt2,lam2,lam4,lam3,lam7

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),   & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),           & 
& cpletIHmcHm(3,3),cpletIHmVWp(3),cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh(2,2),      & 
& cpletIetIHmcHm(3,3),cpletIetIcVWpVWp,cpletIetIVZVZ

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopetI'
 
mi2 = (2*(2._dp*(mEt2) + lam3*v**2 + lam4*v**2 - lam5*v**2 + lam7*v*vv + lam2*vv**2) + 2*v*vv*Conjg(lam7) + vv**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 

 
p2 = MetI2
PiSf = ZeroC 
Call Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,            & 
& cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,& 
& cpletIetIVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,            & 
& cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,& 
& cpletIetIVZVZ,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopetI
 
 
Subroutine Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,              & 
& MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,               & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmcHm,cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,    & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),   & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),           & 
& cpletIHmcHm(3,3),cpletIHmVWp(3),cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh(2,2),      & 
& cpletIetIHmcHm(3,3),cpletIetIcVWpVWp,cpletIetIVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MAh2,MAh2),dp) 
coup1 = cplAhAhetI
coup2 = Conjg(cplAhAhetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MetI2,MAh2),dp) 
coup1 = cplAhetIetI
coup2 = Conjg(cplAhetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MAh2),dp) 
coup1 = cplAhetIhh(i1)
coup2 = Conjg(cplAhetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_B0(p2,MetI2,MetI2),dp) 
coup1 = cpletIetIetI
coup2 = Conjg(cpletIetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),MetI2),dp) 
coup1 = cpletIetIhh(i1)
coup2 = Conjg(cpletIetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*SA_B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdetIL(i1,i2)
coupR1 = cplcFdFdetIR(i1,i2)
coupL2 =  Conjg(cplcFdFdetIL(i1,i2))
coupR2 =  Conjg(cplcFdFdetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*SA_B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeetIL(i1,i2)
coupR1 = cplcFeFeetIR(i1,i2)
coupL2 =  Conjg(cplcFeFeetIL(i1,i2))
coupR2 =  Conjg(cplcFeFeetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*SA_B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuetIL(i1,i2)
coupR1 = cplcFuFuetIR(i1,i2)
coupL2 =  Conjg(cplcFuFuetIL(i1,i2))
coupR2 =  Conjg(cplcFuFuetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgWpetI
coup2 =  cplcgWpgWpetI 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_B0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWCetI
coup2 =  cplcgWCgWCetI 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_B0(p2,Mhh2(i1),Mhh2(i2)),dp) 
coup1 = cpletIhhhh(i1,i2)
coup2 = Conjg(cpletIhhhh(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = Real(FloopRXi(p2,Mhh2(i2),MVZ2),dp) 
coup1 = cpletIhhVZ(i2)
coup2 =  Conjg(cpletIhhVZ(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_B0(p2,MHm2(i1),MHm2(i2)),dp) 
coup1 = cpletIHmcHm(i2,i1)
coup2 = Conjg(cpletIHmcHm(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = Real(FloopRXi(p2,MHm2(i2),MVWp2),dp) 
coup1 = cpletIHmVWp(i2)
coup2 =  Conjg(cpletIHmVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MAh2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_A0(MetI2) 
coup1 = cpletIetIetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_A0(Mhh2(i1)) 
coup1 = cpletIetIhhhh(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_A0(MHm2(i1)) 
coup1 = cpletIetIHmcHm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_A0(MVWp2) + 0.25_dp*RXi*SA_A0(MVWp2*RXi) - 0.5_dp*MVWp2*rMS 
coup1 = cpletIetIcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_A0(MVZ2) + 0.25_dp*RXi*SA_A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cpletIetIVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopetI 
 
Subroutine DerPi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,               & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmcHm,cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,    & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),   & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),           & 
& cpletIHmcHm(3,3),cpletIHmVWp(3),cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh(2,2),      & 
& cpletIetIHmcHm(3,3),cpletIetIcVWpVWp,cpletIetIVZVZ

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MAh2,MAh2),dp) 
coup1 = cplAhAhetI
coup2 = Conjg(cplAhAhetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, Ah 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MetI2,MAh2),dp) 
coup1 = cplAhetIetI
coup2 = Conjg(cplAhetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MAh2),dp) 
coup1 = cplAhetIhh(i1)
coup2 = Conjg(cplAhetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(SA_DerB0(p2,MetI2,MetI2),dp) 
coup1 = cpletIetIetI
coup2 = Conjg(cpletIetIetI)
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),MetI2),dp) 
coup1 = cpletIetIhh(i1)
coup2 = Conjg(cpletIetIhh(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_DerGloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*SA_DerB0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdetIL(i1,i2)
coupR1 = cplcFdFdetIR(i1,i2)
coupL2 =  Conjg(cplcFdFdetIL(i1,i2))
coupR2 =  Conjg(cplcFdFdetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_DerGloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*SA_DerB0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeetIL(i1,i2)
coupR1 = cplcFeFeetIR(i1,i2)
coupL2 =  Conjg(cplcFeFeetIL(i1,i2))
coupR2 =  Conjg(cplcFeFeetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = SA_DerGloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*SA_DerB0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuetIL(i1,i2)
coupR1 = cplcFuFuetIR(i1,i2)
coupL2 =  Conjg(cplcFuFuetIL(i1,i2))
coupR2 =  Conjg(cplcFuFuetIR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWpgWpetI
coup2 =  cplcgWpgWpetI 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(SA_DerB0(p2,MVWp2*RXi,MVWp2*RXi),dp) 
 coup1 = cplcgWCgWCetI
coup2 =  cplcgWCgWCetI 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
       Do i2 = 1, 2
 B0m2 = Real(SA_DerB0(p2,Mhh2(i1),Mhh2(i2)),dp) 
coup1 = cpletIhhhh(i1,i2)
coup2 = Conjg(cpletIhhhh(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 F0m2 = Real(DerFloopRXi(p2,Mhh2(i2),MVZ2),dp) 
coup1 = cpletIhhVZ(i2)
coup2 =  Conjg(cpletIhhVZ(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = Real(SA_DerB0(p2,MHm2(i1),MHm2(i2)),dp) 
coup1 = cpletIHmcHm(i2,i1)
coup2 = Conjg(cpletIHmcHm(i2,i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = Real(DerFloopRXi(p2,MHm2(i2),MVWp2),dp) 
coup1 = cpletIHmVWp(i2)
coup2 =  Conjg(cpletIHmVWp(i2))
    SumI = coup1*coup2*F0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MAh2) 
coup1 = cplAhAhetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI, etI 
!------------------------ 
sumI = 0._dp 
 
A0m2 = SA_DerA0(MetI2) 
coup1 = cpletIetIetIetI
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 A0m2 = SA_DerA0(Mhh2(i1)) 
coup1 = cpletIetIhhhh(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = SA_DerA0(MHm2(i1)) 
coup1 = cpletIetIHmcHm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_DerA0(MVWp2) + 0.25_dp*RXi*SA_DerA0(MVWp2*RXi) - 0.5_dp*MVWp2*DerrMS 
coup1 = cpletIetIcVWpVWp
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*SA_DerA0(MVZ2) + 0.25_dp*RXi*SA_DerA0(MVZ2*RXi) - 0.5_dp*MVZ2*DerrMS 
coup1 = cpletIetIVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine DerPi1LoopetI 
 
Subroutine Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,        & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,0._dp),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,0._dp,0._dp)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVG 
 
Subroutine DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,     & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,       & 
& cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVGL(i1,i2)
coupR1 = cplcFdFdVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVGL(i1,i2)
coupR1 = cplcFuFuVGR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gG], gG 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVG2,MVG2),dp)
coup1 = cplcgGgGVG
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +3._dp* SumI  
!------------------------ 
! VG, VG 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplVGVGVG
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVG2,MVG2)*coup1*coup2 
res = res +1.5_dp* SumI  
!------------------------ 
! VG 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVG2) +RXi/4._dp*SA_DerA0(MVG2*RXi) 
coup1 = cplVGVGVGVG1
coup2 = cplVGVGVGVG2
coup3 = cplVGVGVGVG3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVG2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVG 
 
Subroutine Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,               & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,             & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3), & 
& cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP(3,3),cplHmVPVWp(3),              & 
& cplcVWpVPVWp,cplHmcHmVPVP(3,3),cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHm2(i2).gt.50._dp**2).and.(MHm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHm2(i2).lt.50._dp**2).and.(MHm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(VSSloop(p2,MHm2(i2),MHm2(i1)),dp)  
coup1 = cplHmcHmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MHm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MHm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(VVSloop(p2,MVWp2,MHm2(i2)),dp)
coup1 = cplHmVPVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_A0(MHm2(i1))
 coup1 = cplHmcHmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine Pi1LoopVP 
 
Subroutine DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,            & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,             & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuVPL(3,3), & 
& cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP(3,3),cplHmVPVWp(3),              & 
& cplcVWpVPVWp,cplHmcHmVPVP(3,3),cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFd2(i1).gt.50._dp**2).and.(MFd2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFd2(i1).lt.50._dp**2).and.(MFd2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFe2(i1).gt.50._dp**2).and.(MFe2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFe2(i1).lt.50._dp**2).and.(MFe2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MFu2(i1).gt.50._dp**2).and.(MFu2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MFu2(i1).lt.50._dp**2).and.(MFu2(i2).lt.50._dp**2)) )   Then 
H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHm2(i2).gt.50._dp**2).and.(MHm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHm2(i2).lt.50._dp**2).and.(MHm2(i1).lt.50._dp**2)) )   Then 
B22m2 = Real(DerVSSloop(p2,MHm2(i2),MHm2(i1)),dp)  
coup1 = cplHmcHmVP(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
End If 
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MHm2(i2).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MHm2(i2).lt.50._dp**2)) )   Then 
B0m2 = Real(DerVVSloop(p2,MVWp2,MHm2(i2)),dp)
coup1 = cplHmVPVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
End If 
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2).and.(MVWp2.lt.50._dp**2)) )   Then 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
End If 
!------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MHm2(i1).gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MHm2(i1).lt.50._dp**2)) )   Then 
SumI = 0._dp 
 A0m2 = SA_DerA0(MHm2(i1))
 coup1 = cplHmcHmVPVP(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
End If 
      End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
If (((.not.OnlyHeavyStates).and.(.not.OnlyLightStates)) & 
  & .or.((OnlyHeavyStates).and.(MVWp2.gt.50._dp**2))   & 
  & .or.((OnlyLightStates).and.(MVWp2.lt.50._dp**2)) )   Then 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
End If 
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVP 
 
Subroutine OneLoopVZ(g1,g2,v,vv,TW,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,          & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,       & 
& cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,       & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(in) :: cplAhhhVZ(2),cpletIhhVZ(2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),        & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWpVZ(3),cplcVWpVWpVZ,     & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ(2,2),cplHmcHmVZVZ(3,3),cplcVWpVWpVZVZ1,          & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,   & 
& cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,   & 
& cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,       & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cpletIhhVZ(2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),        & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWpVZ(3),cplcVWpVWpVZ,     & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ(2,2),cplHmcHmVZVZ(3,3),cplcVWpVWpVZVZ1,          & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = Real(VSSloop(p2,MAh2,Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = Real(VSSloop(p2,MetI2,Mhh2(i1)),dp)  
coup1 = cpletIhhVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_B0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = Real(VSSloop(p2,MHm2(i2),MHm2(i1)),dp)  
coup1 = cplHmcHmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(VVSloop(p2,MVWp2,MHm2(i2)),dp)
coup1 = cplHmVWpVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_A0(MAh2)
 coup1 = cplAhAhVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_A0(MetI2)
 coup1 = cpletIetIVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(MHm2(i1))
 coup1 = cplHmcHmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,       & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),              & 
& MFu2(3),MFv(3),MFv2(3),MVZ,MVZ2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cpletIhhVZ(2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),        & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWpVZ(3),cplcVWpVWpVZ,     & 
& cplAhAhVZVZ,cpletIetIVZVZ,cplhhhhVZVZ(2,2),cplHmcHmVZVZ(3,3),cplcVWpVWpVZVZ1,          & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MAh2,Mhh2(i1)),dp)  
coup1 = cplAhhhVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 B22m2 = Real(DerVSSloop(p2,MetI2,Mhh2(i1)),dp)  
coup1 = cpletIhhVZ(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFv2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*Real(SA_DerB0(p2,MFv2(i1),MFv2(i2)),dp) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVZ2,Mhh2(i2)),dp)
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = Real(DerVSSloop(p2,MHm2(i2),MHm2(i1)),dp)  
coup1 = cplHmcHmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVWp2,MHm2(i2)),dp)
coup1 = cplHmVWpVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2)
 coup1 = cplAhAhVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_DerA0(MetI2)
 coup1 = cpletIetIVZVZ
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHm2(i1))
 coup1 = cplHmcHmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZ 
 
Subroutine OneLoopVWp(g2,v,vv,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,              & 
& MFd2,MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,        & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,     & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,              & 
& cplHmcHmcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHm(3),MHm2(3),MAh,MAh2,MetI,MetI2,MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(3),              & 
& MFv2(3),MFe(3),MFe2(3),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2

Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(in) :: cplAhcHmcVWp(3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,         & 
& cplcgWCgZcVWp,cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplcHmcVWpVP(3),cplcVWpVPVWp,          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp(2,2),      & 
& cplHmcHmcVWpVWp(3,3),cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,& 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigSL, SigSR 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWp'
 
mi2 = MVWp2 

 
p2 = MVWp2
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,MFv2,           & 
& MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,        & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,MFv2,           & 
& MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,        & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWp
 
 
Subroutine Pi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,              & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,             & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,     & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,              & 
& cplHmcHmcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHm(3),MHm2(3),MAh,MAh2,MetI,MetI2,MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(3),              & 
& MFv2(3),MFe(3),MFe2(3),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHmcVWp(3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,         & 
& cplcgWCgZcVWp,cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplcHmcVWpVP(3),cplcVWpVPVWp,          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp(2,2),      & 
& cplHmcHmcVWpVWp(3,3),cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,& 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! conj[Hm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B22m2 = Real(VSSloop(p2,MAh2,MHm2(i1)),dp)  
coup1 = cplAhcHmcVWp(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B22m2 = Real(VSSloop(p2,MetI2,MHm2(i1)),dp)  
coup1 = cpletIcHmcVWp(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_B0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWpL(i1,i2)
coupR1 = cplcFuFdcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_B0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWpL(i1,i2)
coupR1 = cplFvFecVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWpC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,0._dp,MVWp2),dp)
coup1 = cplcgWCgAcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,0._dp),dp)
coup1 = cplcgAgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVWp2,MVZ2),dp)
coup1 = cplcgZgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(VGGloop(p2,MVZ2,MVWp2),dp)
coup1 = cplcgWCgZcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 B22m2 = Real(VSSloop(p2,Mhh2(i2),MHm2(i1)),dp)  
coup1 = cplhhcHmcVWp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(VVSloop(p2,MVWp2,Mhh2(i2)),dp)
coup1 = cplhhcVWpVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(VVSloop(p2,0._dp,MHm2(i1)),dp)
coup1 = cplcHmcVWpVP(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWp2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(VVSloop(p2,MVZ2,MHm2(i1)),dp)
coup1 = cplcHmcVWpVZ(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_A0(MAh2)
 coup1 = cplAhAhcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_A0(MetI2)
 coup1 = cpletIetIcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_A0(Mhh2(i1))
 coup1 = cplhhhhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(MHm2(i1))
 coup1 = cplHmcHmcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(0._dp) +RXi/4._dp*SA_A0(0._dp*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpcVWpVWpVWp2
coup2 = cplcVWpcVWpVWpVWp3
coup3 = cplcVWpcVWpVWpVWp1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVZ2) +RXi/4._dp*SA_A0(MVZ2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWp 
 
Subroutine DerPi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,           & 
& MFv,MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,             & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,     & 
& cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,              & 
& cplHmcHmcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,    & 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHm(3),MHm2(3),MAh,MAh2,MetI,MetI2,MFu(3),MFu2(3),MFd(3),MFd2(3),MFv(3),              & 
& MFv2(3),MFe(3),MFe2(3),Mhh(2),Mhh2(2),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhcHmcVWp(3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,         & 
& cplcgWCgZcVWp,cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplcHmcVWpVP(3),cplcVWpVPVWp,          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp(2,2),      & 
& cplHmcHmcVWpVWp(3,3),cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,& 
& cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! conj[Hm], Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B22m2 = Real(DerVSSloop(p2,MAh2,MHm2(i1)),dp)  
coup1 = cplAhcHmcVWp(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm], etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B22m2 = Real(DerVSSloop(p2,MetI2,MHm2(i1)),dp)  
coup1 = cpletIcHmcVWp(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*Real(SA_DerB0(p2,MFu2(i1),MFd2(i2)),dp) 
coupL1 = cplcFuFdcVWpL(i1,i2)
coupR1 = cplcFuFdcVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFv2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFv(i1)*MFe(i2)*Real(SA_DerB0(p2,MFv2(i1),MFe2(i2)),dp) 
coupL1 = cplFvFecVWpL(i1,i2)
coupR1 = cplFvFecVWpR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWpC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVP2,MVWp2),dp)
coup1 = cplcgWCgAcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVP2),dp)
coup1 = cplcgAgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWp 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVZ2),dp)
coup1 = cplcgZgWpcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = Real(DerVGGloop(p2,MVZ2,MVWp2),dp)
coup1 = cplcgWCgZcVWp
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 2
 B22m2 = Real(DerVSSloop(p2,Mhh2(i2),MHm2(i1)),dp)  
coup1 = cplhhcHmcVWp(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 B0m2 = Real(DerVVSloop(p2,MVWp2,Mhh2(i2)),dp)
coup1 = cplhhcVWpVWp(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], VP 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVP2,MHm2(i1)),dp)
coup1 = cplcHmcVWpVP(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VWp, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVPVWp
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVWp2,MVP2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWp 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWpVWpVZ
coup2 = Conjg(coup1) 
    SumI = -DerVVVloop(p2,MVZ2,MVWp2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], VZ 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVZ2,MHm2(i1)),dp)
coup1 = cplcHmcVWpVZ(i1)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! Ah 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_DerA0(MAh2)
 coup1 = cplAhAhcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! etI 
!------------------------ 
SumI = 0._dp 
 A0m2 = SA_DerA0(MetI2)
 coup1 = cpletIetIcVWpVWp
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 2
 SumI = 0._dp 
 A0m2 = SA_DerA0(Mhh2(i1))
 coup1 = cplhhhhcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHm2(i1))
 coup1 = cplHmcHmcVWpVWp(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVP2) +RXi/4._dp*SA_DerA0(MVP2*RXi) 
coup1 = cplcVWpVPVPVWp3
coup2 = cplcVWpVPVPVWp1
coup3 = cplcVWpVPVPVWp2
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVP2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpcVWpVWpVWp2
coup2 = cplcVWpcVWpVWpVWp3
coup3 = cplcVWpcVWpVWpVWp1
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVZ2) +RXi/4._dp*SA_DerA0(MVZ2*RXi) 
coup1 = cplcVWpVWpVZVZ1
coup2 = cplcVWpVWpVZVZ2
coup3 = cplcVWpVWpVZVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVWp 
 
Subroutine Sigma1LoopFeMZ(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,               & 
& MVZ2,MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcUFeFeAhL,cplcUFeFeAhR,cplcUFeFeetIL,             & 
& cplcUFeFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,        & 
& cplcUFeFeVZR,cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,cplcUFeFvVWpR,sigL,             & 
& sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFv(3),MFv2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),            & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MAh2),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MAh2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MAh2),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MAh2),dp) 
End If 
coupL1 = cplcUFeFeAhL(gO1,i1)
coupR1 = cplcUFeFeAhR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fe, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i1),MetI2),dp) 
B0m2 = MFe(i1)*Real(SA_B0(MFe2(gO1),MFe2(i1),MetI2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i1),MetI2),dp) 
B0m2 = MFe(i1)*Real(SA_B0(p2,MFe2(i1),MetI2),dp) 
End If 
coupL1 = cplcUFeFeetIL(gO1,i1)
coupR1 = cplcUFeFeetIR(gO1,i1)
coupL2 =  Conjg(cplcUFeFeetIL(gO2,i1))
coupR2 =  Conjg(cplcUFeFeetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(SA_B0(p2,MFe2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFe2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(MFe2(gO1),MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(SA_B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hm], Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFe2(gO1),MFv2(i2),MHm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MHm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFv2(i2),MHm2(i1)),dp) 
B0m2 = MFv(i2)*Real(SA_B0(p2,MFv2(i2),MHm2(i1)),dp) 
End If 
coupL1 = cplcUFeFvcHmL(gO1,i2,i1)
coupR1 = cplcUFeFvcHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvcHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvcHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWp, Fv 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFe2(gO1),MFv2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(MFe2(gO1),MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFv2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(SA_B0(p2,MFv2(i2),MVWp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFeFvVWpL(gO1,i2)
coupR1 = cplcUFeFvVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFeMZ 
 
Subroutine Sigma1LoopFdMZ(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,               & 
& MVZ2,MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,             & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,      & 
& cplcUFdFuVWpR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2,MHm(3),MHm2(3),            & 
& MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MAh2),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MAh2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MAh2),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MAh2),dp) 
End If 
coupL1 = cplcUFdFdAhL(gO1,i1)
coupR1 = cplcUFdFdAhR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fd, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i1),MetI2),dp) 
B0m2 = MFd(i1)*Real(SA_B0(MFd2(gO1),MFd2(i1),MetI2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i1),MetI2),dp) 
B0m2 = MFd(i1)*Real(SA_B0(p2,MFd2(i1),MetI2),dp) 
End If 
coupL1 = cplcUFdFdetIL(gO1,i1)
coupR1 = cplcUFdFdetIR(gO1,i1)
coupL2 =  Conjg(cplcUFdFdetIL(gO2,i1))
coupR2 =  Conjg(cplcUFdFdetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFd2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFd2(gO1),MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! conj[Hm], Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFd2(gO1),MFu2(i2),MHm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MHm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),MHm2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),MHm2(i1)),dp) 
End If 
coupL1 = cplcUFdFucHmL(gO1,i2,i1)
coupR1 = cplcUFdFucHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFucHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFucHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VWp, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFd2(gO1),MFu2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFd2(gO1),MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVWp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFdFuVWpL(gO1,i2)
coupR1 = cplcUFdFuVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFdMZ 
 
Subroutine Sigma1LoopFuMZ(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,             & 
& MFd2,MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,               & 
& cplcUFuFuetIR,cplcUFuFdcVWpL,cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,    & 
& cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,         & 
& cplcUFuFuVZR,sigL,sigR,sigSL,sigSR)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd(3),MFd2(3),MHm(3),MHm2(3),          & 
& Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),            & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigSL(3,3), SigSR(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumSL(3,3), sumSR(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigSL = Cmplx(0._dp,0._dp,dp) 
 SigSR = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MAh2),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MAh2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MAh2),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MAh2),dp) 
End If 
coupL1 = cplcUFuFuAhL(gO1,i1)
coupR1 = cplcUFuFuAhR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! Fu, etI 
!------------------------ 
    Do i1 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i1),MetI2),dp) 
B0m2 = MFu(i1)*Real(SA_B0(MFu2(gO1),MFu2(i1),MetI2),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i1),MetI2),dp) 
B0m2 = MFu(i1)*Real(SA_B0(p2,MFu2(i1),MetI2),dp) 
End If 
coupL1 = cplcUFuFuetIL(gO1,i1)
coupR1 = cplcUFuFuetIR(gO1,i1)
coupL2 =  Conjg(cplcUFuFuetIL(gO2,i1))
coupR2 =  Conjg(cplcUFuFuetIR(gO2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
 !------------------------ 
! conj[VWp], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFd2(i2),MVWp2),dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFd2(i2),MVWp2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(SA_B0(p2,MFd2(i2),MVWp2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFdcVWpL(gO1,i2)
coupR1 = cplcUFuFdcVWpR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWpL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWpR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 !------------------------ 
! Hm, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFd2(i2),MHm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(MFu2(gO1),MFd2(i2),MHm2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFd2(i2),MHm2(i1)),dp) 
B0m2 = MFd(i2)*Real(SA_B0(p2,MFd2(i2),MHm2(i1)),dp) 
End If 
coupL1 = cplcUFuFdHmL(gO1,i2,i1)
coupR1 = cplcUFuFdHmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdHmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdHmR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 2
       Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -Real(SA_B1(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),Mhh2(i1)),dp) 
Else 
B1m2 = -Real(SA_B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(SA_B0(p2,MFu2(i2),Mhh2(i1)),dp) 
End If 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumSL(gO1,gO2) = coupR1*coupL2*B0m2 
SumSR(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
      End Do 
     End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumSL = 0._dp 
SumSR = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
If(gO1.eq.gO2) Then 
B1m2 = -2._dp*Real(SA_B1(MFu2(gO1),MFu2(i2),MVZ2),dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(MFu2(gO1),MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
Else 
B1m2 = -2._dp*Real(SA_B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(SA_B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
End If 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumSL(gO1,gO2) = coupL1*coupR2*B0m2 
SumSR(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigSL = SigSL +1._dp* sumSL 
SigSR = SigSR +1._dp* sumSR 
    End Do 
 SigL = oo16pi2*SigL 
SigR = oo16pi2*SigR 
SigSL = oo16pi2*SigSL 
SigSR = oo16pi2*SigSR 
 
End Subroutine Sigma1LoopFuMZ 
 
Subroutine Pi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,         & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplHmcHmVP,cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3), & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,              & 
& cplcgWpgWpVZ,cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVPVWpVZ1,             & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP(3,3),cplHmcHmVPVZ(3,3),        & 
& cplHmcHmVZ(3,3),cplHmVPVWp(3),cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_Hloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = cplcgWpgWpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = cplcgWCgWCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = Real(VSSloop(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVP(i2,i1)
coup2 = cplHmcHmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(VVSloop(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVPVWp(i2)
coup2 = cplcHmcVWpVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(VVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcVWpVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(VVSloop(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVP(i2)
coup2 = cplHmVWpVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_A0(MHm2(i1))
 coup1 = cplHmcHmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_A0(MVWp2) +RXi/4._dp*SA_A0(MVWp2*RXi) 
coup1 = cplcVWpVPVWpVZ2
coup2 = cplcVWpVPVWpVZ1
coup3 = cplcVWpVPVWpVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVPVZ 
 
Subroutine DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,          & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,         & 
& cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,             & 
& cplHmcHmVP,cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVPL(3,3), & 
& cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,              & 
& cplcgWpgWpVZ,cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplcVWpVPVWp,cplcVWpVPVWpVZ1,             & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP(3,3),cplHmcHmVPVZ(3,3),        & 
& cplHmcHmVZ(3,3),cplHmVPVWp(3),cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFd2(i1),MFd2(i2)),dp) 
B0m2 = 2._dp*MFd(i1)*MFd(i2)*Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVPL(i1,i2)
coupR1 = cplcFdFdVPR(i1,i2)
coupL2 = cplcFdFdVZL(i2,i1)
coupR2 = cplcFdFdVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFe2(i1),MFe2(i2)),dp) 
B0m2 = 2._dp*MFe(i1)*MFe(i2)*Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVPL(i1,i2)
coupR1 = cplcFeFeVPR(i1,i2)
coupL2 = cplcFeFeVZL(i2,i1)
coupR2 = cplcFeFeVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Real(SA_DerHloop(p2,MFu2(i1),MFu2(i2)),dp) 
B0m2 = 2._dp*MFu(i1)*MFu(i2)*Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVPL(i1,i2)
coupR1 = cplcFuFuVPR(i1,i2)
coupL2 = cplcFuFuVZL(i2,i1)
coupR2 = cplcFuFuVZR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*H0m2 & 
                & + 0.5_dp*(coupL1*coupR2 + coupL2*coupR1)*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWpgWpVP
coup2 = cplcgWpgWpVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVGGloop(p2,MVWp2,MVWp2),dp)
coup1 = cplcgWCgWCVP
coup2 = cplcgWCgWCVZ 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = Real(DerVSSloop(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVP(i2,i1)
coup2 = cplHmcHmVZ(i1,i2)
    SumI = coup1*coup2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVPVWp(i2)
coup2 = cplcHmcVWpVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = Real(DerVVVloop(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVPVWp
coup2 = cplcVWpVWpVZ
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = Real(DerVVSloop(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVP(i2)
coup2 = cplHmVWpVZ(i2)
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = SA_DerA0(MHm2(i1))
 coup1 = cplHmcHmVPVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWp] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*SA_DerA0(MVWp2) +RXi/4._dp*SA_DerA0(MVWp2*RXi) 
coup1 = cplcVWpVPVWpVZ2
coup2 = cplcVWpVPVWpVZ1
coup3 = cplcVWpVPVWpVZ3
SumI = ((2._dp*DerrMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWp2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine DerPi1LoopVPVZ 
 
Subroutine Pi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,               & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHmcVWpVZ,cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhcHmcVWp(3),cplAhetIhh(2),cplAhhhVZ(2),cplAhHmcHm(3,3),              & 
& cplAhHmVWp(3),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),     & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWCgWCAh,cplcgWCgWCVZ,          & 
& cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ(3),cpletIhhVZ(2),cplhhVZVZ(2),cplHmcHmVZ(3,3),  & 
& cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MAh2,Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2,Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i1)
coup2 = cplAhAhhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MetI2,Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MetI2,Mhh2(i1)),dp) 
coup1 = cpletIhhVZ(i1)
coup2 = cplAhetIhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1)
coupR2 = cplcFdFdAhR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1)
coupR2 = cplcFeFeAhR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1)
coupR2 = cplcFuFuAhR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpAh 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCAh 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MHm2(i2),MHm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVZ(i2,i1)
coup2 = cplAhHmcHm(i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVWpVZ(i2)
coup2 = cplAhcHmcVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVZ(i2)
coup2 = cplAhHmVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZAh 
 
Subroutine DerPi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,          & 
& cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,           & 
& cplcHmcVWpVZ,cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhcHmcVWp(3),cplAhetIhh(2),cplAhhhVZ(2),cplAhHmcHm(3,3),              & 
& cplAhHmVWp(3),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),     & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWCgWCAh,cplcgWCgWCVZ,          & 
& cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ(3),cpletIhhVZ(2),cplhhVZVZ(2),cplHmcHmVZ(3,3),  & 
& cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MAh2,Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2,Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i1)
coup2 = cplAhAhhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MetI2,Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MetI2,Mhh2(i1)),dp) 
coup1 = cpletIhhVZ(i1)
coup2 = cplAhetIhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdAhL(i2,i1)
coupR2 = cplcFdFdAhR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeAhL(i2,i1)
coupR2 = cplcFeFeAhR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuAhL(i2,i1)
coupR2 = cplcFuFuAhR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpAh 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCAh 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cplAhhhVZ(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MHm2(i2),MHm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVZ(i2,i1)
coup2 = cplAhHmcHm(i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVWpVZ(i2)
coup2 = cplAhcHmcVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVZ(i2)
coup2 = cplAhHmVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZAh 
 
Subroutine Pi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,           & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,        & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhetIhh(2),cplAhhhVZ(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdVZL(3,3),      & 
& cplcFdFdVZR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWCgWCetI,   & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ(3),cpletIcHmcVWp(3),              & 
& cpletIetIhh(2),cpletIhhVZ(2),cpletIHmcHm(3,3),cpletIHmVWp(3),cplhhVZVZ(2),             & 
& cplHmcHmVZ(3,3),cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MAh2,Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2,Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i1)
coup2 = cplAhetIhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MetI2,Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MetI2,Mhh2(i1)),dp) 
coup1 = cpletIhhVZ(i1)
coup2 = cpletIetIhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdetIL(i2,i1)
coupR2 = cplcFdFdetIR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeetIL(i2,i1)
coupR2 = cplcFeFeetIR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuetIL(i2,i1)
coupR2 = cplcFuFuetIR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpetI 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCetI 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cpletIhhVZ(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MHm2(i2),MHm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVZ(i2,i1)
coup2 = cpletIHmcHm(i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVWpVZ(i2)
coup2 = cpletIcHmcVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_B0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVZ(i2)
coup2 = cpletIHmVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZetI 
 
Subroutine DerPi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,          & 
& cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,           & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,        & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhetIhh(2),cplAhhhVZ(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdVZL(3,3),      & 
& cplcFdFdVZR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWCgWCetI,   & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ(3),cpletIcHmcVWp(3),              & 
& cpletIetIhh(2),cpletIhhVZ(2),cpletIHmcHm(3,3),cpletIHmVWp(3),cplhhVZVZ(2),             & 
& cplHmcHmVZ(3,3),cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MAh2,Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2,Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i1)
coup2 = cplAhetIhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MetI2,Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MetI2,Mhh2(i1)),dp) 
coup1 = cpletIhhVZ(i1)
coup2 = cpletIetIhh(i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdetIL(i2,i1)
coupR2 = cplcFdFdetIR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFeetIL(i2,i1)
coupR2 = cplcFeFeetIR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuetIL(i2,i1)
coupR2 = cplcFuFuetIR(i2,i1)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWpetI 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWCetI 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 2
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVZ2,Mhh2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVZ2,Mhh2(i2)),dp) 
coup1 = cplhhVZVZ(i2)
coup2 = cpletIhhVZ(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +0.5_dp* SumI  
    End Do 
 !------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MHm2(i2),MHm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVZ(i2,i1)
coup2 = cpletIHmcHm(i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVWpVZ(i2)
coup2 = cpletIcHmcVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,1 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVZ(i2)
coup2 = cpletIHmVWp(i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZetI 
 
Subroutine Pi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,             & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,             & 
& cplhhcHmcVWp,cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhhh(2,2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),   & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplcgWCgWChh(2),cplcgWCgWCVZ,cplcgWpgWphh(2),cplcgWpgWpVZ,            & 
& cplcHmcVWpVZ(3),cplcVWpVWpVZ,cpletIhhhh(2,2),cpletIhhVZ(2),cplhhcHmcVWp(2,3),          & 
& cplhhcVWpVWp(2),cplhhHmcHm(2,3,3),cplhhHmVWp(2,3),cplHmcHmVZ(3,3),cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MAh2,Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MAh2,Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i1)
coup2 = cplAhhhhh(gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MetI2,Mhh2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MetI2,Mhh2(i1)),dp) 
coup1 = cpletIhhVZ(i1)
coup2 = cpletIhhhh(gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MHm2(i2),MHm2(i1)),dp) 
B1m2 = Real(SA_B1(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVZ(i2,i1)
coup2 = cplhhHmcHm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVWpVZ(i2)
coup2 = cplhhcHmcVWp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MVWp2),dp)
B1m2 = Real(SA_B1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplhhcVWpVWp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_B0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_B1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVZ(i2)
coup2 = cplhhHmVWp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine Pi1LoopVZhh 
 
Subroutine DerPi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,             & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,             & 
& cplhhcHmcVWp,cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),Mhh(2),              & 
& Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhhhhh(2,2),cplAhhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),   & 
& cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),               & 
& cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),               & 
& cplcFuFuVZR(3,3),cplcgWCgWChh(2),cplcgWCgWCVZ,cplcgWpgWphh(2),cplcgWpgWpVZ,            & 
& cplcHmcVWpVZ(3),cplcVWpVWpVZ,cpletIhhhh(2,2),cpletIhhVZ(2),cplhhcHmcVWp(2,3),          & 
& cplhhcVWpVWp(2),cplhhHmcHm(2,3,3),cplhhHmVWp(2,3),cplHmcHmVZ(3,3),cplHmVWpVZ(3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(2) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
Real(dp) ::MVG,MVP,MVG2,MVP2
MVG = Mass_Regulator_PhotonGluon 
MVP = Mass_Regulator_PhotonGluon 
MVG2 = Mass_Regulator_PhotonGluon**2 
MVP2 = Mass_Regulator_PhotonGluon**2 

res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MAh2,Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MAh2,Mhh2(i1)),dp) 
coup1 = cplAhhhVZ(i1)
coup2 = cplAhhhhh(gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! hh, etI 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 2
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MetI2,Mhh2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MetI2,Mhh2(i1)),dp) 
coup1 = cpletIhhVZ(i1)
coup2 = cpletIhhhh(gO2,i1)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFd2(i1),MFd2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFd2(i1),MFd2(i2)),dp) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
coupL2 = cplcFdFdhhL(i2,i1,gO2)
coupR2 = cplcFdFdhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFd(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFd(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFe2(i1),MFe2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFe2(i1),MFe2(i2)),dp) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
coupL2 = cplcFeFehhL(i2,i1,gO2)
coupR2 = cplcFeFehhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFe(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFe(i2)*B1m2  
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MFu2(i1),MFu2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MFu2(i1),MFu2(i2)),dp) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
coupL2 = cplcFuFuhhL(i2,i1,gO2)
coupR2 = cplcFuFuhhR(i2,i1,gO2)
    SumI = (coupL1*coupL2+coupR1*coupR2)*MFu(i1)*(B0m2+B1m2) & 
  & + (coupL1*coupR2+coupR1*coupL2)*MFu(i2)*B1m2  
End do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWp], gWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWpgWpVZ
coup2 = cplcgWpgWphh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWpC], gWpC 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcgWCgWCVZ
coup2 = cplcgWCgWChh(gO2) 
   SumI = -0.5_dp*coup1*coup2*(B0m2+B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hm], Hm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MHm2(i2),MHm2(i1)),dp) 
B1m2 = Real(SA_DerB1(p2,MHm2(i2),MHm2(i1)),dp) 
coup1 = cplHmcHmVZ(i2,i1)
coup2 = cplhhHmcHm(gO2,i1,i2)
    SumI = -coup1*coup2*(B1m2+0.5_dp*B0m2)
End do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWp, Hm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplHmVWpVZ(i2)
coup2 = cplhhcHmcVWp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWp], VWp 
!------------------------ 
sumI = 0._dp 
 
Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MVWp2),dp)
B1m2 = Real(SA_DerB1(p2,MVWp2,MVWp2),dp) 
coup1 = cplcVWpVWpVZ
coup2 = cplhhcVWpVWp(gO2)
    SumI = coup1*coup2*(3._dp/2._dp*B0m2+3._dp*B1m2) 
End do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWp], conj[Hm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 Do gO2=1,2 
B0m2 = Real(SA_DerB0(p2,MVWp2,MHm2(i2)),dp) 
B1m2 = Real(SA_DerB1(p2,MVWp2,MHm2(i2)),dp) 
coup1 = cplcHmcVWpVZ(i2)
coup2 = cplhhHmVWp(gO2,i2)
    SumI = coup1*coup2*(B1m2-B0m2) 
End do 
res = res +1._dp* SumI  
    End Do 
 res = oo16pi2*res 
 
End Subroutine DerPi1LoopVZhh 
 
End Module LoopMasses_radinuZeeHB 
