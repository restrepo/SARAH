! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module CouplingsCT_radinuZeeHB
 
Use Control 
Use Settings 
Use Model_Data_radinuZeeHB 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine CalculateCouplingCT(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,              & 
& lam10,ZP,lam2,lam9,lam8,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,             & 
& epsE,epsU,Yh,UV,dlam6,dvv,dv,dlam1,dlam4,dlam3,dlam5,dZH,dlam7,dmu,dlam10,             & 
& dZP,dlam2,dlam9,dlam8,dg1,dg2,dSinTW,dCosTW,dTanTW,dg3,dYd,dZDL,dZDR,dYe,              & 
& dZEL,dZER,dYu,dZUL,dZUR,depsD,depsE,depsU,dYh,dUV,ctcplAhAhAh,ctcplAhAhetI,            & 
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
& ctcplcFeFvVWpL,ctcplcFeFvVWpR)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),ZP(3,3),g1,g2,TW,g3,dvv,dv,dlam5,dZH(2,2),dZP(3,3),dg1,             & 
& dg2,dSinTW,dCosTW,dTanTW,dg3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,mu,lam10,lam2,lam9,lam8,Yd(3,3),ZDL(3,3),ZDR(3,3),           & 
& Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),               & 
& epsU(3,3),Yh(3,3),UV(3,3),dlam6,dlam1,dlam4,dlam3,dlam7,dmu,dlam10,dlam2,              & 
& dlam9,dlam8,dYd(3,3),dZDL(3,3),dZDR(3,3),dYe(3,3),dZEL(3,3),dZER(3,3),dYu(3,3),        & 
& dZUL(3,3),dZUR(3,3),depsD(3,3),depsE(3,3),depsU(3,3),dYh(3,3),dUV(3,3)

Complex(dp), Intent(out) :: ctcplAhAhAh,ctcplAhAhetI,ctcplAhAhhh(2),ctcplAhetIetI,ctcplAhetIhh(2),ctcplAhhhhh(2,2),& 
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

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateCouplingCT'
 
ctcplAhAhAh = 0._dp 
Call CT_CouplingAhAhAh(lam6,vv,dlam6,dvv,ctcplAhAhAh)



ctcplAhAhetI = 0._dp 
Call CT_CouplingAhAhetI(lam6,v,dlam6,dv,ctcplAhAhetI)



ctcplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CT_CouplingAhAhhh(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,dlam1,dlam4,              & 
& dlam3,dlam5,dlam6,dv,dvv,dZH,ctcplAhAhhh(gt3))

End Do 


ctcplAhetIetI = 0._dp 
Call CT_CouplingAhetIetI(lam7,vv,dlam7,dvv,ctcplAhetIetI)



ctcplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CT_CouplingAhetIhh(gt3,lam7,lam5,lam6,v,vv,ZH,dlam7,dlam5,dlam6,dv,              & 
& dvv,dZH,ctcplAhetIhh(gt3))

End Do 


ctcplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CT_CouplingAhhhhh(gt2,gt3,lam7,lam6,v,vv,ZH,dlam7,dlam6,dv,dvv,dZH,              & 
& ctcplAhhhhh(gt2,gt3))

 End Do 
End Do 


ctcplAhHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CT_CouplingAhHmcHm(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,dlam4,             & 
& dlam7,dlam5,dlam6,dmu,dlam10,dvv,dZP,ctcplAhHmcHm(gt2,gt3))

 End Do 
End Do 


ctcpletIetIetI = 0._dp 
Call CT_CouplingetIetIetI(lam7,v,dlam7,dv,ctcpletIetIetI)



ctcpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CT_CouplingetIetIhh(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,dlam2,dlam4,            & 
& dlam3,dlam7,dlam5,dv,dvv,dZH,ctcpletIetIhh(gt3))

End Do 


ctcpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CT_CouplingetIhhhh(gt2,gt3,lam7,lam6,v,vv,ZH,dlam7,dlam6,dv,dvv,dZH,             & 
& ctcpletIhhhh(gt2,gt3))

 End Do 
End Do 


ctcpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CT_CouplingetIHmcHm(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,dlam4,             & 
& dlam7,dlam5,dlam6,dmu,dlam10,dv,dZP,ctcpletIHmcHm(gt2,gt3))

 End Do 
End Do 


ctcplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CT_Couplinghhhhhh(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,              & 
& vv,ZH,dlam1,dlam2,dlam4,dlam3,dlam7,dlam5,dlam6,dv,dvv,dZH,ctcplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplinghhHmcHm(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,mu,lam10,v,vv,ZH,ZP,dlam1,dlam2,dlam4,dlam3,dlam7,dlam5,dlam6,               & 
& dlam9,dlam8,dmu,dlam10,dv,dvv,dZH,dZP,ctcplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CT_CouplingAhhhVZ(gt2,g1,g2,ZH,TW,dg1,dg2,dZH,dSinTW,dCosTW,dTanTW,              & 
& ctcplAhhhVZ(gt2))

End Do 


ctcplAhHmVWp = 0._dp 
Do gt2 = 1, 3
Call CT_CouplingAhHmVWp(gt2,g2,ZP,dg2,dZP,ctcplAhHmVWp(gt2))

End Do 


ctcplAhcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CT_CouplingAhcHmcVWp(gt2,g2,ZP,dg2,dZP,ctcplAhcHmcVWp(gt2))

End Do 


ctcpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CT_CouplingetIhhVZ(gt2,g1,g2,ZH,TW,dg1,dg2,dZH,dSinTW,dCosTW,dTanTW,             & 
& ctcpletIhhVZ(gt2))

End Do 


ctcpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CT_CouplingetIHmVWp(gt2,g2,ZP,dg2,dZP,ctcpletIHmVWp(gt2))

End Do 


ctcpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CT_CouplingetIcHmcVWp(gt2,g2,ZP,dg2,dZP,ctcpletIcHmcVWp(gt2))

End Do 


ctcplhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CT_CouplinghhHmVWp(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhHmVWp(gt1,gt2))

 End Do 
End Do 


ctcplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CT_CouplinghhcHmcVWp(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,ctcplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


ctcplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingHmcHmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,dTanTW,         & 
& ctcplHmcHmVP(gt1,gt2))

 End Do 
End Do 


ctcplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingHmcHmVZ(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,dTanTW,         & 
& ctcplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


ctcplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhcVWpVWp(gt1,g2,v,vv,ZH,dg2,dv,dvv,dZH,ctcplhhcVWpVWp(gt1))

End Do 


ctcplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CT_CouplinghhVZVZ(gt1,g1,g2,v,vv,ZH,TW,dg1,dg2,dv,dvv,dZH,dSinTW,dCosTW,         & 
& dTanTW,ctcplhhVZVZ(gt1))

End Do 


ctcplHmVPVWp = 0._dp 
Do gt1 = 1, 3
Call CT_CouplingHmVPVWp(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,dSinTW,               & 
& dCosTW,dTanTW,ctcplHmVPVWp(gt1))

End Do 


ctcplHmVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CT_CouplingHmVWpVZ(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,dSinTW,               & 
& dCosTW,dTanTW,ctcplHmVWpVZ(gt1))

End Do 


ctcplcHmcVWpVP = 0._dp 
Do gt1 = 1, 3
Call CT_CouplingcHmcVWpVP(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,dSinTW,             & 
& dCosTW,dTanTW,ctcplcHmcVWpVP(gt1))

End Do 


ctcplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CT_CouplingcHmcVWpVZ(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,dSinTW,             & 
& dCosTW,dTanTW,ctcplcHmcVWpVZ(gt1))

End Do 


ctcplVGVGVG = 0._dp 
Call CT_CouplingVGVGVG(g3,dg3,ctcplVGVGVG)



ctcplcVWpVPVWp = 0._dp 
Call CT_CouplingcVWpVPVWp(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWpVPVWp)



ctcplcVWpVWpVZ = 0._dp 
Call CT_CouplingcVWpVWpVZ(g2,TW,dg2,dSinTW,dCosTW,dTanTW,ctcplcVWpVWpVZ)



ctcplcFdFdAhL = 0._dp 
ctcplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdAh(gt1,gt2,Yd,ZDL,ZDR,dYd,dZDL,dZDR,ctcplcFdFdAhL(gt1,gt2)       & 
& ,ctcplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeAhL = 0._dp 
ctcplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeAh(gt1,gt2,Ye,ZEL,ZER,dYe,dZEL,dZER,ctcplcFeFeAhL(gt1,gt2)       & 
& ,ctcplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuAhL = 0._dp 
ctcplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuAh(gt1,gt2,Yu,ZUL,ZUR,dYu,dZUL,dZUR,ctcplcFuFuAhL(gt1,gt2)       & 
& ,ctcplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdetIL = 0._dp 
ctcplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdetI(gt1,gt2,epsD,ZDL,ZDR,depsD,dZDL,dZDR,ctcplcFdFdetIL(gt1,gt2) & 
& ,ctcplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeetIL = 0._dp 
ctcplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeetI(gt1,gt2,epsE,ZEL,ZER,depsE,dZEL,dZER,ctcplcFeFeetIL(gt1,gt2) & 
& ,ctcplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuetIL = 0._dp 
ctcplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuetI(gt1,gt2,epsU,ZUL,ZUR,depsU,dZUL,dZUR,ctcplcFuFuetIL(gt1,gt2) & 
& ,ctcplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdhhL = 0._dp 
ctcplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFdFdhh(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,depsD,dYd,dZH,dZDL,            & 
& dZDR,ctcplcFdFdhhL(gt1,gt2,gt3),ctcplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFdHmL = 0._dp 
ctcplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFuFdHm(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,               & 
& depsU,dYu,depsD,dYd,dZP,dZDL,dZDR,dZUL,dZUR,ctcplcFuFdHmL(gt1,gt2,gt3),ctcplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplFvFeHmL = 0._dp 
ctcplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingFvFeHm(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,depsE,dYe,dYh,            & 
& dZP,dUV,dZEL,dZER,ctcplFvFeHmL(gt1,gt2,gt3),ctcplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFehhL = 0._dp 
ctcplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFeFehh(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,depsE,dYe,dZH,dZEL,            & 
& dZER,ctcplcFeFehhL(gt1,gt2,gt3),ctcplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFuFuhhL = 0._dp 
ctcplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CT_CouplingcFuFuhh(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,depsU,dYu,dZH,dZUL,            & 
& dZUR,ctcplcFuFuhhL(gt1,gt2,gt3),ctcplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFucHmL = 0._dp 
ctcplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFdFucHm(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,              & 
& depsU,dYu,depsD,dYd,dZP,dZDL,dZDR,dZUL,dZUR,ctcplcFdFucHmL(gt1,gt2,gt3),               & 
& ctcplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFeFvcHmL = 0._dp 
ctcplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CT_CouplingcFeFvcHm(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,depsE,dYe,              & 
& dYh,dZP,dUV,dZEL,dZER,ctcplcFeFvcHmL(gt1,gt2,gt3),ctcplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


ctcplcFdFdVGL = 0._dp 
ctcplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,ctcplcFdFdVGL(gt1,gt2),ctcplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVPL = 0._dp 
ctcplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFdFdVPL(gt1,gt2)& 
& ,ctcplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFdVZL = 0._dp 
ctcplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFdFdVZL(gt1,gt2)& 
& ,ctcplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFdcVWpL = 0._dp 
ctcplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFdcVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFuFdcVWpL(gt1,gt2)   & 
& ,ctcplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


ctcplFvFecVWpL = 0._dp 
ctcplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingFvFecVWp(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,ctcplFvFecVWpL(gt1,gt2)       & 
& ,ctcplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVPL = 0._dp 
ctcplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFeFeVPL(gt1,gt2)& 
& ,ctcplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFeVZL = 0._dp 
ctcplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFeFeVZL(gt1,gt2)& 
& ,ctcplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVGL = 0._dp 
ctcplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,ctcplcFuFuVGL(gt1,gt2),ctcplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVPL = 0._dp 
ctcplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFuFuVPL(gt1,gt2)& 
& ,ctcplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


ctcplcFdFuVWpL = 0._dp 
ctcplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFdFuVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,ctcplcFdFuVWpL(gt1,gt2)     & 
& ,ctcplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


ctcplcFuFuVZL = 0._dp 
ctcplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplcFuFuVZL(gt1,gt2)& 
& ,ctcplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


ctcplFvFvVZL = 0._dp 
ctcplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingFvFvVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,ctcplFvFvVZL(gt1,gt2)& 
& ,ctcplFvFvVZR(gt1,gt2))

 End Do 
End Do 


ctcplcFeFvVWpL = 0._dp 
ctcplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CT_CouplingcFeFvVWp(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,ctcplcFeFvVWpL(gt1,gt2)       & 
& ,ctcplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CalculateCouplingCT

Subroutine CT_CouplingAhAhAh(lam6,vv,dlam6,dvv,res)

Implicit None 

Real(dp), Intent(in) :: vv,dvv

Complex(dp), Intent(in) :: lam6,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*dvv*lam6)/2._dp
res = res+(-3*dlam6*vv)/2._dp
res = res+(3*vv*Conjg(dlam6))/2._dp
res = res+(3*dvv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhAh  
 
 
Subroutine CT_CouplingAhAhetI(lam6,v,dlam6,dv,res)

Implicit None 

Real(dp), Intent(in) :: v,dv

Complex(dp), Intent(in) :: lam6,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhetI' 
 
res = 0._dp 
res = res+(dv*lam6)/2._dp
res = res+(dlam6*v)/2._dp
res = res-(v*Conjg(dlam6))/2._dp
res = res-(dv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhetI  
 
 
Subroutine CT_CouplingAhAhhh(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,dlam1,              & 
& dlam4,dlam3,dlam5,dlam6,dv,dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),dlam5,dv,dvv,dZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,dlam1,dlam4,dlam3,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*dZH(gt3,1))
res = res-(lam6*vv*dZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*dZH(gt3,1))/2._dp
res = res-(lam6*v*dZH(gt3,2))/2._dp
res = res-(lam3*vv*dZH(gt3,2))
res = res-(lam4*vv*dZH(gt3,2))
res = res+lam5*vv*dZH(gt3,2)
res = res-(v*Conjg(lam6)*dZH(gt3,2))/2._dp
res = res-(dv*lam1*ZH(gt3,1))
res = res-(dvv*lam6*ZH(gt3,1))/2._dp
res = res-(dlam1*v*ZH(gt3,1))
res = res-(dlam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(dlam6)*ZH(gt3,1))/2._dp
res = res-(dvv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(dvv*lam3*ZH(gt3,2))
res = res-(dvv*lam4*ZH(gt3,2))
res = res+dvv*lam5*ZH(gt3,2)
res = res-(dv*lam6*ZH(gt3,2))/2._dp
res = res-(dlam6*v*ZH(gt3,2))/2._dp
res = res-(dlam3*vv*ZH(gt3,2))
res = res-(dlam4*vv*ZH(gt3,2))
res = res+dlam5*vv*ZH(gt3,2)
res = res-(v*Conjg(dlam6)*ZH(gt3,2))/2._dp
res = res-(dv*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhAhhh  
 
 
Subroutine CT_CouplingAhetIetI(lam7,vv,dlam7,dvv,res)

Implicit None 

Real(dp), Intent(in) :: vv,dvv

Complex(dp), Intent(in) :: lam7,dlam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhetIetI' 
 
res = 0._dp 
res = res-(dvv*lam7)/2._dp
res = res-(dlam7*vv)/2._dp
res = res+(vv*Conjg(dlam7))/2._dp
res = res+(dvv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhetIetI  
 
 
Subroutine CT_CouplingAhetIhh(gt3,lam7,lam5,lam6,v,vv,ZH,dlam7,dlam5,dlam6,           & 
& dv,dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),dlam5,dv,dvv,dZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6,dlam7,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*dZH(gt3,1))/2._dp
res = res-(lam5*vv*dZH(gt3,1))
res = res-(v*Conjg(lam6)*dZH(gt3,1))/2._dp
res = res-(lam5*v*dZH(gt3,2))
res = res-(lam7*vv*dZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt3,2))/2._dp
res = res-(dvv*lam5*ZH(gt3,1))
res = res-(dv*lam6*ZH(gt3,1))/2._dp
res = res-(dlam6*v*ZH(gt3,1))/2._dp
res = res-(dlam5*vv*ZH(gt3,1))
res = res-(v*Conjg(dlam6)*ZH(gt3,1))/2._dp
res = res-(dv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(dv*lam5*ZH(gt3,2))
res = res-(dvv*lam7*ZH(gt3,2))/2._dp
res = res-(dlam5*v*ZH(gt3,2))
res = res-(dlam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(dlam7)*ZH(gt3,2))/2._dp
res = res-(dvv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhetIhh  
 
 
Subroutine CT_CouplingAhhhhh(gt2,gt3,lam7,lam6,v,vv,ZH,dlam7,dlam6,dv,dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2),dv,dvv,dZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6,dlam7,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*vv*dZH(gt3,1)*ZH(gt2,1))/2._dp
res = res+(vv*Conjg(lam6)*dZH(gt3,1)*ZH(gt2,1))/2._dp
res = res-(lam6*v*dZH(gt3,2)*ZH(gt2,1))/2._dp
res = res+(v*Conjg(lam6)*dZH(gt3,2)*ZH(gt2,1))/2._dp
res = res-(lam6*v*dZH(gt3,1)*ZH(gt2,2))/2._dp
res = res+(v*Conjg(lam6)*dZH(gt3,1)*ZH(gt2,2))/2._dp
res = res+(-3*lam7*vv*dZH(gt3,2)*ZH(gt2,2))/2._dp
res = res+(3*vv*Conjg(lam7)*dZH(gt3,2)*ZH(gt2,2))/2._dp
res = res-(lam6*vv*dZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*dZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*dZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*dZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dvv*lam6*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dlam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(dlam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dvv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dv*lam6*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dlam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(dlam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dv*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*dZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*dZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*dZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*dZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dv*lam6*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dlam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(dlam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*dvv*lam7*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dlam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(dlam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*dvv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhhh  
 
 
Subroutine CT_CouplingAhHmcHm(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,             & 
& dlam4,dlam7,dlam5,dlam6,dmu,dlam10,dvv,dZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,vv,ZP(3,3),dlam5,dvv,dZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10,dlam4,dlam7,dlam6,dmu,dlam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam10*vv*dZP(gt3,1)*ZP(gt2,1))/2._dp
res = res+(vv*Conjg(lam10)*dZP(gt3,1)*ZP(gt2,1))/2._dp
res = res+(Conjg(mu)*dZP(gt3,3)*ZP(gt2,1))/sqrt(2._dp)
res = res-(lam6*vv*dZP(gt3,2)*ZP(gt2,2))/2._dp
res = res+(vv*Conjg(lam6)*dZP(gt3,2)*ZP(gt2,2))/2._dp
res = res-(lam4*vv*dZP(gt3,3)*ZP(gt2,2))/2._dp
res = res+(lam5*vv*dZP(gt3,3)*ZP(gt2,2))/2._dp
res = res-((mu*dZP(gt3,1)*ZP(gt2,3))/sqrt(2._dp))
res = res+(lam4*vv*dZP(gt3,2)*ZP(gt2,3))/2._dp
res = res-(lam5*vv*dZP(gt3,2)*ZP(gt2,3))/2._dp
res = res-(lam7*vv*dZP(gt3,3)*ZP(gt2,3))/2._dp
res = res+(vv*Conjg(lam7)*dZP(gt3,3)*ZP(gt2,3))/2._dp
res = res-(lam10*vv*dZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(vv*Conjg(lam10)*dZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*dZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(dvv*lam10*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dlam10*vv*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(vv*Conjg(dlam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dvv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((dmu*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(lam6*vv*dZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(vv*Conjg(lam6)*dZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(lam4*vv*dZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*dZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dvv*lam6*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dlam6*vv*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(vv*Conjg(dlam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dvv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dvv*lam4*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dvv*lam5*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(dlam4*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dlam5*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(Conjg(mu)*dZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*dZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam5*vv*dZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam7*vv*dZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(vv*Conjg(lam7)*dZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(Conjg(dmu)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(dvv*lam4*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(dvv*lam5*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dlam4*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(dlam5*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dvv*lam7*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dlam7*vv*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(vv*Conjg(dlam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(dvv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHmcHm  
 
 
Subroutine CT_CouplingetIetIetI(lam7,v,dlam7,dv,res)

Implicit None 

Real(dp), Intent(in) :: v,dv

Complex(dp), Intent(in) :: lam7,dlam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*dv*lam7)/2._dp
res = res+(3*dlam7*v)/2._dp
res = res+(-3*v*Conjg(dlam7))/2._dp
res = res+(-3*dv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIetIetI  
 
 
Subroutine CT_CouplingetIetIhh(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,dlam2,            & 
& dlam4,dlam3,dlam7,dlam5,dv,dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),dlam5,dv,dvv,dZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7,dlam2,dlam4,dlam3,dlam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*dZH(gt3,1))
res = res-(lam4*v*dZH(gt3,1))
res = res+lam5*v*dZH(gt3,1)
res = res-(lam7*vv*dZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt3,1))/2._dp
res = res-(lam7*v*dZH(gt3,2))/2._dp
res = res-(lam2*vv*dZH(gt3,2))
res = res-(v*Conjg(lam7)*dZH(gt3,2))/2._dp
res = res-(dv*lam3*ZH(gt3,1))
res = res-(dv*lam4*ZH(gt3,1))
res = res+dv*lam5*ZH(gt3,1)
res = res-(dvv*lam7*ZH(gt3,1))/2._dp
res = res-(dlam3*v*ZH(gt3,1))
res = res-(dlam4*v*ZH(gt3,1))
res = res+dlam5*v*ZH(gt3,1)
res = res-(dlam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(dlam7)*ZH(gt3,1))/2._dp
res = res-(dvv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(dvv*lam2*ZH(gt3,2))
res = res-(dv*lam7*ZH(gt3,2))/2._dp
res = res-(dlam7*v*ZH(gt3,2))/2._dp
res = res-(dlam2*vv*ZH(gt3,2))
res = res-(v*Conjg(dlam7)*ZH(gt3,2))/2._dp
res = res-(dv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIetIhh  
 
 
Subroutine CT_CouplingetIhhhh(gt2,gt3,lam7,lam6,v,vv,ZH,dlam7,dlam6,dv,               & 
& dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2),dv,dvv,dZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6,dlam7,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIhhhh' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*lam6*v*dZH(gt3,1)*ZH(gt2,1))/2._dp
res = res+(-3*v*Conjg(lam6)*dZH(gt3,1)*ZH(gt2,1))/2._dp
res = res+(lam7*vv*dZH(gt3,2)*ZH(gt2,1))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt3,2)*ZH(gt2,1))/2._dp
res = res+(lam7*vv*dZH(gt3,1)*ZH(gt2,2))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt3,1)*ZH(gt2,2))/2._dp
res = res+(lam7*v*dZH(gt3,2)*ZH(gt2,2))/2._dp
res = res-(v*Conjg(lam7)*dZH(gt3,2)*ZH(gt2,2))/2._dp
res = res+(3*lam6*v*dZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*dZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*dZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(3*dv*lam6*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(3*dlam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(dlam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(dvv*lam7*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(dlam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(dlam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dvv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*dZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*dZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*dZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dvv*lam7*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dlam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(dlam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dvv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(dv*lam7*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(dlam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(dlam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIhhhh  
 
 
Subroutine CT_CouplingetIHmcHm(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,             & 
& dlam4,dlam7,dlam5,dlam6,dmu,dlam10,dv,dZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,v,ZP(3,3),dlam5,dv,dZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10,dlam4,dlam7,dlam6,dmu,dlam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam10*v*dZP(gt3,1)*ZP(gt2,1))/2._dp
res = res-(v*Conjg(lam10)*dZP(gt3,1)*ZP(gt2,1))/2._dp
res = res-((Conjg(mu)*dZP(gt3,2)*ZP(gt2,1))/sqrt(2._dp))
res = res+(mu*dZP(gt3,1)*ZP(gt2,2))/sqrt(2._dp)
res = res+(lam6*v*dZP(gt3,2)*ZP(gt2,2))/2._dp
res = res-(v*Conjg(lam6)*dZP(gt3,2)*ZP(gt2,2))/2._dp
res = res+(lam4*v*dZP(gt3,3)*ZP(gt2,2))/2._dp
res = res-(lam5*v*dZP(gt3,3)*ZP(gt2,2))/2._dp
res = res-(lam4*v*dZP(gt3,2)*ZP(gt2,3))/2._dp
res = res+(lam5*v*dZP(gt3,2)*ZP(gt2,3))/2._dp
res = res+(lam7*v*dZP(gt3,3)*ZP(gt2,3))/2._dp
res = res-(v*Conjg(lam7)*dZP(gt3,3)*ZP(gt2,3))/2._dp
res = res+(lam10*v*dZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(lam10)*dZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(mu*dZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
res = res+(dv*lam10*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dlam10*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(dlam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(dmu*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*dZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(lam6*v*dZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(lam6)*dZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam4*v*dZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam5*v*dZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-((Conjg(dmu)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(dv*lam6*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(dlam6*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(dlam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dv*lam4*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(dv*lam5*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dlam4*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(dlam5*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam4*v*dZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*dZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam7*v*dZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam7)*dZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(dv*lam4*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dv*lam5*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(dlam4*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dlam5*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(dv*lam7*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(dlam7*v*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(dlam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIHmcHm  
 
 
Subroutine CT_Couplinghhhhhh(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,v,vv,ZH,dlam1,dlam2,dlam4,dlam3,dlam7,dlam5,dlam6,dv,dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),dlam5,dv,dvv,dZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,dlam1,dlam2,dlam4,dlam3,dlam7,dlam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_Couplinghhhhhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*lam1*v*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1)
res = res+(-3*lam6*vv*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(-3*lam6*v*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res-(lam3*vv*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))
res = res-(lam4*vv*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))
res = res-(lam5*vv*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))
res = res+(-3*v*Conjg(lam6)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(-3*lam6*v*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(lam3*vv*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))
res = res-(lam4*vv*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))
res = res-(lam5*vv*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))
res = res+(-3*v*Conjg(lam6)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res-(lam3*v*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))
res = res-(lam4*v*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))
res = res-(lam5*v*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))
res = res+(-3*lam7*vv*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,1))/2._dp
res = res+(-3*lam6*v*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(lam3*vv*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))
res = res-(lam4*vv*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))
res = res-(lam5*vv*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))
res = res+(-3*v*Conjg(lam6)*dZH(gt3,1)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(lam3*v*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))
res = res-(lam4*v*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))
res = res-(lam5*v*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))
res = res+(-3*lam7*vv*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt3,2)*ZH(gt1,1)*ZH(gt2,2))/2._dp
res = res-(lam3*v*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))
res = res-(lam4*v*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))
res = res-(lam5*v*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))
res = res+(-3*lam7*vv*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt3,1)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+(-3*lam7*v*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-3*lam2*vv*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2)
res = res+(-3*v*Conjg(lam7)*dZH(gt3,2)*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res-3*lam1*v*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))
res = res-(lam4*vv*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))
res = res-(lam5*vv*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))
res = res-(lam4*vv*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))
res = res-(lam5*vv*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))
res = res-(lam4*v*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))
res = res-(lam5*v*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,1))/2._dp
res = res-3*lam1*v*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*vv*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam5*vv*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-3*dv*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*dvv*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-3*dlam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*dlam6*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(dlam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dvv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dvv*lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dvv*lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dvv*lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*dv*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dlam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(dlam3*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dlam4*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(dlam5*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(dlam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*dv*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*vv*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*vv*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*v*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*v*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dvv*lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dvv*lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dvv*lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*dv*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*dlam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dlam3*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dlam4*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dlam5*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(dlam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*dv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dv*lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dv*lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dv*lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*dvv*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(dlam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dlam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(dlam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*dlam7*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(dlam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*dvv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))
res = res-(lam4*vv*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))
res = res-(lam5*vv*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*dZH(gt2,1)*ZH(gt1,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))
res = res-(lam4*v*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))
res = res-(lam5*v*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt2,2)*ZH(gt1,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))
res = res-(lam4*v*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))
res = res-(lam5*v*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt2,1)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*dZH(gt2,2)*ZH(gt1,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam6*v*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*vv*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*vv*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*dZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*v*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*v*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dvv*lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dvv*lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dvv*lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*dv*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*dlam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dlam3*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dlam4*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dlam5*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(dlam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*dv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dv*lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dv*lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dv*lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*dvv*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(dlam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dlam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(dlam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*dlam7*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(dlam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*dvv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam4*v*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam5*v*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*dZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*dZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dv*lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dv*lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dv*lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*dvv*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(dlam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dlam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(dlam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*dlam7*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(dlam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dvv*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*dvv*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*dv*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dlam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*dlam2*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(dlam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*dv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_Couplinghhhhhh  
 
 
Subroutine CT_CouplinghhHmcHm(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,mu,lam10,v,vv,ZH,ZP,dlam1,dlam2,dlam4,dlam3,dlam7,dlam5,dlam6,          & 
& dlam9,dlam8,dmu,dlam10,dv,dvv,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),ZP(3,3),dlam5,dv,dvv,dZH(2,2),dZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,mu,lam10,dlam1,dlam2,dlam4,dlam3,             & 
& dlam7,dlam6,dlam9,dlam8,dmu,dlam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHmcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam8*v*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))
res = res-(lam10*vv*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res-(vv*Conjg(lam10)*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,1))/2._dp
res = res+(Conjg(mu)*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,1))/sqrt(2._dp)
res = res-(lam10*v*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/2._dp
res = res-(lam9*vv*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))
res = res-(v*Conjg(lam10)*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,1))/2._dp
res = res-((Conjg(mu)*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,1))/sqrt(2._dp))
res = res-(lam1*v*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))
res = res-(lam6*vv*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(vv*Conjg(lam6)*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(lam4*vv*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(lam5*vv*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(v*Conjg(lam6)*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,2))
res = res-((mu*dZP(gt3,1)*ZH(gt1,2)*ZP(gt2,2))/sqrt(2._dp))
res = res-(lam6*v*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(lam3*vv*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))
res = res-(v*Conjg(lam6)*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(lam4*v*dZP(gt3,3)*ZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(lam5*v*dZP(gt3,3)*ZH(gt1,2)*ZP(gt2,2))/2._dp
res = res-(vv*Conjg(lam7)*dZP(gt3,3)*ZH(gt1,2)*ZP(gt2,2))
res = res+(mu*dZP(gt3,1)*ZH(gt1,1)*ZP(gt2,3))/sqrt(2._dp)
res = res-(lam6*v*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,3))
res = res-(lam4*vv*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,3))/2._dp
res = res-(lam5*vv*dZP(gt3,2)*ZH(gt1,1)*ZP(gt2,3))/2._dp
res = res-(lam3*v*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,3))
res = res-(lam7*vv*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,3))/2._dp
res = res-(vv*Conjg(lam7)*dZP(gt3,3)*ZH(gt1,1)*ZP(gt2,3))/2._dp
res = res-(lam4*v*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,3))/2._dp
res = res-(lam5*v*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,3))/2._dp
res = res-(lam7*vv*dZP(gt3,2)*ZH(gt1,2)*ZP(gt2,3))
res = res-(lam7*v*dZP(gt3,3)*ZH(gt1,2)*ZP(gt2,3))/2._dp
res = res-(lam2*vv*dZP(gt3,3)*ZH(gt1,2)*ZP(gt2,3))
res = res-(v*Conjg(lam7)*dZP(gt3,3)*ZH(gt1,2)*ZP(gt2,3))/2._dp
res = res-(lam8*v*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))
res = res-(lam10*vv*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res-(vv*Conjg(lam10)*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,1))/2._dp
res = res+(mu*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,1))/sqrt(2._dp)
res = res-(lam10*v*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-(lam9*vv*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))
res = res-(v*Conjg(lam10)*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,1))/2._dp
res = res-((mu*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-(lam8*v*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(lam10*vv*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(vv*Conjg(lam10)*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam10*v*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam9*vv*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(lam10)*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dvv*lam10*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dv*lam8*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(dlam8*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(dlam10*vv*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(vv*Conjg(dlam10)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dvv*Conjg(lam10)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dv*lam10*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dvv*lam9*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(dlam10*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dlam9*vv*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(dlam10)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(dv*Conjg(lam10)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res-((dmu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(mu*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
res = res+(dmu*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
res = res-(lam1*v*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))
res = res-(lam6*vv*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(vv*Conjg(lam6)*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(lam6*v*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,2))
res = res-(lam4*vv*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,2))/2._dp
res = res-((Conjg(mu)*dZP(gt2,1)*ZH(gt1,2)*ZP(gt3,2))/sqrt(2._dp))
res = res-(lam6*v*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(lam3*vv*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))
res = res-(v*Conjg(lam6)*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(lam4*v*dZP(gt2,3)*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(lam5*v*dZP(gt2,3)*ZH(gt1,2)*ZP(gt3,2))/2._dp
res = res-(lam7*vv*dZP(gt2,3)*ZH(gt1,2)*ZP(gt3,2))
res = res-((Conjg(mu)*dZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-((Conjg(dmu)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-(lam1*v*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(lam6*vv*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(vv*Conjg(lam6)*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam3*vv*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(lam6)*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dv*lam1*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(dvv*lam6*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dlam1*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(dlam6*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(vv*Conjg(dlam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dvv*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dvv*lam3*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(dv*lam6*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dlam6*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dlam3*vv*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(dlam6)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(dv*Conjg(lam6)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))
res = res-(lam4*vv*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam4*v*dZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*v*dZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam7*vv*dZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))
res = res-(dvv*lam4*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dvv*lam5*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dv*lam6*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))
res = res-(dlam6*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))
res = res-(dlam4*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dlam5*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dv*lam4*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dv*lam5*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dvv*lam7*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))
res = res-(dlam4*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dlam5*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(dlam7*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))
res = res+(Conjg(mu)*dZP(gt2,1)*ZH(gt1,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,3))/2._dp
res = res-(lam5*vv*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam6)*dZP(gt2,2)*ZH(gt1,1)*ZP(gt3,3))
res = res-(lam3*v*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,3))
res = res-(lam7*vv*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*dZP(gt2,3)*ZH(gt1,1)*ZP(gt3,3))/2._dp
res = res-(lam4*v*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*dZP(gt2,2)*ZH(gt1,2)*ZP(gt3,3))
res = res-(lam7*v*dZP(gt2,3)*ZH(gt1,2)*ZP(gt3,3))/2._dp
res = res-(lam2*vv*dZP(gt2,3)*ZH(gt1,2)*ZP(gt3,3))
res = res-(v*Conjg(lam7)*dZP(gt2,3)*ZH(gt1,2)*ZP(gt3,3))/2._dp
res = res+(Conjg(mu)*dZH(gt1,1)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res+(Conjg(dmu)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*vv*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam6)*dZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam4*v*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))
res = res-(dvv*lam4*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dvv*lam5*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dlam4*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dlam5*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(dlam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))
res = res-(dv*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))
res = res-(dv*lam4*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dv*lam5*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dlam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(dlam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(dlam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))
res = res-(dvv*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam3*v*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))
res = res-(lam7*vv*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*dZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam7*v*dZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam2*vv*dZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))
res = res-(v*Conjg(lam7)*dZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dv*lam3*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))
res = res-(dvv*lam7*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dlam3*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))
res = res-(dlam7*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(dlam7)*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dvv*Conjg(lam7)*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dvv*lam2*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))
res = res-(dv*lam7*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dlam7*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dlam2*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))
res = res-(v*Conjg(dlam7)*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(dv*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHmcHm  
 
 
Subroutine CT_CouplingAhhhVZ(gt2,g1,g2,ZH,TW,dg1,dg2,dZH,dSinTW,dCosTW,               & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW,dg1,dg2,dZH(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*dZH(gt2,1))/2._dp
res = res+(g1*dZH(gt2,1)*Sin(TW))/2._dp
res = res+(dSinTW*g1*ZH(gt2,1))/2._dp
res = res+(dCosTW*g2*ZH(gt2,1))/2._dp
res = res+(dg2*Cos(TW)*ZH(gt2,1))/2._dp
res = res+(dg1*Sin(TW)*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhhhVZ  
 
 
Subroutine CT_CouplingAhHmVWp(gt2,g2,ZP,dg2,dZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3),dg2,dZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhHmVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,2))/2._dp
res = res-(dg2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhHmVWp  
 
 
Subroutine CT_CouplingAhcHmcVWp(gt2,g2,ZP,dg2,dZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3),dg2,dZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingAhcHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,2))/2._dp
res = res-(dg2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingAhcHmcVWp  
 
 
Subroutine CT_CouplingetIhhVZ(gt2,g1,g2,ZH,TW,dg1,dg2,dZH,dSinTW,dCosTW,              & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW,dg1,dg2,dZH(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*dZH(gt2,2))/2._dp
res = res+(g1*dZH(gt2,2)*Sin(TW))/2._dp
res = res+(dSinTW*g1*ZH(gt2,2))/2._dp
res = res+(dCosTW*g2*ZH(gt2,2))/2._dp
res = res+(dg2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(dg1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIhhVZ  
 
 
Subroutine CT_CouplingetIHmVWp(gt2,g2,ZP,dg2,dZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3),dg2,dZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIHmVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,3))/2._dp
res = res-(dg2*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIHmVWp  
 
 
Subroutine CT_CouplingetIcHmcVWp(gt2,g2,ZP,dg2,dZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3),dg2,dZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingetIcHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,3))/2._dp
res = res-(dg2*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingetIcHmcVWp  
 
 
Subroutine CT_CouplinghhHmVWp(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(3,3),dg2,dZH(2,2),dZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhHmVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*dZP(gt2,2)*ZH(gt1,1))/2._dp
res = res-(g2*dZP(gt2,3)*ZH(gt1,2))/2._dp
res = res-(g2*dZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(dg2*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(g2*dZH(gt1,2)*ZP(gt2,3))/2._dp
res = res-(dg2*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhHmVWp  
 
 
Subroutine CT_CouplinghhcHmcVWp(gt1,gt2,g2,ZH,ZP,dg2,dZH,dZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(3,3),dg2,dZH(2,2),dZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcHmcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*dZP(gt2,2)*ZH(gt1,1))/2._dp
res = res+(g2*dZP(gt2,3)*ZH(gt1,2))/2._dp
res = res+(g2*dZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(dg2*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g2*dZH(gt1,2)*ZP(gt2,3))/2._dp
res = res+(dg2*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcHmcVWp  
 
 
Subroutine CT_CouplingHmcHmVP(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW,dg1,dg2,dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHmcHmVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+g1*Cos(TW)*dZP(gt2,1)*ZP(gt1,1)
res = res+(g1*Cos(TW)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res+(g2*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(g1*Cos(TW)*dZP(gt2,3)*ZP(gt1,3))/2._dp
res = res+(g2*dZP(gt2,3)*Sin(TW)*ZP(gt1,3))/2._dp
res = res+g1*Cos(TW)*dZP(gt1,1)*ZP(gt2,1)
res = res+dCosTW*g1*ZP(gt1,1)*ZP(gt2,1)
res = res+dg1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1)
res = res+(g1*Cos(TW)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res+(dCosTW*g1*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dSinTW*g2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Cos(TW)*dZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(g2*dZP(gt1,3)*Sin(TW)*ZP(gt2,3))/2._dp
res = res+(dCosTW*g1*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(dSinTW*g2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(dg1*Cos(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(dg2*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHmcHmVP  
 
 
Subroutine CT_CouplingHmcHmVZ(gt1,gt2,g1,g2,ZP,TW,dg1,dg2,dZP,dSinTW,dCosTW,          & 
& dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW,dg1,dg2,dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHmcHmVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*dZP(gt2,1)*Sin(TW)*ZP(gt1,1))
res = res+(g2*Cos(TW)*dZP(gt2,2)*ZP(gt1,2))/2._dp
res = res-(g1*dZP(gt2,2)*Sin(TW)*ZP(gt1,2))/2._dp
res = res+(g2*Cos(TW)*dZP(gt2,3)*ZP(gt1,3))/2._dp
res = res-(g1*dZP(gt2,3)*Sin(TW)*ZP(gt1,3))/2._dp
res = res-(g1*dZP(gt1,1)*Sin(TW)*ZP(gt2,1))
res = res-(dSinTW*g1*ZP(gt1,1)*ZP(gt2,1))
res = res-(dg1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))
res = res+(g2*Cos(TW)*dZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*dZP(gt1,2)*Sin(TW)*ZP(gt2,2))/2._dp
res = res-(dSinTW*g1*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dCosTW*g2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(dg2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(dg1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*Cos(TW)*dZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1*dZP(gt1,3)*Sin(TW)*ZP(gt2,3))/2._dp
res = res-(dSinTW*g1*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(dCosTW*g2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(dg2*Cos(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(dg1*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHmcHmVZ  
 
 
Subroutine CT_CouplinghhcVWpVWp(gt1,g2,v,vv,ZH,dg2,dv,dvv,dZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2),dg2,dv,dvv,dZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*dZH(gt1,1))/2._dp
res = res+(g2**2*vv*dZH(gt1,2))/2._dp
res = res+(dv*g2**2*ZH(gt1,1))/2._dp
res = res+dg2*g2*v*ZH(gt1,1)
res = res+(dvv*g2**2*ZH(gt1,2))/2._dp
res = res+dg2*g2*vv*ZH(gt1,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhcVWpVWp  
 
 
Subroutine CT_CouplinghhVZVZ(gt1,g1,g2,v,vv,ZH,TW,dg1,dg2,dv,dvv,dZH,dSinTW,          & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW,dg1,dg2,dv,dvv,dZH(2,2),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1**2*v*dZH(gt1,1))/4._dp
res = res+(g2**2*v*dZH(gt1,1))/4._dp
res = res-(g1**2*v*Cos(TW)**2*dZH(gt1,1))/4._dp
res = res+(g2**2*v*Cos(TW)**2*dZH(gt1,1))/4._dp
res = res+(g1**2*vv*dZH(gt1,2))/4._dp
res = res+(g2**2*vv*dZH(gt1,2))/4._dp
res = res-(g1**2*vv*Cos(TW)**2*dZH(gt1,2))/4._dp
res = res+(g2**2*vv*Cos(TW)**2*dZH(gt1,2))/4._dp
res = res+g1*g2*v*Cos(TW)*dZH(gt1,1)*Sin(TW)
res = res+g1*g2*vv*Cos(TW)*dZH(gt1,2)*Sin(TW)
res = res+(g1**2*v*dZH(gt1,1)*Sin(TW)**2)/4._dp
res = res-(g2**2*v*dZH(gt1,1)*Sin(TW)**2)/4._dp
res = res+(g1**2*vv*dZH(gt1,2)*Sin(TW)**2)/4._dp
res = res-(g2**2*vv*dZH(gt1,2)*Sin(TW)**2)/4._dp
res = res+(dv*g1**2*ZH(gt1,1))/4._dp
res = res+(dv*g2**2*ZH(gt1,1))/4._dp
res = res+(dg1*g1*v*ZH(gt1,1))/2._dp
res = res+(dg2*g2*v*ZH(gt1,1))/2._dp
res = res-(dCosTW*g1**2*v*Cos(TW)*ZH(gt1,1))/2._dp
res = res+dSinTW*g1*g2*v*Cos(TW)*ZH(gt1,1)
res = res+(dCosTW*g2**2*v*Cos(TW)*ZH(gt1,1))/2._dp
res = res-(dv*g1**2*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res+(dv*g2**2*Cos(TW)**2*ZH(gt1,1))/4._dp
res = res-(dg1*g1*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+(dg2*g2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+(dSinTW*g1**2*v*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dCosTW*g1*g2*v*Sin(TW)*ZH(gt1,1)
res = res-(dSinTW*g2**2*v*Sin(TW)*ZH(gt1,1))/2._dp
res = res+dv*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+dg2*g1*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+dg1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(dv*g1**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res-(dv*g2**2*Sin(TW)**2*ZH(gt1,1))/4._dp
res = res+(dg1*g1*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res-(dg2*g2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(dvv*g1**2*ZH(gt1,2))/4._dp
res = res+(dvv*g2**2*ZH(gt1,2))/4._dp
res = res+(dg1*g1*vv*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vv*ZH(gt1,2))/2._dp
res = res-(dCosTW*g1**2*vv*Cos(TW)*ZH(gt1,2))/2._dp
res = res+dSinTW*g1*g2*vv*Cos(TW)*ZH(gt1,2)
res = res+(dCosTW*g2**2*vv*Cos(TW)*ZH(gt1,2))/2._dp
res = res-(dvv*g1**2*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res+(dvv*g2**2*Cos(TW)**2*ZH(gt1,2))/4._dp
res = res-(dg1*g1*vv*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+(dg2*g2*vv*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+(dSinTW*g1**2*vv*Sin(TW)*ZH(gt1,2))/2._dp
res = res+dCosTW*g1*g2*vv*Sin(TW)*ZH(gt1,2)
res = res-(dSinTW*g2**2*vv*Sin(TW)*ZH(gt1,2))/2._dp
res = res+dvv*g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+dg2*g1*vv*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+dg1*g2*vv*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(dvv*g1**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res-(dvv*g2**2*Sin(TW)**2*ZH(gt1,2))/4._dp
res = res+(dg1*g1*vv*Sin(TW)**2*ZH(gt1,2))/2._dp
res = res-(dg2*g2*vv*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplinghhVZVZ  
 
 
Subroutine CT_CouplingHmVPVWp(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,dSinTW,         & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW,dg1,dg2,dv,dvv,dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHmVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*dZP(gt1,2))/2._dp
res = res+(g1*g2*vv*Cos(TW)*dZP(gt1,3))/2._dp
res = res+(dCosTW*g1*g2*v*ZP(gt1,2))/2._dp
res = res+(dv*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dCosTW*g1*g2*vv*ZP(gt1,3))/2._dp
res = res+(dvv*g1*g2*Cos(TW)*ZP(gt1,3))/2._dp
res = res+(dg2*g1*vv*Cos(TW)*ZP(gt1,3))/2._dp
res = res+(dg1*g2*vv*Cos(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHmVPVWp  
 
 
Subroutine CT_CouplingHmVWpVZ(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,dSinTW,         & 
& dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW,dg1,dg2,dv,dvv,dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingHmVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*dZP(gt1,2)*Sin(TW))/2._dp
res = res-(g1*g2*vv*dZP(gt1,3)*Sin(TW))/2._dp
res = res-(dSinTW*g1*g2*v*ZP(gt1,2))/2._dp
res = res-(dv*g1*g2*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dSinTW*g1*g2*vv*ZP(gt1,3))/2._dp
res = res-(dvv*g1*g2*Sin(TW)*ZP(gt1,3))/2._dp
res = res-(dg2*g1*vv*Sin(TW)*ZP(gt1,3))/2._dp
res = res-(dg1*g2*vv*Sin(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingHmVWpVZ  
 
 
Subroutine CT_CouplingcHmcVWpVP(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,              & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW,dg1,dg2,dv,dvv,dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHmcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*dZP(gt1,2))/2._dp
res = res+(g1*g2*vv*Cos(TW)*dZP(gt1,3))/2._dp
res = res+(dCosTW*g1*g2*v*ZP(gt1,2))/2._dp
res = res+(dv*g1*g2*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg2*g1*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dg1*g2*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(dCosTW*g1*g2*vv*ZP(gt1,3))/2._dp
res = res+(dvv*g1*g2*Cos(TW)*ZP(gt1,3))/2._dp
res = res+(dg2*g1*vv*Cos(TW)*ZP(gt1,3))/2._dp
res = res+(dg1*g2*vv*Cos(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHmcVWpVP  
 
 
Subroutine CT_CouplingcHmcVWpVZ(gt1,g1,g2,v,vv,ZP,TW,dg1,dg2,dv,dvv,dZP,              & 
& dSinTW,dCosTW,dTanTW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW,dg1,dg2,dv,dvv,dZP(3,3),dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcHmcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*dZP(gt1,2)*Sin(TW))/2._dp
res = res-(g1*g2*vv*dZP(gt1,3)*Sin(TW))/2._dp
res = res-(dSinTW*g1*g2*v*ZP(gt1,2))/2._dp
res = res-(dv*g1*g2*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg2*g1*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dg1*g2*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(dSinTW*g1*g2*vv*ZP(gt1,3))/2._dp
res = res-(dvv*g1*g2*Sin(TW)*ZP(gt1,3))/2._dp
res = res-(dg2*g1*vv*Sin(TW)*ZP(gt1,3))/2._dp
res = res-(dg1*g2*vv*Sin(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcHmcVWpVZ  
 
 
Subroutine CT_CouplingVGVGVG(g3,dg3,res)

Implicit None 

Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingVGVGVG' 
 
res = 0._dp 
res = res+dg3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingVGVGVG  
 
 
Subroutine CT_CouplingcVWpVPVWp(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res+dSinTW*g2
res = res+dg2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWpVPVWp  
 
 
Subroutine CT_CouplingcVWpVWpVZ(g2,TW,dg2,dSinTW,dCosTW,dTanTW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res-(dCosTW*g2)
res = res-(dg2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcVWpVWpVZ  
 
 
Subroutine CT_CouplingcFdFdAh(gt1,gt2,Yd,ZDL,ZDR,dYd,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*dYd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdAh  
 
 
Subroutine CT_CouplingcFeFeAh(gt1,gt2,Ye,ZEL,ZER,dYe,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3),dYe(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*dYe(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZEL(gt1,j2)*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYe(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeAh  
 
 
Subroutine CT_CouplingcFuFuAh(gt1,gt2,Yu,ZUL,ZUR,dYu,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3),dYu(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuAh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*dYu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuAh  
 
 
Subroutine CT_CouplingcFdFdetI(gt1,gt2,epsD,ZDL,ZDR,depsD,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3),depsD(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*depsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(depsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdetI  
 
 
Subroutine CT_CouplingcFeFeetI(gt1,gt2,epsE,ZEL,ZER,depsE,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3),depsE(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*depsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j1))*Conjg(ZER(gt1,j2))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*dZEL(gt1,j1)*ZER(gt2,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*dZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(depsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeetI  
 
 
Subroutine CT_CouplingcFuFuetI(gt1,gt2,epsU,ZUL,ZUR,depsU,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3),depsU(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuetI' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*depsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*dZUL(gt1,j2)*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*dZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(depsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuetI  
 
 
Subroutine CT_CouplingcFdFdhh(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,depsD,dYd,               & 
& dZH,dZDL,dZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),depsD(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*dZH(gt3,2)*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*dZH(gt3,1)*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*dYd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*depsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDL(gt2,j2))*Conjg(ZDR(gt1,j1))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*dZH(gt3,1)*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*dZH(gt3,2)*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*dZDL(gt1,j2)*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*dZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(depsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdhh  
 
 
Subroutine CT_CouplingcFuFdHm(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,             & 
& ZUR,depsU,dYu,depsD,dYd,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3),dZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),              & 
& depsU(3,3),dYu(3,3),depsD(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*dZP(gt3,3)*epsU(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*dZP(gt3,2)*Yu(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*dYu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*depsU(j1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDL(gt2,j2))*Conjg(ZUR(gt1,j1))*epsU(j1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsU(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZP(gt3,2)*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,j2))*dZP(gt3,3)*ZDR(gt2,j1)*ZUL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZUL(gt1,j2)*ZDR(gt2,j1)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*dZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,j2))*dZUL(gt1,j2)*ZDR(gt2,j1)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,j2))*dZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(depsD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdHm  
 
 
Subroutine CT_CouplingFvFeHm(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,depsE,              & 
& dYe,dYh,dZP,dUV,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3),dZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3),depsE(3,3),dYe(3,3),              & 
& dYh(3,3),dUV(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFeHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*dZP(gt3,1)*Yh(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*dZP(gt3,1)*Yh(j1,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*dYh(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*dYh(j1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dUV(gt1,j2))*Conjg(ZEL(gt2,j1))*Yh(j1,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt1,j1))*Conjg(ZEL(gt2,j2))*Yh(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZEL(gt2,j2))*Conjg(UV(gt1,j1))*Yh(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(dZEL(gt2,j1))*Conjg(UV(gt1,j2))*Yh(j1,j2)*ZP(gt3,1))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,j2))*dZP(gt3,3)*ZER(gt2,j2)*UV(gt1,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZP(gt3,2)*ZER(gt2,j1)*UV(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dUV(gt1,j2)*ZER(gt2,j1)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*dZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYe(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,j2))*dUV(gt1,j1)*ZER(gt2,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,j2))*dZER(gt2,j2)*UV(gt1,j1)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(depsE(j1,j2))*ZER(gt2,j2)*UV(gt1,j1)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFeHm  
 
 
Subroutine CT_CouplingcFeFehh(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,depsE,dYe,               & 
& dZH,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),depsE(3,3),dYe(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFehh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*dZH(gt3,2)*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*dZH(gt3,1)*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*dYe(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*depsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZEL(gt2,j1))*Conjg(ZER(gt1,j2))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(dZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*dZH(gt3,2)*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*dZH(gt3,1)*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*dZEL(gt1,j2)*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*dZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(dYe(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*dZEL(gt1,j1)*ZER(gt2,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*dZER(gt2,j2)*ZEL(gt1,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(depsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFehh  
 
 
Subroutine CT_CouplingcFuFuhh(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,depsU,dYu,               & 
& dZH,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2),dZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),depsU(3,3),dYu(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuhh' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZH(gt3,2)*epsU(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZH(gt3,1)*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*dYu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*depsU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUL(gt2,j2))*Conjg(ZUR(gt1,j1))*epsU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(dZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZH(gt3,1)*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*dZH(gt3,2)*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUL(gt1,j2)*ZUR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(dYu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*dZUL(gt1,j2)*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*dZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(depsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuhh  
 
 
Subroutine CT_CouplingcFdFucHm(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,            & 
& ZUR,depsU,dYu,depsD,dYd,dZP,dZDL,dZDR,dZUL,dZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3),dZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3),              & 
& depsU(3,3),dYu(3,3),depsD(3,3),dYd(3,3),dZDL(3,3),dZDR(3,3),dZUL(3,3),dZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFucHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZP(gt3,3)*epsD(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dZP(gt3,2)*Yd(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*dYd(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(ZDR(gt1,j1))*Yd(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*depsD(j1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZUL(gt2,j2))*Conjg(ZDR(gt1,j1))*epsD(j1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZP(gt3,2)*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*dZP(gt3,3)*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZDL(gt1,j2)*ZUR(gt2,j1)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*dZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*dZDL(gt1,j2)*ZUR(gt2,j1)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*dZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(depsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFucHm  
 
 
Subroutine CT_CouplingcFeFvcHm(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,depsE,            & 
& dYe,dYh,dZP,dUV,dZEL,dZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3),dZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3),depsE(3,3),dYe(3,3),              & 
& dYh(3,3),dUV(3,3),dZEL(3,3),dZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvcHm' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*Conjg(UV(gt2,j1))*dZP(gt3,3)*epsE(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*dZP(gt3,2)*Ye(j1,j2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*dYe(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt2,j2))*Conjg(ZER(gt1,j1))*Ye(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*Conjg(UV(gt2,j1))*depsE(j1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dUV(gt2,j1))*Conjg(ZER(gt1,j2))*epsE(j1,j2)*ZP(gt3,3)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(dZER(gt1,j2))*Conjg(UV(gt2,j1))*epsE(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*dZP(gt3,1)*ZEL(gt1,j2)*UV(gt2,j1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*dZP(gt3,1)*ZEL(gt1,j1)*UV(gt2,j2))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*dUV(gt2,j2)*ZEL(gt1,j1)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*dUV(gt2,j1)*ZEL(gt1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*dZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(dYh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*dZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,1))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(dYh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvcHm  
 
 
Subroutine CT_CouplingcFdFdVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVG  
 
 
Subroutine CT_CouplingcFdFdVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVP  
 
 
Subroutine CT_CouplingcFdFdVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFdVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFdVZ  
 
 
Subroutine CT_CouplingcFuFdcVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFdcVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZDL(gt2,j1))*dZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFdcVWp  
 
 
Subroutine CT_CouplingFvFecVWp(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3),dUV(3,3),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFecVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZEL(gt2,j1))*dUV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFecVWp  
 
 
Subroutine CT_CouplingcFeFeVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+dCosTW*g1
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+dg1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVP  
 
 
Subroutine CT_CouplingcFeFeVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFeVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(dSinTW*g1)
End If 
If ((gt1.eq.gt2)) Then 
resR = resR-(dg1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFeVZ  
 
 
Subroutine CT_CouplingcFuFuVG(gt1,gt2,g3,dg3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3,dg3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVG' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-1._dp*(dg3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(dg3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVG  
 
 
Subroutine CT_CouplingcFuFuVP(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dCosTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*dg1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVP  
 
 
Subroutine CT_CouplingcFdFuVWp(gt1,gt2,g2,ZDL,ZUL,dg2,dZDL,dZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),dZDL(3,3),dZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFdFuVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(ZUL(gt2,j1))*dZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFdFuVWp  
 
 
Subroutine CT_CouplingcFuFuVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,          & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFuFuVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL+(dSinTW*g1)/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(dg1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dSinTW*g1)/3._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*dg1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFuFuVZ  
 
 
Subroutine CT_CouplingFvFvVZ(gt1,gt2,g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW,           & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW,dg1,dg2,dSinTW,dCosTW,dTanTW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingFvFvVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
If ((gt1.eq.gt2)) Then 
resL = resL-(dSinTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(dg1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(dSinTW*g1)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dCosTW*g2)/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(dg1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingFvFvVZ  
 
 
Subroutine CT_CouplingcFeFvVWp(gt1,gt2,g2,UV,ZEL,dg2,dUV,dZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,dg2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3),dUV(3,3),dZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CT_CouplingcFeFvVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

resL = 0._dp 
Do j1 = 1,3
resL = resL-((g2*Conjg(UV(gt2,j1))*dZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((g2*Conjg(dUV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
Do j1 = 1,3
resL = resL-((dg2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CT_CouplingcFeFvVWp  
 
 
End Module CouplingsCT_radinuZeeHB 
