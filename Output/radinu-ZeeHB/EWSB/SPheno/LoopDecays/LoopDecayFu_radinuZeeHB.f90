! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fu_radinuZeeHB
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

Subroutine Amplitude_Tree_radinuZeeHB_FuToFuAh(cplcFuFuAhL,cplcFuFuAhR,               & 
& MAh,MFu,MAh2,MFu2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFu(3),MAh2,MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1L = cplcFuFuAhL(gt1,gt2)
coupT1R = cplcFuFuAhR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FuToFuAh


Subroutine Gamma_Real_radinuZeeHB_FuToFuAh(MLambda,em,gs,cplcFuFuAhL,cplcFuFuAhR,     & 
& MAh,MFu,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3)

Real(dp), Intent(in) :: MAh,MFu(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFuFuAhL(i1,i2)
CoupR = cplcFuFuAhR(i1,i2)
Mex1 = MFu(i1)
Mex2 = MFu(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,4._dp/9._dp,0._dp,4._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FuToFuAh


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuAh(cplcFuFuAhL,cplcFuFuAhR,               & 
& ctcplcFuFuAhL,ctcplcFuFuAhR,MAh,MAh2,MFu,MFu2,ZfAh,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MFu(3),MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFuAhL(3,3),ctcplcFuFuAhR(3,3)

Complex(dp), Intent(in) :: ZfAh,ZfUL(3,3),ZfUR(3,3)

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
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuAhL(gt1,gt2) 
ZcoupT1R = ctcplcFuFuAhR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt1)*cplcFuFuAhL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFuAhR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFuFuAhL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFuFuAhR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh*cplcFuFuAhL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh*cplcFuFuAhR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuAh


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuAh(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhAh,        & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFuFuetIL,       & 
& cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,          & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),     & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

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
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MAh 


! {Ah, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = -cplAhcHmcVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplAhHmcHm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, Ah, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhAhAh
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhAhhh(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplAhAhhh(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplAhhhhh(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = -cplAhhhVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fd], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdHmL(gt1,i2,i1)
coup1R = cplcFuFdHmR(gt1,i2,i1)
coup2L = cplcFdFucHmL(i3,gt2,i1)
coup2R = cplcFdFucHmR(i3,gt2,i1)
coup3L = cplcFdFdAhL(i2,i3)
coup3R = cplcFdFdAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVZR(gt1,i2)
coup1R = -cplcFuFuVZL(gt1,i2)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i2)
coup1R = -cplcFuFdcVWpL(gt1,i2)
coup2L = -cplcFdFuVWpR(i3,gt2)
coup2R = -cplcFdFuVWpL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3)
coup3R = cplcFdFdAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuAh(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,        & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,cplcFuFdcVWpR,         & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),     & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),           & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),& 
& cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

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
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MAh 


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFuFuAhL(i2,i3)
coup3R = cplcFuFuAhR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuAh


Subroutine Amplitude_Tree_radinuZeeHB_FuToFuetI(cplcFuFuetIL,cplcFuFuetIR,            & 
& MetI,MFu,MetI2,MFu2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFu(3),MetI2,MFu2(3)

Complex(dp), Intent(in) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1L = cplcFuFuetIL(gt1,gt2)
coupT1R = cplcFuFuetIR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FuToFuetI


Subroutine Gamma_Real_radinuZeeHB_FuToFuetI(MLambda,em,gs,cplcFuFuetIL,               & 
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
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFuFuetIL(i1,i2)
CoupR = cplcFuFuetIR(i1,i2)
Mex1 = MFu(i1)
Mex2 = MFu(i2)
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,4._dp/9._dp,0._dp,4._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FuToFuetI


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuetI(cplcFuFuetIL,cplcFuFuetIR,            & 
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

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuetIL(gt1,gt2) 
ZcoupT1R = ctcplcFuFuetIR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt1)*cplcFuFuetIL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFuetIR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFuFuetIL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFuFuetIR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfetI*cplcFuFuetIL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfetI*cplcFuFuetIR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuetI


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuetI(MAh,MetI,MFd,MFu,Mhh,               & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MetI 


! {Ah, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = -cpletIcHmcVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cpletIHmcHm(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, Ah, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhetIhh(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIetIhh(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplAhetIhh(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cpletIetIhh(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cpletIhhhh(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = -cpletIhhVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fd], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdHmL(gt1,i2,i1)
coup1R = cplcFuFdHmR(gt1,i2,i1)
coup2L = cplcFdFucHmL(i3,gt2,i1)
coup2R = cplcFdFucHmR(i3,gt2,i1)
coup3L = cplcFdFdetIL(i2,i3)
coup3R = cplcFdFdetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVZR(gt1,i2)
coup1R = -cplcFuFuVZL(gt1,i2)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i2)
coup1R = -cplcFuFdcVWpL(gt1,i2)
coup2L = -cplcFdFuVWpR(i3,gt2)
coup2R = -cplcFdFuVWpL(i3,gt2)
coup3L = cplcFdFdetIL(i2,i3)
coup3R = cplcFdFdetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI(MAh,MetI,MFd,MFu,Mhh,            & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MetI 


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFuFuetIL(i2,i3)
coup3R = cplcFuFuetIR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuetI


Subroutine Amplitude_Tree_radinuZeeHB_FuToFdHm(cplcFuFdHmL,cplcFuFdHmR,               & 
& MFd,MFu,MHm,MFd2,MFu2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),MHm(3),MFd2(3),MFu2(3),MHm2(3)

Complex(dp), Intent(in) :: cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFdHmL(gt1,gt2,gt3)
coupT1R = cplcFuFdHmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FuToFdHm


Subroutine Gamma_Real_radinuZeeHB_FuToFdHm(MLambda,em,gs,cplcFuFdHmL,cplcFuFdHmR,     & 
& MFd,MFu,MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3)

Real(dp), Intent(in) :: MFd(3),MFu(3),MHm(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,3), GammarealGluon(3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=2,3
CoupL = cplcFuFdHmL(i1,i2,i3)
CoupR = cplcFuFdHmR(i1,i2,i3)
Mex1 = MFu(i1)
Mex2 = MFd(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,-2._dp/9._dp,2._dp/3._dp,1._dp/9._dp,-1._dp/3._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FuToFdHm


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFdHm(cplcFuFdHmL,cplcFuFdHmR,               & 
& ctcplcFuFdHmL,ctcplcFuFdHmR,MFd,MFd2,MFu,MFu2,MHm,MHm2,ZfDL,ZfDR,ZfHm,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3)

Complex(dp), Intent(in) :: ctcplcFuFdHmL(3,3,3),ctcplcFuFdHmR(3,3,3)

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
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFdHmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFuFdHmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt1)*cplcFuFdHmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFdHmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFuFdHmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFuFdHmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfHm(i1,gt3)*cplcFuFdHmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfHm(i1,gt3)*cplcFuFdHmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFdHm


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFdHm(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhHmVWp(3),    & 
& cplAhHmcHm(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),& 
& cpletIHmVWp(3),cpletIHmcHm(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),& 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplhhHmVWp(2,3),   & 
& cplhhHmcHm(2,3,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3)

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
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MHm(gt3) 


! {Ah, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, VWp, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MAh 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhHmVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhHmcHm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MetI 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cpletIHmVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cpletIHmcHm(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhHmVWp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhHmcHm(i3,gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, VWp, VP}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplHmVPVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = -cplHmcHmVP(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, VZ}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = -cplHmcHmVZ(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplAhHmcHm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, etI, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cpletIHmcHm(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplhhHmcHm(i2,gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFuFuVPR(gt1,i1)
coup1R = -cplcFuFuVPL(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplHmcHmVP(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplHmcHmVZ(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Ah, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MVWp 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cplAhHmVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MVWp 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cpletIHmVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, conj[VWp]}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cplhhHmVWp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, VP, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFuFuVPR(gt1,i1)
coup1R = -cplcFuFuVPL(gt1,i1)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cplHmVPVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, VZ, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fu], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFuVZR(gt1,i2)
coup1R = -cplcFuFuVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFdHm


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplAhHmcHm,cplcFdFdetIL,    & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cpletIHmcHm,cplcFdFdhhL,            & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,               & 
& cplcFuFuVZR,cplhhHmVWp,cplhhHmcHm,cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhHmVWp(3),    & 
& cplAhHmcHm(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),& 
& cpletIHmVWp(3),cpletIHmcHm(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),& 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplhhHmVWp(2,3),   & 
& cplhhHmcHm(2,3,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplHmVWpVZ(3),cplHmcHmVZ(3,3)

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
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MHm(gt3) 


! {Fd, VWp, VP}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = cplHmVPVWp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = -cplcFdFdVPR(i1,gt2)
coup2R = -cplcFdFdVPL(i1,gt2)
coup3 = -cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFuFuVPR(gt1,i1)
coup1R = -cplcFuFuVPL(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplHmcHmVP(gt3,i3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, VP, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFuFuVPR(gt1,i1)
coup1R = -cplcFuFuVPL(gt1,i1)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cplHmVPVWp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFuFdHmL(i2,i3,gt3)
coup3R = cplcFuFdHmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFdHm


Subroutine Amplitude_Tree_radinuZeeHB_FuToFdcVWp(cplcFuFdcVWpL,cplcFuFdcVWpR,         & 
& MFd,MFu,MVWp,MFd2,MFu2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),MVWp,MFd2(3),MFu2(3),MVWp2

Complex(dp), Intent(in) :: cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1L = cplcFuFdcVWpL(gt1,gt2)
coupT1R = cplcFuFdcVWpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FuToFdcVWp


Subroutine Gamma_Real_radinuZeeHB_FuToFdcVWp(MLambda,em,gs,cplcFuFdcVWpL,             & 
& cplcFuFdcVWpR,MFd,MFu,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3)

Real(dp), Intent(in) :: MFd(3),MFu(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFuFdcVWpL(i1,i2)
CoupR = cplcFuFdcVWpR(i1,i2)
Mex1 = MFu(i1)
Mex2 = MFd(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,2._dp/3._dp,-1._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FuToFdcVWp


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFdcVWp(cplcFuFdcVWpL,cplcFuFdcVWpR,         & 
& ctcplcFuFdcVWpL,ctcplcFuFdcVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,           & 
& ZfUR,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFdcVWpL(3,3),ctcplcFuFdcVWpR(3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),ZfUL(3,3),ZfUR(3,3),ZfVWp

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFdcVWpL(gt1,gt2) 
ZcoupT1R = ctcplcFuFdcVWpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFdcVWpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfUR(i1,gt1)*cplcFuFdcVWpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFuFdcVWpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFuFdcVWpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWp*cplcFuFdcVWpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWp*cplcFuFdcVWpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFdcVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFdcVWp(MAh,MetI,MFd,MFu,Mhh,              & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHmcVWp,cplcFdFdetIL,             & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhcHmcVWp(3),  & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),             & 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplhhcVWpVWp(2),   & 
& cplhhcHmcVWp(2,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVWp 


! {Ah, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhcHmcVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cpletIcHmcVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhcVWpVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
coup3 = cplhhcHmcVWp(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fd, VWp, VP}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, VZ}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFdVZL(i1,gt2)
coup2R = cplcFdFdVZR(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdVZL(i1,gt2)
coup2R = cplcFdFdVZR(i1,gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, etI, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, Hm}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplhhcHmcVWp(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFuFuVPL(gt1,i1)
coup1R = cplcFuFuVPR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplcHmcVWpVP(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = cplcFuFuVZL(gt1,i1)
coup1R = cplcFuFuVZR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplcHmcVWpVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, conj[VWp]}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = cplhhcVWpVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, VP, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFuFuVPL(gt1,i1)
coup1R = cplcFuFuVPR(gt1,i1)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, VZ, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = cplcFuFuVZL(gt1,i1)
coup1R = cplcFuFuVZR(gt1,i1)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fu], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuVZL(gt1,i2)
coup1R = cplcFuFuVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFdcVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp(MAh,MetI,MFd,MFu,               & 
& Mhh,MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,               & 
& MVZ2,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhcHmcVWp,cplcFdFdetIL,        & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIcHmcVWp,cplcFdFdhhL,cplcFdFdhhR,          & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhcHmcVWp(3),  & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cpletIcHmcVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),             & 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),& 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),               & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplhhcVWpVWp(2),   & 
& cplhhcHmcVWp(2,3),cplcVWpVPVWp,cplcHmcVWpVP(3),cplcVWpVWpVZ,cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVWp 


! {Fd, VWp, VP}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFdVPL(i1,gt2)
coup2R = cplcFdFdVPR(i1,gt2)
coup3 = cplcHmcVWpVP(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, VP, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFuFuVPL(gt1,i1)
coup1R = cplcFuFuVPR(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplcHmcVWpVP(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, VP, conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFuFuVPL(gt1,i1)
coup1R = cplcFuFuVPR(gt1,i1)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFuFdcVWpL(i2,i3)
coup3R = cplcFuFdcVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFdcVWp


Subroutine Amplitude_Tree_radinuZeeHB_FuToFuhh(cplcFuFuhhL,cplcFuFuhhR,               & 
& MFu,Mhh,MFu2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),Mhh(2),MFu2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Complex(dp) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFuFuhhL(gt1,gt2,gt3)
coupT1R = cplcFuFuhhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FuToFuhh


Subroutine Gamma_Real_radinuZeeHB_FuToFuhh(MLambda,em,gs,cplcFuFuhhL,cplcFuFuhhR,     & 
& MFu,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Real(dp), Intent(in) :: MFu(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,2), GammarealGluon(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
CoupL = cplcFuFuhhL(i1,i2,i3)
CoupR = cplcFuFuhhR(i1,i2,i3)
Mex1 = MFu(i1)
Mex2 = MFu(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,4._dp/9._dp,4._dp/9._dp,0._dp,4._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FuToFuhh


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuhh(cplcFuFuhhL,cplcFuFuhhR,               & 
& ctcplcFuFuhhL,ctcplcFuFuhhR,MFu,MFu2,Mhh,Mhh2,Zfhh,ZfUL,ZfUR,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFuFuhhL(3,3,2),ctcplcFuFuhhR(3,3,2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfUL(3,3),ZfUR(3,3)

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuhhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFuFuhhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUR(i1,gt1)*cplcFuFuhhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFuhhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFuFuhhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFuFuhhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcFuFuhhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcFuFuhhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuhh


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuhh(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFuFuetIL,       & 
& cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,             & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,Amp)

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

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, VWp, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = -cplhhcHmcVWp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i1)
coup1R = -cplcFuFdcVWpL(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = -cplhhHmVWp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplhhHmcHm(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, Ah, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhhhhh(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, VZ, Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MAh 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Ah, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIhhhh(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, VZ, etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MetI 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplAhhhhh(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cpletIhhhh(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplhhhhhh(gt3,i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, Ah, VZ}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = MVZ 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, etI, VZ}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = MVZ 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = cpletIhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, VZ, VZ}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcFuFuVZR(gt1,i1)
coup1R = -cplcFuFuVZL(gt1,i1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fd], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdHmL(gt1,i2,i1)
coup1R = cplcFuFdHmR(gt1,i2,i1)
coup2L = cplcFdFucHmL(i3,gt2,i1)
coup2R = cplcFdFucHmR(i3,gt2,i1)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVZR(gt1,i2)
coup1R = -cplcFuFuVZL(gt1,i2)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFuFdcVWpR(gt1,i2)
coup1R = -cplcFuFdcVWpL(gt1,i2)
coup2L = -cplcFdFuVWpR(i3,gt2)
coup2R = -cplcFdFuVWpL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuhh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh(MAh,MetI,MFd,MFu,Mhh,             & 
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

Complex(dp), Intent(out) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
Amp(:,gt1, gt2, gt3) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = Mhh(gt3) 


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVGR(gt1,i2)
coup1R = -cplcFuFuVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFuFuVPR(gt1,i2)
coup1R = -cplcFuFuVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFuFuhhL(i2,i3,gt3)
coup3R = cplcFuFuhhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuhh


Subroutine Amplitude_Tree_radinuZeeHB_FuToFuVZ(cplcFuFuVZL,cplcFuFuVZR,               & 
& MFu,MVZ,MFu2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MVZ,MFu2(3),MVZ2

Complex(dp), Intent(in) :: cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFuFuVZL(gt1,gt2)
coupT1R = cplcFuFuVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FuToFuVZ


Subroutine Gamma_Real_radinuZeeHB_FuToFuVZ(MLambda,em,gs,cplcFuFuVZL,cplcFuFuVZR,     & 
& MFu,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp), Intent(in) :: MFu(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFuFuVZL(i1,i2)
CoupR = cplcFuFuVZR(i1,i2)
Mex1 = MFu(i1)
Mex2 = MFu(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,2._dp/3._dp,2._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FuToFuVZ


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuVZ(cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,       & 
& MFu,MFu2,MVP,MVP2,MVZ,MVZ2,ZfUL,ZfUR,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3)

Complex(dp), Intent(in) :: ZfUL(3,3),ZfUR(3,3),ZfVPVZ,ZfVZ

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuVZL(gt1,gt2) 
ZcoupT1R = ctcplcFuFuVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFuVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfUR(i1,gt1)*cplcFuFuVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFuFuVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFuFuVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFuFuVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFuFuVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFuFuVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFuFuVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuVZ(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhVZ(2),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),   & 
& cpletIhhVZ(2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3), & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3), & 
& cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),               & 
& cplcFdFucHmR(3,3,3),cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,           & 
& cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVZ 


! {Ah, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, VWp, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = cplcHmcVWpVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmVWpVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmcHmVZ(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Fu, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhhhVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIhhVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFuFuAhL(gt1,i1)
coup1R = cplcFuFuAhR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = -cplAhhhVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFuFuetIL(gt1,i1)
coup1R = cplcFuFuetIR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = -cpletIhhVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFuFuVZL(gt1,i1)
coup1R = cplcFuFuVZR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplhhVZVZ(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFu(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFuFuhhL(gt1,i1,i2)
coup1R = cplcFuFuhhR(gt1,i1,i2)
coup2L = cplcFuFuVZL(i1,gt2)
coup2R = cplcFuFuVZR(i1,gt2)
coup3 = cplhhVZVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fd], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdHmL(gt1,i2,i1)
coup1R = cplcFuFdHmR(gt1,i2,i1)
coup2L = cplcFdFucHmL(i3,gt2,i1)
coup2R = cplcFdFucHmR(i3,gt2,i1)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVZL(gt1,i2)
coup1R = cplcFuFuVZR(gt1,i2)
coup2L = cplcFuFuVZL(i3,gt2)
coup2R = cplcFuFuVZR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdcVWpL(gt1,i2)
coup1R = cplcFuFdcVWpR(gt1,i2)
coup2L = cplcFdFuVWpL(i3,gt2)
coup2R = cplcFdFuVWpR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhVZ,cplcFuFuetIL,cplcFuFuetIR,cpletIhhVZ,cplcFuFdHmL,    & 
& cplcFuFdHmR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,           & 
& cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,              & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,              & 
& cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhVZ(2),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),   & 
& cpletIhhVZ(2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3), & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3), & 
& cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),               & 
& cplcFdFucHmR(3,3,3),cplhhVZVZ(2),cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ,           & 
& cplcHmcVWpVZ(3)

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVZ 


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFuFuVZL(i2,i3)
coup3R = cplcFuFuVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVZ


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuVG(cplcFuFuVGL,cplcFuFuVGR,               & 
& ctcplcFuFuVGL,ctcplcFuFuVGR,MFu,MFu2,MVG,MVG2,ZfUL,ZfUR,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),MVG,MVG2

Complex(dp), Intent(in) :: cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFuVGL(3,3),ctcplcFuFuVGR(3,3)

Complex(dp), Intent(in) :: ZfUL(3,3),ZfUR(3,3),ZfVG

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVG 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFuFuVGL(gt1,gt2) 
ZcoupT1R = ctcplcFuFuVGR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFuVGL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfUR(i1,gt1)*cplcFuFuVGR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFuFuVGL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFuFuVGR(gt1,i1)
End Do


! External Field 3 


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuVG


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuVG(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,             & 
& cplcFdFdVGR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdHmL(3,3,3),& 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFdcVWpL(3,3),               & 
& cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplVGVGVG

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVG 


! {Ah, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fu, VG, VG}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVG 
ML3 = MVG 
coup1L = cplcFuFuVGL(gt1,i1)
coup1R = cplcFuFuVGR(gt1,i1)
coup2L = cplcFuFuVGL(i1,gt2)
coup2R = cplcFuFuVGR(i1,gt2)
coup3 = cplVGVGVG
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {hh, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fd], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdHmL(gt1,i2,i1)
coup1R = cplcFuFdHmR(gt1,i2,i1)
coup2L = cplcFdFucHmL(i3,gt2,i1)
coup2R = cplcFdFucHmR(i3,gt2,i1)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVZL(gt1,i2)
coup1R = cplcFuFuVZR(gt1,i2)
coup2L = cplcFuFuVZL(i3,gt2)
coup2R = cplcFuFuVZR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdcVWpL(gt1,i2)
coup1R = cplcFuFdcVWpR(gt1,i2)
coup2L = cplcFdFuVWpL(i3,gt2)
coup2R = cplcFdFuVWpR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuVG


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVG(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdHmL(3,3,3),& 
& cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFuFdcVWpL(3,3),               & 
& cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplVGVGVG

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVG 


! {Fu, VG, VG}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVG 
ML3 = MVG 
coup1L = cplcFuFuVGL(gt1,i1)
coup1R = cplcFuFuVGR(gt1,i1)
coup2L = cplcFuFuVGL(i1,gt2)
coup2R = cplcFuFuVGR(i1,gt2)
coup3 = cplVGVGVG
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFuFuVGL(i2,i3)
coup3R = cplcFuFuVGR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVG


Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuVP(cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFuFuVZL,cplcFuFuVZR,ctcplcFuFuVPL,ctcplcFuFuVPR,ctcplcFuFuVZL,ctcplcFuFuVZR,       & 
& MFu,MFu2,MVP,MVP2,ZfUL,ZfUR,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFu(3),MFu2(3),MVP,MVP2

Complex(dp), Intent(in) :: cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFuFuVPL(3,3),ctcplcFuFuVPR(3,3),ctcplcFuFuVZL(3,3),ctcplcFuFuVZR(3,3)

Complex(dp), Intent(in) :: ZfUL(3,3),ZfUR(3,3),ZfVP,ZfVZVP

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 
Complex(dp) :: TcoupT1, TcoupT1L, TcoupT1R 
Complex(dp) :: ZcoupT1, ZcoupT1L, ZcoupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfUL(i1,gt1))*cplcFuFuVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfUR(i1,gt1)*cplcFuFuVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFuFuVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFuFuVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFuFuVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFuFuVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FuToFuVP


Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuVP(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFuFuAhL,      & 
& cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVPL,             & 
& cplcFdFdVPR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,           & 
& cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,              & 
& cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdHmL(3,3,3),& 
& cplcFuFdHmR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdcVWpL(3,3),               & 
& cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3)

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVP 


! {Ah, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuAhL(gt1,i2)
coup1R = cplcFuFuAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuetIL(gt1,i2)
coup1R = cplcFuFuetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, VWp, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = cplcHmcVWpVP(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFuFdcVWpL(gt1,i1)
coup1R = cplcFuFdcVWpR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmVPVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFuFdHmL(gt1,i1,i2)
coup1R = cplcFuFdHmR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmcHmVP(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {hh, bar[Fu], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuhhL(gt1,i2,i1)
coup1R = cplcFuFuhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {Hm, bar[Fd], bar[Fd]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdHmL(gt1,i2,i1)
coup1R = cplcFuFdHmR(gt1,i2,i1)
coup2L = cplcFdFucHmL(i3,gt2,i1)
coup2R = cplcFdFucHmR(i3,gt2,i1)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
End Do


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVZL(gt1,i2)
coup1R = cplcFuFuVZR(gt1,i2)
coup2L = cplcFuFuVZL(i3,gt2)
coup2R = cplcFuFuVZR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[VWp], bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFuFdcVWpL(gt1,i2)
coup1R = cplcFuFdcVWpR(gt1,i2)
coup2L = cplcFdFuVWpL(i3,gt2)
coup2R = cplcFdFuVWpR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FuToFuVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVP(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,             & 
& cplcFdFdVPL,cplcFdFdVPR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,           & 
& cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,cplcFdFuVWpR,             & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,cplHmcHmVP,               & 
& cplcVWpVPVWp,cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdHmL(3,3,3),& 
& cplcFuFdHmR(3,3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFuFdcVWpL(3,3),               & 
& cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),             & 
& cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),& 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3)

Complex(dp), Intent(out) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Real(dp) :: ML1, ML2, ML3 
Complex(dp) :: coupT1, coupT1L, coupT1R, coup1, coup1L, coup1R 
Complex(dp) :: coup2, coup2L, coup2R, coup3, coup3L, coup3R, coup2a,coup2b,coup2c 
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFu(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVP 


! {VG, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVGL(gt1,i2)
coup1R = cplcFuFuVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFuFuVPL(gt1,i2)
coup1R = cplcFuFuVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFuFuVPL(i2,i3)
coup3R = cplcFuFuVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FuToFuVP



End Module OneLoopDecay_Fu_radinuZeeHB
