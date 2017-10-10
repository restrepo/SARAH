Real(dp) :: Fpi, thetaEta, mPi, mK, mEta, mEtap, meson_abs_T2, cont, &
     & mP, CP, factor, BR
Complex(dp) :: BSLL, BSLR, BSRL, BSRR, BVLL, BVLR, BVRL, BVRR, &
     & CSLL, CSLR, CSRL, CSRR, CVLL, CVLR, CVRL, CVRR, aP(2), bP(2), &
     & DLdP, DRdP, DLuP, DRuP
Integer :: i1, i2, out, k1, k2

! ---------------------------------------------------------------- 
! tau -> l meson
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Generalizes the analytical expressions in
! E. Arganda et al, JHEP 0806 (2008) 079 [arXiv:0803.2039]
! ---------------------------------------------------------------- 

Fpi=0.0924_dp! Pion decay constant in GeV 
thetaEta=-Pi/10._dp! eta-eta' mixing angle 
mPi=0.13497_dp! Pion mass in GeV 
mK=0.49761_dp! Kaon mass in GeV 
mEta=0.548_dp! Eta mass in GeV 
mEtap=0.958_dp! Eta' mass in GeV 

!Mesons:
!1:Pi0 
!2:Eta 
!3:Eta' 
Do i1=1,3 
   If(i1.eq.1) Then !1:Pi0 
      mP = mPi 
      CP = 1._dp 
      DLdP = - mPi**2/4._dp
      DRdP = - Conjg(DLdP)
      DLuP = mPi**2/4._dp
      DRuP = - Conjg(DLuP)
   Else If(i1.eq.2) Then !2:Eta 
      mP = mEta 
      CP = (Sin(thetaEta)+Sqrt(2._dp)*Cos(thetaEta))/Sqrt(6._dp) 
      DLdP = 1._dp/(4._dp*Sqrt(3._dp))*((3._dp*mPi**2-4._dp*mK**2) &
        & *Cos(thetaEta)-2._dp*Sqrt(2._dp)*mK**2*Sin(thetaEta))
      DRdP = - Conjg(DLdP)
      DLuP = 1._dp/(4._dp*Sqrt(3._dp))*mPi**2*(Cos(thetaEta)       &
        & -Sqrt(2._dp)*Sin(thetaEta))
      DRuP = - Conjg(DLuP)
   Else If(i1.eq.3) Then !3:Eta' 
      mP = mEtap 
      CP = (Sqrt(2._dp)*Sin(thetaEta)-Cos(thetaEta))/Sqrt(6._dp) 
      DLdP = 1._dp/(4._dp*Sqrt(3._dp))*((3._dp*mPi**2-4._dp*mK**2) & 
        & *Sin(thetaEta)+2._dp*Sqrt(2._dp)*mK**2*Cos(thetaEta))
      DRdP = - Conjg(DLdP)
      DLuP = 1._dp/(4._dp*Sqrt(3._dp))*mPi**2*(Sin(thetaEta)+      &
        & Sqrt(2._dp)*Cos(thetaEta))
      DRuP = - Conjg(DLuP)
   End If

!Leptons:
!1:e
!2:mu 
Do i2=1,2 
If (i2.eq.1) Then         ! tau -> e P
 out = 1
Elseif (i2.eq.2) Then     ! tau -> mu P
 out = 2
End if

! d-quark coefficients

BSLL = OllddSLL(3,out,1,1)
BSLR = OllddSLR(3,out,1,1)
BSRL = OllddSRL(3,out,1,1)
BSRR = OllddSRR(3,out,1,1)
BVLL = OllddVLL(3,out,1,1)
BVLR = OllddVLR(3,out,1,1)
BVRL = OllddVRL(3,out,1,1)
BVRR = OllddVRR(3,out,1,1)

! u-quark coefficients

CSLL = OlluuSLL(3,out,1,1)
CSLR = OlluuSLR(3,out,1,1)
CSRL = OlluuSRL(3,out,1,1)
CSRR = OlluuSRR(3,out,1,1)
CVLL = OlluuVLL(3,out,1,1)
CVLR = OlluuVLR(3,out,1,1)
CVRL = OlluuVRL(3,out,1,1)
CVRR = OlluuVRR(3,out,1,1)

! aP, bP scalar
aP(1) = Fpi/2._dp*(DLdP/mf_d(1)*(BSLL+BSRL) + DRdP/mf_d(1)*(BSLR+BSRR) &
         & + DLuP/mf_u(1)*(CSLL+CSRL) + DRuP/mf_u(1)*(CSLR+CSRR))
bP(1) = Fpi/2._dp*(DLdP/mf_d(1)*(BSRL-BSLL) + DRdP/mf_d(1)*(BSRR-BSLR) &
         & + DLuP/mf_u(1)*(CSRL-CSLL) + DRuP/mf_u(1)*(CSRR-CSLR))

! aP, bP vector
aP(2) = Fpi/4._dp*CP*(mf_l(3)-mf_l(out))*(-BVLL+BVLR-BVRL+BVRR+        &
         & CVLL-CVLR+CVRL-CVRR)
bP(2) = Fpi/4._dp*CP*(mf_l(3)+mf_l(out))*(-BVLL+BVLR+BVRL-BVRR+        &
         & CVLL-CVLR-CVRL+CVRR)

! averaged squared amplitude 
meson_abs_T2=0._dp 
Do k1=1,2 
   Do k2=1,2 
      cont=2._dp*mf_l(out)*mf_l(3)*(aP(k1)*conjg(aP(k2))               &
           & -bP(k1)*conjg(bP(k2)))+                                   & 
           & (mf_l(3)**2+mf_l(out)**2-mP**2)*(aP(k1)*conjg(aP(k2))+    &
           & bP(k1)*conjg(bP(k2))) 
      meson_abs_T2=meson_abs_T2+cont 
   End Do
End Do
meson_abs_T2=meson_abs_T2/(2._dp*mf_l(3)) 

! branching ratio 
factor=oo4pi*Sqrt(lamb(mf_l(3)**2,mf_l(out)**2,mP**2))                 &
            & /(mf_l(3)**2*GammaTau)*0.5_dp
BR=factor*meson_abs_T2
If (i1.eq.1) Then !pi
   If(i2.eq.1) Then 
      BrTautoEPi = BR
   Else
      BrTautoMuPi = BR
   End If
Elseif (i1.eq.2) Then !eta
   If(i2.eq.1) Then 
      BrTautoEEta = BR
   Else
      BrTautoMuEta = BR
   End If
Else !eta'
   If(i2.eq.1) Then 
      BrTautoEEtap = BR
   Else
      BrTautoMuEtap = BR
   End If
End if

End Do
End Do

Contains 

Real(dp) Function lamb(x,y,z) 
Real(dp),Intent(in)::x,y,z 
 lamb=(x+y-z)**2-4._dp*x*y 
End Function lamb 
