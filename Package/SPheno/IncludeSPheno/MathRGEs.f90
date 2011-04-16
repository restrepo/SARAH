Module Mathematics

! Use Control

! interfaces
 Interface Adjungate
  Module Procedure Adjungate1, Adjungate2
 End Interface

 Interface Chop
  Module Procedure Chop_CN, Chop_CV, Chop_CM
 End Interface

 Interface CompareMatrices
  Module Procedure CompareMatricesC, CompareMatricesI, CompareMatricesR 
 End Interface

 Interface Diag2
  Module Procedure Diag2_C
 End Interface

 Interface EigenSystem
  Module Procedure ComplexEigenSystem, RealEigenSystem
 End Interface

 Interface LuBkSb
  Module Procedure LuBkSb_r, LuBkSb_c
 End Interface

 Interface LuDcmp
  Module Procedure LuDcmp_r, LuDcmp_c
 End Interface 

 Interface MatMul2
  Module Procedure MatMul2R3, MatMul2C3, MatVec2R3, MatVec2C3, VecVec2R3, VecVec2C3, &
	VecMat2R3, VecMat2C3, VecRMatC2, VecCMatR2, MatCVecR23
 End Interface

 Interface MatMul3
  Module Procedure MatMul3R3, MatMul3C3
 End Interface

 Interface MatMul4
  Module Procedure MatMul4R3, MatMul4C3
 End Interface

 Interface outerprod
  Module Procedure outerprod_r,outerprod_d,outerprod_c
 End Interface

 Interface pythag
  Module Procedure pythag_sp, pythag_dp
 End Interface

 Interface SolveLinearEquations
  Module Procedure SolveLinearEquations_r, SolveLinearEquations_c
 End Interface

 Interface Trace
  Module Procedure cTrace, dTrace
 End Interface

 Interface UnitMatrix
  Module Procedure UnitMatrix_R, UnitMatrix_C
 End Interface
! interfaces

! global variables
 Integer :: nok,nbad,kount
 Logical, Save :: save_steps=.False.
! global variables

! private variables
 ! test of quality, used in ComplexEigensystem , RealEigensystem
 Real(Dp), Parameter, Private :: MinimalPrecision = 1000._dp * Epsilon(1._dp)
! for ode integration
 Integer, Private, Parameter :: MAXSTP=100000
! Real(dp), Private :: Path(2,MAXSTP)
 Real(dp), Private, Parameter :: A2=0.2_dp,A3=0.3_dp,A4=0.6_dp,A5=1.0_dp,&
    A6=0.875_dp,B21=0.2_dp,B31=3.0_dp/40.0_dp,B32=9.0_dp/40.0_dp,&
    B41=0.3_dp,B42=-0.9_dp,B43=1.2_dp,B51=-11.0_dp/54.0_dp,&
    B52=2.5_dp,B53=-70.0_dp/27.0_dp,B54=35.0_dp/27.0_dp,&
    B61=1631.0_dp/55296.0_dp,B62=175.0_dp/512.0_dp,&
    B63=575.0_dp/13824.0_dp,B64=44275.0_dp/110592.0_dp,&
    B65=253.0_dp/4096.0_dp,C1=37.0_dp/378.0_dp,&
    C3=250.0_dp/621.0_dp,C4=125.0_dp/594.0_dp,&
    C6=512.0_dp/1771.0_dp,DC1=C1-2825.0_dp/27648.0_dp,&
    DC3=C3-18575.0_dp/48384.0_dp,DC4=C4-13525.0_dp/55296.0_dp,&
    DC5=-277.0_dp/14336.0_dp,DC6=C6-0.25_dp
! for choice in ODEint, ODEintB, ODEintC
 Logical, Private, Save :: Use_bsstep_instead_of_rkqs = .False.
! for choice in bsstep
 Logical, Private, Save :: Use_rzextr_instead_of_pzextr = .False.
! private variables

Contains


 Subroutine Adjungate1(M)
 Implicit None
  Complex(Dp), Intent(inout) :: M(:,:)

  M = Conjg( Transpose(M) )
 End Subroutine Adjungate1


 Subroutine Adjungate2(M1,M2)
 Implicit None
  Complex(Dp), Intent(in) :: M1(:,:)
  Complex(Dp), Intent(out) :: M2(:,:)

  M2 = Conjg( Transpose(M1) )

 End Subroutine Adjungate2


 Real(Dp) Function Arg(z)
 Implicit None

 Complex(Dp), Intent(in) :: z
 Real(Dp) :: x,y

  If (Abs(z).Eq.0.0_dp) Then
   Arg = 0._dp
  Else
   x = Real(z,dp)
   y = Aimag(z)

   Arg = Atan2(y,x)
  Endif

 End Function Arg


 Subroutine bsstep(y, dydx,x,htry,eps,yscal,hdid,hnext,derivs, kont)
