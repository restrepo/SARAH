Subroutine BtoQGamma(I_f, mf_d, gauge, mf_u, mW, Y_d, RdL, RdR, Y_u, RuL, RuR &
   & , mSpm2, RSpm, mC, U, V, mSup2, RSup, A_u, mSdown2, RSdown, A_d, mglu     &
   & , phi_g, mN, N, mu, mS02, RS0, mP02, RP0, vevSM, cpl_CSQQp_L , cpl_CSQQp_R, cpl_CDSu_L &
   & , cpl_CDSu_R, cpl_DGSd_L, cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R,  cpl_DDS0_L, cpl_DDS0_R     &
   & , cpl_DDP0_L, cpl_DDP0_R,Bratio, c7_o, c7p_o      &
   & , c8_o, c8p_o, A_CP, i_scheme)
 
 Implicit None
  Integer, Intent(in) :: I_f
  Real(dp), Intent(in) :: mf_d(3), gauge(3), mf_u(3), mW, mSpm2(:), mC(:)   &
    & , mSup2(6), mSdown2(6), mglu, mN(:), mS02(:), vevSM(2), mP02(:)
  Complex(dp), Intent(in), Dimension(3,3) :: RdL, RdR, RuL, RuR, Y_d, Y_u
  Complex(dp), Intent(in) :: U(:,:), V(:,:), RSpm(:,:), RSup(6,6)    &
    & , RSdown(6,6), phi_g, N(:,:), mu, A_u(3,3), A_d(3,3), cpl_CSQQp_L(:,:,:),&
    & cpl_CSQQp_R(:,:,:), cpl_CDSu_L(:,:,:) &
    & , cpl_CDSu_R(:,:,:), cpl_DGSd_L(:,:) &
    & , cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:), cpl_DNSd_R(:,:,:),      &
    &   cpl_DDS0_L(:,:,:), cpl_DDS0_R(:,:,:), cpl_DDP0_L(:,:,:), cpl_DDP0_R(:,:,:)    
  Real(dp), Intent(in) :: RP0(:,:), RS0(:,:)
  Real(dp), Intent(out) :: Bratio
  Complex(dp), Intent(out), Optional :: c7_o(7), c7p_o(6), c8_o(7), c8p_o(6)
  Real(dp), Intent(out), Optional :: A_CP
  Integer, Intent(in), Optional :: i_scheme

  Integer :: i1, i2, i3, i_t
  Real(dp) :: g, gp, gs, mSup2_in(6)
  Complex(dp) :: c7(7), c7p(6), c8(7), c8p(6), r7, r7p, r8, r8p, cpl_uWd(3,3) &
               & , norm, CKM(3,3), epsq, epsqC
  Complex(dp) :: delta_C7_0, delta_C7p_0, delta_C8_0, delta_C8p_0, delta_C7_1 &
               & , delta_C7p_1, delta_C8_1, delta_C8p_1, RSup_in(6,6), mix(6,6)
  Real(dp), Parameter :: T3=-0.5_dp, ed = -1._dp / 3._dp
  Real(dp), Dimension(5), Parameter ::                                         &
    &   a = (/  7.8221_dp, 6.9120_dp, 8.1819_dp, 7.1714_dp, 7.9699_dp /)       &
    & , a_77 = (/ 0.8161_dp, 0.8161_dp, 0.8283_dp, 0.8283_dp, 0.9338_dp /)     &
    & , ar_7 = (/ 4.8802_dp, 4.5689_dp, 4.9228_dp, 4.6035_dp, 5.3314_dp /)     &
    & , ai_7 = (/ 0.3546_dp, 0.2167_dp, 0.3322_dp, 0.2029_dp, 0.0_dp    /)     &
    & , a_88 = (/ 0.0197_dp, 0.0197_dp, 0.0986_dp, 0.0986_dp, 0.0066_dp /)     &
    & , ar_8 = (/ 0.5680_dp, 0.5463_dp, 0.7810_dp, 0.7600_dp, 0.4498_dp /)     &
    & , ai_8 = (/-0.0987_dp,-0.1105_dp,-0.0963_dp,-0.1091_dp, 0.0_dp /)        &
    & , a_eps = (/ 0.4384_dp, 0.3787_dp, 0.8598_dp, 0.7097_dp, 0.0_dp /)       &
    & , ar_eps = (/-1.6981_dp,-2.6679_dp,-1.3329_dp,-2.4935_dp, 0.0_dp /)      &
    & , ai_eps = (/ 2.4997_dp, 2.8956_dp, 2.5274_dp, 2.9127_dp, 0.0_dp /)      &
    & , ar_87 = (/ 0.1923_dp, 0.1923_dp, 0.2025_dp, 0.2025_dp, 0.1576_dp /)    &
    & , ar_7eps = (/-0.7827_dp,-1.0940_dp,-0.8092_dp,-1.1285_dp, 0.0_dp /)     &
    & , ar_8eps = (/ -0.0601_dp,-0.0819_dp,-0.0573_dp,-0.0783_dp, 0.0_dp /)    &
    & , ai_87 = (/-0.0487_dp,-0.0487_dp,-0.0487_dp,-0.0487_dp, 0.0_dp /)       &
    & , ai_7eps = (/-0.9067_dp,-1.0447_dp,-0.9291_dp,-1.0585_dp, 0.0_dp /)     &
    & , ai_8eps = (/-0.0661_dp,-0.0779_dp,-0.0637_dp,-0.0765_dp, 0.0_dp /)

  Iname = Iname + 1
  NameOfUnit(Iname) = "BtoQGamma"

  !---------------
  ! couplings
  !---------------
  gp = gauge(1)
  g = gauge(2)
  gs = gauge(3)

  CKM =  Matmul(RuL, Transpose(Conjg(RdL)) )

  cpl_uWd = g * oosqrt2 * CKM

  norm = 0.5_dp * cpl_uWd(3,3) * Conjg(cpl_uWd(3,i_f)) / mW**2

  !---------------------
  ! wilson coefficients
  !---------------------
  Call C_7(3, I_f, mW, mf_u, cpl_uWd, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R  &
        & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L        &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c7 )
  Call C_7p(3, I_f, mf_u, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R               &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L         &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c7p  )
  Call C_8(3, I_f, mW, mf_u, cpl_uWd  &
        & , mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R                             &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L         &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c8)
  Call C_8p(3, I_f, mf_u, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R               &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L         &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c8p )

  c7 = c7 / norm
  c7p = c7p / norm
  c8 = c8 / norm
  c8p = c8p / norm

  r7 = c7(1) / c7(2)
  r7p = c7p(1) / c7(2)
  r8 = c8(1) / c8(2)
  r8p = c8p(1) / c8(2)

  epsq = Conjg(CKM(1,I_f)) * CKM(1,3) / (Conjg(CKM(3,I_f)) * CKM(3,3))
  epsqC = Conjg(epsq)

  If (Present(i_scheme)) Then
   i_t = i_scheme
  Else
   i_t = 3
  End If

  if (i_t.ne.0) then
   Bratio = a(i_t) + a_77(i_t) * ( Abs(r7)**2 + Abs(r7p)**2)                    &
       & + ar_7(i_t) * Real(r7,dp) + ai_7(i_t) * Aimag(r7)                     &
       & + a_88(i_t) * ( Abs(r8)**2 + Abs(r8p)**2)                             &
       & + ar_8(i_t) * Real(r8,dp) + ai_8(i_t) * Aimag(r8)                     &
       & + a_eps(i_t) * Abs(epsq)**2 + ar_eps(i_t) * Real(epsq,dp)             &
       & + ai_eps(i_t) * Aimag(epsq)                                           &
       & + ar_87(i_t) * Real(r8*Conjg(r7)+r8p*Conjg(r7p),dp)                   &
       & + ai_87(i_t) * Aimag(r8*Conjg(r7)+r8p*Conjg(r7p))                     &
       & + ar_7eps(i_t) * Real(r7*epsqC,dp) + ar_8eps(i_t) * Real(r8*epsqC,dp) &
       & + ai_7eps(i_t) * Aimag(r7*epsqC) + ai_8eps(i_t) * Aimag(r8*epsqC) 

  !-----------------------
  ! is 10^4 BR
  !-----------------------
   Bratio = 2.567e-1_dp * Abs(Conjg(CKM(3,I_f))*CKM(3,3)/CKM(2,3))**2 * Bratio

  Else ! E.Lunghi, J.Matias, hep-ph/0612166, eq.18 still missing 1-loop part
   delta_C7_0 = sum(C7(3:7))
   delta_C7p_0 = C7p(1)
   delta_C8_0 = sum(C8(3:7))
   delta_C8p_0 = C8p(1)
   delta_C7_1 = 0._dp
   delta_C7p_1 = 0._dp
   delta_C8_1 = 0._dp
   delta_C8p_1 = 0._dp
   Bratio = 2.98_dp + 4.743_dp * (Abs(delta_C7_0)**2 + Abs(delta_C7p_0)**2 ) &
        & + 0.789_dp *  (Abs(delta_C8_0)**2 + Abs(delta_C8p_0)**2 )          &
        & + Real( (-7.184_dp,0.612_dp) * delta_C7_0                          &
        &       + (-2.225_dp,-0.557_dp) * delta_C8_0                         &
        &       + (2.454_dp,-0.884_dp) * ( delta_C7_0 * conjg(delta_C8_0)    &
        &                                +delta_C7p_0 * conjg(delta_C8p_0) ) &
        &       , dp)  
  end if

  If (Present(A_CP)) Then
   A_CP = Aimag( ai_7(i_t)*(r7) + ai_8(i_t)*(r8)                       &
      &        + ai_87(i_t) * (r8*Conjg(r7)+r8p*Conjg(r7p))            &
      &        + ai_7eps(i_t) * r7*epsqC + ai_8eps(i_t) * r8*epsqC )   &
      & / ( a(i_t) + a_77(i_t) * ( Abs(r7)**2 + Abs(r7p)**2)           &
      &   + ar_7(i_t) * Real(r7,dp) + ar_8(i_t) * Real(r8,dp)          &
      &   + a_88(i_t) * ( Abs(r8)**2 + Abs(r8p)**2)                    &
      &   + ar_87(i_t) * Real(r8*Conjg(r7)+r8p*Conjg(r7p),dp) )
  End If

  If (Present(c7_o)) c7_o = c7
  If (Present(c7p_o)) c7p_o = c7p
  If (Present(c8_o)) c8_o = c8
  If (Present(c8p_o)) c8p_o = c8p

  Iname = Iname - 1

 End Subroutine BtoQGamma


 Subroutine BToSLL(gauge, mf_d, mf_u, mW, Y_d, RdL, RdR, Y_u, RuL, RuR     &
   & , Y_l, RlL, RlR, mSneut2, Rsneut, mSlepton2, Rslepton                 &
   & , mSpm2, RSpm, mC, U, V, mSup2, RSup, A_u, mSdown2, RSdown, A_d, mglu &
   & , phi_g, mN, N, mu, mS02, RS0, mP02, RP0, vevSM,  &
  &  cpl_CSQQp_L , cpl_CSQQp_R, cpl_CDSu_L, cpl_CDSu_R,  cpl_DGSd_L &
  & , cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R,cpl_CLSn_L, cpl_CLSn_R   &
  & , cpl_LNSl_L, cpl_LNSl_R, cpl_DDS0_L, cpl_DDS0_R, cpl_DDP0_L    &
  & , cpl_DDP0_R, BtoSEE, BtoSMuMu, c7_o, c7p_o, c8_o, c8p_o, c9_o, c9p_o, c10_o, c10p_o)

 Implicit None
  Real(dp), Intent(in) :: mf_d(3), gauge(3), mf_u(3), mW, mSpm2(:), mC(:)   &
    & , mSup2(6), mSdown2(6), mglu, mN(:), mS02(:),  vevSM(2), mSneut2(3), mSlepton2(6), &
   &  mP02(:)
  Complex(dp), Intent(in) :: cpl_CSQQp_L(:,:,:) , cpl_CSQQp_R(:,:,:), cpl_CDSu_L(:,:,:) &
               & , cpl_CDSu_R(:,:,:),  cpl_DGSd_L(:,:) &
               & , cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:), cpl_DNSd_R(:,:,:)      &
               & , cpl_CLSn_L(:,:,:), cpl_CLSn_R(:,:,:)    &
             & , cpl_LNSl_L(:,:,:), cpl_LNSl_R(:,:,:),cpl_DDS0_L(:,:,:), &
		& cpl_DDS0_R(:,:,:), cpl_DDP0_L(:,:,:)    &
               & , cpl_DDP0_R(:,:,:)    
  Real(dp), Intent(in) :: RP0(:,:), RS0(:,:)
  Complex(dp), Intent(in), Dimension(3,3) :: RdL, RdR, RuL, RuR, Y_d, Y_u   &
    & , RlL, RlR, Y_l
  Complex(dp), Intent(in) :: U(:,:), V(:,:), RSpm(:,:), RSup(6,6), Rsneut(3,3) &
    & , RSdown(6,6), phi_g, N(:,:), mu, A_u(3,3), A_d(3,3), Rslepton(6,6)
  Real(dp), Intent(out) :: BtoSEE, BToSMuMu
  Complex(dp), Intent(out), Optional :: c7_o(7), c7p_o(6), c8_o(7), c8p_o(6) &
    & , c9_o(2,6), c9p_o(2,6), c10_o(2,6), c10p_o(2,6)

  Integer :: i1, i2, i3, i4
  Real(dp) :: g, gp, gs
  Complex(dp) :: c7(7), c7p(6), c8(7), c8p(6), r7, r7p, r8, r8p,  norm, CKM(3,3)
  Complex(dp) :: r9(2), r9p(2), r10(2), r10p(2), c9(2), c9p(2)         &
    & , c10(2), c10p(2), c9_c(2,6), c9p_c(2,6), c10_c(2,6), c10p_c(2,6)
  Complex(dp) :: kappa_q, cpl_uWd(3,3), RSup_in(6,6), mix(6,6)	
  Real(dp) :: mC2(2), mN2(Size(mN)), a_s, sW2, tanb, e2, mG2, mW2
  Real(dp), Parameter :: T3=-0.5_dp, ed = -1._dp / 3._dp
  Complex(dp), Parameter :: Null3(3,3) = 0._dp

  Iname = Iname + 1
  NameOfUnit(Iname) = "BToSLL"

  !---------------
  ! couplings
  !---------------
  gp = gauge(1)
  g = gauge(2)
  gs = gauge(3)

  CKM =  Matmul(RuL, Transpose(Conjg(RdL)) )

  cpl_uWd = g * oosqrt2 * CKM
  mW2 = mW**2

  norm = 0.5_dp * cpl_uWd(3,3) * Conjg(cpl_uWd(3,2)) / mW2

  
  !---------------------
  ! wilson coefficients
  !---------------------
  Call C_7(3, 2, mW, mf_u, cpl_uWd, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R  &
        & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L   &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L      &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c7 )
  Call C_7p(3, 2, mf_u, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R              &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L      &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c7p  )
  Call C_8(3, 2, mW, mf_u, cpl_uWd                                         &
        & , mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R                          &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L      &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c8)
  Call C_8p(3, 2, mf_u, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R              &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L  &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L      &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, c8p )

  mC2 = mC**2
  mN2 = mN**2
  mG2 = mGlu**2

  a_s = gauge(3)**2 * oo4pi
  sW2 = gauge(1)**2 / (gauge(1)**2 + gauge(2)**2)
  tanb = vevSM(2) / vevSM(1)
  e2 = 4._dp * pi * gauge(2)**2 * sW2
  kappa_q = 8._dp * Sqrt2 * G_F * e2 * CKM(3,3) * Conjg( CKM(3,2) )
  kappa_q = 1._dp / kappa_q
  Call C_9(3, 2, 1, mW, mf_d, mf_u, mf_l, mW2, mSpm2, mG2, mC2, mN2        &
       & , mSneut2, mSlepton2, mSup2, mSdown2, tanb, U, V, N, RSup, RSdown    &
       & , cpl_CDSu_L, cpl_CDSu_R, cpl_CLSn_L, cpl_CLSn_R, cpl_LNSl_L         &
       & , cpl_LNSl_R, cpl_DGSd_L, cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R         &
       & , a_s, kappa_q, e2, sW2, .False.                                     &
       & , c9(1), c9p(1), c9_c(1,:), c9p_c(1,:) )
  Call C_9(3, 2, 2, mW, mf_d, mf_u, mf_l, mW2, mSpm2, mG2, mC2, mN2        &
       & , mSneut2, mSlepton2, mSup2, mSdown2, tanb, U, V, N, RSup, RSdown    &
       & , cpl_CDSu_L, cpl_CDSu_R, cpl_CLSn_L, cpl_CLSn_R, cpl_LNSl_L         &
       & , cpl_LNSl_R, cpl_DGSd_L, cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R         &
       & , a_s, kappa_q, e2, sW2, .False.                                     &
       & , c9(2), c9p(2), c9_c(2,:), c9p_c(2,:) )
  Call C_10_10p(3, 2, 1, mW, mf_d, mf_u, mf_l, mW2, mSpm2, mG2, mC2, mN2   &
       & , mSneut2, mSlepton2, mSup2, mSdown2, tanb, U, V, N, RSup, RSdown    &
       & , cpl_CDSu_L, cpl_CDSu_R, cpl_CLSn_L, cpl_CLSn_R, cpl_LNSl_L         &
       & , cpl_LNSl_R, cpl_DGSd_L, cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R         &
       & , a_s, kappa_q, e2, sW2, .False., c10(1), c10p(1), c10_c(1,:)        &
       & , c10p_c(1,:))
  Call C_10_10p(3, 2, 2, mW, mf_d, mf_u, mf_l, mW2, mSpm2, mG2, mC2, mN2   &
       & , mSneut2, mSlepton2, mSup2, mSdown2, tanb, U, V, N, RSup, RSdown    &
       & , cpl_CDSu_L, cpl_CDSu_R, cpl_CLSn_L, cpl_CLSn_R, cpl_LNSl_L         &
       & , cpl_LNSl_R, cpl_DGSd_L, cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R         &
       & , a_s, kappa_q, e2, sW2, .False., c10(2), c10p(2), c10_c(2,:)        &
       & , c10p_c(2,:))

  c7 = c7 / norm
  c7p = c7p / norm
  c8 = c8 / norm
  c8p = c8p / norm

  r7 = c7(1) / c7(2)
  r7p = c7p(1) / c7(2)
  r8 = c8(1) / c8(2)
  r8p = c8p(1) / c8(2)

  r9 = c9 / c9_c(:,2)
  r9p = c9p / c9_c(:,2)
  r10 = c10 / c10_c(:,2)
  r10p = c10p / c10_c(:,2)

  BtoSEE = (2.3278_dp - 1.655e-3_dp * Aimag(R10(1))                            &
       & + 5.e-4_dp * Aimag(r10(1)*Conjg(r8) + r10p(1)*Conjg(r8p) )            &
       & + 5.24e-2_dp * Aimag(r7) + 5.04e-3_dp * Aimag(r8)                     &
       & + 2.266e-2_dp * Aimag(r7 * Conjg(r8) + r7p * Conjg(r8p) )             &
       & + 4.96e-3_dp * Aimag(r7 * Conjg(r9(1)) + r7p * Conjg(r9p(1)) )        &
       & + 2.61e-2_dp * Aimag(r8 * Conjg(r9(1)) + r8p * Conjg(r9p(1)) )        &
       & - 6.51e-3_dp * Aimag(r9(1)) - 0.5426_dp * Real( r10(1), dp)           &
       & - 2.578e-2_dp * Real(r7,dp) - 1.28e-2_dp * Real(r8,dp)                &
       & + 1.53e-2_dp * Real(r7*Conjg(r10(1)) + r7p*Conjg(r10p(1)), dp )       &
       & + 6.74e-2_dp * Real(r7 * Conjg(r8) + r7p * Conjg(r8p), dp )           &
       & - 0.86996_dp * Real(r7*Conjg(r9(1)) + r7p*Conjg(r9p(1)), dp )         &
       & + 1.85e-3_dp * Real(r8*Conjg(r10(1)) + r8p*Conjg(r10p(1)), dp )       &
       & - 9.926e-2_dp * Real(r8*Conjg(r9(1)) + r8p*Conjg(r9p(1)), dp )        &
       & + 2.841_dp * Real(r9(1),dp) + 0.2813_dp * (Abs(r7)**2 + Abs(r7p)**2 ) &
       & - 0.10705_dp * Real( r9(1) * Conjg(r10(1))                            &
       &                    + r9p(1) * Conjg(r10p(1)), dp)                     &
       & + 11.0367_dp * (Abs(r10(1))**2 + Abs(r10p(1))**2 )                    &
       & + 1.528_dp * (Abs(r9(1))**2 + Abs(r9p(1))**2 )                        &
       & + 3.765e-3_dp * (Abs(r8)**2 + Abs(r8p)**2 ) ) * 1.e-7_dp

  BtoSMuMu = (2.1913_dp - 1.655e-3_dp * Aimag(R10(2))                          &
      & + 5.e-4_dp * Aimag(r10(2)*Conjg(r8) + r10p(2)*Conjg(r8p) )             &
      & + 5.35e-2_dp * Aimag(r7) + 5.13e-3_dp * Aimag(r8)                      &
      & + 2.266e-2_dp * Aimag(r7 * Conjg(r8) + r7p * Conjg(r8p) )              &
      & + 4.96e-3_dp * Aimag(r7 * Conjg(r9(2)) + r7p * Conjg(r9p(2)) )         &
      & + 2.61e-2_dp * Aimag(r8 * Conjg(r9(2)) + r8p * Conjg(r9p(2)) )         &
      & - 1.18e-2_dp * Aimag(r9(2)) - 0.5426_dp * Real( r10(2), dp)            &
      & + 2.81e-2_dp * Real(r7,dp) - 8.66e-3_dp * Real(r8,dp)                  &
      & + 1.53e-2_dp * Real(r7*Conjg(r10(2)) + r7p*Conjg(r10p(2)), dp )        &
      & + 6.859e-2_dp * Real(r7 * Conjg(r8) + r7p * Conjg(r8p), dp )           &
      & - 0.8554_dp * Real(r7*Conjg(r9(2)) + r7p*Conjg(r9p(2)), dp )           &
      & + 1.85e-3_dp * Real(r8*Conjg(r10(2)) + r8p*Conjg(r10p(2)), dp )        &
      & - 9.81e-2_dp * Real(r8*Conjg(r9(2)) + r8p*Conjg(r9p(2)), dp )          &
      & + 2.7008_dp * Real(r9(2),dp) + 0.2889_dp * (Abs(r7)**2 + Abs(r7p)**2 ) &
      & - 0.10705_dp * Real( r9(2) * Conjg(r10(2))                             &
      &                    + r9p(2) * Conjg(r10p(2)), dp)                      &
      & + 10.7687_dp * (Abs(r10(2))**2 + Abs(r10p(2))**2 )                     &
      & + 1.4892_dp * (Abs(r9(2))**2 + Abs(r9p(2))**2 )                        &
      & + 3.81e-3_dp * (Abs(r8)**2 + Abs(r8p)**2 ) ) * 1.e-7_dp

  If (Present(c7_o)) c7_o = c7
  If (Present(c7p_o)) c7p_o = c7p
  If (Present(c8_o)) c8_o = c8
  If (Present(c8p_o)) c8p_o = c8p
  If (Present(c9_o)) c9_o = c9_c
  If (Present(c9p_o)) c9p_o = c9p_c
  If (Present(c10_o)) c10_o = c10_c
  If (Present(c10p_o)) c10p_o = c10p_c

  Iname = Iname - 1

 End Subroutine BToSLL

  Subroutine B_To_SNuNu(gauge, mf_d, mf_u, mW, Y_d, RdL, RdR, Y_u, RuL, RuR &
   & , Y_l, mSneut2, Rsneut, mSlepton2, Rslepton, mSpm2, RSpm, mC, U, V     &
   & , mSup2, RSup, mSdown2, RSdown, mglu, phi_g, mN, N, vevSM,cpl_CDSu_L, cpl_CDSu_R,  &
    & cpl_DGSd_L, cpl_DGSd_R, cpl_DNSd_L, cpl_DNSd_R,cpl_CNuSl_L, cpl_CNuSl_R    &
             & , cpl_NuNSn_R,l_QCD       &
   & , BtoSNuNu, c11_o, c11p_o)

 Implicit None
  Real(dp), Intent(in) :: mf_d(3), gauge(3), mf_u(3), mW, mSpm2(:), mC(:)   &
    & , mSup2(6), mSdown2(6), mglu, mN(:), vevSM(2), mSneut2(3), mSlepton2(6)
  Complex(dp), Intent(in), Dimension(3,3) :: RdL, RdR, RuL, RuR, Y_d, Y_u, Y_l
  Complex(dp), Intent(in) :: U(:,:), V(:,:), RSpm(:,:), RSup(6,6)    &
    & , Rsneut(3,3), RSdown(6,6), phi_g, N(:,:), Rslepton(6,6), &
    & cpl_CDSu_L(:,:,:), cpl_CDSu_R(:,:,:)  &
    & , cpl_DGSd_L(:,:), cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:), &
    & cpl_DNSd_R(:,:,:), cpl_CNuSl_L(:,:,:), cpl_CNuSl_R(:,:,:)    &
    & , cpl_NuNSn_R(:,:,:)
  Logical, Intent(in) :: l_QCD
  Real(dp), Intent(out) :: BToSNuNu
  Complex(dp), Intent(out), Optional :: c11_o(3,6), c11p_o(3,6)

  Integer :: i1, i2, i3, i4
  Real(dp) :: g, gp, gs
  Complex(dp) :: c11(3), c11p(3), c11_c(6), c11p_c(6)
  Complex(dp) :: kappa_q,  CKM(3,3), RSup_in(6,6), mix(6,6)
  Real(dp) :: mC2(Size(mC)), mN2(Size(mN)), a_s, sW2, tanb, e2, mG2, mW2, a_ew
  Real(dp), Parameter :: T3=-0.5_dp, ed = -1._dp / 3._dp
  Complex(dp), Parameter :: Null3(3,3) = 0._dp

 
  Iname = Iname + 1
  NameOfUnit(Iname) = "B_To_SNuNu"


  !---------------
  ! couplings
  !---------------
  gp = gauge(1)
  g = gauge(2)
  gs = gauge(3)

  CKM =  Matmul(RuL, Transpose(Conjg(RdL)) )

    mW2 = mW**2
  mG2 = mglu**2
  mC2 = mC**2
  mN2 = mN**2
  tanb = vevsM(2) / vevSM(1)

  a_s = gauge(3)**2 * oo4pi
  sW2 = gauge(1)**2 / (gauge(1)**2 + gauge(2)**2)
  tanb = vevSM(2) / vevSM(1)
  e2 = 4._dp * pi * gauge(2)**2 * sW2
  kappa_q = 8._dp * Sqrt2 * G_F * e2 * CKM(3,3) * Conjg( CKM(3,2) )
  kappa_q = 1._dp / kappa_q

  c11 = 0._dp
  c11p = 0._dp
  Do i1=1,3
   Call C_11_11p(3, 2, i1, mW, mf_d, mf_u, mf_l, mW2, mSpm2, mG2, mC2      &
     & , mN2, mSneut2, mSlepton2, mSup2, mSdown2, tanb, U, V, N, RSup, RSdown &
     & , cpl_CDSu_L, cpl_CDSu_R, cpl_CNuSl_R, cpl_NuNSn_R, cpl_DNSd_L         &
     & , cpl_DNSd_R, cpl_DGSd_L, cpl_DGSd_R, a_s, kappa_q, e2, sW2, l_QCD     &
     & , c11(i1), c11p(i1), c11_c, c11p_c)
   If (Present(c11_o)) c11_o(i1,:) = c11_c
   If (Present(c11p_o)) c11p_o(i1,:) = c11p_c
  End Do

  BToSNuNu = 0._dp
  Do i1=1,3
   BToSNuNu = BToSNuNu + Abs(C11(i1))**2 + Abs(C11p(i1))**2 &
            &          - 0.08_dp * Real(C11(i1)*Conjg(C11p(i1)),dp)
  End Do
  BToSNuNu = 5.39e-6_dp * Abs(CKM(3,2)/CKM(2,3))**2 * BToSNuNu

  Iname = Iname - 1

 End Subroutine B_To_SNuNu


