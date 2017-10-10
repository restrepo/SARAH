Real(dp) :: AmpSquared,AmpSquared2, AmpSquared_SM, AmpSquared2_SM, &
              & width_SM, width
Real(dp) :: MassB0s, MassB0d, fBs, fBd, TauB0s, TauB0d 
Real(dp) :: hbar=6.58211899E-25_dp 
Real(dp) :: MassB0,MassB02,fB0,GammaB0 
Complex(dp) :: CS(4), CV(4), CT(4)
Complex(dp) :: FS=0._dp, FP=0._dp, FV=0._dp, FA=0._dp 
Integer :: i1, gt1, gt2, gt3, gt4

! ---------------------------------------------------------------- 
! B0 -> l l
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on A. Dedes et al, PRD 79 (2009) 055006 [arXiv:0812.4320]
! ---------------------------------------------------------------- 

! Using global hadronic data
fBd = f_B0d_CONST  
fBs = f_B0s_CONST  
TauB0d = tau_B0d 
TauB0s = tau_B0s
MassB0d = mass_B0d 
MassB0s = mass_B0s 

Do i1=1,6
gt1 = 3
If (i1.eq.1) Then ! B0d -> e+ e-
  MassB0 = MassB0d
  MassB02 = MassB0d**2
  fB0 = fBd
  GammaB0 = (hbar)/(TauB0d)
  gt2 = 1
  gt3 = 1
  gt4 = 1
Else if (i1.eq.2) Then ! B0s -> e+ e-
  MassB0 = MassB0s
  MassB02 = MassB0s**2
  fB0 = fBs
  GammaB0 = (hbar)/(TauB0s)
  gt2 = 2
  gt3 = 1
  gt4 = 1
Else if (i1.eq.3) Then ! B0d -> mu+ mu-
  MassB0 = MassB0d
  MassB02 = MassB0d**2
  fB0 = fBd
  GammaB0 = (hbar)/(TauB0d)
  gt2 = 1
  gt3 = 2
  gt4 = 2
Else if (i1.eq.4) Then ! B0s -> mu+ mu-
  MassB0 = MassB0s
  MassB02 = MassB0s**2 
  fB0 = fBs
  GammaB0 = (hbar)/(TauB0s)
  gt2 = 2
  gt3 = 2
  gt4 = 2
Else if (i1.eq.5) Then ! B0d -> tau+ tau-
  MassB0 = MassB0d
  MassB02 = MassB0d**2
  fB0 = fBd
  GammaB0 = (hbar)/(TauB0d)
  gt2 = 1
  gt3 = 3
  gt4 = 3
Else if (i1.eq.6) Then ! B0s -> tau+ tau-
  MassB0 = MassB0s
  MassB02 = MassB0s**2 
  fB0 = fBs
  GammaB0 = (hbar)/(TauB0s)
  gt2 = 2
  gt3 = 3
  gt4 = 3
End if

! BSM contributions

CS(1) = OddllSRR(gt1,gt2,gt3,gt4)
CS(2) = OddllSRL(gt1,gt2,gt3,gt4)
CS(3) = OddllSLL(gt1,gt2,gt3,gt4)
CS(4) = OddllSLR(gt1,gt2,gt3,gt4)

CV(1) = OddllVLL(gt1,gt2,gt3,gt4)
CV(2) = OddllVLR(gt1,gt2,gt3,gt4)
CV(3) = OddllVRR(gt1,gt2,gt3,gt4)
CV(4) = OddllVRL(gt1,gt2,gt3,gt4)

FS= 0.25_dp*MassB02*fB0/(MFd(gt1)+MFd(gt2))*( CS(1)+CS(2)-CS(3)-CS(4)) 
FP= 0.25_dp*MassB02*fB0/(MFd(gt1)+MFd(gt2))*(-CS(1)+CS(2)-CS(3)+CS(4)) 
FV= -0.25_dp*fB0*( CV(1)+CV(2)-CV(3)-CV(4)) 
FA= -0.25_dp*fB0*(-CV(1)+CV(2)-CV(3)+CV(4)) 

