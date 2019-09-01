Real(dp) :: AmpSquared, AmpSquared_SM, width, width_SM
Real(dp) :: MassK0, fK0, tauK0, gammaK0
Real(dp) :: hbar=6.58211899E-25_dp
Complex(dp) :: CS(4), CV(4)
Complex(dp) :: FS=0._dp, FP=0._dp, FV=0._dp, FA=0._dp
Integer :: gt1, gt2, gt3, gt4

fK0 = f_k_CONST
tauK0 = tau_KL0
MassK0 = mass_K0
gammaK0 = (hbar)/(tauK0)

gt1 = 1
gt2 = 2
gt3 = 1
gt4 = 2

CS(1) = OddllSLL(gt1,gt2, gt3, gt4)
CS(2) = OddllSLR(gt1,gt2, gt3, gt4)
CS(3) = OddllSRR(gt1,gt2, gt3, gt4)
CS(4) = OddllSRL(gt1,gt2, gt3, gt4)

CV(1) = OddllVLL(gt1,gt2, gt3, gt4)
CV(2) = OddllVLR(gt1,gt2, gt3, gt4)
CV(3) = OddllVRR(gt1,gt2, gt3, gt4)
CV(4) = OddllVRL(gt1,gt2, gt3, gt4)

FS = 0.25_dp*MassK0**2*fK0/(MFd(gt1)+MFd(gt2))*(+CS(1)+CS(2)-CS(3)-CS(4))
FP = 0.25_dp*MassK0**2*fK0/(MFd(gt1)+MFd(gt2))*(-CS(1)+CS(2)-CS(3)+CS(4))
FV = -0.25_dp*fK0*(+CV(1)+CV(2)-CV(3)-CV(4))
FA = -0.25_dp*fK0*(-CV(1)+CV(2)-CV(3)+CV(4))

AmpSquared = 2 * abs(FS)**2 * (MassK0**2 - (mf_l(gt3)+mf_l(gt4))**2) &
	& + 2 * abs(FP)**2 * (MassK0**2 - (mf_l(gt3)-mf_l(gt4))**2) &
	& + 2 * abs(FV)**2 * (MassK0**2 * (mf_l(gt3)-mf_l(gt4))**2 - (mf_l(gt3)**2 - mf_l(gt4)**2)) &
	& + 2 * abs(FA)**2 * (MassK0**2 * (mf_l(gt3)+mf_l(gt4))**2 - (mf_l(gt3)**2 - mf_l(gt4)**2)) &
	& + 4 * REAL(FS*conjg(FV)) * (mf_l(gt3)-mf_l(gt4)) * (MassK0**2 + (mf_l(gt3)+mf_l(gt4))**2) &
	& + 4 * REAL(FP*conjg(FA)) * (mf_l(gt3)+mf_l(gt4)) * (MassK0**2 - (mf_l(gt3)-mf_l(gt4))**2)

width = oo16pi * AmpSquared / MassK0 * &
	& sqrt(1-((mf_l(gt3)+mf_l(gt4))/MassK0)**2) * &
	& sqrt(1-((mf_l(gt4)-mf_l(gt3))/MassK0)**2)*(Alpha/Alpha_160)**4

CS(1) = OddllSLLSM(gt1,gt2, gt3, gt4)
CS(2) = OddllSLRSM(gt1,gt2, gt3, gt4)
CS(3) = OddllSRRSM(gt1,gt2, gt3, gt4)
CS(4) = OddllSRLSM(gt1,gt2, gt3, gt4)

CV(1) = OddllVLLSM(gt1,gt2, gt3, gt4)
CV(2) = OddllVLRSM(gt1,gt2, gt3, gt4)
CV(3) = OddllVRRSM(gt1,gt2, gt3, gt4)
CV(4) = OddllVRLSM(gt1,gt2, gt3, gt4)

AmpSquared = 2 * abs(FS)**2 * (MassK0**2 - (mf_l(gt3)+mf_l(gt4))**2) &
	& + 2 * abs(FP)**2 * (MassK0**2 - (mf_l(gt3)-mf_l(gt4))**2) &
	& + 2 * abs(FV)**2 * (MassK0**2 * (mf_l(gt3)-mf_l(gt4))**2 - (mf_l(gt3)**2 - mf_l(gt4)**2)) &
	& + 2 * abs(FA)**2 * (MassK0**2 * (mf_l(gt3)+mf_l(gt4))**2 - (mf_l(gt3)**2 - mf_l(gt4)**2)) &
	& + 4 * REAL(FS*conjg(FV)) * (mf_l(gt3)-mf_l(gt4)) * (MassK0**2 + (mf_l(gt3)+mf_l(gt4))**2) &
	& + 4 * REAL(FP*conjg(FA)) * (mf_l(gt3)+mf_l(gt4)) * (MassK0**2 - (mf_l(gt3)-mf_l(gt4))**2)

width_SM = oo16pi * AmpSquared / MassK0 * &
	& sqrt(1-((mf_l(gt3)+mf_l(gt4))/MassK0)**2) * &
	& sqrt(1-((mf_l(gt4)-mf_l(gt3))/MassK0)**2)*(Alpha/Alpha_160)**4

BrK0eMu = width / gammaK0
ratioK0eMu = width / width_SM
