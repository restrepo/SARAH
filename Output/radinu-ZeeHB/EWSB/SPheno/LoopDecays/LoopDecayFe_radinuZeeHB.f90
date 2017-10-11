! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fe_radinuZeeHB
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

Subroutine Amplitude_Tree_radinuZeeHB_FeToFeAh(cplcFeFeAhL,cplcFeFeAhR,               & 
& MAh,MFe,MAh2,MFe2,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MAh2,MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 
! Tree-Level Vertex 
coupT1L = cplcFeFeAhL(gt1,gt2)
coupT1R = cplcFeFeAhR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FeToFeAh


Subroutine Gamma_Real_radinuZeeHB_FeToFeAh(MLambda,em,gs,cplcFeFeAhL,cplcFeFeAhR,     & 
& MAh,MFe,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3)

Real(dp), Intent(in) :: MAh,MFe(3)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFeAhL(i1,i2)
CoupR = cplcFeFeAhR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MAh
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FeToFeAh


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeAh(cplcFeFeAhL,cplcFeFeAhR,               & 
& ctcplcFeFeAhL,ctcplcFeFeAhR,MAh,MAh2,MFe,MFe2,ZfAh,ZfEL,ZfER,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MFe(3),MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeAhL(3,3),ctcplcFeFeAhR(3,3)

Complex(dp), Intent(in) :: ZfAh,ZfEL(3,3),ZfER(3,3)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeAhL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeAhR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFeAhL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeAhR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeAhL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeAhR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfAh*cplcFeFeAhL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfAh*cplcFeFeAhR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeAh


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeAh(MAh,MetI,MFe,MFv,Mhh,MHm,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhAh,cplAhAhetI,      & 
& cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,          & 
& cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,               & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFeFeAhL(3,3),         & 
& cplcFeFeAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),            & 
& cplAhcHmcVWp(3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3), & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, Ah, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhAh
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
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


! {Fe, Ah, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
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


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
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


! {Fv, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWpR(gt1,i1)
coup1R = -cplcFeFvVWpL(gt1,i1)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = -cplFvFecVWpR(i1,gt2)
coup2R = -cplFvFecVWpL(i1,gt2)
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


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
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


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeAh(MAh,MetI,MFe,MFv,Mhh,             & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhAh,             & 
& cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,         & 
& cplAhhhVZ,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,     & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplcFeFeAhL(3,3),         & 
& cplcFeFeAhR(3,3),cplAhhhhh(2,2),cplAhhhVZ(2),cplAhHmVWp(3),cplAhHmcHm(3,3),            & 
& cplAhcHmcVWp(3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),& 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3), & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MAh 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeAhL(i2,i3)
coup3R = cplcFeFeAhR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeAh


Subroutine Amplitude_Tree_radinuZeeHB_FeToFeetI(cplcFeFeetIL,cplcFeFeetIR,            & 
& MetI,MFe,MetI2,MFe2,Amp)

Implicit None

Real(dp), Intent(in) :: MetI,MFe(3),MetI2,MFe2(3)

Complex(dp), Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3)

Complex(dp) :: Amp(2,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MetI 
! Tree-Level Vertex 
coupT1L = cplcFeFeetIL(gt1,gt2)
coupT1R = cplcFeFeetIR(gt1,gt2)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FeToFeetI


Subroutine Gamma_Real_radinuZeeHB_FeToFeetI(MLambda,em,gs,cplcFeFeetIL,               & 
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
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFeetIL(i1,i2)
CoupR = cplcFeFeetIR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MetI
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FeToFeetI


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeetI(cplcFeFeetIL,cplcFeFeetIR,            & 
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

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MetI 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeetIL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeetIR(gt1,gt2) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFeetIL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeetIR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeetIL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeetIR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfetI*cplcFeFeetIL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfetI*cplcFeFeetIR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2) = AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeetI


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeetI(MAh,MetI,MFe,MFv,Mhh,               & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MetI 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeetIL(i2,i3)
coup3R = cplcFeFeetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
coup3L = cplcFeFeetIL(i2,i3)
coup3R = cplcFeFeetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, Ah, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
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


! {Fe, Ah, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cplAhetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cpletIetIetI
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
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


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
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


! {Fv, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWpR(gt1,i1)
coup1R = -cplcFeFvVWpL(gt1,i1)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = -cplFvFecVWpR(i1,gt2)
coup2R = -cplFvFecVWpL(i1,gt2)
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


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeetIL(i2,i3)
coup3R = cplcFeFeetIR(i2,i3)
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


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeetIL(i2,i3)
coup3R = cplcFeFeetIR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFeetIL(i2,i3)
coup3R = cplcFeFeetIR(i2,i3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI(MAh,MetI,MFe,MFv,Mhh,            & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MetI 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFeetIL(i2,i3)
coup3R = cplcFeFeetIR(i2,i3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeetI


Subroutine Amplitude_Tree_radinuZeeHB_FeToFehh(cplcFeFehhL,cplcFeFehhR,               & 
& MFe,Mhh,MFe2,Mhh2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),Mhh(2),MFe2(3),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp) :: Amp(2,3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,2
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFehhL(gt1,gt2,gt3)
coupT1R = cplcFeFehhR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FeToFehh


Subroutine Gamma_Real_radinuZeeHB_FeToFehh(MLambda,em,gs,cplcFeFehhL,cplcFeFehhR,     & 
& MFe,Mhh,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Real(dp), Intent(in) :: MFe(3),Mhh(2)

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3,2), GammarealGluon(3,3,2) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
CoupL = cplcFeFehhL(i1,i2,i3)
CoupR = cplcFeFehhR(i1,i2,i3)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = Mhh(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,1._dp,0._dp,1._dp,0._dp,0._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FeToFehh


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFehh(cplcFeFehhL,cplcFeFehhR,               & 
& ctcplcFeFehhL,ctcplcFeFehhR,MFe,MFe2,Mhh,Mhh2,ZfEL,ZfER,Zfhh,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ctcplcFeFehhL(3,3,2),ctcplcFeFehhR(3,3,2)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),Zfhh(2,2)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFehhL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFeFehhR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFehhL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFehhR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFehhL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFehhR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,2
ZcoupT1L = ZcoupT1L + 0.5_dp*Zfhh(i1,gt3)*cplcFeFehhL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Zfhh(i1,gt3)*cplcFeFehhR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFehh


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFehh(MAh,MetI,MFe,MFv,Mhh,MHm,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplAhAhhh,cplAhetIhh,      & 
& cplcFeFeAhL,cplcFeFeAhR,cplAhhhhh,cplAhhhVZ,cpletIetIhh,cplcFeFeetIL,cplcFeFeetIR,     & 
& cpletIhhhh,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvVWpL,              & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,   & 
& cplhhVZVZ,cplhhcHmcVWp,Amp)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, Ah, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MAh 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhAhhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MAh 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
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


! {Fe, VZ, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MAh 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MetI 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cplAhetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MetI 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cpletIetIhh(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
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


! {Fe, VZ, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MetI 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cpletIhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, hh, hh}
Do i1=1,3
  Do i2=1,2
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = Mhh(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, Ah, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MVZ 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplAhhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MVZ 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cpletIhhVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fv, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWpR(gt1,i1)
coup1R = -cplcFeFvVWpL(gt1,i1)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = -cplFvFecVWpR(i1,gt2)
coup2R = -cplFvFecVWpL(i1,gt2)
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


! {Fv, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFeFvVWpR(gt1,i1)
coup1R = -cplcFeFvVWpL(gt1,i1)
coup2L = -cplFvFecVWpR(i1,gt2)
coup2R = -cplFvFecVWpL(i1,gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
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


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFehh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh(MAh,MetI,MFe,MFv,Mhh,             & 
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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = Mhh(gt3) 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFeVPR(gt1,i2)
coup1R = -cplcFeFeVPL(gt1,i2)
coup2L = -cplcFeFeVPR(i3,gt2)
coup2R = -cplcFeFeVPL(i3,gt2)
coup3L = cplcFeFehhL(i2,i3,gt3)
coup3R = cplcFeFehhR(i2,i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFehh


Subroutine Amplitude_Tree_radinuZeeHB_FeToFeVZ(cplcFeFeVZL,cplcFeFeVZR,               & 
& MFe,MVZ,MFe2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MVZ,MFe2(3),MVZ2

Complex(dp), Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplcFeFeVZL(gt1,gt2)
coupT1R = cplcFeFeVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FeToFeVZ


Subroutine Gamma_Real_radinuZeeHB_FeToFeVZ(MLambda,em,gs,cplcFeFeVZL,cplcFeFeVZR,     & 
& MFe,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Real(dp), Intent(in) :: MFe(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFeVZL(i1,i2)
CoupR = cplcFeFeVZR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFe(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFZ(Mex1,Mex2,Mex3,MLambda,-1._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FeToFeVZ


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeVZ(cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,       & 
& MFe,MFe2,MVP,MVP2,MVZ,MVZ2,ZfEL,ZfER,ZfVPVZ,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfVPVZ,ZfVZ

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFeVZL(gt1,gt2) 
ZcoupT1R = ctcplcFeFeVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVPVZ*cplcFeFeVPL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVPVZ*cplcFeFeVPR(gt1,gt2)
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplcFeFeVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeVZ(MAh,MetI,MFe,MFv,Mhh,MHm,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,      & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhVZ(2),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),   & 
& cpletIhhVZ(2),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhVZVZ(2),cplHmVWpVZ(3),  & 
& cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fe, hh, Ah}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MAh 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
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


! {Fe, hh, etI}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MetI 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
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


! {Fe, Ah, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = Mhh(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, etI, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = Mhh(i3) 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, VZ, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = Mhh(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, hh, VZ}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVZ 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
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


! {Fv, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWpL(gt1,i1)
coup1R = cplcFeFvVWpR(gt1,i1)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFecVWpL(i1,gt2)
coup2R = cplFvFecVWpR(i1,gt2)
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


! {Fv, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFeFvVWpL(gt1,i1)
coup1R = cplcFeFvVWpR(gt1,i1)
coup2L = cplFvFecVWpL(i1,gt2)
coup2R = cplFvFecVWpR(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
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


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VWp, Fv, Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvVWpL(gt1,i2)
coup1R = cplcFeFvVWpR(gt1,i2)
coup2L = cplFvFecVWpL(i3,gt2)
coup2R = cplFvFecVWpR(i3,gt2)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], Fv, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHmL(gt1,i2,i1)
coup1R = cplcFeFvcHmR(gt1,i2,i1)
coup2L = cplFvFeHmL(i3,gt2,i1)
coup2R = cplFvFeHmR(i3,gt2,i1)
coup3L = -cplFvFvVZR(i3,i2)
coup3R = -cplFvFvVZL(i3,i2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ(MAh,MetI,MFe,MFv,Mhh,             & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhhhVZ,cplcFeFeetIL,cplcFeFeetIR,cpletIhhVZ,cplFvFeHmL,cplFvFeHmR,      & 
& cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhhhVZ(2),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),   & 
& cpletIhhVZ(2),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3), & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhVZVZ(2),cplHmVWpVZ(3),  & 
& cplHmcHmVZ(3,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3)

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVZ 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVZL(i2,i3)
coup3R = cplcFeFeVZR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVZ


Subroutine Amplitude_Tree_radinuZeeHB_FeToFvVWp(cplcFeFvVWpL,cplcFeFvVWpR,            & 
& MFe,MFv,MVWp,MFe2,MFv2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MVWp,MFe2(3),MFv2(3),MVWp2

Complex(dp), Intent(in) :: cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1L = cplcFeFvVWpL(gt1,gt2)
coupT1R = cplcFeFvVWpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FeToFvVWp


Subroutine Gamma_Real_radinuZeeHB_FeToFvVWp(MLambda,em,gs,cplcFeFvVWpL,               & 
& cplcFeFvVWpR,MFe,MFv,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3)

Real(dp), Intent(in) :: MFe(3),MFv(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplcFeFvVWpL(i1,i2)
CoupR = cplcFeFvVWpR(i1,i2)
Mex1 = MFe(i1)
Mex2 = MFv(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,-1._dp,0._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FeToFvVWp


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFvVWp(cplcFeFvVWpL,cplcFeFvVWpR,            & 
& ctcplcFeFvVWpL,ctcplcFeFvVWpR,MFe,MFe2,MFv,MFv2,MVWp,MVWp2,ZfEL,ZfER,ZfVL,             & 
& ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(3),MFv2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFvVWpL(3,3),ctcplcFeFvVWpR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfVL(3,3),ZfVWp

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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvVWpL(gt1,gt2) 
ZcoupT1R = ctcplcFeFvVWpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFvVWpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFvVWpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVL(i1,gt2)*cplcFeFvVWpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfVL(i1,gt2))*cplcFeFvVWpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWp*cplcFeFvVWpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWp*cplcFeFvVWpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFvVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFvVWp(MAh,MetI,MFe,MFv,Mhh,               & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cplFvFeHmL,               & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmVWp(3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),  & 
& cpletIHmVWp(3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),             & 
& cplhhcVWpVWp(2),cplHmVPVWp(3),cplHmVWpVZ(3),cplcVWpVPVWp,cplcVWpVWpVZ

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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 


! {Fe, hh, VWp}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
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


! {Fe, VP, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, etI, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, hh, conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, VZ, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = cplcFeFeVZL(gt1,i1)
coup1R = cplcFeFeVZR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fv, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
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


! {Fv, conj[VWp], VZ}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = cplcFeFvVWpL(gt1,i1)
coup1R = cplcFeFvVWpR(gt1,i1)
coup2L = -cplFvFvVZR(gt2,i1)
coup2R = -cplFvFvVZL(gt2,i1)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWp, Fv, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWpL(gt1,i2)
coup1R = cplcFeFvVWpR(gt1,i2)
coup2L = -cplFvFecVWpR(gt2,i3)
coup2R = -cplFvFecVWpL(gt2,i3)
coup3L = -cplcFeFvVWpR(i3,i2)
coup3R = -cplcFeFvVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
coup3L = cplcFeFvVWpL(i2,i3)
coup3R = cplcFeFvVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], Fv, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(gt1,i2,i1)
coup1R = cplcFeFvcHmR(gt1,i2,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = -cplcFeFvVWpR(i3,i2)
coup3R = -cplcFeFvVWpL(i3,i2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFvVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp(MAh,MetI,MFe,MFv,Mhh,            & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhHmVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,cplFvFeHmL,               & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhcVWpVWp,cplHmVPVWp,cplHmVWpVZ,               & 
& cplcVWpVPVWp,cplcVWpVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmVWp(3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),  & 
& cpletIHmVWp(3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),             & 
& cplhhcVWpVWp(2),cplHmVPVWp(3),cplHmVWpVZ(3),cplcVWpVPVWp,cplcVWpVWpVZ

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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVWp 


! {Fe, VP, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = cplcFeFeVPL(gt1,i1)
coup1R = cplcFeFeVPR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
coup3 = cplHmVPVWp(i3)
Call Amp_VERTEX_FtoFV_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFvVWp


Subroutine Amplitude_Tree_radinuZeeHB_FeToFvcHm(cplcFeFvcHmL,cplcFeFvcHmR,            & 
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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1L = cplcFeFvcHmL(gt1,gt2,gt3)
coupT1R = cplcFeFvcHmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FeToFvcHm


Subroutine Gamma_Real_radinuZeeHB_FeToFvcHm(MLambda,em,gs,cplcFeFvcHmL,               & 
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
 
Do i1=1,3
  Do i2=1,3
    Do i3=2,3
CoupL = cplcFeFvcHmL(i1,i2,i3)
CoupR = cplcFeFvcHmR(i1,i2,i3)
Mex1 = MFe(i1)
Mex2 = MFv(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,1._dp,0._dp,1._dp,0._dp,0._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FeToFvcHm


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFvcHm(cplcFeFvcHmL,cplcFeFvcHmR,            & 
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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplcFeFvcHmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplcFeFvcHmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfER(i1,gt1)*cplcFeFvcHmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFvcHmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVL(i1,gt2)*cplcFeFvcHmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfVL(i1,gt2))*cplcFeFvcHmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfHm(i1,gt3))*cplcFeFvcHmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfHm(i1,gt3))*cplcFeFvcHmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFvcHm


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFvcHm(MAh,MetI,MFe,MFv,Mhh,               & 
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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHm(gt3) 


! {Fe, Ah, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MVWp 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
coup3 = cplAhcHmcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, etI, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MVWp 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
coup3 = cpletIcHmcVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, hh, VWp}
Do i1=1,3
  Do i2=1,2
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MVWp 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
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


! {Fe, VP, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
coup3 = cplcHmcVWpVP(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VZ, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
coup3 = cplcHmcVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, Ah, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MAh 
ML3 = MHm(i3) 
coup1L = cplcFeFeAhL(gt1,i1)
coup1R = cplcFeFeAhR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, etI, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MetI 
ML3 = MHm(i3) 
coup1L = cplcFeFeetIL(gt1,i1)
coup1R = cplcFeFeetIR(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, hh, conj[Hm]}
Do i1=1,3
  Do i2=1,2
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = Mhh(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFehhL(gt1,i1,i2)
coup1R = cplcFeFehhR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, VZ, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = -cplcFeFeVZR(gt1,i1)
coup1R = -cplcFeFeVZL(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fv, Hm, VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
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


! {Fv, conj[VWp], VZ}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = -cplcFeFvVWpR(gt1,i1)
coup1R = -cplcFeFvVWpL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplcHmcVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VWp, Fv, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWpR(gt1,i2)
coup1R = -cplcFeFvVWpL(gt1,i2)
coup2L = cplFvFecVWpL(gt2,i3)
coup2R = cplFvFecVWpR(gt2,i3)
coup3L = cplcFeFvcHmL(i3,i2,gt3)
coup3R = cplcFeFvcHmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFeVZR(gt1,i2)
coup1R = -cplcFeFeVZL(gt1,i2)
coup2L = cplFvFvVZL(gt2,i3)
coup2R = cplFvFvVZR(gt2,i3)
coup3L = cplcFeFvcHmL(i2,i3,gt3)
coup3R = cplcFeFvcHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], Fv, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(gt1,i2,i1)
coup1R = cplcFeFvcHmR(gt1,i2,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = cplcFeFvcHmL(i3,i2,gt3)
coup3R = cplcFeFvcHmR(i3,i2,gt3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFvcHm


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm(MAh,MetI,MFe,MFv,Mhh,            & 
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
Mex1 = MFe(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MHm(gt3) 


! {Fe, VP, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MVWp 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
coup3 = cplcHmcVWpVP(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, VP, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVP 
ML3 = MHm(i3) 
coup1L = -cplcFeFeVPR(gt1,i1)
coup1R = -cplcFeFeVPL(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
coup3 = cplHmcHmVP(i3,gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFvcHm


Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeVP(cplcFeFeVPL,cplcFeFeVPR,               & 
& cplcFeFeVZL,cplcFeFeVZR,ctcplcFeFeVPL,ctcplcFeFeVPR,ctcplcFeFeVZL,ctcplcFeFeVZR,       & 
& MFe,MFe2,MVP,MVP2,ZfEL,ZfER,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MVP,MVP2

Complex(dp), Intent(in) :: cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ctcplcFeFeVPL(3,3),ctcplcFeFeVPR(3,3),ctcplcFeFeVZL(3,3),ctcplcFeFeVZR(3,3)

Complex(dp), Intent(in) :: ZfEL(3,3),ZfER(3,3),ZfVP,ZfVZVP

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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 
ZcoupT1L = 0._dp 
ZcoupT1R = 0._dp 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfEL(i1,gt1))*cplcFeFeVPL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfER(i1,gt1)*cplcFeFeVPR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplcFeFeVPL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplcFeFeVPR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplcFeFeVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplcFeFeVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FeToFeVP


Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeVP(MAh,MetI,MFe,MFv,Mhh,MHm,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,              & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVPVWp,            & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplFvFeHmL(3,3,3),& 
& cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),              & 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),           & 
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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 


! {Ah, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MAh 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeAhL(gt1,i2)
coup1R = cplcFeFeAhR(gt1,i2)
coup2L = cplcFeFeAhL(i3,gt2)
coup2R = cplcFeFeAhR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {etI, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MetI 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeetIL(gt1,i2)
coup1R = cplcFeFeetIR(gt1,i2)
coup2L = cplcFeFeetIL(i3,gt2)
coup2R = cplcFeFeetIR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_SFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {Fv, Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWpL(gt1,i1)
coup1R = cplcFeFvVWpR(gt1,i1)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFv(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(gt1,i1,i2)
coup1R = cplcFeFvcHmR(gt1,i1,i2)
coup2L = cplFvFecVWpL(i1,gt2)
coup2R = cplFvFecVWpR(i1,gt2)
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


! {Fv, conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFeFvVWpL(gt1,i1)
coup1R = cplcFeFvVWpR(gt1,i1)
coup2L = cplFvFecVWpL(i1,gt2)
coup2R = cplFvFecVWpR(i1,gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {hh, bar[Fe], bar[Fe]}
Do i1=1,2
  Do i2=1,3
    Do i3=1,3
ML1 = Mhh(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFehhL(gt1,i2,i1)
coup1R = cplcFeFehhR(gt1,i2,i1)
coup2L = cplcFeFehhL(i3,gt2,i1)
coup2R = cplcFeFehhR(i3,gt2,i1)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
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


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVZL(gt1,i2)
coup1R = cplcFeFeVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FeToFeVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVP(MAh,MetI,MFe,MFv,Mhh,             & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplcFeFeetIL,cplcFeFeetIR,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,              & 
& cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,              & 
& cplcFeFeVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVPVWp,            & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplFvFeHmL(3,3,3),& 
& cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),              & 
& cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),& 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),           & 
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
Mex1 = MFe(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVP 


! {VP, bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVP 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFeVPL(gt1,i2)
coup1R = cplcFeFeVPR(gt1,i2)
coup2L = cplcFeFeVPL(i3,gt2)
coup2R = cplcFeFeVPR(i3,gt2)
coup3L = cplcFeFeVPL(i2,i3)
coup3R = cplcFeFeVPR(i2,i3)
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FeToFeVP



End Module OneLoopDecay_Fe_radinuZeeHB
