Complex(dp) :: c7(2), c7p(2), c8(2), c8p(2), r7, r7p, r8, r8p, norm, &
     & r9(2), r9p(2), r10(2), r10p(2),                               & 
     & c9ee(2), c9pee(2), c10ee(2), c10pee(2),                       &
     & c9_cee(2), c9p_cee(2), c10_cee(2), c10p_cee(2),               &
     & c9mm(2), c9pmm(2), c10mm(2), c10pmm(2), c9_cmm(2),            &
     & c9p_cmm(2), c10_cmm(2), c10p_cmm(2) 

! ---------------------------------------------------------------- 
! \bar{B} -> X_s l+ l-
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on T. Huber et al, NPB 740 (2006) 105, [hep-ph/0512066]
! Prime operators added after private communication with E. Lunghi
! ---------------------------------------------------------------- 

! Wilson coefficients

c7(1) = CC7(3,2)
c7(2) =  CC7SM(3,2)
c7p(1) = CC7p(3,2)
c7p(2) = CC7pSM(3,2)

c8(1) = CC8(3,2)
c8(2) = CC8SM(3,2)
c8p(1) = CC8p(3,2)
c8p(2) = CC8pSM(3,2)

c9ee(1) = OddllVLL(3,2,1,1)+OddllVLR(3,2,1,1)
c9ee(2) = (OddllVLLSM(3,2,1,1)+OddllVLRSM(3,2,1,1))
c9mm(1) = OddllVLL(3,2,2,2)+OddllVLR(3,2,2,2)
c9mm(2) =  (OddllVLLSM(3,2,2,2)+OddllVLRSM(3,2,2,2))
c9pee(1) = OddllVRR(3,2,1,1)+OddllVRL(3,2,1,1)
c9pee(2) =  (OddllVRRSM(3,2,1,1)+OddllVRLSM(3,2,1,1))
c9pmm(1) = OddllVRR(3,2,2,2)+OddllVRL(3,2,2,2)
c9pmm(2) =  (OddllVRRSM(3,2,2,2)+OddllVRLSM(3,2,2,2))

c10ee(1) = OddllVLL(3,2,1,1)-OddllVLR(3,2,1,1)
c10ee(2) =  (OddllVLLSM(3,2,1,1)-OddllVLRSM(3,2,1,1))
c10mm(1) = OddllVLL(3,2,2,2)-OddllVLR(3,2,2,2)
c10mm(2) =  (OddllVLLSM(3,2,2,2)-OddllVLRSM(3,2,2,2))
c10pee(1) = OddllVRR(3,2,1,1)-OddllVRL(3,2,1,1)
c10pee(2) =  (OddllVRRSM(3,2,1,1)-OddllVRLSM(3,2,1,1))
c10pmm(1) = OddllVRR(3,2,2,2)-OddllVRL(3,2,2,2)
c10pmm(2) = (OddllVRRSM(3,2,2,2)-OddllVRLSM(3,2,2,2))

! ratios

r7 = c7(1) / c7(2)
r7p = c7p(1) / c7(2)
r8 = c8(1) / c8(2)
r8p = c8p(1) / c8(2)

r9(1) = c9ee(1)/c9ee(2)
r9(2) = c9mm(1)/c9mm(2)
r9p(1) = c9pee(1)/c9ee(2)
r9p(2) = c9pmm(1)/c9mm(2)

r10(1) = c10ee(1)/c10ee(2)
r10(2) = c10mm(1)/c10mm(2)
r10p(1) = c10pee(1)/c10ee(2)
r10p(2) = c10pmm(1)/c10mm(2)

