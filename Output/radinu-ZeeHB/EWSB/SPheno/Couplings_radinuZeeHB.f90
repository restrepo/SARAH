! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:59 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Couplings_radinuZeeHB
 
Use Control 
Use Settings 
Use Model_Data_radinuZeeHB 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Contains 
 
 Subroutine AllCouplingsReallyAll(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,               & 
& mu,lam10,ZP,lam2,lam9,lam8,lamh,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,              & 
& ZUR,epsD,epsE,epsU,Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,        & 
& cplAhhhhh,cplAhHmcHm,cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,        & 
& cplhhHmcHm,cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,cplAhAhetIhh,            & 
& cplAhAhhhhh,cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,cplAhetIHmcHm,      & 
& cplAhhhhhhh,cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,cpletIetIHmcHm,  & 
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

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),ZP(3,3),g1,g2,TW,g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,mu,lam10,lam2,lam9,lam8,lamh,Yd(3,3),ZDL(3,3),               & 
& ZDR(3,3),Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),      & 
& epsU(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
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

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplingsReallyAll'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetIT(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetIT(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhhT(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingAhHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cpletIetIetI = 0._dp 
Call CouplingetIetIetIT(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,vv,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhT(lam1,cplAhAhAhAh)



cplAhAhAhetI = 0._dp 
Call CouplingAhAhAhetIT(lam6,cplAhAhAhetI)



cplAhAhAhhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhhT(gt4,lam6,ZH,cplAhAhAhhh(gt4))

End Do 


cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetIT(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhetIhhT(gt4,lam6,ZH,cplAhAhetIhh(gt4))

End Do 


cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhT(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhAhHmcHmT(gt3,gt4,lam1,lam3,lam6,lam8,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhetIetIetI = 0._dp 
Call CouplingAhetIetIetIT(lam7,cplAhetIetIetI)



cplAhetIetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhetIetIhhT(gt4,lam7,ZH,cplAhetIetIhh(gt4))

End Do 


cplAhetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhetIhhhhT(gt3,gt4,lam7,lam5,lam6,ZH,cplAhetIhhhh(gt3,gt4))

 End Do 
End Do 


cplAhetIHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhetIHmcHmT(gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZP,cplAhetIHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,cplAhhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 3
  Do gt4 = 1, 3
Call CouplingAhhhHmcHmT(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,cplAhhhHmcHm(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetIT(lam2,cpletIetIetIetI)



cpletIetIetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingetIetIetIhhT(gt4,lam7,ZH,cpletIetIetIhh(gt4))

End Do 


cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhhT(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingetIetIHmcHmT(gt3,gt4,lam2,lam3,lam7,lam9,ZP,cpletIetIHmcHm(gt3,gt4))

 End Do 
End Do 


cpletIhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingetIhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,cpletIhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIhhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 3
  Do gt4 = 1, 3
Call CouplingetIhhHmcHmT(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,cpletIhhHmcHm(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhHmcHmT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& lam9,lam8,lam10,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingHmHmcHmcHmT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,lam9,lam8,lamh,lam10,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpT(gt2,g2,ZP,cplAhHmVWp(gt2))

End Do 


cplAhcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpT(gt2,g2,ZP,cplAhcHmcVWp(gt2))

End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpT(gt2,g2,ZP,cpletIHmVWp(gt2))

End Do 


cpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpT(gt2,g2,ZP,cpletIcHmcVWp(gt2))

End Do 


cplhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpT(gt1,gt2,g2,ZH,ZP,cplhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpT(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


cplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmVPVWp = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVPVWpT(gt1,g1,g2,v,vv,ZP,TW,cplHmVPVWp(gt1))

End Do 


cplHmVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplHmVWpVZ(gt1))

End Do 


cplcHmcVWpVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVPT(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVP(gt1))

End Do 


cplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVZ(gt1))

End Do 


cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpT(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZT(g1,g2,TW,cplAhAhVZVZ)



cplAhHmVPVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVPVWpT(gt2,g1,g2,ZP,TW,cplAhHmVPVWp(gt2))

End Do 


cplAhHmVWpVZ = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpVZT(gt2,g1,g2,ZP,TW,cplAhHmVWpVZ(gt2))

End Do 


cplAhcHmcVWpVP = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpVPT(gt2,g1,g2,ZP,TW,cplAhcHmcVWpVP(gt2))

End Do 


cplAhcHmcVWpVZ = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpVZT(gt2,g1,g2,ZP,TW,cplAhcHmcVWpVZ(gt2))

End Do 


cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpT(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZT(g1,g2,TW,cpletIetIVZVZ)



cpletIHmVPVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVPVWpT(gt2,g1,g2,ZP,TW,cpletIHmVPVWp(gt2))

End Do 


cpletIHmVWpVZ = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpVZT(gt2,g1,g2,ZP,TW,cpletIHmVWpVZ(gt2))

End Do 


cpletIcHmcVWpVP = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpVPT(gt2,g1,g2,ZP,TW,cpletIcHmcVWpVP(gt2))

End Do 


cpletIcHmcVWpVZ = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpVZT(gt2,g1,g2,ZP,TW,cpletIcHmcVWpVZ(gt2))

End Do 


cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpT(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplhhHmVPVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVPVWpT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmVPVWp(gt1,gt2))

 End Do 
End Do 


cplhhHmVWpVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpVZT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmVWpVZ(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWpVP = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpVPT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmcVWpVP(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWpVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpVZT(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmcVWpVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWpVWp = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWpVWpT(gt1,gt2,g2,ZP,cplHmcHmcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGT(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpT(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZT(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpT(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZT(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGT(g3,cplcgGgGVG)



cplcgWpgAVWp = 0._dp 
Call CouplingcgWpgAVWpT(g2,TW,cplcgWpgAVWp)



cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpT(g2,TW,cplcgWCgAcVWp)



cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPT(g2,TW,cplcgWpgWpVP)



cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZT(g2,TW,cplcgWpgWpVZ)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpT(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpT(g2,TW,cplcgZgWpcVWp)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPT(g2,TW,cplcgWCgWCVP)



cplcgAgWCVWp = 0._dp 
Call CouplingcgAgWCVWpT(g2,TW,cplcgAgWCVWp)



cplcgZgWCVWp = 0._dp 
Call CouplingcgZgWCVWpT(g2,TW,cplcgZgWCVWp)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZT(g2,TW,cplcgWCgWCVZ)



cplcgWpgZVWp = 0._dp 
Call CouplingcgWpgZVWpT(g2,TW,cplcgWpgZVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpT(g2,TW,cplcgWCgZcVWp)



cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhT(g2,v,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhT(g2,v,cplcgWCgWCAh)



cplcgWpgWpetI = 0._dp 
Call CouplingcgWpgWpetIT(g2,vv,cplcgWpgWpetI)



cplcgWCgWCetI = 0._dp 
Call CouplingcgWCgWCetIT(g2,vv,cplcgWCgWCetI)



cplcgZgAhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgAhhT(gt3,g1,g2,v,vv,ZH,TW,cplcgZgAhh(gt3))

End Do 


cplcgWCgAHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWCgAHmT(gt3,g1,g2,v,vv,ZP,TW,cplcgWCgAHm(gt3))

End Do 


cplcgWpgAcHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWpgAcHmT(gt3,g1,g2,v,vv,ZP,TW,cplcgWpgAcHm(gt3))

End Do 


cplcgWpgWphh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWphhT(gt3,g2,v,vv,ZH,cplcgWpgWphh(gt3))

End Do 


cplcgZgWpHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWpHmT(gt3,g1,g2,v,vv,ZP,TW,cplcgZgWpHm(gt3))

End Do 


cplcgWCgWChh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWChhT(gt3,g2,v,vv,ZH,cplcgWCgWChh(gt3))

End Do 


cplcgZgWCcHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWCcHmT(gt3,g1,g2,v,vv,ZP,TW,cplcgZgWCcHm(gt3))

End Do 


cplcgZgZhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZhhT(gt3,g1,g2,v,vv,ZH,TW,cplcgZgZhh(gt3))

End Do 


cplcgWCgZHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWCgZHmT(gt3,g1,g2,v,vv,ZP,TW,cplcgWCgZHm(gt3))

End Do 


cplcgWpgZcHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWpgZcHmT(gt3,g1,g2,v,vv,ZP,TW,cplcgWpgZcHm(gt3))

End Do 


Iname = Iname - 1 
End Subroutine AllCouplingsReallyAll

Subroutine AllCouplings(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,lam10,               & 
& ZP,lam2,lam9,lam8,g1,g2,TW,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,epsE,              & 
& epsU,Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,            & 
& cplAhHmcHm,cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,       & 
& cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplhhHmVWp,     & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplhhcVWpVWp,cplhhVZVZ,cplHmVPVWp,cplHmVWpVZ,       & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,cplcFdFdAhL,             & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcFdFdetIL,              & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,     & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,cplcFeFeVPR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),ZP(3,3),g1,g2,TW,g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,mu,lam10,lam2,lam9,lam8,Yd(3,3),ZDL(3,3),ZDR(3,3),           & 
& Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),               & 
& epsU(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplAhhhVZ(2),cplAhHmVWp(3),cplAhcHmcVWp(3),         & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIcHmcVWp(3),cplhhHmVWp(2,3),cplhhcHmcVWp(2,3),       & 
& cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplHmVPVWp(3),            & 
& cplHmVWpVZ(3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplVGVGVG,cplcVWpVPVWp,cplcVWpVWpVZ,     & 
& cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),  & 
& cplcFuFuAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),             & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),             & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),       & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),              & 
& cplFvFecVWpR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3), & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3), & 
& cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),   & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'AllCouplings'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAhT(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetIT(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhT(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetIT(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhhT(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingAhHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cpletIetIetI = 0._dp 
Call CouplingetIetIetIT(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,vv,             & 
& ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHmT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZT(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpT(gt2,g2,ZP,cplAhHmVWp(gt2))

End Do 


cplAhcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpT(gt2,g2,ZP,cplAhcHmcVWp(gt2))

End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZT(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpT(gt2,g2,ZP,cpletIHmVWp(gt2))

End Do 


cpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpT(gt2,g2,ZP,cpletIcHmcVWp(gt2))

End Do 


cplhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpT(gt1,gt2,g2,ZH,ZP,cplhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpT(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


cplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmVPVWp = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVPVWpT(gt1,g1,g2,v,vv,ZP,TW,cplHmVPVWp(gt1))

End Do 


cplHmVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplHmVWpVZ(gt1))

End Do 


cplcHmcVWpVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVPT(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVP(gt1))

End Do 


cplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVZT(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVZ(gt1))

End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVGT(g3,cplVGVGVG)



cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpT(g2,TW,cplcVWpVPVWp)



cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZT(g2,TW,cplcVWpVWpVZ)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFdFucHmL(gt1,gt2,gt3)& 
& ,cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGT(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGT(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWpL = 0._dp 
cplcFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,cplcFdFuVWpL(gt1,gt2),cplcFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZT(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine AllCouplings

Subroutine CouplingAhAhAhT(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhT  
 
 
Subroutine CouplingAhAhetIT(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIT  
 
 
Subroutine CouplingAhAhhhT(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhT  
 
 
Subroutine CouplingAhetIetIT(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIT  
 
 
Subroutine CouplingAhetIhhT(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhT  
 
 
Subroutine CouplingAhhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhT  
 
 
Subroutine CouplingAhHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,vv,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
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
res = res-(lam10*vv*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(vv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(lam6*vv*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(vv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(lam4*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(Conjg(mu)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam5*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam7*vv*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(vv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHmT  
 
 
Subroutine CouplingetIetIetIT(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIT  
 
 
Subroutine CouplingetIetIhhT(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhT  
 
 
Subroutine CouplingetIhhhhT(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhT  
 
 
Subroutine CouplingetIHmcHmT(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,v,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmcHm' 
 
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
res = res+(lam10*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(mu*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(lam6*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam5*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam4*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam7*v*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmcHmT  
 
 
Subroutine CouplinghhhhhhT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
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
res = res-3*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhT  
 
 
Subroutine CouplinghhHmcHmT(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& lam9,lam8,mu,lam10,v,vv,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
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
res = res-(lam8*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(lam10*vv*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(vv*Conjg(lam10)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam10*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam9*vv*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(lam10)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(mu*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-(lam1*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(lam6*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(lam6)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam7*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))
res = res+(Conjg(mu)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam3*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))
res = res-(lam7*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam7*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam2*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))
res = res-(v*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHmT  
 
 
Subroutine CouplingAhAhAhAhT(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhT  
 
 
Subroutine CouplingAhAhAhetIT(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhetI' 
 
res = 0._dp 
res = res-3._dp*(lam6)/2._dp
res = res+(-3*Conjg(lam6))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhetIT  
 
 
Subroutine CouplingAhAhAhhhT(gt4,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*lam6*ZH(gt4,2))/2._dp
res = res+(3*Conjg(lam6)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhhT  
 
 
Subroutine CouplingAhAhetIetIT(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetIT  
 
 
Subroutine CouplingAhAhetIhhT(gt4,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam6*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIhhT  
 
 
Subroutine CouplingAhAhhhhhT(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhT  
 
 
Subroutine CouplingAhAhHmcHmT(gt3,gt4,lam1,lam3,lam6,lam8,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam3,lam6,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam8*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam1*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmT  
 
 
Subroutine CouplingAhetIetIetIT(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam7)/2._dp
res = res+(-3*Conjg(lam7))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIetIT  
 
 
Subroutine CouplingAhetIetIhhT(gt4,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam7*ZH(gt4,2))/2._dp
res = res+(Conjg(lam7)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIhhT  
 
 
Subroutine CouplingAhetIhhhhT(gt3,gt4,lam7,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhhhT  
 
 
Subroutine CouplingAhetIHmcHmT(gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam10*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam6*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam4*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam4*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam7*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZP(gt3,3)*ZP(gt4,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIHmcHmT  
 
 
Subroutine CouplingAhhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(3*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhhT  
 
 
Subroutine CouplingAhhhHmcHmT(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam10*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res+(Conjg(lam10)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res+(lam4*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam4*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res+(lam5*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam7*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res+(Conjg(lam7)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHmT  
 
 
Subroutine CouplingetIetIetIetIT(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetIT  
 
 
Subroutine CouplingetIetIetIhhT(gt4,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*lam7*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIhhT  
 
 
Subroutine CouplingetIetIhhhhT(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhT  
 
 
Subroutine CouplingetIetIHmcHmT(gt3,gt4,lam2,lam3,lam7,lam9,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam2,lam3,lam7,lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam9*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam3*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam7*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam7)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam2*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHmcHmT  
 
 
Subroutine CouplingetIhhhhhhT(gt2,gt3,gt4,lam7,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhhhT  
 
 
Subroutine CouplingetIhhHmcHmT(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam10*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res+(lam6*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam4*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res+(lam5*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res+(lam4*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res+(lam7*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhHmcHmT  
 
 
Subroutine CouplinghhhhhhhhT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,           & 
& lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+(-3*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-3*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhT  
 
 
Subroutine CouplinghhhhHmcHmT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lam10,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
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

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam8*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam10*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam10*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam9*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))
res = res-(lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmT  
 
 
Subroutine CouplingHmHmcHmcHmT(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,              & 
& lam5,lam6,lam9,lam8,lamh,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-4*lamh*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res = res-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
res = res-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
res = res-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,1))
res = res-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,1))
res = res-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,2))
res = res-2*lam1*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*lam6*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*lam6*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*lam5*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2)
res = res-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
res = res-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2)
res = res-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
res = res-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
res = res-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,3))
res = res-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,3))
res = res-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3)
res = res-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
res = res-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3)
res = res-2*lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
res = res-2*Conjg(lam7)*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
res = res-2*Conjg(lam7)*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
res = res-2*lam2*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmT  
 
 
Subroutine CouplingAhhhVZT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZT  
 
 
Subroutine CouplingAhHmVWpT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVWpT  
 
 
Subroutine CouplingAhcHmcVWpT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWpT  
 
 
Subroutine CouplingetIhhVZT(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhVZT  
 
 
Subroutine CouplingetIHmVWpT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmVWpT  
 
 
Subroutine CouplingetIcHmcVWpT(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcHmcVWpT  
 
 
Subroutine CouplinghhHmVWpT(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVWp' 
 
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
res = res-(g2*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(g2*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVWpT  
 
 
Subroutine CouplinghhcHmcVWpT(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWp' 
 
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
res = res+(g2*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g2*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWpT  
 
 
Subroutine CouplingHmcHmVPT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
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
res = res+g1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1)
res = res+(g1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Cos(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(g2*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPT  
 
 
Subroutine CouplingHmcHmVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
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
res = res-(g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))
res = res+(g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*Cos(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZT  
 
 
Subroutine CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpT  
 
 
Subroutine CouplinghhVZVZT(gt1,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*vv*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*vv*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZT  
 
 
Subroutine CouplingHmVPVWpT(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(g1*g2*vv*Cos(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVPVWpT  
 
 
Subroutine CouplingHmVWpVZT(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*g2*vv*Sin(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVWpVZT  
 
 
Subroutine CouplingcHmcVWpVPT(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(g1*g2*vv*Cos(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWpVPT  
 
 
Subroutine CouplingcHmcVWpVZT(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*g2*vv*Sin(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWpVZT  
 
 
Subroutine CouplingAhAhcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpT  
 
 
Subroutine CouplingAhAhVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZT  
 
 
Subroutine CouplingAhHmVPVWpT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVPVWpT  
 
 
Subroutine CouplingAhHmVWpVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVWpVZT  
 
 
Subroutine CouplingAhcHmcVWpVPT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWpVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWpVPT  
 
 
Subroutine CouplingAhcHmcVWpVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWpVZT  
 
 
Subroutine CouplingetIetIcVWpVWpT(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIcVWpVWpT  
 
 
Subroutine CouplingetIetIVZVZT(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIVZVZT  
 
 
Subroutine CouplingetIHmVPVWpT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmVPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Cos(TW)*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmVPVWpT  
 
 
Subroutine CouplingetIHmVWpVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Sin(TW)*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmVWpVZT  
 
 
Subroutine CouplingetIcHmcVWpVPT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcHmcVWpVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*Cos(TW)*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcHmcVWpVPT  
 
 
Subroutine CouplingetIcHmcVWpVZT(gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcHmcVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*Sin(TW)*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcHmcVWpVZT  
 
 
Subroutine CouplinghhhhcVWpVWpT(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
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

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpT  
 
 
Subroutine CouplinghhhhVZVZT(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
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

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZT  
 
 
Subroutine CouplinghhHmVPVWpT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVPVWp' 
 
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
res = res+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVPVWpT  
 
 
Subroutine CouplinghhHmVWpVZT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVWpVZ' 
 
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
res = res-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVWpVZT  
 
 
Subroutine CouplinghhcHmcVWpVPT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWpVP' 
 
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
res = res+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWpVPT  
 
 
Subroutine CouplinghhcHmcVWpVZT(gt1,gt2,g1,g2,ZH,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWpVZ' 
 
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
res = res-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWpVZT  
 
 
Subroutine CouplingHmcHmVPVPT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
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
res = res+2*g1**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1)
res = res+(g1**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1**2*Cos(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,3)*ZP(gt2,3)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPT  
 
 
Subroutine CouplingHmcHmVPVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
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
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZT  
 
 
Subroutine CouplingHmcHmcVWpVWpT(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWpVWp' 
 
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
res = res+(g2**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWpVWpT  
 
 
Subroutine CouplingHmcHmVZVZT(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
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
res = res+2*g1**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1)
res = res+(g2**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2**2*Cos(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZT  
 
 
Subroutine CouplingVGVGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGT  
 
 
Subroutine CouplingcVWpVPVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpT  
 
 
Subroutine CouplingcVWpVWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZT  
 
 
Subroutine CouplingcFdFdAhT(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhT  
 
 
Subroutine CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhT  
 
 
Subroutine CouplingcFuFuAhT(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhT  
 
 
Subroutine CouplingcFdFdetIT(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetIT  
 
 
Subroutine CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetIT  
 
 
Subroutine CouplingcFuFuetIT(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuetIT  
 
 
Subroutine CouplingcFdFdhhT(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhhT  
 
 
Subroutine CouplingcFuFdHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,               & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHm' 
 
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
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsU(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHmT  
 
 
Subroutine CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHm' 
 
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
resL = resL+Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*Yh(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*Yh(j1,j2)*ZP(gt3,1))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,j2))*ZER(gt2,j2)*UV(gt1,j1)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHmT  
 
 
Subroutine CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehhT  
 
 
Subroutine CouplingcFuFuhhT(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
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
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhhT  
 
 
Subroutine CouplingcFdFucHmT(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,              & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHm' 
 
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
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHmT  
 
 
Subroutine CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHm' 
 
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
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*Conjg(UV(gt2,j1))*epsE(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHmT  
 
 
Subroutine CouplingcFdFdVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGT  
 
 
Subroutine CouplingcFdFdVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
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
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPT  
 
 
Subroutine CouplingcFdFdVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
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
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZT  
 
 
Subroutine CouplingcFuFdcVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWp' 
 
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
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWpT  
 
 
Subroutine CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecVWp' 
 
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
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecVWpT  
 
 
Subroutine CouplingcFeFeVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
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
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPT  
 
 
Subroutine CouplingcFeFeVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
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
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZT  
 
 
Subroutine CouplingcFuFuVGT(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGT  
 
 
Subroutine CouplingcFuFuVPT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
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
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPT  
 
 
Subroutine CouplingcFdFuVWpT(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFuVWp' 
 
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
resL = resL-((g2*Conjg(ZUL(gt2,j1))*ZDL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFuVWpT  
 
 
Subroutine CouplingcFuFuVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
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
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZT  
 
 
Subroutine CouplingFvFvVZT(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
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
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZT  
 
 
Subroutine CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvVWp' 
 
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
resL = resL-((g2*Conjg(UV(gt2,j1))*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvVWpT  
 
 
Subroutine CouplingVGVGVGVGT(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGT  
 
 
Subroutine CouplingcVWpVPVPVWpT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpT  
 
 
Subroutine CouplingcVWpVPVWpVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Sin(TW)
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZT  
 
 
Subroutine CouplingcVWpcVWpVWpVWpT(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpT  
 
 
Subroutine CouplingcVWpVWpVZVZT(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZT  
 
 
Subroutine CouplingcgGgGVGT(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGT  
 
 
Subroutine CouplingcgWpgAVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAVWpT  
 
 
Subroutine CouplingcgWCgAcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpT  
 
 
Subroutine CouplingcgWpgWpVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPT  
 
 
Subroutine CouplingcgWpgWpVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZT  
 
 
Subroutine CouplingcgAgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpT  
 
 
Subroutine CouplingcgZgWpcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpT  
 
 
Subroutine CouplingcgWCgWCVPT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPT  
 
 
Subroutine CouplingcgAgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWCVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWCVWpT  
 
 
Subroutine CouplingcgZgWCVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCVWpT  
 
 
Subroutine CouplingcgWCgWCVZT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZT  
 
 
Subroutine CouplingcgWpgZVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZVWpT  
 
 
Subroutine CouplingcgWCgZcVWpT(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpT  
 
 
Subroutine CouplingcgWpgWpAhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhT  
 
 
Subroutine CouplingcgWCgWCAhT(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
res = 0._dp 
res = res+(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhT  
 
 
Subroutine CouplingcgWpgWpetIT(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpetI' 
 
res = 0._dp 
res = res-(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpetIT  
 
 
Subroutine CouplingcgWCgWCetIT(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCetI' 
 
res = 0._dp 
res = res+(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCetIT  
 
 
Subroutine CouplingcgZgAhhT(gt3,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgAhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(2._dp*(TW))*RXiZ*ZH(gt3,1))/4._dp
res = res+(g1**2*v*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res-(g2**2*v*RXiZ*Sin(2._dp*(TW))*ZH(gt3,1))/8._dp
res = res+(g1*g2*vv*Cos(2._dp*(TW))*RXiZ*ZH(gt3,2))/4._dp
res = res+(g1**2*vv*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
res = res-(g2**2*vv*RXiZ*Sin(2._dp*(TW))*ZH(gt3,2))/8._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgAhhT  
 
 
Subroutine CouplingcgWCgAHmT(gt3,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWp*ZP(gt3,2))/4._dp
res = res-(g2**2*v*RXiWp*Sin(TW)*ZP(gt3,2))/4._dp
res = res-(g1*g2*vv*Cos(TW)*RXiWp*ZP(gt3,3))/4._dp
res = res-(g2**2*vv*RXiWp*Sin(TW)*ZP(gt3,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAHmT  
 
 
Subroutine CouplingcgWpgAcHmT(gt3,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgAcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Cos(TW)*RXiWp*ZP(gt3,2))/4._dp
res = res-(g2**2*v*RXiWp*Sin(TW)*ZP(gt3,2))/4._dp
res = res-(g1*g2*vv*Cos(TW)*RXiWp*ZP(gt3,3))/4._dp
res = res-(g2**2*vv*RXiWp*Sin(TW)*ZP(gt3,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgAcHmT  
 
 
Subroutine CouplingcgWpgWphhT(gt3,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWphh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWp*ZH(gt3,1))/4._dp
res = res-(g2**2*vv*RXiWp*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWphhT  
 
 
Subroutine CouplingcgZgWpHmT(gt3,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ*ZP(gt3,2))/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW)*ZP(gt3,2))/4._dp
res = res+(g2**2*vv*Cos(TW)*RXiZ*ZP(gt3,3))/4._dp
res = res+(g1*g2*vv*RXiZ*Sin(TW)*ZP(gt3,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpHmT  
 
 
Subroutine CouplingcgWCgWChhT(gt3,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWChh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*RXiWp*ZH(gt3,1))/4._dp
res = res-(g2**2*vv*RXiWp*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWChhT  
 
 
Subroutine CouplingcgZgWCcHmT(gt3,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)*RXiZ*ZP(gt3,2))/4._dp
res = res+(g1*g2*v*RXiZ*Sin(TW)*ZP(gt3,2))/4._dp
res = res+(g2**2*vv*Cos(TW)*RXiZ*ZP(gt3,3))/4._dp
res = res+(g1*g2*vv*RXiZ*Sin(TW)*ZP(gt3,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCcHmT  
 
 
Subroutine CouplingcgZgZhhT(gt3,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)**2*RXiZ*ZH(gt3,1))/4._dp
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,1))/2._dp
res = res-(g1**2*v*RXiZ*Sin(TW)**2*ZH(gt3,1))/4._dp
res = res-(g2**2*vv*Cos(TW)**2*RXiZ*ZH(gt3,2))/4._dp
res = res-(g1*g2*vv*Cos(TW)*RXiZ*Sin(TW)*ZH(gt3,2))/2._dp
res = res-(g1**2*vv*RXiZ*Sin(TW)**2*ZH(gt3,2))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZhhT  
 
 
Subroutine CouplingcgWCgZHmT(gt3,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp*ZP(gt3,2))/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW)*ZP(gt3,2))/4._dp
res = res-(g2**2*vv*Cos(TW)*RXiWp*ZP(gt3,3))/4._dp
res = res+(g1*g2*vv*RXiWp*Sin(TW)*ZP(gt3,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZHmT  
 
 
Subroutine CouplingcgWpgZcHmT(gt3,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2**2*v*Cos(TW)*RXiWp*ZP(gt3,2))/4._dp
res = res+(g1*g2*v*RXiWp*Sin(TW)*ZP(gt3,2))/4._dp
res = res-(g2**2*vv*Cos(TW)*RXiWp*ZP(gt3,3))/4._dp
res = res+(g1*g2*vv*RXiWp*Sin(TW)*ZP(gt3,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcHmT  
 
 
Subroutine CouplingsForEffPot4(lam1,lam4,lam3,lam5,lam6,ZH,lam8,ZP,lam2,              & 
& lam7,lam9,lam10,lamh,cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh,cplAhAhHmcHm,               & 
& cpletIetIetIetI,cpletIetIhhhh,cpletIetIHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm)

Implicit None 
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,lam8,lam2,lam7,lam9,lam10,lamh

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhetIetI,cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cpletIetIetIetI,         & 
& cpletIetIhhhh(2,2),cpletIetIHmcHm(3,3),cplhhhhhhhh(2,2,2,2),cplhhhhHmcHm(2,2,3,3),     & 
& cplHmHmcHmcHm(3,3,3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2L(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetI2L(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhh2L(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhAhHmcHm2L(gt3,gt4,lam1,lam3,lam6,lam8,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetI2L(lam2,cpletIetIetIetI)



cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhh2L(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingetIetIHmcHm2L(gt3,gt4,lam2,lam3,lam7,lam9,ZP,cpletIetIHmcHm(gt3,gt4))

 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhHmcHm2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,lam9,lam8,lam10,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingHmHmcHmcHm2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,lamh,lam10,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot4

Subroutine CouplingsForEffPot3(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,              & 
& lam10,ZP,lam2,lam9,lam8,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,epsE,epsU,            & 
& Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhHmcHm,      & 
& cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,cplVGVGVG,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),ZP(3,3),g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,mu,lam10,lam2,lam9,lam8,Yd(3,3),ZDL(3,3),ZDR(3,3),           & 
& Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),               & 
& epsU(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplVGVGVG,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3), & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),            & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),          & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),          & 
& cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForEffPot3'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAh2L(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetI2L(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhh2L(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetI2L(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhh2L(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingAhHmcHm2L(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cpletIetIetI = 0._dp 
Call CouplingetIetIetI2L(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhh2L(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHm2L(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2L(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,               & 
& vv,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHm2L(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,           & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2L(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2L(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2L(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2L(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetI2L(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetI2L(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetI2L(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2L(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)        & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHm2L(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,cplcFuFdHmL(gt1,gt2,gt3)& 
& ,cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHm2L(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)    & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2L(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)        & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2L(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)        & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHm2L(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,               & 
& cplcFdFucHmL(gt1,gt2,gt3),cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHm2L(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2L(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2L(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForEffPot3

Subroutine CouplingAhAhAhAh2L(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2L  
 
 
Subroutine CouplingAhAhetIetI2L(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetI2L  
 
 
Subroutine CouplingAhAhhhhh2L(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2L  
 
 
Subroutine CouplingAhAhHmcHm2L(gt3,gt4,lam1,lam3,lam6,lam8,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam3,lam6,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam8*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam1*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam6*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*ZP(gt3,3)*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHm2L  
 
 
Subroutine CouplingetIetIetIetI2L(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetI2L  
 
 
Subroutine CouplingetIetIhhhh2L(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhh2L  
 
 
Subroutine CouplingetIetIHmcHm2L(gt3,gt4,lam2,lam3,lam7,lam9,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam2,lam3,lam7,lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt3.eq.gt4)) Then 
res = res-(lam9*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam3*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam7*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt3.eq.gt4)) Then 
res = res-(lam2*ZP(gt3,3)*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHmcHm2L  
 
 
Subroutine Couplinghhhhhhhh2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-3*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2L  
 
 
Subroutine CouplinghhhhHmcHm2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,              & 
& lam5,lam6,lam9,lam8,lam10,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
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

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam8*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam10*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam10*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam9*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((gt1.eq.gt2).And.(gt3.eq.gt4)) Then 
res = res-(lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHm2L  
 
 
Subroutine CouplingHmHmcHmcHm2L(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,             & 
& lam5,lam6,lam9,lam8,lamh,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-4*lamh*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,1))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam1*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam6*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam6*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam5*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(lam7)*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*Conjg(lam7)*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
End If 
If ((gt1.eq.gt3).And.(gt2.eq.gt4)) Then 
res = res-2*lam2*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHm2L  
 
 
Subroutine CouplingAhAhAh2L(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAh2L  
 
 
Subroutine CouplingAhAhetI2L(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetI2L  
 
 
Subroutine CouplingAhAhhh2L(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2L  
 
 
Subroutine CouplingAhetIetI2L(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetI2L  
 
 
Subroutine CouplingAhetIhh2L(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhh2L  
 
 
Subroutine CouplingAhhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhh2L  
 
 
Subroutine CouplingAhHmcHm2L(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,vv,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
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
res = res-(lam10*vv*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(vv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(lam6*vv*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(vv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(lam4*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(Conjg(mu)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam5*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam7*vv*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(vv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHm2L  
 
 
Subroutine CouplingetIetIetI2L(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetI2L  
 
 
Subroutine CouplingetIetIhh2L(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhh2L  
 
 
Subroutine CouplingetIhhhh2L(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhh2L  
 
 
Subroutine CouplingetIHmcHm2L(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,v,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmcHm' 
 
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
res = res+(lam10*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(mu*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(lam6*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam5*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam4*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam7*v*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmcHm2L  
 
 
Subroutine Couplinghhhhhh2L(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
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
res = res-3*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2L  
 
 
Subroutine CouplinghhHmcHm2L(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,lam9,lam8,mu,lam10,v,vv,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
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
res = res-(lam8*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(lam10*vv*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(vv*Conjg(lam10)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam10*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam9*vv*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(lam10)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(mu*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-(lam1*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(lam6*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(lam6)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam7*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))
res = res+(Conjg(mu)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam3*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))
res = res-(lam7*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam7*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam2*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))
res = res-(v*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHm2L  
 
 
Subroutine CouplingVGVGVG2L(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2L  
 
 
Subroutine CouplingcFdFdAh2L(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2L  
 
 
Subroutine CouplingcFeFeAh2L(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2L  
 
 
Subroutine CouplingcFuFuAh2L(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2L  
 
 
Subroutine CouplingcFdFdetI2L(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetI2L  
 
 
Subroutine CouplingcFeFeetI2L(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetI2L  
 
 
Subroutine CouplingcFuFuetI2L(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuetI2L  
 
 
Subroutine CouplingcFdFdhh2L(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2L  
 
 
Subroutine CouplingcFuFdHm2L(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,              & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHm' 
 
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
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsU(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHm2L  
 
 
Subroutine CouplingFvFeHm2L(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHm' 
 
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
resL = resL+Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*Yh(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*Yh(j1,j2)*ZP(gt3,1))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,j2))*ZER(gt2,j2)*UV(gt1,j1)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHm2L  
 
 
Subroutine CouplingcFeFehh2L(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2L  
 
 
Subroutine CouplingcFuFuhh2L(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
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
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2L  
 
 
Subroutine CouplingcFdFucHm2L(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,             & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHm' 
 
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
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHm2L  
 
 
Subroutine CouplingcFeFvcHm2L(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHm' 
 
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
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*Conjg(UV(gt2,j1))*epsE(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHm2L  
 
 
Subroutine CouplingcFdFdVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2L  
 
 
Subroutine CouplingcFuFuVG2L(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2L  
 
 
Subroutine CouplingsFor2LPole3(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,              & 
& lam10,ZP,lam2,lam9,lam8,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,epsE,epsU,            & 
& Yh,UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhHmcHm,      & 
& cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,cplVGVGVG,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Implicit None 
Real(dp), Intent(in) :: vv,v,lam5,ZH(2,2),ZP(3,3),g3

Complex(dp), Intent(in) :: lam6,lam1,lam4,lam3,lam7,mu,lam10,lam2,lam9,lam8,Yd(3,3),ZDL(3,3),ZDR(3,3),           & 
& Ye(3,3),ZEL(3,3),ZER(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),epsD(3,3),epsE(3,3),               & 
& epsU(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplVGVGVG,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3), & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),            & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),          & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),          & 
& cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole3'
 
cplAhAhAh = 0._dp 
Call CouplingAhAhAh2LP(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetI2LP(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhh2LP(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetI2LP(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhh2LP(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhh2LP(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingAhHmcHm2LP(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cpletIetIetI = 0._dp 
Call CouplingetIetIetI2LP(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhh2LP(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhh2LP(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHm2LP(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call Couplinghhhhhh2LP(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,              & 
& vv,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcHm2LP(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,               & 
& lam9,lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplVGVGVG = 0._dp 
Call CouplingVGVGVG2LP(g3,cplVGVGVG)



cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAh2LP(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAh2LP(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAh2LP(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetI2LP(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetI2LP(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetI2LP(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdhh2LP(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdHmL = 0._dp 
cplcFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFuFdHm2LP(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,               & 
& cplcFuFdHmL(gt1,gt2,gt3),cplcFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHm2LP(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)   & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehh2LP(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)       & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuhh2LP(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFucHmL = 0._dp 
cplcFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucHm2LP(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,ZUR,              & 
& cplcFdFucHmL(gt1,gt2,gt3),cplcFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHm2LP(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3)& 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVG2LP(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVG2LP(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsFor2LPole3

Subroutine CouplingAhAhAh2LP(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAh2LP  
 
 
Subroutine CouplingAhAhetI2LP(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetI2LP  
 
 
Subroutine CouplingAhAhhh2LP(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhh2LP  
 
 
Subroutine CouplingAhetIetI2LP(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetI2LP  
 
 
Subroutine CouplingAhetIhh2LP(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhh2LP  
 
 
Subroutine CouplingAhhhhh2LP(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhh2LP  
 
 
Subroutine CouplingAhHmcHm2LP(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,vv,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
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
res = res-(lam10*vv*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(vv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(lam6*vv*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(vv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(lam4*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(Conjg(mu)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam5*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam7*vv*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(vv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHm2LP  
 
 
Subroutine CouplingetIetIetI2LP(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetI2LP  
 
 
Subroutine CouplingetIetIhh2LP(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhh2LP  
 
 
Subroutine CouplingetIhhhh2LP(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhh2LP  
 
 
Subroutine CouplingetIHmcHm2LP(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,v,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmcHm' 
 
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
res = res+(lam10*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(mu*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(lam6*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam5*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam4*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam7*v*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmcHm2LP  
 
 
Subroutine Couplinghhhhhh2LP(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhh' 
 
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
res = res-3*lam1*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)
res = res+(-3*lam6*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(-3*lam6*v*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*vv*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*v*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(lam3*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam4*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res-(lam5*v*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))
res = res+(-3*lam7*vv*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*vv*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*v*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-3*lam2*vv*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)
res = res+(-3*v*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhh2LP  
 
 
Subroutine CouplinghhHmcHm2LP(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,mu,lam10,v,vv,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcHm' 
 
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
res = res-(lam8*v*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))
res = res-(lam10*vv*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(vv*Conjg(lam10)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam10*v*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(lam9*vv*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))
res = res-(v*Conjg(lam10)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
res = res+(mu*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZH(gt1,2)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res-(lam1*v*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))
res = res-(lam6*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))
res = res-(v*Conjg(lam6)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam6*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam7*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,2))
res = res+(Conjg(mu)*ZH(gt1,1)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,2)*ZP(gt3,3))
res = res-(lam3*v*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))
res = res-(lam7*vv*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt1,1)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam7*v*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(lam2*vv*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))
res = res-(v*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,3)*ZP(gt3,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcHm2LP  
 
 
Subroutine CouplingVGVGVG2LP(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVG2LP  
 
 
Subroutine CouplingcFdFdAh2LP(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAh2LP  
 
 
Subroutine CouplingcFeFeAh2LP(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAh2LP  
 
 
Subroutine CouplingcFuFuAh2LP(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAh2LP  
 
 
Subroutine CouplingcFdFdetI2LP(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetI2LP  
 
 
Subroutine CouplingcFeFeetI2LP(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetI2LP  
 
 
Subroutine CouplingcFuFuetI2LP(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuetI2LP  
 
 
Subroutine CouplingcFdFdhh2LP(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdhh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdhh2LP  
 
 
Subroutine CouplingcFuFdHm2LP(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,             & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdHm' 
 
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
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yu(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZUR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsU(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZUL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdHm2LP  
 
 
Subroutine CouplingFvFeHm2LP(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFeHm' 
 
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
resL = resL+Conjg(ZEL(gt2,j2))*Conjg(UV(gt1,j1))*Yh(j1,j2)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Conjg(UV(gt1,j2))*Yh(j1,j2)*ZP(gt3,1))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,j2))*ZER(gt2,j1)*UV(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsE(j1,j2))*ZER(gt2,j2)*UV(gt1,j1)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFeHm2LP  
 
 
Subroutine CouplingcFeFehh2LP(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFehh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFehh2LP  
 
 
Subroutine CouplingcFuFuhh2LP(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuhh' 
 
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
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuhh2LP  
 
 
Subroutine CouplingcFdFucHm2LP(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,ZUL,            & 
& ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucHm' 
 
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
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)*ZP(gt3,3)
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucHm2LP  
 
 
Subroutine CouplingcFeFvcHm2LP(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcHm' 
 
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
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)*ZP(gt3,2)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*Conjg(UV(gt2,j1))*epsE(j1,j2)*ZP(gt3,3)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)*ZP(gt3,1)
End Do 
End Do 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2)*ZP(gt3,1))
End Do 
End Do 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcHm2LP  
 
 
Subroutine CouplingcFdFdVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVG2LP  
 
 
Subroutine CouplingcFuFuVG2LP(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVG2LP  
 
 
Subroutine CouplingsFor2LPole4(lam1,lam6,ZH,lam4,lam3,lam5,lam8,ZP,lam7,              & 
& lam10,lam2,lam9,lamh,cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,               & 
& cplAhAhetIhh,cplAhAhhhhh,cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,       & 
& cplAhetIHmcHm,cplAhhhhhhh,cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,   & 
& cpletIetIHmcHm,cpletIhhhhhh,cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam6,lam4,lam3,lam8,lam7,lam10,lam2,lam9,lamh

Complex(dp), Intent(out) :: cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh(2),cplAhAhetIetI,cplAhAhetIhh(2),cplAhAhhhhh(2,2),& 
& cplAhAhHmcHm(3,3),cplAhetIetIetI,cplAhetIetIhh(2),cplAhetIhhhh(2,2),cplAhetIHmcHm(3,3),& 
& cplAhhhhhhh(2,2,2),cplAhhhHmcHm(2,3,3),cpletIetIetIetI,cpletIetIetIhh(2),              & 
& cpletIetIhhhh(2,2),cpletIetIHmcHm(3,3),cpletIhhhhhh(2,2,2),cpletIhhHmcHm(2,3,3),       & 
& cplhhhhhhhh(2,2,2,2),cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsFor2LPole4'
 
cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAh2LP(lam1,cplAhAhAhAh)



cplAhAhAhetI = 0._dp 
Call CouplingAhAhAhetI2LP(lam6,cplAhAhAhetI)



cplAhAhAhhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhh2LP(gt4,lam6,ZH,cplAhAhAhhh(gt4))

End Do 


cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetI2LP(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhetIhh2LP(gt4,lam6,ZH,cplAhAhetIhh(gt4))

End Do 


cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhh2LP(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhAhHmcHm2LP(gt3,gt4,lam1,lam3,lam6,lam8,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhetIetIetI = 0._dp 
Call CouplingAhetIetIetI2LP(lam7,cplAhetIetIetI)



cplAhetIetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingAhetIetIhh2LP(gt4,lam7,ZH,cplAhetIetIhh(gt4))

End Do 


cplAhetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhetIhhhh2LP(gt3,gt4,lam7,lam5,lam6,ZH,cplAhetIhhhh(gt3,gt4))

 End Do 
End Do 


cplAhetIHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhetIHmcHm2LP(gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZP,cplAhetIHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhh2LP(gt2,gt3,gt4,lam7,lam6,ZH,cplAhhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 3
  Do gt4 = 1, 3
Call CouplingAhhhHmcHm2LP(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,cplAhhhHmcHm(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetI2LP(lam2,cpletIetIetIetI)



cpletIetIetIhh = 0._dp 
Do gt4 = 1, 2
Call CouplingetIetIetIhh2LP(gt4,lam7,ZH,cpletIetIetIhh(gt4))

End Do 


cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhh2LP(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingetIetIHmcHm2LP(gt3,gt4,lam2,lam3,lam7,lam9,ZP,cpletIetIHmcHm(gt3,gt4))

 End Do 
End Do 


cpletIhhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingetIhhhhhh2LP(gt2,gt3,gt4,lam7,lam6,ZH,cpletIhhhhhh(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIhhHmcHm = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 3
  Do gt4 = 1, 3
Call CouplingetIhhHmcHm2LP(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,               & 
& cpletIhhHmcHm(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplhhhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call Couplinghhhhhhhh2LP(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,ZH,cplhhhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhHmcHm2LP(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,lam10,ZH,ZP,cplhhhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmHmcHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingHmHmcHmcHm2LP(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,             & 
& lam6,lam9,lam8,lamh,lam10,ZP,cplHmHmcHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsFor2LPole4

Subroutine CouplingAhAhAhAh2LP(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAh2LP  
 
 
Subroutine CouplingAhAhAhetI2LP(lam6,res)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhetI' 
 
res = 0._dp 
res = res-3._dp*(lam6)/2._dp
res = res+(-3*Conjg(lam6))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhetI2LP  
 
 
Subroutine CouplingAhAhAhhh2LP(gt4,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(-3*lam6*ZH(gt4,2))/2._dp
res = res+(3*Conjg(lam6)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhh2LP  
 
 
Subroutine CouplingAhAhetIetI2LP(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetI2LP  
 
 
Subroutine CouplingAhAhetIhh2LP(gt4,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam6*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIhh2LP  
 
 
Subroutine CouplingAhAhhhhh2LP(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhh2LP  
 
 
Subroutine CouplingAhAhHmcHm2LP(gt3,gt4,lam1,lam3,lam6,lam8,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam3,lam6,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam8*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam1*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHm2LP  
 
 
Subroutine CouplingAhetIetIetI2LP(lam7,res)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam7)/2._dp
res = res+(-3*Conjg(lam7))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIetI2LP  
 
 
Subroutine CouplingAhetIetIhh2LP(gt4,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam7*ZH(gt4,2))/2._dp
res = res+(Conjg(lam7)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIhh2LP  
 
 
Subroutine CouplingAhetIhhhh2LP(gt3,gt4,lam7,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhhh2LP  
 
 
Subroutine CouplingAhetIHmcHm2LP(gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam10*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam6*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam4*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam4*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam7*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZP(gt3,3)*ZP(gt4,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIHmcHm2LP  
 
 
Subroutine CouplingAhhhhhhh2LP(gt2,gt3,gt4,lam7,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(3*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhh2LP  
 
 
Subroutine CouplingAhhhHmcHm2LP(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam10*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res+(Conjg(lam10)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam6*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res+(Conjg(lam6)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res+(lam4*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam4*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res+(lam5*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam7*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res+(Conjg(lam7)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHm2LP  
 
 
Subroutine CouplingetIetIetIetI2LP(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetI2LP  
 
 
Subroutine CouplingetIetIetIhh2LP(gt4,lam7,ZH,res)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*lam7*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt4,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIhh2LP  
 
 
Subroutine CouplingetIetIhhhh2LP(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhh2LP  
 
 
Subroutine CouplingetIetIHmcHm2LP(gt3,gt4,lam2,lam3,lam7,lam9,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam2,lam3,lam7,lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam9*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam3*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam7*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam7)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam2*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHmcHm2LP  
 
 
Subroutine CouplingetIhhhhhh2LP(gt2,gt3,gt4,lam7,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(3*lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhhh2LP  
 
 
Subroutine CouplingetIhhHmcHm2LP(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,               & 
& ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(lam10*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res+(lam6*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam4*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res+(lam5*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res+(lam4*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res+(lam7*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhHmcHm2LP  
 
 
Subroutine Couplinghhhhhhhh2LP(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,              & 
& lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-3*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res = res+(-3*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res = res+(-3*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res+(-3*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res = res-3*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine Couplinghhhhhhhh2LP  
 
 
Subroutine CouplinghhhhHmcHm2LP(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,             & 
& lam5,lam6,lam9,lam8,lam10,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
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

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam8*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam10*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam10*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(Conjg(lam10)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res = res-(lam9*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res = res-(lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))
res = res-(lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res = res-(lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHm2LP  
 
 
Subroutine CouplingHmHmcHmcHm2LP(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,            & 
& lam5,lam6,lam9,lam8,lamh,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-4*lamh*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res = res-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res = res-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res = res-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,1))
res = res-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
res = res-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
res = res-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,1))
res = res-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,1))
res = res-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res = res-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res = res-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,2))
res = res-2*lam1*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*lam6*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*lam6*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*lam5*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
res = res-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2)
res = res-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
res = res-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
res = res-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2)
res = res-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
res = res-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
res = res-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,3))
res = res-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,3))
res = res-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3)
res = res-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
res = res-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3)
res = res-2*lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
res = res-2*Conjg(lam7)*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
res = res-2*Conjg(lam7)*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
res = res-2*lam2*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHm2LP  
 
 
Subroutine CouplingsForLoopMasses(lam1,lam4,lam3,lam5,lam6,v,vv,lam7,ZH,              & 
& g1,g2,TW,lam2,epsD,Yd,ZDL,ZDR,epsE,Ye,ZEL,ZER,epsU,Yu,ZUL,ZUR,lam9,lam8,               & 
& mu,lam10,ZP,Yh,UV,lamh,g3,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,   & 
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

Implicit None 
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),g1,g2,TW,ZP(3,3),g3

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,lam7,lam2,epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),epsE(3,3),          & 
& Ye(3,3),ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),lam9,lam8,               & 
& mu,lam10,Yh(3,3),UV(3,3),lamh

Complex(dp), Intent(out) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),               & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3), & 
& cplUhhHmVWp(2,3),cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),& 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2),& 
& cplAhcUHmcVWp(3),cplAhHmcUHm(3,3),cpletIcUHmcVWp(3),cpletIHmcUHm(3,3),cplcFdFucUHmL(3,3,3),& 
& cplcFdFucUHmR(3,3,3),cplcFeFvcUHmL(3,3,3),cplcFeFvcUHmR(3,3,3),cplcgZgWCcUHm(3),       & 
& cplcgWCgZUHm(3),cplcgWpgZcUHm(3),cplcgZgWpUHm(3),cplhhcUHmcVWp(2,3),cplhhHmcUHm(2,3,3),& 
& cplHmcUHmVP(3,3),cplHmcUHmVZ(3,3),cplcUHmcVWpVP(3),cplcUHmcVWpVZ(3),cplAhAhUHmcUHm(3,3),& 
& cpletIetIUHmcUHm(3,3),cplhhhhUHmcUHm(2,2,3,3),cplUHmHmcUHmcHm(3,3,3,3),cplUHmcUHmVPVP(3,3),& 
& cplUHmcUHmcVWpVWp(3,3),cplUHmcUHmVZVZ(3,3),cplUFvFecVWpL(3,3),cplUFvFecVWpR(3,3),      & 
& cplUFvFeHmL(3,3,3),cplUFvFeHmR(3,3,3),cplUFvFvVZL(3,3),cplUFvFvVZR(3,3),               & 
& cplcFeUFvVWpL(3,3),cplcFeUFvVWpR(3,3),cplcFeUFvcHmL(3,3,3),cplcFeUFvcHmR(3,3,3),       & 
& cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),             & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3),       & 
& cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),             & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),             & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3),cplAhAhAh,cplAhAhetI,cplAhAhhh(2),               & 
& cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),          & 
& cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,          & 
& cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhHmVWp(3),cplAhAhAhAh,cplAhAhetIetI,   & 
& cplAhAhhhhh(2,2),cplAhAhHmcHm(3,3),cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIetIetI,            & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmcHm(3,3),cpletIHmVWp(3),cpletIetIetIetI,cpletIetIhhhh(2,2),      & 
& cpletIetIHmcHm(3,3),cpletIetIcVWpVWp,cpletIetIVZVZ,cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),  & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcgGgGVG,cplVGVGVG,cplVGVGVGVG1,cplVGVGVGVG2,      & 
& cplVGVGVGVG3,cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),      & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP(3,3)

Complex(dp), Intent(out) :: cplHmVPVWp(3),cplcVWpVPVWp,cplHmcHmVPVP(3,3),cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,          & 
& cplcVWpVPVPVWp3,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcgWpgWpVZ,        & 
& cplcgWCgWCVZ,cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWpVZ(3),cplcVWpVWpVZ,cplhhhhVZVZ(2,2), & 
& cplHmcHmVZVZ(3,3),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cplAhcHmcVWp(3),     & 
& cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),              & 
& cplFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,             & 
& cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplhhhhcVWpVWp(2,2), & 
& cplHmcHmcVWpVWp(3,3),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,         & 
& cplHmcHmVPVZ(3,3),cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForLoopMasses'
 
cplAhAhUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,cplAhAhUhh(gt3))

End Do 


cplAhetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIUhhL(gt3,lam7,lam5,lam6,v,vv,cplAhetIUhh(gt3))

End Do 


cplAhUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhUhhhh(gt2,gt3))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt2,g1,g2,TW,cplAhUhhVZ(gt2))

End Do 


cpletIetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIUhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,cpletIetIUhh(gt3))

End Do 


cpletIUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIUhhhh(gt2,gt3))

 End Do 
End Do 


cpletIUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIUhhVZL(gt2,g1,g2,TW,cpletIUhhVZ(gt2))

End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,epsD,Yd,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,epsE,Ye,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUhhL(gt3,g2,v,vv,cplcgWpgWpUhh(gt3))

End Do 


cplcgWCgWCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUhhL(gt3,g2,v,vv,cplcgWCgWCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,v,vv,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,               & 
& vv,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUhhHmcHmL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,           & 
& lam8,mu,lam10,v,vv,ZP,cplUhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingUhhHmVWpL(gt1,gt2,g2,ZP,cplUhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWpVWpL(gt1,g2,v,vv,cplUhhcVWpVWp(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,v,vv,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,cplAhAhUhhUhh(gt3,gt4))

 End Do 
End Do 


cpletIetIUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUhhUhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,cpletIetIUhhUhh(gt3,gt4))

 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,lam10,ZP,cplUhhUhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,cplUhhUhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplAhcUHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcUHmcVWpL(gt2,g2,cplAhcUHmcVWp(gt2))

End Do 


cplAhHmcUHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingAhHmcUHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,cplAhHmcUHm(gt2,gt3))

 End Do 
End Do 


cpletIcUHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcUHmcVWpL(gt2,g2,cpletIcUHmcVWp(gt2))

End Do 


cpletIHmcUHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcUHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcUHm(gt2,gt3))

 End Do 
End Do 


cplcFdFucUHmL = 0._dp 
cplcFdFucUHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFdFucUHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZDL,ZDR,ZUL,ZUR,cplcFdFucUHmL(gt1,gt2,gt3)& 
& ,cplcFdFucUHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvcUHmL = 0._dp 
cplcFeFvcUHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcUHmL(gt1,gt2,gt3,epsE,Ye,Yh,UV,ZEL,ZER,cplcFeFvcUHmL(gt1,gt2,gt3)  & 
& ,cplcFeFvcUHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgZgWCcUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWCcUHmL(gt3,g1,g2,v,vv,TW,cplcgZgWCcUHm(gt3))

End Do 


cplcgWCgZUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWCgZUHmL(gt3,g1,g2,v,vv,TW,cplcgWCgZUHm(gt3))

End Do 


cplcgWpgZcUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgWpgZcUHmL(gt3,g1,g2,v,vv,TW,cplcgWpgZcUHm(gt3))

End Do 


cplcgZgWpUHm = 0._dp 
Do gt3 = 1, 3
Call CouplingcgZgWpUHmL(gt3,g1,g2,v,vv,TW,cplcgZgWpUHm(gt3))

End Do 


cplhhcUHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcUHmcVWpL(gt1,gt2,g2,ZH,cplhhcUHmcVWp(gt1,gt2))

 End Do 
End Do 


cplhhHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplinghhHmcUHmL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,           & 
& lam8,mu,lam10,v,vv,ZH,ZP,cplhhHmcUHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplHmcUHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcUHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcUHmVP(gt1,gt2))

 End Do 
End Do 


cplHmcUHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcUHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcUHmVZ(gt1,gt2))

 End Do 
End Do 


cplcUHmcVWpVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcUHmcVWpVPL(gt1,g1,g2,v,vv,TW,cplcUHmcVWpVP(gt1))

End Do 


cplcUHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcUHmcVWpVZL(gt1,g1,g2,v,vv,TW,cplcUHmcVWpVZ(gt1))

End Do 


cplAhAhUHmcUHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhAhUHmcUHmL(gt3,gt4,lam1,lam3,lam6,lam8,cplAhAhUHmcUHm(gt3,gt4))

 End Do 
End Do 


cpletIetIUHmcUHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingetIetIUHmcUHmL(gt3,gt4,lam2,lam3,lam7,lam9,cpletIetIUHmcUHm(gt3,gt4))

 End Do 
End Do 


cplhhhhUHmcUHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhUHmcUHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,lam10,ZH,cplhhhhUHmcUHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUHmHmcUHmcHm = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUHmHmcUHmcHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,             & 
& lam6,lam9,lam8,lamh,lam10,ZP,cplUHmHmcUHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUHmcUHmVPVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUHmcUHmVPVPL(gt1,gt2,g1,g2,TW,cplUHmcUHmVPVP(gt1,gt2))

 End Do 
End Do 


cplUHmcUHmcVWpVWp = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUHmcUHmcVWpVWpL(gt1,gt2,g2,cplUHmcUHmcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUHmcUHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUHmcUHmVZVZL(gt1,gt2,g1,g2,TW,cplUHmcUHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplUFvFecVWpL = 0._dp 
cplUFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFecVWpL(gt1,gt2,g2,ZEL,cplUFvFecVWpL(gt1,gt2),cplUFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplUFvFeHmL = 0._dp 
cplUFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUFvFeHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,ZEL,ZER,cplUFvFeHmL(gt1,gt2,gt3)      & 
& ,cplUFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUFvFvVZL = 0._dp 
cplUFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingUFvFvVZL(gt1,gt2,g1,g2,UV,TW,cplUFvFvVZL(gt1,gt2),cplUFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcFeUFvVWpL = 0._dp 
cplcFeUFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeUFvVWpL(gt1,gt2,g2,ZEL,cplcFeUFvVWpL(gt1,gt2),cplcFeUFvVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeUFvcHmL = 0._dp 
cplcFeUFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeUFvcHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,ZEL,ZER,cplcFeUFvcHmL(gt1,gt2,gt3)  & 
& ,cplcFeUFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdetIL = 0._dp 
cplcUFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,cplcUFdFdetIL(gt1,gt2),cplcUFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHmL = 0._dp 
cplcUFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFdFucHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZUL,ZUR,cplcUFdFucHmL(gt1,gt2,gt3)& 
& ,cplcUFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFuVWpL = 0._dp 
cplcUFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWpL(gt1,gt2,g2,ZUL,cplcUFdFuVWpL(gt1,gt2),cplcUFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuetIL = 0._dp 
cplcUFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuetIL(gt1,gt2,epsU,ZUL,ZUR,cplcUFuFuetIL(gt1,gt2),cplcUFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcVWpL = 0._dp 
cplcUFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWpL(gt1,gt2,g2,ZDL,cplcUFuFdcVWpL(gt1,gt2),cplcUFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHmL = 0._dp 
cplcUFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFuFdHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,cplcUFuFdHmL(gt1,gt2,gt3)& 
& ,cplcUFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeetIL = 0._dp 
cplcUFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeetIL(gt1,gt2,epsE,ZEL,ZER,cplcUFeFeetIL(gt1,gt2),cplcUFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHmL = 0._dp 
cplcUFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFeFvcHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,cplcUFeFvcHmL(gt1,gt2,gt3)       & 
& ,cplcUFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFvVWpL = 0._dp 
cplcUFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWpL(gt1,gt2,g2,UV,cplcUFeFvVWpL(gt1,gt2),cplcUFeFvVWpR(gt1,gt2))

 End Do 
End Do 


cplAhAhAh = 0._dp 
Call CouplingAhAhAhL(lam6,vv,cplAhAhAh)



cplAhAhetI = 0._dp 
Call CouplingAhAhetIL(lam6,v,cplAhAhetI)



cplAhAhhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,cplAhAhhh(gt3))

End Do 


cplAhetIetI = 0._dp 
Call CouplingAhetIetIL(lam7,vv,cplAhetIetI)



cplAhetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIhhL(gt3,lam7,lam5,lam6,v,vv,ZH,cplAhetIhh(gt3))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcFdFdAhL(gt1,gt2),cplcFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcFuFuAhL(gt1,gt2),cplcFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpAh = 0._dp 
Call CouplingcgWpgWpAhL(g2,v,cplcgWpgWpAh)



cplcgWCgWCAh = 0._dp 
Call CouplingcgWCgWCAhL(g2,v,cplcgWCgWCAh)



cplAhhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhhhhh(gt2,gt3))

 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZL(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingAhHmcHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,cplAhHmcHm(gt2,gt3))

 End Do 
End Do 


cplAhHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpL(gt2,g2,ZP,cplAhHmVWp(gt2))

End Do 


cplAhAhAhAh = 0._dp 
Call CouplingAhAhAhAhL(lam1,cplAhAhAhAh)



cplAhAhetIetI = 0._dp 
Call CouplingAhAhetIetIL(lam4,lam3,lam5,cplAhAhetIetI)



cplAhAhhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhAhHmcHmL(gt3,gt4,lam1,lam3,lam6,lam8,ZP,cplAhAhHmcHm(gt3,gt4))

 End Do 
End Do 


cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cpletIetIetI = 0._dp 
Call CouplingetIetIetIL(lam7,v,cpletIetIetI)



cpletIetIhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,cpletIetIhh(gt3))

End Do 


cplcFdFdetIL = 0._dp 
cplcFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,cplcFdFdetIL(gt1,gt2),cplcFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIL(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcFuFuetIL = 0._dp 
cplcFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuetIL(gt1,gt2,epsU,ZUL,ZUR,cplcFuFuetIL(gt1,gt2),cplcFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpetI = 0._dp 
Call CouplingcgWpgWpetIL(g2,vv,cplcgWpgWpetI)



cplcgWCgWCetI = 0._dp 
Call CouplingcgWCgWCetIL(g2,vv,cplcgWCgWCetI)



cpletIhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIhhhh(gt2,gt3))

 End Do 
End Do 


cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZL(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIHmcHm = 0._dp 
Do gt2 = 1, 3
 Do gt3 = 1, 3
Call CouplingetIHmcHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,cpletIHmcHm(gt2,gt3))

 End Do 
End Do 


cpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpL(gt2,g2,ZP,cpletIHmVWp(gt2))

End Do 


cpletIetIetIetI = 0._dp 
Call CouplingetIetIetIetIL(lam2,cpletIetIetIetI)



cpletIetIhhhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh(gt3,gt4))

 End Do 
End Do 


cpletIetIHmcHm = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingetIetIHmcHmL(gt3,gt4,lam2,lam3,lam7,lam9,ZP,cpletIetIHmcHm(gt3,gt4))

 End Do 
End Do 


cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpL(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZL(g1,g2,TW,cpletIetIVZVZ)



cplcFdFdVGL = 0._dp 
cplcFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVGL(gt1,gt2,g3,cplcFdFdVGL(gt1,gt2),cplcFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVGL = 0._dp 
cplcFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVGL(gt1,gt2,g3,cplcFuFuVGL(gt1,gt2),cplcFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcgGgGVG = 0._dp 
Call CouplingcgGgGVGL(g3,cplcgGgGVG)



cplVGVGVG = 0._dp 
Call CouplingVGVGVGL(g3,cplVGVGVG)



cplVGVGVGVG1 = 0._dp 
cplVGVGVGVG2 = 0._dp 
cplVGVGVGVG3 = 0._dp 
Call CouplingVGVGVGVGL(g3,cplVGVGVGVG1,cplVGVGVGVG2,cplVGVGVGVG3)



cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPL(g2,TW,cplcgWpgWpVP)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPL(g2,TW,cplcgWCgWCVP)



cplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmVPVWp = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVPVWpL(gt1,g1,g2,v,vv,ZP,TW,cplHmVPVWp(gt1))

End Do 


cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZL(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,cplcgWCgWCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplHmVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWpVZL(gt1,g1,g2,v,vv,ZP,TW,cplHmVWpVZ(gt1))

End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplAhcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpL(gt2,g2,ZP,cplAhcHmcVWp(gt2))

End Do 


cpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpL(gt2,g2,ZP,cpletIcHmcVWp(gt2))

End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpL(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,cplcgZgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,cplcgWCgZcVWp)



cplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpL(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpL(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplcHmcVWpVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVPL(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVP(gt1))

End Do 


cplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVZL(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVZ(gt1))

End Do 


cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWpVWp = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWpVWpL(gt1,gt2,g2,ZP,cplHmcHmcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZL(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



Iname = Iname - 1 
End Subroutine CouplingsForLoopMasses

Subroutine CouplingAhAhUhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam1*v)
End If 
If ((1.eq.gt3)) Then 
res = res-(lam6*vv)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(vv*Conjg(lam6))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam6*v)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam3*vv)
End If 
If ((2.eq.gt3)) Then 
res = res-(lam4*vv)
End If 
If ((2.eq.gt3)) Then 
res = res+lam5*vv
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(lam6))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhL  
 
 
Subroutine CouplingAhetIUhhL(gt3,lam7,lam5,lam6,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam6*v)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(lam5*vv)
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(lam6))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam5*v)
End If 
If ((2.eq.gt3)) Then 
res = res-(lam7*vv)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(vv*Conjg(lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIUhhL  
 
 
Subroutine CouplingAhUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhhh' 
 
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
If ((1.eq.gt2)) Then 
res = res-(lam6*vv*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(lam6*v*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(v*Conjg(lam6)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(lam6*v*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(v*Conjg(lam6)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(-3*lam7*vv*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(3*vv*Conjg(lam7)*ZH(gt3,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhhhL  
 
 
Subroutine CouplingAhUhhVZL(gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhUhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt2)) Then 
res = res+(g2*Cos(TW))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(g1*Sin(TW))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhUhhVZL  
 
 
Subroutine CouplingetIetIUhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(lam3*v)
End If 
If ((1.eq.gt3)) Then 
res = res-(lam4*v)
End If 
If ((1.eq.gt3)) Then 
res = res+lam5*v
End If 
If ((1.eq.gt3)) Then 
res = res-(lam7*vv)/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(vv*Conjg(lam7))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam7*v)/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam2*vv)
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(lam7))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUhhL  
 
 
Subroutine CouplingetIUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIUhhhh' 
 
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
If ((1.eq.gt2)) Then 
res = res+(3*lam6*v*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(lam7*vv*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res+(lam7*vv*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt2)) Then 
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(lam7*v*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIUhhhhL  
 
 
Subroutine CouplingetIUhhVZL(gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIUhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt2)) Then 
res = res+(g2*Cos(TW))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Sin(TW))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIUhhVZL  
 
 
Subroutine CouplingcFdFdUhhL(gt1,gt2,gt3,epsD,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdUhh' 
 
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
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdUhhL  
 
 
Subroutine CouplingcFeFeUhhL(gt1,gt2,gt3,epsE,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeUhh' 
 
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
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeUhhL  
 
 
Subroutine CouplingcFuFuUhhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuUhh' 
 
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
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL-((Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuUhhL  
 
 
Subroutine CouplingcgWpgWpUhhL(gt3,g2,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vv*RXiWp)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpUhhL  
 
 
Subroutine CouplingcgWCgWCUhhL(gt3,g2,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*RXiWp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vv*RXiWp)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCUhhL  
 
 
Subroutine CouplingcgZgZUhhL(gt3,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgZUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g2**2*vv*Cos(TW)**2*RXiZ)/4._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1*g2*v*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1*g2*vv*Cos(TW)*RXiZ*Sin(TW))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(g1**2*v*RXiZ*Sin(TW)**2)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(g1**2*vv*RXiZ*Sin(TW)**2)/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgZUhhL  
 
 
Subroutine CouplingUhhhhhhL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhhhhh' 
 
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
If ((1.eq.gt1)) Then 
res = res-3*lam1*v*ZH(gt2,1)*ZH(gt3,1)
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*vv*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*vv*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*vv*ZH(gt2,1)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*vv*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*vv*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*vv*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*v*ZH(gt2,2)*ZH(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*vv*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*vv*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*vv*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*v*ZH(gt2,1)*ZH(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*v*ZH(gt2,2)*ZH(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+(-3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-3*lam2*vv*ZH(gt2,2)*ZH(gt3,2)
End If 
If ((2.eq.gt1)) Then 
res = res+(-3*v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhhhhhL  
 
 
Subroutine CouplingUhhHmcHmL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,lam9,lam8,mu,lam10,v,vv,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmcHm' 
 
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
If ((1.eq.gt1)) Then 
res = res-(lam8*v*ZP(gt2,1)*ZP(gt3,1))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam10*vv*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(vv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam10*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam9*vv*ZP(gt2,1)*ZP(gt3,1))
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-((mu*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp))
End If 
If ((1.eq.gt1)) Then 
res = res+(mu*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp)
End If 
If ((2.eq.gt1)) Then 
res = res-((Conjg(mu)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam1*v*ZP(gt2,2)*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam6*vv*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(vv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam6*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam3*vv*ZP(gt2,2)*ZP(gt3,2))
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam6*v*ZP(gt2,3)*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam7*vv*ZP(gt2,3)*ZP(gt3,2))
End If 
If ((1.eq.gt1)) Then 
res = res+(Conjg(mu)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
End If 
If ((1.eq.gt1)) Then 
res = res-(lam4*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(lam5*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(v*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,3))
End If 
If ((2.eq.gt1)) Then 
res = res-(lam4*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam5*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(vv*Conjg(lam7)*ZP(gt2,2)*ZP(gt3,3))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam3*v*ZP(gt2,3)*ZP(gt3,3))
End If 
If ((1.eq.gt1)) Then 
res = res-(lam7*vv*ZP(gt2,3)*ZP(gt3,3))/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res-(vv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam7*v*ZP(gt2,3)*ZP(gt3,3))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(lam2*vv*ZP(gt2,3)*ZP(gt3,3))
End If 
If ((2.eq.gt1)) Then 
res = res-(v*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmcHmL  
 
 
Subroutine CouplingUhhHmVWpL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhHmVWp' 
 
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
If ((1.eq.gt1)) Then 
res = res-(g2*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res-(g2*ZP(gt2,3))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhHmVWpL  
 
 
Subroutine CouplingUhhcVWpVWpL(gt1,g2,v,vv,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*vv)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhcVWpVWpL  
 
 
Subroutine CouplingUhhVZVZL(gt1,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1)) Then 
res = res+(g2**2*v*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g2**2*vv*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1)) Then 
res = res+g1*g2*v*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1)) Then 
res = res+g1*g2*vv*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1)) Then 
res = res+(g1**2*v*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1)) Then 
res = res+(g1**2*vv*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhVZVZL  
 
 
Subroutine CouplingAhAhUhhUhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUhhUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam1)
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam6)/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-Conjg(lam6)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam6)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-Conjg(lam6)/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam4)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res+lam5
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUhhUhhL  
 
 
Subroutine CouplingetIetIUhhUhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUhhUhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam4)
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res+lam5
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-1._dp*(lam7)/2._dp
End If 
If ((1.eq.gt4).And.(2.eq.gt3)) Then 
res = res-Conjg(lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam7)/2._dp
End If 
If ((1.eq.gt3).And.(2.eq.gt4)) Then 
res = res-Conjg(lam7)/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUhhUhhL  
 
 
Subroutine CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,              & 
& lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-3*lam1*ZH(gt3,1)*ZH(gt4,1)
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,1)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,2)*ZH(gt4,1))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(-3*Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,1)*ZH(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam5*ZH(gt3,2)*ZH(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(-3*Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-3*lam2*ZH(gt3,2)*ZH(gt4,2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhhhhhL  
 
 
Subroutine CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,             & 
& lam5,lam6,lam9,lam8,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhHmcHm' 
 
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

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam8*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam10*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(lam10)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam10*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(lam10)*ZP(gt3,1)*ZP(gt4,1))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam9*ZP(gt3,1)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam1*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam6*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam6*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam3*ZP(gt3,2)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam6*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam4*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam5*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZP(gt3,3)*ZP(gt4,2))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam7*ZP(gt3,3)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam4*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam5*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam4*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam5*ZP(gt3,2)*ZP(gt4,3))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(lam7)*ZP(gt3,2)*ZP(gt4,3))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res-(lam3*ZP(gt3,3)*ZP(gt4,3))
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(lam7*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((1.eq.gt2).And.(2.eq.gt1)) Then 
res = res-(Conjg(lam7)*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam7*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((1.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(Conjg(lam7)*ZP(gt3,3)*ZP(gt4,3))/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(lam2*ZP(gt3,3)*ZP(gt4,3))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhHmcHmL  
 
 
Subroutine CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhcVWpVWp' 
 
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

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhcVWpVWpL  
 
 
Subroutine CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUhhUhhVZVZ' 
 
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

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUhhUhhVZVZL  
 
 
Subroutine CouplingAhcUHmcVWpL(gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcUHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt2)) Then 
res = res-1._dp*(g2)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcUHmcVWpL  
 
 
Subroutine CouplingAhHmcUHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,vv,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcUHm' 
 
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
If ((1.eq.gt3)) Then 
res = res-(lam10*vv*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res+(vv*Conjg(lam10)*ZP(gt2,1))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(Conjg(mu)*ZP(gt2,1))/sqrt(2._dp)
End If 
If ((2.eq.gt3)) Then 
res = res-(lam6*vv*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(vv*Conjg(lam6)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam4*vv*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(lam5*vv*ZP(gt2,2))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-((mu*ZP(gt2,3))/sqrt(2._dp))
End If 
If ((2.eq.gt3)) Then 
res = res+(lam4*vv*ZP(gt2,3))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam5*vv*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam7*vv*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(vv*Conjg(lam7)*ZP(gt2,3))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcUHmL  
 
 
Subroutine CouplingetIcUHmcVWpL(gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcUHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((3.eq.gt2)) Then 
res = res-1._dp*(g2)/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcUHmcVWpL  
 
 
Subroutine CouplingetIHmcUHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,v,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmcUHm' 
 
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
If ((1.eq.gt3)) Then 
res = res+(lam10*v*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(lam10)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-((Conjg(mu)*ZP(gt2,1))/sqrt(2._dp))
End If 
If ((1.eq.gt3)) Then 
res = res+(mu*ZP(gt2,2))/sqrt(2._dp)
End If 
If ((2.eq.gt3)) Then 
res = res+(lam6*v*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(lam6)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(lam4*v*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam5*v*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam4*v*ZP(gt2,3))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(lam5*v*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(lam7*v*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(v*Conjg(lam7)*ZP(gt2,3))/2._dp
End If 
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmcUHmL  
 
 
Subroutine CouplingcFdFucUHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZDL,ZDR,ZUL,ZUR,            & 
& resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFucUHm' 
 
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
If ((3.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsD(j1,j2)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZDR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yd(j1,j2)
End Do 
End Do 
End If 
resR = 0._dp 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
End If 
If ((3.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZDL(gt1,j2)
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFucUHmL  
 
 
Subroutine CouplingcFeFvcUHmL(gt1,gt2,gt3,epsE,Ye,Yh,UV,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFvcUHm' 
 
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
If ((3.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*Conjg(UV(gt2,j1))*epsE(j1,j2)
End Do 
End Do 
End If 
If ((2.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Conjg(UV(gt2,j2))*Ye(j1,j2)
End Do 
End Do 
End If 
resR = 0._dp 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,j2))*ZEL(gt1,j2)*UV(gt2,j1)
End Do 
End Do 
End If 
If ((1.eq.gt3)) Then 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,j2))*ZEL(gt1,j1)*UV(gt2,j2))
End Do 
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFvcUHmL  
 
 
Subroutine CouplingcgZgWCcUHmL(gt3,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWCcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt3)) Then 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(g2**2*vv*Cos(TW)*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(g1*g2*vv*RXiZ*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWCcUHmL  
 
 
Subroutine CouplingcgWCgZUHmL(gt3,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(g2**2*vv*Cos(TW)*RXiWp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(g1*g2*vv*RXiWp*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZUHmL  
 
 
Subroutine CouplingcgWpgZcUHmL(gt3,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgZcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt3)) Then 
res = res-(g2**2*v*Cos(TW)*RXiWp)/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(g2**2*vv*Cos(TW)*RXiWp)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v*RXiWp*Sin(TW))/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(g1*g2*vv*RXiWp*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgZcUHmL  
 
 
Subroutine CouplingcgZgWpUHmL(gt3,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt3)) Then 
res = res+(g2**2*v*Cos(TW)*RXiZ)/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(g2**2*vv*Cos(TW)*RXiZ)/4._dp
End If 
If ((2.eq.gt3)) Then 
res = res+(g1*g2*v*RXiZ*Sin(TW))/4._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(g1*g2*vv*RXiZ*Sin(TW))/4._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpUHmL  
 
 
Subroutine CouplinghhcUHmcVWpL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcUHmcVWp' 
 
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
If ((2.eq.gt2)) Then 
res = res+(g2*ZH(gt1,1))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res+(g2*ZH(gt1,2))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcUHmcVWpL  
 
 
Subroutine CouplinghhHmcUHmL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,lam9,lam8,mu,lam10,v,vv,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmcUHm' 
 
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
If ((1.eq.gt3)) Then 
res = res-(lam8*v*ZH(gt1,1)*ZP(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(lam10*vv*ZH(gt1,1)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(vv*Conjg(lam10)*ZH(gt1,1)*ZP(gt2,1))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res+(Conjg(mu)*ZH(gt1,1)*ZP(gt2,1))/sqrt(2._dp)
End If 
If ((1.eq.gt3)) Then 
res = res-(lam10*v*ZH(gt1,2)*ZP(gt2,1))/2._dp
End If 
If ((1.eq.gt3)) Then 
res = res-(lam9*vv*ZH(gt1,2)*ZP(gt2,1))
End If 
If ((1.eq.gt3)) Then 
res = res-(v*Conjg(lam10)*ZH(gt1,2)*ZP(gt2,1))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-((Conjg(mu)*ZH(gt1,2)*ZP(gt2,1))/sqrt(2._dp))
End If 
If ((2.eq.gt3)) Then 
res = res-(lam1*v*ZH(gt1,1)*ZP(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(lam6*vv*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(vv*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(v*Conjg(lam6)*ZH(gt1,1)*ZP(gt2,2))
End If 
If ((1.eq.gt3)) Then 
res = res-((mu*ZH(gt1,2)*ZP(gt2,2))/sqrt(2._dp))
End If 
If ((2.eq.gt3)) Then 
res = res-(lam6*v*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam3*vv*ZH(gt1,2)*ZP(gt2,2))
End If 
If ((2.eq.gt3)) Then 
res = res-(v*Conjg(lam6)*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,2))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(vv*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,2))
End If 
If ((1.eq.gt3)) Then 
res = res+(mu*ZH(gt1,1)*ZP(gt2,3))/sqrt(2._dp)
End If 
If ((2.eq.gt3)) Then 
res = res-(lam6*v*ZH(gt1,1)*ZP(gt2,3))
End If 
If ((2.eq.gt3)) Then 
res = res-(lam4*vv*ZH(gt1,1)*ZP(gt2,3))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam5*vv*ZH(gt1,1)*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam3*v*ZH(gt1,1)*ZP(gt2,3))
End If 
If ((3.eq.gt3)) Then 
res = res-(lam7*vv*ZH(gt1,1)*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(vv*Conjg(lam7)*ZH(gt1,1)*ZP(gt2,3))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam4*v*ZH(gt1,2)*ZP(gt2,3))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam5*v*ZH(gt1,2)*ZP(gt2,3))/2._dp
End If 
If ((2.eq.gt3)) Then 
res = res-(lam7*vv*ZH(gt1,2)*ZP(gt2,3))
End If 
If ((3.eq.gt3)) Then 
res = res-(lam7*v*ZH(gt1,2)*ZP(gt2,3))/2._dp
End If 
If ((3.eq.gt3)) Then 
res = res-(lam2*vv*ZH(gt1,2)*ZP(gt2,3))
End If 
If ((3.eq.gt3)) Then 
res = res-(v*Conjg(lam7)*ZH(gt1,2)*ZP(gt2,3))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmcUHmL  
 
 
Subroutine CouplingHmcUHmVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcUHmVP' 
 
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
If ((1.eq.gt2)) Then 
res = res+g1*Cos(TW)*ZP(gt1,1)
End If 
If ((2.eq.gt2)) Then 
res = res+(g1*Cos(TW)*ZP(gt1,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Sin(TW)*ZP(gt1,2))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res+(g1*Cos(TW)*ZP(gt1,3))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res+(g2*Sin(TW)*ZP(gt1,3))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcUHmVPL  
 
 
Subroutine CouplingHmcUHmVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcUHmVZ' 
 
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
If ((1.eq.gt2)) Then 
res = res-(g1*Sin(TW)*ZP(gt1,1))
End If 
If ((2.eq.gt2)) Then 
res = res+(g2*Cos(TW)*ZP(gt1,2))/2._dp
End If 
If ((2.eq.gt2)) Then 
res = res-(g1*Sin(TW)*ZP(gt1,2))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res+(g2*Cos(TW)*ZP(gt1,3))/2._dp
End If 
If ((3.eq.gt2)) Then 
res = res-(g1*Sin(TW)*ZP(gt1,3))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcUHmVZL  
 
 
Subroutine CouplingcUHmcVWpVPL(gt1,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUHmcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt1)) Then 
res = res+(g1*g2*v*Cos(TW))/2._dp
End If 
If ((3.eq.gt1)) Then 
res = res+(g1*g2*vv*Cos(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUHmcVWpVPL  
 
 
Subroutine CouplingcUHmcVWpVZL(gt1,g1,g2,v,vv,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUHmcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((2.eq.gt1)) Then 
res = res-(g1*g2*v*Sin(TW))/2._dp
End If 
If ((3.eq.gt1)) Then 
res = res-(g1*g2*vv*Sin(TW))/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUHmcVWpVZL  
 
 
Subroutine CouplingAhAhUHmcUHmL(gt3,gt4,lam1,lam3,lam6,lam8,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Complex(dp), Intent(in) :: lam1,lam3,lam6,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhUHmcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam8)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam1)
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-1._dp*(lam6)
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-Conjg(lam6)
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhUHmcUHmL  
 
 
Subroutine CouplingetIetIUHmcUHmL(gt3,gt4,lam2,lam3,lam7,lam9,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Complex(dp), Intent(in) :: lam2,lam3,lam7,lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIUHmcUHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-1._dp*(lam9)
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-1._dp*(lam3)
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-1._dp*(lam7)
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-Conjg(lam7)
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-1._dp*(lam2)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIUHmcUHmL  
 
 
Subroutine CouplinghhhhUHmcUHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,             & 
& lam5,lam6,lam9,lam8,lam10,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhUHmcUHm' 
 
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

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(lam8*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(lam1*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-(lam6*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,1)*ZH(gt2,1))
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(lam10*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(lam6*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam7*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(lam10*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(Conjg(lam10)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(lam6*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam4*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam5*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam7*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2))/2._dp
End If 
If ((1.eq.gt3).And.(1.eq.gt4)) Then 
res = res-(lam9*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((2.eq.gt3).And.(2.eq.gt4)) Then 
res = res-(lam3*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((2.eq.gt4).And.(3.eq.gt3)) Then 
res = res-(lam7*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((2.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2))
End If 
If ((3.eq.gt3).And.(3.eq.gt4)) Then 
res = res-(lam2*ZH(gt1,2)*ZH(gt2,2))
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhUHmcUHmL  
 
 
Subroutine CouplingUHmHmcUHmcHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,            & 
& lam5,lam6,lam9,lam8,lamh,lam10,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmHmcUHmcHm' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-4*lamh*ZP(gt2,1)*ZP(gt4,1)
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam8*ZP(gt2,1)*ZP(gt4,1))
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(lam10*ZP(gt2,1)*ZP(gt4,1))
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Conjg(lam10)*ZP(gt2,1)*ZP(gt4,1))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(lam9*ZP(gt2,1)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam8*ZP(gt2,2)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(Conjg(lam10)*ZP(gt2,2)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam10*ZP(gt2,3)*ZP(gt4,1))
End If 
If ((1.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(lam9*ZP(gt2,3)*ZP(gt4,1))
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(lam8*ZP(gt2,1)*ZP(gt4,2))
End If 
If ((1.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(lam10*ZP(gt2,1)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(lam8*ZP(gt2,2)*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*lam1*ZP(gt2,2)*ZP(gt4,2)
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-2*lam6*ZP(gt2,2)*ZP(gt4,2)
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-2*Conjg(lam6)*ZP(gt2,2)*ZP(gt4,2)
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(lam3*ZP(gt2,2)*ZP(gt4,2))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(lam4*ZP(gt2,2)*ZP(gt4,2))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(lam10*ZP(gt2,3)*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*lam6*ZP(gt2,3)*ZP(gt4,2)
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-2*lam5*ZP(gt2,3)*ZP(gt4,2)
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(lam3*ZP(gt2,3)*ZP(gt4,2))
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-(lam4*ZP(gt2,3)*ZP(gt4,2))
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-2*lam7*ZP(gt2,3)*ZP(gt4,2)
End If 
If ((1.eq.gt3).And.(2.eq.gt1)) Then 
res = res-(Conjg(lam10)*ZP(gt2,1)*ZP(gt4,3))
End If 
If ((1.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(lam9*ZP(gt2,1)*ZP(gt4,3))
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(Conjg(lam10)*ZP(gt2,2)*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-2*Conjg(lam6)*ZP(gt2,2)*ZP(gt4,3)
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(lam3*ZP(gt2,2)*ZP(gt4,3))
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-(lam4*ZP(gt2,2)*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-2*lam5*ZP(gt2,2)*ZP(gt4,3)
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-2*Conjg(lam7)*ZP(gt2,2)*ZP(gt4,3)
End If 
If ((1.eq.gt1).And.(1.eq.gt3)) Then 
res = res-(lam9*ZP(gt2,3)*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam3*ZP(gt2,3)*ZP(gt4,3))
End If 
If ((2.eq.gt1).And.(2.eq.gt3)) Then 
res = res-(lam4*ZP(gt2,3)*ZP(gt4,3))
End If 
If ((2.eq.gt3).And.(3.eq.gt1)) Then 
res = res-2*lam7*ZP(gt2,3)*ZP(gt4,3)
End If 
If ((2.eq.gt1).And.(3.eq.gt3)) Then 
res = res-2*Conjg(lam7)*ZP(gt2,3)*ZP(gt4,3)
End If 
If ((3.eq.gt1).And.(3.eq.gt3)) Then 
res = res-2*lam2*ZP(gt2,3)*ZP(gt4,3)
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmHmcUHmcHmL  
 
 
Subroutine CouplingUHmcUHmVPVPL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmVPVP' 
 
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
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+2*g1**2*Cos(TW)**2
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+(g1**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+g1*g2*Cos(TW)*Sin(TW)
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+(g2**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmVPVPL  
 
 
Subroutine CouplingUHmcUHmcVWpVWpL(gt1,gt2,g2,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmcVWpVWp' 
 
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
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+g2**2/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmcVWpVWpL  
 
 
Subroutine CouplingUHmcUHmVZVZL(gt1,gt2,g1,g2,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUHmcUHmVZVZ' 
 
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
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+(g2**2*Cos(TW)**2)/2._dp
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res-(g1*g2*Cos(TW)*Sin(TW))
End If 
If ((1.eq.gt1).And.(1.eq.gt2)) Then 
res = res+2*g1**2*Sin(TW)**2
End If 
If ((2.eq.gt1).And.(2.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If ((3.eq.gt1).And.(3.eq.gt2)) Then 
res = res+(g1**2*Sin(TW)**2)/2._dp
End If 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUHmcUHmVZVZL  
 
 
Subroutine CouplingUFvFecVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFecVWp' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZEL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFecVWpL  
 
 
Subroutine CouplingUFvFeHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFeHm' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL-(Conjg(ZEL(gt2,j1))*Yh(j1,gt1)*ZP(gt3,1))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZEL(gt2,j2))*Yh(gt1,j2)*ZP(gt3,1)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZP(gt3,2)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR+Conjg(epsE(gt1,j2))*ZER(gt2,j2)*ZP(gt3,3)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFeHmL  
 
 
Subroutine CouplingUFvFvVZL(gt1,gt2,g1,g2,UV,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: UV(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingUFvFvVZ' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(UV(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(UV(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g2*Cos(TW)*UV(gt2,gt1))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Sin(TW)*UV(gt2,gt1))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingUFvFvVZL  
 
 
Subroutine CouplingcFeUFvVWpL(gt1,gt2,g2,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeUFvVWp' 
 
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
If ((gt2.le.3).And.(gt2.ge.1)) Then 
resL = resL-((g2*ZEL(gt1,gt2))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeUFvVWpL  
 
 
Subroutine CouplingcFeUFvcHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeUFvcHm' 
 
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
If ((gt2.le.3).And.(gt2.ge.1)) Then 
Do j1 = 1,3
resL = resL+Conjg(ZER(gt1,j1))*Ye(j1,gt2)*ZP(gt3,2)
End Do 
End If 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZER(gt1,j2))*epsE(gt2,j2)*ZP(gt3,3)
End Do 
End If 
resR = 0._dp 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
Do j1 = 1,3
resR = resR-(Conjg(Yh(j1,gt2))*ZEL(gt1,j1)*ZP(gt3,1))
End Do 
End If 
If ((gt2.le.3).And.(gt2.ge.1)) Then 
Do j2 = 1,3
resR = resR+Conjg(Yh(gt2,j2))*ZEL(gt1,j2)*ZP(gt3,1)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeUFvcHmL  
 
 
Subroutine CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdAh' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdAhL  
 
 
Subroutine CouplingcUFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdetI' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*epsD(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,gt1))*ZDR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdetIL  
 
 
Subroutine CouplingcUFdFdhhL(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdhh' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*Yd(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZDL(gt2,j2))*epsD(gt1,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(epsD(j1,gt1))*ZDR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdhhL  
 
 
Subroutine CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVG' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZDL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZDR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVGL  
 
 
Subroutine CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVP' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZDL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(g1*Cos(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVPL  
 
 
Subroutine CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFdVZ' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZDL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZDL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZDR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFdVZL  
 
 
Subroutine CouplingcUFdFucHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFucHm' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZUL(gt2,j2))*Yd(gt1,j2)*ZP(gt3,2)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZUL(gt2,j2))*epsD(gt1,j2)*ZP(gt3,3)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZP(gt3,2)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(epsU(j1,gt1))*ZUR(gt2,j1)*ZP(gt3,3)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFucHmL  
 
 
Subroutine CouplingcUFdFuVWpL(gt1,gt2,g2,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFdFuVWp' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZUL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFdFuVWpL  
 
 
Subroutine CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuAh' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*Yu(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuAhL  
 
 
Subroutine CouplingcUFuFuetIL(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuetI' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZUL(gt2,j2))*epsU(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,gt1))*ZUR(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuetIL  
 
 
Subroutine CouplingcUFuFdcVWpL(gt1,gt2,g2,ZDL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdcVWp' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(ZDL(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdcVWpL  
 
 
Subroutine CouplingcUFuFdHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFdHm' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*Yu(gt1,j2)*ZP(gt3,2)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(ZDL(gt2,j2))*epsU(gt1,j2)*ZP(gt3,3)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yd(j1,gt1))*ZDR(gt2,j1)*ZP(gt3,2)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(epsD(j1,gt1))*ZDR(gt2,j1)*ZP(gt3,3)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFdHmL  
 
 
Subroutine CouplingcUFuFuhhL(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuhh' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*Yu(gt1,j2)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL-((Conjg(ZUL(gt2,j2))*epsU(gt1,j2)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,1))/sqrt(2._dp))
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,gt1))*ZUR(gt2,j1)*ZH(gt3,2))/sqrt(2._dp))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuhhL  
 
 
Subroutine CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVG' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g3*Conjg(ZUL(gt2,gt1)))
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g3*ZUR(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVGL  
 
 
Subroutine CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVP' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZUL(gt2,gt1))*Cos(TW))/6._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(-2*g1*Cos(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVPL  
 
 
Subroutine CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFuFuVZ' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g2*Conjg(ZUL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZUL(gt2,gt1))*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+(2*g1*Sin(TW)*ZUR(gt2,gt1))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFuFuVZL  
 
 
Subroutine CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeAh' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,gt1))*ZER(gt2,j1))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeAhL  
 
 
Subroutine CouplingcUFeFeetIL(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeetI' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j1))*epsE(j1,gt1))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-((Conjg(epsE(gt1,j2))*ZER(gt2,j2))/sqrt(2._dp))
End Do 
End If 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeetIL  
 
 
Subroutine CouplingcUFeFehhL(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFehh' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+(Conjg(ZEL(gt2,j1))*epsE(j1,gt1)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+(Conjg(ZEL(gt2,j2))*Ye(gt1,j2)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+(Conjg(Ye(j1,gt1))*ZER(gt2,j1)*ZH(gt3,1))/sqrt(2._dp)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR+(Conjg(epsE(gt1,j2))*ZER(gt2,j2)*ZH(gt3,2))/sqrt(2._dp)
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFehhL  
 
 
Subroutine CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVP' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g1*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR+g1*Cos(TW)*ZER(gt2,gt1)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVPL  
 
 
Subroutine CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(in) :: ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFeVZ' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL+(g2*Conjg(ZEL(gt2,gt1))*Cos(TW))/2._dp
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-(g1*Conjg(ZEL(gt2,gt1))*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resR = resR-(g1*Sin(TW)*ZER(gt2,gt1))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFeVZL  
 
 
Subroutine CouplingcUFeFvcHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: epsE(3,3),Ye(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvcHm' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resL = resL+Conjg(UV(gt2,j1))*epsE(j1,gt1)*ZP(gt3,3)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resL = resL+Conjg(UV(gt2,j2))*Ye(gt1,j2)*ZP(gt3,2)
End Do 
End If 
resR = 0._dp 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j1 = 1,3
resR = resR+Conjg(Yh(j1,gt1))*UV(gt2,j1)*ZP(gt3,1)
End Do 
End If 
If ((gt1.le.3).And.(gt1.ge.1)) Then 
Do j2 = 1,3
resR = resR-(Conjg(Yh(gt1,j2))*UV(gt2,j2)*ZP(gt3,1))
End Do 
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvcHmL  
 
 
Subroutine CouplingcUFeFvVWpL(gt1,gt2,g2,UV,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcUFeFvVWp' 
 
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
If ((gt1.le.3).And.(gt1.ge.1)) Then 
resL = resL-((g2*Conjg(UV(gt2,gt1)))/sqrt(2._dp))
End If 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcUFeFvVWpL  
 
 
Subroutine CouplingAhAhAhL(lam6,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAh' 
 
res = 0._dp 
res = res+(-3*lam6*vv)/2._dp
res = res+(3*vv*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhL  
 
 
Subroutine CouplingAhAhetIL(lam6,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetI' 
 
res = 0._dp 
res = res+(lam6*v)/2._dp
res = res-(v*Conjg(lam6))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIL  
 
 
Subroutine CouplingAhAhhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*v*ZH(gt3,1))
res = res-(lam6*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt3,2))/2._dp
res = res-(lam3*vv*ZH(gt3,2))
res = res-(lam4*vv*ZH(gt3,2))
res = res+lam5*vv*ZH(gt3,2)
res = res-(v*Conjg(lam6)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhL  
 
 
Subroutine CouplingAhetIetIL(lam7,vv,res)

Implicit None 

Real(dp), Intent(in) :: vv

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetI' 
 
res = 0._dp 
res = res-(lam7*vv)/2._dp
res = res+(vv*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIL  
 
 
Subroutine CouplingAhetIhhL(gt3,lam7,lam5,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam6*v*ZH(gt3,1))/2._dp
res = res-(lam5*vv*ZH(gt3,1))
res = res-(v*Conjg(lam6)*ZH(gt3,1))/2._dp
res = res-(lam5*v*ZH(gt3,2))
res = res-(lam7*vv*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhL  
 
 
Subroutine CouplingcFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdAh' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*Yd(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yd(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdAhL  
 
 
Subroutine CouplingcFeFeAhL(gt1,gt2,Ye,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Ye(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeAh' 
 
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
resL = resL+(Conjg(ZER(gt1,j1))*Conjg(ZEL(gt2,j2))*Ye(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Ye(j1,j2))*ZER(gt2,j1)*ZEL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeAhL  
 
 
Subroutine CouplingcFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: Yu(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuAh' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*Yu(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(Yu(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuAhL  
 
 
Subroutine CouplingcgWpgWpAhL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpAh' 
 
res = 0._dp 
res = res-(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpAhL  
 
 
Subroutine CouplingcgWCgWCAhL(g2,v,res)

Implicit None 

Real(dp), Intent(in) :: g2,v

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCAh' 
 
res = 0._dp 
res = res+(g2**2*v*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCAhL  
 
 
Subroutine CouplingAhhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhh' 
 
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
res = res-(lam6*vv*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(vv*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(lam6*v*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(-3*lam7*vv*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res+(3*vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhL  
 
 
Subroutine CouplingAhhhVZL(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,1))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,1))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhVZL  
 
 
Subroutine CouplingAhHmcHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,vv,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,vv,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmcHm' 
 
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
res = res-(lam10*vv*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(vv*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-((mu*ZP(gt2,3)*ZP(gt3,1))/sqrt(2._dp))
res = res-(lam6*vv*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(vv*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res+(lam4*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res-(lam5*vv*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(Conjg(mu)*ZP(gt2,1)*ZP(gt3,3))/sqrt(2._dp)
res = res-(lam4*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam5*vv*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam7*vv*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res+(vv*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmcHmL  
 
 
Subroutine CouplingAhHmVWpL(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVWpL  
 
 
Subroutine CouplingAhAhAhAhL(lam1,res)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res = 0._dp 
res = res-3._dp*(lam1)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhL  
 
 
Subroutine CouplingAhAhetIetIL(lam4,lam3,lam5,res)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res = 0._dp 
res = res-1._dp*(lam3)
res = res-1._dp*(lam4)
res = res-1._dp*(lam5)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetIL  
 
 
Subroutine CouplingAhAhhhhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam1*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam3*ZH(gt3,2)*ZH(gt4,2))
res = res-(lam4*ZH(gt3,2)*ZH(gt4,2))
res = res+lam5*ZH(gt3,2)*ZH(gt4,2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhL  
 
 
Subroutine CouplingAhAhHmcHmL(gt3,gt4,lam1,lam3,lam6,lam8,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam3,lam6,lam8

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam8*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam1*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam6*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam3*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmL  
 
 
Subroutine CouplingAhAhcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpL  
 
 
Subroutine CouplingAhAhVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZL  
 
 
Subroutine CouplingetIetIetIL(lam7,v,res)

Implicit None 

Real(dp), Intent(in) :: v

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetI' 
 
res = 0._dp 
res = res+(3*lam7*v)/2._dp
res = res+(-3*v*Conjg(lam7))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIL  
 
 
Subroutine CouplingetIetIhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*v*ZH(gt3,1))
res = res-(lam4*v*ZH(gt3,1))
res = res+lam5*v*ZH(gt3,1)
res = res-(lam7*vv*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt3,1))/2._dp
res = res-(lam7*v*ZH(gt3,2))/2._dp
res = res-(lam2*vv*ZH(gt3,2))
res = res-(v*Conjg(lam7)*ZH(gt3,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhL  
 
 
Subroutine CouplingcFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsD(3,3),ZDL(3,3),ZDR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdetI' 
 
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
resL = resL+(Conjg(ZDR(gt1,j1))*Conjg(ZDL(gt2,j2))*epsD(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsD(j1,j2))*ZDR(gt2,j1)*ZDL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdetIL  
 
 
Subroutine CouplingcFeFeetIL(gt1,gt2,epsE,ZEL,ZER,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsE(3,3),ZEL(3,3),ZER(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeetI' 
 
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
resL = resL+(Conjg(ZER(gt1,j2))*Conjg(ZEL(gt2,j1))*epsE(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsE(j1,j2))*ZER(gt2,j2)*ZEL(gt1,j1))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeetIL  
 
 
Subroutine CouplingcFuFuetIL(gt1,gt2,epsU,ZUL,ZUR,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Complex(dp), Intent(in) :: epsU(3,3),ZUL(3,3),ZUR(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuetI' 
 
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
resL = resL+(Conjg(ZUR(gt1,j1))*Conjg(ZUL(gt2,j2))*epsU(j1,j2))/sqrt(2._dp)
End Do 
End Do 
resR = 0._dp 
Do j2 = 1,3
Do j1 = 1,3
resR = resR-((Conjg(epsU(j1,j2))*ZUR(gt2,j1)*ZUL(gt1,j2))/sqrt(2._dp))
End Do 
End Do 
resL = -(0.,1.)*resL 
 
resR = -(0.,1.)*resR 
 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuetIL  
 
 
Subroutine CouplingcgWpgWpetIL(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpetI' 
 
res = 0._dp 
res = res-(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpetIL  
 
 
Subroutine CouplingcgWCgWCetIL(g2,vv,res)

Implicit None 

Real(dp), Intent(in) :: g2,vv

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCetI' 
 
res = 0._dp 
res = res+(g2**2*vv*RXiWp)/4._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCetIL  
 
 
Subroutine CouplingetIhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: v,vv,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhh' 
 
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
res = res+(3*lam6*v*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(-3*v*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1))/2._dp
res = res+(lam7*vv*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res-(vv*Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2))/2._dp
res = res+(lam7*v*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = res-(v*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhL  
 
 
Subroutine CouplingetIhhVZL(gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2*Cos(TW)*ZH(gt2,2))/2._dp
res = res+(g1*Sin(TW)*ZH(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhVZL  
 
 
Subroutine CouplingetIHmcHmL(gt2,gt3,lam4,lam7,lam5,lam6,mu,lam10,v,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2,gt3
Real(dp), Intent(in) :: lam5,v,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,mu,lam10

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmcHm' 
 
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
res = res+(lam10*v*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res-(v*Conjg(lam10)*ZP(gt2,1)*ZP(gt3,1))/2._dp
res = res+(mu*ZP(gt2,2)*ZP(gt3,1))/sqrt(2._dp)
res = res-((Conjg(mu)*ZP(gt2,1)*ZP(gt3,2))/sqrt(2._dp))
res = res+(lam6*v*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(v*Conjg(lam6)*ZP(gt2,2)*ZP(gt3,2))/2._dp
res = res-(lam4*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam5*v*ZP(gt2,3)*ZP(gt3,2))/2._dp
res = res+(lam4*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res-(lam5*v*ZP(gt2,2)*ZP(gt3,3))/2._dp
res = res+(lam7*v*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = res-(v*Conjg(lam7)*ZP(gt2,3)*ZP(gt3,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmcHmL  
 
 
Subroutine CouplingetIHmVWpL(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmVWpL  
 
 
Subroutine CouplingetIetIetIetIL(lam2,res)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res = 0._dp 
res = res-3._dp*(lam2)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetIL  
 
 
Subroutine CouplingetIetIhhhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam3*ZH(gt3,1)*ZH(gt4,1))
res = res-(lam4*ZH(gt3,1)*ZH(gt4,1))
res = res+lam5*ZH(gt3,1)*ZH(gt4,1)
res = res-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res = res-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res = res-(lam2*ZH(gt3,2)*ZH(gt4,2))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhL  
 
 
Subroutine CouplingetIetIHmcHmL(gt3,gt4,lam2,lam3,lam7,lam9,ZP,res)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam2,lam3,lam7,lam9

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(lam9*ZP(gt3,1)*ZP(gt4,1))
res = res-(lam3*ZP(gt3,2)*ZP(gt4,2))
res = res-(lam7*ZP(gt3,3)*ZP(gt4,2))
res = res-(Conjg(lam7)*ZP(gt3,2)*ZP(gt4,3))
res = res-(lam2*ZP(gt3,3)*ZP(gt4,3))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHmcHmL  
 
 
Subroutine CouplingetIetIcVWpVWpL(g2,res)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIcVWpVWp' 
 
res = 0._dp 
res = res+g2**2/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIcVWpVWpL  
 
 
Subroutine CouplingetIetIVZVZL(g1,g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIVZVZ' 
 
res = 0._dp 
res = res+(g2**2*Cos(TW)**2)/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)
res = res+(g1**2*Sin(TW)**2)/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIVZVZL  
 
 
Subroutine CouplingcFdFdVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVGL  
 
 
Subroutine CouplingcFuFuVGL(gt1,gt2,g3,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVG' 
 
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
resL = resL-1._dp*(g3)
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-1._dp*(g3)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVGL  
 
 
Subroutine CouplingcgGgGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgGgGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgGgGVGL  
 
 
Subroutine CouplingVGVGVGL(g3,res)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVG' 
 
res = 0._dp 
res = res+g3
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGL  
 
 
Subroutine CouplingVGVGVGVGL(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2
res2 = 0._dp 
res3 = 0._dp 
res3 = res3+16*g3**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGL  
 
 
Subroutine CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVP' 
 
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
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVPL  
 
 
Subroutine CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVP' 
 
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
resL = resL+(g1*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+g1*Cos(TW)
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVPL  
 
 
Subroutine CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVP' 
 
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
resL = resL-(g1*Cos(TW))/6._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g2*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(-2*g1*Cos(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVPL  
 
 
Subroutine CouplingcgWpgWpVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVP' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVPL  
 
 
Subroutine CouplingcgWCgWCVPL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVP' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVPL  
 
 
Subroutine CouplingHmcHmVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVP' 
 
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
res = res+g1*Cos(TW)*ZP(gt1,1)*ZP(gt2,1)
res = res+(g1*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1*Cos(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+(g2*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPL  
 
 
Subroutine CouplingHmVPVWpL(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVPVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(g1*g2*vv*Cos(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVPVWpL  
 
 
Subroutine CouplingcVWpVPVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpL  
 
 
Subroutine CouplingHmcHmVPVPL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
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
res = res+2*g1**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1)
res = res+(g1**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g1**2*Cos(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,3)*ZP(gt2,3)
res = res+(g2**2*Sin(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPL  
 
 
Subroutine CouplingcVWpVPVPVWpL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpL  
 
 
Subroutine CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFdFdVZ' 
 
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
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFdFdVZL  
 
 
Subroutine CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFeFeVZ' 
 
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
resL = resL+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR-(g1*Sin(TW))
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFeFeVZL  
 
 
Subroutine CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFuVZ' 
 
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
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL+(g1*Sin(TW))/6._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(2*g1*Sin(TW))/3._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFuVZL  
 
 
Subroutine CouplingFvFvVZL(gt1,gt2,g1,g2,TW,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFvVZ' 
 
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
resL = resL-(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resL = resL-(g1*Sin(TW))/2._dp
End If 
resR = 0._dp 
If ((gt1.eq.gt2)) Then 
resR = resR+(g2*Cos(TW))/2._dp
End If 
If ((gt1.eq.gt2)) Then 
resR = resR+(g1*Sin(TW))/2._dp
End If 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFvVZL  
 
 
Subroutine CouplingcgWpgWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWpgWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWpgWpVZL  
 
 
Subroutine CouplingcgWCgWCVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgWCVZ' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgWCVZL  
 
 
Subroutine CouplinghhVZVZL(gt1,g1,g2,v,vv,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhVZVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*Cos(TW)**2*ZH(gt1,1))/2._dp
res = res+g1*g2*v*Cos(TW)*Sin(TW)*ZH(gt1,1)
res = res+(g1**2*v*Sin(TW)**2*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*Cos(TW)**2*ZH(gt1,2))/2._dp
res = res+g1*g2*vv*Cos(TW)*Sin(TW)*ZH(gt1,2)
res = res+(g1**2*vv*Sin(TW)**2*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhVZVZL  
 
 
Subroutine CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZ' 
 
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
res = res-(g1*Sin(TW)*ZP(gt1,1)*ZP(gt2,1))
res = res+(g2*Cos(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2*Cos(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZL  
 
 
Subroutine CouplingHmVWpVZL(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*g2*vv*Sin(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmVWpVZL  
 
 
Subroutine CouplingcVWpVWpVZL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZ' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZL  
 
 
Subroutine CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
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

res = 0._dp 
res = res+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res = res+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res = res+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZL  
 
 
Subroutine CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
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
res = res+2*g1**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1)
res = res+(g2**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2**2*Cos(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))
res = res+(g1**2*Sin(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZL  
 
 
Subroutine CouplingcVWpVWpVZVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZL  
 
 
Subroutine CouplingAhcHmcVWpL(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,2))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWpL  
 
 
Subroutine CouplingetIcHmcVWpL(gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcHmcVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g2*ZP(gt2,3))/2._dp
res = -(0.,1.)*res 
 
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingetIcHmcVWpL  
 
 
Subroutine CouplingcFuFdcVWpL(gt1,gt2,g2,ZDL,ZUL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcFuFdcVWp' 
 
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
resL = resL-((g2*Conjg(ZDL(gt2,j1))*ZUL(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcFuFdcVWpL  
 
 
Subroutine CouplingFvFecVWpL(gt1,gt2,g2,UV,ZEL,resL,resR)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2

Complex(dp), Intent(in) :: UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: resL, resR 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingFvFecVWp' 
 
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
resL = resL-((g2*Conjg(ZEL(gt2,j1))*UV(gt1,j1))/sqrt(2._dp))
End Do 
resR = 0._dp 
If ((Real(resL,dp).ne.Real(resL,dp)).or.(Real(resR,dp).ne.Real(resR,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingFvFecVWpL  
 
 
Subroutine CouplingcgWCgAcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgAcVWp' 
 
res = 0._dp 
res = res-(g2*Sin(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgAcVWpL  
 
 
Subroutine CouplingcgAgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgAgWpcVWp' 
 
res = 0._dp 
res = res+g2*Sin(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgAgWpcVWpL  
 
 
Subroutine CouplingcgZgWpcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgZgWpcVWp' 
 
res = 0._dp 
res = res+g2*Cos(TW)
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgZgWpcVWpL  
 
 
Subroutine CouplingcgWCgZcVWpL(g2,TW,res)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcgWCgZcVWp' 
 
res = 0._dp 
res = res-(g2*Cos(TW))
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcgWCgZcVWpL  
 
 
Subroutine CouplinghhcHmcVWpL(gt1,gt2,g2,ZH,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2),ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWp' 
 
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
res = res+(g2*ZH(gt1,1)*ZP(gt2,2))/2._dp
res = res+(g2*ZH(gt1,2)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWpL  
 
 
Subroutine CouplinghhcVWpVWpL(gt1,g2,v,vv,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g2,v,vv,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcVWpVWp' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g2**2*v*ZH(gt1,1))/2._dp
res = res+(g2**2*vv*ZH(gt1,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhcVWpVWpL  
 
 
Subroutine CouplingcHmcVWpVPL(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWpVP' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res+(g1*g2*v*Cos(TW)*ZP(gt1,2))/2._dp
res = res+(g1*g2*vv*Cos(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWpVPL  
 
 
Subroutine CouplingcHmcVWpVZL(gt1,g1,g2,v,vv,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1
Real(dp), Intent(in) :: g1,g2,v,vv,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcHmcVWpVZ' 
 
If ((gt1.Lt.1).Or.(gt1.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt1 out of range', gt1 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt1 out of range', gt1 
  Call TerminateProgram 
End If 

res = 0._dp 
res = res-(g1*g2*v*Sin(TW)*ZP(gt1,2))/2._dp
res = res-(g1*g2*vv*Sin(TW)*ZP(gt1,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcHmcVWpVZL  
 
 
Subroutine CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
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

res = 0._dp 
res = res+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res = res+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpL  
 
 
Subroutine CouplingHmcHmcVWpVWpL(gt1,gt2,g2,ZP,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWpVWp' 
 
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
res = res+(g2**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res+(g2**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWpVWpL  
 
 
Subroutine CouplingcVWpcVWpVWpVWpL(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2
res2 = 0._dp 
res2 = res2-g2**2
res3 = 0._dp 
res3 = res3-g2**2
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpL  
 
 
Subroutine CouplingHmcHmVPVZL(gt1,gt2,g1,g2,ZP,TW,res)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
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
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res = res+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/2._dp
res = res-(g1**2*Sin(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/4._dp
res = res+(g2**2*Sin(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/4._dp
If (Real(res,dp).ne.Real(res,dp)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZL  
 
 
Subroutine CouplingcVWpVPVWpVZL(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1, res2, res3 
 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Sin(2._dp*(TW)))/2._dp
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))
res3 = 0._dp 
res3 = res3+(g2**2*Sin(2._dp*(TW)))/2._dp
If ((Real(res1,dp).ne.Real(res1,dp)).or.(Real(res2,dp).ne.Real(res2,dp)).or.(Real(res3,dp).ne.Real(res3,dp))) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Call TerminateProgram 
End If 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZL  
 
 
Subroutine CouplingsForVectorBosons(g1,g2,ZH,TW,ZP,v,vv,ZDL,ZUL,UV,ZEL,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIhhVZ,cpletIHmVWp,cpletIetIcVWpVWp,& 
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

Implicit None 
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW,ZP(3,3),v,vv

Complex(dp), Intent(in) :: ZDL(3,3),ZUL(3,3),UV(3,3),ZEL(3,3)

Complex(dp), Intent(out) :: cplAhhhVZ(2),cplAhHmVWp(3),cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIhhVZ(2),cpletIHmVWp(3),   & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),     & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmcHmVP(3,3),cplHmVPVWp(3),cplcVWpVPVWp,cplHmcHmVPVP(3,3),cplcVWpVPVPVWp1,          & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),    & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),    & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHmcHmVZ(3,3),cplHmVWpVZ(3),cplcVWpVWpVZ,     & 
& cplhhhhVZVZ(2,2),cplHmcHmVZVZ(3,3),cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,    & 
& cplAhcHmcVWp(3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),& 
& cplFvFecVWpR(3,3),cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,             & 
& cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplhhhhcVWpVWp(2,2), & 
& cplHmcHmcVWpVWp(3,3),cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,         & 
& cplHmcHmVPVZ(3,3),cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForVectorBosons'
 
cplAhhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhhhVZL(gt2,g1,g2,ZH,TW,cplAhhhVZ(gt2))

End Do 


cplAhHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpL(gt2,g2,ZP,cplAhHmVWp(gt2))

End Do 


cplAhAhcVWpVWp = 0._dp 
Call CouplingAhAhcVWpVWpL(g2,cplAhAhcVWpVWp)



cplAhAhVZVZ = 0._dp 
Call CouplingAhAhVZVZL(g1,g2,TW,cplAhAhVZVZ)



cpletIhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIhhVZL(gt2,g1,g2,ZH,TW,cpletIhhVZ(gt2))

End Do 


cpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpL(gt2,g2,ZP,cpletIHmVWp(gt2))

End Do 


cpletIetIcVWpVWp = 0._dp 
Call CouplingetIetIcVWpVWpL(g2,cpletIetIcVWpVWp)



cpletIetIVZVZ = 0._dp 
Call CouplingetIetIVZVZL(g1,g2,TW,cpletIetIVZVZ)



cplcFdFdVPL = 0._dp 
cplcFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVPL(gt1,gt2,g1,g2,TW,cplcFdFdVPL(gt1,gt2),cplcFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVPL = 0._dp 
cplcFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVPL(gt1,gt2,g1,g2,TW,cplcFeFeVPL(gt1,gt2),cplcFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVPL = 0._dp 
cplcFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVPL(gt1,gt2,g1,g2,TW,cplcFuFuVPL(gt1,gt2),cplcFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVP = 0._dp 
Call CouplingcgWpgWpVPL(g2,TW,cplcgWpgWpVP)



cplcgWCgWCVP = 0._dp 
Call CouplingcgWCgWCVPL(g2,TW,cplcgWCgWCVP)



cplHmcHmVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVP(gt1,gt2))

 End Do 
End Do 


cplHmVPVWp = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVPVWpL(gt1,g1,g2,v,vv,ZP,TW,cplHmVPVWp(gt1))

End Do 


cplcVWpVPVWp = 0._dp 
Call CouplingcVWpVPVWpL(g2,TW,cplcVWpVPVWp)



cplHmcHmVPVP = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVPL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVPVWp1 = 0._dp 
cplcVWpVPVPVWp2 = 0._dp 
cplcVWpVPVPVWp3 = 0._dp 
Call CouplingcVWpVPVPVWpL(g2,TW,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZL(gt1,gt2,g1,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZL(gt1,gt2,g1,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZL(gt1,gt2,g1,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFvVZL(gt1,gt2,g1,g2,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplcgWpgWpVZ = 0._dp 
Call CouplingcgWpgWpVZL(g2,TW,cplcgWpgWpVZ)



cplcgWCgWCVZ = 0._dp 
Call CouplingcgWCgWCVZL(g2,TW,cplcgWCgWCVZ)



cplhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplinghhVZVZL(gt1,g1,g2,v,vv,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplHmcHmVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZ(gt1,gt2))

 End Do 
End Do 


cplHmVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingHmVWpVZL(gt1,g1,g2,v,vv,ZP,TW,cplHmVWpVZ(gt1))

End Do 


cplcVWpVWpVZ = 0._dp 
Call CouplingcVWpVWpVZL(g2,TW,cplcVWpVWpVZ)



cplhhhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZL(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVWpVZVZ1 = 0._dp 
cplcVWpVWpVZVZ2 = 0._dp 
cplcVWpVWpVZVZ3 = 0._dp 
Call CouplingcVWpVWpVZVZL(g2,TW,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3)



cplAhcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpL(gt2,g2,ZP,cplAhcHmcVWp(gt2))

End Do 


cpletIcHmcVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpL(gt2,g2,ZP,cpletIcHmcVWp(gt2))

End Do 


cplcFuFdcVWpL = 0._dp 
cplcFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWpL(gt1,gt2,g2,ZDL,ZUL,cplcFuFdcVWpL(gt1,gt2),cplcFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpL(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcgWCgAcVWp = 0._dp 
Call CouplingcgWCgAcVWpL(g2,TW,cplcgWCgAcVWp)



cplcgAgWpcVWp = 0._dp 
Call CouplingcgAgWpcVWpL(g2,TW,cplcgAgWpcVWp)



cplcgZgWpcVWp = 0._dp 
Call CouplingcgZgWpcVWpL(g2,TW,cplcgZgWpcVWp)



cplcgWCgZcVWp = 0._dp 
Call CouplingcgWCgZcVWpL(g2,TW,cplcgWCgZcVWp)



cplhhcHmcVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpL(gt1,gt2,g2,ZH,ZP,cplhhcHmcVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpL(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


cplcHmcVWpVP = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVPL(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVP(gt1))

End Do 


cplcHmcVWpVZ = 0._dp 
Do gt1 = 1, 3
Call CouplingcHmcVWpVZL(gt1,g1,g2,v,vv,ZP,TW,cplcHmcVWpVZ(gt1))

End Do 


cplhhhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpL(gt1,gt2,g2,ZH,cplhhhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWpVWp = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWpVWpL(gt1,gt2,g2,ZP,cplHmcHmcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplcVWpcVWpVWpVWp1 = 0._dp 
cplcVWpcVWpVWpVWp2 = 0._dp 
cplcVWpcVWpVWpVWp3 = 0._dp 
Call CouplingcVWpcVWpVWpVWpL(g2,cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3)



cplHmcHmVPVZ = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVZL(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ(gt1,gt2))

 End Do 
End Do 


cplcVWpVPVWpVZ1 = 0._dp 
cplcVWpVPVWpVZ2 = 0._dp 
cplcVWpVPVWpVZ3 = 0._dp 
Call CouplingcVWpVPVWpVZL(g2,TW,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3)



Iname = Iname - 1 
End Subroutine CouplingsForVectorBosons

Subroutine CouplingsForSMfermions(Yd,ZDL,ZDR,epsD,ZH,g3,g1,g2,TW,epsU,Yu,             & 
& ZP,ZUL,ZUR,Ye,ZEL,ZER,epsE,Yh,UV,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdetIL,              & 
& cplcUFdFdetIR,cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,        & 
& cplcUFdFdVPR,cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFucHmL,cplcUFdFucHmR,cplcUFdFuVWpL,      & 
& cplcUFdFuVWpR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFuetIL,cplcUFuFuetIR,cplcUFuFdcVWpL,    & 
& cplcUFuFdcVWpR,cplcUFuFdHmL,cplcUFuFdHmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,       & 
& cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFeFeAhL,         & 
& cplcUFeFeAhR,cplcUFeFeetIL,cplcUFeFeetIR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,       & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFvcHmL,cplcUFeFvcHmR,cplcUFeFvVWpL,      & 
& cplcUFeFvVWpR)

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),g3,g1,g2,TW,ZP(3,3)

Complex(dp), Intent(in) :: Yd(3,3),ZDL(3,3),ZDR(3,3),epsD(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),              & 
& Ye(3,3),ZEL(3,3),ZER(3,3),epsE(3,3),Yh(3,3),UV(3,3)

Complex(dp), Intent(out) :: cplcUFdFdAhL(3,3),cplcUFdFdAhR(3,3),cplcUFdFdetIL(3,3),cplcUFdFdetIR(3,3),            & 
& cplcUFdFdhhL(3,3,2),cplcUFdFdhhR(3,3,2),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFucHmL(3,3,3),cplcUFdFucHmR(3,3,3),cplcUFdFuVWpL(3,3),cplcUFdFuVWpR(3,3),       & 
& cplcUFuFuAhL(3,3),cplcUFuFuAhR(3,3),cplcUFuFuetIL(3,3),cplcUFuFuetIR(3,3),             & 
& cplcUFuFdcVWpL(3,3),cplcUFuFdcVWpR(3,3),cplcUFuFdHmL(3,3,3),cplcUFuFdHmR(3,3,3),       & 
& cplcUFuFuhhL(3,3,2),cplcUFuFuhhR(3,3,2),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFeFeAhL(3,3),cplcUFeFeAhR(3,3),cplcUFeFeetIL(3,3),cplcUFeFeetIR(3,3),             & 
& cplcUFeFehhL(3,3,2),cplcUFeFehhR(3,3,2),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFvcHmL(3,3,3),cplcUFeFvcHmR(3,3,3),         & 
& cplcUFeFvVWpL(3,3),cplcUFeFvVWpR(3,3)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForSMfermions'
 
cplcUFdFdAhL = 0._dp 
cplcUFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdAhL(gt1,gt2,Yd,ZDL,ZDR,cplcUFdFdAhL(gt1,gt2),cplcUFdFdAhR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdetIL = 0._dp 
cplcUFdFdetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdetIL(gt1,gt2,epsD,ZDL,ZDR,cplcUFdFdetIL(gt1,gt2),cplcUFdFdetIR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdhhL = 0._dp 
cplcUFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFdFdhhL(gt1,gt2,gt3,epsD,Yd,ZH,ZDL,ZDR,cplcUFdFdhhL(gt1,gt2,gt3)       & 
& ,cplcUFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFdVGL = 0._dp 
cplcUFdFdVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVGL(gt1,gt2,g3,ZDL,ZDR,cplcUFdFdVGL(gt1,gt2),cplcUFdFdVGR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVPL = 0._dp 
cplcUFdFdVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVPL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVPL(gt1,gt2),cplcUFdFdVPR(gt1,gt2))

 End Do 
End Do 


cplcUFdFdVZL = 0._dp 
cplcUFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFdVZL(gt1,gt2,g1,g2,ZDL,ZDR,TW,cplcUFdFdVZL(gt1,gt2),cplcUFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcUFdFucHmL = 0._dp 
cplcUFdFucHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFdFucHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZUL,ZUR,cplcUFdFucHmL(gt1,gt2,gt3)& 
& ,cplcUFdFucHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFdFuVWpL = 0._dp 
cplcUFdFuVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFdFuVWpL(gt1,gt2,g2,ZUL,cplcUFdFuVWpL(gt1,gt2),cplcUFdFuVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuAhL = 0._dp 
cplcUFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuAhL(gt1,gt2,Yu,ZUL,ZUR,cplcUFuFuAhL(gt1,gt2),cplcUFuFuAhR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuetIL = 0._dp 
cplcUFuFuetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuetIL(gt1,gt2,epsU,ZUL,ZUR,cplcUFuFuetIL(gt1,gt2),cplcUFuFuetIR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdcVWpL = 0._dp 
cplcUFuFdcVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFdcVWpL(gt1,gt2,g2,ZDL,cplcUFuFdcVWpL(gt1,gt2),cplcUFuFdcVWpR(gt1,gt2))

 End Do 
End Do 


cplcUFuFdHmL = 0._dp 
cplcUFuFdHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFuFdHmL(gt1,gt2,gt3,epsU,Yu,epsD,Yd,ZP,ZDL,ZDR,cplcUFuFdHmL(gt1,gt2,gt3)& 
& ,cplcUFuFdHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuhhL = 0._dp 
cplcUFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFuFuhhL(gt1,gt2,gt3,epsU,Yu,ZH,ZUL,ZUR,cplcUFuFuhhL(gt1,gt2,gt3)       & 
& ,cplcUFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFuFuVGL = 0._dp 
cplcUFuFuVGR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVGL(gt1,gt2,g3,ZUL,ZUR,cplcUFuFuVGL(gt1,gt2),cplcUFuFuVGR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVPL = 0._dp 
cplcUFuFuVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVPL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVPL(gt1,gt2),cplcUFuFuVPR(gt1,gt2))

 End Do 
End Do 


cplcUFuFuVZL = 0._dp 
cplcUFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFuFuVZL(gt1,gt2,g1,g2,ZUL,ZUR,TW,cplcUFuFuVZL(gt1,gt2),cplcUFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeAhL = 0._dp 
cplcUFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeAhL(gt1,gt2,Ye,ZEL,ZER,cplcUFeFeAhL(gt1,gt2),cplcUFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeetIL = 0._dp 
cplcUFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeetIL(gt1,gt2,epsE,ZEL,ZER,cplcUFeFeetIL(gt1,gt2),cplcUFeFeetIR(gt1,gt2))

 End Do 
End Do 


cplcUFeFehhL = 0._dp 
cplcUFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcUFeFehhL(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcUFeFehhL(gt1,gt2,gt3)       & 
& ,cplcUFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFeVPL = 0._dp 
cplcUFeFeVPR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVPL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVPL(gt1,gt2),cplcUFeFeVPR(gt1,gt2))

 End Do 
End Do 


cplcUFeFeVZL = 0._dp 
cplcUFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFeVZL(gt1,gt2,g1,g2,ZEL,ZER,TW,cplcUFeFeVZL(gt1,gt2),cplcUFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcUFeFvcHmL = 0._dp 
cplcUFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcUFeFvcHmL(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,cplcUFeFvcHmL(gt1,gt2,gt3)       & 
& ,cplcUFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcUFeFvVWpL = 0._dp 
cplcUFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcUFeFvVWpL(gt1,gt2,g2,UV,cplcUFeFvVWpL(gt1,gt2),cplcUFeFvVWpR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForSMfermions

Subroutine CouplingsForTadpoles(lam1,lam4,lam3,lam5,lam6,v,vv,lam7,ZH,g1,             & 
& g2,TW,lam2,epsD,Yd,ZDL,ZDR,epsE,Ye,ZEL,ZER,epsU,Yu,ZUL,ZUR,lam9,lam8,mu,               & 
& lam10,ZP,cplAhAhUhh,cplAhetIUhh,cplAhUhhhh,cplAhUhhVZ,cpletIetIUhh,cpletIUhhhh,        & 
& cpletIUhhVZ,cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,          & 
& cplcFuFuUhhR,cplcgWpgWpUhh,cplcgWCgWCUhh,cplcgZgZUhh,cplUhhhhhh,cplUhhHmcHm,           & 
& cplUhhHmVWp,cplUhhcVWpVWp,cplUhhVZVZ,cplAhAhUhhUhh,cpletIetIUhhUhh,cplUhhUhhhhhh,      & 
& cplUhhUhhHmcHm,cplUhhUhhcVWpVWp,cplUhhUhhVZVZ)

Implicit None 
Real(dp), Intent(in) :: lam5,v,vv,ZH(2,2),g1,g2,TW,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6,lam7,lam2,epsD(3,3),Yd(3,3),ZDL(3,3),ZDR(3,3),epsE(3,3),          & 
& Ye(3,3),ZEL(3,3),ZER(3,3),epsU(3,3),Yu(3,3),ZUL(3,3),ZUR(3,3),lam9,lam8,mu,lam10

Complex(dp), Intent(out) :: cplAhAhUhh(2),cplAhetIUhh(2),cplAhUhhhh(2,2),cplAhUhhVZ(2),cpletIetIUhh(2),           & 
& cpletIUhhhh(2,2),cpletIUhhVZ(2),cplcFdFdUhhL(3,3,2),cplcFdFdUhhR(3,3,2),               & 
& cplcFeFeUhhL(3,3,2),cplcFeFeUhhR(3,3,2),cplcFuFuUhhL(3,3,2),cplcFuFuUhhR(3,3,2),       & 
& cplcgWpgWpUhh(2),cplcgWCgWCUhh(2),cplcgZgZUhh(2),cplUhhhhhh(2,2,2),cplUhhHmcHm(2,3,3), & 
& cplUhhHmVWp(2,3),cplUhhcVWpVWp(2),cplUhhVZVZ(2),cplAhAhUhhUhh(2,2),cpletIetIUhhUhh(2,2),& 
& cplUhhUhhhhhh(2,2,2,2),cplUhhUhhHmcHm(2,2,3,3),cplUhhUhhcVWpVWp(2,2),cplUhhUhhVZVZ(2,2)

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsForTadpoles'
 
cplAhAhUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhAhUhhL(gt3,lam1,lam4,lam3,lam5,lam6,v,vv,cplAhAhUhh(gt3))

End Do 


cplAhetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingAhetIUhhL(gt3,lam7,lam5,lam6,v,vv,cplAhetIUhh(gt3))

End Do 


cplAhUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingAhUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cplAhUhhhh(gt2,gt3))

 End Do 
End Do 


cplAhUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingAhUhhVZL(gt2,g1,g2,TW,cplAhUhhVZ(gt2))

End Do 


cpletIetIUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingetIetIUhhL(gt3,lam2,lam4,lam3,lam7,lam5,v,vv,cpletIetIUhh(gt3))

End Do 


cpletIUhhhh = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
Call CouplingetIUhhhhL(gt2,gt3,lam7,lam6,v,vv,ZH,cpletIUhhhh(gt2,gt3))

 End Do 
End Do 


cpletIUhhVZ = 0._dp 
Do gt2 = 1, 2
Call CouplingetIUhhVZL(gt2,g1,g2,TW,cpletIUhhVZ(gt2))

End Do 


cplcFdFdUhhL = 0._dp 
cplcFdFdUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFdFdUhhL(gt1,gt2,gt3,epsD,Yd,ZDL,ZDR,cplcFdFdUhhL(gt1,gt2,gt3)          & 
& ,cplcFdFdUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeUhhL = 0._dp 
cplcFeFeUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFeUhhL(gt1,gt2,gt3,epsE,Ye,ZEL,ZER,cplcFeFeUhhL(gt1,gt2,gt3)          & 
& ,cplcFeFeUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuUhhL = 0._dp 
cplcFuFuUhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFuFuUhhL(gt1,gt2,gt3,epsU,Yu,ZUL,ZUR,cplcFuFuUhhL(gt1,gt2,gt3)          & 
& ,cplcFuFuUhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcgWpgWpUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWpgWpUhhL(gt3,g2,v,vv,cplcgWpgWpUhh(gt3))

End Do 


cplcgWCgWCUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgWCgWCUhhL(gt3,g2,v,vv,cplcgWCgWCUhh(gt3))

End Do 


cplcgZgZUhh = 0._dp 
Do gt3 = 1, 2
Call CouplingcgZgZUhhL(gt3,g1,g2,v,vv,TW,cplcgZgZUhh(gt3))

End Do 


cplUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
Call CouplingUhhhhhhL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,v,               & 
& vv,ZH,cplUhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingUhhHmcHmL(gt1,gt2,gt3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,           & 
& lam8,mu,lam10,v,vv,ZP,cplUhhHmcHm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplUhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplingUhhHmVWpL(gt1,gt2,g2,ZP,cplUhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhcVWpVWpL(gt1,g2,v,vv,cplUhhcVWpVWp(gt1))

End Do 


cplUhhVZVZ = 0._dp 
Do gt1 = 1, 2
Call CouplingUhhVZVZL(gt1,g1,g2,v,vv,TW,cplUhhVZVZ(gt1))

End Do 


cplAhAhUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhUhhUhhL(gt3,gt4,lam1,lam4,lam3,lam5,lam6,cplAhAhUhhUhh(gt3,gt4))

 End Do 
End Do 


cpletIetIUhhUhh = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIUhhUhhL(gt3,gt4,lam2,lam4,lam3,lam7,lam5,cpletIetIUhhUhh(gt3,gt4))

 End Do 
End Do 


cplUhhUhhhhhh = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplingUhhUhhhhhhL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,ZH,cplUhhUhhhhhh(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhHmcHm = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingUhhUhhHmcHmL(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,lam10,ZP,cplUhhUhhHmcHm(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplUhhUhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhcVWpVWpL(gt1,gt2,g2,cplUhhUhhcVWpVWp(gt1,gt2))

 End Do 
End Do 


cplUhhUhhVZVZ = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplingUhhUhhVZVZL(gt1,gt2,g1,g2,TW,cplUhhUhhVZVZ(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
End Subroutine CouplingsForTadpoles

Subroutine CouplingsColoredQuartics(lam1,lam6,ZH,lam4,lam3,lam5,lam8,ZP,              & 
& lam7,lam10,lam2,lam9,lamh,g2,g1,TW,g3,cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,         & 
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

Implicit None 
Real(dp), Intent(in) :: ZH(2,2),lam5,ZP(3,3),g2,g1,TW,g3

Complex(dp), Intent(in) :: lam1,lam6,lam4,lam3,lam8,lam7,lam10,lam2,lam9,lamh

Complex(dp), Intent(out) :: cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1(2),cplAhAhetIetI1,cplAhAhetIhh1(2),           & 
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

Integer :: gt1, gt2, gt3, gt4, ct1, ct2, ct3, ct4

Iname = Iname + 1 
NameOfUnit(Iname) = 'CouplingsColoredQuartics'
 
cplAhAhAhAh1 = 0._dp 
Call CouplingAhAhAhAhQ(lam1,cplAhAhAhAh1)



cplAhAhAhetI1 = 0._dp 
Call CouplingAhAhAhetIQ(lam6,cplAhAhAhetI1)



cplAhAhAhhh1 = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhAhhhQ(gt4,lam6,ZH,cplAhAhAhhh1(gt4))

End Do 


cplAhAhetIetI1 = 0._dp 
Call CouplingAhAhetIetIQ(lam4,lam3,lam5,cplAhAhetIetI1)



cplAhAhetIhh1 = 0._dp 
Do gt4 = 1, 2
Call CouplingAhAhetIhhQ(gt4,lam6,ZH,cplAhAhetIhh1(gt4))

End Do 


cplAhAhhhhh1 = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhAhhhhhQ(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,cplAhAhhhhh1(gt3,gt4))

 End Do 
End Do 


cplAhAhHmcHm1 = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhAhHmcHmQ(gt3,gt4,lam1,lam3,lam6,lam8,ZP,cplAhAhHmcHm1(gt3,gt4))

 End Do 
End Do 


cplAhetIetIetI1 = 0._dp 
Call CouplingAhetIetIetIQ(lam7,cplAhetIetIetI1)



cplAhetIetIhh1 = 0._dp 
Do gt4 = 1, 2
Call CouplingAhetIetIhhQ(gt4,lam7,ZH,cplAhetIetIhh1(gt4))

End Do 


cplAhetIhhhh1 = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingAhetIhhhhQ(gt3,gt4,lam7,lam5,lam6,ZH,cplAhetIhhhh1(gt3,gt4))

 End Do 
End Do 


cplAhetIHmcHm1 = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingAhetIHmcHmQ(gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZP,cplAhetIHmcHm1(gt3,gt4))

 End Do 
End Do 


cplAhhhhhhh1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingAhhhhhhhQ(gt2,gt3,gt4,lam7,lam6,ZH,cplAhhhhhhh1(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplAhhhHmcHm1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 3
  Do gt4 = 1, 3
Call CouplingAhhhHmcHmQ(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,cplAhhhHmcHm1(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIetIetIetI1 = 0._dp 
Call CouplingetIetIetIetIQ(lam2,cpletIetIetIetI1)



cpletIetIetIhh1 = 0._dp 
Do gt4 = 1, 2
Call CouplingetIetIetIhhQ(gt4,lam7,ZH,cpletIetIetIhh1(gt4))

End Do 


cpletIetIhhhh1 = 0._dp 
Do gt3 = 1, 2
 Do gt4 = 1, 2
Call CouplingetIetIhhhhQ(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,cpletIetIhhhh1(gt3,gt4))

 End Do 
End Do 


cpletIetIHmcHm1 = 0._dp 
Do gt3 = 1, 3
 Do gt4 = 1, 3
Call CouplingetIetIHmcHmQ(gt3,gt4,lam2,lam3,lam7,lam9,ZP,cpletIetIHmcHm1(gt3,gt4))

 End Do 
End Do 


cpletIhhhhhh1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 2
  Do gt4 = 1, 2
Call CouplingetIhhhhhhQ(gt2,gt3,gt4,lam7,lam6,ZH,cpletIhhhhhh1(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cpletIhhHmcHm1 = 0._dp 
Do gt2 = 1, 2
 Do gt3 = 1, 3
  Do gt4 = 1, 3
Call CouplingetIhhHmcHmQ(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,cpletIhhHmcHm1(gt2,gt3,gt4))

  End Do 
 End Do 
End Do 


cplhhhhhhhh1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 2
   Do gt4 = 1, 2
Call CouplinghhhhhhhhQ(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& ZH,cplhhhhhhhh1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplhhhhHmcHm1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplinghhhhHmcHmQ(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,lam6,           & 
& lam9,lam8,lam10,ZH,ZP,cplhhhhHmcHm1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplHmHmcHmcHm1 = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
   Do gt4 = 1, 3
Call CouplingHmHmcHmcHmQ(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,               & 
& lam6,lam9,lam8,lamh,lam10,ZP,cplHmHmcHmcHm1(gt1,gt2,gt3,gt4))

   End Do 
  End Do 
 End Do 
End Do 


cplAhAhcVWpVWp1 = 0._dp 
Call CouplingAhAhcVWpVWpQ(g2,cplAhAhcVWpVWp1)



cplAhAhVZVZ1 = 0._dp 
Call CouplingAhAhVZVZQ(g1,g2,TW,cplAhAhVZVZ1)



cplAhHmVPVWp1 = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVPVWpQ(gt2,g1,g2,ZP,TW,cplAhHmVPVWp1(gt2))

End Do 


cplAhHmVWpVZ1 = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpVZQ(gt2,g1,g2,ZP,TW,cplAhHmVWpVZ1(gt2))

End Do 


cplAhcHmcVWpVP1 = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpVPQ(gt2,g1,g2,ZP,TW,cplAhcHmcVWpVP1(gt2))

End Do 


cplAhcHmcVWpVZ1 = 0._dp 
Do gt2 = 1, 3
Call CouplingAhcHmcVWpVZQ(gt2,g1,g2,ZP,TW,cplAhcHmcVWpVZ1(gt2))

End Do 


cpletIetIcVWpVWp1 = 0._dp 
Call CouplingetIetIcVWpVWpQ(g2,cpletIetIcVWpVWp1)



cpletIetIVZVZ1 = 0._dp 
Call CouplingetIetIVZVZQ(g1,g2,TW,cpletIetIVZVZ1)



cpletIHmVPVWp1 = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVPVWpQ(gt2,g1,g2,ZP,TW,cpletIHmVPVWp1(gt2))

End Do 


cpletIHmVWpVZ1 = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpVZQ(gt2,g1,g2,ZP,TW,cpletIHmVWpVZ1(gt2))

End Do 


cpletIcHmcVWpVP1 = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpVPQ(gt2,g1,g2,ZP,TW,cpletIcHmcVWpVP1(gt2))

End Do 


cpletIcHmcVWpVZ1 = 0._dp 
Do gt2 = 1, 3
Call CouplingetIcHmcVWpVZQ(gt2,g1,g2,ZP,TW,cpletIcHmcVWpVZ1(gt2))

End Do 


cplhhhhcVWpVWp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhcVWpVWpQ(gt1,gt2,g2,ZH,cplhhhhcVWpVWp1(gt1,gt2))

 End Do 
End Do 


cplhhhhVZVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 2
Call CouplinghhhhVZVZQ(gt1,gt2,g1,g2,ZH,TW,cplhhhhVZVZ1(gt1,gt2))

 End Do 
End Do 


cplhhHmVPVWp1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVPVWpQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmVPVWp1(gt1,gt2))

 End Do 
End Do 


cplhhHmVWpVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhHmVWpVZ1(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWpVP1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpVPQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmcVWpVP1(gt1,gt2))

 End Do 
End Do 


cplhhcHmcVWpVZ1 = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhcHmcVWpVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,cplhhcHmcVWpVZ1(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVP1 = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVPQ(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVP1(gt1,gt2))

 End Do 
End Do 


cplHmcHmVPVZ1 = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVPVZQ(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVPVZ1(gt1,gt2))

 End Do 
End Do 


cplHmcHmcVWpVWp1 = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmcVWpVWpQ(gt1,gt2,g2,ZP,cplHmcHmcVWpVWp1(gt1,gt2))

 End Do 
End Do 


cplHmcHmVZVZ1 = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingHmcHmVZVZQ(gt1,gt2,g1,g2,ZP,TW,cplHmcHmVZVZ1(gt1,gt2))

 End Do 
End Do 


cplVGVGVGVG1Q = 0._dp 
cplVGVGVGVG2Q = 0._dp 
cplVGVGVGVG3Q = 0._dp 
Call CouplingVGVGVGVGQ(g3,cplVGVGVGVG1Q,cplVGVGVGVG2Q,cplVGVGVGVG3Q)



cplcVWpVPVPVWp1Q = 0._dp 
cplcVWpVPVPVWp2Q = 0._dp 
cplcVWpVPVPVWp3Q = 0._dp 
Call CouplingcVWpVPVPVWpQ(g2,TW,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,cplcVWpVPVPVWp3Q)



cplcVWpVPVWpVZ1Q = 0._dp 
cplcVWpVPVWpVZ2Q = 0._dp 
cplcVWpVPVWpVZ3Q = 0._dp 
Call CouplingcVWpVPVWpVZQ(g2,TW,cplcVWpVPVWpVZ1Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ3Q)



cplcVWpcVWpVWpVWp1Q = 0._dp 
cplcVWpcVWpVWpVWp2Q = 0._dp 
cplcVWpcVWpVWpVWp3Q = 0._dp 
Call CouplingcVWpcVWpVWpVWpQ(g2,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,              & 
& cplcVWpcVWpVWpVWp3Q)



cplcVWpVWpVZVZ1Q = 0._dp 
cplcVWpVWpVZVZ2Q = 0._dp 
cplcVWpVWpVZVZ3Q = 0._dp 
Call CouplingcVWpVWpVZVZQ(g2,TW,cplcVWpVWpVZVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q)



Iname = Iname - 1 
End Subroutine CouplingsColoredQuartics

Subroutine CouplingAhAhAhAhQ(lam1,res1)

Implicit None 

Complex(dp), Intent(in) :: lam1

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhAh' 
 
res1 = 0._dp 
res1 = res1-3._dp*(lam1)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhAhQ  
 
 
Subroutine CouplingAhAhAhetIQ(lam6,res1)

Implicit None 

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhetI' 
 
res1 = 0._dp 
res1 = res1-3._dp*(lam6)/2._dp
res1 = res1+(-3*Conjg(lam6))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhetIQ  
 
 
Subroutine CouplingAhAhAhhhQ(gt4,lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhAhhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(-3*lam6*ZH(gt4,2))/2._dp
res1 = res1+(3*Conjg(lam6)*ZH(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhAhhhQ  
 
 
Subroutine CouplingAhAhetIetIQ(lam4,lam3,lam5,res1)

Implicit None 

Real(dp), Intent(in) :: lam5

Complex(dp), Intent(in) :: lam4,lam3

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIetI' 
 
res1 = 0._dp 
res1 = res1-1._dp*(lam3)
res1 = res1-1._dp*(lam4)
res1 = res1-1._dp*(lam5)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIetIQ  
 
 
Subroutine CouplingAhAhetIhhQ(gt4,lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(lam6*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt4,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhetIhhQ  
 
 
Subroutine CouplingAhAhhhhhQ(gt3,gt4,lam1,lam4,lam3,lam5,lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam4,lam3,lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam1*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(lam6*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(lam6*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(lam3*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-(lam4*ZH(gt3,2)*ZH(gt4,2))
res1 = res1+lam5*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhhhhhQ  
 
 
Subroutine CouplingAhAhHmcHmQ(gt3,gt4,lam1,lam3,lam6,lam8,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam3,lam6,lam8

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam8*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(lam1*ZP(gt3,2)*ZP(gt4,2))
res1 = res1-(lam6*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam3*ZP(gt3,3)*ZP(gt4,3))

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhHmcHmQ  
 
 
Subroutine CouplingAhetIetIetIQ(lam7,res1)

Implicit None 

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIetI' 
 
res1 = 0._dp 
res1 = res1-3._dp*(lam7)/2._dp
res1 = res1+(-3*Conjg(lam7))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIetIQ  
 
 
Subroutine CouplingAhetIetIhhQ(gt4,lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam7*ZH(gt4,2))/2._dp
res1 = res1+(Conjg(lam7)*ZH(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIetIhhQ  
 
 
Subroutine CouplingAhetIhhhhQ(gt3,gt4,lam7,lam5,lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam6*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(lam5*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(lam5*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(lam7*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIhhhhQ  
 
 
Subroutine CouplingAhetIHmcHmQ(gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam10*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(lam10)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(lam6*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(lam6)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(lam4*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam5*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam4*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam5*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam7*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1-(Conjg(lam7)*ZP(gt3,3)*ZP(gt4,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhetIHmcHmQ  
 
 
Subroutine CouplingAhhhhhhhQ(gt2,gt3,gt4,lam7,lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam6*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(Conjg(lam6)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(lam6*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(-3*lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(3*Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhhhhhQ  
 
 
Subroutine CouplingAhhhHmcHmQ(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam10*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1+(Conjg(lam10)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(lam6*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1+(Conjg(lam6)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1+(lam4*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam5*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam4*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1+(lam5*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam7*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1+(Conjg(lam7)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhhhHmcHmQ  
 
 
Subroutine CouplingetIetIetIetIQ(lam2,res1)

Implicit None 

Complex(dp), Intent(in) :: lam2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIetI' 
 
res1 = 0._dp 
res1 = res1-3._dp*(lam2)

 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIetIQ  
 
 
Subroutine CouplingetIetIetIhhQ(gt4,lam7,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIetIhh' 
 
If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(3*lam7*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(lam7)*ZH(gt4,1))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIetIhhQ  
 
 
Subroutine CouplingetIetIhhhhQ(gt3,gt4,lam2,lam4,lam3,lam7,lam5,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam2,lam4,lam3,lam7

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIhhhh' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam3*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(lam4*ZH(gt3,1)*ZH(gt4,1))
res1 = res1+lam5*ZH(gt3,1)*ZH(gt4,1)
res1 = res1-(lam7*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(lam7*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(lam2*ZH(gt3,2)*ZH(gt4,2))

 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIhhhhQ  
 
 
Subroutine CouplingetIetIHmcHmQ(gt3,gt4,lam2,lam3,lam7,lam9,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt3,gt4
Real(dp), Intent(in) :: ZP(3,3)

Complex(dp), Intent(in) :: lam2,lam3,lam7,lam9

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIHmcHm' 
 
If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam9*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(lam3*ZP(gt3,2)*ZP(gt4,2))
res1 = res1-(lam7*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(Conjg(lam7)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam2*ZP(gt3,3)*ZP(gt4,3))

 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIHmcHmQ  
 
 
Subroutine CouplingetIhhhhhhQ(gt2,gt3,gt4,lam7,lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: ZH(2,2)

Complex(dp), Intent(in) :: lam7,lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(3*lam6*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(lam6)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(lam7*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(lam7*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(lam7*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhhhhhQ  
 
 
Subroutine CouplingetIhhHmcHmQ(gt2,gt3,gt4,lam4,lam7,lam5,lam6,lam10,ZH,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam4,lam7,lam6,lam10

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIhhHmcHm' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.2)) Then 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(lam10*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(lam10)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1+(lam6*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(lam4*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1+(lam5*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1+(lam4*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam5*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1+(lam7*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIhhHmcHmQ  
 
 
Subroutine CouplinghhhhhhhhQ(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,lam5,           & 
& lam6,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'Couplinghhhhhhhh' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.2)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-3*lam1*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1)
res1 = res1+(-3*lam6*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*lam6*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))/2._dp
res1 = res1-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(lam4*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1-(lam5*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,1))
res1 = res1+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))
res1 = res1+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,1))/2._dp
res1 = res1+(-3*lam6*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(lam3*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(lam3*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))
res1 = res1+(-3*lam7*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,1)*ZH(gt4,2))/2._dp
res1 = res1-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-(lam4*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1-(lam5*ZH(gt1,1)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))
res1 = res1+(-3*lam7*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*lam7*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1+(-3*Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2))/2._dp
res1 = res1-3*lam2*ZH(gt1,2)*ZH(gt2,2)*ZH(gt3,2)*ZH(gt4,2)

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhhhhhQ  
 
 
Subroutine CouplinghhhhHmcHmQ(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lam10,ZH,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZH(2,2),ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lam10

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhHmcHm' 
 
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

If ((gt3.Lt.1).Or.(gt3.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt3 out of range', gt3 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt3 out of range', gt3 
  Call TerminateProgram 
End If 

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(lam8*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(lam10*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(lam10)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(lam10*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(Conjg(lam10)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))/2._dp
res1 = res1-(lam9*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,1)*ZP(gt4,1))
res1 = res1-(lam1*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))
res1 = res1-(lam6*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(lam6*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))/2._dp
res1 = res1-(lam3*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,2))
res1 = res1-(lam6*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))/2._dp
res1 = res1-(lam7*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(Conjg(lam6)*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam4*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam5*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam4*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(lam5*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam3*ZH(gt1,1)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))
res1 = res1-(lam7*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt1,2)*ZH(gt2,1)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1-(lam7*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1-(Conjg(lam7)*ZH(gt1,1)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))/2._dp
res1 = res1-(lam2*ZH(gt1,2)*ZH(gt2,2)*ZP(gt3,3)*ZP(gt4,3))

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhHmcHmQ  
 
 
Subroutine CouplingHmHmcHmcHmQ(gt1,gt2,gt3,gt4,lam1,lam2,lam4,lam3,lam7,              & 
& lam5,lam6,lam9,lam8,lamh,lam10,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2,gt3,gt4
Real(dp), Intent(in) :: lam5,ZP(3,3)

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmHmcHmcHm' 
 
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

If ((gt4.Lt.1).Or.(gt4.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt4 out of range', gt4 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt4 out of range', gt4 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-4*lamh*ZP(gt1,1)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,1)
res1 = res1-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,1))
res1 = res1-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
res1 = res1-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,3)*ZP(gt4,1))
res1 = res1-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,1))
res1 = res1-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,1))
res1 = res1-(lam8*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(lam10*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(lam8*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-(lam10*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,2))
res1 = res1-2*lam1*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*lam6*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*lam6*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*lam5*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,2)
res1 = res1-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2)
res1 = res1-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2))
res1 = res1-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,2)
res1 = res1-(Conjg(lam10)*ZP(gt1,2)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
res1 = res1-(lam9*ZP(gt1,3)*ZP(gt2,1)*ZP(gt3,1)*ZP(gt4,3))
res1 = res1-(Conjg(lam10)*ZP(gt1,1)*ZP(gt2,2)*ZP(gt3,1)*ZP(gt4,3))
res1 = res1-(lam9*ZP(gt1,1)*ZP(gt2,3)*ZP(gt3,1)*ZP(gt4,3))
res1 = res1-2*Conjg(lam6)*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3)
res1 = res1-(lam3*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam4*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam3*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-(lam4*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3))
res1 = res1-2*lam7*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,2)*ZP(gt4,3)
res1 = res1-2*lam5*ZP(gt1,2)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
res1 = res1-2*Conjg(lam7)*ZP(gt1,3)*ZP(gt2,2)*ZP(gt3,3)*ZP(gt4,3)
res1 = res1-2*Conjg(lam7)*ZP(gt1,2)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)
res1 = res1-2*lam2*ZP(gt1,3)*ZP(gt2,3)*ZP(gt3,3)*ZP(gt4,3)

 


Iname = Iname - 1 
 
End Subroutine CouplingHmHmcHmcHmQ  
 
 
Subroutine CouplingAhAhcVWpVWpQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhcVWpVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhcVWpVWpQ  
 
 
Subroutine CouplingAhAhVZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhAhVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingAhAhVZVZQ  
 
 
Subroutine CouplingAhHmVPVWpQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVPVWpQ  
 
 
Subroutine CouplingAhHmVWpVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhHmVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhHmVWpVZQ  
 
 
Subroutine CouplingAhcHmcVWpVPQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWpVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Cos(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWpVPQ  
 
 
Subroutine CouplingAhcHmcVWpVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingAhcHmcVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Sin(TW)*ZP(gt2,2))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingAhcHmcVWpVZQ  
 
 
Subroutine CouplingetIetIcVWpVWpQ(g2,res1)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIcVWpVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIcVWpVWpQ  
 
 
Subroutine CouplingetIetIVZVZQ(g1,g2,TW,res1)

Implicit None 

Real(dp), Intent(in) :: g1,g2,TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIetIVZVZ' 
 
res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2)/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)
res1 = res1+(g1**2*Sin(TW)**2)/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingetIetIVZVZQ  
 
 
Subroutine CouplingetIHmVPVWpQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmVPVWp' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZP(gt2,3))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmVPVWpQ  
 
 
Subroutine CouplingetIHmVWpVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIHmVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZP(gt2,3))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIHmVWpVZQ  
 
 
Subroutine CouplingetIcHmcVWpVPQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcHmcVWpVP' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1-(g1*g2*Cos(TW)*ZP(gt2,3))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIcHmcVWpVPQ  
 
 
Subroutine CouplingetIcHmcVWpVZQ(gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingetIcHmcVWpVZ' 
 
If ((gt2.Lt.1).Or.(gt2.Gt.3)) Then 
  Write (ErrCan,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (ErrCan,*) 'index gt2 out of range', gt2 
  Write (*,*) 'Problem in Subroutine ',NameOfUnit(Iname) 
  Write (*,*) 'index gt2 out of range', gt2 
  Call TerminateProgram 
End If 

res1 = 0._dp 
res1 = res1+(g1*g2*Sin(TW)*ZP(gt2,3))/2._dp
res1 = -(0.,1.)*res1 
 


Iname = Iname - 1 
 
End Subroutine CouplingetIcHmcVWpVZQ  
 
 
Subroutine CouplinghhhhcVWpVWpQ(gt1,gt2,g2,ZH,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZH(2,2)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhcVWpVWp' 
 
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

res1 = 0._dp 
res1 = res1+(g2**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g2**2*ZH(gt1,2)*ZH(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhcVWpVWpQ  
 
 
Subroutine CouplinghhhhVZVZQ(gt1,gt2,g1,g2,ZH,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhhhVZVZ' 
 
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

res1 = 0._dp 
res1 = res1+(g2**2*Cos(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,1)*ZH(gt2,1)
res1 = res1+(g1**2*Sin(TW)**2*ZH(gt1,1)*ZH(gt2,1))/2._dp
res1 = res1+(g2**2*Cos(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZH(gt1,2)*ZH(gt2,2)
res1 = res1+(g1**2*Sin(TW)**2*ZH(gt1,2)*ZH(gt2,2))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhhhVZVZQ  
 
 
Subroutine CouplinghhHmVPVWpQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVPVWp' 
 
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

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVPVWpQ  
 
 
Subroutine CouplinghhHmVWpVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhHmVWpVZ' 
 
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

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhHmVWpVZQ  
 
 
Subroutine CouplinghhcHmcVWpVPQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWpVP' 
 
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

res1 = 0._dp 
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res1 = res1+(g1*g2*Cos(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWpVPQ  
 
 
Subroutine CouplinghhcHmcVWpVZQ(gt1,gt2,g1,g2,ZH,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZH(2,2),ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplinghhcHmcVWpVZ' 
 
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

res1 = 0._dp 
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,1)*ZP(gt2,2))/2._dp
res1 = res1-(g1*g2*Sin(TW)*ZH(gt1,2)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplinghhcHmcVWpVZQ  
 
 
Subroutine CouplingHmcHmVPVPQ(gt1,gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVP' 
 
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

res1 = 0._dp 
res1 = res1+2*g1**2*Cos(TW)**2*ZP(gt1,1)*ZP(gt2,1)
res1 = res1+(g1**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2)
res1 = res1+(g2**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1+(g1**2*Cos(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res1 = res1+g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,3)*ZP(gt2,3)
res1 = res1+(g2**2*Sin(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVPQ  
 
 
Subroutine CouplingHmcHmVPVZQ(gt1,gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVPVZ' 
 
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

res1 = 0._dp 
res1 = res1-(g1**2*Sin(2._dp*(TW))*ZP(gt1,1)*ZP(gt2,1))
res1 = res1+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1-(g1**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res1 = res1+(g2**2*Sin(2._dp*(TW))*ZP(gt1,2)*ZP(gt2,2))/4._dp
res1 = res1+(g1*g2*Cos(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/2._dp
res1 = res1-(g1**2*Sin(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/4._dp
res1 = res1+(g2**2*Sin(2._dp*(TW))*ZP(gt1,3)*ZP(gt2,3))/4._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVPVZQ  
 
 
Subroutine CouplingHmcHmcVWpVWpQ(gt1,gt2,g2,ZP,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g2,ZP(3,3)

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmcVWpVWp' 
 
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

res1 = 0._dp 
res1 = res1+(g2**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1+(g2**2*ZP(gt1,3)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmcVWpVWpQ  
 
 
Subroutine CouplingHmcHmVZVZQ(gt1,gt2,g1,g2,ZP,TW,res1)

Implicit None 

Integer, Intent(in) :: gt1,gt2
Real(dp), Intent(in) :: g1,g2,ZP(3,3),TW

Complex(dp), Intent(out) :: res1 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingHmcHmVZVZ' 
 
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

res1 = 0._dp 
res1 = res1+2*g1**2*Sin(TW)**2*ZP(gt1,1)*ZP(gt2,1)
res1 = res1+(g2**2*Cos(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,2)*ZP(gt2,2))
res1 = res1+(g1**2*Sin(TW)**2*ZP(gt1,2)*ZP(gt2,2))/2._dp
res1 = res1+(g2**2*Cos(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp
res1 = res1-(g1*g2*Cos(TW)*Sin(TW)*ZP(gt1,3)*ZP(gt2,3))
res1 = res1+(g1**2*Sin(TW)**2*ZP(gt1,3)*ZP(gt2,3))/2._dp

 


Iname = Iname - 1 
 
End Subroutine CouplingHmcHmVZVZQ  
 
 
Subroutine CouplingVGVGVGVGQ(g3,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g3

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingVGVGVGVG' 
 
res1 = 0._dp 
res1 = res1-16*g3**2

 
res2 = 0._dp 
res2 = -(0.,1.)*res2 
 
res3 = 0._dp 
res3 = res3+16*g3**2

 


Iname = Iname - 1 
 
End Subroutine CouplingVGVGVGVGQ  
 
 
Subroutine CouplingcVWpVPVPVWpQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVPVWp' 
 
res1 = 0._dp 
res1 = res1+g2**2*Sin(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Sin(TW)**2

 
res3 = 0._dp 
res3 = res3-2*g2**2*Sin(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVPVWpQ  
 
 
Subroutine CouplingcVWpVPVWpVZQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVPVWpVZ' 
 
res1 = 0._dp 
res1 = res1+g2**2*Cos(TW)*Sin(TW)

 
res2 = 0._dp 
res2 = res2-(g2**2*Sin(2._dp*(TW)))

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)*Sin(TW)

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVPVWpVZQ  
 
 
Subroutine CouplingcVWpcVWpVWpVWpQ(g2,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpcVWpVWpVWp' 
 
res1 = 0._dp 
res1 = res1+2*g2**2

 
res2 = 0._dp 
res2 = res2-g2**2

 
res3 = 0._dp 
res3 = res3-g2**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpcVWpVWpVWpQ  
 
 
Subroutine CouplingcVWpVWpVZVZQ(g2,TW,res1,res2,res3)

Implicit None 

Real(dp), Intent(in) :: g2,TW

Complex(dp), Intent(out) :: res1 
Complex(dp), Intent(out) :: res2 
Complex(dp), Intent(out) :: res3 
Integer :: j1,j2,j3,j4,j5,j6, j7, j8, j9, j10, j11, j12 
Iname = Iname +1 
NameOfUnit(Iname) = 'CouplingcVWpVWpVZVZ' 
 
res1 = 0._dp 
res1 = res1-2*g2**2*Cos(TW)**2

 
res2 = 0._dp 
res2 = res2+g2**2*Cos(TW)**2

 
res3 = 0._dp 
res3 = res3+g2**2*Cos(TW)**2

 


Iname = Iname - 1 
 
End Subroutine CouplingcVWpVWpVZVZQ  
 
 
End Module Couplings_radinuZeeHB 
