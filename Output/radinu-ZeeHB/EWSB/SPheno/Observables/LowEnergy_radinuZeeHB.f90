! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:02 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module LowEnergy_radinuZeeHB 
Use Control 
Use Settings 
Use Couplings_radinuZeeHB 
Use LoopCouplings_radinuZeeHB 
Use LoopMasses_SM_HC 
Use LoopFunctions 
Use LoopMasses_radinuZeeHB 
Use StandardModel 
Private::F1,F2,F3,F4,F3Gamma
!private variables
 

Contains


Subroutine Gminus2(Ifermion,MAh,MAh2,MetI,MetI2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,           & 
& MHm,MHm2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,cplFvFeHmR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFvcHmL,cplcFeFvcHmR,             & 
& cplHmcHmVP,a_mu)

Real(dp),Intent(in)  :: MAh,MAh2,MetI,MetI2,MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3)

Complex(dp),Intent(in)  :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplFvFeHmL(3,3,3),& 
& cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),              & 
& cplcFeFeVPR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplHmcHmVP(3,3)

Real(dp), Intent(out) :: a_mu 
Integer, Intent(in) :: Ifermion 
Real(dp) :: ratio, chargefactor 
Integer :: i1, i2, i3, gt1, gt2 
Complex(dp) :: coup1L,coup1R,coup2L,coup2R 
 
Iname = Iname + 1 
NameOfUnit(Iname) = "Gminus2" 
 
 
a_mu = 0._dp 
gt1 = Ifermion 
gt2 = Ifermion 
 
