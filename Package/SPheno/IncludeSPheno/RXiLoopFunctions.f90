
  Complex(dp) Function FloopRXi(p2,m12,m22) 
   Implicit None 
   Real(dp),Intent(in)::p2,m12,m22 
    
   
    If (RXi.eq.1._dp) Then
       FloopRXi=Floop(p2,m12,m22)
    Else
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
          FloopRXi=A0(m12)-A0(m22)+((m12-p2)*A0(m22))/m22-&
               & ((m12-p2+m22*RXi)*A0(m22*RXi))/m22+(-m12+m22+p2)*b0(p2,m12,m22)-&
               & (m12-(m12-p2)**2/m22+3._dp*p2)*b0(p2,m12,m22)-((m12-p2)**2*b0(p2,m12,m22*RXi))/m22
       Else
          If (m12.gt.1.0E-10_dp) Then
              FloopRXi=A0(m12)-2._dp*(m12+p2)*B0(p2,0._dp,m12)
          Else If (m22.gt.1.0E-10_dp) Then
              FloopRXi=(-((m22+p2)*A0(m22))+(p2-m22*RXi)*A0(m22*RXi)+(m22-p2)**2*B0(p2,0._dp,m22)-p2**2*B0(p2,0._dp,m22*RXi))/m22
          Else
              FloopRXi=0._dp
          End if
       End if
    End if
     If (Real(FloopRXi,dp).ne.Real(FloopRXi,dp)) Write(*,*) "NaN in FloopRXi", p2,m12,m22
  End Function FloopRXi


  
  Complex(dp) Function SVVloop(p2,m12,m22)
    Implicit None

    Real(dp),Intent(in)::p2,m12,m22
    

    If (RXi.eq.1._dp) Then
	   
        SVVloop = 4._dp*Real(B0(p2,m12,m22)-0.5_dp*rMS,dp)
    Else If (RXi.lt.0.1_dp) Then
	If (m12.gt.1.0E-10_dp) Then
	    If (p2.gt.0.1_dp) Then
		SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
	    Else
	     If (m12.eq.m22) Then 
	        SVVloop = 0._dp
	     Else 
		SVVloop = (2._dp*rMS*(-m12+m22)+3._dp*A0(m12)-3._dp*A0(m22))/(m12-m22)
             End if
	    End if
        Else
	     If (p2.gt.0.1) Then
		SVVloop = (-8._dp*rMS*m22+A0(m22)+2._dp*p2*B0(p2,0._dp,0._dp)+2._dp*(5._dp*m22-p2)*B0(p2,0._dp,m22))/(4._dp*m22)
	    Else
		SVVloop = -2._dp*rMS + 3._dp*B0(0._dp,0._dp,m22)
	    End if
	End if
    Else
    
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-2._dp*rMS*m12+2._dp*rMS*m22+3._dp*A0(m12)-3._dp*A0(m22)+RXi*A0(m12*RXi)-RXi*A0(m22*RXi))/(m12-m22)
	  Else
	  
	   If (m12-m22.lt.1_dp) Then 
	     SVVloop=  (p2**2*(B0(p2,m12,m12) - 2*B0(p2,m12,m12*RXi) + B0(p2,m12*RXi,m12*RXi)) + &
     &  4*m12*p2*(-B0(p2,m12,m12) + (1 + RXi)*B0(p2,m12,m12*RXi) - RXi*B0(p2,m12*RXi,m12*RXi)) + &
     &  2*m12*((1 - RXi)*A0(m12) + (-1 + RXi)*A0(m12*RXi) - m12*(4*rMS - 6*B0(p2,m12,m12) + (-1 + RXi)**2*B0(p2,m12,m12*RXi) - 2*RXi**2*B0(p2,m12*RXi,m12*RXi))))/(4*m12**2)
	   Else 
	      SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
          End if
          End if 
       Else If ((m12.gt.1.0E-10_dp).and.(m22.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-8._dp*rMS*m22+(11._dp+RXi)*A0(m22)+(1._dp+3._dp*RXi)*A0(m22*RXi))/(4._dp*m22)
	  Else
	      SVVloop =  -2._dp*rMS+A0(m12)/(4._dp*m12)-(RXi*A0(m12))/(4._dp*m12)-A0(m12*RXi)/(4._dp*m12)+(RXi*A0(m12*RXi))/(4._dp*m12)&
              &+(5._dp*B0(p2,0._dp,m12))/2._dp-(p2*B0(p2,0._dp,m12))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12))/2._dp+(p2*RXi*B0(p2,0._dp,m12))/(2._dp*m12)& 
              &+(p2*B0(p2,0._dp,m12*RXi))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m12*RXi))/(2._dp*m12) + (RXi**2*B0(p2,0._dp,m12*RXi))/2._dp
          End if 
          
       Else If ((m22.gt.1.0E-10_dp).and.(m12.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = -2._dp*rMS + (1.0_dp*RXi)*B0(0._dp,0._dp,m22*RXi) + (3._dp)*B0(0._dp,0._dp,m22) !+ A0(m22)/m22
	  Else
	       SVVloop =  -2._dp*rMS+A0(m22)/(4._dp*m22)-(RXi*A0(m22))/(4._dp*m22)-A0(m22*RXi)/(4._dp*m22)+(RXi*A0(m22*RXi))/(4._dp*m22)&
              &+(5._dp*B0(p2,0._dp,m22))/2._dp-(p2*B0(p2,0._dp,m22))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22))/2._dp+(p2*RXi*B0(p2,0._dp,m22))/(2._dp*m22)& 
              &+(p2*B0(p2,0._dp,m22*RXi))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m22*RXi))/(2._dp*m22) + (RXi**2*B0(p2,0._dp,m22*RXi))/2._dp
          End if 
          
       End if
    End if
         If (Real(SVVloop,dp).ne.Real(SVVloop,dp)) Write(*,*) "NaN in SVVloop", p2,m12,m22
  End Function SVVloop

