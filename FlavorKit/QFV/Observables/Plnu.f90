Integer :: gt1, gt2, i1, i2, iP
Complex(dp) :: br, br_SM
Real(dp) :: m_M, f_M, tau_M, mlep, mq1, mq2, hbar, ratio, &
     & BrKenuSM, BRKenu, QED

! ---------------------------------------------------------------- 
! P -> l nu
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on J. Barranco et al, arXiv:1303.3896
! ---------------------------------------------------------------- 

hbar = 6.58211889e-25_dp

! Electromagnetic correction to R_K
! See V. Cirigliano, I. Rosell, PRL 99 (2007) 231801 [arXiv:0707.3439]
QED = -3.6e-2_dp

! meson parameters

Do iP=1,4
If (iP.eq.1) Then ! Ds-meson
 gt1 = 2
 gt2 = 2
 m_M = mass_Dsp
 f_M = f_DSp_CONST
 tau_M = tau_DSp/hbar
Elseif (iP.eq.2) Then ! B-meson
 gt1 = 3
 gt2 = 1
 m_M = mass_Bp
 f_M = f_Bp_CONST
 tau_M = tau_Bp/hbar
Elseif (iP.eq.3) Then ! Kaon
 gt1 = 2
 gt2 = 1
 m_M = mass_Kp
 f_M =  f_Kp_CONST
 tau_M = tau_Kp/hbar
Elseif (iP.eq.4) Then ! D-meson
 gt1 = 1
 gt2 = 2
 m_M = mass_Dp
 f_M =  f_Dp_CONST
 tau_M = tau_Dp/hbar
End if

 mq1 =  mf_u_160(gt2)
 mq2 =  mf_d_160(gt1)

Do i1=1,3
br = 0._dp
br_SM = 0._dp
mlep = mf_l(i1)

Do i2=1,3
 br = br + Abs((OdulvVLL(gt1,gt2,i1,i2)-OdulvVLR(gt1,gt2,i1,i2))*mlep/   &
                   &           (2._dp*sqrt2)                          &
   & + m_M**2*(OdulvSRL(gt1,gt2,i1,i2)-OdulvSLL(gt1,gt2,i1,i2))/      &
                   & (2._dp*sqrt2*(mq1+mq2)))**2
 br_SM = br_SM+ Abs((OdulvVLLSM(gt1,gt2,i1,i2)-OdulvVLRSM(gt1,gt2,i1,i2)) &
                   & *mlep/(2._dp*sqrt2))**2
End Do

ratio = Abs(br/br_SM) 
br = oo8pi*tau_M*(f_M)**2*M_M*Abs(br)*(1._dp - mlep**2/M_M**2)**2 ! G_F already in coefficients included


If (iP.eq.1) Then  !! Ds-meson 
 If (i1.eq.2) Then  ! Ds->mu nu
  BrDsmunu =   br
  ratioDsmunu = ratio
  Elseif (i1.eq.3) Then ! Ds->tau nu
  BrDstaunu =  br
  ratioDstaunu = ratio
 End if
Elseif (iP.eq.2) Then !! B-meson
 If (i1.eq.2) Then  ! B->mu nu
  BrBmunu =   br
  ratioBmunu = ratio
  Else              ! B->tau nu
  BrBtaunu =  br
  ratioBtaunu = ratio
 End if
Else If (iP.eq.3) Then !! Kaon 
 If (i1.eq.1) Then  ! K->e nu
  BrKenu =   br
  BrKenuSM = BrKenu*ratio
  Elseif (i1.eq.2) Then  ! K->mu nu
  BrKmunu =  br
  ratioKmunu = ratio
  RK = BrKenu/BrKmunu*(1+QED)
  RKSM = BrKenuSM/BrKmunu*ratio*(1+QED)
 End if
Else If (iP.eq.4) Then  !! D-meson 
 If (i1.eq.2) Then  ! D->mu nu
  BrDmunu =   br
  ratioDmunu = ratio
 End if
End if
End Do
End Do
