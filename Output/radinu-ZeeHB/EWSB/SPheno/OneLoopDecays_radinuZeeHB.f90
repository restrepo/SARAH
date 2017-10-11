! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecays_radinuZeeHB 
Use Couplings_radinuZeeHB 
Use CouplingsCT_radinuZeeHB 
Use Model_Data_radinuZeeHB 
Use LoopCouplings_radinuZeeHB 
Use LoopMasses_radinuZeeHB 
Use RGEs_radinuZeeHB 
Use Tadpoles_radinuZeeHB 
Use Kinematics 
Use CouplingsForDecays_radinuZeeHB 
 
Use Wrapper_OneLoopDecay_Fu_radinuZeeHB 
Use Wrapper_OneLoopDecay_Fe_radinuZeeHB 
Use Wrapper_OneLoopDecay_Fd_radinuZeeHB 
Use Wrapper_OneLoopDecay_Fv_radinuZeeHB 
Use Wrapper_OneLoopDecay_hh_radinuZeeHB 
Use Wrapper_OneLoopDecay_Hm_radinuZeeHB 
Use Wrapper_OneLoopDecay_etI_radinuZeeHB 

 
Contains 
 
Subroutine getZCouplings(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,lam10,              & 
& ZP,lam2,lam9,lam8,lamh,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,              & 
& epsE,epsU,Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,       & 
& cplAhHmcHm,cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,       & 
& cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,cplAhAhetIhh,cplAhAhhhhh,           & 
& cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,cplAhetIHmcHm,cplAhhhhhhh,      & 
& cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,cpletIetIHmcHm,              & 
& cpletIhhhhhh,cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm,cplAhhhVZ,           & 
& cplAhHmVWp,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplhhHmVWp,               & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplhhcVWpVWp,cplhhVZVZ,cplHmVPVWp,cplHmVWpVZ,       & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHmVPVWp,cplAhHmVWpVZ,        & 
& cplAhcHmcVWpVP,cplAhcHmcVWpVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp,            & 
& cpletIHmVWpVZ,cpletIcHmcVWpVP,cpletIcHmcVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,              & 
& cplhhHmVPVWp,cplhhHmVWpVZ,cplhhcHmcVWpVP,cplhhcHmcVWpVZ,cplHmcHmVPVP,cplHmcHmVPVZ,     & 
& cplHmcHmcVWpVWp,cplHmcHmVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,      & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgWpgWpetI,       & 
& cplcgWCgWCetI,cplcgZgAhh,cplcgWCgAHm,cplcgWpgAcHm,cplcgWpgWphh,cplcgZgWpHm,            & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm,ZRUZH,ZRUZP,             & 
& ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,ZcplAhAhAh,ZcplAhAhetI,ZcplAhAhhh,           & 
& ZcplAhetIetI,ZcplAhetIhh,ZcplAhhhhh,ZcplAhHmcHm,ZcpletIetIetI,ZcpletIetIhh,            & 
& ZcpletIhhhh,ZcpletIHmcHm,Zcplhhhhhh,ZcplhhHmcHm,ZcplAhAhAhAh,ZcplAhAhAhetI,            & 
& ZcplAhAhAhhh,ZcplAhAhetIetI,ZcplAhAhetIhh,ZcplAhAhhhhh,ZcplAhAhHmcHm,ZcplAhetIetIetI,  & 
& ZcplAhetIetIhh,ZcplAhetIhhhh,ZcplAhetIHmcHm,ZcplAhhhhhhh,ZcplAhhhHmcHm,ZcpletIetIetIetI,& 
& ZcpletIetIetIhh,ZcpletIetIhhhh,ZcpletIetIHmcHm,ZcpletIhhhhhh,ZcpletIhhHmcHm,           & 
& Zcplhhhhhhhh,ZcplhhhhHmcHm,ZcplHmHmcHmcHm,ZcplAhhhVZ,ZcplAhHmVWp,ZcplAhcHmcVWp,        & 
& ZcpletIhhVZ,ZcpletIHmVWp,ZcpletIcHmcVWp,ZcplhhHmVWp,ZcplhhcHmcVWp,ZcplHmcHmVP,         & 
& ZcplHmcHmVZ,ZcplhhcVWpVWp,ZcplhhVZVZ,ZcplHmVPVWp,ZcplHmVWpVZ,ZcplcHmcVWpVP,            & 
& ZcplcHmcVWpVZ,ZcplAhAhcVWpVWp,ZcplAhAhVZVZ,ZcplAhHmVPVWp,ZcplAhHmVWpVZ,ZcplAhcHmcVWpVP,& 
& ZcplAhcHmcVWpVZ,ZcpletIetIcVWpVWp,ZcpletIetIVZVZ,ZcpletIHmVPVWp,ZcpletIHmVWpVZ,        & 
& ZcpletIcHmcVWpVP,ZcpletIcHmcVWpVZ,ZcplhhhhcVWpVWp,ZcplhhhhVZVZ,ZcplhhHmVPVWp,          & 
& ZcplhhHmVWpVZ,ZcplhhcHmcVWpVP,ZcplhhcHmcVWpVZ,ZcplHmcHmVPVP,ZcplHmcHmVPVZ,             & 
& ZcplHmcHmcVWpVWp,ZcplHmcHmVZVZ,ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcFdFdAhL,    & 
& ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFdFdetIL,        & 
& ZcplcFdFdetIR,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplFvFeHmL,ZcplFvFeHmR,ZcplcFeFehhL,           & 
& ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFdFucHmL,ZcplcFdFucHmR,ZcplcFeFvcHmL,      & 
& ZcplcFeFvcHmR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,        & 
& ZcplcFdFdVZR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,ZcplFvFecVWpL,ZcplFvFecVWpR,ZcplcFeFeVPL,   & 
& ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,         & 
& ZcplcFuFuVPR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplFvFvVZL,        & 
& ZcplFvFvVZR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,     & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,          & 
& ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,          & 
& ZcplcgWCgAcVWp,ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,  & 
& ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgWpgWpetI,ZcplcgWCgWCetI,ZcplcgZgAhh,ZcplcgWCgAHm,    & 
& ZcplcgWpgAcHm,ZcplcgWpgWphh,ZcplcgZgWpHm,ZcplcgWCgWChh,ZcplcgZgWCcHm,ZcplcgZgZhh,      & 
& ZcplcgWCgZHm,ZcplcgWpgZcHm)

Implicit None

Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),ZP(3,3),g1,g2,TW,g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,mu,lam10,lam2,lam9,lam8,lamh,Yd(3,3),ZDL(3,3),               & 
& ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),      & 
& epsU(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh(2),            & 
& cplAhAhetIetI,cplAhAhetIhh(2),cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhetIetIetI,       & 
& cplAhetIetIhh(2),cplAhetIhhhh(2,2),cplAhetIHmcHm(3,3),cplAhhhhhhh(2,2,2),              & 
& cplAhhhHmcHm(2,3,3),cpletIetIetIetI,cpletIetIetIhh(2),cpletIetIhhhh(2,2),              & 
& cpletIetIHmcHm(3,3),cpletIhhhhhh(2,2,2),cpletIhhHmcHm(2,3,3),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3),cplAhhhVZ(2),cplAhHmVWp(3),               & 
& cplAhcHmcVWp(3),cpletIhhVZ(2),cpletIHmVWp(3),cpletIcHmcVWp(3),cplhhHmVWp(2,3),         & 
& cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),        & 
& cplHmVPVWp(3),cplHmVWpVZ(3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhcVWpVWp,            & 
& cplAhAhVZVZ,cplAhHmVPVWp(3),cplAhHmVWpVZ(3),cplAhcHmcVWpVP(3),cplAhcHmcVWpVZ(3),       & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp(3),cpletIHmVWpVZ(3),cpletIcHmcVWpVP(3),   & 
& cpletIcHmcVWpVZ(3),cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhHmVPVWp(2,3),             & 
& cplhhHmVWpVZ(2,3),cplhhcHmcVWpVP(2,3),cplhhcHmcVWpVZ(2,3),cplHmcHmVPVP(3,3),           & 
& cplHmcHmVPVZ(3,3),cplHmcHmcVWpVWp(3,3),cplHmcHmVZVZ(3,3),cplVGVGVG,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),      & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),& 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),              & 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),            & 
& cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),            & 
& cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),        & 
& cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3), & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplVGVGVGVG1,cplVGVGVGVG2,         & 
& cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,          & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,               & 
& cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,      & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,        & 
& cplcgWCgWCAh,cplcgWpgWpetI,cplcgWCgWCetI,cplcgZgAhh(2),cplcgWCgAHm(3),cplcgWpgAcHm(3), & 
& cplcgWpgWphh(2),cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgZgWCcHm(3),cplcgZgZhh(2),          & 
& cplcgWCgZHm(3),cplcgWpgZcHm(3)

Complex(dp), Intent(in) :: ZRUZH(2,2),ZRUZP(3,3),ZRUVv(3,3),ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),         & 
& ZRUVe(3,3),ZRUUe(3,3)

Integer :: gt1, gt2
Complex(dp) :: TempcplAhAhAh,TempcplAhAhetI,TempcplAhAhhh(2),TempcplAhetIetI,TempcplAhetIhh(2),      & 
& TempcplAhhhhh(2,2),TempcplAhHmcHm(3,3),TempcpletIetIetI,TempcpletIetIhh(2),            & 
& TempcpletIhhhh(2,2),TempcpletIHmcHm(3,3),Tempcplhhhhhh(2,2,2),TempcplhhHmcHm(2,3,3),   & 
& TempcplAhAhAhAh,TempcplAhAhAhetI,TempcplAhAhAhhh(2),TempcplAhAhetIetI,TempcplAhAhetIhh(2),& 
& TempcplAhAhhhhh(2,2),TempcplAhAhHmcHm(3,3),TempcplAhetIetIetI,TempcplAhetIetIhh(2),    & 
& TempcplAhetIhhhh(2,2),TempcplAhetIHmcHm(3,3),TempcplAhhhhhhh(2,2,2),TempcplAhhhHmcHm(2,3,3),& 
& TempcpletIetIetIetI,TempcpletIetIetIhh(2),TempcpletIetIhhhh(2,2),TempcpletIetIHmcHm(3,3),& 
& TempcpletIhhhhhh(2,2,2),TempcpletIhhHmcHm(2,3,3),Tempcplhhhhhhhh(2,2,2,2),             & 
& TempcplhhhhHmcHm(2,2,3,3),TempcplHmHmcHmcHm(3,3,3,3),TempcplAhhhVZ(2),TempcplAhHmVWp(3),& 
& TempcplAhcHmcVWp(3),TempcpletIhhVZ(2),TempcpletIHmVWp(3),TempcpletIcHmcVWp(3),         & 
& TempcplhhHmVWp(2,3),TempcplhhcHmcVWp(2,3),TempcplHmcHmVP(3,3),TempcplHmcHmVZ(3,3),     & 
& TempcplhhcVWpVWp(2),TempcplhhVZVZ(2),TempcplHmVPVWp(3),TempcplHmVWpVZ(3),              & 
& TempcplcHmcVWpVP(3),TempcplcHmcVWpVZ(3),TempcplAhAhcVWpVWp,TempcplAhAhVZVZ,            & 
& TempcplAhHmVPVWp(3),TempcplAhHmVWpVZ(3),TempcplAhcHmcVWpVP(3),TempcplAhcHmcVWpVZ(3),   & 
& TempcpletIetIcVWpVWp,TempcpletIetIVZVZ,TempcpletIHmVPVWp(3),TempcpletIHmVWpVZ(3),      & 
& TempcpletIcHmcVWpVP(3),TempcpletIcHmcVWpVZ(3),TempcplhhhhcVWpVWp(2,2),TempcplhhhhVZVZ(2,2),& 
& TempcplhhHmVPVWp(2,3),TempcplhhHmVWpVZ(2,3),TempcplhhcHmcVWpVP(2,3),TempcplhhcHmcVWpVZ(2,3),& 
& TempcplHmcHmVPVP(3,3),TempcplHmcHmVPVZ(3,3),TempcplHmcHmcVWpVWp(3,3),TempcplHmcHmVZVZ(3,3),& 
& TempcplVGVGVG,TempcplcVWpVPVWp,TempcplcVWpVWpVZ,TempcplcFdFdAhL(3,3),TempcplcFdFdAhR(3,3),& 
& TempcplcFeFeAhL(3,3),TempcplcFeFeAhR(3,3),TempcplcFuFuAhL(3,3),TempcplcFuFuAhR(3,3),   & 
& TempcplcFdFdetIL(3,3),TempcplcFdFdetIR(3,3),TempcplcFeFeetIL(3,3),TempcplcFeFeetIR(3,3),& 
& TempcplcFuFuetIL(3,3),TempcplcFuFuetIR(3,3),TempcplcFdFdhhL(3,3,2),TempcplcFdFdhhR(3,3,2),& 
& TempcplcFuFdHmL(3,3,3),TempcplcFuFdHmR(3,3,3),TempcplFvFeHmL(3,3,3),TempcplFvFeHmR(3,3,3),& 
& TempcplcFeFehhL(3,3,2),TempcplcFeFehhR(3,3,2),TempcplcFuFuhhL(3,3,2),TempcplcFuFuhhR(3,3,2),& 
& TempcplcFdFucHmL(3,3,3),TempcplcFdFucHmR(3,3,3),TempcplcFeFvcHmL(3,3,3),               & 
& TempcplcFeFvcHmR(3,3,3),TempcplcFdFdVGL(3,3),TempcplcFdFdVGR(3,3),TempcplcFdFdVPL(3,3),& 
& TempcplcFdFdVPR(3,3),TempcplcFdFdVZL(3,3),TempcplcFdFdVZR(3,3),TempcplcFuFdcVWpL(3,3), & 
& TempcplcFuFdcVWpR(3,3),TempcplFvFecVWpL(3,3),TempcplFvFecVWpR(3,3),TempcplcFeFeVPL(3,3),& 
& TempcplcFeFeVPR(3,3),TempcplcFeFeVZL(3,3),TempcplcFeFeVZR(3,3),TempcplcFuFuVGL(3,3),   & 
& TempcplcFuFuVGR(3,3),TempcplcFuFuVPL(3,3),TempcplcFuFuVPR(3,3),TempcplcFdFuVWpL(3,3),  & 
& TempcplcFdFuVWpR(3,3),TempcplcFuFuVZL(3,3),TempcplcFuFuVZR(3,3),TempcplFvFvVZL(3,3),   & 
& TempcplFvFvVZR(3,3),TempcplcFeFvVWpL(3,3),TempcplcFeFvVWpR(3,3),TempcplVGVGVGVG1,      & 
& TempcplVGVGVGVG2,TempcplVGVGVGVG3,TempcplcVWpVPVPVWp1,TempcplcVWpVPVPVWp2,             & 
& TempcplcVWpVPVPVWp3,TempcplcVWpVPVWpVZ1,TempcplcVWpVPVWpVZ2,TempcplcVWpVPVWpVZ3,       & 
& TempcplcVWpcVWpVWpVWp1,TempcplcVWpcVWpVWpVWp2,TempcplcVWpcVWpVWpVWp3,TempcplcVWpVWpVZVZ1,& 
& TempcplcVWpVWpVZVZ2,TempcplcVWpVWpVZVZ3,TempcplcgGgGVG,TempcplcgWpgAVWp,               & 
& TempcplcgWCgAcVWp,TempcplcgWpgWpVP,TempcplcgWpgWpVZ,TempcplcgAgWpcVWp,TempcplcgZgWpcVWp

Complex(dp) :: TempcplcgWCgWCVP,TempcplcgAgWCVWp,TempcplcgZgWCVWp,TempcplcgWCgWCVZ,TempcplcgWpgZVWp,  & 
& TempcplcgWCgZcVWp,TempcplcgWpgWpAh,TempcplcgWCgWCAh,TempcplcgWpgWpetI,TempcplcgWCgWCetI,& 
& TempcplcgZgAhh(2),TempcplcgWCgAHm(3),TempcplcgWpgAcHm(3),TempcplcgWpgWphh(2),          & 
& TempcplcgZgWpHm(3),TempcplcgWCgWChh(2),TempcplcgZgWCcHm(3),TempcplcgZgZhh(2),          & 
& TempcplcgWCgZHm(3),TempcplcgWpgZcHm(3)

Complex(dp), Intent(out) :: ZcplAhAhAh,ZcplAhAhetI,ZcplAhAhhh(2),ZcplAhetIetI,ZcplAhetIhh(2),ZcplAhhhhh(2,2),     & 
& ZcplAhHmcHm(3,3),ZcpletIetIetI,ZcpletIetIhh(2),ZcpletIhhhh(2,2),ZcpletIHmcHm(3,3),     & 
& Zcplhhhhhh(2,2,2),ZcplhhHmcHm(2,3,3),ZcplAhAhAhAh,ZcplAhAhAhetI,ZcplAhAhAhhh(2),       & 
& ZcplAhAhetIetI,ZcplAhAhetIhh(2),ZcplAhAhhhhh(2,2),ZcplAhAhHmcHm(3,3),ZcplAhetIetIetI,  & 
& ZcplAhetIetIhh(2),ZcplAhetIhhhh(2,2),ZcplAhetIHmcHm(3,3),ZcplAhhhhhhh(2,2,2),          & 
& ZcplAhhhHmcHm(2,3,3),ZcpletIetIetIetI,ZcpletIetIetIhh(2),ZcpletIetIhhhh(2,2),          & 
& ZcpletIetIHmcHm(3,3),ZcpletIhhhhhh(2,2,2),ZcpletIhhHmcHm(2,3,3),Zcplhhhhhhhh(2,2,2,2), & 
& ZcplhhhhHmcHm(2,2,3,3),ZcplHmHmcHmcHm(3,3,3,3),ZcplAhhhVZ(2),ZcplAhHmVWp(3),           & 
& ZcplAhcHmcVWp(3),ZcpletIhhVZ(2),ZcpletIHmVWp(3),ZcpletIcHmcVWp(3),ZcplhhHmVWp(2,3),    & 
& ZcplhhcHmcVWp(2,3),ZcplHmcHmVP(3,3),ZcplHmcHmVZ(3,3),ZcplhhcVWpVWp(2),ZcplhhVZVZ(2),   & 
& ZcplHmVPVWp(3),ZcplHmVWpVZ(3),ZcplcHmcVWpVP(3),ZcplcHmcVWpVZ(3),ZcplAhAhcVWpVWp,       & 
& ZcplAhAhVZVZ,ZcplAhHmVPVWp(3),ZcplAhHmVWpVZ(3),ZcplAhcHmcVWpVP(3),ZcplAhcHmcVWpVZ(3),  & 
& ZcpletIetIcVWpVWp,ZcpletIetIVZVZ,ZcpletIHmVPVWp(3),ZcpletIHmVWpVZ(3),ZcpletIcHmcVWpVP(3),& 
& ZcpletIcHmcVWpVZ(3),ZcplhhhhcVWpVWp(2,2),ZcplhhhhVZVZ(2,2),ZcplhhHmVPVWp(2,3),         & 
& ZcplhhHmVWpVZ(2,3),ZcplhhcHmcVWpVP(2,3),ZcplhhcHmcVWpVZ(2,3),ZcplHmcHmVPVP(3,3),       & 
& ZcplHmcHmVPVZ(3,3),ZcplHmcHmcVWpVWp(3,3),ZcplHmcHmVZVZ(3,3),ZcplVGVGVG,ZcplcVWpVPVWp,  & 
& ZcplcVWpVWpVZ,ZcplcFdFdAhL(3,3),ZcplcFdFdAhR(3,3),ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3), & 
& ZcplcFuFuAhL(3,3),ZcplcFuFuAhR(3,3),ZcplcFdFdetIL(3,3),ZcplcFdFdetIR(3,3),             & 
& ZcplcFeFeetIL(3,3),ZcplcFeFeetIR(3,3),ZcplcFuFuetIL(3,3),ZcplcFuFuetIR(3,3),           & 
& ZcplcFdFdhhL(3,3,2),ZcplcFdFdhhR(3,3,2),ZcplcFuFdHmL(3,3,3),ZcplcFuFdHmR(3,3,3),       & 
& ZcplFvFeHmL(3,3,3),ZcplFvFeHmR(3,3,3),ZcplcFeFehhL(3,3,2),ZcplcFeFehhR(3,3,2),         & 
& ZcplcFuFuhhL(3,3,2),ZcplcFuFuhhR(3,3,2),ZcplcFdFucHmL(3,3,3),ZcplcFdFucHmR(3,3,3),     & 
& ZcplcFeFvcHmL(3,3,3),ZcplcFeFvcHmR(3,3,3),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFuFdcVWpL(3,3),ZcplcFuFdcVWpR(3,3),ZcplFvFecVWpL(3,3),ZcplFvFecVWpR(3,3),         & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),               & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),               & 
& ZcplcFdFuVWpL(3,3),ZcplcFdFuVWpR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),             & 
& ZcplFvFvVZL(3,3),ZcplFvFvVZR(3,3),ZcplcFeFvVWpL(3,3),ZcplcFeFvVWpR(3,3),               & 
& ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,           & 
& ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,& 
& ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,             & 
& ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,ZcplcgWCgAcVWp,ZcplcgWpgWpVP,               & 
& ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,               & 
& ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,ZcplcgWpgWpAh,ZcplcgWCgWCAh,  & 
& ZcplcgWpgWpetI,ZcplcgWCgWCetI,ZcplcgZgAhh(2),ZcplcgWCgAHm(3),ZcplcgWpgAcHm(3),         & 
& ZcplcgWpgWphh(2),ZcplcgZgWpHm(3),ZcplcgWCgWChh(2),ZcplcgZgWCcHm(3),ZcplcgZgZhh(2)

Complex(dp), Intent(out) :: ZcplcgWCgZHm(3),ZcplcgWpgZcHm(3)

Complex(dp) :: ZRUZHc(2, 2) 
Complex(dp) :: ZRUZPc(3, 3) 
Complex(dp) :: ZRUVvc(3, 3) 
Complex(dp) :: ZRUVdc(3, 3) 
Complex(dp) :: ZRUUdc(3, 3) 
Complex(dp) :: ZRUVuc(3, 3) 
Complex(dp) :: ZRUUuc(3, 3) 
Complex(dp) :: ZRUVec(3, 3) 
Complex(dp) :: ZRUUec(3, 3) 
ZRUZHc = Conjg(ZRUZH)
ZRUZPc = Conjg(ZRUZP)
ZRUVvc = Conjg(ZRUVv)
ZRUVdc = Conjg(ZRUVd)
ZRUUdc = Conjg(ZRUUd)
ZRUVuc = Conjg(ZRUVu)
ZRUUuc = Conjg(ZRUUu)
ZRUVec = Conjg(ZRUVe)
ZRUUec = Conjg(ZRUUe)


 ! ## ZcplAhAhAh ## 
ZcplAhAhAh = 0._dp 
TempcplAhAhAh = cplAhAhAh 
ZcplAhAhAh = TempcplAhAhAh 


 ! ## ZcplAhAhetI ## 
ZcplAhAhetI = 0._dp 
TempcplAhAhetI = cplAhAhetI 
ZcplAhAhetI = TempcplAhAhetI 


 ! ## ZcplAhAhhh ## 
ZcplAhAhhh = 0._dp 
TempcplAhAhhh = cplAhAhhh 
ZcplAhAhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhAhhh(gt2) = ZcplAhAhhh(gt2) + ZRUZH(gt2,gt1)*TempcplAhAhhh(gt1) 
 End Do 
End Do 


 ! ## ZcplAhetIetI ## 
ZcplAhetIetI = 0._dp 
TempcplAhetIetI = cplAhetIetI 
ZcplAhetIetI = TempcplAhetIetI 


 ! ## ZcplAhetIhh ## 
ZcplAhetIhh = 0._dp 
TempcplAhetIhh = cplAhetIhh 
ZcplAhetIhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhetIhh(gt2) = ZcplAhetIhh(gt2) + ZRUZH(gt2,gt1)*TempcplAhetIhh(gt1) 
 End Do 
End Do 


 ! ## ZcplAhhhhh ## 
ZcplAhhhhh = 0._dp 
TempcplAhhhhh = cplAhhhhh 
ZcplAhhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhhh(gt2,:) = ZcplAhhhhh(gt2,:) + ZRUZH(gt2,gt1)*TempcplAhhhhh(gt1,:) 
 End Do 
