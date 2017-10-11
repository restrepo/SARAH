! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:01 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Hm_radinuZeeHB
Use Control 
Use Settings 
Use LoopFunctions 
Use AddLoopFunctions 
Use Model_Data_radinuZeeHB 
Use DecayFFS 
Use DecayFFV 
Use DecaySSS 
Use DecaySFF 
Use DecaySSV 
Use DecaySVV 
Use Bremsstrahlung 

Contains 

Subroutine Amplitude_Tree_radinuZeeHB_HmToHmAh(cplAhHmcHm,MAh,MHm,MAh2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MHm(3),MAh2,MHm2(3)

Complex(dp), Intent(in) :: cplAhHmcHm(3,3)

Complex(dp) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhHmcHm(gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmToHmAh


Subroutine Gamma_Real_radinuZeeHB_HmToHmAh(MLambda,em,gs,cplAhHmcHm,MAh,              & 
& MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhHmcHm(3,3)

Real(dp), Intent(in) :: MAh,MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,3
Coup = cplAhHmcHm(i2,i1)
Mex1 = MHm(i1)
Mex2 = MHm(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmToHmAh


Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmAh(cplAhHmcHm,ctcplAhHmcHm,               & 
& MAh,MAh2,MHm,MHm2,ZfAh,ZfHm,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplAhHmcHm(3,3)

Complex(dp), Intent(in) :: ctcplAhHmcHm(3,3)

Complex(dp), Intent(in) :: ZfAh,ZfHm(3,3)

Complex(dp), Intent(out) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhHmcHm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplAhHmcHm(gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cplAhHmcHm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhHmcHm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmAh


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmAh(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,cpletIHmcHm,        & 
& cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFucHmL,              & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgZgWCcHm,cplcgWCgZHm,           & 
& cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,       & 
& cplAhHmVPVWp1,cplAhHmVWpVZ1,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cpletIetIHmcHm1,           & 
& cpletIhhHmcHm1,cplhhhhHmcHm1,cplHmHmcHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),   & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFdFucHmL(3,3,3),            & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgZgWpHm(3),            & 
& cplcgZgWCcHm(3),cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),      & 
& cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),         & 
& cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhHmcHm1(3,3),cplAhetIHmcHm1(3,3),cplAhhhHmcHm1(2,3,3),& 
& cplAhHmVPVWp1(3),cplAhHmVWpVZ1(3),cplAhcHmcVWpVP1(3),cplAhcHmcVWpVZ1(3),               & 
& cpletIetIHmcHm1(3,3),cpletIhhHmcHm1(2,3,3),cplhhhhHmcHm1(2,2,3,3),cplHmHmcHmcHm1(3,3,3,3)

Complex(dp), Intent(out) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(gt1, gt2) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MAh 


! {Ah, conj[Hm], VWp}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, conj[Hm], VWp}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFdHmL(i1,i3,gt2)
coup2R = cplcFuFdHmR(i1,i3,gt2)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fv, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplFvFeHmL(i1,i3,gt2)
coup2R = cplFvFeHmR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gZ, gWp, gWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, conj[Hm], VWp}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmVWp(i1,gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], conj[Hm]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, Ah, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = -cplHmcHmVZ(gt2,i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = -cplHmcHmVZ(gt2,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = -cplHmcHmVZ(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFuFdHmL(i3,i1,gt2)
coup2R = cplcFuFdHmR(i3,i1,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gZ], bar[gWpC], bar[gWpC]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, Ah}
ML1 = MVWp 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, Ah}
ML1 = MVWp 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, Ah}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Ah, etI}
ML1 = MVWp 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, etI}
ML1 = MVWp 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, etI}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Ah, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], VZ, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, VZ}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhAhHmcHm1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cplAhetIHmcHm1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhhhHmcHm1(i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplAhHmVPVWp1(gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplAhHmVWpVZ1(gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhAhHmcHm1(i2,gt1)
coup2 = cplAhHmcHm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i2,gt1)
coup2 = cpletIHmcHm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplAhcHmcVWpVP1(gt1)
coup2 = cplHmVPVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplAhcHmcVWpVZ1(gt1)
coup2 = cplHmVWpVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhHmcHm1(gt2,gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIHmcHm1(gt2,gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhHmcHm1(i2,gt2,gt1)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIHmcHm1(gt2,gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhHmcHm1(i2,gt2,gt1)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhHmcHm1(i1,i2,gt2,gt1)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplHmHmcHmcHm1(gt2,i1,gt1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmAh(MAh,MetI,MFd,MFe,MFu,             & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,cpletIHmcHm,        & 
& cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFdFucHmL,              & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,cplcgZgWCcHm,cplcgWCgZHm,           & 
& cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,       & 
& cplAhHmVPVWp1,cplAhHmVWpVZ1,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cpletIetIHmcHm1,           & 
& cpletIhhHmcHm1,cplhhhhHmcHm1,cplHmHmcHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),   & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFdFucHmL(3,3,3),            & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgZgWpHm(3),            & 
& cplcgZgWCcHm(3),cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),      & 
& cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),         & 
& cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhHmcHm1(3,3),cplAhetIHmcHm1(3,3),cplAhhhHmcHm1(2,3,3),& 
& cplAhHmVPVWp1(3),cplAhHmVWpVZ1(3),cplAhcHmcVWpVP1(3),cplAhcHmcVWpVZ1(3),               & 
& cpletIetIHmcHm1(3,3),cpletIhhHmcHm1(2,3,3),cplhhhhHmcHm1(2,2,3,3),cplHmHmcHmcHm1(3,3,3,3)

Complex(dp), Intent(out) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MAh 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplAhcHmcVWp(i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplAhHmVWp(i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplAhHmVPVWp1(gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplAhcHmcVWpVP1(gt1)
coup2 = cplHmVPVWp(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmAh


Subroutine Amplitude_Tree_radinuZeeHB_HmToAhcVWp(cplAhcHmcVWp,MAh,MHm,MVWp,           & 
& MAh2,MHm2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MHm(3),MVWp,MAh2,MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplAhcHmcVWp(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MAh 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = -cplAhcHmcVWp(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmToAhcVWp


Subroutine Gamma_Real_radinuZeeHB_HmToAhcVWp(MLambda,em,gs,cplAhcHmcVWp,              & 
& MAh,MHm,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhcHmcVWp(3)

Real(dp), Intent(in) :: MAh,MHm(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
Coup = cplAhcHmcVWp(i1)
Mex1 = MHm(i1)
Mex2 = MAh
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,-1._dp,Coup,Gammarealphoton(i1),kont)
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmToAhcVWp


Subroutine Amplitude_WAVE_radinuZeeHB_HmToAhcVWp(cplAhcHmcVWp,ctcplAhcHmcVWp,         & 
& MAh,MAh2,MHm,MHm2,MVWp,MVWp2,ZfAh,ZfHm,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplAhcHmcVWp(3)

Complex(dp), Intent(in) :: ctcplAhcHmcVWp(3)

Complex(dp), Intent(in) :: ZfAh,ZfHm(3,3),ZfVWp

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MAh 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhcHmcVWp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplAhcHmcVWp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhcHmcVWp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplAhcHmcVWp(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToAhcVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToAhcVWp(MAh,MetI,MFd,MFe,MFu,              & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,    & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmcHm,cpletIcHmcVWp,      & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFdFucHmL,cplcFdFucHmR,       & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZgWCcHm,       & 
& cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmcHmVP,            & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,        & 
& cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),           & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgWpgAcHm(3),cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgZgWCcHm(3),cplcgWpgZcHm(3),cplcgWCgZcVWp,cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),       & 
& cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),        & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp1,cplAhcHmcVWpVP1(3),cplAhcHmcVWpVZ1(3),    & 
& cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MAh 
Mex3 = MVWp 


! {Ah, conj[Hm], Ah}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhAhAh
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Hm], etI}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhAhetI
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, conj[Hm], Ah}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cplAhAhetI
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm], etI}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cplAhetIetI
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = -cplcFuFdcVWpR(i3,i2)
coup3R = -cplcFuFdcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {gWpC, gZ, gWpC}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, conj[Hm], Ah}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Hm], etI}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhetIhh(i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], hh}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VWp, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplAhhhVZ(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, conj[Hm], VZ}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhhhVZ(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, conj[VWp]}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VP, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplAhcHmcVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VZ, VWp, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdAhL(i3,i1)
coup2R = cplcFdFdAhR(i3,i1)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], Fv, bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i1,i2,gt1)
coup1R = cplcFeFvcHmR(i1,i2,gt1)
coup2L = cplcFeFeAhL(i3,i1)
coup2R = cplcFeFeAhR(i3,i1)
coup3L = cplFvFecVWpL(i2,i3)
coup3R = cplFvFecVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gWp], bar[gP], bar[gWp]}
ML1 = MVWp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgWpgAcHm(gt1)
coup2 = cplcgWpgWpAh
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gWp], bar[gZ], bar[gWp]}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgWpgWpAh
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmVWp(i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplAhHmVWp(i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplAhHmVWp(i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], VP, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplAhHmVWp(i3)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VZ, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplAhHmVWp(i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VWp}
ML1 = MAh 
ML2 = MVWp 
coup1 = -cplAhcHmcVWp(gt1)
coup2 = cplAhAhcVWpVWp1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplAhcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2 = cplAhcHmcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhcHmcVWpVZ1(i1,gt1)
coup2 = cplAhhhVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplHmcHmcVWpVWp1(i1,gt1)
coup2 = cplAhcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToAhcVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToAhcVWp(MAh,MetI,MFd,MFe,               & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,          & 
& cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,              & 
& cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmcHm,       & 
& cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFdFucHmL,      & 
& cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,cplcgZgWpcVWp,       & 
& cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,          & 
& cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,             & 
& cplAhAhcVWpVWp1,cplAhcHmcVWpVP1,cplAhcHmcVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),           & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgWpgAcHm(3),cplcgAgWpcVWp,cplcgZgWpcVWp,   & 
& cplcgZgWCcHm(3),cplcgWpgZcHm(3),cplcgWCgZcVWp,cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),       & 
& cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),        & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp1,cplAhcHmcVWpVP1(3),cplAhcHmcVWpVZ1(3),    & 
& cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MAh 
Mex3 = MVWp 


