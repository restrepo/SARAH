 Subroutine Read_FCONST(io)
  Implicit None
   Integer, Intent(in) :: io
      Real(dp) :: r_mod, wert
   Integer :: i_mod, i_test, i_rp
   Character(len=80) :: read_line
    Do 
     Read(io,*) read_line
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop
     Read(io,*) i_test,i_mod,wert ! ,read_line
     If (i_test.Eq.321) Then
      If (i_mod.Eq.1) Then
       f_k_CONST = wert
      Else If (i_mod.Eq.11) Then
       h_k_CONST = wert
      End If
     Else If (i_test.Eq.511) Then
      If (i_mod.Eq.1) Then
       f_B0d_CONST = wert
      End If
     Else If (i_test.Eq.531) Then
      If (i_mod.Eq.1) Then
       f_B0s_CONST = wert
      End If
     Else If (i_test.Eq.221) Then
      If (i_mod.Eq.1) Then
       f_eta_q_CONST = wert
      Else If (i_mod.Eq.2) Then
       f_eta_s_CONST = wert
      Else If (i_mod.Eq.11) Then
       h_eta_q_CONST = wert
      Else If (i_mod.Eq.12) Then
       h_eta_s_CONST = wert
      End If
     Else If (i_test.Eq.213) Then
      If (i_mod.Eq.1) Then
       f_rho_CONST = wert
      Else If (i_mod.Eq.11) Then
       h_rho_CONST = wert
      End If
     Else If (i_test.Eq.223) Then
      If (i_mod.Eq.1) Then
       f_omega_q_CONST = wert
      Else If (i_mod.Eq.2) Then
       f_omega_s_CONST = wert
      Else If (i_mod.Eq.11) Then
       h_omega_q_CONST = wert
      Else If (i_mod.Eq.12) Then
       h_omega_s_CONST = wert
      End If
     End If
    End Do ! i_mod
  End Subroutine Read_FCONST


 
Subroutine Read_FLIFE(io)
  Implicit None
   Integer, Intent(in) :: io
   Real(dp) :: r_mod, wert
   Integer :: i_mod, i_test, i_rp
   Character(len=80) :: read_line
    Do 
     Read(io,*) read_line
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop
     Read(io,*) i_test,wert ! ,read_line
     If (i_test.Eq.111) Then
      tau_pi0 = wert
     Else if (i_test.Eq.211) Then
      tau_pip = wert
     Else if (i_test.Eq.113) Then
      tau_rho0 = wert
     Else if (i_test.Eq.213) Then
      tau_rhop = wert
     Else if (i_test.Eq.411) Then
      tau_Dp = wert
     Else if (i_test.Eq.421) Then
      tau_D0 = wert
     Else if (i_test.Eq.431) Then
      tau_DSp = wert
     Else if (i_test.Eq.433) Then
      tau_DSsp = wert
     Else if (i_test.Eq.221) Then
      tau_eta = wert
     Else if (i_test.Eq.331) Then
      tau_etap = wert
     Else if (i_test.Eq.223) Then
      tau_omega = wert
     Else if (i_test.Eq.333) Then
      tau_phi = wert
     Else if (i_test.Eq.130) Then
      tau_KL0 = wert
     Else if (i_test.Eq.310) Then
      tau_KS0 = wert
     Else if (i_test.Eq.311) Then
      tau_K0 = wert
     Else if (i_test.Eq.321) Then
      tau_Kp = wert
     Else if (i_test.Eq.511) Then
      tau_B0d = wert
     Else if (i_test.Eq.531) Then
      tau_B0s = wert
     Else if (i_test.Eq.521) Then
      tau_B0p = wert
     Else if (i_test.Eq.513) Then
      tau_B0c = wert
     Else if (i_test.Eq.523) Then
      tau_Bpc = wert
     Else if (i_test.Eq.533) Then
      tau_Bs0c = wert
     Else if (i_test.Eq.541) Then
      tau_Bcp = wert
     Else if (i_test.Eq.543) Then
      tau_Bcpc = wert
     Else if (i_test.Eq.313) Then
      tau_K0c = wert
     Else if (i_test.Eq.323) Then
      tau_Kpc = wert
     Else if (i_test.Eq.441) Then
      tau_etac = wert
     Else if (i_test.Eq.443) Then
      tau_JPsi = wert
     Else if (i_test.Eq.553) Then
      tau_Ups = wert
     Else if (i_test.Eq.551) Then
      tau_etab = wert
     End If
    End Do ! i_mod
  End Subroutine Read_FLIFE

Subroutine Read_FMASS(io)
  Implicit None
   Integer, Intent(in) :: io
   Real(dp) :: r_mod, wert
   Integer :: i_mod, i_test, i_rp
   Character(len=80) :: read_line
    Do 
     Read(io,*) read_line
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop
     Read(io,*) i_test,wert ! ,read_line
     If (i_test.Eq.111) Then
      mass_pi0 = wert
     Else if (i_test.Eq.211) Then
      mass_pip = wert
     Else if (i_test.Eq.113) Then
      mass_rho0 = wert
     Else if (i_test.Eq.213) Then
      mass_rhop = wert
     Else if (i_test.Eq.411) Then
      mass_Dp = wert
     Else if (i_test.Eq.421) Then
      mass_D0 = wert
     Else if (i_test.Eq.431) Then
      mass_DSp = wert
     Else if (i_test.Eq.433) Then
      mass_DSsp = wert
     Else if (i_test.Eq.221) Then
      mass_eta = wert
     Else if (i_test.Eq.331) Then
      mass_etap = wert
     Else if (i_test.Eq.223) Then
      mass_omega = wert
     Else if (i_test.Eq.333) Then
      mass_phi = wert
     Else if (i_test.Eq.130) Then
      mass_KL0 = wert
     Else if (i_test.Eq.310) Then
      mass_KS0 = wert
     Else if (i_test.Eq.311) Then
      mass_K0 = wert
     Else if (i_test.Eq.321) Then
      mass_Kp = wert
     Else if (i_test.Eq.511) Then
      mass_B0d = wert
     Else if (i_test.Eq.531) Then
      mass_B0s = wert
     Else if (i_test.Eq.521) Then
      mass_B0p = wert
     Else if (i_test.Eq.513) Then
      mass_B0c = wert
     Else if (i_test.Eq.523) Then
      mass_Bpc = wert
     Else if (i_test.Eq.533) Then
      mass_Bs0c = wert
     Else if (i_test.Eq.541) Then
      mass_Bcp = wert
     Else if (i_test.Eq.543) Then
      mass_Bcpc = wert
     Else if (i_test.Eq.313) Then
      mass_K0c = wert
     Else if (i_test.Eq.323) Then
      mass_Kpc = wert
     Else if (i_test.Eq.441) Then
      mass_etac = wert
     Else if (i_test.Eq.443) Then
      mass_JPsi = wert
     Else if (i_test.Eq.553) Then
      mass_Ups = wert
     Else if (i_test.Eq.551) Then
      mass_etab = wert
     End If
    End Do ! i_mod
  End Subroutine Read_FMASS