End Do 
TempcplAhhhhh = ZcplAhhhhh 
ZcplAhhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhhh(:,gt2) = ZcplAhhhhh(:,gt2) + ZRUZH(gt2,gt1)*TempcplAhhhhh(:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhHmcHm ## 
ZcplAhHmcHm = 0._dp 
TempcplAhHmcHm = cplAhHmcHm 
ZcplAhHmcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhHmcHm(gt2,:) = ZcplAhHmcHm(gt2,:) + ZRUZP(gt2,gt1)*TempcplAhHmcHm(gt1,:) 
 End Do 
End Do 
TempcplAhHmcHm = ZcplAhHmcHm 
ZcplAhHmcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhHmcHm(:,gt2) = ZcplAhHmcHm(:,gt2) + ZRUZP(gt2,gt1)*TempcplAhHmcHm(:,gt1) 
 End Do 
End Do 


 ! ## ZcpletIetIetI ## 
ZcpletIetIetI = 0._dp 
TempcpletIetIetI = cpletIetIetI 
ZcpletIetIetI = TempcpletIetIetI 


 ! ## ZcpletIetIhh ## 
ZcpletIetIhh = 0._dp 
TempcpletIetIhh = cpletIetIhh 
ZcpletIetIhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcpletIetIhh(gt2) = ZcpletIetIhh(gt2) + ZRUZH(gt2,gt1)*TempcpletIetIhh(gt1) 
 End Do 
End Do 


 ! ## ZcpletIhhhh ## 
ZcpletIhhhh = 0._dp 
TempcpletIhhhh = cpletIhhhh 
ZcpletIhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcpletIhhhh(gt2,:) = ZcpletIhhhh(gt2,:) + ZRUZH(gt2,gt1)*TempcpletIhhhh(gt1,:) 
 End Do 
End Do 
TempcpletIhhhh = ZcpletIhhhh 
ZcpletIhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcpletIhhhh(:,gt2) = ZcpletIhhhh(:,gt2) + ZRUZH(gt2,gt1)*TempcpletIhhhh(:,gt1) 
 End Do 
End Do 


 ! ## ZcpletIHmcHm ## 
ZcpletIHmcHm = 0._dp 
TempcpletIHmcHm = cpletIHmcHm 
ZcpletIHmcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcpletIHmcHm(gt2,:) = ZcpletIHmcHm(gt2,:) + ZRUZP(gt2,gt1)*TempcpletIHmcHm(gt1,:) 
 End Do 
End Do 
TempcpletIHmcHm = ZcpletIHmcHm 
ZcpletIHmcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcpletIHmcHm(:,gt2) = ZcpletIHmcHm(:,gt2) + ZRUZP(gt2,gt1)*TempcpletIHmcHm(:,gt1) 
 End Do 
End Do 


 ! ## Zcplhhhhhh ## 
Zcplhhhhhh = 0._dp 
Tempcplhhhhhh = cplhhhhhh 
Do gt1=1,2
  Do gt2=1,2
Zcplhhhhhh(gt2,:,:) = Zcplhhhhhh(gt2,:,:) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(gt1,:,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
Zcplhhhhhh(:,gt2,:) = Zcplhhhhhh(:,gt2,:) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(:,gt1,:) 
 End Do 
End Do 
Tempcplhhhhhh = Zcplhhhhhh 
Zcplhhhhhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
Zcplhhhhhh(:,:,gt2) = Zcplhhhhhh(:,:,gt2) + ZRUZH(gt2,gt1)*Tempcplhhhhhh(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplhhHmcHm ## 
ZcplhhHmcHm = 0._dp 
TempcplhhHmcHm = cplhhHmcHm 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHmcHm(gt2,:,:) = ZcplhhHmcHm(gt2,:,:) + ZRUZH(gt2,gt1)*TempcplhhHmcHm(gt1,:,:) 
 End Do 
End Do 
TempcplhhHmcHm = ZcplhhHmcHm 
ZcplhhHmcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplhhHmcHm(:,gt2,:) = ZcplhhHmcHm(:,gt2,:) + ZRUZP(gt2,gt1)*TempcplhhHmcHm(:,gt1,:) 
 End Do 
End Do 
TempcplhhHmcHm = ZcplhhHmcHm 
ZcplhhHmcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplhhHmcHm(:,:,gt2) = ZcplhhHmcHm(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplhhHmcHm(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplAhAhAhAh ## 
ZcplAhAhAhAh = 0._dp 


 ! ## ZcplAhAhAhetI ## 
ZcplAhAhAhetI = 0._dp 


 ! ## ZcplAhAhAhhh ## 
ZcplAhAhAhhh = 0._dp 


 ! ## ZcplAhAhetIetI ## 
ZcplAhAhetIetI = 0._dp 


 ! ## ZcplAhAhetIhh ## 
ZcplAhAhetIhh = 0._dp 


 ! ## ZcplAhAhhhhh ## 
ZcplAhAhhhhh = 0._dp 


 ! ## ZcplAhAhHmcHm ## 
ZcplAhAhHmcHm = 0._dp 


 ! ## ZcplAhetIetIetI ## 
ZcplAhetIetIetI = 0._dp 


 ! ## ZcplAhetIetIhh ## 
ZcplAhetIetIhh = 0._dp 


 ! ## ZcplAhetIhhhh ## 
ZcplAhetIhhhh = 0._dp 


 ! ## ZcplAhetIHmcHm ## 
ZcplAhetIHmcHm = 0._dp 


 ! ## ZcplAhhhhhhh ## 
ZcplAhhhhhhh = 0._dp 


 ! ## ZcplAhhhHmcHm ## 
ZcplAhhhHmcHm = 0._dp 


 ! ## ZcpletIetIetIetI ## 
ZcpletIetIetIetI = 0._dp 


 ! ## ZcpletIetIetIhh ## 
ZcpletIetIetIhh = 0._dp 


 ! ## ZcpletIetIhhhh ## 
ZcpletIetIhhhh = 0._dp 


 ! ## ZcpletIetIHmcHm ## 
ZcpletIetIHmcHm = 0._dp 


 ! ## ZcpletIhhhhhh ## 
ZcpletIhhhhhh = 0._dp 


 ! ## ZcpletIhhHmcHm ## 
ZcpletIhhHmcHm = 0._dp 


 ! ## Zcplhhhhhhhh ## 
Zcplhhhhhhhh = 0._dp 


 ! ## ZcplhhhhHmcHm ## 
ZcplhhhhHmcHm = 0._dp 


 ! ## ZcplHmHmcHmcHm ## 
ZcplHmHmcHmcHm = 0._dp 


 ! ## ZcplAhhhVZ ## 
ZcplAhhhVZ = 0._dp 
TempcplAhhhVZ = cplAhhhVZ 
ZcplAhhhVZ = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplAhhhVZ(gt2) = ZcplAhhhVZ(gt2) + ZRUZH(gt2,gt1)*TempcplAhhhVZ(gt1) 
 End Do 
End Do 
TempcplAhhhVZ = ZcplAhhhVZ 


 ! ## ZcplAhHmVWp ## 
ZcplAhHmVWp = 0._dp 
TempcplAhHmVWp = cplAhHmVWp 
ZcplAhHmVWp = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhHmVWp(gt2) = ZcplAhHmVWp(gt2) + ZRUZP(gt2,gt1)*TempcplAhHmVWp(gt1) 
 End Do 
End Do 
TempcplAhHmVWp = ZcplAhHmVWp 


 ! ## ZcplAhcHmcVWp ## 
ZcplAhcHmcVWp = 0._dp 
TempcplAhcHmcVWp = cplAhcHmcVWp 
ZcplAhcHmcVWp = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplAhcHmcVWp(gt2) = ZcplAhcHmcVWp(gt2) + ZRUZP(gt2,gt1)*TempcplAhcHmcVWp(gt1) 
 End Do 
End Do 
TempcplAhcHmcVWp = ZcplAhcHmcVWp 


 ! ## ZcpletIhhVZ ## 
ZcpletIhhVZ = 0._dp 
TempcpletIhhVZ = cpletIhhVZ 
ZcpletIhhVZ = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcpletIhhVZ(gt2) = ZcpletIhhVZ(gt2) + ZRUZH(gt2,gt1)*TempcpletIhhVZ(gt1) 
 End Do 
End Do 
TempcpletIhhVZ = ZcpletIhhVZ 


 ! ## ZcpletIHmVWp ## 
ZcpletIHmVWp = 0._dp 
TempcpletIHmVWp = cpletIHmVWp 
ZcpletIHmVWp = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcpletIHmVWp(gt2) = ZcpletIHmVWp(gt2) + ZRUZP(gt2,gt1)*TempcpletIHmVWp(gt1) 
 End Do 
End Do 
TempcpletIHmVWp = ZcpletIHmVWp 


 ! ## ZcpletIcHmcVWp ## 
ZcpletIcHmcVWp = 0._dp 
TempcpletIcHmcVWp = cpletIcHmcVWp 
ZcpletIcHmcVWp = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcpletIcHmcVWp(gt2) = ZcpletIcHmcVWp(gt2) + ZRUZP(gt2,gt1)*TempcpletIcHmcVWp(gt1) 
 End Do 
End Do 
TempcpletIcHmcVWp = ZcpletIcHmcVWp 


 ! ## ZcplhhHmVWp ## 
ZcplhhHmVWp = 0._dp 
TempcplhhHmVWp = cplhhHmVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhHmVWp(gt2,:) = ZcplhhHmVWp(gt2,:) + ZRUZH(gt2,gt1)*TempcplhhHmVWp(gt1,:) 
 End Do 
End Do 
TempcplhhHmVWp = ZcplhhHmVWp 
ZcplhhHmVWp = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplhhHmVWp(:,gt2) = ZcplhhHmVWp(:,gt2) + ZRUZP(gt2,gt1)*TempcplhhHmVWp(:,gt1) 
 End Do 
End Do 
TempcplhhHmVWp = ZcplhhHmVWp 


 ! ## ZcplhhcHmcVWp ## 
ZcplhhcHmcVWp = 0._dp 
TempcplhhcHmcVWp = cplhhcHmcVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhcHmcVWp(gt2,:) = ZcplhhcHmcVWp(gt2,:) + ZRUZH(gt2,gt1)*TempcplhhcHmcVWp(gt1,:) 
 End Do 
End Do 
TempcplhhcHmcVWp = ZcplhhcHmcVWp 
ZcplhhcHmcVWp = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplhhcHmcVWp(:,gt2) = ZcplhhcHmcVWp(:,gt2) + ZRUZP(gt2,gt1)*TempcplhhcHmcVWp(:,gt1) 
 End Do 
End Do 
TempcplhhcHmcVWp = ZcplhhcHmcVWp 


 ! ## ZcplHmcHmVP ## 
ZcplHmcHmVP = 0._dp 
TempcplHmcHmVP = cplHmcHmVP 
Do gt1=1,3
  Do gt2=1,3
ZcplHmcHmVP(gt2,:) = ZcplHmcHmVP(gt2,:) + ZRUZP(gt2,gt1)*TempcplHmcHmVP(gt1,:) 
 End Do 
End Do 
TempcplHmcHmVP = ZcplHmcHmVP 
ZcplHmcHmVP = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplHmcHmVP(:,gt2) = ZcplHmcHmVP(:,gt2) + ZRUZP(gt2,gt1)*TempcplHmcHmVP(:,gt1) 
 End Do 
End Do 
TempcplHmcHmVP = ZcplHmcHmVP 


 ! ## ZcplHmcHmVZ ## 
ZcplHmcHmVZ = 0._dp 
TempcplHmcHmVZ = cplHmcHmVZ 
Do gt1=1,3
  Do gt2=1,3
ZcplHmcHmVZ(gt2,:) = ZcplHmcHmVZ(gt2,:) + ZRUZP(gt2,gt1)*TempcplHmcHmVZ(gt1,:) 
 End Do 
End Do 
TempcplHmcHmVZ = ZcplHmcHmVZ 
ZcplHmcHmVZ = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplHmcHmVZ(:,gt2) = ZcplHmcHmVZ(:,gt2) + ZRUZP(gt2,gt1)*TempcplHmcHmVZ(:,gt1) 
 End Do 
End Do 
TempcplHmcHmVZ = ZcplHmcHmVZ 


 ! ## ZcplhhcVWpVWp ## 
ZcplhhcVWpVWp = 0._dp 
TempcplhhcVWpVWp = cplhhcVWpVWp 
Do gt1=1,2
  Do gt2=1,2
ZcplhhcVWpVWp(gt2) = ZcplhhcVWpVWp(gt2) + ZRUZH(gt2,gt1)*TempcplhhcVWpVWp(gt1) 
 End Do 
End Do 
TempcplhhcVWpVWp = ZcplhhcVWpVWp 


 ! ## ZcplhhVZVZ ## 
ZcplhhVZVZ = 0._dp 
TempcplhhVZVZ = cplhhVZVZ 
Do gt1=1,2
  Do gt2=1,2
ZcplhhVZVZ(gt2) = ZcplhhVZVZ(gt2) + ZRUZH(gt2,gt1)*TempcplhhVZVZ(gt1) 
 End Do 
End Do 
TempcplhhVZVZ = ZcplhhVZVZ 


 ! ## ZcplHmVPVWp ## 
ZcplHmVPVWp = 0._dp 
TempcplHmVPVWp = cplHmVPVWp 
Do gt1=1,3
  Do gt2=1,3
ZcplHmVPVWp(gt2) = ZcplHmVPVWp(gt2) + ZRUZP(gt2,gt1)*TempcplHmVPVWp(gt1) 
 End Do 
End Do 
TempcplHmVPVWp = ZcplHmVPVWp 


 ! ## ZcplHmVWpVZ ## 
ZcplHmVWpVZ = 0._dp 
TempcplHmVWpVZ = cplHmVWpVZ 
Do gt1=1,3
  Do gt2=1,3
ZcplHmVWpVZ(gt2) = ZcplHmVWpVZ(gt2) + ZRUZP(gt2,gt1)*TempcplHmVWpVZ(gt1) 
 End Do 
End Do 
TempcplHmVWpVZ = ZcplHmVWpVZ 


 ! ## ZcplcHmcVWpVP ## 
ZcplcHmcVWpVP = 0._dp 
TempcplcHmcVWpVP = cplcHmcVWpVP 
Do gt1=1,3
  Do gt2=1,3
ZcplcHmcVWpVP(gt2) = ZcplcHmcVWpVP(gt2) + ZRUZP(gt2,gt1)*TempcplcHmcVWpVP(gt1) 
 End Do 
End Do 
TempcplcHmcVWpVP = ZcplcHmcVWpVP 


 ! ## ZcplcHmcVWpVZ ## 
ZcplcHmcVWpVZ = 0._dp 
TempcplcHmcVWpVZ = cplcHmcVWpVZ 
Do gt1=1,3
  Do gt2=1,3
ZcplcHmcVWpVZ(gt2) = ZcplcHmcVWpVZ(gt2) + ZRUZP(gt2,gt1)*TempcplcHmcVWpVZ(gt1) 
 End Do 
End Do 
TempcplcHmcVWpVZ = ZcplcHmcVWpVZ 


 ! ## ZcplAhAhcVWpVWp ## 
ZcplAhAhcVWpVWp = 0._dp 


 ! ## ZcplAhAhVZVZ ## 
ZcplAhAhVZVZ = 0._dp 


 ! ## ZcplAhHmVPVWp ## 
ZcplAhHmVPVWp = 0._dp 


 ! ## ZcplAhHmVWpVZ ## 
ZcplAhHmVWpVZ = 0._dp 


 ! ## ZcplAhcHmcVWpVP ## 
ZcplAhcHmcVWpVP = 0._dp 


 ! ## ZcplAhcHmcVWpVZ ## 
ZcplAhcHmcVWpVZ = 0._dp 


 ! ## ZcpletIetIcVWpVWp ## 
ZcpletIetIcVWpVWp = 0._dp 


 ! ## ZcpletIetIVZVZ ## 
ZcpletIetIVZVZ = 0._dp 


 ! ## ZcpletIHmVPVWp ## 
ZcpletIHmVPVWp = 0._dp 


 ! ## ZcpletIHmVWpVZ ## 
ZcpletIHmVWpVZ = 0._dp 


 ! ## ZcpletIcHmcVWpVP ## 
ZcpletIcHmcVWpVP = 0._dp 


 ! ## ZcpletIcHmcVWpVZ ## 
ZcpletIcHmcVWpVZ = 0._dp 


 ! ## ZcplhhhhcVWpVWp ## 
ZcplhhhhcVWpVWp = 0._dp 


 ! ## ZcplhhhhVZVZ ## 
ZcplhhhhVZVZ = 0._dp 


 ! ## ZcplhhHmVPVWp ## 
ZcplhhHmVPVWp = 0._dp 


 ! ## ZcplhhHmVWpVZ ## 
ZcplhhHmVWpVZ = 0._dp 


 ! ## ZcplhhcHmcVWpVP ## 
ZcplhhcHmcVWpVP = 0._dp 


 ! ## ZcplhhcHmcVWpVZ ## 
ZcplhhcHmcVWpVZ = 0._dp 


 ! ## ZcplHmcHmVPVP ## 
ZcplHmcHmVPVP = 0._dp 


 ! ## ZcplHmcHmVPVZ ## 
ZcplHmcHmVPVZ = 0._dp 


 ! ## ZcplHmcHmcVWpVWp ## 
ZcplHmcHmcVWpVWp = 0._dp 


 ! ## ZcplHmcHmVZVZ ## 
ZcplHmcHmVZVZ = 0._dp 


 ! ## ZcplVGVGVG ## 
ZcplVGVGVG = 0._dp 
TempcplVGVGVG = cplVGVGVG 
ZcplVGVGVG = TempcplVGVGVG 


 ! ## ZcplcVWpVPVWp ## 
ZcplcVWpVPVWp = 0._dp 
TempcplcVWpVPVWp = cplcVWpVPVWp 
ZcplcVWpVPVWp = TempcplcVWpVPVWp 


 ! ## ZcplcVWpVWpVZ ## 
ZcplcVWpVWpVZ = 0._dp 
TempcplcVWpVWpVZ = cplcVWpVWpVZ 
ZcplcVWpVWpVZ = TempcplcVWpVWpVZ 


 ! ## ZcplcFdFdAhL ## 
ZcplcFdFdAhL = 0._dp 
TempcplcFdFdAhL = cplcFdFdAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(gt2,:) = ZcplcFdFdAhL(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdAhL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 
ZcplcFdFdAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhL(:,gt2) = ZcplcFdFdAhL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdAhL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdAhL = ZcplcFdFdAhL 


 ! ## ZcplcFdFdAhR ## 
ZcplcFdFdAhR = 0._dp 
TempcplcFdFdAhR = cplcFdFdAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(gt2,:) = ZcplcFdFdAhR(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdAhR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 
ZcplcFdFdAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdAhR(:,gt2) = ZcplcFdFdAhR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdAhR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdAhR = ZcplcFdFdAhR 


 ! ## ZcplcFeFeAhL ## 
ZcplcFeFeAhL = 0._dp 
TempcplcFeFeAhL = cplcFeFeAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(gt2,:) = ZcplcFeFeAhL(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeAhL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 
ZcplcFeFeAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhL(:,gt2) = ZcplcFeFeAhL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeAhL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeAhL = ZcplcFeFeAhL 


 ! ## ZcplcFeFeAhR ## 
ZcplcFeFeAhR = 0._dp 
TempcplcFeFeAhR = cplcFeFeAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(gt2,:) = ZcplcFeFeAhR(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeAhR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 
ZcplcFeFeAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeAhR(:,gt2) = ZcplcFeFeAhR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeAhR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeAhR = ZcplcFeFeAhR 


 ! ## ZcplcFuFuAhL ## 
ZcplcFuFuAhL = 0._dp 
TempcplcFuFuAhL = cplcFuFuAhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(gt2,:) = ZcplcFuFuAhL(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuAhL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 
ZcplcFuFuAhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhL(:,gt2) = ZcplcFuFuAhL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuAhL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuAhL = ZcplcFuFuAhL 


 ! ## ZcplcFuFuAhR ## 
ZcplcFuFuAhR = 0._dp 
TempcplcFuFuAhR = cplcFuFuAhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(gt2,:) = ZcplcFuFuAhR(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuAhR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 
ZcplcFuFuAhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuAhR(:,gt2) = ZcplcFuFuAhR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuAhR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuAhR = ZcplcFuFuAhR 


 ! ## ZcplcFdFdetIL ## 
ZcplcFdFdetIL = 0._dp 
TempcplcFdFdetIL = cplcFdFdetIL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdetIL(gt2,:) = ZcplcFdFdetIL(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdetIL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdetIL = ZcplcFdFdetIL 
ZcplcFdFdetIL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdetIL(:,gt2) = ZcplcFdFdetIL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdetIL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdetIL = ZcplcFdFdetIL 


 ! ## ZcplcFdFdetIR ## 
ZcplcFdFdetIR = 0._dp 
TempcplcFdFdetIR = cplcFdFdetIR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdetIR(gt2,:) = ZcplcFdFdetIR(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdetIR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdetIR = ZcplcFdFdetIR 
ZcplcFdFdetIR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdetIR(:,gt2) = ZcplcFdFdetIR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdetIR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdetIR = ZcplcFdFdetIR 


 ! ## ZcplcFeFeetIL ## 
ZcplcFeFeetIL = 0._dp 
TempcplcFeFeetIL = cplcFeFeetIL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeetIL(gt2,:) = ZcplcFeFeetIL(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeetIL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeetIL = ZcplcFeFeetIL 
ZcplcFeFeetIL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeetIL(:,gt2) = ZcplcFeFeetIL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeetIL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeetIL = ZcplcFeFeetIL 


 ! ## ZcplcFeFeetIR ## 
ZcplcFeFeetIR = 0._dp 
TempcplcFeFeetIR = cplcFeFeetIR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeetIR(gt2,:) = ZcplcFeFeetIR(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeetIR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeetIR = ZcplcFeFeetIR 
ZcplcFeFeetIR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeetIR(:,gt2) = ZcplcFeFeetIR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeetIR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeetIR = ZcplcFeFeetIR 


 ! ## ZcplcFuFuetIL ## 
ZcplcFuFuetIL = 0._dp 
TempcplcFuFuetIL = cplcFuFuetIL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuetIL(gt2,:) = ZcplcFuFuetIL(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuetIL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuetIL = ZcplcFuFuetIL 
ZcplcFuFuetIL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuetIL(:,gt2) = ZcplcFuFuetIL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuetIL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuetIL = ZcplcFuFuetIL 


 ! ## ZcplcFuFuetIR ## 
ZcplcFuFuetIR = 0._dp 
TempcplcFuFuetIR = cplcFuFuetIR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuetIR(gt2,:) = ZcplcFuFuetIR(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuetIR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuetIR = ZcplcFuFuetIR 
ZcplcFuFuetIR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuetIR(:,gt2) = ZcplcFuFuetIR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuetIR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuetIR = ZcplcFuFuetIR 


 ! ## ZcplcFdFdhhL ## 
ZcplcFdFdhhL = 0._dp 
TempcplcFdFdhhL = cplcFdFdhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(gt2,:,:) = ZcplcFdFdhhL(gt2,:,:) + ZRUUd(gt2,gt1)*TempcplcFdFdhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhL(:,gt2,:) = ZcplcFdFdhhL(:,gt2,:) + ZRUVd(gt2,gt1)*TempcplcFdFdhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhL = ZcplcFdFdhhL 
ZcplcFdFdhhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFdhhL(:,:,gt2) = ZcplcFdFdhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFdFdhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdhhR ## 
ZcplcFdFdhhR = 0._dp 
TempcplcFdFdhhR = cplcFdFdhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(gt2,:,:) = ZcplcFdFdhhR(gt2,:,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdhhR(:,gt2,:) = ZcplcFdFdhhR(:,gt2,:) + ZRUUdc(gt2,gt1)*TempcplcFdFdhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFdhhR = ZcplcFdFdhhR 
ZcplcFdFdhhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFdFdhhR(:,:,gt2) = ZcplcFdFdhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFdFdhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdHmL ## 
ZcplcFuFdHmL = 0._dp 
TempcplcFuFdHmL = cplcFuFdHmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHmL(gt2,:,:) = ZcplcFuFdHmL(gt2,:,:) + ZRUUu(gt2,gt1)*TempcplcFuFdHmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFdHmL = ZcplcFuFdHmL 
ZcplcFuFdHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHmL(:,gt2,:) = ZcplcFuFdHmL(:,gt2,:) + ZRUVd(gt2,gt1)*TempcplcFuFdHmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFdHmL = ZcplcFuFdHmL 
ZcplcFuFdHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHmL(:,:,gt2) = ZcplcFuFdHmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFuFdHmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFdHmR ## 
ZcplcFuFdHmR = 0._dp 
TempcplcFuFdHmR = cplcFuFdHmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHmR(gt2,:,:) = ZcplcFuFdHmR(gt2,:,:) + ZRUVuc(gt2,gt1)*TempcplcFuFdHmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFdHmR = ZcplcFuFdHmR 
ZcplcFuFdHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHmR(:,gt2,:) = ZcplcFuFdHmR(:,gt2,:) + ZRUUdc(gt2,gt1)*TempcplcFuFdHmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFdHmR = ZcplcFuFdHmR 
ZcplcFuFdHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdHmR(:,:,gt2) = ZcplcFuFdHmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFuFdHmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFeHmL ## 
ZcplFvFeHmL = 0._dp 
TempcplFvFeHmL = cplFvFeHmL 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFeHmL(gt2,:,:) = ZcplFvFeHmL(gt2,:,:) + ZRUVv(gt2,gt1)*TempcplFvFeHmL(gt1,:,:) 
 End Do 
End Do 
TempcplFvFeHmL = ZcplFvFeHmL 
ZcplFvFeHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFeHmL(:,gt2,:) = ZcplFvFeHmL(:,gt2,:) + ZRUVe(gt2,gt1)*TempcplFvFeHmL(:,gt1,:) 
 End Do 
End Do 
TempcplFvFeHmL = ZcplFvFeHmL 
ZcplFvFeHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFeHmL(:,:,gt2) = ZcplFvFeHmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplFvFeHmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplFvFeHmR ## 
ZcplFvFeHmR = 0._dp 
TempcplFvFeHmR = cplFvFeHmR 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFeHmR(gt2,:,:) = ZcplFvFeHmR(gt2,:,:) + ZRUVvc(gt2,gt1)*TempcplFvFeHmR(gt1,:,:) 
 End Do 
End Do 
TempcplFvFeHmR = ZcplFvFeHmR 
ZcplFvFeHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFeHmR(:,gt2,:) = ZcplFvFeHmR(:,gt2,:) + ZRUUec(gt2,gt1)*TempcplFvFeHmR(:,gt1,:) 
 End Do 
End Do 
TempcplFvFeHmR = ZcplFvFeHmR 
ZcplFvFeHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFeHmR(:,:,gt2) = ZcplFvFeHmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplFvFeHmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhL ## 
ZcplcFeFehhL = 0._dp 
TempcplcFeFehhL = cplcFeFehhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(gt2,:,:) = ZcplcFeFehhL(gt2,:,:) + ZRUUe(gt2,gt1)*TempcplcFeFehhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhL(:,gt2,:) = ZcplcFeFehhL(:,gt2,:) + ZRUVe(gt2,gt1)*TempcplcFeFehhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhL = ZcplcFeFehhL 
ZcplcFeFehhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFehhL(:,:,gt2) = ZcplcFeFehhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFeFehhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFehhR ## 
ZcplcFeFehhR = 0._dp 
TempcplcFeFehhR = cplcFeFehhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(gt2,:,:) = ZcplcFeFehhR(gt2,:,:) + ZRUVec(gt2,gt1)*TempcplcFeFehhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFehhR(:,gt2,:) = ZcplcFeFehhR(:,gt2,:) + ZRUUec(gt2,gt1)*TempcplcFeFehhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFehhR = ZcplcFeFehhR 
ZcplcFeFehhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFeFehhR(:,:,gt2) = ZcplcFeFehhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFeFehhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhL ## 
ZcplcFuFuhhL = 0._dp 
TempcplcFuFuhhL = cplcFuFuhhL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(gt2,:,:) = ZcplcFuFuhhL(gt2,:,:) + ZRUUu(gt2,gt1)*TempcplcFuFuhhL(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhL(:,gt2,:) = ZcplcFuFuhhL(:,gt2,:) + ZRUVu(gt2,gt1)*TempcplcFuFuhhL(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhL = ZcplcFuFuhhL 
ZcplcFuFuhhL = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFuhhL(:,:,gt2) = ZcplcFuFuhhL(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFuFuhhL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFuFuhhR ## 
ZcplcFuFuhhR = 0._dp 
TempcplcFuFuhhR = cplcFuFuhhR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(gt2,:,:) = ZcplcFuFuhhR(gt2,:,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuhhR(gt1,:,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuhhR(:,gt2,:) = ZcplcFuFuhhR(:,gt2,:) + ZRUUuc(gt2,gt1)*TempcplcFuFuhhR(:,gt1,:) 
 End Do 
End Do 
TempcplcFuFuhhR = ZcplcFuFuhhR 
ZcplcFuFuhhR = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcFuFuhhR(:,:,gt2) = ZcplcFuFuhhR(:,:,gt2) + ZRUZH(gt2,gt1)*TempcplcFuFuhhR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFucHmL ## 
ZcplcFdFucHmL = 0._dp 
TempcplcFdFucHmL = cplcFdFucHmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHmL(gt2,:,:) = ZcplcFdFucHmL(gt2,:,:) + ZRUUd(gt2,gt1)*TempcplcFdFucHmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFucHmL = ZcplcFdFucHmL 
ZcplcFdFucHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHmL(:,gt2,:) = ZcplcFdFucHmL(:,gt2,:) + ZRUVu(gt2,gt1)*TempcplcFdFucHmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFucHmL = ZcplcFdFucHmL 
ZcplcFdFucHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHmL(:,:,gt2) = ZcplcFdFucHmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFdFucHmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFucHmR ## 
ZcplcFdFucHmR = 0._dp 
TempcplcFdFucHmR = cplcFdFucHmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHmR(gt2,:,:) = ZcplcFdFucHmR(gt2,:,:) + ZRUVdc(gt2,gt1)*TempcplcFdFucHmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFdFucHmR = ZcplcFdFucHmR 
ZcplcFdFucHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHmR(:,gt2,:) = ZcplcFdFucHmR(:,gt2,:) + ZRUUuc(gt2,gt1)*TempcplcFdFucHmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFdFucHmR = ZcplcFdFucHmR 
ZcplcFdFucHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFucHmR(:,:,gt2) = ZcplcFdFucHmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFdFucHmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvcHmL ## 
ZcplcFeFvcHmL = 0._dp 
TempcplcFeFvcHmL = cplcFeFvcHmL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHmL(gt2,:,:) = ZcplcFeFvcHmL(gt2,:,:) + ZRUUe(gt2,gt1)*TempcplcFeFvcHmL(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFvcHmL = ZcplcFeFvcHmL 
ZcplcFeFvcHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHmL(:,gt2,:) = ZcplcFeFvcHmL(:,gt2,:) + ZRUVv(gt2,gt1)*TempcplcFeFvcHmL(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFvcHmL = ZcplcFeFvcHmL 
ZcplcFeFvcHmL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHmL(:,:,gt2) = ZcplcFeFvcHmL(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFeFvcHmL(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFeFvcHmR ## 
ZcplcFeFvcHmR = 0._dp 
TempcplcFeFvcHmR = cplcFeFvcHmR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHmR(gt2,:,:) = ZcplcFeFvcHmR(gt2,:,:) + ZRUVec(gt2,gt1)*TempcplcFeFvcHmR(gt1,:,:) 
 End Do 
End Do 
TempcplcFeFvcHmR = ZcplcFeFvcHmR 
ZcplcFeFvcHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHmR(:,gt2,:) = ZcplcFeFvcHmR(:,gt2,:) + ZRUVvc(gt2,gt1)*TempcplcFeFvcHmR(:,gt1,:) 
 End Do 
End Do 
TempcplcFeFvcHmR = ZcplcFeFvcHmR 
ZcplcFeFvcHmR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvcHmR(:,:,gt2) = ZcplcFeFvcHmR(:,:,gt2) + ZRUZP(gt2,gt1)*TempcplcFeFvcHmR(:,:,gt1) 
 End Do 
End Do 


 ! ## ZcplcFdFdVGL ## 
ZcplcFdFdVGL = 0._dp 
TempcplcFdFdVGL = cplcFdFdVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(gt2,:) = ZcplcFdFdVGL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVGL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 
ZcplcFdFdVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGL(:,gt2) = ZcplcFdFdVGL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVGL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGL = ZcplcFdFdVGL 


 ! ## ZcplcFdFdVGR ## 
ZcplcFdFdVGR = 0._dp 
TempcplcFdFdVGR = cplcFdFdVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(gt2,:) = ZcplcFdFdVGR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVGR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 
ZcplcFdFdVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVGR(:,gt2) = ZcplcFdFdVGR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVGR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVGR = ZcplcFdFdVGR 


 ! ## ZcplcFdFdVPL ## 
ZcplcFdFdVPL = 0._dp 
TempcplcFdFdVPL = cplcFdFdVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(gt2,:) = ZcplcFdFdVPL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVPL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 
ZcplcFdFdVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPL(:,gt2) = ZcplcFdFdVPL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVPL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPL = ZcplcFdFdVPL 


 ! ## ZcplcFdFdVPR ## 
ZcplcFdFdVPR = 0._dp 
TempcplcFdFdVPR = cplcFdFdVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(gt2,:) = ZcplcFdFdVPR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVPR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 
ZcplcFdFdVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVPR(:,gt2) = ZcplcFdFdVPR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVPR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVPR = ZcplcFdFdVPR 


 ! ## ZcplcFdFdVZL ## 
ZcplcFdFdVZL = 0._dp 
TempcplcFdFdVZL = cplcFdFdVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(gt2,:) = ZcplcFdFdVZL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFdVZL(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 
ZcplcFdFdVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZL(:,gt2) = ZcplcFdFdVZL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFdFdVZL(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZL = ZcplcFdFdVZL 


 ! ## ZcplcFdFdVZR ## 
ZcplcFdFdVZR = 0._dp 
TempcplcFdFdVZR = cplcFdFdVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(gt2,:) = ZcplcFdFdVZR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFdVZR(gt1,:) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 
ZcplcFdFdVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFdVZR(:,gt2) = ZcplcFdFdVZR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFdFdVZR(:,gt1) 
 End Do 
End Do 
TempcplcFdFdVZR = ZcplcFdFdVZR 


 ! ## ZcplcFuFdcVWpL ## 
ZcplcFuFdcVWpL = 0._dp 
TempcplcFuFdcVWpL = cplcFuFdcVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWpL(gt2,:) = ZcplcFuFdcVWpL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFdcVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFuFdcVWpL = ZcplcFuFdcVWpL 
ZcplcFuFdcVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWpL(:,gt2) = ZcplcFuFdcVWpL(:,gt2) + ZRUVd(gt2,gt1)*TempcplcFuFdcVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFuFdcVWpL = ZcplcFuFdcVWpL 


 ! ## ZcplcFuFdcVWpR ## 
ZcplcFuFdcVWpR = 0._dp 
TempcplcFuFdcVWpR = cplcFuFdcVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWpR(gt2,:) = ZcplcFuFdcVWpR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFdcVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFuFdcVWpR = ZcplcFuFdcVWpR 
ZcplcFuFdcVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFdcVWpR(:,gt2) = ZcplcFuFdcVWpR(:,gt2) + ZRUUdc(gt2,gt1)*TempcplcFuFdcVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFuFdcVWpR = ZcplcFuFdcVWpR 


 ! ## ZcplFvFecVWpL ## 
ZcplFvFecVWpL = 0._dp 
TempcplFvFecVWpL = cplFvFecVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWpL(gt2,:) = ZcplFvFecVWpL(gt2,:) + ZRUVvc(gt2,gt1)*TempcplFvFecVWpL(gt1,:) 
 End Do 
End Do 
TempcplFvFecVWpL = ZcplFvFecVWpL 
ZcplFvFecVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWpL(:,gt2) = ZcplFvFecVWpL(:,gt2) + ZRUVe(gt2,gt1)*TempcplFvFecVWpL(:,gt1) 
 End Do 
End Do 
TempcplFvFecVWpL = ZcplFvFecVWpL 


 ! ## ZcplFvFecVWpR ## 
ZcplFvFecVWpR = 0._dp 
TempcplFvFecVWpR = cplFvFecVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWpR(gt2,:) = ZcplFvFecVWpR(gt2,:) + ZRUVv(gt2,gt1)*TempcplFvFecVWpR(gt1,:) 
 End Do 
End Do 
TempcplFvFecVWpR = ZcplFvFecVWpR 
ZcplFvFecVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFecVWpR(:,gt2) = ZcplFvFecVWpR(:,gt2) + ZRUUec(gt2,gt1)*TempcplFvFecVWpR(:,gt1) 
 End Do 
End Do 
TempcplFvFecVWpR = ZcplFvFecVWpR 


 ! ## ZcplcFeFeVPL ## 
ZcplcFeFeVPL = 0._dp 
TempcplcFeFeVPL = cplcFeFeVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(gt2,:) = ZcplcFeFeVPL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVPL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 
ZcplcFeFeVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPL(:,gt2) = ZcplcFeFeVPL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVPL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPL = ZcplcFeFeVPL 


 ! ## ZcplcFeFeVPR ## 
ZcplcFeFeVPR = 0._dp 
TempcplcFeFeVPR = cplcFeFeVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(gt2,:) = ZcplcFeFeVPR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVPR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 
ZcplcFeFeVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVPR(:,gt2) = ZcplcFeFeVPR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVPR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVPR = ZcplcFeFeVPR 


 ! ## ZcplcFeFeVZL ## 
ZcplcFeFeVZL = 0._dp 
TempcplcFeFeVZL = cplcFeFeVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(gt2,:) = ZcplcFeFeVZL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFeVZL(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 
ZcplcFeFeVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZL(:,gt2) = ZcplcFeFeVZL(:,gt2) + ZRUVe(gt2,gt1)*TempcplcFeFeVZL(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZL = ZcplcFeFeVZL 


 ! ## ZcplcFeFeVZR ## 
ZcplcFeFeVZR = 0._dp 
TempcplcFeFeVZR = cplcFeFeVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(gt2,:) = ZcplcFeFeVZR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFeVZR(gt1,:) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 
ZcplcFeFeVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFeVZR(:,gt2) = ZcplcFeFeVZR(:,gt2) + ZRUUec(gt2,gt1)*TempcplcFeFeVZR(:,gt1) 
 End Do 
End Do 
TempcplcFeFeVZR = ZcplcFeFeVZR 


 ! ## ZcplcFuFuVGL ## 
ZcplcFuFuVGL = 0._dp 
TempcplcFuFuVGL = cplcFuFuVGL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(gt2,:) = ZcplcFuFuVGL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVGL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 
ZcplcFuFuVGL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGL(:,gt2) = ZcplcFuFuVGL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVGL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGL = ZcplcFuFuVGL 


 ! ## ZcplcFuFuVGR ## 
ZcplcFuFuVGR = 0._dp 
TempcplcFuFuVGR = cplcFuFuVGR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(gt2,:) = ZcplcFuFuVGR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVGR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 
ZcplcFuFuVGR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVGR(:,gt2) = ZcplcFuFuVGR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVGR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVGR = ZcplcFuFuVGR 


 ! ## ZcplcFuFuVPL ## 
ZcplcFuFuVPL = 0._dp 
TempcplcFuFuVPL = cplcFuFuVPL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(gt2,:) = ZcplcFuFuVPL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVPL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 
ZcplcFuFuVPL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPL(:,gt2) = ZcplcFuFuVPL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVPL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPL = ZcplcFuFuVPL 


 ! ## ZcplcFuFuVPR ## 
ZcplcFuFuVPR = 0._dp 
TempcplcFuFuVPR = cplcFuFuVPR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(gt2,:) = ZcplcFuFuVPR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVPR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 
ZcplcFuFuVPR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVPR(:,gt2) = ZcplcFuFuVPR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVPR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVPR = ZcplcFuFuVPR 


 ! ## ZcplcFdFuVWpL ## 
ZcplcFdFuVWpL = 0._dp 
TempcplcFdFuVWpL = cplcFdFuVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWpL(gt2,:) = ZcplcFdFuVWpL(gt2,:) + ZRUVdc(gt2,gt1)*TempcplcFdFuVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFdFuVWpL = ZcplcFdFuVWpL 
ZcplcFdFuVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWpL(:,gt2) = ZcplcFdFuVWpL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFdFuVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFdFuVWpL = ZcplcFdFuVWpL 


 ! ## ZcplcFdFuVWpR ## 
ZcplcFdFuVWpR = 0._dp 
TempcplcFdFuVWpR = cplcFdFuVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWpR(gt2,:) = ZcplcFdFuVWpR(gt2,:) + ZRUUd(gt2,gt1)*TempcplcFdFuVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFdFuVWpR = ZcplcFdFuVWpR 
ZcplcFdFuVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFdFuVWpR(:,gt2) = ZcplcFdFuVWpR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFdFuVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFdFuVWpR = ZcplcFdFuVWpR 


 ! ## ZcplcFuFuVZL ## 
ZcplcFuFuVZL = 0._dp 
TempcplcFuFuVZL = cplcFuFuVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(gt2,:) = ZcplcFuFuVZL(gt2,:) + ZRUVuc(gt2,gt1)*TempcplcFuFuVZL(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 
ZcplcFuFuVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZL(:,gt2) = ZcplcFuFuVZL(:,gt2) + ZRUVu(gt2,gt1)*TempcplcFuFuVZL(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZL = ZcplcFuFuVZL 


 ! ## ZcplcFuFuVZR ## 
ZcplcFuFuVZR = 0._dp 
TempcplcFuFuVZR = cplcFuFuVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(gt2,:) = ZcplcFuFuVZR(gt2,:) + ZRUUu(gt2,gt1)*TempcplcFuFuVZR(gt1,:) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 
ZcplcFuFuVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFuFuVZR(:,gt2) = ZcplcFuFuVZR(:,gt2) + ZRUUuc(gt2,gt1)*TempcplcFuFuVZR(:,gt1) 
 End Do 
End Do 
TempcplcFuFuVZR = ZcplcFuFuVZR 


 ! ## ZcplFvFvVZL ## 
ZcplFvFvVZL = 0._dp 
TempcplFvFvVZL = cplFvFvVZL 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvVZL(gt2,:) = ZcplFvFvVZL(gt2,:) + ZRUVvc(gt2,gt1)*TempcplFvFvVZL(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 
ZcplFvFvVZL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvVZL(:,gt2) = ZcplFvFvVZL(:,gt2) + ZRUVv(gt2,gt1)*TempcplFvFvVZL(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZL = ZcplFvFvVZL 


 ! ## ZcplFvFvVZR ## 
ZcplFvFvVZR = 0._dp 
TempcplFvFvVZR = cplFvFvVZR 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvVZR(gt2,:) = ZcplFvFvVZR(gt2,:) + ZRUVv(gt2,gt1)*TempcplFvFvVZR(gt1,:) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 
ZcplFvFvVZR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplFvFvVZR(:,gt2) = ZcplFvFvVZR(:,gt2) + ZRUVvc(gt2,gt1)*TempcplFvFvVZR(:,gt1) 
 End Do 
End Do 
TempcplFvFvVZR = ZcplFvFvVZR 


 ! ## ZcplcFeFvVWpL ## 
ZcplcFeFvVWpL = 0._dp 
TempcplcFeFvVWpL = cplcFeFvVWpL 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWpL(gt2,:) = ZcplcFeFvVWpL(gt2,:) + ZRUVec(gt2,gt1)*TempcplcFeFvVWpL(gt1,:) 
 End Do 
End Do 
TempcplcFeFvVWpL = ZcplcFeFvVWpL 
ZcplcFeFvVWpL = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWpL(:,gt2) = ZcplcFeFvVWpL(:,gt2) + ZRUVv(gt2,gt1)*TempcplcFeFvVWpL(:,gt1) 
 End Do 
End Do 
TempcplcFeFvVWpL = ZcplcFeFvVWpL 


 ! ## ZcplcFeFvVWpR ## 
ZcplcFeFvVWpR = 0._dp 
TempcplcFeFvVWpR = cplcFeFvVWpR 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWpR(gt2,:) = ZcplcFeFvVWpR(gt2,:) + ZRUUe(gt2,gt1)*TempcplcFeFvVWpR(gt1,:) 
 End Do 
End Do 
TempcplcFeFvVWpR = ZcplcFeFvVWpR 
ZcplcFeFvVWpR = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcFeFvVWpR(:,gt2) = ZcplcFeFvVWpR(:,gt2) + ZRUVvc(gt2,gt1)*TempcplcFeFvVWpR(:,gt1) 
 End Do 
End Do 
TempcplcFeFvVWpR = ZcplcFeFvVWpR 


 ! ## ZcplVGVGVGVG1 ## 
ZcplVGVGVGVG1 = 0._dp 


 ! ## ZcplVGVGVGVG2 ## 
ZcplVGVGVGVG2 = 0._dp 


 ! ## ZcplVGVGVGVG3 ## 
ZcplVGVGVGVG3 = 0._dp 


 ! ## ZcplcVWpVPVPVWp1 ## 
ZcplcVWpVPVPVWp1 = 0._dp 


 ! ## ZcplcVWpVPVPVWp2 ## 
ZcplcVWpVPVPVWp2 = 0._dp 


 ! ## ZcplcVWpVPVPVWp3 ## 
ZcplcVWpVPVPVWp3 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ1 ## 
ZcplcVWpVPVWpVZ1 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ2 ## 
ZcplcVWpVPVWpVZ2 = 0._dp 


 ! ## ZcplcVWpVPVWpVZ3 ## 
ZcplcVWpVPVWpVZ3 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp1 ## 
ZcplcVWpcVWpVWpVWp1 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp2 ## 
ZcplcVWpcVWpVWpVWp2 = 0._dp 


 ! ## ZcplcVWpcVWpVWpVWp3 ## 
ZcplcVWpcVWpVWpVWp3 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ1 ## 
ZcplcVWpVWpVZVZ1 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ2 ## 
ZcplcVWpVWpVZVZ2 = 0._dp 


 ! ## ZcplcVWpVWpVZVZ3 ## 
ZcplcVWpVWpVZVZ3 = 0._dp 


 ! ## ZcplcgGgGVG ## 
ZcplcgGgGVG = 0._dp 
TempcplcgGgGVG = cplcgGgGVG 
ZcplcgGgGVG = TempcplcgGgGVG 


 ! ## ZcplcgWpgAVWp ## 
ZcplcgWpgAVWp = 0._dp 
TempcplcgWpgAVWp = cplcgWpgAVWp 
ZcplcgWpgAVWp = TempcplcgWpgAVWp 


 ! ## ZcplcgWCgAcVWp ## 
ZcplcgWCgAcVWp = 0._dp 
TempcplcgWCgAcVWp = cplcgWCgAcVWp 
ZcplcgWCgAcVWp = TempcplcgWCgAcVWp 


 ! ## ZcplcgWpgWpVP ## 
ZcplcgWpgWpVP = 0._dp 
TempcplcgWpgWpVP = cplcgWpgWpVP 
ZcplcgWpgWpVP = TempcplcgWpgWpVP 


 ! ## ZcplcgWpgWpVZ ## 
ZcplcgWpgWpVZ = 0._dp 
TempcplcgWpgWpVZ = cplcgWpgWpVZ 
ZcplcgWpgWpVZ = TempcplcgWpgWpVZ 


 ! ## ZcplcgAgWpcVWp ## 
ZcplcgAgWpcVWp = 0._dp 
TempcplcgAgWpcVWp = cplcgAgWpcVWp 
ZcplcgAgWpcVWp = TempcplcgAgWpcVWp 


 ! ## ZcplcgZgWpcVWp ## 
ZcplcgZgWpcVWp = 0._dp 
TempcplcgZgWpcVWp = cplcgZgWpcVWp 
ZcplcgZgWpcVWp = TempcplcgZgWpcVWp 


 ! ## ZcplcgWCgWCVP ## 
ZcplcgWCgWCVP = 0._dp 
TempcplcgWCgWCVP = cplcgWCgWCVP 
ZcplcgWCgWCVP = TempcplcgWCgWCVP 


 ! ## ZcplcgAgWCVWp ## 
ZcplcgAgWCVWp = 0._dp 
TempcplcgAgWCVWp = cplcgAgWCVWp 
ZcplcgAgWCVWp = TempcplcgAgWCVWp 


 ! ## ZcplcgZgWCVWp ## 
ZcplcgZgWCVWp = 0._dp 
TempcplcgZgWCVWp = cplcgZgWCVWp 
ZcplcgZgWCVWp = TempcplcgZgWCVWp 


 ! ## ZcplcgWCgWCVZ ## 
ZcplcgWCgWCVZ = 0._dp 
TempcplcgWCgWCVZ = cplcgWCgWCVZ 
ZcplcgWCgWCVZ = TempcplcgWCgWCVZ 


 ! ## ZcplcgWpgZVWp ## 
ZcplcgWpgZVWp = 0._dp 
TempcplcgWpgZVWp = cplcgWpgZVWp 
ZcplcgWpgZVWp = TempcplcgWpgZVWp 


 ! ## ZcplcgWCgZcVWp ## 
ZcplcgWCgZcVWp = 0._dp 
TempcplcgWCgZcVWp = cplcgWCgZcVWp 
ZcplcgWCgZcVWp = TempcplcgWCgZcVWp 


 ! ## ZcplcgWpgWpAh ## 
ZcplcgWpgWpAh = 0._dp 
TempcplcgWpgWpAh = cplcgWpgWpAh 
ZcplcgWpgWpAh = TempcplcgWpgWpAh 


 ! ## ZcplcgWCgWCAh ## 
ZcplcgWCgWCAh = 0._dp 
TempcplcgWCgWCAh = cplcgWCgWCAh 
ZcplcgWCgWCAh = TempcplcgWCgWCAh 


 ! ## ZcplcgWpgWpetI ## 
ZcplcgWpgWpetI = 0._dp 
TempcplcgWpgWpetI = cplcgWpgWpetI 
ZcplcgWpgWpetI = TempcplcgWpgWpetI 


 ! ## ZcplcgWCgWCetI ## 
ZcplcgWCgWCetI = 0._dp 
TempcplcgWCgWCetI = cplcgWCgWCetI 
ZcplcgWCgWCetI = TempcplcgWCgWCetI 


 ! ## ZcplcgZgAhh ## 
ZcplcgZgAhh = 0._dp 
TempcplcgZgAhh = cplcgZgAhh 
ZcplcgZgAhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgAhh(gt2) = ZcplcgZgAhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgAhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWCgAHm ## 
ZcplcgWCgAHm = 0._dp 
TempcplcgWCgAHm = cplcgWCgAHm 
ZcplcgWCgAHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWCgAHm(gt2) = ZcplcgWCgAHm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWCgAHm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpgAcHm ## 
ZcplcgWpgAcHm = 0._dp 
TempcplcgWpgAcHm = cplcgWpgAcHm 
ZcplcgWpgAcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWpgAcHm(gt2) = ZcplcgWpgAcHm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpgAcHm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpgWphh ## 
ZcplcgWpgWphh = 0._dp 
TempcplcgWpgWphh = cplcgWpgWphh 
ZcplcgWpgWphh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWpgWphh(gt2) = ZcplcgWpgWphh(gt2) + ZRUZH(gt2,gt1)*TempcplcgWpgWphh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWpHm ## 
ZcplcgZgWpHm = 0._dp 
TempcplcgZgWpHm = cplcgZgWpHm 
ZcplcgZgWpHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgZgWpHm(gt2) = ZcplcgZgWpHm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZgWpHm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWCgWChh ## 
ZcplcgWCgWChh = 0._dp 
TempcplcgWCgWChh = cplcgWCgWChh 
ZcplcgWCgWChh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgWCgWChh(gt2) = ZcplcgWCgWChh(gt2) + ZRUZH(gt2,gt1)*TempcplcgWCgWChh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgWCcHm ## 
ZcplcgZgWCcHm = 0._dp 
TempcplcgZgWCcHm = cplcgZgWCcHm 
ZcplcgZgWCcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgZgWCcHm(gt2) = ZcplcgZgWCcHm(gt2) + ZRUZP(gt2,gt1)*TempcplcgZgWCcHm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgZgZhh ## 
ZcplcgZgZhh = 0._dp 
TempcplcgZgZhh = cplcgZgZhh 
ZcplcgZgZhh = 0._dp 
Do gt1=1,2
  Do gt2=1,2
ZcplcgZgZhh(gt2) = ZcplcgZgZhh(gt2) + ZRUZH(gt2,gt1)*TempcplcgZgZhh(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWCgZHm ## 
ZcplcgWCgZHm = 0._dp 
TempcplcgWCgZHm = cplcgWCgZHm 
ZcplcgWCgZHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWCgZHm(gt2) = ZcplcgWCgZHm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWCgZHm(gt1) 
 End Do 
End Do 


 ! ## ZcplcgWpgZcHm ## 
ZcplcgWpgZcHm = 0._dp 
TempcplcgWpgZcHm = cplcgWpgZcHm 
ZcplcgWpgZcHm = 0._dp 
Do gt1=1,3
  Do gt2=1,3
ZcplcgWpgZcHm(gt2) = ZcplcgWpgZcHm(gt2) + ZRUZP(gt2,gt1)*TempcplcgWpgZcHm(gt1) 
 End Do 
End Do 
End Subroutine  getZCouplings 

Subroutine getGBCouplings(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,               & 
& MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,             & 
& MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,            & 
& MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,           & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,GcplAhHmcHm,GcpletIHmcHm,    & 
& GcplhhHmcHm,GcplAhHmVWp,GcplAhcHmcVWp,GcpletIHmVWp,GcpletIcHmcVWp,GcplhhHmVWp,         & 
& GcplhhcHmcVWp,GcplHmcHmVP,GcplHmcHmVZ,GcplHmVPVWp,GcplHmVWpVZ,GcplcHmcVWpVP,           & 
& GcplcHmcVWpVZ,GcplcFuFdHmL,GcplcFuFdHmR,GcplFvFeHmL,GcplFvFeHmR,GcplcFdFucHmL,         & 
& GcplcFdFucHmR,GcplcFeFvcHmL,GcplcFeFvcHmR,GZcplAhHmcHm,GZcpletIHmcHm,GZcplhhHmcHm,     & 
& GZcplAhHmVWp,GZcplAhcHmcVWp,GZcpletIHmVWp,GZcpletIcHmcVWp,GZcplhhHmVWp,GZcplhhcHmcVWp, & 
& GZcplHmcHmVP,GZcplHmcHmVZ,GZcplHmVPVWp,GZcplHmVWpVZ,GZcplcHmcVWpVP,GZcplcHmcVWpVZ,     & 
& GZcplcFuFdHmL,GZcplcFuFdHmR,GZcplFvFeHmL,GZcplFvFeHmR,GZcplcFdFucHmL,GZcplcFdFucHmR,   & 
& GZcplcFeFvcHmL,GZcplcFeFvcHmR,GosZcplAhHmcHm,GosZcpletIHmcHm,GosZcplhhHmcHm,           & 
& GosZcplAhHmVWp,GosZcplAhcHmcVWp,GosZcpletIHmVWp,GosZcpletIcHmcVWp,GosZcplhhHmVWp,      & 
& GosZcplhhcHmcVWp,GosZcplHmcHmVP,GosZcplHmcHmVZ,GosZcplHmVPVWp,GosZcplHmVWpVZ,          & 
& GosZcplcHmcVWpVP,GosZcplcHmcVWpVZ,GosZcplcFuFdHmL,GosZcplcFuFdHmR,GosZcplFvFeHmL,      & 
& GosZcplFvFeHmR,GosZcplcFdFucHmL,GosZcplcFdFucHmR,GosZcplcFeFvcHmL,GosZcplcFeFvcHmR)

Implicit None

Real(dp), Intent(in) :: MhhOS(2),Mhh2OS(2),MHmOS(3),MHm2OS(3),MFvOS(3),MFv2OS(3),MFdOS(3),MFd2OS(3),          & 
& MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,               & 
& MVZ2OS,MVWpOS,MVWp2OS,ZHOS(2,2),ZPOS(3,3)

Complex(dp), Intent(in) :: UVOS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp), Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Integer :: gt1, gt2, gt3, i1, i2
Complex(dp), Intent(out) :: GcplAhHmcHm(3,3),GcpletIHmcHm(3,3),GcplhhHmcHm(2,3,3),GcplAhHmVWp(3),GcplAhcHmcVWp(3),& 
& GcpletIHmVWp(3),GcpletIcHmcVWp(3),GcplhhHmVWp(2,3),GcplhhcHmcVWp(2,3),GcplHmcHmVP(3,3),& 
& GcplHmcHmVZ(3,3),GcplHmVPVWp(3),GcplHmVWpVZ(3),GcplcHmcVWpVP(3),GcplcHmcVWpVZ(3),      & 
& GcplcFuFdHmL(3,3,3),GcplcFuFdHmR(3,3,3),GcplFvFeHmL(3,3,3),GcplFvFeHmR(3,3,3),         & 
& GcplcFdFucHmL(3,3,3),GcplcFdFucHmR(3,3,3),GcplcFeFvcHmL(3,3,3),GcplcFeFvcHmR(3,3,3)

Complex(dp), Intent(out) :: GZcplAhHmcHm(3,3),GZcpletIHmcHm(3,3),GZcplhhHmcHm(2,3,3),GZcplAhHmVWp(3),             & 
& GZcplAhcHmcVWp(3),GZcpletIHmVWp(3),GZcpletIcHmcVWp(3),GZcplhhHmVWp(2,3),               & 
& GZcplhhcHmcVWp(2,3),GZcplHmcHmVP(3,3),GZcplHmcHmVZ(3,3),GZcplHmVPVWp(3),               & 
& GZcplHmVWpVZ(3),GZcplcHmcVWpVP(3),GZcplcHmcVWpVZ(3),GZcplcFuFdHmL(3,3,3),              & 
& GZcplcFuFdHmR(3,3,3),GZcplFvFeHmL(3,3,3),GZcplFvFeHmR(3,3,3),GZcplcFdFucHmL(3,3,3),    & 
& GZcplcFdFucHmR(3,3,3),GZcplcFeFvcHmL(3,3,3),GZcplcFeFvcHmR(3,3,3)

Complex(dp), Intent(out) :: GosZcplAhHmcHm(3,3),GosZcpletIHmcHm(3,3),GosZcplhhHmcHm(2,3,3),GosZcplAhHmVWp(3),     & 
& GosZcplAhcHmcVWp(3),GosZcpletIHmVWp(3),GosZcpletIcHmcVWp(3),GosZcplhhHmVWp(2,3),       & 
& GosZcplhhcHmcVWp(2,3),GosZcplHmcHmVP(3,3),GosZcplHmcHmVZ(3,3),GosZcplHmVPVWp(3),       & 
& GosZcplHmVWpVZ(3),GosZcplcHmcVWpVP(3),GosZcplcHmcVWpVZ(3),GosZcplcFuFdHmL(3,3,3),      & 
& GosZcplcFuFdHmR(3,3,3),GosZcplFvFeHmL(3,3,3),GosZcplFvFeHmR(3,3,3),GosZcplcFdFucHmL(3,3,3),& 
& GosZcplcFdFucHmR(3,3,3),GosZcplcFeFvcHmL(3,3,3),GosZcplcFeFvcHmR(3,3,3)

 Do i2=1,3
GcplAhHmcHm(1,i2) = 0._dp
GosZcplAhHmcHm(1,i2) = 0._dp
GZcplAhHmcHm(1,i2) = 0._dp
 End Do
 Do i2=1,3
GcpletIHmcHm(1,i2) = 0._dp
GosZcpletIHmcHm(1,i2) = 0._dp
GZcpletIHmcHm(1,i2) = 0._dp
 End Do
Do i1=1,2
 Do i2=1,3
GcplhhHmcHm(i1,1,i2) = 0._dp
GosZcplhhHmcHm(i1,1,i2) = 0._dp
GZcplhhHmcHm(i1,1,i2) = 0._dp
 End Do
End Do 
GcplAhHmVWp(1) = 0._dp 
GosZcplAhHmVWp(1) = 0._dp
GZcplAhHmVWp(1) = 0._dp
GcplAhcHmcVWp(1) = 0._dp 
GosZcplAhcHmcVWp(1) = 0._dp
GZcplAhcHmcVWp(1) = 0._dp
GcpletIHmVWp(1) = 0._dp 
GosZcpletIHmVWp(1) = 0._dp
GZcpletIHmVWp(1) = 0._dp
GcpletIcHmcVWp(1) = 0._dp 
GosZcpletIcHmcVWp(1) = 0._dp
GZcpletIcHmcVWp(1) = 0._dp
Do i1=1,2
GcplhhHmVWp(i1,1) = 0._dp 
GosZcplhhHmVWp(i1,1) = 0._dp
GZcplhhHmVWp(i1,1) = 0._dp
End Do 
Do i1=1,2
GcplhhcHmcVWp(i1,1) = 0._dp 
GosZcplhhcHmcVWp(i1,1) = 0._dp
GZcplhhcHmcVWp(i1,1) = 0._dp
End Do 
Do i1=1,3
GcplHmcHmVP(1,i1) = 0._dp
GosZcplHmcHmVP(1,i1) = 0._dp
GZcplHmcHmVP(1,i1) = 0._dp
End Do 
Do i1=1,3
GcplHmcHmVZ(1,i1) = 0._dp
GosZcplHmcHmVZ(1,i1) = 0._dp
GZcplHmcHmVZ(1,i1) = 0._dp
End Do 
GcplHmVPVWp(1) = 0._dp
GosZcplHmVPVWp(1) = 0._dp
GZcplHmVPVWp(1) = 0._dp 
GcplHmVWpVZ(1) = 0._dp
GosZcplHmVWpVZ(1) = 0._dp
GZcplHmVWpVZ(1) = 0._dp 
GcplcHmcVWpVP(1) = 0._dp
GosZcplcHmcVWpVP(1) = 0._dp
GZcplcHmcVWpVP(1) = 0._dp 
GcplcHmcVWpVZ(1) = 0._dp
GosZcplcHmcVWpVZ(1) = 0._dp
GZcplcHmcVWpVZ(1) = 0._dp 
Do i1=1,3
 Do i2=1,3
GcplcFuFdHmL(i1,i2,1) = 0._dp
GcplcFuFdHmR(i1,i2,1) = 0._dp
GosZcplcFuFdHmL(i1,i2,1) = 0._dp
GosZcplcFuFdHmR(i1,i2,1) = 0._dp
GZcplcFuFdHmL(i1,i2,1) = 0._dp
GZcplcFuFdHmR(i1,i2,1) = 0._dp
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplFvFeHmL(i1,i2,1) = 0._dp
GcplFvFeHmR(i1,i2,1) = 0._dp
GosZcplFvFeHmL(i1,i2,1) = 0._dp
GosZcplFvFeHmR(i1,i2,1) = 0._dp
GZcplFvFeHmL(i1,i2,1) = 0._dp
GZcplFvFeHmR(i1,i2,1) = 0._dp
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFdFucHmL(i1,i2,1) = 0._dp
GcplcFdFucHmR(i1,i2,1) = 0._dp
GosZcplcFdFucHmL(i1,i2,1) = 0._dp
GosZcplcFdFucHmR(i1,i2,1) = 0._dp
GZcplcFdFucHmL(i1,i2,1) = 0._dp
GZcplcFdFucHmR(i1,i2,1) = 0._dp
 End Do
End Do 
Do i1=1,3
 Do i2=1,3
GcplcFeFvcHmL(i1,i2,1) = 0._dp
GcplcFeFvcHmR(i1,i2,1) = 0._dp
GosZcplcFeFvcHmL(i1,i2,1) = 0._dp
GosZcplcFeFvcHmR(i1,i2,1) = 0._dp
GZcplcFeFvcHmL(i1,i2,1) = 0._dp
GZcplcFeFvcHmR(i1,i2,1) = 0._dp
 End Do
End Do 
End Subroutine  getGBCouplings 

Subroutine WaveFunctionRenormalisation(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,               & 
& MFv2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,             & 
& MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,              & 
& ZEROS,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,            & 
& MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,             & 
& g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,              & 
& epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,cplAhAhAh,cplAhAhetI,cplAhAhhh,             & 
& cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhHmcHm,cpletIetIetI,cpletIetIhh,cpletIhhhh,       & 
& cpletIHmcHm,cplhhhhhh,cplhhHmcHm,cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,   & 
& cplAhAhetIhh,cplAhAhhhhh,cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,       & 
& cplAhetIHmcHm,cplAhhhhhhh,cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,   & 
& cpletIetIHmcHm,cpletIhhhhhh,cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm,      & 
& cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplhhHmVWp,     & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplhhcVWpVWp,cplhhVZVZ,cplHmVPVWp,cplHmVWpVZ,       & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHmVPVWp,cplAhHmVWpVZ,        & 
& cplAhcHmcVWpVP,cplAhcHmcVWpVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp,            & 
& cpletIHmVWpVZ,cpletIcHmcVWpVP,cpletIcHmcVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,              & 
& cplhhHmVPVWp,cplhhHmVWpVZ,cplhhcHmcVWpVP,cplhhcHmcVWpVZ,cplHmcHmVPVP,cplHmcHmVPVZ,     & 
& cplHmcHmcVWpVWp,cplHmcHmVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,      & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgWpgWpetI,       & 
& cplcgWCgWCetI,cplcgZgAhh,cplcgWCgAHm,cplcgWpgAcHm,cplcgWpgWphh,cplcgZgWpHm,            & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm,GcplAhHmcHm,             & 
& GcpletIHmcHm,GcplhhHmcHm,GcplAhHmVWp,GcplAhcHmcVWp,GcpletIHmVWp,GcpletIcHmcVWp,        & 
& GcplhhHmVWp,GcplhhcHmcVWp,GcplHmcHmVP,GcplHmcHmVZ,GcplHmVPVWp,GcplHmVWpVZ,             & 
& GcplcHmcVWpVP,GcplcHmcVWpVZ,GcplcFuFdHmL,GcplcFuFdHmR,GcplFvFeHmL,GcplFvFeHmR,         & 
& GcplcFdFucHmL,GcplcFdFucHmR,GcplcFeFvcHmL,GcplcFeFvcHmR,dg1,dg2,dg3,depsU,             & 
& dYu,depsD,depsE,dYd,dYe,dYh,dmH2,dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,             & 
& dlam5,dlam6,dmh,dlam9,dlam8,dlamh,dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,             & 
& dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,              & 
& Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,ctcplAhAhAh,ctcplAhAhetI,   & 
& ctcplAhAhhh,ctcplAhetIetI,ctcplAhetIhh,ctcplAhhhhh,ctcplAhHmcHm,ctcpletIetIetI,        & 
& ctcpletIetIhh,ctcpletIhhhh,ctcpletIHmcHm,ctcplhhhhhh,ctcplhhHmcHm,ctcplAhhhVZ,         & 
& ctcplAhHmVWp,ctcplAhcHmcVWp,ctcpletIhhVZ,ctcpletIHmVWp,ctcpletIcHmcVWp,ctcplhhHmVWp,   & 
& ctcplhhcHmcVWp,ctcplHmcHmVP,ctcplHmcHmVZ,ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplHmVPVWp,      & 
& ctcplHmVWpVZ,ctcplcHmcVWpVP,ctcplcHmcVWpVZ,ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,  & 
& ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,   & 
& ctcplcFdFdetIL,ctcplcFdFdetIR,ctcplcFeFeetIL,ctcplcFeFeetIR,ctcplcFuFuetIL,            & 
& ctcplcFuFuetIR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHmL,ctcplcFuFdHmR,ctcplFvFeHmL,   & 
& ctcplFvFeHmR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHmL,   & 
& ctcplcFdFucHmR,ctcplcFeFvcHmL,ctcplcFeFvcHmR,ctcplcFdFdVGL,ctcplcFdFdVGR,              & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFuFdcVWpL,               & 
& ctcplcFuFdcVWpR,ctcplFvFecVWpL,ctcplFvFecVWpR,ctcplcFeFeVPL,ctcplcFeFeVPR,             & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFdFuVWpL,ctcplcFdFuVWpR,ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplFvFvVZL,ctcplFvFvVZR,   & 
& ctcplcFeFvVWpL,ctcplcFeFvVWpR,MLambda,deltaM,kont)

Implicit None 
Real(dp),Intent(inout) :: g1,g2,g3,lam5

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(inout) :: v,vv

Complex(dp),Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh(2),            & 
& cplAhAhetIetI,cplAhAhetIhh(2),cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhetIetIetI,       & 
& cplAhetIetIhh(2),cplAhetIhhhh(2,2),cplAhetIHmcHm(3,3),cplAhhhhhhh(2,2,2),              & 
& cplAhhhHmcHm(2,3,3),cpletIetIetIetI,cpletIetIetIhh(2),cpletIetIhhhh(2,2),              & 
& cpletIetIHmcHm(3,3),cpletIhhhhhh(2,2,2),cpletIhhHmcHm(2,3,3),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3),cplAhhhVZ(2),cplAhHmVWp(3),               & 
& cplAhcHmcVWp(3),cpletIhhVZ(2),cpletIHmVWp(3),cpletIcHmcVWp(3),cplhhHmVWp(2,3),         & 
& cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),        & 
& cplHmVPVWp(3),cplHmVWpVZ(3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhcVWpVWp,            & 
& cplAhAhVZVZ,cplAhHmVPVWp(3),cplAhHmVWpVZ(3),cplAhcHmcVWpVP(3),cplAhcHmcVWpVZ(3),       & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp(3),cpletIHmVWpVZ(3),cpletIcHmcVWpVP(3),   & 
& cpletIcHmcVWpVZ(3),cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhHmVPVWp(2,3),             & 
& cplhhHmVWpVZ(2,3),cplhhcHmcVWpVP(2,3),cplhhcHmcVWpVZ(2,3),cplHmcHmVPVP(3,3),           & 
& cplHmcHmVPVZ(3,3),cplHmcHmcVWpVWp(3,3),cplHmcHmVZVZ(3,3),cplVGVGVG,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),      & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),& 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),              & 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),            & 
& cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),            & 
& cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),        & 
& cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3), & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplVGVGVGVG1,cplVGVGVGVG2,         & 
& cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,          & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,               & 
& cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,      & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,        & 
& cplcgWCgWCAh,cplcgWpgWpetI,cplcgWCgWCetI,cplcgZgAhh(2),cplcgWCgAHm(3),cplcgWpgAcHm(3), & 
& cplcgWpgWphh(2),cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgZgWCcHm(3),cplcgZgZhh(2),          & 
& cplcgWCgZHm(3),cplcgWpgZcHm(3)

Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MHmOS(3),MHm2OS(3),MFvOS(3),MFv2OS(3),MFdOS(3),MFd2OS(3),          & 
& MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,               & 
& MVZ2OS,MVWpOS,MVWp2OS,ZHOS(2,2),ZPOS(3,3)

Complex(dp),Intent(in) :: UVOS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Complex(dp) :: Pihh(2,2,2),DerPihh(2,2,2),PiHm(3,3,3),DerPiHm(3,3,3),SigmaLFv(3,3,3),SigmaSLFv(3,3,3),& 
& SigmaSRFv(3,3,3),SigmaRFv(3,3,3),DerSigmaLFv(3,3,3),DerSigmaSLFv(3,3,3),               & 
& DerSigmaSRFv(3,3,3),DerSigmaRFv(3,3,3),DerSigmaLirFv(3,3,3),DerSigmaSLirFv(3,3,3),     & 
& DerSigmaSRirFv(3,3,3),DerSigmaRirFv(3,3,3),SigmaLFd(3,3,3),SigmaSLFd(3,3,3),           & 
& SigmaSRFd(3,3,3),SigmaRFd(3,3,3),DerSigmaLFd(3,3,3),DerSigmaSLFd(3,3,3),               & 
& DerSigmaSRFd(3,3,3),DerSigmaRFd(3,3,3),DerSigmaLirFd(3,3,3),DerSigmaSLirFd(3,3,3),     & 
& DerSigmaSRirFd(3,3,3),DerSigmaRirFd(3,3,3),SigmaLFu(3,3,3),SigmaSLFu(3,3,3),           & 
& SigmaSRFu(3,3,3),SigmaRFu(3,3,3),DerSigmaLFu(3,3,3),DerSigmaSLFu(3,3,3),               & 
& DerSigmaSRFu(3,3,3),DerSigmaRFu(3,3,3),DerSigmaLirFu(3,3,3),DerSigmaSLirFu(3,3,3),     & 
& DerSigmaSRirFu(3,3,3),DerSigmaRirFu(3,3,3),SigmaLFe(3,3,3),SigmaSLFe(3,3,3),           & 
& SigmaSRFe(3,3,3),SigmaRFe(3,3,3),DerSigmaLFe(3,3,3),DerSigmaSLFe(3,3,3),               & 
& DerSigmaSRFe(3,3,3),DerSigmaRFe(3,3,3),DerSigmaLirFe(3,3,3),DerSigmaSLirFe(3,3,3),     & 
& DerSigmaSRirFe(3,3,3),DerSigmaRirFe(3,3,3),PiAh,DerPiAh,PietI,DerPietI,PiVG,           & 
& DerPiVG,PiVP,DerPiVP,PiVZ,DerPiVZ,PiVWp,DerPiVWp,PiVPlight0,DerPiVPlight0,             & 
& PiVPheavy0,DerPiVPheavy0,PiVPlightMZ,DerPiVPlightMZ,PiVPheavyMZ,DerPiVPheavyMZ,        & 
& PiVPVZ,DerPiVPVZ,PiVZVP,DerPiVZVP,PiVZAh,DerPiVZAh,PiAhVZ,DerPiAhVZ,PiVZetI,           & 
& DerPiVZetI,PietIVZ,DerPietIVZ,PiVZhh(2,2,2),DerPiVZhh(2,2,2),PihhVZ(2,2,2),            & 
& DerPihhVZ(2,2,2)

Complex(dp) :: PihhDR(2,2,2),DerPihhDR(2,2,2),PiHmDR(3,3,3),DerPiHmDR(3,3,3),SigmaLFvDR(3,3,3),      & 
& SigmaSLFvDR(3,3,3),SigmaSRFvDR(3,3,3),SigmaRFvDR(3,3,3),DerSigmaLFvDR(3,3,3),          & 
& DerSigmaSLFvDR(3,3,3),DerSigmaSRFvDR(3,3,3),DerSigmaRFvDR(3,3,3),DerSigmaLirFvDR(3,3,3),& 
& DerSigmaSLirFvDR(3,3,3),DerSigmaSRirFvDR(3,3,3),DerSigmaRirFvDR(3,3,3),SigmaLFdDR(3,3,3),& 
& SigmaSLFdDR(3,3,3),SigmaSRFdDR(3,3,3),SigmaRFdDR(3,3,3),DerSigmaLFdDR(3,3,3),          & 
& DerSigmaSLFdDR(3,3,3),DerSigmaSRFdDR(3,3,3),DerSigmaRFdDR(3,3,3),DerSigmaLirFdDR(3,3,3),& 
& DerSigmaSLirFdDR(3,3,3),DerSigmaSRirFdDR(3,3,3),DerSigmaRirFdDR(3,3,3),SigmaLFuDR(3,3,3),& 
& SigmaSLFuDR(3,3,3),SigmaSRFuDR(3,3,3),SigmaRFuDR(3,3,3),DerSigmaLFuDR(3,3,3),          & 
& DerSigmaSLFuDR(3,3,3),DerSigmaSRFuDR(3,3,3),DerSigmaRFuDR(3,3,3),DerSigmaLirFuDR(3,3,3),& 
& DerSigmaSLirFuDR(3,3,3),DerSigmaSRirFuDR(3,3,3),DerSigmaRirFuDR(3,3,3),SigmaLFeDR(3,3,3),& 
& SigmaSLFeDR(3,3,3),SigmaSRFeDR(3,3,3),SigmaRFeDR(3,3,3),DerSigmaLFeDR(3,3,3),          & 
& DerSigmaSLFeDR(3,3,3),DerSigmaSRFeDR(3,3,3),DerSigmaRFeDR(3,3,3),DerSigmaLirFeDR(3,3,3),& 
& DerSigmaSLirFeDR(3,3,3),DerSigmaSRirFeDR(3,3,3),DerSigmaRirFeDR(3,3,3),PiAhDR,         & 
& DerPiAhDR,PietIDR,DerPietIDR,PiVGDR,DerPiVGDR,PiVPDR,DerPiVPDR,PiVZDR,DerPiVZDR,       & 
& PiVWpDR,DerPiVWpDR,PiVPlight0DR,DerPiVPlight0DR,PiVPheavy0DR,DerPiVPheavy0DR,          & 
& PiVPlightMZDR,DerPiVPlightMZDR,PiVPheavyMZDR,DerPiVPheavyMZDR,PiVPVZDR,DerPiVPVZDR,    & 
& PiVZVPDR,DerPiVZVPDR,PiVZAhDR,DerPiVZAhDR,PiAhVZDR,DerPiAhVZDR,PiVZetIDR,              & 
& DerPiVZetIDR,PietIVZDR,DerPietIVZDR,PiVZhhDR(2,2,2),DerPiVZhhDR(2,2,2),PihhVZDR(2,2,2),& 
& DerPihhVZDR(2,2,2)

Complex(dp) :: PihhOS(2,2,2),DerPihhOS(2,2,2),PiHmOS(3,3,3),DerPiHmOS(3,3,3),SigmaLFvOS(3,3,3),      & 
& SigmaSLFvOS(3,3,3),SigmaSRFvOS(3,3,3),SigmaRFvOS(3,3,3),DerSigmaLFvOS(3,3,3),          & 
& DerSigmaSLFvOS(3,3,3),DerSigmaSRFvOS(3,3,3),DerSigmaRFvOS(3,3,3),DerSigmaLirFvOS(3,3,3),& 
& DerSigmaSLirFvOS(3,3,3),DerSigmaSRirFvOS(3,3,3),DerSigmaRirFvOS(3,3,3),SigmaLFdOS(3,3,3),& 
& SigmaSLFdOS(3,3,3),SigmaSRFdOS(3,3,3),SigmaRFdOS(3,3,3),DerSigmaLFdOS(3,3,3),          & 
& DerSigmaSLFdOS(3,3,3),DerSigmaSRFdOS(3,3,3),DerSigmaRFdOS(3,3,3),DerSigmaLirFdOS(3,3,3),& 
& DerSigmaSLirFdOS(3,3,3),DerSigmaSRirFdOS(3,3,3),DerSigmaRirFdOS(3,3,3),SigmaLFuOS(3,3,3),& 
& SigmaSLFuOS(3,3,3),SigmaSRFuOS(3,3,3),SigmaRFuOS(3,3,3),DerSigmaLFuOS(3,3,3),          & 
& DerSigmaSLFuOS(3,3,3),DerSigmaSRFuOS(3,3,3),DerSigmaRFuOS(3,3,3),DerSigmaLirFuOS(3,3,3),& 
& DerSigmaSLirFuOS(3,3,3),DerSigmaSRirFuOS(3,3,3),DerSigmaRirFuOS(3,3,3),SigmaLFeOS(3,3,3),& 
& SigmaSLFeOS(3,3,3),SigmaSRFeOS(3,3,3),SigmaRFeOS(3,3,3),DerSigmaLFeOS(3,3,3),          & 
& DerSigmaSLFeOS(3,3,3),DerSigmaSRFeOS(3,3,3),DerSigmaRFeOS(3,3,3),DerSigmaLirFeOS(3,3,3),& 
& DerSigmaSLirFeOS(3,3,3),DerSigmaSRirFeOS(3,3,3),DerSigmaRirFeOS(3,3,3),PiAhOS,         & 
& DerPiAhOS,PietIOS,DerPietIOS,PiVGOS,DerPiVGOS,PiVPOS,DerPiVPOS,PiVZOS,DerPiVZOS,       & 
& PiVWpOS,DerPiVWpOS,PiVPlight0OS,DerPiVPlight0OS,PiVPheavy0OS,DerPiVPheavy0OS,          & 
& PiVPlightMZOS,DerPiVPlightMZOS,PiVPheavyMZOS,DerPiVPheavyMZOS,PiVPVZOS,DerPiVPVZOS,    & 
& PiVZVPOS,DerPiVZVPOS,PiVZAhOS,DerPiVZAhOS,PiAhVZOS,DerPiAhVZOS,PiVZetIOS,              & 
& DerPiVZetIOS,PietIVZOS,DerPietIVZOS,PiVZhhOS(2,2,2),DerPiVZhhOS(2,2,2),PihhVZOS(2,2,2),& 
& DerPihhVZOS(2,2,2)

Real(dp), Intent(in) :: MLambda, deltaM 

Integer, Intent(out) :: kont 
Real(dp),Intent(out) :: dg1,dg2,dg3,dlam5,dv,dvv,dZH(2,2),dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp),Intent(out) :: depsU(3,3),dYu(3,3),depsD(3,3),depsE(3,3),dYd(3,3),dYe(3,3),dYh(3,3),dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam6,dmh,dlam9,dlam8,dlamh,dmu,              & 
& dlam10,dUV(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp),Intent(out) :: ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh(2,2),ZfHm(3,3),ZfVL(3,3),ZfDL(3,3),              & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Complex(dp),Intent(out) :: ctcplAhAhAh,ctcplAhAhetI,ctcplAhAhhh(2),ctcplAhetIetI,ctcplAhetIhh(2),ctcplAhhhhh(2,2),& 
& ctcplAhHmcHm(3,3),ctcpletIetIetI,ctcpletIetIhh(2),ctcpletIhhhh(2,2),ctcpletIHmcHm(3,3),& 
& ctcplhhhhhh(2,2,2),ctcplhhHmcHm(2,3,3),ctcplAhhhVZ(2),ctcplAhHmVWp(3),ctcplAhcHmcVWp(3),& 
& ctcpletIhhVZ(2),ctcpletIHmVWp(3),ctcpletIcHmcVWp(3),ctcplhhHmVWp(2,3),ctcplhhcHmcVWp(2,3),& 
& ctcplHmcHmVP(3,3),ctcplHmcHmVZ(3,3),ctcplhhcVWpVWp(2),ctcplhhVZVZ(2),ctcplHmVPVWp(3),  & 
& ctcplHmVWpVZ(3),ctcplcHmcVWpVP(3),ctcplcHmcVWpVZ(3),ctcplVGVGVG,ctcplcVWpVPVWp,        & 
& ctcplcVWpVWpVZ,ctcplcFdFdAhL(3,3),ctcplcFdFdAhR(3,3),ctcplcFeFeAhL(3,3),               & 
& ctcplcFeFeAhR(3,3),ctcplcFuFuAhL(3,3),ctcplcFuFuAhR(3,3),ctcplcFdFdetIL(3,3),          & 
& ctcplcFdFdetIR(3,3),ctcplcFeFeetIL(3,3),ctcplcFeFeetIR(3,3),ctcplcFuFuetIL(3,3),       & 
& ctcplcFuFuetIR(3,3),ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2),ctcplcFuFdHmL(3,3,3),    & 
& ctcplcFuFdHmR(3,3,3),ctcplFvFeHmL(3,3,3),ctcplFvFeHmR(3,3,3),ctcplcFeFehhL(3,3,2),     & 
& ctcplcFeFehhR(3,3,2),ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2),ctcplcFdFucHmL(3,3,3),  & 
& ctcplcFdFucHmR(3,3,3),ctcplcFeFvcHmL(3,3,3),ctcplcFeFvcHmR(3,3,3),ctcplcFdFdVGL(3,3),  & 
& ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),           & 
& ctcplcFdFdVZR(3,3),ctcplcFuFdcVWpL(3,3),ctcplcFuFdcVWpR(3,3),ctcplFvFecVWpL(3,3),      & 
& ctcplFvFecVWpR(3,3),ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),          & 
& ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),           & 
& ctcplcFuFuVPR(3,3),ctcplcFdFuVWpL(3,3),ctcplcFdFuVWpR(3,3),ctcplcFuFuVZL(3,3),         & 
& ctcplcFuFuVZR(3,3),ctcplFvFvVZL(3,3),ctcplFvFvVZR(3,3),ctcplcFeFvVWpL(3,3),            & 
& ctcplcFeFvVWpR(3,3)

Complex(dp),Intent(in) :: GcplAhHmcHm(3,3),GcpletIHmcHm(3,3),GcplhhHmcHm(2,3,3),GcplAhHmVWp(3),GcplAhcHmcVWp(3),& 
& GcpletIHmVWp(3),GcpletIcHmcVWp(3),GcplhhHmVWp(2,3),GcplhhcHmcVWp(2,3),GcplHmcHmVP(3,3),& 
& GcplHmcHmVZ(3,3),GcplHmVPVWp(3),GcplHmVWpVZ(3),GcplcHmcVWpVP(3),GcplcHmcVWpVZ(3),      & 
& GcplcFuFdHmL(3,3,3),GcplcFuFdHmR(3,3,3),GcplFvFeHmL(3,3,3),GcplFvFeHmR(3,3,3),         & 
& GcplcFdFucHmL(3,3,3),GcplcFdFucHmR(3,3,3),GcplcFeFvcHmL(3,3,3),GcplcFeFvcHmR(3,3,3)

Real(dp) ::  g1D(162) 
Real(dp) :: p2 
Logical :: TwoLoopRGEsave 
Real(dp) ::MVG,MVP,MVG2,MVP2
Complex(dp) ::  Tad1Loop(2)
Complex(dp) :: MatTad_hh(2,2)=0._dp 
Integer :: i1,i2,i3 

MVG = MLambda 
MVP = MLambda 
MVG2 = MLambda**2 
MVP2 = MLambda**2 

Call OneLoopTadpoleshh(v,vv,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cpletIetIhh,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,Tad1Loop(1:2))

Tad1Loop(1:2) = MatMul(ZH,Tad1Loop(1:2)) 
Tad1Loop(1) = Tad1Loop(1)/v 
Tad1Loop(2) = Tad1Loop(2)/vv 
Do i1=1,2
MatTad_hh(i1,i1) = Tad1Loop(0+ i1) 
End Do 
MatTad_hh = MatMul(MatMul(ZH,MatTad_hh),Transpose(ZH)) 
! Not working!! 
MatTad_hh= 0._dp
!--------------------------
!hh
!--------------------------
Do i1=1,2
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmcHm,cplhhHmVWp,      & 
& cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,cplhhhhHmcHm,             & 
& cplhhhhcVWpVWp,cplhhhhVZVZ,kont,Pihh(i1,:,:))

Pihh(i1,:,:) = Pihh(i1,:,:) + MatTad_hh
Call DerPi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,            & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmcHm,     & 
& cplhhHmVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,               & 
& cplhhhhHmcHm,cplhhhhcVWpVWp,cplhhhhVZVZ,kont,DerPihh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1Loophh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,            & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmcHm,     & 
& cplhhHmVWp,cplhhcVWpVWp,cplhhVZVZ,cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,               & 
& cplhhhhHmcHm,cplhhhhcVWpVWp,cplhhhhVZVZ,kont,DerPihhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1Loophh(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,           & 
& MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,cplAhAhhh,          & 
& cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmcHm,cplhhHmVWp,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplAhAhhhhh,cpletIetIhhhh,cplhhhhhhhh,cplhhhhHmcHm,cplhhhhcVWpVWp,cplhhhhVZVZ,         & 
& kont,DerPihhOS(i1,:,:))

DerPihh(i1,:,:) = DerPihh(i1,:,:)- DerPihhDR(i1,:,:) + DerPihhOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Hm
!--------------------------
Do i1=1,3
p2 = MHm2(i1)
Call Pi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,MFu,               & 
& MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHmcVWp,cplAhHmcHm,cpletIcHmcVWp,        & 
& cpletIHmcHm,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplcgZgWpHm,cplhhcHmcVWp,cplhhHmcHm,cplHmcHmVP,               & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm,cpletIetIHmcHm,cplhhhhHmcHm,         & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWpVWp,cplHmcHmVZVZ,kont,PiHm(i1,:,:))

Call DerPi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,MFu,            & 
& MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHmcVWp,cplAhHmcHm,cpletIcHmcVWp,        & 
& cpletIHmcHm,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplcgZgWpHm,cplhhcHmcVWp,cplhhHmcHm,cplHmcHmVP,               & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm,cpletIetIHmcHm,cplhhhhHmcHm,         & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWpVWp,cplHmcHmVZVZ,kont,DerPiHm(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopHm(p2,MVWp,MVWp2,MAh,MAh2,MHm,MHm2,MetI,MetI2,MFd,MFd2,MFu,            & 
& MFu2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,cplAhcHmcVWp,cplAhHmcHm,cpletIcHmcVWp,        & 
& cpletIHmcHm,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWCcHm,          & 
& cplcgWCgZHm,cplcgWpgZcHm,cplcgZgWpHm,cplhhcHmcVWp,cplhhHmcHm,cplHmcHmVP,               & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm,cpletIetIHmcHm,cplhhhhHmcHm,         & 
& cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWpVWp,cplHmcHmVZVZ,kont,DerPiHmDR(i1,:,:))

p2 =MHm2OS(i1)
Call DerPi1LoopHm(p2,MVWpOS,MVWp2OS,MAhOS,MAh2OS,MHmOS,MHm2OS,MetIOS,MetI2OS,         & 
& MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MFvOS,MFv2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,         & 
& cplAhcHmcVWp,cplAhHmcHm,cpletIcHmcVWp,cpletIHmcHm,cplcFdFucHmL,cplcFdFucHmR,           & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplcgZgWpHm,           & 
& cplhhcHmcVWp,cplhhHmcHm,cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,               & 
& cplAhAhHmcHm,cpletIetIHmcHm,cplhhhhHmcHm,cplHmHmcHmcHm,cplHmcHmVPVP,cplHmcHmcVWpVWp,   & 
& cplHmcHmVZVZ,kont,DerPiHmOS(i1,:,:))

DerPiHm(i1,:,:) = DerPiHm(i1,:,:)- DerPiHmDR(i1,:,:) + DerPiHmOS(i1,:,:)
IRdivonly=.False. 
End if
End do


!--------------------------
!Fv
!--------------------------
Do i1=1,3
p2 = MFv2(i1)
Call Sigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,cplFvFecVWpL,     & 
& cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,    & 
& cplcFeFvcHmL,cplcFeFvcHmR,SigmaLFv(i1,:,:),SigmaRFv(i1,:,:),SigmaSLFv(i1,:,:)          & 
& ,SigmaSRFv(i1,:,:))

Call DerSigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,               & 
& cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,    & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,DerSigmaLFv(i1,:,:),DerSigmaRFv(i1,:,:)         & 
& ,DerSigmaSLFv(i1,:,:),DerSigmaSRFv(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFv(p2,MVWp,MVWp2,MFe,MFe2,MHm,MHm2,MVZ,MVZ2,MFv,MFv2,               & 
& cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,    & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,DerSigmaLFvDR(i1,:,:),DerSigmaRFvDR(i1,:,:)     & 
& ,DerSigmaSLFvDR(i1,:,:),DerSigmaSRFvDR(i1,:,:))

p2 =MFv2OS(i1)
Call DerSigma1LoopFv(p2,MVWpOS,MVWp2OS,MFeOS,MFe2OS,MHmOS,MHm2OS,MVZOS,               & 
& MVZ2OS,MFvOS,MFv2OS,cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,        & 
& cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,DerSigmaLFvOS(i1,:,:)   & 
& ,DerSigmaRFvOS(i1,:,:),DerSigmaSLFvOS(i1,:,:),DerSigmaSRFvOS(i1,:,:))

DerSigmaLFv(i1,:,:) = DerSigmaLFv(i1,:,:) - DerSigmaLFvDR(i1,:,:)! + DerSigmaLFvOS(i1,:,:)
DerSigmaRFv(i1,:,:) = DerSigmaRFv(i1,:,:) - DerSigmaRFvDR(i1,:,:)! + DerSigmaRFvOS(i1,:,:)
DerSigmaSLFv(i1,:,:) = DerSigmaSLFv(i1,:,:) - DerSigmaSLFvDR(i1,:,:)! + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRFv(i1,:,:) = DerSigmaSRFv(i1,:,:) - DerSigmaSRFvDR(i1,:,:)! + DerSigmaSRFvOS(i1,:,:)
DerSigmaLirFv(i1,:,:) =  + DerSigmaLFvOS(i1,:,:)
DerSigmaRirFv(i1,:,:) =  + DerSigmaRFvOS(i1,:,:)
DerSigmaSLirFv(i1,:,:) = + DerSigmaSLFvOS(i1,:,:)
DerSigmaSRirFv(i1,:,:) = + DerSigmaSRFvOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFv(i1,:,:) =  0._dp
DerSigmaRirFv(i1,:,:) =  0._dp
DerSigmaSLirFv(i1,:,:) = 0._dp
DerSigmaSRirFv(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fd
!--------------------------
Do i1=1,3
p2 =MFd2(i1)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFu,MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,            & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,           & 
& SigmaLFd(i1,:,:),SigmaRFd(i1,:,:),SigmaSLFd(i1,:,:),SigmaSRFd(i1,:,:))

Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,               & 
& MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,           & 
& DerSigmaLFd(i1,:,:),DerSigmaRFd(i1,:,:),DerSigmaSLFd(i1,:,:),DerSigmaSRFd(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,               & 
& MHm,MHm2,MFu,MFu2,MVWp,MVWp2,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,           & 
& DerSigmaLFdDR(i1,:,:),DerSigmaRFdDR(i1,:,:),DerSigmaSLFdDR(i1,:,:),DerSigmaSRFdDR(i1,:,:))

p2 =MFd2OS(i1)
Call DerSigma1LoopFd(p2,MFdOS,MFd2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MhhOS,               & 
& Mhh2OS,MVZOS,MVZ2OS,MHmOS,MHm2OS,MFuOS,MFu2OS,MVWpOS,MVWp2OS,cplcFdFdAhL,              & 
& cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,              & 
& cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,DerSigmaLFdOS(i1,:,:),DerSigmaRFdOS(i1,:,:)     & 
& ,DerSigmaSLFdOS(i1,:,:),DerSigmaSRFdOS(i1,:,:))

DerSigmaLFd(i1,:,:) = DerSigmaLFd(i1,:,:) - DerSigmaLFdDR(i1,:,:)! + DerSigmaLFdOS(i1,:,:)
DerSigmaRFd(i1,:,:) = DerSigmaRFd(i1,:,:) - DerSigmaRFdDR(i1,:,:)! + DerSigmaRFdOS(i1,:,:)
DerSigmaSLFd(i1,:,:) = DerSigmaSLFd(i1,:,:) - DerSigmaSLFdDR(i1,:,:)! + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRFd(i1,:,:) = DerSigmaSRFd(i1,:,:) - DerSigmaSRFdDR(i1,:,:)! + DerSigmaSRFdOS(i1,:,:)
DerSigmaLirFd(i1,:,:) = + DerSigmaLFdOS(i1,:,:)
DerSigmaRirFd(i1,:,:) = + DerSigmaRFdOS(i1,:,:)
DerSigmaSLirFd(i1,:,:) = + DerSigmaSLFdOS(i1,:,:)
DerSigmaSRirFd(i1,:,:) = + DerSigmaSRFdOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFd(i1,:,:) = 0._dp
DerSigmaRirFd(i1,:,:) = 0._dp
DerSigmaSLirFd(i1,:,:) = 0._dp
DerSigmaSRirFd(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fu
!--------------------------
Do i1=1,3
p2 =MFu2(i1)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,MFd2,MHm,            & 
& MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,              & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& SigmaLFu(i1,:,:),SigmaRFu(i1,:,:),SigmaSLFu(i1,:,:),SigmaSRFu(i1,:,:))

Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,MFd2,             & 
& MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,          & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& DerSigmaLFu(i1,:,:),DerSigmaRFu(i1,:,:),DerSigmaSLFu(i1,:,:),DerSigmaSRFu(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MetI,MetI2,MVWp,MVWp2,MFd,MFd2,             & 
& MHm,MHm2,Mhh,Mhh2,MVZ,MVZ2,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,          & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& DerSigmaLFuDR(i1,:,:),DerSigmaRFuDR(i1,:,:),DerSigmaSLFuDR(i1,:,:),DerSigmaSRFuDR(i1,:,:))

p2 =MFu2OS(i1)
Call DerSigma1LoopFu(p2,MFuOS,MFu2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVWpOS,              & 
& MVWp2OS,MFdOS,MFd2OS,MHmOS,MHm2OS,MhhOS,Mhh2OS,MVZOS,MVZ2OS,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,         & 
& cplcFuFdHmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,DerSigmaLFuOS(i1,:,:),DerSigmaRFuOS(i1,:,:)        & 
& ,DerSigmaSLFuOS(i1,:,:),DerSigmaSRFuOS(i1,:,:))

DerSigmaLFu(i1,:,:) = DerSigmaLFu(i1,:,:) - DerSigmaLFuDR(i1,:,:)! + DerSigmaLFuOS(i1,:,:)
DerSigmaRFu(i1,:,:) = DerSigmaRFu(i1,:,:) - DerSigmaRFuDR(i1,:,:)! + DerSigmaRFuOS(i1,:,:)
DerSigmaSLFu(i1,:,:) = DerSigmaSLFu(i1,:,:) - DerSigmaSLFuDR(i1,:,:)! + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRFu(i1,:,:) = DerSigmaSRFu(i1,:,:) - DerSigmaSRFuDR(i1,:,:)! + DerSigmaSRFuOS(i1,:,:)
DerSigmaLirFu(i1,:,:) = + DerSigmaLFuOS(i1,:,:)
DerSigmaRirFu(i1,:,:) = + DerSigmaRFuOS(i1,:,:)
DerSigmaSLirFu(i1,:,:) = + DerSigmaSLFuOS(i1,:,:)
DerSigmaSRirFu(i1,:,:) = + DerSigmaSRFuOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFu(i1,:,:) = 0._dp
DerSigmaRirFu(i1,:,:) = 0._dp
DerSigmaSLirFu(i1,:,:) = 0._dp
DerSigmaSRirFu(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Fe
!--------------------------
Do i1=1,3
p2 =MFe2(i1)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,MHm,              & 
& MHm2,MFv,MFv2,MVWp,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,            & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,SigmaLFe(i1,:,:),SigmaRFe(i1,:,:)  & 
& ,SigmaSLFe(i1,:,:),SigmaSRFe(i1,:,:))

Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,               & 
& MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,DerSigmaLFe(i1,:,:),               & 
& DerSigmaRFe(i1,:,:),DerSigmaSLFe(i1,:,:),DerSigmaSRFe(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerSigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,               & 
& MHm,MHm2,MFv,MFv2,MVWp,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,        & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,DerSigmaLFeDR(i1,:,:)              & 
& ,DerSigmaRFeDR(i1,:,:),DerSigmaSLFeDR(i1,:,:),DerSigmaSRFeDR(i1,:,:))

p2 =MFe2OS(i1)
Call DerSigma1LoopFe(p2,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MhhOS,               & 
& Mhh2OS,MVZOS,MVZ2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MVWpOS,MVWp2OS,cplcFeFeAhL,              & 
& cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,            & 
& cplcFeFvVWpR,DerSigmaLFeOS(i1,:,:),DerSigmaRFeOS(i1,:,:),DerSigmaSLFeOS(i1,:,:)        & 
& ,DerSigmaSRFeOS(i1,:,:))

DerSigmaLFe(i1,:,:) = DerSigmaLFe(i1,:,:) - DerSigmaLFeDR(i1,:,:)! + DerSigmaLFeOS(i1,:,:)
DerSigmaRFe(i1,:,:) = DerSigmaRFe(i1,:,:) - DerSigmaRFeDR(i1,:,:)! + DerSigmaRFeOS(i1,:,:)
DerSigmaSLFe(i1,:,:) = DerSigmaSLFe(i1,:,:) - DerSigmaSLFeDR(i1,:,:)! + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRFe(i1,:,:) = DerSigmaSRFe(i1,:,:) - DerSigmaSRFeDR(i1,:,:)! + DerSigmaSRFeOS(i1,:,:)
DerSigmaLirFe(i1,:,:) = + DerSigmaLFeOS(i1,:,:)
DerSigmaRirFe(i1,:,:) = + DerSigmaRFeOS(i1,:,:)
DerSigmaSLirFe(i1,:,:) = + DerSigmaSLFeOS(i1,:,:)
DerSigmaSRirFe(i1,:,:) = + DerSigmaSRFeOS(i1,:,:)
IRdivonly=.False. 
Else
DerSigmaLirFe(i1,:,:) = 0._dp
DerSigmaRirFe(i1,:,:) = 0._dp
DerSigmaSLirFe(i1,:,:) = 0._dp
DerSigmaSRirFe(i1,:,:) = 0._dp
End if
End do


!--------------------------
!Ah
!--------------------------
p2 = MAh2
Call Pi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,               & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,PiAh)

Call DerPi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,          & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,DerPiAh)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopAh(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,          & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,    & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplAhAhAhAh,       & 
& cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,DerPiAhDR)

p2 = MAh2OS
Call DerPi1LoopAh(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MhhOS,Mhh2OS,MFdOS,MFd2OS,           & 
& MFeOS,MFe2OS,MFuOS,MFu2OS,MVZOS,MVZ2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,cplAhAhAh,          & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,GcplAhHmcHm,GcplAhHmVWp,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,               & 
& cplAhAhHmcHm,cplAhAhcVWpVWp,cplAhAhVZVZ,kont,DerPiAhOS)

DerPiAh = DerPiAh-DerPiAhDR + DerPiAhOS
IRdivonly=.False. 
End if 
!--------------------------
!etI
!--------------------------
p2 = MetI2
Call Pi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,            & 
& cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,& 
& cpletIetIVZVZ,kont,PietI)

Call DerPi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,      & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,            & 
& cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,& 
& cpletIetIVZVZ,kont,DerPietI)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopetI(p2,MAh,MAh2,MetI,MetI2,Mhh,Mhh2,MFd,MFd2,MFe,MFe2,MFu,             & 
& MFu2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cpletIetIetI,      & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,            & 
& cpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,& 
& cpletIetIVZVZ,kont,DerPietIDR)

p2 = MetI2OS
Call DerPi1LoopetI(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MhhOS,Mhh2OS,MFdOS,MFd2OS,          & 
& MFeOS,MFe2OS,MFuOS,MFu2OS,MVZOS,MVZ2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,cplAhAhetI,         & 
& cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,             & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,GcpletIHmcHm,GcpletIHmVWp,cplAhAhetIetI,cpletIetIetIetI,         & 
& cpletIetIhhhh,cpletIetIHmcHm,cpletIetIcVWpVWp,cpletIetIVZVZ,kont,DerPietIOS)

DerPietI = DerPietI-DerPietIDR + DerPietIOS
IRdivonly=.False. 
End if 
!--------------------------
!VG
!--------------------------
p2 = MVG2
Call Pi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,              & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,PiVG)

Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,DerPiVG)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVG(p2,MFd,MFd2,MFu,MFu2,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,               & 
& kont,DerPiVGDR)

p2 = 0.
Call DerPi1LoopVG(p2,MFdOS,MFd2OS,MFuOS,MFu2OS,cplcFdFdVGL,cplcFdFdVGR,               & 
& cplcFuFuVGL,cplcFuFuVGR,cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,   & 
& kont,DerPiVGOS)

DerPiVG = DerPiVG-DerPiVGDR + DerPiVGOS
IRdivonly=.False. 
End if 
!--------------------------
!VP
!--------------------------
p2 = MVP2
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVP)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPDR)

p2 = 0.
Call DerPi1LoopVP(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHmOS,MHm2OS,             & 
& MVWpOS,MVWp2OS,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,            & 
& cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,GcplHmcHmVP,GcplHmVPVWp,cplcVWpVPVWp,            & 
& cplHmcHmVPVP,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPOS)

DerPiVP = DerPiVP-DerPiVPDR + DerPiVPOS
IRdivonly=.False. 
End if 
!--------------------------
!VZ
!--------------------------
p2 = MVZ2
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,            & 
& MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,    & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,    & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,   & 
& cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,PiVZ)

Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& kont,DerPiVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& kont,DerPiVZDR)

p2 = MVZ2OS
Call DerPi1LoopVZ(p2,MhhOS,Mhh2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,           & 
& MFeOS,MFe2OS,MFuOS,MFu2OS,MFvOS,MFv2OS,MVZOS,MVZ2OS,MHmOS,MHm2OS,MVWpOS,               & 
& MVWp2OS,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,          & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,               & 
& cplhhVZVZ,GcplHmcHmVZ,GcplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,cpletIetIVZVZ,              & 
& cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,              & 
& kont,DerPiVZOS)

DerPiVZ = DerPiVZ-DerPiVZDR + DerPiVZOS
IRdivonly=.False. 
End if 
!--------------------------
!VWp
!--------------------------
p2 = MVWp2
Call Pi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,MFv2,           & 
& MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,        & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiVWp)

Call DerPi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,             & 
& MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,   & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVWp)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVWp(p2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,             & 
& MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,   & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,               & 
& DerPiVWpDR)

p2 = MVWp2OS
Call DerPi1LoopVWp(p2,MHmOS,MHm2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MFuOS,MFu2OS,          & 
& MFdOS,MFd2OS,MFvOS,MFv2OS,MFeOS,MFe2OS,MhhOS,Mhh2OS,MVWpOS,MVWp2OS,MVZOS,              & 
& MVZ2OS,GcplAhcHmcVWp,GcpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,          & 
& cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,GcplhhcHmcVWp,    & 
& cplhhcVWpVWp,GcplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,GcplcHmcVWpVZ,cplAhAhcVWpVWp,     & 
& cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,       & 
& cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpcVWpVWpVWp1,              & 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,DerPiVWpOS)

DerPiVWp = DerPiVWp-DerPiVWpDR + DerPiVWpOS
IRdivonly=.False. 
End if 
!--------------------------
! Additional Self-Energies for Photon
!--------------------------
p2 = 0._dp
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPlight0)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPlight0)

OnlyLightStates = .False. 
p2 = 0._dp
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPheavy0)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPheavy0)

OnlyHeavyStates = .False. 
p2 = MVZ2
OnlyLightStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPlightMZ)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPlightMZ)

OnlyLightStates = .False. 
p2 = MVZ2
OnlyHeavyStates = .True. 
Call Pi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,         & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,PiVPheavyMZ)

Call DerPi1LoopVP(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,DerPiVPheavyMZ)

OnlyHeavyStates = .False. 
!--------------------------
!VP
!--------------------------
p2 = MVZ2
Call Pi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,PiVPVZ)

Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,DerPiVPVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,DerPiVPVZDR)