! {Hm, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VP, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWp], VP, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplAhHmVWp(i3)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplAhcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToAhcVWp


Subroutine Amplitude_Tree_radinuZeeHB_HmToHmetI(cpletIHmcHm,MetI,MHm,MetI2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MHm(3),MetI2,MHm2(3)

Complex(dp), Intent(in) :: cpletIHmcHm(3,3)

Complex(dp) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1 = cpletIHmcHm(gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmToHmetI


Subroutine Gamma_Real_radinuZeeHB_HmToHmetI(MLambda,em,gs,cpletIHmcHm,MetI,           & 
& MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIHmcHm(3,3)

Real(dp), Intent(in) :: MetI,MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,3
Coup = cpletIHmcHm(i2,i1)
Mex1 = MHm(i1)
Mex2 = MHm(i2)
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmToHmetI


Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmetI(cpletIHmcHm,ctcpletIHmcHm,            & 
& MetI,MetI2,MHm,MHm2,ZfetI,ZfHm,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cpletIHmcHm(3,3)

Complex(dp), Intent(in) :: ctcpletIHmcHm(3,3)

Complex(dp), Intent(in) :: ZfetI,ZfHm(3,3)

Complex(dp), Intent(out) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIHmcHm(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cpletIHmcHm(gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cpletIHmcHm(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIHmcHm(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmetI


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmetI(MAh,MetI,MFd,MFe,MFu,               & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,             & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,              & 
& cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,            & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,   & 
& cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,            & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),   & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),             & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),       & 
& cplcgZgWpHm(3),cplcgZgWCcHm(3),cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhHmVWp(2,3),         & 
& cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),       & 
& cplHmcHmVZ(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhHmcHm1(3,3),cplAhetIHmcHm1(3,3),& 
& cplAhhhHmcHm1(2,3,3),cpletIetIHmcHm1(3,3),cpletIhhHmcHm1(2,3,3),cpletIHmVPVWp1(3),     & 
& cpletIHmVWpVZ1(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cplhhhhHmcHm1(2,2,3,3),      & 
& cplHmHmcHmcHm1(3,3,3,3)

Complex(dp), Intent(out) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(gt1, gt2) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MetI 


! {Ah, conj[Hm], VWp}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, conj[Hm], VWp}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFdHmL(i1,i3,gt2)
coup2R = cplcFuFdHmR(i1,i3,gt2)
coup3L = cplcFdFdetIL(i3,i2)
coup3R = cplcFdFdetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fv, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplFvFeHmL(i1,i3,gt2)
coup2R = cplFvFeHmR(i1,i3,gt2)
coup3L = cplcFeFeetIL(i3,i2)
coup3R = cplcFeFeetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gZ, gWp, gWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgWpetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, conj[Hm], VWp}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmVWp(i1,gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], conj[Hm]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, Ah, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = -cplHmcHmVZ(gt2,i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = -cplHmcHmVZ(gt2,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = -cplHmcHmVZ(gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFuFdHmL(i3,i1,gt2)
coup2R = cplcFuFdHmR(i3,i1,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gZ], bar[gWpC], bar[gWpC]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgWCgWCetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, Ah}
ML1 = MVWp 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, Ah}
ML1 = MVWp 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, Ah}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Ah, etI}
ML1 = MVWp 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, etI}
ML1 = MVWp 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, etI}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Ah, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], VZ, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, VZ}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhetIHmcHm1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIetIHmcHm1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cpletIhhHmcHm1(i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cpletIHmVPVWp1(gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cpletIHmVWpVZ1(gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i2,gt1)
coup2 = cplAhHmcHm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(i2,gt1)
coup2 = cpletIHmcHm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(gt1)
coup2 = cplHmVPVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(gt1)
coup2 = cplHmVWpVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhHmcHm1(gt2,gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIHmcHm1(gt2,gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhHmcHm1(i2,gt2,gt1)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIHmcHm1(gt2,gt1)
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhHmcHm1(i2,gt2,gt1)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhHmcHm1(i1,i2,gt2,gt1)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplHmHmcHmcHm1(gt2,i1,gt1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI(MAh,MetI,MFd,MFe,MFu,            & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,             & 
& cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,          & 
& cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,           & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,              & 
& cplFvFeHmR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,            & 
& cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,              & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhAhHmcHm1,   & 
& cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,cpletIHmVPVWp1,            & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhHmcHm1,cplHmHmcHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),   & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),             & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),       & 
& cplcgZgWpHm(3),cplcgZgWCcHm(3),cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhHmVWp(2,3),         & 
& cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),       & 
& cplHmcHmVZ(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhHmcHm1(3,3),cplAhetIHmcHm1(3,3),& 
& cplAhhhHmcHm1(2,3,3),cpletIetIHmcHm1(3,3),cpletIhhHmcHm1(2,3,3),cpletIHmVPVWp1(3),     & 
& cpletIHmVWpVZ1(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cplhhhhHmcHm1(2,2,3,3),      & 
& cplHmHmcHmcHm1(3,3,3,3)

Complex(dp), Intent(out) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MetI 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cpletIcHmcVWp(i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cpletIHmVWp(i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cpletIHmVPVWp1(gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(gt1)
coup2 = cplHmVPVWp(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmetI


Subroutine Amplitude_Tree_radinuZeeHB_HmToetIcVWp(cpletIcHmcVWp,MetI,MHm,             & 
& MVWp,MetI2,MHm2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MHm(3),MVWp,MetI2,MHm2(3),MVWp2

Complex(dp), Intent(in) :: cpletIcHmcVWp(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MetI 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = -cpletIcHmcVWp(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmToetIcVWp


Subroutine Gamma_Real_radinuZeeHB_HmToetIcVWp(MLambda,em,gs,cpletIcHmcVWp,            & 
& MetI,MHm,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIcHmcVWp(3)

Real(dp), Intent(in) :: MetI,MHm(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
Coup = cpletIcHmcVWp(i1)
Mex1 = MHm(i1)
Mex2 = MetI
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,-1._dp,Coup,Gammarealphoton(i1),kont)
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmToetIcVWp


Subroutine Amplitude_WAVE_radinuZeeHB_HmToetIcVWp(cpletIcHmcVWp,ctcpletIcHmcVWp,      & 
& MetI,MetI2,MHm,MHm2,MVWp,MVWp2,ZfetI,ZfHm,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cpletIcHmcVWp(3)

Complex(dp), Intent(in) :: ctcpletIcHmcVWp(3)

Complex(dp), Intent(in) :: ZfetI,ZfHm(3,3),ZfVWp

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MetI 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIcHmcVWp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cpletIcHmcVWp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIcHmcVWp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cpletIcHmcVWp(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToetIcVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToetIcVWp(MAh,MetI,MFd,MFe,MFu,             & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,         & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIetIetI,    & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),     & 
& cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFdFucHmL(3,3,3),            & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgWpgAcHm(3),           & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZgWCcHm(3),cplcgWpgZcHm(3),cplcgWCgZcVWp,             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),   & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cpletIetIcVWpVWp1,           & 
& cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MetI 
Mex3 = MVWp 


! {Ah, conj[Hm], Ah}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhAhetI
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Hm], etI}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhetIetI
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, conj[Hm], Ah}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cplAhetIetI
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm], etI}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIetIetI
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFuetIL(i1,i3)
coup2R = cplcFuFuetIR(i1,i3)
coup3L = -cplcFuFdcVWpR(i3,i2)
coup3R = -cplcFuFdcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {gWpC, gZ, gWpC}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, conj[Hm], Ah}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Hm], etI}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cpletIetIhh(i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], hh}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VWp, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cpletIhhVZ(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, conj[Hm], VZ}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cpletIhhVZ(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, conj[VWp]}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VP, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cpletIcHmcVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VZ, VWp, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cpletIhhVZ(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdetIL(i3,i1)
coup2R = cplcFdFdetIR(i3,i1)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], Fv, bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i1,i2,gt1)
coup1R = cplcFeFvcHmR(i1,i2,gt1)
coup2L = cplcFeFeetIL(i3,i1)
coup2R = cplcFeFeetIR(i3,i1)
coup3L = cplFvFecVWpL(i2,i3)
coup3R = cplFvFecVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gWp], bar[gP], bar[gWp]}
ML1 = MVWp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgWpgAcHm(gt1)
coup2 = cplcgWpgWpetI
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gWp], bar[gZ], bar[gWp]}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgWpgWpetI
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cpletIHmVWp(i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmVWp(i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cpletIHmVWp(i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], VP, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cpletIHmVWp(i3)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VZ, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cpletIHmVWp(i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, VWp}
ML1 = MetI 
ML2 = MVWp 
coup1 = -cpletIcHmcVWp(gt1)
coup2 = cpletIetIcVWpVWp1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cpletIcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2 = cpletIcHmcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhcHmcVWpVZ1(i1,gt1)
coup2 = cpletIhhVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplHmcHmcVWpVWp1(i1,gt1)
coup2 = cpletIcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToetIcVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp(MAh,MetI,MFd,MFe,              & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,     & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgAgWpcVWp,        & 
& cplcgZgWpcVWp,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhHmcHm,cplhhcVWpVWp,         & 
& cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ,cpletIetIcVWpVWp1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhcHmcVWpVZ1,      & 
& cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIetIetI,    & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),     & 
& cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFdFucHmL(3,3,3),            & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgWpgAcHm(3),           & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgZgWCcHm(3),cplcgWpgZcHm(3),cplcgWCgZcVWp,             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),   & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cpletIetIcVWpVWp1,           & 
& cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MetI 
Mex3 = MVWp 


! {Hm, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VP, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWp], VP, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cpletIHmVWp(i3)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cpletIcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToetIcVWp


Subroutine Amplitude_Tree_radinuZeeHB_HmTocFdFu(cplcFdFucHmL,cplcFdFucHmR,            & 
& MFd,MFu,MHm,MFd2,MFu2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),MHm(3),MFd2(3),MFu2(3),MHm2(3)

Complex(dp), Intent(in) :: cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFucHmL(gt2,gt3,gt1)
coupT1R = cplcFdFucHmR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmTocFdFu


Subroutine Gamma_Real_radinuZeeHB_HmTocFdFu(MLambda,em,gs,cplcFdFucHmL,               & 
& cplcFdFucHmR,MFd,MFu,MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Real(dp), Intent(in) :: MFd(3),MFu(3),MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFucHmL(i2,i3,i1)
CoupR = cplcFdFucHmR(i2,i3,i1)
Mex1 = MHm(i1)
Mex2 = MFd(i2)
Mex3 = MFu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,3._dp,1._dp,2._dp,1._dp/3._dp,2._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmTocFdFu


Subroutine Amplitude_WAVE_radinuZeeHB_HmTocFdFu(cplcFdFucHmL,cplcFdFucHmR,            & 
& ctcplcFdFucHmL,ctcplcFdFucHmR,MFd,MFd2,MFu,MFu2,MHm,MHm2,ZfDL,ZfDR,ZfHm,               & 
& ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFdFucHmL(3,3,3),ctcplcFdFucHmR(3,3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),ZfHm(3,3),ZfUL(3,3),ZfUR(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFucHmL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFdFucHmR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplcFdFucHmL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplcFdFucHmR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt2)*cplcFdFucHmL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt2))*cplcFdFucHmR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt3)*cplcFdFucHmL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt3))*cplcFdFucHmR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmTocFdFu


