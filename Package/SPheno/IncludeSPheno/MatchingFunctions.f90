!----------------------------
! Scalar Diagrams
!----------------------------

! Four External

Complex(dp) Function ScalarQuarticScalarD0diagram(c1,c2,c3,c4,m1,m2,m3,m4)
Complex(dp), Intent(in) :: c1,c2,c3,c4
Real(dp), Intent(in) :: m1,m2,m3,m4

ScalarQuarticScalarD0diagram = c1*c2*c3*c4*D0_IR(m1**2,m2**2,m3**2,m4**2)

End Function ScalarQuarticScalarD0diagram


Complex(dp) Function ScalarQuarticScalarC0diagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1,m2,m3

ScalarQuarticScalarC0diagram = -c1*c2*c3*C0eft_IR(m1**2,m2**2,m3**2)

End Function ScalarQuarticScalarC0diagram

Complex(dp) Function ScalarQuarticScalarB0diagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarQuarticScalarB0diagram = 0.5_dp*c1*c2*B0_IR(m1**2,m2**2)

End Function ScalarQuarticScalarB0diagram

! Three External

Complex(dp) Function ScalarCubicScalarC0diagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1,m2,m3

ScalarCubicScalarC0diagram = -c1*c2*c3*C0eft_IR(m1**2,m2**2,m3**2)

End Function ScalarCubicScalarC0diagram

Complex(dp) Function ScalarCubicScalarB0diagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarCubicScalarB0diagram = 0.5_dp*c1*c2*B0_IR(m1**2,m2**2)

End Function ScalarCubicScalarB0diagram

!----------------------------
! Fermions Diagrams
!----------------------------

! 4 External

Complex(dp) Function ScalarQuarticFermionDiagram(c1L,c1R,c2L,c2R,c3L,c3R,c4L,c4R,M1,M2,M3,M4)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R,c4L,c4R
Real(dp) :: m12,m22,m32,m42
Real(dp), Intent(in) :: M1,M2,M3,M4

m12=M1**2
m22=M2**2
m32=M3**2
m42=M4**2

ScalarQuarticFermionDiagram = &
 ! B0
 & (C1R*C2L*C3R*C4L + C1L*C2R*C3L*C4R)*B0_IR(m32,m42) + &
 ! C0
 &  ((C1R*C2L*C3R*C4L + C1L*C2R*C3L*C4R)*(M1**2 + M2**2) + C4L*(C1L*M1*(C2L*C3R*M2 + C2R*C3R*M3 + C2R*C3L*M4) &
 & + C1R*(C2L*C3L*M3*M4 + C2R*M2*(C3R*M3 + C3L*M4))) +  &
 &   C4R*(C1R*M1*(C2R*C3L*M2 + C2L*C3L*M3 + C2L*C3R*M4) + C1L*(C2R*C3R*M3*M4 + C2L*M2*(C3L*M3 + C3R*M4))))*C0eft_IR(m22,m32,m42) +  &
 ! D0
 &  M1*(C1L*(C2L*M2*(C3L*M3*(C4R*M1 + C4L*M4) + C3R*M1*(C4L*M1 + C4R*M4)) + C2R*M1*(C3L*M1*(C4R*M1 + C4L*M4) + C3R*M3*(C4L*M1 + C4R*M4))) +  &
 & C1R*(C2L*M1*(C3L*M3*(C4R*M1 + C4L*M4) + C3R*M1*(C4L*M1 + C4R*M4)) + &
 & C2R*M2*(C3L*M1*(C4R*M1 + C4L*M4) + C3R*M3*(C4L*M1 + C4R*M4))))*D0_IR(m12,m22,m32,m42)
 
 ScalarQuarticFermionDiagram=-2._dp*ScalarQuarticFermionDiagram ! Check coefficient

End Function ScalarQuarticFermionDiagram

! 3 External
Complex(dp) Function ScalarCubicFermionDiagram(c1L,c1R,c2L,c2R,c3L,c3R,M1,M2,M3)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R
Real(dp) :: m12,m22,m32
Real(dp), Intent(in) :: M1,M2,M3

m12=M1**2
m22=M2**2
m32=M3**2

ScalarCubicFermionDiagram = &
 ! B0
 & (-C1R*(C2L*C3R*M1 + C2R*C3L*M2 + C2L*C3L*M3) - C1L*(C2R*C3L*M1 + C2L*C3R*M2 + C2R*C3R*M3))*B0_IR(m22,m32) + &
 ! C0
 & (-M1*(C1L*(C2L*M2*(C3R*M1 + C3L*M3) + C2R*M1*(C3L*M1 + C3R*M3)) + &
 &  C1R*(C2L*M1*(C3R*M1 + C3L*M3) + C2R*M2*(C3L*M1 + C3R*M3))))*C0eft_IR(m12,m22,m32) 
 
End Function ScalarCubicFermionDiagram

!----------------------
! PropagatorDiagrams
!----------------------

