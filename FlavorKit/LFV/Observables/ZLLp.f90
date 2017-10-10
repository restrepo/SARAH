Real(dp) :: width
Integer :: i1, gt1, gt2

! ---------------------------------------------------------------- 
! Z -> l l'
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on X. -J. Bi et al, PRD 63 (2001) 096008 [hep-ph/0010270]
! ---------------------------------------------------------------- 

Do i1=1,3 

If (i1.eq.1) Then         ! Z -> e mu
 gt1 = 1
 gt2 = 2
Elseif (i1.eq.2) Then     !Z -> e tau
 gt1 = 1
 gt2 = 3
Else                      ! Z -> mu tau
 gt1 = 2
 gt2 = 3
End if

! decay width
width = oo48pi*(2*(Abs(OZ2lVL(gt1,gt2))**2 +            &
  &                    Abs(OZ2lVR(gt1,gt2))**2)*mZ      & 
  & + (Abs(OZ2lSL(gt1,gt2))**2+Abs(OZ2lSR(gt1,gt2))**2) &
  & * mZ * mZ2 * 0.25_dp) 

If (i1.eq.1) Then
BrZtoMuE = width/(width+gamZ)
Elseif (i1.eq.2) Then 
BrZtoTauE = width/(width+gamZ)
Else
BrZtoTauMu = width/(width+gamZ)
End if

End do
