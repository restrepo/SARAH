Complex(dp) :: cL, cR, br, br_SM, cL_SM, cR_SM, norm
Real(dp) :: f_mq, tf_mq, kappa_0, kappa_c, f_mc, BrBXeNu, sw2, mq
Real(dp) :: prefactor, factor1, factor2, GF
Integer :: out, i1, i2 

! ---------------------------------------------------------------- 
! \bar{B} -> X_{d,s} nu nu
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on C. Bobeth et al, NPB 630 (2002) 87 [hep-ph/0112305] 
! ---------------------------------------------------------------- 

kappa_0 = 0.830_dp
kappa_c = 0.88_dp
f_mc = 0.53_dp
BrBXeNu = 0.101_dp ! PDG central value

sw2 = sinw2_160
GF = (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp

Do out = 1,2
If (out.eq.1) Then ! B -> X_d nu nu
 mq = mf_d(1)/mf_d(3)
 norm = Alpha_160*4._dp*GF/sqrt2/(2._dp*pi*sinw2_160)* &
             & Conjg(CKM_160(3,3)*Conjg( CKM_160(3,1) ))
Else ! B -> X_s nu nu
 mq = mf_d(2)/mf_d(3)
 norm = Alpha_160*4._dp*GF/sqrt2/(2._dp*pi*sinw2_160)* &
             & Conjg(CKM_160(3,3)*Conjg( CKM_160(3,2) ))
End if 

! f and tilde f functions
f_mq = 1._dp - 8._dp*mq**2 + 8._dp*mq**6 - &
            & mq**8 -24._dp*mq**4*Log(mq)
tf_mq = 1._dp + 9._dp*mq**2 - 9._dp*mq**4 - mq**6 + &
            & 12._dp*mq**2*(1._dp + mq**2)*Log(mq)

prefactor =  Alpha_mz**2/(4._dp*pi**2*sw2**2)*Abs(CKM_160(3,3)/ &
               & CKM_160(2,3))**2*BrBXeNu/(f_mc*kappa_c)*kappa_0
factor1 = f_mq
factor2 = - 4._dp*mq*tf_mq

br = 0._dp
br_SM = 0._dp

 Do i1= 1,3
  Do i2 = 1,3

   ! BSM
   cL = OddvvVLL(3,out,i1,i2)/norm
   cR = OddvvVRL(3,out,i1,i2)/norm
   br = br + factor1*(Abs(cL)**2 + Abs(cR)**2) +    &
               &  factor2*Real(cL*Conjg(cR),dp)

   ! SM
   cL = OddvvVLLSM(3,out,i1,i2)/norm
   cR = OddvvVRLSM(3,out,i1,i2)/norm
   br_SM = br_SM + factor1*(Abs(cL)**2 + Abs(cR)**2) + &
            & factor2*Real(cL*Conjg(cR),dp)

  End Do
 End do
If (out.eq.1) Then ! B -> X_d nu nu
  BrBtoDnunu = prefactor*br*Abs(CKM_160(3,1))**2 
  ratioBtoDnunu = br/br_SM
Else ! B -> X_s nu nu
  BrBtoSnunu = prefactor*br*Abs(CKM_160(3,2))**2  
  ratioBtoSnunu = br/br_SM
End if 
End Do