Subroutine Bs_to_MuMu(i, mf_u, g, Y_u, Ru_L, Ru_R, Y_d, Rd_L, Rd_R        &
      & , mC, U, V, mN, N, mGlu, phi_g, mS02, RS0, mP02, RP0, mSpm2, RSpm   &
      & , mSup2, RSup, A_u, mu, mSdown2, RSdown, A_d, vevSM, mSnu2, mSlept2 &
      & , c_CDSu_L, c_CDSu_R, c_CLSn_L, c_CLSn_R, c_LNSl_L, c_LNSl_R        &
      & , c_DGSd_L, c_DGSd_R, c_DNSd_L, c_DNSd_R,cplFdcFdhhLeff,cplFdcFdhhReff, &
      & cplFdcFdAhLeff,cplFdcFdAhReff &
      & , res )
 Implicit None
  Real(dp), Intent(in) :: mf_u(3), mC(:), mN(:), mGlu, mS02(:), mP02(:)     &
     & , mSpm2(:), g(3), mSdown2(6), mSup2(6), vevSM(2) &
     & , mSnu2(3), mSlept2(6)
  Complex(dp), Intent(in) :: U(:,:), V(:,:), N(:,:), RSpm(:,:), RSup(6,6)   &
     & , RSdown(6,6), phi_g, A_u(3,3), A_d(3,3), mu, c_CDSu_L(:,:,:)        &
     & , c_CDSu_R(:,:,:), c_CLSn_L(:,:,:), c_CLSn_R(:,:,:), c_LNSl_L(:,:,:) &
     & , c_LNSl_R(:,:,:), c_DGSd_L(:,:), c_DGSd_R(:,:), c_DNSd_L(:,:,:)     &
     & , c_DNSd_R(:,:,:),cplFdcFdhhLeff(:,:,:),cplFdcFdhhReff(:,:,:), &
     & cplFdcFdAhLeff(:,:,:),cplFdcFdAhReff (:,:,:)
  Complex(dp), Intent(in), Dimension(3,3) :: Y_u, Ru_L, Ru_R, Y_d, Rd_L, Rd_R
  Real(dp), Intent(in) :: RS0(:,:), RP0(:,:)
  Integer, Intent(in) :: i

  Real(dp), Intent(out) :: res

  Real(dp) :: xt, a_s, e2, sW2, tanb
  complex(dp) :: kappa_q
  Complex(dp) :: coupLC, coupRC, cs, cp, csp, cpp, fac, ca, cap
  Real(dp), Parameter ::  T3= -0.5_dp, e_d =-1._dp/3._dp
  Integer :: i1

  !-------------------------
  ! SM
  !-------------------------
  xt = mf_u(3)**2 / mW**2

  a_s = oo4pi * g(3)**2
  e2 = 4*pi * alpha
  sW2 = g(1)**2 / (g(1)**2 + g(2)**2)
  kappa_q = 8._dp * Sqrt2 * G_F * e2 * CKM(3,3) * Conjg( CKM(3,i) )
  kappa_q = 1._dp / kappa_q
  tanb = vevSM(2) / vevSM(1)
   Call  C_10_10p(3, i, 2, mW, mf_d_mZ, mf_u, mf_l, mW2, mSpm2, mGlu**2     &
       & , mC**2, mN**2, mSnu2, mSlept2, mSup2, mSdown2, tanb, U, V, N, RSup   &
       & , RSdown, c_CDSu_L, c_CDSu_R, c_CLSn_L, c_CLSn_R, c_LNSl_L, c_LNSl_R  &
       & , c_DGSd_L, c_DGSd_R, c_DNSd_L, c_DNSd_R  &
       & , a_s, kappa_q, e2, sW2, .false., cA, cAp)
  cA = sW2 * cA
  cAp = sW2 * cAp

  !------------------------------------------
  ! double penguins
  !------------------------------------------
  cs = 0._dp
  csp = 0._dp
  cpp = 0._dp
  cp = 0._dp
  Do i1=1,Size(mS02)
   cs = cs - cplFdcFdhhLeff(3,2,i1) * RS0(i1,1) / RP0(1,1) / mS02(i1)
   csp = csp - cplFdcFdhhReff(3,2,i1) * RS0(i1,1) / RP0(1,1) / mS02(i1)
  End Do

  Do i1=2,Size(mP02)
  cp = cp - cplFdcFdAhLeff(3,2,i1) * vevSM(2) / (vevSM(1) * mP02(i1))
  cpp = cp+ cplFdcFdAhReff(3,2,i1) * vevSM(2) / (vevSM(1) * mP02(i1))
  End Do

  !-------------------------------------------------
  ! Eq +6.29+6.33+6.38
  !-------------------------------------------------
