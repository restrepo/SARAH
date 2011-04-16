 Complex(dp) Function AP_onehalf(x)
 !----------------------------------------------------------------------------
 ! calculates the spin 1/2 loop function for the radiative decay of a scalar
 ! to two photons
 ! based on the formulas of M.Spira et al., Nucl. Phys. B 453 (1995) 17
 ! written by Werner Porod, 27.12.2008
 !----------------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: x

!  If (x.Eq.1._dp) Then
!   A_onehalf = 2._dp 
!  Else If (x.Lt.1._dp) Then
  If (x.LE.1._dp) Then
   AP_onehalf = Asin(Sqrt(x))**2  / x
  Else
   AP_onehalf = - 0.25_dp * ( Log( (1._dp + Sqrt(1._dp - 1._dp/x))      &
       &                  / (1._dp - Sqrt(1._dp - 1._dp/x)) )    &
       &             - Cmplx(0._dp, Pi, dp) )**2
   AP_onehalf = AP_onehalf  / x
  End If

 End Function AP_onehalf