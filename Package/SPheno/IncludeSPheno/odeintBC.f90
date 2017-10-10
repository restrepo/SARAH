Subroutine odeintB2(ystart, len, x1, x2, eps, h1, hmin, derivs,checks, xout, kont)
 Implicit None
  External derivs, checks

  Integer, Intent(in) :: len
  Real(dp), Dimension(len), Intent(INOUT) :: ystart
  Real(dp), Intent(out) :: xout
  Real(dp), Intent(IN) :: x1, x2, eps, h1, hmin
  Integer, Intent(inout) :: kont

  Real(dp), Parameter :: TINY=Epsilon(1._dp)
  Integer :: nstp
  Real(dp) :: h,hdid,hnext,x,x_old, h_old
  Real(dp), Dimension(len) :: dydx, y, yscal, y_old

  Logical :: unified, greater

  Iname = Iname + 1
  NameOfUnit(Iname) = "odeintB"

  x=x1
  h=Sign(h1,x2-x1)
  nok=0
  nbad=0
  kount=0

  y(:)=ystart(:)
  kont = 0

  xout = 0._dp

  ! initialisation
  h_old = h
  x_old = x
  y_old = y

  Do nstp=1,MAXSTP

   Call derivs(len,x,y,dydx)

   yscal(:)=Abs(y(:))+Abs(h*dydx(:))+TINY

   If ((x+h-x2)*(x+h-x1) > 0.0_dp) h=x2-x

   If (Use_bsstep_instead_of_rkqs) then
    Call bsstep(y,dydx,x,h,eps,yscal,hdid,hnext,derivs,kont)
   Else
    Call rkqs(y,dydx,x,h,eps,yscal,hdid,hnext,derivs,kont)
   End If

   If (kont.Ne.0) Then
    Iname = Iname - 1
    Return
   End If

   Call checks(y,eps,unified, greater)

   !If (((y(1)-y(2)).Gt.0._dp).And.((y(1)-y(2)).Lt.eps)) Then
   If (unified) Then
    ystart(:)=y(:)
    xout = x
    Iname = Iname - 1
    Return
   !Else If (y(1).Gt.y(2)) Then 
   Else If (greater) Then
    y = y_old
    x = x_old
    hnext = 0.5_dp * h_old
   End If

   y_old = y
   x_old = x
   h_old = hnext

   If (hdid == h) Then
    nok=nok+1
   Else
    nbad=nbad+1
   End If

   If ((x-x2)*(x2-x1) >= 0.0_dp) Then
    Write(ErrCan,*) "Problem in OdeIntB, boundary condition not fullfilled"
    kont = -4
    Call AddError(4)
    ystart(:)=y(:)
    Iname = Iname - 1
    Return
   End If

   If (Abs(hnext) < hmin) Then
    kont = -5
    Call AddError(5)
    Write(ErrCan,*) "Problem in OdeIntB, stepsize smaller than minimum."
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Iname = Iname - 1
    Return
   End If

   If (Maxval(Abs(y)).Gt.1.e36_dp) Then
    kont = -6
    Call AddError(6)
    Write(ErrCan,*) "Problem in OdeIntB, max val > 10^36.",Maxval(Abs(y))
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Iname = Iname - 1
    Return
   End If
   h=hnext
  End Do

  kont = -7
  Write(ErrCan,*) "Problem in OdeIntB, too many steps."
  If (ErrorLevel.Ge.1) Call TerminateProgram
  Call AddError(7)
  Iname = Iname - 1

 End Subroutine odeintB2

 Subroutine odeintC2(ystart, len, x1, x2, eps, h1, hmin, derivs,checks, xout, kont)
 Implicit None
  External derivs, checks

  Integer, Intent(in) :: len
  Real(dp), Dimension(len), Intent(INOUT) :: ystart
  Real(dp), Intent(out) :: xout
  Real(dp), Intent(IN) :: x1, x2, eps, h1, hmin
  Integer, Intent(inout) :: kont

  Real(dp), Parameter :: TINY=Epsilon(1._dp)
  Integer :: nstp
  Real(dp) :: h,hdid,hnext,x,x_old, h_old
  Real(dp), Dimension(len) :: dydx, y, yscal, y_old

  Logical :: unified, greater

  Iname = Iname + 1
  NameOfUnit(Iname) = "odeintC"

  x=x1
  h=Sign(h1,x2-x1)
  nok=0
  nbad=0
  kount=0

  y(:)=ystart(:)
  kont = 0

  xout = 0._dp

  ! initialisation
  h_old = h
  x_old = x
  y_old = y

  Do nstp=1,MAXSTP

   Call derivs(len,x,y,dydx)

   yscal(:)=Abs(y(:))+Abs(h*dydx(:))+TINY

   If ((x+h-x2)*(x+h-x1) > 0.0_dp) h=x2-x

   If (Use_bsstep_instead_of_rkqs) then
    Call bsstep(y,dydx,x,h,eps,yscal,hdid,hnext,derivs,kont)
   Else
    Call rkqs(y,dydx,x,h,eps,yscal,hdid,hnext,derivs,kont)
   End If

   If (kont.Ne.0) Then
    Iname = Iname - 1
    Return
   End If


   Call checks(y,eps,unified, greater)

   !If (((y(1)-y(2)).Gt.0._dp).And.(Abs(y(1)-y(2)).Lt.eps)) Then
   If (unified) Then
    ystart(:)=y(:)
    xout = x
    Iname = Iname - 1
    Return
   !Else If (y(1).Lt.y(2)) Then
   Else If (greater) Then
    y = y_old
    x = x_old
    hnext = 0.5_dp * h_old
   End If

   y_old = y
   x_old = x
   h_old = hnext

   If (hdid == h) Then
    nok=nok+1
   Else
    nbad=nbad+1
   End If

   If ((x-x2)*(x2-x1) >= 0.0_dp) Then
    Write(ErrCan,*) "Problem in OdeIntC, boundary condition not fullfilled"
    kont = -8
    Call AddError(8)
    Iname = Iname - 1
    ystart(:)=y(:)
    Return
   End If

   If (Abs(hnext) < hmin) Then
    kont = -9
    Call AddError(9)
    Iname = Iname - 1
    Write(ErrCan,*) "Problem in OdeIntC, stepsize smaller than minimum."
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Return
   End If

   If (Maxval(Abs(y)).Gt.1.e36_dp) Then
    kont = -10
    Call AddError(10)
    Iname = Iname - 1
    Write(ErrCan,*) "Problem in OdeIntC, max val > 10^36.",Maxval(Abs(y))
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Return
   End If
   h=hnext
  End Do

  kont = -11
  Write(ErrCan,*) "Problem in OdeIntC, too many steps."
  If (ErrorLevel.Ge.1) Call TerminateProgram
  Call AddError(11)
  Iname = Iname - 1

 End Subroutine odeintC2
