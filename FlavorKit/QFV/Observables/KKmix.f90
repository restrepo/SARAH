Complex(dp) :: CVLL, CVRR, CSLL, CSRR, CTLL, CTRR, CSLR, CVLR
Complex(dp) :: cVLLSM, MK
Complex(dp) :: f_k, M_K, H2eff, DelMK_SM, epsK_SM
Real(dp) :: norm, hbar, xt, xc, GF
Real(dp) :: RX, BVLL, BVLR, BSLR, BSLL, BTLL
Integer :: i1
Real(dp), Parameter :: eta_tt = 0.57_dp, eta_ct = 0.47_dp, &
                         & eta_cc = 1.44_dp
Real(dp), Parameter :: DeltaMKexp = 3.483E-15_dp                      
! Parameters from S. Herrlich and U. Nierste NPB 476 (1996) 27

! ---------------------------------------------------------------- 
! Delta M_K and epsilon_K 
! Observables implemented by W. Porod, F. Staub and A. Vicente
! Based on A. Crivellin et al, Comput. Phys. Commun. 184 (2013) 1004 [arXiv:1203.5023]
! ---------------------------------------------------------------- 

GF = (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp
xt = mf_u(3)**2 / mW**2
xc = mf_u(2)**2 / mW**2


! using globally defined hadronic parameters
M_K = mass_K0
f_K = f_k_CONST

! Coefficients from 1310.8555
RX=24.3_dp
BVLL=0.56_dp
BVLR=0.85_dp
BSLR=1.08_dp
BSLL=0.62_dp
BTLL=0.43_dp



! SM contribution
! Based on the results by S. Herrlich and U. Nierste
! NPB 419 (1994) 292, PRD 52 (1995) 6505 and NPB 476 (1996) 27
cVLLSM = eta_cc * (Conjg(CKM_160(2,2))*CKM_160(2,1))**2 * S0xt(xc)    &
     & + eta_tt * (Conjg(CKM_160(3,2))*CKM_160(3,1))**2 * S0xt(xt)    &
     & + Conjg(CKM_160(2,2)*CKM_160(3,2))*(CKM_160(2,1)*CKM_160(3,1)) &
     &   * 2._dp * eta_ct * S0_2(xc,xt)

cVLLSM = Conjg(cVLLSM)  ! we compute (d\bar{s})(d\bar{s}) and not (\bar{d}s)(\bar{d}s)
cVLLSM = oo4pi2*(GF*mW)**2*cVLLSM ! normalization

! BSM contributions (+SM in CVLL)
CVLL = 0.5_dp*(O4dVLL(2,1,2,1)-O4dVLLSM(2,1,2,1))+cVLLSM
CVRR = 0.5_dp*O4dVRR(2,1,2,1)
CSLL = 0.5_dp*O4dSLL(2,1,2,1)
CSRR = 0.5_dp*O4dSRR(2,1,2,1)
CTLL = 0.5_dp*O4dTLL(2,1,2,1)
CTRR = 0.5_dp*O4dTRR(2,1,2,1)
CSLR = O4dSLR(2,1,2,1)+O4dSRL(2,1,2,1)  
CVLR = O4dVLR(2,1,2,1)+O4dVRL(2,1,2,1)

! BSM
MK = M_K*f_K**2/24._dp*(8._dp*BVLL*(CVLL+CVRR)-RX*(4._dp*BVLR*CVLR-6._dp*BSLR*CSLR) &
 & -RX*(5._dp*BSLL*(CSLL+CSRR)+12._dp*BTLL*(CTLL+CTRR)))
DelMK = 2._dp*(Real(MK,dp))
epsK = 1._dp/(sqrt2*DeltaMKexp)*Aimag(MK)

! SM
MK = M_K*f_K**2/3._dp*BVLL*(CVLLSM)
DelMK_SM =  2._dp*(Real(MK,dp))
epsK_SM = 1._dp/(sqrt2*DeltaMKexp)*Aimag(MK)

ratioDelMK = DelMK/DelMK_SM
ratioepsK = epsK/epsK_SM

Contains 

! Inami - Lim functions

 Real(dp) Function S0xt(x)
   Implicit None
   Real(dp), Intent(in) :: x
   S0xt = 1._dp - 2.75_dp * x + 0.25_dp * x**2 - &
              &  1.5_dp * x**2 * Log(x) / (1-x)
   S0xt = x*S0xt / (1 -x)**2
 End  Function S0xt
 
 Real(dp) Function S0_2(xc, xt)
   Implicit None
   Real(dp), Intent(in) :: xc, xt
   S0_2 = Log(xt/xc) - 0.75_dp *  xt /(1-xt) &
        & - 0.75_dp * xt**2 * Log(xt) / (1-xt)**2
   S0_2 = xc *  S0_2
 End  Function S0_2
 