AmpSquared = 2 * abs(FS)**2 * (MassB02 - (mf_l(gt3)+mf_l(gt4))**2) &
     & + 2 *abs(FP)**2 * (MassB02 - (mf_l(gt3)-mf_l(gt4))**2) &
     & + 2 *abs(FV)**2 * (MassB02*(mf_l(gt4)-mf_l(gt3))**2    &
             & - (mf_l2(gt4)-mf_l2(gt3))**2) &
     & + 2 *abs(FA)**2 * (MassB02*(mf_l(gt4)+mf_l(gt3))**2 -  &
             & (mf_l2(gt4)-mf_l2(gt3))**2) &
     & + 4 *REAL(FS*conjg(FV)) *(mf_l(gt3)-mf_l(gt4)) *(MassB02 &
             & + (mf_l(gt3)+mf_l(gt4))**2) &
     & + 4 *REAL(FP*conjg(FA)) *(mf_l(gt3)+mf_l(gt4)) *(MassB02 &
             & - (mf_l(gt3)-mf_l(gt4))**2) 

width = oo16pi * AmpSquared / MassB0 * &
    & sqrt(1-((mf_l(gt4)+mf_l(gt3))/MassB0)**2) &
    & * sqrt(1-((mf_l(gt4)-mf_l(gt3))/MassB0)**2)*(Alpha/Alpha_160)**4


! SM contributions

CS(1) = OddllSRRSM(gt1,gt2,gt3,gt4)
CS(2) = OddllSRLSM(gt1,gt2,gt3,gt4)
CS(3) = OddllSLLSM(gt1,gt2,gt3,gt4)
CS(4) = OddllSLRSM(gt1,gt2,gt3,gt4)

CV(1) = OddllVLLSM(gt1,gt2,gt3,gt4)
CV(2) = OddllVLRSM(gt1,gt2,gt3,gt4)
CV(3) = OddllVRRSM(gt1,gt2,gt3,gt4)
CV(4) = OddllVRLSM(gt1,gt2,gt3,gt4)

FS= 0.25_dp*MassB02*fB0/(MFd(gt1)+MFd(gt2))*( CS(1)+CS(2)-CS(3)-CS(4)) 
FP= 0.25_dp*MassB02*fB0/(MFd(gt1)+MFd(gt2))*(-CS(1)+CS(2)-CS(3)+CS(4)) 
FV= -0.25_dp*fB0*( CV(1)+CV(2)-CV(3)-CV(4)) 
FA= -0.25_dp*fB0*(-CV(1)+CV(2)-CV(3)+CV(4)) 

AmpSquared = 2 * abs(FS)**2 * (MassB02 - (mf_l(gt3)+mf_l(gt4))**2) &
     & + 2 *abs(FP)**2 * (MassB02 - (mf_l(gt3)-mf_l(gt4))**2) &
     & + 2 *abs(FV)**2 * (MassB02*(mf_l(gt4)-mf_l(gt3))**2 -  &
        &  (mf_l2(gt4)-mf_l2(gt3))**2) &
     & + 2 *abs(FA)**2 * (MassB02*(mf_l(gt4)+mf_l(gt3))**2 -  &
        &  (mf_l2(gt4)-mf_l2(gt3))**2) &
     & + 4 *REAL(FS*conjg(FV)) *(mf_l(gt3)-mf_l(gt4)) *(MassB02 &
        & + (mf_l(gt3)+mf_l(gt4))**2) &
     & + 4 *REAL(FP*conjg(FA)) *(mf_l(gt3)+mf_l(gt4)) *(MassB02 &
        & - (mf_l(gt3)-mf_l(gt4))**2)

width_SM = oo16pi * AmpSquared / MassB0 * sqrt(1-((mf_l(gt4)+   &
     & mf_l(gt3))/MassB0)**2) &
     & * sqrt(1-((mf_l(gt4)-mf_l(gt3))/MassB0)**2)*(Alpha/Alpha_160)**4 


If (i1.Eq.1) Then
  BrB0dEE= width / GammaB0
  ratioB0dEE= width / width_SM
Else If (i1.Eq.2) Then
  BrB0sEE= width / GammaB0
  ratioB0sEE= width / width_SM
Else If (i1.Eq.3) Then
  BrB0dMuMu= width / GammaB0
  ratioB0dMuMu= width / width_SM
Else If (i1.Eq.4) Then
  BrB0sMuMu= width / GammaB0
  ratioB0sMuMu= width / width_SM
Else If (i1.Eq.5) Then
  BrB0dTauTau= width / GammaB0
  ratioB0dTauTau= width / width_SM
Else If (i1.Eq.6) Then
  BrB0sTauTau= width / GammaB0
  ratioB0sTauTau= width / width_SM
End If

End do

 
