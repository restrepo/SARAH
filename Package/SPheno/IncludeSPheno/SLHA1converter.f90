Subroutine SLHA1converter(MSd,MSd2, MSu,MSu2, MSe, MSe2, MSv, MSv2, &
   & ZD,ZU,ZE,ZV,Ztop,Zbottom,Ztau,  &
   & PDGd, PDGu, PDGe, PDGv, NamesD, NamesU, NamesE, NamesV)
Implicit None
Real(dp), Intent(inout) :: MSd(6), MSu(6), MSe(6), MSv(3), MSd2(6), MSu2(6), MSe2(6), MSv2(3)
Character(len=30),Dimension(6), Intent(inout) :: NamesD, NamesU, NamesE
Character(len=30),Dimension(3), Intent(inout) :: NamesV
Complex(dp), Intent(inout) :: PDGd(6), PDGu(6), PDGe(6), PDGv(3)
Complex(dp), Intent(in) :: ZU(6,6), ZD(6,6), ZE(6,6), ZV(3,3)
Complex(dp), Intent(out) :: Ztop(2,2), Zbottom(2,2), Ztau(2,2)
Real(dp) :: MSdt(6), MSut(6), MSet(6), MSvt(3)
Character(len=30),Dimension(6) :: NamesDt, NamesUt, NamesEt
Character(len=30),Dimension(3) :: NamesVt
Complex(dp) :: PDGdt(6), PDGut(6), PDGet(6), PDGvt(3)


Integer :: i1, i2, i3, ii, jj, i_zaehl


! Down-Squark

Call CheckMixingMatrix6(ZD, Zbottom,MSd,MSdt, PDGd, PDGdt, NamesD, NamesDt, 1)
!GammaD = GammaDt
!BrD = BrDt
PDGd = PDGdt
NamesD = NamesDt
! MSd = MSdt
! MSd2 = MSdt**2
   

! Up-Squark

Call CheckMixingMatrix6(ZU, Ztop,MSu,MSut, PDGu, PDGut, NamesU, NamesUt,2)
!GammaU = GammaUt
!BrU = BrUt
PDGu = PDGut
NamesU = NamesUt
! MSu = MSut
! MSu2 = MSut**2


! Selectron

Call CheckMixingMatrix6(ZE, Ztau,MSe,MSet, PDGe, PDGet, NamesE, NamesEt,3)
!GammaE = GammaEt
PDGe = PDGet
NamesE = NamesEt
!BrE = BrEt
! MSe = MSet
! MSe2 = MSet**2

! Sneutrino

Call CheckMixingMatrix3(ZV, MSv,MSvt, PDGv, PDGvt, NamesV, NamesVt)
!GammaV = GammaVt
PDGv = PDGvt
NamesV = NamesVt
!BrV = BrVt
! MSv = MSvt
! MSv2 = MSvt**2

Contains 

