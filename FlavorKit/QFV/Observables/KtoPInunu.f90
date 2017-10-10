Complex(dp) :: br, r1, r2, rKp, rKl, Xx, XNL, Lt, Lc
Complex(dp) :: Xx_SM, br_SM, norm
Real(dp) :: GF
Integer :: out, i1, i2 

! ---------------------------------------------------------------- 
! K -> pi nu nu
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on C. Bobeth et al, NPB 630 (2002) 87 [hep-ph/0112305] 
! ---------------------------------------------------------------- 

GF = (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp
norm = Alpha_160*4._dp*GF/sqrt2/(2._dp*pi*sinw2_160) &
          & *Conjg(CKM_160(3,2))*CKM_160(3,1)

r1 = 1.17E-4_dp
r2 = 0.24_dp
rKp =  0.901
rKl = 0.944

! SM NLO charm correction
! See G. Buchalla and A. Buras, NPB 412 (1994) 106 and NPB 548 (1999) 309
XNL = 9.78E-4_dp

! out = 1 : K^+ -> pi^+ nu nu
! out = 2 : K_L -> pi^0 nu nu

Do out = 1,2
br = 0._dp
br_SM = 0._dp
 Do i1= 1,3
  Do i2 = 1,3
   Xx = ((OddvvVLL(2,1,i1,i2)+OddvvVRL(2,1,i1,i2))/norm) 
   Xx_SM = ((OddvvVLLSM(2,1,i1,i2)+OddvvVRLSM(2,1,i1,i2))/norm) 
   Lt = Conjg(CKM_160(3,2))*CKM_160(3,1)
   Lc = Conjg(CKM_160(2,2))*CKM_160(2,1)
   If (out.eq.1) Then 
     br = br + Aimag(Xx*Lt)**2 + (Real(Lc*XNL,dp) + Real(Xx*Lt,dp))**2
     br_SM = br_SM + Aimag(Xx_SM*Lt)**2 + &
                 & (Real(Lc*XNL,dp) + Real(Xx_SM*Lt,dp))**2
   Else
    br = br + Abs(Aimag(Xx*Lt))**2
    br_SM = br_SM + Abs(Aimag(Xx_SM*Lt))**2
   End if   
  End Do
 End do
If (out.eq.1) Then ! K^+ -> pi^+ nu nu
 BrKptoPipnunu = 2._dp*r1*r2*rKp*br
 RatioKptoPipnunu = br/br_SM
 ! SM expectation: (7.2 +/- 2.1)*10^-11 (hep-ph/0112135)
Else ! K_L -> pi^0 nu nu
 BrKltoPinunu = 2._dp*r1*rKl*br
 RatioKltoPinunu = br/br_SM
 ! SM expectation: (3.1 +/- 1.0)*10^-11 (hep-ph/0408142)
End if 
End Do
