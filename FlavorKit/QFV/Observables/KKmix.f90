Real(dp) :: b_VLL, b_SLL1, b_SLL2, b_LR1, b_LR2
Real(dp) :: ms_mu, md_mu
Complex(dp) :: CVLL, CVRR, CSLL, CSRR, CTLL, CTRR, CLR1, CLR2
Complex(dp) :: fV, fS, fT, fLR1, fLR2, cVLLSM
Complex(dp) :: f_k, M_K, H2eff, DelMK_SM, epsK_SM
Real(dp) :: norm, hbar, xt, xc, GF
Integer :: i1
Real(dp), Parameter :: eta_tt = 0.57_dp, eta_ct = 0.47_dp, &
                         & eta_cc = 1.44_dp
! Parameters from S. Herrlich and U. Nierste NPB 476 (1996) 27

! ---------------------------------------------------------------- 
! Delta M_K and epsilon_K 
! Observables implemented by W. Porod, F. Staub and A. Vicente
! Based on A. Crivellin et al, Comput. Phys. Commun. 184 (2013) 1004 [arXiv:1203.5023]
! ---------------------------------------------------------------- 

! using globally defined hadronic parameters
M_K = mass_K0
f_K = f_k_CONST

xt = mf_u(3)**2 / mW**2
xc = mf_u(2)**2 / mW**2

GF = (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp

! Coefficients at mu = 2 GeV
! See A. J. Buras et al, NPB 605 (2001) 600 [hep-ph/0102316] 
b_VLL = 0.61_dp 
b_SLL1 = 0.76_dp 
b_SLL2 = 0.51_dp 
b_LR1 = 0.96_dp
b_LR2 = 1.3_dp

! Quark mass values at mu = 2 GeV
! See M. Ciuchini et al, JHEP 9810 (1998) 008 [hep-ph/9808328] - Table 1
md_mu = 0.007_dp
ms_mu = 0.125_dp

fV = 1._dp/3._dp*M_K*f_k**2*b_VLL
fS = -5._dp/24._dp*M_K*f_K**2*(M_K/(ms_mu+md_mu))**2*b_SLL1
fT = -1._dp/2._dp*M_K*f_K**2*(M_K/(ms_mu+md_mu))**2*b_SLL2
fLR1 = -1._dp/6._dp*M_K*f_K**2*(M_K/(ms_mu+md_mu))**2*b_LR1
fLR2 = 1._dp/4._dp*M_K*f_K**2*(M_K/(ms_mu+md_mu))**2*b_LR2

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
CVLL = O4dVLL(2,1,2,1)-O4dVLLSM(2,1,2,1)+cVLLSM
CVRR = O4dVRR(2,1,2,1)
CSLL = O4dSLL(2,1,2,1)
CSRR = O4dSRR(2,1,2,1)
CTLL = O4dTLL(2,1,2,1)
CTRR = O4dTRR(2,1,2,1)
CLR1 = O4dSLR(2,1,2,1)+O4dSRL(2,1,2,1)  
CLR2 = O4dVLR(2,1,2,1)+O4dVRL(2,1,2,1)

! BSM
H2eff = fV*(CVLL+CVRR) + fS*(CSLL+CSRR) +fT*(CTLL+CTRR) &
              & + fLR1*CLR1 + fLR2*CLR2

DelMK = Abs(2._dp*Real(H2eff,dp))
epsK = 1._dp/(sqrt2*DelMK)*Abs(Aimag(H2eff))

! SM
H2eff = fV*cVLLSM

DelMK_SM = Abs(2._dp*Real(H2eff,dp))
epsK_SM = 1._dp/(sqrt2*DelMK_SM)*Abs(Aimag(H2eff))

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
 
