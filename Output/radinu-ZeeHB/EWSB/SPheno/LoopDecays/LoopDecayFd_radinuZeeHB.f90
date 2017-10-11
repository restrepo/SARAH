! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fd_radinuZeeHB
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

Subroutine Amplitude_Tree_radinuZeeHB_FdToFdAh(cplcFdFdAhL,cplcFdFdAhR,               & 
& MAh,MFd,MAh2,MFd2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFd(3),MAh2,MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1L = cplcFdFdAhL(gt1,gt2)
coupT1R = cplcFdFdAhR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FdToFdAh


Subroutine Gamma_Real_radinuZeeHB_FdToFdAh(MLambda,em,gs,cplcFdFdAhL,cplcFdFdAhR,     & 
& MAh,MFd,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3)

Real(dp), Intent(in) :: MAh,MFd(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFdFdAhL(i1,i2)
CoupR = cplcFdFdAhR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FdToFdAh


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdAh(cplcFdFdAhL,cplcFdFdAhR,               & 
& ctcplcFdFdAhL,ctcplcFdFdAhR,MAh,MAh2,MFd,MFd2,ZfAh,ZfDL,ZfDR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MFd(3),MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFdAhL(3,3),ctcplcFdFdAhR(3,3)

Complex(dp), Intent(in) :: ZfAh,ZfDL(3,3),ZfDR(3,3)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdAhL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdAhR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdAhL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdAhR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdAhL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdAhR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh*cplcFdFdAhL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh*cplcFdFdAhR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdAh


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdAh(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhAh,        & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,       & 
& cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFdFdetIL,       & 
& cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,              & 
& cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,             & 
& cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),     & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFdFuVWpL(3,3),              & 
& cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh 


! {Ah, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
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


! {etI, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
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


! {Fd, Ah, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhAhAh
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
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


! {Fd, Ah, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
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


! {Fd, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fu, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplAhHmcHm(i2,i3)
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


! {Fu, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplAhcHmcVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = -cplAhHmVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
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


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3)
coup3R = cplcFdFdAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
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


! {VWp, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFuVWpR(gt1,i2)
coup1R = -cplcFdFuVWpL(gt1,i2)
coup2L = -cplcFuFdcVWpR(i3,gt2)
coup2R = -cplcFuFdcVWpL(i3,gt2)
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


! {VZ, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
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


! {conj[Hm], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(gt1,i2,i1)
coup1R = cplcFdFucHmR(gt1,i2,i1)
coup2L = cplcFuFdHmL(i3,gt2,i1)
coup2R = cplcFuFdHmR(i3,gt2,i1)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdAh(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,         & 
& cplcFuFuAhL,cplcFuFuAhR,cplAhhhhh,cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,        & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,             & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFdFdAhL(3,3),         & 
& cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),        & 
& cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),     & 
& cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFdFuVWpL(3,3),              & 
& cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MAh 


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3)
coup3R = cplcFdFdAhR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdAhL(i2,i3)
coup3R = cplcFdFdAhR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdAh


Subroutine Amplitude_Tree_radinuZeeHB_FdToFdetI(cplcFdFdetIL,cplcFdFdetIR,            & 
& MetI,MFd,MetI2,MFd2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFd(3),MetI2,MFd2(3)

Complex(dp), Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1L = cplcFdFdetIL(gt1,gt2)
coupT1R = cplcFdFdetIR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FdToFdetI


Subroutine Gamma_Real_radinuZeeHB_FdToFdetI(MLambda,em,gs,cplcFdFdetIL,               & 
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
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFdFdetIL(i1,i2)
CoupR = cplcFdFdetIR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FdToFdetI


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdetI(cplcFdFdetIL,cplcFdFdetIR,            & 
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

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdetIL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdetIR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdetIL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdetIR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdetIL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdetIR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfetI*cplcFdFdetIL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfetI*cplcFdFdetIR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdetI


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdetI(MAh,MetI,MFd,MFu,Mhh,               & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MetI 


! {Ah, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
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


! {etI, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
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


! {Fd, Ah, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
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


! {Fd, Ah, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cpletIetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
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


! {Fd, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
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


! {Fu, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cpletIHmcHm(i2,i3)
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


! {Fu, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cpletIcHmcVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = -cpletIHmVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {hh, bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
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


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdetIL(i2,i3)
coup3R = cplcFdFdetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
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


! {VWp, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFuVWpR(gt1,i2)
coup1R = -cplcFdFuVWpL(gt1,i2)
coup2L = -cplcFuFdcVWpR(i3,gt2)
coup2R = -cplcFuFdcVWpL(i3,gt2)
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


! {VZ, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
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


! {conj[Hm], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(gt1,i2,i1)
coup1R = cplcFdFucHmR(gt1,i2,i1)
coup2L = cplcFuFdHmL(i3,gt2,i1)
coup2R = cplcFuFdHmR(i3,gt2,i1)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI(MAh,MetI,MFd,MFu,Mhh,            & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MetI 


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdetIL(i2,i3)
coup3R = cplcFdFdetIR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdetIL(i2,i3)
coup3R = cplcFdFdetIR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdetI


Subroutine Amplitude_Tree_radinuZeeHB_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,               & 
& MFd,Mhh,MFd2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),Mhh(2),MFd2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Complex(dp) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFdhhL(gt1,gt2,gt3)
coupT1R = cplcFdFdhhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FdToFdhh


Subroutine Gamma_Real_radinuZeeHB_FdToFdhh(MLambda,em,gs,cplcFdFdhhL,cplcFdFdhhR,     & 
& MFd,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Real(dp), Intent(in) :: MFd(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,2), GammarealGluon(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
CoupL = cplcFdFdhhL(i1,i2,i3)
CoupR = cplcFdFdhhR(i1,i2,i3)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,1._dp/9._dp,0._dp,1._dp/9._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FdToFdhh


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdhh(cplcFdFdhhL,cplcFdFdhhR,               & 
& ctcplcFdFdhhL,ctcplcFdFdhhR,MFd,MFd2,Mhh,Mhh2,ZfDL,ZfDR,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFdFdhhL(3,3,2),ctcplcFdFdhhR(3,3,2)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),Zfhh(2,2)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdhhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFdFdhhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdhhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdhhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdhhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdhhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcFdFdhhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcFdFdhhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdhh


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdhh(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplAhAhhh,        & 
& cplAhetIhh,cplcFdFdAhL,cplcFdFdAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFdFdetIL,       & 
& cplcFdFdetIR,cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,    & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFdFucHmL,cplcFdFucHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,      & 
& cplhhcHmcVWp,Amp)

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
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


! {etI, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
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


! {Fd, Ah, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
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


! {Fd, VZ, Ah}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MAh 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Ah, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
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


! {Fd, VZ, etI}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MetI 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
coup3 = cpletIhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, Ah, VZ}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MVZ 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, VZ}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MVZ 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cpletIhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, VZ, VZ}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFdVZR(i1,gt2)
coup2R = -cplcFdFdVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = cplhhHmcHm(gt3,i2,i3)
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


! {Fu, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplhhcHmcVWp(gt3,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = -cplhhHmVWp(gt3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = -cplcFuFdcVWpR(i1,gt2)
coup2R = -cplcFuFdcVWpL(i1,gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
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


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
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


! {VWp, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFuVWpR(gt1,i2)
coup1R = -cplcFdFuVWpL(gt1,i2)
coup2L = -cplcFuFdcVWpR(i3,gt2)
coup2R = -cplcFuFdcVWpL(i3,gt2)
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


! {VZ, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFdFdVZR(i3,gt2)
coup2R = -cplcFdFdVZL(i3,gt2)
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


! {conj[Hm], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(gt1,i2,i1)
coup1R = cplcFdFucHmR(gt1,i2,i1)
coup2L = cplcFuFdHmL(i3,gt2,i1)
coup2R = cplcFuFdHmR(i3,gt2,i1)
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
    End Do
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdhh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh(MAh,MetI,MFd,MFu,Mhh,             & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = Mhh(gt3) 


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFdFdVGR(i3,gt2)
coup2R = -cplcFdFdVGL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFdFdVPR(i3,gt2)
coup2R = -cplcFdFdVPL(i3,gt2)
coup3L = cplcFdFdhhL(i2,i3,gt3)
coup3R = cplcFdFdhhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdhh


Subroutine Amplitude_Tree_radinuZeeHB_FdToFdVZ(cplcFdFdVZL,cplcFdFdVZR,               & 
& MFd,MVZ,MFd2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MVZ,MFd2(3),MVZ2

Complex(dp), Intent(in) :: cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFdFdVZL(gt1,gt2)
coupT1R = cplcFdFdVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FdToFdVZ


Subroutine Gamma_Real_radinuZeeHB_FdToFdVZ(MLambda,em,gs,cplcFdFdVZL,cplcFdFdVZR,     & 
& MFd,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

Real(dp), Intent(in) :: MFd(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFdFdVZL(i1,i2)
CoupR = cplcFdFdVZR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFd(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp/3._dp,-1._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FdToFdVZ


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdVZ(cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,       & 
& MFd,MFd2,MVP,MVP2,MVZ,MVZ2,ZfDL,ZfDR,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),ZfVPVZ,ZfVZ

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdVZL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFdFdVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFdFdVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFdFdVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFdFdVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdVZ(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,    & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,cplcFdFuVWpR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,     & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhVZ(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),   & 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFdFuVWpL(3,3),              & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 


! {Ah, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
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


! {etI, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
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


! {Fd, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdAhL(i1,gt2)
coup2R = cplcFdFdAhR(i1,gt2)
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


! {Fd, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdetIL(i1,gt2)
coup2R = cplcFdFdetIR(i1,gt2)
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


! {Fd, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFdhhL(i1,gt2,i3)
coup2R = cplcFdFdhhR(i1,gt2,i3)
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


! {Fd, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFdVZL(i1,gt2)
coup2R = cplcFdFdVZR(i1,gt2)
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


! {Fu, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplHmcHmVZ(i2,i3)
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


! {Fu, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
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


! {Fu, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
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


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
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


! {VWp, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFuVWpL(gt1,i2)
coup1R = cplcFdFuVWpR(gt1,i2)
coup2L = cplcFuFdcVWpL(i3,gt2)
coup2R = cplcFuFdcVWpR(i3,gt2)
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


! {VZ, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
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


! {conj[Hm], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(gt1,i2,i1)
coup1R = cplcFdFucHmR(gt1,i2,i1)
coup2L = cplcFuFdHmL(i3,gt2,i1)
coup2R = cplcFuFdHmR(i3,gt2,i1)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplAhhhVZ,cplcFdFdetIL,cplcFdFdetIR,cpletIhhVZ,cplcFdFdhhL,    & 
& cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,               & 
& cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,cplhhVZVZ,              & 
& cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplAhhhVZ(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),   & 
& cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),& 
& cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),  & 
& cplcFdFdVZR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFdFuVWpL(3,3),              & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVZ 


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVZL(i2,i3)
coup3R = cplcFdFdVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVZ


Subroutine Amplitude_Tree_radinuZeeHB_FdToFuVWp(cplcFdFuVWpL,cplcFdFuVWpR,            & 
& MFd,MFu,MVWp,MFd2,MFu2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFu(3),MVWp,MFd2(3),MFu2(3),MVWp2

Complex(dp), Intent(in) :: cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1L = cplcFdFuVWpL(gt1,gt2)
coupT1R = cplcFdFuVWpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FdToFuVWp


Subroutine Gamma_Real_radinuZeeHB_FdToFuVWp(MLambda,em,gs,cplcFdFuVWpL,               & 
& cplcFdFuVWpR,MFd,MFu,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3)

Real(dp), Intent(in) :: MFd(3),MFu(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFdFuVWpL(i1,i2)
CoupR = cplcFdFuVWpR(i1,i2)
Mex1 = MFd(i1)
Mex2 = MFu(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp/3._dp,2._dp/3._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  Call hardgluonFFZW(Mex1,Mex2,Mex3,MLambda,4._dp/3._dp,gs,CoupL,CoupR,Gammarealgluon(i1,i2),kont)
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FdToFuVWp


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFuVWp(cplcFdFuVWpL,cplcFdFuVWpR,            & 
& ctcplcFdFuVWpL,ctcplcFdFuVWpR,MFd,MFd2,MFu,MFu2,MVWp,MVWp2,ZfDL,ZfDR,ZfUL,             & 
& ZfUR,ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MFu(3),MFu2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFuVWpL(3,3),ctcplcFdFuVWpR(3,3)

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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFuVWpL(gt1,gt2) 
ZcoupT1R = ctcplcFdFuVWpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFuVWpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFuVWpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFdFuVWpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFdFuVWpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWp*cplcFdFuVWpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWp*cplcFdFuVWpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFuVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFuVWp(MAh,MetI,MFd,MFu,Mhh,               & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cplcFdFdhhL,cplcFdFdhhR,            & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,           & 
& cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhHmVWp(3),    & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cpletIHmVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),& 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),& 
& cplcFdFucHmR(3,3,3),cplhhHmVWp(2,3),cplhhcVWpVWp(2),cplHmVPVWp(3),cplHmVWpVZ(3),       & 
& cplcVWpVPVWp,cplcVWpVWpVZ

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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 


! {Ah, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, hh, VWp}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
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


! {Fd, VP, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, VZ, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Ah, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = -cplAhHmVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, etI, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = -cpletIHmVWp(i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, hh, conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = -cplhhHmVWp(i2,i3)
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


! {Fd, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
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


! {Fd, VZ, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = cplcFdFdVZL(gt1,i1)
coup1R = cplcFdFdVZR(gt1,i1)
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


! {Fu, Hm, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhHmVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Hm, etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIHmVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, Hm, hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplhhHmVWp(i3,i2)
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


! {Fu, conj[VWp], hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
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


! {Fu, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], VP}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuVZL(i1,gt2)
coup2R = cplcFuFuVZR(i1,gt2)
coup3 = cplHmVWpVZ(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], VZ}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
coup2L = cplcFuFuVZL(i1,gt2)
coup2R = cplcFuFuVZR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fd], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
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


! {VG, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFuFuVZL(i3,gt2)
coup2R = cplcFuFuVZR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFuVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp(MAh,MetI,MFd,MFu,Mhh,            & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFuFuAhL,cplcFuFuAhR,cplAhHmVWp,cplcFdFdetIL,               & 
& cplcFdFdetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIHmVWp,cplcFdFdhhL,cplcFdFdhhR,            & 
& cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,cplcFdFdVZR,               & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVGL,cplcFuFuVGR,cplcFuFuVPL,cplcFuFuVPR,               & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFuVZL,cplcFuFuVZR,cplcFdFucHmL,cplcFdFucHmR,           & 
& cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,cplcVWpVPVWp,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplAhHmVWp(3),    & 
& cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),               & 
& cpletIHmVWp(3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFdFdVGL(3,3),cplcFdFdVGR(3,3),& 
& cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),& 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFdFucHmL(3,3,3),& 
& cplcFdFucHmR(3,3,3),cplhhHmVWp(2,3),cplhhcVWpVWp(2),cplHmVPVWp(3),cplHmVWpVZ(3),       & 
& cplcVWpVPVWp,cplcVWpVWpVZ

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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MVWp 


! {Fd, VP, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFuVWpL(i1,gt2)
coup2R = cplcFdFuVWpR(i1,gt2)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fd, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFdFdVPL(gt1,i1)
coup1R = cplcFdFdVPR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmVPVWp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
coup3 = cplHmVPVWp(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], VP}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
coup2L = cplcFuFuVPL(i1,gt2)
coup2R = cplcFuFuVPR(i1,gt2)
coup3 = cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VG, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFuFuVGL(i3,gt2)
coup2R = cplcFuFuVGR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFuFuVPL(i3,gt2)
coup2R = cplcFuFuVPR(i3,gt2)
coup3L = cplcFdFuVWpL(i2,i3)
coup3R = cplcFdFuVWpR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFuVWp


Subroutine Amplitude_Tree_radinuZeeHB_FdToFucHm(cplcFdFucHmL,cplcFdFucHmR,            & 
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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFdFucHmL(gt1,gt2,gt3)
coupT1R = cplcFdFucHmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FdToFucHm


Subroutine Gamma_Real_radinuZeeHB_FdToFucHm(MLambda,em,gs,cplcFdFucHmL,               & 
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
 
Do i1=1,3
  Do i2=1,3
    Do i3=2,3
CoupL = cplcFdFucHmL(i1,i2,i3)
CoupR = cplcFdFucHmR(i1,i2,i3)
Mex1 = MFd(i1)
Mex2 = MFu(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp/9._dp,-2._dp/9._dp,1._dp/3._dp,4._dp/9._dp,-2._dp/3._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,gs,4._dp/3._dp,4._dp/3._dp,0._dp,4._dp/3._dp,0._dp,0._dp,CoupL,CoupR,Gammarealgluon(i1,i2,i3),kont)
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FdToFucHm


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFucHm(cplcFdFucHmL,cplcFdFucHmR,            & 
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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFucHmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFdFucHmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDR(i1,gt1)*cplcFdFucHmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFucHmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfUL(i1,gt2)*cplcFdFucHmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfUR(i1,gt2))*cplcFdFucHmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHm(i1,gt3))*cplcFdFucHmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHm(i1,gt3))*cplcFdFucHmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFucHm


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFucHm(MAh,MetI,MFd,MFu,Mhh,               & 
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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHm(gt3) 


! {Ah, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFuFuAhL(i3,gt2)
coup2R = cplcFuFuAhR(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFuFuetIL(i3,gt2)
coup2R = cplcFuFuetIR(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fd, Ah, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MVWp 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cplAhcHmcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, etI, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MVWp 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cpletIcHmcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, hh, VWp}
Do i1=1,3
  Do i2=1,2
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cplhhcHmcVWp(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fd, VP, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cplcHmcVWpVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, VZ, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cplcHmcVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, Ah, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFdFdAhL(gt1,i1)
coup1R = cplcFdFdAhR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplAhHmcHm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, etI, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1L = cplcFdFdetIL(gt1,i1)
coup1R = cplcFdFdetIR(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cpletIHmcHm(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, hh, conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFdhhL(gt1,i1,i2)
coup1R = cplcFdFdhhR(gt1,i1,i2)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplhhHmcHm(i2,i3,gt3)
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


! {Fd, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmcHmVP(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fd, VZ, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = -cplcFdFdVZR(gt1,i1)
coup1R = -cplcFdFdVZL(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmcHmVZ(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhHmcHm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], Ah}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MAh 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = cplcFuFuAhL(i1,gt2)
coup2R = cplcFuFuAhR(i1,gt2)
coup3 = cplAhcHmcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Hm, etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIHmcHm(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], etI}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MetI 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = cplcFuFuetIL(i1,gt2)
coup2R = cplcFuFuetIR(i1,gt2)
coup3 = cpletIcHmcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Hm, hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplhhHmcHm(i3,i2,gt3)
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


! {Fu, conj[VWp], hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = cplcFuFuhhL(i1,gt2,i3)
coup2R = cplcFuFuhhR(i1,gt2,i3)
coup3 = cplhhcHmcVWp(i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplHmcHmVP(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], VP}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplcHmcVWpVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fu, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = cplHmcHmVZ(i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], VZ}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = -cplcFuFuVZR(i1,gt2)
coup2R = -cplcFuFuVZL(i1,gt2)
coup3 = cplcHmcVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fd], bar[Fu]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFuFuhhL(i3,gt2,i1)
coup2R = cplcFuFuhhR(i3,gt2,i1)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
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


! {VG, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVZR(gt1,i2)
coup1R = -cplcFdFdVZL(gt1,i2)
coup2L = -cplcFuFuVZR(i3,gt2)
coup2R = -cplcFuFuVZL(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFucHm


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm(MAh,MetI,MFd,MFu,Mhh,            & 
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
Mex1 = MFd(gt1) 
Mex2 = MFu(gt2) 
Mex3 = MHm(gt3) 


! {Fd, VP, VWp}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = -cplcFdFuVWpR(i1,gt2)
coup2R = -cplcFdFuVWpL(i1,gt2)
coup3 = cplcHmcVWpVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fd, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFd(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFdFdVPR(gt1,i1)
coup1R = -cplcFdFdVPL(gt1,i1)
coup2L = cplcFdFucHmL(i1,gt2,i3)
coup2R = cplcFdFucHmR(i1,gt2,i3)
coup3 = cplHmcHmVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do


! {Fu, Hm, VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplHmcHmVP(i2,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], VP}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplcFdFuVWpR(gt1,i1)
coup1R = -cplcFdFuVWpL(gt1,i1)
coup2L = -cplcFuFuVPR(i1,gt2)
coup2R = -cplcFuFuVPL(i1,gt2)
coup3 = cplcHmcVWpVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VG, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVGR(gt1,i2)
coup1R = -cplcFdFdVGL(gt1,i2)
coup2L = -cplcFuFuVGR(i3,gt2)
coup2R = -cplcFuFuVGL(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFu(i3) 
coup1L = -cplcFdFdVPR(gt1,i2)
coup1R = -cplcFdFdVPL(gt1,i2)
coup2L = -cplcFuFuVPR(i3,gt2)
coup2R = -cplcFuFuVPL(i3,gt2)
coup3L = cplcFdFucHmL(i2,i3,gt3)
coup3R = cplcFdFucHmR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFucHm


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdVG(cplcFdFdVGL,cplcFdFdVGR,               & 
& ctcplcFdFdVGL,ctcplcFdFdVGR,MFd,MFd2,MVG,MVG2,ZfDL,ZfDR,ZfVG,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MVG,MVG2

Complex(dp), Intent(in) :: cplcFdFdVGL(3,3),cplcFdFdVGR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFdVGL(3,3),ctcplcFdFdVGR(3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),ZfVG

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVG 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFdFdVGL(gt1,gt2) 
ZcoupT1R = ctcplcFdFdVGR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVGL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVGR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVGL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVGR(gt1,i1)
End Do


! External Field 3 


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdVG


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdVG(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVGL,cplcFuFuVGR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),& 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplVGVGVG

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVG 


! {Ah, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
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


! {etI, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
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


! {Fd, VG, VG}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVG 
ML3 = MVG 
coup1L = cplcFdFdVGL(gt1,i1)
coup1R = cplcFdFdVGR(gt1,i1)
coup2L = cplcFdFdVGL(i1,gt2)
coup2R = cplcFdFdVGR(i1,gt2)
coup3 = cplVGVGVG
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {hh, bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
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


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
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


! {VWp, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFuVWpL(gt1,i2)
coup1R = cplcFdFuVWpR(gt1,i2)
coup2L = cplcFuFdcVWpL(i3,gt2)
coup2R = cplcFuFdcVWpR(i3,gt2)
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


! {VZ, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
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


! {conj[Hm], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(gt1,i2,i1)
coup1R = cplcFdFucHmR(gt1,i2,i1)
coup2L = cplcFuFdHmL(i3,gt2,i1)
coup2R = cplcFuFdHmR(i3,gt2,i1)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdVG


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVG(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVGL,cplcFuFuVGR,           & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplVGVGVG,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),& 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),cplVGVGVG

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVG 


! {Fd, VG, VG}
Do i1=1,3
ML1 = MFd(i1) 
ML2 = MVG 
ML3 = MVG 
coup1L = cplcFdFdVGL(gt1,i1)
coup1R = cplcFdFdVGR(gt1,i1)
coup2L = cplcFdFdVGL(i1,gt2)
coup2R = cplcFdFdVGR(i1,gt2)
coup3 = cplVGVGVG
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-3._dp/2._dp*(0.,1._dp))*AmpC 
End Do


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(-1._dp/6._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVGL(i2,i3)
coup3R = cplcFdFdVGR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVG


Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdVP(cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,ctcplcFdFdVPL,ctcplcFdFdVPR,ctcplcFdFdVZL,ctcplcFdFdVZR,       & 
& MFd,MFd2,MVP,MVP2,ZfDL,ZfDR,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFd(3),MFd2(3),MVP,MVP2

Complex(dp), Intent(in) :: cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFdFdVPL(3,3),ctcplcFdFdVPR(3,3),ctcplcFdFdVZL(3,3),ctcplcFdFdVZR(3,3)

Complex(dp), Intent(in) :: ZfDL(3,3),ZfDR(3,3),ZfVP,ZfVZVP

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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfDL(i1,gt1))*cplcFdFdVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfDR(i1,gt1)*cplcFdFdVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfDL(i1,gt2)*cplcFdFdVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfDR(i1,gt2))*cplcFdFdVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFdFdVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFdFdVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FdToFdVP


Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdVP(MAh,MetI,MFd,MFu,Mhh,MHm,            & 
& MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,cplcFdFdAhL,      & 
& cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,             & 
& cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,cplcFdFdVZL,               & 
& cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVPL,cplcFuFuVPR,cplcFdFuVWpL,          & 
& cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,             & 
& cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),& 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),           & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVP 


! {Ah, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdAhL(gt1,i2)
coup1R = cplcFdFdAhR(gt1,i2)
coup2L = cplcFdFdAhL(i3,gt2)
coup2R = cplcFdFdAhR(i3,gt2)
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


! {etI, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdetIL(gt1,i2)
coup1R = cplcFdFdetIR(gt1,i2)
coup2L = cplcFdFdetIL(i3,gt2)
coup2R = cplcFdFdetIR(i3,gt2)
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


! {Fu, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdHmL(i1,gt2,i3)
coup2R = cplcFuFdHmR(i1,gt2,i3)
coup3 = -cplHmcHmVP(i2,i3)
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


! {Fu, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
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


! {Fu, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFu(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFdFucHmL(gt1,i1,i2)
coup1R = cplcFdFucHmR(gt1,i1,i2)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = cplHmVPVWp(i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do


! {Fu, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFu(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFdFuVWpL(gt1,i1)
coup1R = cplcFdFuVWpR(gt1,i1)
coup2L = cplcFuFdcVWpL(i1,gt2)
coup2R = cplcFuFdcVWpR(i1,gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fd], bar[Fd]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdhhL(gt1,i2,i1)
coup1R = cplcFdFdhhR(gt1,i2,i1)
coup2L = cplcFdFdhhL(i3,gt2,i1)
coup2R = cplcFdFdhhR(i3,gt2,i1)
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


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
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


! {VWp, bar[Fu], bar[Fu]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFuVWpL(gt1,i2)
coup1R = cplcFdFuVWpR(gt1,i2)
coup2L = cplcFuFdcVWpL(i3,gt2)
coup2R = cplcFuFdcVWpR(i3,gt2)
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


! {VZ, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVZL(gt1,i2)
coup1R = cplcFdFdVZR(gt1,i2)
coup2L = cplcFdFdVZL(i3,gt2)
coup2R = cplcFdFdVZR(i3,gt2)
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


! {conj[Hm], bar[Fu], bar[Fu]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFu(i2) 
ML3 = MFu(i3) 
coup1L = cplcFdFucHmL(gt1,i2,i1)
coup1R = cplcFdFucHmR(gt1,i2,i1)
coup2L = cplcFuFdHmL(i3,gt2,i1)
coup2R = cplcFuFdHmR(i3,gt2,i1)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FdToFdVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVP(MAh,MetI,MFd,MFu,Mhh,             & 
& MHm,MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2,MFu2,Mhh2,MHm2,MVG2,MVP2,MVWp2,MVZ2,              & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,             & 
& cplcFuFdHmL,cplcFuFdHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFdFdVPL,cplcFdFdVPR,               & 
& cplcFdFdVZL,cplcFdFdVZR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFuVPL,cplcFuFuVPR,           & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,cplHmVPVWp,cplHmcHmVP,             & 
& cplcVWpVPVWp,cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFd(3),MFu(3),Mhh(2),MHm(3),MVG,MVP,MVWp,MVZ,MAh2,MetI2,MFd2(3),             & 
& MFu2(3),Mhh2(2),MHm2(3),MVG2,MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),& 
& cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFdFdVGL(3,3),             & 
& cplcFdFdVGR(3,3),cplcFdFdVPL(3,3),cplcFdFdVPR(3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),  & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuVPL(3,3),cplcFuFuVPR(3,3),               & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),           & 
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
Mex1 = MFd(gt1) 
Mex2 = MFd(gt2) 
Mex3 = MVP 


! {VG, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVG 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVGL(gt1,i2)
coup1R = cplcFdFdVGR(gt1,i2)
coup2L = cplcFdFdVGL(i3,gt2)
coup2R = cplcFdFdVGR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(4._dp/3._dp)*AmpC 
    End Do
  End Do


! {VP, bar[Fd], bar[Fd]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFd(i2) 
ML3 = MFd(i3) 
coup1L = cplcFdFdVPL(gt1,i2)
coup1R = cplcFdFdVPR(gt1,i2)
coup2L = cplcFdFdVPL(i3,gt2)
coup2R = cplcFdFdVPR(i3,gt2)
coup3L = cplcFdFdVPL(i2,i3)
coup3R = cplcFdFdVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FdToFdVP



End Module OneLoopDecay_Fd_radinuZeeHB