! Use nrtype; Use nrutil, Only : arth,assert_eq,cumsum,iminloc,nrerror,&
!  outerdiff,outerprod,upper_triangle
! Use nr, Only : mmid,pzextr
 Implicit None
  External derivs

  Integer, Intent(inout) :: kont
  Real(dp), Dimension(:), Intent(INOUT) :: y
  Real(dp), Dimension(:), Intent(IN) :: dydx,yscal
  Real(dp), Intent(INOUT) :: x
  Real(dp), Intent(IN) :: htry,eps
  Real(dp), Intent(OUT) :: hdid,hnext

  Integer, Parameter :: IMAX=9, KMAXX=IMAX-1
  Real(dp), Parameter :: SAFE1=0.25_dp,SAFE2=0.7_dp,REDMAX=1.0e-5_dp,&
     & REDMIN=0.7_dp,MY_TINY=1.0e-30_dp,SCALMX=0.1_dp
  Integer :: k,km, len1, i1, i2
  Integer, Dimension(IMAX) :: nseq = (/ 2,4,6,8,10,12,14,16,18 /)
  Integer, Save :: kopt,kmax
  Real(dp), Dimension(KMAXX,KMAXX), Save :: alf
  Real(dp), Dimension(KMAXX) :: err
  Real(dp), Dimension(IMAX), Save :: a
  Real(dp), Save :: epsold = -1.0_dp,xnew
  Real(dp) :: eps1,errmax,fact,h,red,scale,wrkmin,xest
  Real(dp), Dimension(Size(y)) :: yerr,ysav,yseq
  Logical :: reduct
  Logical, Save :: first=.True.

  Iname = Iname + 1
  NameOfUnit(Iname) = "bsstep"

  kont = 0
  len1 = Size(y) 
  If ((len1.Ne.Size(dydx)).Or.(len1.Ne.Size(yscal))) Then
   Write(ErrCan,*) "Problem in routine bsstep, size of vectors"
   Write(ErrCan,*) "does not conincide:",len1,Size(dydx),Size(yscal)
   Call TerminateProgram
  End If

  If (eps /= epsold) Then ! a new tolerance, so reinitialize
   hnext = -1.0e29_dp     ! 'impossible' values
   xnew = -1.0e29_dp
   eps1 = SAFE1*eps
   
   a(1) = nseq(1) + 1     ! working coefficients A_k
   Do i1=1,kmaxx
    a(i1+1) = a(i1) + nseq(i1+1)
   End Do

   Do i1=2,kmaxx
    Do i2=1,i1-1
     alf(i2,i1) = eps1**( (a(i2+1)-a(i1+1))                &
              &         / ((a(i1+1)-a(1)+1._dp)*(2*i2+1))  )
    End Do
   End Do

   epsold=eps
   ! determine optimal row number for convergence
   Do kopt=2,KMAXX-1
    If (a(kopt+1) > a(kopt)*alf(kopt-1,kopt)) Exit
   End Do
   kmax = kopt

  Else
   hnext = htry
   xnew = x
  End If

  h = htry
  ! save the starting values
  ysav = y
  ! a new stepsize or a new integratio
  ! re-establish the order window

  If (h /= hnext .Or. x /= xnew) Then
   first=.True.
   kopt=kmax
  End If

  reduct=.False.
  main_loop: Do
   Do k=1,kmax  ! evaluate the squence of modified midpoint integrations
    xnew=x+h

    If (xnew == x) Then
     kont = -27
     Call AddError(27)
     Write(ErrCan,*) "Problem in bsstep, stepsize underflow"
     If (ErrorLevel.Ge.1) Call TerminateProgram
     Iname = Iname - 1
     Return
    End If

    Call mmid(ysav,dydx,x,h,nseq(k),yseq,derivs)
    xest=(h/nseq(k))**2  ! squared since error series is even

    If (Use_rzextr_instead_of_pzextr) then  ! switch between polynomial
     Call rzextr(k,xest,yseq,y,yerr, kont)  ! and rational function extrapolation
    else                                    ! default is pzextr
     Call pzextr(k,xest,yseq,y,yerr, kont)
    End If

    If (kont.ne.0) then
     Iname = Iname - 1
     Return
    End If
    
    If (k /= 1) Then
     errmax=Maxval(Abs(yerr / yscal ))
     errmax=Max(my_tiny,errmax)/eps
     km=k-1
     err(km)=(errmax/SAFE1)**(1.0_dp/(2*km+1))
    End If

    If (k /= 1 .And. (k >= kopt-1 .Or. first)) Then  ! in order window
     If (errmax < 1.0) Exit main_loop          ! converged
     If (k == kmax .Or. k == kopt+1) Then      ! check for possible stepsize reduction    
      red=SAFE2/err(km)
      Exit
     Else If (k == kopt) Then
      If (alf(kopt-1,kopt) < err(km)) Then
       red=1.0_dp/err(km)
       Exit
      End If
     Else If (kopt == kmax) Then
      If (alf(km,kmax-1) < err(km)) Then
       red=alf(km,kmax-1)*SAFE2/err(km)
       Exit
      End If
     Else If (alf(km,kopt) < err(km)) Then
      red=alf(km,kopt-1)/err(km)
      Exit
     End If
    End If
   End Do ! k

   red=Max(Min(red,REDMIN),REDMAX)
   h=h*red
   reduct=.True.
  End Do main_loop

  x=xnew
  hdid=h
  first=.False.

  kopt=1+iminloc(a(2:km+1)*Max(err(1:km),SCALMX))
  scale=Max(err(kopt-1),SCALMX)
  wrkmin=scale*a(kopt)
  hnext=h/scale

  If (kopt >= k .And. kopt /= kmax .And. .Not. reduct) Then
   fact=Max(scale/alf(kopt-1,kopt),SCALMX)
   If (a(kopt+1)*fact <= wrkmin) Then
    hnext=h/fact
    kopt=kopt+1
   End If
  End If

  Iname = Iname - 1

 End Subroutine bsstep


 Subroutine CheckHermitian(mat, name, acc)
 !--------------------------------------------------------------------------
 ! checks if the matrix mat is hermitian within a given accuracy (optional)
 ! written by Werner Porod, 11.07.2003
 !--------------------------------------------------------------------------
 Implicit None
  !-------
  ! input
  !-------
  Complex(dp), Intent(in) :: mat(:,:)   ! matrix to be checked
  Character(len=*), Intent(in) :: name  ! name of matrix for output
  Real(dp), Optional :: acc             ! given accuracy

  Real(dp) :: comp, max_val
  Integer :: i1, i2, len
  Complex(dp) :: wert

  len = Size(mat, dim=1)

  If (Present(acc)) Then
   comp = acc
  Else
   comp = 100._dp * Epsilon(1._dp)
  End If

  max_val = Maxval(Abs(mat))

  Do i1=1,len-1
   Do i2=i1+1,len
    wert = mat(i1,i2) - Conjg(mat(i2,i1))
    If (Abs(mat(i1,i2)).Ne.0._dp) wert = wert / max_val
    If (Abs(wert).Gt.comp) Then
     Write(ErrCan,*) name//" i1,i2,mat(i1,i2)"
     Write(ErrCan,*) i1,i2,mat(i1,i2),mat(i2,i1)
     Write(ErrCan,*) " "
    End If
   End Do
  End Do

 End Subroutine CheckHermitian


 Complex(DP) Function CLI2(Z)
 !--------------------------------------------------------------
 !     routine for the complex dilogarithm function
 !--------------------------------------------------------------
 Implicit None      
  !-------
  ! input
  !-------
  Complex(DP), Intent(in) :: Z

  !-----------------
  ! local variables
  !-----------------
  Complex(DP) :: sumC, cy, cz, cz2
  Real(dp) :: rz, iz, az
  Integer :: i1, jsgn, ipi12
  !---------------------------------------------
  ! Bernulli numbers / (2 n + 1)!
  !---------------------------------------------
  Real(dp), Parameter :: bf(20) = (/ - 1._dp/4._dp, + 1._dp/36._dp        &
       & , - 1._dp/36.e2_dp, + 1._dp/21168.e1_dp,  - 1._dp/108864.e2_dp   &
       & , + 1._dp/52690176.e1_dp,  - 691._dp/16999766784.e3_dp           &
       & , + 1._dp/1120863744.e3_dp,  - 3617._dp/18140058832896.e4_dp     &
       & , + 43867._dp/97072790126247936.e3_dp                            &
       & , - 174611._dp/168600109166641152.e5_dp                          &
       & , + 77683._dp/32432530090601152512.e4_dp                         &
       & , - 236364091._dp/4234560341829359173632.e7_dp                   &
       & , + 657931._dp/5025632054039239458816.e6_dp                      &
       & , - 3392780147._dp/109890470493622010006470656.e7_dp             &
       & , +172.3168255201_dp/2355349904102724211909.3102313472e6_dp      &
       & , -770.9321041217_dp/4428491985594062112714.2791446528e8_dp      &
       & ,  4.1576356446138997196178996207752266734882541595116e-29_dp    &
       & , -9.9621484882846221031940067024558388498548600173945e-31_dp    &
       & ,  2.3940344248961653005211679878937495629342791569329e-32_dp    &
       & /)

  rz = Real(z,dp)
  iz = Aimag(z)
  az = Sqrt(rz**2 + iz**2)
  !------------------
  ! special cases
  !------------------
  If (iz.Eq.0._dp) Then
   CLi2 = Cmplx( Li2(rz), 0._dp,dp)
   Return
  Else If (az.Lt.Epsilon(1._dp)) Then
   CLi2 = z
   Return
  End If
  !-----------------------------------------------------
  ! transformation to |z|<1, Re(z)<=0.5
  !-----------------------------------------------------
  If (rz.Le.0.5_dp) Then
   If (az.Gt.1._dp) Then
    cy = -0.5_dp * Log(-z)**2
    cz = - Log(1._dp - 1._dp / z)
    jsgn = -1
    ipi12 = -2
   Else !  (az.le.1._dp)
    cy = 0
    cz = - Log(1._dp - z)
    jsgn = 1
    ipi12 = 0
   End If
  Else ! rz.gt.0.5_dp
   If (az.Le.Sqrt(2*rz)) Then
    cz = - Log(z)
    cy = cz * Log(1._dp - z)
    jsgn = -1
    ipi12 = 2
   Else ! (az.gt.Sqrt(2*rz))
    cy = -0.5_dp * Log(-z)**2
    cz = - Log(1._dp - 1._dp / z)
    jsgn = -1
    ipi12 = -2
   End If
  End If
  !--------------------------------------------
  ! the dilogarithm
  !--------------------------------------------
  cz2 = cz**2
  sumC = cz2 * bf(20)
  Do i1=3,19
   sumC = cz2 * ( sumC + bf(22-i1) )
  End Do
  ! watch the powers of z
  sumC = cz + cz2 * (bf(1) + cz * (bf(2) + sumC))
  If (jsgn.Eq.1) Then
   CLi2 = sumC + cy
  Else
   CLi2 = - sumC + cy
  End If
  If (ipi12.Ne.0) Cli2 = Cli2 + ipi12 * pi2o12

 End Function CLI2


 Subroutine Chop_CN(z)
 !---------------------------------------------------------------------
 ! sets real and/or imaginary part to zero if numerical insignificant
 !---------------------------------------------------------------------
 implicit none
  Complex(dp), Intent(inout) :: z

  Real(dp) :: re, im
  Real(dp), Parameter :: eps = 100._dp * Epsilon(1._dp)

  re = Real(z ,dp)
  im = Aimag( z )
  If (Abs(re).Lt.eps*Abs(im)) re = 0._dp
  If (Abs(im).Lt.eps*abs(re)) im = 0._dp
  z  = Cmplx(re, im, dp)

 End Subroutine Chop_CN

 Subroutine Chop_CV(vec)
 !---------------------------------------------------------------------
 ! sets real and/or imaginary part to zero if numerical insignificant
 !---------------------------------------------------------------------
 Implicit None
  Complex(dp), Intent(inout) :: vec(:)
  
  Integer :: len, i1
  Real(dp) :: re, im, max1
  Real(dp), Parameter :: eps = 100._dp * Epsilon(1._dp)
  
  max1 = eps * Maxval( Abs(vec) )

  len = Size(vec)
  Do i1=1,len
    re = Real(vec(i1),dp)
    im = Aimag( vec(i1) )
    If (Abs(re).Lt.max1) re = 0._dp
    If (Abs(im).Lt.max1) im = 0._dp
    vec(i1) = Cmplx(re, im, dp)
  End Do

 End Subroutine  Chop_CV


 Subroutine Chop_CM(mat)
 !---------------------------------------------------------------------
 ! sets real and/or imaginary part to zero if numerical insignificant
 !---------------------------------------------------------------------
 Implicit None
  Complex(dp), Intent(inout) :: mat(:,:)
  
  Integer :: len, i1 ,i2
  Real(dp) :: re, im, max1
  Real(dp), Parameter :: eps = 100._dp * Epsilon(1._dp)
  
  max1 = eps * Maxval( Abs(mat) )

  len = Size(mat,dim=1)
  Do i1=1,len
   Do i2=1,len
     re = Real(mat(i1,i2),dp)
     im = Aimag( mat(i1,i2) )
     If (Abs(re).Lt.max1) re = 0._dp
     If (Abs(im).Lt.max1) im = 0._dp
     mat(i1,i2) = Cmplx(re, im, dp)
   End Do
  End Do

 End Subroutine  Chop_CM


 Logical Function CompareMatricesC(A, B, diff)
 !-----------------------------------------------------------------------
 ! This function checks if the elements of the complex matrices A and B are
 ! equal within a given precision. In case that the matrices have different
 ! size .FALSE. is returned
 ! written by Werner Porod, 12.04.2001
 !-----------------------------------------------------------------------
 Implicit None
  !-------
  ! input
  !-------
  Complex(dp), Intent(in) :: A(:,:), B(:,:)
  Real(dp), Intent(in) :: diff

  !-----------------
  ! local variables
  !-----------------
  Integer :: N1, N2, N3, N4, i1, i2
  Real(dp) :: diff1

  N1 = Size(A, dim=1)
  N2 = Size(A, dim=2)
  N3 = Size(B, dim=1)
  N4 = Size(B, dim=2)

  If ( (N1.Ne.N3) .Or. (N2.Ne.N4) ) Then
   CompareMatricesC = .False.
   Return
  End If

  CompareMatricesC = .True.

  diff1 = Abs( diff )  ! to be sure 

  Do i1 = 1, N1
   Do i2 = 1, N2
    If (Abs( A(i1,i2) - B(i1,i2) ) .Gt. diff1) Then
     CompareMatricesC = .False.
     Return
    End If
   End Do
  End Do

 End Function CompareMatricesC

 Logical Function CompareMatricesI(A,B)
 !-----------------------------------------------------------------------
 ! This function checks if the elements of the integer matrices A and B are
 ! equal. In case that the matrices have different size .FALSE. is returned.
 ! written by Werner Porod, 12.04.2001
 !-----------------------------------------------------------------------
 Implicit None
  !-------
  ! input
  !-------
  Integer, Intent(in) :: A(:,:), B(:,:)

  !-----------------
  ! local variables
  !-----------------
  Integer :: N1, N2, N3, N4, i1, i2

  N1 = Size(A, dim=1)
  N2 = Size(A, dim=2)
  N3 = Size(B, dim=1)
  N4 = Size(B, dim=2)

  If ( (N1.Ne.N3) .Or. (N2.Ne.N4) ) Then
   CompareMatricesI = .False.
   Return
  End If

  CompareMatricesI = .True.

  Do i1 = 1, N1
   Do i2 = 1, N2
    If ( A(i1,i2) .Ne. B(i1,i2) ) Then
     CompareMatricesI = .False.
     Return
    End If
   End Do
  End Do

 End Function CompareMatricesI

 Logical Function CompareMatricesR(A,B,diff)
 !-----------------------------------------------------------------------
 ! This function checks if the elements of the real matrices A and B are
 ! equal within a given precision. In case that the matrices have different
 ! size .FALSE. is returned
 ! written by Werner Porod, 12.04.2001
 !-----------------------------------------------------------------------
 Implicit None
  !-------
  ! input
  !-------
  Real(dp), Intent(in) :: A(:,:), B(:,:)
  Real(dp), Intent(in) :: diff

  !-----------------
  ! local variables
  !-----------------
  Integer :: N1, N2, N3, N4, i1, i2
  Real(dp) :: diff1

  N1 = Size(A, dim=1)
  N2 = Size(A, dim=2)
  N3 = Size(B, dim=1)
  N4 = Size(B, dim=2)

  If ( (N1.Ne.N3) .Or. (N2.Ne.N4) ) Then
   CompareMatricesR = .False.
   Return
  End If

  CompareMatricesR = .True.

  diff1 = Abs( diff )  ! to be sure 

  Do i1 = 1, N1
   Do i2 = 1, N2
    If (Abs( A(i1,i2) - B(i1,i2) ) .Gt. diff1) Then
     CompareMatricesR = .False.
     Return
    End If
   End Do
  End Do

 End Function CompareMatricesR

 Subroutine ComplexEigenSystem(Matrix, EigenValues, EigenVectors, kont, test)
 !---------------------------------------------------------------------
 ! Subroutine for diagonalization of complex hermitian matrices, based on the
 ! Householder algorithm. Is a portation of  EISCH1 to F90
 ! Input:
 !  Matrix ..... n times n matrix
 ! Output
 !  EigenValues ..... n sorted EigenValues: |m_1| < |m_2| < .. < |m_n|
 !  EigenVectors .... n times n matrix with the eigenvectors
 ! written by Werner Porod, 10.11.2000
 ! 08.03.02: changing the algorithm accoring to 
 !               "Numerical Recipies in Fortran" by W.H.Press et al.
 !           page 475
 !---------------------------------------------------------------------
 Implicit None
  !-------
  ! input
  !-------
  Complex(Dp), Intent(in) :: Matrix(:,:)
  !--------
  ! output
  !--------
  Complex(Dp), Intent(out) :: EigenVectors(:,:)
  Real(Dp), Intent(out) :: EigenValues(:), test(:)
  Integer, Intent(inout) :: kont

  !-----------------
  ! local variables
  !-----------------
  Integer :: N1,N2,N3 !,i1 , i2
  Real(Dp), Allocatable :: AR(:,:),AI(:,:), WR(:), ZR(:,:),  WORK(:)  &
    & , work2(:,:), ZI(:,:)
  Complex(dp), Allocatable :: Ctest(:,:)
  Logical :: l_complex = .False.

  Iname = Iname + 1
  NameOfUnit(Iname) = 'ComplexEigenSystem'

  N1 = Size(Matrix, Dim=1)
  N2 = Size(EigenValues)
  N3 = Size(EigenVectors, Dim=1)
  If ((N1.Ne.N2).Or.(N1.Ne.N3)) Then
   Write (ErrCan,*) 'Error in Subroutine '//NameOfUnit(Iname)
   Write (ErrCan,*) 'Dimensions to not match: ',N1,N2,N3
   If (ErrorLevel.Ge.-1) Call TerminateProgram
   kont = -13
   Call AddError(13)
   Iname = Iname - 1
   Return
  End If

  Allocate(AR(N1,N1)) 
  Allocate(AI(N1,N1))
  Allocate(Ctest(N1,N1))

  AR = Real( Matrix,dp )
  AI = Aimag( Matrix )

  !--------------------------------------------------------------------------
  ! check first whether the matrix is really complex
  ! if not, I use the only real diagonalization because it is more accurate
  !--------------------------------------------------------------------------
  If (Maxval( Abs(AI) ).Eq.0._dp) Then ! real matrix

   Allocate(WR(N1))
   Allocate(Work(N1))

   Call Tred2A(AR, WR, Work)
   Call TQLi(KONT,WR,WORK,AR)

   Do n2=1,n1-1
    Do n3=n2+1,n1
     If (wr(n2).Gt.wr(n3)) Then
      work(1) = wr(n2) 
      wr(n2) = wr(n3)
      wr(n3) = work(1)
      work = ar(:,n2)
      ar(:,n2) = ar(:,n3)
      ar(:,n3) = work
     End If
    End Do
   End Do

   EigenValues = WR
   Ctest = Ar
   EigenVectors = Transpose(AR) 

  Else ! complex matrix
   l_complex = .True.

   Allocate(ZR(N1,N1))
   Allocate(ZI(N1,N1))
   Allocate(WR(N1))
   Allocate(Work(N1))
   Allocate(Work2(2,N1))

   Call HTRIDI(AR, AI, WR, Work, WORK2)
   ZR = 0._dp
   Do n2=1,n1
    ZR(n2,n2) = 1._dp
   End Do
   Call TQLi(KONT,WR,WORK,ZR)
   If(KONT/=0) Then
    Iname = Iname - 1
    Deallocate(AR,AI,WR,Work,Ctest)
    Deallocate(ZR, zi, work2)
    Return
   End If
   Call HTRIBK(AR, AI, WORK2, ZR, ZI)
   

   Do n2=1,n1-1
    Do n3=n2+1,n1
     If (wr(n2).Gt.wr(n3)) Then
      work(1) = wr(n2) 
      wr(n2) = wr(n3)
      wr(n3) = work(1)
      work = zr(:,n2)
      zr(:,n2) = zr(:,n3)
      zr(:,n3) = work
      work = zi(:,n2)
      zi(:,n2) = zi(:,n3)
      zi(:,n3) = work
     End If
    End Do
   End Do

   eigenvalues = wr
   eigenvectors = Cmplx(zr,zi, dp)

   Ctest = Eigenvectors
   Call Adjungate(Eigenvectors)

   Deallocate(ZR, zi, work2)

  End If ! decision whether real or complex matrix

  !----------------------------------
  ! test of diagonalisation
  !----------------------------------
  Ctest = Matmul(Eigenvectors, Matmul(Matrix, Ctest) )
  test = 0._dp
  Do n2=1,n1
   Do n3=1,n1
    If (n2.Eq.n3) Then
     test(1) = Max(test(1), Abs( Ctest(n2,n3) ) )
    Else
     test(2) = Max(test(2), Abs( Ctest(n2,n3) ) )
    End If
   End Do
  End Do
  If (test(1).Gt.0._dp) Then
   If (l_complex) Then
    If ( (test(2)/test(1)).Gt.1.e5_dp*MinimalPrecision) then
     kont = -14
     Call AddError(14)
    End If
   Else 
    If ( (test(2)/test(1)).Gt.MinimalPrecision) then
     kont = -14
     Call AddError(14)
    End If
   End If
  End If

  Deallocate(AR,AI,WR,Work,Ctest)

  Iname = Iname - 1

 End Subroutine ComplexEigenSystem

 Complex(dp) Function cTrace(A)
 Implicit None

  Complex(dp), Intent(in) :: A(:,:)

  Integer :: n, i1

  cTrace = 0._dp
  n = Size(a, dim=1)
  Do i1=1,n
   cTrace = cTrace + A(i1,i1)
  End Do

 End Function cTrace


 Complex(dp) Function Dedekind(x)
 Implicit None
  Complex(dp), Intent(in) :: x
  Integer :: i1
  Complex(dp) :: sum1

  Dedekind =  Exp( - Pi * x / 12._dp)
  Do i1=1,50
   sum1 = Exp(- 2._dp * Pi * i1 * x)
   Dedekind = Dedekind * (1._dp - sum1)
   If (Abs(sum1).Lt.1.e-10_dp) Exit
  End Do

 End Function Dedekind

 Real(dp) Function delt(x,y,z)
 Implicit None

  Real(dp), Intent(in) :: x, y, z

  If ((x.eq.z).and.(y.eq.z)) then
   delt = -3._dp * Z**2
  Else If (x.eq.y) then
   delt = z * (z - 4._dp * y) 
  Else If (x.eq.z) then
   delt = y * (y - 4._dp * z) 
  Else If (y.eq.z) then
   delt = x * (x - 4._dp * z) 
  Else 
   delt = x**2 + y**2 + z**2 - 2._dp*(x*y + x*z + y*z)
  End If

 End Function delt

 Real(Dp) Function Dgauss(F,A,B,EPS)
 !----------------------------------------------------------------------
 !
 !     ADAPTIVE DOUBLE PRECISION GAUSSIAN QUADRATURE.
 !
 !     DGAUSS IS SET EQUAL TO THE APPROXIMATE VALUE OF THE INTEGRAL OF
 !     THE FUNCTION F OVER THE INTERVAL (A,B), WITH ACCURACY PARAMETER
 !     EPS.
 !
 !    From the CERN-library, 27.7.95
 ! 1.10.2000: porting it to f90
 !----------------------------------------------------------------------
  Implicit None
      
  Interface
   Function f(pt)
   Use Control
   Implicit None
   Real(dp) :: f
   Real(dp), Intent(IN) :: pt
   End Function f
  End Interface

  Integer :: i
  Real(Dp), Intent(in) :: A,B,EPS
  Real(Dp) :: AA,BB,C1,C2,U,S8,S16,CONST
  Real(Dp), Parameter :: &
       & W(12)=(/0.1012285362903762591525313543_dp,       &
       &         0.2223810344533744705443559944_dp,       &
       &         0.3137066458778872873379622020_dp,       &
       &         0.3626837833783619829651504493_dp,       &
       &         0.2715245941175409485178057246e-1_dp,      &
       &         0.6225352393864789286284383699e-1_dp,      &
       &         0.9515851168249278480992510760e-1_dp,      &
       &         0.1246289712555338720524762822_dp,       &
       &         0.1495959888165767320815017305_dp,       &
       &         0.1691565193950025381893120790_dp,       &
       &         0.1826034150449235888667636680_dp,       &
       &         0.1894506104550684962853967232_dp    /), &
       & X(12)=(/0.9602898564975362316835608686_dp,       &
       &         0.7966664774136267395915539365_dp,       &
       &         0.5255324099163289858177390492_dp,       &
       &         0.1834346424956498049394761424_dp,       &
       &         0.9894009349916499325961541735_dp,       &
       &         0.9445750230732325760779884155_dp,       &
       &         0.8656312023878317438804678977_dp,       &
       &         0.7554044083550030338951011948_dp,       &
       &         0.6178762444026477484466717640_dp,       &
       &         0.4580167776572273863424194430_dp,       &
       &         0.2816035507792589132304605015_dp,       &
       &         0.9501250983763744018531933543e-1_dp  /)

  DGAUSS=0._dp

  If(B.Eq.A) Return
      
  CONST=0.005_dp/(B-A)
  BB=A
  !----------------------
  !  COMPUTATIONAL LOOP:
  !----------------------
  Do While (BB.Ne.B)
   AA=BB
   BB=B

   C2=0.5_dp*(BB-AA)
   Do While ( 1._dp+Abs(CONST*C2) .Ne. 1._dp)
    C1=0.5_dp*(BB+AA)
    C2=0.5_dp*(BB-AA)
    S8=0._dp
    Do I=1,4
     U=C2*X(I)
     S8=S8+W(I)*(F(C1+U)+F(C1-U))
    Enddo
    S8=C2*S8
    S16=0._dp
    Do I=5,12
     U=C2*X(I)
     S16=S16+W(I)*(F(C1+U)+F(C1-U))
    Enddo
    S16=C2*S16
    If( Abs(S16-S8) .Le. EPS*(1._dp+Abs(S16)) ) Exit
    BB=C1
    If ( 1._dp+Abs(CONST*C2) .Eq. 1._dp) Then
      DGAUSS=0._dp
      If (ErrorLevel.Ge.0) Then
       Write(ErrCan,*) 'Function DGAUSS ... too high accuracy required'
       Write(ErrCan,*) "Calling routine: ",NameOfUnit(Iname)
       Call AddError(19)
      End If
      Return
    Endif
   End Do ! while ( 1._dp+ABS(CONST*C2) .NE. 1._dp) 
    
  DGAUSS=DGAUSS+S16
 End Do ! while (BB.NE.B)

 End Function Dgauss

 Subroutine DgaussInt(Sub,N,A,B,erg,Eps)
 !----------------------------------------------------------------------
 !     ADAPTIVE DOUBLE PRECISION GAUSSIAN QUADRATURE for N functions
 !     with similar behaviour. Developed from the function dgauss from
 !     the CERN lib.
 !
 !     DGAUSS IS SET EQUAL TO THE APPROXIMATE VALUE OF THE INTEGRAL OF
 !     THE FUNCTION F OVER THE INTERVAL (A,B), WITH ACCURACY PARAMETER
 !     EPS.
 !
 ! Input:
 !  Sub .... Subroutine to be integrated, takes 2 input values and gives
 !           an N-dimensionl vector back
 !  N ...... Dimension of the above vector
 !  A,B .... the integration Intervall (A,B)
 !  Eps .... required precision
 ! OutPut:
 !  Erg .... an N-dimensional vector containing the results
 ! written by Werner Porod: 19.11.2000
 !----------------------------------------------------------------------
  Implicit None
   External Sub
  !-------
  ! input
  !-------
   Integer, Intent(in) :: N
   Real(Dp), Intent(in) :: A,B,Eps
  !--------
  ! output
  !--------
   Real(Dp), Intent(out) :: erg(N)

  !-----------------
  ! local variables
  !-----------------
   Integer :: i
   Real(Dp), Allocatable :: work(:),s8(:),s16(:)
   Real(Dp) :: AA,BB,C1,C2,U(2),CONST
   Logical :: check
   Real(Dp), Parameter :: &
       & W(12)=(/0.1012285362903762591525313543_dp,       &
       &         0.2223810344533744705443559944_dp,       &
       &         0.3137066458778872873379622020_dp,       &
       &         0.3626837833783619829651504493_dp,       &
       &         0.02715245941175409485178057246_dp,      &
       &         0.06225352393864789286284383699_dp,      &
       &         0.09515851168249278480992510760_dp,      &
       &         0.1246289712555338720524762822_dp,       &
       &         0.1495959888165767320815017305_dp,       &
       &         0.1691565193950025381893120790_dp,       &
       &         0.1826034150449235888667636680_dp,       &
       &         0.1894506104550684962853967232_dp    /), &
       & X(12)=(/0.9602898564975362316835608686_dp,       &
       &         0.7966664774136267395915539365_dp,       &
       &         0.5255324099163289858177390492_dp,       &
       &         0.1834346424956498049394761424_dp,       &
       &         0.9894009349916499325961541735_dp,       &
       &         0.9445750230732325760779884155_dp,       &
       &         0.8656312023878317438804678977_dp,       &
       &         0.7554044083550030338951011948_dp,       &
       &         0.6178762444026477484466717640_dp,       &
       &         0.4580167776572273863424194430_dp,       &
       &         0.2816035507792589132304605015_dp,       &
       &         0.09501250983763744018531933543_dp  /)

   erg = 0._dp 

   If(B.Eq.A) Return

   Allocate(work(N))
   Allocate(s8(N))
   Allocate(s16(N))

   CONST=0.005_dp/(B-A)
   BB=A
  !----------------------
  !  COMPUTATIONAL LOOP:
  !----------------------
  Do While (BB.Ne.B)
   AA=BB
   BB=B

   C2=0.5_dp*(BB-AA)
   Do While ( 1._dp+Abs(CONST*C2) .Ne. 1._dp)
    C1=0.5_dp*(BB+AA)
    C2=0.5_dp*(BB-AA)
    S8=0._dp
    Do I=1,4
     U(1)= C1 + C2*X(I)
     U(2)= C1 - C2*X(I)
     Call Sub(U,work)
     S8 = S8 + W(I) * work
    End Do
    S8=C2*S8

    S16=0._dp
    Do I=5,12
     U(1)= C1 + C2*X(I)
     U(2)= C1 - C2*X(I)
     Call Sub(U,work)
     S16 = S16 + W(I) *work
    End Do
    S16=C2*S16

    check = .True.
    Do i=1,N
     If ( Abs(S16(i)-S8(i)) .Gt. EPS*(1._dp+Abs(S16(i))) ) check = .False.
    End Do

    If (check) Exit
    BB=C1
    If ( 1._dp+Abs(CONST*C2) .Eq. 1._dp) Then
      erg = 0._dp
      If (ErrorLevel.Ge.0) Then
       Write(ErrCan,*) 'Subroutine DgaussInt ... TOO HIGH ACCURACY REQUIRED'
       Write(ErrCan,*) "Calling routine: ",NameOfUnit(Iname)
       Call AddError(20)
      End If
      Deallocate(work,s8,s16)
      Return
    Endif
   End Do ! while ( 1._dp+Abs(CONST*C2) .NE. 1._dp) 
    
   erg = erg + S16
  End Do ! while (BB.NE.B)

  Deallocate(work,s8,s16)

 End Subroutine DgaussInt

 Subroutine Diag2_C(mat, eig, rsf)
 Implicit None
  Complex(dp), Intent(in) :: mat(2,2)
  Complex(dp), Intent(out) :: rsf(2,2)
  Real(dp), Intent(out) :: eig(2)

  Real(dp) :: sumI, det, ct, st
  Complex(dp) :: phase

  sumI = Real(mat(1,1) + mat(2,2),dp) 
  det = Sqrt( Abs(mat(1,1) - mat(2,2))**2 + 4._dp * Abs(mat(1,2))**2 )
  eig(1) = 0.5_dp * (sumI - det)
  eig(2) = 0.5_dp * (sumI + det)
  phase = mat(2,1) / Abs( mat(2,1) )

  sumI = Sqrt( Abs(mat(1,2))**2 + Abs( eig(1) - mat(1,1) )**2 )

  If (sumI.Lt.1.e-10_dp) Then
   ct = 1._dp
   st = 0._dp
  Else
   ct  = -  Abs(mat(1,2)) / sumI
   st = Real(mat(1,1) - eig(1),dp ) / sumI
  End If

  Rsf(1,1) = phase * ct
  rsf(1,2) = st
  rsf(2,1) = - st
  rsf(2,2) = Conjg(phase) * ct

 End Subroutine Diag2_C
 
 Real(dp) Function dTrace(A)
 Implicit None

  Real(dp), Intent(in) :: A(:,:)

  Integer :: n, i1

  dTrace = 0._dp
  n = Size(a, dim=1)
  Do i1=1,n
   dTrace = dTrace + A(i1,i1)
  End Do

 End Function dTrace

 Complex(dp) Function Eisenstein(x)
 Implicit None
  Complex(dp), Intent(in) :: x

  Eisenstein = 2._dp * RiemannZeta(x) + 0.5_dp / Real(x, dp)

 End Function Eisenstein

 Real(dp) Function Gamma(X)
 !----------------------------------------------------------------
 ! quadrupole precision version of Gamma Function, only for positiv x
 ! written by Werner Porod, 27.12.2000
 !----------------------------------------------------------------
 Implicit None

  Real(dp), Intent(in) :: x

  Integer :: I
  Real(dp) :: U, F, H, ALFA, B0, B1, B2
  Real(dp), Parameter :: &
     & C(0:27)=(/ 3.65738772508338243849880685203934_dp,   &
     &            1.95754345666126826928337423287684_dp,   &
     &            3.3829711382616038915585107272540e-1_dp,   &
     &            4.208951276557549198510839702790e-2_dp,   &
     &            4.28765048212908770042890811623e-3_dp,   &
     &            3.6521216929461767021982153833e-4_dp,   &
     &            2.740064222642200271706659898e-5_dp,   &
     &            1.81240233365124446030465306e-6_dp,   &
     &            1.0965775865997069930600252e-7_dp,   &
     &            5.98718404552000469498050e-9_dp,   &
     &            3.0769080535247777096971e-10_dp,   &
     &            1.431793029619157636912e-11_dp,   &
     &            6.5108773348037007665e-13_dp,   &
     &            2.595849898222799794e-14_dp,   &
     &            1.10789389225952165e-15_dp,   &
     &            3.547436201635380e-17_dp,   &
     &            1.68860750233519e-18_dp,   &
     &            2.735435756154e-20_dp,   &
     &            3.02977405444e-21_dp,   &
     &           -5.712203032e-23_dp,   &
     &            9.07685853e-24_dp,   &
     &           -5.0452244e-25_dp,   &
     &            4.049646e-26_dp,   &
     &           -2.79184e-27_dp,   &
     &            2.0370e-28_dp,   &
     &           -1.454e-29_dp,   &
     &            1.06e-30_dp,   &
     &           -7.e-32_dp /)

  U=X
  If( U .Le. 0) Then
   Write(ErrCan,*) 'Warning in Function Gamma, argument is negative = ',U
   Write(ErrCan,*) 'setting result to 0'
   Gamma = 0
   Return
  End If

  If ( (U.Eq.1._dp).Or.(u.Eq.2._dp) ) Then
   Gamma = 1._dp
   Return
  End If
  If (U.Eq.3._dp) Then
   Gamma = 2._dp
   Return
  Else If (U.Eq.4._dp) Then
   Gamma = 6._dp
   Return
  Else If (U.Eq.5._dp) Then
   Gamma = 24._dp
   Return
  Else If (U.Eq.6._dp) Then
   Gamma = 120._dp
   Return
  Else If (U.Eq.7._dp) Then
   Gamma = 720._dp
   Return
  End If

  F=1
  If (U .Lt. 3) Then
   Do I = 1,Int(4-U)
    F=F/U
    U=U+1
   End Do
  Else
   Do I = 1,Int(U-3)
    U=U-1
    F=F*U
   End Do
  End If
     
  H=U+U-7
  ALFA=H+H
  B1=0
  B2=0

  Do I = 27,0,-1
   B0=C(I)+ALFA*B1-B2
   B2=B1
   B1=B0
  End Do

  Gamma = F * (B0 - H*B2)

 End Function Gamma

 Subroutine gaussj(kont, a,n,np,b,m)
 Implicit None
 
 Integer :: n,np,NMAX,kont
  Integer, Optional :: m
  Complex(dP) :: a(np,np)
  Complex(dp), Optional :: b(:,:)
  Parameter (NMAX=50)
  Integer :: i,icol,irow,j,k,l,ll,indxc(NMAX),indxr(NMAX),ipiv(NMAX)
  Complex(dp) :: dum, pivinv
  Real(dp) :: big


  ipiv = 0
  kont = 0
  Do i=1,n
    big=0._dp
    Do j=1,n
      If(ipiv(j)/=1)Then
        Do k=1,n
          If (ipiv(k)==0) Then
            If (Abs(a(j,k))>=big)Then
              big=Abs(a(j,k))
              irow=j
              icol=k
            Endif
          Else If (ipiv(k)>1) Then
