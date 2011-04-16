Real(dp) Function F1_0(x)
 !-----------------------------------------------------------
 ! loop function as given by Bobeth et al., NPB 630 (2002) 87
 !-----------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: x

  Integer :: i1
  Real(dp) :: r
  Real(dp), Parameter :: c1(7) = (/ 5._dp/6._dp, -1._dp/24._dp, 0._dp            &
          &                       , 1._dp/120._dp, -1._dp/105._dp, 1._dp/112._dp &
          &                       , -1._dp/126._dp /)

  If (x.Eq.0._dp) Then
   F1_0 = 0._dp

  Else If (x.Eq.1._dp) Then
   F1_0 = 0.75_dp

  Else If (Abs(x-1._dp).Lt.1.e-4_dp) Then
   r = x - 1._dp
   F1_0 = c1(7) * r
   Do i1=1,3
    F1_0 = (c1(7-i1) + F1_0)*r
   End Do
   Do i1=5,6
    F1_0 = (c1(7-i1) + F1_0)*r
   End Do
   F1_0 = 0.75_dp + F1_0

  Else
   F1_0 = - 0.5_dp * x * (6 - x)/(x - 1) &
      &  + 0.5_dp * x * (2 + 3 * x) * Log(x) / (x - 1)**2
  End If

 End Function F1_0


 Real(dp) Function F2_0(x)
 !-----------------------------------------------------------
 ! loop function as given by Bobeth et al., NPB 630 (2002) 87
 !-----------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: x

  Integer :: i1
  Real(dp) :: r
  Real(dp), Parameter :: c1(7) = (/ -1._dp/6._dp, 1._dp/12._dp, -0.05_dp         &
          &                       , 1._dp/30._dp, -1._dp/42._dp, 1._dp/56._dp &
          &                       , -1._dp/72._dp /)

  If (x.Eq.0._dp) Then
   F2_0 = 0._dp

  Else If (x.Eq.1._dp) Then
   F2_0 = - 0.5_dp

  Else If (Abs(x-1._dp).Lt.1.e-4_dp) Then
   r = x - 1._dp
   F2_0 = c1(7) * r
   Do i1=1,6
    F2_0 = (c1(7-i1) + F2_0)*r
   End Do
   F2_0 = -0.5_dp + F2_0

  Else
   F2_0 = - x / (x - 1) + x * Log(x) / (x - 1)**2
  End If

 End Function F2_0


 Real(dp) Function F1(x)
 Implicit None
  Real(dp), Intent(in) :: x

  Integer :: i1
  Real(dp), Parameter :: c1(7) = (/ 1._dp / 24._dp, -0.025_dp, 1._dp/60._dp  &
          &                       , -1._dp / 84._dp , 1._dp/112._dp         &
          &                       , -1._dp / 144._dp , 1._dp / 180._dp /)
  Real(dp) :: r
  
  Iname = Iname + 1
  NameOfUnit(Iname) = "F1"

  If (x.Lt.0) Then
   F1 = 0
   If (ErrorLevel.Gt.-2) Then
    Write(ErrCan,*) "Error in Function F1, x=",x
    If (ErrorLevel.Ge.0) Call TerminateProgram
   End If
  End If

  If (x.Eq.0._dp) Then
   F1 = 1._dp / 6._dp
  Else If (x.Eq.1._dp) Then
   F1 = 1._dp / 24._dp
  Else If (Abs(1._dp - x).Lt.1.e-2_dp) Then
   F1 = c1(1)
   r = x - 1._dp
   Do i1=1,6
    F1 = F1 + c1(i1+1) * r**i1
   End Do 
  Else
   F1 = ( 2._dp + 3._dp * x - 6._dp * x**2 + x**3 &
      & + 6._dp * x * Log(x) ) / (12._dp * (1._dp - x)**4 )
  End If

  Iname = Iname - 1
 End Function F1

 Real(dp) Function F2(x)
 Implicit None
  Real(dp), Intent(in) :: x

  Integer :: i1
  Real(dp), Parameter :: c1(7) = (/ 1._dp/24._dp, -1._dp/ 60._dp         &
          &                       , 1._dp/120._dp, -1._dp / 210._dp      &
          &                       , 1._dp/336._dp, -1._dp / 504._dp       &
          &                       , 1._dp/720._dp  /)
  Real(dp) :: r

  If (x.Eq.0._dp) Then
   F2 = 1._dp / 12._dp
  Else If (x.Eq.1._dp) Then
   F2 = 1._dp / 24._dp
  Else If (Abs(1._dp - x).Lt.1.e-2_dp) Then
   F2 = c1(1)
   r = x - 1._dp
   Do i1=1,6
    F2 = F2 + c1(i1+1) * r**i1
   End Do 
  Else
   F2 = ( 1._dp - 6._dp * x + 3._dp * x**2 + 2._dp * x**3 &
      &  - 6._dp * x**2 * Log(x) ) / (12._dp * (1._dp - x)**4 )
  End If

 End Function F2


 Real(dp) Function F3(x)
 Implicit None
  Real(dp), Intent(in) :: x 

  Integer :: i1
  Real(dp) :: r

  If (x.Eq.0._dp) Then
   F3 = Huge(x) ! goes to infinity
  Else If (x.Eq.1._dp) Then
   F3 = 1._dp / 3._dp
  Else If (Abs(1._dp - x).Lt.1.e-2_dp) Then
   F3 = 1._dp / 3._dp
   r = x - 1._dp
   Do i1=1,10
    F3 = F3 + r**i1 * (-1)**i1 / (i1 + 3._dp)
   End Do 
  Else
   F3 = (-3._dp + 4._dp * x - x**2 - 2._dp * Log(x) ) &
    & / (2._dp * (1._dp - x)**3 ) 
  End If

 End Function F3

 Real(dp) Function F3gamma(x)
 Implicit None
  Real(dp), Intent(in) :: x

  Integer :: i1
  Real(dp) :: x2, r
  Real(dp), Parameter :: c1(10) = (/ -2._dp/3._dp, 1._dp/ 6._dp        &
          &                       , -1._dp/15._dp, 1._dp / 30._dp      &
          &                       , -2._dp/105._dp, 1._dp / 84._dp     &
          &                       , -1._dp/1260._dp, 1._dp/180._dp     &
          &                       , -2._dp/495._dp, 1._dp / 330._dp  /)
      
  If (x.Eq.1._dp) Then
   F3gamma = - 2._dp / 3._dp
  Else If (x.Eq.0._dp) Then
   F3gamma = - 1._dp
  Else If (Abs(1._dp-x).Lt.1.e-2_dp) Then
   F3gamma = c1(1)
   r = x - 1._dp
   Do i1=1,9
    F3gamma = F3gamma + c1(i1+1) * r**i1
   End Do 

  Else
   x2 = x*x
   F3gamma = (1 - 4*x + 3 * x2 - 2 * x2 * Log(x) ) / (x-1)**3
  End If

 End Function F3gamma

 Real(dp) Function F4(x)
 Implicit None
  Real(dp), Intent(in) :: x

  Integer :: i1
  Real(dp) :: r

  If (x.Eq.0._dp) Then
   F4 = 0.5_dp
  Else If (x.Eq.1._dp) Then
   F4 = 1._dp / 6._dp
  Else If (Abs(1._dp - x).Lt.1.e-2_dp) Then
   F4 = 1._dp / 6._dp
   r = x - 1._dp
   Do i1=1,10
    F4 = F4 +  (-r)**i1 / (6._dp + 5._dp * i1 + i1**2)
   End Do 
  Else
   F4 = 0.5_dp * (1+x) / (1-x)**2 + x * Log(x) /(1-x)**3
  End If

 End Function F4