p2 =MVZ2OS
Call DerPi1LoopVPVZ(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHmOS,MHm2OS,           & 
& MVWpOS,MVWp2OS,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,GcplcHmcVWpVP,         & 
& GcplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,            & 
& cplcVWpVWpVZ,GcplHmcHmVP,cplHmcHmVPVZ,GcplHmcHmVZ,GcplHmVPVWp,GcplHmVWpVZ,             & 
& kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
p2 = 0._dp 
Call Pi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,PiVZVP)

Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,DerPiVZVP)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVPVZ(p2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,    & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,DerPiVPVZDR)

p2 = 0._dp 
Call DerPi1LoopVPVZ(p2,MFdOS,MFd2OS,MFeOS,MFe2OS,MFuOS,MFu2OS,MHmOS,MHm2OS,           & 
& MVWpOS,MVWp2OS,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,            & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,GcplcHmcVWpVP,         & 
& GcplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,            & 
& cplcVWpVWpVZ,GcplHmcHmVP,cplHmcHmVPVZ,GcplHmcHmVZ,GcplHmVPVWp,GcplHmVWpVZ,             & 
& kont,DerPiVPVZOS)

DerPiVPVZ = DerPiVPVZ- DerPiVPVZDR + DerPiVPVZOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
p2 = MAh2
Call Pi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,               & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,         & 
& cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ,          & 
& cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,PiVZAh)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,         & 
& cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ,          & 
& cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiVZAh)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,         & 
& cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ,          & 
& cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiVZAhDR)