Subroutine Amplitude_VERTEX_radinuZeeHB_HmTocFdFu(MAh,MetI,MFd,MFu,Mhh,               & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,               & 
& cplcHmcVWpVP,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhHmcHm(3,3),  & 
& cplAhcHmcVWp(3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),& 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplcHmcVWpVP(3),   & 
& cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFu(gt3) 


! {Ah, VWp, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = -cplAhcHmcVWp(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFuVWpL(i3,gt3)
coup3R = cplcFdFuVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFucHmL(i3,gt3,i2)
coup3R = cplcFdFucHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, Fd}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = -cpletIcHmcVWp(gt1)
coup2L = cplcFdFdetIL(gt2,i3)
coup2R = cplcFdFdetIR(gt2,i3)
coup3L = cplcFdFuVWpL(i3,gt3)
coup3R = cplcFdFuVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2L = cplcFdFdetIL(gt2,i3)
coup2R = cplcFdFdetIR(gt2,i3)
coup3L = cplcFdFucHmL(i3,gt3,i2)
coup3R = cplcFdFucHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {hh, VWp, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFuVWpL(i3,gt3)
coup3R = cplcFdFuVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], Fd}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFucHmL(i3,gt3,i2)
coup3R = cplcFdFucHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, Ah, Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFuAhL(i3,gt3)
coup3R = cplcFuFuAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFuetIL(i3,gt3)
coup3R = cplcFuFuetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, Fu}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VP, Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = -cplHmcHmVP(i1,gt1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VZ, Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, VWp, Fd}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFuVWpL(i3,gt3)
coup3R = cplcFdFuVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = -cplHmcHmVP(i2,gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFucHmL(i3,gt3,i2)
coup3R = cplcFdFucHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, VWp, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFuVWpL(i3,gt3)
coup3R = cplcFdFuVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = -cplHmcHmVZ(i2,gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFucHmL(i3,gt3,i2)
coup3R = cplcFdFucHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MAh 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFuFuAhL(i2,gt3)
coup3R = cplcFuFuAhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fu], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MetI 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdetIL(gt2,i1)
coup2R = cplcFdFdetIR(gt2,i1)
coup3L = cplcFuFuetIL(i2,gt3)
coup3R = cplcFuFuetIR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fu], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdhhL(gt2,i1,i3)
coup2R = cplcFdFdhhR(gt2,i1,i3)
coup3L = cplcFuFuhhL(i2,gt3,i3)
coup3R = cplcFuFuhhR(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fd], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fu], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFuFuVZL(i2,gt3)
coup3R = cplcFuFuVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWp], Ah, Fu}
    Do i3=1,3