!            pause 'singular matrix in gaussj'
            kont = -24
            Call AddError(24)
            Return
          Endif
        Enddo
      Endif
    Enddo
    ipiv(icol)=ipiv(icol)+1
    If (irow/=icol) Then
      Do l=1,n
        dum=a(irow,l)
        a(irow,l)=a(icol,l)
        a(icol,l)=dum
      Enddo
     If (Present(b)) Then
      Do l=1,m
        dum=b(irow,l)
        b(irow,l)=b(icol,l)
        b(icol,l)=dum
      Enddo
     End If
    Endif
    indxr(i)=irow
    indxc(i)=icol
    If (a(icol,icol)==0._dp) Then
!        pause 'singular matrix in gaussj'
        kont = -24
        Call AddError(24)
        Return
    End If
    pivinv=1._dp/a(icol,icol)
    a(icol,icol)=1._dp
    Do l=1,n
      a(icol,l)=a(icol,l)*pivinv
    Enddo
If (Present(b)) Then
    Do l=1,m
      b(icol,l)=b(icol,l)*pivinv
    Enddo
End If
    Do ll=1,n
      If(ll/=icol)Then
        dum=a(ll,icol)
        a(ll,icol)=0._dp
        Do l=1,n
          a(ll,l)=a(ll,l)-a(icol,l)*dum
        Enddo
If (Present(b)) Then
        Do l=1,m
          b(ll,l)=b(ll,l)-b(icol,l)*dum
        Enddo
