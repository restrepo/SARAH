! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module OneLoopDecay_Fv_radinuZeeHB
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

Subroutine Amplitude_Tree_radinuZeeHB_FvToFeHm(cplFvFeHmL,cplFvFeHmR,MFe,             & 
& MFv,MHm,MFe2,MFv2,MHm2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3),MFe2(3),MFv2(3),MHm2(3)

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3)

Complex(dp) :: Amp(2,3,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(2) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHm(gt3) 
! Tree-Level Vertex 
coupT1L = cplFvFeHmL(gt1,gt2,gt3)
coupT1R = cplFvFeHmR(gt1,gt2,gt3)
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,coupT1L,coupT1R,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FvToFeHm


Subroutine Gamma_Real_radinuZeeHB_FvToFeHm(MLambda,em,gs,cplFvFeHmL,cplFvFeHmR,       & 
& MFe,MFv,MHm,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3)

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
CoupL = cplFvFeHmL(i1,i2,i3)
CoupR = cplFvFeHmR(i1,i2,i3)
Mex1 = MFv(i1)
Mex2 = MFe(i2)
Mex3 = MHm(i3)
If (Mex1.gt.(Mex2+Mex3)) Then 
 Call hardradiationFFS(Mex1,Mex2,Mex3,MLambda,em,0._dp,0._dp,0._dp,1._dp,-1._dp,1._dp,CoupL,CoupR,Gammarealphoton(i1,i2,i3),kont)
  GammarealGluon(i1,i2,i3) = 0._dp 
Else 
  GammarealGluon(i1,i2,i3) = 0._dp 
  GammarealPhoton(i1,i2,i3) = 0._dp 

End if 
    End Do
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FvToFeHm


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFeHm(cplFvFeHmL,cplFvFeHmR,ctcplFvFeHmL,    & 
& ctcplFvFeHmR,MFe,MFe2,MFv,MFv2,MHm,MHm2,ZfEL,ZfER,ZfHm,ZfVL,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(3),MFv2(3),MHm(3),MHm2(3)

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3)

Complex(dp), Intent(in) :: ctcplFvFeHmL(3,3,3),ctcplFvFeHmR(3,3,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHm(gt3) 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFeHmL(gt1,gt2,gt3) 
ZcoupT1R = ctcplFvFeHmR(gt1,gt2,gt3) 
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVL(i1,gt1)*cplFvFeHmL(i1,gt2,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfVL(i1,gt1))*cplFvFeHmR(i1,gt2,gt3)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplFvFeHmL(gt1,i1,gt3)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplFvFeHmR(gt1,i1,gt3)
End Do


! External Field 3 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfHm(i1,gt3)*cplFvFeHmL(gt1,gt2,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfHm(i1,gt3)*cplFvFeHmR(gt1,gt2,i1)
End Do


! Getting the amplitude 
Call TreeAmp_FtoFS(Mex1,Mex2,Mex3,ZcoupT1L,ZcoupT1R,AmpC) 
Amp(:,gt1, gt2, gt3) = AmpC 
    End Do
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFeHm


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFeHm(MAh,MetI,MFe,MFv,Mhh,MHm,            & 
& MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,               & 
& cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,               & 
& cpletIHmcHm,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,             & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmVWp(3),cplAhHmcHm(3,3),cplcFeFeetIL(3,3),    & 
& cplcFeFeetIR(3,3),cpletIHmVWp(3),cpletIHmcHm(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3), & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),   & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),               & 
& cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplHmVPVWp(3),cplHmcHmVP(3,3),   & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHm(gt3) 


! {Fe, VWp, Ah}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MAh 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
coup3 = cplAhHmVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
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


! {Fe, VWp, etI}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MetI 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
coup3 = cpletIHmVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVS(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
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


! {Fe, VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, VWp, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplHmVPVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
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


! {Fe, VWp, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = -cplcFeFeVZR(i1,gt2)
coup2R = -cplcFeFeVZL(i1,gt2)
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


! {Fv, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFeHmL(i1,gt2,i3)
coup2R = cplFvFeHmR(i1,gt2,i3)
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


! {Fv, VZ, conj[VWp]}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = -cplFvFecVWpR(i1,gt2)
coup2R = -cplFvFecVWpL(i1,gt2)
coup3 = cplHmVWpVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {VWp, Fe, Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvVWpL(i2,gt1)
coup1R = cplcFeFvVWpR(i2,gt1)
coup2L = -cplFvFecVWpR(i3,gt2)
coup2R = -cplFvFecVWpL(i3,gt2)
coup3L = cplFvFeHmL(i3,i2,gt3)
coup3R = cplFvFeHmR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFvVZR(gt1,i2)
coup1R = -cplFvFvVZL(gt1,i2)
coup2L = -cplcFeFeVZR(i3,gt2)
coup2R = -cplcFeFeVZL(i3,gt2)
coup3L = cplFvFeHmL(i2,i3,gt3)
coup3R = cplFvFeHmR(i2,i3,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], Fe, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(i3,gt2,i1)
coup2R = cplFvFeHmR(i3,gt2,i1)
coup3L = cplFvFeHmL(i3,i2,gt3)
coup3R = cplFvFeHmR(i3,i2,gt3)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFeHm


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm(MAh,MetI,MFe,MFv,Mhh,             & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplcFeFeetIL,cplcFeFeetIR,cpletIHmVWp,               & 
& cpletIHmcHm,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,               & 
& cplcFeFehhR,cplcFeFeVPL,cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,             & 
& cplHmVPVWp,cplHmcHmVP,cplHmVWpVZ,cplHmcHmVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmVWp(3),cplAhHmcHm(3,3),cplcFeFeetIL(3,3),    & 
& cplcFeFeetIR(3,3),cpletIHmVWp(3),cpletIHmcHm(3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3), & 
& cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),             & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),   & 
& cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),               & 
& cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplHmVPVWp(3),cplHmcHmVP(3,3),   & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MHm(gt3) 


! {Fe, VWp, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = cplHmVPVWp(gt3)
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = -cplcFeFeVPR(i1,gt2)
coup2R = -cplcFeFeVPL(i1,gt2)
coup3 = -cplHmcHmVP(gt3,i2)
Call Amp_VERTEX_FtoFS_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
  End Do
End Do
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFeHm


Subroutine Amplitude_Tree_radinuZeeHB_FvToFecVWp(cplFvFecVWpL,cplFvFecVWpR,           & 
& MFe,MFv,MVWp,MFe2,MFv2,MVWp2,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MVWp,MFe2(3),MFv2(3),MVWp2

Complex(dp), Intent(in) :: cplFvFecVWpL(3,3),cplFvFecVWpR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWp 
! Tree-Level Vertex 
coupT1L = cplFvFecVWpL(gt1,gt2)
coupT1R = cplFvFecVWpR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FvToFecVWp


Subroutine Gamma_Real_radinuZeeHB_FvToFecVWp(MLambda,em,gs,cplFvFecVWpL,              & 
& cplFvFecVWpR,MFe,MFv,MVWp,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFecVWpL(3,3),cplFvFecVWpR(3,3)

Real(dp), Intent(in) :: MFe(3),MFv(3),MVWp

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplFvFecVWpL(i1,i2)
CoupR = cplFvFecVWpR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFe(i2)
Mex3 = MVWp
If (Mex1.gt.(Mex2+Mex3)) Then 
  Call hardphotonFFW(Mex1,Mex2,Mex3,MLambda,0._dp,-1._dp,CoupL,CoupR,(0,1)*em,GammaRealPhoton(i1,i2),kont)
  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FvToFecVWp


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFecVWp(cplFvFecVWpL,cplFvFecVWpR,           & 
& ctcplFvFecVWpL,ctcplFvFecVWpR,MFe,MFe2,MFv,MFv2,MVWp,MVWp2,ZfEL,ZfER,ZfVL,             & 
& ZfVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFe2(3),MFv(3),MFv2(3),MVWp,MVWp2

Complex(dp), Intent(in) :: cplFvFecVWpL(3,3),cplFvFecVWpR(3,3)

Complex(dp), Intent(in) :: ctcplFvFecVWpL(3,3),ctcplFvFecVWpR(3,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWp 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFecVWpL(gt1,gt2) 
ZcoupT1R = ctcplFvFecVWpR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfVL(i1,gt1))*cplFvFecVWpL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVL(i1,gt1)*cplFvFecVWpR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfEL(i1,gt2)*cplFvFecVWpL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfER(i1,gt2))*cplFvFecVWpR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVWp*cplFvFecVWpL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVWp*cplFvFecVWpR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFecVWp


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFecVWp(MAh,MetI,MFe,MFv,Mhh,              & 
& MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,           & 
& cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIcHmcVWp,cplFvFeHmL,           & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,         & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhcHmcVWp(3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cpletIcHmcVWp(3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhcVWpVWp(2),             & 
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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWp 


! {Fe, conj[Hm], Ah}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MAh 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeAhL(i1,gt2)
coup2R = cplcFeFeAhR(i1,gt2)
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


! {Fe, conj[Hm], etI}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MetI 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeetIL(i1,gt2)
coup2R = cplcFeFeetIR(i1,gt2)
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


! {Fe, VWp, hh}
Do i1=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = Mhh(i3) 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, conj[Hm], hh}
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = Mhh(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFehhL(i1,gt2,i3)
coup2R = cplcFeFehhR(i1,gt2,i3)
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


! {Fe, VWp, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
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


! {Fe, VWp, VZ}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVZ 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VZ}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVZ 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeVZL(i1,gt2)
coup2R = cplcFeFeVZR(i1,gt2)
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


! {Fv, VZ, Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MHm(i3) 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
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


! {Fv, VZ, conj[VWp]}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVWp 
coup1L = cplFvFvVZL(gt1,i1)
coup1R = cplFvFvVZR(gt1,i1)
coup2L = cplFvFecVWpL(i1,gt2)
coup2R = cplFvFecVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {VWp, Fe, Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = -cplcFeFvVWpR(i2,gt1)
coup1R = -cplcFeFvVWpL(i2,gt1)
coup2L = cplFvFecVWpL(i3,gt2)
coup2R = cplFvFecVWpR(i3,gt2)
coup3L = -cplFvFecVWpR(i3,i2)
coup3R = -cplFvFecVWpL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = cplcFeFeVZL(i3,gt2)
coup2R = cplcFeFeVZR(i3,gt2)
coup3L = cplFvFecVWpL(i2,i3)
coup3R = cplFvFecVWpR(i2,i3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {conj[Hm], Fe, Fv}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFv(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(i3,gt2,i1)
coup2R = cplFvFeHmR(i3,gt2,i1)
coup3L = -cplFvFecVWpR(i3,i2)
coup3R = -cplFvFecVWpL(i3,i2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFecVWp


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp(MAh,MetI,MFe,MFv,               & 
& Mhh,MHm,MVP,MVWp,MVZ,MAh2,MetI2,MFe2,MFv2,Mhh2,MHm2,MVP2,MVWp2,MVZ2,cplcFeFeAhL,       & 
& cplcFeFeAhR,cplAhcHmcVWp,cplcFeFeetIL,cplcFeFeetIR,cpletIcHmcVWp,cplFvFeHmL,           & 
& cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVPL,              & 
& cplcFeFeVPR,cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,   & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVPVWp,cplcHmcVWpVP,         & 
& cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVP,MVWp,MVZ,MAh2,MetI2,MFe2(3),MFv2(3),         & 
& Mhh2(2),MHm2(3),MVP2,MVWp2,MVZ2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhcHmcVWp(3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),& 
& cpletIcHmcVWp(3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),& 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),               & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhcVWpVWp(2),             & 
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
Mex1 = MFv(gt1) 
Mex2 = MFe(gt2) 
Mex3 = MVWp 


! {Fe, VWp, VP}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVP 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = -cplcVWpVPVWp
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VP}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVP 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFeVPL(i1,gt2)
coup2R = cplcFeFeVPR(i1,gt2)
coup3 = cplcHmcVWpVP(i2)
Call Amp_VERTEX_FtoFV_Topology1_FSV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
  End Do
End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFecVWp


Subroutine Amplitude_Tree_radinuZeeHB_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,MFv,             & 
& MVZ,MFv2,MVZ2,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(3),MVZ,MFv2(3),MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Complex(dp) :: Amp(4,3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3 
Complex(dp) :: AmpC(4) 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 
Complex(dp) :: coupT1, coupT1L, coupT1R 

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
! Tree-Level Vertex 
coupT1L = cplFvFvVZL(gt1,gt2)
coupT1R = cplFvFvVZR(gt1,gt2)
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,coupT1R,coupT1L,AmpC) 
! Colour and symmetry factor 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_Tree_radinuZeeHB_FvToFvVZ


Subroutine Gamma_Real_radinuZeeHB_FvToFvVZ(MLambda,em,gs,cplFvFvVZL,cplFvFvVZR,       & 
& MFv,MVZ,GammarealPhoton,GammarealGluon)

Implicit None

Complex(dp), Intent(in) :: cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp), Intent(in) :: MFv(3),MVZ

Real(dp), Intent(in) :: MLambda, em, gs 

Real(dp), Intent(out) :: GammarealPhoton(3,3), GammarealGluon(3,3) 

Integer :: i1, i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: Mex1, Mex2, Mex3, ExtRMsq 

Real(dp) :: Mloop1, Mloop2, Mloop3 
Complex(dp) :: CoupL, CoupR 
 
Do i1=1,3
  Do i2=1,3
CoupL = cplFvFvVZL(i1,i2)
CoupR = cplFvFvVZR(i1,i2)
Mex1 = MFv(i1)
Mex2 = MFv(i2)
Mex3 = MVZ
If (Mex1.gt.(Mex2+Mex3)) Then 
  GammarealPhoton(i1,i2) = 0._dp 

  GammarealGluon(i1,i2) = 0._dp 
Else 
  GammarealGluon(i1,i2) = 0._dp 
  GammarealPhoton(i1,i2) = 0._dp 

End if 
  End Do
End Do
End Subroutine Gamma_Real_radinuZeeHB_FvToFvVZ


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvVZ(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,    & 
& ctcplFvFvVZR,MFv,MFv2,MVZ,MVZ2,ZfVL,ZfVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(3),MFv2(3),MVZ,MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Complex(dp), Intent(in) :: ctcplFvFvVZL(3,3),ctcplFvFvVZR(3,3)

Complex(dp), Intent(in) :: ZfVL(3,3),ZfVZ

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
!----------------------------- 
! Coupling counter term 
!----------------------------- 
ZcoupT1L = ctcplFvFvVZL(gt1,gt2) 
ZcoupT1R = ctcplFvFvVZR(gt1,gt2)
!----------------------------- 
! Multiply Z-factors 
!----------------------------- 
! External Field 1 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*Conjg(ZfVL(i1,gt1))*cplFvFvVZL(i1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVL(i1,gt1)*cplFvFvVZR(i1,gt2)
End Do


! External Field 2 
Do i1=1,3
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVL(i1,gt2)*cplFvFvVZL(gt1,i1)
ZcoupT1R = ZcoupT1R + 0.5_dp*Conjg(ZfVL(i1,gt2))*cplFvFvVZR(gt1,i1)
End Do


! External Field 3 
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZ*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZ*cplFvFvVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvVZ


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvVZ(MFe,MFv,MHm,MVWp,MVZ,MFe2,           & 
& MFv2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVZL,      & 
& cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3),MVWp,MVZ,MFe2(3),MFv2(3),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplHmVWpVZ(3),               & 
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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 


! {Fe, VWp, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
coup3 = -cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
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


! {Fe, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
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


! {Fe, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Hm, bar[Fe], bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFeHmL(gt1,i2,i1)
coup1R = cplFvFeHmR(gt1,i2,i1)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
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


! {VWp, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWpR(i2,gt1)
coup1R = -cplcFeFvVWpL(i2,gt1)
coup2L = -cplFvFecVWpR(gt2,i3)
coup2R = -cplFvFecVWpL(gt2,i3)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {VZ, Fv, Fv}
  Do i2=1,3
    Do i3=1,3
ML1 = MVZ 
ML2 = MFv(i2) 
ML3 = MFv(i3) 
coup1L = cplFvFvVZL(gt1,i2)
coup1R = cplFvFvVZR(gt1,i2)
coup2L = -cplFvFvVZR(gt2,i3)
coup2R = -cplFvFvVZL(gt2,i3)
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


! {bar[Fe], Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWpR(i1,gt1)
coup1R = -cplcFeFvVWpL(i1,gt1)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = -cplFvFecVWpR(gt2,i1)
coup2R = -cplFvFecVWpL(gt2,i1)
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


! {bar[Fe], conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFeFvVWpR(i1,gt1)
coup1R = -cplcFeFvVWpL(i1,gt1)
coup2L = -cplFvFecVWpR(gt2,i1)
coup2R = -cplFvFecVWpL(gt2,i1)
coup3 = cplcVWpVWpVZ
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = -cplcFeFeVZR(i3,i2)
coup3R = -cplcFeFeVZL(i3,i2)
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


! {conj[VWp], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWpL(gt1,i2)
coup1R = cplFvFecVWpR(gt1,i2)
coup2L = cplcFeFvVWpL(i3,gt2)
coup2R = cplcFeFvVWpR(i3,gt2)
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
  End Do
End Do
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvVZ


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ(MFe,MFv,MHm,MVWp,MVZ,             & 
& MFe2,MFv2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,cplcHmcVWpVZ,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3),MVWp,MVZ,MFe2(3),MFv2(3),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),   & 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplHmVWpVZ(3),               & 
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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVZ 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVZ


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvAh(MAh,MAh2,MFv,MFv2,ZfAh,ZfVL,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MAh2,MFv(3),MFv2(3)

Complex(dp), Intent(in) :: ZfAh,ZfVL(3,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh 
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
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvAh


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvAh(MAh,MFe,MFv,MHm,MVWp,MAh2,           & 
& MFe2,MFv2,MHm2,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,cplAhcHmcVWp,       & 
& cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFvVWpL,cplcFeFvVWpR,             & 
& cplcFeFvcHmL,cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFv(3),MHm(3),MVWp,MAh2,MFe2(3),MFv2(3),MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),      & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),               & 
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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh 


! {Fe, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
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


! {Fe, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Hm, bar[Fe], bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFeHmL(gt1,i2,i1)
coup1R = cplFvFeHmR(gt1,i2,i1)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
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


! {VWp, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWpL(i2,gt1)
coup1R = cplcFeFvVWpR(i2,gt1)
coup2L = cplFvFecVWpL(gt2,i3)
coup2R = cplFvFecVWpR(gt2,i3)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWpL(i1,gt1)
coup1R = cplcFeFvVWpR(i1,gt1)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFecVWpL(gt2,i1)
coup2R = cplFvFecVWpR(gt2,i1)
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


! {conj[Hm], Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = cplcFeFeAhL(i3,i2)
coup3R = cplcFeFeAhR(i3,i2)
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


! {conj[VWp], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWpR(gt1,i2)
coup1R = -cplFvFecVWpL(gt1,i2)
coup2L = -cplcFeFvVWpR(i3,gt2)
coup2R = -cplcFeFvVWpL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvAh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvAh(MAh,MFe,MFv,MHm,MVWp,             & 
& MAh2,MFe2,MFv2,MHm2,MVWp2,cplcFeFeAhL,cplcFeFeAhR,cplAhHmVWp,cplAhHmcHm,               & 
& cplAhcHmcVWp,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFvVWpL,             & 
& cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,Amp)

Implicit None

Real(dp), Intent(in) :: MAh,MFe(3),MFv(3),MHm(3),MVWp,MAh2,MFe2(3),MFv2(3),MHm2(3),MVWp2

Complex(dp), Intent(in) :: cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplAhHmVWp(3),cplAhHmcHm(3,3),cplAhcHmcVWp(3),      & 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),               & 
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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MAh 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvAh


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvetI(MetI,MetI2,MFv,MFv2,ZfetI,ZfVL,Amp)

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

Do gt1=1,3
  Do gt2=1,3
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MetI 
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
Amp(:,gt1, gt2) = 0._dp
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvetI


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvetI(MetI,MFe,MFv,MHm,MVWp,              & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MetI 


! {Fe, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
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


! {Fe, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Hm, bar[Fe], bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFeHmL(gt1,i2,i1)
coup1R = cplFvFeHmR(gt1,i2,i1)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
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


! {VWp, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWpL(i2,gt1)
coup1R = cplcFeFvVWpR(i2,gt1)
coup2L = cplFvFecVWpL(gt2,i3)
coup2R = cplFvFecVWpR(gt2,i3)
coup3L = cplcFeFeetIL(i3,i2)
coup3R = cplcFeFeetIR(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWpL(i1,gt1)
coup1R = cplcFeFvVWpR(i1,gt1)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFecVWpL(gt2,i1)
coup2R = cplFvFecVWpR(gt2,i1)
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


! {conj[Hm], Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = cplcFeFeetIL(i3,i2)
coup3R = cplcFeFeetIR(i3,i2)
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


! {conj[VWp], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWpR(gt1,i2)
coup1R = -cplFvFecVWpL(gt1,i2)
coup2L = -cplcFeFvVWpR(i3,gt2)
coup2R = -cplcFeFvVWpL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvetI


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvetI(MetI,MFe,MFv,MHm,MVWp,           & 
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
Do gt1=1,3
  Do gt2=1,3
Amp(:,gt1, gt2) = 0._dp 
IRdivOnly =.true. 
! External masses 
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MetI 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvetI


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvhh(MFv,MFv2,Mhh,Mhh2,Zfhh,ZfVL,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(3),MFv2(3),Mhh(2),Mhh2(2)

Complex(dp), Intent(in) :: Zfhh(2,2),ZfVL(3,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
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
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvhh


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvhh(MFe,MFv,Mhh,MHm,MVWp,MVZ,            & 
& MFe2,MFv2,Mhh2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,        & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),Mhh(2),MHm(3),MVWp,MVZ,MFe2(3),MFv2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),& 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 


! {Fe, VWp, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = -cplcFeFvVWpR(i1,gt2)
coup2R = -cplcFeFvVWpL(i1,gt2)
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


! {Fe, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplFvFecVWpR(gt1,i1)
coup1R = -cplFvFecVWpL(gt1,i1)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fe, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Fv, VZ, VZ}
Do i1=1,3
ML1 = MFv(i1) 
ML2 = MVZ 
ML3 = MVZ 
coup1L = -cplFvFvVZR(gt1,i1)
coup1R = -cplFvFvVZL(gt1,i1)
coup2L = cplFvFvVZL(gt2,i1)
coup2R = cplFvFvVZR(gt2,i1)
coup3 = cplhhVZVZ(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {Hm, bar[Fe], bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFeHmL(gt1,i2,i1)
coup1R = cplFvFeHmR(gt1,i2,i1)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
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


! {VWp, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvVWpL(i2,gt1)
coup1R = cplcFeFvVWpR(i2,gt1)
coup2L = cplFvFecVWpL(gt2,i3)
coup2R = cplFvFecVWpR(gt2,i3)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplcFeFvVWpL(i1,gt1)
coup1R = cplcFeFvVWpR(i1,gt1)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFecVWpL(gt2,i1)
coup2R = cplFvFecVWpR(gt2,i1)
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


! {bar[Fe], conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplcFeFvVWpL(i1,gt1)
coup1R = cplcFeFvVWpR(i1,gt1)
coup2L = cplFvFecVWpL(gt2,i1)
coup2R = cplFvFecVWpR(gt2,i1)
coup3 = cplhhcVWpVWp(gt3)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFS_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2, gt3) = Amp(:,gt1, gt2, gt3) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = cplcFeFehhL(i3,i2,gt3)
coup3R = cplcFeFehhR(i3,i2,gt3)
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


! {conj[VWp], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplFvFecVWpR(gt1,i2)
coup1R = -cplFvFecVWpL(gt1,i2)
coup2L = -cplcFeFvVWpR(i3,gt2)
coup2R = -cplcFeFvVWpL(i3,gt2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvhh


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvhh(MFe,MFv,Mhh,MHm,MVWp,             & 
& MVZ,MFe2,MFv2,Mhh2,MHm2,MVWp2,MVZ2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,    & 
& cplcFeFehhL,cplcFeFehhR,cplFvFvVZL,cplFvFvVZR,cplcFeFvVWpL,cplcFeFvVWpR,               & 
& cplcFeFvcHmL,cplcFeFvcHmR,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,cplhhcHmcVWp,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),Mhh(2),MHm(3),MVWp,MVZ,MFe2(3),MFv2(3),Mhh2(2),MHm2(3),MVWp2,MVZ2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplcFeFvVWpL(3,3),& 
& cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmVWp(2,3),             & 
& cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2),cplhhcHmcVWp(2,3)

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = Mhh(gt3) 
    End Do
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvhh


Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvVP(cplFvFvVZL,cplFvFvVZR,ctcplFvFvVZL,    & 
& ctcplFvFvVZR,MFv,MFv2,MVP,MVP2,MVZ,MVZ2,ZfVL,ZfVP,ZfVZVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFv(3),MFv2(3),MVP,MVP2,MVZ,MVZ2

Complex(dp), Intent(in) :: cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Complex(dp), Intent(in) :: ctcplFvFvVZL(3,3),ctcplFvFvVZR(3,3)

Complex(dp), Intent(in) :: ZfVL(3,3),ZfVP,ZfVZVP

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 
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
ZcoupT1L = ZcoupT1L + 0.5_dp*ZfVZVP*cplFvFvVZL(gt1,gt2)
ZcoupT1R = ZcoupT1R + 0.5_dp*ZfVZVP*cplFvFvVZR(gt1,gt2)


! Getting the amplitude 
Call TreeAmp_FtoFV(Mex1,Mex2,Mex3,ZcoupT1R,ZcoupT1L,AmpC) 
Amp(:,gt1, gt2) = -AmpC 
  End Do
End Do
End Subroutine Amplitude_WAVE_radinuZeeHB_FvToFvVP


Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvVP(MFe,MFv,MHm,MVP,MVWp,MFe2,           & 
& MFv2,MHm2,MVP2,MVWp2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplcFeFeVPL,      & 
& cplcFeFeVPR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,cplHmVPVWp,            & 
& cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3),MVP,MVWp,MFe2(3),MFv2(3),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3)

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 


! {Fe, VWp, VWp}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
coup3 = cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {Fe, conj[Hm], VWp}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvVWpL(i1,gt2)
coup2R = cplcFeFvVWpR(i1,gt2)
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


! {Fe, VWp, conj[Hm]}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = cplFvFecVWpL(gt1,i1)
coup1R = cplFvFecVWpR(gt1,i1)
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


! {Fe, conj[Hm], conj[Hm]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2L = cplcFeFvcHmL(i1,gt2,i3)
coup2R = cplcFeFvcHmR(i1,gt2,i3)
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


! {Hm, bar[Fe], bar[Fe]}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFeHmL(gt1,i2,i1)
coup1R = cplFvFeHmR(gt1,i2,i1)
coup2L = cplcFeFvcHmL(i3,gt2,i1)
coup2R = cplcFeFvcHmR(i3,gt2,i1)
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


! {VWp, Fe, Fe}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = -cplcFeFvVWpR(i2,gt1)
coup1R = -cplcFeFvVWpL(i2,gt1)
coup2L = -cplFvFecVWpR(gt2,i3)
coup2R = -cplFvFecVWpL(gt2,i3)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3L)+Abs(coup3R)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_VFF(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
    End Do
  End Do


! {bar[Fe], Hm, Hm}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MHm(i3) 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], conj[VWp], Hm}
Do i1=1,3
    Do i3=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MHm(i3) 
coup1L = -cplcFeFvVWpR(i1,gt1)
coup1R = -cplcFeFvVWpL(i1,gt1)
coup2L = cplFvFeHmL(gt2,i1,i3)
coup2R = cplFvFeHmR(gt2,i1,i3)
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


! {bar[Fe], Hm, conj[VWp]}
Do i1=1,3
  Do i2=1,3
ML1 = MFe(i1) 
ML2 = MHm(i2) 
ML3 = MVWp 
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = -cplFvFecVWpR(gt2,i1)
coup2R = -cplFvFecVWpL(gt2,i1)
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


! {bar[Fe], conj[VWp], conj[VWp]}
Do i1=1,3
ML1 = MFe(i1) 
ML2 = MVWp 
ML3 = MVWp 
coup1L = -cplcFeFvVWpR(i1,gt1)
coup1R = -cplcFeFvVWpL(i1,gt1)
coup2L = -cplFvFecVWpR(gt2,i1)
coup2R = -cplFvFecVWpL(gt2,i1)
coup3 = -cplcVWpVPVWp
If ((Abs(coup1L)+Abs(coup1R))*(Abs(coup2L)+Abs(coup2R))*(Abs(coup3)).gt.epsCoup) Then 
Call Amp_VERTEX_FtoFV_Topology1_FVV(Mex1,Mex2,Mex3,ML1,ML2,ML3,coup1L,coup1R,coup2L,coup2R,coup3,AmpC) 
Else
 AmpC = 0._dp
End if
! Colour and symmetry Factor 
Amp(:,gt1, gt2) = Amp(:,gt1, gt2) + oo16pi2*(1)*AmpC 
End Do


! {conj[Hm], Fe, Fe}
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
ML1 = MHm(i1) 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplcFeFvcHmL(i2,gt1,i1)
coup1R = cplcFeFvcHmR(i2,gt1,i1)
coup2L = cplFvFeHmL(gt2,i3,i1)
coup2R = cplFvFeHmR(gt2,i3,i1)
coup3L = -cplcFeFeVPR(i3,i2)
coup3R = -cplcFeFeVPL(i3,i2)
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


! {conj[VWp], bar[Fe], bar[Fe]}
  Do i2=1,3
    Do i3=1,3
ML1 = MVWp 
ML2 = MFe(i2) 
ML3 = MFe(i3) 
coup1L = cplFvFecVWpL(gt1,i2)
coup1R = cplFvFecVWpR(gt1,i2)
coup2L = cplcFeFvVWpL(i3,gt2)
coup2R = cplcFeFvVWpR(i3,gt2)
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
End Subroutine Amplitude_VERTEX_radinuZeeHB_FvToFvVP


Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVP(MFe,MFv,MHm,MVP,MVWp,             & 
& MFe2,MFv2,MHm2,MVP2,MVWp2,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,             & 
& cplcFeFeVPL,cplcFeFeVPR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,           & 
& cplHmVPVWp,cplHmcHmVP,cplcVWpVPVWp,cplcHmcVWpVP,Amp)

Implicit None

Real(dp), Intent(in) :: MFe(3),MFv(3),MHm(3),MVP,MVWp,MFe2(3),MFv2(3),MHm2(3),MVP2,MVWp2

Complex(dp), Intent(in) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplcFeFeVPL(3,3),cplcFeFeVPR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3),cplHmVPVWp(3),cplHmcHmVP(3,3),cplcVWpVPVWp,cplcHmcVWpVP(3)

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
Mex1 = MFv(gt1) 
Mex2 = MFv(gt2) 
Mex3 = MVP 
  End Do
End Do

IRdivOnly =.false. 
End Subroutine Amplitude_IR_VERTEX_radinuZeeHB_FvToFvVP



End Module OneLoopDecay_Fv_radinuZeeHB