ML1 = MVWp 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = -cplAhcHmcVWp(gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFuAhL(i3,gt3)
coup3R = cplcFuFuAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, Fu}
    Do i3=1,3
ML1 = MVWp 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = -cpletIcHmcVWp(gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFuetIL(i3,gt3)
coup3R = cplcFuFuetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = -cplhhcHmcVWp(i2,gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], VP, Fu}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VZ, Fu}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmTocFdFu


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu(MAh,MetI,MFd,MFu,Mhh,            & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmcHm,cplAhcHmcVWp,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmcHm,cpletIcHmcVWp,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,               & 
& cplcHmcVWpVP,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhHmcHm(3,3),  & 
& cplAhcHmcVWp(3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),& 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),               & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplcHmcVWpVP(3),   & 
& cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFu(gt3) 


! {Hm, VP, Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = -cplHmcHmVP(i1,gt1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, VWp, Fd}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFuVWpL(i3,gt3)
coup3R = cplcFdFuVWpR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = -cplHmcHmVP(i2,gt1)
coup2L = cplcFdFdVPL(gt2,i3)
coup2R = cplcFdFdVPR(gt2,i3)
coup3L = cplcFdFucHmL(i3,gt3,i2)
coup3R = cplcFdFucHmR(i3,gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWp], VP, Fu}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MFu(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFuVPL(i3,gt3)
coup3R = cplcFuFuVPR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTocFdFu


Subroutine Amplitude_Tree_radinuZeeHB_HmTocFeFv(cplcFeFvcHmL,cplcFeFvcHmR,            & 
& MFe,MFv,MHm,MFe2,MFv2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3),MFe2(3),MFv2(3),MHm2(3)

Complex(dp), Intent(in) :: cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFv(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFvcHmL(gt2,gt3,gt1)
coupT1R = cplcFeFvcHmR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmTocFeFv


Subroutine Gamma_Real_radinuZeeHB_HmTocFeFv(MLambda,em,gs,cplcFeFvcHmL,               & 
& cplcFeFvcHmR,MFe,MFv,MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=2,3
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFvcHmL(i2,i3,i1)
CoupR = cplcFeFvcHmR(i2,i3,i1)
Mex1 = MHm(i1)
Mex2 = MFe(i2)
Mex3 = MFv(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmTocFeFv


Subroutine Amplitude_WAVE_radinuZeeHB_HmTocFeFv(cplcFeFvcHmL,cplcFeFvcHmR,            & 
& ctcplcFeFvcHmL,ctcplcFeFvcHmR,MFe,MFe2,MFv,MFv2,MHm,MHm2,ZfEL,ZfER,ZfHm,ZfVL,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(3),MFv2(3),MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFeFvcHmL(3,3,3),ctcplcFeFvcHmR(3,3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfHm(3,3),ZfVL(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFv(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvcHmL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeFvcHmR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplcFeFvcHmL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplcFeFvcHmR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt2)*cplcFeFvcHmL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt2))*cplcFeFvcHmR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVL(i1,gt3)*cplcFeFvcHmL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfVL(i1,gt3))*cplcFeFvcHmR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmTocFeFv


Subroutine Amplitude_VERTEX_radinuZeeHB_HmTocFeFv(MAh,MetI,MFe,MFv,Mhh,               & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cplcFeFeetIL(3,3),  & 
& cplcFeFeetIR(3,3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),   & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),               & 
& cplcFeFvcHmR(3,3,3),cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),               & 
& cplHmcHmVZ(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFv(gt3) 


! {Ah, VWp, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = -cplAhcHmcVWp(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFvVWpL(i3,gt3)
coup3R = cplcFeFvVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFvcHmL(i3,gt3,i2)
coup3R = cplcFeFvcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, Fe}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = -cpletIcHmcVWp(gt1)
coup2L = cplcFeFeetIL(gt2,i3)
coup2R = cplcFeFeetIR(gt2,i3)
coup3L = cplcFeFvVWpL(i3,gt3)
coup3R = cplcFeFvVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2L = cplcFeFeetIL(gt2,i3)
coup2R = cplcFeFeetIR(gt2,i3)
coup3L = cplcFeFvcHmL(i3,gt3,i2)
coup3R = cplcFeFvcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fv, Fe, VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplcFeFvVWpL(gt2,i1)
coup2R = cplcFeFvVWpR(gt2,i1)
coup3L = -cplFvFecVWpR(gt3,i2)
coup3R = -cplFvFecVWpL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fv, Fe, conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplcFeFvcHmL(gt2,i1,i3)
coup2R = cplcFeFvcHmR(gt2,i1,i3)
coup3L = cplFvFeHmL(gt3,i2,i3)
coup3R = cplFvFeHmR(gt3,i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VWp, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFvVWpL(i3,gt3)
coup3R = cplcFeFvVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], Fe}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFvcHmL(i3,gt3,i2)
coup3R = cplcFeFvcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VZ, Fv}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2L = cplcFeFvcHmL(gt2,i3,i1)
coup2R = cplcFeFvcHmR(gt2,i3,i1)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VP, VWp, Fe}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFvVWpL(i3,gt3)
coup3R = cplcFeFvVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = -cplHmcHmVP(i2,gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFvcHmL(i3,gt3,i2)
coup3R = cplcFeFvcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, VWp, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFvVWpL(i3,gt3)
coup3R = cplcFeFvVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = -cplHmcHmVZ(i2,gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFvcHmL(i3,gt3,i2)
coup3R = cplcFeFvcHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], Fv, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFv(i2) 
ML3 = MVZ 
coup1L = cplcFeFvcHmL(i1,i2,gt1)
coup1R = cplcFeFvcHmR(i1,i2,gt1)
coup2L = cplcFeFeVZL(gt2,i1)
coup2R = cplcFeFeVZR(gt2,i1)
coup3L = -cplFvFvVZR(gt3,i2)
coup3R = -cplFvFvVZL(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWp], VZ, Fv}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2L = cplcFeFvVWpL(gt2,i3)
coup2R = cplcFeFvVWpR(gt2,i3)
coup3L = -cplFvFvVZR(gt3,i3)
coup3R = -cplFvFvVZL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmTocFeFv


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv(MAh,MetI,MFe,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,           & 
& cplHmcHmVP,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cplcFeFeetIL(3,3),  & 
& cplcFeFeetIR(3,3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),   & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),               & 
& cplcFeFvcHmR(3,3,3),cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),cplHmcHmVP(3,3),               & 
& cplHmcHmVZ(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFv(gt3) 


! {VP, VWp, Fe}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFvVWpL(i3,gt3)
coup3R = cplcFeFvVWpR(i3,gt3)
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = -cplHmcHmVP(i2,gt1)
coup2L = cplcFeFeVPL(gt2,i3)
coup2R = cplcFeFeVPR(gt2,i3)
coup3L = cplcFeFvcHmL(i3,gt3,i2)
coup3R = cplcFeFvcHmR(i3,gt3,i2)
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTocFeFv


Subroutine Amplitude_Tree_radinuZeeHB_HmToHmhh(cplhhHmcHm,Mhh,MHm,Mhh2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHm(3),Mhh2(2),MHm2(3)

Complex(dp), Intent(in) :: cplhhHmcHm(2,3,3)

Complex(dp) :: Amp(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhHmcHm(gt3,gt2,gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmToHmhh


Subroutine Gamma_Real_radinuZeeHB_HmToHmhh(MLambda,em,gs,cplhhHmcHm,Mhh,              & 
& MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHmcHm(2,3,3)

Real(dp), Intent(in) :: Mhh(2),MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,2), GammarealGluon(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,3
    Do i3=1,2
Coup = cplhhHmcHm(i3,i2,i1)
Mex1 = MHm(i1)
Mex2 = MHm(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmToHmhh


Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmhh(cplhhHmcHm,ctcplhhHmcHm,               & 
& Mhh,Mhh2,MHm,MHm2,Zfhh,ZfHm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplhhHmcHm(2,3,3)

Complex(dp), Intent(in) :: ctcplhhHmcHm(2,3,3)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHm(3,3)

Complex(dp), Intent(out) :: Amp(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHmcHm(gt3,gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplhhHmcHm(gt3,gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cplhhHmcHm(gt3,i1,gt1)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhHmcHm(i1,gt2,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmhh


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmhh(MAh,MetI,MFd,MFe,MFu,MFv,            & 
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
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3), & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),           & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),             & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),       & 
& cplcgWpgWphh(2),cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgZgWCcHm(3),cplcgZgZhh(2),          & 
& cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),     & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),          & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhHmcHm1(3,3),      & 
& cplAhetIHmcHm1(3,3),cplAhhhHmcHm1(2,3,3),cpletIetIHmcHm1(3,3),cpletIhhHmcHm1(2,3,3),   & 
& cplhhhhHmcHm1(2,2,3,3),cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),     & 
& cplhhcHmcVWpVZ1(2,3),cplHmHmcHmcHm1(3,3,3,3),cplHmcHmcVWpVWp1(3,3),cplHmcHmVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, VWp, VWp}
ML1 = MAh 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm], VWp}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, VWp}
ML1 = MetI 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, conj[Hm], VWp}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFdHmL(i1,i3,gt2)
coup2R = cplcFuFdHmR(i1,i3,gt2)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fv, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplFvFeHmL(i1,i3,gt2)
coup2R = cplFvFeHmR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gWpC, gZ, gZ}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {gZ, gWp, gWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgWphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {hh, VWp, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmVWp(i1,gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, conj[Hm], VWp}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmVWp(i1,gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], conj[Hm]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, Ah, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VZ, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Ah, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VZ, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MetI 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, Ah, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = -cplHmcHmVZ(gt2,i1)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, etI, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MVZ 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = -cplHmcHmVZ(gt2,i1)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = -cplHmcHmVZ(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, VWp, VWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = -cplHmcHmVZ(gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = -cplHmcHmVZ(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFuFdHmL(i3,i1,gt2)
coup2R = cplcFuFdHmR(i3,i1,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gWp], bar[gZ], bar[gZ]}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gWpC], bar[gWpC]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgWCgWChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, Ah}
ML1 = MVWp 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, Ah}
ML1 = MVWp 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, Ah}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], VZ, Ah}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplAhHmVWp(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, etI}
ML1 = MVWp 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, etI}
ML1 = MVWp 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, etI}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], VZ, etI}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MetI 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cpletIHmVWp(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplhhHmVWp(i3,gt2)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Ah, VZ}
ML1 = MVWp 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], etI, VZ}
ML1 = MVWp 
ML2 = MetI 
ML3 = MVZ 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[VWp], VZ, VZ}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhhhHmcHm1(gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIhhHmcHm1(gt3,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhhhHmcHm1(gt3,i1,gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplhhHmVPVWp1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhHmVWpVZ1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt3,i2,gt1)
coup2 = cplAhHmcHm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt3,i2,gt1)
coup2 = cpletIHmcHm(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt3,i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt3,gt1)
coup2 = cplHmVPVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt3,gt1)
coup2 = cplHmVWpVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhHmcHm1(gt2,gt1)
coup2 = cplAhAhhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIHmcHm1(gt2,gt1)
coup2 = cplAhetIhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhHmcHm1(i2,gt2,gt1)
coup2 = cplAhhhhh(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIHmcHm1(gt2,gt1)
coup2 = cpletIetIhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhHmcHm1(i2,gt2,gt1)
coup2 = cpletIhhhh(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhHmcHm1(i1,i2,gt2,gt1)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplHmHmcHmcHm1(gt2,i1,gt1,i2)
coup2 = cplhhHmcHm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplHmcHmcVWpVWp1(gt2,gt1)
coup2 = cplhhcVWpVWp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplHmcHmVZVZ1(gt2,gt1)
coup2 = cplhhVZVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmhh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh(MAh,MetI,MFd,MFe,MFu,             & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,      & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZcHm,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcHmcVWpVP,cplcHmcVWpVZ,    & 
& cplAhAhHmcHm1,cplAhetIHmcHm1,cplAhhhHmcHm1,cpletIetIHmcHm1,cpletIhhHmcHm1,             & 
& cplhhhhHmcHm1,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,             & 
& cplHmHmcHmcHm1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3), & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),           & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),             & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),       & 
& cplcgWpgWphh(2),cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgZgWCcHm(3),cplcgZgZhh(2),          & 
& cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),     & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),          & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhAhHmcHm1(3,3),      & 
& cplAhetIHmcHm1(3,3),cplAhhhHmcHm1(2,3,3),cpletIetIHmcHm1(3,3),cpletIhhHmcHm1(2,3,3),   & 
& cplhhhhHmcHm1(2,2,3,3),cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),     & 
& cplhhcHmcVWpVZ1(2,3),cplHmHmcHmcHm1(3,3,3,3),cplHmcHmcVWpVWp1(3,3),cplHmcHmVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = Mhh(gt3) 


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = -cplHmcHmVP(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplhhHmVPVWp1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt3,gt1)
coup2 = cplHmVPVWp(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmhh


Subroutine Amplitude_Tree_radinuZeeHB_HmTohhcVWp(cplhhcHmcVWp,Mhh,MHm,MVWp,           & 
& Mhh2,MHm2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHm(3),MVWp,Mhh2(2),MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplhhcHmcVWp(2,3)

Complex(dp) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,2
! External masses 
Mex1 = MHm(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = -cplhhcHmcVWp(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmTohhcVWp


Subroutine Gamma_Real_radinuZeeHB_HmTohhcVWp(MLambda,em,gs,cplhhcHmcVWp,              & 
& Mhh,MHm,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhcHmcVWp(2,3)

Real(dp), Intent(in) :: Mhh(2),MHm(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,2), GammarealGluon(3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=1,2
Coup = cplhhcHmcVWp(i2,i1)
Mex1 = MHm(i1)
Mex2 = Mhh(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,-1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmTohhcVWp


Subroutine Amplitude_WAVE_radinuZeeHB_HmTohhcVWp(cplhhcHmcVWp,ctcplhhcHmcVWp,         & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,Zfhh,ZfHm,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhcHmcVWp(2,3)

Complex(dp), Intent(in) :: ctcplhhcHmcVWp(2,3)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHm(3,3),ZfVWp

Complex(dp), Intent(out) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,2
! External masses 
Mex1 = MHm(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhcHmcVWp(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplhhcHmcVWp(gt2,i1)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplhhcHmcVWp(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhcHmcVWp(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmTohhcVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_HmTohhcVWp(MAh,MetI,MFd,MFe,MFu,              & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,     & 
& cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh,         & 
& cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,               & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,cplcVWpVPVWp,     & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,               & 
& cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),               & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmcHm(3,3),         & 
& cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWpL(3,3),             & 
& cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),          & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgZgAhh(2),             & 
& cplcgWpgAcHm(3),cplcgWpgWphh(2),cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh(2),           & 
& cplcgZgWCcHm(3),cplcgZgZhh(2),cplcgWpgZcHm(3),cplcgWCgZcVWp,cplhhhhhh(2,2,2),          & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ(3),cplAhcHmcVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhhhcVWpVWp1(2,2),           & 
& cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVWp 


! {Ah, conj[Hm], Ah}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Hm], etI}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VWp, VZ}
ML1 = MAh 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplAhcHmcVWp(gt1)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm], VZ}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm], Ah}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm], etI}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, VZ}
ML1 = MetI 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cpletIcHmcVWp(gt1)
coup2 = -cpletIhhVZ(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, conj[Hm], VZ}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = -cpletIhhVZ(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fu, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFdcVWpR(i3,i2)
coup3R = -cplcFuFdcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {gWpC, gZ, gWpC}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {gZ, gWp, gP}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgAhh(gt2)
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {gZ, gWp, gZ}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, conj[Hm], Ah}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, conj[Hm], etI}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], hh}
Do i1=1,2
  Do i2=1,3
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, Ah, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, conj[VWp]}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, VP, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VZ, conj[Hm], Ah}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, conj[Hm], etI}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = -cpletIhhVZ(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, VZ}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, conj[Hm], VZ}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {bar[Fd], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFdFdhhL(i3,i1,gt2)
coup2R = cplcFdFdhhR(i3,i1,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], Fv, bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i1,i2,gt1)
coup1R = cplcFeFvcHmR(i1,i2,gt1)
coup2L = cplcFeFehhL(i3,i1,gt2)
coup2R = cplcFeFehhR(i3,i1,gt2)
coup3L = cplFvFecVWpL(i2,i3)
coup3R = cplFvFecVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gWp], bar[gP], bar[gWp]}
ML1 = MVWp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgWpgAcHm(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[gWp], bar[gZ], bar[gWp]}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gWpC], bar[gZ]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], VP, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VZ, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, conj[VWp]}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], VP, conj[VWp]}
ML1 = MVWp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], VZ, conj[VWp]}
ML1 = MVWp 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2 = cplhhhhcVWpVWp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplhhcHmcVWpVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2 = cplhhcHmcVWpVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Ah, VZ}
ML1 = MAh 
ML2 = MVZ 
coup1 = cplAhcHmcVWpVZ1(gt1)
coup2 = -cplAhhhVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 