chargefactor = 1 
Do i1= 2,1
  Do i2= 1,3
   i3 = i2
  If ((MAh2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
ratio = MAh2/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + (1._dp)*2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MetI2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
ratio = MetI2/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + (1._dp)*2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 2,3
   i3 = i2
  If ((MFv2(i1).gt.mz2).Or.(MHm2(i2).gt.mz2).Or.(MHm2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
ratio = MHm2(i2)/MFv2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - 2._dp*Real(coup1L*Conjg(coup1R),dp)*F4(ratio)/MFv(i1)& 
      & - (1._dp)*2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F1(ratio)/MFv2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,2
  Do i2= 1,3
   i3 = i2
  If ((Mhh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
ratio = Mhh2(i1)/MFe2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
a_mu = a_mu - Real(coup1L*Conjg(coup1R),dp)*F3gamma(ratio)/MFe(i2)& 
      & + (1._dp)*2._dp*MFe(Ifermion)*(Abs(coup1L)**2 + Abs(coup1R)**2)*F2(ratio)/MFe2(i2) 
End if 
 
End if 
   End Do
  End Do


a_mu = a_mu*MFe(Ifermion)*oo16pi2 
Iname = Iname -1 
 
End Subroutine Gminus2 
 
 
Subroutine LeptonEDM(Ifermion,MAh,MAh2,MetI,MetI2,MFe,MFe2,MFv,MFv2,Mhh,              & 
& Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplcFeFeAhL,cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,   & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplHmcHmVP,cplcVWpVPVWp,EDM)

Implicit None
Real(dp),Intent(in)  :: MAh,MAh2,MetI,MetI2,MFe(3),MFe2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),              & 
& MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in)  :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplFvFeHmL(3,3,3),& 
& cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),              & 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),           & 
& cplHmcHmVP(3,3),cplcVWpVPVWp

Real(dp), Intent(out) :: EDM 
Real(dp) :: ratio, chargefactor 
Integer, Intent(in) :: Ifermion 
Integer :: i1, i2, i3, gt1, gt2 
Complex(dp) :: coup1L,coup1R,coup2L,coup2R 
 
Iname = Iname + 1 
NameOfUnit(Iname) = "Gminus2" 
 
 
EDM = 0._dp 
gt1 = Ifermion 
gt2 = Ifermion 
 
chargefactor = 1 
Do i1= 2,1
  Do i2= 1,3
   i3 = i2
  If ((MAh2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
ratio = MFe2(i2)/MAh2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(-1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/MAh2 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MetI2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
ratio = MFe2(i2)/MetI2
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(-1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/MetI2 
End if 
 
End if 
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 2,3
   i3 = i2
  If ((MFv2(i1).gt.mz2).Or.(MHm2(i2).gt.mz2).Or.(MHm2(i3).gt.mz2)) Then
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
ratio = MFv2(i1)/MHm2(i2)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM +(1)* Aimag(coup1L*Conjg(coup1R))*FeynFunctionB(ratio)*& 
    &MFv(i1)/MHm2(i2) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  If ((MFv2(i1).gt.mz2).Or.(MVWp2.gt.mz2).Or.(MVWp2.gt.mz2)) Then
coup1L = cplcFeFvVWpL(gt1,i1)
coup1R = cplcFeFvVWpR(gt1,i1)
coup2L = cplFvFecVWpL(i1,gt2)
coup2R = cplFvFecVWpR(i1,gt2)
End if 
   End Do


chargefactor = 1 
Do i1= 1,2
  Do i2= 1,3
   i3 = i2
  If ((Mhh2(i1).gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
ratio = MFe2(i2)/Mhh2(i1)
 If ((ratio.eq.ratio).and.(ratio.lt.1.0E+30_dp).and.(ratio.gt.1.0E-30_dp)) Then 
EDM = EDM -(-1)* Aimag(coup1R*Conjg(coup1L))*FeynFunctionA(ratio)*& 
    &MFe(i2)/Mhh2(i1) 
End if 
 
End if 
   End Do
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((0._dp.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
End if 
  End Do


chargefactor = 1 
  Do i2= 1,3
   i3 = i2
  If ((MVZ2.gt.mz2).Or.(MFe2(i2).gt.mz2).Or.(MFe2(i3).gt.mz2)) Then
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
End if 
  End Do


EDM = ecmfactor*EDM*oo16pi2 
Iname = Iname -1 
 
End Subroutine LeptonEDM 
 
 
Subroutine DeltaRho(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhcHmcVWp,    & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFdcVWpL,               & 
& cplcFuFdcVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCVZ,        & 
& cplcgWCgZcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpcVWpVWpVWp1, & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3, & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,             & 
& cpletIcHmcVWp,cpletIetIcVWpVWp,cpletIetIVZVZ,cpletIhhVZ,cplFvFecVWpL,cplFvFecVWpR,     & 
& cplFvFvVZL,cplFvFvVZR,cplhhcHmcVWp,cplhhcVWpVWp,cplhhhhcVWpVWp,cplhhhhVZVZ,            & 
& cplhhVZVZ,cplHmcHmcVWpVWp,cplHmcHmVZ,cplHmcHmVZVZ,cplHmVWpVZ,rho)

Implicit None
Real(dp),Intent(in)  :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in)  :: cplAhAhcVWpVWp,cplAhAhVZVZ,cplAhcHmcVWp(3),cplAhhhVZ(2),cplcFdFdVZL(3,3),             & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgAgWpcVWp,cplcgWCgAcVWp,cplcgWCgWCVZ,            & 
& cplcgWCgZcVWp,cplcgWpgWpVZ,cplcgZgWpcVWp,cplcHmcVWpVP(3),cplcHmcVWpVZ(3),              & 
& cplcVWpcVWpVWpVWp1,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplcVWpVPVPVWp1,              & 
& cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,cplcVWpVPVWp,cplcVWpVWpVZ,cplcVWpVWpVZVZ1,             & 
& cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,cpletIcHmcVWp(3),cpletIetIcVWpVWp,cpletIetIVZVZ,       & 
& cpletIhhVZ(2),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),     & 
& cplhhcHmcVWp(2,3),cplhhcVWpVWp(2),cplhhhhcVWpVWp(2,2),cplhhhhVZVZ(2,2),cplhhVZVZ(2),   & 
& cplHmcHmcVWpVWp(3,3),cplHmcHmVZ(3,3),cplHmcHmVZVZ(3,3),cplHmVWpVZ(3)

Real(dp), Intent(out) :: rho 
Integer :: i1, i2, i3, kont 
Real(dp) ::  delta_rho, delta_rho0, Drho_top, mu_old 
Complex(dp) ::  dmW2, dmz2 
mu_old = SetRenormalizationScale(mZ2) 
 
Call Pi1LoopVZ(0._dp,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& kont,dmZ2)

Call Pi1LoopVWp(0._dp,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,             & 
& MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,   & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,dmW2)

Drho_top = 3*G_F*mf_u(3)**2*oosqrt2*oo8pi2 
 
mu_old = SetRenormalizationScale(mu_old) 
 
! Tree Level 
delta_rho0 =  0 
 
! 1-Loop Level 
delta_rho =  dmZ2/mz2 - dMW2/mW2 - drho_top 
 Rho= delta_rho + delta_rho0
End subroutine DeltaRho 
 
 
Subroutine STUparameter(vSM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,MAh,MAh2,MetI,              & 
& MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,            & 
& MVZ2,cplAhhhVZ,cplAhHmVWp,cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIhhVZ,cpletIHmVWp,           & 
& cpletIetIcVWpVWp,cpletIetIVZVZ,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,        & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,               & 
& cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpVPVPVWp3,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplFvFvVZL,cplFvFvVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,       & 
& cplcVWpVWpVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3, & 
& cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,      & 
& cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,     & 
& cplcHmcVWpVP,cplcHmcVWpVZ,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,cplcVWpcVWpVWpVWp1,           & 
& cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3,cplHmcHmVPVZ,cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,    & 
& cplcVWpVPVWpVZ3,Spar,Tpar,Upar)

Implicit None
Real(dp),Intent(in)  :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2

Complex(dp),Intent(in)  :: cplAhhhVZ(2),cplAhHmVWp(3),cplAhAhcVWpVWp,cplAhAhVZVZ,cpletIhhVZ(2),cpletIHmVWp(3),   & 
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

Real(dp), Intent(out) :: Spar,Tpar,Upar 
Integer :: i1, i2, i3, kont 
Real(dp) ::  mu_old, cw2, sw2, rMS_SM_save 
Real(dp) ::  delta_T_SM, delta_S_SM, delta_U_SM 
Complex(dp) :: PiZZ, PiZZ_mz2, PiWW,PiWW_mw2,PiZg_mz2, Pigg_mz2 
Complex(dp) :: PiZZ_SM, PiZZ_mz2_SM, PiWW_SM,PiWW_mw2_SM,PiZg_mz2_SM, Pigg_mz2_SM 
Complex(dp) :: LamSM 
Complex(dp), Intent(in) :: YdSM(3,3), YuSM(3,3), YeSM(3,3) 
Real(dp), Intent(in) :: g1SM,g2SM,g3SM,vSM 
mu_old = SetRenormalizationScale(mZ2) 
 
LamSM = Mhh2(1)/vSM**2
 
Call OneLoop_Z_W_Gamma_SM(vSM,g1SM,g2SM,g3SM,LamSM,YuSM,YdSM,YeSM,kont, & 
 & PiZZ_SM,PiZZ_mz2_SM,PiWW_SM,PiWW_mw2_SM,PiZg_mz2_SM,Pigg_mz2_SM) 
Call Pi1LoopVZ(0._dp,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& kont,PiZZ)

Call Pi1LoopVZ(MVZ2,Mhh,Mhh2,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,               & 
& MFu2,MFv,MFv2,MVZ,MVZ2,MHm,MHm2,MVWp,MVWp2,cplAhhhVZ,cpletIhhVZ,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmcHmVZ,cplHmVWpVZ,cplcVWpVWpVZ,cplAhAhVZVZ,    & 
& cpletIetIVZVZ,cplhhhhVZVZ,cplHmcHmVZVZ,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,& 
& kont,PiZZ_mz2)

Call Pi1LoopVWp(0._dp,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,             & 
& MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,   & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiWW)

Call Pi1LoopVWp(MVWp2,MHm,MHm2,MAh,MAh2,MetI,MetI2,MFu,MFu2,MFd,MFd2,MFv,             & 
& MFv2,MFe,MFe2,Mhh,Mhh2,MVWp,MVWp2,MVZ,MVZ2,cplAhcHmcVWp,cpletIcHmcVWp,cplcFuFdcVWpL,   & 
& cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcgWCgAcVWp,cplcgAgWpcVWp,cplcgZgWpcVWp,     & 
& cplcgWCgZcVWp,cplhhcHmcVWp,cplhhcVWpVWp,cplcHmcVWpVP,cplcVWpVPVWp,cplcVWpVWpVZ,        & 
& cplcHmcVWpVZ,cplAhAhcVWpVWp,cpletIetIcVWpVWp,cplhhhhcVWpVWp,cplHmcHmcVWpVWp,           & 
& cplcVWpVPVPVWp3,cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,cplcVWpcVWpVWpVWp2,cplcVWpcVWpVWpVWp3, & 
& cplcVWpcVWpVWpVWp1,cplcVWpVWpVZVZ1,cplcVWpVWpVZVZ2,cplcVWpVWpVZVZ3,kont,PiWW_mw2)

Call Pi1LoopVPVZ(MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,     & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWCgWCVP,              & 
& cplcgWCgWCVZ,cplcgWpgWpVP,cplcgWpgWpVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplcVWpVPVWp,         & 
& cplcVWpVPVWpVZ1,cplcVWpVPVWpVZ2,cplcVWpVPVWpVZ3,cplcVWpVWpVZ,cplHmcHmVP,               & 
& cplHmcHmVPVZ,cplHmcHmVZ,cplHmVPVWp,cplHmVWpVZ,kont,PiZg_mz2)

Call Pi1LoopVP(MVZ2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MHm,MHm2,MVWp,MVWp2,cplcFdFdVPL,       & 
& cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,              & 
& cplcgWCgWCVP,cplHmcHmVP,cplHmVPVWp,cplcVWpVPVWp,cplHmcHmVPVP,cplcVWpVPVPVWp3,          & 
& cplcVWpVPVPVWp1,cplcVWpVPVPVWp2,kont,Pigg_mz2)

PiZZ = PiZZ - PiZZ_SM 
PiZZ_mz2 = PiZZ_mz2 - PiZZ_mz2_SM 
PiWW = PiWW - PiWW_SM 
PiWW_mw2 = PiWW_mw2 - PiWW_mw2_SM 
PiZg_mz2 = PiZg_mz2 - PiZg_mz2_SM 
Pigg_mz2 = Pigg_mz2 - Pigg_mz2_SM 
sw2 = 0.22290_dp 
cw2 = 1._dp - sw2 
 
mu_old = SetRenormalizationScale(mu_old) 
 
! T-parameter 
Tpar= PiZZ/mz2 - PiWW/mW2  
 Tpar= -Tpar/alpha 


! S-parameter 
Spar= (PiZZ_mz2-PiZZ)/mz2 - (cw2-sw2)/(sqrt(cw2*sw2))*PiZg_mz2/mz2 - Pigg_mz2/mz2
Spar= -4._dp*sw2*cw2/alpha*Spar 


! U-parameter 
Upar= (PiWW_mw2-PiWW)/mw2 -cw2*(PiZZ_mz2-PiZZ)/mz2 - 2._dp*(sqrt(cw2*sw2))*PiZg_mz2/mz2 - sw2*Pigg_mz2/mz2
Upar= -4._dp*sw2/alpha*Upar 


End subroutine STUparameter 
 
 
Real(dp) Function C00g(m1, m2, m3)
Implicit None
Real(dp), Intent(in) :: m1, m2, m3
Real(dp) :: eps=1E-10_dp, large = 1E+5_dp

C00g = C00_3m(m1,m2,m3)

End Function C00g

Real(dp) Function C0g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C0

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C0g=-1/(2._dp*m1) + (-1 + r)/(6._dp*m1) - (-1 + r)**2/(12._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0g=-(1/m1)
     Else 
        C0g=(-1 + r - r*Log(r))/(m1*(-1 + r)**2)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m2) + (-1 + r)/(3._dp*m2) - (-1 + r)**2/(4._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0g=1._dp
     Else 
        C0g=(1 - r + Log(r))/(m2*(-1 + r)**2)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m1) + (-1 + r)/(3._dp*m1) - (-1 + r)**2/(4._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0g=1._dp
     Else 
        C0g=(1 - r + Log(r))/(m1*(-1 + r)**2)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0g=-1/(2._dp*m2) + (-1 + r)/(6._dp*m2) - (-1 + r)**2/(12._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0g=-(1/m2)
     Else 
        C0g=(-1 + r - r*Log(r))/(m2*(-1 + r)**2)
     End if 
  End if 

Else!! Different masses are not possible! 
   C0g =0._dp 
End if 
 
End Function C0g 


Real(dp) Function C1g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1g=1/(6._dp*m1) - (-1 + r)/(24._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1g=1/(4._dp*m1)
     Else 
        C1g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m2) - (-1 + r)/(8._dp*m2) + (-1 + r)**2/(10._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1g=large
     Else 
        C1g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1g=large
     Else 
        C1g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1g=1/(6._dp*m2) - (-1 + r)/(24._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1g=1/(4._dp*m2)
     Else 
        C1g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1g =0._dp 
End if 
 
End Function C1g 


Real(dp) Function C2g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2g=1/(6._dp*m1) - (-1 + r)/(12._dp*m1) + (-1 + r)**2/(20._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(2._dp*m1)
     Else 
        C2g=(-1 + r**2 - 2*r*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m2) - (-1 + r)/(12._dp*m2) + (-1 + r)**2/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(2._dp*m2)
     Else 
        C2g=(-1 + r**2 - 2*r*Log(r))/(2._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2g=large
     Else 
        C2g=(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2g=1/(6._dp*m2) - (-1 + r)/(24._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2g=1/(4._dp*m2)
     Else 
        C2g=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(4._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2g =0._dp 
End if 
 
End Function C2g 


Real(dp) Function C11g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C11

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C11g=-1/(12._dp*m1) + (-1 + r)/(60._dp*m1) - (-1 + r)**2/(180._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C11g=-1/(9._dp*m1)
     Else 
        C11g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m2) + (-1 + r)/(15._dp*m2) - (-1 + r)**2/(18._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C11g=large
     Else 
        C11g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(18._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C11g=large
     Else 
        C11g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C11g=-1/(12._dp*m2) + (-1 + r)/(60._dp*m2) - (-1 + r)**2/(180._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C11g=-1/(9._dp*m2)
     Else 
        C11g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C11g =0._dp 
End if 
 
End Function C11g 


Real(dp) Function C12g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12g=-1/(24._dp*m1) + (-1 + r)/(60._dp*m1) - (-1 + r)**2/(120._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(12._dp*m1)
     Else 
        C12g=(-((-1 + r)*(-1 + r*(5 + 2*r))) + 6*r**2*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m2) + (-1 + r)/(40._dp*m2) - (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(6._dp*m2)
     Else 
        C12g=-(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m1) + (-1 + r)/(30._dp*m1) - (-1 + r)**2/(36._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12g=large
     Else 
        C12g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12g=-1/(24._dp*m2) + (-1 + r)/(120._dp*m2) - (-1 + r)**2/(360._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12g=-1/(18._dp*m2)
     Else 
        C12g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(36._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12g =0._dp 
End if 
 
End Function C12g 


Real(dp) Function C22g(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C22g=-1/(12._dp*m1) + (-1 + r)/(20._dp*m1) - (-1 + r)**2/(30._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(3._dp*m1)
     Else 
        C22g=-(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(6._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m2) + (-1 + r)/(30._dp*m2) - (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(6._dp*m2)
     Else 
        C22g=(-((-1 + r)*(-1 + r*(5 + 2*r))) + 6*r**2*Log(r))/(6._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(18._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C22g=large
     Else 
        C22g=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C22g=-1/(12._dp*m2) + (-1 + r)/(60._dp*m2) - (-1 + r)**2/(180._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C22g=-1/(9._dp*m2)
     Else 
        C22g=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(18._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C22g =0._dp 
End if 
 
End Function C22g 


Real(dp) Function C2C12C22(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C2 + C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2C12C22=1/(24._dp*m1) - (-1 + r)/(60._dp*m1) + (-1 + r)**2/(120._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(12._dp*m1)
     Else 
        C2C12C22=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m2) - (-1 + r)/(40._dp*m2) + (-1 + r)**2/(60._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(6._dp*m2)
     Else 
        C2C12C22=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m1) - (-1 + r)/(40._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(6._dp*m1)
     Else 
        C2C12C22=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12C22=1/(24._dp*m2) - (-1 + r)/(60._dp*m2) + (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12C22=1/(12._dp*m2)
     Else 
        C2C12C22=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2C12C22 =0._dp 
End if 
 
End Function C2C12C22 


Real(dp) Function C1C12C11(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1 + C11 + C12

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1C12C11=1/(24._dp*m1) - (-1 + r)/(120._dp*m1) + (-1 + r)**2/(360._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(18._dp*m1)
     Else 
        C1C12C11=(-((-1 + r)*(2 + r*(-7 + 11*r))) + 6*r**3*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m2) - (-1 + r)/(30._dp*m2) + (-1 + r)**2/(36._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=large
     Else 
        C1C12C11=((-1 + r)*(11 + r*(-7 + 2*r)) - 6*Log(r))/(36._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m1) - (-1 + r)/(40._dp*m1) + (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(6._dp*m1)
     Else 
        C1C12C11=(2 + r*(3 + (-6 + r)*r) + 6*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C12C11=1/(24._dp*m2) - (-1 + r)/(60._dp*m2) + (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C12C11=1/(12._dp*m2)
     Else 
        C1C12C11=((-1 + r)*(-1 + r*(5 + 2*r)) - 6*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1C12C11 =0._dp 
End if 
 
End Function C1C12C11 


Real(dp) Function C0C1C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C0 + C1 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C0C1C2=-1/(6._dp*m1) + (-1 + r)/(24._dp*m1) - (-1 + r)**2/(60._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(4._dp*m1)
     Else 
        C0C1C2=(1 - 4*r + 3*r**2 - 2*r**2*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m2) + (-1 + r)/(8._dp*m2) - (-1 + r)**2/(10._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=large
     Else 
        C0C1C2=-(3 - 4*r + r**2 + 2*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m1) + (-1 + r)/(12._dp*m1) - (-1 + r)**2/(20._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(2._dp*m1)
     Else 
        C0C1C2=(1 - r**2 + 2*r*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C0C1C2=-1/(6._dp*m2) + (-1 + r)/(12._dp*m2) - (-1 + r)**2/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C0C1C2=-1/(2._dp*m2)
     Else 
        C0C1C2=(1 - r**2 + 2*r*Log(r))/(2._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C0C1C2 =0._dp 
End if 
 
End Function C0C1C2 


Real(dp) Function C12C11C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  2 C11 + 2 C12 - C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C11C2=-5/(12._dp*m1) + (3*(-1 + r))/(20._dp*m1) - (7*(-1 + r)**2)/(90._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=-8/(9._dp*m1)
     Else 
        C12C11C2=((-1 + r)*(16 + r*(-29 + 7*r)) - 6*r*(3 + 2*(-3 + r)*r)*Log(r))/(18._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m2) + (4*(-1 + r))/(15._dp*m2) - (7*(-1 + r)**2)/(36._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=large
     Else 
        C12C11C2=(-((-1 + r)*(7 + r*(-29 + 16*r))) + 6*(2 + 3*(-2 + r)*r)*Log(r))/(18._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m1) + (13*(-1 + r))/(40._dp*m1) - (4*(-1 + r)**2)/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=large
     Else 
        C12C11C2=-((-1 + r)*(31 + r*(-26 + 7*r)) + 6*(-3 + r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C11C2=-5/(12._dp*m2) + (11*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C11C2=-7/(12._dp*m2)
     Else 
        C12C11C2=((-1 + r)*(7 + r*(-26 + 31*r)) + 6*(1 - 3*r)*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C11C2 =0._dp 
End if 
 
End Function C12C11C2 


Real(dp) Function C12C22C1(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  -C1 + 2 C12 + 2 C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C22C1=-5/(12._dp*m1) + (7*(-1 + r))/(40._dp*m1) - (-1 + r)**2/(10._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=-13/(12._dp*m1)
     Else 
        C12C22C1=((-1 + r)*(13 + (-2 + r)*r) - 6*r*(4 + (-3 + r)*r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m2) + (29*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(6._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=large
     Else 
        C12C22C1=(-((-1 + r)*(1 + r*(-2 + 13*r))) + 6*(1 + r*(-3 + 4*r))*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m1) + (13*(-1 + r))/(40._dp*m1) - (4*(-1 + r)**2)/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=large
     Else 
        C12C22C1=-((-1 + r)*(31 + r*(-26 + 7*r)) + 6*(-3 + r)*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22C1=-5/(12._dp*m2) + (11*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22C1=-7/(12._dp*m2)
     Else 
        C12C22C1=((-1 + r)*(7 + r*(-26 + 31*r)) + 6*(1 - 3*r)*r**2*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C22C1 =0._dp 
End if 
 
End Function C12C22C1 


Real(dp) Function C12C22(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C22

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C12C22=-1/(8._dp*m1) + (-1 + r)/(15._dp*m1) - (-1 + r)**2/(24._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-5/(12._dp*m1)
     Else 
        C12C22=(-5 + (9 - 4*r)*r**2 + 6*(-2 + r)*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m2) + (7*(-1 + r))/(120._dp*m2) - (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-1/(3._dp*m2)
     Else 
        C12C22=(-4 + 9*r - 5*r**3 + 6*r*(-1 + 2*r)*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m1) + (-1 + r)/(10._dp*m1) - (-1 + r)**2/(12._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=large
     Else 
        C12C22=(-((-1 + r)*(11 + r*(-7 + 2*r))) + 6*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C12C22=-1/(8._dp*m2) + (-1 + r)/(40._dp*m2) - (-1 + r)**2/(120._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C12C22=-1/(6._dp*m2)
     Else 
        C12C22=((-1 + r)*(2 + r*(-7 + 11*r)) - 6*r**3*Log(r))/(12._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C12C22 =0._dp 
End if 
 
End Function C12C22 


Real(dp) Function C2C12(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C12 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C2C12=1/(8._dp*m1) - (-1 + r)/(15._dp*m1) + (-1 + r)**2/(24._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=5/(12._dp*m1)
     Else 
        C2C12=(5 + r**2*(-9 + 4*r) - 6*(-2 + r)*r*Log(r))/(12._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m2) - (7*(-1 + r))/(120._dp*m2) + (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=1/(3._dp*m2)
     Else 
        C2C12=(4 - 9*r + 5*r**3 + 6*(1 - 2*r)*r*Log(r))/(12._dp*m2*(-1 + r)**4)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m1) - (11*(-1 + r))/(120._dp*m1) + (13*(-1 + r)**2)/(180._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=large
     Else 
        C2C12=((-1 + r)*(16 + r*(-29 + 7*r)) + 6*(-2 + 3*r)*Log(r))/(36._dp*m1*(-1 + r)**4)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C2C12=1/(8._dp*m2) - (-1 + r)/(30._dp*m2) + (-1 + r)**2/(72._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C2C12=7/(36._dp*m2)
     Else 
        C2C12=(-((-1 + r)*(7 + r*(-29 + 16*r))) + 6*r**2*(-3 + 2*r)*Log(r))/(36._dp*m2*(-1 + r)**4)
     End if 
  End if 

Else!! Different masses are not possible! 
   C2C12 =0._dp 
End if 
 
End Function C2C12 


Real(dp) Function C1C2(m1in,m2in,m3in) 
Real(dp),Intent(in)::m1in,m2in,m3in 
Real(dp)::eps=1E-10_dp,large=0._dp,epsR=1E-03_dp 
Real(dp)::m1,m2,r 

!  C1 + C2

If (Abs(m1in-m2in)/Abs(m1in+m2in).lt.eps) Then! m1==m2 
 m1=m1in
 m2=m3in
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then  ! Taylor
        C1C2=1/(3._dp*m1) - (-1 + r)/(8._dp*m1) + (-1 + r)**2/(15._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=3/(4._dp*m1)
     Else 
        C1C2=-(3 - 4*r + r**2 - 2*(-2 + r)*r*Log(r))/(4._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m2) - (5*(-1 + r))/(24._dp*m2) + (3*(-1 + r)**2)/(20._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=large
     Else 
        C1C2=(1 - 4*r + 3*r**2 + (2 - 4*r)*Log(r))/(4._dp*m2*(-1 + r)**3)
    End if 
   End if 

Else if (Abs(m2in-m3in)/Abs(m2in+m3in).lt.eps) Then! m2==m3 
 m1=m1in 
 m2=m3in 
   If (m1.gt.m2) Then 
     r=m2/m1 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m1) - (-1 + r)/(4._dp*m1) + (-1 + r)**2/(5._dp*m1)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=large
     Else 
        C1C2=(3 - 4*r + r**2 + 2*Log(r))/(2._dp*m1*(-1 + r)**3)
     End if 
   Else 
     r=m1/m2 
     If ((1._dp-r).lt.epsR) Then 
        C1C2=1/(3._dp*m2) - (-1 + r)/(12._dp*m2) + (-1 + r)**2/(30._dp*m2)
     Elseif (Abs(r).lt.eps) Then 
        C1C2=1/(2._dp*m2)
     Else 
        C1C2=(-1 + (4 - 3*r)*r + 2*r**2*Log(r))/(2._dp*m2*(-1 + r)**3)
     End if 
  End if 

Else!! Different masses are not possible! 
   C1C2 =0._dp 
End if 
 
End Function C1C2 
End Module LowEnergy_radinuZeeHB 
