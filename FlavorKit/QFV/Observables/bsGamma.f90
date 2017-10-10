Integer :: gt1, gt2
Complex(dp) :: norm, delta_C7_0, delta_C7p_0, delta_C8_0, delta_C8p_0
Real(dp) :: NNLO_SM 

! ---------------------------------------------------------------- 
! \bar{B} -> X_s gamma (Egamma > 1.6 GeV)
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on E. Lunghi, J. Matias, JHEP 0704 (2007) 058 [hep-ph/0612166]
! ---------------------------------------------------------------- 

gt1=3 !b
gt2=2 !s

! normalization of our Wilson coefficients
! relative to the ones used in hep-ph/0612166
norm = -CKM_160(3,3)*Conjg(CKM_160(gt1,gt2))*Alpha_160/ &
         & (8._dp*Pi*sinW2_160*mW2)

! Wilson coefficients
delta_C7_0 =(CC7(gt1,gt2)-CC7SM(gt1,gt2))/norm
delta_C7p_0=(CC7p(gt1,gt2)-CC7pSM(gt1,gt2))/norm
delta_C8_0 =(CC8(gt1,gt2)-CC8SM(gt1,gt2))/norm
delta_C8p_0=(CC8p(gt1,gt2)-CC8pSM(gt1,gt2))/norm

! NNLO SM prediction
! as obtained in M. Misiak et al, PRL 98 (2007) 022002
! and M. Misiak and M. Steinhauser, NPB 764 (2007) 62
NNLO_SM=3.15_dp

BrBsGamma=NNLO_SM+4.743_dp*(Abs(delta_C7_0)**2+Abs(delta_C7p_0)**2)&
&+0.789_dp*(Abs(delta_C8_0)**2+Abs(delta_C8p_0)**2)&
&+Real((-7.184_dp,0.612_dp)*delta_C7_0&
&+(-2.225_dp,-0.557_dp)*delta_C8_0+(2.454_dp,-0.884_dp)*&
&(delta_C7_0*conjg(delta_C8_0)+delta_C7p_0*conjg(delta_C8p_0)),dp)

! ratio BSM/SM
ratioBsGamma = BrBsGamma/NNLO_SM

! branching ratio
BrBsGamma=1E-4_dp*BrBsGamma