BrBtoSEE = (2.3148_dp - 1.658e-3_dp * Aimag(R10(1))                   &
 & + 5.e-4_dp * Aimag(r10(1)*Conjg(r8) + r10p(1)*Conjg(r8p) )         &
 & + 5.23e-2_dp * Aimag(r7) + 5.18e-3_dp * Aimag(r8)                  &
 & + 2.266e-2_dp * Aimag(r7 * Conjg(r8) + r7p * Conjg(r8p) )          &
 & + 4.96e-3_dp * Aimag(r7 * Conjg(r9(1)) + r7p * Conjg(r9p(1)) )     &
 & + 2.61e-2_dp * Aimag(r8 * Conjg(r9(1)) + r8p * Conjg(r9p(1)) )     &
 & - 6.21e-3_dp * Aimag(r9(1)) - 0.5420_dp * Real( r10(1), dp)        &
 & - 3.340e-2_dp * Real(r7,dp) - 1.35e-2_dp * Real(r8,dp)             &
 & + 1.53e-2_dp * Real(r7*Conjg(r10(1)) + r7p*Conjg(r10p(1)), dp )    &
 & + 6.73e-2_dp * Real(r7 * Conjg(r8) + r7p * Conjg(r8p), dp )        &
 & - 0.86916_dp * Real(r7*Conjg(r9(1)) + r7p*Conjg(r9p(1)), dp )      &
 & + 1.85e-3_dp * Real(r8*Conjg(r10(1)) + r8p*Conjg(r10p(1)), dp )    &
 & - 9.921e-2_dp * Real(r8*Conjg(r9(1)) + r8p*Conjg(r9p(1)), dp )     &
 & + 2.833_dp* Real(r9(1),dp) + 0.2804_dp * (Abs(r7)**2 + Abs(r7p)**2)&
 & - 0.10698_dp * Real( r9(1) * Conjg(r10(1))                         &
 &                    + r9p(1) * Conjg(r10p(1)), dp)                  &
 & + 11.0348_dp * (Abs(r10(1))**2 + Abs(r10p(1))**2 )                 &
 & + 1.527_dp * (Abs(r9(1))**2 + Abs(r9p(1))**2 )                     &
 & + 3.763e-3_dp * (Abs(r8)**2 + Abs(r8p)**2 ) ) 

  ! ratio BR(B -> Xs mu+ mu-)/BR(B -> Xs e+ e-)_SM
  ratioBtoSee = BrBtoSEE/16.5529_dp

  ! branching ratio B -> Xs e+ e-
  BrBtoSEE = BrBtoSEE* 1.e-7_dp

BrBtoSMuMu = (2.1774_dp - 1.658e-3_dp * Aimag(R10(2))                 &
  & + 5.e-4_dp * Aimag(r10(2)*Conjg(r8) + r10p(2)*Conjg(r8p) )        &
  & + 5.34e-2_dp * Aimag(r7) + 5.27e-3_dp * Aimag(r8)                 &
  & + 2.266e-2_dp * Aimag(r7 * Conjg(r8) + r7p * Conjg(r8p) )         &
  & + 4.96e-3_dp * Aimag(r7 * Conjg(r9(2)) + r7p * Conjg(r9p(2)) )    &
  & + 2.61e-2_dp * Aimag(r8 * Conjg(r9(2)) + r8p * Conjg(r9p(2)) )    &
  & - 1.15e-2_dp * Aimag(r9(2)) - 0.5420_dp * Real( r10(2), dp)       &
  & + 2.08e-2_dp * Real(r7,dp) - 9.38e-3_dp * Real(r8,dp)             &
  & + 1.53e-2_dp * Real(r7*Conjg(r10(2)) + r7p*Conjg(r10p(2)), dp )   &
  & + 6.848e-2_dp * Real(r7 * Conjg(r8) + r7p * Conjg(r8p), dp )      &
  & - 0.8545_dp * Real(r7*Conjg(r9(2)) + r7p*Conjg(r9p(2)), dp )      &
  & + 1.85e-3_dp * Real(r8*Conjg(r10(2)) + r8p*Conjg(r10p(2)), dp )   &
  & - 9.81e-2_dp * Real(r8*Conjg(r9(2)) + r8p*Conjg(r9p(2)), dp )     &
  & + 2.6917_dp * Real(r9(2),dp) + 0.2880_dp*(Abs(r7)**2+Abs(r7p)**2) &
  & - 0.10698_dp * Real( r9(2) * Conjg(r10(2))                        &
  &                    + r9p(2) * Conjg(r10p(2)), dp)                 &
  & + 10.7652_dp * (Abs(r10(2))**2 + Abs(r10p(2))**2 )                &
  & + 1.4884_dp * (Abs(r9(2))**2 + Abs(r9p(2))**2 )                   &
  & + 3.81e-3_dp * (Abs(r8)**2 + Abs(r8p)**2 ) )

  ! ratio BR(B -> Xs mu+ mu-)/BR(B -> Xs mu+ mu-)_SM
  ratioBtoSMuMu = BrBtoSMuMu/16.0479_dp

  ! branching ratio B -> Xs mu+ mu-
  BrBtoSMuMu = BrBtoSMuMu* 1.e-7_dp

 
