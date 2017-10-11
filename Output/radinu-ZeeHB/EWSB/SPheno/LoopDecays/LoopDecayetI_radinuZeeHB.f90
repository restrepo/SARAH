! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:01 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_etI_radinuZeeHB
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

Subroutine Amplitude_Tree_radinuZeeHB_etIToAhAh(cplAhAhetI,MAh,MetI,MAh2,             & 
& MetI2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MAh2,MetI2

Complex(dp), Intent(in) :: cplAhAhetI

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhAhetI
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_radinuZeeHB_etIToAhAh


Subroutine Gamma_Real_radinuZeeHB_etIToAhAh(MLambda,em,gs,cplAhAhetI,MAh,             & 
& MetI,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhAhetI

Real(dp), Intent(in) :: MAh,MetI

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplAhAhetI
Mex1 = MetI
Mex2 = MAh
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_radinuZeeHB_etIToAhAh


Subroutine Amplitude_WAVE_radinuZeeHB_etIToAhAh(cplAhAhetI,ctcplAhAhetI,              & 
& MAh,MAh2,MetI,MetI2,ZfAh,ZfetI,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2

Complex(dp), Intent(in) :: cplAhAhetI

Complex(dp), Intent(in) :: ctcplAhAhetI

Complex(dp), Intent(in) :: ZfAh,ZfetI

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhAhetI 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cplAhAhetI


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhetI


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhAhetI


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToAhAh


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToAhAh(MAh,MetI,MFd,MFe,MFu,               & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhhhh1,     & 
& cplAhAhHmcHm1,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhetIHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1(2),          & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhhhh1(2,2),cplAhAhHmcHm1(3,3),cplAhetIetIetI1,  & 
& cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhAh
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhAh
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhAh
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhetI
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhAhetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhAhhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhAhhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhetI
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIetI
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhAhetI
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIetI
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cplAhetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp = Amp + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(i1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(i1)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhAhhh(i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(i1,i2)
coup2 = -cplAhhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplAhcHmcVWp(i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = -cplAhcHmcVWp(i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i2)
coup2 = -cplAhhhVZ(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cplAhHmVWp(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cplAhHmVWp(i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhAhAh1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhAhAhetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhAhhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cplAhAhetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cplAhAhetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhAhhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhAhHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhetI1
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIetI1
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhetIhh1(i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhetI1
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIetI1
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhetIhh1(i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToAhAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToAhAh(MAh,MetI,MFd,MFe,MFu,            & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhAhhhhh1,     & 
& cplAhAhHmcHm1,cplAhetIetIetI1,cplAhetIetIhh1,cplAhetIhhhh1,cplAhetIHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplAhAhAhAh1,cplAhAhAhetI1,cplAhAhAhhh1(2),          & 
& cplAhAhetIetI1,cplAhAhetIhh1(2),cplAhAhhhhh1(2,2),cplAhAhHmcHm1(3,3),cplAhetIetIetI1,  & 
& cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MAh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToAhAh


Subroutine Amplitude_Tree_radinuZeeHB_etIToetIAh(cplAhetIetI,MAh,MetI,MAh2,           & 
& MetI2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MAh2,MetI2

Complex(dp), Intent(in) :: cplAhetIetI

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhetIetI
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_radinuZeeHB_etIToetIAh


Subroutine Gamma_Real_radinuZeeHB_etIToetIAh(MLambda,em,gs,cplAhetIetI,               & 
& MAh,MetI,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplAhetIetI

Real(dp), Intent(in) :: MAh,MetI

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cplAhetIetI
Mex1 = MetI
Mex2 = MetI
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_radinuZeeHB_etIToetIAh


Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIAh(cplAhetIetI,ctcplAhetIetI,           & 
& MAh,MAh2,MetI,MetI2,ZfAh,ZfetI,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2

Complex(dp), Intent(in) :: cplAhetIetI

Complex(dp), Intent(in) :: ctcplAhetIetI

Complex(dp), Intent(in) :: ZfAh,ZfetI

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhetIetI 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cplAhetIetI


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cplAhetIetI


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhetIetI


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIAh


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIAh(MAh,MetI,MFd,MFe,MFu,              & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplAhAhAhetI1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,             & 
& cplAhetIhhhh1,cplAhetIHmcHm1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,          & 
& cpletIetIHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplAhAhAhetI1,cplAhAhetIetI1,cplAhAhetIhh1(2),       & 
& cplAhetIetIetI1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3),              & 
& cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIetIHmcHm1(3,3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhetI
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhetI
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhetI
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhetIhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhetIetI
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIetI
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIetI
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cpletIetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIetIhh(i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhh(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp = Amp + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(i1)
coup2 = cpletIetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(i1)
coup2 = cpletIetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIetIhh(i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(i1,i2)
coup2 = -cpletIhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cpletIcHmcVWp(i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = -cpletIcHmcVWp(i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i2)
coup2 = -cpletIhhVZ(i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cpletIHmVWp(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cpletIHmVWp(i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhAhetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhAhetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cplAhetIetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhetIhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhetIHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhetI1
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIetI1
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhetIhh1(i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIetI1
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIetI1
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIetIhh1(i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIAh(MAh,MetI,MFd,MFe,               & 
& MFu,Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,         & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplAhAhAhetI1,cplAhAhetIetI1,cplAhAhetIhh1,cplAhetIetIetI1,cplAhetIetIhh1,             & 
& cplAhetIhhhh1,cplAhetIHmcHm1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,          & 
& cpletIetIHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplAhAhAhetI1,cplAhAhetIetI1,cplAhAhetIhh1(2),       & 
& cplAhetIetIetI1,cplAhetIetIhh1(2),cplAhetIhhhh1(2,2),cplAhetIHmcHm1(3,3),              & 
& cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),cpletIetIHmcHm1(3,3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MAh 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIAh


Subroutine Amplitude_Tree_radinuZeeHB_etITohhAh(cplAhetIhh,MAh,MetI,Mhh,              & 
& MAh2,MetI2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,Mhh(2),MAh2,MetI2,Mhh2(2)

Complex(dp), Intent(in) :: cplAhetIhh(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1 = cplAhetIhh(gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt2) = AmpC 
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITohhAh


Subroutine Gamma_Real_radinuZeeHB_etITohhAh(MLambda,em,gs,cplAhetIhh,MAh,             & 
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
 
  Do i2=1,2
Coup = cplAhetIhh(i2)
Mex1 = MetI
Mex2 = Mhh(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i2) = 0._dp 
  GammarealGluon(i2) = 0._dp 
Else 
  GammarealGluon(i2) = 0._dp 
  GammarealPhoton(i2) = 0._dp 

End if 
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITohhAh


Subroutine Amplitude_WAVE_radinuZeeHB_etITohhAh(cplAhetIhh,ctcplAhetIhh,              & 
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

  Do gt2=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcplAhetIhh(gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cplAhetIhh(gt2)


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cplAhetIhh(i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfAh*cplAhetIhh(gt2)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt2) = AmpC 
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITohhAh


Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhAh(MAh,MetI,MFd,MFe,MFu,               & 
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
  Do gt2=1,2
Amp(gt2) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MAh 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cpletIetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, hh, VZ}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(gt2) = Amp(gt2) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(gt2) = Amp(gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhAh
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = -cplhhcHmcVWp(gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, Ah}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = -cpletIhhVZ(i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, etI}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = -cpletIhhVZ(i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, VZ}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = -cpletIhhVZ(i2)
coup2 = cplhhVZVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cplhhHmVWp(gt2,i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cplAhHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhAhhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhAhetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cplAhetIetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhhhhh1(gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhhhHmcHm1(gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhAhetI1
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhAhetIetI1
coup2 = cplAhetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhAhetIhh1(i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cpletIetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cpletIhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt2)
coup2 = cplAhAhAh
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt2)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt2,i2)
coup2 = cplAhAhhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt2)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt2,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt2,i1,i2)
coup2 = cplAhhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt2,i1,i2)
coup2 = cplAhHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhAh(MAh,MetI,MFd,MFe,MFu,            & 
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
  Do gt2=1,2
Amp(gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MAh 
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhAh


Subroutine Amplitude_Tree_radinuZeeHB_etIToetIetI(cpletIetIetI,MetI,MetI2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2

Complex(dp), Intent(in) :: cpletIetIetI

Complex(dp) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1 = cpletIetIetI
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp = AmpC 
End Subroutine Amplitude_Tree_radinuZeeHB_etIToetIetI


Subroutine Gamma_Real_radinuZeeHB_etIToetIetI(MLambda,em,gs,cpletIetIetI,             & 
& MetI,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIetIetI

Real(dp), Intent(in) :: MetI

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton, GammarealGluon 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
Coup = cpletIetIetI
Mex1 = MetI
Mex2 = MetI
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton = 0._dp 
  GammarealGluon = 0._dp 
Else 
  GammarealGluon = 0._dp 
  GammarealPhoton = 0._dp 

End if 
End Subroutine Gamma_Real_radinuZeeHB_etIToetIetI


Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIetI(cpletIetIetI,ctcpletIetIetI,        & 
& MetI,MetI2,ZfetI,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2

Complex(dp), Intent(in) :: cpletIetIetI

Complex(dp), Intent(in) :: ctcpletIetIetI

Complex(dp), Intent(in) :: ZfetI

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIetIetI 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIetI


! External Field 2 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIetI


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIetI


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp = AmpC 
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIetI


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIetI(MAh,MetI,MFd,MFe,MFu,             & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,             & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplAhAhetIetI1,            & 
& cplAhetIetIetI1,cplAhetIetIhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,        & 
& cpletIetIHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),   & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),           & 
& cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplAhAhetIetI1,cplAhetIetIetI1,       & 
& cplAhetIetIhh1(2),cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),             & 
& cpletIetIHmcHm1(3,3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MetI 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhetI
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIetI
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIetI
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhh(i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhetIetI
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIetI
coup2 = cplAhetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIetI
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cpletIetIetI
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIetI
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIetI
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIetIhh(i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIetIhh(i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhh(i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp = Amp + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp = Amp + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(i1)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(i1)
coup2 = cpletIetIhh(i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(i1)
coup2 = cpletIetIhh(i1)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIetIhh(i1)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhh(i1,i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(i1,i2)
coup2 = -cpletIhhVZ(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cpletIcHmcVWp(i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = -cpletIcHmcVWp(i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i2)
coup2 = -cpletIhhVZ(i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cpletIHmVWp(i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cpletIHmVWp(i3)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIetIetI1
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIetIhh1(i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIetIhhhh1(i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIetIHmcHm1(i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIetI1
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIetI1
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIetIhh1(i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIetI1
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIetI1
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIetIhh1(i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp = Amp + oo16pi2*(1)*AmpC 

  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI(MAh,MetI,MFd,MFe,              & 
& MFu,Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,        & 
& cplAhetIetI,cplAhetIhh,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,             & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplAhAhetIetI1,            & 
& cplAhetIetIetI1,cplAhetIetIhh1,cpletIetIetIetI1,cpletIetIetIhh1,cpletIetIhhhh1,        & 
& cpletIetIHmcHm1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),   & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),           & 
& cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplAhAhetIetI1,cplAhetIetIetI1,       & 
& cplAhetIetIhh1(2),cpletIetIetIetI1,cpletIetIetIhh1(2),cpletIetIhhhh1(2,2),             & 
& cpletIetIHmcHm1(3,3)

Complex(dp), Intent(out) :: Amp 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MetI 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIetI


Subroutine Amplitude_Tree_radinuZeeHB_etITohhetI(cpletIetIhh,MetI,Mhh,MetI2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,Mhh(2),MetI2,Mhh2(2)

Complex(dp), Intent(in) :: cpletIetIhh(2)

Complex(dp) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1 = cpletIetIhh(gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt2) = AmpC 
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITohhetI


Subroutine Gamma_Real_radinuZeeHB_etITohhetI(MLambda,em,gs,cpletIetIhh,               & 
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
 
  Do i2=1,2
Coup = cpletIetIhh(i2)
Mex1 = MetI
Mex2 = Mhh(i2)
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i2) = 0._dp 
  GammarealGluon(i2) = 0._dp 
Else 
  GammarealGluon(i2) = 0._dp 
  GammarealPhoton(i2) = 0._dp 

End if 
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITohhetI


Subroutine Amplitude_WAVE_radinuZeeHB_etITohhetI(cpletIetIhh,ctcpletIetIhh,           & 
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

  Do gt2=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIetIhh(gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIhh(gt2)


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cpletIetIhh(i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIetIhh(gt2)


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt2) = AmpC 
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITohhetI


Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhetI(MAh,MetI,MFd,MFe,MFu,              & 
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
  Do gt2=1,2
Amp(gt2) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MetI 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIhh(gt2)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, hh, VZ}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(gt2) = Amp(gt2) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(gt2) = Amp(gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIetIetI
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = -cplhhcHmcVWp(gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, Ah}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = -cpletIhhVZ(i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, etI}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = -cpletIhhVZ(i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, VZ}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = -cpletIhhVZ(i2)
coup2 = cplhhVZVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cplhhHmVWp(gt2,i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cpletIHmcHm(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIetIhh1(gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhhhh1(gt2,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhhhh1(gt2,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIhhHmcHm1(gt2,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIetI1
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIetI1
coup2 = cplAhetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIetIhh1(i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIetI1
coup2 = cpletIetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIetIhh1(i2)
coup2 = cpletIhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VWp, VWp}
ML1 = MVWp 
ML2 = MVWp 
coup1 = cpletIetIcVWpVWp1
coup2 = cplhhcVWpVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 



! {VZ, VZ}
ML1 = MVZ 
ML2 = MVZ 
coup1 = cpletIetIVZVZ1
coup2 = cplhhVZVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt2)
coup2 = cplAhAhetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt2)
coup2 = cplAhetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt2,i2)
coup2 = cplAhetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt2)
coup2 = cpletIetIetI
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt2,i2)
coup2 = cpletIetIhh(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt2,i1,i2)
coup2 = cpletIhhhh(i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt2,i1,i2)
coup2 = cpletIHmcHm(i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2) = Amp(gt2) + oo16pi2*(1)*AmpC 

  End Do
End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI(MAh,MetI,MFd,MFe,               & 
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
  Do gt2=1,2
Amp(gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MetI 
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhetI


Subroutine Amplitude_Tree_radinuZeeHB_etITocFdFd(cplcFdFdetIL,cplcFdFdetIR,           & 
& MetI,MFd,MetI2,MFd2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MetI2,MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdetIL(gt2,gt3)
coupT1R = cplcFdFdetIR(gt2,gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITocFdFd


Subroutine Gamma_Real_radinuZeeHB_etITocFdFd(MLambda,em,gs,cplcFdFdetIL,              & 
& cplcFdFdetIR,MetI,MFd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3)

Real(dp), Intent(in) :: MetI,MFd(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFdFdetIL(i2,i3)
CoupR = cplcFdFdetIR(i2,i3)
Mex1 = MetI
Mex2 = MFd(i2)
Mex3 = MFd(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp/3._dp,-1._dp/3._dp,1._dp/3._dp,CoupL,CoupR,Gammarealphoton(i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i2,i3),kont)
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITocFdFd


Subroutine Amplitude_WAVE_radinuZeeHB_etITocFdFd(cplcFdFdetIL,cplcFdFdetIR,           & 
& ctcplcFdFdetIL,ctcplcFdFdetIR,MetI,MetI2,MFd,MFd2,ZfDL,ZfDR,ZfetI,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MFd(3),MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFdetIL(3,3),ctcplcFdFdetIR(3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),ZfetI

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdetIL(gt2,gt3) 
ZcoupT1R = ctcplcFdFdetIR(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfetI*cplcFdFdetIL(gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfetI*cplcFdFdetIR(gt2,gt3)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt2)*cplcFdFdetIL(i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt2))*cplcFdFdetIR(i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt3)*cplcFdFdetIL(gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt3))*cplcFdFdetIR(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITocFdFd


Subroutine Amplitude_VERTEX_radinuZeeHB_etITocFdFd(MAh,MetI,MFd,MFu,Mhh,              & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,cpletIetIhh,    & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,        & 
& cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),     & 
& cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),       & 
& cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),             & 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {Ah, Ah, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhAhetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Fd}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = cplAhetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cplAhetIhh(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Fd}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Fd}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = cpletIetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cpletIetIhh(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {hh, Ah, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFd(i3) 
coup1 = cplAhetIhh(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MFd(i3) 
coup1 = cpletIetIhh(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fd}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cpletIhhhh(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, Fd}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFd(i3) 
coup1 = cpletIhhVZ(i1)
coup2L = cplcFdFdhhL(gt2,i3,i1)
coup2R = cplcFdFdhhR(gt2,i3,i1)
coup3L = cplcFdFdVZL(i3,gt3)
coup3R = cplcFdFdVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFu(i3) 
coup1 = cpletIHmcHm(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Fu}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFu(i3) 
coup1 = cpletIHmVWp(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, hh, Fd}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFd(i3) 
coup1 = cpletIhhVZ(i2)
coup2L = cplcFdFdVZL(gt2,i3)
coup2R = cplcFdFdVZR(gt2,i3)
coup3L = cplcFdFdhhL(i3,gt3,i2)
coup3R = cplcFdFdhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fd], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MAh 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MetI 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fd], bar[Fd], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVZ 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVWp 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWp], Hm, Fu}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFu(i3) 
coup1 = cpletIcHmcVWp(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITocFdFd


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd(MAh,MetI,MFd,MFu,               & 
& Mhh,MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,               & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,            & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,              & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),               & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),     & 
& cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),       & 
& cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),             & 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MFd(gt2) 
Mex3 = MFd(gt3) 


! {bar[Fd], bar[Fd], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVG 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
coup2L = cplcFdFdVGL(gt2,i1)
coup2R = cplcFdFdVGR(gt2,i1)
coup3L = cplcFdFdVGL(i2,gt3)
coup3R = cplcFdFdVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fd], bar[Fd], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVP 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
coup2L = cplcFdFdVPL(gt2,i1)
coup2R = cplcFdFdVPR(gt2,i1)
coup3L = cplcFdFdVPL(i2,gt3)
coup3R = cplcFdFdVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocFdFd


Subroutine Amplitude_Tree_radinuZeeHB_etITocFeFe(cplcFeFeetIL,cplcFeFeetIR,           & 
& MetI,MFe,MetI2,MFe2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFe(3),MetI2,MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFeetIL(gt2,gt3)
coupT1R = cplcFeFeetIR(gt2,gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITocFeFe


Subroutine Gamma_Real_radinuZeeHB_etITocFeFe(MLambda,em,gs,cplcFeFeetIL,              & 
& cplcFeFeetIR,MetI,MFe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3)

Real(dp), Intent(in) :: MetI,MFe(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFeFeetIL(i2,i3)
CoupR = cplcFeFeetIR(i2,i3)
Mex1 = MetI
Mex2 = MFe(i2)
Mex3 = MFe(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i2,i3),kont)
  GammarealGluon(i2,i3) = 0._dp 
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITocFeFe


Subroutine Amplitude_WAVE_radinuZeeHB_etITocFeFe(cplcFeFeetIL,cplcFeFeetIR,           & 
& ctcplcFeFeetIL,ctcplcFeFeetIR,MetI,MetI2,MFe,MFe2,ZfEL,ZfER,ZfetI,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MFe(3),MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeetIL(3,3),ctcplcFeFeetIR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfetI

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeetIL(gt2,gt3) 
ZcoupT1R = ctcplcFeFeetIR(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfetI*cplcFeFeetIL(gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfetI*cplcFeFeetIR(gt2,gt3)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt2)*cplcFeFeetIL(i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt2))*cplcFeFeetIR(i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt3)*cplcFeFeetIL(gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt3))*cplcFeFeetIR(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITocFeFe


Subroutine Amplitude_VERTEX_radinuZeeHB_etITocFeFe(MAh,MetI,MFe,MFv,Mhh,              & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,               & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),               & 
& cpletIetIetI,cpletIetIhh(2),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplFvFeHmL(3,3,3),      & 
& cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),              & 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {Ah, Ah, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhAhetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Fe}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = cplAhetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cplAhetIhh(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Fe}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Fe}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = cpletIetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cpletIetIhh(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {hh, Ah, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFe(i3) 
coup1 = cplAhetIhh(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MFe(i3) 
coup1 = cpletIetIhh(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fe}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cpletIhhhh(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, Fe}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFe(i3) 
coup1 = cpletIhhVZ(i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = cplcFeFeVZL(i3,gt3)
coup3R = cplcFeFeVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFv(i3) 
coup1 = cpletIHmcHm(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Fv}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFv(i3) 
coup1 = cpletIHmVWp(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VZ, hh, Fe}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFe(i3) 
coup1 = cpletIhhVZ(i2)
coup2L = cplcFeFeVZL(gt2,i3)
coup2R = cplcFeFeVZR(gt2,i3)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], bar[Fe], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MAh 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MetI 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], bar[Fe], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fe], bar[Fe], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVZ 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[VWp], Hm, Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFv(i3) 
coup1 = cpletIcHmcVWp(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITocFeFe


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe(MAh,MetI,MFe,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhetI,        & 
& cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cpletIetIetI,cpletIetIhh,               & 
& cplcFeFeetIL,cplcFeFeetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,               & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,             & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),               & 
& cpletIetIetI,cpletIetIhh(2),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplFvFeHmL(3,3,3),      & 
& cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),              & 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MFe(gt2) 
Mex3 = MFe(gt3) 


! {bar[Fe], bar[Fe], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVP 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
coup2L = cplcFeFeVPL(gt2,i1)
coup2R = cplcFeFeVPR(gt2,i1)
coup3L = cplcFeFeVPL(i2,gt3)
coup3R = cplcFeFeVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocFeFe


Subroutine Amplitude_Tree_radinuZeeHB_etITocFuFu(cplcFuFuetIL,cplcFuFuetIR,           & 
& MetI,MFu,MetI2,MFu2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFu(3),MetI2,MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuetIL(gt2,gt3)
coupT1R = cplcFuFuetIR(gt2,gt3)
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITocFuFu


Subroutine Gamma_Real_radinuZeeHB_etITocFuFu(MLambda,em,gs,cplcFuFuetIL,              & 
& cplcFuFuetIR,MetI,MFu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3)

Real(dp), Intent(in) :: MetI,MFu(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
  Do i2=1,3
    Do i3=1,3
CoupL = cplcFuFuetIL(i2,i3)
CoupR = cplcFuFuetIR(i2,i3)
Mex1 = MetI
Mex2 = MFu(i2)
Mex3 = MFu(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,4._dp/3._dp,-4._dp/3._dp,4._dp/3._dp,CoupL,CoupR,Gammarealphoton(i2,i3),kont)
 Call hardradiationSFF(Mex1,Mex2,Mex3,MLambda,gs,0._dp,0._dp,0._dp,4._dp,-4._dp,4._dp,CoupL,CoupR,Gammarealgluon(i2,i3),kont)
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITocFuFu


Subroutine Amplitude_WAVE_radinuZeeHB_etITocFuFu(cplcFuFuetIL,cplcFuFuetIR,           & 
& ctcplcFuFuetIL,ctcplcFuFuetIR,MetI,MetI2,MFu,MFu2,ZfetI,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFuetIL(3,3),ctcplcFuFuetIR(3,3)

Complex(dp), Intent(in) :: ZfetI,ZfUL(3,3),ZfUR(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuetIL(gt2,gt3) 
ZcoupT1R = ctcplcFuFuetIR(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfetI*cplcFuFuetIL(gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfetI*cplcFuFuetIR(gt2,gt3)


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt2)*cplcFuFuetIL(i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt2))*cplcFuFuetIR(i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt3)*cplcFuFuetIL(gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt3))*cplcFuFuetIR(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoFF(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITocFuFu


Subroutine Amplitude_VERTEX_radinuZeeHB_etITocFuFu(MAh,MetI,MFd,MFu,Mhh,              & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,cpletIetIhh,    & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,             & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,           & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,             & 
& cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,            & 
& cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),               & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),     & 
& cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),       & 
& cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFdcVWpL(3,3),             & 
& cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {Ah, Ah, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhAhetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Fu}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cplAhetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cplAhetIhh(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Fu}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Fu}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cpletIetIetI
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cpletIetIhh(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {hh, Ah, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MFu(i3) 
coup1 = cplAhetIhh(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MFu(i3) 
coup1 = cpletIetIhh(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Fu}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cpletIhhhh(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, Fu}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MFu(i3) 
coup1 = cpletIhhVZ(i1)
coup2L = cplcFuFuhhL(gt2,i3,i1)
coup2R = cplcFuFuhhR(gt2,i3,i1)
coup3L = cplcFuFuVZL(i3,gt3)
coup3R = cplcFuFuVZR(i3,gt3)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_SVF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VWp, conj[Hm], Fd}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cpletIHmVWp(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, Fu}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MFu(i3) 
coup1 = cpletIhhVZ(i2)
coup2L = cplcFuFuVZL(gt2,i3)
coup2R = cplcFuFuVZR(gt2,i3)
coup3L = cplcFuFuhhL(i3,gt3,i2)
coup3R = cplcFuFuhhR(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoFF_Topology1_VSF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fd], Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fd], bar[Fd], conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MVWp 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MAh 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MetI 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fu], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVZ 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, Fd}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFd(i3) 
coup1 = cpletIcHmcVWp(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFd(i3) 
coup1 = cpletIHmcHm(i2,i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
    End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITocFuFu


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu(MAh,MetI,MFd,MFu,               & 
& Mhh,MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,               & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,            & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,              & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),               & 
& cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),     & 
& cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),       & 
& cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFdcVWpL(3,3),             & 
& cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MFu(gt2) 
Mex3 = MFu(gt3) 


! {bar[Fu], bar[Fu], VG}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVG 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
coup2L = cplcFuFuVGL(gt2,i1)
coup2R = cplcFuFuVGR(gt2,i1)
coup3L = cplcFuFuVGL(i2,gt3)
coup3R = cplcFuFuVGR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
  End Do
End Do


! {bar[Fu], bar[Fu], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MVP 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
coup2L = cplcFuFuVPL(gt2,i1)
coup2R = cplcFuFuVPR(gt2,i1)
coup3L = cplcFuFuVPL(i2,gt3)
coup3R = cplcFuFuVPR(i2,gt3)
Call Amp_VERTEX_StoFF_Topology1_FFV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocFuFu


Subroutine Amplitude_Tree_radinuZeeHB_etITohhhh(cpletIhhhh,MetI,Mhh,MetI2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,Mhh(2),MetI2,Mhh2(2)

Complex(dp), Intent(in) :: cpletIhhhh(2,2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1 = cpletIhhhh(gt2,gt3)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITohhhh


Subroutine Gamma_Real_radinuZeeHB_etITohhhh(MLambda,em,gs,cpletIhhhh,MetI,            & 
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
 
  Do i2=1,2
    Do i3=1,2
Coup = cpletIhhhh(i2,i3)
Mex1 = MetI
Mex2 = Mhh(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i2,i3) = 0._dp 
  GammarealGluon(i2,i3) = 0._dp 
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITohhhh


Subroutine Amplitude_WAVE_radinuZeeHB_etITohhhh(cpletIhhhh,ctcpletIhhhh,              & 
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

  Do gt2=1,2
    Do gt3=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIhhhh(gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIhhhh(gt2,gt3)


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cpletIhhhh(i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt3)*cpletIhhhh(gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITohhhh


Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhhh(MAh,MetI,MFd,MFe,MFu,               & 
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
  Do gt2=1,2
    Do gt3=1,2
Amp(gt2, gt3) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, Ah, Ah}
ML1 = MAh 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhhh(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, Ah}
ML1 = MAh 
ML2 = MetI 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhAhhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, etI}
ML1 = MAh 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhAhetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, etI}
ML1 = MAh 
ML2 = MetI 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhhh(gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, Ah, VZ}
ML1 = MAh 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhAhetI
coup2 = cplAhhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, VZ}
ML1 = MAh 
ML2 = MetI 
ML3 = MVZ 
coup1 = cplAhetIetI
coup2 = cplAhhhVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, Ah, Ah}
ML1 = MetI 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, Ah}
ML1 = MetI 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIetI
coup2 = cplAhetIhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, etI}
ML1 = MetI 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIetI
coup2 = cpletIetIhh(gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, etI}
ML1 = MetI 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIhh(gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, hh}
  Do i2=1,2
    Do i3=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhhh(gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, VZ}
ML1 = MetI 
ML2 = MAh 
ML3 = MVZ 
coup1 = cplAhetIetI
coup2 = cpletIhhVZ(gt2)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, VZ}
ML1 = MetI 
ML2 = MetI 
ML3 = MVZ 
coup1 = cpletIetIetI
coup2 = cpletIhhVZ(gt2)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWphh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWChh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(2)*AmpC 


! {hh, Ah, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MAh 
coup1 = cplAhetIhh(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MAh 
coup1 = cpletIetIhh(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VZ, Ah}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MAh 
coup1 = -cpletIhhVZ(i1)
coup2 = cplAhhhhh(gt2,i1)
coup3 = -cplAhhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MetI 
coup1 = cplAhetIhh(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MetI 
coup1 = cpletIetIhh(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VZ, etI}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MetI 
coup1 = -cpletIhhVZ(i1)
coup2 = cpletIhhhh(gt2,i1)
coup3 = -cpletIhhVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, hh}
Do i1=1,2
  Do i2=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
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
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplhhcHmcVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cplhhHmVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = -cplhhcHmcVWp(gt2,i1)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = -cplhhcHmcVWp(gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, Ah}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = -cpletIhhVZ(i2)
coup2 = cplAhhhVZ(gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, etI}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = -cpletIhhVZ(i2)
coup2 = cpletIhhVZ(gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = -cplhhHmVWp(gt2,i1)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cplhhHmVWp(gt2,i1)
coup3 = cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplhhHmVWp(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cplhhHmVWp(gt2,i3)
coup3 = cplhhHmcHm(gt3,i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplhhHmVWp(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhhhhh1(gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIhhhh1(gt2,gt3)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhhhhh1(gt2,gt3,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhhhhh1(gt2,gt3,i1,i2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhhhHmcHm1(gt2,gt3,i2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt3)
coup2 = cplAhAhhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt3)
coup2 = cplAhetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt3,i2)
coup2 = cplAhhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt3)
coup2 = cpletIetIhh(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt3,i2)
coup2 = cpletIhhhh(gt2,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt3,i1,i2)
coup2 = cplhhhhhh(gt2,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt3,i1,i2)
coup2 = cplhhHmcHm(gt2,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetIhh1(gt2)
coup2 = cplAhAhhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetIhh1(gt2)
coup2 = cplAhetIhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhhhh1(gt2,i2)
coup2 = cplAhhhhh(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetIhh1(gt2)
coup2 = cpletIetIhh(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 



! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhhhh1(gt2,i2)
coup2 = cpletIhhhh(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhhhh1(gt2,i1,i2)
coup2 = cplhhhhhh(gt3,i1,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 

  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(gt2,i1,i2)
coup2 = cplhhHmcHm(gt3,i2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do
    End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhhh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh(MAh,MetI,MFd,MFe,MFu,            & 
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
  Do gt2=1,2
    Do gt3=1,2
Amp(gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhhh


Subroutine Amplitude_Tree_radinuZeeHB_etITohhVZ(cpletIhhVZ,MetI,Mhh,MVZ,              & 
& MetI2,Mhh2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,Mhh(2),MVZ,MetI2,Mhh2(2),MVZ2

Complex(dp), Intent(in) :: cpletIhhVZ(2)

Complex(dp) :: Amp(2,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1 = cpletIhhVZ(gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITohhVZ


Subroutine Gamma_Real_radinuZeeHB_etITohhVZ(MLambda,em,gs,cpletIhhVZ,MetI,            & 
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
 
  Do i2=1,2
Coup = cpletIhhVZ(i2)
Mex1 = MetI
Mex2 = Mhh(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
 Gammarealphoton(i2) = 0._dp 
 GammarealGluon(i2) = 0._dp 
Else 
  GammarealGluon(i2) = 0._dp 
  GammarealPhoton(i2) = 0._dp 

End if 
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITohhVZ


Subroutine Amplitude_WAVE_radinuZeeHB_etITohhVZ(cpletIhhVZ,ctcpletIhhVZ,              & 
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

  Do gt2=1,2
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIhhVZ(gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIhhVZ(gt2)


! External Field 2 
Do i1=1,2
ZcoupT1 = ZcoupT1 + 0.5_dp*Zfhh(i1,gt2)*cpletIhhVZ(i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZ*cpletIhhVZ(gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITohhVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhVZ(MAh,MetI,MFd,MFe,MFu,               & 
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
  Do gt2=1,2
Amp(:,gt2) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhhh(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhhhhh(gt2,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, VZ}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cplAhetIhh(i2)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIhh(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIhh(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIhhhh(gt2,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, VZ}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIetIhh(i2)
coup2 = -cpletIhhVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhhh(gt2,i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhhh(gt2,i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplhhhhhh(gt2,i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcHmcVWp(gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, Ah}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = -cpletIhhVZ(i2)
coup2 = -cplAhhhVZ(gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, etI}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = -cpletIhhVZ(i2)
coup2 = -cpletIhhVZ(gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, VZ}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = -cpletIhhVZ(i2)
coup2 = cplhhVZVZ(gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmVWp(gt2,i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplhhHmVWp(gt2,i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cpletIhhVZ(i1)
coup2 = cplhhhhVZVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplhhcHmcVWpVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplhhHmVWpVZ1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {etI, VZ}
ML1 = MetI 
ML2 = MVZ 
coup1 = cpletIetIVZVZ1
coup2 = -cpletIhhVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 



! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplhhcHmcVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(i1)
coup2 = cplhhHmVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ(MAh,MetI,MFd,MFe,MFu,            & 
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
  Do gt2=1,2
Amp(:,gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MVZ 
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhVZ


Subroutine Amplitude_Tree_radinuZeeHB_etIToHmVWp(cpletIHmVWp,MetI,MHm,MVWp,           & 
& MetI2,MHm2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MHm(3),MVWp,MetI2,MHm2(3),MVWp2

Complex(dp), Intent(in) :: cpletIHmVWp(3)

Complex(dp) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1 = cpletIHmVWp(gt2)
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etIToHmVWp


Subroutine Gamma_Real_radinuZeeHB_etIToHmVWp(MLambda,em,gs,cpletIHmVWp,               & 
& MetI,MHm,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIHmVWp(3)

Real(dp), Intent(in) :: MetI,MHm(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3), GammarealGluon(3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
  Do i2=2,3
Coup = cpletIHmVWp(i2)
Mex1 = MetI
Mex2 = MHm(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSV(Mex1,Mex2,Mex3,MLambda,em,0._dp,1._dp,1._dp,Coup,Gammarealphoton(i2),kont)
 GammarealGluon(i2) = 0._dp 
Else 
  GammarealGluon(i2) = 0._dp 
  GammarealPhoton(i2) = 0._dp 

End if 
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etIToHmVWp


Subroutine Amplitude_WAVE_radinuZeeHB_etIToHmVWp(cpletIHmVWp,ctcpletIHmVWp,           & 
& MetI,MetI2,MHm,MHm2,MVWp,MVWp2,ZfetI,ZfHm,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MHm(3),MHm2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cpletIHmVWp(3)

Complex(dp), Intent(in) :: ctcpletIHmVWp(3)

Complex(dp), Intent(in) :: ZfetI,ZfHm(3,3),ZfVWp

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIHmVWp(gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIHmVWp(gt2)


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt2)*cpletIHmVWp(i1)
End Do


! External Field 3 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVWp*cpletIHmVWp(gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToHmVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToHmVWp(MAh,MetI,MFd,MFe,MFu,              & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cpletIetIetI,             & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,           & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,              & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmVWp(3),cplAhHmcHm(3,3),cpletIetIetI,      & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),     & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFdFuVWpL(3,3),              & 
& cplcFdFuVWpR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgWCgAHm(3),cplcgZgWpHm(3),   & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm(3),cplcgWpgZVWp,cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),& 
& cplhhcVWpVWp(2),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cpletIetIcVWpVWp1,cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),       & 
& cplhhHmVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
Amp(:,gt2) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MVWp 


! {Ah, hh, VWp}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplAhetIhh(i2)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhetI
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, conj[Hm]}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cplAhetIetI
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhHmcHm(gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, hh, VWp}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIetIhh(i2)
coup2 = -cpletIHmVWp(gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIetI
coup2 = cpletIHmcHm(gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, conj[Hm]}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIetI
coup2 = cpletIHmcHm(gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIHmcHm(gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, Fu, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {gWpC, gWpC, gP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgAHm(gt2)
coup3 = cplcgAgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 


! {gWpC, gWpC, gZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgZHm(gt2)
coup3 = cplcgZgWCVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 


! {hh, hh, VWp}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIhhhh(i1,i2)
coup2 = -cplhhHmVWp(i1,gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VZ, VWp}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = -cpletIhhVZ(i1)
coup2 = -cplhhHmVWp(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, Ah, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, conj[Hm]}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, conj[Hm]}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplhhHmcHm(i1,gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhHmcHm(gt2,i1)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, etI}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIHmcHm(gt2,i1)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhHmVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhHmcHm(i3,gt2,i1)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cpletIHmVWp(i1)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cpletIHmVWp(i1)
coup2 = cplHmcHmVZ(gt2,i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {VZ, hh, VWp}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = -cpletIhhVZ(i2)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, conj[Hm]}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIhhVZ(i2)
coup2 = cplHmcHmVZ(gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fd], bar[Fd], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdetIL(i1,i2)
coup1R = cplcFdFdetIR(i1,i2)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(3)*AmpC 
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
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[gWp], bar[gWp], bar[gZ]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWpetI
coup2 = cplcgZgWpHm(gt2)
coup3 = cplcgWpgZVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 


! {conj[VWp], Hm, Ah}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cplAhHmVWp(gt2)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Hm, etI}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cpletIHmVWp(gt2)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Hm, hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = -cplhhHmVWp(i3,gt2)
coup3 = cplhhHmVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplHmVPVWp(gt2)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {conj[VWp], Hm, VZ}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplHmVWpVZ(gt2)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {hh, VZ}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
coup1 = cpletIhhVZ(i1)
coup2 = cplhhHmVWpVZ1(i1,gt2)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplHmcHmcVWpVWp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {etI, VWp}
ML1 = MetI 
ML2 = MVWp 
coup1 = cpletIetIcVWpVWp1
coup2 = -cpletIHmVWp(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 



! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplHmcHmVP(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplHmcHmVZ(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToHmVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp(MAh,MetI,MFd,MFe,               & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cpletIetIetI,       & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWCgAHm,cplcgZgWpHm,           & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm,cplcgWpgZVWp,cplhhHmVWp,cplhhHmcHm,              & 
& cplhhcVWpVWp,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcVWpVWpVZ,    & 
& cpletIetIcVWpVWp1,cpletIHmVPVWp1,cpletIHmVWpVZ1,cplhhHmVWpVZ1,cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmVWp(3),cplAhHmcHm(3,3),cpletIetIetI,      & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdHmL(3,3,3),     & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFdFuVWpL(3,3),              & 
& cplcFdFuVWpR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgWCgAHm(3),cplcgZgWpHm(3),   & 
& cplcgAgWCVWp,cplcgZgWCVWp,cplcgWCgZHm(3),cplcgWpgZVWp,cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),& 
& cplhhcVWpVWp(2),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3),           & 
& cplcVWpVPVWp,cplcVWpVWpVZ,cpletIetIcVWpVWp1,cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),       & 
& cplhhHmVWpVZ1(2,3),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
Amp(:,gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MVWp 


! {Hm, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cpletIHmVWp(i1)
coup2 = cplHmcHmVP(gt2,i1)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[VWp], Hm, VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplHmVPVWp(gt2)
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplHmcHmVP(gt2,i1)
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToHmVWp


Subroutine Amplitude_Tree_radinuZeeHB_etITocHmHm(cpletIHmcHm,MetI,MHm,MetI2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MHm(3),MetI2,MHm2(3)

Complex(dp), Intent(in) :: cpletIHmcHm(3,3)

Complex(dp) :: Amp(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1 = cpletIHmcHm(gt3,gt2)
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,coupT1,AmpC) 
! Colour and symmetry factor 
Amp(gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_Tree_radinuZeeHB_etITocHmHm


Subroutine Gamma_Real_radinuZeeHB_etITocHmHm(MLambda,em,gs,cpletIHmcHm,               & 
& MetI,MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cpletIHmcHm(3,3)

Real(dp), Intent(in) :: MetI,MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: Coup 
 
  Do i2=2,3
    Do i3=2,3
Coup = cpletIHmcHm(i3,i2)
Mex1 = MetI
Mex2 = MHm(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationSSS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,Coup,Gammarealphoton(i2,i3),kont)
  GammarealGluon(i2,i3) = 0._dp 
Else 
  GammarealGluon(i2,i3) = 0._dp 
  GammarealPhoton(i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Subroutine Gamma_Real_radinuZeeHB_etITocHmHm


Subroutine Amplitude_WAVE_radinuZeeHB_etITocHmHm(cpletIHmcHm,ctcpletIHmcHm,           & 
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

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1 = ctcpletIHmcHm(gt3,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfetI*cpletIHmcHm(gt3,gt2)


! External Field 2 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*Conjg(ZfHm(i1,gt2))*cpletIHmcHm(gt3,i1)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfHm(i1,gt3)*cpletIHmcHm(i1,gt2)
End Do


! Getting the amplitude 
Call TreeAmp_StoSS(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(gt2, gt3) = AmpC 
    End Do
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITocHmHm


Subroutine Amplitude_VERTEX_radinuZeeHB_etITocHmHm(MAh,MetI,MFd,MFe,MFu,              & 
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
  Do gt2=1,3
    Do gt3=1,3
Amp(gt2, gt3) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 


! {Ah, Ah, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhetI
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cplAhetIetI
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhHmcHm(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Ah, Ah, conj[VWp]}
ML1 = MAh 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhAhetI
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, etI, conj[VWp]}
ML1 = MAh 
ML2 = MetI 
ML3 = MVWp 
coup1 = cplAhetIetI
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh, conj[VWp]}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cplAhetIhh(i2)
coup2 = cplAhcHmcVWp(gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIetI
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIetI
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIHmcHm(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, conj[VWp]}
ML1 = MetI 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhetIetI
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, etI, conj[VWp]}
ML1 = MetI 
ML2 = MetI 
ML3 = MVWp 
coup1 = cpletIetIetI
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {etI, hh, conj[VWp]}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIetIhh(i2)
coup2 = cpletIcHmcVWp(gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {Fd, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(3)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgZcHm(gt2)
coup3 = cplcgZgWpHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {hh, Ah, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplhhHmcHm(i1,i3,gt2)
coup3 = cplHmcHmVZ(gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, Ah, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MVWp 
coup1 = cplAhetIhh(i1)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, etI, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MVWp 
coup1 = cpletIetIhh(i1)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, hh, conj[VWp]}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VZ, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = -cpletIhhVZ(i1)
coup2 = cplhhcHmcVWp(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], Ah}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = -cpletIHmVWp(i2)
coup2 = cplAhcHmcVWp(gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], etI}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = -cpletIHmVWp(i2)
coup2 = cpletIcHmcVWp(gt2)
coup3 = cpletIHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcHmcVWp(i3,gt2)
coup3 = cplhhHmcHm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWp, conj[Hm], VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cpletIHmVWp(i2)
coup2 = cplcHmcVWpVP(gt2)
coup3 = cplHmcHmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], VZ}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = -cpletIHmVWp(i2)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = cplHmcHmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIhhVZ(i2)
coup2 = cplHmcHmVZ(i3,gt2)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, conj[VWp]}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = -cpletIhhVZ(i2)
coup2 = cplcHmcVWpVZ(gt2)
coup3 = -cplhhHmVWp(i2,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {bar[Fu], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
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
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gWpC], bar[gWpC], bar[gZ]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWCetI
coup2 = cplcgZgWCcHm(gt2)
coup3 = cplcgWCgZHm(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {conj[Hm], VWp, Ah}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MAh 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplAhHmcHm(i1,gt2)
coup3 = -cplAhHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplAhHmcHm(i1,gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, etI}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MetI 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmcHm(i1,gt2)
coup3 = -cpletIHmVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cpletIHmcHm(i1,gt2)
coup3 = cpletIHmcHm(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmcHm(i3,i1,gt2)
coup3 = -cplhhHmVWp(i3,gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplhhHmcHm(i3,i1,gt2)
coup3 = cplhhHmcHm(i3,gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], VWp, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmVPVWp(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcHmVP(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplHmcHmVZ(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmcHmVZ(i1,gt2)
coup3 = cplHmcHmVZ(gt3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {Ah, etI}
ML1 = MAh 
ML2 = MetI 
coup1 = cplAhetIetI
coup2 = cplAhetIHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 


! {Ah, hh}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhhhHmcHm1(i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIHmcHm1(gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, hh}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIhhHmcHm1(i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhHmcHm1(i1,i2,gt3,gt2)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmHmcHmcHm1(gt3,i2,gt2,i1)
Call Amp_VERTEX_StoSS_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Hm}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(gt3,i2)
coup2 = cplAhHmcHm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, Hm}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(gt3,i2)
coup2 = cpletIHmcHm(i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, Hm}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(i1,gt3,i2)
coup2 = cplhhHmcHm(i1,i2,gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, conj[VWp]}
ML1 = MVP 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(gt3)
coup2 = cplcHmcVWpVP(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 



! {VWp, VZ}
ML1 = MVWp 
ML2 = MVZ 
coup1 = cpletIHmVWpVZ1(gt3)
coup2 = cplcHmcVWpVZ(gt2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 



! {Ah, conj[Hm]}
  Do i2=1,3
ML1 = MAh 
ML2 = MHm(i2) 
coup1 = cplAhetIHmcHm1(i2,gt2)
coup2 = cplAhHmcHm(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {etI, conj[Hm]}
  Do i2=1,3
ML1 = MetI 
ML2 = MHm(i2) 
coup1 = cpletIetIHmcHm1(i2,gt2)
coup2 = cpletIHmcHm(gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do


! {hh, conj[Hm]}
Do i1=1,2
  Do i2=1,3
ML1 = Mhh(i1) 
ML2 = MHm(i2) 
coup1 = cpletIhhHmcHm1(i1,i2,gt2)
coup2 = cplhhHmcHm(i1,gt3,i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

  End Do
End Do


! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(gt2)
coup2 = cplHmVPVWp(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 



! {VZ, VWp}
ML1 = MVZ 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(gt2)
coup2 = cplHmVWpVZ(gt3)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITocHmHm


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm(MAh,MetI,MFd,MFe,               & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,       & 
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
  Do gt2=1,3
    Do gt3=1,3
Amp(gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MHm(gt2) 
Mex3 = MHm(gt3) 


! {VWp, conj[Hm], VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = -cpletIHmVWp(i2)
coup2 = cplcHmcVWpVP(gt2)
coup3 = cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], VWp, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmVPVWp(gt3)
Call Amp_VERTEX_StoSS_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmcHmVP(i1,gt2)
coup3 = cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_StoSS_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, conj[VWp]}
ML1 = MVP 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(gt3)
coup2 = cplcHmcVWpVP(gt2)
Call Amp_VERTEX_StoSS_Topology3_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 



! {VP, VWp}
ML1 = MVP 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(gt2)
coup2 = cplHmVPVWp(gt3)
Call Amp_VERTEX_StoSS_Topology4_VV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(gt2, gt3) = Amp(gt2, gt3) + oo16pi2*(1)*AmpC 

    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITocHmHm


Subroutine Amplitude_WAVE_radinuZeeHB_etIToAhVP(MAh,MAh2,MetI,MetI2,MVP,              & 
& MVP2,ZfAh,ZfetI,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MVP,MVP2

Complex(dp), Intent(in) :: ZfAh,ZfetI,ZfVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToAhVP


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToAhVP(MAh,MetI,MFd,MFe,MFu,               & 
& MHm,MVP,MVWp,MAh2,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,        & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,cplHmcHmVP,               & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplAhHmVPVWp1,cplAhcHmcVWpVP1,cpletIHmVPVWp1,cpletIcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MAh2,MetI2,MFd2(3),MFe2(3),             & 
& MFu2(3),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHmVWp(3),cplAhHmcHm(3,3),              & 
& cplAhcHmcVWp(3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplAhHmVPVWp1(3),           & 
& cplAhcHmcVWpVP1(3),cpletIHmVPVWp1(3),cpletIcHmcVWpVP1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = cplAhcHmcVWp(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplAhHmVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplAhHmVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplAhHmVWp(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplAhcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplAhHmVPVWp1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplAhcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(i1)
coup2 = cplAhHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToAhVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToAhVP(MAh,MetI,MFd,MFe,MFu,            & 
& MHm,MVP,MVWp,MAh2,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdAhL,cplcFdFdAhR,        & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,             & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp,        & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,cplHmcHmVP,               & 
& cplcVWpVPVWp,cplcHmcVWpVP,cplAhHmVPVWp1,cplAhcHmcVWpVP1,cpletIHmVPVWp1,cpletIcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MAh2,MetI2,MFd2(3),MFe2(3),             & 
& MFu2(3),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3), & 
& cplcFuFuAhR(3,3),cplcgWpgWpAh,cplcgWCgWCAh,cplAhHmVWp(3),cplAhHmcHm(3,3),              & 
& cplAhcHmcVWp(3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplAhHmVPVWp1(3),           & 
& cplAhcHmcVWpVP1(3),cpletIHmVPVWp1(3),cpletIcHmcVWpVP1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToAhVP


Subroutine Amplitude_WAVE_radinuZeeHB_etIToAhVZ(MAh,MAh2,MetI,MetI2,MVZ,              & 
& MVZ2,ZfAh,ZfetI,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MetI,MetI2,MVZ,MVZ2

Complex(dp), Intent(in) :: ZfAh,ZfetI,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MAh 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToAhVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToAhVZ(MAh,MetI,MFd,MFe,MFu,               & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,          & 
& cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),               & 
& cplAhHmVWpVZ1(3),cplAhcHmcVWpVZ1(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhAh
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhAhhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhAhhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhAhetI
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cplAhetIhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpAh
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCAh
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhAhhh(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cplAhhhhh(i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhhhVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhHmcHm(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplAhHmcHm(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = cplAhcHmcVWp(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cplAhcHmcVWp(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplAhHmVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplAhHmVWp(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplAhHmcHm(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplAhHmVWp(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplAhcHmcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplAhHmVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplAhcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(i1)
coup2 = cplAhHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToAhVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToAhVZ(MAh,MetI,MFd,MFe,MFu,            & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh,               & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,        & 
& cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,             & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,   & 
& cplAhHmVWpVZ1,cplAhcHmcVWpVZ1,cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),  & 
& cplcgWpgWpAh,cplcgWCgWCAh,cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),   & 
& cplAhcHmcVWp(3),cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),       & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,          & 
& cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),               & 
& cplAhHmVWpVZ1(3),cplAhcHmcVWpVZ1(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MAh 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToAhVZ


Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIVP(MetI,MetI2,MVP,MVP2,ZfetI,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVP,MVP2

Complex(dp), Intent(in) :: ZfetI,ZfVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIVP


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIVP(MetI,MFd,MFe,MFu,MHm,              & 
& MVP,MVWp,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,               & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,              & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MetI2,MFd2(3),MFe2(3),MFu2(3),              & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cpletIHmVPVWp1(3),          & 
& cpletIcHmcVWpVP1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = cpletIcHmcVWp(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cpletIHmVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cpletIHmVWp(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cpletIcHmcVWpVP1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cpletIHmVPVWp1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cpletIcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(i1)
coup2 = cpletIHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIVP(MetI,MFd,MFe,MFu,               & 
& MHm,MVP,MVWp,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,           & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,              & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MetI2,MFd2(3),MFe2(3),MFu2(3),              & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cpletIHmVPVWp1(3),          & 
& cpletIcHmcVWpVP1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIVP


Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIVZ(MetI,MetI2,MVZ,MVZ2,ZfetI,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVZ,MVZ2

Complex(dp), Intent(in) :: ZfetI,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MetI 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToetIVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIVZ(MAh,MetI,MFd,MFe,MFu,              & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhetIetI,cplAhetIhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,              & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVWpVZ1, & 
& cpletIcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhhhVZ(2),cpletIetIetI,cpletIetIhh(2),        & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVZL(3,3),       & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MVZ 


! {Ah, hh, Ah}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cplAhetIhh(i2)
coup2 = cplAhAhetI
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, hh, etI}
  Do i2=1,2
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cplAhetIhh(i2)
coup2 = cplAhetIetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhetIhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhetIhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Ah}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIetIhh(i2)
coup2 = cplAhetIetI
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {etI, hh, etI}
  Do i2=1,2
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIetIhh(i2)
coup2 = cpletIetIetI
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIetIhh(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIetIhh(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpetI
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCetI
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplAhetIhh(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIetIhh(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, Ah, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, VZ, hh}
Do i1=1,2
    Do i3=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1 = -cpletIhhVZ(i1)
coup2 = cpletIhhhh(i1,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(i1,i2)
coup2 = cpletIhhVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIHmcHm(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cpletIHmcHm(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = cpletIcHmcVWp(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cpletIcHmcVWp(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cpletIHmVWp(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cpletIHmcHm(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cpletIHmVWp(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cpletIcHmcVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cpletIHmVWpVZ1(i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cpletIcHmcVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(i1)
coup2 = cpletIHmVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToetIVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIVZ(MAh,MetI,MFd,MFe,               & 
& MFu,Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,        & 
& cplAhetIetI,cplAhetIhh,cplAhhhVZ,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIhhhh,cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,              & 
& cplcgWCgWCVZ,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVWpVZ1, & 
& cpletIcHmcVWpVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhhhVZ(2),cpletIetIetI,cpletIetIhh(2),        & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVZL(3,3),       & 
& cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),  & 
& cplcgWpgWpVZ,cplcgWCgWCVZ,cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,     & 
& cplcHmcVWpVZ(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MetI 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToetIVZ


Subroutine Amplitude_WAVE_radinuZeeHB_etIToFvFv(MetI,MetI2,MFv,MFv2,ZfetI,ZfVL,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: ZfetI,ZfVL(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MetI 
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
Amp(:,gt2, gt3) = 0._dp
    End Do
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToFvFv


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToFvFv(MetI,MFe,MFv,MHm,MVWp,              & 
& MetI2,MFe2,MFv2,MHm2,MVWp2,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,          & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFvVWpL,            & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFe(3),MFv(3),MHm(3),MVWp,MetI2,MFe2(3),MFv2(3),MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3), & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),               & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 


! {Fe, Fe, VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fe, Fe, conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
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
coup1 = cpletIHmcHm(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], bar[Fe]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cpletIHmVWp(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {VWp, conj[Hm], Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cpletIHmVWp(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], bar[Fe], Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {bar[Fe], bar[Fe], conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MFe(i2) 
ML3 = MVWp 
coup1L = cplcFeFeetIL(i1,i2)
coup1R = cplcFeFeetIR(i1,i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, Fe}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MFe(i3) 
coup1 = cpletIcHmcVWp(i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cpletIHmcHm(i2,i1)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[VWp], Hm, bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MFe(i3) 
coup1 = cpletIcHmcVWp(i2)
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
Amp(:,gt2, gt3) = Amp(:,gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToFvFv


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToFvFv(MetI,MFe,MFv,MHm,MVWp,           & 
& MetI2,MFe2,MFv2,MHm2,MVWp2,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cpletIHmcHm,          & 
& cpletIcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFvVWpL,            & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFe(3),MFv(3),MHm(3),MVWp,MetI2,MFe2(3),MFv2(3),MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3), & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),               & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

Complex(dp), Intent(out) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
  Do gt2=1,3
    Do gt3=1,3
Amp(:,gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MFv(gt2) 
Mex3 = MFv(gt3) 
    End Do
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToFvFv


Subroutine Amplitude_WAVE_radinuZeeHB_etITohhVP(cpletIhhVZ,ctcpletIhhVZ,              & 
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

  Do gt2=1,2
! External masses 
Mex1 = MetI 
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
ZcoupT1 = ZcoupT1 + 0.5_dp*ZfVZVP*cpletIhhVZ(gt2)


! Getting the amplitude 
Call TreeAmp_StoSV(Mex1,Mex2,Mex3,ZcoupT1,AmpC) 
Amp(:,gt2) = AmpC 
  End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_etITohhVP


Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhVP(MetI,MFd,MFe,MFu,Mhh,               & 
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
  Do gt2=1,2
Amp(:,gt2) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWphh(gt2)
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWChh(gt2)
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhHmcHm(gt2,i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i1)
coup2 = cplhhcHmcVWp(gt2,i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIHmVWp(i2)
coup2 = cplhhcHmcVWp(gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmVWp(gt2,i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplhhHmVWp(gt2,i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i1)
coup2 = cplhhHmcHm(gt2,i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhHmVWp(gt2,i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = -cpletIcHmcVWp(i2)
coup2 = cplhhcVWpVWp(gt2)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplhhcHmcVWpVP1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplhhHmVPVWp1(gt2,i1)
Call Amp_VERTEX_StoSV_Topology2_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplhhcHmcVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(i1)
coup2 = cplhhHmVWp(gt2,i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoSV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt2) = Amp(:,gt2) + oo16pi2*(1)*AmpC 

End Do
  End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etITohhVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhVP(MetI,MFd,MFe,MFu,Mhh,            & 
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
  Do gt2=1,2
Amp(:,gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = Mhh(gt2) 
Mex3 = MVP 
  End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etITohhVP


Subroutine Amplitude_WAVE_radinuZeeHB_etIToVGVG(MetI,MetI2,MVG,MVG2,ZfetI,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVG,MVG2

Complex(dp), Intent(in) :: ZfetI,ZfVG

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToVGVG


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVGVG(MetI,MFd,MFu,MVG,MetI2,             & 
& MFd2,MFu2,MVG2,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdVGL,        & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFu(3),MVG,MetI2,MFd2(3),MFu2(3),MVG2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),              & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MVG 
Mex3 = MVG 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVGVG


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVGVG(MetI,MFd,MFu,MVG,MetI2,          & 
& MFd2,MFu2,MVG2,cplcFdFdetIL,cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cplcFdFdVGL,        & 
& cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFu(3),MVG,MetI2,MFd2(3),MFu2(3),MVG2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),              & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MVG 
Mex3 = MVG 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVGVG


Subroutine Amplitude_WAVE_radinuZeeHB_etIToVPVP(MetI,MetI2,MVP,MVP2,ZfetI,ZfVP,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVP,MVP2

Complex(dp), Intent(in) :: ZfetI,ZfVP

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToVPVP


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVPVP(MetI,MFd,MFe,MFu,MHm,               & 
& MVP,MVWp,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,               & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,              & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplHmcHmVPVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MetI2,MFd2(3),MFe2(3),MFu2(3),              & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cpletIHmVPVWp1(3),          & 
& cpletIcHmcVWpVP1(3),cplHmcHmVPVP1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MVP 
Mex3 = MVP 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVP
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIHmVWp(i1)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplcHmcVWpVP(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmVWp(i2)
coup2 = cplcVWpVPVWp
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmVWp(i2)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmcHmVP(i1,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(i2)
coup2 = cplHmVPVWp(i3)
coup3 = -cplHmcHmVP(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(i2)
coup2 = -cplcVWpVPVWp
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmVPVP1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(i1)
coup2 = cplHmVPVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(i1)
coup2 = cplHmVPVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVPVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVPVP(MetI,MFd,MFe,MFu,MHm,            & 
& MVP,MVWp,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,cplcFdFdetIL,cplcFdFdetIR,               & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFeFeVPL,             & 
& cplcFeFeVPR,cplcFuFuVPL,cplcFuFuVPR,cplcgWpgWpVP,cplcgWCgWCVP,cplHmVPVWp,              & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,cpletIHmVPVWp1,cpletIcHmcVWpVP1,cplHmcHmVPVP1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MetI2,MFd2(3),MFe2(3),MFu2(3),              & 
& MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFeFeVPL(3,3),  & 
& cplcFeFeVPR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcgWpgWpVP,cplcgWCgWCVP,          & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cpletIHmVPVWp1(3),          & 
& cpletIcHmcVWpVP1(3),cplHmcHmVPVP1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MVP 
Mex3 = MVP 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVPVP


Subroutine Amplitude_WAVE_radinuZeeHB_etIToVPVZ(MetI,MetI2,MVP,MVP2,MVZ,              & 
& MVZ2,ZfetI,ZfVP,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: ZfetI,ZfVP,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToVPVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVPVZ(MetI,MFd,MFe,MFu,MHm,               & 
& MVP,MVWp,MVZ,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,MVZ2,cplcFdFdetIL,cplcFdFdetIR,      & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWCVP,            & 
& cplcgWCgWCVZ,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,    & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,              & 
& cpletIcHmcVWpVZ1,cplHmcHmVPVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MVZ,MetI2,MFd2(3),MFe2(3),MFu2(3),          & 
& MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWpVP,      & 
& cplcgWpgWpVZ,cplcgWCgWCVP,cplcgWCgWCVZ,cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),    & 
& cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),             & 
& cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),           & 
& cplHmcHmVPVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MVP 
Mex3 = MVZ 


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpVP
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCVP
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIHmVWp(i1)
coup2 = -cplHmcHmVP(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplcHmcVWpVP(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmVWp(i2)
coup2 = cplcVWpVPVWp
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmVWp(i2)
coup2 = cplcHmcVWpVP(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmVPVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmcHmVP(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(i2)
coup2 = cplHmVPVWp(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(i2)
coup2 = -cplcVWpVPVWp
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmVPVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(i1)
coup2 = cplHmVPVWp(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVP1(i1)
coup2 = cplHmVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVPVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVPVZ(MetI,MFd,MFe,MFu,MHm,            & 
& MVP,MVWp,MVZ,MetI2,MFd2,MFe2,MFu2,MHm2,MVP2,MVWp2,MVZ2,cplcFdFdetIL,cplcFdFdetIR,      & 
& cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,       & 
& cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVPL,               & 
& cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVP,cplcgWpgWpVZ,cplcgWCgWCVP,            & 
& cplcgWCgWCVZ,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVPVWp,cplcHmcVWpVP,    & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,              & 
& cpletIcHmcVWpVZ1,cplHmcHmVPVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MFe(3),MFu(3),MHm(3),MVP,MVWp,MVZ,MetI2,MFd2(3),MFe2(3),MFu2(3),          & 
& MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),              & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIHmVWp(3),        & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),  & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWpVP,      & 
& cplcgWpgWpVZ,cplcgWCgWCVP,cplcgWCgWCVZ,cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),    & 
& cplHmcHmVZ(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),             & 
& cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVP1(3),cpletIcHmcVWpVZ1(3),           & 
& cplHmcHmVPVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MVP 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVPVZ


Subroutine Amplitude_WAVE_radinuZeeHB_etIToVWpcVWp(MetI,MetI2,MVWp,MVWp2,             & 
& ZfetI,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVWp,MVWp2

Complex(dp), Intent(in) :: ZfetI,ZfVWp

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MVWp 
Mex3 = MVWp 
ZcoupT1 = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
! Vanishing 


! External Field 2 
! Vanishing 


! External Field 3 
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToVWpcVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVWpcVWp(MAh,MetI,MFd,MFe,MFu,            & 
& MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,MVWp2,          & 
& MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhcHmcVWp,cpletIetIetI,           & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWpgAVWp,cplcgWCgAcVWp,        & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,      & 
& cplhhHmVWp,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,               & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,              & 
& cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,       & 
& cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmVWp(3),cplAhcHmcVWp(3),cpletIetIetI,      & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),     & 
& cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFdFuVWpL(3,3),              & 
& cplcFdFuVWpR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgWpgAVWp,cplcgWCgAcVWp,      & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,      & 
& cplhhHmVWp(2,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmVWpVZ(3),         & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp1,             & 
& cpletIetIcVWpVWp1,cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVP1(3),             & 
& cpletIcHmcVWpVZ1(3),cplhhhhcVWpVWp1(2,2),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MVWp 
Mex3 = MVWp 


! {Ah, Ah, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhAhetI
coup2 = cplAhHmVWp(i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, Hm}
    Do i3=1,3
ML1 = MAh 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cplAhetIetI
coup2 = cplAhHmVWp(i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MAh 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(i2)
coup2 = cplAhHmVWp(i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, Ah, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIetI
coup2 = cpletIHmVWp(i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, Hm}
    Do i3=1,3
ML1 = MetI 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIetI
coup2 = cpletIHmVWp(i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MetI 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(i2)
coup2 = cpletIHmVWp(i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, Fd, Fu}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
coup2L = -cplcFdFuVWpR(i1,i3)
coup2R = -cplcFdFuVWpL(i1,i3)
coup3L = -cplcFuFdcVWpR(i3,i2)
coup3R = -cplcFuFdcVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(3)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
coup2L = -cplcFeFvVWpR(i1,i3)
coup2R = -cplcFeFvVWpL(i1,i3)
coup3L = -cplFvFecVWpR(i3,i2)
coup3R = -cplFvFecVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gP}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgAVWp
coup3 = cplcgAgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 


! {gWp, gWp, gZ}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgZVWp
coup3 = cplcgZgWpcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 


! {hh, Ah, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1 = cplAhetIhh(i1)
coup2 = cplhhHmVWp(i1,i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, etI, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1 = cpletIetIhh(i1)
coup2 = cplhhHmVWp(i1,i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, Hm}
Do i1=1,2
  Do i2=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhHmVWp(i1,i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, VZ, Hm}
Do i1=1,2
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1 = cpletIhhVZ(i1)
coup2 = cplhhHmVWp(i1,i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {hh, hh, conj[VWp]}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhcVWpVWp(i1)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, VZ, conj[VWp]}
Do i1=1,2
ML1 = Mhh(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1 = cpletIhhVZ(i1)
coup2 = cplhhcVWpVWp(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], hh}
  Do i2=1,3
    Do i3=1,2
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmVWp(i2)
coup2 = cplhhcVWpVWp(i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWp, conj[Hm], VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmVWp(i2)
coup2 = -cplcVWpVPVWp
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], VZ}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cpletIHmVWp(i2)
coup2 = cplcVWpVWpVZ
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {VZ, hh, Hm}
  Do i2=1,2
    Do i3=1,3
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1 = cpletIhhVZ(i2)
coup2 = cplHmVWpVZ(i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, hh, conj[VWp]}
  Do i2=1,2
ML1 = MVZ 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1 = cpletIhhVZ(i2)
coup2 = -cplcVWpVWpVZ
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {bar[Fu], bar[Fu], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuetIL(i1,i2)
coup1R = cplcFuFuetIR(i1,i2)
coup2L = cplcFdFuVWpL(i3,i1)
coup2R = cplcFdFuVWpR(i3,i1)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_FFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(3)*AmpC 
    End Do
  End Do
End Do


! {bar[gWpC], bar[gWpC], bar[gP]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVP 
coup1 = cplcgWCgWCetI
coup2 = cplcgAgWCVWp
coup3 = cplcgWCgAcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 


! {bar[gWpC], bar[gWpC], bar[gZ]}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cplcgWCgWCetI
coup2 = cplcgZgWCVWp
coup3 = cplcgWCgZcVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 


! {conj[Hm], conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cplAhHmVWp(i1)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cpletIHmVWp(i1)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1 = cpletIcHmcVWp(i1)
coup2 = -cplhhHmVWp(i3,i1)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[Hm], conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1 = cpletIHmcHm(i2,i1)
coup2 = -cplhhHmVWp(i3,i1)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {conj[Hm], VWp, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmVPVWp(i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmVWpVZ(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmVWpVZ(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIcVWpVWp1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhcVWpVWp1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmcVWpVWp1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Hm}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
coup1 = cpletIcHmcVWpVP1(i2)
coup2 = cplHmVPVWp(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

  End Do


! {VZ, Hm}
  Do i2=1,3
ML1 = MVZ 
ML2 = MHm(i2) 
coup1 = cpletIcHmcVWpVZ1(i2)
coup2 = cplHmVWpVZ(i2)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

  End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplcHmcVWpVP(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {Hm, VZ}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVZ 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVWpcVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVWpcVWp(MAh,MetI,MFd,MFe,             & 
& MFu,MFv,Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,MFv2,Mhh2,MHm2,MVP2,            & 
& MVWp2,MVZ2,cplAhAhetI,cplAhetIetI,cplAhetIhh,cplAhHmVWp,cplAhcHmcVWp,cpletIetIetI,     & 
& cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,          & 
& cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,            & 
& cpletIHmcHm,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,       & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFvVWpL,cplcFeFvVWpR,cplcgWpgAVWp,cplcgWCgAcVWp,        & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,      & 
& cplhhHmVWp,cplhhcVWpVWp,cplhhcHmcVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,               & 
& cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhcVWpVWp1,cpletIetIcVWpVWp1,              & 
& cpletIHmVPVWp1,cpletIHmVWpVZ1,cpletIcHmcVWpVP1,cpletIcHmcVWpVZ1,cplhhhhcVWpVWp1,       & 
& cplHmcHmcVWpVWp1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,           & 
& MFd2(3),MFe2(3),MFu2(3),MFv2(3),Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhetIhh(2),cplAhHmVWp(3),cplAhcHmcVWp(3),cpletIetIetI,      & 
& cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),       & 
& cpletIhhVZ(2),cpletIHmVWp(3),cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),     & 
& cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFdFuVWpL(3,3),              & 
& cplcFdFuVWpR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcgWpgAVWp,cplcgWCgAcVWp,      & 
& cplcgAgWpcVWp,cplcgZgWpcVWp,cplcgAgWCVWp,cplcgZgWCVWp,cplcgWpgZVWp,cplcgWCgZcVWp,      & 
& cplhhHmVWp(2,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplHmVPVWp(3),cplHmVWpVZ(3),         & 
& cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),cplAhAhcVWpVWp1,             & 
& cpletIetIcVWpVWp1,cpletIHmVPVWp1(3),cpletIHmVWpVZ1(3),cpletIcHmcVWpVP1(3),             & 
& cpletIcHmcVWpVZ1(3),cplhhhhcVWpVWp1(2,2),cplHmcHmcVWpVWp1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MVWp 
Mex3 = MVWp 


! {VWp, conj[Hm], VP}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmVWp(i2)
coup2 = -cplcVWpVPVWp
coup3 = cplcHmcVWpVP(i2)
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {conj[Hm], VWp, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmVPVWp(i1)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmVPVWp(i1)
coup3 = cplcHmcVWpVP(i2)
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {VP, Hm}
  Do i2=1,3
ML1 = MVP 
ML2 = MHm(i2) 
coup1 = cpletIcHmcVWpVP1(i2)
coup2 = cplHmVPVWp(i2)
Call Amp_VERTEX_StoVV_Topology3_VS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

  End Do


! {Hm, VP}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVP 
coup1 = cpletIHmVPVWp1(i1)
coup2 = cplcHmcVWpVP(i1)
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVWpcVWp


Subroutine Amplitude_WAVE_radinuZeeHB_etIToVZVZ(MetI,MetI2,MVZ,MVZ2,ZfetI,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MetI2,MVZ,MVZ2

Complex(dp), Intent(in) :: ZfetI,ZfVZ

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

! External masses 
Mex1 = MetI 
Mex2 = MVZ 
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
Amp(:) = 0._dp
End Subroutine Amplitude_WAVE_radinuZeeHB_etIToVZVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVZVZ(MAh,MetI,MFd,MFe,MFu,               & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhetIetI,cplAhhhVZ,cpletIetIetI,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,              & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1, & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhhhVZ(2),cpletIetIetI,cplcFdFdetIL(3,3),cplcFdFdetIR(3,3), & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,          & 
& cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),               & 
& cplAhAhVZVZ1,cpletIetIVZVZ1,cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhhhVZVZ1(2,2),   & 
& cplHmcHmVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
! External masses 
Mex1 = MetI 
Mex2 = MVZ 
Mex3 = MVZ 


! {Ah, Ah, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhAhetI
coup2 = cplAhhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Ah, etI, hh}
    Do i3=1,2
ML1 = MAh 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cplAhhhVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, Ah, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1 = cplAhetIetI
coup2 = cpletIhhVZ(i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {etI, etI, hh}
    Do i3=1,2
ML1 = MetI 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1 = cpletIetIetI
coup2 = cpletIhhVZ(i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do


! {Fd, Fd, Fd}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(i2,i1)
coup1R = cplcFdFdetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
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
coup1L = cplcFeFeetIL(i2,i1)
coup1R = cplcFeFeetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
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
coup1L = cplcFuFuetIL(i2,i1)
coup1R = cplcFuFuetIR(i2,i1)
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
Amp(:) = Amp(:) + oo16pi2*(6)*AmpC 
    End Do
  End Do
End Do


! {gWp, gWp, gWp}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWpgWpetI
coup2 = cplcgWpgWpVZ
coup3 = cplcgWpgWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {gWpC, gWpC, gWpC}
ML1 = MVWp 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cplcgWCgWCetI
coup2 = cplcgWCgWCVZ
coup3 = cplcgWCgWCVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_UUU(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 


! {hh, hh, Ah}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1 = cpletIhhhh(i1,i2)
coup2 = -cplAhhhVZ(i1)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, etI}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1 = cpletIhhhh(i1,i2)
coup2 = -cpletIhhVZ(i1)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, hh, VZ}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhVZVZ(i1)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = -cplHmcHmVZ(i3,i1)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(2)*AmpC 
    End Do
  End Do
End Do


! {Hm, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIHmVWp(i1)
coup2 = -cplHmcHmVZ(i3,i1)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Hm, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplcHmcVWpVZ(i1)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIHmVWp(i1)
coup2 = cplcHmcVWpVZ(i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {VWp, conj[Hm], VWp}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmVWp(i2)
coup2 = -cplcVWpVWpVZ
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {VWp, conj[Hm], conj[Hm]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIHmVWp(i2)
coup2 = cplcHmcVWpVZ(i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], VWp, VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmVWpVZ(i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIHmcHm(i2,i1)
coup2 = cplHmVWpVZ(i1)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {conj[Hm], VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(i1)
coup2 = cplHmcHmVZ(i1,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_SVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {conj[VWp], Hm, Hm}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1 = cpletIcHmcVWp(i2)
coup2 = cplHmVWpVZ(i3)
coup3 = -cplHmcHmVZ(i2,i3)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], Hm, conj[VWp]}
  Do i2=1,3
ML1 = MVWp 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1 = cpletIcHmcVWp(i2)
coup2 = cplcVWpVWpVZ
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1))*(Abs(coup2))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology1_VSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1,coup2,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do


! {Ah, Ah}
ML1 = MAh 
ML2 = MAh 
coup1 = cplAhAhetI
coup2 = cplAhAhVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 


! {etI, etI}
ML1 = MetI 
ML2 = MetI 
coup1 = cpletIetIetI
coup2 = cpletIetIVZVZ1
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 


! {hh, hh}
Do i1=1,2
  Do i2=1,2
ML1 = Mhh(i1) 
ML2 = Mhh(i2) 
coup1 = cpletIhhhh(i1,i2)
coup2 = cplhhhhVZVZ1(i1,i2)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1._dp/2._dp)*AmpC 
  End Do
End Do


! {Hm, Hm}
Do i1=1,3
  Do i2=1,3
ML1 = MHm(i1) 
ML2 = MHm(i2) 
coup1 = cpletIHmcHm(i1,i2)
coup2 = cplHmcHmVZVZ1(i2,i1)
Call Amp_VERTEX_StoVV_Topology2_SS(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(i1)
coup2 = cplHmVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology3_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {Hm, conj[VWp]}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIHmVWpVZ1(i1)
coup2 = cplcHmcVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do


! {conj[Hm], VWp}
Do i1=1,3
ML1 = MHm(i1) 
ML2 = MVWp 
coup1 = cpletIcHmcVWpVZ1(i1)
coup2 = cplHmVWpVZ(i1)
If (Abs(coup1)*Abs(coup2).gt.epsCoup) Then 
Call Amp_VERTEX_StoVV_Topology4_SV(Mex1,Mex2,Mex3,ML1,ML2,coup1,coup2,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:) = Amp(:) + oo16pi2*(1)*AmpC 

End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_etIToVZVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVZVZ(MAh,MetI,MFd,MFe,MFu,            & 
& Mhh,MHm,MVWp,MVZ,MAh2,MetI2,MFd2,MFe2,MFu2,Mhh2,MHm2,MVWp2,MVZ2,cplAhAhetI,            & 
& cplAhetIetI,cplAhhhVZ,cpletIetIetI,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,             & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh,         & 
& cpletIhhVZ,cpletIHmVWp,cpletIHmcHm,cpletIcHmcVWp,cplcFdFdVZL,cplcFdFdVZR,              & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplcgWpgWpVZ,cplcgWCgWCVZ,             & 
& cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,cplAhAhVZVZ1,cpletIetIVZVZ1, & 
& cpletIHmVWpVZ1,cpletIcHmcVWpVZ1,cplhhhhVZVZ1,cplHmcHmVZVZ1,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFe(3),MFu(3),Mhh(2),MHm(3),MVWp,MVZ,MAh2,MetI2,MFd2(3),              & 
& MFe2(3),MFu2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhetI,cplAhetIetI,cplAhhhVZ(2),cpletIetIetI,cplcFdFdetIL(3,3),cplcFdFdetIR(3,3), & 
& cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cplcgWpgWpetI,cplcgWCgWCetI,cpletIhhhh(2,2),cpletIhhVZ(2),cpletIHmVWp(3),              & 
& cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),  & 
& cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcgWpgWpVZ,cplcgWCgWCVZ,          & 
& cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3),               & 
& cplAhAhVZVZ1,cpletIetIVZVZ1,cpletIHmVWpVZ1(3),cpletIcHmcVWpVZ1(3),cplhhhhVZVZ1(2,2),   & 
& cplHmcHmVZVZ1(3,3)

Complex(dp), Intent(out) :: Amp(2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Amp(:) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MetI 
Mex2 = MVZ 
Mex3 = MVZ 

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_etIToVZVZ



End Module OneLoopDecay_etI_radinuZeeHB