Complex(dp) Function VSSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

VSSloop=  -4._dp*B00(p2,m12,m22) 

! If (RXi.eq.1._dp) Then 
!   VSSloop=  -4._dp*B00(p2,m12,m22) 
! Else
!   If (p2.gt.0) Then 
!         VSSloop=   -(6*(m12 + m22)*(-1 + RXi) + (2*p2*(-p2 + 3*(m12 + m22)*RXi) + &
!       & 3*(p2 + (m12 - m22)*RXi)*A0(m12) + 3*(p2 - m12*RXi + m22*RXi)*A0(m22) - &
!       & 3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12,m22))/p2)/9._dp  &
!       &  + rMS*(2._dp/3._dp)*(m12 + m22)*(-1._dp + RXi)
!   Else ! to be added
!      VSSloop= 0._dp
!    End if
! End if
End Function VSSloop

Complex(dp) Function VVSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

If (RXi.eq.1._dp) Then 
  VVSloop=  B0(p2,m12,m22) 
Else
  ! VVSloop = B0(p2,m12,m22) - 0.25_dp*(B00(p2,m12,m22) + B00(p2,rxi*m12,m22))/m12  !! Mark
   VVSloop = B0(p2,m12,m22) + (-B00(p2,m12,m22) + B00(p2,m22,rxi*m12))/m12 !! FeynArts
End if

End Function VVSloop


Complex(dp) Function VVVloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 
Real(dp) :: b001

If (RXi.eq.1._dp) Then 
  VVVloop=   -2._dp*rMS*(m12 + m22 - p2/3._dp) + 10._dp*B00(p2,m12,m22) &
     & + (m12+m22+4._dp*p2)*B0(p2,m12,m22)+  A0(m12) + A0(m22)