p2 =MAh2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,         & 
& MFuOS,MFu2OS,MhhOS,Mhh2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,cplAhAhhh,          & 
& GcplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,GcplAhHmcHm,GcplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,             & 
& cplcgWpgWpAh,cplcgWpgWpVZ,GcplcHmcVWpVZ,cpletIhhVZ,cplhhVZVZ,GcplHmcHmVZ,              & 
& GcplHmVWpVZ,kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
p2 = MVZ2
Call Pi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,               & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,         & 
& cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ,          & 
& cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,PiAhVZ)

Call DerPi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,         & 
& cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ,          & 
& cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiAhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZAh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhhh,cplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,         & 
& cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,     & 
& cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,cplcgWpgWpAh,cplcgWpgWpVZ,cplcHmcVWpVZ,          & 
& cpletIhhVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiVZAhDR)

p2 =MVZ2OS
Call DerPi1LoopVZAh(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,         & 
& MFuOS,MFu2OS,MhhOS,Mhh2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,cplAhAhhh,          & 
& GcplAhcHmcVWp,cplAhetIhh,cplAhhhVZ,GcplAhHmcHm,GcplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCAh,cplcgWCgWCVZ,             & 
& cplcgWpgWpAh,cplcgWpgWpVZ,GcplcHmcVWpVZ,cpletIhhVZ,cplhhVZVZ,GcplHmcHmVZ,              & 
& GcplHmVWpVZ,kont,DerPiVZAhOS)