! Fermion

Complex(dp) Function ScalarQuarticFermionBPPdiagram(c3,c4,c1L,c1R,c2L,c2R,m1,m2,m3,m4)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3,c4
Real(dp), Intent(in) :: m1,m2, m3,m4

ScalarQuarticFermionBPPdiagram = &
 ! DG0
 & 0.5_dp*(C1R*C2L+ C1L*C2R)*(- A0_IR(m1**2) - A0_IR(m2**2) + (- m1**2 - m2**2) * B0_IR(m1**2,m2**2)) - &
 ! DB0
 & 1._dp*m1*m2*(C1L*C2L+C1R*C2R)*B0_IR(m1**2,m2**2)
ScalarQuarticFermionBPPdiagram = 2.0_dp*c3*c4*ScalarQuarticFermionBPPdiagram/(m3**2*m4**2)
End Function ScalarQuarticFermionBPPdiagram

Complex(dp) Function ScalarCubicFermionC0PDiagram(c1L,c1R,c2L,c2R,c3L,c3R,c4,M1,M2,M3,M4)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R,c4
Real(dp) :: m12,m22,m32,m42
Real(dp), Intent(in) :: M1,M2,M3,M4

m12=M1**2
m22=M2**2
m32=M3**2
m42=M4**2

ScalarCubicFermionC0PDiagram = &
 ! B0
 & (-C1R*(C2L*C3R*M1 + C2R*C3L*M2 + C2L*C3L*M3) - C1L*(C2R*C3L*M1 + C2L*C3R*M2 + C2R*C3R*M3))*B0_IR(m22,m32) + &
 ! C0
 & (-M1*(C1L*(C2L*M2*(C3R*M1 + C3L*M3) + C2R*M1*(C3L*M1 + C3R*M3)) + &
 &  C1R*(C2L*M1*(C3R*M1 + C3L*M3) + C2R*M2*(C3L*M1 + C3R*M3))))*C0eft_IR(m12,m22,m32) 
 
ScalarCubicFermionC0PDiagram=-2._dp*c4*ScalarCubicFermionC0PDiagram/m42
!  ScalarCubicFermionC0PDiagram=0._dp
End Function ScalarCubicFermionC0PDiagram

! Scalars

Complex(dp) Function ScalarQuarticScalarB0Pdiagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1,m2, m3

ScalarQuarticScalarB0Pdiagram = c1*c2*c3*B0_IR(m1**2,m2**2)/(m3**2)/2._dp 
End Function ScalarQuarticScalarB0Pdiagram

Complex(dp) Function ScalarQuarticScalarB0P2diagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1,m2, m3

ScalarQuarticScalarB0P2diagram =c1*c2*c3*B0_IR(m1**2,m2**2)/(m3**2)/2._dp 
End Function ScalarQuarticScalarB0P2diagram

Complex(dp) Function ScalarQuarticScalarC0Pdiagram(c1,c2,c3,c4,m1,m2,m3,m4)
Complex(dp), Intent(in) :: c1,c2,c3,c4
Real(dp), Intent(in) :: m1,m2,m3,m4

ScalarQuarticScalarC0Pdiagram = -c1*c2*c3*c4*C0eft_IR(m1**2,m2**2,m3**2)/m4**2 

End Function ScalarQuarticScalarC0Pdiagram



Complex(dp) Function ScalarQuarticScalarB0PPdiagram(c1,c2,c3,c4,m1,m2,m3,m4)
Complex(dp), Intent(in) :: c1,c2,c3,c4
Real(dp), Intent(in) :: m1,m2, m3,m4

ScalarQuarticScalarB0PPdiagram = 0.5_dp*c1*c2*c3*c4*B0_IR(m1**2,m2**2)/(m3**2*m4**2)
End Function ScalarQuarticScalarB0PPdiagram