!  fac = - 4._dp * Pi2 * MBq(i) * mf_l_mZ(2) / ( mf_d_mZ(3) * mW2 )
  fac = - 4._dp * Pi2 * MBq(i) * mf_l_mZ(2) / ( (mf_d_mZ(3) + mf_d_mZ(i)) * mW2 )
  fac = fac / (G_F**1.5_dp * 2._dp**1.75_dp * CKM(3,i) * Conjg(CKM(3,3)) )

  cs = fac * (cs - csp * mf_d(i)/mf_d(3))
  cp = fac * (cp - cpp * mf_d(i)/mf_d(3))
 !-------------------------------
 ! Eq.6.37
 !-------------------------------
  res = 2.32e-6_dp * (TauB(i)/1.5_dp) * (FBhatB(i)/0.23_dp)**2   &
      &            * (Abs(CKM(3,i)) / 0.04_dp)**2                &
      &            * ( Abs(cs)**2 + Abs(cp + 0.04_dp * (ca-cap))**2  )

 End Subroutine Bs_to_MuMu


 Subroutine C1_to_C6(i_loop, mu, as, mt, mW, sW2, Ci)
 !----------------------------------------------------------------------------
 ! calculates C1 to C6 in the SM up to 2-loop order
 ! Formulas are taken from C.Bobeth et al., NPB574 (2000) 291,  hep-ph/9904413
 ! input:
 !   i_loop ......... loop order, 0 ... tree, n ... n-loops
 !   mu ............. scale at which the Wilson coefficients are given
 !   as ............. alpha_s(mu)
 !   mt ............. top mass in the MSbar scheme at Q=mu 
 !   mW ............. W-boson mass
 !   sW2 ............ sin(theta_W) squared
 ! output
 !   Ci(i) .......... Wilson coefficients C_i
 ! written by Werner Porod, 02.12.2005
 !----------------------------------------------------------------------------
 Implicit None
  Integer, Intent(in) :: i_loop
  Real(dp), Intent(in) :: as, mu, mt, mW, sW2
  Complex(dp), Intent(out) :: Ci(6)

  Real(dp) :: asp, L, x, Et0_x

  Iname = Iname + 1
  NameOfUnit(Iname) = "C1_to_C6"
 
  Ci = 0._dp
  !-------------------------------------------
  ! tree level
  !-------------------------------------------
  Ci(2) = -1._dp
  If (i_loop.Eq.0) Then
   Iname = Iname - 1
   Return
  End If
  !-------------------------------------------
  ! 1-loop level
  !-------------------------------------------
  asp = oo4pi * as
  L = Log(mu**2 / mW**2)
  x = (mt/mW)**2
  Et0_x = E_t_0(x)

  Ci(1) = asp * (-15._dp - 6._dp * L)
  Ci(4) = asp * ( (7._dp - 6._dp * L) / 9._dp +  Et0_x)

  If (i_loop.Eq.1) Then
   Iname = Iname - 1
   Return
  End If

  !-------------------------------------------
  ! warning if higher loop level is required
  !-------------------------------------------
  Write(ErrCan,*) "Warning from Routine C1_to_C6"
  Write(ErrCan,*) "required loop order",i_loop,"not yet implemented"
  If (ErrorLevel.Eq.2) Call TerminateProgram()

 End Subroutine C1_to_C6


 Subroutine C_7(i, j, mW, mf_u, cpl_uWd  &
        & , mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R         &
        & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L    &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L       &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, res   )
 !-------------------------------------------------------------------------
 ! coefficient of the operator:
 !  e m_i / (16 Pi^2) \bar{d}_L,j,a \sigma^\mu\nu d_R,i,a F_\mu\nu
 ! a,b, are SU(3) indices
 ! written by Werner Porod, 11.11.02
 !-------------------------------------------------------------------------
 
 Implicit None
  Integer, Intent(in) :: i, j
  Real(dp), Intent(in) :: mW, mf_u(3), mSpm2(:), mC(:), mSup2(:), mf_d(3)  &
     & , mSdown2(:), mGlu, mN(:), mS02(:), mP02(:)
  Complex(dp), Intent(in) :: cpl_uWd(3,3), cpl_CSQQp_L(:,:,:)         &
     & , cpl_CSQQp_R(:,:,:), cpl_CDSu_L(:,:,:), cpl_CDSu_R(:,:,:)     &
     & , cpl_DGSd_L(:,:),  cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:)         &
     & , cpl_DNSd_R(:,:,:), cpl_DDS0_L(:,:,:), cpl_DDS0_R(:,:,:)      &
     & , cpl_DDP0_L(:,:,:), cpl_DDP0_R(:,:,:)
  Complex(dp), Intent(out) :: res(7)
  Integer :: i1, i2, n_i
  Real(dp) :: xt
  
  Iname = Iname + 1
  NameOfUnit(Iname) = "C_7"

  res = 0._dp
  !----------------
  ! standard model
  !----------------
  Do i1=1,3
   xt = (mf_u(i1)/mW)**2
   res(2) = res(2) - Conjg( cpl_uWd(i1, j ) ) * cpl_uWd(i1, i)   &
       &             * xt * (2._dp * F1(xt) + 3._dp * F2(xt) )
  End Do
  res(2) = 0.25_dp * res(2) / mW**2

  !---------------------
  ! charged Higgs boson
  !---------------------
  n_i = Size( mSpm2 )
  Do i1=2,n_i
   Do i2=1,3
    xt = mf_u(i2)**2/mSpm2(i1)
    res(3) = res(3) &
      & - ( Conjg( cpl_CSQQp_R(i1,i,i2) ) * cpl_CSQQp_R(i1,j,i2)  &
      &     * (e_u * F1(xt)   + F2(xt) )                          &
      &   + Conjg( cpl_CSQQp_L(i1,i,i2) ) * cpl_CSQQp_R(i1,j,i2)  &
      &     * mf_u(i2) * (e_u * F3(xt)  + F4(xt) ) / mf_d(i) )   / mSpm2(i1)
   End Do
  End Do
  res(3) = 0.25_dp * res(3) 
  !----------
  ! chargino
  !----------
  n_i = Size( mC )
  Do i1=1,n_i
   Do i2=1,6
    xt = mC(i1)**2/mSup2(i2)
    res(4) = res(4) &
      & + ( Conjg(cpl_CDSu_R(i1,i,i2)) * cpl_CDSu_R(i1,j,i2)    &
      &    * (e_u * F2(xt)  + F1(xt) )                          &
      &   + Conjg( cpl_CDSu_L(i1,i,i2) ) * cpl_CDSu_R(i1,j,i2)  &
      &      * mC(i1) * (e_u * F4(xt)  + F3(xt) ) / mf_d(i)  )  / mSup2(i2)
   End Do
  End Do
  res(4) = 0.25_dp * res(4) 

  If (GenerationMixing) Then
   !----------
   ! gluino
   !----------
   Do i2=1,6
    xt = mGlu**2/mSdown2(i2)
    res(5) = res(5) + ( Conjg(cpl_DGSd_R(i,i2)) * cpl_DGSd_R(j,i2) * F2(xt) &
      &               + Conjg(cpl_DGSd_L(i,i2)) * cpl_DGSd_R(j,i2)          &
      &                 * mGlu * F4(xt) / mf_d(i) )   / mSdown2(i2)
   End Do
   res(5) = e_d * 4._dp * res(5) / 3._dp
   !----------
   ! neutralino
   !----------
   n_i = Size( mN )
   Do i1=1,n_i
    Do i2=1,6
     xt = mN(i1)**2/mSdown2(i2)
     res(6) = res(6) &
      & + ( Conjg( cpl_DNSd_R(i,i1,i2) ) * cpl_DNSd_R(j,i1,i2) * F2(xt)   &
      &   + Conjg( cpl_DNSd_L(i,i1,i2) ) * cpl_DNSd_R(j,i1,i2)            &
      &         * mN(i1) * F4(xt) / mf_d(i) )   / mSdown2(i2)
    End Do
   End Do
   res(6) = 0.25_dp * e_d * res(6) 
   !----------
   ! Higgs
   !----------
   Do i1=1,3
    Do i2=1, Size(mS02)
     xt = mf_d(i1)**2/mS02(i2)
     res(7) = res(7) &
       & + ( Conjg(cpl_DDS0_R(i,i1,i2)) * cpl_DDS0_R(i1,j,i2) * F2(xt) &
       &   + Conjg( cpl_DDS0_L(i,i1,i2) ) * cpl_DDS0_R(i1,j,i2)  &
       &      * mf_d(i1) *  F4(xt) / mf_d(i)  )  / mS02(i2)
    End Do
    Do i2=2, Size(mP02)
     xt = mf_d(i1)**2/mP02(i2)
     res(7) = res(7) &
       & + ( Conjg(cpl_DDP0_R(i1,i,i2)) * cpl_DDP0_R(i1,j,i2) * F2(xt) &
       &   + Conjg( cpl_DDP0_L(i1,i,i2) ) * cpl_DDP0_R(i1,j,i2)  &
       &      * mf_d(i1) *  F4(xt) / mf_d(i)  )  / mP02(i2)
    End Do
   End Do
   res(7) = 0.25_dp * e_d * res(7) 
  End If

  res(1) = Sum( res(2:7) )
  
  Iname = Iname - 1

 End Subroutine C_7

 Subroutine C_7p(i, j, mf_u, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L    &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L       &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, res  )
 !-------------------------------------------------------------------------
 ! coefficient of the operator:
 !  e m_i / (16 Pi^2) \bar{d}_R,j,a \sigma^\mu\nu d_L,i,a F_\mu\nu
 ! a,b, are SU(3) indices
 ! written by Werner Porod, 11.11.02
 !-------------------------------------------------------------------------
 
 Implicit None
  Integer, Intent(in) :: i, j
  Real(dp), Intent(in) :: mf_u(3), mSpm2(:), mC(:), mSup2(:), mf_d(3)  &
     & , mSdown2(:), mGlu, mN(:), mS02(:), mP02(:)
  Complex(dp), Intent(in) :: cpl_CSQQp_L(:,:,:), cpl_CSQQp_R(:,:,:)   &
      & , cpl_CDSu_L(:,:,:), cpl_CDSu_R(:,:,:)                        &
     & , cpl_DGSd_L(:,:),  cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:)         &
     & , cpl_DNSd_R(:,:,:), cpl_DDS0_L(:,:,:), cpl_DDS0_r(:,:,:)      &
     & , cpl_DDP0_L(:,:,:), cpl_DDP0_R(:,:,:)
  Complex(dp), Intent(out) :: res(6)

  Integer :: i1, i2, n_i
  Real(dp) :: xt

  Iname = Iname + 1
  NameOfUnit(Iname) = "C_7p"

  !----------------
  ! standard model
  !----------------
  res = 0._dp
  !---------------------
  ! charged Higgs boson
  !---------------------
  n_i = Size( mSpm2 )
  Do i1=2,n_i
   Do i2=1,3
    xt = mf_u(i2)**2/mSpm2(i1)
    res(2) = res(2) &
      & - ( Conjg( cpl_CSQQp_L(i1,i,i2) ) * cpl_CSQQp_L(i1,j,i2)    &
      &          * (e_u * F1(xt)  + F2(xt) )                        &
      &   + Conjg( cpl_CSQQp_R(i1,i,i2) ) * cpl_CSQQp_L(i1,j,i2)    &
      &          * mf_u(i2) * (e_u * F3(xt)  + F4(xt) ) / mf_d(i) ) &
      &  / mSpm2(i1)
   End Do
  End Do
  res(2) = 0.25_dp * res(2)
  !----------
  ! chargino
  !----------
  n_i = Size( mC )
  Do i1=1,n_i
   Do i2=1,6
    xt = mC(i1)**2/mSup2(i2)
    res(3) = res(3) &
      & + ( Conjg( cpl_CDSu_L(i1,i,i2) ) * cpl_CDSu_L(i1,j,i2)    &
      &                * (e_u * F2(xt)  + F1(xt) )                &
      &   + Conjg( cpl_CDSu_R(i1,i,i2) ) * cpl_CDSu_L(i1,j,i2)    &
      &         * mC(i1) * (e_u * F4(xt)  + F3(xt) ) / mf_d(i))   &
      &  / mSup2(i2)
   End Do
  End Do
  res(3) = 0.25_dp * res(3)

  If (GenerationMixing) Then
   !----------
   ! gluino
   !----------
   Do i2=1,6
    xt = mGlu**2/mSdown2(i2)
    res(4) = res(4) &
      & + ( Conjg( cpl_DGSd_L(i,i2) ) * cpl_DGSd_L(j,i2) * F2(xt)  &
      &   + Conjg( cpl_DGSd_R(i,i2) ) * cpl_DGSd_L(j,i2)           &
      &     * mGlu * F4(xt) / mf_d(i) )    / mSdown2(i2)
   End Do
   res(4) = e_d * 4._dp * res(4) / 3._dp
   !----------
   ! neutralino
   !----------
   n_i = Size( mN )
   Do i1=1,n_i
    Do i2=1,6
     xt = mN(i1)**2/mSdown2(i2)
     res(5) = res(5) &
      & + ( Conjg( cpl_DNSd_L(i,i1,i2) ) * cpl_DNSd_L(j,i1,i2) * F2(xt)  &
      &   + Conjg( cpl_DNSd_R(i,i1,i2) ) * cpl_DNSd_L(j,i1,i2)           &
      &         * mN(i1) * F4(xt) / mf_d(i)  )     / mSdown2(i2)
    End Do
   End Do
   res(5) = 0.25_dp * e_d * res(5) 
   !----------
   ! Higgs
   !----------
    n_i = Size( mS02 )
   Do i1=1,3
    Do i2=1,n_i
     xt = mf_d(i1)**2/mS02(i2)
     res(6) = res(6) &
       & + ( Conjg(cpl_DDS0_L(i1,i,i2)) * cpl_DDS0_L(i1,j,i2) * F2(xt) &
       &   + Conjg( cpl_DDS0_R(i1,i,i2) ) * cpl_DDS0_L(i1,j,i2)  &
       &      * mf_d(i1) *  F4(xt) / mf_d(i)  )  / mS02(i2)
    End Do
    Do i2=2,Size(mP02)
     xt = mf_d(i1)**2/mP02(i2)
     res(6) = res(6) &
       & + ( Conjg(cpl_DDP0_L(i,i1,i2)) * cpl_DDP0_L(i1,j,i2) * F2(xt) &
       &   + Conjg( cpl_DDP0_R(i,i1,i2) ) * cpl_DDP0_L(i1,j,i2)  &
       &      * mf_d(i1) *  F4(xt) / mf_d(i)  )  / mP02(i2)
	End Do
   End Do
   res(6) = 0.25_dp * e_d * res(6) 
  End If

  res(1) = Sum( res(2:6) )
  
  Iname = Iname - 1

 End Subroutine C_7p

 Subroutine C_8(i, j, mW, mf_u, cpl_uWd  &
        & , mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R   &
        & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L    &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L       &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, res)
 !-------------------------------------------------------------------------
 ! coefficient of the operator:
 !  g_s m_i / (16 Pi^2) \bar{d}_L,j,a \sigma^\mu\nu d_R,i,b t_c^ab G^c_\mu\nu
 ! a,b, are SU(3) indices
 ! written by Werner Porod, 11.11.02
 !-------------------------------------------------------------------------
 
 Implicit None
  Integer, Intent(in) :: i, j
  Real(dp), Intent(in) :: mW, mf_u(3), mSpm2(:), mC(:), mSup2(:), mf_d(3)  &
     & , mSdown2(:), mGlu, mN(:), mS02(:), mP02(:)
  Complex(dp), Intent(in) :: cpl_uWd(3,3), cpl_CSQQp_L(:,:,:)         &
     & , cpl_CSQQp_R(:,:,:), cpl_CDSu_L(:,:,:), cpl_CDSu_R(:,:,:)     &
     & , cpl_DGSd_L(:,:),  cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:)         &
     & , cpl_DNSd_R(:,:,:), cpl_DDS0_L(:,:,:), cpl_DDS0_r(:,:,:)      &
     & , cpl_DDP0_L(:,:,:), cpl_DDP0_R(:,:,:)
  Complex(dp), Intent(out) :: res(7)

  Integer :: i1, i2, n_i
  Real(dp) :: xt
  
  Iname = Iname + 1
  NameOfUnit(Iname) = "C_8"

  res = 0._dp
  !----------------------------
  ! standard model
  !----------------------------
  Do i1=1,3
   xt = (mf_u(i1)/mW)**2
   res(2) = res(2) - Conjg( cpl_uWd(i1, j ) ) * cpl_uWd(i1, i) * xt * F1(xt)
  End Do
  res(2) = 0.75_dp * res(2) / mW**2
  !---------------------
  ! charged Higgs boson
  !---------------------
  n_i = Size( mSpm2 )
  Do i1=2,n_i
   Do i2=1,3
    xt = mf_u(i2)**2/mSpm2(i1)
    res(3) = res(3) &
      & - ( Conjg( cpl_CSQQp_R(i1,i,i2) ) * cpl_CSQQp_R(i1,j,i2) * F1(xt)  &
      &   + Conjg( cpl_CSQQp_L(i1,i,i2) ) * cpl_CSQQp_R(i1,j,i2)  &
      &                *  mf_u(i2) * F3(xt) / mf_d(i) )      / mSpm2(i1)
   End Do
  End Do
  res(3) = 0.25_dp * res(3)
  !----------
  ! chargino
  !----------
  n_i = Size( mC )
  Do i1=1,n_i
   Do i2=1,6
    xt = mC(i1)**2/mSup2(i2)
    res(4) = res(4) &
      & + ( Conjg( cpl_CDSu_R(i1,i,i2) ) * cpl_CDSu_R(i1,j,i2) *  F2(xt)    &
      &   + Conjg( cpl_CDSu_L(i1,i,i2) ) * cpl_CDSu_R(i1,j,i2)              &
      &                          * mC(i1) * F4(xt) / mf_d(i))    / mSup2(i2)
   End Do
  End Do
  res(4) = 0.25_dp * res(4)

  If (GenerationMixing) Then
   !----------
   ! gluino
   !----------
   Do i2=1,6
    xt = mGlu**2/mSdown2(i2)
    res(5) = res(5) &
      & + ( Conjg( cpl_DGSd_R(i,i2) ) * cpl_DGSd_R(j,i2)       &
      &                * (4._dp * F1(xt)  + F1(xt) )           &
      &      + Conjg( cpl_DGSd_L(i,i2) ) * cpl_DGSd_R(j,i2)    &
      &         * mGlu * (4._dp * F3(xt) + F3(xt) ) / mf_d(i)) &
      &  / mSdown2(i2)
   End Do
   res(5) = - 0.25_dp * res(5) / 3._dp
   !----------
   ! neutralino
   !----------
   n_i = Size( mN )
   Do i1=1,n_i
    Do i2=1,6
     xt = mN(i1)**2/mSdown2(i2)
     res(6) = res(6) &
      & + ( Conjg( cpl_DNSd_R(i,i1,i2) ) * cpl_DNSd_R(j,i1,i2) * F2(xt)  &
      &   + Conjg( cpl_DNSd_L(i,i1,i2) ) * cpl_DNSd_R(j,i1,i2)           &
      &         * mN(i1) * F4(xt) / mf_d(i) )   / mSdown2(i2)
    End Do
   End Do
   res(6) = 0.25_dp * res(6)
   !----------
   ! Higgs
   !----------
   Do i1=1,3
    Do i2=1,Size(mS02)
     xt = mf_d(i1)**2/mS02(i2)
     res(7) = res(7) &
       & - ( Conjg( cpl_DDS0_R(i,i1,i2) ) * cpl_DDS0_R(i1,j,i2) * F1(xt)  &
       &   + Conjg( cpl_DDS0_L(i,i1,i2) ) * cpl_DDS0_R(i1,j,i2)  &
       &                *  mf_d(i1) * F3(xt) / mf_d(i) )      / mS02(i2)
    End Do
	    Do i2=2,Size(mP02)
     xt = mf_d(i1)**2/mP02(i2)
     res(7) = res(7) &
       & - ( Conjg( cpl_DDP0_R(i,i1,i2) ) * cpl_DDP0_R(i1,j,i2) * F1(xt)  &
       &   + Conjg( cpl_DDP0_L(i,i1,i2) ) * cpl_DDP0_R(i1,j,i2)  &
       &                *  mf_d(i1) * F3(xt) / mf_d(i) )      / mP02(i2)
   End Do
	End Do
   res(7) = 0.25_dp * res(7)
  End If

  res(1) = Sum(res(2:7))

  Iname = Iname - 1

 End Subroutine C_8

 Subroutine C_8p(i, j, mf_u, mf_d, mSpm2, cpl_CSQQp_L, cpl_CSQQp_R &
         & , mC, mSup2, cpl_CDSu_L, cpl_CDSu_R, mGlu, mSdown2, cpl_DGSd_L    &
        & , cpl_DGSd_R, mN,  cpl_DNSd_L, cpl_DNSd_R, mS02, cpl_DDS0_L       &
        & , cpl_DDS0_r, mP02, cpl_DDP0_L, cpl_DDP0_R, res )
 !-------------------------------------------------------------------------
 ! coefficient of the operator:
 !  g_s m_i / (16 Pi^2) \bar{d}_R,j,a \sigma^\mu\nu d_L,i,b t_c^ab G^c_\mu\nu
 ! a,b, are SU(3) indices
 ! written by Werner Porod, 11.11.02
 !-------------------------------------------------------------------------
 
 Implicit None
  Integer, Intent(in) :: i, j
  Real(dp), Intent(in) :: mf_u(3), mSpm2(:), mC(:), mSup2(:), mf_d(3)  &
     & , mSdown2(:), mGlu, mN(:), mS02(:), mP02(:)
  Complex(dp), Intent(in) :: cpl_CSQQp_L(:,:,:), cpl_CSQQp_R(:,:,:)   &
      & , cpl_CDSu_L(:,:,:), cpl_CDSu_R(:,:,:)                        &
     & , cpl_DGSd_L(:,:),  cpl_DGSd_R(:,:), cpl_DNSd_L(:,:,:)         &
     & , cpl_DNSd_R(:,:,:), cpl_DDS0_L(:,:,:), cpl_DDS0_r(:,:,:)      &
     & , cpl_DDP0_L(:,:,:), cpl_DDP0_R(:,:,:)
  Complex(dp), Intent(out) :: res(6)

  Integer :: i1, i2, n_i
  Real(dp) :: xt

  Iname = Iname + 1
  NameOfUnit(Iname) = "C_8p"

  !----------------------------
  ! standard model, tree level
  !----------------------------
  res = 0._dp
  !---------------------
  ! charged Higgs boson
  !---------------------
  n_i = Size( mSpm2 )
  Do i1=2,n_i
   Do i2=1,3
    xt = mf_u(i2)**2/mSpm2(i1)
    res(2) = res(2) &
      & - ( Conjg( cpl_CSQQp_L(i1,i,i2) ) * cpl_CSQQp_L(i1,j,i2) * F1(xt)   &
      &   + Conjg( cpl_CSQQp_R(i1,i,i2) ) * cpl_CSQQp_L(i1,j,i2)            &
      &                * mf_u(i2) * F3(xt) / mf_d(i) ) / mSpm2(i1)
   End Do
  End Do
  res(2) = 0.25_dp * res(2)
  !----------
  ! chargino
  !----------
  n_i = Size( mC )
  Do i1=1,n_i
   Do i2=1,6
    xt = mC(i1)**2/mSup2(i2)
    res(3) = res(3) &
      & + ( Conjg( cpl_CDSu_L(i1,i,i2) ) * cpl_CDSu_L(i1,j,i2) * F2(xt)    &
      &   + Conjg( cpl_CDSu_R(i1,i,i2) ) * cpl_CDSu_L(i1,j,i2)             &
      &                   * mC(i1) * F4(xt) / mf_d(i)    )     / mSup2(i2)
   End Do
  End Do
  res(3) = 0.25_dp * res(3)

  If (GenerationMixing) Then
   !--------
   ! gluino
   !--------
   Do i2=1,6
    xt = mGlu**2/mSdown2(i2)
    res(4) = res(4) &
      & + ( Conjg( cpl_DGSd_L(i,i2) ) * cpl_DGSd_L(j,i2)         &
      &                * (4._dp * F1(xt)  + F1(xt) )             &
      &   + Conjg( cpl_DGSd_R(i,i2) ) * cpl_DGSd_L(j,i2)         &
      &         * mGlu * (4._dp * F3(xt) + F3(xt) ) / mf_d(i))   &
      &  / mSdown2(i2)
   End Do
   res(4) = - 0.25_dp * res(4) / 3._dp
   !----------
   ! neutralino
   !----------
   n_i = Size( mN )
   Do i1=1,n_i
    Do i2=1,6
     xt = mN(i1)**2/mSdown2(i2)
     res(5) = res(5) &
      & + ( Conjg( cpl_DNSd_L(i,i1,i2) ) * cpl_DNSd_L(j,i1,i2) * F2(xt)  &
      &   + Conjg( cpl_DNSd_R(i,i1,i2) ) * cpl_DNSd_L(j,i1,i2)           &
      &                      * mN(i1) * F4(xt) / mf_d(i)     )   / mSdown2(i2)
    End Do
   End Do
   res(5) = 0.25_dp * res(5)
   !----------
   ! Higgs
   !----------
   Do i1=1,3
    Do i2=1,Size(mS02)
     xt = mf_d(i1)**2/mS02(i2)
     res(6) = res(6) &
       & - ( Conjg( cpl_DDS0_L(i,i1,i2) ) * cpl_DDS0_L(i1,j,i2) * F1(xt)  &
       &   + Conjg( cpl_DDS0_R(i,i1,i2) ) * cpl_DDS0_L(i1,j,i2)  &
       &                *  mf_d(i1) * F3(xt) / mf_d(i) )      / mS02(i2)
    End Do
	Do i2=2,Size(mP02)
     xt = mf_d(i1)**2/mP02(i2)
     res(6) = res(6) &
       & - ( Conjg( cpl_DDP0_L(i,i1,i2) ) * cpl_DDP0_L(i1,j,i2) * F1(xt)  &
       &   + Conjg( cpl_DDP0_R(i,i1,i2) ) * cpl_DDP0_L(i1,j,i2)  &
       &                *  mf_d(i1) * F3(xt) / mf_d(i) )      / mP02(i2)
   End Do
	End Do
   res(6) = 0.25_dp * res(6)
  End If

  res(1) = Sum( res(2:6) )
  
  Iname = Iname - 1

 End Subroutine C_8p

 Subroutine C_9(i, j, k, mu, mf_d, mf_u, mf_l, mW2, mHp2, mGlu2, mC2        &
       & , mN2, mSnu2, mSlept2, mSqu2, mSqd2, tanb, U, V, N, RSup, RSdown   &
       & , c_CDSu_L, c_CDSu_R, c_CLSn_L, c_CLSn_R, c_LNSl_L, c_LNSl_R       &
       & , c_DGSd_L, c_DGSd_R, c_DNSd_L, c_DNSd_R                           &
       & , a_s, kappa_q, e2, sW2, l_QCD, c9, c9p, c9_c, c9p_c)
 !---------------------------------------------------------------------------
 ! in this routine the coefficients c_A and c_A' of the effective operator
 !
 !             2 G_F    alpha
 !    H_eff = -------------------- V_ti V_tj^* (c_9 O_A + c_9' O_A')
 !             Sqrt(2) 2 Pi s^2_W
 !
 ! with O_A = (\bar(q) \gamma^\mu P_L b) (\bar(l) \gamma_\mu l)
 !      O_A' = (\bar(q) \gamma^\mu P_R b) (\bar(l) \gamma_\mu l)
 ! for the transitions b -> q l+ l- with q=s,d;  s -> d mu+ mu-;
 ! B_q -> l+ l- and K_L -> mu+ mu- are calculated.
 ! The formulas include QCD corrections and are based on
 ! C.bobeth, A.J.Buras, F.Krueger, J.Urban, NPB 630, (2002) 87
 ! written by Werner Porod, 14.12.2004
 !---------------------------------------------------------------------------
 Implicit None
  Integer, Intent(in) :: i, j              ! indices of the d-type quarks, i>j
  Integer, Intent(in) :: k                 ! generation index of the lepton l
  Real(dp), Intent(in) :: mu               ! renormalization scale
  Real(dp), Intent(in) :: mf_d(3), mf_u(3) ! running d- and u-quark masses at mu
  Real(dp), Intent(in) :: mf_l(3)          ! lepton masses
  Real(dp), Intent(in) :: mW2              ! W-boson mass squared
  Real(dp), Intent(in) :: mHp2(:)             ! mass of charged Higgs boson squared
  Real(dp), Intent(in) :: mglu2            ! gluino mass squared
  Real(dp), Intent(in) :: mC2(:)           ! chargino masses squared
  Real(dp), Intent(in) :: mN2(:)           ! neutralino masses squared
  Real(dp), Intent(in) :: mSnu2(3)         ! sneutrino masses squared
  Real(dp), Intent(in) :: mSlept2(6)       ! slepton masses squared
  Real(dp), Intent(in) :: mSqu2(6)         ! u-squark masses squared
  Real(dp), Intent(in) :: mSqd2(6)         ! d-squark masses squared
  Real(dp), Intent(in) :: a_s              ! alpha_s(mu)
  Real(dp), Intent(in) :: tanb             ! tan(beta) = v_2/v_1
  ! coupling chargino - d-quark - u-squark
  Complex(dp), Intent(in) ::  c_CDSu_L(:,:,:), c_CDSu_R(:,:,:)
  ! coupling neutralino - d-quark - d-squark
  Complex(dp), Intent(in) ::  c_DNSd_L(:,:,:), c_DNSd_R(:,:,:)
  ! coupling gluino - d-quark - d-squark
  Complex(dp), Intent(in) ::  c_DGSd_L(:,:), c_DGSd_R(:,:)
  ! coupling chargino - lepton - sneutrino
  Complex(dp), Intent(in) ::  c_CLSn_L(:,:,:), c_CLSn_R(:,:,:)
  ! coupling neutralino - lepton - slepton
  Complex(dp), Intent(in) ::  c_LNSl_L(:,:,:), c_LNSl_R(:,:,:)
  Complex(dp), Intent(in) :: kappa_Q    ! = (8 sqrt(2) G_F e^2 V_ti V^*_tj)^-1
  Real(dp), Intent(in) :: e2            ! = e^2 = g^2 sin^2(theta_W)
  Real(dp), Intent(in) :: sW2           ! sin^2(theta_W)
  Logical, Intent(in) :: l_QCd          ! if .true. QCD corrections are included
  ! chargino mixing matrices
  Complex(dp), Intent(in) :: U(:,:), V(:,:)
  ! neutralino mixing matrix
  Complex(dp), Intent(in) :: N(:,:)
  ! squark mixing matrices
  Complex(dp), Intent(in) :: RSup(6,6), RSdown(6,6)

  Complex(dp), Intent(out) :: C9, C9p ! Wilson coefficients
  Complex(dp), Intent(out), Optional :: C9_c(6), C9p_c(6) ! Wilson coefficients
    Integer :: i1, i2, i3, i4
  Real(dp) :: x, y, z, x_ij(Size(mC2),Size(mC2)), y_ai(6,Size(mC2)), v_fi(3,Size(mC2)), r_a(6), s_ai(6,Size(mN2)) &
      & , n_bi(6,Size(mN2)), n_ij(Size(mN2),Size(mN2)), Lt, Lua(6), a_sp, x_in
  Complex(dp) :: ZNN(Size(mN2),Size(mN2)), B_L(4), B_R(4), C_L(5), C_R(5), D_L(5), D_R(5) &
      &  , fact, fac(2)

  !----------------------------------
  ! Initialisation
  !----------------------------------
  Iname = Iname + 1
  NameOfUnit(Iname) = "C_9"

  c9 = 0._dp
  c9p = 0._dp
  B_L = 0._dp
  B_R = 0._dp
  C_L = 0._dp
  C_R = 0._dp
  D_L = 0._dp
  D_R = 0._dp

  x = mf_u(3)**2 / mW2
  y = mf_u(3)**2 / mHp2(2)
  z = mHp2(2) / mW2