End If
      Endif
    Enddo
  Enddo
  Do l=n,1,-1
    If(indxr(l)/=indxc(l))Then
      Do k=1,n
        dum=a(k,indxr(l))
        a(k,indxr(l))=a(k,indxc(l))
        a(k,indxc(l))=dum
      Enddo
    Endif
  Enddo
  Return
  End Subroutine gaussj
  
  Subroutine HTRIBK(AR, AI, TAU, ZR, ZI)
  Implicit None
   Real(dp) :: AR(:,:), AI(:,:), TAU(:,:), ZR(:,:), ZI(:,:)

   Integer :: mn, n, m, k, j, i, l
   Real(dp) :: s, si, h

   mn = Size(ar,1)
   n = Size(ar,2)
   m = Size(zr,2)

   Do K = 1, N
    Do J = 1, M
      ZI(K,J) = - ZR(K,J) * TAU(2,K)
      ZR(K,J) = ZR(K,J) * TAU(1,K)
    Enddo
   Enddo
   If (N == 1) Return
  Do I = 2, N
    L = I - 1
    H = AI(I,I)
    If (H == 0._dp) Cycle
    Do J = 1, M
      S = 0._dp
      SI = 0._dp
      Do K = 1, L
        S = S + AR(I,K) * ZR(K,J) - AI(I,K) * ZI(K,J)
        SI = SI + AR(I,K) * ZI(K,J) + AI(I,K) * ZR(K,J)
      Enddo
      S = S / H
      SI = SI / H
      Do K = 1, L
        ZR(K,J) = ZR(K,J) - S * AR(I,K) - SI * AI(I,K)
        ZI(K,J) = ZI(K,J) - SI * AR(I,K) + S * AI(I,K)
      Enddo
    Enddo
  End Do

  End Subroutine HTRIBK

  Subroutine HTRIDI(AR, AI, D, E, TAU)
  Implicit None
   Real(dp) :: AR(:,:), AI(:,:), D(:), E(:), TAU(:,:)

   Real(dp) :: E2( Size(E) )

   Integer :: mn, n, i, ii, l, k, j, jp1
   Real(dp) :: scalei, h, g, f, si, hh, fi, gi

   mn = Size(ar,1)
   n = Size(ar,2)

   TAU(1,N) = 1._dp
   TAU(2,N) = 0._dp
   Do I = 1, N
    D(I) = AR(I,I)
   End Do

   Do II = 1, N
    I = N + 1 - II
    L = I - 1
    H = 0._dp
    SCALEI = 0._dp
    If (L < 1) GO TO 130
    Do K = 1, L
      SCALEI = SCALEI + Abs(AR(I,K)) + Abs(AI(I,K))
    Enddo
    If (SCALEI /= 0._dp) GO TO 140
    TAU(1,L) = 1._dp
    TAU(2,L) = 0._dp
  130 E(I) = 0._dp
    E2(I) = 0._dp
    GO TO 290
  140 Do K = 1, L
      AR(I,K) = AR(I,K) / SCALEI
      AI(I,K) = AI(I,K) / SCALEI
      H = H + AR(I,K) * AR(I,K) + AI(I,K) * AI(I,K)
    Enddo
    E2(I) = SCALEI * SCALEI * H
    G = Sqrt(H)
    E(I) = SCALEI * G
    F = Abs(Cmplx(AR(I,L),AI(I,L),dp))
    If (F == 0._dp) GO TO 160
    TAU(1,L) = (AI(I,L) * TAU(2,I) - AR(I,L) * TAU(1,I)) / F
    SI = (AR(I,L) * TAU(2,I) + AI(I,L) * TAU(1,I)) / F
    H = H + F * G
    G = 1._dp + G / F
    AR(I,L) = G * AR(I,L)
    AI(I,L) = G * AI(I,L)
    If (L == 1) GO TO 270
    GO TO 170
  160 TAU(1,L) = -TAU(1,I)
    SI = TAU(2,I)
    AR(I,L) = G
  170 F = 0._dp
    Do J = 1, L
      G = 0._dp
      GI = 0._dp
      Do K = 1, J
        G = G + AR(J,K) * AR(I,K) + AI(J,K) * AI(I,K)
        GI = GI - AR(J,K) * AI(I,K) + AI(J,K) * AR(I,K)
      Enddo
      JP1 = J + 1
      If (L < JP1) GO TO 220
      Do K = JP1, L
        G = G + AR(K,J) * AR(I,K) - AI(K,J) * AI(I,K)
        GI = GI - AR(K,J) * AI(I,K) - AI(K,J) * AR(I,K)
      Enddo
  220 E(J) = G / H
      TAU(2,J) = GI / H
      F = F + E(J) * AR(I,J) - TAU(2,J) * AI(I,J)
    Enddo
    HH = F / (H + H)
    Do J = 1, L
      F = AR(I,J)
      G = E(J) - HH * F
      E(J) = G
      FI = -AI(I,J)
      GI = TAU(2,J) - HH * FI
      TAU(2,J) = -GI
      Do K = 1, J
        AR(J,K) = AR(J,K) - F * E(K) - G * AR(I,K) &
          + FI * TAU(2,K) + GI * AI(I,K)
        AI(J,K) = AI(J,K) - F * TAU(2,K) - G * AI(I,K) &
          - FI * E(K) - GI * AR(I,K)
      Enddo
    Enddo
  270 Do K = 1, L
      AR(I,K) = SCALEI * AR(I,K)
      AI(I,K) = SCALEI * AI(I,K)
    Enddo
    TAU(2,L) = -SI
  290 HH = D(I)
    D(I) = AR(I,I)
    AR(I,I) = HH
    AI(I,I) = SCALEI * SCALEI * H
  Enddo
  Return

  End Subroutine HTRIDI

 Function iminloc(arr)
  Real(dp), Dimension(:), Intent(IN) :: arr
  Integer, Dimension(1) :: imin
  Integer :: iminloc
  imin=Minloc(arr(:))
  iminloc=imin(1)
 End Function iminloc

 Function IntRomb(func,a,b,eps)

 Implicit None
 Real(DP), Intent(IN) :: a,b,eps
 Real(DP) :: IntRomb

 Interface
  Function func(x)
  Use Control
  Real(DP), Intent(IN) :: x
  Real(DP) :: func
  End Function func
 End Interface

 Integer, Parameter :: JMAX=26,JMAXP=JMAX+1,K=5,KM=K-1
 Real(DP), Dimension(JMAXP) :: h,s
 Real(DP) :: dIntRomb, del, tnm, sum1, x
 Integer :: j, i1, it

 h(1)=1.0_dp
 Do j=1,JMAX
  !------------------------------------------
  ! trapez rule, Numerical Recipies, page 131
  !------------------------------------------
  If (j.Eq.1) Then
    s(j) = 0.5_dp * (b-a) * (func(a) + func(b))
  Else
    it = 2**(j-2)
    tnm = Real(it,dp)
    del = (b-a)/tnm
    sum1 = 0._dp
    x = a + del
    If (x.Eq.a) Then ! stepsize to small
     Write (ErrCan,*) &
       & "IntRomb: step size to small, called by ",NameOfUnit(Iname)
     Call AddError(22)
     IntRomb = s(j)
     Return
    End If
    x = a + 0.5_dp * del

    Do i1=1,it
     sum1 = sum1 + func(x)
     x = x + del
    End Do
    s(j) = 0.5_dp * (s(j) + (b-a) * sum1 / tnm)
  End If

  If (j >= K) Then
   Call polint(h(j-KM:j),s(j-KM:j),0.0_dp,IntRomb,dIntRomb)
   If (Abs(dIntRomb) <= EPS*Abs(IntRomb)) Return
  End If
  s(j+1)=s(j)
  h(j+1)=0.25_dp*h(j)
 End Do
 Write (ErrCan,*) "IntRomb: too many steps, called by ",NameOfUnit(Iname) 
 Write (ErrCan,503) eps,IntRomb,Abs(dIntRomb)
 Call AddError(23)
503 Format(3e16.7)

 End Function IntRomb

 Real(Dp) Function Kappa(x,y,z)
 !-----------------------------------------------------------------------
 ! kinematical function
 ! written by Werner Porod, 3.1.00
 ! 27.10.2000: porting to f90
 ! 04.06.02: using method of LoopTools to improve accuaracy
 !-----------------------------------------------------------------------
 Implicit None
  Real(Dp), Intent(in) :: x,y,z

  Real(dp) :: a1, a2, a3, aa1, aa2, aa3, a12, a13, a23, a, aff, asq

  Iname = Iname + 1
  NameOfUnit(Iname) = "Kappa"

      If ((x.Eq.0._dp).And.(y.Eq.0._dp).And.(z.Eq.0._dp)) Then
       kappa = 0._dp

      Elseif ((x.Eq.0._dp).And.(y.Eq.0._dp)) Then
       kappa = Abs(z)

      Elseif ((x.Eq.0._dp).And.(z.Eq.0._dp)) Then
       kappa = Abs(y)

      Elseif ((y.Eq.0._dp).And.(z.Eq.0._dp)) Then
       kappa = Abs(x)

      Elseif (z.Eq.0._dp) Then
       kappa = Abs(x-y)

      Elseif (y.Eq.0._dp) Then
       kappa = Abs(x-z)

      Elseif (x.Eq.0._dp) Then
       kappa = Abs(y-z)

      Else
       a1 = x
       a2 = y
       a3 = z
       a12 = x - y
       a13 = x - z
       a23 = y - z
       aa1 = Abs(a1)
       aa2 = Abs(a2)
       aa3 = Abs(a3)
       !  first see if there are input parameters with opposite sign:
       If ( ((a1.Lt.0).And.(a2.Gt.0)) .Or. ((a1.Gt.0).And.(a2.Lt.0)) ) Then
        If ( aa1 .Gt. aa2 ) Then
         a = a13 + a2
        Else
         a = a1 + a23
        End If
        aff = 4._dp*a1*a2
       Else If ( ((a1.Lt.0).And.(a3.Gt.0)).Or.((a1.Gt.0).And.(a3.Lt.0)) ) Then
        If ( aa1 .Gt. aa3 ) Then
         a = a12 + a3
        Else
         a = a1 - a23
        End If
       aff = 4._dp*a1*a3
       !  all have the same sign, choose the smallest 4*ai*aj term
       Else If ( (aa1.Gt.aa2) .And. (aa1.Gt.aa3) ) Then
        If ( aa2 .Gt. aa3 ) Then
         a = a12 - a3
        Else
         a = a13 - a2
        End If
        aff = 4._dp*a2*a3
       Else If ( aa2 .Gt. aa3 ) Then
        If ( aa1 .Gt. aa3 ) Then
         a = a12 + a3
        Else
         a = a1 - a23
        End If
        aff = 4._dp*a1*a3
       Else
        If ( aa1 .Gt. aa2 ) Then
         a = a13 + a2
        Else
         a = a1 + a23
        End If
        aff = 4._dp*a1*a2
       End If
       asq = a**2
       Kappa = asq - aff

