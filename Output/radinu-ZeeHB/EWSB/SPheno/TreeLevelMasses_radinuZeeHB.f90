! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:59 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module TreeLevelMasses_radinuZeeHB 
 
Use Control 
Use Mathematics 
Use MathematicsQP 
Use Settings 
Use Model_Data_radinuZeeHB 
!Use StandardModel 
 
 
Logical :: SignOfMassChanged =.False.  
Logical :: SignOfMuChanged =.False.  
Contains 
 
Subroutine TreeMasses(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,              & 
& ZH,ZP,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,              & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(out) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,vv

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesradinu/ZeeHB'
 
kont = 0 
Call CalculateVPVZ(g1,g2,v,vv,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWp(g2,v,vv,ZW,MVWp,MVWp2,kont)

MAh2 = (2*(2._dp*(mH2) + lam1*v**2 + vv*(lam6*v + (lam3 + lam4 - lam5)*vv))           & 
&  + 2*v*vv*Conjg(lam6) + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 
  If (MAh2.ne.MAh2) Then 
      Write(*,*) 'NaN appearing in MAh2' 
      Call TerminateProgram 
    End If 
  If (MAh2.Ge.0._dp) Then 
MAh = sqrt(MAh2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MAh2' 
      Write(10,*) 'mass squarred is negative: ',MAh2 
    End If 
     Write(ErrCan,*) 'Warning from routine MAh2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MAh2 
     Write(*,*) 'Warning from routine MAh2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MAh2 
        MAh= 1._dp 
        MAh2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
MetI2 = (2*(2._dp*(mEt2) + lam3*v**2 + lam4*v**2 - lam5*v**2 + lam7*v*vv +            & 
&  lam2*vv**2) + 2*v*vv*Conjg(lam7) + vv**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))               & 
& **2)/4._dp 
  If (MetI2.ne.MetI2) Then 
      Write(*,*) 'NaN appearing in MetI2' 
      Call TerminateProgram 
    End If 
  If (MetI2.Ge.0._dp) Then 
MetI = sqrt(MetI2) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from MetI2' 
      Write(10,*) 'mass squarred is negative: ',MetI2 
    End If 
     Write(ErrCan,*) 'Warning from routine MetI2' 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) MetI2 
     Write(*,*) 'Warning from routine MetI2' 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) MetI2 
        MetI= 1._dp 
        MetI2= 1._dp 
   SignOfMassChanged = .True. 
 End if 


