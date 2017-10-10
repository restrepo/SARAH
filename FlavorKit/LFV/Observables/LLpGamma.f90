Real(dp) :: width
Integer :: i1, gt1, gt2

! ---------------------------------------------------------------- 
! l -> l' gamma
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on J. Hisano et al, PRD 53 (1996) 2442 [hep-ph/9510309]
! ---------------------------------------------------------------- 

Do i1=1,3 

If (i1.eq.1) Then         ! mu -> e gamma
 gt1 = 2
 gt2 = 1
Elseif (i1.eq.2) Then     !tau -> e gamma
 gt1 = 3
 gt2 = 1
Else                      ! tau -> mu gamma
 gt1 = 3
 gt2 = 2
End if

width=0.25_dp*mf_l(gt1)**5*(Abs(K2L(gt1,gt2))**2 &
           & +Abs(K2R(gt1,gt2))**2)*Alpha

If (i1.eq.1) Then
muEgamma = width/(width+GammaMu)
Elseif (i1.eq.2) Then 
tauEgamma = width/(width+GammaTau)
Else
tauMuGamma = width/(width+GammaTau)
End if

End do