Subroutine CheckMixingMatrix6(Z,Z_out,m_in,m_out, PDG_in, PDG_out, Names_in, Names_out,particle)
Implicit None
Complex(dp), Intent(in) :: Z(6,6)
Complex(dp), Intent(out) :: Z_out(2,2)
Character(len=30),Dimension(6), Intent(in) :: Names_in
Character(len=30),Dimension(6), Intent(out) :: Names_out
Character(len=30) :: Names_temp, Names_save(6)
Complex(dp), Intent(in) :: PDG_in(6)
Complex(dp), Intent(out) :: PDG_out(6)
Complex(dp) :: PDG_temp, PDG_save(6)
Real(dp), Intent(in) :: m_in(6)
Real(dp) :: mat6R(6,6), mtemp, Maxcont, Z_temp(2)
Integer, Intent(in) ::particle
Real(dp), Intent(out) :: m_out(6)
Integer :: i1, ii, jj, PDG3, PDG6

      Select Case(particle)
       Case(1)  ! d-squark
          Names_save(1) = "SdL"
          Names_save(2) = "SsL"
          Names_save(3) = "Sb1" 
          Names_save(4) = "SdR"
          Names_save(5) = "SsR"
          Names_save(6) = "Sb2" 
          PDG_save(1) = 1000001
          PDG_save(2) = 1000003
          PDG_save(3) = 1000005
          PDG_save(4) = 2000001
          PDG_save(5) = 2000003
          PDG_save(6) = 2000005
       Case(2)  ! u-squark
          Names_save(1) = "SuL"
          Names_save(2) = "ScL"
          Names_save(3) = "St1" 
          Names_save(4) = "SuR"
          Names_save(5) = "ScR"
          Names_save(6) = "St2"
          PDG_save(1) = 1000002
          PDG_save(2) = 1000004
          PDG_save(3) = 1000006
          PDG_save(4) = 2000002
          PDG_save(5) = 2000004
          PDG_save(6) = 2000006 
       Case(3)  ! selectron
          Names_save(1) = "SeL"
          Names_save(2) = "SmuL"
          Names_save(3) = "Stau1" 
          Names_save(4) = "SeR"
          Names_save(5) = "SmuR"
          Names_save(6) = "Stau2"
          PDG_save(1) = 1000011
          PDG_save(2) = 1000013
          PDG_save(3) = 1000015
          PDG_save(4) = 2000011
          PDG_save(5) = 2000013
          PDG_save(6) = 2000015 
      End Select


     mat6R = Abs(Z)
     Do i1=1,6
      jj = Maxloc(mat6R(i1,:),1)
      m_out(jj) = m_in(i1)
      PDG_out(i1) = PDG_save(jj)
      Names_out(i1) = Names_save(jj)
      If (jj.eq.3) Then
         Z_out(1,1) = MaxVal(mat6R(i1,:))
         PDG3 = i1
      End if
      If (jj.eq.6) Then
          Z_out(2,2) = MaxVal(mat6R(i1,:)) 
          PDG6 = i1
      End if
!       mat6R(ii,:) = 0._dp
!       mat6R(:,jj) = 0._dp
     End Do
      Z_out(1,2) = sqrt(1._dp - Z_out(1,1)**2)
      Z_out(2,1) = -Z_out(1,2)
     If (M_out(3).gt.M_out(6)) Then

      Names_out(PDG3) = Names_save(6)
      Names_out(PDG6) = Names_save(3) 

      PDG_out(PDG3) = PDG_save(6)
      PDG_out(PDG6) = PDG_save(3) 

      Z_temp = Z_out(1,:)
      Z_out(1,:) = Z_out(2,:)
      Z_out(2,:) = Z_temp
     End if






End Subroutine CheckMixingMatrix6


Subroutine CheckMixingMatrix3(Z,m_in,m_out, PDG_in, PDG_out, Names_in, Names_out)
Implicit None
Complex(dp), Intent(in) :: Z(3,3)
Real(dp), Intent(in) :: m_in(3)
Character(len=30),Dimension(3), Intent(in) :: Names_in
Character(len=30),Dimension(3), Intent(out) :: Names_out
Character(len=30),Dimension(3) :: Names_save
Complex(dp), Intent(in) :: PDG_in(3)
Complex(dp), Intent(out) :: PDG_out(3)
Complex(dp) :: PDG_save(3)
Real(dp), Intent(out) :: m_out(3)
Real(dp) :: mat6R(3,3), mtemp, Maxcont
Integer :: i1, ii, jj

          PDG_save(1) = 1000012
          PDG_save(2) = 1000014
          PDG_save(3) = 1000016
          Names_save(1) = "Snu_e"
          Names_save(2) = "Snu_mu"
          Names_save(3) = "Snu_tau" 

     mat6R = Abs(Z)
     Do i1=1,3
      jj = Maxloc(mat6R(i1,:),1)
      m_out(jj) = m_in(i1)
      PDG_out(i1) = PDG_save(jj)
      Names_out(i1) = Names_save(jj)
!       mat6R(ii,:) = 0._dp
!       mat6R(:,jj) = 0._dp
     End Do

End Subroutine CheckMixingMatrix3


End Subroutine SLHA1converter