! ------------------------------- 
Call CalculateMhh(mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,v,vv,               & 
& ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMHm(g2,mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,mh,              & 
& lam9,lam8,mu,lam10,v,vv,ZP,MHm,MHm2,kont)

kont = kontSave 
Call CalculateMFv(UV,MFv,kont)

MFv2 = MFv**2 
Call CalculateMFd(epsD,Yd,v,vv,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(epsU,Yu,v,vv,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(epsE,Ye,v,vv,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 Call SortGoldstones(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,               & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,              & 
& ZH,ZP,ZW,ZZ,alphaH,kont)

If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 

 ! -------------------------------- 
! Setting Goldstone masses 
! -------------------------------- 
 
MAh=MVZ*sqrt(RXiZ)
MAh2=MVZ2*RXiZ
MHm(1)=MVWp*sqrt(RXiWp)
MHm2(1)=MVWp2*RXiWp
TW = ACos(Abs(ZZ(1,1)))
alphaH = ACos(ZH(1,2))
Iname = Iname - 1 
 
End Subroutine  TreeMasses 
 
 
Subroutine RunningFermionMasses(MFeIN,MFe2IN,MFdIN,MFd2IN,MFuIN,MFu2IN,               & 
& v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,            & 
& Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,kont)

Implicit None 
 
Integer, Intent(inout) :: kont 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(in) :: v,vv

Real(dp),Intent(inout) :: MFeIN(3),MFe2IN(3),MFdIN(3),MFd2IN(3),MFuIN(3),MFu2IN(3)

Real(dp) :: MFe(3),MFe2(3),MFd(3),MFd2(3),MFu(3),MFu2(3)

Call CalculateMFe(epsE,Ye,v,vv,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 
MFeIN(1:2) = MFe(1:2) 
MFe2IN(1:2) = MFe2(1:2) 
Call CalculateMFd(epsD,Yd,v,vv,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
MFdIN(1:2) = MFd(1:2) 
MFd2IN(1:2) = MFd2(1:2) 
Call CalculateMFu(epsU,Yu,v,vv,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
MFuIN(1:2) = MFu(1:2) 
MFu2IN(1:2) = MFu2(1:2) 
End Subroutine RunningFermionMasses 

Subroutine TreeMassesEffPot(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,           & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,           & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(out) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,vv

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesradinu/ZeeHB'
 
kont = 0 
Call CalculateVPVZEffPot(g1,g2,v,vv,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWpEffPot(g2,v,vv,ZW,MVWp,MVWp2,kont)

MAh2 = (2*(2._dp*(mH2) + lam1*v**2 + vv*(lam6*v + (lam3 + lam4 - lam5)*vv))           & 
&  + 2*v*vv*Conjg(lam6) + v**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))**2)/4._dp 
  If (MAh2.ne.MAh2) Then 
      Write(*,*) 'NaN appearing in MAh2' 
      Call TerminateProgram 
    End If 
  If (MAh2.Ge.0._dp) Then 
MAh = sqrt(MAh2) 
  Else 
 End if 


! ------------------------------- 
MetI2 = (2*(2._dp*(mEt2) + lam3*v**2 + lam4*v**2 - lam5*v**2 + lam7*v*vv +            & 
&  lam2*vv**2) + 2*v*vv*Conjg(lam7) + vv**2*RXiZ*(g2*Cos(TW) + g1*Sin(TW))               & 
& **2)/4._dp 
  If (MetI2.ne.MetI2) Then 
      Write(*,*) 'NaN appearing in MetI2' 
      Call TerminateProgram 
    End If 
  If (MetI2.Ge.0._dp) Then 
MetI = sqrt(MetI2) 
  Else 
 End if 


! ------------------------------- 
Call CalculateMhhEffPot(mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,              & 
& v,vv,ZH,Mhh,Mhh2,kont)

kontSave = kont 
Call CalculateMHmEffPot(g2,mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,           & 
& mh,lam9,lam8,mu,lam10,v,vv,ZP,MHm,MHm2,kont)

kont = kontSave 
Call CalculateMFvEffPot(UV,MFv,kont)

MFv2 = MFv**2 
Call CalculateMFdEffPot(epsD,Yd,v,vv,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFuEffPot(epsU,Yu,v,vv,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFeEffPot(epsE,Ye,v,vv,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 If (SignOfMassChanged) Then  
 If (.Not.IgnoreNegativeMasses) Then 
  Write(*,*) " Stopping calculation because of negative mass squared." 
  Call TerminateProgram 
 Else 
  SignOfMassChanged= .False. 
  kont=0  
 End If 
End If 
If (SignOfMuChanged) Then 
 If (.Not.IgnoreMuSignFlip) Then 
  Write(*,*) " Stopping calculation because of negative mass squared in tadpoles." 
  Call TerminateProgram 
 Else 
  SignOfMuChanged= .False. 
  kont=0 
 End If 
End If 
Iname = Iname - 1 
 
End Subroutine  TreeMassesEffPot 
 
 
Subroutine CalculateMhh(mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,              & 
& v,vv,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam6

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(2), Mhh2(2) 
Real(dp), Intent(out) :: ZH(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mH2
mat(1,1) = mat(1,1)+(3*lam1*v**2)/2._dp
mat(1,1) = mat(1,1)+(3*lam6*v*vv)/2._dp
mat(1,1) = mat(1,1)+(lam3*vv**2)/2._dp
mat(1,1) = mat(1,1)+(lam4*vv**2)/2._dp
mat(1,1) = mat(1,1)+(lam5*vv**2)/2._dp
mat(1,1) = mat(1,1)+(3*v*vv*Conjg(lam6))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp*(m12)/2._dp
mat(1,2) = mat(1,2)+(3*lam6*v**2)/4._dp
mat(1,2) = mat(1,2)+lam3*v*vv
mat(1,2) = mat(1,2)+lam4*v*vv
mat(1,2) = mat(1,2)+lam5*v*vv
mat(1,2) = mat(1,2)+(3*lam7*vv**2)/4._dp
mat(1,2) = mat(1,2)+(3*v**2*Conjg(lam6))/4._dp
mat(1,2) = mat(1,2)+(3*vv**2*Conjg(lam7))/4._dp
mat(1,2) = mat(1,2)-Conjg(m12)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mEt2
mat(2,2) = mat(2,2)+(lam3*v**2)/2._dp
mat(2,2) = mat(2,2)+(lam4*v**2)/2._dp
mat(2,2) = mat(2,2)+(lam5*v**2)/2._dp
mat(2,2) = mat(2,2)+(3*lam7*v*vv)/2._dp
mat(2,2) = mat(2,2)+(3*lam2*vv**2)/2._dp
mat(2,2) = mat(2,2)+(3*v*vv*Conjg(lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(Mhh2(i1)).Le.MaxMassNumericalZero) Mhh2(i1) = 1.E-10_dp 
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Mhh2(i1) 
    End If 
  Mhh(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Mhh2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Mhh2(i1) 
  Mhh2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhh 

Subroutine CalculateMHm(g2,mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,lam6,           & 
& mh,lam9,lam8,mu,lam10,v,vv,ZP,MHm,MHm2,kont)

Real(dp), Intent(in) :: g2,lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam6,mh,lam9,lam8,mu,lam10

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: MHm(3), MHm2(3) 
Real(dp), Intent(out) :: ZP(3,3) 
 
Real(dp) :: mat(3,3)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mh
mat(1,1) = mat(1,1)+(lam8*v**2)/2._dp
mat(1,1) = mat(1,1)+(lam10*v*vv)/2._dp
mat(1,1) = mat(1,1)+(lam9*vv**2)/2._dp
mat(1,1) = mat(1,1)+(v*vv*Conjg(lam10))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(mu*vv)/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((mu*v)/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mH2
mat(2,2) = mat(2,2)+(lam1*v**2)/2._dp
mat(2,2) = mat(2,2)+(lam6*v*vv)/2._dp
mat(2,2) = mat(2,2)+(lam3*vv**2)/2._dp
mat(2,2) = mat(2,2)+(v*vv*Conjg(lam6))/2._dp
mat(2,2) = mat(2,2)+(g2**2*v**2*RXiWp)/4._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp*(m12)
mat(2,3) = mat(2,3)+(lam6*v**2)/2._dp
mat(2,3) = mat(2,3)+(lam4*v*vv)/2._dp
mat(2,3) = mat(2,3)+(lam5*v*vv)/2._dp
mat(2,3) = mat(2,3)+(lam7*vv**2)/2._dp
mat(2,3) = mat(2,3)+(g2**2*v*vv*RXiWp)/4._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+mEt2
mat(3,3) = mat(3,3)+(lam3*v**2)/2._dp
mat(3,3) = mat(3,3)+(lam7*v*vv)/2._dp
mat(3,3) = mat(3,3)+(lam2*vv**2)/2._dp
mat(3,3) = mat(3,3)+(v*vv*Conjg(lam7))/2._dp
mat(3,3) = mat(3,3)+(g2**2*vv**2*RXiWp)/4._dp

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHm2,ZP,ierr,test) 
 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (Abs(MHm2(i1)).Le.MaxMassNumericalZero) MHm2(i1) = 1.E-10_dp 
  If (MHm2(i1).ne.MHm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHm2(i1).Ge.0._dp) Then 
  MHm(i1)=Sqrt(MHm2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MHm2(i1) 
    End If 
  MHm(i1) = 1._dp 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MHm2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MHm2(i1) 
  MHm2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHm 

Subroutine CalculateMFv(UV,MFv,kont)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(3) 
Complex(dp), Intent(out) ::  UV(3,3) 
                              
Complex(dp) :: mat(3,3), mat2(3,3), phaseM, E3(3) 

Real(dp) :: UVa(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(3,3) = 0._dp 

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E3 = UV(i1,:) 
      UV(i1,:) = UV(i2,:) 
      UV(i2,:) = E3
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, UV, ierr, test) 
mat2 = Matmul( Conjg(UV), Matmul( mat, Transpose( Conjg(UV)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,3-1
If (MaxVal(Abs(mat2(i1,(i1+1):3))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,UVa,ierr,test) 
 
     UV = MatMul(UV,UVa)
  Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,3
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV(i1,:)= phaseM * UV(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFv 

Subroutine CalculateMFd(epsD,Yd,v,vv,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: v,vv

Complex(dp),Intent(in) :: epsD(3,3),Yd(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((vv*epsD(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((vv*epsD(2,1))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((vv*epsD(3,1))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((vv*epsD(1,2))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((vv*epsD(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((vv*epsD(3,2))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((vv*epsD(1,3))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((vv*epsD(2,3))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((vv*epsD(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFd2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFd2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFd2(i1) 
  MFd2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFd 

Subroutine CalculateMFu(epsU,Yu,v,vv,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: v,vv

Complex(dp),Intent(in) :: epsU(3,3),Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vv*epsU(1,1))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vv*epsU(2,1))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vv*epsU(3,1))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vv*epsU(1,2))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vv*epsU(2,2))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vv*epsU(3,2))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vv*epsU(1,3))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vv*epsU(2,3))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vv*epsU(3,3))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFu2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFu2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFu2(i1) 
  MFu2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFu 

Subroutine CalculateMFe(epsE,Ye,v,vv,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: v,vv

Complex(dp),Intent(in) :: epsE(3,3),Ye(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((vv*epsE(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((vv*epsE(1,2))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((vv*epsE(1,3))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((vv*epsE(2,1))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((vv*epsE(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((vv*epsE(2,3))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((vv*epsE(3,1))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((vv*epsE(3,2))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((vv*epsE(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,MFe2(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,MFe2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,MFe2(i1) 
  MFe2(i1) = 1._dp 
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFe 

Subroutine CalculateVPVZ(g1,g2,v,vv,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,v,vv

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*v**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vv**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*v**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vv**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vv**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VPVZ2(i1) 
    End If 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VPVZ2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VPVZ2(i1) 
  VPVZ(i1)= 1._dp 
  VPVZ2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 
TW = ACos(Abs(ZZ(1,1)))

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZ 

Subroutine CalculateVWp(g2,v,vv,ZW,MVWp,MVWp2,kont)

Real(dp), Intent(in) :: g2,v,vv

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWp, MVWp2
Real(dp) :: VWp2(2),VWp(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*v**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vv**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*v**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vv**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWp2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWp2(i1)).Le.1.E-10_dp*(Maxval(VWp2))) VWp2(i1) = 1.E-10_dp 
  If (VWp2(i1).ne.VWp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWp2(i1).Ge.0._dp) Then 
  VWp(i1) =Sqrt(VWp2(i1) ) 
  Else 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,VWp2(i1) 
    End If 
  VWp(i1)= 1._dp 
  VWp2(i1)= 1._dp  
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,VWp2(i1) 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
     Write(*,*) i1,VWp2(i1) 
  VWp(i1)= 1._dp 
  VWp2(i1) = 1._dp  
   SignOfMassChanged = .True. 
! kont = -104 
 End if 
End Do 
 
MVWp = VWp(1) 
MVWp2 = VWp2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWp 

Subroutine CalculateMhhEffPot(mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam5,             & 
& lam6,v,vv,ZH,Mhh,Mhh2,kont)

Real(dp), Intent(in) :: lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam6

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4, pos 
Real(dp), Intent(out) :: Mhh(2), Mhh2(2) 
Real(dp), Intent(out) :: ZH(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) :: Mhh2temp(2), Q2 
Real(dp) :: ZHtemp(2,2),ZHtemp2(2,2) 
 
Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMhh'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mH2
mat(1,1) = mat(1,1)+(3*lam1*v**2)/2._dp
mat(1,1) = mat(1,1)+(3*lam6*v*vv)/2._dp
mat(1,1) = mat(1,1)+(lam3*vv**2)/2._dp
mat(1,1) = mat(1,1)+(lam4*vv**2)/2._dp
mat(1,1) = mat(1,1)+(lam5*vv**2)/2._dp
mat(1,1) = mat(1,1)+(3*v*vv*Conjg(lam6))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-1._dp*(m12)/2._dp
mat(1,2) = mat(1,2)+(3*lam6*v**2)/4._dp
mat(1,2) = mat(1,2)+lam3*v*vv
mat(1,2) = mat(1,2)+lam4*v*vv
mat(1,2) = mat(1,2)+lam5*v*vv
mat(1,2) = mat(1,2)+(3*lam7*vv**2)/4._dp
mat(1,2) = mat(1,2)+(3*v**2*Conjg(lam6))/4._dp
mat(1,2) = mat(1,2)+(3*vv**2*Conjg(lam7))/4._dp
mat(1,2) = mat(1,2)-Conjg(m12)/2._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mEt2
mat(2,2) = mat(2,2)+(lam3*v**2)/2._dp
mat(2,2) = mat(2,2)+(lam4*v**2)/2._dp
mat(2,2) = mat(2,2)+(lam5*v**2)/2._dp
mat(2,2) = mat(2,2)+(3*lam7*v*vv)/2._dp
mat(2,2) = mat(2,2)+(3*lam2*vv**2)/2._dp
mat(2,2) = mat(2,2)+(3*v*vv*Conjg(lam7))/2._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,Mhh2,ZH,ierr,test) 
 
 
! Fix phases
Do i1=1,2
  pos=Maxloc(Abs(ZH(i1,:)),1)
  If (Real(ZH(i1,pos),dp).lt.0._dp) Then
    ZH(i1,:)=-ZH(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Mhh2(i1).ne.Mhh2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Mhh2(i1).Ge.0._dp) Then 
  Mhh(i1)=Sqrt(Mhh2(i1) ) 
  Else 
  Mhh(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMhhEffPot 

Subroutine CalculateMHmEffPot(g2,mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,               & 
& lam5,lam6,mh,lam9,lam8,mu,lam10,v,vv,ZP,MHm,MHm2,kont)

Real(dp), Intent(in) :: g2,lam5,v,vv

Complex(dp), Intent(in) :: mH2,lam1,mEt2,lam2,lam4,lam3,m12,lam7,lam6,mh,lam9,lam8,mu,lam10

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MHm(3), MHm2(3) 
Real(dp), Intent(out) :: ZP(3,3) 
 
Real(dp) :: ZPFIX(3,3) 
 
Real(dp) :: mat(3,3)  

Real(dp) ::  test(2), Q2 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMHm'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+mh
mat(1,1) = mat(1,1)+(lam8*v**2)/2._dp
mat(1,1) = mat(1,1)+(lam10*v*vv)/2._dp
mat(1,1) = mat(1,1)+(lam9*vv**2)/2._dp
mat(1,1) = mat(1,1)+(v*vv*Conjg(lam10))/2._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(mu*vv)/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((mu*v)/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+mH2
mat(2,2) = mat(2,2)+(lam1*v**2)/2._dp
mat(2,2) = mat(2,2)+(lam6*v*vv)/2._dp
mat(2,2) = mat(2,2)+(lam3*vv**2)/2._dp
mat(2,2) = mat(2,2)+(v*vv*Conjg(lam6))/2._dp
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-1._dp*(m12)
mat(2,3) = mat(2,3)+(lam6*v**2)/2._dp
mat(2,3) = mat(2,3)+(lam4*v*vv)/2._dp
mat(2,3) = mat(2,3)+(lam5*v*vv)/2._dp
mat(2,3) = mat(2,3)+(lam7*vv**2)/2._dp
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+mEt2
mat(3,3) = mat(3,3)+(lam3*v**2)/2._dp
mat(3,3) = mat(3,3)+(lam7*v*vv)/2._dp
mat(3,3) = mat(3,3)+(lam2*vv**2)/2._dp
mat(3,3) = mat(3,3)+(v*vv*Conjg(lam7))/2._dp

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,MHm2,ZP,ierr,test) 
 
 
! Fix phases
Do i1=1,3
  pos=Maxloc(Abs(ZP(i1,:)),1)
  If (Real(ZP(i1,pos),dp).lt.0._dp) Then
    ZP(i1,:)=-ZP(i1,:)
  End if
End do
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,3
  If (MHm2(i1).ne.MHm2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (MHm2(i1).Ge.0._dp) Then 
  MHm(i1)=Sqrt(MHm2(i1) ) 
  Else 
  MHm(i1) = 1._dp 
! kont = -104 
 End if 
End Do 
Iname = Iname - 1 
 
End Subroutine CalculateMHmEffPot 

Subroutine CalculateMFvEffPot(UV,MFv,kont)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr, pos 
Integer :: j1,j2,j3,j4 
Logical :: SecondDiagonalisationNeeded 
Real(dp), Intent(out) :: MFv(3) 
Complex(dp), Intent(out) ::  UV(3,3) 
                              
Complex(dp) :: mat(3,3), mat2(3,3), phaseM, E3(3) 

Real(dp) :: UVa(3,3), test(2), eig(3) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFv'
 
mat(1,1) = 0._dp 
mat(1,2) = 0._dp 
mat(1,3) = 0._dp 
mat(2,2) = 0._dp 
mat(2,3) = 0._dp 
mat(3,3) = 0._dp 

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
If (Maxval(Abs(Aimag(mat))).Eq.0._dp) Then 
Call EigenSystem(Real(mat,dp),Eig,UVa,ierr,test) 
 
   Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
  Do i1=1,3
   pos=Maxloc(Abs(UV(i1,:)),1) 
   If (Abs(Real(UV(i1,pos),dp)).gt.Abs(Aimag(UV(i1,pos)))) Then 
      If (Real(UV(i1,pos),dp).lt.0._dp) Then 
        UV(i1,:)=-UV(i1,:) 
       End If 
    Else 
      If (Aimag(UV(i1,pos)).lt.0._dp) Then 
        UV(i1,:)=-UV(i1,:) 
      End If 
    End If 
 End Do 
 
Do i1=1,2
  Do i2=i1+1,3
    If (MFv(i1).Gt.MFv(i2)) Then 
      Eig(1) = MFv(i1) 
      MFv(i1) = MFv(i2) 
      MFv(i2) =  Eig(1) 
      E3 = UV(i1,:) 
      UV(i1,:) = UV(i2,:) 
      UV(i2,:) = E3
    End If 
   End Do 
End Do 
 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat) ), mat ) 
Call Eigensystem(mat2, Eig, UV, ierr, test) 
mat2 = Matmul( Conjg(UV), Matmul( mat, Transpose( Conjg(UV)))) 
! Special efforts are needed for matrices like the Higgsinos one 
SecondDiagonalisationNeeded = .False. 
Do i1=1,3-1
If (MaxVal(Abs(mat2(i1,(i1+1):3))).gt.Abs(mat2(i1,i1))) SecondDiagonalisationNeeded = .True. 

  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End do 
If (SecondDiagonalisationNeeded) Then 
Call EigenSystem(Real(mat2,dp),Eig,UVa,ierr,test) 
 
     UV = MatMul(UV,UVa)
  Do i1=1,3
   If ((Eig(i1).Lt.0._dp).or.(Abs(eig(i1)).lt.1E-15)) Then 
    MFv(i1) = - Eig(i1) 
    UV(i1,:) = (0._dp,1._dp)*UVa(i1,:) 
   Else 
    MFv(i1) = Eig(i1) 
    UV(i1,:) = UVa(i1,:)
    End If 
   End Do 
 
Else 
Do i1=1,3
  If (Eig(i1).ne.Eig(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  UV(i1,:)= phaseM * UV(i1,:) 
End if 
  If ((Abs(Eig(i1)).Le.MaxMassNumericalZero).and.(Eig(i1).lt.0._dp)) Eig(i1) = Abs(Eig(i1))+1.E-10_dp 
  If (Eig(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
MFv = Sqrt( Eig ) 
 
End if ! Second diagonalisation 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFv, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Iname = Iname - 1 
 
End Subroutine CalculateMFvEffPot 

Subroutine CalculateMFdEffPot(epsD,Yd,v,vv,ZDL,ZDR,MFd,kont)

Real(dp),Intent(in) :: v,vv

Complex(dp),Intent(in) :: epsD(3,3),Yd(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFd(3) 
 Complex(dp), Intent(out) :: ZDL(3,3), ZDR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2), MFd2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFd'
 
MFd = 0._dp 
ZDL = 0._dp 
ZDR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((vv*epsD(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Yd(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((vv*epsD(2,1))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Yd(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((vv*epsD(3,1))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Yd(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((vv*epsD(1,2))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Yd(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((vv*epsD(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Yd(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((vv*epsD(3,2))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Yd(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((vv*epsD(1,3))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Yd(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((vv*epsD(2,3))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Yd(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((vv*epsD(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Yd(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFd2,ZDL1,ierr,test) 
                  
                  
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZDR2(i1,i1)).gt.0._dp) Then 
phaseM = ZDR2(i1,i1) / Abs(ZDR2(i1,i1)) 
ZDR2(i1,:) = Conjg(phaseM) *ZDR2(i1,:) 
 ZDL2(i1,:) = phaseM *ZDL2(i1,:) 
 End if 
  If (MFd2(i1).ne.MFd2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFd2(i1)).Le.MaxMassNumericalZero) MFd2(i1) = Abs(MFd2(i1))+1.E-10_dp 
  If (MFd2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFd, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFd = Sqrt( MFd2 ) 
ZDL = ZDL2 
ZDR = ZDR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFdEffPot 

Subroutine CalculateMFuEffPot(epsU,Yu,v,vv,ZUL,ZUR,MFu,kont)

Real(dp),Intent(in) :: v,vv

Complex(dp),Intent(in) :: epsU(3,3),Yu(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFu(3) 
 Complex(dp), Intent(out) :: ZUL(3,3), ZUR(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2), MFu2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFu'
 
MFu = 0._dp 
ZUL = 0._dp 
ZUR = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(vv*epsU(1,1))/sqrt(2._dp)
mat(1,1) = mat(1,1)+(v*Yu(1,1))/sqrt(2._dp)
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)+(vv*epsU(2,1))/sqrt(2._dp)
mat(1,2) = mat(1,2)+(v*Yu(2,1))/sqrt(2._dp)
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)+(vv*epsU(3,1))/sqrt(2._dp)
mat(1,3) = mat(1,3)+(v*Yu(3,1))/sqrt(2._dp)
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)+(vv*epsU(1,2))/sqrt(2._dp)
mat(2,1) = mat(2,1)+(v*Yu(1,2))/sqrt(2._dp)
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(vv*epsU(2,2))/sqrt(2._dp)
mat(2,2) = mat(2,2)+(v*Yu(2,2))/sqrt(2._dp)
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)+(vv*epsU(3,2))/sqrt(2._dp)
mat(2,3) = mat(2,3)+(v*Yu(3,2))/sqrt(2._dp)
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)+(vv*epsU(1,3))/sqrt(2._dp)
mat(3,1) = mat(3,1)+(v*Yu(1,3))/sqrt(2._dp)
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)+(vv*epsU(2,3))/sqrt(2._dp)
mat(3,2) = mat(3,2)+(v*Yu(2,3))/sqrt(2._dp)
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)+(vv*epsU(3,3))/sqrt(2._dp)
mat(3,3) = mat(3,3)+(v*Yu(3,3))/sqrt(2._dp)

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFu2,ZUL1,ierr,test) 
                  
                  
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZUR2(i1,i1)).gt.0._dp) Then 
phaseM = ZUR2(i1,i1) / Abs(ZUR2(i1,i1)) 
ZUR2(i1,:) = Conjg(phaseM) *ZUR2(i1,:) 
 ZUL2(i1,:) = phaseM *ZUL2(i1,:) 
 End if 
  If (MFu2(i1).ne.MFu2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFu2(i1)).Le.MaxMassNumericalZero) MFu2(i1) = Abs(MFu2(i1))+1.E-10_dp 
  If (MFu2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFu, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFu = Sqrt( MFu2 ) 
ZUL = ZUL2 
ZUR = ZUR2 
Iname = Iname - 1 
 
End Subroutine CalculateMFuEffPot 

Subroutine CalculateMFeEffPot(epsE,Ye,v,vv,ZEL,ZER,MFe,kont)

Real(dp),Intent(in) :: v,vv

Complex(dp),Intent(in) :: epsE(3,3),Ye(3,3)

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MFe(3) 
 Complex(dp), Intent(out) :: ZEL(3,3), ZER(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2), MFe2(3) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateMFe'
 
MFe = 0._dp 
ZEL = 0._dp 
ZER = 0._dp 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)-((vv*epsE(1,1))/sqrt(2._dp))
mat(1,1) = mat(1,1)-((v*Ye(1,1))/sqrt(2._dp))
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-((vv*epsE(1,2))/sqrt(2._dp))
mat(1,2) = mat(1,2)-((v*Ye(2,1))/sqrt(2._dp))
mat(1,3) = 0._dp 
mat(1,3) = mat(1,3)-((vv*epsE(1,3))/sqrt(2._dp))
mat(1,3) = mat(1,3)-((v*Ye(3,1))/sqrt(2._dp))
mat(2,1) = 0._dp 
mat(2,1) = mat(2,1)-((vv*epsE(2,1))/sqrt(2._dp))
mat(2,1) = mat(2,1)-((v*Ye(1,2))/sqrt(2._dp))
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)-((vv*epsE(2,2))/sqrt(2._dp))
mat(2,2) = mat(2,2)-((v*Ye(2,2))/sqrt(2._dp))
mat(2,3) = 0._dp 
mat(2,3) = mat(2,3)-((vv*epsE(2,3))/sqrt(2._dp))
mat(2,3) = mat(2,3)-((v*Ye(3,2))/sqrt(2._dp))
mat(3,1) = 0._dp 
mat(3,1) = mat(3,1)-((vv*epsE(3,1))/sqrt(2._dp))
mat(3,1) = mat(3,1)-((v*Ye(1,3))/sqrt(2._dp))
mat(3,2) = 0._dp 
mat(3,2) = mat(3,2)-((vv*epsE(3,2))/sqrt(2._dp))
mat(3,2) = mat(3,2)-((v*Ye(2,3))/sqrt(2._dp))
mat(3,3) = 0._dp 
mat(3,3) = mat(3,3)-((vv*epsE(3,3))/sqrt(2._dp))
mat(3,3) = mat(3,3)-((v*Ye(3,3))/sqrt(2._dp))

 
mat2 = Matmul(Transpose(Conjg(mat)),mat) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(mat,Transpose(Conjg(mat))) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem (Real(mat2,dp),MFe2,ZEL1,ierr,test) 
                  
                  
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
Do i1=1,3
If (Abs(ZER2(i1,i1)).gt.0._dp) Then 
phaseM = ZER2(i1,i1) / Abs(ZER2(i1,i1)) 
ZER2(i1,:) = Conjg(phaseM) *ZER2(i1,:) 
 ZEL2(i1,:) = phaseM *ZEL2(i1,:) 
 End if 
  If (MFe2(i1).ne.MFe2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (Abs(MFe2(i1)).Le.MaxMassNumericalZero) MFe2(i1) = Abs(MFe2(i1))+1.E-10_dp 
  If (MFe2(i1).Le.0._dp) Then 
! kont = -104 
 End if 
End Do 
 
If (ierr.Ne.0.) Then 
  Write(ErrCan,*) 'Warning from Subroutine CalculateMFe, ierr =',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


MFe = Sqrt( MFe2 ) 
ZEL = ZEL2 
ZER = ZER2 
Iname = Iname - 1 
 
End Subroutine CalculateMFeEffPot 

Subroutine CalculateVPVZEffPot(g1,g2,v,vv,ZZ,MVZ,MVZ2,TW,kont)

Real(dp), Intent(in) :: g1,g2,v,vv

Real(dp), Intent(out) :: TW

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVZ, MVZ2
Real(dp) :: VPVZ2(2),VPVZ(2)  

Real(dp), Intent(out) :: ZZ(2,2) 
 
Real(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVPVZ'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g1**2*vFix**2)/4._dp
mat(1,1) = mat(1,1)+(g1**2*vvFix**2)/4._dp
mat(1,2) = 0._dp 
mat(1,2) = mat(1,2)-(g1*g2*vFix**2)/4._dp
mat(1,2) = mat(1,2)-(g1*g2*vvFix**2)/4._dp
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vFix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vvFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = mat(i2,i1) 
  End do 
End do 

 
Call EigenSystem(mat,VPVZ2,ZZ,ierr,test) 
 
 
ZZ = Transpose(ZZ) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VPVZ2(i1)).Le.1.E-10_dp*(Maxval(VPVZ2))) VPVZ2(i1) = 1.E-10_dp 
  If (VPVZ2(i1).ne.VPVZ2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VPVZ2(i1).Ge.0._dp) Then 
  VPVZ(i1) =Sqrt(VPVZ2(i1) ) 
  Else 
  VPVZ(i1)= 1._dp 
  VPVZ(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVZ = VPVZ(2) 
MVZ2 = VPVZ2(2) 

 Iname = Iname - 1 
 
End Subroutine CalculateVPVZEffPot 

Subroutine CalculateVWpEffPot(g2,v,vv,ZW,MVWp,MVWp2,kont)

Real(dp), Intent(in) :: g2,v,vv

Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4, ierr 
Integer :: j1,j2,j3,j4 
Real(dp), Intent(out) :: MVWp, MVWp2
Real(dp) :: VWp2(2),VWp(2)  

Complex(dp), Intent(out) :: ZW(2,2) 
 
Complex(dp) :: mat(2,2)  

Real(dp) ::  test(2) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateVWp'
 
mat(1,1) = 0._dp 
mat(1,1) = mat(1,1)+(g2**2*vFix**2)/4._dp
mat(1,1) = mat(1,1)+(g2**2*vvFix**2)/4._dp
mat(1,2) = 0._dp 
mat(2,2) = 0._dp 
mat(2,2) = mat(2,2)+(g2**2*vFix**2)/4._dp
mat(2,2) = mat(2,2)+(g2**2*vvFix**2)/4._dp

 
 Do i1=2,2
  Do i2 = 1, i1-1 
  mat(i1,i2) = Conjg(mat(i2,i1)) 
  End do 
End do 

 
Call EigenSystem(mat,VWp2,ZW,ierr,test) 
 
 
ZW = Transpose(ZW) 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Then 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
    Call TerminateProgram 
  End If 
  ierr = 0 
End If 
 
If ((ierr.Ne.0.).And.(ErrorLevel.Ge.-1)) Then 
  Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
  Write(10,*) 'Diagonalization failed, ierr : ',ierr 
  kont = ierr 
  Iname = Iname - 1 
  Return 
End If 


Do i1=1,2
  If (Abs(VWp2(i1)).Le.1.E-10_dp*(Maxval(VWp2))) VWp2(i1) = 1.E-10_dp 
  If (VWp2(i1).ne.VWp2(i1)) Then 
      Write(*,*) 'NaN appearing in '//NameOfUnit(Iname) 
      Call TerminateProgram 
    End If 
  If (VWp2(i1).Ge.0._dp) Then 
  VWp(i1) =Sqrt(VWp2(i1) ) 
  Else 
  VWp(i1)= 1._dp 
  VWp(i1)= 1._dp 
! kont = -104 
 End if 
End Do 
 
MVWp = VWp(1) 
MVWp2 = VWp2(1) 

 Iname = Iname - 1 
 
End Subroutine CalculateVWpEffPot 

Subroutine TreeMassesSM(MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVWp,MVWp2,               & 
& MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,ZW,ZZ,v,vv,g1,g2,g3,lam1,lam2,lam4,             & 
& lam3,lam7,lam5,lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,            & 
& mEt2,m12,mh,GenerationMixing,kont)

Implicit None 
 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(out) :: MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),MFv2(3),MVWp,MVWp2,               & 
& MVZ,MVZ2,TW,ZZ(2,2)

Complex(dp),Intent(out) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Real(dp),Intent(in) :: v,vv

Logical, Intent(in) :: GenerationMixing 
Integer, Intent(inout) :: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,kontSave 
Iname = Iname + 1 
NameOfUnit(Iname) = 'TreeMassesradinu/ZeeHB'
 
kont = 0 
Call CalculateMFv(UV,MFv,kont)

MFv2 = MFv**2 
Call CalculateMFd(epsD,Yd,v,vv,ZDL,ZDR,MFd,kont)

MFd2 = MFd**2 
Call CalculateMFu(epsU,Yu,v,vv,ZUL,ZUR,MFu,kont)

MFu2 = MFu**2 
Call CalculateMFe(epsE,Ye,v,vv,ZEL,ZER,MFe,kont)

MFe2 = MFe**2 

 
 Call CalculateVPVZ(g1,g2,v,vv,ZZ,MVZ,MVZ2,TW,kont)

Call CalculateVWp(g2,v,vv,ZW,MVWp,MVWp2,kont)

Iname = Iname - 1 
 
End Subroutine  TreeMassesSM 
 
 
Subroutine SortGoldstones(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,             & 
& UV,ZH,ZP,ZW,ZZ,alphaH,kont)

Real(dp),Intent(inout) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp),Intent(inout) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Integer, Intent(inout) :: kont 
Integer :: i1, i2, pos 
Real(dp) :: MHmtemp(3) 
Complex(dp) :: ZHmtemp(3,3) 


pos = MinLoc(Abs(MHm2-MVWp2*RXiWp),1) 
If (pos.ne.1) Then 
  MHmtemp = MHm2 
  ZHmtemp = ZP 
  MHm2(1) = MHmtemp(pos) 
  ZP(1,:) = ZHmtemp(pos,:) 
  MHm2(pos) = MHmtemp(1) 
  ZP(pos,:) = ZHmtemp(1,:) 
End if 

 ! Reorder the physical states by their mass 
Do i1=2,3
 pos = Minloc(MHm2(i1:3),1) + i1 -1  
If (pos.ne.i1) Then 
  MHmtemp = MHm2 
  ZHmtemp = ZP 
  MHm2(i1) = MHmtemp(pos) 
  ZP(i1,:) = ZHmtemp(pos,:) 
  MHm2(pos) = MHmtemp(i1) 
  ZP(pos,:) = ZHmtemp(i1,:) 
End if 
End do 
MHm = sqrt(MHm2) 

 
 
End subroutine SortGoldstones 


End Module TreeLevelMasses_radinuZeeHB 
 