Do i1=1,Size(mc2)
 Do i2=1,Size(mc2)
  x_ij(i1,i2) = mC2(i1) / mC2(i2)
End Do
End Do
  r_a = mSqd2/mGlu2
  Do i1=1,Size(mC2)
   Do i2=1,6
    y_ai(i2,i1) = mSqu2(i2) / mC2(i1)
   End Do
   Do i2=1,3
    v_fi(i2,i1) = mSnu2(i2) / mC2(i1)
   End Do
  End Do
  Do i1=1,Size(mN2)
   n_ij(i1,i1) = 1._dp
   ZNN(i1,i1) = N(i1,4) * Conjg( N(i1,4) ) - N(i1,3) * Conjg( N(i1,3) )
   Do i2=i1+1,Size(mN2)
    n_ij(i1,i2) = mN2(i1)/mN2(i2)
    n_ij(i2,i1) = 1._dp / n_ij(i1,i2)
    ZNN(i1,i2) = N(i1,4) * Conjg( N(i2,4) ) - N(i1,3) * Conjg( N(i2,3) )
    ZNN(i2,i1) = Conjg( ZNN(i1,i2) ) 
   End Do
   Do i2=1,6
    s_ai(i2,i1) = mSqd2(i2) / mN2(i1)
    n_bi(i2,i1) = mSlept2(i2) / mN2(i1)
   End Do
  End Do

  Lt = Log(mu**2 / mf_u(3)**2)
  Lua = Log(mu**2 / mSqu2)

  a_sp = oo4Pi * a_s
  !-------------------------------------------
  ! SM contribution
  !-------------------------------------------
  If (l_QCD) Then
   C_L(1) = 0.25_dp * (f_1_0(x) + a_sp * (f_1_1(x)+ 8._dp* x * Df_1_0(x) * Lt)) 
   B_L(1) = 0.25_dp * (f_2_0(x) + a_sp * (f_10_1(x) + 8._dp* x *Df_2_0(x) * Lt))
  Else
   C_L(1) = 0.25_dp * f_1_0(x)
   B_L(1) = 0.25_dp * f_2_0(x)
  End If 
  D_L(1) = h_0_1(x)

   C9 = ((1._dp - 4._dp * sW2) * C_L(1) - B_L(1)) / sW2 - D_L(1)
   C9p = ((1._dp - 4._dp * sW2) * C_R(1) - B_R(1)) / sW2 - D_R(1)
  !------------------------------------------
  ! H+ contribution
  !------------------------------------------
  If (l_QCD) Then
   fact = f_2_0(y) * (1._dp + 8._dp * a_sp * Lt) &
      & + a_sp * (f_2_1(y) + 8._dp * y * Df_2_0(y) * Lt)
  Else
   fact = f_2_0(y) 
  End If

  C_L(2) = - 0.125_dp * x * fact / tanb**2 ! m^2_H/m^2_W * y = x
  C_R(2) = 0.125_dp * mf_d(i) * mf_d(j) * tanb**2 * fact / mW2

  If (l_QCD) Then
   fact = f_2_0(y) * (1._dp + 8._dp * a_sp * Lt) &
      & + a_sp * (f_7_1(y) + 8._dp * y * Df_2_0(y) * Lt)
  End If

  B_R(2) = - mf_d(i) * mf_d(j) * tanb**4 * fact * mf_l(k)**2 &
         &       / (16._dp * mHp2(2) * mW2)

  D_L(2) = y * (2._dp/3._dp * h_0_5(y) - h_0_6(y)) / tanb**2
  D_R(2) = - mf_d(i) * mf_d(j) * tanb**4 * mf_l(k)**2  / (16._dp * mHp2(2)**2) &
         & * y * (2._dp/3._dp * h_0_5(y) - h_0_6(y))

  C9 = (1._dp - 4._dp * sW2) * C_L(2) / sW2 - D_L(2)
  C9p = ((1._dp - 4._dp * sW2) * C_R(2) - B_R(2)) / sW2 - D_R(2)

  !------------------------------------------------------------------
  ! Chargino contributions
  ! please note that the couplings to sfermions are complex conjugated
  ! and left-right exchanged compared to my notation
  !------------------------------------------------------------------
  Do i1=1,Size(mC2)
   Do i2=1,Size(mC2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = 2._dp * Sqrt(x_ij(i1,i2))                                      &
         &   * ( f_3_0(x_ij(i1,i2),y_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &     + a_sp * ( f_3_1(x_ij(i1,i2),y_ai(i3,i2))                      &
         &              + y_ai(i3,i2) * Dyf_3_0(x_ij(i1,i2),y_ai(i3,i2))      &
         &                * 4._dp * Lua(i3) ) )
      fac(2) = f_4_0(x_ij(i1,i2),y_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &   + a_sp * ( f_4_1(x_ij(i1,i2),y_ai(i3,i2))                      &
         &            + y_ai(i3,i2) * Dyf_4_0(x_ij(i1,i2),y_ai(i3,i2))      &
                        * 4._dp * Lua(i3))
     Else
      fac(1) = 2._dp * Sqrt(x_ij(i1,i2)) * f_3_0(x_ij(i1,i2),y_ai(i3,i2))
      fac(2) = f_4_0(x_ij(i1,i2),y_ai(i3,i2))
     End If
     C_L(3) = C_L(3) - c_CDSu_R(i1,j,i3) * Conjg(c_CDSu_R(i2,i,i3))     &
         &             * ( fac(1) * U(i1,1) * Conjg(U(i2,1))            &
         &               - fac(2) * V(i2,1) * Conjg(V(i1,1)) )
     C_R(3) = C_R(3) - c_CDSu_L(i1,j,i3) * Conjg(c_CDSu_L(i2,i,i3))     &
          &             * ( fac(1) * V(i2,1) * Conjg(V(i1,1))           &
          &               - fac(2) * U(i1,1) * Conjg(U(i2,1)) )
     Do i4=1,3
      If (l_QCD) Then
       fac(1) = f_5_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
       fac(2) = f_6_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
      Else
       fac(1) = f_5_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
       fac(2) = f_6_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
      End If
      B_L(3) = B_L(3) + Conjg(c_CDSu_R(i2,i,i3))* c_CDSu_R(i1,j,i3) &
          &         * ( 0.5_dp * fac(1) * Conjg(c_CLSn_R(i1,k,i4))          &
          &                    * c_CLSn_R(i2,k,i4)                          &
          &           - fac(2) * Sqrt(x_ij(i1,i2))* c_CLSn_L(i2,k,i4)       &
          &                    * Conjg(c_CLSn_L(i1,k,i4))    ) / mC2(i2)
      B_R(3) = B_R(3) - Conjg(c_CDSu_L(i2,i,i3))*c_CDSu_L(i1,j,i3) &
          &         * ( 0.5_dp * fac(1) * Conjg(c_CLSn_L(i1,k,i4))           &
          &                    * c_CLSn_L(i2,k,i4)                           &
          &           - fac(2) * Sqrt(x_ij(i1,i2))* c_CLSn_R(i2,k,i4)        &
          &                    * Conjg(c_CLSn_R(i1,k,i4))    ) / mC2(i2)

     End Do
    End Do
   End Do
   Do i2=1,6
    x_in = 1._dp / y_ai(i2,i1)
    fac(1) = (2._dp/3._dp * h_0_6(x_in) - h_0_5(x_in)) / mSqu2(i2)
    D_L(3) = D_L(3) + fac(1) * Conjg(c_CDSu_R(i1,i,i2))* c_CDSu_R(i1,j,i2)
    D_R(3) = D_R(3) + fac(1) * Conjg(c_CDSu_L(i1,i,i2))* c_CDSu_L(i1,j,i2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0(y_ai(i2,i1),y_ai(i3,i1)) * (1._dp+4._dp*a_sp*Lua(i3))    &
           & + a_sp * (F_5_1(y_ai(i2,i1),y_ai(i3,i1))                         &
           &          + 4._dp * (y_ai(i2,i1)*DxF_4_0(y_ai(i2,i1),y_ai(i3,i1)) &
           &                    +y_ai(i3,i1)*DyF_4_0(y_ai(i2,i1),y_ai(i3,i1)) &
           &                    ) *Lua(i2) ) 
     Else
      fac(1) = F_4_0( y_ai(i2,i1), y_ai(i3,i1))
     End If
     C_L(3) = C_L(3) - fac(1) * ( RSup(i2,1)*Conjg(RSup(i3,1))      &
         &                      + RSup(i2,2)*Conjg(RSup(i3,2))      &
         &                      + RSup(i2,3)*Conjg(RSup(i3,3))  )   &
         &               * c_CDSu_R(i1,j,i3) * Conjg(c_CDSu_R(i1,i,i2))
     C_R(3) = C_R(3) + fac(1) * ( RSup(i3,4)*Conjg(RSup(i2,4))      &
         &                      + RSup(i3,5)*Conjg(RSup(i2,5))      &
         &                      + RSup(i3,6)*Conjg(RSup(i2,6))  )   &
         &                    * c_CDSu_L(i1,j,i3) * Conjg(c_CDSu_L(i1,i,i2))
    End Do
   End Do
  End Do
  B_L(3) = B_L(3) * Kappa_Q * sW2
  B_R(3) = B_R(3) * Kappa_Q * sW2
  fact = kappa_Q * e2 / (4._dp * mW2)
  C_L(3) = C_L(3) * fact
  C_R(3) = C_R(3) * fact
  fact = 16._dp * fact * mW2
  D_L(3) = D_L(3) * fact
  D_R(3) = D_R(3) * fact

   C9 = ((1._dp - 4._dp * sW2) * C_L(3) - B_L(3)) / sW2 - D_L(3)
   C9p = ((1._dp - 4._dp * sW2) * C_R(3) - B_R(3)) / sW2 - D_R(3)

  !------------------------------------------------------------------
  ! neutralino contributions
  ! please note that the couplings to sfermions are complex conjugated
  ! and left-right exchanged compared to my notation
  !------------------------------------------------------------------
  Do i1=1,Size(mN2)
   Do i2=1,Size(mN2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = 2._dp * Sqrt(n_ij(i1,i2))                                      &
         &   * ( f_3_0(n_ij(i1,i2),s_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &     + a_sp * ( f_3_1(n_ij(i1,i2),s_ai(i3,i2))                      &
         &              + s_ai(i3,i2) * Dyf_3_0(n_ij(i1,i2),s_ai(i3,i2))      &
         &                * 4._dp * Lua(i3) ) )
      fac(2) = f_4_0(n_ij(i1,i2),s_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &   + a_sp * ( f_4_1(n_ij(i1,i2),s_ai(i3,i2))                      &
         &            + s_ai(i3,i2) * Dyf_4_0(n_ij(i1,i2),s_ai(i3,i2))      &
                        * 4._dp * Lua(i3))
     Else
      fac(1) = 2._dp * Sqrt(n_ij(i1,i2)) * f_3_0(n_ij(i1,i2),s_ai(i3,i2))
      fac(2) = f_4_0(n_ij(i1,i2),s_ai(i3,i2))
     End If

     C_L(4) = C_L(4) - (fac(1) * ZNN(i1,i2) + fac(2) * ZNN(i2,i1) )&
         &            * c_DNSd_R(j,i1,i3) * Conjg(c_DNSd_R(i,i2,i3))
     C_R(4) = C_R(4) - (fac(1) * ZNN(i1,i2) + fac(2) * ZNN(i2,i1) )&
         &            * c_DNSd_L(j,i1,i3) * Conjg(c_DNSd_L(i,i2,i3)) 

     Do i4=1,6
      If (l_QCD) Then
       fac(1) = f_5_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
       fac(2) = f_6_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
      Else
       fac(1) = f_5_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
       fac(2) = f_6_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
      End If
      B_L(4) = B_L(4) - Conjg(c_DNSd_R(i,i2,i3))* c_DNSd_R(j,i1,i3) &
          &         * ( 0.5_dp * fac(1)                                      &
          &               * (- Conjg(c_LNSl_R(k,i1,i4)) * c_LNSl_R(k,i2,i4)   &
          &                 + Conjg(c_LNSl_L(k,i2,i4)) * c_LNSl_L(k,i1,i4) ) &
          &           + fac(2) * Sqrt(n_ij(i1,i2))                           &
          &               * ( c_LNSl_L(k,i2,i4) * Conjg(c_LNSl_L(k,i1,i4))   &
          &                 - c_LNSl_R(k,i1,i4) * Conjg(c_LNSl_R(k,i2,i4)) ) &
          &           ) / mN2(i2)
      B_R(4) = B_R(4) + Conjg(c_DNSd_L(i,i2,i3))*c_DNSd_L(j,i1,i3) &
          &         * ( 0.5_dp * fac(1)                                      &
          &               * ( Conjg(c_LNSl_L(k,i1,i4)) * c_LNSl_L(k,i2,i4)   &
          &                 + Conjg(c_LNSl_R(k,i2,i4)) * c_LNSl_R(k,i1,i4) ) &
          &           + fac(2) * Sqrt(n_ij(i1,i2))                           &
          &               * ( c_LNSl_R(k,i2,i4) * Conjg(c_LNSl_R(k,i1,i4))   &
          &                 - c_LNSl_L(k,i1,i4) * Conjg(c_LNSl_L(k,i2,i4)) ) &
          &           ) / mN2(i2)

     End Do
    End Do
   End Do
   Do i2=1,6
    x_in = 1._dp/s_ai(i2,i1)
    fac(1) = h_0_6(x_in) / mSqd2(i2)
    D_L(4) = D_L(4) + fac(1) * Conjg(c_DNSd_R(i,i1,i2))* c_DNSd_R(j,i1,i2)
    D_R(4) = D_R(4) + fac(1) * Conjg(c_DNSd_L(i,i1,i2))* c_DNSd_L(j,i1,i2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0(s_ai(i2,i1),s_ai(i3,i1)) * (1._dp+4._dp*a_sp*Lua(i3))    &
           & + a_sp * (F_5_1(s_ai(i2,i1),s_ai(i3,i1))                         &
           &          + 4._dp * (s_ai(i2,i1)*DxF_4_0(s_ai(i2,i1),s_ai(i3,i1)) &
           &                    +s_ai(i3,i1)*DyF_4_0(s_ai(i2,i1),s_ai(i3,i1)) &
           &                    ) *Lua(i2) ) 
     Else
      fac(1) = F_4_0( s_ai(i2,i1), s_ai(i3,i1))
     End If
     C_L(4) = C_L(4) - fac(1) * ( RSdown(i3,4)*Conjg(RSdown(i2,4))      &
         &                      + RSdown(i3,5)*Conjg(RSdown(i2,5))      &
         &                      + RSdown(i3,6)*Conjg(RSdown(i2,6))  )   &
         &                    * c_DNSd_R(j,i1,i3) * Conjg(c_DNSd_R(i,i1,i2))
     C_R(4) = C_R(4) + fac(1) * ( RSdown(i3,1)*Conjg(RSdown(i2,1))      &
         &                      + RSdown(i3,2)*Conjg(RSdown(i2,2))      &
         &                      + RSdown(i3,3)*Conjg(RSdown(i2,3))  )   &
         &                    * c_DNSd_L(j,i1,i3) * Conjg(c_DNSd_L(i,i1,i2))
    End Do
   End Do
    
  End Do
  B_L(4) = B_L(4) * Kappa_Q * sW2
  B_R(4) = B_R(4) * Kappa_Q * sW2
  fact = kappa_Q * e2 / (4._dp * mW2)
  C_L(4) = C_L(4) * fact
  C_R(4) = C_R(4) * fact
  fact = - 4._dp * kappa_Q * e2 / 3._dp
  D_L(4) = D_L(4) * fact
  D_R(4) = D_R(4) * fact

  !------------------------------------------------------------------
  ! gluino contributions
  !------------------------------------------------------------------
   Do i2=1,6
    x_in = 1._dp/r_a(i2)
    fac(1) = h_0_6(x_in) / mSqd2(i2)
    D_L(5) = D_L(5) + fac(1) * Conjg(c_DGSd_R(i,i2))* c_DGSd_R(j,i2)
    D_R(5) = D_R(5) + fac(1) * Conjg(c_DGSd_L(i,i2))* c_DGSd_L(j,i2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0( r_a(i2), r_a(i3))
     Else
      fac(1) = F_4_0( r_a(i2), r_a(i3))
     End If
     C_L(5) = C_L(5) - fac(1) * ( RSdown(i3,4)*Conjg(RSdown(i2,4))      &
         &                      + RSdown(i3,5)*Conjg(RSdown(i2,5))      &
         &                      + RSdown(i3,6)*Conjg(RSdown(i2,6))  )   &
         &                    * c_DGSd_R(j,i3) * Conjg(c_DGSd_R(i,i2))
     C_R(5) = C_R(5) + fac(1) * ( RSdown(i3,1)*Conjg(RSdown(i2,1))      &
         &                      + RSdown(i3,2)*Conjg(RSdown(i2,2))      &
         &                      + RSdown(i3,3)*Conjg(RSdown(i2,3))  )   &
         &                    * c_DGSd_L(j,i3) * Conjg(c_DGSd_L(i,i2))
    End Do
   End Do
  fact = 4._dp * kappa_Q * e2  / (3._dp * mW2)
  C_L(5) = C_L(5) * fact
  C_R(5) = C_R(5) * fact
  fact = - 64._dp * kappa_Q * e2 / 9._dp
  D_L(5) = D_L(5) * fact
  D_R(5) = D_R(5) * fact

  C9 = ((1._dp - 4._dp * sW2) *Sum(C_L) - Sum(B_L)) / sW2 - Sum(D_L)
  C9p = ((1._dp - 4._dp * sW2) * Sum(C_R) - Sum(B_R)) / sW2 - Sum(D_R)
  !---------------------
  ! c-quark contribution
  !---------------------

  C9 = c9 + 38._dp/27._dp - 4._dp * Log(mu**2/mW2)/ 9._dp

  If (Present(c9_c)) Then
   c9_c(1) = c9
   c9_c(2:6) = ((1._dp - 4._dp * sW2) * C_L ) / sW2 - D_L
   c9_c(2) = c9_c(2) + 38._dp/27._dp - 4._dp * Log(mu**2/mW2)/ 9._dp
   c9_c(2:5) =c9_c(2:5) - B_L / sW2
  End If
  If (Present(c9p_c)) Then
   c9p_c(1) = c9p
   c9p_c(2:6) = ((1._dp - 4._dp * sW2) * C_R ) / sW2 - D_R
   c9p_c(2:5) =c9p_c(2:5) - B_R / sW2
  End If

  Iname = Iname - 1

 End Subroutine C_9


 Subroutine C_10_10p(i, j, k, mu, mf_d, mf_u, mf_l, mW2, mHp2, mGlu2, mC2 &
       & , mN2, mSnu2, mSlept2, mSqu2, mSqd2, tanb, U, V, N, RSup, RSdown     &
       & , c_CDSu_L, c_CDSu_R, c_CLSn_L, c_CLSn_R, c_LNSl_L, c_LNSl_R  &
       & , c_DGSd_L, c_DGSd_R, c_DNSd_L, c_DNSd_R  &
       & , a_s, kappa_q, e2, sW2, l_QCD, c_A, c_Ap, c10_c, c10p_c)
 !---------------------------------------------------------------------------
 ! in this routine the coefficients c_A and c_A' of the effective operator
 !
 !             2 G_F    alpha
 !    H_eff = -------------------- V_ti V_tj^* (c_A O_A + c_A' O_A')
 !             Sqrt(2) 2 Pi s^2_W
 !
 ! with O_A = (\bar(q) \gamma^\mu P_L b) (\bar(l) \gamma_\mu gamma_5 l)
 !      O_A' = (\bar(q) \gamma^\mu P_R b) (\bar(l) \gamma_\mu gamma_5 l)
 ! for the transitions b -> q l+ l- with q=s,d;  s -> d mu+ mu-;
 ! B_q -> l+ l- and K_L -> mu+ mu- are calculated.
 ! The formulas include QCD corrections and are based on
 ! C.Bobeth, A.J.Buras, F.Krueger, J.Urban, NPB 630, (2002) 87
 ! written by Werner Porod, 14.12.2004
 !---------------------------------------------------------------------------
 Implicit None
  Integer, Intent(in) :: i, j              ! indices of the d-type quarks, i>j
  Integer, Intent(in) :: k                 ! generation index of the lepton l
  Real(dp), Intent(in) :: mu               ! renormalization scale
  Real(dp), Intent(in) :: mf_d(3), mf_u(3) ! running d- and u-quark masses at mu
  Real(dp), Intent(in) :: mf_l(3)          ! lepton masses
  Real(dp), Intent(in) :: mW2              ! W-boson mass squared
  Real(dp), Intent(in) :: mHp2(:)             ! mass of charged Higgs boson squared
  Real(dp), Intent(in) :: mglu2            ! gluino mass squared
  Real(dp), Intent(in) :: mC2(:)           ! chargino masses squared
  Real(dp), Intent(in) :: mN2(:)           ! neutralino masses squared
  Real(dp), Intent(in) :: mSnu2(3)         ! sneutrino masses squared
  Real(dp), Intent(in) :: mSlept2(6)       ! slepton masses squared
  Real(dp), Intent(in) :: mSqu2(6)         ! u-squark masses squared
  Real(dp), Intent(in) :: mSqd2(6)         ! d-squark masses squared
  Real(dp), Intent(in) :: a_s              ! alpha_s(mu)
  Real(dp), Intent(in) :: tanb             ! tan(beta) = v_2/v_1
  ! coupling chargino - d-quark - u-squark
  Complex(dp), Intent(in) ::  c_CDSu_L(:,:,:), c_CDSu_R(:,:,:)
  ! coupling neutralino - d-quark - d-squark
  Complex(dp), Intent(in) ::  c_DNSd_L(:,:,:), c_DNSd_R(:,:,:)
  ! coupling gluino - d-quark - d-squark
  Complex(dp), Intent(in) ::  c_DGSd_L(:,:), c_DGSd_R(:,:)
  ! coupling chargino - lepton - sneutrino
  Complex(dp), Intent(in) ::  c_CLSn_L(:,:,:), c_CLSn_R(:,:,:)
  ! coupling neutralino - lepton - slepton
  Complex(dp), Intent(in) ::  c_LNSl_L(:,:,:), c_LNSl_R(:,:,:)
  Complex(dp), Intent(in) :: kappa_Q    ! = (8 sqrt(2) G_F e^2 V_ti V^*_tj)^-1
  Real(dp), Intent(in) :: e2            ! = e^2 = g^2 sin^2(theta_W)
  Real(dp), Intent(in) :: sW2           ! sin^2(theta_W)
  Logical, Intent(in) :: l_QCd          ! if .true. QCD corrections are included
  ! chargino mixing matrices
  Complex(dp), Intent(in) :: U(:,:), V(:,:)
  ! neutralino mixing matrix
  Complex(dp), Intent(in) :: N(:,:)
  ! squark mixing matrices
  Complex(dp), Intent(in) :: RSup(6,6), RSdown(6,6)
!  Real(dp), intent(in) ::   !
  Complex(dp), Intent(out) :: C_A, C_Ap ! Wilson coefficients
  Complex(dp), Intent(out), Optional :: C10_c(6),C10p_c(6) ! Wilson coefficients
                                                 ! + individual contributions

  Integer :: i1, i2, i3, i4
  Real(dp) :: x, y, z, x_ij(Size(mc2),Size(mc2)), y_ai(6,Size(mc2)), v_fi(3,Size(mc2)), r_a(6), s_ai(6,Size(mN2)) &
      & , n_bi(6,Size(mN2)), n_ij(Size(mN2),Size(mN2)), Lt, Lua(6), a_sp
  Complex(dp) :: ZNN(Size(mN2),Size(mN2)), fact, fac(2), c_L(5), c_R(5), B_L(4), B_R(4)

  !----------------------------------
  ! Initialisation
  !----------------------------------
  Iname = Iname + 1
  NameOfUnit(Iname) = "C_QdQdLL_AAp"

  C_A = 0._dp
  C_Ap = 0._dp
  B_L = 0._dp
  B_R = 0._dp
  C_L = 0._dp
  C_R = 0._dp

  x = mf_u(3)**2 / mW2
  y = mf_u(3)**2 / mHp2(2)
  z = mHp2(2) / mW2
Do i1=1,Size(mc2)
 Do i2=1,Size(mc2)
  x_ij(i1,i2) = mC2(i1) / mC2(i2)
End Do
End Do
  r_a = mSqd2/mGlu2
  Do i1=1,Size(mc2)
   Do i2=1,6
    y_ai(i2,i1) = mSqu2(i2) / mC2(i1)
   End Do
   Do i2=1,3
    v_fi(i2,i1) = mSnu2(i2) / mC2(i1)
   End Do
  End Do
  Do i1=1,Size(mN2)
   n_ij(i1,i1) = 1._dp
   ZNN(i1,i1) = N(i1,4) * Conjg( N(i1,4) ) - N(i1,3) * Conjg( N(i1,3) )
   Do i2=i1+1,Size(mN2)
    n_ij(i1,i2) = mN2(i1)/mN2(i2)
    n_ij(i2,i1) = 1._dp / n_ij(i1,i2)
    ZNN(i1,i2) = N(i1,4) * Conjg( N(i2,4) ) - N(i1,3) * Conjg( N(i2,3) )
    ZNN(i2,i1) = Conjg( ZNN(i1,i2) ) 
   End Do
   Do i2=1,6
    s_ai(i2,i1) = mSqd2(i2) / mN2(i1)
    n_bi(i2,i1) = mSlept2(i2) / mN2(i1)
   End Do
  End Do

  Lt = Log(mu**2 / mf_u(3)**2)
  Lua = Log(mu**2 / mSqu2)

  a_sp = oo4Pi * a_s
  !-------------------------------------------
  ! SM contribution
  !-------------------------------------------
  If (l_QCD) Then
   C_L(1) = - 0.25_dp *(f_1_0(x) + a_sp * (f_1_1(x)+ 8._dp* x * Df_1_0(x) * Lt))
   B_L(1) = 0.25_dp *(f_2_0(x) + a_sp * (f_10_1(x) + 8._dp * x * Df_2_0(x) * Lt))
  Else
   C_L(1) = - 0.25_dp * f_1_0(x)
   B_L(1) = 0.25_dp * f_2_0(x)
  End If
                         
  !------------------------------------------
  ! H+ contribution
  !------------------------------------------
  If (l_QCD) Then
   fact = f_2_0(y) * (1._dp + 8._dp * a_sp * Lt) &
      & + a_sp * (f_2_1(y) + 8._dp * y * Df_2_0(y) * Lt)
  Else
   fact = f_2_0(y) 
  End If

  C_L(2) = 0.125_dp * x * fact / tanb**2 ! m^2_H/m^2_W * y = x
  C_R(2) = - 0.125_dp * mf_d(i) * mf_d(j) * tanb**2 * fact / mW2

  If (l_QCD) Then
   fact = f_2_0(y) * (1._dp + 8._dp * a_sp * Lt) &
      & + a_sp * (f_7_1(y) + 8._dp * y * Df_2_0(y) * Lt)
  End If

  B_R(2) = - mf_d(i) * mf_d(j) * tanb**4 * fact * mf_l(k)**2 &
      &              / (16._dp * mHp2(2) * mW2)

  !------------------------------------------------------------------
  ! Chargino contributions
  ! please note that the couplings to sfermions are complex conjugated
  ! and left-right exchanged compared to my notation
  !------------------------------------------------------------------
  Do i1=1,Size(mC2)
   Do i2=1,Size(mC2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = 2._dp * Sqrt(x_ij(i1,i2))                                      &
         &   * ( f_3_0(x_ij(i1,i2),y_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &     + a_sp * ( f_3_1(x_ij(i1,i2),y_ai(i3,i2))                      &
         &              + y_ai(i3,i2) * Dyf_3_0(x_ij(i1,i2),y_ai(i3,i2))      &
         &                * 4._dp * Lua(i3) ) )
      fac(2) = f_4_0(x_ij(i1,i2),y_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &   + a_sp * ( f_4_1(x_ij(i1,i2),y_ai(i3,i2))                      &
         &            + y_ai(i3,i2) * Dyf_4_0(x_ij(i1,i2),y_ai(i3,i2))      &
                        * 4._dp * Lua(i3))
     Else
      fac(1) = 2._dp * Sqrt(x_ij(i1,i2)) * f_3_0(x_ij(i1,i2),y_ai(i3,i2))
      fac(2) = f_4_0(x_ij(i1,i2),y_ai(i3,i2))
     End If
     C_L(3) = C_L(3) + c_CDSu_R(i1,j,i3) * Conjg(c_CDSu_R(i2,i,i3))     &
         &             * ( fac(1) * U(i1,1) * Conjg(U(i2,1))            &
         &               - fac(2) * V(i2,1) * Conjg(V(i1,1)) )
     C_R(3) = C_R(3) + c_CDSu_L(i1,j,i3) * Conjg(c_CDSu_L(i2,i,i3))     &
          &             * ( fac(1) * V(i2,1) * Conjg(V(i1,1))           &
          &               - fac(2) * U(i1,1) * Conjg(U(i2,1)) )
     Do i4=1,3
      If (l_QCD) Then
       fac(1) = f_5_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
       fac(2) = f_6_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
      Else
       fac(1) = f_5_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
       fac(2) = f_6_0(x_ij(i1,i2), y_ai(i3,i2), v_fi(i4,i2) )
      End If
      B_L(3) = B_L(3) + Conjg(c_CDSu_R(i2,i,i3))* c_CDSu_R(i1,j,i3)      &
          &         * ( 0.5_dp * fac(1) * Conjg(c_CLSn_R(i1,k,i4))       &
          &                    * c_CLSn_R(i2,k,i4)                       &
          &           + fac(2) * Sqrt(x_ij(i1,i2))* c_CLSn_L(i2,k,i4)    &
          &                    * Conjg(c_CLSn_L(i1,k,i4))    ) / mC2(i2)
      B_R(3) = B_R(3) - Conjg(c_CDSu_L(i2,i,i3))*c_CDSu_L(i1,j,i3)       &
          &         * ( 0.5_dp * fac(1) * Conjg(c_CLSn_L(i1,k,i4))       &
          &                    * c_CLSn_L(i2,k,i4)                       &
          &           + fac(2) * Sqrt(x_ij(i1,i2))* c_CLSn_R(i2,k,i4)    &
          &                    * Conjg(c_CLSn_R(i1,k,i4))    ) / mC2(i2)

     End Do
    End Do
   End Do
   Do i2=1,6
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0(y_ai(i2,i1),y_ai(i3,i1)) * (1._dp+4._dp*a_sp*Lua(i3))    &
           & + a_sp * (F_5_1(y_ai(i2,i1),y_ai(i3,i1))                         &
           &          + 4._dp * (y_ai(i2,i1)*DxF_4_0(y_ai(i2,i1),y_ai(i3,i1)) &
           &                    +y_ai(i3,i1)*DyF_4_0(y_ai(i2,i1),y_ai(i3,i1)) &
           &                    ) *Lua(i2) ) 
     Else
      fac(1) = F_4_0( y_ai(i2,i1), y_ai(i3,i1))
     End If
     C_L(3) = C_L(3) + fac(1) * ( RSup(i2,1)*Conjg(RSup(i3,1))      &
         &                      + RSup(i2,2)*Conjg(RSup(i3,2))      &
         &                      + RSup(i2,3)*Conjg(RSup(i3,3))  )   &
         &               * c_CDSu_R(i1,j,i3) * Conjg(c_CDSu_R(i1,i,i2))
     C_R(3) = C_R(3) - fac(1) * ( RSup(i3,4)*Conjg(RSup(i2,4))      &
         &                      + RSup(i3,5)*Conjg(RSup(i2,5))      &
         &                      + RSup(i3,6)*Conjg(RSup(i2,6))  )   &
         &                    * c_CDSu_L(i1,j,i3) * Conjg(c_CDSu_L(i1,i,i2))
    End Do
   End Do
    
  End Do
  B_L(3) = kappa_Q *sW2 * B_L(3)
  B_R(3) = kappa_Q *sW2 * B_R(3)
  fact = kappa_Q * e2 / (4._dp * mW2)
  C_L(3) = fact * C_L(3)
  C_R(3) = fact * C_R(3)

  !------------------------------------------------------------------
  ! neutralino contributions
  ! please note that the couplings to sfermions are complex conjugated
  ! and left-right exchanged compared to my notation
  !------------------------------------------------------------------
  Do i1=1,Size(mN2)
   Do i2=1,Size(mN2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = 2._dp * Sqrt(n_ij(i1,i2))                                      &
         &   * ( f_3_0(n_ij(i1,i2),s_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &     + a_sp * ( f_3_1(n_ij(i1,i2),s_ai(i3,i2))                      &
         &              + s_ai(i3,i2) * Dyf_3_0(n_ij(i1,i2),s_ai(i3,i2))      &
         &                * 4._dp * Lua(i3) ) )
      fac(2) = f_4_0(n_ij(i1,i2),s_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &   + a_sp * ( f_4_1(n_ij(i1,i2),s_ai(i3,i2))                      &
         &            + s_ai(i3,i2) * Dyf_4_0(n_ij(i1,i2),s_ai(i3,i2))      &
                        * 4._dp * Lua(i3))
     Else
      fac(1) = 2._dp * Sqrt(n_ij(i1,i2)) * f_3_0(n_ij(i1,i2),s_ai(i3,i2))
      fac(2) = f_4_0(n_ij(i1,i2),s_ai(i3,i2))
     End If
     fac(1) = fac(1) * ZNN(i1,i2) + fac(2) * ZNN(i2,i1)
     C_L(4) = C_L(4) + fac(1) * c_DNSd_R(j,i1,i3) * Conjg(c_DNSd_R(i,i2,i3))
     C_R(4) = C_R(4) + fac(1) * c_DNSd_L(j,i1,i3) * Conjg(c_DNSd_L(i,i2,i3)) 
     Do i4=1,6
      If (l_QCD) Then
       fac(1) = f_5_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
       fac(2) = f_6_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
      Else
       fac(1) = f_5_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
       fac(2) = f_6_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
      End If
      B_L(4) = B_L(4) + Conjg(c_DNSd_R(i,i2,i3))* c_DNSd_R(j,i1,i3) &
          &         * ( 0.5_dp * fac(1)                                      &
          &               * ( Conjg(c_LNSl_R(k,i1,i4)) * c_LNSl_R(k,i2,i4)   &
          &                 + Conjg(c_LNSl_L(k,i2,i4)) * c_LNSl_L(k,i1,i4) ) &
          &           + fac(2) * Sqrt(n_ij(i1,i2))                           &
          &               * ( c_LNSl_L(k,i2,i4) * Conjg(c_LNSl_L(k,i1,i4))   &
          &                 + c_LNSl_R(k,i1,i4) * Conjg(c_LNSl_R(k,i2,i4)) ) &
          &           ) / mN2(i2)
      B_R(4) = B_R(4) - Conjg(c_DNSd_L(i,i2,i3))*c_DNSd_L(j,i1,i3) &
          &         * ( 0.5_dp * fac(1)                                      &
          &               * ( Conjg(c_LNSl_L(k,i1,i4)) * c_LNSl_L(k,i2,i4)   &
          &                 + Conjg(c_LNSl_R(k,i2,i4)) * c_LNSl_R(k,i1,i4) ) &
          &           + fac(2) * Sqrt(n_ij(i1,i2))                           &
          &               * ( c_LNSl_R(k,i2,i4) * Conjg(c_LNSl_R(k,i1,i4))   &
          &                 + c_LNSl_L(k,i1,i4) * Conjg(c_LNSl_L(k,i2,i4)) ) &
          &           ) / mN2(i2)

     End Do
    End Do
   End Do
   Do i2=1,6
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0(s_ai(i2,i1),s_ai(i3,i1)) * (1._dp+4._dp*a_sp*Lua(i3))    &
           & + a_sp * (F_5_1(s_ai(i2,i1),s_ai(i3,i1))                         &
           &          + 4._dp * (s_ai(i2,i1)*DxF_4_0(s_ai(i2,i1),s_ai(i3,i1)) &
           &                    +s_ai(i3,i1)*DyF_4_0(s_ai(i2,i1),s_ai(i3,i1)) &
           &                    ) *Lua(i2) ) 
     Else
      fac(1) = F_4_0( s_ai(i2,i1), s_ai(i3,i1))
     End If
     C_L(4) = C_L(4) + fac(1) * ( RSdown(i3,4)*Conjg(RSdown(i2,4))      &
         &                      + RSdown(i3,5)*Conjg(RSdown(i2,5))      &
         &                      + RSdown(i3,6)*Conjg(RSdown(i2,6))  )   &
         &                    * c_DNSd_R(j,i1,i3) * Conjg(c_DNSd_R(i,i1,i2))
     C_R(4) = C_R(4) - fac(1) * ( RSdown(i3,1)*Conjg(RSdown(i2,1))      &
         &                      + RSdown(i3,2)*Conjg(RSdown(i2,2))      &
         &                      + RSdown(i3,3)*Conjg(RSdown(i2,3))  )   &
         &                    * c_DNSd_L(j,i1,i3) * Conjg(c_DNSd_L(i,i1,i2))
    End Do
   End Do
    
  End Do

  B_L(4) = kappa_Q *sW2 * B_L(4)
  B_R(4) = kappa_Q *sW2 * B_R(4)

  fact = kappa_Q * e2 / (4._dp * mW2)
  C_L(4) = fact * C_L(4)
  C_R(4) = fact * C_R(4)
  !------------------------------------------------------------------
  ! gluino contributions
  !------------------------------------------------------------------
  fact = 4._dp * kappa_Q * e2  / (3._dp * mW2)

   Do i2=1,6
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0( r_a(i2), r_a(i3))
     Else
      fac(1) = F_4_0( r_a(i2), r_a(i3))
     End If
     C_L(5) = C_L(5) + fac(1) * ( RSdown(i3,4)*Conjg(RSdown(i2,4))      &
         &                      + RSdown(i3,5)*Conjg(RSdown(i2,5))      &
         &                      + RSdown(i3,6)*Conjg(RSdown(i2,6))  )   &
         &                    * c_DGSd_R(j,i3) * Conjg(c_DGSd_R(i,i2))
     C_R(5) = C_R(5) - fac(1) * ( RSdown(i3,1)*Conjg(RSdown(i2,1))      &
         &                      + RSdown(i3,2)*Conjg(RSdown(i2,2))      &
         &                      + RSdown(i3,3)*Conjg(RSdown(i2,3))  )   &
         &                    * c_DGSd_L(j,i3) * Conjg(c_DGSd_L(i,i2))
    End Do
   End Do
   c_L(5) = c_L(5) * fact
   c_R(5) = c_R(5) * fact

  c_a = (Sum(C_L) + Sum(B_L)) / sW2
  c_ap= (Sum(C_R) + sum(B_R)) / sW2

  If (Present(c10_c)) Then
   c10_c(1) = c_a
   c10_c(2:6) = C_L / sW2
   c10_c(2:5) =c10_c(2:5) + B_L / sW2
  End If
  If (Present(c10p_c)) Then
   c10p_c(1) = c_ap
   c10p_c(2:6) = C_R / sW2
   c10p_c(2:5) =c10p_c(2:5) + B_R / sW2
  End If

  Iname = Iname - 1

 End Subroutine C_10_10p


 Subroutine  C_11_11p(i, j, k, mu, mf_d, mf_u, mf_l, mW2, mHp2, mGlu2, mC2 &
            & , mN2, mSnu2, mSlept2, mSqu2, mSqd2, tanb, U, V, N, RSup, RSdown &
            & , c_CDSu_L, c_CDSu_R, c_CNuSl_R, c_NuNSn_R, c_DNSd_L, c_DNSd_R   &
            & , c_DGSd_L, c_DGSd_R, a_s, kappa_q, e2, sW2, l_QCD               &
            & , c11, c11p, C11_c, C11p_c)
 !---------------------------------------------------------------------------
 ! in this routine the coefficients c_L and c_R of the effective operator
 !
 !             4 G_F    alpha
 !    H_eff = -------------------- V_ti V_tj^* (c11 O_L + c11p O_R)
 !             Sqrt(2) 2 Pi s^2_W
 !
 ! for the transitions b -> q nu nu with q=s,d and s -> d nu nu are
 ! calculated. 
 ! The formulas include QCD corrections and are based on
 ! C.Bobeth, A.J.Buras, F.Krueger, J.Urban, NPB 630, (2002) 87
 ! written by Werner Porod, 10.11.2004
 !---------------------------------------------------------------------------
 Implicit None
  Integer, Intent(in) :: i, j              ! indices of the d-type quarks, i>j
  Integer, Intent(in) :: k                 ! generation index of neutrinos
  Real(dp), Intent(in) :: mu               ! renormalization scale
  Real(dp), Intent(in) :: mf_d(3), mf_u(3) ! running d- and u-quark masses at mu
  Real(dp), Intent(in) :: mf_l(3)          ! lepton masses
  Real(dp), Intent(in) :: mW2              ! W-boson mass squared
  Real(dp), Intent(in) :: mHp2(:)             ! mass of charged Higgs boson squared
  Real(dp), Intent(in) :: mglu2            ! gluino mass squared
  Real(dp), Intent(in) :: mC2(:)           ! chargino masses squared
  Real(dp), Intent(in) :: mN2(:)           ! neutralino masses squared
  Real(dp), Intent(in) :: mSnu2(3)         ! sneutrino masses squared
  Real(dp), Intent(in) :: mSlept2(6)       ! slepton masses squared
  Real(dp), Intent(in) :: mSqu2(6)         ! u-squark masses squared
  Real(dp), Intent(in) :: mSqd2(6)         ! d-squark masses squared
  Real(dp), Intent(in) :: a_s              ! alpha_s(mu)
  Real(dp), Intent(in) :: tanb             ! tan(beta) = v_2/v_1
  Real(dp), Intent(in) :: e2               ! = e^2 = g^2 sin^2(theta_W)
  Real(dp), Intent(in) :: sW2              ! sin^2(theta_W)
  ! chargino mixing matrices
  Complex(dp), Intent(in) :: U(:,:), V(:,:)
  ! neutralino mixing matrix
  Complex(dp), Intent(in) :: N(:,:)
  ! squark mixing matrices
  Complex(dp), Intent(in) :: RSup(6,6), RSdown(6,6)
  ! coupling chargino - d-quark - u-squark
  Complex(dp), Intent(in) ::  c_CDSu_L(:,:,:), c_CDSu_R(:,:,:)
  ! coupling neutralino - d-quark - d-squark
  Complex(dp), Intent(in) ::  c_DNSd_L(:,:,:), c_DNSd_R(:,:,:)
  ! coupling gluino - d-quark - d-squark
  Complex(dp), Intent(in) ::  c_DGSd_L(:,:), c_DGSd_R(:,:)
  ! coupling chargino - neutrino - slepton
  Complex(dp), Intent(in) ::  c_CNuSl_R(:,:,:)
  ! coupling neutralino - neutrino - sneutrino
  Complex(dp), Intent(in) ::  c_NuNSn_R(:,:,:)
  Complex(dp), Intent(in) :: kappa_Q       ! = (8 sqrt(2) G_F e^2 V_ti V^*_tj)^-1
  Logical, Intent(in) :: l_QCd          ! if .true. QCD corrections are included
  
  Complex(dp), Intent(out) :: c11, c11p ! Wilson coefficients
  Complex(dp), Intent(out), Optional :: C11_c(6),C11p_c(6) ! Wilson coefficients
                                                 ! + individual contributions

  Integer :: i1, i2, i3, i4
  Real(dp) :: x, y, z, x_ij(Size(mc2),Size(mc2)), y_ai(6,Size(mc2)), z_bi(6,Size(mc2)), r_a(6), s_ai(6,Size(mN2)) &
      & , n_bi(3,Size(mN2)), n_ij(Size(mN2),Size(mN2)), Lt, Lua(6), a_sp
  Complex(dp) :: ZNN(Size(mn2),Size(mn2)), fact, c_L(5), c_R(5), b_L(5), b_R(5), fac(2)
  !----------------------------------
  ! Initialisation
  !----------------------------------
  Iname = Iname + 1
  NameOfUnit(Iname) = "C_QdQdNuNu_LR"

  c_L = 0._dp
  c_R = 0._dp
  b_L = 0._dp
  b_R = 0._dp

  x = mf_u(3)**2 / mW2
  y = mf_u(3)**2 / mHp2(2)
  z = mHp2(2) / mW2
Do i1=1,Size(mc2)
 Do i2=1,Size(mc2)
  x_ij(i1,i2) = mC2(i1) / mC2(i2)
End Do
End Do
  r_a = mSqd2/mGlu2
  Do i1=1,Size(mc2)
   Do i2=1,6
    y_ai(i2,i1) = mSqu2(i2) / mC2(i1)
    z_bi(i2,i1) = mSlept2(i2)**2 / mC2(i1)
   End Do
  End Do
  Do i1=1,Size(mn2)
   n_ij(i1,i1) = 1._dp
   ZNN(i1,i1) = N(i1,4) * Conjg( N(i1,4) ) - N(i1,3) * Conjg( N(i1,3) )
   Do i2=i1+1,Size(mn2)
    n_ij(i1,i2) = mN2(i1)/mN2(i2)
    n_ij(i2,i1) = 1._dp / n_ij(i1,i2)
    ZNN(i1,i2) = N(i1,4) * Conjg( N(i2,4) ) - N(i1,3) * Conjg( N(i2,3) )
    ZNN(i2,i1) = Conjg( ZNN(i1,i2) ) 
   End Do
   Do i2=1,3
    s_ai(i2,i1) = mSqd2(i2) / mN2(i1)
    s_ai(i2+3,i1) = mSqd2(i2+3) / mN2(i1)
    n_bi(i2,i1) = mSnu2(i2) / mN2(i1)
   End Do
  End Do
  Lt = Log(mu**2 / mf_u(3)**2)
  Lua = Log(mu**2 / mSqu2)

  a_sp = oo4Pi * a_s
  !-------------------------------------------
  ! SM contribution
  !-------------------------------------------
  If (l_QCD) Then
   C_L(1) = 0.25_dp * (f_1_0(x) + a_sp* (f_1_1(x) + 8._dp* x* Df_1_0(x) * Lt) )
   B_L(1) = - f_2_0(x) - a_sp * (f_6_1(x) + 8._dp * x * Df_2_0(x) * Lt)
  Else
   C_L(1) = 0.25_dp * f_1_0(x)
   B_L(1) = - f_2_0(x)
  End If
  !------------------------------------------
  ! H+ contribution
  !------------------------------------------
  If (l_QCD) Then
   fact = f_2_0(y) * (1._dp + 8._dp * a_sp * Lt) &
      & + a_sp * (f_2_1(y) + 8._dp * y * Df_2_0(y) * Lt)
  Else
   fact = f_2_0(y) 
  End If

  C_L(2) = - 0.125_dp * x * fact / tanb**2 ! m^2_H/m^2_W * y = x
  C_R(2) = 0.125_dp * mf_d(i) * mf_d(j) * tanb**2 * fact / mW2

  If (l_QCD) Then
   fact = f_2_0(y) * (1._dp + 8._dp * a_sp * Lt) &
      & + a_sp * (f_7_1(y) + 8._dp * y * Df_2_0(y) * Lt)
  End If

  B_R(2) = - mf_d(i) * mf_d(j) * tanb**4 * fact * mf_l(k)**2 &
         &           / (16._dp * mHp2(2) * mW2)

  !------------------------------------------------------------------
  ! Chargino contributions
  ! please note that the couplings to sfermions are complex conjugated
  ! and left-right exchanged compared to my notation
  !------------------------------------------------------------------
  Do i1=1,Size(mc2)
   Do i2=1,Size(mc2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = 2._dp * Sqrt(x_ij(i1,i2))                                      &
         &   * ( f_3_0(x_ij(i1,i2),y_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &     + a_sp * ( f_3_1(x_ij(i1,i2),y_ai(i3,i2))                      &
         &              + y_ai(i3,i2) * Dyf_3_0(x_ij(i1,i2),y_ai(i3,i2))      &
         &                * 4._dp * Lua(i3) ) )
      fac(2) = f_4_0(x_ij(i1,i2),y_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &   + a_sp * ( f_4_1(x_ij(i1,i2),y_ai(i3,i2))                      &
         &            + y_ai(i3,i2) * Dyf_4_0(x_ij(i1,i2),y_ai(i3,i2))      &
                        * 4._dp * Lua(i3))
     Else
      fac(1) = 2._dp * Sqrt(x_ij(i1,i2)) * f_3_0(x_ij(i1,i2),y_ai(i3,i2))
      fac(2) = f_4_0(x_ij(i1,i2),y_ai(i3,i2))
     End If
     ! Z contribution
     C_L(3) = C_L(3) - c_CDSu_R(i1,j,i3) * Conjg(c_CDSu_R(i2,i,i3))   &
         &            * ( fac(1) * U(i1,1) * Conjg(U(i2,1))                  &
         &              - fac(2) * V(i2,1) * Conjg(V(i1,1)) )
     C_R(3) = C_R(3) - c_CDSu_L(i1,j,i3) * Conjg(c_CDSu_L(i2,i,i3))   &
         &            * ( fac(1) * V(i2,1) * Conjg(V(i1,1))                  &
         &              - fac(2) * U(i1,1) * Conjg(U(i2,1)) )
     Do i4=1,6
      If (l_QCD) Then
       fac(1) = f_5_0(x_ij(i1,i2), y_ai(i3,i2), z_bi(i4,i2) )
       fac(2) = f_6_0(x_ij(i1,i2), y_ai(i3,i2), z_bi(i4,i2) )
      Else
       fac(1) = f_5_0(x_ij(i1,i2), y_ai(i3,i2), z_bi(i4,i2) )
       fac(2) = f_6_0(x_ij(i1,i2), y_ai(i3,i2), z_bi(i4,i2) )
      End If
      B_L(3) = B_L(3) + fac(1)                    &
          &       * Conjg(c_CNuSl_R(i1,k,i4) * c_CDSu_R(i2,i,i3) )   &
          &       * c_CNuSl_R(i2,k,i4) * c_CDSu_R(i1,j,i3) / mC2(i2)
      B_R(3) = B_R(3) - fac(2) * Sqrt(x_ij(i1,i2))   &
          &       * Conjg(c_CNuSl_R(i1,k,i4) * c_CDSu_L(i2,i,i3) )     &
          &       * c_CNuSl_R(i2,k,i4) * c_CDSu_L(i1,j,i3) / mC2(i2)
     End Do
    End Do
   End Do
   Do i2=1,6
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0(y_ai(i2,i1),y_ai(i3,i1)) * (1._dp+4._dp*a_sp*Lua(i3))    &
           & + a_sp * (F_5_1(y_ai(i2,i1),y_ai(i3,i1))                         &
           &          + 4._dp * (y_ai(i2,i1)*DxF_4_0(y_ai(i2,i1),y_ai(i3,i1)) &
           &                    +y_ai(i3,i1)*DyF_4_0(y_ai(i2,i1),y_ai(i3,i1)) &
           &                    ) *Lua(i2) ) 
     Else
      fac(1) = F_4_0( y_ai(i2,i1), y_ai(i3,i1))
     End If
     C_L(3) = C_L(3) - fac(1) * ( RSup(i2,1)*Conjg(RSup(i3,1))      &
         &                      + RSup(i2,2)*Conjg(RSup(i3,2))      &
         &                      + RSup(i2,3)*Conjg(RSup(i3,3))  )   &
         &                    * c_CDSu_R(i1,j,i3) * Conjg(c_CDSu_R(i1,i,i2))
     C_R(3) = C_R(3) + fac(1) * ( RSup(i3,4)*Conjg(RSup(i2,4))      &
         &                      + RSup(i3,5)*Conjg(RSup(i2,5))      &
         &                      + RSup(i3,6)*Conjg(RSup(i2,6))  )   &
         &                    * c_CDSu_L(i1,j,i3) * Conjg(c_CDSu_L(i1,i,i2))
    End Do
   End Do
       
  End Do

  B_L(3) = 0.5_dp * kappa_Q * sW2 * B_L(3)
  B_R(3) = kappa_Q * sW2 * B_R(3)

  fact = kappa_Q * e2 / (4._dp * mW2)
  C_L(3) = fact * C_L(3)
  C_R(3) = fact * C_R(3)

  !------------------------------------------------------------------
  ! neutralino contributions
  ! please note that the couplings to sfermions are complex conjugated
  ! and left-right exchanged compared to my notation
  !------------------------------------------------------------------
  Do i1=1,Size(mn2)
   Do i2=1,Size(mn2)
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = 2._dp * Sqrt(n_ij(i1,i2))                                      &
         &   * ( f_3_0(n_ij(i1,i2),s_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &     + a_sp * ( f_3_1(n_ij(i1,i2),s_ai(i3,i2))                      &
         &              + s_ai(i3,i2) * Dyf_3_0(n_ij(i1,i2),s_ai(i3,i2))      &
         &                * 4._dp * Lua(i3) ) )
      fac(2) = f_4_0(n_ij(i1,i2),s_ai(i3,i2)) * (1._dp+4._dp*a_sp*Lua(i3))  &
         &   + a_sp * ( f_4_1(n_ij(i1,i2),s_ai(i3,i2))                      &
         &            + s_ai(i3,i2) * Dyf_4_0(n_ij(i1,i2),s_ai(i3,i2))      &
                        * 4._dp * Lua(i3))
     Else
      fac(1) = 2._dp * Sqrt(n_ij(i1,i2)) * f_3_0(n_ij(i1,i2),s_ai(i3,i2))
      fac(2) = f_4_0(n_ij(i1,i2),s_ai(i3,i2))
     End If
     fac(1) = - fac(1) * ZNN(i1,i2) - fac(2) * ZNN(i2,i1)
     C_L(4) = C_L(4) + fac(1) * c_DNSd_R(j,i1,i3) * Conjg(c_DNSd_R(i,i2,i3))
     C_R(4) = C_R(4) + fac(1) * c_DNSd_L(j,i1,i3) * Conjg(c_DNSd_L(i,i2,i3))
     Do i4=1,3
      If (l_QCD) Then
       fac(1) = 0.5_dp * f_5_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
       fac(2) = f_6_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
      Else
       fac(1) = 0.5_dp * f_5_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
       fac(2) = f_6_0(n_ij(i1,i2), s_ai(i3,i2), n_bi(i4,i2) )
      End If
      B_L(4) = B_L(4) + Conjg(c_DNSd_R(i,i2,i3))* c_DNSd_R(j,i1,i3) &
          &         * ( fac(1) * Conjg(c_NuNSn_R(k,i1,i4)) * c_NuNSn_R(k,i2,i4) &
          &           + fac(2) * Sqrt(n_ij(i1,i2))                              &
          &               * c_NuNSn_R(k,i1,i4) * Conjg(c_NuNSn_R(k,i2,i4))      &
          &           ) / mN2(i2)
      B_R(4) = B_R(4) - Conjg(c_DNSd_L(i,i2,i3))*c_DNSd_L(j,i1,i3) &
          &         * ( fac(1) * Conjg(c_NuNSn_R(k,i2,i4)) * c_NuNSn_R(k,i1,i4) &
          &           + fac(2) * Sqrt(n_ij(i1,i2))                              &
          &               * c_NuNSn_R(k,i2,i4) * Conjg(c_NuNSn_R(k,i1,i4))      &
          &           ) / mN2(i2)
     End Do
    End Do
   End Do
   Do i2=1,6
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0(s_ai(i2,i1),s_ai(i3,i1)) * (1._dp+4._dp*a_sp*Lua(i3))    &
           & + a_sp * (F_5_1(s_ai(i2,i1),s_ai(i3,i1))                         &
           &          + 4._dp * (s_ai(i2,i1)*DxF_4_0(s_ai(i2,i1),s_ai(i3,i1)) &
           &                    +s_ai(i3,i1)*DyF_4_0(s_ai(i2,i1),s_ai(i3,i1)) &
           &                    ) *Lua(i2) ) 
     Else
      fac(1) = F_4_0( s_ai(i2,i1), s_ai(i3,i1))
     End If
     C_L(4) = C_L(4) - fac(1) * ( RSdown(i3,4)*Conjg(RSdown(i2,4))      &
         &                      + RSdown(i3,5)*Conjg(RSdown(i2,5))      &
         &                      + RSdown(i3,6)*Conjg(RSdown(i2,6))  )   &
         &                    * c_DNSd_R(j,i1,i3) * Conjg(c_DNSd_R(i,i1,i2))
     C_R(4) = C_R(4) + fac(1) * ( RSdown(i3,1)*Conjg(RSdown(i2,1))      &
         &                      + RSdown(i3,2)*Conjg(RSdown(i2,2))      &
         &                      + RSdown(i3,3)*Conjg(RSdown(i2,3))  )   &
         &                    * c_DNSd_L(j,i1,i3) * Conjg(c_DNSd_L(i,i1,i2))
    End Do
   End Do
       
  End Do

  B_L(4) = kappa_Q *sW2 * B_L(4)
  B_R(4) = kappa_Q *sW2 * B_R(4)

  fact = kappa_Q * e2 / (4._dp * mW2)
  C_L(4) = fact * C_L(4)
  C_R(4) = fact * C_R(4)

  !------------------------------------------------------------------
  ! gluino contributions
  !------------------------------------------------------------------
   Do i2=1,6
    Do i3=1,6
     If (l_QCD) Then
      fac(1) = F_4_0( r_a(i2), r_a(i3))
     Else
      fac(1) = F_4_0( r_a(i2), r_a(i3))
     End If
     C_L(5) = C_L(5) - fac(1) * ( RSdown(i3,4)*Conjg(RSdown(i2,4))      &
         &                      + RSdown(i3,5)*Conjg(RSdown(i2,5))      &
         &                      + RSdown(i3,6)*Conjg(RSdown(i2,6))  )   &
         &                    * c_DGSd_R(j,i3) * Conjg(c_DGSd_R(i,i2))
     C_R(5) = C_R(5) + fac(1) * ( RSdown(i3,1)*Conjg(RSdown(i2,1))      &
         &                      + RSdown(i3,2)*Conjg(RSdown(i2,2))      &
         &                      + RSdown(i3,3)*Conjg(RSdown(i2,3))  )   &
         &                    * c_DGSd_L(j,i3) * Conjg(c_DGSd_L(i,i2))
    End Do
   End Do
  fact = 4._dp * kappa_Q * e2  / (3._dp * mW2)
  c_L(5) = c_L(5) * fact
  c_R(5) = c_R(5) * fact

  C11 = Sum(C_L) + sum(B_L)
  C11p = Sum(C_R) + sum(B_R)

  If (Present(c11_c)) then
   C11_c(1) = C11
   C11_c(2:6) = C_L + B_L
  end if
  If (Present(c11p_c)) then
   C11p_c(1) = C11p
   C11p_c(2:6) = C_R + B_R
  end if

  Iname = Iname - 1

 End Subroutine  C_11_11p


 Subroutine Delta_F2_Boxes(i, j, T3, g, Y_u, Ru_L, Ru_R, Y_d, Rd_L, Rd_R    &
     & , mf_u, mf_d, mC, U, V, mN, N, mGlu, phi_g &
     & , mSpm2, RSpm, mSup2, RSup, mSdown2, RSdown,c_Hqqp_L, c_Hqqp_R           &
     & , c_CQSq_L, c_CQSq_R, c_QGSq_L     &
     & , c_QGSq_R, c_QNSq_L, c_QNSq_R             &
     & , B_VLL, B_VRR, B_LR1, B_LR2, B_SLL1, B_SLL2, B_SRR1, B_SRR2  )
 Implicit none
  Real(dp), Intent(in) ::  mC(:), mN(:), mGlu, mSpm2(:), mSup2(6)        &
     & , mSdown2(6), T3, g(3), mf_u(3), mf_d(3)
  Complex(dp), Intent(in) ::  U(:,:), V(:,:), N(:,:), phi_g, RSpm(:,:)      &
     & , RSup(6,6), RSdown(6,6),c_Hqqp_L(:,:,:), c_Hqqp_R(:,:,:) &
     & , c_CQSq_L(:,:,:), c_CQSq_R(:,:,:), c_QGSq_L(:,:)     &
     & , c_QGSq_R(:,:), c_QNSq_L(:,:,:), c_QNSq_R(:,:,:) 
  Complex(dp), Intent(in), Dimension(3,3) :: Y_u, Y_d, Ru_L, Ru_R, Rd_L, Rd_R
  Integer, Intent(in) :: i, j
  Complex(dp), Intent(out) ::  B_VLL, B_VRR, B_LR1, B_LR2, B_SLL1, B_SLL2   &
     & , B_SRR1, B_SRR2
  Real(dp) :: D0m2, D2m2, mq2(3), mq(3), mqij, mC2(Size(mC)), mSf2(6), mSf2p(6)    &
     & , mf(3), mf2(3), mg2, mN2(Size(mN))
  Integer :: i1, i2, i3, i4
  Complex(dp) :: coupLC, coupRC, c_Wqqp_L(3,3) 


!  Logical ::
!  Character ::

  B_VLL = 0._dp
  B_VRR = 0._dp
  B_LR1 = 0._dp
  B_LR2 = 0._dp
  B_SLL1 = 0._dp
  B_SLL2 = 0._dp
  B_SRR1 = 0._dp
  B_SRR2 = 0._dp

  c_Wqqp_L = - oosqrt2 * g(2) * CKM
 
   mq = mf_u
   mq2 = mq**2
   mf = mf_d
   mf2 = mf**2
   mSf2 = mSdown2
   mSf2p = mSup2
  
  !------------------------------
  ! W+ H+ + H+ H+ contributions
  !------------------------------

  Do i1=1,3
   Do i2=1,3
    mqij = mq(i1) * mq(i2)
    Do i3=1,Size(mSpm2)
     Do i4=1,Size(mSpm2)
      D0m2 = - mqij * D0_Bagger(mSpm2(i3), mSpm2(i4), mq2(i1), mq2(i2) )
      D2m2 = 4._dp * D27_Bagger(mSpm2(i3), mSpm2(i4), mq2(i1), mq2(i2) )
      If ((i3.Eq.1).and.(i4.eq.2)) then
       B_VLL = B_VLL - Conjg(c_Wqqp_L(i1,i)) * c_Wqqp_L(i2,j)                &
            &           * Conjg(c_Hqqp_L(2,i,i2)) * c_Hqqp_L(2,j,i1) * D0m2  &
            &        + 0.25_dp *  Conjg(c_Hqqp_L(1,i,i1)) * c_Hqqp_L(1,j,i2) &
            &           * Conjg(c_Hqqp_L(2,i,i2)) * c_Hqqp_L(2,j,i1) * D2m2  
      end if
      If ((i3.Eq.2).and.(i4.eq.2)) then
       B_VLL = B_VLL + 0.125_dp * Conjg(c_Hqqp_L(2,i,i1)) * c_Hqqp_L(2,j,i2) &
            &           * Conjg(c_Hqqp_L(2,i,i2)) * c_Hqqp_L(2,j,i1) * D2m2  
       end if
      B_VRR = B_VRR + 0.125_dp * Conjg(c_Hqqp_R(i4,i,i1)) * c_Hqqp_R(i4,j,i2) &
            &          * Conjg(c_Hqqp_R(i3,i,i2)) * c_Hqqp_R(i3,j,i1) * D2m2
      B_SLL1 = B_SLL1 + 0.5_dp * Conjg(c_Hqqp_R(i4,i,i1)) * c_Hqqp_L(i4,j,i2) &
            &      * Conjg(c_Hqqp_R(i3,i,i2)) * c_Hqqp_L(i3,j,i1) * D0m2
      B_SRR1 = B_SRR1 + 0.5_dp * Conjg(c_Hqqp_L(i4,i,i1)) * c_Hqqp_R(i4,j,i2) &
            &      * Conjg(c_Hqqp_L(i3,i,i2)) * c_Hqqp_R(i3,j,i1) * D0m2
      B_LR1 = B_LR1 + 0.25_dp * Conjg(c_Hqqp_L(i4,i,i1)) * c_Hqqp_R(i4,j,i2) &
            &         * Conjg(c_Hqqp_R(i3,i,i2)) * c_Hqqp_L(i3,j,i1) * D2m2
      B_LR2 = B_LR2 + Conjg(c_Hqqp_R(i4,i,i1)) * c_Hqqp_R(i4,j,i2) &
            &     * Conjg(c_Hqqp_L(i3,i,i2)) * c_Hqqp_L(i3,j,i1) * D0m2
      If (i3.Eq.1) then
       B_LR2 = B_LR2 - Conjg(c_Wqqp_L(i1,i)) * c_Wqqp_L(i2,j) &
            &            * Conjg(c_Hqqp_R(i4,i,i2)) * c_Hqqp_R(i4,j,i1) * D2m2
      end if
     end do
    end do
   end do
  end do
  !------------------------------
  ! Chargino contributions
  !------------------------------
  mC2 = mC**2
  Do i1=1,Size(mc)
   Do i2=1,Size(mc)
    mqij = mC(i1) * mC(i2)
    Do i3=1,6
     Do i4=1,6
      D0m2 = - mqij * D0_Bagger(mC2(i1), mC2(i2), mSf2p(i3), mSf2p(i4) )
      D2m2 = 4._dp * D27_Bagger(mC2(i1), mC2(i2), mSf2p(i3), mSf2p(i4) )
      B_VLL = B_VLL + 0.125_dp * Conjg(c_CQSq_L(i2,i,i3)*c_CQSq_L(i1,i,i4)) &
            &                  * c_CQSq_L(i1,j,i3) * c_CQSq_L(i2,j,i4) * D2m2
      B_VRR = B_VRR + 0.125_dp * Conjg(c_CQSq_R(i2,i,i3)*c_CQSq_R(i1,i,i4)) &
            &                  * c_CQSq_R(i1,j,i3) * c_CQSq_R(i2,j,i4) * D2m2
      B_SLL1 = B_SLL1 - 0.25_dp * Conjg(c_CQSq_R(i2,i,i3)*c_CQSq_R(i1,i,i4)) &
            &           * c_CQSq_L(i1,j,i3) * c_CQSq_L(i2,j,i4) * D0m2
      B_SLL2 = B_SLL2 + 0.0625_dp * Conjg(c_CQSq_R(i2,i,i3)*c_CQSq_R(i1,i,i4))&
            &           * c_CQSq_L(i1,j,i3) * c_CQSq_L(i2,j,i4) * D0m2
      B_SRR1 = B_SRR1 - 0.25_dp * Conjg(c_CQSq_L(i2,i,i3)*c_CQSq_L(i1,i,i4)) &
            &           * c_CQSq_R(i1,j,i3) * c_CQSq_R(i2,j,i4) * D0m2
      B_SRR2 = B_SRR2 + 0.0625_dp * Conjg(c_CQSq_L(i2,i,i3)*c_CQSq_L(i1,i,i4))&
            &           * c_CQSq_R(i1,j,i3) * c_CQSq_R(i2,j,i4) * D0m2
      B_LR1 = B_LR1 - 0.5_dp * Conjg(c_CQSq_L(i2,i,i3)*c_CQSq_R(i1,i,i4)) &
            &           * c_CQSq_L(i1,j,i3) * c_CQSq_R(i2,j,i4) * D0m2
      B_LR2 = B_LR2 - 0.5_dp * Conjg(c_CQSq_R(i2,i,i3)*c_CQSq_L(i1,i,i4)) &
            &           * c_CQSq_L(i1,j,i3) * c_CQSq_R(i2,j,i4) * D2m2
     end do
    end do
   end do
  end do

  !-----------------------------------------------------------
  ! gluino contributions
  !-----------------------------------------------------------
  mg2 = mglu**2
  Do i1=1,6
   Do i2=1,6
    D0m2 = mG2 * D0_Bagger(mg2, mg2, mSf2(i1), mSf2(i2) )
    D2m2 = D27_Bagger(mg2, mg2, mSf2(i1), mSf2(i2) )
    B_VLL = B_VLL - 4._dp *(D0m2 + 11*D2m2)                      &
          &               * Conjg(c_QGSq_R(i,i1)*c_QGSq_R(i,i2)) &
          &               * c_QGSq_R(j,i1)*c_QGSq_R(j,i2) / 9._dp
    B_VRR = B_VRR - 4._dp *(D0m2 + 11*D2m2)                      &
          &               * Conjg(c_QGSq_L(i,i1)*c_QGSq_L(i,i2)) &
          &               * c_QGSq_L(j,i1)*c_QGSq_L(j,i2) / 9._dp
    B_SLL1 = B_SLL1 - 37._dp * D0m2 * Conjg(c_QGSq_L(i,i1)*c_QGSq_L(i,i2)) &
          &               * c_QGSq_R(j,i1)*c_QGSq_R(j,i2) / 9._dp
    B_SLL2 = B_SLL2 - D0m2 * Conjg(c_QGSq_L(i,i1)*c_QGSq_L(i,i2)) &
          &                * c_QGSq_R(j,i1)*c_QGSq_R(j,i2) / 12._dp
    B_SRR1 = B_SRR1 - 37._dp * D0m2 * Conjg(c_QGSq_R(i,i1)*c_QGSq_R(i,i2)) &
          &               * c_QGSq_L(j,i1)*c_QGSq_L(j,i2) / 9._dp
    B_SRR2 = B_SRR2 - D0m2 * Conjg(c_QGSq_R(i,i1)*c_QGSq_R(i,i2)) &
          &                * c_QGSq_L(j,i1)*c_QGSq_L(j,i2) / 12._dp
    B_LR1 = B_LR1 + 2._dp * (20._dp * D2m2                             &
          &                    * Conjg(c_QGSq_L(i,i2)*c_QGSq_R(i,i1))  &
          &                    * c_QGSq_L(j,i2)*c_QGSq_R(j,i1)         &
          &                 +  Conjg(c_QGSq_L(i,i1)*c_QGSq_R(i,i2))    &
          &                    *  (-60._dp * D2m2                      &
          &                            *c_QGSq_L(j,i2)*c_QGSq_R(j,i1)  & 
          &                       + D0m2                               &
          &                           *c_QGSq_L(j,i1)*c_QGSq_R(j,i2) ) &
          &                  ) / 9._dp
    B_LR2 = B_LR2 + ( 48._dp * D2m2                                &
          &              * Conjg(c_QGSq_L(i,i2)*c_QGSq_R(i,i1))    &
          &              * c_QGSq_L(j,i2)*c_QGSq_R(j,i1)           &
          &         + 4._dp * Conjg(c_QGSq_L(i,i1)*c_QGSq_R(i,i2)) &
          &              * (22._dp * D2m2                          &
          &                        * c_QGSq_L(j,i2)*c_QGSq_R(j,i1) & 
          &                -21._dp * D0m2                          &
          &                        * c_QGSq_L(j,i1)*c_QGSq_R(j,i2) &
          &                 ) ) / 9._dp
   end do 
  end do
! if (l_mbq(12))  return

  !-------------------------------------------------------------------
  ! gluino/neutralino contributions, the sign in front B27_Bagger is 
  ! the relativ sign to S.Baek et al.
  !-------------------------------------------------------------------
   mN2 = mN**2
  Do i1=1,6
   Do i2=1,6
    Do i3=1,Size(mn)
     D0m2 = mN(i3) * mGlu * D0_Bagger(mN2(i3), mg2, mSf2(i1), mSf2(i2) )
     D2m2 = D27_Bagger(mN2(i3), mg2, mSf2(i1), mSf2(i2) )
     B_VLL = B_VLL - ( D0m2 * Conjg(c_QNSq_R(i,i3,i1)*c_QNSq_R(i,i3,i2)) &
           &                * c_QGSq_R(j,i1)*c_QGSq_R(j,i2)              & 
           &         + (4._dp * D2m2 * c_QGSq_R(j,i1)                    &
           &                  * Conjg(c_QGSq_R(i,i2)*c_QNSq_R(i,i3,i1))  &
           &           + D0m2 * c_QNSq_R(j,i3,i1)                        &
           &                  * Conjg(c_QGSq_R(i,i1)*c_QGSq_R(i,i2))     &
           &           ) * c_QNSq_R(j,i3,i2)                             &
           &         ) / 3._dp
     B_VRR = B_VRR - ( D0m2 * Conjg(c_QNSq_L(i,i3,i1)*c_QNSq_L(i,i3,i2)) &
           &                * c_QGSq_L(j,i1)*c_QGSq_L(j,i2)              & 
           &         + (4._dp * D2m2 * c_QGSq_L(j,i1)                    &
           &                  * Conjg(c_QGSq_L(i,i2)*c_QNSq_L(i,i3,i1))  &
           &           + D0m2 * c_QNSq_L(j,i3,i1)                        &
           &                  * Conjg(c_QGSq_L(i,i1)*c_QGSq_L(i,i2))     &
           &           ) * c_QNSq_L(j,i3,i2)                             &
           &         ) / 3._dp
     B_SRR1 = B_SRR1 + D0m2 * ( Conjg(c_QNSq_R(i,i3,i1)*c_QNSq_R(i,i3,i2))      &
           &                      *c_QGSq_L(j,i1)*c_QGSq_L(j,i2)                &
           &                  + (-7._dp*Conjg(c_QGSq_R(i,i2)*c_QNSq_R(i,i3,i1)) &
           &                       *c_QGSq_L(j,i1)                              &
           &                    + Conjg(c_QGSq_R(i,i1)*c_QGSq_R(i,i2))          &
           &                      *c_QNSq_L(j,i3,i1) ) *c_QNSq_L(j,i3,i2)       &
           &                  ) / 3._dp
     B_SRR2 = B_SRR2 - D0m2 * ( Conjg(c_QNSq_R(i,i3,i1)*c_QNSq_R(i,i3,i2))  &
           &                    * c_QGSq_L(j,i1)*c_QGSq_L(j,i2)             &
           &                  + ( Conjg(c_QGSq_R(i,i2)*c_QNSq_R(i,i3,i1))   &
           &                     * c_QGSq_L(j,i1)                           & 
           &                    + Conjg(c_QGSq_R(i,i1)*c_QGSq_R(i,i2))      &
           &                      *c_QNSq_L(j,i3,i1) ) * c_QNSq_L(j,i3,i2)  &
            &                 ) / 12._dp
     B_SLL1 = B_SLL1 + D0m2 * ( Conjg(c_QNSq_L(i,i3,i1)*c_QNSq_L(i,i3,i2))      &
           &                      *c_QGSq_R(j,i1)*c_QGSq_R(j,i2)                &
           &                  + (-7._dp*Conjg(c_QGSq_L(i,i2)*c_QNSq_L(i,i3,i1)) &
           &                       *c_QGSq_R(j,i1)                              &
           &                    + Conjg(c_QGSq_L(i,i1)*c_QGSq_L(i,i2))          &
           &                      *c_QNSq_R(j,i3,i1) ) *c_QNSq_R(j,i3,i2)       &
           &                  ) / 3._dp
     B_SLL2 = B_SLL2 - D0m2 * ( Conjg(c_QNSq_L(i,i3,i1)*c_QNSq_L(i,i3,i2))  &
           &                    * c_QGSq_R(j,i1)*c_QGSq_R(j,i2)             &
           &                  + ( Conjg(c_QGSq_L(i,i2)*c_QNSq_L(i,i3,i1))   &
           &                     * c_QGSq_R(j,i1)                           & 
           &                    + Conjg(c_QGSq_L(i,i1)*c_QGSq_L(i,i2))      &
           &                      *c_QNSq_R(j,i3,i1) ) * c_QNSq_R(j,i3,i2)  &
            &                 ) / 12._dp
     B_LR1 = B_LR1 - 2._dp * ( ( D0m2                                          &
           &                    * ( Conjg(c_QGSq_L(i,i2)*c_QNSq_R(i,i3,i1))    &
           &                          * c_QGSq_R(j,i1)*c_QNSq_L(j,i3,i2)       &
           &                      + Conjg(c_QGSq_R(i,i1)*c_QNSq_L(i,i3,i2))    &
           &                          *c_QGSq_L(j,i2)* c_QNSq_R(j,i3,i1)       &
           &                      ) ) / 6._dp                                  &
           &                  + D2m2                                           &
           &                    * (( Conjg(c_QNSq_R(i,i3,i2))*c_QGSq_L(j,i2)   &
           &                       + Conjg(c_QGSq_R(i,i2))*c_QNSq_L(j,i3,i2))  &
           &                      * (Conjg(c_QNSq_L(i,i3,i1))*c_QGSq_R(j,i1)   &
           &                        + Conjg(c_QGSq_L(i,i1))*c_QNSq_R(j,i3,i1)) &
           &                      + (Conjg(c_QNSq_L(i,i3,i1)*c_QNSq_R(i,i3,i2))&
           &                          *c_QGSq_L(j,i1)* c_QGSq_R(j,i2)          &
           &                        + Conjg(c_QGSq_L(i,i1)*c_QGSq_R(i,i2))     &
           &                             *c_QNSq_L(j,i3,i1)*c_QNSq_R(j,i3,i2) )&
           &                        / 3._dp )                                   &
           &                      ) 
     B_LR2 = B_LR2 - 4._dp * ( D0m2                                            &
           &                   * ( Conjg(c_QGSq_L(i,i2)*c_QNSq_R(i,i3,i1))     &
           &                       * c_QGSq_R(j,i1)*c_QNSq_L(j,i3,i2)          &
           &                     + Conjg(c_QGSq_R(i,i1)*c_QNSq_L(i,i3,i2))     &
           &                         *c_QGSq_L(j,i2)* c_QNSq_R(j,i3,i1)        &
           &                     )  / 2._dp                                    &
           &                 + D2m2                                            &
           &                   * ( Conjg(c_QNSq_L(i,i3,i1)*c_QNSq_R(i,i3,i2))  &
           &                        * c_QGSq_L(j,i1)*c_QGSq_R(j,i2)            &
           &                     + (( Conjg(c_QNSq_R(i,i3,i2))*c_QGSq_L(j,i2)  &
           &                        + Conjg(c_QGSq_R(i,i2))*c_QNSq_L(j,i3,i2)) &
           &                      * (Conjg(c_QNSq_L(i,i3,i1))*c_QGSq_R(j,i1)   &
           &                        + Conjg(c_QGSq_L(i,i1))*c_QNSq_R(j,i3,i1)) &
           &                       ) /3._dp                                    &
           &                     + Conjg(c_QGSq_L(i,i1)*c_QGSq_R(i,i2))        &
           &                        *c_QNSq_L(j,i3,i1)* c_QNSq_R(j,i3,i2)      &
           &                       )  )
       
    end do 
   end do 
  end do

  !-------------------------------------------------------------------
  ! neutralino contributions, the sign in front B27_Bagger is 
  ! the relativ sign to S.Baek et al.
  !-------------------------------------------------------------------
  Do i1=1,6
   Do i2=1,6
    Do i3=1,Size(mn)
     Do i4=1,Size(mN)
      D0m2 = mN(i3) * mN(i4) * D0_Bagger(mN2(i3), mN2(i4), mSf2(i1), mSf2(i2) )
      D2m2 = D27_Bagger(mN2(i3), mN2(i4), mSf2(i1), mSf2(i2) )
      B_VLL = B_VLL - Conjg(c_QNSq_R(i,i3,i2))*c_QNSq_R(j,i4,i2)              &
            &    * ( 2._dp * D2m2 *Conjg(c_QNSq_R(i,i4,i1))*c_QNSq_R(j,i3,i1) & 
            &      + D0m2*Conjg(c_QNSq_R(i,i3,i1))*c_QNSq_R(j,i4,i1) ) / 4._dp
      B_VRR = B_VRR - Conjg(c_QNSq_L(i,i3,i2))*c_QNSq_L(j,i4,i2)              &
            &    * ( 2._dp * D2m2 *Conjg(c_QNSq_L(i,i4,i1))*c_QNSq_L(j,i3,i1) & 
            &      + D0m2*Conjg(c_QNSq_L(i,i3,i1))*c_QNSq_L(j,i4,i1) ) / 4._dp
      B_SLL1 = B_SLL1 + 0.25_dp * D0m2 * c_QNSq_R(j,i4,i2)                     &
             &           * (2._dp *Conjg(c_QNSq_L(i,i3,i1)*c_QNSq_L(i,i3,i2))  &
             &                    *c_QNSq_R(j,i4,i1)                           & 
             &             - Conjg(c_QNSq_L(i,i3,i2))                          &
             &                * ( Conjg(c_QNSq_L(i,i3,i1))*c_QNSq_R(j,i4,i1)   & 
             &                  - Conjg(c_QNSq_L(i,i4,i1))*c_QNSq_R(j,i3,i1) ) ) 
      B_SLL2 = B_SLL2 - D0m2 * Conjg(c_QNSq_L(i,i3,i2))*c_QNSq_R(j,i4,i2)    &
             &            * ( Conjg(c_QNSq_L(i,i3,i1))*c_QNSq_R(j,i4,i1)     & 
             &              - Conjg(c_QNSq_L(i,i4,i1))*c_QNSq_R(j,i3,i1) )   &
             &            / 16._dp
      B_SRR1 = B_SRR1 + 0.25_dp * D0m2 * c_QNSq_L(j,i4,i2)                     &
             &           * (2._dp *Conjg(c_QNSq_R(i,i3,i1)*c_QNSq_R(i,i3,i2))  &
             &                    *c_QNSq_L(j,i4,i1)                           & 
             &             - Conjg(c_QNSq_R(i,i3,i2))                          &
             &                * ( Conjg(c_QNSq_R(i,i3,i1))*c_QNSq_L(j,i4,i1)   & 
             &                  - Conjg(c_QNSq_R(i,i4,i1))*c_QNSq_L(j,i3,i1) ) ) 
      B_SRR2 = B_SRR2 - D0m2 * Conjg(c_QNSq_R(i,i3,i2))*c_QNSq_L(j,i4,i2)    &
             &            * ( Conjg(c_QNSq_R(i,i3,i1))*c_QNSq_L(j,i4,i1)     & 
             &              - Conjg(c_QNSq_R(i,i4,i1))*c_QNSq_L(j,i3,i1) )   &
             &            / 16._dp
      B_LR1 = B_LR1 + 0.5_dp * Conjg(c_QNSq_R(i,i3,i2))*c_QNSq_R(j,i4,i2)     &
            &    * ( 2._dp * D2m2*Conjg(c_QNSq_L(i,i3,i1))*c_QNSq_L(j,i4,i1) & 
            &      + D0m2 * Conjg(c_QNSq_L(i,i4,i1)) * c_QNSq_L(j,i3,i1) )
      B_LR2 = B_LR2 + 2._dp*D2m2*Conjg(c_QNSq_L(i,i3,i2))*c_QNSq_R(j,i4,i2)  &
            &           * ( Conjg(c_QNSq_R(i,i3,i1))*c_QNSq_L(j,i4,i1)       &
            &             + Conjg(c_QNSq_R(i,i4,i1))*c_QNSq_L(j,i3,i1) ) 
     end do 
    end do 
   end do 
  end do
  
 End Subroutine Delta_F2_Boxes


  Subroutine Delta_MB(i, mf_u, g, Y_u, Ru_L, Ru_R, Y_d, Rd_L, Rd_R, mC, U, V &
      & , mN, N, mGlu, phi_g, mS02, RS0, mP02, RP0, mSpm2, RSpm, mSup2, RSup &
      & , A_u, mu, mSdown2, RSdown, A_d, vevSM,c_Hqqp_L, c_Hqqp_R           &
      & ,  c_CQSq_L, c_CQSq_R, c_QGSq_L     &
      & , c_QGSq_R, c_QNSq_L, c_QNSq_R,c_QQS_L,c_QQS_R,c_QQP_L,c_QQP_R    &
      & , res )
 !---------------------------------------------------------------------------
 ! Input: mf_u, mC, mN, mGlu, mS0, mP0, mSpm
 !        U, V, N, C
 !        
 ! Output: 
 !         res
 !         
 ! written by Werner Porod, 01 Jul 2003
 !---------------------------------------------------------------------------
 Implicit None
  Real(dp), Intent(in) :: mf_u(3), mC(:), mN(:), mGlu, mS02(:), mP02(:) &
     & , mSpm2(:), g(3), mSdown2(6), mSup2(6), vevSM(2)
  Complex(dp), Intent(in) :: U(:,:), V(:,:), N(:,:), RSpm(:,:), RSup(6,6) &
     & , RSdown(6,6), phi_g, A_u(3,3), A_d(3,3), mu,c_QQS_L(:,:,:), &
     & c_QQS_R(:,:,:),c_QQP_R(:,:,:),c_QQP_L(:,:,:),c_Hqqp_L(:,:,:), c_Hqqp_R(:,:,:), &
     & c_CQSq_L(:,:,:), c_CQSq_R(:,:,:), c_QGSq_L(:,:)     &
      & , c_QGSq_R(:,:), c_QNSq_L(:,:,:), c_QNSq_R(:,:,:) 
  Real(dp), Intent(in) :: RS0(:,:), RP0(:,:)
  Complex(dp), Intent(in), Dimension(3,3) :: Y_u, Ru_L, Ru_R, Y_d, Rd_L, Rd_R
  Integer, Intent(in) :: i

  Complex(dp), Intent(out) :: res

  Real(dp) :: xt
  Complex(dp) :: B_VLL, B_VRR, B_LR1, B_LR2, B_SLL1, B_SLL2, B_SRR1, B_SRR2 &
    & , coupLC, coupRC
  Real(dp), Parameter :: oo4r = 0.25_dp / 0.985_dp, P1_LR = -0.71_dp   &
    & , P2_LR = 0.9_dp, P1_SLL = -0.37_dp, P2_SLL = -0.72_dp           &
    & , T3= -0.5_dp, e_d =-1._dp/3._dp
  Integer :: i1

  xt = mf_u(3)**2 / mW**2

  Call Delta_F2_Boxes(3, i, T3, g, Y_u, Ru_L, Ru_R, Y_d, Rd_L, Rd_R, mf_u, mf_d_mZ &
     & , mC, U, V, mN, N, mGlu, phi_g, mSpm2, RSpm, mSup2, RSup, mSdown2   &
     & , RSdown,c_Hqqp_L, c_Hqqp_R, c_CQSq_L, c_CQSq_R, c_QGSq_L     &
     & , c_QGSq_R, c_QNSq_L, c_QNSq_R,   B_VLL, B_VRR, B_LR1, &
     & B_LR2, B_SLL1, B_SLL2, B_SRR1, B_SRR2  )

  !------------------------------------------
  ! double penguins
  !------------------------------------------
  Do i1=1,Size(mS02)
   B_LR2 = B_LR2 - 16._dp * Pi2 * c_QQS_L(i,3,i1)* c_QQS_R(i,3,i1) / mS02(i1) 
   B_SLL1 = B_SLL1 - 8._dp * Pi2 * c_QQS_L(i,3,i1) * c_QQS_L(i,3,i1) / mS02(i1) 
   B_SRR1 = B_SRR1 - 8._dp * Pi2 *  c_QQS_R(i,3,i1) *  c_QQS_R(i,3,i1) / mS02(i1)
  End Do

 Do i1=2,Size(mP02)
  B_LR2 = B_LR2 - 16._dp * Pi2 * c_QQP_L(i,3,i1)* c_QQP_R(i,3,i1) / mP02(i1) 
  B_SLL1 = B_SLL1 - 8._dp * Pi2 *  c_QQP_L(i,3,i1) * c_QQP_L(i,3,i1) / mP02(i1) 
  B_SRR1 = B_SRR1 - 8._dp * Pi2 * c_QQP_R(i,3,i1) *  c_QQP_R(i,3,i1) / mP02(i1) 
 End Do

  res = oo6pi2 * MBq(i) * etaB * FBhatB(i)**2                               &
      &        * ( (G_F*mW)**2 * CKM(3,i)**2 * Conjg(CKM(3,3))**2 * S0(xt)  &
      &          + oo4r * (B_VLL + B_VRR) + P1_LR * B_LR1  + P2_LR * B_LR2  &
      &          + P1_SLL * (B_SLL1 + B_SRR1) + P2_SLL * (B_SLL2 + B_SRR2)  )

 End Subroutine Delta_MB




