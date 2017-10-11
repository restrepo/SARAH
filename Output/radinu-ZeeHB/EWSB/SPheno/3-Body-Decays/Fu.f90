! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module Fu3Decays_radinuZeeHB 
 
Use Control 
Use Settings 
Use CouplingsForDecays_radinuZeeHB 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FuThreeBodyDecay(n_in,MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,               & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,            & 
& ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,             & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,               & 
& gTetI,gThh,gTHm,gTVWp,gTVZ,gFuFucFdFd,gFuFucFeFe,gFuFucFuFu,gFuFdcFeFv,gFuFuFvFv,      & 
& epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),               & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),               & 
& cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),           & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),           & 
& cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),             & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp),Intent(in) :: g1,g2,g3,lam5,v,vv

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(inout) :: gFuFucFdFd(3,3,3,3),gFuFucFeFe(3,3,3,3),gFuFucFuFu(3,3,3,3),gFuFdcFeFv(3,3,3,3),      & 
& gFuFuFvFv(3,3,3,3)

Real(dp),Intent(in) :: gTetI,gThh(2),gTHm(3),gTVWp,gTVZ

Real(dp) :: gFuFucFdFdi(3,3,3),gFuFucFeFei(3,3,3),gFuFucFuFui(3,3,3),gFuFdcFeFvi(3,3,3),          & 
& gFuFuFvFvi(3,3,3)

Real(dp) :: gTetItemp,gThhtemp(2),gTHmtemp(3),gTVWptemp,gTVZtemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FuThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTetItemp = 0._dp 
gThhtemp = 0._dp 
gTHmtemp = 0._dp 
gTVWptemp = 0._dp 
gTVZtemp = 0._dp 
Else 
gTetItemp = gTetI 
gThhtemp = gThh 
gTHmtemp = gTHm 
gTVWptemp = gTVWp 
gTVZtemp = gTVZ 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fu_decays_3B(MFu(i_run),i_run,MAh,MAh2,MetI,MetI2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,              & 
& ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZH,ZP,ZW,ZZ,alphaH,g1,g2,g3,lam1,lam2,lam4,lam3,            & 
& lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,            & 
& m12,mh,v,vv,cplcFdFdetIL,cplcFdFdetIR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,cplcFdFuVWpL,cplcFdFuVWpR,cplcFeFeetIL,          & 
& cplcFeFeetIR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFvcHmL,             & 
& cplcFeFvcHmR,cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,        & 
& cplcFuFdHmR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,             & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFuFucFdFdi = 0._dp 
Call FuToFucFdFd(i_run,MFu,MFd,MVZ,MVWp,MHm,MetI,Mhh,cplcFdFdetIL,cplcFdFdetIR,       & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,        & 
& gTVWptemp,gTHmtemp,gTetItemp,gThhtemp,deltaM,epsI,check,gFuFucFdFdi)

gFuFucFdFd(i_run,:,:,:) = gFuFucFdFdi 
gT(i_run) = gT(i_run) + Sum(gFuFucFdFdi) 
 
gFuFucFeFei = 0._dp 
Call FuToFucFeFe(i_run,MFu,MFe,MVZ,MetI,Mhh,cplcFeFeetIL,cplcFeFeetIR,cplcFeFehhL,    & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,             & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,   & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTetItemp,gThhtemp,deltaM,             & 
& epsI,check,gFuFucFeFei)

gFuFucFeFe(i_run,:,:,:) = gFuFucFeFei 
gT(i_run) = gT(i_run) + Sum(gFuFucFeFei) 
 
gFuFucFuFui = 0._dp 
Call FuToFucFuFu(i_run,MFu,MVZ,MetI,Mhh,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,        & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,IntegralSSst,              & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTetItemp,gThhtemp,deltaM,epsI,             & 
& check,gFuFucFuFui)

gFuFucFuFu(i_run,:,:,:) = gFuFucFuFui 
gT(i_run) = gT(i_run) + Sum(gFuFucFuFui) 
 
gFuFdcFeFvi = 0._dp 
Call FuToFdcFeFv(i_run,MFd,MFe,MFv,MVWp,MHm,MFu,cplcFeFvcHmL,cplcFeFvcHmR,            & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWptemp,gTHmtemp,deltaM,epsI,check,gFuFdcFeFvi)

gFuFdcFeFv(i_run,:,:,:) = gFuFdcFeFvi 
gT(i_run) = gT(i_run) + Sum(gFuFdcFeFvi) 
 
gFuFuFvFvi = 0._dp 
Call FuToFuFvFv(i_run,MFu,MFv,MVZ,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,      & 
& IntegralVs,IntegralVVss,NVs,NVVss,gTVZtemp,deltaM,epsI,check,gFuFuFvFvi)

gFuFuFvFv(i_run,:,:,:) = gFuFuFvFvi 
gT(i_run) = gT(i_run) + Sum(gFuFuFvFvi) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFucFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFucFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFuFucFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFuFdcFeFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt2,3
gPartial(i1,n_length)= gFuFuFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FuThreeBodyDecay
 
 
Subroutine FuToFucFdFd(iIN,MFu,MFd,MVZ,MVWp,MHm,MetI,Mhh,cplcFdFdetIL,cplcFdFdetIR,   & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFucHmL,cplcFdFucHmR,             & 
& cplcFdFuVWpL,cplcFdFuVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVWp,gTHm,gTetI,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFd(3),MVZ,MVWp,MHm(3),MetI,Mhh(2)

Complex(dp),Intent(in) :: cplcFdFdetIL(3,3),cplcFdFdetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),            & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFucHmL(3,3,3),cplcFdFucHmR(3,3,3),             & 
& cplcFdFuVWpL(3,3),cplcFdFuVWpR(3,3),cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),             & 
& cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),             & 
& cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVWp,gTHm(3),gTetI,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 64 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFdcVWpL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFdcVWpR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFuVWpL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFuVWpR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  Hm 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MHm(i1) 
Boson2(2) =gTHm(i1) 
 
Boson4(1) = MHm(i1) 
Boson4(2) =gTHm(i1) 
Boson4(3) = MHm(i1) 
Boson4(4) =gTHm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFdHmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFuFdHmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdFucHmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdFucHmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm'
      End Do 



!-------------- 
!  etI 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetI 
Boson2(2) =gTetI 
 
Boson4(1) = MetI 
Boson4(2) =gTetI 
Boson4(3) = MetI 
Boson4(4) =gTetI 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuetIR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdetIL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdetIR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, conj[VWp] 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWp 
Boson4(4) = gTVWp 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFdcVWpL(iIN,gt3)) 
coup2(3) = Conjg(cplcFuFdcVWpR(iIN,gt3))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFuVWpL(gt2,gt1)) 
coup2(7) = Conjg(cplcFdFuVWpR(gt2,gt1)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,conj[VWp]'



!-------------- 
!  VZ, Hm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFdHmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdHmR(iIN,gt3,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFucHmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFucHmR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Hm'
      End Do 



!-------------- 
!  VZ, etI 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdetIR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,etI'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  conj[VWp], Hm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFdcVWpL(iIN,gt3) 
coup2(2) = cplcFuFdcVWpR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFdHmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdHmR(iIN,gt3,i2))  
coup2(5) = cplcFdFuVWpL(gt2,gt1) 
coup2(6) = cplcFdFuVWpR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFucHmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFucHmR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWp],Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],Hm'
      End Do 



!-------------- 
!  conj[VWp], etI 
!-------------- 
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWpL(iIN,gt3) 
coup2(2) = cplcFuFdcVWpR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFdFuVWpL(gt2,gt1) 
coup2(6) = cplcFdFuVWpR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdetIR(gt2,gt3)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWp],etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],etI'



!-------------- 
!  conj[VWp], hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdcVWpL(iIN,gt3) 
coup2(2) = cplcFuFdcVWpR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFuVWpL(gt2,gt1) 
coup2(6) = cplcFdFuVWpR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: conj[VWp],hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],hh'
      End Do 



!-------------- 
!  Hm, Hm 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHm(i1) 
Boson4(2) = gTHm(i1) 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFdHmL(iIN,gt3,i1) 
coup2(2) = cplcFuFdHmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFdHmL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFdHmR(iIN,gt3,i2))  
coup2(5) = cplcFdFucHmL(gt2,gt1,i1) 
coup2(6) = cplcFdFucHmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFucHmL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFdFucHmR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: Hm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm,Hm'
        End Do 
      End Do 



!-------------- 
!  Hm, etI 
!-------------- 
Do i1=1,3
Boson4(1) = MHm(i1) 
Boson4(2) = gTHm(i1) 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdHmL(iIN,gt3,i1) 
coup2(2) = cplcFuFdHmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFdFucHmL(gt2,gt1,i1) 
coup2(6) = cplcFdFucHmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFdFdetIR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: Hm,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm,etI'
        End Do 



!-------------- 
!  Hm, hh 
!-------------- 
Do i1=1,3
  Do i2=1,2
Boson4(1) = MHm(i1) 
Boson4(2) = gTHm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFuFdHmL(iIN,gt3,i1) 
coup2(2) = cplcFuFdHmR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFucHmL(gt2,gt1,i1) 
coup2(6) = cplcFdFucHmR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: Hm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm,hh'
        End Do 
      End Do 



!-------------- 
!  etI, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuetIL(iIN,gt1) 
coup2(2) = cplcFuFuetIR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdetIL(gt2,gt3) 
coup2(6) = cplcFdFdetIR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: etI,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFdFdhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFdFdhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFd Fd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:64))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFdFd 
 
 
Subroutine FuToFucFeFe(iIN,MFu,MFe,MVZ,MetI,Mhh,cplcFeFeetIL,cplcFeFeetIR,            & 
& cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuetIL,cplcFuFuetIR,             & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,               & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTetI,             & 
& gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFe(3),MVZ,MetI,Mhh(2)

Complex(dp),Intent(in) :: cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),            & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),& 
& cplcFuFuhhR(3,3,2),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTetI,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  etI 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetI 
Boson2(2) =gTetI 
 
Boson4(1) = MetI 
Boson4(2) =gTetI 
Boson4(3) = MetI 
Boson4(4) =gTetI 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuetIR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeetIL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeetIR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, etI 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFeFeetIR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,etI'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  etI, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuetIL(iIN,gt1) 
coup2(2) = cplcFuFuetIR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFeetIL(gt2,gt3) 
coup2(6) = cplcFeFeetIR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: etI,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFehhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFehhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFe Fe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFeFe 
 
 
Subroutine FuToFucFuFu(iIN,MFu,MVZ,MetI,Mhh,cplcFuFuetIL,cplcFuFuetIR,cplcFuFuhhL,    & 
& cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,IntegralSs,IntegralSSss,IntegralSSst,              & 
& IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,NSs,NSSss,              & 
& NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTetI,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MVZ,MetI,Mhh(2)

Complex(dp),Intent(in) :: cplcFuFuetIL(3,3),cplcFuFuetIR(3,3),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),            & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTetI,gThh(2)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup2(7) = Conjg(cplcFuFuVZR(gt2,gt3)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  etI 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MetI 
Boson2(2) =gTetI 
 
Boson4(1) = MetI 
Boson4(2) =gTetI 
Boson4(3) = MetI 
Boson4(4) =gTetI 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuetIR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuetIL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuetIR(gt2,gt3))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuetIL(iIN,gt3)) 
coup(1) = Conjg(cplcFuFuetIR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFuetIL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFuetIR(gt2,gt1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuetIL(iIN,gt3) 
coup2(2) = cplcFuFuetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFuFuetIL(gt2,gt1) 
coup2(6) = cplcFuFuetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuetIR(gt2,gt3)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='etI'



!-------------- 
!  hh 
!-------------- 
Do i1=1,2
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup(2) = Conjg(cplcFuFuhhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFuFuhhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i1)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i1))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, etI 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MetI 
Boson4(4) = gTetI 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuetIR(gt2,gt3)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt1)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt1))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuetIL(gt2,gt3)) 
coup2(8) = Conjg(cplcFuFuetIR(gt2,gt3)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt3)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuetIL(gt2,gt1)) 
coup2(8) = Conjg(cplcFuFuetIR(gt2,gt1)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuetIL(iIN,gt3)) 
coup2(4) = Conjg(cplcFuFuetIR(iIN,gt3))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuetIL(gt2,gt1)) 
coup2(8) = Conjg(cplcFuFuetIR(gt2,gt1)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,etI" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,etI'



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuVZL(iIN,gt3) 
coup2(2) = cplcFuFuVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt1) 
coup2(6) = cplcFuFuVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  etI, hh 
!-------------- 
  Do i2=1,2
Boson4(1) = MetI 
Boson4(2) = gTetI 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuetIL(iIN,gt1) 
coup2(2) = cplcFuFuetIR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuetIL(gt2,gt3) 
coup2(6) = cplcFuFuetIR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuetIL(iIN,gt3) 
coup2(2) = cplcFuFuetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuetIL(gt2,gt1) 
coup2(6) = cplcFuFuetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuetIL(iIN,gt3) 
coup2(2) = cplcFuFuetIR(iIN,gt3) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuetIL(gt2,gt1) 
coup2(6) = cplcFuFuetIR(gt2,gt1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuetIL(iIN,gt1) 
coup2(2) = cplcFuFuetIR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuetIL(gt2,gt3) 
coup2(6) = cplcFuFuetIR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: etI,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='etI,hh'
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,1
  Do i2=i1+1,2
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt1,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt3,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt1) 
 