Complex(dp) Function ScalarQuarticScalarA0PPdiagram(c1,c2,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1,c2,c3
Real(dp), Intent(in) :: m1, m2,m3

ScalarQuarticScalarA0PPdiagram = -0.5_dp*c1*c2*c3*A0_IR(m1**2)/(m2**2*m3**2)
End Function ScalarQuarticScalarA0PPdiagram



!----------------------------
! Yukawa Corrections
!----------------------------

Complex(dp) Function YukawaDiagramsFFSL(c1L,c1R,c2L,c2R,c3L,c3R,m1,m2,m3)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R
Real(dp), Intent(in) :: m1, m2,m3

YukawaDiagramsFFSL = c1R*c3R*(c2L*B0_IR(m3**2,m2**2) + m1*(c2L*m1+c2R*m3)*C0eft_IR(m1**2,m2**2,m3**2))
End Function YukawaDiagramsFFSL

Complex(dp) Function YukawaDiagramsFFSR(c1L,c1R,c2L,c2R,c3L,c3R,m1,m2,m3)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R
Real(dp), Intent(in) :: m1, m2,m3

YukawaDiagramsFFSR = c1L*c3L*(c2R*B0_IR(m3**2,m2**2) +m1*(c2R*m1+c2L*m3)*C0eft_IR(m1**2,m2**2,m3**2))
End Function YukawaDiagramsFFSR

Complex(dp) Function YukawaDiagramsSFFL(c1L,c1R,c2L,c2R,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3
Real(dp), Intent(in) :: m1, m2,m3

YukawaDiagramsSFFL = c1R*c2R*c3*m2*C0eft_IR(m1**2,m2**2,m3**2) 
End Function YukawaDiagramsSFFL

Complex(dp) Function YukawaDiagramsSFFR(c1L,c1R,c2L,c2R,c3,m1,m2,m3)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3
Real(dp), Intent(in) :: m1, m2,m3

YukawaDiagramsSFFR = c1R*c2R*c3*m2*C0eft_IR(m1**2,m2**2,m3**2) 
End Function YukawaDiagramsSFFR

Complex(dp) Function YukawaDiagramsMSDRL(c1L,c1R,c2L,c2R,c3L,c3R)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R

YukawaDiagramsMSDRL = -4._dp*c1L*c2L*c3R
End Function YukawaDiagramsMSDRL

Complex(dp) Function YukawaDiagramsMSDRR(c1L,c1R,c2L,c2R,c3L,c3R)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R,c3L,c3R

YukawaDiagramsMSDRR = -4._dp*c1R*c2R*c3L
End Function YukawaDiagramsMSDRR


!----------------------
! Diagonal Wave Function
!----------------------

! Scalar 

Complex(dp) Function ScalarWaveFermiondiagram(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2

ScalarWaveFermiondiagram = &
 ! DG0
 & 0.5_dp*(C1R*C2L+ C1L*C2R)*((- m1**2 - m2**2) * DB0_IR(m1**2,m2**2) + B0_IR(m1**2,m2**2)) - &
 ! DB0
 & 1._dp*m1*m2*(C1L*C2L+C1R*C2R)*DB0_IR(m1**2,m2**2)
End Function ScalarWaveFermiondiagram

Complex(dp) Function ScalarWaveScalardiagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarWaveScalardiagram = 0.5_dp*c1*c2*DB0_IR(m1**2,m2**2)
End Function ScalarWaveScalardiagram


! Fermion

Complex(dp) Function FermionWaveFSdiagramL(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2
! SigL
FermionWaveFSdiagramL = -c1L*c2R*B1_IR(m1**2,m2**2)
End Function FermionWaveFSdiagramL

Complex(dp) Function FermionWaveFSdiagramR(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2
! SigR
FermionWaveFSdiagramR = -c1R*c2L*B1_IR(m1**2,m2**2)
End Function FermionWaveFSdiagramR


Complex(dp) Function FermionWaveMSDR_L(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2
! SigL
FermionWaveMSDR_L = c1L*c2L
End Function FermionWaveMSDR_L


Complex(dp) Function FermionWaveMSDR_R(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2
! SigR
FermionWaveMSDR_R = c1R*c2R
End Function FermionWaveMSDR_R



!----------------------
! Off-Diagonal Wave Function
!----------------------

! Scalar

Complex(dp) Function ScalarWaveOffFermiondiagram(c1L,c1R,c2L,c2R,m1,m2)
Complex(dp), Intent(in) :: c1L,c1R,c2L,c2R
Real(dp), Intent(in) :: m1,m2

ScalarWaveOffFermiondiagram = &
 ! DG0
 & 0.5_dp*(C1R*C2L+ C1L*C2R)*(- A0_IR(m1**2) - A0_IR(m2**2) + (- m1**2 - m2**2) * B0_IR(m1**2,m2**2)) - &
 ! DB0
 & 1._dp*m1*m2*(C1L*C2L+C1R*C2R)*B0_IR(m1**2,m2**2)
End Function ScalarWaveOffFermiondiagram

Complex(dp) Function ScalarWaveOffScalardiagram(c1,c2,m1,m2)
Complex(dp), Intent(in) :: c1,c2
Real(dp), Intent(in) :: m1,m2

ScalarWaveOffScalardiagram = 0.5_dp*c1*c2*B0_IR(m1**2,m2**2)
End Function ScalarWaveOffScalardiagram

Complex(dp) Function ScalarWaveOffScalardiagramA0(c1,m1)
Complex(dp), Intent(in) :: c1
Real(dp), Intent(in) :: m1

ScalarWaveOffScalardiagramA0 = -c1*A0_IR(m1**2)
End Function ScalarWaveOffScalardiagramA0


! Fermion

!----------------------
! MS-DR Shift
!----------------------

Complex(dp) Function ScalarQuarticScalarMSDR(c1,c2)
Complex(dp), Intent(in) :: c1,c2
ScalarQuarticScalarMSDR = c1*c2 ! Check sign!
End Function ScalarQuarticScalarMSDR