! {etI, VZ}
ML1 = MetI 
ML2 = MVZ 
coup1 = cpletIcHmcVWpVZ1(gt1)
coup2 = -cpletIhhVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 



! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplHmcHmcVWpVWp1(i1,gt1)
coup2 = cplhhcHmcVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmTohhcVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp(MAh,MetI,MFd,MFe,               & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,           & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgZgAhh,cplcgWpgAcHm,cplcgWpgWphh,cplcgAgWpcVWp,cplcgZgWpcVWp,         & 
& cplcgWCgWChh,cplcgZgWCcHm,cplcgZgZhh,cplcgWpgZcHm,cplcgWCgZcVWp,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmcHmVZ,       & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,  & 
& cplhhhhcVWpVWp1,cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmcHm(3,3),               & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmcHm(3,3),         & 
& cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWpL(3,3),             & 
& cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),          & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgZgAhh(2),             & 
& cplcgWpgAcHm(3),cplcgWpgWphh(2),cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh(2),           & 
& cplcgZgWCcHm(3),cplcgZgZhh(2),cplcgWpgZcHm(3),cplcgWCgZcVWp,cplhhhhhh(2,2,2),          & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmcHmVP(3,3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,             & 
& cplcHmcVWpVZ(3),cplAhcHmcVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhhhcVWpVWp1(2,2),           & 
& cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVWp 


! {Hm, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VP, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplHmcHmVP(i1,gt1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWp], VP, Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVP 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VP, conj[VWp]}
ML1 = MVWp 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplhhcHmcVWpVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTohhcVWp


Subroutine Amplitude_Tree_radinuZeeHB_HmToHmVZ(cplHmcHmVZ,MHm,MVZ,MHm2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MHm(3),MVZ,MHm2(3),MVZ2

Complex(dp), Intent(in) :: cplHmcHmVZ(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplHmcHmVZ(gt2,gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmToHmVZ


Subroutine Gamma_Real_radinuZeeHB_HmToHmVZ(MLambda,em,gs,cplHmcHmVZ,MHm,              & 
& MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplHmcHmVZ(3,3)

Real(dp), Intent(in) :: MHm(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
  Do i2=2,3
Coup = cplHmcHmVZ(i2,i1)
Mex1 = MHm(i1)
Mex2 = MHm(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmToHmVZ


Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmVZ(cplHmcHmVP,cplHmcHmVZ,ctcplHmcHmVP,    & 
& ctcplHmcHmVZ,MHm,MHm2,MVP,MVP2,MVZ,MVZ2,ZfHm,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MHm(3),MHm2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplHmcHmVP(3,3),cplHmcHmVZ(3,3)

Complex(dp), Intent(in) :: ctcplHmcHmVP(3,3),ctcplHmcHmVZ(3,3)

Complex(dp), Intent(in) :: ZfHm(3,3),ZfVPVZ,ZfVZ

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplHmcHmVZ(gt2,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplHmcHmVZ(gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cplHmcHmVZ(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplHmcHmVP(gt2,gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplHmcHmVZ(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmVZ(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,              & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,              & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,            & 
& cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,         & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,   & 
& cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIhhVZ(2),             & 
& cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),               & 
& cplcgZgWpHm(3),cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm(3),cplcgWCgZHm(3),               & 
& cplcgWpgZcHm(3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcHmcVWpVP(3),           & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhHmVWpVZ1(3),cplAhcHmcVWpVZ1(3),cpletIHmVWpVZ1(3),    & 
& cpletIcHmcVWpVZ1(3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmVPVZ1(3,3),        & 
& cplHmcHmVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVZ 


! {Ah, VWp, VWp}
ML1 = MAh 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplAhcHmcVWp(gt1)
coup2 = -cplAhHmVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm], VWp}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, VWp}
ML1 = MetI 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(gt1)
coup2 = -cpletIHmVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, conj[Hm], VWp}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = -cpletIHmVWp(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFdHmL(i1,i3,gt2)
coup2R = cplcFuFdHmR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fv, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplFvFeHmL(i1,i3,gt2)
coup2R = cplFvFeHmR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gZ, gWp, gWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, VWp, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = -cplhhHmVWp(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, conj[Hm], VWp}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = -cplhhHmVWp(i1,gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], conj[Hm]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplHmcHmVZ(i1,gt1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, VWp, VWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFuFdHmL(i3,i1,gt2)
coup2R = cplcFuFdHmR(i3,i1,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], Fv, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHmL(i1,i2,gt1)
coup1R = cplcFeFvcHmR(i1,i2,gt1)
coup2L = cplFvFeHmL(i3,i1,gt2)
coup2R = cplFvFeHmR(i3,i1,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gZ], bar[gWpC], bar[gWpC]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], hh, Ah}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], hh, etI}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = -cpletIHmVWp(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Ah, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = -cplhhHmVWp(i3,gt2)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = -cplhhHmVWp(i3,gt2)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VZ, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = -cplhhHmVWp(i3,gt2)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, VZ}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhcHmcVWp(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp}
ML1 = MAh 
ML2 = MVWp 
coup1 = -cplAhcHmcVWp(gt1)
coup2 = cplAhHmVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, VWp}
ML1 = MetI 
ML2 = MVWp 
coup1 = -cpletIcHmcVWp(gt1)
coup2 = cpletIHmVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmVWpVZ1(i1,gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplHmcHmVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2 = cplHmcHmVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Ah, VWp}
ML1 = MAh 
ML2 = MVWp 
coup1 = cplAhcHmcVWpVZ1(gt1)
coup2 = -cplAhHmVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 



! {etI, VWp}
ML1 = MetI 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(gt1)
coup2 = -cpletIHmVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 



! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(i1,gt1)
coup2 = -cplhhHmVWp(i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplHmcHmVPVZ1(i1,gt1)
coup2 = cplHmcHmVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cplHmcHmVZVZ1(i1,gt1)
coup2 = cplHmcHmVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ(MAh,MetI,MFd,MFe,MFu,             & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmVWp,              & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,             & 
& cplFvFeHmL,cplFvFeHmR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,    & 
& cplcFdFucHmR,cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgZgWpHm,              & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWCgZHm,cplcgWpgZcHm,cplhhHmVWp,            & 
& cplhhHmcHm,cplhhVZVZ,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,         & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,   & 
& cpletIcHmcVWpVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIhhVZ(2),             & 
& cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFeVZL(3,3),& 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),& 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),               & 
& cplcgZgWpHm(3),cplcgWpgWpVZ,cplcgWCgWCVZ,cplcgZgWCcHm(3),cplcgWCgZHm(3),               & 
& cplcgWpgZcHm(3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcHmcVWpVP(3),           & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhHmVWpVZ1(3),cplAhcHmcVWpVZ1(3),cpletIHmVWpVZ1(3),    & 
& cpletIcHmcVWpVZ1(3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmVPVZ1(3,3),        & 
& cplHmcHmVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVZ 


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = -cplcVWpVWpVZ
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcHmcVWpVZ(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmVWpVZ(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplHmcHmVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplHmcHmVPVZ1(i1,gt1)
coup2 = cplHmcHmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVZ


Subroutine Amplitude_Tree_radinuZeeHB_HmTocVWpVZ(cplcHmcVWpVZ,MHm,MVWp,               & 
& MVZ,MHm2,MVWp2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MHm(3),MVWp,MVZ,MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcHmcVWpVZ(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MVWp 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplcHmcVWpVZ(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_HmTocVWpVZ


Subroutine Gamma_Real_radinuZeeHB_HmTocVWpVZ(MLambda,em,gs,cplcHmcVWpVZ,              & 
& MHm,MVWp,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcHmcVWpVZ(3)

Real(dp), Intent(in) :: MHm(3),MVWp,MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=2,3
Coup = cplcHmcVWpVZ(i1)
Mex1 = MHm(i1)
Mex2 = MVWp
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Call hardphotonSVV(Mex1,Mex2,Mex3,MLambda,em,1._dp,-1._dp,0._dp,Coup,Gammarealphoton(i1),kont)
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_HmTocVWpVZ


Subroutine Amplitude_WAVE_radinuZeeHB_HmTocVWpVZ(cplcHmcVWpVP,cplcHmcVWpVZ,           & 
& ctcplcHmcVWpVP,ctcplcHmcVWpVZ,MHm,MHm2,MVP,MVP2,MVWp,MVWp2,MVZ,MVZ2,ZfHm,              & 
& ZfVPVZ,ZfVWp,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MHm(3),MHm2(3),MVP,MVP2,MVWp,MVWp2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcHmcVWpVP(3),cplcHmcVWpVZ(3)

Complex(dp), Intent(in) :: ctcplcHmcVWpVP(3),ctcplcHmcVWpVZ(3)

Complex(dp), Intent(in) :: ZfHm(3,3),ZfVPVZ,ZfVWp,ZfVZ

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MVWp 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplcHmcVWpVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplcHmcVWpVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfVWp)*cplcHmcVWpVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVPVZ*cplcHmcVWpVP(gt1)
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplcHmcVWpVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmTocVWpVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_HmTocVWpVZ(MAh,MetI,MFd,MFe,MFu,              & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,           & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,      & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,  & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,         & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIhhVZ(2),cpletIHmcHm(3,3),          & 
& cpletIcHmcVWp(3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplFvFvVZL(3,3),              & 
& cplFvFvVZR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgWpgAcHm(3),               & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm(3),cplcgWpgZcHm(3), & 
& cplcgWCgZcVWp,cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),        & 
& cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),            & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhcHmcVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhcHmcVWpVZ1(2,3),& 
& cplHmcHmVPVZ1(3,3),cplHmcHmcVWpVWp1(3,3),cplHmcHmVZVZ1(3,3),cplcVWpVPVWpVZ3Q,          & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MVWp 
Mex3 = MVZ 


! {Ah, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplAhcHmcVWp(gt1)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(gt1)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = -cplcFuFdcVWpR(i1,i3)
coup2R = -cplcFuFdcVWpL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fv, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = -cplFvFecVWpR(i1,i3)
coup2R = -cplFvFecVWpL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gP, gWp, gWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgAcHm(gt1)
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gZ, gWp, gWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, VWp, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2 = cplhhcVWpVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, conj[Hm], VWp}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhcVWpVWp(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2 = cplhhcHmcVWp(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], conj[Hm]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhcHmcVWp(i1,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = -cplAhcHmcVWp(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = -cpletIcHmcVWp(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhHmcHm(i1,gt1)
coup2 = -cplhhcHmcVWp(i3,i1)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i1,gt1)
coup2 = -cplhhcHmcVWp(i3,i1)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2 = -cplhhcHmcVWp(i3,i1)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MHm(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(i2,i1,gt1)
coup2 = cplcHmcVWpVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplcVWpVPVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplHmcHmVP(i2,gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplHmcHmVP(i2,gt1)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, VWp, VWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VZ, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplHmcHmVZ(i2,gt1)
coup2 = cplcVWpVWpVZ
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplcHmcVWpVZ(i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplHmcHmVZ(i2,gt1)
coup2 = cplcHmcVWpVZ(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFuFdcVWpL(i3,i1)
coup2R = cplcFuFdcVWpR(i3,i1)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], Fv, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHmL(i1,i2,gt1)
coup1R = cplcFeFvcHmR(i1,i2,gt1)
coup2L = cplFvFecVWpL(i3,i1)
coup2R = cplFvFecVWpR(i3,i1)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gZ], bar[gWpC], bar[gWpC]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[VWp], Ah, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = -cplAhcHmcVWp(gt1)
coup2 = cplhhcVWpVWp(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], etI, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = -cpletIcHmcVWp(gt1)
coup2 = cplhhcVWpVWp(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], VZ, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplhhcVWpVWp(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], hh, VZ}
  Do i2=1,2
ML1 = MVWp 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = -cplhhcHmcVWp(i2,gt1)
coup2 = -cplcVWpVWpVZ
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhcHmcVWpVZ1(i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIcHmcVWpVZ1(i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhcHmcVWpVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2c = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2a = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplcVWpVWpVZVZ1Q
coup2c = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2b = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(i1,gt1)
coup2 = cplhhcVWpVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplHmcHmVPVZ1(i1,gt1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cplHmcHmVZVZ1(i1,gt1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhcHmcVWpVZ1(i1,gt1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplHmcHmcVWpVWp1(i1,gt1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmTocVWpVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ(MAh,MetI,MFd,MFe,               & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhhhVZ,cplAhHmcHm,cplAhcHmcVWp,cpletIhhVZ,cpletIHmcHm,cpletIcHmcVWp,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,         & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplFvFvVZL,cplFvFvVZR,cplcFeFvcHmL,cplcFeFvcHmR,cplcgWpgAcHm,cplcgWpgWpVZ,             & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm,cplcgWpgZcHm,cplcgWCgZcVWp,      & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhcHmcVWpVZ1,cpletIcHmcVWpVZ1,  & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplHmcHmcVWpVWp1,cplHmcHmVZVZ1,cplcVWpVPVWpVZ3Q,         & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIhhVZ(2),cpletIHmcHm(3,3),          & 
& cpletIcHmcVWp(3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplFvFvVZL(3,3),              & 
& cplFvFvVZR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgWpgAcHm(3),               & 
& cplcgWpgWpVZ,cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWCVZ,cplcgZgWCcHm(3),cplcgWpgZcHm(3), & 
& cplcgWCgZcVWp,cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),        & 
& cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),            & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhcHmcVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhcHmcVWpVZ1(2,3),& 
& cplHmcHmVPVZ1(3,3),cplHmcHmcVWpVWp1(3,3),cplHmcHmVZVZ1(3,3),cplcVWpVPVWpVZ3Q,          & 
& cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MVWp 
Mex3 = MVZ 


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = -cplcVWpVPVWp
coup3 = -cplcVWpVWpVZ
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplHmcHmVP(i2,gt1)
coup2 = -cplcVWpVPVWp
coup3 = cplcHmcVWpVZ(i2)
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmVWpVZ(i3)
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplHmcHmVP(i2,gt1)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmcHmVZ(i3,i2)
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2c = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2a = coup2 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplHmcHmVPVZ1(i1,gt1)
coup2 = cplcHmcVWpVP(i1)
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmTocVWpVZ


Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmVP(cplHmcHmVP,cplHmcHmVZ,ctcplHmcHmVP,    & 
& ctcplHmcHmVZ,MHm,MHm2,MVP,MVP2,ZfHm,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MHm(3),MHm2(3),MVP,MVP2

Complex(dp), Intent(in) :: cplHmcHmVP(3,3),cplHmcHmVZ(3,3)

Complex(dp), Intent(in) :: ctcplHmcHmVP(3,3),ctcplHmcHmVZ(3,3)

Complex(dp), Intent(in) :: ZfHm(3,3),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt1))*cplHmcHmVP(gt2,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cplHmcHmVP(i1,gt1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplHmcHmVZ(gt2,gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_HmToHmVP


Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmVP(MAh,MetI,MFd,MFe,MFu,MFv,            & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,              & 
& MVZ2,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,         & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,cplcFdFdVPR,cplFvFeHmL,cplFvFeHmR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVP,cplcgWCgWCVP,cplcgZgWCcHm,cplcgWCgZHm,           & 
& cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhHmVPVWp1,cplAhcHmcVWpVP1,       & 
& cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,cplHmcHmVPVP1,           & 
& cplHmcHmVPVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIHmVWp(3),cpletIHmcHm(3,3),        & 
& cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVPL(3,3),               & 
& cplcFdFdVPR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),& 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgZgWpHm(3),cplcgWpgWpVP,cplcgWCgWCVP,      & 
& cplcgZgWCcHm(3),cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),      & 
& cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),         & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhHmVPVWp1(3),cplAhcHmcVWpVP1(3),      & 
& cpletIHmVPVWp1(3),cpletIcHmcVWpVP1(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3),         & 
& cplHmcHmVPVP1(3,3),cplHmcHmVPVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVP 


! {Ah, VWp, VWp}
ML1 = MAh 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplAhcHmcVWp(gt1)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, conj[Hm], VWp}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplAhcHmcVWp(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplAhHmcHm(i2,gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VWp, VWp}
ML1 = MetI 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(gt1)
coup2 = -cpletIHmVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, conj[Hm], VWp}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = -cpletIHmVWp(gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i2,gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFucHmL(i2,i1,gt1)
coup1R = cplcFdFucHmR(i2,i1,gt1)
coup2L = cplcFuFdHmL(i1,i3,gt2)
coup2R = cplcFuFdHmR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {Fv, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,i1,gt1)
coup1R = cplcFeFvcHmR(i2,i1,gt1)
coup2L = cplFvFeHmL(i1,i3,gt2)
coup2R = cplFvFeHmR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gZ, gWp, gWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgZcHm(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, VWp, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = -cplhhHmVWp(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, conj[Hm], VWp}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = -cplhhHmVWp(i1,gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VWp, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, conj[Hm], conj[Hm]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(i1,i2,gt1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, VWp, VWp}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVZ(i2,gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(i1,i2,gt1)
coup1R = cplcFdFucHmR(i1,i2,gt1)
coup2L = cplcFuFdHmL(i3,i1,gt2)
coup2R = cplcFuFdHmR(i3,i1,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gZ], bar[gWpC], bar[gWpC]}
ML1 = MVZ 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgZgWCcHm(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, VWp}
ML1 = MAh 
ML2 = MVWp 
coup1 = -cplAhcHmcVWp(gt1)
coup2 = cplAhHmVPVWp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, VWp}
ML1 = MetI 
ML2 = MVWp 
coup1 = -cpletIcHmcVWp(gt1)
coup2 = cpletIHmVPVWp1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = -cplhhcHmcVWp(i1,gt1)
coup2 = cplhhHmVPVWp1(i1,gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplHmcHmVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = -cplHmcHmVZ(i1,gt1)
coup2 = cplHmcHmVPVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Ah, VWp}
ML1 = MAh 
ML2 = MVWp 
coup1 = cplAhcHmcVWpVP1(gt1)
coup2 = -cplAhHmVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 



! {etI, VWp}
ML1 = MetI 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(gt1)
coup2 = -cpletIHmVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 



! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(i1,gt1)
coup2 = -cplhhHmVWp(i1,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplHmcHmVPVP1(i1,gt1)
coup2 = cplHmcHmVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cplHmcHmVPVZ1(i1,gt1)
coup2 = cplHmcHmVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_HmToHmVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVP(MAh,MetI,MFd,MFe,MFu,             & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,         & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,cplcFdFdVPR,cplFvFeHmL,cplFvFeHmR,cplcFeFeVPL,     & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcgZgWpHm,cplcgWpgWpVP,cplcgWCgWCVP,cplcgZgWCcHm,cplcgWCgZHm,           & 
& cplcgWpgZcHm,cplhhHmVWp,cplhhHmcHm,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,      & 
& cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcHmcVWpVZ,cplAhHmVPVWp1,cplAhcHmcVWpVP1,       & 
& cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,cplHmcHmVPVP1,           & 
& cplHmcHmVPVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cpletIHmVWp(3),cpletIHmcHm(3,3),        & 
& cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVPL(3,3),               & 
& cplcFdFdVPR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),& 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcgZgWpHm(3),cplcgWpgWpVP,cplcgWCgWCVP,      & 
& cplcgZgWCcHm(3),cplcgWCgZHm(3),cplcgWpgZcHm(3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),      & 
& cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),         & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplcHmcVWpVZ(3),cplAhHmVPVWp1(3),cplAhcHmcVWpVP1(3),      & 
& cpletIHmVPVWp1(3),cpletIcHmcVWpVP1(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3),         & 
& cplHmcHmVPVP1(3,3),cplHmcHmVPVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MHm(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVP 


! {VP, VWp, VWp}
ML1 = MVP 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VP, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcHmcVWpVP(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VP, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVP 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplcHmcVWpVP(gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmVPVWp(i3)
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VP, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplHmcHmVP(i2,gt1)
coup2 = cplHmcHmVP(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = -cplHmcHmVP(i1,gt1)
coup2 = cplHmcHmVPVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplHmcHmVPVP1(i1,gt1)
coup2 = cplHmcHmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_HmToHmVP



End Module OneLoopDecay_Hm_radinuZeeHB
