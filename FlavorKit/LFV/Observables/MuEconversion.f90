Complex(dp) :: gPLV(3), gPRV(3)
Complex(dp),Parameter :: mat0(3,3)=0._dp 
Real(dp) :: Znuc,Nnuc, Zeff, Fp, GammaCapt, GSp(3), GSn(3), &
     & GVp(3), GVn(3), e2
Complex(dp) :: Lcont,Rcont,gLS(3),gRS(3),gLV(3),gRV(3),g0LS,g0RS, & 
     & g0LV,g0RV,g1LS,g1RS,g1LV,g1RV 
Integer :: i1, i2

! ---------------------------------------------------------------- 
! Coherent mu-e conversion in nuclei
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on Y. Kuno, Y. Okada, Rev. Mod. Phys. 73 (2001) 151 [hep-ph/9909265]
! and E. Arganda et al, JHEP 0710 (2007) 104 [arXiv:0707.2955]
! ---------------------------------------------------------------- 

e2 = 4._dp*Pi*Alpha_MZ

! 1: uu
! 2: dd
! 3: ss

! vector couplings

gLV(1) = 0.5_dp*(OlluuVLL(2,1,1,1) + OlluuVLR(2,1,1,1))
gRV(1) = 0.5_dp*(OlluuVRL(2,1,1,1) + OlluuVRR(2,1,1,1))
gLV(2) = 0.5_dp*(OllddVLL(2,1,1,1) + OllddVLR(2,1,1,1))
gRV(2) = 0.5_dp*(OllddVRL(2,1,1,1) + OllddVRR(2,1,1,1))
gLV(3) = 0.5_dp*(OllddVLL(2,1,2,2) + OllddVLR(2,1,2,2))
gRV(3) = 0.5_dp*(OllddVRL(2,1,2,2) + OllddVRR(2,1,2,2))

gLV = -gLV*Sqrt(2._dp)/G_F
gRV = -gRV*Sqrt(2._dp)/G_F

gPLV(1) = (K1L(2,1)-K2R(2,1))*(2._dp/3._dp) 
gPRV(1) = (K1R(2,1)-K2L(2,1))*(2._dp/3._dp) 
gPLV(2) = (K1L(2,1)-K2R(2,1))*(-1._dp/3._dp)  
gPRV(2) = (K1R(2,1)-K2L(2,1))*(-1._dp/3._dp)  
gPLV(3) = (K1L(2,1)-K2R(2,1))*(-1._dp/3._dp)  
gPRV(3) = (K1R(2,1)-K2L(2,1))*(-1._dp/3._dp) 
gPLV = gPLV*Sqrt(2._dp)/G_F*e2
gPRV = gPRV*Sqrt(2._dp)/G_F*e2

gLV=gPLV+gLV
gRV=gPRV+gRV


! scalar couplings

gLS(1) = 0.5_dp*(OlluuSLL(2,1,1,1)+OlluuSLR(2,1,1,1))
gRS(1) = 0.5_dp*(OlluuSRL(2,1,1,1)+OlluuSRR(2,1,1,1))
gLS(2) = 0.5_dp*(OllddSLL(2,1,1,1)+OllddSLR(2,1,1,1))
gRS(2) = 0.5_dp*(OllddSRL(2,1,1,1)+OllddSRR(2,1,1,1))
gLS(3) = 0.5_dp*(OllddSLL(2,1,2,2)+OllddSLR(2,1,2,2))
gRS(3) = 0.5_dp*(OllddSRL(2,1,2,2)+OllddSRR(2,1,2,2))

gLS = -gLS*Sqrt(2._dp)/G_F
gRS = -gRS*Sqrt(2._dp)/G_F


Do i1=1,6 
 If(i1.eq.1) Then 
