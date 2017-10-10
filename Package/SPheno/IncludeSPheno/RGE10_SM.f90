Subroutine RGE10_SMa(len,t,gy,f)
 !--------------------------------------------------------
 ! RGEs within the SM assuming the MSbar scheme
 ! 2-loop RGEs for e
 ! 4-loop RGEs for g_3
 ! 2-loop RGEs for lepton masses
 ! 4-loop QCD and 2-loop QED RGES for quark masses
 ! Assumption: the only threhold to be checked is m_b
 ! input: t = Log(Q^2)
 !        gy(i) ... i=1  -> e(Q)
 !                  i=2  -> g_3
 !                  i=3  -> m_e
 !                  i=4  -> m_mu
 !                  i=5  -> m_tau
 !                  i=6  -> m_u
 !                  i=7  -> m_c
 !                  i=8  -> m_d
 !                  i=9  -> m_s
 !                  i=10 -> m_b, is optional
 ! output:
 !   f = d(gy)/d(t)
 ! written by Werner Porod, 03.12.03
 !--------------------------------------------------------
 Implicit None

  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Integer :: i1
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2, q
  Real(dp), Parameter :: b_e1(2) = (/ 76._dp / 9._dp , 80._dp / 9._dp /)    &
       & , b_e2(2) = (/ 460._dp / 27._dp , 464._dp / 27._dp /)              & 
       & , b_e3(2) = (/ 160._dp / 9._dp , 176._dp / 9._dp  /)               & 
       & , b_g1(2) = (/ -25._dp / 3._dp, -23._dp/3._dp /)                   &
       & , b_g2(2) = (/ -154._dp / 3._dp, -116._dp/3._dp /)                 &
       & , b_g3(2) = (/ 20._dp / 3._dp, 22._dp/3._dp /)                     &
       & , b_g4(2) = (/ -21943._dp/54._dp, 9769._dp/54._dp /)               &
       & , b_g5(2) = (/ -4918247._dp/1458._dp-414140._dp*zeta3/81._dp       &
       &             , 598391._dp/1458._dp - 352864._dp*zeta3/81._dp /)     &
       & , g_el1(2) = (/ -6._dp, -6._dp /)                                  &
       & , g_el2(2) = (/ 353._dp / 9._dp,  373._dp / 9._dp /)               & 
       & , g_eu1(2) = (/ -8._dp/3._dp, -8._dp/3._dp /)                      &
       & , g_eu2(2) = (/ 1472._dp / 81._dp, 1552._dp / 81._dp/)             & 
       & , g_eu3(2) = (/ -32._dp / 9._dp,  -32._dp / 9._dp/)                & 
       & , g_ed1(2) = (/ -2._dp/3._dp, -2._dp/3._dp /)                      &
       & , g_ed2(2) = (/ 377._dp / 81._dp,  397._dp / 81._dp /)             & 
       & , g_ed3(2) = (/ -8._dp / 9._dp,  -8._dp / 9._dp /)                 & 
       & , g_q1(2) = (/ - 8._dp , -8._dp /)                                 &
       & , g_q2(2) = (/ -1052._dp / 9._dp ,  -1012._dp / 9._dp /)           &
       & , g_q3(2) = (/ -144674._dp/81._dp + 1280._dp * zeta3 / 3._dp       &
       &              , -128858._dp/81._dp + 1600._dp * zeta3 / 3._dp /)    &
       & , g_q4(2) = (/ -7330357._dp/243._dp + 51584._dp* zeta3/3._dp       &
       &                - 16000._dp*zeta4 / 3._dp + 11200._dp* zeta5 /9._dp &
       &             , -1911065._dp/81._dp + 618400._dp* zeta3/27._dp       &
       &                - 18400._dp*zeta4 / 3._dp - 25600._dp* zeta5 /9._dp  /)

       
  Iname = Iname + 1
  NameOfUnit(Iname) = 'RGE10_SMa'

  q = t

  If (len.Eq.9) Then ! check which beta function (anomalous dimension) to use
   i1 = 1
  Else If (len.Eq.10) Then
   i1 = 2
  Else
   Write(ErrCan,*) "Error in routine "//Trim(NameOfUnit(Iname))
   Write(ErrCan,*) "Length of the vector gy = ",len
   Call TerminateProgram
  End If

  g32 = gy(1)**2
  g34 = gy(1)**4
  g36 = gy(1)**6
  g38 = gy(1)**8
  e2 = gy(2)**2
  e4 = gy(2)**4
  g32e2 = g32 * e2 
 !--------
 ! g_3
 !--------
  f(1) = oo16pi2 * gy(1) * ( b_g1(i1)*g32                                     &
       &                   + oo16pi2 * ( b_g2(i1)*g34 + b_g3(i1)*g32e2        &
       &                               + oo16pi2 * ( b_g4(i1)*g36             &
       &                                           + oo16pi2 * b_g5(i1)*g38 )))
 !--------
 ! e
 !--------
  f(2) = oo16pi2 * gy(2) * ( b_e1(i1) * e2                                &
       &                   + oo16pi2 * (b_e2(i1) * e4 + b_e3(i1) * g32e2 ))
 !-----------------
 ! m_l, l=e,mu,tau
 !-----------------
  f(3:5) =  oo16pi2 * gy(3:5) * (g_el1(i1) * e2 + oo16pi2 *g_el2(i1) * e4)
 !---------
 ! m_u, m_c
 !---------
  f(6:7) = oo16pi2 * gy(6:7) * (g_eu1(i1) * e2 + g_q1(i1) * g32              &
         &                     + oo16pi2 * (g_eu2(i1)*e4 + g_eu3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))
 !---------------
 ! m_d, m_s, m_b
 !---------------
  f(8:len) = oo16pi2 * gy(8:len) * (g_ed1(i1) * e2 + g_q1(i1) * g32          &
         &                     + oo16pi2 * (g_ed2(i1)*e4 + g_ed3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))

  Iname = Iname - 1

 End Subroutine RGE10_SMa

Subroutine RGE11_SMa(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)

  If (nUp.lt.2.9_dp)  f(8) = 0._dp
  If (nDown.lt.2.9_dp)  f(12) = 0._dp

  f = oo16pi2*f


End Subroutine RGE11_SMa

Subroutine RGE11(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark, a1, a2, a3, nG
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 

  nG = 3._dp
  a1 = gy(12)
  a2 = gy(13)
  a3 = gy(14)


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)



!! running of alpha_i to calculate running sin(w2); equations by Steinhauser
  ! alpha_1
  f(12) = a1**2*(2._dp/5._dp + nG*16._dp/3._dp) + &
    & a1**2*oo4pi2*(18._dp/25._dp*a1 + 18._dp/5._dp*a2 + nG*(76._dp/15._dp*a1 + 12._dp/5._dp*a2 + 176._dp/15._dp*a3))

  ! alpha_2
  f(13) = a2**2*(-86._dp/3._dp + nG*16._dp/3._dp) + &
   & a2**2*oo4pi2*(6._dp/5._dp*a1 - 518._dp/3._dp*a2 + nG*(4._dp/3._dp + 196._dp/3._dp*a2 + 16._dp*a3))

  ! alpha_3
  f(14) = a3**2*(-44._dp + nG*16._dp/3._dp) + &
    & a3**2*oo4pi2*(-408._dp*a3 + nG*(22._dp/15._dp*a1 + 6._dp*a2 + 304._dp/3._dp*a3))

  f = oo16pi2*f


End Subroutine RGE11


Subroutine RGEAlphaS(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGEAlphaS

Subroutine RGETop(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(3) = gy(3)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGETop
