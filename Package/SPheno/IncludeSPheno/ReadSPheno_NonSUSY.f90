  Subroutine Read_SPhenoInput(io)
  Implicit None
   Integer, Intent(in) :: io

   Integer :: i_par
   Real(dp) :: wert
   Character(len=80) :: read_line

    ! This initialization is necessary for the arrar of production infos
    p_max = Size(Ecms)
    p_act = 0
    Ecms = 0._dp
    Pm = 0._dp
    Pp = 0._dp
    l_ISR = .False.
    Do 
     Read(io,*,End=200,err=200) read_line
!     Write(*,*) trim(read_line)
     If (read_line(1:1).Eq."#") Cycle ! this loop
     Backspace(io) ! resetting to the beginning of the line
     If ((read_line(1:1).Eq."B").Or.(read_line(1:1).Eq."b") ) Exit ! this loop

     Read(io,*,End=200) i_par,wert,read_line
!     write(*,*) i_par,wert,trim(read_line)
     Select Case(i_par)
     Case(1)
      ErrorLevel = Int(wert)

!      Case(2)
!       If (Int(wert).Ne.0) Then
!        SPA_convention = .True.
!        Call SetRGEScale(1.e3_dp**2)
!       End If

     Case(3)
      If (Int(wert).Ne.0) Then 
       External_Spectrum = .True.
       External_Higgs = .True.
      End If

     Case(4)
      If (Int(wert).Ne.0) Use_Flavour_States = .True.

     Case(5)
      If (Int(wert).Ne.0) FermionMassResummation = .False.

     Case(11)  ! whether to calculate  branching ratios or not
      If (Int(wert).Eq.1) L_BR = .True.
      If (Int(wert).Eq.0) L_BR = .False.

!      Case(12) ! minimal value such that a branching ratio is written out
!       Call SetWriteMinBR(wert)

     Case(21)  ! whether to calculate cross sections or not
      If (Int(wert).Eq.1) L_CS = .True.
      If (Int(wert).Eq.0) L_CS = .False.

     Case(22) ! cms energy
      p_act = p_act + 1
      ! this test is necessary to avoid a memory violation
      If (p_act.Le.p_max) Then
       Ecms(p_act) = wert
      Else
       If (output_screen) &
           & Write(*,*) "The number of required points for the calculation"// &
           &  " of cross sections exceeds",p_max
       If (output_screen) &
           & Write(*,*) "Ignoring this information"
       If (output_screen) &
     &  Write(*,*) "Please enlarge the corresponding arrays in the main program."
       Write(ErrCan,*) "The number of required points for the calculation"// &
               &   " of cross sections exceeds",p_max
       Write(ErrCan,*) "Ignoring this information"
       Write(ErrCan,*) &
         &"Please enlarge the corresponding arrays in the main program."
      End If

     Case (23) ! polarisation of incoming e- beam
      If (Abs(wert).Gt.1._dp) Then
       If (output_screen) Write(*,*) &
           & "e- beam polarisation has to between -1 and 1 and not",wert
       If (output_screen) &
           & Write(*,*) "using now unpolarised e- beam"
       Write(ErrCan,*) &
          & "e- beam polarisation has to between -1 and 1 and not",wert
       Write(ErrCan,*) "using now unpolarised e- beam"
       If (p_act.Le.p_max) Pm(p_act) = 0
      Else
       If (p_act.Le.p_max) Pm(p_act) = wert
      End If

     Case (24) ! polarisation of incoming e+ beam
      If (Abs(wert).Gt.1._dp) Then
       If (output_screen) Write(*,*) &
           & "e+ beam polarisation has to between -1 and 1 and not",wert
       If (output_screen) &
           & Write(*,*) "using now unpolarised e+ beam"
       Write(ErrCan,*) &
          & "e+ beam polarisation has to between -1 and 1 and not",wert
       Write(ErrCan,*) "using now unpolarised e+ beam"
       If (p_act.Le.p_max) Pp(p_act) = 0
      Else
       If (p_act.Le.p_max) Pp(p_act) = wert
      End If

     Case(25)
      If ((wert.Eq.1._dp).And.(p_act.Le.p_max)) L_ISR(p_act) = .True.

!      Case(26) ! minimal value such that a cross section is written out
!       Call SetWriteMinSig(wert)

!      Case(31) ! setting a fixed GUT scale if wert > 0
!       If (wert.Gt.0._dp) Call SetGUTScale(wert)

!      Case(32) ! requires strict unification
!       If (Int(wert).Ne.0) check = SetStrictUnification(.True.)

!      Case(33) ! setting a fixed renormalization scale if wert > 0
!       If (wert.Gt.0._dp) Call SetRGEScale(wert**2)

     Case(34) ! precision of mass calculation
      delta_mass = wert

     Case(35) ! maximal number of iterations
      n_run = Int(wert)

     Case(36) ! write out debug information
      If (wert.Eq.0) Then
       WriteOut = .False.
      Else
       WriteOut = .True.
      End If

!      Case(37) ! if =1 -> CKM thourgh V_u, if =2 CKM through V_d 
!       If ((wert.Eq.1._dp).Or.(wert.Eq.2._dp)) i1 =  SetYukawaScheme(Int(wert))

!      Case(38) ! set looplevel of RGEs
!       If (wert.Ne.2._dp) Then
!        TwoLoopRGE=.False.
!       Else
!        TwoLoopRGE=.True.
!       End If

     Case(40) ! alpha(0)
      check_alpha(2) = .True.
      Alpha = 1._dp / wert

     Case(41) ! Z-boson width
      gamZ = wert

     Case(42) ! W-boson width
      gamW = wert

     Case(50) ! W-boson width
      If (wert.Ne.1._dp) Then
       RotateNegativeFermionMasses=.False.
      Else
       RotateNegativeFermionMasses=.True.
      End If

     Case(51)
      If (wert.Ne.1._dp) Then
       SwitchToSCKM=.False.
      Else
       SwitchToSCKM=.True.
      End If

     Case(52)
      If (wert.Ne.1._dp) Then
       IgnoreNegativeMasses=.False.
      Else
       IgnoreNegativeMasses=.True.
      End If

     Case(53)
      If (wert.Ne.1._dp) Then
       IgnoreNegativeMassesMZ=.False.
      Else
       IgnoreNegativeMassesMZ=.True.
      End If

     Case(55)
      If (wert.Ne.0._dp) Then
       CalculateOneLoopMasses=.True.
      Else
       CalculateOneLoopMasses=.False.
      End If


     Case(75) ! Writes the parameter file for WHIZARD
      If (wert.Eq.1) Write_WHIZARD = .True.     

     Case(76) ! Writes input files for HiggsBounfs
      If (wert.Eq.1) Write_HiggsBounds = .True.   

     Case(80) ! exit for sure with non-zero value if a problem occurs
      If (wert.Eq.1) Non_Zero_Exit = .True.      

     Case(90) ! add R-parity at low energies
      If (wert.Eq.1) Add_Rparity = .True.      

     Case(91) ! fit RP parameters such, that neutrino data are o.k.
      If (wert.Eq.1) l_fit_RP_parameters = .True.      

     Case(92) ! for Pythia input
      If (wert.Eq.1) l_RP_Pythia = .True.      

     Case Default
      If (output_screen) Write(*,*) &
           & "Problem while reading SPhenoInput, ignoring unknown entry" &
           & ,i_par,wert
      Write(Errcan,*) &
          & "Problem while reading  SPhenoInput, ignoring unknown entry" &
               & ,i_par,wert
     End Select ! i_par

    End Do  ! i_par 

   200 Return

  End Subroutine Read_SPhenoInput

