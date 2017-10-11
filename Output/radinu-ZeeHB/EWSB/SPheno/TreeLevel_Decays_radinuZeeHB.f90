! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelDecays_radinuZeeHB
 
Use Control 
Use DecayFunctions 
Use Settings 
Use LoopCouplings_radinuZeeHB 
Use CouplingsForDecays_radinuZeeHB 
Use Model_Data_radinuZeeHB 
Use Mathematics, Only: Li2 
 
 Contains 
 
  
Subroutine FuTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),            & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FuTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFu(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fu_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cplcFuFuetIL,cplcFuFuetIR,cplcFuFdHmL,cplcFuFdHmR,cplcFuFdcVWpL,               & 
& cplcFuFdcVWpR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fu, etI
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MetI
coupL = cplcFuFuetIL(i1,gt1)
coupR = cplcFuFuetIR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, Hm
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 3
m1out = MFd(gt1)
m2out = MHm(gt2)
coupL = cplcFuFdHmL(i1,gt1,gt2)
coupR = cplcFuFdHmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tHb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVWp
coupL = cplcFuFdcVWpL(i1,gt1)
coupR = cplcFuFdcVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.3) Then 
  BR_tWb = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFu(gt1)
m2out = Mhh(gt2)
coupL = cplcFuFuhhL(i1,gt1,gt2)
coupR = cplcFuFuhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fu, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVZ
coupL = cplcFuFuVZL(i1,gt1)
coupR = cplcFuFuVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VG
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VP
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FuTwoBodyDecay
 
 
Subroutine FeTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),            & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cplcFeFvcHmL(3,3,3),& 
& cplcFeFvcHmR(3,3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FeTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFe(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fe_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,     & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFeFvcHmL,cplcFeFvcHmR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, etI
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MetI
coupL = cplcFeFeetIL(i1,gt1)
coupR = cplcFeFeetIR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fe, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFe(gt1)
m2out = Mhh(gt2)
coupL = cplcFeFehhL(i1,gt1,gt2)
coupR = cplcFeFehhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVZ
coupL = cplcFeFeVZL(i1,gt1)
coupR = cplcFeFeVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VWp
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFv(gt1)
m2out = MVWp
coupL = cplcFeFvVWpL(i1,gt1)
coupR = cplcFeFvVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, conj[Hm]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 3
m1out = MFv(gt1)
m2out = MHm(gt2)
coupL = cplcFeFvcHmL(i1,gt1,gt2)
coupR = cplcFeFvcHmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, VP
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FeTwoBodyDecay
 
 
Subroutine FdTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFdFucHmL(3,3,3),& 
& cplcFdFucHmR(3,3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FdTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFd(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fd_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,     & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFdFucHmL,cplcFdFucHmR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fd, etI
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MetI
coupL = cplcFdFdetIL(i1,gt1)
coupR = cplcFdFdetIR(i1,gt1)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFd(gt1)
m2out = Mhh(gt2)
coupL = cplcFdFdhhL(i1,gt1,gt2)
coupR = cplcFdFdhhR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = MVZ
coupL = cplcFdFdVZL(i1,gt1)
coupR = cplcFdFdVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, VWp
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFu(gt1)
m2out = MVWp
coupL = cplcFdFuVWpL(i1,gt1)
coupR = cplcFdFuVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fu, conj[Hm]
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 3
m1out = MFu(gt1)
m2out = MHm(gt2)
coupL = cplcFdFucHmL(i1,gt1,gt2)
coupR = cplcFdFucHmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fd, VG
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fd, VP
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFd(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FdTwoBodyDecay
 
 
Subroutine FvTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),              & 
& cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'FvTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MFv(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Fv_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cplFvFeHmL,cplFvFeHmR,cplFvFecVWpL,cplFvFecVWpR,cplFvFvVZL,cplFvFvVZR,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Fe, Hm
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=2, 3
m1out = MFe(gt1)
m2out = MHm(gt2)
coupL = cplFvFeHmL(i1,gt1,gt2)
coupR = cplFvFeHmR(i1,gt1,gt2)
Call FermionToFermionScalar(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fe, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFe(gt1)
m2out = MVWp
coupL = cplFvFecVWpL(i1,gt1)
coupR = cplFvFecVWpR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, VZ
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFv(gt1)
m2out = MVZ
coupL = cplFvFvVZL(i1,gt1)
coupR = cplFvFvVZR(i1,gt1)
Call FermionToFermionVectorBoson(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, etI
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFv(gt1)
m2out = MetI
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Fv, hh
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 2
m1out = MFv(gt1)
m2out = Mhh(gt2)
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, VP
! ----------------------------------------------

 
Do gt1= 1, 3
m1out = MFv(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine FvTwoBodyDecay
 
 
Subroutine VZTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cpletIhhVZ(2),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),    & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3),cplhhVZVZ(2),        & 
& cplHmVWpVZ(3),cplHmcHmVZ(3,3),cplcVWpVWpVZ

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VZTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVZ 
Call CouplingsFor_VZ_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cpletIhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,        & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplHmVWpVZ,cplHmcHmVZ,cplcVWpVWpVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! hh, etI
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MetI
coup = cpletIhhVZ(gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdVZL(gt1,gt2)
coupR = cplcFdFdVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeVZL(gt1,gt2)
coupR = cplcFeFeVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuVZL(gt1,gt2)
coupR = cplcFuFuVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MFv(gt1)
m2out = MFv(gt2)
coupL = cplFvFvVZL(gt1,gt2)
coupR = cplFvFvVZR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MVZ
coup = cplhhVZVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hm, VWp
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MVWp
coup = cplHmVWpVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hm], Hm
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2=2, 3
m1out = MHm(gt1)
m2out = MHm(gt2)
coup = cplHmcHmVZ(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWp, conj[VWp]
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
coup = cplcVWpVWpVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VZTwoBodyDecay
 
 
Subroutine VWpTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cpletIcHmcVWp(3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplFvFecVWpL(3,3),             & 
& cplFvFecVWpR(3,3),cplhhcVWpVWp(2),cplhhcHmcVWp(2,3),cplcVWpVWpVZ,cplcHmcVWpVZ(3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'VWpTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MVWp 
Call CouplingsFor_VWp_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cpletIcHmcVWp,cplcFuFdcVWpL,cplcFuFdcVWpR,cplFvFecVWpL,cplFvFecVWpR,           & 
& cplhhcVWpVWp,cplhhcHmcVWp,cplcVWpVWpVZ,cplcHmcVWpVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! conj[Hm], etI
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MetI
coup = cpletIcHmcVWp(gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fu], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFd(gt2)
coupL = cplcFuFdcVWpL(gt1,gt2)
coupR = cplcFuFdcVWpR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Fv, Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFv(gt1)
m2out = MFe(gt2)
coupL = cplFvFecVWpL(gt1,gt2)
coupR = cplFvFecVWpR(gt1,gt2)
Call VectorBosonToTwoFermions(m_in,m1out,m2out,1,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VWp
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MVWp
coup = cplhhcVWpVWp(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hm], hh
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2=1, 2
m1out = MHm(gt1)
m2out = Mhh(gt2)
coup = cplhhcHmcVWp(gt2,gt1)
Call VectorBosonToTwoScalars(m_in,m1out,m2out,1,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWp, VZ
! ----------------------------------------------

 
m1out = MVWp
m2out = MVZ
coup = cplcVWpVWpVZ
Call VectorBosonToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! conj[Hm], VZ
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MVZ
coup = cplcHmcVWpVZ(gt1)
Call VectorBosonToScalarAndVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine VWpTwoBodyDecay
 
 
Subroutine hhTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplHiggsPP(2),cplHiggsGG(2),cplHiggsZZvirt(2),cplHiggsWWvirt(2),cpletIetIhh(2),       & 
& cpletIhhhh(2,2),cpletIhhVZ(2),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFeFehhL(3,3,2),& 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplhhhhhh(2,2,2),             & 
& cplhhHmVWp(2,3),cplhhHmcHm(2,3,3),cplhhcVWpVWp(2),cplhhVZVZ(2)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Real(dp) :: alpha3 
Iname = Iname + 1 
NameOfUnit(Iname) = 'hhTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 2
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.2) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,2

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = Mhh(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_hh_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cpletIetIhh,               & 
& cpletIhhhh,cpletIhhVZ,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,     & 
& cplcFuFuhhR,cplhhhhhh,cplhhHmVWp,cplhhHmcHm,cplhhcVWpVWp,cplhhVZVZ,deltaM)

!alpha3 = AlphaSDR(m_in,MFd,MFu) 
alpha3 = g3running**2/(4._dp*Pi) 
i_count = 1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo128pi3 * Abs(cplHiggsPP(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = G_F * m_in**3 * oosqrt2 * oo36pi3 * Abs(cplHiggsGG(i1))**2 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsZZvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VWp, VWp
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
If (m_in.le.2._dp*m1out) Then 
coupReal = cplHiggsWWvirt(i1)
Call ScalarToVectorBosonsVR(m_in,m1out,coupReal,gam) 
Else 
gam = 0._dp 
End if 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! etI, etI
! ----------------------------------------------

 
m1out = MetI
m2out = MetI
coup = cpletIetIhh(i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! hh, etI
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MetI
coup = cpletIhhhh(i1,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! etI, VZ
! ----------------------------------------------

 
m1out = MetI
m2out = MVZ
coup = cpletIhhVZ(i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdhhL(gt1,gt2,i1)
coupR = cplcFdFdhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFehhL(gt1,gt2,i1)
coupR = cplcFeFehhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuhhL(gt1,gt2,i1)
coupR = cplcFuFuhhR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gam = gam * FFqcd(m1out,m_in,alpha3) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2= gt1, 2
m1out = Mhh(gt1)
m2out = Mhh(gt2)
coup = cplhhhhhh(i1,gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If (gt1.eq.gt2) Then 
  BRHHH(i1,gt1) = gPartial(i1,i_count) 
End if 
  BRHHHijk(i1,gt1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hm, VWp
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MVWp
coup = cplhhHmVWp(i1,gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 2*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHHpW(i1,gt2) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hm], Hm
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2=2, 3
m1out = MHm(gt1)
m2out = MHm(gt2)
coup = cplhhHmcHm(i1,gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! VWp, conj[VWp]
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
coup = cplhhcVWpVWp(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
coup = cplhhVZVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1._dp/2._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! etI, VP
! ----------------------------------------------

 
m1out = MetI
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MFv(gt1)
m2out = MFv(gt2)
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VP
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MVZ
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BRHHZ(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VP
! ----------------------------------------------

 
m1out = MVZ
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
Contains 
 
  Real(dp) Function FFqcd(mf, mA, alpha_s)
  Implicit None
   Real(dp) , Intent(in) :: mf, mA, alpha_s
   Real(dp) :: fac, beta, beta2, ratio, R_beta_1, Ln_R_beta_1, Ln_beta

   FFqcd = 0._dp
   ratio = mf / mA
   If (ratio.Ge.0.5_dp) Return ! decay is kinematically forbitten

   If (ratio.Ge.0.495_dp) Return ! Coloumb singularity

    beta2 = 1._dp - 4._dp * ratio**2
    beta = Sqrt(beta2)
    
    R_beta_1 = (1. - beta) / (1._dp + beta)
    Ln_beta = Log(beta)
    Ln_R_beta_1 = Log(R_beta_1)

    fac = (3._dp + 34._dp * beta2 - 13._dp * beta**4) / (16._dp * beta**3)  &
      &     * (-Ln_R_beta_1)                                                &
      & + 0.375_dp * (7._dp - beta2) - 3._dp * Log(4._dp/(1._dp - beta**2)) &
      & - 4._dp * Ln_beta                                                   &
      & + (1._dp + beta**2)                                                 &
      &       * ( 4._dp * Li2(R_beta_1) + 2._dp * Li2(- R_beta_1)           &
      &         + Ln_R_beta_1 * ( 3._dp * Log(2._dp/(1._dp + beta))         &
      &                         + 2._dp * Ln_beta )  ) / beta

    fac = fac - 3._dp * Log(ratio)  ! absorb large logarithms in mass

    FFqcd = 1._dp + 5._dp * alpha_s * fac * oo3pi 

  End  Function FFqcd
End Subroutine hhTwoBodyDecay
 
 
Subroutine HmTwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cpletIHmcHm(3,3),cpletIcHmcVWp(3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),            & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplhhHmcHm(2,3,3),cplhhcHmcVWp(2,3),           & 
& cplHmcHmVZ(3,3),cplcHmcVWpVZ(3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT(:) 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'HmTwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 2 
  i_end = 3
  gT = 0._dp 
  gPartial = 0._dp 
Else If ( (i_in.Ge.1).And.(i_in.Le.3) ) Then 
  i_start = i_in 
  i_end = i_in 
  gT(i_in) = 0._dp 
  gPartial(i_in,:) = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,3

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
Do i1=i_start,i_end 
m_in = MHm(i1) 
If (m_in.Eq.0._dp) Cycle 
Call CouplingsFor_Hm_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cpletIHmcHm,cpletIcHmcVWp,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,              & 
& cplcFeFvcHmR,cplhhHmcHm,cplhhcHmcVWp,cplHmcHmVZ,cplcHmcVWpVZ,deltaM)

i_count = 1 

 
! ----------------------------------------------
! Hm, etI
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MetI
coup = cpletIHmcHm(gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! etI, conj[VWp]
! ----------------------------------------------

 
m1out = MetI
m2out = MVWp
coup = cpletIcHmcVWp(i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! bar[Fd], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFu(gt2)
coupL = cplcFdFucHmL(gt1,gt2,i1)
coupR = cplcFdFucHmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 3*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
If ((gt1.eq.3).and.(gt2.eq.2)) Then 
  BR_Hcb(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.2).and.(gt2.eq.2)) Then 
  BR_Hcs(i1) = gPartial(i1,i_count) 
End if 
If ((gt1.eq.3).and.(gt2.eq.3)) Then 
  BR_HpTB(i1) = gPartial(i1,i_count) 
End if 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFv(gt2)
coupL = cplcFeFvcHmL(gt1,gt2,i1)
coupR = cplcFeFvcHmR(gt1,gt2,i1)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! Hm, hh
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2=1, 2
m1out = MHm(gt1)
m2out = Mhh(gt2)
coup = cplhhHmcHm(gt2,gt1,i1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, conj[VWp]
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MVWp
coup = cplhhcHmcVWp(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpHW(i1,gt1) = gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hm, VZ
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MVZ
coup = cplHmcHmVZ(gt1,i1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VZ, conj[VWp]
! ----------------------------------------------

 
m1out = MVZ
m2out = MVWp
coup = cplcHmcVWpVZ(i1)
Call ScalarToTwoVectorBosons(m_in,m1out,m2out,coup,gam) 
gPartial(i1,i_count) = 1*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
  BR_HpWZ(i1) = gPartial(i1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Hm, VP
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = 0.
gam = 0._dp 
gPartial(i1,i_count) = 0._dp*gam 
gT(i1) = gT(i1) + gPartial(i1,i_count) 
i_count = i_count +1 
  End Do 
If ((Present(BR)).And.(gT(i1).Eq.0)) Then 
  BR(i1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(i1,:) = gPartial(i1,:)/gT(i1) 
End if 
 
End Do 
 
Iname = Iname - 1 
 
End Subroutine HmTwoBodyDecay
 
 
Subroutine etITwoBodyDecay(i_in,deltaM,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,              & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,gPartial,gT,BR)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv,MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),          & 
& MFu2(3),MFv(3),MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,              & 
& TW,ZH(2,2),ZP(3,3),ZZ(2,2),alphaH

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh,ZDR(3,3),ZER(3,3),ZUR(3,3),       & 
& ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cpletIetIetI,cpletIetIhh(2),cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),    & 
& cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cpletIhhhh(2,2),cpletIhhVZ(2),   & 
& cpletIHmVWp(3),cpletIHmcHm(3,3)

Integer, Intent(in) :: i_in 
Real(dp), Intent(inout) :: gPartial(:,:), gT 
Real(dp), Intent(in) :: deltaM 
Real(dp), Optional, Intent(inout) :: BR(:,:) 
Integer :: i1, i2, i3, i4, i_start, i_end, i_count, gt1, gt2, gt3, gt4 
Real(dp) :: gam, m_in, m1out, m2out, coupReal 
Complex(dp) :: coupC, coupR, coupL, coup 
 
Iname = Iname + 1 
NameOfUnit(Iname) = 'etITwoBodyDecay'
 
If (i_in.Lt.0) Then 
  i_start = 1 
  i_end = 1 
  gT = 0._dp 
  gPartial = 0._dp 
Else 
  If (ErrorLevel.Ge.-1) Then 
     Write(ErrCan,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

     Write(*,*) 'Problem in subroutine '//NameOfUnit(Iname) 
     Write(*,*) 'Value of i_in out of range, (i_in,i_max) = ', i_in,1

  End If 
  If (ErrorLevel.Gt.0) Call TerminateProgram 
  If (Present(BR)) BR = 0._dp 
  Iname = Iname -1 
  Return 
End If 
 
i1=1 
m_in = MetI 
Call CouplingsFor_etI_decays_2B(m_in,i1,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,             & 
& MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,               & 
& ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,               & 
& lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,             & 
& mh,v,vv,cpletIetIetI,cpletIetIhh,cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,               & 
& cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,cpletIhhhh,cpletIhhVZ,cpletIHmVWp,              & 
& cpletIHmcHm,deltaM)

i_count = 1 

 
! ----------------------------------------------
! etI, etI
! ----------------------------------------------

 
m1out = MetI
m2out = MetI
coup = cpletIetIetI
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! hh, etI
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MetI
coup = cpletIetIhh(gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! bar[Fd], Fd
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFd(gt1)
m2out = MFd(gt2)
coupL = cplcFdFdetIL(gt1,gt2)
coupR = cplcFdFdetIR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fe], Fe
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFe(gt1)
m2out = MFe(gt2)
coupL = cplcFeFeetIL(gt1,gt2)
coupR = cplcFeFeetIR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! bar[Fu], Fu
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2=1, 3
m1out = MFu(gt1)
m2out = MFu(gt2)
coupL = cplcFuFuetIL(gt1,gt2)
coupR = cplcFuFuetIR(gt1,gt2)
Call ScalarToTwoFermions(m_in,m1out,m2out,coupL,coupR,gam) 
gPartial(1,i_count) = 3*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, hh
! ----------------------------------------------

 
Do gt1= 1, 2
  Do gt2= gt1, 2
m1out = Mhh(gt1)
m2out = Mhh(gt2)
coup = cpletIhhhh(gt1,gt2)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
If (gt1.ne.gt2) gam = 2._dp*gam 
gPartial(1,i_count) = 1._dp/2._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VZ
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = MVZ
coup = cpletIhhVZ(gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! Hm, VWp
! ----------------------------------------------

 
Do gt1= 2, 3
m1out = MHm(gt1)
m2out = MVWp
coup = cpletIHmVWp(gt1)
Call ScalarToScalarVectorBoson(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 2*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! conj[Hm], Hm
! ----------------------------------------------

 
Do gt1= 2, 3
  Do gt2=2, 3
m1out = MHm(gt1)
m2out = MHm(gt2)
coup = cpletIHmcHm(gt2,gt1)
Call ScalarToTwoScalars(m_in,m1out,m2out,coup,gam) 
gPartial(1,i_count) = 1*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! etI, VP
! ----------------------------------------------

 
m1out = MetI
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! etI, VZ
! ----------------------------------------------

 
m1out = MetI
m2out = MVZ
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! Fv, Fv
! ----------------------------------------------

 
Do gt1= 1, 3
  Do gt2= gt1, 3
m1out = MFv(gt1)
m2out = MFv(gt2)
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 
End Do 
 

 
! ----------------------------------------------
! hh, VP
! ----------------------------------------------

 
Do gt1= 1, 2
m1out = Mhh(gt1)
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
  End Do 

 
! ----------------------------------------------
! VG, VG
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VP, VP
! ----------------------------------------------

 
m1out = 0.
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VP
! ----------------------------------------------

 
m1out = MVZ
m2out = 0.
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! conj[VWp], VWp
! ----------------------------------------------

 
m1out = MVWp
m2out = MVWp
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 

 
! ----------------------------------------------
! VZ, VZ
! ----------------------------------------------

 
m1out = MVZ
m2out = MVZ
gam = 0._dp 
gPartial(1,i_count) = 0._dp*gam 
gT = gT + gPartial(1,i_count) 
i_count = i_count +1 
If ((Present(BR)).And.(gT.Eq.0)) Then 
  BR(1,:) = 0._dp 
Else If (Present(BR)) Then 
  BR(1,:) = gPartial(1,:)/gT 
End if 
 
Iname = Iname - 1 
 
End Subroutine etITwoBodyDecay
 
 
Subroutine ScalarToTwoVectorbosonsNew(mS,mV1,mV2,coup,width)
  implicit none
   real(dp), intent(in) :: mS,mV1,mV2
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coup

   real(dp) :: mSsq,mV1sq, mV2sq,kappa

   if ( abs(mS).le.( abs(mV1)+abs(mV2) ) ) then
    width = 0._dp

   elseif (mV1.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V1 = 0, setting width to 0'
    width = 0._dp

   elseif (mV2.eq.0._dp) then
    write(ErrCan,*) 'Server warning, in subroutine ScalarToTwoVectorbosons'
    write(ErrCan,*) 'm_V2 = 0, setting width to 0'
    width = 0._dp


   elseif (Abs(coup).eq.0._dp) then
    width = 0._dp

   else
    mSsq = mS * mS
    mV1sq = mV1**2
    mV2sq = mV2**2
    kappa = Sqrt( (mSsq-mV1sq-mV2sq)**2 - 4._dp * mV1sq*mV2sq )/(mS**3)
    width = coup**2/(4._dp*mV1sq*mV2sq)*(mV1sq**2 + 10._dp*mV1sq*mV2sq - &
             & 2._dp*(mV1sq+mV2sq)*mSsq + mV2sq**2 +mSsq**2)
    width = oo16Pi*width*kappa

   endif

  End Subroutine ScalarToTwoVectorbosonsNew

Subroutine FermionToFermionVectorBosonMassless(mFin,mFout,mV,coupL,coupR,width)
  implicit none
   real(dp), intent(in) :: mFin,mFout,mV
   real(dp), intent(out) :: width
   complex(dp), intent(in) :: coupL, coupR


   if ( abs(mFin).le.( abs(mFout)+abs(mV) ) ) then
    width = 0._dp

   else

    width = 0.5_dp*oo16Pi*(Abs(coupL)**2 + Abs(coupR)**2)*mFin**3


   endif

  End Subroutine FermionToFermionVectorBosonMassless

End Module TreeLevelDecays_radinuZeeHB 
 
