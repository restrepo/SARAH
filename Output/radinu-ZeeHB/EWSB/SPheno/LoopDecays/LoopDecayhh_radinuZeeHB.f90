! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_hh_radinuZeeHB
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

Subroutine Amplitude_Tree_radinuZeeHB_hhToAhAh(cplAhAhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),MAh2,Mhh2(2)

Complex(dp), Intent(in) :: cplAhAhhh(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhAhhh(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToAhAh


Subroutine Gamma_Real_radinuZeeHB_hhToAhAh(MLambda,em,gs,cplAhAhhh,MAh,               & 
& Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhhh(2)

Real(dp), Intent(in) :: MAh,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplAhAhhh(i1)
Mex1 = Mhh(i1)
Mex2 = MAh
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToAhAh


Subroutine Amplitude_WAVE_radinuZeeHB_hhToAhAh(cplAhAhhh,ctcplAhAhhh,MAh,             & 
& MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhAhhh(2)

Complex(dp), Intent(in) :: ctcplAhAhhh(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhhh(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhAhhh(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhhh(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhhh(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToAhAh


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToAhAh(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,cplAhAhetI,      & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,      & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,      & 
& cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplAhAhAhAh1,      & 
& cplAhAhAhetI1,cplAhAhAhhh1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhhhh1,cplAhAhHmcHm1,    & 
& cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cplAhhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),   & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplAhAhAhAh1,         & 
& cplAhAhAhetI1,cplAhAhAhhh1(2),cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhhhh1(2,2),       & 
& cplAhAhHmcHm1(3,3),cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),  & 
& cplAhhhhhhh1(2,2,2),cplAhhhHmcHm1(2,3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAh
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhAh
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhAh
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplAhcHmcVWp(i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplAhcHmcVWp(i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = -cplAhcHmcVWp(i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplAhHmVWp(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cplAhHmVWp(i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplAhHmVWp(i3)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAhAh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhAhetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhAhhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhAhetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhAhetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhAhHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhAhcVWpVWp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToAhAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToAhAh(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,cplAhAhetIetI1,cplAhAhetIhh1,     & 
& cplAhAhhhhh1,cplAhAhHmcHm1,cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhetIetIhh1,cplAhetIhhhh1,  & 
& cplAhhhhhhh1,cplAhhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),   & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplAhAhAhAh1,         & 
& cplAhAhAhetI1,cplAhAhAhhh1(2),cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhhhh1(2,2),       & 
& cplAhAhHmcHm1(3,3),cplAhAhcVWpVWp1,cplAhAhVZVZ1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),  & 
& cplAhhhhhhh1(2,2,2),cplAhhhHmcHm1(2,3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MAh 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToAhAh


Subroutine Amplitude_Tree_radinuZeeHB_hhToetIAh(cplAhetIhh,MAh,MetI,Mhh,              & 
& MAh2,MetI2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,Mhh(2),MAh2,MetI2,Mhh2(2)

Complex(dp), Intent(in) :: cplAhetIhh(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhetIhh(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToetIAh


Subroutine Gamma_Real_radinuZeeHB_hhToetIAh(MLambda,em,gs,cplAhetIhh,MAh,             & 
& MetI,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhetIhh(2)

Real(dp), Intent(in) :: MAh,MetI,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplAhetIhh(i1)
Mex1 = Mhh(i1)
Mex2 = MetI
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToetIAh


Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIAh(cplAhetIhh,ctcplAhetIhh,              & 
& MAh,MAh2,MetI,MetI2,Mhh,Mhh2,ZfAh,ZfetI,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhetIhh(2)

Complex(dp), Intent(in) :: ctcplAhetIhh(2)

Complex(dp), Intent(in) :: ZfAh,ZfetI,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhetIhh(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhetIhh(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cplAhetIhh(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhetIhh(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIAh


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIAh(MAh,MetI,MFd,MFe,MFu,               & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhAhetI1,cplAhAhAhhh1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhhhh1,     & 
& cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhetIHmcHm1,cplAhhhhhhh1,              & 
& cplAhhhHmcHm1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),    & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplAhAhAhetI1,cplAhAhAhhh1(2),          & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhhhh1(2,2),cplAhetIetIetI1,cplAhetIetIhh1(2),   & 
& cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3),cplAhhhhhhh1(2,2,2),cplAhhhHmcHm1(2,3,3),       & 
& cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdetIL(i1,i3)
coup2R = cplcFdFdetIR(i1,i3)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeetIL(i1,i3)
coup2R = cplcFeFeetIR(i1,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuetIL(i1,i3)
coup2R = cplcFuFuetIR(i1,i3)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIetIhh(i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cpletIhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cpletIcHmcVWp(i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cpletIcHmcVWp(i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = -cpletIcHmcVWp(i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = -cpletIhhVZ(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = -cpletIhhVZ(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cpletIhhVZ(i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cpletIHmVWp(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cpletIHmVWp(i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cpletIHmVWp(i3)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAhetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhetIhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhetIHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt1,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt1,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt1,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIAh(MAh,MetI,MFd,MFe,MFu,            & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplAhAhAhetI1,cplAhAhAhhh1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhhhh1,     & 
& cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhetIHmcHm1,cplAhhhhhhh1,              & 
& cplAhhhHmcHm1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),    & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplAhAhAhetI1,cplAhAhAhhh1(2),          & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhhhh1(2,2),cplAhetIetIetI1,cplAhetIetIhh1(2),   & 
& cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3),cplAhhhhhhh1(2,2,2),cplAhhhHmcHm1(2,3,3),       & 
& cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MAh 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIAh


Subroutine Amplitude_Tree_radinuZeeHB_hhTohhAh(cplAhhhhh,MAh,Mhh,MAh2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),MAh2,Mhh2(2)

Complex(dp), Intent(in) :: cplAhhhhh(2,2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhhhhh(gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTohhAh


Subroutine Gamma_Real_radinuZeeHB_hhTohhAh(MLambda,em,gs,cplAhhhhh,MAh,               & 
& Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhhh(2,2)

Real(dp), Intent(in) :: MAh,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=1,2
Coup = cplAhhhhh(i1,i2)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2) = 0._dp 
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTohhAh


Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhAh(cplAhhhhh,ctcplAhhhhh,MAh,             & 
& MAh2,Mhh,Mhh2,ZfAh,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplAhhhhh(2,2)

Complex(dp), Intent(in) :: ctcplAhhhhh(2,2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhhh(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhhh(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhhhhh(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhhhhh(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhAh


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhAh(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,cplAhAhetI,      & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,      & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,      & 
& cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplAhAhAhhh1,cplAhAhetIhh1,  & 
& cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,cplAhhhHmcHm1,cpletIetIhhhh1,   & 
& cpletIhhhhhh1,cplhhhhhhhh1,cplhhhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),   & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplAhAhAhhh1(2),cplAhAhetIhh1(2),  & 
& cplAhAhhhhh1(2,2),cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhhhhhhh1(2,2,2),            & 
& cplAhhhHmcHm1(2,3,3),cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cplhhhhhhhh1(2,2,2,2),   & 
& cplhhhhHmcHm1(2,2,3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhh(gt2,i3)
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


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhhh(gt2,i3)
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


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, VZ}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdAhL(i3,i2)
coup3R = cplcFdFdAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuAhL(i3,i2)
coup3R = cplcFuFuAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
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


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhh(gt2,i1)
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


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhcHmcVWp(gt2,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = -cplhhcHmcVWp(gt2,i3)
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


! {VZ, Ah, Ah}
ML1 = MVZ 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, etI, Ah}
ML1 = MVZ 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, Ah, etI}
ML1 = MVZ 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, etI, etI}
ML1 = MVZ 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplhhHmVWp(gt2,i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhAhhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhhhh1(gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhhhHmcHm1(gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhhh1(gt1)
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhhhhh1(gt1,i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cpletIetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cpletIhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhhhhhhh1(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplAhhhHmcHm1(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt2)
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
coup1 = cplAhetIhhhh1(gt1,gt2)
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
coup1 = cplAhhhhhhh1(gt1,gt2,i2)
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
coup1 = cpletIetIhhhh1(gt1,gt2)
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
coup1 = cpletIhhhhhh1(gt1,gt2,i2)
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
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
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
coup1 = cplhhhhHmcHm1(gt1,gt2,i1,i2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhAh(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,   & 
& cplAhAhAhhh1,cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,     & 
& cplAhhhHmcHm1,cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,cplhhhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),           & 
& cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),   & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplAhAhAhhh1(2),cplAhAhetIhh1(2),  & 
& cplAhAhhhhh1(2,2),cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhhhhhhh1(2,2,2),            & 
& cplAhhhHmcHm1(2,3,3),cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cplhhhhhhhh1(2,2,2,2),   & 
& cplhhhhHmcHm1(2,2,3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhAh


Subroutine Amplitude_Tree_radinuZeeHB_hhToAhVZ(cplAhhhVZ,MAh,Mhh,MVZ,MAh2,            & 
& Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,Mhh(2),MVZ,MAh2,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cplAhhhVZ(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToAhVZ


Subroutine Gamma_Real_radinuZeeHB_hhToAhVZ(MLambda,em,gs,cplAhhhVZ,MAh,               & 
& Mhh,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Real(dp), Intent(in) :: MAh,Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplAhhhVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MAh
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToAhVZ


Subroutine Amplitude_WAVE_radinuZeeHB_hhToAhVZ(cplAhhhVZ,ctcplAhhhVZ,MAh,             & 
& MAh2,Mhh,Mhh2,MVZ,MVZ2,ZfAh,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Complex(dp), Intent(in) :: ctcplAhhhVZ(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhhhVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplAhhhVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhhhVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplAhhhVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToAhVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToAhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,cplAhAhetI,      & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,      & 
& cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,      & 
& cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,     & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,             & 
& cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh(2),cplcgWpgWpVZ,     & 
& cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),       & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhVZVZ1,cplAhHmVWpVZ1(3),cplAhcHmcVWpVZ1(3),         & 
& cplhhhhVZVZ1(2,2),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVZ1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhAh
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhhh(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhAhhh(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
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


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplAhHmVWp(i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplAhHmVWp(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {Ah, VZ}
ML1 = MAh 
ML2 = MVZ 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplAhcHmcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
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
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cplAhcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,i1)
coup2 = cplAhHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToAhVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToAhVZ(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIhh,cpletIhhhh,cpletIhhVZ,        & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ,cplAhAhVZVZ1,cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cplhhhhVZVZ1,cplhhHmVWpVZ1,    & 
& cplhhcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),       & 
& cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh(2),cplcgWpgWpVZ,     & 
& cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),       & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhVZVZ1,cplAhHmVWpVZ1(3),cplAhcHmcVWpVZ1(3),         & 
& cplhhhhVZVZ1(2,2),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVZ1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToAhVZ


Subroutine Amplitude_Tree_radinuZeeHB_hhToetIetI(cpletIetIhh,MetI,Mhh,MetI2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,Mhh(2),MetI2,Mhh2(2)

Complex(dp), Intent(in) :: cpletIetIhh(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1 = cpletIetIhh(gt1)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToetIetI


Subroutine Gamma_Real_radinuZeeHB_hhToetIetI(MLambda,em,gs,cpletIetIhh,               & 
& MetI,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIetIhh(2)

Real(dp), Intent(in) :: MetI,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cpletIetIhh(i1)
Mex1 = Mhh(i1)
Mex2 = MetI
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
  GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToetIetI


Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIetI(cpletIetIhh,ctcpletIetIhh,           & 
& MetI,MetI2,Mhh,Mhh2,ZfetI,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cpletIetIhh(2)

Complex(dp), Intent(in) :: ctcpletIetIhh(2)

Complex(dp), Intent(in) :: ZfetI,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIetIhh(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cpletIetIhh(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIhh(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIhh(gt1)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIetI


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIetI(MAh,MetI,MFd,MFe,MFu,              & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,         & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,    & 
& cplhhVZVZ,cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,    & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),& 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhetIetIetI1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),  & 
& cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIetIHmcHm1(3,3),          & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MetI 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhh(i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIetI
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIetI
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhh(i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdetIL(i1,i3)
coup2R = cplcFdFdetIR(i1,i3)
coup3L = cplcFdFdetIL(i3,i2)
coup3R = cplcFdFdetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeetIL(i1,i3)
coup2R = cplcFeFeetIR(i1,i3)
coup3L = cplcFeFeetIL(i3,i2)
coup3R = cplcFeFeetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuetIL(i1,i3)
coup2R = cplcFuFuetIR(i1,i3)
coup3L = cplcFuFuetIL(i3,i2)
coup3R = cplcFuFuetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIetIhh(i1)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIetIhh(i1)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhh(i1,i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cpletIhhVZ(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cpletIcHmcVWp(i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cpletIcHmcVWp(i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = -cpletIcHmcVWp(i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = -cpletIhhVZ(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = -cpletIhhVZ(i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = -cpletIhhVZ(i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cpletIHmVWp(i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cpletIHmVWp(i3)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cpletIHmVWp(i3)
coup3 = cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIetIhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIetIHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cpletIetIcVWpVWp1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cpletIetIVZVZ1
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt1)
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt1,i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt1,i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt1,i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt1)
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt1,i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt1,i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt1,i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1) = Amp(gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI(MAh,MetI,MFd,MFe,               & 
& MFu,Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,        & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,         & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,    & 
& cplhhVZVZ,cplhhcHmcVWp,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,    & 
& cplAhetIhhhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,cpletIetIHmcHm1,         & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1,cpletIhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),& 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhetIetIetI1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),  & 
& cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIetIHmcHm1(3,3),          & 
& cpletIetIcVWpVWp1,cpletIetIVZVZ1,cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MetI 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIetI


Subroutine Amplitude_Tree_radinuZeeHB_hhTohhetI(cpletIhhhh,MetI,Mhh,MetI2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,Mhh(2),MetI2,Mhh2(2)

Complex(dp), Intent(in) :: cpletIhhhh(2,2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1 = cpletIhhhh(gt1,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTohhetI


Subroutine Gamma_Real_radinuZeeHB_hhTohhetI(MLambda,em,gs,cpletIhhhh,MetI,            & 
& Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIhhhh(2,2)

Real(dp), Intent(in) :: MetI,Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2), GammarealGluon(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=1,2
Coup = cpletIhhhh(i1,i2)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2) = 0._dp 
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTohhetI


Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhetI(cpletIhhhh,ctcpletIhhhh,              & 
& MetI,MetI2,Mhh,Mhh2,ZfetI,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cpletIhhhh(2,2)

Complex(dp), Intent(in) :: ctcpletIhhhh(2,2)

Complex(dp), Intent(in) :: ZfetI,Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIhhhh(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cpletIhhhh(i1,gt2)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cpletIhhhh(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIhhhh(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhetI


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhetI(MAh,MetI,MFd,MFe,MFu,               & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,         & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,    & 
& cplhhcHmcVWp,cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,     & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,              & 
& cplhhhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),& 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplAhAhetIhh1(2),  & 
& cplAhAhhhhh1(2,2),cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhhhhhhh1(2,2,2),            & 
& cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3),     & 
& cplhhhhhhhh1(2,2,2,2),cplhhhhHmcHm1(2,2,3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MetI 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhh(gt2,i3)
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


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhhh(gt2,i3)
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


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, VZ}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdetIL(i3,i2)
coup3R = cplcFdFdetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFeetIL(i3,i2)
coup3R = cplcFeFeetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuetIL(i3,i2)
coup3R = cplcFuFuetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
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


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhh(gt2,i1)
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


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhcHmcVWp(gt2,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = -cplhhcHmcVWp(gt2,i3)
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


! {VZ, Ah, Ah}
ML1 = MVZ 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, etI, Ah}
ML1 = MVZ 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, Ah, etI}
ML1 = MVZ 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, etI, etI}
ML1 = MVZ 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplhhHmVWp(gt2,i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhhhh1(gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIhhHmcHm1(gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt1)
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt1)
coup2 = cplAhetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt1,i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt1)
coup2 = cpletIetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt1,i2)
coup2 = cpletIhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cpletIhhhhhh1(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cpletIhhHmcHm1(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2) = Amp(gt1, gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt2)
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
coup1 = cplAhetIhhhh1(gt1,gt2)
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
coup1 = cplAhhhhhhh1(gt1,gt2,i2)
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
coup1 = cpletIetIhhhh1(gt1,gt2)
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
coup1 = cpletIhhhhhh1(gt1,gt2,i2)
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
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
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
coup1 = cplhhhhHmcHm1(gt1,gt2,i1,i2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI(MAh,MetI,MFd,MFe,MFu,            & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,         & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,    & 
& cplhhcHmcVWp,cplAhAhetIhh1,cplAhAhhhhh1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhhhhhhh1,     & 
& cpletIetIetIhh1,cpletIetIhhhh1,cpletIhhhhhh1,cpletIhhHmcHm1,cplhhhhhhhh1,              & 
& cplhhhhHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplhhhhhh(2,2,2),& 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplAhAhetIhh1(2),  & 
& cplAhAhhhhh1(2,2),cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhhhhhhh1(2,2,2),            & 
& cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cpletIhhHmcHm1(2,3,3),     & 
& cplhhhhhhhh1(2,2,2,2),cplhhhhHmcHm1(2,2,3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MetI 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhetI


Subroutine Amplitude_Tree_radinuZeeHB_hhToetIVZ(cpletIhhVZ,MetI,Mhh,MVZ,              & 
& MetI2,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,Mhh(2),MVZ,MetI2,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cpletIhhVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = -cpletIhhVZ(gt1)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToetIVZ


Subroutine Gamma_Real_radinuZeeHB_hhToetIVZ(MLambda,em,gs,cpletIhhVZ,MetI,            & 
& Mhh,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIhhVZ(2)

Real(dp), Intent(in) :: MetI,Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cpletIhhVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MetI
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1) = 0._dp 
 GammarealGluon(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToetIVZ


Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIVZ(cpletIhhVZ,ctcpletIhhVZ,              & 
& MetI,MetI2,Mhh,Mhh2,MVZ,MVZ2,ZfetI,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cpletIhhVZ(2)

Complex(dp), Intent(in) :: ctcpletIhhVZ(2)

Complex(dp), Intent(in) :: ZfetI,Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIhhVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cpletIhhVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIhhVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cpletIhhVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,-ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIVZ(MAh,MetI,MFd,MFe,MFu,               & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,         & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,              & 
& cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),            & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cpletIetIVZVZ1,             & 
& cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhhhVZVZ1(2,2),cplhhHmVWpVZ1(2,3),            & 
& cplhhcHmcVWpVZ1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhetI
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhetIhh(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIetI
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIetIhh(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdetIL(i1,i3)
coup2R = cplcFdFdetIR(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeetIL(i1,i3)
coup2R = cplcFeFeetIR(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuetIL(i1,i3)
coup2R = cplcFuFuetIR(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIetIhh(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
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


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cpletIHmVWp(i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cpletIHmVWp(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {etI, VZ}
ML1 = MetI 
ML2 = MVZ 
coup1 = -cpletIhhVZ(gt1)
coup2 = cpletIetIVZVZ1
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cpletIcHmcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
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
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cpletIcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,i1)
coup2 = cpletIHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ(MAh,MetI,MFd,MFe,MFu,            & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,         & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,             & 
& cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,             & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,       & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIetIVZVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,              & 
& cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),     & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,     & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),        & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),            & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cpletIetIVZVZ1,             & 
& cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhhhVZVZ1(2,2),cplhhHmVWpVZ1(2,3),            & 
& cplhhcHmcVWpVZ1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVZ


Subroutine Amplitude_Tree_radinuZeeHB_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,              & 
& MFd,Mhh,MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),Mhh(2),MFd2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Complex(dp) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt2,gt3,gt1)
coupT1R = cplcFdFdhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTocFdFd


Subroutine Gamma_Real_radinuZeeHB_hhTocFdFd(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,    & 
& MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Real(dp), Intent(in) :: MFd(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFdhhL(i2,i3,i1)
CoupR = cplcFdFdhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFd(i2)
Mex3 = MFd(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTocFdFd


Subroutine Amplitude_WAVE_radinuZeeHB_hhTocFdFd(cplcFdFdhhL,cplcFdFdhhR,              & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFdFdhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFdFdhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt2)*cplcFdFdhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt2))*cplcFdFdhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt3)*cplcFdFdhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt3))*cplcFdFdhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTocFdFd


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocFdFd(MAh,MetI,MFd,MFu,Mhh,               & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhhh,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,          & 
& cplcFdFdetIL,cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhhh(2,2),          & 
& cplAhhhVZ(2),cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),             & 
& cplcFuFuhhR(3,3,2),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),            & 
& cplcFdFucHmR(3,3,3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, Ah, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhAhhh(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = cplAhetIhh(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdetIL(i3,gt3)
coup3R = cplcFdFdetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFdFdAhL(gt2,i3)
coup2R = cplcFdFdAhR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, Fd}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhetIhh(gt1)
coup2L = cplcFdFdetIL(gt2,i3)
coup2R = cplcFdFdetIR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Fd}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = cpletIetIhh(gt1)
coup2L = cplcFdFdetIL(gt2,i3)
coup2R = cplcFdFdetIR(gt2,i3)
coup3L = cplcFdFdetIL(i3,gt3)
coup3R = cplcFdFdetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2L = cplcFdFdetIL(gt2,i3)
coup2R = cplcFdFdetIR(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, Fd}
    Do i3=1,3
ML1 = MetI 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2L = cplcFdFdetIL(gt2,i3)
coup2R = cplcFdFdetIR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {hh, Ah, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdetIL(i3,gt3)
coup3R = cplcFdFdetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fd}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
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


! {Hm, Hm, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFu(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFdHmL(i3,gt3,i2)
coup3R = cplcFuFdHmR(i3,gt3,i2)
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


! {Hm, conj[VWp], Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2L = cplcFdFucHmL(gt2,i3,i1)
coup2R = cplcFdFucHmR(gt2,i3,i1)
coup3L = cplcFuFdcVWpL(i3,gt3)
coup3R = cplcFuFdcVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, Ah, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdAhL(i3,gt3)
coup3R = cplcFdFdAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdetIL(i3,gt3)
coup3R = cplcFdFdetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Fd}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {bar[Fd], bar[Fd], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdAhL(gt2,i1)
coup2R = cplcFdFdAhR(gt2,i1)
coup3L = cplcFdFdAhL(i2,gt3)
coup3R = cplcFdFdAhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MetI 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdetIL(gt2,i1)
coup2R = cplcFdFdetIR(gt2,i1)
coup3L = cplcFdFdetIL(i2,gt3)
coup3R = cplcFdFdetIR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdhhL(gt2,i1,i3)
coup2R = cplcFdFdhhR(gt2,i1,i3)
coup3L = cplcFdFdhhL(i2,gt3,i3)
coup3R = cplcFdFdhhR(i2,gt3,i3)
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


! {bar[Fd], bar[Fd], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVZL(gt2,i1)
coup2R = cplcFdFdVZR(gt2,i1)
coup3L = cplcFdFdVZL(i2,gt3)
coup3R = cplcFdFdVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVWp 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFuVWpL(gt2,i1)
coup2R = cplcFdFuVWpR(gt2,i1)
coup3L = cplcFuFdcVWpL(i2,gt3)
coup3R = cplcFuFdcVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFucHmL(gt2,i1,i3)
coup2R = cplcFdFucHmR(gt2,i1,i3)
coup3L = cplcFuFdHmL(i2,gt3,i3)
coup3R = cplcFuFdHmR(i2,gt3,i3)
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


! {conj[VWp], Hm, Fu}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFu(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFdHmL(i3,gt3,i2)
coup3R = cplcFuFdHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Fu}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplcFdFuVWpL(gt2,i3)
coup2R = cplcFdFuVWpR(gt2,i3)
coup3L = cplcFuFdcVWpL(i3,gt3)
coup3R = cplcFuFdcVWpR(i3,gt3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocFdFd


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd(MAh,MetI,MFd,MFu,Mhh,            & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhhh,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,          & 
& cplcFdFdetIL,cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhhh(2,2),          & 
& cplAhhhVZ(2),cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),             & 
& cplcFuFuhhR(3,3,2),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),            & 
& cplcFdFucHmR(3,3,3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {bar[Fd], bar[Fd], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocFdFd


Subroutine Amplitude_Tree_radinuZeeHB_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,              & 
& MFe,Mhh,MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(2),MFe2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt2,gt3,gt1)
coupT1R = cplcFeFehhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTocFeFe


Subroutine Gamma_Real_radinuZeeHB_hhTocFeFe(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,    & 
& MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Real(dp), Intent(in) :: MFe(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFehhL(i2,i3,i1)
CoupR = cplcFeFehhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFe(i2)
Mex3 = MFe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTocFeFe


Subroutine Amplitude_WAVE_radinuZeeHB_hhTocFeFe(cplcFeFehhL,cplcFeFehhR,              & 
& ctcplcFeFehhL,ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFeFehhL(3,3,2),ctcplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFeFehhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFeFehhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt2)*cplcFeFehhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt2))*cplcFeFehhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt3)*cplcFeFehhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt3))*cplcFeFehhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTocFeFe


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocFeFe(MAh,MetI,MFe,MFv,Mhh,               & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,             & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,       & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhhh(2,2),          & 
& cplAhhhVZ(2),cpletIetIhh(2),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, Ah, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhAhhh(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = cplAhetIhh(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFeetIL(i3,gt3)
coup3R = cplcFeFeetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFeFeAhL(gt2,i3)
coup2R = cplcFeFeAhR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, Fe}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhetIhh(gt1)
coup2L = cplcFeFeetIL(gt2,i3)
coup2R = cplcFeFeetIR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Fe}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = cpletIetIhh(gt1)
coup2L = cplcFeFeetIL(gt2,i3)
coup2R = cplcFeFeetIR(gt2,i3)
coup3L = cplcFeFeetIL(i3,gt3)
coup3R = cplcFeFeetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2L = cplcFeFeetIL(gt2,i3)
coup2R = cplcFeFeetIR(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, Fe}
    Do i3=1,3
ML1 = MetI 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2L = cplcFeFeetIL(gt2,i3)
coup2R = cplcFeFeetIR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {hh, Ah, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFeetIL(i3,gt3)
coup3R = cplcFeFeetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fe}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
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


! {Hm, Hm, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2L = cplcFeFvcHmL(gt2,i3,i1)
coup2R = cplcFeFvcHmR(gt2,i3,i1)
coup3L = cplFvFeHmL(i3,gt3,i2)
coup3R = cplFvFeHmR(i3,gt3,i2)
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


! {Hm, conj[VWp], Fv}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFv(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2L = cplcFeFvcHmL(gt2,i3,i1)
coup2R = cplcFeFvcHmR(gt2,i3,i1)
coup3L = cplFvFecVWpL(i3,gt3)
coup3R = cplFvFecVWpR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, Ah, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeAhL(i3,gt3)
coup3R = cplcFeFeAhR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeetIL(i3,gt3)
coup3R = cplcFeFeetIR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Fe}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {bar[Fe], bar[Fe], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeAhL(gt2,i1)
coup2R = cplcFeFeAhR(gt2,i1)
coup3L = cplcFeFeAhL(i2,gt3)
coup3R = cplcFeFeAhR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MetI 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeetIL(gt2,i1)
coup2R = cplcFeFeetIR(gt2,i1)
coup3L = cplcFeFeetIL(i2,gt3)
coup3R = cplcFeFeetIR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3L = cplcFeFehhL(i2,gt3,i3)
coup3R = cplcFeFehhR(i2,gt3,i3)
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


! {bar[Fe], bar[Fe], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVZL(gt2,i1)
coup2R = cplcFeFeVZR(gt2,i1)
coup3L = cplcFeFeVZL(i2,gt3)
coup3R = cplcFeFeVZR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWp], Hm, Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFv(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2L = cplcFeFvVWpL(gt2,i3)
coup2R = cplcFeFvVWpR(gt2,i3)
coup3L = cplFvFeHmL(i3,gt3,i2)
coup3R = cplFvFeHmR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Fv}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFv(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplcFeFvVWpL(gt2,i3)
coup2R = cplcFeFvVWpR(gt2,i3)
coup3L = cplFvFecVWpL(i3,gt3)
coup3R = cplFvFecVWpR(i3,gt3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocFeFe


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe(MAh,MetI,MFe,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,             & 
& cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,       & 
& cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,              & 
& cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhhh(2,2),          & 
& cplAhhhVZ(2),cpletIetIhh(2),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {bar[Fe], bar[Fe], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocFeFe


Subroutine Amplitude_Tree_radinuZeeHB_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,              & 
& MFu,Mhh,MFu2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),Mhh(2),MFu2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Complex(dp) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuhhL(gt2,gt3,gt1)
coupT1R = cplcFuFuhhR(gt2,gt3,gt1)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTocFuFu


Subroutine Gamma_Real_radinuZeeHB_hhTocFuFu(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,    & 
& MFu,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Real(dp), Intent(in) :: MFu(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFuFuhhL(i2,i3,i1)
CoupR = cplcFuFuhhR(i2,i3,i1)
Mex1 = Mhh(i1)
Mex2 = MFu(i2)
Mex3 = MFu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTocFuFu


Subroutine Amplitude_WAVE_radinuZeeHB_hhTocFuFu(cplcFuFuhhL,cplcFuFuhhR,              & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfUL(3,3),ZfUR(3,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuhhL(gt2,gt3,gt1) 
ZcoupT1R = ctcplcFuFuhhR(gt2,gt3,gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhL(gt2,gt3,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt1)*cplcFuFuhhR(gt2,gt3,i1)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt2)*cplcFuFuhhL(i1,gt3,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt2))*cplcFuFuhhR(i1,gt3,gt1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt3)*cplcFuFuhhL(gt2,i1,gt1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt3))*cplcFuFuhhR(gt2,i1,gt1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTocFuFu


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocFuFu(MAh,MetI,MFd,MFu,Mhh,               & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhhh,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,          & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,     & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),          & 
& cplAhhhVZ(2),cpletIetIhh(2),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3), & 
& cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),               & 
& cplcFdFucHmR(3,3,3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, Ah, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhAhhh(gt1)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
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


! {Ah, etI, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cplAhetIhh(gt1)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
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


! {Ah, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
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


! {Ah, VZ, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFuFuAhL(gt2,i3)
coup2R = cplcFuFuAhR(gt2,i3)
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


! {etI, Ah, Fu}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhetIhh(gt1)
coup2L = cplcFuFuetIL(gt2,i3)
coup2R = cplcFuFuetIR(gt2,i3)
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


! {etI, etI, Fu}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cpletIetIhh(gt1)
coup2L = cplcFuFuetIL(gt2,i3)
coup2R = cplcFuFuetIR(gt2,i3)
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


! {etI, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2L = cplcFuFuetIL(gt2,i3)
coup2R = cplcFuFuetIR(gt2,i3)
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


! {etI, VZ, Fu}
    Do i3=1,3
ML1 = MetI 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2L = cplcFuFuetIL(gt2,i3)
coup2R = cplcFuFuetIR(gt2,i3)
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


! {hh, Ah, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
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


! {hh, etI, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
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


! {hh, hh, Fu}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
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


! {VWp, VWp, Fd}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplcFuFdcVWpL(gt2,i3)
coup2R = cplcFuFdcVWpR(gt2,i3)
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


! {VWp, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhHmVWp(gt1,i2)
coup2L = cplcFuFdcVWpL(gt2,i3)
coup2R = cplcFuFdcVWpR(gt2,i3)
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


! {VZ, Ah, Fu}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
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


! {VZ, etI, Fu}
    Do i3=1,3
ML1 = MVZ 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
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


! {VZ, VZ, Fu}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
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


! {bar[Fd], bar[Fd], Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdHmL(gt2,i1,i3)
coup2R = cplcFuFdHmR(gt2,i1,i3)
coup3L = cplcFdFucHmL(i2,gt3,i3)
coup3R = cplcFdFucHmR(i2,gt3,i3)
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


! {bar[Fd], bar[Fd], conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcVWpL(gt2,i1)
coup2R = cplcFuFdcVWpR(gt2,i1)
coup3L = cplcFdFuVWpL(i2,gt3)
coup3R = cplcFdFuVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuAhL(gt2,i1)
coup2R = cplcFuFuAhR(gt2,i1)
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


! {bar[Fu], bar[Fu], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MetI 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuetIL(gt2,i1)
coup2R = cplcFuFuetIR(gt2,i1)
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


! {bar[Fu], bar[Fu], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuhhL(gt2,i1,i3)
coup2R = cplcFuFuhhR(gt2,i1,i3)
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


! {bar[Fu], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
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


! {bar[Fu], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
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


! {bar[Fu], bar[Fu], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVZL(gt2,i1)
coup2R = cplcFuFuVZR(gt2,i1)
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


! {conj[Hm], VWp, Fd}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2L = cplcFuFdHmL(gt2,i3,i1)
coup2R = cplcFuFdHmR(gt2,i3,i1)
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


! {conj[Hm], conj[Hm], Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2L = cplcFuFdHmL(gt2,i3,i1)
coup2R = cplcFuFdHmR(gt2,i3,i1)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocFuFu


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu(MAh,MetI,MFd,MFu,Mhh,            & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhhh,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,          & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,               & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,     & 
& cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),          & 
& cplAhhhVZ(2),cpletIetIhh(2),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3), & 
& cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),               & 
& cplcFdFucHmR(3,3,3),cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),& 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {bar[Fu], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocFuFu


Subroutine Amplitude_Tree_radinuZeeHB_hhTohhhh(cplhhhhhh,Mhh,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Complex(dp) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhhhhh(gt1,gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTohhhh


Subroutine Gamma_Real_radinuZeeHB_hhTohhhh(MLambda,em,gs,cplhhhhhh,Mhh,               & 
& GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Real(dp), Intent(in) :: Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,2,2), GammarealGluon(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
Coup = cplhhhhhh(i1,i2,i3)
Mex1 = Mhh(i1)
Mex2 = Mhh(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i1,i2,i3) = 0._dp 
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTohhhh


Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhhh(cplhhhhhh,ctcplhhhhhh,Mhh,             & 
& Mhh2,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplhhhhhh(2,2,2)

Complex(dp), Intent(in) :: ctcplhhhhhh(2,2,2)

Complex(dp), Intent(in) :: Zfhh(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhhhhh(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhhhhh(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplhhhhhh(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cplhhhhhh(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhhh


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhhh(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,cplcgWCgWChh,             & 
& cplcgZgZhh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,        & 
& cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIhhhh1,cpletIhhhhhh1,cplhhhhhhhh1,     & 
& cplhhhhHmcHm1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cpletIetIhh(2),cpletIhhhh(2,2),& 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),& 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplcgZgZhh(2),   & 
& cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),       & 
& cplhhcHmcVWp(2,3),cplAhAhhhhh1(2,2),cplAhetIhhhh1(2,2),cplAhhhhhhh1(2,2,2),            & 
& cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cplhhhhhhhh1(2,2,2,2),cplhhhhHmcHm1(2,2,3,3), & 
& cplhhhhcVWpVWp1(2,2),cplhhhhVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VZ, Ah}
ML1 = MAh 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhAhhh(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VZ, etI}
ML1 = MAh 
ML2 = MVZ 
ML3 = MetI 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhh(gt2,i3)
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


! {Ah, Ah, VZ}
ML1 = MAh 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, VZ}
ML1 = MAh 
ML2 = MetI 
ML3 = MVZ 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, VZ, VZ}
ML1 = MAh 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VZ, Ah}
ML1 = MetI 
ML2 = MVZ 
ML3 = MAh 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhetIhh(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VZ, etI}
ML1 = MetI 
ML2 = MVZ 
ML3 = MetI 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIetIhh(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhhh(gt2,i3)
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


! {etI, Ah, VZ}
ML1 = MetI 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, VZ}
ML1 = MetI 
ML2 = MetI 
ML3 = MVZ 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, VZ, VZ}
ML1 = MetI 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = cplcFdFdhhL(i3,i2,gt3)
coup3R = cplcFdFdhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = cplcFuFuhhL(i3,i2,gt3)
coup3R = cplcFuFuhhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {gZ, gZ, gZ}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgZhh(gt2)
coup3 = cplcgZgZhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
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


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhh(gt2,i1)
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


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplhhcHmcVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cplhhHmVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(2)*AmpC 


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhcHmcVWp(gt2,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = -cplhhcHmcVWp(gt2,i3)
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


! {VZ, Ah, Ah}
ML1 = MVZ 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, etI, Ah}
ML1 = MVZ 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIhhVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, Ah}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MAh 
coup1 = cplhhVZVZ(gt1)
coup2 = cplAhhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, Ah, etI}
ML1 = MVZ 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, etI, etI}
ML1 = MVZ 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, etI}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MetI 
coup1 = cplhhVZVZ(gt1)
coup2 = cpletIhhVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, Ah, VZ}
ML1 = MVZ 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhhhVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, etI, VZ}
ML1 = MVZ 
ML2 = MetI 
ML3 = MVZ 
coup1 = cpletIhhVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = -cplhhHmVWp(gt2,i1)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = -cplhhHmVWp(gt2,i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cplhhcHmcVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhHmVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhhhhh1(gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhhhhh1(gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhhhHmcHm1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhhhcVWpVWp1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhhhVZVZ1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt3)
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhhhh1(gt1,gt3)
coup2 = cplAhetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhhhh1(gt1,gt3,i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhhhh1(gt1,gt3)
coup2 = cpletIetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt1,gt3,i2)
coup2 = cpletIhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhhhhh1(gt1,gt3,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhHmcHm1(gt1,gt3,i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhcVWpVWp1(gt1,gt3)
coup2 = cplhhcVWpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,gt3)
coup2 = cplhhVZVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhhhh1(gt1,gt2)
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
coup1 = cplAhetIhhhh1(gt1,gt2)
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
coup1 = cplAhhhhhhh1(gt1,gt2,i2)
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
coup1 = cpletIetIhhhh1(gt1,gt2)
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
coup1 = cpletIhhhhhh1(gt1,gt2,i2)
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
coup1 = cplhhhhhhhh1(gt1,gt2,i1,i2)
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
coup1 = cplhhhhHmcHm1(gt1,gt2,i1,i2)
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
coup1 = cplhhhhcVWpVWp1(gt1,gt2)
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
coup1 = cplhhhhVZVZ1(gt1,gt2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhhh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,             & 
& cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcgWpgWphh,              & 
& cplcgWCgWChh,cplcgZgZhh,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,        & 
& cplhhcHmcVWp,cplAhAhhhhh1,cplAhetIhhhh1,cplAhhhhhhh1,cpletIetIhhhh1,cpletIhhhhhh1,     & 
& cplhhhhhhhh1,cplhhhhHmcHm1,cplhhhhcVWpVWp1,cplhhhhVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cpletIetIhh(2),cpletIhhhh(2,2),& 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),& 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcgWpgWphh(2),cplcgWCgWChh(2),cplcgZgZhh(2),   & 
& cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),       & 
& cplhhcHmcVWp(2,3),cplAhAhhhhh1(2,2),cplAhetIhhhh1(2,2),cplAhhhhhhh1(2,2,2),            & 
& cpletIetIhhhh1(2,2),cpletIhhhhhh1(2,2,2),cplhhhhhhhh1(2,2,2,2),cplhhhhHmcHm1(2,2,3,3), & 
& cplhhhhcVWpVWp1(2,2),cplhhhhVZVZ1(2,2)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
    Do gt3=1,2
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhhh


Subroutine Amplitude_Tree_radinuZeeHB_hhToHmVWp(cplhhHmVWp,Mhh,MHm,MVWp,              & 
& Mhh2,MHm2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHm(3),MVWp,Mhh2(2),MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplhhHmVWp(2,3)

Complex(dp) :: Amp(2,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cplhhHmVWp(gt1,gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToHmVWp


Subroutine Gamma_Real_radinuZeeHB_hhToHmVWp(MLambda,em,gs,cplhhHmVWp,Mhh,             & 
& MHm,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHmVWp(2,3)

Real(dp), Intent(in) :: Mhh(2),MHm(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3), GammarealGluon(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=2,3
Coup = cplhhHmVWp(i1,i2)
Mex1 = Mhh(i1)
Mex2 = MHm(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,1._dp,1._dp,Coup,Gammarealphoton(i1,i2),kont)
 GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToHmVWp


Subroutine Amplitude_WAVE_radinuZeeHB_hhToHmVWp(cplhhHmVWp,ctcplhhHmVWp,              & 
& Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,Zfhh,ZfHm,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhHmVWp(2,3)

Complex(dp), Intent(in) :: ctcplhhHmVWp(2,3)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHm(3,3),ZfVWp

Complex(dp), Intent(out) :: Amp(2,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHmVWp(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHmVWp(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cplhhHmVWp(gt1,i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhHmVWp(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToHmVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToHmVWp(MAh,MetI,MFd,MFe,MFu,               & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,            & 
& cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cplAhHmVWpVZ1,cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,              & 
& cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3), & 
& cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),          & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),             & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgZgAhh(2),cplcgWCgAHm(3),cplcgWpgWphh(2),      & 
& cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh(2),cplcgWCgZHm(3), & 
& cplcgWpgZVWp,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),       & 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),            & 
& cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcVWpVWpVZ,cplAhHmVWpVZ1(3),cpletIHmVWpVZ1(3),          & 
& cplhhhhcVWpVWp1(2,2),cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWp 


! {Ah, hh, VWp}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplAhhhhh(gt1,i2)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VZ, VWp}
ML1 = MAh 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplAhhhVZ(gt1)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
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


! {etI, hh, VWp}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIhhhh(gt1,i2)
coup2 = -cpletIHmVWp(gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VZ, VWp}
ML1 = MetI 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cpletIhhVZ(gt1)
coup2 = -cpletIHmVWp(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cpletIhhVZ(gt1)
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


! {Fu, Fu, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFdHmL(i1,i3,gt2)
coup2R = cplcFuFdHmR(i1,i3,gt2)
coup3L = -cplcFdFuVWpR(i3,i2)
coup3R = -cplcFdFuVWpL(i3,i2)
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


! {gWpC, gWpC, gP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgAHm(gt2)
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {gWpC, gWpC, gZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {gZ, gZ, gWp}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {hh, hh, VWp}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplhhHmVWp(i1,gt2)
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


! {hh, Ah, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, conj[Hm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
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


! {Hm, Hm, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, etI}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhHmVWp(i3,i2)
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


! {Hm, conj[VWp], hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplhhHmcHm(i3,gt2,i1)
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


! {Hm, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VZ, VZ, VWp}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {VZ, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhVZVZ(gt1)
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


! {bar[Fd], bar[Fd], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdHmL(i3,i1,gt2)
coup2R = cplcFuFdHmR(i3,i1,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
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


! {bar[Fe], bar[Fe], Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFeHmL(i3,i1,gt2)
coup2R = cplFvFeHmR(i3,i1,gt2)
coup3L = cplcFeFvVWpL(i2,i3)
coup3R = cplcFeFvVWpR(i2,i3)
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


! {bar[gWp], bar[gWp], bar[gZ]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gP], bar[gWpC]}
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gZ], bar[gWpC]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], Hm, Ah}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Hm, etI}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cpletIHmVWp(gt2)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Hm, hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = -cplhhHmVWp(i3,gt2)
coup3 = cplhhHmVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplhhHmVWp(i3,gt2)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplHmVPVWp(gt2)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], conj[VWp], VP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], Hm, VZ}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], conj[VWp], VZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmVWpVZ(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Ah, VZ}
ML1 = MAh 
ML2 = MVZ 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhHmVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {etI, VZ}
ML1 = MetI 
ML2 = MVZ 
coup1 = -cpletIhhVZ(gt1)
coup2 = cpletIHmVWpVZ1(gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplHmcHmcVWpVWp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,i1)
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
coup1 = cplhhHmVPVWp1(gt1,i1)
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
coup1 = cplhhHmVWpVZ1(gt1,i1)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToHmVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp(MAh,MetI,MFd,MFe,MFu,            & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cpletIetIhh,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,     & 
& cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgZgAhh,cplcgWCgAHm,            & 
& cplcgWpgWphh,cplcgZgWpHm,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,            & 
& cplcgWCgZHm,cplcgWpgZVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,       & 
& cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cplAhHmVWpVZ1,cpletIHmVWpVZ1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,              & 
& cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3), & 
& cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),          & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),             & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgZgAhh(2),cplcgWCgAHm(3),cplcgWpgWphh(2),      & 
& cplcgZgWpHm(3),cplcgWCgWChh(2),cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh(2),cplcgWCgZHm(3), & 
& cplcgWpgZVWp,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),       & 
& cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),            & 
& cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcVWpVWpVZ,cplAhHmVWpVZ1(3),cpletIHmVWpVZ1(3),          & 
& cplhhhhcVWpVWp1(2,2),cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MVWp 


! {Hm, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWp], Hm, VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplHmVPVWp(gt2)
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], conj[VWp], VP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmVPVWp(gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplHmcHmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToHmVWp


Subroutine Amplitude_Tree_radinuZeeHB_hhTocHmHm(cplhhHmcHm,Mhh,MHm,Mhh2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MHm(3),Mhh2(2),MHm2(3)

Complex(dp), Intent(in) :: cplhhHmcHm(2,3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1 = cplhhHmcHm(gt1,gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTocHmHm


Subroutine Gamma_Real_radinuZeeHB_hhTocHmHm(MLambda,em,gs,cplhhHmcHm,Mhh,             & 
& MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhHmcHm(2,3,3)

Real(dp), Intent(in) :: Mhh(2),MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2,3,3), GammarealGluon(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
  Do i2=2,3
    Do i3=2,3
Coup = cplhhHmcHm(i1,i3,i2)
Mex1 = Mhh(i1)
Mex2 = MHm(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTocHmHm


Subroutine Amplitude_WAVE_radinuZeeHB_hhTocHmHm(cplhhHmcHm,ctcplhhHmcHm,              & 
& Mhh,Mhh2,MHm,MHm2,Zfhh,ZfHm,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplhhHmcHm(2,3,3)

Complex(dp), Intent(in) :: ctcplhhHmcHm(2,3,3)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfHm(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhHmcHm(gt1,gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhHmcHm(i1,gt3,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt2))*cplhhHmcHm(gt1,gt3,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt3)*cplhhHmcHm(gt1,i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTocHmHm


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocHmHm(MAh,MetI,MFd,MFe,MFu,               & 
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

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 


! {Ah, Ah, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, Ah, conj[VWp]}
ML1 = MAh 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, conj[VWp]}
ML1 = MAh 
ML2 = MetI 
ML3 = MVWp 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, conj[VWp]}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, VZ, conj[VWp]}
ML1 = MAh 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhcHmcVWp(gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, Ah, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, conj[VWp]}
ML1 = MetI 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, conj[VWp]}
ML1 = MetI 
ML2 = MetI 
ML3 = MVWp 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, hh, conj[VWp]}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, VZ, conj[VWp]}
ML1 = MetI 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIcHmcVWp(gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFucHmL(i1,i3,gt2)
coup2R = cplcFdFucHmR(i1,i3,gt2)
coup3L = cplcFuFdHmL(i3,i2,gt3)
coup3R = cplcFuFdHmR(i3,i2,gt3)
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


! {Fe, Fe, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvcHmL(i1,i3,gt2)
coup2R = cplcFeFvcHmR(i1,i3,gt2)
coup3L = cplFvFeHmL(i3,i2,gt3)
coup3R = cplFvFeHmR(i3,i2,gt3)
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


! {gWp, gWp, gZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgZcHm(gt2)
coup3 = cplcgZgWpHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {gZ, gZ, gWpC}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWCcHm(gt2)
coup3 = cplcgWCgZHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {hh, Ah, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
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


! {hh, Ah, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MVWp 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, conj[VWp]}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp, Ah}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MAh 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VWp, conj[Hm], Ah}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplAhcHmcVWp(gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, etI}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MetI 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VWp, conj[Hm], etI}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cpletIcHmcVWp(gt2)
coup3 = cpletIHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHmcVWp(i3,gt2)
coup3 = -cplhhHmVWp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcHmcVWp(i3,gt2)
coup3 = cplhhHmcHm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWp, VWp, VP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHmcVWpVP(gt2)
coup3 = cplHmVPVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VWp, conj[Hm], VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplcHmcVWpVP(gt2)
coup3 = cplHmcHmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, VZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VWp, conj[Hm], VZ}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = cplHmcHmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, Ah, Hm}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, Hm}
    Do i3=1,3
ML1 = MVZ 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, Hm}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, Ah, conj[VWp]}
ML1 = MVZ 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhhhVZ(gt1)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, etI, conj[VWp]}
ML1 = MVZ 
ML2 = MetI 
ML3 = MVWp 
coup1 = cpletIhhVZ(gt1)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ, conj[VWp]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {bar[Fu], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i1,i2,gt1)
coup1R = cplcFuFuhhR(i1,i2,gt1)
coup2L = cplcFdFucHmL(i3,i1,gt2)
coup2R = cplcFdFucHmR(i3,i1,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
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


! {bar[gWpC], bar[gWpC], bar[gZ]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgZgWCcHm(gt2)
coup3 = cplcgWCgZHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gZ], bar[gWp]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWpgZcHm(gt2)
coup3 = cplcgZgWpHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[Hm], VWp, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MAh 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmcHm(i1,gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplAhHmcHm(i1,gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MetI 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmcHm(i1,gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cpletIHmcHm(i1,gt2)
coup3 = cpletIHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmcHm(i3,i1,gt2)
coup3 = -cplhhHmVWp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplhhHmcHm(i3,i1,gt2)
coup3 = cplhhHmcHm(i3,gt3,i2)
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


! {conj[Hm], VWp, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmVPVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcHmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplHmcHmVZ(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcHmVZ(i1,gt2)
coup3 = cplHmcHmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhetIHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhhhHmcHm1(i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIhhHmcHm1(i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhHmcHm1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmHmcHmcHm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmcHmcVWpVWp1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplHmcHmVZVZ1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, Hm}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,gt3,i2)
coup2 = cplAhHmcHm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, Hm}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt1,gt3,i2)
coup2 = cpletIHmcHm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, Hm}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cplhhhhHmcHm1(gt1,i1,gt3,i2)
coup2 = cplhhHmcHm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, conj[VWp]}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhHmVPVWp1(gt1,gt3)
coup2 = cplcHmcVWpVP(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWp, VZ}
ML1 = MVWp 
ML2 = MVZ 
coup1 = cplhhHmVWpVZ1(gt1,gt3)
coup2 = cplcHmcVWpVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhhhHmcHm1(gt1,i2,gt2)
coup2 = cplAhHmcHm(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cpletIhhHmcHm1(gt1,i2,gt2)
coup2 = cpletIHmcHm(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhhhHmcHm1(gt1,i1,i2,gt2)
coup2 = cplhhHmcHm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhcHmcVWpVP1(gt1,gt2)
coup2 = cplHmVPVWp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,gt2)
coup2 = cplHmVWpVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocHmHm


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm(MAh,MetI,MFd,MFe,MFu,            & 
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

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 


! {VWp, VWp, VP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHmcVWpVP(gt2)
coup3 = cplHmVPVWp(gt3)
Call Amp_VERTEX_StoSS_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 


! {VWp, conj[Hm], VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplcHmcVWpVP(gt2)
coup3 = cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], VWp, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmVPVWp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, conj[VWp]}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhHmVPVWp1(gt1,gt3)
coup2 = cplcHmcVWpVP(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 



! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,gt2)
coup2 = cplHmVPVWp(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt1, gt2, gt3) = Amp(gt1, gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocHmHm


Subroutine Amplitude_Tree_radinuZeeHB_hhTocVWpVWp(cplhhcVWpVWp,Mhh,MVWp,              & 
& Mhh2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVWp,Mhh2(2),MVWp2

Complex(dp), Intent(in) :: cplhhcVWpVWp(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cplhhcVWpVWp(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhTocVWpVWp


Subroutine Gamma_Real_radinuZeeHB_hhTocVWpVWp(MLambda,em,gs,cplhhcVWpVWp,             & 
& Mhh,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhcVWpVWp(2)

Real(dp), Intent(in) :: Mhh(2),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhcVWpVWp(i1)
Mex1 = Mhh(i1)
Mex2 = MVWp
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Call hardphotonSVV(Mex1,Mex2,Mex3,MLambda,em,0._dp,-1._dp,1._dp,Coup,Gammarealphoton(i1),kont)
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhTocVWpVWp


Subroutine Amplitude_WAVE_radinuZeeHB_hhTocVWpVWp(cplhhcVWpVWp,ctcplhhcVWpVWp,        & 
& Mhh,Mhh2,MVWp,MVWp2,Zfhh,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVWp,MVWp2

Complex(dp), Intent(in) :: cplhhcVWpVWp(2)

Complex(dp), Intent(in) :: ctcplhhcVWpVWp(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVWp

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhcVWpVWp(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhcVWpVWp(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfVWp)*cplhhcVWpVWp(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cplhhcVWpVWp(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTocVWpVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocVWpVWp(MAh,MetI,MFd,MFe,MFu,             & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
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
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhcHmcVWp(3), & 
& cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIcHmcVWp(3),          & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),           & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),             & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgZgAhh(2),cplcgWpgAVWp,cplcgWCgAcVWp,          & 
& cplcgWpgWphh(2),cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh(2),cplcgAgWCVWp,              & 
& cplcgZgWCVWp,cplcgZgZhh(2),cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),& 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),        & 
& cplHmVWpVZ(3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),               & 
& cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,cplhhhhcVWpVWp1(2,2),cplhhHmVPVWp1(2,3),             & 
& cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3),    & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,          & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 


! {Ah, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhcHmcVWp(i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhcHmcVWp(i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhcHmcVWp(i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, VZ, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cplAhhhVZ(gt1)
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


! {etI, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIcHmcVWp(i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIcHmcVWp(i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIcHmcVWp(i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, VZ, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cpletIhhVZ(gt1)
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


! {Fu, Fu, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFdcVWpR(i1,i3)
coup2R = -cplcFuFdcVWpL(i1,i3)
coup3L = -cplcFdFuVWpR(i3,i2)
coup3R = -cplcFdFuVWpL(i3,i2)
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


! {gP, gZ, gWp}
ML1 = MVP 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gWpC, gWpC, gP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgAcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gWpC, gWpC, gZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {gZ, gZ, gWp}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, hh, VWp}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcVWpVWp(i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhcHmcVWp(i1,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhcHmcVWp(i1,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, conj[Hm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhcHmcVWp(i1,i3)
coup3 = -cplhhHmVWp(i2,i3)
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


! {Hm, Hm, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplAhcHmcVWp(i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, etI}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cpletIcHmcVWp(i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplhhcHmcVWp(i3,i1)
coup3 = cplhhHmVWp(i3,i2)
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


! {Hm, conj[VWp], hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = -cplhhcHmcVWp(i3,i1)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmcVWpVZ(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplcHmcVWpVZ(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VZ, VZ, VWp}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWpVWpVZ
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VZ, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplcHmcVWpVZ(i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2 = cplcHmcVWpVZ(i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, conj[Hm]}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cplhhVZVZ(gt1)
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


! {bar[Fd], bar[Fd], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(i1,i2,gt1)
coup1R = cplcFdFdhhR(i1,i2,gt1)
coup2L = cplcFuFdcVWpL(i3,i1)
coup2R = cplcFuFdcVWpR(i3,i1)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
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


! {bar[Fe], bar[Fe], Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFecVWpL(i3,i1)
coup2R = cplFvFecVWpR(i3,i1)
coup3L = cplcFeFvVWpL(i2,i3)
coup3R = cplcFeFvVWpR(i2,i3)
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


! {bar[gWp], bar[gWp], bar[gP]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgAgWpcVWp
coup3 = cplcgWpgAVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gWp], bar[gWp], bar[gZ]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgZgWpcVWp
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gP], bar[gWpC]}
ML1 = MVZ 
ML2 = MVP 
ML3 = MVWp 
coup1 = cplcgZgAhh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {bar[gZ], bar[gZ], bar[gWpC]}
ML1 = MVZ 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cplcgZgZhh(gt1)
coup2 = cplcgWCgZcVWp
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[VWp], Hm, hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplhhcVWpVWp(i3)
coup3 = cplhhHmVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], hh}
    Do i3=1,2
ML1 = MVWp 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplcVWpVPVWp
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], conj[VWp], VP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {conj[VWp], Hm, VZ}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = -cplcVWpVWpVZ
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], conj[VWp], VZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhcVWpVWp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmcVWpVWp1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpcVWpVWpVWp1Q
coup2b = coup2 
coup2 = cplcVWpcVWpVWpVWp2Q
coup2a = coup2 
coup2 = cplcVWpcVWpVWpVWp3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cplhhVZVZ(gt1)
coup2 = cplcVWpVWpVZVZ1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,i1)
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
coup1 = cplhhHmVPVWp1(gt1,i1)
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
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {hh, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVWp 
coup1 = cplhhhhcVWpVWp1(gt1,i1)
coup2 = cplhhcVWpVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VP, Hm}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
coup1 = cplhhcHmcVWpVP1(gt1,i2)
coup2 = cplHmVPVWp(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do


! {VZ, Hm}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
coup1 = cplhhcHmcVWpVZ1(gt1,i2)
coup2 = cplHmVWpVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTocVWpVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp(MAh,MetI,MFd,MFe,              & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhcHmcVWp,           & 
& cpletIetIhh,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIcHmcVWp,cplcFdFdhhL,               & 
& cplcFdFdhhR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,            & 
& cplcFeFvVWpR,cplcgZgAhh,cplcgWpgAVWp,cplcgWCgAcVWp,cplcgWpgWphh,cplcgAgWpcVWp,         & 
& cplcgZgWpcVWp,cplcgWCgWChh,cplcgAgWCVWp,cplcgZgWCVWp,cplcgZgZhh,cplcgWpgZVWp,          & 
& cplcgWCgZcVWp,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,     & 
& cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,             & 
& cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,cplhhhhcVWpVWp1,cplhhHmVPVWp1,cplhhHmVWpVZ1,         & 
& cplhhcHmcVWpVP1,cplhhcHmcVWpVZ1,cplHmcHmcVWpVWp1,cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,& 
& cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhcHmcVWp(3), & 
& cpletIetIhh(2),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIcHmcVWp(3),          & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),           & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),             & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgZgAhh(2),cplcgWpgAVWp,cplcgWCgAcVWp,          & 
& cplcgWpgWphh(2),cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgWCgWChh(2),cplcgAgWCVWp,              & 
& cplcgZgWCVWp,cplcgZgZhh(2),cplcgWpgZVWp,cplcgWCgZcVWp,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),& 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),        & 
& cplHmVWpVZ(3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),               & 
& cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,cplhhhhcVWpVWp1(2,2),cplhhHmVPVWp1(2,3),             & 
& cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3),    & 
& cplcVWpcVWpVWpVWp1Q,cplcVWpcVWpVWpVWp2Q,cplcVWpcVWpVWpVWp3Q,cplcVWpVWpVZVZ2Q,          & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVWp 
Mex3 = MVWp 


! {Hm, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWp], Hm, VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplcVWpVPVWp
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], conj[VWp], VP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {VP, Hm}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
coup1 = cplhhcHmcVWpVP1(gt1,i2)
coup2 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoVV_Topology4_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTocVWpVWp


Subroutine Amplitude_Tree_radinuZeeHB_hhToVZVZ(cplhhVZVZ,Mhh,MVZ,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),MVZ,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cplhhVZVZ(gt1)
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_hhToVZVZ


Subroutine Gamma_Real_radinuZeeHB_hhToVZVZ(MLambda,em,gs,cplhhVZVZ,Mhh,               & 
& MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Real(dp), Intent(in) :: Mhh(2),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(2), GammarealGluon(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Do i1=1,2
Coup = cplhhVZVZ(i1)
Mex1 = Mhh(i1)
Mex2 = MVZ
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealGluon(i1) = 0._dp 
 Gammarealphoton(i1) = 0._dp 
Else 
  GammarealGluon(i1) = 0._dp 
  GammarealPhoton(i1) = 0._dp 

End if 
End Do
End Subroutine Gamma_Real_radinuZeeHB_hhToVZVZ


Subroutine Amplitude_WAVE_radinuZeeHB_hhToVZVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,             & 
& Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp), Intent(in) :: ctcplhhVZVZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplhhVZVZ(gt1) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt1)*cplhhVZVZ(i1)
End Do


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cplhhVZVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoVV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToVZVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVZVZ(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhVZ,cpletIetIhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,      & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,           & 
& cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,        & 
& cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1,         & 
& cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,cplcVWpVWpVZVZ3Q,         & 
& cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhVZ(2),cpletIetIhh(2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),& 
& cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh(2),cplcgWpgWpVZ,     & 
& cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),       & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1(2,2),            & 
& cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmVZVZ1(3,3),cplcVWpVWpVZVZ2Q,           & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplAhhhVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2 = cpletIhhVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVZR(i1,i3)
coup2R = -cplcFdFdVZL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVZR(i1,i3)
coup2R = -cplcFeFeVZL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVZR(i1,i3)
coup2R = -cplcFuFuVZL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVZ
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVZ
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cplAhhhVZ(i1)
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


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = -cpletIhhVZ(i1)
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


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhVZVZ(i1)
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


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplHmcHmVZ(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = -cplHmcHmVZ(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmcVWpVZ(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplcHmcVWpVZ(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = -cplcVWpVWpVZ
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmVWp(gt1,i2)
coup2 = -cplcVWpVWpVZ
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmVWp(gt1,i2)
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


! {VZ, Ah, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = -cplAhhhVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, etI, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VZ, VZ, hh}
    Do i3=1,2
ML1 = MVZ 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplhhVZVZ(gt1)
coup2 = cplhhVZVZ(i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplHmVWpVZ(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmVWpVZ(i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplHmcHmVZ(i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplHmVWpVZ(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmVWpVZ(i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplcVWpVWpVZ
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIetIVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplhhhhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVZVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVWpVZVZ1Q
coup2a = coup2 
coup2 = cplcVWpVWpVZVZ2Q
coup2b = coup2 
coup2 = cplcVWpVWpVZVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cplhhhhVZVZ1(gt1,i1)
coup2 = cplhhVZVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,i1)
coup2 = cplHmVWpVZ(i1)
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
coup1 = cplhhhhVZVZ1(gt1,i1)
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
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,i1)
coup2 = cplHmVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVZVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,             & 
& cplAhetIhh,cplAhhhVZ,cpletIetIhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,       & 
& cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,cplcgWCgWChh,            & 
& cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,      & 
& cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1,           & 
& cplhhhhVZVZ1,cplhhHmVWpVZ1,cplhhcHmcVWpVZ1,cplHmcHmVZVZ1,cplcVWpVWpVZVZ2Q,             & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhVZ(2),cpletIetIhh(2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),& 
& cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),               & 
& cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),               & 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWphh(2),cplcgWpgWpVZ,     & 
& cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),       & 
& cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),          & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhVZVZ1,cpletIetIVZVZ1,cplhhhhVZVZ1(2,2),            & 
& cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVZ1(2,3),cplHmcHmVZVZ1(3,3),cplcVWpVWpVZVZ2Q,           & 
& cplcVWpVWpVZVZ3Q,cplcVWpVWpVZVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVZ 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVZVZ


Subroutine Amplitude_WAVE_radinuZeeHB_hhToAhVP(cplAhhhVZ,ctcplAhhhVZ,MAh,             & 
& MAh2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfAh,Zfhh,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplAhhhVZ(2)

Complex(dp), Intent(in) :: ctcplAhhhVZ(2)

Complex(dp), Intent(in) :: ZfAh,Zfhh(2,2),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cplAhhhVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToAhVP


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToAhVP(MAh,MFd,MFe,MFu,Mhh,MHm,             & 
& MVP,MVWp,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,           & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,    & 
& cplcHmcVWpVP,cplAhHmVPVWp1,cplAhcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MAh2,MFd2(3),MFe2(3),MFu2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHmVWp(3),cplAhHmcHm(3,3),              & 
& cplAhcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),     & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplAhHmVPVWp1(3),cplAhcHmcVWpVP1(3),cplhhHmVPVWp1(2,3),   & 
& cplhhcHmcVWpVP1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdAhL(i1,i3)
coup2R = cplcFdFdAhR(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeAhL(i1,i3)
coup2R = cplcFeFeAhR(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuAhL(i1,i3)
coup2R = cplcFuFuAhR(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
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


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplAhcHmcVWp(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplAhHmVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplAhHmVWp(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplAhcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplAhHmVPVWp1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplAhcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,i1)
coup2 = cplAhHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToAhVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToAhVP(MAh,MFd,MFe,MFu,Mhh,              & 
& MHm,MVP,MVWp,MAh2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,cplcFdFdVPR,    & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,cplcgWCgWCVP,           & 
& cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,    & 
& cplcHmcVWpVP,cplAhHmVPVWp1,cplAhcHmcVWpVP1,cplhhHmVPVWp1,cplhhcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MAh2,MFd2(3),MFe2(3),MFu2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHmVWp(3),cplAhHmcHm(3,3),              & 
& cplAhcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),     & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplAhHmVPVWp1(3),cplAhcHmcVWpVP1(3),cplhhHmVPVWp1(2,3),   & 
& cplhhcHmcVWpVP1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MAh 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToAhVP


Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIVP(cpletIhhVZ,ctcpletIhhVZ,              & 
& MetI,MetI2,Mhh,Mhh2,MVP,MVP2,MVZ,MVZ2,ZfetI,Zfhh,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cpletIhhVZ(2)

Complex(dp), Intent(in) :: ctcpletIhhVZ(2)

Complex(dp), Intent(in) :: ZfetI,Zfhh(2,2),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cpletIhhVZ(gt1)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt1) = AmpC 
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToetIVP


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIVP(MetI,MFd,MFe,MFu,Mhh,               & 
& MHm,MVP,MVWp,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,      & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,             & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,    & 
& cplhhcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MetI2,MFd2(3),MFe2(3),               & 
& MFu2(3),Mhh2(2),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),        & 
& cplcgWCgWCVP,cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),      & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cpletIHmVPVWp1(3),          & 
& cpletIcHmcVWpVP1(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdetIL(i1,i3)
coup2R = cplcFdFdetIR(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFeetIL(i1,i3)
coup2R = cplcFeFeetIR(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuetIL(i1,i3)
coup2R = cplcFuFuetIR(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
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


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cpletIcHmcVWp(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cpletIHmVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cpletIHmVWp(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cpletIcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cpletIHmVPVWp1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cpletIcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,i1)
coup2 = cpletIHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToetIVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVP(MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVP,MVWp,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,      & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,             & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplhhHmVPVWp1,    & 
& cplhhcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MetI2,MFd2(3),MFe2(3),               & 
& MFu2(3),Mhh2(2),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),               & 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),        & 
& cplcgWCgWCVP,cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),      & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cpletIHmVPVWp1(3),          & 
& cpletIcHmcVWpVP1(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MetI 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToetIVP


Subroutine Amplitude_WAVE_radinuZeeHB_hhToFvFv(MFv,MFv2,Mhh,Mhh2,Zfhh,ZfVL,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(3),MFv2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVL(3,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
! Vanishing 
Amp(:,gt1, gt2, gt3) = 0._dp
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToFvFv


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToFvFv(MFe,MFv,Mhh,MHm,MVWp,MVZ,            & 
& MFe2,MFv2,Mhh2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,        & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),Mhh(2),MHm(3),MVWp,MVZ,MFe2(3),MFv2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),& 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 


! {Fe, Fe, VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
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


! {Fe, Fe, conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Hm, Hm, bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
coup3L = cplFvFeHmL(gt3,i3,i2)
coup3R = cplFvFeHmR(gt3,i3,i2)
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


! {Hm, conj[VWp], bar[Fe]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
coup3L = -cplFvFecVWpR(gt3,i3)
coup3R = -cplFvFecVWpL(gt3,i3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VWp, VWp, Fe}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = cplFvFecVWpL(gt2,i3)
coup2R = cplFvFecVWpR(gt2,i3)
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


! {VWp, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHmVWp(gt1,i2)
coup2L = cplFvFecVWpL(gt2,i3)
coup2R = cplFvFecVWpR(gt2,i3)
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


! {VZ, VZ, Fv}
    Do i3=1,3
ML1 = MVZ 
ML2 = MVZ 
ML3 = MFv(i3) 
coup1 = cplhhVZVZ(gt1)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
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


! {bar[Fe], bar[Fe], Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
coup3L = cplcFeFvcHmL(i2,gt3,i3)
coup3R = cplcFeFvcHmR(i2,gt3,i3)
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


! {bar[Fe], bar[Fe], conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(i1,i2,gt1)
coup1R = cplcFeFehhR(i1,i2,gt1)
coup2L = cplFvFecVWpL(gt2,i1)
coup2R = cplFvFecVWpR(gt2,i1)
coup3L = cplcFeFvVWpL(i2,gt3)
coup3R = cplcFeFvVWpR(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, Fe}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
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


! {conj[Hm], conj[Hm], Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
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


! {conj[VWp], Hm, bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2L = -cplcFeFvVWpR(i3,gt2)
coup2R = -cplcFeFvVWpL(i3,gt2)
coup3L = cplFvFeHmL(gt3,i3,i2)
coup3R = cplFvFeHmR(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], bar[Fe]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2L = -cplcFeFvVWpR(i3,gt2)
coup2R = -cplcFeFvVWpL(i3,gt2)
coup3L = -cplFvFecVWpR(gt3,i3)
coup3R = -cplFvFecVWpL(gt3,i3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToFvFv


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToFvFv(MFe,MFv,Mhh,MHm,MVWp,             & 
& MVZ,MFe2,MFv2,Mhh2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,    & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),Mhh(2),MHm(3),MVWp,MVZ,MFe2(3),MFv2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),& 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3)

Complex(dp), Intent(out) :: Amp(2,2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToFvFv


Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhVP(Mhh,Mhh2,MVP,MVP2,Zfhh,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhVP


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhVP(MFd,MFe,MFu,Mhh,MHm,MVP,             & 
& MVWp,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),     & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
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


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHmcVWp(gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcHmcVWp(gt2,i3)
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


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmVWp(gt2,i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplhhHmVWp(gt2,i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplhhcHmcVWpVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmVPVWp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplhhcHmcVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,i1)
coup2 = cplhhHmVWp(gt2,i1)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhVP(MFd,MFe,MFu,Mhh,MHm,              & 
& MVP,MVWp,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),     & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhVP


Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhVZ(Mhh,Mhh2,MVZ,MVZ2,Zfhh,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVZ,MVZ2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVZ

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
  Do gt2=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhTohhVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhVZ(MAh,MetI,MFd,MFe,MFu,Mhh,            & 
& MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVZ,             & 
& cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVWpVZ1,            & 
& cplhhcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cpletIetIhh(2),cpletIhhhh(2,2),& 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),            & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplhhHmVWpVZ1(2,3),         & 
& cplhhcHmcVWpVZ1(2,3)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, VZ, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cplAhhhVZ(gt1)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhhhhh(gt1,i2)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(gt1,i2)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, VZ, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = cpletIhhVZ(gt1)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, VZ}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(gt1,i2)
coup2 = -cpletIhhVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = cplcFdFdhhL(i1,i3,gt2)
coup2R = cplcFdFdhhR(i1,i3,gt2)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = cplcFeFehhL(i1,i3,gt2)
coup2R = cplcFeFehhR(i1,i3,gt2)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = cplcFuFuhhL(i1,i3,gt2)
coup2R = cplcFuFuhhR(i1,i3,gt2)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cplAhhhhh(gt2,i1)
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


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplhhhhhh(gt1,i1,i2)
coup2 = cpletIhhhh(gt2,i1)
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


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(gt1,i1)
coup2 = cplhhhhhh(gt2,i1,i3)
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


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i1)
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


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcVWpVWp(gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(2)*AmpC 


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplhhcHmcVWp(gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhHmVWp(gt1,i2)
coup2 = cplhhcHmcVWp(gt2,i3)
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


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmVWp(gt2,i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplhhHmVWp(gt2,i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cplhhcHmcVWp(gt1,i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplhhcHmcVWpVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplhhHmVWpVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cplhhcHmcVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,i1)
coup2 = cplhhHmVWp(gt2,i1)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhTohhVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhVZ(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhhh,             & 
& cplAhetIhh,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,          & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,               & 
& cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,              & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVZ,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVWpVZ1,  & 
& cplhhcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhhh(2),cplAhetIhh(2),cplAhhhhh(2,2),cplAhhhVZ(2),cpletIetIhh(2),cpletIhhhh(2,2),& 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVZ,cplhhhhhh(2,2,2),            & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3),      & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplhhHmVWpVZ1(2,3),         & 
& cplhhcHmcVWpVZ1(2,3)

Complex(dp), Intent(out) :: Amp(2,2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
  Do gt2=1,2
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhTohhVZ


Subroutine Amplitude_WAVE_radinuZeeHB_hhToVGVG(Mhh,Mhh2,MVG,MVG2,Zfhh,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVG,MVG2

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVG

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToVGVG


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,MFu2,           & 
& Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,cplcFuFuhhR,     & 
& cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh(2),MVG,MFd2(3),MFu2(3),Mhh2(2),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),              & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVGR(i1,i3)
coup2R = -cplcFdFdVGL(i1,i3)
coup3L = -cplcFdFdVGR(i3,i2)
coup3R = -cplcFdFdVGL(i3,i2)
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


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVGR(i1,i3)
coup2R = -cplcFuFuVGL(i1,i3)
coup3L = -cplcFuFuVGR(i3,i2)
coup3R = -cplcFuFuVGL(i3,i2)
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
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVGVG


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVGVG(MFd,MFu,Mhh,MVG,MFd2,             & 
& MFu2,Mhh2,MVG2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuhhL,            & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),Mhh(2),MVG,MFd2(3),MFu2(3),Mhh2(2),MVG2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),              & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVG 
Mex3 = MVG 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVGVG


Subroutine Amplitude_WAVE_radinuZeeHB_hhToVPVP(cplhhVZVZ,ctcplhhVZVZ,Mhh,             & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVPVZ,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp), Intent(in) :: ctcplhhVZVZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVPVZ,ZfVZVP

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToVPVP


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVPVP(MFd,MFe,MFu,Mhh,MHm,MVP,             & 
& MVWp,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,          & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,cplHmcHmVPVP1,      & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),     & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3),cplHmcHmVPVP1(3,3),& 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVPR(i3,i2)
coup3R = -cplcFdFdVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVPR(i3,i2)
coup3R = -cplcFuFuVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmVWp(gt1,i2)
coup2 = cplcVWpVPVWp
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmVWp(gt1,i2)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplHmcHmVP(i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplHmVPVWp(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmVPVWp(i3)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = -cplcVWpVPVWp
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVPVP1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVPVWp1Q
coup2b = coup2 
coup2 = cplcVWpVPVPVWp2Q
coup2c = coup2 
coup2 = cplcVWpVPVPVWp3Q
coup2a = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,i1)
coup2 = cplHmVPVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,i1)
coup2 = cplHmVPVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVPVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVPVP(MFd,MFe,MFu,Mhh,MHm,              & 
& MVP,MVWp,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVPL,      & 
& cplcFdFdVPR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFuFuhhL,               & 
& cplcFuFuhhR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWphh,cplcgWpgWpVP,cplcgWCgWChh,            & 
& cplcgWCgWCVP,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,               & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cplhhHmVPVWp1,cplhhcHmcVWpVP1,cplHmcHmVPVP1,      & 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MFd2(3),MFe2(3),MFu2(3),Mhh2(2),          & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWCgWChh(2),cplcgWCgWCVP,cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmcHmVP(3,3),     & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplhhHmVPVWp1(2,3),cplhhcHmcVWpVP1(2,3),cplHmcHmVPVP1(3,3),& 
& cplcVWpVPVPVWp3Q,cplcVWpVPVPVWp1Q,cplcVWpVPVPVWp2Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVP 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVPVP


Subroutine Amplitude_WAVE_radinuZeeHB_hhToVPVZ(cplhhVZVZ,ctcplhhVZVZ,Mhh,             & 
& Mhh2,MVP,MVP2,MVZ,MVZ2,Zfhh,ZfVP,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: Mhh(2),Mhh2(2),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplhhVZVZ(2)

Complex(dp), Intent(in) :: ctcplhhVZVZ(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVP,ZfVZ

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,2
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:,gt1) = 0._dp
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_hhToVPVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVPVZ(MFd,MFe,MFu,Mhh,MHm,MVP,             & 
& MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHmVWp,cplhhHmcHm,             & 
& cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,    & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,    & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MFd2(3),MFe2(3),MFu2(3),              & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,   & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),     & 
& cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),            & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),& 
& cplhhcHmcVWpVZ1(2,3),cplHmcHmVPVZ1(3,3),cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,             & 
& cplcVWpVPVWpVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(i2,i1,gt1)
coup1R = cplcFdFdhhR(i2,i1,gt1)
coup2L = -cplcFdFdVPR(i1,i3)
coup2R = -cplcFdFdVPL(i1,i3)
coup3L = -cplcFdFdVZR(i3,i2)
coup3R = -cplcFdFdVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {Fe, Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(i2,i1,gt1)
coup1R = cplcFeFehhR(i2,i1,gt1)
coup2L = -cplcFeFeVPR(i1,i3)
coup2R = -cplcFeFeVPL(i1,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Fu, Fu, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(i2,i1,gt1)
coup1R = cplcFuFuhhR(i2,i1,gt1)
coup2L = -cplcFuFuVPR(i1,i3)
coup2R = -cplcFuFuVPL(i1,i3)
coup3L = -cplcFuFuVZR(i3,i2)
coup3R = -cplcFuFuVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWphh(gt1)
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWChh(gt1)
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhHmVWp(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {VWp, VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWp
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(2)*AmpC 


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmVWp(gt1,i2)
coup2 = cplcVWpVPVWp
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, VWp, conj[Hm]}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
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


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhHmVWp(gt1,i2)
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


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplHmVPVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhHmcHm(gt1,i2,i1)
coup2 = cplHmVPVWp(i1)
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


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(gt1,i1)
coup2 = cplHmcHmVP(i1,i3)
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


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = cplHmVPVWp(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], conj[VWp], Hm}
    Do i3=1,3
ML1 = MVWp 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplHmVPVWp(i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
    End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cplhhcHmcVWp(gt1,i2)
coup2 = -cplcVWpVPVWp
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplhhHmcHm(gt1,i1,i2)
coup2 = cplHmcHmVPVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cplhhcVWpVWp(gt1)
coup2 = cplcVWpVPVWpVZ1Q
coup2b = coup2 
coup2 = cplcVWpVPVWpVZ2Q
coup2a = coup2 
coup2 = cplcVWpVPVWpVZ3Q
coup2c = coup2 
If (Abs(coup1)*(Abs(coup2a)+Abs(coup2b)+Abs(coup2c)) .gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology2_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2a,coup2b,coup2c,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhHmVWpVZ1(gt1,i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVZ1(gt1,i1)
coup2 = cplHmVPVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
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
coup1 = cplhhHmVPVWp1(gt1,i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cplhhcHmcVWpVP1(gt1,i1)
coup2 = cplHmVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1) = Amp(:,gt1) + oo16pi2*(1)*AmpC 

End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_hhToVPVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVPVZ(MFd,MFe,MFu,Mhh,MHm,              & 
& MVP,MVWp,MVZ,MFd2,MFe2,MFu2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFdFdhhL,cplcFdFdhhR,         & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFeFehhL,cplcFeFehhR,               & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuhhL,cplcFuFuhhR,               & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWphh,cplcgWpgWpVP,             & 
& cplcgWpgWpVZ,cplcgWCgWChh,cplcgWCgWCVP,cplcgWCgWCVZ,cplhhHmVWp,cplhhHmcHm,             & 
& cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,    & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplhhHmVPVWp1,cplhhHmVWpVZ1,cplhhcHmcVWpVP1,    & 
& cplhhcHmcVWpVZ1,cplHmcHmVPVZ1,cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,cplcVWpVPVWpVZ1Q,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MFd2(3),MFe2(3),MFu2(3),              & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),              & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),               & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),& 
& cplcgWpgWphh(2),cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWChh(2),cplcgWCgWCVP,cplcgWCgWCVZ,   & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),     & 
& cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),            & 
& cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplhhHmVPVWp1(2,3),cplhhHmVWpVZ1(2,3),cplhhcHmcVWpVP1(2,3),& 
& cplhhcHmcVWpVZ1(2,3),cplHmcHmVPVZ1(3,3),cplcVWpVPVWpVZ3Q,cplcVWpVPVWpVZ2Q,             & 
& cplcVWpVPVWpVZ1Q

Complex(dp), Intent(out) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,2
Amp(:,gt1) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = Mhh(gt1) 
Mex2 = MVP 
Mex3 = MVZ 
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_hhToVPVZ



End Module OneLoopDecay_hh_radinuZeeHB