DerPiVZAh = DerPiVZAh- DerPiVZAhDR + DerPiVZAhOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
p2 = MetI2
Call Pi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,              & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,      & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,cplcgWCgWCVZ,          & 
& cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,cpletIhhVZ,          & 
& cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,PiVZetI)

Call DerPi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,           & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,        & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,               & 
& DerPiVZetI)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,           & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,        & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,               & 
& DerPiVZetIDR)

p2 =MetI2OS
Call DerPi1LoopVZetI(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,MFeOS,               & 
& MFe2OS,MFuOS,MFu2OS,MhhOS,Mhh2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,             & 
& cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,   & 
& cplcFeFeetIR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcgWCgWCetI,cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,GcplcHmcVWpVZ,       & 
& GcpletIcHmcVWp,cpletIetIhh,cpletIhhVZ,GcpletIHmcHm,GcpletIHmVWp,cplhhVZVZ,             & 
& GcplHmcHmVZ,GcplHmVWpVZ,kont,DerPiVZetIOS)

DerPiVZetI = DerPiVZetI- DerPiVZetIDR + DerPiVZetIOS
IRdivonly=.False. 
End if
p2 = MVZ2
Call Pi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,              & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,      & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,cplcFeFeVZR,             & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,cplcgWCgWCVZ,          & 
& cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,cpletIhhVZ,          & 
& cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,PietIVZ)