coup2(1) = cplcFuFuhhL(iIN,gt3,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt3,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt1,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt1,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFu(gt3) 
mass(4) = MFu(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFuFuhhL(iIN,gt1,i1) 
coup2(2) = cplcFuFuhhR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFuhhL(iIN,gt3,i2)) 
coup2(4) = Conjg(cplcFuFuhhR(iIN,gt3,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFuFuhhL(gt2,gt1,i2)) 
coup2(8) = Conjg(cplcFuFuhhR(gt2,gt1,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu cFu Fu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFucFuFu 
 
 
Subroutine FuToFdcFeFv(iIN,MFd,MFe,MFv,MVWp,MHm,MFu,cplcFeFvcHmL,cplcFeFvcHmR,        & 
& cplcFeFvVWpL,cplcFeFvVWpR,cplcFuFdcVWpL,cplcFuFdcVWpR,cplcFuFdHmL,cplcFuFdHmR,         & 
& IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,            & 
& NVSss,NVVss,gTVWp,gTHm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFv(3),MVWp,MHm(3),MFu(3)

Complex(dp),Intent(in) :: cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),          & 
& cplcFuFdcVWpL(3,3),cplcFuFdcVWpR(3,3),cplcFuFdHmL(3,3,3),cplcFuFdHmR(3,3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVWp,gTHm(3)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 16 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFv(gt3))+Abs(MFe(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  conj[VWp] 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWp 
Boson2(2) =gTVWp 
 
Boson4(1) = MVWp 
Boson4(2) =gTVWp 
Boson4(3) = MVWp 
Boson4(4) =gTVWp 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFdcVWpL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFdcVWpR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFvVWpL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFvVWpR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFe Fv Propagator: conj[VWp]" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp]'



!-------------- 
!  Hm 
!-------------- 
Do i1=1,3
Isum = Isum + 1 
Boson2(1) = MHm(i1) 
Boson2(2) =gTHm(i1) 
 
Boson4(1) = MHm(i1) 
Boson4(2) =gTHm(i1) 
Boson4(3) = MHm(i1) 
Boson4(4) =gTHm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFdHmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFuFdHmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFvcHmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFvcHmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFe Fv Propagator: Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm'
      End Do 



!-------------- 
!  conj[VWp], Hm 
!-------------- 
  Do i2=1,3
Boson4(1) = MVWp 
Boson4(2) = gTVWp 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFdcVWpL(iIN,gt1) 
coup2(2) = cplcFuFdcVWpR(iIN,gt1) 
coup2(3) = Conjg(cplcFuFdHmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFdHmR(iIN,gt1,i2))  
coup2(5) = cplcFeFvVWpL(gt2,gt3) 
coup2(6) = cplcFeFvVWpR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFvcHmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFvcHmR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFe Fv Propagator: conj[VWp],Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='conj[VWp],Hm'
      End Do 



!-------------- 
!  Hm, Hm 
!-------------- 
Do i1=1,2
  Do i2=i1+1,3
Boson4(1) = MHm(i1) 
Boson4(2) = gTHm(i1) 
Boson4(3) = MHm(i2) 
Boson4(4) = gTHm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFuFdHmL(iIN,gt1,i1) 
coup2(2) = cplcFuFdHmR(iIN,gt1,i1) 
coup2(3) = Conjg(cplcFuFdHmL(iIN,gt1,i2)) 
coup2(4) = Conjg(cplcFuFdHmR(iIN,gt1,i2))  
coup2(5) = cplcFeFvcHmL(gt2,gt3,i1) 
coup2(6) = cplcFeFvcHmR(gt2,gt3,i1) 
coup2(7) = Conjg(cplcFeFvcHmL(gt2,gt3,i2)) 
coup2(8) = Conjg(cplcFeFvcHmR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fd cFe Fv Propagator: Hm,Hm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hm,Hm'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:16))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFdcFeFv 
 
 
Subroutine FuToFuFvFv(iIN,MFu,MFv,MVZ,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,             & 
& cplFvFvVZR,IntegralVs,IntegralVVss,NVs,NVVss,gTVZ,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFv(3),MVZ

Complex(dp),Intent(in) :: cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(3,3),cplFvFvVZR(3,3)

Real(dp),Intent(inout) :: IntegralVs(25000,9),IntegralVVss(500000,12)

Real(dp),Intent(inout) :: gTVZ

Integer, Intent(inout) :: NVs,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFu(iIN) 
 
Isum = 1 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
Isum = 0 
 
If(Abs(MFu(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFuFuVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFu(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFuFuVZL(iIN,gt1) 
coup2(2) = cplcFuFuVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFuFuVZL(iIN,gt1)) 
coup2(3) = Conjg(cplcFuFuVZR(iIN,gt1))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(8) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(7) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fu->Fu Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt2,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:1))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFu(iIN))**3*g
End Subroutine FuToFuFvFv 
 
 
End Module Fu3Decays_radinuZeeHB 
 
