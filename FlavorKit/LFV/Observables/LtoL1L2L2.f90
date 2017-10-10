Complex(dp) :: cK1L, cK1R, cK2L, cK2R
Complex(dp) :: CSLL, CSRR, CSLR, CSRL, CVLL, &
                    & CVRR, CVLR, CVRL, CTLL, CTRR
Complex(dp) :: CSLLcross, CSRRcross, CSLRcross, CSRLcross, &
                    & CVLLcross, CVRRcross, CVLRcross, &
                    & CVRLcross, CTLLcross, CTRRcross
Real(dp) :: BRdipole, BRscalar, BRvector, BRtensor
Real(dp) :: BRmix1, BRmix2, BRmix3, BRmix4, GammaLFV
Real(dp) :: e2, e4
Integer :: i1, gt1, gt2, gt3, gt4

! ---------------------------------------------------------------- 
! l^- -> l1^- l2^- l2^+ and l^- -> l1^+ l2^- l2^- (with l1 != l2)
! Observable implemented by A. Vicente
! ---------------------------------------------------------------- 

e2 = (4._dp*Pi*Alpha_MZ)
e4 = e2**2

Do i1=1,4

If (i1.eq.1) Then ! tau- -> e- mu+ mu-
 gt1 = 3
 gt2 = 1
 gt3 = 2
 gt4 = 2
Else If (i1.eq.2) Then ! tau- -> mu- e+ e-
 gt1 = 3
 gt2 = 2
 gt3 = 1
 gt4 = 1
Else If (i1.eq.3) Then ! tau- -> e+ mu- mu-
 gt1 = 3
 gt2 = 2
 gt3 = 1
 gt4 = 2
Else ! tau- -> mu+ e- e-
 gt1 = 3
 gt2 = 1
 gt3 = 2
 gt4 = 1
End if

If(i1.eq.1.or.i1.eq.2) Then ! tau- -> l- l'+ l'-

   cK1L = K1L(gt1,gt2)
   cK1R = K1R(gt1,gt2)

   cK2L = K2L(gt1,gt2)
   cK2R = K2R(gt1,gt2)

   CSLL = O4lSLLcross(gt1,gt2,gt3,gt4)
   CSRR = O4lSRRcross(gt1,gt2,gt3,gt4)
   CSLR = O4lSLRcross(gt1,gt2,gt3,gt4)
   CSRL = O4lSRLcross(gt1,gt2,gt3,gt4)

   CVLL = O4lVLLcross(gt1,gt2,gt3,gt4)
   CVRR = O4lVRRcross(gt1,gt2,gt3,gt4)
   CVLR = O4lVLRcross(gt1,gt2,gt3,gt4)
   CVRL = O4lVRLcross(gt1,gt2,gt3,gt4)

   CVLL = CVLL + e2*cK1L
   CVRR = CVRR + e2*cK1R
   CVLR = CVLR + e2*cK1L
   CVRL = CVRL + e2*cK1R

   CTLL = O4lTLLcross(gt1,gt2,gt3,gt4)
   CTRR = O4lTRRcross(gt1,gt2,gt3,gt4)

   ! Photonic dipole contributions
   BRdipole = (Abs(cK2L)**2+Abs(cK2R)**2)&
        &*(16._dp/3._dp*Log(mf_l(gt1)/mf_l(gt3))-8._dp)
   
   ! Scalar contributions
   BRscalar = (Abs(CSLL)**2+Abs(CSRR)**2)/12._dp&
        &+(Abs(CSLR)**2+Abs(CSRL)**2)/12._dp

   ! Vector contributions
   BRvector = (Abs(CVLL)**2+Abs(CVRR)**2)/3._dp&
        & + (Abs(CVLR)**2+Abs(CVRL)**2)/3._dp

   ! Tensor contributions
   BRtensor = 4._dp*(Abs(CTLL)**2+Abs(CTRR)**2)

   ! Mix: dipole x scalar
   BRmix1 = 0._dp

   ! Mix: dipole x vector
   BRmix2 = -4._dp/3._dp*Real(cK2L*Conjg(CVRL) + cK2R*Conjg(CVLR),dp) &
        & -4._dp/3._dp*Real(cK2L*Conjg(CVRR) + cK2R*Conjg(CVLL),dp)

   ! Mix: scalar x vector
   BRmix3 = 0._dp

   ! Mix: scalar x tensor
   BRmix4 = 0._dp

Else ! tau- -> l+ l'- l'-

   cK1L = 0._dp
   cK1R = 0._dp

   cK2L = 0._dp
   cK2R = 0._dp

   CSLL = O4lSLL(gt1,gt2,gt3,gt4)
   CSRR = O4lSRR(gt1,gt2,gt3,gt4)
   CSLR = O4lSLR(gt1,gt2,gt3,gt4)
   CSRL = O4lSRL(gt1,gt2,gt3,gt4)

   CVLL = O4lVLL(gt1,gt2,gt3,gt4)
   CVRR = O4lVRR(gt1,gt2,gt3,gt4)
   CVLR = O4lVLR(gt1,gt2,gt3,gt4)
   CVRL = O4lVRL(gt1,gt2,gt3,gt4)

   CVLL = CVLL + e2*cK1L
   CVRR = CVRR + e2*cK1R
   CVLR = CVLR + e2*cK1L
   CVRL = CVRL + e2*cK1R

   CTLL = O4lTLL(gt1,gt2,gt3,gt4)
   CTRR = O4lTRR(gt1,gt2,gt3,gt4)

   ! Photonic dipole contributions
   BRdipole = 0._dp
   
   ! Scalar contributions
   BRscalar = (Abs(CSLL)**2+Abs(CSRR)**2)/24._dp&
        &+(Abs(CSLR)**2+Abs(CSRL)**2)/12._dp

   ! Vector contributions
   BRvector = 2._dp*(Abs(CVLL)**2+Abs(CVRR)**2)/3._dp&
        & + (Abs(CVLR)**2+Abs(CVRL)**2)/3._dp

   ! Tensor contributions
   BRtensor = 6._dp*(Abs(CTLL)**2+Abs(CTRR)**2)

   ! Mix: dipole x scalar
   BRmix1 = 0._dp

   ! Mix: dipole x vector
   BRmix2 = 0._dp

   ! Mix: scalar x vector
   BRmix3 = -1._dp/3._dp*Real(CSLR*Conjg(CVLR) + CSRL*Conjg(CVRL),dp)

   ! Mix: scalar x tensor
   BRmix4 = -1._dp*Real(CSLL*Conjg(CTLL) + CSRR*Conjg(CTRR),dp)

End If

GammaLFV = oo512pi3*mf_l(gt1)**5* &
     & (e4*BRdipole + BRscalar + BRvector + BRtensor &
     & + e2*BRmix1 + e2*BRmix2 + BRmix3 + BRmix4)

!----------------------------------------------------------------------
!taking alpha(Q=0) instead of alpha(m_Z) as this contains most of the
!running of the Wilson coefficients
!----------------------------------------------------------------------

If (i1.Eq.1) Then
 BRtauToemumu=GammaLFV/GammaTau
Else If(i1.Eq.2) Then
 BRtauTomuee=GammaLFV/GammaTau
Else If(i1.Eq.3) Then
 BRtauToemumu2=GammaLFV/GammaTau
Else
 BRtauTomuee2=GammaLFV/GammaTau
End If

End do
