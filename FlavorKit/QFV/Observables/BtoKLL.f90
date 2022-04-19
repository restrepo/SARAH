Complex(dp) :: c7NP, c7p, c9NP, c9p, c10NP, c10p, norm
Real(dp) ::  GF

! ---------------------------------------------------------------- 
! B^+ -> K^+ l+ l- (14.18 GeV^2 < q^2 < 22 GeV^2)
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on W. Altmannshofer, D. M. Straub, EPJ C 73 (2013) 2646
! [arXiv:1308.1501]
! 17-03-24, FS: changed normalization of C7, C7'
! ---------------------------------------------------------------- 

! --- B -> K e e ---

c7NP = (CC7(3,2) - CC7SM(3,2))
c7p = CC7p(3,2)
c9NP = 0.5_dp*(OddllVLL(3,2,1,1)+OddllVLR(3,2,1,1) - &
            & (OddllVLLSM(3,2,1,1)+OddllVLRSM(3,2,1,1)))
c9p =  0.5_dp*(OddllVRR(3,2,1,1)+OddllVRL(3,2,1,1))
c10NP = -0.5_dp*(OddllVLL(3,2,1,1)-OddllVLR(3,2,1,1) - &
            &  (OddllVLLSM(3,2,1,1)-OddllVLRSM(3,2,1,1)))
c10p = 0.5_dp*(OddllVRR(3,2,1,1)-OddllVRL(3,2,1,1))


! running GF
GF = (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp

! normalization of our Wilson coefficients
! relative to the ones used in arXiv:1308.1501
norm = - Alpha_160/Pi*GF/sqrt2*CKM_160(3,3)*Conjg(CKM_160(3,2))

! Branching ratio in the high-q^2 region
! q^2 in [14.18,22] GeV^2
BrBtoKee = (1.11_dp + 4._dp*pi*Alpha_160*0.22_dp*(c7Np+c7p)/norm + &
   & 0.27_dp*(c9NP+c9p)/norm - 0.27_dp*(c10NP+c10p)/norm)

! ratio relative to SM
ratioBtoKee = BrBtoKeE/1.11_dp

! total BR
BrBtoKee = BrBtoKeE*1.0E-7_dp

! --- B -> K mu mu ---

c7NP = (CC7(3,2) - CC7SM(3,2))
c7p = CC7p(3,2)
c9NP = 0.5_dp*(OddllVLL(3,2,2,2)+OddllVLR(3,2,2,2) - &
            & (OddllVLLSM(3,2,2,2)+OddllVLRSM(3,2,2,2)))
c9p =  0.5_dp*(OddllVRR(3,2,2,2)+OddllVRL(3,2,2,2))
c10NP = -0.5_dp*(OddllVLL(3,2,2,2)-OddllVLR(3,2,2,2) - &
            &  (OddllVLLSM(3,2,2,2)-OddllVLRSM(3,2,2,2)))
c10p = 0.5_dp*(OddllVRR(3,2,2,2)-OddllVRL(3,2,2,2))

! running GF
GF = (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp

! normalization of our Wilson coefficients
! relative to the ones used in arXiv:1308.1501
norm = - Alpha_160/Pi*GF/sqrt2*CKM_160(3,3)*Conjg(CKM_160(3,2))

! Branching ratio in the high-q^2 region
! q^2 in [14.18,22] GeV^2
BrBtoKmumu = (1.11_dp + 4._dp*pi*Alpha_160*0.22_dp*(c7Np+c7p)/norm + &
   & 0.27_dp*(c9NP+c9p)/norm - 0.27_dp*(c10NP+c10p)/norm)

! ratio relative to SM
ratioBtoKmumu = BrBtoKmumu/1.11_dp

! total BR
BrBtoKmumu = BrBtoKmumu*1.0E-7_dp