!\section{Function FeynFunctionA}
!\begin{verbatim}
 Real(dp) Function FeynFunctionA(r)
 !----------------------------------------------------------------------
 ! calculation of the Function A(r) ... 0-order in the mass
 ! input:
 !   x ............ m_fermion**2 / m_boson**2
 ! written by Werner Porod, 31.1.01
 !----------------------------------------------------------------------
  Implicit None
   Real(dp), Intent(in) :: r

   Real(dp) :: x, x2
   Integer :: i

   If (r.Eq.1._dp) Then
    FeynFunctionA = - 1._dp / 3._dp
  
   Else

    x = r - 1._dp 
    x2 = x * x
    If (x2 .Lt. 1.e-3_dp) Then
     FeynFunctionA = sa(1)
     Do i=1,6
      FeynFunctionA = FeynFunctionA + sa(i+1)*x**i
     End Do
    Else
     FeynFunctionA = ( 1._dp - 0.5_dp * x - Log(r) / x ) / x2
    End If

   End If

 End Function FeynFunctionA
!\end{verbatim}

!\section{Function FeynFunctionB}
!\begin{verbatim}
 Real(dp) Function FeynFunctionB(r)
 !----------------------------------------------------------------------
 ! calculation of the Function B(r) ... 0-order in the mass
 ! input:
 !   x ............ m_fermion**2 / m_boson**2
 ! written by Werner Porod, 31.01.01
 !----------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: r

  Real(dp) :: x, x2
  Integer :: i

  If (r.Eq.1._dp) Then
   FeynFunctionB = 1._dp / 6._dp

  Else
   x = r - 1._dp
   x2 = x * x
   If (x2 .Lt. 1.e-3_dp) Then
    FeynFunctionB  = sb(1)
    Do i=1,6
      FeynFunctionB  = FeynFunctionB  + sb(i+1)*x**i
    End Do
   Else
    FeynFunctionB = ( 1._dp + 0.5_dp * x - r * Log(r) / x ) / x2
   End If

  End If

 End Function FeynFunctionB