Call DerPi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,           & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,        & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,               & 
& DerPietIVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZetI(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,cplcFeFeetIR,cplcFeFeVZL,            & 
& cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCetI,           & 
& cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,cplcHmcVWpVZ,cpletIcHmcVWp,cpletIetIhh,        & 
& cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,kont,               & 
& DerPiVZetIDR)

p2 =MVZ2OS
Call DerPi1LoopVZetI(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,MFeOS,               & 
& MFe2OS,MFuOS,MFu2OS,MhhOS,Mhh2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,MVZOS,MVZ2OS,             & 
& cplAhetIhh,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeetIL,   & 
& cplcFeFeetIR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuVZL,            & 
& cplcFuFuVZR,cplcgWCgWCetI,cplcgWCgWCVZ,cplcgWpgWpetI,cplcgWpgWpVZ,GcplcHmcVWpVZ,       & 
& GcpletIcHmcVWp,cpletIetIhh,cpletIhhVZ,GcpletIHmcHm,GcpletIHmVWp,cplhhVZVZ,             & 
& GcplHmcHmVZ,GcplHmVWpVZ,kont,DerPiVZetIOS)

DerPiVZetI = DerPiVZetI- DerPiVZetIDR + DerPiVZetIOS
IRdivonly=.False. 
End if
!--------------------------
!VZ
!--------------------------
Do i1=1,2
p2 = Mhh2(i1)
Call Pi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,               & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,            & 
& cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,cplhhcHmcVWp,             & 
& cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,PiVZhh(i1,:,:))

Call DerPi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,            & 
& cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,cplhhcHmcVWp,             & 
& cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiVZhh(i1,:,:))

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,            & 
& cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,cplhhcHmcVWp,             & 
& cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiVZhhDR(i1,:,:))

p2 =Mhh2OS(i1)
Call DerPi1LoopVZhh(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,         & 
& MFuOS,MFu2OS,MhhOS,Mhh2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,cplAhhhhh,cplAhhhVZ,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,GcplcHmcVWpVZ,cplcVWpVWpVZ,        & 
& cpletIhhhh,cpletIhhVZ,GcplhhcHmcVWp,cplhhcVWpVWp,GcplhhHmcHm,GcplhhHmVWp,              & 
& GcplHmcHmVZ,GcplHmVWpVZ,kont,DerPiVZhhOS(i1,:,:))

DerPiVZhh(i1,:,:) = DerPiVZhh(i1,:,:)- DerPiVZhhDR(i1,:,:) + DerPiVZhhOS(i1,:,:)
IRdivonly=.False. 
End if
End do
p2 = MVZ2
Call Pi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,               & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,            & 
& cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,cplhhcHmcVWp,             & 
& cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,PihhVZ)

Call DerPi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,            & 
& cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,cplhhcHmcVWp,             & 
& cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,DerPihhVZ)

If ((ShiftIRdiv).and.(OSkinematics)) Then 
IRdivonly=.True. 
Call DerPi1LoopVZhh(p2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,Mhh,            & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,cplAhhhhh,cplAhhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,      & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,            & 
& cplcgWpgWpVZ,cplcHmcVWpVZ,cplcVWpVWpVZ,cpletIhhhh,cpletIhhVZ,cplhhcHmcVWp,             & 
& cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplHmcHmVZ,cplHmVWpVZ,kont,DerPiVZhhDR)

p2 =MVZ2OS
Call DerPi1LoopVZhh(p2,MAhOS,MAh2OS,MetIOS,MetI2OS,MFdOS,MFd2OS,MFeOS,MFe2OS,         & 
& MFuOS,MFu2OS,MhhOS,Mhh2OS,MHmOS,MHm2OS,MVWpOS,MVWp2OS,cplAhhhhh,cplAhhhVZ,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplcgWpgWphh,cplcgWpgWpVZ,GcplcHmcVWpVZ,cplcVWpVWpVZ,        & 
& cpletIhhhh,cpletIhhVZ,GcplhhcHmcVWp,cplhhcVWpVWp,GcplhhHmcHm,GcplhhHmVWp,              & 
& GcplHmcHmVZ,GcplHmVWpVZ,kont,DerPiVZhhOS)

DerPiVZhh = DerPiVZhh- DerPiVZhhDR + DerPiVZhhOS
IRdivonly=.False. 
End if
! -----------------------------------------------------------
! Calculate now all wave-function renormalisation constants 
! -----------------------------------------------------------


!  ######    VG    ###### 
ZfVG = -DerPiVG


!  ######    Ah    ###### 
ZfAh = -DerPiAh


!  ######    etI    ###### 
ZfetI = -DerPietI


!  ######    VP    ###### 
ZfVP = -DerPiVP


!  ######    VZ    ###### 
ZfVZ = -DerPiVZ


!  ######    VWp    ###### 
ZfVWp = -DerPiVWp


!  ######    hh    ###### 
Do i1=1,2
  Do i2=1,2
   If ((i1.eq.i2).or.(Mhh(i1).eq.Mhh(i2))) Then 
       Zfhh(i1,i2) = -DerPihh(i1,i1,i2)
   Else 
       Zfhh(i1,i2) = 2._dp/(Mhh2(i1)-Mhh2(i2))*Pihh(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    Hm    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MHm(i1).eq.MHm(i2))) Then 
       ZfHm(i1,i2) = -DerPiHm(i1,i1,i2)
   Else 
       ZfHm(i1,i2) = 2._dp/(MHm2(i1)-MHm2(i2))*PiHm(i2,i1,i2)
   End if 
  End Do 
End Do 


!  ######    VL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFv(i1).eq.MFv(i2))) Then 
     ZfVL(i1,i2) = -SigmaRFv(i2,i1,i2) &
      & -MFv2(i1)*(DerSigmaRFv(i2,i1,i2) + DerSigmaLFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRFv(i2,i1,i2)+DerSigmaSLFv(i2,i1,i2))
     If (OSkinematics) Then 
     ZfVL(i1,i2) = ZfVL(i1,i2) &
      & -MFv2OS(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFvOS(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     Else 
     ZfVL(i1,i2) = ZfVL(i1,i2) &
      & -MFv2(i1)*(DerSigmaRirFv(i2,i1,i2) + DerSigmaLirFv(i2,i1,i2))&
      & -MFv(i1)*(DerSigmaSRirFv(i2,i1,i2)+DerSigmaSLirFv(i2,i1,i2))
     End if 
   Else 
     ZfVL(i1,i2) = 2._dp/(MFv2(i1) - MFv2(i2))* &
      & (MFv2(i2)*SigmaRFv(i2,i1,i2) + MFv(i1)*MFv(i2)*SigmaLFv(i2,i1,i2) + MFv(i1)*SigmaSRFv(i2,i1,i2) + MFv(i2)*SigmaSLFv(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    DL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfDL(i1,i2) = -SigmaRFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaRFd(i2,i1,i2) + DerSigmaLFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRFd(i2,i1,i2)+DerSigmaSLFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfDL(i1,i2) = ZfDL(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     Else 
     ZfDL(i1,i2) = ZfDL(i1,i2) &
      & -MFd2(i1)*(DerSigmaRirFd(i2,i1,i2) + DerSigmaLirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSRirFd(i2,i1,i2)+DerSigmaSLirFd(i2,i1,i2))
     End if 
   Else 
     ZfDL(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*SigmaSRFd(i2,i1,i2) + MFd(i2)*SigmaSLFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    DR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFd(i1).eq.MFd(i2))) Then 
     ZfDR(i1,i2) = -SigmaLFd(i2,i1,i2) &
      & -MFd2(i1)*(DerSigmaLFd(i2,i1,i2) + DerSigmaRFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLFd(i2,i1,i2)+DerSigmaSRFd(i2,i1,i2))
     If (OSkinematics) Then 
     ZfDR(i1,i2) = ZfDR(i1,i2) &
      & -MFd2OS(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFdOS(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     Else 
     ZfDR(i1,i2) = ZfDR(i1,i2) &
      & -MFd2(i1)*(DerSigmaLirFd(i2,i1,i2) + DerSigmaRirFd(i2,i1,i2))&
      & -MFd(i1)*(DerSigmaSLirFd(i2,i1,i2)+DerSigmaSRirFd(i2,i1,i2))
     End if 
   Else 
     ZfDR(i1,i2) = 2._dp/(MFd2(i1) - MFd2(i2))* &
      & (MFd2(i2)*SigmaLFd(i2,i1,i2) + MFd(i1)*MFd(i2)*SigmaRFd(i2,i1,i2) + MFd(i1)*SigmaSLFd(i2,i1,i2) + MFd(i2)*SigmaSRFd(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    UL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfUL(i1,i2) = -SigmaRFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaRFu(i2,i1,i2) + DerSigmaLFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRFu(i2,i1,i2)+DerSigmaSLFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfUL(i1,i2) = ZfUL(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     Else 
     ZfUL(i1,i2) = ZfUL(i1,i2) &
      & -MFu2(i1)*(DerSigmaRirFu(i2,i1,i2) + DerSigmaLirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSRirFu(i2,i1,i2)+DerSigmaSLirFu(i2,i1,i2))
     End if 
   Else 
     ZfUL(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*SigmaSRFu(i2,i1,i2) + MFu(i2)*SigmaSLFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    UR    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFu(i1).eq.MFu(i2))) Then 
     ZfUR(i1,i2) = -SigmaLFu(i2,i1,i2) &
      & -MFu2(i1)*(DerSigmaLFu(i2,i1,i2) + DerSigmaRFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLFu(i2,i1,i2)+DerSigmaSRFu(i2,i1,i2))
     If (OSkinematics) Then 
     ZfUR(i1,i2) = ZfUR(i1,i2) &
      & -MFu2OS(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFuOS(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     Else 
     ZfUR(i1,i2) = ZfUR(i1,i2) &
      & -MFu2(i1)*(DerSigmaLirFu(i2,i1,i2) + DerSigmaRirFu(i2,i1,i2))&
      & -MFu(i1)*(DerSigmaSLirFu(i2,i1,i2)+DerSigmaSRirFu(i2,i1,i2))
     End if 
   Else 
     ZfUR(i1,i2) = 2._dp/(MFu2(i1) - MFu2(i2))* &
      & (MFu2(i2)*SigmaLFu(i2,i1,i2) + MFu(i1)*MFu(i2)*SigmaRFu(i2,i1,i2) + MFu(i1)*SigmaSLFu(i2,i1,i2) + MFu(i2)*SigmaSRFu(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    EL    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfEL(i1,i2) = -SigmaRFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaRFe(i2,i1,i2) + DerSigmaLFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRFe(i2,i1,i2)+DerSigmaSLFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfEL(i1,i2) = ZfEL(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     Else 
     ZfEL(i1,i2) = ZfEL(i1,i2) &
      & -MFe2(i1)*(DerSigmaRirFe(i2,i1,i2) + DerSigmaLirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSRirFe(i2,i1,i2)+DerSigmaSLirFe(i2,i1,i2))
     End if 
   Else 
     ZfEL(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*SigmaSRFe(i2,i1,i2) + MFe(i2)*SigmaSLFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    ER    ###### 
Do i1=1,3
  Do i2=1,3
   If ((i1.eq.i2).or.(MFe(i1).eq.MFe(i2))) Then 
     ZfER(i1,i2) = -SigmaLFe(i2,i1,i2) &
      & -MFe2(i1)*(DerSigmaLFe(i2,i1,i2) + DerSigmaRFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLFe(i2,i1,i2)+DerSigmaSRFe(i2,i1,i2))
     If (OSkinematics) Then 
     ZfER(i1,i2) = ZfER(i1,i2) &
      & -MFe2OS(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFeOS(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     Else 
     ZfER(i1,i2) = ZfER(i1,i2) &
      & -MFe2(i1)*(DerSigmaLirFe(i2,i1,i2) + DerSigmaRirFe(i2,i1,i2))&
      & -MFe(i1)*(DerSigmaSLirFe(i2,i1,i2)+DerSigmaSRirFe(i2,i1,i2))
     End if 
   Else 
     ZfER(i1,i2) = 2._dp/(MFe2(i1) - MFe2(i2))* &
      & (MFe2(i2)*SigmaLFe(i2,i1,i2) + MFe(i1)*MFe(i2)*SigmaRFe(i2,i1,i2) + MFe(i1)*SigmaSLFe(i2,i1,i2) + MFe(i2)*SigmaSRFe(i2,i1,i2))
   End if 
  End Do 
End Do 


!  ######    VPVZ    ###### 
ZfVPVZ = 2._dp*PiVPVZ/(MVP2-MVZ2 )
ZfVZVP = 2._dp*PiVZVP/(MVZ2-MVP2 )
! -----------------------------------------------------------
! Setting the Counter-Terms 
! -----------------------------------------------------------
! ----------- getting the divergent pieces ---------

 
 ! --- GUT normalize gauge couplings --- 
g1 = Sqrt(5._dp/3._dp)*g1 
! ----------------------- 
 
Call ParametersToG162(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,               & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,g1D)

TwoLoopRGEsave=TwoLoopRGE 
TwoLoopRGE=.False. 
Call rge162(162,0._dp,g1D,g1D) 
TwoLoopRGE=TwoLoopRGEsave 
Call GToParameters162(g1D,dg1,dg2,dg3,dlam1,dlam2,dlam4,dlam3,dlam7,dlam5,            & 
& dlam6,dlam9,dlam8,dlamh,dlam10,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmu,dmH2,             & 
& dmEt2,dm12,dmh,dv,dvv)


 
 ! --- Remove GUT-normalization of gauge couplings --- 
dg1 = Sqrt(3._dp/5._dp)*dg1 
! ----------------------- 
 

 
 ! --- Remove GUT-normalization of gauge couplings --- 
g1 = Sqrt(3._dp/5._dp)*g1 
! ----------------------- 
 
dg1 = 0.5_dp*divergence*dg1 
dg2 = 0.5_dp*divergence*dg2 
dg3 = 0.5_dp*divergence*dg3 
depsU = 0.5_dp*divergence*depsU 
dYu = 0.5_dp*divergence*dYu 
depsD = 0.5_dp*divergence*depsD 
depsE = 0.5_dp*divergence*depsE 
dYd = 0.5_dp*divergence*dYd 
dYe = 0.5_dp*divergence*dYe 
dYh = 0.5_dp*divergence*dYh 
dmH2 = 0.5_dp*divergence*dmH2 
dlam1 = 0.5_dp*divergence*dlam1 
dmEt2 = 0.5_dp*divergence*dmEt2 
dlam2 = 0.5_dp*divergence*dlam2 
dlam4 = 0.5_dp*divergence*dlam4 
dlam3 = 0.5_dp*divergence*dlam3 
dm12 = 0.5_dp*divergence*dm12 
dlam7 = 0.5_dp*divergence*dlam7 
dlam5 = 0.5_dp*divergence*dlam5 
dlam6 = 0.5_dp*divergence*dlam6 
dmh = 0.5_dp*divergence*dmh 
dlam9 = 0.5_dp*divergence*dlam9 
dlam8 = 0.5_dp*divergence*dlam8 
dlamh = 0.5_dp*divergence*dlamh 
dmu = 0.5_dp*divergence*dmu 
dlam10 = 0.5_dp*divergence*dlam10 
dv = 0.5_dp*divergence*dv 
dvv = 0.5_dp*divergence*dvv 
dZH = 0._dp 
dZP = 0._dp 
dUV = 0._dp 
dZDL = 0._dp 
dZDR = 0._dp 
dZUL = 0._dp 
dZUR = 0._dp 
dZEL = 0._dp 
dZER = 0._dp 
dSinTW = 0._dp 
dCosTW = 0._dp 
dTanTW = 0._dp 
If (CTinLoopDecays) Then 
End if 
 
dZDR = 0.25_dp*MatMul(ZfDR- Conjg(Transpose(ZfDR)),ZDR)
dZER = 0.25_dp*MatMul(ZfER- Conjg(Transpose(ZfER)),ZER)
dZUR = 0.25_dp*MatMul(ZfUR- Conjg(Transpose(ZfUR)),ZUR)
dZDL = 0.25_dp*MatMul(ZfDL- Conjg(Transpose(ZfDL)),ZDL)
dZEL = 0.25_dp*MatMul(ZfEL- Conjg(Transpose(ZfEL)),ZEL)
dZUL = 0.25_dp*MatMul(ZfUL- Conjg(Transpose(ZfUL)),ZUL)
dUV = 0.25_dp*MatMul(ZfVL- Conjg(Transpose(ZfVL)),UV)
dZH = 0.25_dp*MatMul(Zfhh- Conjg(Transpose(Zfhh)),ZH)
dZP = 0.25_dp*MatMul(ZfHm- Conjg(Transpose(ZfHm)),ZP)


! -----------------------------------------------------------
! Calculating the CT vertices 
! -----------------------------------------------------------
Call CalculateCouplingCT(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,lam10,              & 
& ZP,lam2,lam9,lam8,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,epsE,              & 
& epsU,Yh,UV,dlam6,dvv,dv,dlam1,dlam4,dlam3,dlam5,dZH,dlam7,dmu,dlam10,dZP,              & 
& dlam2,dlam9,dlam8,dg1,dg2,dSinTW,dCosTW,dTanTW,dg3,dYd,dZDL,dZDR,dYe,dZEL,             & 
& dZER,dYu,dZUL,dZUR,depsD,depsE,depsU,dYh,dUV,ctcplAhAhAh,ctcplAhAhetI,ctcplAhAhhh,     & 
& ctcplAhetIetI,ctcplAhetIhh,ctcplAhhhhh,ctcplAhHmcHm,ctcpletIetIetI,ctcpletIetIhh,      & 
& ctcpletIhhhh,ctcpletIHmcHm,ctcplhhhhhh,ctcplhhHmcHm,ctcplAhhhVZ,ctcplAhHmVWp,          & 
& ctcplAhcHmcVWp,ctcpletIhhVZ,ctcpletIHmVWp,ctcpletIcHmcVWp,ctcplhhHmVWp,ctcplhhcHmcVWp, & 
& ctcplHmcHmVP,ctcplHmcHmVZ,ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplHmVPVWp,ctcplHmVWpVZ,        & 
& ctcplcHmcVWpVP,ctcplcHmcVWpVZ,ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,               & 
& ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,   & 
& ctcplcFdFdetIL,ctcplcFdFdetIR,ctcplcFeFeetIL,ctcplcFeFeetIR,ctcplcFuFuetIL,            & 
& ctcplcFuFuetIR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHmL,ctcplcFuFdHmR,ctcplFvFeHmL,   & 
& ctcplFvFeHmR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHmL,   & 
& ctcplcFdFucHmR,ctcplcFeFvcHmL,ctcplcFeFvcHmR,ctcplcFdFdVGL,ctcplcFdFdVGR,              & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFuFdcVWpL,               & 
& ctcplcFuFdcVWpR,ctcplFvFecVWpL,ctcplFvFecVWpR,ctcplcFeFeVPL,ctcplcFeFeVPR,             & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFdFuVWpL,ctcplcFdFuVWpR,ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplFvFvVZL,ctcplFvFvVZR,   & 
& ctcplcFeFvVWpL,ctcplcFeFvVWpR)

End Subroutine WaveFunctionRenormalisation 
Subroutine CalculateOneLoopDecays(gP1LFu,gP1LFe,gP1LFd,gP1LFv,gP1Lhh,gP1LHm,          & 
& gP1LetI,MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,MFuOS,MFu2OS,              & 
& MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,MVWp2OS,ZHOS,             & 
& ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,v,vv,g1,g2,g3,lam1,lam2,lam4,            & 
& lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,            & 
& mEt2,m12,mh,epsI,deltaM,kont)

Implicit None 
Real(dp), Intent(in) :: epsI, deltaM 
Integer, Intent(inout) :: kont 
Real(dp) :: MLambda, em, gs, vSM, sinW2, g1SM, g2SM 
Integer :: divset, i1 
Complex(dp) :: divvalue, YuSM(3,3), YdSM(3,3), YeSM(3,3) 
Real(dp),Intent(inout) :: g1,g2,g3,lam5

Complex(dp),Intent(inout) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(inout) :: v,vv

Real(dp) :: dg1,dg2,dg3,dlam5,dv,dvv,dZH(2,2),dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp) :: depsU(3,3),dYu(3,3),depsD(3,3),depsE(3,3),dYd(3,3),dYe(3,3),dYh(3,3),dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam6,dmh,dlam9,dlam8,dlamh,dmu,              & 
& dlam10,dUV(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3),dZEL(3,3),dZER(3,3)

Complex(dp) :: ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh(2,2),ZfHm(3,3),ZfVL(3,3),ZfDL(3,3),              & 
& ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZVP

Real(dp),Intent(in) :: MhhOS(2),Mhh2OS(2),MHmOS(3),MHm2OS(3),MFvOS(3),MFv2OS(3),MFdOS(3),MFd2OS(3),          & 
& MFuOS(3),MFu2OS(3),MFeOS(3),MFe2OS(3),MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,               & 
& MVZ2OS,MVWpOS,MVWp2OS,ZHOS(2,2),ZPOS(3,3)

Complex(dp),Intent(in) :: UVOS(3,3),ZDLOS(3,3),ZDROS(3,3),ZULOS(3,3),ZUROS(3,3),ZELOS(3,3),ZEROS(3,3)

Real(dp) :: p2, q2, q2_save 
Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1(2),cplAhAhetIetI1,cplAhAhetIhh1(2),           & 
& cplAhAhhhhh1(2,2),cplAhAhHmcHm1(3,3),cplAhetIetIetI1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),& 
& cplAhetIHmcHm1(3,3),cplAhhhhhhh1(2,2,2),cplAhhhHmcHm1(2,3,3),cpletIetIetIetI1,         & 
& cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIetIHmcHm1(3,3),cpletIhhhhhh1(2,2,2),      & 
& cpletIhhHmcHm1(2,3,3),cplhhhhhhhh1(2,2,2,2),cplhhhhHmcHm1(2,2,3,3),cplHmHmcHmcHm1(3,3,3,3),& 
& cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhHmVPVWp1(3),cplAhHmVWpVZ1(3),cplAhcHmcVWpVP1(3),     & 
& cplAhcHmcVWpVZ1(3),cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),& 
& cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cplhhhhcVWpVWp1(2,2),cplhhhhVZVZ1(2,2),        & 
& cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),       & 
& cplHmcHmVPVP1(3,3),cplHmcHmVPVZ1(3,3),cplHmcHmcVWpVWp1(3,3),cplHmcHmVZVZ1(3,3),        & 
& cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,           & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpcVWpVWpVWp1Q,& 
& cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,             & 
& cplcVWpVWpVZVZ3Q

Complex(dp) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh(2),            & 
& cplAhAhetIetI,cplAhAhetIhh(2),cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhetIetIetI,       & 
& cplAhetIetIhh(2),cplAhetIhhhh(2,2),cplAhetIHmcHm(3,3),cplAhhhhhhh(2,2,2),              & 
& cplAhhhHmcHm(2,3,3),cpletIetIetIetI,cpletIetIetIhh(2),cpletIetIhhhh(2,2),              & 
& cpletIetIHmcHm(3,3),cpletIhhhhhh(2,2,2),cpletIhhHmcHm(2,3,3),cplhhhhhhhh(2,2,2,2),     & 
& cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3),cplAhhhVZ(2),cplAhHmVWp(3),               & 
& cplAhcHmcVWp(3),cpletIhhVZ(2),cpletIHmVWp(3),cpletIcHmcVWp(3),cplhhHmVWp(2,3),         & 
& cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),        & 
& cplHmVPVWp(3),cplHmVWpVZ(3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhcVWpVWp,            & 
& cplAhAhVZVZ,cplAhHmVPVWp(3),cplAhHmVWpVZ(3),cplAhcHmcVWpVP(3),cplAhcHmcVWpVZ(3),       & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp(3),cpletIHmVWpVZ(3),cpletIcHmcVWpVP(3),   & 
& cpletIcHmcVWpVZ(3),cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhHmVPVWp(2,3),             & 
& cplhhHmVWpVZ(2,3),cplhhcHmcVWpVP(2,3),cplhhcHmcVWpVZ(2,3),cplHmcHmVPVP(3,3),           & 
& cplHmcHmVPVZ(3,3),cplHmcHmcVWpVWp(3,3),cplHmcHmVZVZ(3,3),cplVGVGVG,cplcVWpVPVWp,       & 
& cplcVWpVWpVZ,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),      & 
& cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),& 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),              & 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),            & 
& cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),            & 
& cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),        & 
& cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),  & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3), & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplVGVGVGVG1,cplVGVGVGVG2,         & 
& cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,          & 
& cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,& 
& cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,               & 
& cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,      & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,        & 
& cplcgWCgWCAh,cplcgWpgWpetI,cplcgWCgWCetI,cplcgZgAhh(2),cplcgWCgAHm(3),cplcgWpgAcHm(3), & 
& cplcgWpgWphh(2),cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgZgWCcHm(3),cplcgZgZhh(2),          & 
& cplcgWCgZHm(3),cplcgWpgZcHm(3)

Complex(dp) :: ctcplAhAhAh,ctcplAhAhetI,ctcplAhAhhh(2),ctcplAhetIetI,ctcplAhetIhh(2),ctcplAhhhhh(2,2),& 
& ctcplAhHmcHm(3,3),ctcpletIetIetI,ctcpletIetIhh(2),ctcpletIhhhh(2,2),ctcpletIHmcHm(3,3),& 
& ctcplhhhhhh(2,2,2),ctcplhhHmcHm(2,3,3),ctcplAhhhVZ(2),ctcplAhHmVWp(3),ctcplAhcHmcVWp(3),& 
& ctcpletIhhVZ(2),ctcpletIHmVWp(3),ctcpletIcHmcVWp(3),ctcplhhHmVWp(2,3),ctcplhhcHmcVWp(2,3),& 
& ctcplHmcHmVP(3,3),ctcplHmcHmVZ(3,3),ctcplhhcVWpVWp(2),ctcplhhVZVZ(2),ctcplHmVPVWp(3),  & 
& ctcplHmVWpVZ(3),ctcplcHmcVWpVP(3),ctcplcHmcVWpVZ(3),ctcplVGVGVG,ctcplcVWpVPVWp,        & 
& ctcplcVWpVWpVZ,ctcplcFdFdAhL(3,3),ctcplcFdFdAhR(3,3),ctcplcFeFeAhL(3,3),               & 
& ctcplcFeFeAhR(3,3),ctcplcFuFuAhL(3,3),ctcplcFuFuAhR(3,3),ctcplcFdFdetIL(3,3),          & 
& ctcplcFdFdetIR(3,3),ctcplcFeFeetIL(3,3),ctcplcFeFeetIR(3,3),ctcplcFuFuetIL(3,3),       & 
& ctcplcFuFuetIR(3,3),ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2),ctcplcFuFdHmL(3,3,3),    & 
& ctcplcFuFdHmR(3,3,3),ctcplFvFeHmL(3,3,3),ctcplFvFeHmR(3,3,3),ctcplcFeFehhL(3,3,2),     & 
& ctcplcFeFehhR(3,3,2),ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2),ctcplcFdFucHmL(3,3,3),  & 
& ctcplcFdFucHmR(3,3,3),ctcplcFeFvcHmL(3,3,3),ctcplcFeFvcHmR(3,3,3),ctcplcFdFdVGL(3,3),  & 
& ctcplcFdFdVGR(3,3),ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),           & 
& ctcplcFdFdVZR(3,3),ctcplcFuFdcVWpL(3,3),ctcplcFuFdcVWpR(3,3),ctcplFvFecVWpL(3,3),      & 
& ctcplFvFecVWpR(3,3),ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),          & 
& ctcplcFeFeVZR(3,3),ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3),ctcplcFuFuVPL(3,3),           & 
& ctcplcFuFuVPR(3,3),ctcplcFdFuVWpL(3,3),ctcplcFdFuVWpR(3,3),ctcplcFuFuVZL(3,3),         & 
& ctcplcFuFuVZR(3,3),ctcplFvFvVZL(3,3),ctcplFvFvVZR(3,3),ctcplcFeFvVWpL(3,3),            & 
& ctcplcFeFvVWpR(3,3)

