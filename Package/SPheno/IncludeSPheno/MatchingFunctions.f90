!----------------------------
! Scalar Diagrams
!----------------------------

! Four External

Complex(dp) Function ScalarQuarticScalarD0diagram(c1,c2,c3,c4,m1,m2,m3,m4)
Complex(dp), Intent(in) :: c1,c2,c3,c4
Real(dp), Intent(in) :: m1,m2,m3,m4

ScalarQuarticScalarD0diagram = c1*c2*c3*c4*D0check(m1,m2,m3,m4)

End Function ScalarQuarticScalarD0diagram


Complex(dp) Function ScalarQuarticScalarC0diagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1,m2,m3

ScalarQuarticScalarC0diagram = -c1*c2*c3*C0_3m(m1,m2,m3)

End Function ScalarQuarticScalarC0diagram

Complex(dp) Function ScalarQuarticScalarB0diagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarQuarticScalarB0diagram = 0.5_dp*c1*c2*B0(0._dp,m1,m2)

End Function ScalarQuarticScalarB0diagram

! Three External

Complex(dp) Function ScalarCubicScalarC0diagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1,m2,m3

ScalarCubicScalarC0diagram = -c1*c2*c3*C0_3m(m1,m2,m3)

End Function ScalarCubicScalarC0diagram

Complex(dp) Function ScalarCubicScalarB0diagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarCubicScalarB0diagram = 0.5_dp*c1*c2*B0(0._dp,m1,m2)

End Function ScalarCubicScalarB0diagram

!----------------------------
! Fermions Diagrams
!----------------------------

! 4 External

Complex(dp) Function ScalarQuarticFermionDiagram(c1L,c1R,c2L,c2R,c3L,c3R,c4L,c4R,m12,m22,m32,m42)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R,c4L,c4R
Real(dp), Intent(in) :: m12,m22,m32,m42
Real(dp) :: M1,M2,M3,M4

M1=Sqrt(m12)
M2=Sqrt(m22)
M3=Sqrt(m32)
M4=Sqrt(m42)

ScalarQuarticFermionDiagram = &
 ! B0
 & (C1R*C2L*C3R*C4L + C1L*C2R*C3L*C4R)*b0(0._dp,m32,m42) + &
 ! C0
 &  ((C1R*C2L*C3R*C4L + C1L*C2R*C3L*C4R)*(M1**2 + M2**2) + C4L*(C1L*M1*(C2L*C3R*M2 + C2R*C3R*M3 + C2R*C3L*M4) &
 & + C1R*(C2L*C3L*M3*M4 + C2R*M2*(C3R*M3 + C3L*M4))) +  &
 &   C4R*(C1R*M1*(C2R*C3L*M2 + C2L*C3L*M3 + C2L*C3R*M4) + C1L*(C2R*C3R*M3*M4 + C2L*M2*(C3L*M3 + C3R*M4))))*c0_3m(m22,m32,m42) +  &
 ! D0
 &  M1*(C1L*(C2L*M2*(C3L*M3*(C4R*M1 + C4L*M4) + C3R*M1*(C4L*M1 + C4R*M4)) + C2R*M1*(C3L*M1*(C4R*M1 + C4L*M4) + C3R*M3*(C4L*M1 + C4R*M4))) +  &
 & C1R*(C2L*M1*(C3L*M3*(C4R*M1 + C4L*M4) + C3R*M1*(C4L*M1 + C4R*M4)) + &
 & C2R*M2*(C3L*M1*(C4R*M1 + C4L*M4) + C3R*M3*(C4L*M1 + C4R*M4))))*D0check(m12,m22,m32,m42)

End Function ScalarQuarticFermionDiagram

! 3 External
Complex(dp) Function ScalarCubicFermionDiagram(c1L,c1R,c2L,c2R,c3L,c3R,m12,m22,m32)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R
Real(dp), Intent(in) :: m12,m22,m32
Real(dp) :: M1,M2,M3

M1=Sqrt(m12)
M2=Sqrt(m22)
M3=Sqrt(m32)

ScalarCubicFermionDiagram = &
 ! B0
 & (-C1R*(C2L*C3R*M1 + C2R*C3L*M2 + C2L*C3L*M3) - C1L*(C2R*C3L*M1 + C2L*C3R*M2 + C2R*C3R*M3))*b0(0._dp,m22,m32) + &
 ! C0
 & (-M1*(C1L*(C2L*M2*(C3R*M1 + C3L*M3) + C2R*M1*(C3L*M1 + C3R*M3)) + &
 &  C1R*(C2L*M1*(C3R*M1 + C3L*M3) + C2R*M2*(C3L*M1 + C3R*M3))))*c0_3m(m12,m22,m32) 

End Function ScalarCubicFermionDiagram



!----------------------
! Diagonal Wave Function
!----------------------

! Fermion

Complex(dp) Function ScalarWaveFermiondiagram(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2

ScalarWaveFermiondiagram = &
 ! DG0
 & 0.5_dp*(C1R*C2L+ C1L*C2R)*SA_DerGLoop(0._dp,m1,m2) - &
 ! DB0
 & 1._dp*sqrt(m1*m2)*(C1L*C2L+C1R*C2R)*SA_DerB0(0._dp,m1,m2)
End Function ScalarWaveFermiondiagram

! Scalar

Complex(dp) Function ScalarWaveScalardiagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarWaveScalardiagram = 0.5_dp*c1*c2*SA_DerB0(0._dp,m1,m2)
End Function ScalarWaveScalardiagram

!----------------------
! Off-Diagonal Wave Function
!----------------------

! Fermion

Complex(dp) Function ScalarWaveOffFermiondiagram(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2

ScalarWaveOffFermiondiagram = &
 ! DG0
 & 0.5_dp*(C1R*C2L+ C1L*C2R)*SA_GLoop(0._dp,m1,m2) - &
 ! DB0
 & 1._dp*sqrt(m1*m2)*(C1L*C2L+C1R*C2R)*SA_B0(0._dp,m1,m2)
End Function ScalarWaveOffFermiondiagram

! Scalar

Complex(dp) Function ScalarWaveOffScalardiagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarWaveOffScalardiagram = 0.5_dp*c1*c2*SA_B0(0._dp,m1,m2)
End Function ScalarWaveOffScalardiagram

Complex(dp) Function ScalarWaveOffScalardiagramA0(c1,m1)
Complex(dp), Intent(in) :: c1
Real(dp), Intent(in) :: m1

ScalarWaveOffScalardiagramA0 = -c1*SA_A0(m1)
End Function ScalarWaveOffScalardiagramA0