Else
!   If ((m12.eq.m22).and.(m22.gt.0._dp)) Then 
!       b001 = (-A0(m22)+(p2+m12-m22)*B11(MZ2,m22,m22) + 2._dp*m22*B1(MZ2,m22,m22) - 1._dp/6._dp*(-p2 + 2._dp*m22+4._dp*m22))/8._dp
!       VVVloop =        ((m22*(96._dp*b001*MZ2 + 16._dp*m22*MZ2*rMS - 3._dp*m22**2*(-1._dp + 32._dp*rMS + RXi**2)) + 6._dp*m22*(4*MZ2 + m22*(-3._dp + 4._dp*RXi))*A0(m22) + 6._dp*m22*(-4._dp*MZ2 + m22*(4._dp + 3._dp*RXi))*A0(m22*RXi) +  &
!        &      24._dp*(7._dp*m22**2*MZ2*B0(MZ2,m22,m22) + m22**2*(m22 - 2._dp*MZ2 - 4._dp*MZ2*RXi + m22*RXi**2)*B0(MZ2,m22,m22*RXi) + 12._dp*m22**2*B00(MZ2,m22,m22) - 7._dp*m22*MZ2*B00(MZ2,m22,m22) +  &
!        &         MZ2**2*B00(MZ2,m22,m22) - m22**2*B00(MZ2,m22,m22*RXi) + 9._dp*m22*MZ2*B00(MZ2,m22,m22*RXi) - 2._dp*MZ2**2*B00(MZ2,m22,m22*RXi) - m22**2*RXi*B00(MZ2,m22,m22*RXi) +  &
!        &         MZ2**2*B00(MZ2,m22*RXi,m22*RXi) - 2._dp*m22**2*MZ2*b1(MZ2,m22,m22) - 4._dp*m22**2*MZ2*RXi*b1(MZ2,m22,m22*RXi) - 4._dp*m22*MZ2**2*b11(MZ2,m22,m22) + 4._dp*m22*MZ2**2*b11(MZ2,m22,m22*RXi))))/ &
!        &  (24._dp*m22**2)
!   Else      
    
  If ((p2.gt.0).and.(m12.gt.0_dp).and.(m22.gt.0._dp)) Then 
      VVVloop= ((m12*m22*p2*(-3*m12 - 3*m22 - 40*p2 - 12*(m12 + m22 - 4*p2)*RXi - 9*(m12 + m22)*RXi**2) +  &
     &      6*m22*(-m22**2 - 9*m22*p2 + m12*(-9*m22 + p2*(13 - 2*RXi)) + m12**2*(9 + RXi) + p2**2*(9 + RXi))*A0(m12) -  &
     &      6*m12*(m12**2 + 9*m12*(m22 + p2) - m22**2*(9 + RXi) - p2**2*(9 + RXi) + m22*p2*(-13 + 2*RXi))*A0(m22) +  &
     &      6*(m22*(m22**2 + m22*(9*p2 - m12*RXi) - p2*(-11*m12*RXi + p2*(9 + RXi)))*A0(m12*RXi) + m12*(m12**2 + 9*m12*p2 - 9*p2**2 - (m12*m22 - 11*m22*p2 + p2**2)*RXi)*A0(m22*RXi) -  &
     &         m12**4*B0(p2,m12,m22) - 8*m12**3*m22*B0(p2,m12,m22) + 18*m12**2*m22**2*B0(p2,m12,m22) - 8*m12*m22**3*B0(p2,m12,m22) - m22**4*B0(p2,m12,m22) - 8*m12**3*p2*B0(p2,m12,m22) + &  
     &         32*m12**2*m22*p2*B0(p2,m12,m22) + 32*m12*m22**2*p2*B0(p2,m12,m22) - 8*m22**3*p2*B0(p2,m12,m22) + 18*m12**2*p2**2*B0(p2,m12,m22) + 32*m12*m22*p2**2*B0(p2,m12,m22) +  &
     &         18*m22**2*p2**2*B0(p2,m12,m22) - 8*m12*p2**3*B0(p2,m12,m22) - 8*m22*p2**3*B0(p2,m12,m22) - p2**4*B0(p2,m12,m22) + m12**4*B0(p2,m12,m22*RXi) + 8*m12**3*p2*B0(p2,m12,m22*RXi) -  &
     &         18*m12**2*p2**2*B0(p2,m12,m22*RXi) + 8*m12*p2**3*B0(p2,m12,m22*RXi) + p2**4*B0(p2,m12,m22*RXi) - 2*m12**3*m22*RXi*B0(p2,m12,m22*RXi) + 2*m12**2*m22*p2*RXi*B0(p2,m12,m22*RXi) +  &
     &         2*m12*m22*p2**2*RXi*B0(p2,m12,m22*RXi) - 2*m22*p2**3*RXi*B0(p2,m12,m22*RXi) + m12**2*m22**2*RXi**2*B0(p2,m12,m22*RXi) - 2*m12*m22**2*p2*RXi**2*B0(p2,m12,m22*RXi) +  &
     &         m22**2*p2**2*RXi**2*B0(p2,m12,m22*RXi) + m22**4*B0(p2,m22,m12*RXi) + 8*m22**3*p2*B0(p2,m22,m12*RXi) - 18*m22**2*p2**2*B0(p2,m22,m12*RXi) + 8*m22*p2**3*B0(p2,m22,m12*RXi) +  &
     &         p2**4*B0(p2,m22,m12*RXi) - 2*m12*m22**3*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22**2*p2*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22*p2**2*RXi*B0(p2,m22,m12*RXi) - 2*m12*p2**3*RXi*B0(p2,m22,m12*RXi) +  &
     &         m12**2*m22**2*RXi**2*B0(p2,m22,m12*RXi) - 2*m12**2*m22*p2*RXi**2*B0(p2,m22,m12*RXi) + m12**2*p2**2*RXi**2*B0(p2,m22,m12*RXi) -  &
     &         p2**2*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi))))/(72.*m12*m22*p2) -2._dp*(rMS-1._dp)*(m12 + m22 - p2/3._dp)
  Else ! to be added
     Write(*,*) "Warning from VVVloop", p2,m12,m22
     VVVloop= 0._dp
   End if
! End if
End if
End Function VVVloop


Complex(dp) Function VGGloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 


If (RXi.eq.1._dp) Then 
  VGGloop=  B00(p2,m12,m22) 
Else
  VGGloop=  B00(p2,m12*RXi,m22*RXi) 

!   If (p2.gt.0) Then 
!       VGGloop=   -((2*p2*(p2 - 3*(m12 + m22)*RXi) - 3*(p2 + (m12 - m22)*RXi)*A0(m12*RXi)  &
!       & - 3*(p2 - m12*RXi + m22*RXi)*A0(m22*RXi) +  &
!     &       3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi)))/(36.*p2)
!   Else  ! to be added
!          Write(*,*) "Warning from VVSloop", p2,m12,m22
!      VGGloop= 0._dp
!    End if
End if
End Function VGGloop