Complex(dp) :: ZRUZH(2,2),ZRUZP(3,3),ZRUVv(3,3),ZRUVd(3,3),ZRUUd(3,3),ZRUVu(3,3),ZRUUu(3,3),         & 
& ZRUVe(3,3),ZRUUe(3,3)

Complex(dp) :: ZcplAhAhAh,ZcplAhAhetI,ZcplAhAhhh(2),ZcplAhetIetI,ZcplAhetIhh(2),ZcplAhhhhh(2,2),     & 
& ZcplAhHmcHm(3,3),ZcpletIetIetI,ZcpletIetIhh(2),ZcpletIhhhh(2,2),ZcpletIHmcHm(3,3),     & 
& Zcplhhhhhh(2,2,2),ZcplhhHmcHm(2,3,3),ZcplAhAhAhAh,ZcplAhAhAhetI,ZcplAhAhAhhh(2),       & 
& ZcplAhAhetIetI,ZcplAhAhetIhh(2),ZcplAhAhhhhh(2,2),ZcplAhAhHmcHm(3,3),ZcplAhetIetIetI,  & 
& ZcplAhetIetIhh(2),ZcplAhetIhhhh(2,2),ZcplAhetIHmcHm(3,3),ZcplAhhhhhhh(2,2,2),          & 
& ZcplAhhhHmcHm(2,3,3),ZcpletIetIetIetI,ZcpletIetIetIhh(2),ZcpletIetIhhhh(2,2),          & 
& ZcpletIetIHmcHm(3,3),ZcpletIhhhhhh(2,2,2),ZcpletIhhHmcHm(2,3,3),Zcplhhhhhhhh(2,2,2,2), & 
& ZcplhhhhHmcHm(2,2,3,3),ZcplHmHmcHmcHm(3,3,3,3),ZcplAhhhVZ(2),ZcplAhHmVWp(3),           & 
& ZcplAhcHmcVWp(3),ZcpletIhhVZ(2),ZcpletIHmVWp(3),ZcpletIcHmcVWp(3),ZcplhhHmVWp(2,3),    & 
& ZcplhhcHmcVWp(2,3),ZcplHmcHmVP(3,3),ZcplHmcHmVZ(3,3),ZcplhhcVWpVWp(2),ZcplhhVZVZ(2),   & 
& ZcplHmVPVWp(3),ZcplHmVWpVZ(3),ZcplcHmcVWpVP(3),ZcplcHmcVWpVZ(3),ZcplAhAhcVWpVWp,       & 
& ZcplAhAhVZVZ,ZcplAhHmVPVWp(3),ZcplAhHmVWpVZ(3),ZcplAhcHmcVWpVP(3),ZcplAhcHmcVWpVZ(3),  & 
& ZcpletIetIcVWpVWp,ZcpletIetIVZVZ,ZcpletIHmVPVWp(3),ZcpletIHmVWpVZ(3),ZcpletIcHmcVWpVP(3),& 
& ZcpletIcHmcVWpVZ(3),ZcplhhhhcVWpVWp(2,2),ZcplhhhhVZVZ(2,2),ZcplhhHmVPVWp(2,3),         & 
& ZcplhhHmVWpVZ(2,3),ZcplhhcHmcVWpVP(2,3),ZcplhhcHmcVWpVZ(2,3),ZcplHmcHmVPVP(3,3),       & 
& ZcplHmcHmVPVZ(3,3),ZcplHmcHmcVWpVWp(3,3),ZcplHmcHmVZVZ(3,3),ZcplVGVGVG,ZcplcVWpVPVWp,  & 
& ZcplcVWpVWpVZ,ZcplcFdFdAhL(3,3),ZcplcFdFdAhR(3,3),ZcplcFeFeAhL(3,3),ZcplcFeFeAhR(3,3), & 
& ZcplcFuFuAhL(3,3),ZcplcFuFuAhR(3,3),ZcplcFdFdetIL(3,3),ZcplcFdFdetIR(3,3),             & 
& ZcplcFeFeetIL(3,3),ZcplcFeFeetIR(3,3),ZcplcFuFuetIL(3,3),ZcplcFuFuetIR(3,3),           & 
& ZcplcFdFdhhL(3,3,2),ZcplcFdFdhhR(3,3,2),ZcplcFuFdHmL(3,3,3),ZcplcFuFdHmR(3,3,3),       & 
& ZcplFvFeHmL(3,3,3),ZcplFvFeHmR(3,3,3),ZcplcFeFehhL(3,3,2),ZcplcFeFehhR(3,3,2),         & 
& ZcplcFuFuhhL(3,3,2),ZcplcFuFuhhR(3,3,2),ZcplcFdFucHmL(3,3,3),ZcplcFdFucHmR(3,3,3),     & 
& ZcplcFeFvcHmL(3,3,3),ZcplcFeFvcHmR(3,3,3),ZcplcFdFdVGL(3,3),ZcplcFdFdVGR(3,3),         & 
& ZcplcFdFdVPL(3,3),ZcplcFdFdVPR(3,3),ZcplcFdFdVZL(3,3),ZcplcFdFdVZR(3,3),               & 
& ZcplcFuFdcVWpL(3,3),ZcplcFuFdcVWpR(3,3),ZcplFvFecVWpL(3,3),ZcplFvFecVWpR(3,3),         & 
& ZcplcFeFeVPL(3,3),ZcplcFeFeVPR(3,3),ZcplcFeFeVZL(3,3),ZcplcFeFeVZR(3,3),               & 
& ZcplcFuFuVGL(3,3),ZcplcFuFuVGR(3,3),ZcplcFuFuVPL(3,3),ZcplcFuFuVPR(3,3),               & 
& ZcplcFdFuVWpL(3,3),ZcplcFdFuVWpR(3,3),ZcplcFuFuVZL(3,3),ZcplcFuFuVZR(3,3),             & 
& ZcplFvFvVZL(3,3),ZcplFvFvVZR(3,3),ZcplcFeFvVWpL(3,3),ZcplcFeFvVWpR(3,3),               & 
& ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,           & 
& ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,& 
& ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,             & 
& ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,ZcplcgWCgAcVWp,ZcplcgWpgWpVP,               & 
& ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,ZcplcgWCgWCVP,ZcplcgAgWCVWp,               & 
& ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,ZcplcgWpgWpAh,ZcplcgWCgWCAh,  & 
& ZcplcgWpgWpetI,ZcplcgWCgWCetI,ZcplcgZgAhh(2),ZcplcgWCgAHm(3),ZcplcgWpgAcHm(3),         & 
& ZcplcgWpgWphh(2),ZcplcgZgWpHm(3),ZcplcgWCgWChh(2),ZcplcgZgWCcHm(3),ZcplcgZgZhh(2)

Complex(dp) :: ZcplcgWCgZHm(3),ZcplcgWpgZcHm(3)

Complex(dp) :: GcplAhHmcHm(3,3),GcpletIHmcHm(3,3),GcplhhHmcHm(2,3,3),GcplAhHmVWp(3),GcplAhcHmcVWp(3),& 
& GcpletIHmVWp(3),GcpletIcHmcVWp(3),GcplhhHmVWp(2,3),GcplhhcHmcVWp(2,3),GcplHmcHmVP(3,3),& 
& GcplHmcHmVZ(3,3),GcplHmVPVWp(3),GcplHmVWpVZ(3),GcplcHmcVWpVP(3),GcplcHmcVWpVZ(3),      & 
& GcplcFuFdHmL(3,3,3),GcplcFuFdHmR(3,3,3),GcplFvFeHmL(3,3,3),GcplFvFeHmR(3,3,3),         & 
& GcplcFdFucHmL(3,3,3),GcplcFdFucHmR(3,3,3),GcplcFeFvcHmL(3,3,3),GcplcFeFvcHmR(3,3,3)

Complex(dp) :: GZcplAhHmcHm(3,3),GZcpletIHmcHm(3,3),GZcplhhHmcHm(2,3,3),GZcplAhHmVWp(3),             & 
& GZcplAhcHmcVWp(3),GZcpletIHmVWp(3),GZcpletIcHmcVWp(3),GZcplhhHmVWp(2,3),               & 
& GZcplhhcHmcVWp(2,3),GZcplHmcHmVP(3,3),GZcplHmcHmVZ(3,3),GZcplHmVPVWp(3),               & 
& GZcplHmVWpVZ(3),GZcplcHmcVWpVP(3),GZcplcHmcVWpVZ(3),GZcplcFuFdHmL(3,3,3),              & 
& GZcplcFuFdHmR(3,3,3),GZcplFvFeHmL(3,3,3),GZcplFvFeHmR(3,3,3),GZcplcFdFucHmL(3,3,3),    & 
& GZcplcFdFucHmR(3,3,3),GZcplcFeFvcHmL(3,3,3),GZcplcFeFvcHmR(3,3,3)

Complex(dp) :: GosZcplAhHmcHm(3,3),GosZcpletIHmcHm(3,3),GosZcplhhHmcHm(2,3,3),GosZcplAhHmVWp(3),     & 
& GosZcplAhcHmcVWp(3),GosZcpletIHmVWp(3),GosZcpletIcHmcVWp(3),GosZcplhhHmVWp(2,3),       & 
& GosZcplhhcHmcVWp(2,3),GosZcplHmcHmVP(3,3),GosZcplHmcHmVZ(3,3),GosZcplHmVPVWp(3),       & 
& GosZcplHmVWpVZ(3),GosZcplcHmcVWpVP(3),GosZcplcHmcVWpVZ(3),GosZcplcFuFdHmL(3,3,3),      & 
& GosZcplcFuFdHmR(3,3,3),GosZcplFvFeHmL(3,3,3),GosZcplFvFeHmR(3,3,3),GosZcplcFdFucHmL(3,3,3),& 
& GosZcplcFdFucHmR(3,3,3),GosZcplcFeFvcHmL(3,3,3),GosZcplcFeFvcHmR(3,3,3)

Real(dp), Intent(out) :: gP1LFu(3,27) 
Real(dp), Intent(out) :: gP1LFe(3,24) 
Real(dp), Intent(out) :: gP1LFd(3,27) 
Real(dp), Intent(out) :: gP1LFv(3,24) 
Real(dp), Intent(out) :: gP1Lhh(2,60) 
Real(dp), Intent(out) :: gP1LHm(3,32) 
Real(dp), Intent(out) :: gP1LetI(1,56) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateOneLoopDecays'
 
Write(*,*) "Calculating one loop decays" 
! Regulator mass for gluon/photon 
MLambda = Mass_Regulator_PhotonGluon 
divset=SetDivonlyAdd(INT(divonly_save)) 
divvalue=SetDivergenceAdd(divergence_save) 
If (.not.CalculateOneLoopMasses) Then 
 If (OSkinematics) Then 
  Write(*,*) "Loop masses not calculated: tree-level masses used for kinematics" 
  OSkinematics = .false. 
 End if
 If (ExternalZfactors) Then 
  Write(*,*) "Loop masses not calculated: no U-factors are applied" 
  ExternalZfactors = .false. 
 End if
End if

If (Extra_scale_loopDecays) Then 
q2_save = GetRenormalizationScale() 
q2 = SetRenormalizationScale(scale_loopdecays **2) 
End if 
If ((OSkinematics).or.(ExternalZfactors)) ShiftIRdiv = .true. 
If (ewOSinDecays) Then 
sinW2=1._dp-mW2/mZ2 
g1SM=sqrt(4*Pi*Alpha_MZ/(1-sinW2)) 
g2SM=sqrt(4*Pi*Alpha_MZ/Sinw2) 
vSM=sqrt(mz2*4._dp/(g1SM**2+g2SM**2)) 
v=vSM 
g1=g1SM 
g2=g2SM 
 If (yukOSinDecays) Then !! Allow OS Yukawas only together with vSM 
    YuSM = 0._dp 
    YdSM = 0._dp 
    YuSM = 0._dp 
   Do i1=1,3 
      YuSM(i1,i1)=sqrt(2._dp)*mf_u(i1)/vSM 
      YeSM(i1,i1)=sqrt(2._dp)*mf_l(i1)/vSM 
      YdSM(i1,i1)=sqrt(2._dp)*mf_d(i1)/vSM 
    End Do 
   If(GenerationMixing) Then 
    YuSM = Transpose(Matmul(Transpose(CKM),Transpose(YuSM))) 
   End if 
Ye=YeSM 
Yd=YdSM 
Yu=YuSM 
 End if 
End if 
! -------------------------------------------- 
! General information needed in the following 
! -------------------------------------------- 

! DR parameters 
Call SolveTadpoleEquations(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& (/ ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,             & 
& ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,               & 
& lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,GenerationMixing,kont)

! Stabilize numerics 
If (Abs(MAh).lt.1.0E-15_dp) MAh=0._dp
If (Abs(MAh2).lt.1.0E-30_dp) MAh2=0._dp
If (Abs(MetI).lt.1.0E-15_dp) MetI=0._dp
If (Abs(MetI2).lt.1.0E-30_dp) MetI2=0._dp
Where (Abs(Mhh).lt.1.0E-15_dp) Mhh=0._dp
Where (Abs(Mhh2).lt.1.0E-30_dp) Mhh2=0._dp
Where (Abs(MHm).lt.1.0E-15_dp) MHm=0._dp
Where (Abs(MHm2).lt.1.0E-30_dp) MHm2=0._dp
Where (Abs(MFv).lt.1.0E-15_dp) MFv=0._dp
Where (Abs(MFv2).lt.1.0E-30_dp) MFv2=0._dp
Where (Abs(MFd).lt.1.0E-15_dp) MFd=0._dp
Where (Abs(MFd2).lt.1.0E-30_dp) MFd2=0._dp
Where (Abs(MFu).lt.1.0E-15_dp) MFu=0._dp
Where (Abs(MFu2).lt.1.0E-30_dp) MFu2=0._dp
Where (Abs(MFe).lt.1.0E-15_dp) MFe=0._dp
Where (Abs(MFe2).lt.1.0E-30_dp) MFe2=0._dp
If (UseZeroRotationMatrices) Then  ! Rotation matrices calculated for p2=0
ZRUZH = MatMul(ZHOS_0, Transpose(ZH))
ZRUZP = MatMul(ZPOS_0, Transpose(ZP))
ZRUVv = MatMul(UVOS_0, Conjg(Transpose(UV)))
ZRUVd = MatMul(ZDLOS_0, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS_0, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS_0, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS_0, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS_0, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS_0, Conjg(Transpose(ZER)))
Else If (UseP2Matrices) Then   ! p2 dependent matrix 
ZRUZH = MatMul(ZHOS_p2, Transpose(ZH))
ZRUZP = MatMul(ZPOS_p2, Transpose(ZP))
ZRUVv = MatMul(UVOS_p2, Conjg(Transpose(UV)))
ZRUVd = MatMul(ZDLOS_p2, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS_p2, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS_p2, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS_p2, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS_p2, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS_p2, Conjg(Transpose(ZER)))
Else  ! Rotation matrix for lightest state
ZRUZH = MatMul(ZHOS, Transpose(ZH))
ZRUZP = MatMul(ZPOS, Transpose(ZP))
ZRUVv = MatMul(UVOS, Conjg(Transpose(UV)))
ZRUVd = MatMul(ZDLOS, Conjg(Transpose(ZDL)))
ZRUUd = MatMul(ZDROS, Conjg(Transpose(ZDR)))
ZRUVu = MatMul(ZULOS, Conjg(Transpose(ZUL)))
ZRUUu = MatMul(ZUROS, Conjg(Transpose(ZUR)))
ZRUVe = MatMul(ZELOS, Conjg(Transpose(ZEL)))
ZRUUe = MatMul(ZEROS, Conjg(Transpose(ZER)))
End if 
! Couplings 
Call AllCouplingsReallyAll(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,lam10,            & 
& ZP,lam2,lam9,lam8,lamh,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,              & 
& epsE,epsU,Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,       & 
& cplAhHmcHm,cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,       & 
& cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,cplAhAhetIhh,cplAhAhhhhh,           & 
& cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,cplAhetIHmcHm,cplAhhhhhhh,      & 
& cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,cpletIetIHmcHm,              & 
& cpletIhhhhhh,cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm,cplAhhhVZ,           & 
& cplAhHmVWp,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplhhHmVWp,               & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplhhcVWpVWp,cplhhVZVZ,cplHmVPVWp,cplHmVWpVZ,       & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHmVPVWp,cplAhHmVWpVZ,        & 
& cplAhcHmcVWpVP,cplAhcHmcVWpVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp,            & 
& cpletIHmVWpVZ,cpletIcHmcVWpVP,cpletIcHmcVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,              & 
& cplhhHmVPVWp,cplhhHmVWpVZ,cplhhcHmcVWpVP,cplhhcHmcVWpVZ,cplHmcHmVPVP,cplHmcHmVPVZ,     & 
& cplHmcHmcVWpVWp,cplHmcHmVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,      & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgWpgWpetI,       & 
& cplcgWCgWCetI,cplcgZgAhh,cplcgWCgAHm,cplcgWpgAcHm,cplcgWpgWphh,cplcgZgWpHm,            & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm)

em = cplcVWpVPVWp 
gs = cplcFdFdVGL(1,1) 
Call CouplingsColoredQuartics(lam1,lam6,ZH,lam4,lam3,lam5,lam8,ZP,lam7,               & 
& lam10,lam2,lam9,lamh,g2,g1,TW,g3,cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,              & 
& cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhhhh1,cplAhAhHmcHm1,cplAhetIetIetI1,               & 
& cplAhetIetIhh1,cplAhetIhhhh1,cplAhetIHmcHm1,cplAhhhhhhh1,cplAhhhHmcHm1,cpletIetIetIetI1,& 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,cpletIhhhhhh1,cpletIhhHmcHm1,           & 
& cplhhhhhhhh1,cplhhhhHmcHm1,cplHmHmcHmcHm1,cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhHmVPVWp1,  & 
& cplAhHmVWpVZ1,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cpletIetIcVWpVWp1,cpletIetIVZVZ1,        & 
& cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,       & 
& cplhhhhVZVZ1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,              & 
& cplHmcHmVPVP1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplVGVGVGVG1Q,              & 
& cplVGVGVGVG2Q,cplVGVGVGVG3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q,        & 
& cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,& 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q)

If (externalZfactors) Then 
Call getZCouplings(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,lam10,ZP,lam2,            & 
& lam9,lam8,lamh,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,epsE,epsU,            & 
& Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhHmcHm,      & 
& cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,cplAhAhAhAh,      & 
& cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,cplAhAhetIhh,cplAhAhhhhh,cplAhAhHmcHm,          & 
& cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,cplAhetIHmcHm,cplAhhhhhhh,cplAhhhHmcHm,      & 
& cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,cpletIetIHmcHm,cpletIhhhhhh,              & 
& cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm,cplAhhhVZ,cplAhHmVWp,             & 
& cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplhhHmVWp,cplhhcHmcVWp,             & 
& cplHmcHmVP,cplHmcHmVZ,cplhhcVWpVWp,cplhhVZVZ,cplHmVPVWp,cplHmVWpVZ,cplcHmcVWpVP,       & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHmVPVWp,cplAhHmVWpVZ,cplAhcHmcVWpVP,      & 
& cplAhcHmcVWpVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp,cpletIHmVWpVZ,             & 
& cpletIcHmcVWpVP,cpletIcHmcVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,cplhhHmVPVWp,               & 
& cplhhHmVWpVZ,cplhhcHmcVWpVP,cplhhcHmcVWpVZ,cplHmcHmVPVP,cplHmcHmVPVZ,cplHmcHmcVWpVWp,  & 
& cplHmcHmVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,cplcFdFdetIR,             & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdhhL,cplcFdFdhhR,           & 
& cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFdFdVGL,           & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,             & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,               & 
& cplcFeFvVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,   & 
& cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpcVWpVWpVWp1,    & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgAgWpcVWp,         & 
& cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgWCVZ,cplcgWpgZVWp,        & 
& cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgWpgWpetI,cplcgWCgWCetI,cplcgZgAhh,        & 
& cplcgWCgAHm,cplcgWpgAcHm,cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgZgWCcHm,           & 
& cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,               & 
& ZRUUu,ZRUVe,ZRUUe,ZcplAhAhAh,ZcplAhAhetI,ZcplAhAhhh,ZcplAhetIetI,ZcplAhetIhh,          & 
& ZcplAhhhhh,ZcplAhHmcHm,ZcpletIetIetI,ZcpletIetIhh,ZcpletIhhhh,ZcpletIHmcHm,            & 
& Zcplhhhhhh,ZcplhhHmcHm,ZcplAhAhAhAh,ZcplAhAhAhetI,ZcplAhAhAhhh,ZcplAhAhetIetI,         & 
& ZcplAhAhetIhh,ZcplAhAhhhhh,ZcplAhAhHmcHm,ZcplAhetIetIetI,ZcplAhetIetIhh,               & 
& ZcplAhetIhhhh,ZcplAhetIHmcHm,ZcplAhhhhhhh,ZcplAhhhHmcHm,ZcpletIetIetIetI,              & 
& ZcpletIetIetIhh,ZcpletIetIhhhh,ZcpletIetIHmcHm,ZcpletIhhhhhh,ZcpletIhhHmcHm,           & 
& Zcplhhhhhhhh,ZcplhhhhHmcHm,ZcplHmHmcHmcHm,ZcplAhhhVZ,ZcplAhHmVWp,ZcplAhcHmcVWp,        & 
& ZcpletIhhVZ,ZcpletIHmVWp,ZcpletIcHmcVWp,ZcplhhHmVWp,ZcplhhcHmcVWp,ZcplHmcHmVP,         & 
& ZcplHmcHmVZ,ZcplhhcVWpVWp,ZcplhhVZVZ,ZcplHmVPVWp,ZcplHmVWpVZ,ZcplcHmcVWpVP,            & 
& ZcplcHmcVWpVZ,ZcplAhAhcVWpVWp,ZcplAhAhVZVZ,ZcplAhHmVPVWp,ZcplAhHmVWpVZ,ZcplAhcHmcVWpVP,& 
& ZcplAhcHmcVWpVZ,ZcpletIetIcVWpVWp,ZcpletIetIVZVZ,ZcpletIHmVPVWp,ZcpletIHmVWpVZ,        & 
& ZcpletIcHmcVWpVP,ZcpletIcHmcVWpVZ,ZcplhhhhcVWpVWp,ZcplhhhhVZVZ,ZcplhhHmVPVWp,          & 
& ZcplhhHmVWpVZ,ZcplhhcHmcVWpVP,ZcplhhcHmcVWpVZ,ZcplHmcHmVPVP,ZcplHmcHmVPVZ,             & 
& ZcplHmcHmcVWpVWp,ZcplHmcHmVZVZ,ZcplVGVGVG,ZcplcVWpVPVWp,ZcplcVWpVWpVZ,ZcplcFdFdAhL,    & 
& ZcplcFdFdAhR,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFuFuAhL,ZcplcFuFuAhR,ZcplcFdFdetIL,        & 
& ZcplcFdFdetIR,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplcFuFuetIL,ZcplcFuFuetIR,ZcplcFdFdhhL,    & 
& ZcplcFdFdhhR,ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplFvFeHmL,ZcplFvFeHmR,ZcplcFeFehhL,           & 
& ZcplcFeFehhR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFdFucHmL,ZcplcFdFucHmR,ZcplcFeFvcHmL,      & 
& ZcplcFeFvcHmR,ZcplcFdFdVGL,ZcplcFdFdVGR,ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,        & 
& ZcplcFdFdVZR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,ZcplFvFecVWpL,ZcplFvFecVWpR,ZcplcFeFeVPL,   & 
& ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,         & 
& ZcplcFuFuVPR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplFvFvVZL,        & 
& ZcplFvFvVZR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplVGVGVGVG1,ZcplVGVGVGVG2,ZcplVGVGVGVG3,     & 
& ZcplcVWpVPVPVWp1,ZcplcVWpVPVPVWp2,ZcplcVWpVPVPVWp3,ZcplcVWpVPVWpVZ1,ZcplcVWpVPVWpVZ2,  & 
& ZcplcVWpVPVWpVZ3,ZcplcVWpcVWpVWpVWp1,ZcplcVWpcVWpVWpVWp2,ZcplcVWpcVWpVWpVWp3,          & 
& ZcplcVWpVWpVZVZ1,ZcplcVWpVWpVZVZ2,ZcplcVWpVWpVZVZ3,ZcplcgGgGVG,ZcplcgWpgAVWp,          & 
& ZcplcgWCgAcVWp,ZcplcgWpgWpVP,ZcplcgWpgWpVZ,ZcplcgAgWpcVWp,ZcplcgZgWpcVWp,              & 
& ZcplcgWCgWCVP,ZcplcgAgWCVWp,ZcplcgZgWCVWp,ZcplcgWCgWCVZ,ZcplcgWpgZVWp,ZcplcgWCgZcVWp,  & 
& ZcplcgWpgWpAh,ZcplcgWCgWCAh,ZcplcgWpgWpetI,ZcplcgWCgWCetI,ZcplcgZgAhh,ZcplcgWCgAHm,    & 
& ZcplcgWpgAcHm,ZcplcgWpgWphh,ZcplcgZgWpHm,ZcplcgWCgWChh,ZcplcgZgWCcHm,ZcplcgZgZhh,      & 
& ZcplcgWCgZHm,ZcplcgWpgZcHm)

End if 
Call getGBCouplings(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,              & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,GcplAhHmcHm,GcpletIHmcHm,        & 
& GcplhhHmcHm,GcplAhHmVWp,GcplAhcHmcVWp,GcpletIHmVWp,GcpletIcHmcVWp,GcplhhHmVWp,         & 
& GcplhhcHmcVWp,GcplHmcHmVP,GcplHmcHmVZ,GcplHmVPVWp,GcplHmVWpVZ,GcplcHmcVWpVP,           & 
& GcplcHmcVWpVZ,GcplcFuFdHmL,GcplcFuFdHmR,GcplFvFeHmL,GcplFvFeHmR,GcplcFdFucHmL,         & 
& GcplcFdFucHmR,GcplcFeFvcHmL,GcplcFeFvcHmR,GZcplAhHmcHm,GZcpletIHmcHm,GZcplhhHmcHm,     & 
& GZcplAhHmVWp,GZcplAhcHmcVWp,GZcpletIHmVWp,GZcpletIcHmcVWp,GZcplhhHmVWp,GZcplhhcHmcVWp, & 
& GZcplHmcHmVP,GZcplHmcHmVZ,GZcplHmVPVWp,GZcplHmVWpVZ,GZcplcHmcVWpVP,GZcplcHmcVWpVZ,     & 
& GZcplcFuFdHmL,GZcplcFuFdHmR,GZcplFvFeHmL,GZcplFvFeHmR,GZcplcFdFucHmL,GZcplcFdFucHmR,   & 
& GZcplcFeFvcHmL,GZcplcFeFvcHmR,GosZcplAhHmcHm,GosZcpletIHmcHm,GosZcplhhHmcHm,           & 
& GosZcplAhHmVWp,GosZcplAhcHmcVWp,GosZcpletIHmVWp,GosZcpletIcHmcVWp,GosZcplhhHmVWp,      & 
& GosZcplhhcHmcVWp,GosZcplHmcHmVP,GosZcplHmcHmVZ,GosZcplHmVPVWp,GosZcplHmVWpVZ,          & 
& GosZcplcHmcVWpVP,GosZcplcHmcVWpVZ,GosZcplcFuFdHmL,GosZcplcFuFdHmR,GosZcplFvFeHmL,      & 
& GosZcplFvFeHmR,GosZcplcFdFucHmL,GosZcplcFdFucHmR,GosZcplcFeFvcHmL,GosZcplcFeFvcHmR)

! Write intilization of all counter terms 
Call WaveFunctionRenormalisation(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,              & 
& MFdOS,MFd2OS,MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,              & 
& MVZ2OS,MVWpOS,MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,              & 
& MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,             & 
& MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,               & 
& g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,            & 
& epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,      & 
& cplAhetIhh,cplAhhhhh,cplAhHmcHm,cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,       & 
& cplhhhhhh,cplhhHmcHm,cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,               & 
& cplAhAhetIhh,cplAhAhhhhh,cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,       & 
& cplAhetIHmcHm,cplAhhhhhhh,cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,   & 
& cpletIetIHmcHm,cpletIhhhhhh,cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm,      & 
& cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplhhHmVWp,     & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplhhcVWpVWp,cplhhVZVZ,cplHmVPVWp,cplHmVWpVZ,       & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhHmVPVWp,cplAhHmVWpVZ,        & 
& cplAhcHmcVWpVP,cplAhcHmcVWpVZ,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIHmVPVWp,            & 
& cpletIHmVWpVZ,cpletIcHmcVWpVP,cpletIcHmcVWpVZ,cplhhhhcVWpVWp,cplhhhhVZVZ,              & 
& cplhhHmVPVWp,cplhhHmVWpVZ,cplhhcHmcVWpVP,cplhhcHmcVWpVZ,cplHmcHmVPVP,cplHmcHmVPVZ,     & 
& cplHmcHmcVWpVWp,cplHmcHmVZVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3,cplcVWpVPVPVWp1,      & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,       & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVWpVZVZ1,              & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplcgGgGVG,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWpVP,    & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVP,cplcgAgWCVWp,cplcgZgWCVWp,       & 
& cplcgWCgWCVZ,cplcgWpgZVWp,cplcgWCgZcVWp,cplcgWpgWpAh,cplcgWCgWCAh,cplcgWpgWpetI,       & 
& cplcgWCgWCetI,cplcgZgAhh,cplcgWCgAHm,cplcgWpgAcHm,cplcgWpgWphh,cplcgZgWpHm,            & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWCgZHm,cplcgWpgZcHm,GcplAhHmcHm,             & 
& GcpletIHmcHm,GcplhhHmcHm,GcplAhHmVWp,GcplAhcHmcVWp,GcpletIHmVWp,GcpletIcHmcVWp,        & 
& GcplhhHmVWp,GcplhhcHmcVWp,GcplHmcHmVP,GcplHmcHmVZ,GcplHmVPVWp,GcplHmVWpVZ,             & 
& GcplcHmcVWpVP,GcplcHmcVWpVZ,GcplcFuFdHmL,GcplcFuFdHmR,GcplFvFeHmL,GcplFvFeHmR,         & 
& GcplcFdFucHmL,GcplcFdFucHmR,GcplcFeFvcHmL,GcplcFeFvcHmR,dg1,dg2,dg3,depsU,             & 
& dYu,depsD,depsE,dYd,dYe,dYh,dmH2,dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,             & 
& dlam5,dlam6,dmh,dlam9,dlam8,dlamh,dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,             & 
& dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,              & 
& Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,ZfEL,ZfER,ZfVPVZ,ZfVZVP,ctcplAhAhAh,ctcplAhAhetI,   & 
& ctcplAhAhhh,ctcplAhetIetI,ctcplAhetIhh,ctcplAhhhhh,ctcplAhHmcHm,ctcpletIetIetI,        & 
& ctcpletIetIhh,ctcpletIhhhh,ctcpletIHmcHm,ctcplhhhhhh,ctcplhhHmcHm,ctcplAhhhVZ,         & 
& ctcplAhHmVWp,ctcplAhcHmcVWp,ctcpletIhhVZ,ctcpletIHmVWp,ctcpletIcHmcVWp,ctcplhhHmVWp,   & 
& ctcplhhcHmcVWp,ctcplHmcHmVP,ctcplHmcHmVZ,ctcplhhcVWpVWp,ctcplhhVZVZ,ctcplHmVPVWp,      & 
& ctcplHmVWpVZ,ctcplcHmcVWpVP,ctcplcHmcVWpVZ,ctcplVGVGVG,ctcplcVWpVPVWp,ctcplcVWpVWpVZ,  & 
& ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFuFuAhL,ctcplcFuFuAhR,   & 
& ctcplcFdFdetIL,ctcplcFdFdetIR,ctcplcFeFeetIL,ctcplcFeFeetIR,ctcplcFuFuetIL,            & 
& ctcplcFuFuetIR,ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFuFdHmL,ctcplcFuFdHmR,ctcplFvFeHmL,   & 
& ctcplFvFeHmR,ctcplcFeFehhL,ctcplcFeFehhR,ctcplcFuFuhhL,ctcplcFuFuhhR,ctcplcFdFucHmL,   & 
& ctcplcFdFucHmR,ctcplcFeFvcHmL,ctcplcFeFvcHmR,ctcplcFdFdVGL,ctcplcFdFdVGR,              & 
& ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFuFdcVWpL,               & 
& ctcplcFuFdcVWpR,ctcplFvFecVWpL,ctcplFvFecVWpR,ctcplcFeFeVPL,ctcplcFeFeVPR,             & 
& ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,   & 
& ctcplcFdFuVWpL,ctcplcFdFuVWpR,ctcplcFuFuVZL,ctcplcFuFuVZR,ctcplFvFvVZL,ctcplFvFvVZR,   & 
& ctcplcFeFvVWpL,ctcplcFeFvVWpR,MLambda,deltaM,kont)

! -------------------------------------------- 
! The decays at one-loop 
! -------------------------------------------- 

! Fu
If (CalcLoopDecay_Fu) Then 
Call OneLoopDecay_Fu(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,             & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhcHmcVWp,cplAhetIetI,       & 
& cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,cpletIetIetI,        & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhcHmcVWp,cplhhcVWpVWp,   & 
& cplhhhhhh,cplhhHmcHm,cplhhHmVWp,cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,cplHmVPVWp,            & 
& cplHmVWpVZ,cplVGVGVG,ctcplcFuFdcVWpL,ctcplcFuFdcVWpR,ctcplcFuFdHmL,ctcplcFuFdHmR,      & 
& ctcplcFuFuAhL,ctcplcFuFuAhR,ctcplcFuFuetIL,ctcplcFuFuetIR,ctcplcFuFuhhL,               & 
& ctcplcFuFuhhR,ctcplcFuFuVGL,ctcplcFuFuVGR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,   & 
& ctcplcFuFuVZR,GcplHmVPVWp,GosZcplHmVPVWp,GZcplHmVPVWp,ZcplcFdFdVGL,ZcplcFdFdVGR,       & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFucHmL,ZcplcFdFucHmR,ZcplcFdFuVWpL,ZcplcFdFuVWpR,     & 
& ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,ZcplcFuFdHmL,ZcplcFuFdHmR,ZcplcFuFuAhL,ZcplcFuFuAhR,     & 
& ZcplcFuFuetIL,ZcplcFuFuetIR,ZcplcFuFuhhL,ZcplcFuFuhhR,ZcplcFuFuVGL,ZcplcFuFuVGR,       & 
& ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcFuFuVZL,ZcplcFuFuVZR,ZcplcHmcVWpVP,ZcplcVWpVPVWp,       & 
& ZcplHmcHmVP,ZcplHmVPVWp,ZcplVGVGVG,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,          & 
& ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFu)

End if 
! Fe
If (CalcLoopDecay_Fe) Then 
Call OneLoopDecay_Fe(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,             & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhcHmcVWp,cplAhetIetI,       & 
& cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFeFeAhL,cplcFeFeAhR,          & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,cpletIetIetI,        & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplFvFecVWpL,cplFvFecVWpR,   & 
& cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcVWpVWp,cplhhhhhh,       & 
& cplhhHmcHm,cplhhHmVWp,cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,           & 
& ctcplcFeFeAhL,ctcplcFeFeAhR,ctcplcFeFeetIL,ctcplcFeFeetIR,ctcplcFeFehhL,               & 
& ctcplcFeFehhR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,ctcplcFeFvcHmL,  & 
& ctcplcFeFvcHmR,ctcplcFeFvVWpL,ctcplcFeFvVWpR,GcplHmVPVWp,GosZcplHmVPVWp,               & 
& GZcplHmVPVWp,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFeFeetIL,ZcplcFeFeetIR,ZcplcFeFehhL,       & 
& ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFeVZL,ZcplcFeFeVZR,ZcplcFeFvcHmL,        & 
& ZcplcFeFvcHmR,ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcHmcVWpVP,ZcplcVWpVPVWp,ZcplFvFecVWpL,   & 
& ZcplFvFecVWpR,ZcplFvFeHmL,ZcplFvFeHmR,ZcplHmcHmVP,ZcplHmVPVWp,ZRUZH,ZRUZP,             & 
& ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFe)

End if 
! Fd
If (CalcLoopDecay_Fd) Then 
Call OneLoopDecay_Fd(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,             & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhcHmcVWp,cplAhetIetI,       & 
& cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhHmVWp,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,             & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,cpletIetIetI,        & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIHmVWp,cplhhcHmcVWp,cplhhcVWpVWp,   & 
& cplhhhhhh,cplhhHmcHm,cplhhHmVWp,cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,cplHmVPVWp,            & 
& cplHmVWpVZ,cplVGVGVG,ctcplcFdFdAhL,ctcplcFdFdAhR,ctcplcFdFdetIL,ctcplcFdFdetIR,        & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,ctcplcFdFdVGL,ctcplcFdFdVGR,ctcplcFdFdVPL,ctcplcFdFdVPR,   & 
& ctcplcFdFdVZL,ctcplcFdFdVZR,ctcplcFdFucHmL,ctcplcFdFucHmR,ctcplcFdFuVWpL,              & 
& ctcplcFdFuVWpR,GcplHmVPVWp,GosZcplHmVPVWp,GZcplHmVPVWp,ZcplcFdFdAhL,ZcplcFdFdAhR,      & 
& ZcplcFdFdetIL,ZcplcFdFdetIR,ZcplcFdFdhhL,ZcplcFdFdhhR,ZcplcFdFdVGL,ZcplcFdFdVGR,       & 
& ZcplcFdFdVPL,ZcplcFdFdVPR,ZcplcFdFdVZL,ZcplcFdFdVZR,ZcplcFdFucHmL,ZcplcFdFucHmR,       & 
& ZcplcFdFuVWpL,ZcplcFdFuVWpR,ZcplcFuFdcVWpL,ZcplcFuFdcVWpR,ZcplcFuFdHmL,ZcplcFuFdHmR,   & 
& ZcplcFuFuVGL,ZcplcFuFuVGR,ZcplcFuFuVPL,ZcplcFuFuVPR,ZcplcHmcVWpVP,ZcplcVWpVPVWp,       & 
& ZcplHmcHmVP,ZcplHmVPVWp,ZcplVGVGVG,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,          & 
& ZRUVe,ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFd)

End if 
! Fv
If (CalcLoopDecay_Fv) Then 
Call OneLoopDecay_Fv(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,             & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhcHmcVWp,cplAhHmcHm,cplAhHmVWp,cplcFeFeAhL,cplcFeFeAhR,    & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,cpletIcHmcVWp,cpletIHmcHm,         & 
& cpletIHmVWp,cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,     & 
& cplhhcHmcVWp,cplhhcVWpVWp,cplhhHmcHm,cplhhHmVWp,cplhhVZVZ,cplHmcHmVP,cplHmcHmVZ,       & 
& cplHmVPVWp,cplHmVWpVZ,ctcplFvFecVWpL,ctcplFvFecVWpR,ctcplFvFeHmL,ctcplFvFeHmR,         & 
& ctcplFvFvVZL,ctcplFvFvVZR,GcplHmVPVWp,GosZcplHmVPVWp,GZcplHmVPVWp,ZcplAhcHmcVWp,       & 
& ZcplAhHmcHm,ZcplAhHmVWp,ZcplcFeFeAhL,ZcplcFeFeAhR,ZcplcFeFeetIL,ZcplcFeFeetIR,         & 
& ZcplcFeFehhL,ZcplcFeFehhR,ZcplcFeFeVPL,ZcplcFeFeVPR,ZcplcFeFvcHmL,ZcplcFeFvcHmR,       & 
& ZcplcFeFvVWpL,ZcplcFeFvVWpR,ZcplcHmcVWpVP,ZcplcVWpVPVWp,ZcpletIcHmcVWp,ZcpletIHmcHm,   & 
& ZcpletIHmVWp,ZcplFvFecVWpL,ZcplFvFecVWpR,ZcplFvFeHmL,ZcplFvFeHmR,ZcplFvFvVZL,          & 
& ZcplFvFvVZR,ZcplhhcHmcVWp,ZcplhhcVWpVWp,ZcplhhHmcHm,ZcplhhHmVWp,ZcplhhVZVZ,            & 
& ZcplHmcHmVP,ZcplHmVPVWp,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,               & 
& ZRUUe,MLambda,em,gs,deltaM,kont,gP1LFv)

End if 
! hh
If (CalcLoopDecay_hh) Then 
Call OneLoopDecay_hh(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,             & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,             & 
& cplAhAhcVWpVWp1,cplAhAhetI,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhh,cplAhAhhhhh1,        & 
& cplAhAhHmcHm1,cplAhAhVZVZ1,cplAhcHmcVWp,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,               & 
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

End if 
! Hm
If (CalcLoopDecay_Hm) Then 
Call OneLoopDecay_Hm(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,             & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhcVWpVWp1,cplAhAhetI,cplAhAhhh,cplAhAhHmcHm1,  & 
& cplAhcHmcVWp,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cplAhetIetI,cplAhetIhh,cplAhetIHmcHm1,    & 
& cplAhhhhh,cplAhhhHmcHm1,cplAhhhVZ,cplAhHmcHm,cplAhHmVPVWp1,cplAhHmVWp,cplAhHmVWpVZ1,   & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFeAhL,cplcFeFeAhR,           & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,           & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFuAhL,cplcFuFuAhR,           & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgAgWpcVWp,cplcgWCgWCAh,            & 
& cplcgWCgWCetI,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplcgWCgZcVWp,cplcgWCgZHm,        & 
& cplcgWpgAcHm,cplcgWpgWpAh,cplcgWpgWpetI,cplcgWpgWphh,cplcgWpgWpVP,cplcgWpgWpVZ,        & 
& cplcgWpgZcHm,cplcgZgAhh,cplcgZgWCcHm,cplcgZgWpcVWp,cplcgZgWpHm,cplcgZgZhh,             & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,              & 
& cplcVWpVPVWpVZ3Q,cplcVWpVWpVZ,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,      & 
& cpletIcHmcVWp,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cpletIetIcVWpVWp1,cpletIetIetI,        & 
& cpletIetIhh,cpletIetIHmcHm1,cpletIhhhh,cpletIhhHmcHm1,cpletIhhVZ,cpletIHmcHm,          & 
& cpletIHmVPVWp1,cpletIHmVWp,cpletIHmVWpVZ1,cplFvFecVWpL,cplFvFecVWpR,cplFvFeHmL,        & 
& cplFvFeHmR,cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,         & 
& cplhhcVWpVWp,cplhhhhcVWpVWp1,cplhhhhhh,cplhhhhHmcHm1,cplhhHmcHm,cplhhHmVPVWp1,         & 
& cplhhHmVWp,cplhhHmVWpVZ1,cplhhVZVZ,cplHmcHmcVWpVWp1,cplHmcHmVP,cplHmcHmVPVP1,          & 
& cplHmcHmVPVZ1,cplHmcHmVZ,cplHmcHmVZVZ1,cplHmHmcHmcHm1,cplHmVPVWp,cplHmVWpVZ,           & 
& ctcplAhcHmcVWp,ctcplAhHmcHm,ctcplcFdFucHmL,ctcplcFdFucHmR,ctcplcFeFvcHmL,              & 
& ctcplcFeFvcHmR,ctcplcHmcVWpVP,ctcplcHmcVWpVZ,ctcpletIcHmcVWp,ctcpletIHmcHm,            & 
& ctcplhhcHmcVWp,ctcplhhHmcHm,ctcplHmcHmVP,ctcplHmcHmVZ,GcplHmVPVWp,GosZcplHmVPVWp,      & 
& GZcplHmVPVWp,ZcplAhcHmcVWp,ZcplAhHmcHm,ZcplcFdFucHmL,ZcplcFdFucHmR,ZcplcFeFvcHmL,      & 
& ZcplcFeFvcHmR,ZcplcHmcVWpVZ,ZcpletIcHmcVWp,ZcpletIHmcHm,ZcplhhcHmcVWp,ZcplhhHmcHm,     & 
& ZcplHmcHmVZ,ZRUZH,ZRUZP,ZRUVv,ZRUVd,ZRUUd,ZRUVu,ZRUUu,ZRUVe,ZRUUe,MLambda,             & 
& em,gs,deltaM,kont,gP1LHm)

End if 
! etI
If (CalcLoopDecay_etI) Then 
Call OneLoopDecay_etI(MhhOS,Mhh2OS,MHmOS,MHm2OS,MFvOS,MFv2OS,MFdOS,MFd2OS,            & 
& MFuOS,MFu2OS,MFeOS,MFe2OS,MAhOS,MAh2OS,MetIOS,MetI2OS,MVZOS,MVZ2OS,MVWpOS,             & 
& MVWp2OS,ZHOS,ZPOS,UVOS,ZDLOS,ZDROS,ZULOS,ZUROS,ZELOS,ZEROS,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,              & 
& lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,              & 
& mu,mH2,mEt2,m12,mh,v,vv,dg1,dg2,dg3,depsU,dYu,depsD,depsE,dYd,dYe,dYh,dmH2,            & 
& dlam1,dmEt2,dlam2,dlam4,dlam3,dm12,dlam7,dlam5,dlam6,dmh,dlam9,dlam8,dlamh,            & 
& dmu,dlam10,dv,dvv,dZH,dZP,dUV,dZDL,dZDR,dZUL,dZUR,dZEL,dZER,dSinTW,dCosTW,             & 
& dTanTW,ZfVG,ZfAh,ZfetI,ZfVP,ZfVZ,ZfVWp,Zfhh,ZfHm,ZfVL,ZfDL,ZfDR,ZfUL,ZfUR,             & 
& ZfEL,ZfER,ZfVPVZ,ZfVZVP,cplAhAhAh,cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,             & 
& cplAhAhcVWpVWp1,cplAhAhetI,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhh,cplAhAhhhhh1,        & 
& cplAhAhHmcHm1,cplAhAhVZVZ1,cplAhcHmcVWp,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,               & 
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

End if 
If (Extra_scale_loopDecays) Then 
q2 = SetRenormalizationScale(q2_save) 
End if 
Iname = Iname - 1 
 
End Subroutine CalculateOneLoopDecays  
 
 
End Module OneLoopDecays_radinuZeeHB 
 