Znuc=13._dp 
Nnuc=14._dp 
Zeff=11.5_dp 
Fp=0.64_dp 
GammaCapt=4.64079e-19_dp 
Else If(i1.eq.2) Then 
Znuc=22._dp 
Nnuc=26._dp 
Zeff=17.6_dp 
Fp=0.54_dp 
GammaCapt=1.70422e-18_dp 
Else If(i1.eq.3) Then 
Znuc=38._dp 
Nnuc=42._dp 
Zeff=25.0_dp 
Fp=0.39_dp 
GammaCapt=4.61842e-18_dp 
Else If(i1.eq.4) Then 
Znuc=51._dp 
Nnuc=70._dp 
Zeff=29.0_dp 
Fp=0.32_dp 
GammaCapt=6.71711e-18_dp 
Else If(i1.eq.5) Then 
Znuc=79._dp 
Nnuc=118._dp 
Zeff=33.5_dp 
Fp=0.16_dp 
GammaCapt=8.59868e-18_dp 
Else If(i1.eq.6) Then 
Znuc=82._dp 
Nnuc=125._dp 
Zeff=34.0_dp 
Fp=0.15_dp 
GammaCapt=8.84868e-18_dp 
End If 

! numerical values 
! based on Y. Kuno, Y. Okada, Rev. Mod. Phys. 73 (2001) 151 [hep-ph/9909265]
! and T. S. Kosmas et al, PLB 511 (2001) 203 [hep-ph/0102101]
GSp=(/5.1,4.3,2.5/) 
GSn=(/4.3,5.1,2.5/) 
GVp=(/2.0,1.0,0.0/) 
GVn=(/1.0,2.0,0.0/) 

g0LS=0._dp 
g0RS=0._dp 
g0LV=0._dp 
g0RV=0._dp 
g1LS=0._dp 
g1RS=0._dp 
g1LV=0._dp 
g1RV=0._dp 
Do i2=1,3
g0LS=g0LS+0.5_dp*gLS(i2)*(GSp(i2)+GSn(i2))
g0RS=g0RS+0.5_dp*gRS(i2)*(GSp(i2)+GSn(i2))
g0LV=g0LV+0.5_dp*gLV(i2)*(GVp(i2)+GVn(i2))
g0RV=g0RV+0.5_dp*gRV(i2)*(GVp(i2)+GVn(i2))
g1LS=g1LS+0.5_dp*gLS(i2)*(GSp(i2)-GSn(i2))
g1RS=g1RS+0.5_dp*gRS(i2)*(GSp(i2)-GSn(i2))
g1LV=g1LV+0.5_dp*gLV(i2)*(GVp(i2)-GVn(i2))
g1RV=g1RV+0.5_dp*gRV(i2)*(GVp(i2)-GVn(i2))
End Do
Lcont=(Znuc+Nnuc)*(g0LV+g0LS)+(Znuc-Nnuc)*(g1LV-g1LS) 
Rcont=(Znuc+Nnuc)*(g0RV+g0RS)+(Znuc-Nnuc)*(g1RV-g1RS)

! Conversion rate
If (i1.eq.1) Then
 CRMuEAl =oo8pi2*mf_l(2)**5*G_F**2*Alpha**3*Zeff**4*Fp**2/Znuc*& 
   & (Abs(Lcont)**2+Abs(Rcont)**2)/GammaCapt 
Else if (i1.eq.2) Then 
 CRMuETi =oo8pi2*mf_l(2)**5*G_F**2*Alpha**3*Zeff**4*Fp**2/Znuc*& 
   & (Abs(Lcont)**2+Abs(Rcont)**2)/GammaCapt 
Else if (i1.eq.3) Then 
 CRMuESr =oo8pi2*mf_l(2)**5*G_F**2*Alpha**3*Zeff**4*Fp**2/Znuc*& 
   & (Abs(Lcont)**2+Abs(Rcont)**2)/GammaCapt 
Else if (i1.eq.4) Then 
 CRMuESb =oo8pi2*mf_l(2)**5*G_F**2*Alpha**3*Zeff**4*Fp**2/Znuc*& 
   & (Abs(Lcont)**2+Abs(Rcont)**2)/GammaCapt 
Else if (i1.eq.5) Then 
 CRMuEAu =oo8pi2*mf_l(2)**5*G_F**2*Alpha**3*Zeff**4*Fp**2/Znuc*& 
   & (Abs(Lcont)**2+Abs(Rcont)**2)/GammaCapt 
Else if (i1.eq.6) Then 
 CRMuEPb =oo8pi2*mf_l(2)**5*G_F**2*Alpha**3*Zeff**4*Fp**2/Znuc*& 
   & (Abs(Lcont)**2+Abs(Rcont)**2)/GammaCapt 
End if
End do 