!       kappa = (x-y-z)**2 - 4._dp * y * z
       If (kappa.Gt.0._dp) Then
        kappa = Sqrt( kappa )
       Else
        kappa = kappa / Max(x**2,y**2,z**2)
        If (Abs(kappa).Gt.1.e-12_dp) Then
         If (ErrorLevel.Ge.0) Then
          Write(ErrCan,*) "Problem in function kappa",kappa
          Write(ErrCan,*) "x,y,z",x,y,z
          Write(ErrCan,*) "Calling Routine",NameOfUnit(Iname)
          Call AddError(21)
          If (ErrorLevel.Ge.1) Call TerminateProgram
         End If
        End If
        kappa = 0._dp
       End If
      Endif

  Iname = Iname - 1

 End Function Kappa


 Real(Dp) Function Li2(X)
 !---------------------------------------------------------------------
 ! Spence-fkt. li2:
 ! local double prec. Version of function dilogarithm, 22. 5. 95
 ! H. Eberl, Convention - see Mathematica-manual side 575
 ! checked
 ! 1.10.2000: change to f90 + implicit none statement
 !---------------------------------------------------------------------
 Implicit None

  Real(Dp), Intent(in) :: x
  Real(Dp), Parameter :: Z1 = 1._dp, HF = Z1/2._dp,              &
        & C(0:19) = (/ 0.42996693560813697_dp,  &
        &              0.40975987533077105_dp,  &
        &             -0.01858843665014592_dp,  &
        &              0.00145751084062268_dp,  &
        &             -0.00014304184442340_dp,  &
        &              0.00001588415541880_dp,  &
        &             -0.00000190784959387_dp,  &
        &              0.00000024195180854_dp,  &
        &             -0.00000003193341274_dp,  &
        &              0.00000000434545063_dp,  &
        &             -0.00000000060578480_dp,  &
        &              0.00000000008612098_dp,  &
        &             -0.00000000001244332_dp,  &
        &              0.00000000000182256_dp,  &
        &             -0.00000000000027007_dp,  &
        &              0.00000000000004042_dp,  &
        &             -0.00000000000000610_dp,  &
        &              0.00000000000000093_dp,  &
        &             -0.00000000000000014_dp,  &
        &              0.00000000000000002_dp  /)
  Real(Dp) :: H,T,Y,S,A,Alfa,B0,B1,B2
  Integer :: i

  If(X .Eq. 1) Then
   H=Pi2o6
  Elseif(X .Eq. -1) Then
   H=-Pi2o12
  Else
   T=-X
   If(T .Le. -2) Then
    Y=-1/(1+T)
    S=1
    A=-Pi2o3+HF*(Log(-T)**2-Log(1+1/T)**2)
   Elseif(T .Lt. -1) Then
    Y=-1-T
    S=-1
    A=Log(-T)
    A=-Pi2o6+A*(A+Log(1+1/T))
   Else If(T .Le. -HF) Then
    Y=-(1+T)/T
    S=1
    A=Log(-T)
    A=-Pi2o6+A*(-HF*A+Log(1+T))
   Else If(T .Lt. 0) Then
    Y=-T/(1+T)
    S=-1
    A=HF*Log(1+T)**2
   Else If(T .Le. 1) Then
    Y=T
    S=1
    A=0
   Else
    Y=1/T
    S=-1
    A=Pi2o6+HF*Log(T)**2
   Endif
   H=Y+Y-1
   ALFA=H+H
   B1=0
   B2=0
   Do I = 19,0,-1
    B0=C(I)+ALFA*B1-B2
    B2=B1
    B1=B0
   Enddo
   H=-(S*(B0-H*B2)+A)
  Endif
  LI2=H

 End Function Li2
 
 Subroutine LuBkSb_c(a,indx,b)
 !------------------------------------------
 ! taking Numerical recipies as example
 ! written by Werner Porod, 13.03.03
 !------------------------------------------
 Implicit None
  Complex(dp), Dimension(:,:), Intent(IN) :: a
  Integer, Dimension(:), Intent(IN) :: indx
  Complex(dp), Dimension(:), Intent(INOUT) :: b

  Integer :: i,n,ii,ll
  Complex(dP) :: summ

  Iname = Iname + 1
  NameOfUnit(Iname) = "LuBkSb_c"

  n = Size(a,1)
  If ((n.Ne.Size(a,2)).Or.(n.Ne.Size(indx))) Then
   Write(Errcan,*) "Error in routine "//NameOfUnit(Iname)
   Write(ErrCan,*) "sizes of matrix and vector are not consisten: a_1,a_2,b" &
     & ,n,Size(a,2),Size(indx)
   Call TerminateProgram
  End If

  ii=0
  Do i=1,n
    ll=indx(i)
    summ=b(ll)
    b(ll)=b(i)
    If (ii /= 0) Then
      summ=summ-Dot_product(a(i,ii:i-1),b(ii:i-1))
    Else If (summ /= 0.0_dp) Then
      ii=i
    End If
    b(i)=summ
  End Do
  Do i=n,1,-1
    b(i) = (b(i)-Dot_product(a(i,i+1:n),b(i+1:n)))/a(i,i)
  End Do

  Iname = Iname - 1

 End Subroutine LuBkSb_c
  
 Subroutine lubksb_r(a,indx,b)
 !------------------------------------------
 ! taking Numerical recipies as example
 ! written by Werner Porod, 13.03.03
 !------------------------------------------
 Implicit None
  Real(dp), Dimension(:,:), Intent(IN) :: a
  Integer, Dimension(:), Intent(IN) :: indx
  Real(dp), Dimension(:), Intent(INOUT) :: b

  Integer :: i,n,ii,ll
  Real(dP) :: summ

  Iname = Iname + 1
  NameOfUnit(Iname) = "LuBkSb_r"

  n = Size(a,1)
  If ((n.Ne.Size(a,2)).Or.(n.Ne.Size(indx))) Then
   Write(Errcan,*) "Error in routine "//NameOfUnit(Iname)
   Write(ErrCan,*) "sizes of matrix and vector are not consisten: a_1,a_2,b" &
     & ,n,Size(a,2),Size(indx)
   Call TerminateProgram
  End If

  ii=0
  Do i=1,n
    ll=indx(i)
    summ=b(ll)
    b(ll)=b(i)
    If (ii /= 0) Then
      summ=summ-Dot_product(a(i,ii:i-1),b(ii:i-1))
    Else If (summ /= 0.0_dp) Then
      ii=i
    End If
    b(i)=summ
  End Do
  Do i=n,1,-1
    b(i) = (b(i)-Dot_product(a(i,i+1:n),b(i+1:n)))/a(i,i)
  End Do

  Iname = Iname - 1

 End Subroutine LuBkSb_r
  
 Subroutine LuDcmp_c(a,indx,d)
 !------------------------------------------
 ! taking Numerical recipies as example
 ! written by Werner Porod, 13.03.03
 !------------------------------------------
  Implicit None
  Complex(DP), Dimension(:,:), Intent(INOUT) :: a
  Integer, Dimension(:), Intent(OUT) :: indx
  Real(DP), Intent(OUT) :: d

  Complex(DP), Dimension(Size(a,1)) :: vv, dum
  Real(DP), Parameter :: TINY=1.0e-20_dp
  Integer :: j,n,imax, imaxvec(1)

  Iname = Iname + 1
  NameOfUnit(Iname) = "LuDcmp_c"

  n = Size(a,1)
  If ((n.Ne.Size(a,2)).Or.(n.Ne.Size(indx))) Then
   Write(Errcan,*) "Error in routine "//NameOfUnit(Iname)
   Write(ErrCan,*) "sizes of matrix and vector are not consisten: a_1,a_2,b" &
     & ,n,Size(a,2),Size(indx)
   Call TerminateProgram
  End If

  d=1.0_dp

  vv=Maxval(Abs(a),dim=2)
  If (Any(vv == 0.0_dp)) Then
    Write(Errcan,*) "Singular matrix in "//NameOfUnit(Iname)
    Call TerminateProgram
  End If

  vv=1.0_dp/vv

  Do j=1,n
    imaxvec = Maxloc(Abs(vv(j:n))*Abs(a(j:n,j)))
    imax=(j-1)+imaxvec(1)
    If (j /= imax) Then
      dum = a(imax,:)
      a(imax,:) = a(j,:)
      a(j,:) = dum
      d=-d
      vv(imax)=vv(j)
    End If
    indx(j)=imax
    If (a(j,j) == 0.0_dp) a(j,j)=TINY
    a(j+1:n,j)=a(j+1:n,j)/a(j,j)
    a(j+1:n,j+1:n)=a(j+1:n,j+1:n)-outerprod(a(j+1:n,j),a(j,j+1:n))
  End Do

  Iname = Iname - 1

 End Subroutine LuDcmp_c

 Subroutine LuDcmp_r(a,indx,d)
 !------------------------------------------
 ! taking Numerical recipies as example
 ! written by Werner Porod, 13.03.03
 !------------------------------------------
 Implicit None
  Real(DP), Dimension(:,:), Intent(INOUT) :: a
  Integer, Dimension(:), Intent(OUT) :: indx
  Real(DP), Intent(OUT) :: d

  Real(DP), Dimension(Size(a,1)) :: vv, dum
  Real(DP), Parameter :: TINY=1.0e-20_dp
  Integer :: j,n,imax, imaxvec(1)

  Iname = Iname + 1
  NameOfUnit(Iname) = "LuDcmp_r"

  n = Size(a,1)
  If ((n.Ne.Size(a,2)).Or.(n.Ne.Size(indx))) Then
   Write(Errcan,*) "Error in routine "//NameOfUnit(Iname)
   Write(ErrCan,*) "sizes of matrix and vector are not consisten: a_1,a_2,b" &
     & ,n,Size(a,2),Size(indx)
   Call TerminateProgram
  End If

  d=1.0_dp

  vv=Maxval(Abs(a),dim=2)
  If (Any(vv == 0.0_dp)) Then
    Write(Errcan,*) "Singular matrix in "//NameOfUnit(Iname)
    Call TerminateProgram
  End If

  vv=1.0_dp/vv

  Do j=1,n
    imaxvec = Maxloc(vv(j:n)*Abs(a(j:n,j)))
    imax=(j-1)+imaxvec(1)
    If (j /= imax) Then
      dum = a(imax,:)
      a(imax,:) = a(j,:)
      a(j,:) = dum
      d=-d
      vv(imax)=vv(j)
    End If
    indx(j)=imax
    If (a(j,j) == 0.0_dp) a(j,j)=TINY
    a(j+1:n,j)=a(j+1:n,j)/a(j,j)
    a(j+1:n,j+1:n)=a(j+1:n,j+1:n)-outerprod(a(j+1:n,j),a(j,j+1:n))
  End Do

  Iname = Iname - 1

 End Subroutine LuDcmp_r


 Function MatMul2C3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3,3), b(3,3)
  Complex(dp) :: d(3,3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1,i1) = a(i1,i1) * b(i1,i1)
   End Do
  Else
   d = Matmul(a, b)
  End If
 End Function MatMul2C3

 Function MatVec2C3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3,3), b(3)
  Complex(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = a(i1,i1) * b(i1)
   End Do
  Else
   d = Matmul(a, b)
  End If

 End Function MatVec2C3


 Function VecMat2C3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: b(3,3), a(3)
  Complex(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = b(i1,i1) * a(i1)
   End Do
  Else
   d = Matmul(a, b)
  End If

 End Function VecMat2C3

 Function VecVec2C3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3), b(3)
  Complex(dp) :: d

  d = Dot_Product(a, b)

 End Function VecVec2C3

 Function MatCVecR23(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3,3)
  Real(dp), Intent(in) :: b(3)
  Complex(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = a(i1,i1) * b(i1)
   End Do
  Else
   d = Matmul(a, b )
  End If
 End Function MatCVecR23

! Interface MutMul2
 Function MatMul2R3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: a(3,3), b(3,3)
  Real(dp) :: d(3,3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1,i1) = a(i1,i1) * b(i1,i1)
   End Do
  Else
   d = Matmul(a, b )
  End If
 End Function MatMul2R3

 Function MatVec2R3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: a(3,3), b(3)
  Real(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = a(i1,i1) * b(i1)
   End Do
  Else
   d = Matmul(a, b )
  End If
 End Function MatVec2R3

 Function VecMat2R3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: b(3,3), a(3)
  Real(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = b(i1,i1) * a(i1)
   End Do
  Else
   d = Matmul(a, b )
  End If

 End Function VecMat2R3

 Function VecVec2R3(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: a(3), b(3)
  Real(dp) :: d

  d = Dot_product(a, b )

 End Function VecVec2R3

 Function VecCMatR2(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3)
  Real(dp), Intent(in) :: b(3,3)
  Complex(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = b(i1,i1) * a(i1)
   End Do
  Else
   d = Matmul(a, b)
  End If

 End Function VecCMatR2


 Function VecRMatC2(A, B, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: a(3)
  Complex(dp), Intent(in) :: b(3,3)
  Complex(dp) :: d(3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1) = b(i1,i1) * a(i1)
   End Do
  Else
   d = Matmul(a, b)
  End If

 End Function VecRMatC2



 Function MatMul3C3(A, B, C, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3,3), b(3,3), c(3,3)
  Complex(dp) :: d(3,3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1,i1) = a(i1,i1) * b(i1,i1) * c(i1,i1)
   End Do
  Else
   d = Matmul(a, Matmul(b,c) )
  End If
 End Function MatMul3C3
! Interface MutMul2

! Interface MutMul3
 Function MatMul3R3(A, B, C, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: a(3,3), b(3,3), c(3,3)
  Real(dp) :: d(3,3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1,i1) = a(i1,i1) * b(i1,i1) * c(i1,i1)
   End Do
  Else
   d = Matmul(a, Matmul(b,c) )
  End If
 End Function MatMul3R3


 Function MatMul4C3(A, B, C, D, OnlyDiagonal) Result(E)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3,3), b(3,3), c(3,3), d(3,3)
  Complex(dp) :: e(3,3)
  Integer :: i1

  e = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    e(i1,i1) = a(i1,i1) * b(i1,i1) * c(i1,i1) * d(i1,i1)
   End Do
  Else
   e = Matmul(a, Matmul(b,Matmul(c,d) ) )
  End If
 End Function MatMul4C3
! Interface MutMul3

! Interface MutMul4
 Function MatMul4R3(A, B, C, D, OnlyDiagonal) Result(E)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Real(dp), Intent(in) :: a(3,3), b(3,3), c(3,3), d(3,3)
  Real(dp) :: e(3,3)
  Integer :: i1

  e = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    e(i1,i1) = a(i1,i1) * b(i1,i1) * c(i1,i1) * d(i1,i1)
   End Do
  Else
   e = Matmul(a, Matmul(b,Matmul(c,d) ) )
  End If
 End Function MatMul4R3

 Function MatSquare(A, OnlyDiagonal) Result(D)
 Implicit None
  Logical, Intent(in) :: OnlyDiagonal
  Complex(dp), Intent(in) :: a(3,3)
  Complex(dp) :: d(3,3)
  Integer :: i1

  d = 0._dp

  If (OnlyDiagonal) Then
   Do i1=1,3
    d(i1,i1) = a(i1,i1) * a(i1,i1)
   End Do
  Else
   d = Matmul(a, a )
  End If
 End Function MatSquare

 Subroutine mmid(y,dydx,xs,htot,nstep,yout,derivs)
 !-------------------------------------------------
 ! modified mmid routine for solving DGLs, taken
 ! from numerical recipies
 ! written by Werner Porod, 16.03.10
 !-------------------------------------------------
 Implicit None
  External derivs

  Integer, Intent(IN) :: nstep
  Real(dp), Intent(IN) :: xs,htot
  Real(dp), Dimension(:), Intent(IN) :: y,dydx
  Real(dp), Dimension(:), Intent(OUT) :: yout

  Integer :: n, len1
  Real(dp) :: h,h2,x
  Real(dp), Dimension(Size(y)) :: ym, yn, swap

  Iname = Iname + 1
  NameOfUnit(Iname) = "mmid"

  len1 = Size(y) 
  If ((len1.Ne.Size(dydx)).Or.(len1.Ne.Size(yout))) Then
   Write(ErrCan,*) "Problem in routine mmid, size of vectors"
   Write(ErrCan,*) "does not conincide:",len1,Size(dydx),Size(yout)
   Call TerminateProgram
  End If

  h=htot/nstep
  ym=y
  yn=y+h*dydx
  x=xs+h
  Call derivs(len1, x, yn, yout)
  h2=2.0_dp * h
  Do n=2,nstep
   swap = ym
   ym = yn
   yn = swap

   yn=yn+h2*yout
   x=x+h
   Call derivs(len1, x, yn, yout)
  End Do
  yout=0.5_dp*(ym+yn+h*yout)

  Iname = Iname - 1

 End Subroutine mmid

 Subroutine odeint(ystart, len, x1, x2, eps, h1, hmin, derivs, kont)
 Implicit None
  External derivs

  Integer, Intent(in) :: len
  Real(dp), Dimension(len), Intent(INOUT) :: ystart
  Real(dp), Intent(IN) :: x1, x2, eps, h1, hmin
  Integer, Intent(inout) :: kont

  Real(dp), Parameter :: TINY=Epsilon(1._dp)
  Integer :: nstp
  Real(dp) :: h,hdid,hnext,x !,xsav
  Real(dp), Dimension(len) :: dydx, y, yscal

  Iname = Iname + 1
  NameOfUnit(Iname) = "odeint"

  x=x1
  h=Sign(h1,x2-x1)
  nok=0
  nbad=0
  kount=0

  y(:)=ystart(:)
  kont = 0

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

   If (hdid == h) Then
    nok=nok+1
   Else
    nbad=nbad+1
   End If

   If ((x-x2)*(x2-x1) >= 0.0_dp) Then
    ystart(:)=y(:)
    Iname = Iname - 1
    Return
   End If

   If (Abs(hnext) < hmin) Then
    kont = -1
    Call AddError(1)
    Write(ErrCan,*) "Problem in OdeInt, stepsize smaller than minimum."
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Iname = Iname - 1
    Return
   End If

   If (Maxval(Abs(y)).Gt.1.e36_dp) Then
    kont = -2
    Call AddError(2)
    Write(ErrCan,*) "Problem in OdeInt, max val > 10^36.",Maxval(Abs(y))
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Iname = Iname - 1
    Return
   End If
   h=hnext
  End Do

  kont = -3
  Call AddError(3)
  Write(ErrCan,*) "Problem in OdeInt, too many steps."
  If (ErrorLevel.Ge.1) Call TerminateProgram
  Iname = Iname - 1

 End Subroutine odeint


 Subroutine odeintB(ystart, len, x1, x2, eps, h1, hmin, derivs, xout, kont)
 Implicit None
  External derivs

  Integer, Intent(in) :: len
  Real(dp), Dimension(len), Intent(INOUT) :: ystart
  Real(dp), Intent(out) :: xout
  Real(dp), Intent(IN) :: x1, x2, eps, h1, hmin
  Integer, Intent(inout) :: kont

  Real(dp), Parameter :: TINY=Epsilon(1._dp)
  Integer :: nstp
  Real(dp) :: h,hdid,hnext,x,x_old, h_old
  Real(dp), Dimension(len) :: dydx, y, yscal, y_old

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

   If (((y(1)-y(2)).Gt.0._dp).And.((y(1)-y(2)).Lt.eps)) Then
    ystart(:)=y(:)
    xout = x
    Iname = Iname - 1
    Return
   Else If (y(1).Gt.y(2)) Then
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

 End Subroutine odeintB


 Subroutine odeintC(ystart, len, x1, x2, eps, h1, hmin, derivs, xout, kont)
 Implicit None
  External derivs

  Integer, Intent(in) :: len
  Real(dp), Dimension(len), Intent(INOUT) :: ystart
  Real(dp), Intent(out) :: xout
  Real(dp), Intent(IN) :: x1, x2, eps, h1, hmin
  Integer, Intent(inout) :: kont

  Real(dp), Parameter :: TINY=Epsilon(1._dp)
  Integer :: nstp
  Real(dp) :: h,hdid,hnext,x,x_old, h_old
  Real(dp), Dimension(len) :: dydx, y, yscal, y_old

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


   If (((y(1)-y(2)).Gt.0._dp).And.(Abs(y(1)-y(2)).Lt.eps)) Then
    ystart(:)=y(:)
    xout = x
    Iname = Iname - 1
    Return
   Else If (y(1).Lt.y(2)) Then
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

 End Subroutine odeintC


 Function outerprod_c(a,b)
  Complex(DP), Dimension(:), Intent(IN) :: a,b
  Complex(DP), Dimension(Size(a),Size(b)) :: outerprod_c
   outerprod_c = Spread(a,dim=2,ncopies=Size(b))  &
               & * Spread(b,dim=1,ncopies=Size(a))
 End Function outerprod_c

 Function outerprod_d(a,b)
  Real(DP), Dimension(:), Intent(IN) :: a,b
  Real(DP), Dimension(Size(a),Size(b)) :: outerprod_d
   outerprod_d = Spread(a,dim=2,ncopies=Size(b))  &
               & * Spread(b,dim=1,ncopies=Size(a))
 End Function outerprod_d

 Function outerprod_r(a,b)
  Real, Dimension(:), Intent(IN) :: a,b
  Real, Dimension(Size(a),Size(b)) :: outerprod_r
   outerprod_r = Spread(a,dim=2,ncopies=Size(b))  &
               & * Spread(b,dim=1,ncopies=Size(a))
 End Function outerprod_r

 Function pythag_dp(a,b)
  Implicit None
  Real(DP), Intent(IN) :: a,b
  Real(DP) :: pythag_dp
  Real(DP) :: absa,absb
  absa=Abs(a)
  absb=Abs(b)
  If (absa > absb) Then
    pythag_dp=absa*Sqrt(1.0_dp+(absb/absa)**2)
  Else
    If (absb == 0.0_dp) Then
      pythag_dp=0.0_dp
    Else
      pythag_dp=absb*Sqrt(1.0_dp+(absa/absb)**2)
    End If
  End If
 End Function pythag_dp

 Function pythag_sp(a,b)
 Implicit None
  Real, Intent(IN) :: a,b
  Real :: pythag_sp
  Real :: absa,absb
  absa=Abs(a)
  absb=Abs(b)
  If (absa > absb) Then
    pythag_sp=absa*Sqrt(1.0+(absb/absa)**2)
  Else
    If (absb == 0.0) Then
      pythag_sp=0.0
    Else
      pythag_sp=absb*Sqrt(1.0+(absa/absb)**2)
    End If
  End If
 End Function pythag_sp

 Subroutine polint(xa,ya,x,y,dy)
 !---------------------------------------------------------------------------
 ! polynomial interpolation, based on Numerical Recipes in Fortran, page 103
 ! written by Werner Porod, 23.05.2001
 !---------------------------------------------------------------------------
 Use Control !nrtype; USE nrutil, ONLY : assert_eq,iminloc,nrerror
 Implicit None
  Real(dp), Dimension(:), Intent(IN) :: xa, ya
  Real(dp), Intent(IN) :: x
  Real(dp), Intent(OUT) :: y, dy
  Integer :: m, n, ns
  Real(dp), Dimension(Size(xa)) :: c, d, den, ho

  n = Size(xa)
  c = ya
  d = ya
  ho = xa-x
  ns = iminloc(Abs(x-xa))
  y = ya(ns)
  ns = ns-1
  Do m=1,n-1
    den(1:n-m)=ho(1:n-m)-ho(1+m:n)
    den(1:n-m)=(c(2:n-m+1)-d(1:n-m))/den(1:n-m)
    d(1:n-m)=ho(1+m:n)*den(1:n-m)
    c(1:n-m)=ho(1:n-m)*den(1:n-m)
    If (2*ns < n-m) Then
      dy=c(ns+1)
    Else
      dy=d(ns)
      ns=ns-1
    End If
    y=y+dy
  End Do
 Contains

  Function iminloc(arr)
   Real(dp), Dimension(:), Intent(IN) :: arr
   Integer, Dimension(1) :: imin
   Integer :: iminloc
   imin = Minloc(arr(:))
   iminloc = imin(1)
  End Function iminloc

 End Subroutine polint
 Subroutine pzextr(iest,xest,yest,yz,dy, kont)
 !--------------------------------------------------------------------
 ! use polynomial extrapolation to evaluate n functions
 ! at x = 0 by fitting a polynomial to sequence of estimates
 ! with progressively smaller values of x=xest, and corresponding
 ! function vectors yest(:). This call is number iest in the sequence
 ! of calls.
 ! written by Werner Porod, 17.03.2010
 !--------------------------------------------------------------------
 Implicit None
  Integer, Intent(IN) :: iest
  Integer, Intent(inout) :: kont
  Real(dp), Intent(IN) :: xest
  Real(dp), Dimension(:), Intent(IN) :: yest
  Real(dp), Dimension(:), Intent(OUT) :: yz,dy

  Integer, Parameter :: IEST_MAX=16
  Integer :: j,nv
  Integer, Save :: nvold=-1
  Real(dp) :: delta,f1,f2
  Real(dp), Dimension(Size(yz)) :: d,tmp,q
  Real(dp), Dimension(IEST_MAX), Save :: x
  Real(dp), Dimension(:,:), Allocatable, Save :: qcol

  Iname = Iname + 1
  NameOfUnit(Iname) = "pzextr"

  nv = Size(yest)

  If ((nv.Ne.Size(yz)).Or.(nv.Ne.Size(dy))) Then
   Write(ErrCan,*) "Problem in routine pzextr, size of vectors"
   Write(ErrCan,*) "does not conincide:",nv,Size(yz),Size(dy)
   Call TerminateProgram
  End If

  If (iest > IEST_MAX) Then
   kont = -28
   Call AddError(28)
   Write(ErrCan,*) "Routine pzextr: probable misuse, too much extrapolation"
   If (ErrorLevel.Ge.1) Call TerminateProgram
   Iname = Iname - 1
   Return
  End If
   
  If (nv /= nvold) Then
   If (Allocated(qcol)) Deallocate(qcol)
   Allocate(qcol(nv,IEST_MAX))
   nvold=nv
  End If
  x(iest)=xest
  dy = yest
  yz = yest
  If (iest == 1) Then
   qcol(:,1)=yest(:)
  Else
   d(:)=yest(:)
   Do j=1,iest-1
    delta=1.0_dp/(x(iest-j)-xest)
    f1=xest*delta
    f2=x(iest-j)*delta
    q(:)=qcol(:,j)
    qcol(:,j)=dy(:)
    tmp(:)=d(:)-q(:)
    dy(:)=f1*tmp(:)
    d(:)=f2*tmp(:)
    yz(:)=yz(:)+dy(:)
   End Do
   qcol(:,iest)=dy(:)
  End If

  Iname = Iname - 1

 End Subroutine pzextr

 Subroutine RealEigenSystem(Matrix,EigenValues,EigenVectors,kont, test)
 !---------------------------------------------------------------------
 ! Subroutine for diagonalization of real symmetric matrices, based on the
 ! Householder algorithm. Is a portation of  EISRS1 to F90
 ! Input:
 !  Matrix ..... n times n matrix
 ! Output
 !  EigenValues ..... n sorted EigenValues: |m_1| < |m_2| < .. < |m_n|
 !  EigenVectors .... n times n matrix with the eigenvectors
 ! written by Werner Porod, 11.11.2000 
 !---------------------------------------------------------------------
 Implicit None
  Real(Dp), Intent(in) :: Matrix(:,:)
  Real(Dp), Intent(out) :: EigenVectors(:,:), EigenValues(:), test(:)
  Integer, Intent(inout) :: kont

  Integer :: N1,N2,N3
  Real(Dp), Allocatable :: AR(:,:), WR(:), WORK(:)

  Iname = Iname + 1
  NameOfUnit(Iname) = 'RealEigenSystem'

  N1 = Size(Matrix, Dim=1)
  N2 = Size(EigenValues)
  N3 = Size(EigenVectors, Dim=1)
  If ((N1.Ne.N2).Or.(N1.Ne.N3)) Then
   Write (ErrCan,*) 'Error in Subroutine '//NameOfUnit(Iname)
   Write (ErrCan,*) 'Dimensions to not match: ',N1,N2,N3
   If (ErrorLevel.Ge.-1) Call TerminateProgram
   kont = -15
   Call AddError(15)
   Iname = Iname - 1
   Return 
  End If

  Allocate(AR(N1,N1))
  Allocate(WR(N1))
  Allocate(Work(N1))

  AR = Matrix
 
  Call Tred2A(AR, WR, Work)
  Call TQLi(KONT,WR,WORK,AR)

  Do n2=1,n1-1
   Do n3=n2+1,n1
    If (wr(n2).Gt.wr(n3)) Then
     work(1) = wr(n2) 
     wr(n2) = wr(n3)
     wr(n3) = work(1)
     work = ar(:,n2)
     ar(:,n2) = ar(:,n3)
     ar(:,n3) = work
    End If
   End Do
  End Do

  EigenValues = WR
  EigenVectors = Transpose(AR) 

  !-------------------------
  ! test of diagonalisation
  !-------------------------
  Ar = Matmul(Eigenvectors, Matmul(Matrix, Ar) )

  test = 0._dp
  Do n2=1,n1
   Do n3=1,n1
    If (n2.Eq.n3) Then
     test(1) = Max(test(1), Abs( Ar(n2,n3) ) )
    Else
     test(2) = Max(test(2), Abs( Ar(n2,n3) ) )
    End If
   End Do
  End Do
  If (test(1).Gt.0._dp) Then
   If ( (test(2)/test(1)).Gt.MinimalPrecision) then
    kont = -16
    Call AddError(16)
   End If
  End If

  Deallocate(AR,WR,Work)

  Iname = Iname - 1

 End Subroutine RealEigenSystem

 Complex(dp) Function RiemannZeta(x)
 Implicit None
  Complex(dp), Intent(in) :: x
  Integer :: i1
  Complex(dp) :: sum1

  RiemannZeta = - Pi / 12._dp
  Do i1=1,50
   sum1 = Exp(- 2._dp * Pi * i1 * x)
   sum1 = 2._dp * Pi * i1 * sum1 / (1._dp - sum1)
   RiemannZeta = RiemannZeta + sum1
   If (Abs(sum1).Lt.1.e-10_dp) Exit
  End Do

 End Function RiemannZeta

 Subroutine rkqs(y,dydx,x,htry,eps,yscal,hdid,hnext,derivs,kont)
 Implicit None
  External derivs

  Integer, Intent(inout) :: kont
  Real(dp), Dimension(:), Intent(INOUT) :: y
  Real(dp), Dimension(:), Intent(IN) :: dydx,yscal
  Real(dp), Intent(INOUT) :: x
  Real(dp), Intent(IN) :: htry,eps
  Real(dp), Intent(OUT) :: hdid,hnext

  Integer :: ndum
  Real(dp) :: errmax,h,htemp,xnew
  Real(dp), Dimension(Size(y)) :: ak2,ak3,ak4,ak5,ak6
  Real(dp), Dimension(Size(y)) :: yerr,ytemp
  Real(dp), Parameter :: SAFETY=0.9_dp,PGROW=-0.2_dp,PSHRNK=-0.25_dp,&
    ERRCON=1.89e-4

  Iname = Iname + 1
  NameOfUnit(Iname) = "rkqs"

  ndum = Size(y)

  If ((ndum.Ne.Size(dydx)).Or.(ndum.Ne.Size(yscal))) Then
   Write(ErrCan,*) "Problem in routine rkqs, size of vectors"
   Write(ErrCan,*) "does not conincide:",ndum,Size(dydx),Size(yscal)
   Call TerminateProgram
  End If

  h=htry

  Do

   ytemp=y+B21*h*dydx
   Call derivs(ndum,x+A2*h,ytemp,ak2)
   ytemp=y+h*(B31*dydx+B32*ak2)
   Call derivs(ndum,x+A3*h,ytemp,ak3)
   ytemp=y+h*(B41*dydx+B42*ak2+B43*ak3)
   Call derivs(ndum,x+A4*h,ytemp,ak4)
   ytemp=y+h*(B51*dydx+B52*ak2+B53*ak3+B54*ak4)
   Call derivs(ndum,x+A5*h,ytemp,ak5)
   ytemp=y+h*(B61*dydx+B62*ak2+B63*ak3+B64*ak4+B65*ak5)
   Call derivs(ndum,x+A6*h,ytemp,ak6)
   ytemp=y+h*(C1*dydx+C3*ak3+C4*ak4+C6*ak6)
   yerr=h*(DC1*dydx+DC3*ak3+DC4*ak4+DC5*ak5+DC6*ak6)

   errmax=Maxval(Abs(yerr(:)/yscal(:)))/eps
   If (errmax <= 1.0) Exit
   htemp=SAFETY*h*(errmax**PSHRNK)
   h=Sign(Max(Abs(htemp),0.1_dp*Abs(h)),h)
   xnew=x+h

   If (xnew == x) Then
    kont = -12
    Call AddError(12)
    Write(ErrCan,*) "Problem in rkqs, stepsize underflow"
    If (ErrorLevel.Ge.1) Call TerminateProgram
    Iname = Iname - 1
    Return
   End If
  End Do

  If (errmax > ERRCON) Then
    hnext=SAFETY*h*(errmax**PGROW)
  Else
    hnext=5.0_dp*h
  End If
  hdid=h
  x=x+h
  y(:)=ytemp(:)

  Iname = Iname - 1

 End Subroutine rkqs


 Subroutine RKSTP(H,X,Y,SUB,W)
 !----------------------------------------------------------------------
 !
 !     From CERN Program Library, routine D209, with error message for
 !     N.LT.1 replaced by STOP 99 to eliminate Kernlib error routine.
 !
 !     THIS SUBROUTINE REPLACES X BY X+H AND ADVANCES THE SOLUTION OF THE
 !     SYSTEM OF DIFFERENTIAL EQUATIONS DY/DX=F(X,Y) FROM Y(X) TO Y(X+H)
 !     USING A FIFTH-ORDER RUNGE-KUTTA METHOD.
 !
 !     SUB IS THE NAME OF A SUBROUTINE SUB(X,Y,F) WHICH SETS THE VECTOR F
 !     TO THE DERIVATIVE AT X OF THE VECTOR Y.
 !
 !     W IS A WORKING-SPACE ARRAY, TREATED AS CONSISTING OF THREE CONSEC-
 !     UTIVE WORKING VECTORS OF LENGTH N.
 !
 !
 !  changed for double precision by Werner Porod, 5.7.1996
 ! 17.04.02: portation to f90
 !----------------------------------------------------------------------
 Implicit None

  External SUB

  Real(dp) ::  H,H2,H6,HLOCAL,Y(:),W(:,:),X,XH,XH2

  Integer :: n

  n = Size(Y)

  If (N.Lt.1) Stop 99

  HLOCAL = H
  H2 = 0.5_dp * HLOCAL
  H6=HLOCAL / 6._dp
  XH = X + HLOCAL
  XH2 = X + H2

  Call SUB(n, X,Y,W(:,1))
  W(:,2) = Y + H2 * W(:,1)

  Call SUB(n, XH2,W(:,2),W(:,3))
  W(:,1) = W(:,1) + 2._dp * W(:,3)
  W(:,2) = Y + H2 * W(:,3)

  Call SUB(n, XH2,W(:,2),W(:,3))
  W(:,1) = W(:,1) + 2._dp * W(:,3)
  W(:,2) = Y + HLOCAL * W(:,3)

  Call SUB(n, XH, W(:,2),W(:,3))
  Y = Y + H6 * (W(:,1) + W(:,3))

  X=XH

 End Subroutine RKSTP
 Subroutine rzextr(iest,xest,yest,yz,dy, kont)
 !--------------------------------------------------------
 ! the same as pzextr but uses diagonal rational function
 ! extrapolation instead of polynomial extrapolation
 ! written by Werner Porod, 17.03.2010
 !--------------------------------------------------------------------
 Implicit None
  Integer, Intent(IN) :: iest
  Integer, Intent(inout) :: kont
  Real(dp), Intent(IN) :: xest
  Real(dp), Dimension(:), Intent(IN) :: yest
  Real(dp), Dimension(:), Intent(OUT) :: yz,dy
  Integer, Parameter :: IEST_MAX=16
  Integer :: k,nv
  Integer, Save :: nvold=-1
  Real(dp), Dimension(Size(yz)) :: yy,v,c,b,b1,ddy
  Real(dp), Dimension(:,:), Allocatable, Save :: d
  Real(dp), Dimension(IEST_MAX), Save :: fx,x

  Iname = Iname + 1
  NameOfUnit(Iname) = "rzextr"

  nv = Size(yest)

  If ((nv.Ne.Size(yz)).Or.(nv.Ne.Size(dy))) Then
   Write(ErrCan,*) "Problem in routine rzextr, size of vectors"
   Write(ErrCan,*) "does not conincide:",nv,Size(yz),Size(dy)
   Call TerminateProgram
  End If

  If (iest > IEST_MAX) Then
   kont = -29
   Call AddError(29)
   Write(ErrCan,*) "Routine rzextr: probable misuse, too much extrapolation"
   If (ErrorLevel.Ge.1) Call TerminateProgram
   Iname = Iname - 1
   Return
  End If

  If (nv /= nvold) Then
   If (Allocated(d)) Deallocate(d)
   Allocate(d(nv,IEST_MAX))
   nvold=nv
  End If
  x(iest)=xest
  If (iest == 1) Then
   yz=yest
   d(:,1)=yest
   dy=yest
  Else
   fx(2:iest)=x(iest-1:1:-1)/xest
   yy=yest
   v=d(1:nv,1)
   c=yy
   d(1:nv,1)=yy
   Do k=2,iest
    b1=fx(k)*v
    b=b1-c
    Where (b /= 0.0_dp)
     b=(c-v)/b
     ddy=c*b
     c=b1*b
    Elsewhere
     ddy=v
    End Where
    If (k /= iest) v=d(1:nv,k)
    d(1:nv,k)=ddy
    yy=yy+ddy
   End Do
   dy=ddy
   yz=yy
  End If

  Iname = Iname - 1

 End Subroutine rzextr

 Logical Function Set_Use_rzextr_instead_of_pzextr(l_in)
 Implicit None
  Logical, Intent(in) :: l_in

  Set_Use_rzextr_instead_of_pzextr = Use_rzextr_instead_of_pzextr
  Use_rzextr_instead_of_pzextr = l_in

 End Function Set_Use_rzextr_instead_of_pzextr

 Logical Function Set_Use_bsstep_instead_of_rkqs(l_in)
 Implicit None
  Logical, Intent(in) :: l_in

  Set_Use_bsstep_instead_of_rkqs = Use_bsstep_instead_of_rkqs
  Use_bsstep_instead_of_rkqs = l_in

 End Function Set_Use_bsstep_instead_of_rkqs

 Subroutine SolveLinearEquations_c(A, b, x)
 !----------------------------------------------------------
 ! solves the linear system of equations: A.x = b for a given
 ! matrix A and vector b and the unknown vector x
 ! written by Werner Porod, 13.03.03
 !----------------------------------------------------------
 Implicit None
  Complex(dp), Intent(in) :: a(:,:), b(:)
  Complex(dp), Intent(out) :: x(:)

  Integer :: indx(2*Size(x)), n, i1, i2
  Real(dp) :: d
  Real(dp) :: a_reg(2*Size(x),2*Size(x)), b_in(2*Size(x)), test

  Iname = Iname + 1
  NameOfUnit(Iname) = "SolveLinearEquations_c"

  !----------------------------------------------------------------
  ! first sorting out a singular case appearing inside the program
  ! however, the solution is known in this case
  !----------------------------------------------------------------
  n = Size(x)
  test = 0._dp
  Do i1=1,n
   Do i2=1,n
    If (i1.Ne.i2) test = test + Abs( a(i1,i2) )
   End Do
  End Do

  If (test.Eq.0._dp) Then ! at most the diagonal entries are non-zero
   Do i1=1,n
    x(i1) = 0._dp
    If ( (a(i1,i1).Ne.0._dp) .And. (b(i1).Ne.0._dp ) ) Then
     x(i1) = b(i1) / a(i1,i1)
    Else If (b(i1).Ne.0._dp) Then
     Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
     Write(ErrCan,*) "Singular Matrix!"
     If (ErrorLevel.Gt.-2) Call TerminateProgram
    End If
   End Do
  !-----------------------------
  ! now the other cases
  !-----------------------------
  Else
   n=Size(b)
   a_reg(1:n,1:n) = Real(a,dp)
   a_reg(n+1:2*n,n+1:2*n) = a_reg(1:n,1:n)
   a_reg(1:n,n+1:2*n) = -Aimag(a)
   a_reg(n+1:2*n,1:n) = Aimag(a)
   b_in(1:n) = Real(b,dp)
   b_in(n+1:2*n) = Aimag(b)
   Call LuDcmp(a_reg, indx, d)
   Call lubksb(a_reg, indx, b_in)
   x = b_in(1:n) + (0._dp,1._dp) * b_in(n+1:2*n)
  End If

  Iname = Iname - 1

 End Subroutine SolveLinearEquations_c

 Subroutine SolveLinearEquations_r(A, b, x)
 !----------------------------------------------------------
 ! solves the linear system of equations: A.x = b for a given
 ! matrix A and vector b and the unknown vector x
 ! written by Werner Porod, 13.03.03
 ! 19.03.03: adding a singular case that appears for the Yukaws
 !----------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: a(:,:), b(:)
  Real(dp), Intent(out) :: x(:)

  Integer :: indx(Size(x)), n, i1, i2
  Real(dp) :: d, a_reg(Size(x),Size(x)), test

  Iname = Iname + 1
  NameOfUnit(Iname) = "SolveLinearEquations_r"

  !----------------------------------------------------------------
  ! first sorting out a singular case appearing inside the program
  ! however, the solution is known in this case
  !----------------------------------------------------------------
  n = Size(x)
  test = 0._dp
  Do i1=1,n
   Do i2=1,n
    If (i1.Ne.i2) test = test + Abs( a(i1,i2) )
   End Do
  End Do

  If (test.Eq.0._dp) Then ! at most the diagonal entries are non-zero
   Do i1=1,n
    x(i1) = 0._dp
    If ( (a(i1,i1).Ne.0._dp) .And. (b(i1).Ne.0._dp ) ) Then
     x(i1) = b(i1) / a(i1,i1)
    Else If (b(i1).Ne.0._dp) Then
     Write(ErrCan,*) "Error in routine "//NameOfUnit(Iname)
     Write(ErrCan,*) "Singular Matrix!"
     If (ErrorLevel.Gt.-2) Call TerminateProgram
    End If
   End Do
  !-----------------------------
  ! now the other cases
  !-----------------------------
  Else
   a_reg = a
   Call LuDcmp(a_reg, indx, d)
   x = b
   Call lubksb(a_reg, indx, x)
  End If

  Iname = Iname - 1

 End Subroutine SolveLinearEquations_r

 Subroutine tqli(kont,d,e,z)

 Implicit None
  Integer, Intent(inout) :: kont
  Real(dp), Dimension(:), Intent(INOUT) :: d,e
  Real(dp), Dimension(:,:), Optional, Intent(INOUT) :: z
  Integer :: i,iter,l,m,n,ndum
  Real(dp) :: b,c,dd,f,g,p,r,s
  Real(dp), Dimension(Size(e)) :: ff

  n = Size(d)
  kont = 0
  If (n.Ne.Size(e)) Then
   Write(ErrCan,*) "Error in tqli",n,Size(e)
   If (ErrorLevel.Gt.-2) Call TerminateProgram
   kont = -17
   Call AddError(17)
  End If

  If (Present(z)) Then
   ndum = n
   If ((n.Ne.Size(z,dim=1)).Or.(n.Ne.Size(z,dim=2)) ) Then
    Write(ErrCan,*) "Error in tqli",n,Size(z,dim=1),Size(z,dim=2)
    If (ErrorLevel.Gt.-2) Call TerminateProgram
    kont = -17
    Call AddError(17)
   End If
  End If

  e(:)=Eoshift(e(:),1)

  Do l=1,n
    iter=0
    iterate: Do
      Do m=l,n-1
        dd=Abs(d(m))+Abs(d(m+1))
        If (Abs(e(m))+dd == dd) Exit
      End Do
      If (m == l) Exit iterate
      If (iter == 30) Then
       Write(ErrCan,*) "Problem in tqli, too many iterations"
       kont = -18
       Call AddError(18)
       Return
      End If
      iter=iter+1
      g=(d(l+1)-d(l))/(2.0_dp*e(l))
      r=pythag(g,1.0_dp)
      g=d(m)-d(l)+e(l)/(g+Sign(r,g))
      s=1.0_dp
      c=1.0_dp
      p=0.0_dp
      Do i=m-1,l,-1
        f=s*e(i)
        b=c*e(i)
        r=pythag(f,g)
        e(i+1)=r
        If (r == 0.0_dp) Then
          d(i+1)=d(i+1)-p
          e(m)=0.0_dp
          Cycle iterate
        End If
        s=f/r
        c=g/r
        g=d(i+1)-p
        r=(d(i)-g)*s+2.0_dp*c*b
        p=s*r
        d(i+1)=g+p
        g=c*r-b
        If (Present(z)) Then
          ff(1:n)=z(1:n,i+1)
          z(1:n,i+1)=s*z(1:n,i)+c*ff(1:n)
          z(1:n,i)=c*z(1:n,i)-s*ff(1:n)
        End If
      End Do
      d(l)=d(l)-p
      e(l)=g
      e(m)=0.0_dp
    End Do iterate
  End Do

 End Subroutine tqli

 Subroutine tred2A(a,d,e,novectors)

 Implicit None
  Real(dp), Dimension(:,:), Intent(INOUT) :: a
  Real(dp), Dimension(:), Intent(OUT) :: d, e
  Logical, Optional, Intent(IN) :: novectors

  Integer :: i, j, l, n
  Real(dp) :: f, g, h, hh, scale
  Real(dp), Dimension(Size(a,1)) :: gg
  Logical, Save :: yesvec=.True.

  n = Size(a,1)

  If ((n.Ne.Size(a,2)).Or.(n.Ne.Size(d)).Or.(n.Ne.Size(e)) ) Then
   Write(ErrCan,*) "Error in tred2",n,Size(a,2),Size(d),Size(e)
   If (ErrorLevel.Gt.-2) Call TerminateProgram
  End If

  If (Present(novectors)) yesvec=.Not. novectors

  Do i=n,2,-1
    l=i-1
    h=0.0_dp
    If (l > 1) Then
      scale=Sum(Abs(a(i,1:l)))
      If (scale == 0._dp) Then
        e(i)=a(i,l)
      Else
        a(i,1:l)=a(i,1:l)/scale
        h=Sum(a(i,1:l)**2)
        f=a(i,l)
        g=-Sign(Sqrt(h),f)
        e(i)=scale*g
        h=h-f*g
        a(i,l)=f-g
        If (yesvec) a(1:l,i)=a(i,1:l)/h
        Do j=1,l
          e(j)=(Dot_product(a(j,1:j),a(i,1:j)) &
          +Dot_product(a(j+1:l,j),a(i,j+1:l)))/h
        End Do
        f=Dot_product(e(1:l),a(i,1:l))
        hh=f/(h+h)
        e(1:l)=e(1:l)-hh*a(i,1:l)
        Do j=1,l
          a(j,1:j)=a(j,1:j)-a(i,j)*e(1:j)-e(j)*a(i,1:j)
        End Do
      End If
    Else
      e(i)=a(i,l)
    End If
    d(i)=h
  End Do

  If (yesvec) d(1)=0.0_dp
  e(1)=0.0_dp
  Do i=1,n
    If (yesvec) Then
      l=i-1
      If (d(i) /= 0.0_dp) Then
        gg(1:l)=Matmul(a(i,1:l),a(1:l,1:l))
        a(1:l,1:l)=a(1:l,1:l)-outerprod(a(1:l,i),gg(1:l))
      End If
      d(i)=a(i,i)
      a(i,i)=1.0_dp
      If (i.Gt.1) Then
       a(i,1:l)=0.0_dp
       a(1:l,i)=0.0_dp
      End If
    Else
      d(i)=a(i,i)
    End If
  End Do

 End Subroutine tred2A

 Subroutine UnitMatrix_C(n, mat)
 Implicit None
  Integer, Intent(in) :: n
  Complex(dp), Intent(out) :: mat(n,n)

  Integer :: i1
  
  mat = 0._dp
  Do i1=1,n
   mat(i1,i1) = 1._dp
  End Do
 End Subroutine UnitMatrix_C

 Subroutine UnitMatrix_R(n, mat)
 Implicit None
  Integer, Intent(in) :: n
  Real(dp), Intent(out) :: mat(n,n)

  Integer :: i1
  
  mat = 0._dp
  Do i1=1,n
   mat(i1,i1) = 1._dp
  End Do
 End Subroutine UnitMatrix_R

 Subroutine Vegas1(region,func,init,ncall,itmx,nprn,acc,tgral,sd,chi2a)
 !--------------------------------------------------------------------
 ! Monte Carlo Integration, source code as given in Numerical Recipies
 ! for F90, page 1161
 ! this version has been written by Werner Porod, 16.1.01
 ! 12.08.01: changing it according to the version I have got from
 !           Claus Bloechinger (f77-file seleklib.f)
 !--------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(IN) :: acc
  Real(dp), Dimension(:), Intent(IN) :: region
  Integer, Intent(IN) :: init, ncall, itmx, nprn
  Real(dp), Intent(Out) :: tgral
  Real(dp), Optional, Intent(Inout) :: sd, chi2a

  Interface
   Function func(pt,wgt)
   Use Control
   Implicit None
   Real(dp) :: func
   Real(dp), Dimension(:), Intent(IN) :: pt
   Real(dp), Intent(IN) :: wgt
   End Function func
  End Interface

  Real(dp), Parameter :: ALPH = 1.5_dp, TINY = 1.0e-30_dp
  Integer, Parameter :: MXDIM = 10, NDMX = 50
  Integer, Save :: i, it, j, k, mds, nd, ndim, ndo, ng, npg
  Integer, Dimension(MXDIM), Save :: ia, kg
  Integer :: nxi(50,10)
  Real(dp), Save :: calls, dv2g, dxg, f, f2, f2b, fb, rc, ti, tsi, wgt, &
                  & xjac, xn, xnd, xo, harvest, ti2
  Real(dp), Dimension(NDMX,MXDIM), Save :: d, di, xi
  Real(dp), Dimension(MXDIM), Save :: dt, dx, x
  Real(dp), Dimension(NDMX), Save :: r, xin
  Real(dp), Save :: schi, si, si2, swgt 

  If (.Not.Present(sd)) sd = 0
  If (.Not.Present(chi2a)) chi2a = 0
 
  ndim = Size(region)/2
  !-------------------------------------------------------------------
  ! Normal entry, enter here on a cold start. Change mds=0 to disable
  ! stratisfied sampling, i.e., use importance sampling only
  !-------------------------------------------------------------------
  If (init <=  0) Then
   mds = 1
   ndo = 1
   xi(1,:) = 1._dp
  End If
  !----------------------------------------------------------------
  ! Enter here to inherit the previous grids, but not its answers
  !----------------------------------------------------------------
  If (init <=  1) Then
   si = 0._dp
   si2 = 0._dp
   swgt = 0._dp
   schi = 0._dp
  End If
  !-----------------------------------------------------------
  ! Enter here to inherit the previous grids and its answers
  !-----------------------------------------------------------
  If (init <=  2) Then
   nd = NDMX
   ng = 1
   If (mds /=  0) Then
    ng = (ncall/2.0_dp+0.25_dp)**(1.0_dp/ndim)
    mds = 1
    If ((2*ng-NDMX) >=  0) Then
     mds = -1
     npg = ng/NDMX+1
     nd = ng/npg
     ng = npg*nd
    End If
   End If
   k = ng**ndim
   npg = Max(ncall/k,2)
   calls = Real(npg,dp)*Real(k,dp)
   dxg = 1.0_dp/ng
   dv2g = (dxg**ndim)**2/npg/npg/(npg-1.0_dp)
   xnd = nd
   dxg = dxg*xnd
   dx(1:ndim) = region(1+ndim:2*ndim)-region(1:ndim)
   xjac = Product(dx(1:ndim))

   If (nd /=  ndo) Then         ! do binning if necessary
    r(1:Max(nd,ndo)) = 1._dp
    Do j = 1,ndim
     Call rebin(ndo/xnd,nd,r,xin,xi(:,j))
    End Do
    ndo = nd
   End If

   If (nprn >=  0) Write(*,200) ndim,calls,it,itmx,nprn,ALPH,mds,nd,   &
                            & (j,region(j),j,region(j+ndim),j = 1,ndim)
  End If
  !----------------------------------
  ! Main iteration loop, can enter here (init>= 3) to do an additional
  ! itmx iteration with all other parameters unchanged
  !----------------------------------
  Do it = 1,itmx
   ti = 0._dp
   tsi = 0._dp
   kg(:) = 1
   d(1:nd,:) = 0._dp
   di(1:nd,:) = 0._dp
   nxi = 0
   iterate: Do
    fb = 0.0
    f2b = 0.0
    Do k = 1,npg
     wgt = xjac
     Do j = 1,ndim
      Call Random_number(harvest)
      xn = (kg(j)-harvest)*dxg+1.0_dp
      ia(j) = Max(Min(Int(xn),NDMX),1)
      If (ia(j) > 1) Then
       xo = xi(ia(j),j)-xi(ia(j)-1,j)
       rc = xi(ia(j)-1,j)+(xn-ia(j))*xo
      Else
       xo = xi(ia(j),j)
       rc = (xn-ia(j))*xo
      End If
      x(j) = region(j)+rc*dx(j)
      wgt = wgt*xo*xnd
     End Do
     f = wgt*func(x(1:ndim),wgt)
     f2 = f*f
     fb = fb+f
     f2b = f2b+f2
     Do j = 1,ndim
      nxi(ia(j),j) = nxi(ia(j),j)+1
      di(ia(j),j) = di(ia(j),j)+f/calls
      If (mds >=  0) d(ia(j),j) = d(ia(j),j)+f2
     End Do
    End Do
    f2b = Sqrt(f2b*npg)
    f2b = (f2b-fb)*(f2b+fb)
    If (f2b <=  0.0) f2b = TINY
    ti = ti+fb
    tsi = tsi+f2b

    If (mds < 0) Then           ! use stratified sampling
     Do j = 1,ndim
      d(ia(j),j) = d(ia(j),j)+f2b
     End Do
    End If
    Do k = ndim,1,-1
     kg(k) = Mod(kg(k),ng)+1
     If (kg(k) /=  1) Cycle iterate
    End Do
    Exit iterate 
   End Do iterate
   !------------------------------------------
   ! Compute final result for this iteration
   !------------------------------------------
   ti = ti / calls
   ti2 = ti*ti
   tsi = tsi*dv2g
   wgt = ti2/tsi
   si = si+Real(wgt,dp)*Real(ti,dp)
   si2 = si2 + ti2
   schi = schi+Real(wgt,dp)*ti2
   swgt = swgt+Real(wgt,dp)
   tgral = si/swgt
   chi2a = Max((schi-si*tgral)/(it-0.99_dp),0.0_dp)
   sd = Sqrt( si2/(it*swgt) )
   If (nprn >=  0) Then
    tsi = Sqrt(tsi)
    Write(*,201) it,ti,tsi,tgral,sd,chi2a
    If (nprn /=  0) Then
     Do j = 1,ndim
      Write(*,202) j,(xi(i,j),di(i,j),&
       i = 1+nprn/2,nd,nprn)
     End Do
    End If
   End If
   !-------------------------------------------------------------
   ! refinde the grid, the refinement is damped, to avoid rapid,
   ! destabilizing changes, and also compressed in range by the
   ! exponent ALPH
   !-------------------------------------------------------------
   Do j=1,ndim
    dt(j) = 0._dp
    Do i=1,nd
     If (nxi(i,j).Gt.0) d(i,j) = d(i,j) / nxi(i,j)
     dt(j) = dt(j) + d(i,j)
    End Do
   End Do
   Where (d(1:nd,:) < TINY) d(1:nd,:) = TINY
   Do j = 1,ndim
    Do i =1,nd
!     Write(*,*) j,i,dt(j),d(i,j)
     xo = dt(j) / d(i,j)
     If (xo.Eq.1._dp) Then
      r(i) = 1._dp
     Else If (Abs(xo-1._dp).Lt.1.e-6_dp) Then
      r(i) = 1._dp - 0.5_dp * alph * (xo-1._dp)                    &
         & + alph * (7._dp/3._dp + alph) * (xo-1._dp)**2 / 8._dp   &
         & - alph * (5._dp + 3.5_dp * alph + 0.5_dp * alph**2)    &
         &        * (xo-1._dp)**3 / 24._dp
     Else
      r(i) = ((xo-1._dp)/xo/Log(xo))**alph
     End If
    End Do
    rc = Sum(r(1:nd))
    Call rebin(rc/xnd,nd,r,xin,xi(:,j))
   End Do
   If (Abs(acc).Lt.Abs(sd/tgral)) Exit
  End Do

 200 Format(/' input parameters for vegas:  ndim = ',i3,'  ncall = ',f8.0&
   /28x,'  it = ',i5,'  itmx = ',i5&
   /28x,'  nprn = ',i3,'  alph = ',f5.2/28x,'  mds = ',i3,'   nd = ',i4&
   /(30x,'xl(',i2,') =  ',g11.4,' xu(',i2,') =  ',g11.4))
 201 Format(/' iteration no.',I3,': ','integral  = ',g14.7,' +/- ',g9.2,&
   /' all iterations:   integral  = ',g14.7,' +/- ',g9.2,&
   ' chi**2/it''n  = ',g9.2)
 202 Format(/' data for axis ',I2/'    X       delta i       ',&
   '   x       delta i       ','    x       delta i       ',&
   /(1x,f7.5,1x,g11.4,5x,f7.5,1x,g11.4,5x,f7.5,1x,g11.4))

  Contains

   Subroutine Rebin(rc,nd,r,xin,xi)
   Implicit None
    Real(dp), Intent(IN) :: rc
    Integer, Intent(IN) :: nd
    Real(dp), Dimension(:), Intent(IN) :: r
    Real(dp), Dimension(:), Intent(OUT) :: xin
    Real(dp), Dimension(:), Intent(INOUT) :: xi

    Integer :: i,k
    Real(dp) :: dr,xn,xo   

    k = 0
    xo = 0._dp
    dr = 0._dp
    Do i = 1,nd-1
     Do
      If (rc <=  dr) Exit
      k = k+1
      dr = dr+r(k)
     End Do
     If (k > 1) xo = xi(k-1)
     xn = xi(k)
     dr = dr-rc
     xin(i) = xn-(xn-xo)*dr/r(k)
    End Do
    xi(1:nd-1) = xin(1:nd-1)
    xi(nd) = 1._dp

  End Subroutine rebin

 End Subroutine Vegas1

 Subroutine Vegas(region,func,init,ncall,itmx,nprn,tgral,sd,chi2a)
 !--------------------------------------------------------------------
 ! Monte Carlo Integration, source code as given in Numerical Recipies
 ! for F90, page 1161
 ! this version has been written by Werner Porod, 16.1.01
 !--------------------------------------------------------------------
 Implicit None
  Real(dp), Dimension(:), Intent(IN) :: region
  Integer, Intent(IN) :: init, ncall, itmx, nprn
  Real(dp), Intent(OUT) :: tgral, sd, chi2a

  Interface
   Function func(pt,wgt)
   Use Control
   Implicit None
   Real(dp) :: func
   Real(dp), Dimension(:), Intent(IN) :: pt
   Real(dp), Intent(IN) :: wgt
   End Function func
  End Interface

  Real(dp), Parameter :: ALPH = 1.5_dp, TINY = 1.0e-30_dp
  Integer, Parameter :: MXDIM = 10, NDMX = 50
  Integer, Save :: i, it, j, k, mds, nd, ndim, ndo, ng, npg
  Integer, Dimension(MXDIM), Save :: ia, kg
  Real(dp), Save :: calls, dv2g, dxg, f, f2, f2b, fb, rc, ti, tsi, wgt, &
                  & xjac, xn, xnd, xo, harvest
  Real(dp), Dimension(NDMX,MXDIM), Save :: d, di, xi
  Real(dp), Dimension(MXDIM), Save :: dt, dx, x
  Real(dp), Dimension(NDMX), Save :: r, xin
  Real(dp), Save :: schi, si, swgt 

  ndim = Size(region)/2
  !-------------------------------------------------------------------
  ! Normal entry, enter here on a cold start. Change mds00 to disable
  ! stratisfied sampling, i.e., use importance sampling only
  !-------------------------------------------------------------------
  If (init <=  0) Then
   mds = 1
   ndo = 1
   xi(1,:) = 1.0
  End If
  !----------------------------------------------------------------
  ! Enter here to inherit the previous grids, but not its answers
  !----------------------------------------------------------------
  If (init <=  1) Then
   si = 0.0
   swgt = 0.0
   schi = 0.0
  End If
  !-----------------------------------------------------------
  ! Enter here to inherit the previous grids and its answers
  !-----------------------------------------------------------
  If (init <=  2) Then
   nd = NDMX
   ng = 1
   If (mds /=  0) Then
    ng = (ncall/2.0_dp+0.25_dp)**(1.0_dp/ndim)
    mds = 1
    If ((2*ng-NDMX) >=  0) Then
     mds = -1
     npg = ng/NDMX+1
     nd = ng/npg
     ng = npg*nd
    End If
   End If
   k = ng**ndim
   npg = Max(ncall/k,2)
   calls = Real(npg,dp)*Real(k,dp)
   dxg = 1.0_dp/ng
   dv2g = (calls*dxg**ndim)**2/npg/npg/(npg-1.0_dp)
   xnd = nd
   dxg = dxg*xnd
   dx(1:ndim) = region(1+ndim:2*ndim)-region(1:ndim)
   xjac = 1.0_dp/calls*Product(dx(1:ndim))

   If (nd /=  ndo) Then         ! do binning if necessary
    r(1:Max(nd,ndo)) = 1.0
    Do j = 1,ndim
     Call rebin(ndo/xnd,nd,r,xin,xi(:,j))
    End Do
    ndo = nd
   End If

   If (nprn >=  0) Write(*,200) ndim,calls,it,itmx,nprn,ALPH,mds,nd,   &
                            & (j,region(j),j,region(j+ndim),j = 1,ndim)
  End If
  !----------------------------------
  ! Main iteration loop, can enter here (init>= 3) to do an additional
  ! itmx iteration with all other parameters unchanged
  !----------------------------------
  Do it = 1,itmx
   ti = 0.0
   tsi = 0.0
   kg(:) = 1
   d(1:nd,:) = 0.0
   di(1:nd,:) = 0.0
   iterate: Do
    fb = 0.0
    f2b = 0.0
    Do k = 1,npg
     wgt = xjac
     Do j = 1,ndim
      Call Random_number(harvest)
      xn = (kg(j)-harvest)*dxg+1.0_dp
      ia(j) = Max(Min(Int(xn),NDMX),1)
      If (ia(j) > 1) Then
       xo = xi(ia(j),j)-xi(ia(j)-1,j)
       rc = xi(ia(j)-1,j)+(xn-ia(j))*xo
      Else
       xo = xi(ia(j),j)
       rc = (xn-ia(j))*xo
      End If
      x(j) = region(j)+rc*dx(j)
      wgt = wgt*xo*xnd
     End Do
     f = wgt*func(x(1:ndim),wgt)
     f2 = f*f
     fb = fb+f
     f2b = f2b+f2
     Do j = 1,ndim
      di(ia(j),j) = di(ia(j),j)+f
      If (mds >=  0) d(ia(j),j) = d(ia(j),j)+f2
     End Do
    End Do
    f2b = Sqrt(f2b*npg)
    f2b = (f2b-fb)*(f2b+fb)
    If (f2b <=  0.0_dp) f2b = TINY
    ti = ti+fb
    tsi = tsi+f2b

    If (mds < 0) Then           ! use stratified sampling
     Do j = 1,ndim
      d(ia(j),j) = d(ia(j),j)+f2b
     End Do
    End If
    Do k = ndim,1,-1
     kg(k) = Mod(kg(k),ng)+1
     If (kg(k) /=  1) Cycle iterate
    End Do
    Exit iterate
   End Do iterate
   !------------------------------------------
   ! Compute final result for this iteration
   !------------------------------------------
   tsi = tsi*dv2g
   wgt = 1.0_dp/tsi
   si = si+Real(wgt,dp)*Real(ti,dp)
   schi = schi+Real(wgt,dp)*Real(ti,dp)**2
   swgt = swgt+Real(wgt,dp)
   tgral = si/swgt
   chi2a = Max((schi-si*tgral)/(it-0.99_dp),0.0_dp)
   sd = Sqrt(1.0_dp/swgt)
   tsi = Sqrt(tsi)
   If (nprn >=  0) Then
    Write(*,201) it,ti,tsi,tgral,sd,chi2a
    If (nprn /=  0) Then
     Do j = 1,ndim
      Write(*,202) j,(xi(i,j),di(i,j),&
       i = 1+nprn/2,nd,nprn)
     End Do
    End If
   End If
   !-------------------------------------------------------------
   ! refinde the grid, the refinement is damped, to avoid rapid,
   ! destabilizing changes, and also compressed in range by the
   ! exponent ALPH
   !-------------------------------------------------------------
   Do j = 1,ndim
    xo = d(1,j)
    xn = d(2,j)
    d(1,j) = (xo+xn)/2.0_dp
    dt(j) = d(1,j)
    Do i = 2,nd-1
     rc = xo+xn
     xo = xn
     xn = d(i+1,j)
     d(i,j) = (rc+xn)/3.0_dp
     dt(j) = dt(j)+d(i,j)
    End Do
    d(nd,j) = (xo+xn)/2.0_dp
    dt(j) = dt(j)+d(nd,j)
   End Do
   Where (d(1:nd,:) < TINY) d(1:nd,:) = TINY
   Do j = 1,ndim
    r(1:nd) = ((1.0_dp-d(1:nd,j)/dt(j))/(Log(dt(j))-Log(d(1:nd,j))))**ALPH
    rc = Sum(r(1:nd))
    Call rebin(rc/xnd,nd,r,xin,xi(:,j))
   End Do
  End Do

 200 Format(/' input parameters for vegas:  ndim = ',i3,'  ncall = ',f8.0&
   /28x,'  it = ',i5,'  itmx = ',i5&
   /28x,'  nprn = ',i3,'  alph = ',f5.2/28x,'  mds = ',i3,'   nd = ',i4&
   /(30x,'xl(',i2,') =  ',g11.4,' xu(',i2,') =  ',g11.4))
 201 Format(/' iteration no.',I3,': ','integral  = ',g14.7,' +/- ',g9.2,&
   /' all iterations:   integral  = ',g14.7,' +/- ',g9.2,&
   ' chi**2/it''n  = ',g9.2)
 202 Format(/' data for axis ',I2/'    X       delta i       ',&
   '   x       delta i       ','    x       delta i       ',&
   /(1x,f7.5,1x,g11.4,5x,f7.5,1x,g11.4,5x,f7.5,1x,g11.4))

  Contains

   Subroutine Rebin(rc,nd,r,xin,xi)
   Implicit None
    Real(dp), Intent(IN) :: rc
    Integer, Intent(IN) :: nd
    Real(dp), Dimension(:), Intent(IN) :: r
    Real(dp), Dimension(:), Intent(OUT) :: xin
    Real(dp), Dimension(:), Intent(INOUT) :: xi

    Integer :: i,k
    Real(dp) :: dr,xn,xo   

    k = 0
    xo = 0.0
    dr = 0.0
    Do i = 1,nd-1
     Do
      If (rc <=  dr) Exit
      k = k+1
      dr = dr+r(k)
     End Do
     If (k > 1) xo = xi(k-1)
     xn = xi(k)
     dr = dr-rc
     xin(i) = xn-(xn-xo)*dr/r(k)
    End Do
    xi(1:nd-1) = xin(1:nd-1)
    xi(nd) = 1.0

  End Subroutine rebin

 End Subroutine Vegas

End Module Mathematics