!\end{verbatim}

 Real(dp) Function FeynFunctionC(r)
 Implicit None
  Real(dp), Intent(in) :: r

  If (r.Eq.1._dp) Then
   FeynFunctionC = - 19._dp / 18._dp
  Else
   FeynFunctionC = 3._dp * FeynFunctionA(r) - FeynFunctionB(r) / 3._dp
  End If
 End Function FeynFunctionC

!\section{Function FeynFunctionD}
!\begin{verbatim}
 Real(dp) Function FeynFunctionD(r)
 !----------------------------------------------------------------------
 ! calculation of the Function D(r) ... 1-order in the mass
 ! input:
 !   x ............ m_fermion**2 / m_boson**2
 ! written by Werner Porod, 31.01.01
 !---------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: r

  Real(dp) :: x, x2
  Integer :: i

  If (r.Eq.1._dp) Then
   FeynFunctionD = - 0.05_dp
  
  Else
   x = r - 1._dp
   x2 = x*x
   If (x2 .Lt. 1.0d-3) Then
    FeynFunctionD = sd(1)
    Do i=1,6
     FeynFunctionD = FeynFunctionD + sd(i+1)*x**i
    End Do
   Else
    FeynFunctionD = ( 4._dp + x - x2/6._dp - (4._dp + 3._dp*x)*Log(r)/x ) &
                  & / (x2*x2)
   End If
  End If

 End Function FeynFunctionD
!\end{verbatim}

!\section{Function FeynFunctionB}
!\begin{verbatim}
 Real(dp) Function FeynFunctionE(r)
 !--------------------------------------------------------------------- 
 ! calculation of the Function E(r) ... 0-order in the mass
 ! input:
 !   x ............ m_fermion**2 / m_boson**2
 ! written by Werner Porod, 31.01.01
 !----------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: r

  Real(dp) :: x, x2
  Integer :: i

  If (r.Eq.1._dp) Then
   FeynFunctionE = 1._dp / 30._dp
  
  Else
   x = r - 1._dp 
   x2 = x*x
   If (x2 .Lt. 1.e-3_dp) Then
    FeynFunctionE = se(1)
    Do i=1,6
     FeynFunctionE = FeynFunctionE + se(i+1)*x**i
    End Do
   Else
    FeynFunctionE = ( 4._dp * r + x2 / 3._dp   &
                  & - 2._dp * r * (1._dp + r) * Log(r) / x ) / (x2*x2)
   End If
  End If

 End Function FeynFunctionE

 
  Real(dp) Function S0(x)
  Implicit None
   Real(dp), Intent(in) :: x

   S0 = 1._dp - 2.75_dp * x + 0.25_dp * x**2 &
    & - 1.5_dp * x**2 * Log(x) / (1-x)
   S0 = x *  S0 / (1 -x)**2

  End  Function S0