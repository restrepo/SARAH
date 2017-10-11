! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 22:59 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module RGEs_radinuZeeHB 
 
Use Control 
Use Settings 
Use Model_Data_radinuZeeHB 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters160(g,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh)

Implicit None 
Real(dp), Intent(in) :: g(160) 
Real(dp),Intent(out) :: g1,g2,g3,lam5

Complex(dp),Intent(out) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters160' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
lam2= Cmplx(g(6),g(7),dp) 
lam4= Cmplx(g(8),g(9),dp) 
lam3= Cmplx(g(10),g(11),dp) 
lam7= Cmplx(g(12),g(13),dp) 
lam5= g(14) 
lam6= Cmplx(g(15),g(16),dp) 
lam9= Cmplx(g(17),g(18),dp) 
lam8= Cmplx(g(19),g(20),dp) 
lamh= Cmplx(g(21),g(22),dp) 
lam10= Cmplx(g(23),g(24),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsU(i1,i2) = Cmplx( g(SumI+25), g(SumI+26), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsD(i1,i2) = Cmplx( g(SumI+61), g(SumI+62), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsE(i1,i2) = Cmplx( g(SumI+79), g(SumI+80), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+97), g(SumI+98), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+115), g(SumI+116), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yh(i1,i2) = Cmplx( g(SumI+133), g(SumI+134), dp) 
End Do 
 End Do 
 
mu= Cmplx(g(151),g(152),dp) 
mH2= Cmplx(g(153),g(154),dp) 
mEt2= Cmplx(g(155),g(156),dp) 
m12= Cmplx(g(157),g(158),dp) 
mh= Cmplx(g(159),g(160),dp) 
Do i1=1,160 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters160

Subroutine ParametersToG160(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,              & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,g)

Implicit None 
Real(dp), Intent(out) :: g(160) 
Real(dp), Intent(in) :: g1,g2,g3,lam5

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG160' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
g(6) = Real(lam2,dp)  
g(7) = Aimag(lam2)  
g(8) = Real(lam4,dp)  
g(9) = Aimag(lam4)  
g(10) = Real(lam3,dp)  
g(11) = Aimag(lam3)  
g(12) = Real(lam7,dp)  
g(13) = Aimag(lam7)  
g(14) = lam5  
g(15) = Real(lam6,dp)  
g(16) = Aimag(lam6)  
g(17) = Real(lam9,dp)  
g(18) = Aimag(lam9)  
g(19) = Real(lam8,dp)  
g(20) = Aimag(lam8)  
g(21) = Real(lamh,dp)  
g(22) = Aimag(lamh)  
g(23) = Real(lam10,dp)  
g(24) = Aimag(lam10)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+25) = Real(epsU(i1,i2), dp) 
g(SumI+26) = Aimag(epsU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yu(i1,i2), dp) 
g(SumI+44) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+61) = Real(epsD(i1,i2), dp) 
g(SumI+62) = Aimag(epsD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+79) = Real(epsE(i1,i2), dp) 
g(SumI+80) = Aimag(epsE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+97) = Real(Yd(i1,i2), dp) 
g(SumI+98) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+115) = Real(Ye(i1,i2), dp) 
g(SumI+116) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+133) = Real(Yh(i1,i2), dp) 
g(SumI+134) = Aimag(Yh(i1,i2)) 
End Do 
End Do 

g(151) = Real(mu,dp)  
g(152) = Aimag(mu)  
g(153) = Real(mH2,dp)  
g(154) = Aimag(mH2)  
g(155) = Real(mEt2,dp)  
g(156) = Aimag(mEt2)  
g(157) = Real(m12,dp)  
g(158) = Aimag(m12)  
g(159) = Real(mh,dp)  
g(160) = Aimag(mh)  
Iname = Iname - 1 
 
End Subroutine ParametersToG160

Subroutine rge160(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam5,betalam51,betalam52,Dlam5
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,               & 
& Dlam2,lam4,betalam41,betalam42,Dlam4,lam3,betalam31,betalam32,Dlam3,lam7,              & 
& betalam71,betalam72,Dlam7,lam6,betalam61,betalam62,Dlam6,lam9,betalam91,               & 
& betalam92,Dlam9,lam8,betalam81,betalam82,Dlam8,lamh,betalamh1,betalamh2,               & 
& Dlamh,lam10,betalam101,betalam102,Dlam10,epsU(3,3),betaepsU1(3,3),betaepsU2(3,3)       & 
& ,DepsU(3,3),adjepsU(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)         & 
& ,epsD(3,3),betaepsD1(3,3),betaepsD2(3,3),DepsD(3,3),adjepsD(3,3),epsE(3,3)             & 
& ,betaepsE1(3,3),betaepsE2(3,3),DepsE(3,3),adjepsE(3,3),Yd(3,3),betaYd1(3,3)            & 
& ,betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3)           & 
& ,adjYe(3,3),Yh(3,3),betaYh1(3,3),betaYh2(3,3),DYh(3,3),adjYh(3,3),mu,betamu1,          & 
& betamu2,Dmu,mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,betamEt22,DmEt2,m12,             & 
& betam121,betam122,Dm12,mh,betamh1,betamh2,Dmh
Complex(dp) :: epsDadjepsD(3,3),epsDadjYd(3,3),epsEadjepsE(3,3),epsUadjepsU(3,3),epsUadjYd(3,3),     & 
& epsUadjYu(3,3),YdadjepsD(3,3),YdadjepsU(3,3),YdadjYd(3,3),YeadjYe(3,3),YhadjYe(3,3),   & 
& YhCYh(3,3),YuadjepsD(3,3),YuadjepsU(3,3),YuadjYu(3,3),adjepsDepsD(3,3),adjepsDYd(3,3), & 
& adjepsEepsE(3,3),adjepsEYh(3,3),adjepsETpYe(3,3),adjepsUepsU(3,3),adjepsUYu(3,3),      & 
& adjYdepsD(3,3),adjYdYd(3,3),adjYeYe(3,3),adjYeTpepsE(3,3),adjYuepsU(3,3),              & 
& adjYuYu(3,3),CepsEYe(3,3),CepsETpepsE(3,3),CYeepsE(3,3),CYeYh(3,3),CYeTpYe(3,3),       & 
& CYhepsE(3,3),CYhYh(3,3),TpepsEadjYe(3,3),TpepsECepsE(3,3),TpepsECYh(3,3),              & 
& TpYeadjepsE(3,3),TpYeCYe(3,3),epsDadjepsDepsD(3,3),epsDadjepsDYd(3,3),epsDadjepsUepsU(3,3),& 
& epsDadjYdYd(3,3),epsDadjYuepsU(3,3),epsDadjYuYu(3,3),epsEadjepsEepsE(3,3),             & 
& epsEadjepsEYh(3,3),epsECYeTpYe(3,3),epsUadjepsDepsD(3,3),epsUadjepsUepsU(3,3),         & 
& epsUadjepsUYu(3,3),epsUadjYdepsD(3,3),epsUadjYdYd(3,3),epsUadjYuYu(3,3),               & 
& YdadjepsDepsD(3,3),YdadjepsUepsU(3,3),YdadjepsUYu(3,3),YdadjYdepsD(3,3),               & 
& YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YeCepsETpepsE(3,3),YeCYhYh(3,3),          & 
& YhadjYeYe(3,3),YhCepsETpepsE(3,3),YhCYhepsE(3,3),YhCYhYh(3,3),YuadjepsDepsD(3,3),      & 
& YuadjepsDYd(3,3),YuadjepsUepsU(3,3),YuadjYdYd(3,3),YuadjYuepsU(3,3),YuadjYuYu(3,3),    & 
& adjepsDepsDadjepsD(3,3),adjepsDepsDadjYd(3,3),adjepsDYdadjepsD(3,3),adjepsDYdadjYd(3,3),& 
& adjepsEepsEadjepsE(3,3),adjepsEYhCYh(3,3),adjepsETpYeadjepsE(3,3),adjepsETpYeCYe(3,3), & 
& adjepsUepsUadjepsU(3,3),adjepsUepsUadjYu(3,3),adjepsUYuadjepsD(3,3),adjepsUYuadjepsU(3,3),& 
& adjepsUYuadjYu(3,3),adjYdepsDadjepsD(3,3),adjYdepsDadjYd(3,3),adjYdYdadjepsD(3,3),     & 
& adjYdYdadjepsU(3,3),adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYeTpepsEadjYe(3,3),         & 
& adjYeTpepsECepsE(3,3),adjYeTpepsECYh(3,3),adjYuepsUadjepsU(3,3),adjYuepsUadjYd(3,3),   & 
& adjYuepsUadjYu(3,3),adjYuYuadjepsD(3,3),adjYuYuadjepsU(3,3),adjYuYuadjYu(3,3),         & 
& CYhYhadjYe(3,3),CYhYhCYh(3,3),CYhTpYeadjepsE(3,3),TpepsEadjYeTpepsE(3,3),              & 
& TpepsECepsEYe(3,3),TpepsECepsETpepsE(3,3),TpYeadjepsETpYe(3,3),TpYeCYeepsE(3,3),       & 
& TpYeCYeYh(3,3),TpYeCYeTpYe(3,3),epsDadjepsDepsDadjepsD(3,3),epsDadjepsDepsDadjYd(3,3), & 
& epsDadjepsDYdadjepsD(3,3),epsDadjepsDYdadjYd(3,3),epsDadjYdepsDadjepsD(3,3),           & 
& epsDadjYdepsDadjYd(3,3),epsDadjYdYdadjepsD(3,3),epsDadjYdYdadjYd(3,3),epsDadjYuepsUadjYd(3,3),& 
& epsDadjYuYuadjepsD(3,3),epsEadjepsEepsEadjepsE(3,3),epsEadjepsEYhCYh(3,3),             & 
& epsEadjepsETpYeadjepsE(3,3),epsEadjepsETpYeCYe(3,3),epsUadjepsUepsUadjepsU(3,3),       & 
& epsUadjepsUepsUadjYu(3,3),epsUadjepsUYuadjepsU(3,3),epsUadjepsUYuadjYu(3,3),           & 
& epsUadjYdYdadjepsU(3,3),epsUadjYuepsUadjepsU(3,3),epsUadjYuepsUadjYu(3,3),             & 
& epsUadjYuYuadjepsU(3,3),epsUadjYuYuadjYu(3,3),YdadjepsDYdadjepsD(3,3),YdadjepsDYdadjYd(3,3),& 
& YdadjepsUYuadjepsD(3,3),YdadjYdYdadjepsD(3,3),YdadjYdYdadjYd(3,3),YeadjYeYeadjYe(3,3), & 
& YeadjYeTpepsEadjYe(3,3),YeadjYeTpepsECepsE(3,3),YeCYhYhadjYe(3,3),YhadjYeTpepsECYh(3,3),& 
& YhCYhYhCYh(3,3),YhCYhTpYeadjepsE(3,3),YuadjepsUYuadjepsU(3,3),YuadjepsUYuadjYu(3,3),   & 
& YuadjYuYuadjepsU(3,3),YuadjYuYuadjYu(3,3),adjepsETpYeadjepsETpYe(3,3),adjepsETpYeCYeTpYe(3,3),& 
& adjYeTpepsEadjYeTpepsE(3,3),adjYeTpepsECepsETpepsE(3,3)

Complex(dp) :: TrepsDadjepsD,TrepsDadjYd,TrepsEadjepsE,TrepsUadjepsU,TrepsUadjYu,TrYdadjepsD,        & 
& TrYdadjYd,TrYeadjYe,TrYhCYh,TrYuadjepsU,TrYuadjYu,TradjepsETpYe,TradjYeTpepsE,         & 
& TrepsDadjepsDepsDadjepsD,TrepsDadjepsDepsDadjYd,TrepsDadjepsDYdadjepsD,TrepsDadjepsDYdadjYd,& 
& TrepsDadjYdepsDadjepsD,TrepsDadjYdepsDadjYd,TrepsDadjYdYdadjepsD,TrepsDadjYdYdadjYd,   & 
& TrepsDadjYuepsUadjYd,TrepsDadjYuYuadjepsD,TrepsEadjepsEepsEadjepsE,TrepsEadjepsEYhCYh, & 
& TrepsEadjepsETpYeadjepsE,TrepsEadjepsETpYeCYe,TrepsUadjepsUepsUadjepsU,TrepsUadjepsUepsUadjYu,& 
& TrepsUadjepsUYuadjepsU,TrepsUadjepsUYuadjYu,TrepsUadjYdYdadjepsU,TrepsUadjYuepsUadjepsU,& 
& TrepsUadjYuepsUadjYu,TrepsUadjYuYuadjepsU,TrepsUadjYuYuadjYu,TrYdadjepsDYdadjepsD,     & 
& TrYdadjepsDYdadjYd,TrYdadjepsUYuadjepsD,TrYdadjYdYdadjepsD,TrYdadjYdYdadjYd,           & 
& TrYeadjYeYeadjYe,TrYeadjYeTpepsEadjYe,TrYeadjYeTpepsECepsE,TrYeCYhYhadjYe,             & 
& TrYhadjYeTpepsECYh,TrYhCYhYhCYh,TrYhCYhTpYeadjepsE,TrYuadjepsUYuadjepsU,               & 
& TrYuadjepsUYuadjYu,TrYuadjYuYuadjepsU,TrYuadjYuYuadjYu,TradjepsETpYeadjepsETpYe,       & 
& TradjepsETpYeCYeTpYe,TradjYeTpepsEadjYeTpepsE,TradjYeTpepsECepsETpepsE

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3,lam5p2

Complex(dp) :: lam1p2,lam10p2,lam2p2,lam3p2,lam4p2,lam6p2,lam7p2,lam8p2,lam9p2,lamhp2,mup2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge160' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters160(gy,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh)

Call Adjungate(epsU,adjepsU)
Call Adjungate(Yu,adjYu)
Call Adjungate(epsD,adjepsD)
Call Adjungate(epsE,adjepsE)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yh,adjYh)
 epsDadjepsD = Matmul(epsD,adjepsD) 
Forall(i2=1:3)  epsDadjepsD(i2,i2) =  Real(epsDadjepsD(i2,i2),dp) 
 epsDadjYd = Matmul(epsD,adjYd) 
 epsEadjepsE = Matmul(epsE,adjepsE) 
Forall(i2=1:3)  epsEadjepsE(i2,i2) =  Real(epsEadjepsE(i2,i2),dp) 
 epsUadjepsU = Matmul(epsU,adjepsU) 
Forall(i2=1:3)  epsUadjepsU(i2,i2) =  Real(epsUadjepsU(i2,i2),dp) 
 epsUadjYd = Matmul(epsU,adjYd) 
 epsUadjYu = Matmul(epsU,adjYu) 
 YdadjepsD = Matmul(Yd,adjepsD) 
 YdadjepsU = Matmul(Yd,adjepsU) 
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YhadjYe = Matmul(Yh,adjYe) 
 YhCYh = Matmul(Yh,Conjg(Yh)) 
 YuadjepsD = Matmul(Yu,adjepsD) 
 YuadjepsU = Matmul(Yu,adjepsU) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjepsDepsD = Matmul(adjepsD,epsD) 
Forall(i2=1:3)  adjepsDepsD(i2,i2) =  Real(adjepsDepsD(i2,i2),dp) 
 adjepsDYd = Matmul(adjepsD,Yd) 
 adjepsEepsE = Matmul(adjepsE,epsE) 
Forall(i2=1:3)  adjepsEepsE(i2,i2) =  Real(adjepsEepsE(i2,i2),dp) 
 adjepsEYh = Matmul(adjepsE,Yh) 
 adjepsETpYe = Matmul(adjepsE,Transpose(Ye)) 
 adjepsUepsU = Matmul(adjepsU,epsU) 
Forall(i2=1:3)  adjepsUepsU(i2,i2) =  Real(adjepsUepsU(i2,i2),dp) 
 adjepsUYu = Matmul(adjepsU,Yu) 
 adjYdepsD = Matmul(adjYd,epsD) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTpepsE = Matmul(adjYe,Transpose(epsE)) 
 adjYuepsU = Matmul(adjYu,epsU) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 CepsEYe = Matmul(Conjg(epsE),Ye) 
 CepsETpepsE = Matmul(Conjg(epsE),Transpose(epsE)) 
Forall(i2=1:3)  CepsETpepsE(i2,i2) =  Real(CepsETpepsE(i2,i2),dp) 
 CYeepsE = Matmul(Conjg(Ye),epsE) 
 CYeYh = Matmul(Conjg(Ye),Yh) 
 CYeTpYe = Matmul(Conjg(Ye),Transpose(Ye)) 
Forall(i2=1:3)  CYeTpYe(i2,i2) =  Real(CYeTpYe(i2,i2),dp) 
 CYhepsE = Matmul(Conjg(Yh),epsE) 
 CYhYh = Matmul(Conjg(Yh),Yh) 
 TpepsEadjYe = Matmul(Transpose(epsE),adjYe) 
 TpepsECepsE = Matmul(Transpose(epsE),Conjg(epsE)) 
Forall(i2=1:3)  TpepsECepsE(i2,i2) =  Real(TpepsECepsE(i2,i2),dp) 
 TpepsECYh = Matmul(Transpose(epsE),Conjg(Yh)) 
 TpYeadjepsE = Matmul(Transpose(Ye),adjepsE) 
 TpYeCYe = Matmul(Transpose(Ye),Conjg(Ye)) 
Forall(i2=1:3)  TpYeCYe(i2,i2) =  Real(TpYeCYe(i2,i2),dp) 
 epsDadjepsDepsD = Matmul(epsD,adjepsDepsD) 
 epsDadjepsDYd = Matmul(epsD,adjepsDYd) 
 epsDadjepsUepsU = Matmul(epsD,adjepsUepsU) 
 epsDadjYdYd = Matmul(epsD,adjYdYd) 
 epsDadjYuepsU = Matmul(epsD,adjYuepsU) 
 epsDadjYuYu = Matmul(epsD,adjYuYu) 
 epsEadjepsEepsE = Matmul(epsE,adjepsEepsE) 
 epsEadjepsEYh = Matmul(epsE,adjepsEYh) 
 epsECYeTpYe = Matmul(epsE,CYeTpYe) 
 epsUadjepsDepsD = Matmul(epsU,adjepsDepsD) 
 epsUadjepsUepsU = Matmul(epsU,adjepsUepsU) 
 epsUadjepsUYu = Matmul(epsU,adjepsUYu) 
 epsUadjYdepsD = Matmul(epsU,adjYdepsD) 
 epsUadjYdYd = Matmul(epsU,adjYdYd) 
 epsUadjYuYu = Matmul(epsU,adjYuYu) 
 YdadjepsDepsD = Matmul(Yd,adjepsDepsD) 
 YdadjepsUepsU = Matmul(Yd,adjepsUepsU) 
 YdadjepsUYu = Matmul(Yd,adjepsUYu) 
 YdadjYdepsD = Matmul(Yd,adjYdepsD) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YeCepsETpepsE = Matmul(Ye,CepsETpepsE) 
 YeCYhYh = Matmul(Ye,CYhYh) 
 YhadjYeYe = Matmul(Yh,adjYeYe) 
 YhCepsETpepsE = Matmul(Yh,CepsETpepsE) 
 YhCYhepsE = Matmul(Yh,CYhepsE) 
 YhCYhYh = Matmul(Yh,CYhYh) 
 YuadjepsDepsD = Matmul(Yu,adjepsDepsD) 
 YuadjepsDYd = Matmul(Yu,adjepsDYd) 
 YuadjepsUepsU = Matmul(Yu,adjepsUepsU) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuepsU = Matmul(Yu,adjYuepsU) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjepsDepsDadjepsD = Matmul(adjepsD,epsDadjepsD) 
 adjepsDepsDadjYd = Matmul(adjepsD,epsDadjYd) 
 adjepsDYdadjepsD = Matmul(adjepsD,YdadjepsD) 
 adjepsDYdadjYd = Matmul(adjepsD,YdadjYd) 
 adjepsEepsEadjepsE = Matmul(adjepsE,epsEadjepsE) 
 adjepsEYhCYh = Matmul(adjepsE,YhCYh) 
 adjepsETpYeadjepsE = Matmul(adjepsE,TpYeadjepsE) 
 adjepsETpYeCYe = Matmul(adjepsE,TpYeCYe) 
 adjepsUepsUadjepsU = Matmul(adjepsU,epsUadjepsU) 
 adjepsUepsUadjYu = Matmul(adjepsU,epsUadjYu) 
 adjepsUYuadjepsD = Matmul(adjepsU,YuadjepsD) 
 adjepsUYuadjepsU = Matmul(adjepsU,YuadjepsU) 
 adjepsUYuadjYu = Matmul(adjepsU,YuadjYu) 
 adjYdepsDadjepsD = Matmul(adjYd,epsDadjepsD) 
 adjYdepsDadjYd = Matmul(adjYd,epsDadjYd) 
 adjYdYdadjepsD = Matmul(adjYd,YdadjepsD) 
 adjYdYdadjepsU = Matmul(adjYd,YdadjepsU) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYeTpepsEadjYe = Matmul(adjYe,TpepsEadjYe) 
 adjYeTpepsECepsE = Matmul(adjYe,TpepsECepsE) 
 adjYeTpepsECYh = Matmul(adjYe,TpepsECYh) 
 adjYuepsUadjepsU = Matmul(adjYu,epsUadjepsU) 
 adjYuepsUadjYd = Matmul(adjYu,epsUadjYd) 
 adjYuepsUadjYu = Matmul(adjYu,epsUadjYu) 
 adjYuYuadjepsD = Matmul(adjYu,YuadjepsD) 
 adjYuYuadjepsU = Matmul(adjYu,YuadjepsU) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 CYhYhadjYe = Matmul(Conjg(Yh),YhadjYe) 
 CYhYhCYh = Matmul(Conjg(Yh),YhCYh) 
 CYhTpYeadjepsE = Matmul(Conjg(Yh),TpYeadjepsE) 
 TpepsEadjYeTpepsE = Matmul(Transpose(epsE),adjYeTpepsE) 
 TpepsECepsEYe = Matmul(Transpose(epsE),CepsEYe) 
 TpepsECepsETpepsE = Matmul(Transpose(epsE),CepsETpepsE) 
 TpYeadjepsETpYe = Matmul(Transpose(Ye),adjepsETpYe) 
 TpYeCYeepsE = Matmul(Transpose(Ye),CYeepsE) 
 TpYeCYeYh = Matmul(Transpose(Ye),CYeYh) 
 TpYeCYeTpYe = Matmul(Transpose(Ye),CYeTpYe) 
 epsDadjepsDepsDadjepsD = Matmul(epsD,adjepsDepsDadjepsD) 
Forall(i2=1:3)  epsDadjepsDepsDadjepsD(i2,i2) =  Real(epsDadjepsDepsDadjepsD(i2,i2),dp) 
 epsDadjepsDepsDadjYd = Matmul(epsD,adjepsDepsDadjYd) 
 epsDadjepsDYdadjepsD = Matmul(epsD,adjepsDYdadjepsD) 
 epsDadjepsDYdadjYd = Matmul(epsD,adjepsDYdadjYd) 
 epsDadjYdepsDadjepsD = Matmul(epsD,adjYdepsDadjepsD) 
 epsDadjYdepsDadjYd = Matmul(epsD,adjYdepsDadjYd) 
 epsDadjYdYdadjepsD = Matmul(epsD,adjYdYdadjepsD) 
Forall(i2=1:3)  epsDadjYdYdadjepsD(i2,i2) =  Real(epsDadjYdYdadjepsD(i2,i2),dp) 
 epsDadjYdYdadjYd = Matmul(epsD,adjYdYdadjYd) 
 epsDadjYuepsUadjYd = Matmul(epsD,adjYuepsUadjYd) 
 epsDadjYuYuadjepsD = Matmul(epsD,adjYuYuadjepsD) 
Forall(i2=1:3)  epsDadjYuYuadjepsD(i2,i2) =  Real(epsDadjYuYuadjepsD(i2,i2),dp) 
 epsEadjepsEepsEadjepsE = Matmul(epsE,adjepsEepsEadjepsE) 
Forall(i2=1:3)  epsEadjepsEepsEadjepsE(i2,i2) =  Real(epsEadjepsEepsEadjepsE(i2,i2),dp) 
 epsEadjepsEYhCYh = Matmul(epsE,adjepsEYhCYh) 
 epsEadjepsETpYeadjepsE = Matmul(epsE,adjepsETpYeadjepsE) 
 epsEadjepsETpYeCYe = Matmul(epsE,adjepsETpYeCYe) 
 epsUadjepsUepsUadjepsU = Matmul(epsU,adjepsUepsUadjepsU) 
Forall(i2=1:3)  epsUadjepsUepsUadjepsU(i2,i2) =  Real(epsUadjepsUepsUadjepsU(i2,i2),dp) 
 epsUadjepsUepsUadjYu = Matmul(epsU,adjepsUepsUadjYu) 
 epsUadjepsUYuadjepsU = Matmul(epsU,adjepsUYuadjepsU) 
 epsUadjepsUYuadjYu = Matmul(epsU,adjepsUYuadjYu) 
 epsUadjYdYdadjepsU = Matmul(epsU,adjYdYdadjepsU) 
Forall(i2=1:3)  epsUadjYdYdadjepsU(i2,i2) =  Real(epsUadjYdYdadjepsU(i2,i2),dp) 
 epsUadjYuepsUadjepsU = Matmul(epsU,adjYuepsUadjepsU) 
 epsUadjYuepsUadjYu = Matmul(epsU,adjYuepsUadjYu) 
 epsUadjYuYuadjepsU = Matmul(epsU,adjYuYuadjepsU) 
Forall(i2=1:3)  epsUadjYuYuadjepsU(i2,i2) =  Real(epsUadjYuYuadjepsU(i2,i2),dp) 
 epsUadjYuYuadjYu = Matmul(epsU,adjYuYuadjYu) 
 YdadjepsDYdadjepsD = Matmul(Yd,adjepsDYdadjepsD) 
 YdadjepsDYdadjYd = Matmul(Yd,adjepsDYdadjYd) 
 YdadjepsUYuadjepsD = Matmul(Yd,adjepsUYuadjepsD) 
 YdadjYdYdadjepsD = Matmul(Yd,adjYdYdadjepsD) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYeTpepsEadjYe = Matmul(Ye,adjYeTpepsEadjYe) 
 YeadjYeTpepsECepsE = Matmul(Ye,adjYeTpepsECepsE) 
 YeCYhYhadjYe = Matmul(Ye,CYhYhadjYe) 
 YhadjYeTpepsECYh = Matmul(Yh,adjYeTpepsECYh) 
 YhCYhYhCYh = Matmul(Yh,CYhYhCYh) 
 YhCYhTpYeadjepsE = Matmul(Yh,CYhTpYeadjepsE) 
 YuadjepsUYuadjepsU = Matmul(Yu,adjepsUYuadjepsU) 
 YuadjepsUYuadjYu = Matmul(Yu,adjepsUYuadjYu) 
 YuadjYuYuadjepsU = Matmul(Yu,adjYuYuadjepsU) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 adjepsETpYeadjepsETpYe = Matmul(adjepsE,TpYeadjepsETpYe) 
 adjepsETpYeCYeTpYe = Matmul(adjepsE,TpYeCYeTpYe) 
 adjYeTpepsEadjYeTpepsE = Matmul(adjYe,TpepsEadjYeTpepsE) 
 adjYeTpepsECepsETpepsE = Matmul(adjYe,TpepsECepsETpepsE) 
 TrepsDadjepsD = Real(cTrace(epsDadjepsD),dp) 
 TrepsDadjYd = cTrace(epsDadjYd) 
 TrepsEadjepsE = Real(cTrace(epsEadjepsE),dp) 
 TrepsUadjepsU = Real(cTrace(epsUadjepsU),dp) 
 TrepsUadjYu = cTrace(epsUadjYu) 
 TrYdadjepsD = cTrace(YdadjepsD) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYhCYh = cTrace(YhCYh) 
 TrYuadjepsU = cTrace(YuadjepsU) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TradjepsETpYe = cTrace(adjepsETpYe) 
 TradjYeTpepsE = cTrace(adjYeTpepsE) 
 TrepsDadjepsDepsDadjepsD = Real(cTrace(epsDadjepsDepsDadjepsD),dp) 
 TrepsDadjepsDepsDadjYd = cTrace(epsDadjepsDepsDadjYd) 
 TrepsDadjepsDYdadjepsD = cTrace(epsDadjepsDYdadjepsD) 
 TrepsDadjepsDYdadjYd = cTrace(epsDadjepsDYdadjYd) 
 TrepsDadjYdepsDadjepsD = cTrace(epsDadjYdepsDadjepsD) 
 TrepsDadjYdepsDadjYd = cTrace(epsDadjYdepsDadjYd) 
 TrepsDadjYdYdadjepsD = Real(cTrace(epsDadjYdYdadjepsD),dp) 
 TrepsDadjYdYdadjYd = cTrace(epsDadjYdYdadjYd) 
 TrepsDadjYuepsUadjYd = cTrace(epsDadjYuepsUadjYd) 
 TrepsDadjYuYuadjepsD = Real(cTrace(epsDadjYuYuadjepsD),dp) 
 TrepsEadjepsEepsEadjepsE = Real(cTrace(epsEadjepsEepsEadjepsE),dp) 
 TrepsEadjepsEYhCYh = cTrace(epsEadjepsEYhCYh) 
 TrepsEadjepsETpYeadjepsE = cTrace(epsEadjepsETpYeadjepsE) 
 TrepsEadjepsETpYeCYe = cTrace(epsEadjepsETpYeCYe) 
 TrepsUadjepsUepsUadjepsU = Real(cTrace(epsUadjepsUepsUadjepsU),dp) 
 TrepsUadjepsUepsUadjYu = cTrace(epsUadjepsUepsUadjYu) 
 TrepsUadjepsUYuadjepsU = cTrace(epsUadjepsUYuadjepsU) 
 TrepsUadjepsUYuadjYu = cTrace(epsUadjepsUYuadjYu) 
 TrepsUadjYdYdadjepsU = Real(cTrace(epsUadjYdYdadjepsU),dp) 
 TrepsUadjYuepsUadjepsU = cTrace(epsUadjYuepsUadjepsU) 
 TrepsUadjYuepsUadjYu = cTrace(epsUadjYuepsUadjYu) 
 TrepsUadjYuYuadjepsU = Real(cTrace(epsUadjYuYuadjepsU),dp) 
 TrepsUadjYuYuadjYu = cTrace(epsUadjYuYuadjYu) 
 TrYdadjepsDYdadjepsD = cTrace(YdadjepsDYdadjepsD) 
 TrYdadjepsDYdadjYd = cTrace(YdadjepsDYdadjYd) 
 TrYdadjepsUYuadjepsD = cTrace(YdadjepsUYuadjepsD) 
 TrYdadjYdYdadjepsD = cTrace(YdadjYdYdadjepsD) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYeadjYeTpepsEadjYe = cTrace(YeadjYeTpepsEadjYe) 
 TrYeadjYeTpepsECepsE = cTrace(YeadjYeTpepsECepsE) 
 TrYeCYhYhadjYe = cTrace(YeCYhYhadjYe) 
 TrYhadjYeTpepsECYh = cTrace(YhadjYeTpepsECYh) 
 TrYhCYhYhCYh = cTrace(YhCYhYhCYh) 
 TrYhCYhTpYeadjepsE = cTrace(YhCYhTpYeadjepsE) 
 TrYuadjepsUYuadjepsU = cTrace(YuadjepsUYuadjepsU) 
 TrYuadjepsUYuadjYu = cTrace(YuadjepsUYuadjYu) 
 TrYuadjYuYuadjepsU = cTrace(YuadjYuYuadjepsU) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 TradjepsETpYeadjepsETpYe = cTrace(adjepsETpYeadjepsETpYe) 
 TradjepsETpYeCYeTpYe = cTrace(adjepsETpYeCYeTpYe) 
 TradjYeTpepsEadjYeTpepsE = cTrace(adjYeTpepsEadjYeTpepsE) 
 TradjYeTpepsECepsETpepsE = cTrace(adjYeTpepsECepsETpepsE) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 lam1p2 =lam1**2 
 lam10p2 =lam10**2 
 lam2p2 =lam2**2 
 lam3p2 =lam3**2 
 lam4p2 =lam4**2 
 lam5p2 =lam5**2 
 lam6p2 =lam6**2 
 lam7p2 =lam7**2 
 lam8p2 =lam8**2 
 lam9p2 =lam9**2 
 lamhp2 =lamh**2 
 mup2 =mu**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 22._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -3._dp*(g2p3)

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(lam1p2) + 4._dp*(lam3p2) + 2._dp*(lam4p2) + 2._dp*(lam5p2)            & 
&  + 24._dp*(lam6p2) + 2._dp*(lam8p2) - (9*g1p2*lam1)/5._dp - 9*g2p2*lam1 +              & 
&  4*lam3*lam4 + 2*lam6*TradjepsETpYe + 2*lam6*TradjYeTpepsE + 6*lam6*TrepsDadjYd +      & 
&  6*lam6*TrepsUadjYu + 6*lam6*TrYdadjepsD + 12*lam1*TrYdadjYd - 12._dp*(TrYdadjYdYdadjYd)& 
&  + 4*lam1*TrYeadjYe - 4._dp*(TrYeadjYeYeadjYe) + 6*lam6*TrYuadjepsU + 12*lam1*TrYuadjYu -& 
&  12._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! lam2 
!-------------------- 
 
betalam21  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(lam2p2) + 4._dp*(lam3p2) + 2._dp*(lam4p2) + 2._dp*(lam5p2)            & 
&  + 24._dp*(lam7p2) + 2._dp*(lam9p2) - (9*g1p2*lam2)/5._dp - 9*g2p2*lam2 +              & 
&  4*lam3*lam4 + 2*lam7*TradjepsETpYe + 2*lam7*TradjYeTpepsE + 12*lam2*TrepsDadjepsD -   & 
&  12._dp*(TrepsDadjepsDepsDadjepsD) + 6*lam7*TrepsDadjYd + 4*lam2*TrepsEadjepsE -       & 
&  4._dp*(TrepsEadjepsEepsEadjepsE) + 12*lam2*TrepsUadjepsU - 12._dp*(TrepsUadjepsUepsUadjepsU)& 
&  + 6*lam7*TrepsUadjYu + 6*lam7*TrYdadjepsD + 6*lam7*TrYuadjepsU

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam4 
!-------------------- 
 
betalam41  = (9*g1p2*g2p2)/5._dp + 2._dp*(lam10p2) + 4._dp*(lam4p2) + 8._dp*(lam5p2)  & 
&  + 10._dp*(lam6p2) + 10._dp*(lam7p2) - (9*g1p2*lam4)/5._dp - 9*g2p2*lam4 +             & 
&  2*lam1*lam4 + 2*lam2*lam4 + 8*lam3*lam4 + 4*lam6*lam7 + lam6*TradjepsETpYe +          & 
&  lam7*TradjepsETpYe + lam6*TradjYeTpepsE + lam7*TradjYeTpepsE + 6*lam4*TrepsDadjepsD + & 
&  3*(lam6 + lam7)*TrepsDadjYd - 12._dp*(TrepsDadjYdYdadjepsD) - 12._dp*(TrepsDadjYuepsUadjYd)& 
&  + 12._dp*(TrepsDadjYuYuadjepsD) + 2*lam4*TrepsEadjepsE - 4._dp*(TrepsEadjepsETpYeCYe) & 
&  + 6*lam4*TrepsUadjepsU + 12._dp*(TrepsUadjYdYdadjepsU) + 3*lam6*TrepsUadjYu +         & 
&  3*lam7*TrepsUadjYu - 12._dp*(TrepsUadjYuYuadjepsU) + 3*lam6*TrYdadjepsD +             & 
&  3*lam7*TrYdadjepsD - 12._dp*(TrYdadjepsUYuadjepsD) + 6*lam4*TrYdadjYd +               & 
&  2*lam4*TrYeadjYe + 3*lam6*TrYuadjepsU + 3*lam7*TrYuadjepsU + 6*lam4*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam42 = 0

 
Dlam4 = oo16pi2*( betalam41 + oo16pi2 * betalam42 ) 

 
Else 
Dlam4 = oo16pi2* betalam41 
End If 
 
 
Call Chop(Dlam4) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 27._dp*(g1p4)/100._dp - (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 4._dp*(lam3p2) + 2._dp*(lam4p2) + 2._dp*(lam5p2) + 4._dp*(lam6p2)             & 
&  + 4._dp*(lam7p2) - (9*g1p2*lam3)/5._dp - 9*g2p2*lam3 + 6*lam1*lam3 + 6*lam2*lam3 +    & 
&  2*lam1*lam4 + 2*lam2*lam4 + 16*lam6*lam7 + 2*lam8*lam9 + lam6*TradjepsETpYe +         & 
&  lam7*TradjepsETpYe + lam6*TradjYeTpepsE + lam7*TradjYeTpepsE + 6*lam3*TrepsDadjepsD - & 
&  12._dp*(TrepsDadjepsDYdadjYd) + 3*(lam6 + lam7)*TrepsDadjYd + 12._dp*(TrepsDadjYuepsUadjYd)& 
&  - 12._dp*(TrepsDadjYuYuadjepsD) + 2*lam3*TrepsEadjepsE + 6*lam3*TrepsUadjepsU -       & 
&  12._dp*(TrepsUadjepsUYuadjYu) - 12._dp*(TrepsUadjYdYdadjepsU) + 3*lam6*TrepsUadjYu +  & 
&  3*lam7*TrepsUadjYu + 3*lam6*TrYdadjepsD + 3*lam7*TrYdadjepsD + 12._dp*(TrYdadjepsUYuadjepsD)& 
&  + 6*lam3*TrYdadjYd + 2*lam3*TrYeadjYe - 4._dp*(TrYeadjYeTpepsECepsE) + 3*lam6*TrYuadjepsU +& 
&  3*lam7*TrYuadjepsU + 6*lam3*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam7 
!-------------------- 
 
betalam71  = (60*lam3*lam6 + 40*lam4*lam6 + 20*lam5*lam6 - 18*g1p2*lam7 -             & 
&  90*g2p2*lam7 + 120*lam2*lam7 + 60*lam3*lam7 + 80*lam4*lam7 + 100*lam5*lam7 +          & 
&  20*lam10*lam9 + 5*lam2*TradjepsETpYe + 5*lam3*TradjepsETpYe + 5*lam4*TradjepsETpYe +  & 
&  5*lam5*TradjepsETpYe + 5*lam2*TradjYeTpepsE + 5*lam3*TradjYeTpepsE + 5*lam4*TradjYeTpepsE +& 
&  5*lam5*TradjYeTpepsE - 20._dp*(TradjYeTpepsECepsETpepsE) + 90*lam7*TrepsDadjepsD -    & 
&  30._dp*(TrepsDadjepsDepsDadjYd) - 60._dp*(TrepsDadjepsDYdadjepsD) + 15*(lam2 +        & 
&  lam3 + lam4 + lam5)*TrepsDadjYd - 30._dp*(TrepsDadjYdepsDadjepsD) + 30*lam7*TrepsEadjepsE -& 
&  20._dp*(TrepsEadjepsETpYeadjepsE) + 90*lam7*TrepsUadjepsU - 30._dp*(TrepsUadjepsUepsUadjYu)& 
&  - 60._dp*(TrepsUadjepsUYuadjepsU) + 15*lam2*TrepsUadjYu + 15*lam3*TrepsUadjYu +       & 
&  15*lam4*TrepsUadjYu + 15*lam5*TrepsUadjYu - 30._dp*(TrepsUadjYuepsUadjepsU)           & 
&  + 15*lam2*TrYdadjepsD + 15*lam3*TrYdadjepsD + 15*lam4*TrYdadjepsD + 15*lam5*TrYdadjepsD +& 
&  30*lam7*TrYdadjYd + 10*lam7*TrYeadjYe + 15*lam2*TrYuadjepsU + 15*lam3*TrYuadjepsU +   & 
&  15*lam4*TrYuadjepsU + 15*lam5*TrYuadjepsU + 30*lam7*TrYuadjYu)/10._dp

 
 
If (TwoLoopRGE) Then 
betalam72 = 0

 
Dlam7 = oo16pi2*( betalam71 + oo16pi2 * betalam72 ) 

 
Else 
Dlam7 = oo16pi2* betalam71 
End If 
 
 
Call Chop(Dlam7) 

!-------------------- 
! lam5 
!-------------------- 
 
betalam51  = 2._dp*(lam10p2) + 10._dp*(lam6p2) + 10._dp*(lam7p2) - (9*g1p2*lam5)      & 
& /5._dp - 9*g2p2*lam5 + 2*lam1*lam5 + 2*lam2*lam5 + 8*lam3*lam5 + 12*lam4*lam5 +        & 
&  4*lam6*lam7 + lam6*TradjepsETpYe + lam7*TradjepsETpYe - 2._dp*(TradjepsETpYeadjepsETpYe)& 
&  + lam6*TradjYeTpepsE + lam7*TradjYeTpepsE - 2._dp*(TradjYeTpepsEadjYeTpepsE)          & 
&  + 6*lam5*TrepsDadjepsD + 3*(lam6 + lam7)*TrepsDadjYd - 6._dp*(TrepsDadjYdepsDadjYd)   & 
&  + 2*lam5*TrepsEadjepsE + 6*lam5*TrepsUadjepsU + 3*lam6*TrepsUadjYu + 3*lam7*TrepsUadjYu -& 
&  6._dp*(TrepsUadjYuepsUadjYu) + 3*lam6*TrYdadjepsD + 3*lam7*TrYdadjepsD -              & 
&  6._dp*(TrYdadjepsDYdadjepsD) + 6*lam5*TrYdadjYd + 2*lam5*TrYeadjYe + 3*lam6*TrYuadjepsU +& 
&  3*lam7*TrYuadjepsU - 6._dp*(TrYuadjepsUYuadjepsU) + 6*lam5*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam52 = 0

 
Dlam5 = oo16pi2*( betalam51 + oo16pi2 * betalam52 ) 

 
Else 
Dlam5 = oo16pi2* betalam51 
End If 
 
 
!-------------------- 
! lam6 
!-------------------- 
 
betalam61  = (-18*g1p2*lam6 - 90*g2p2*lam6 + 120*lam1*lam6 + 60*lam3*lam6 +           & 
&  80*lam4*lam6 + 100*lam5*lam6 + 60*lam3*lam7 + 40*lam4*lam7 + 20*lam5*lam7 +           & 
&  20*lam10*lam8 + 5*lam1*TradjepsETpYe + 5*lam3*TradjepsETpYe + 5*lam4*TradjepsETpYe +  & 
&  5*lam5*TradjepsETpYe - 20._dp*(TradjepsETpYeCYeTpYe) + 5*lam1*TradjYeTpepsE +         & 
&  5*lam3*TradjYeTpepsE + 5*lam4*TradjYeTpepsE + 5*lam5*TradjYeTpepsE + 30*lam6*TrepsDadjepsD +& 
&  15*(lam1 + lam3 + lam4 + lam5)*TrepsDadjYd - 60._dp*(TrepsDadjYdYdadjYd)              & 
&  + 10*lam6*TrepsEadjepsE + 30*lam6*TrepsUadjepsU + 15*lam1*TrepsUadjYu +               & 
&  15*lam3*TrepsUadjYu + 15*lam4*TrepsUadjYu + 15*lam5*TrepsUadjYu - 60._dp*(TrepsUadjYuYuadjYu)& 
&  + 15*lam1*TrYdadjepsD + 15*lam3*TrYdadjepsD + 15*lam4*TrYdadjepsD + 15*lam5*TrYdadjepsD -& 
&  30._dp*(TrYdadjepsDYdadjYd) + 90*lam6*TrYdadjYd - 30._dp*(TrYdadjYdYdadjepsD)         & 
&  + 30*lam6*TrYeadjYe - 20._dp*(TrYeadjYeTpepsEadjYe) + 15*lam1*TrYuadjepsU +           & 
&  15*lam3*TrYuadjepsU + 15*lam4*TrYuadjepsU + 15*lam5*TrYuadjepsU - 30._dp*(TrYuadjepsUYuadjYu)& 
&  + 90*lam6*TrYuadjYu - 30._dp*(TrYuadjYuYuadjepsU))/10._dp

 
 
If (TwoLoopRGE) Then 
betalam62 = 0

 
Dlam6 = oo16pi2*( betalam61 + oo16pi2 * betalam62 ) 

 
Else 
Dlam6 = oo16pi2* betalam61 
End If 
 
 
Call Chop(Dlam6) 

!-------------------- 
! lam9 
!-------------------- 
 
betalam91  = 27._dp*(g1p4)/25._dp + 4._dp*(lam10p2) + 4._dp*(lam9p2) + 12*lam10*lam7 +& 
&  4*lam3*lam8 + 2*lam4*lam8 - (9*g1p2*lam9)/2._dp - (9*g2p2*lam9)/2._dp +               & 
&  6*lam2*lam9 + 8*lam9*lamh + lam10*TradjepsETpYe + lam10*TradjYeTpepsE +               & 
&  6*lam9*TrepsDadjepsD + 3*lam10*TrepsDadjYd + 2*lam9*TrepsEadjepsE + 16._dp*(TrepsEadjepsEYhCYh)& 
&  + 6*lam9*TrepsUadjepsU + 3*lam10*TrepsUadjYu + 3*lam10*TrYdadjepsD - 8*lam9*TrYhCYh + & 
&  3*lam10*TrYuadjepsU

 
 
If (TwoLoopRGE) Then 
betalam92 = 0

 
Dlam9 = oo16pi2*( betalam91 + oo16pi2 * betalam92 ) 

 
Else 
Dlam9 = oo16pi2* betalam91 
End If 
 
 
Call Chop(Dlam9) 

!-------------------- 
! lam8 
!-------------------- 
 
betalam81  = 27._dp*(g1p4)/25._dp + 4._dp*(lam10p2) + 4._dp*(lam8p2) + 12*lam10*lam6 -& 
&  (9*g1p2*lam8)/2._dp - (9*g2p2*lam8)/2._dp + 6*lam1*lam8 + 4*lam3*lam9 +               & 
&  2*lam4*lam9 + 8*lam8*lamh + lam10*TradjepsETpYe + lam10*TradjYeTpepsE +               & 
&  3*lam10*TrepsDadjYd + 3*lam10*TrepsUadjYu + 3*lam10*TrYdadjepsD + 6*lam8*TrYdadjYd +  & 
&  2*lam8*TrYeadjYe + 16._dp*(TrYeCYhYhadjYe) - 8*lam8*TrYhCYh + 3*lam10*TrYuadjepsU +   & 
&  6*lam8*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam82 = 0

 
Dlam8 = oo16pi2*( betalam81 + oo16pi2 * betalam82 ) 

 
Else 
Dlam8 = oo16pi2* betalam81 
End If 
 
 
Call Chop(Dlam8) 

!-------------------- 
! lamh 
!-------------------- 
 
betalamh1  = 54._dp*(g1p4)/25._dp + 4._dp*(lam10p2) + 2._dp*(lam8p2) + 2._dp*(lam9p2) & 
&  - (36*g1p2*lamh)/5._dp + 20._dp*(lamhp2) - 16*lamh*TrYhCYh - 32._dp*(TrYhCYhYhCYh)

 
 
If (TwoLoopRGE) Then 
betalamh2 = 0

 
Dlamh = oo16pi2*( betalamh1 + oo16pi2 * betalamh2 ) 

 
Else 
Dlamh = oo16pi2* betalamh1 
End If 
 
 
Call Chop(Dlamh) 

!-------------------- 
! lam10 
!-------------------- 
 
betalam101  = (-9*g1p2*lam10 - 9*g2p2*lam10 + 4*lam10*lam3 + 8*lam10*lam4 +           & 
&  12*lam10*lam5 + 8*lam10*lam8 + 12*lam6*lam8 + 8*lam10*lam9 + 12*lam7*lam9 +           & 
&  16*lam10*lamh + lam8*TradjepsETpYe + lam9*TradjepsETpYe + lam8*TradjYeTpepsE +        & 
&  lam9*TradjYeTpepsE + 6*lam10*TrepsDadjepsD + 3*(lam8 + lam9)*TrepsDadjYd +            & 
&  2*lam10*TrepsEadjepsE + 6*lam10*TrepsUadjepsU + 3*lam8*TrepsUadjYu + 3*lam9*TrepsUadjYu +& 
&  3*lam8*TrYdadjepsD + 3*lam9*TrYdadjepsD + 6*lam10*TrYdadjYd + 2*lam10*TrYeadjYe +     & 
&  16._dp*(TrYhadjYeTpepsECYh) - 16*lam10*TrYhCYh + 16._dp*(TrYhCYhTpYeadjepsE)          & 
&  + 3*lam8*TrYuadjepsU + 3*lam9*TrYuadjepsU + 6*lam10*TrYuadjYu)/2._dp

 
 
If (TwoLoopRGE) Then 
betalam102 = 0

 
Dlam10 = oo16pi2*( betalam101 + oo16pi2 * betalam102 ) 

 
Else 
Dlam10 = oo16pi2* betalam101 
End If 
 
 
Call Chop(Dlam10) 

!-------------------- 
! epsU 
!-------------------- 
 
betaepsU1  = epsU*(-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)          & 
&  + 3._dp*(TrepsDadjepsD) + TrepsEadjepsE + 3._dp*(TrepsUadjepsU)) + (-3._dp*(epsUadjepsDepsD)& 
&  + 3._dp*(epsUadjepsUepsU) + epsUadjYdYd + epsUadjYuYu + 2*TradjepsETpYe*Yu +          & 
&  6*TrepsUadjYu*Yu + 6*TrYdadjepsD*Yu - 4._dp*(YuadjepsDYd) + 2._dp*(YuadjYuepsU))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepsU2 = 0

 
DepsU = oo16pi2*( betaepsU1 + oo16pi2 * betaepsU2 ) 

 
Else 
DepsU = oo16pi2* betaepsU1 
End If 
 
 
Call Chop(DepsU) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = epsU*(TradjYeTpepsE + 3._dp*(TrepsDadjYd) + 3._dp*(TrYuadjepsU))           & 
&  + (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) + 3._dp*(TrYdadjYd)      & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Yu + (2._dp*(epsUadjepsUYu) - 4._dp*(epsUadjYdepsD)  & 
&  + YuadjepsDepsD + YuadjepsUepsU - 3._dp*(YuadjYdYd) + 3._dp*(YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! epsD 
!-------------------- 
 
betaepsD1  = epsD*(-1._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)            & 
&  + 3._dp*(TrepsDadjepsD) + TrepsEadjepsE + 3._dp*(TrepsUadjepsU)) + (3._dp*(epsDadjepsDepsD)& 
&  - 3._dp*(epsDadjepsUepsU) + epsDadjYdYd + epsDadjYuYu + 2*TradjYeTpepsE*Yd +          & 
&  6*TrepsDadjYd*Yd + 6*TrYuadjepsU*Yd - 4._dp*(YdadjepsUYu) + 2._dp*(YdadjYdepsD))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepsD2 = 0

 
DepsD = oo16pi2*( betaepsD1 + oo16pi2 * betaepsD2 ) 

 
Else 
DepsD = oo16pi2* betaepsD1 
End If 
 
 
Call Chop(DepsD) 

!-------------------- 
! epsE 
!-------------------- 
 
betaepsE1  = 3._dp*(epsEadjepsEepsE)/2._dp + epsECYeTpYe + TpYeCYeepsE/2._dp +        & 
&  epsE*(-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrepsDadjepsD) +              & 
&  TrepsEadjepsE + 3._dp*(TrepsUadjepsU)) - 2._dp*(YhCYhepsE) + TradjYeTpepsE*Transpose(Ye)& 
&  + 3*TrepsDadjYd*Transpose(Ye) + 3*TrYuadjepsU*Transpose(Ye)

 
 
If (TwoLoopRGE) Then 
betaepsE2 = 0

 
DepsE = oo16pi2*( betaepsE1 + oo16pi2 * betaepsE2 ) 

 
Else 
DepsE = oo16pi2* betaepsE1 
End If 
 
 
Call Chop(DepsE) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = epsD*(TradjepsETpYe + 3._dp*(TrepsUadjYu) + 3._dp*(TrYdadjepsD))           & 
&  + (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd) - 4._dp*(TrYeadjYe)    & 
&  - 12._dp*(TrYuadjYu))*Yd) + 2*(2._dp*(epsDadjepsDYd) - 4._dp*(epsDadjYuepsU)          & 
&  + YdadjepsDepsD + YdadjepsUepsU + 3._dp*(YdadjYdYd) - 3._dp*(YdadjYuYu)))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrYdadjYd)              & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Ye + (2._dp*(TpepsECepsEYe) + 3._dp*(YeadjYeYe)      & 
&  + YeCepsETpepsE - 4._dp*(YeCYhYh))/2._dp + (TradjepsETpYe + 3._dp*(TrepsUadjYu)       & 
&  + 3._dp*(TrYdadjepsD))*Transpose(epsE)

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yh 
!-------------------- 
 
betaYh1  = (-((9*(g1p2 + 5._dp*(g2p2)) + 40._dp*(TrYhCYh))*Yh) + 5*(epsEadjepsEYh +   & 
&  TpYeCYeYh + YhadjYeYe + YhCepsETpepsE - 8._dp*(YhCYhYh)))/10._dp

 
 
If (TwoLoopRGE) Then 
betaYh2 = 0

 
DYh = oo16pi2*( betaYh1 + oo16pi2 * betaYh2 ) 

 
Else 
DYh = oo16pi2* betaYh1 
End If 
 
 
Call Chop(DYh) 

!-------------------- 
! mu 
!-------------------- 
 
betamu1  = (-27*g1p2*mu)/10._dp - (9*g2p2*mu)/2._dp + 2*lam3*mu - 2*lam4*mu +         & 
&  2*lam8*mu + 2*lam9*mu + 3*mu*TrepsDadjepsD + mu*TrepsEadjepsE + 3*mu*TrepsUadjepsU +  & 
&  3*mu*TrYdadjYd + mu*TrYeadjYe - 4*mu*TrYhCYh + 3*mu*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betamu2 = 0

 
Dmu = oo16pi2*( betamu1 + oo16pi2 * betamu2 ) 

 
Else 
Dmu = oo16pi2* betamu1 
End If 
 
 
Call Chop(Dmu) 

!-------------------- 
! mH2 
!-------------------- 
 
betamH21  = -12*lam6*m12 + 4*lam3*mEt2 + 2*lam4*mEt2 + 2*lam8*mh - (9*g1p2*mH2)       & 
& /10._dp - (9*g2p2*mH2)/2._dp + 6*lam1*mH2 + 2._dp*(mup2) - 2*m12*TradjepsETpYe -       & 
&  6*m12*TrYdadjepsD + 6*mH2*TrYdadjYd + 2*mH2*TrYeadjYe - 6*m12*TrYuadjepsU +           & 
&  6*mH2*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betamH22 = 0

 
DmH2 = oo16pi2*( betamH21 + oo16pi2 * betamH22 ) 

 
Else 
DmH2 = oo16pi2* betamH21 
End If 
 
 
Call Chop(DmH2) 

!-------------------- 
! mEt2 
!-------------------- 
 
betamEt21  = -12*lam7*m12 - (9*g1p2*mEt2)/10._dp - (9*g2p2*mEt2)/2._dp +              & 
&  6*lam2*mEt2 + 2*lam9*mh + 4*lam3*mH2 + 2*lam4*mH2 + 2._dp*(mup2) - 2*m12*TradjYeTpepsE +& 
&  6*mEt2*TrepsDadjepsD - 6*m12*TrepsDadjYd + 2*mEt2*TrepsEadjepsE + 6*mEt2*TrepsUadjepsU -& 
&  6*m12*TrepsUadjYu

 
 
If (TwoLoopRGE) Then 
betamEt22 = 0

 
DmEt2 = oo16pi2*( betamEt21 + oo16pi2 * betamEt22 ) 

 
Else 
DmEt2 = oo16pi2* betamEt21 
End If 
 
 
Call Chop(DmEt2) 

!-------------------- 
! m12 
!-------------------- 
 
betam121  = (-9*g1p2*m12)/10._dp - (9*g2p2*m12)/2._dp + 2*lam3*m12 + 4*lam4*m12 +     & 
&  6*lam5*m12 - 6*lam7*mEt2 - 2*lam10*mh - 6*lam6*mH2 - mEt2*TradjepsETpYe -             & 
&  mH2*TradjYeTpepsE + 3*m12*TrepsDadjepsD - 3*mH2*TrepsDadjYd + m12*TrepsEadjepsE +     & 
&  3*m12*TrepsUadjepsU - 3*mH2*TrepsUadjYu - 3*mEt2*TrYdadjepsD + 3*m12*TrYdadjYd +      & 
&  m12*TrYeadjYe - 3*mEt2*TrYuadjepsU + 3*m12*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betam122 = 0

 
Dm12 = oo16pi2*( betam121 + oo16pi2 * betam122 ) 

 
Else 
Dm12 = oo16pi2* betam121 
End If 
 
 
Call Chop(Dm12) 

!-------------------- 
! mh 
!-------------------- 
 
betamh1  = -8*lam10*m12 + 4*lam9*mEt2 - (18*g1p2*mh)/5._dp + 8*lamh*mh +              & 
&  4*lam8*mH2 + 4._dp*(mup2) - 8*mh*TrYhCYh

 
 
If (TwoLoopRGE) Then 
betamh2 = 0

 
Dmh = oo16pi2*( betamh1 + oo16pi2 * betamh2 ) 

 
Else 
Dmh = oo16pi2* betamh1 
End If 
 
 
Call Chop(Dmh) 

Call ParametersToG160(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam4,Dlam3,Dlam7,Dlam5,Dlam6,          & 
& Dlam9,Dlam8,Dlamh,Dlam10,DepsU,DYu,DepsD,DepsE,DYd,DYe,DYh,Dmu,DmH2,DmEt2,             & 
& Dm12,Dmh,f)

Iname = Iname - 1 
 
End Subroutine rge160  

Subroutine GToParameters162(g,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,            & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv)

Implicit None 
Real(dp), Intent(in) :: g(162) 
Real(dp),Intent(out) :: g1,g2,g3,lam5,v,vv

Complex(dp),Intent(out) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters162' 
 
g1= g(1) 
g2= g(2) 
g3= g(3) 
lam1= Cmplx(g(4),g(5),dp) 
lam2= Cmplx(g(6),g(7),dp) 
lam4= Cmplx(g(8),g(9),dp) 
lam3= Cmplx(g(10),g(11),dp) 
lam7= Cmplx(g(12),g(13),dp) 
lam5= g(14) 
lam6= Cmplx(g(15),g(16),dp) 
lam9= Cmplx(g(17),g(18),dp) 
lam8= Cmplx(g(19),g(20),dp) 
lamh= Cmplx(g(21),g(22),dp) 
lam10= Cmplx(g(23),g(24),dp) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsU(i1,i2) = Cmplx( g(SumI+25), g(SumI+26), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yu(i1,i2) = Cmplx( g(SumI+43), g(SumI+44), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsD(i1,i2) = Cmplx( g(SumI+61), g(SumI+62), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
epsE(i1,i2) = Cmplx( g(SumI+79), g(SumI+80), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yd(i1,i2) = Cmplx( g(SumI+97), g(SumI+98), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Ye(i1,i2) = Cmplx( g(SumI+115), g(SumI+116), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yh(i1,i2) = Cmplx( g(SumI+133), g(SumI+134), dp) 
End Do 
 End Do 
 
mu= Cmplx(g(151),g(152),dp) 
mH2= Cmplx(g(153),g(154),dp) 
mEt2= Cmplx(g(155),g(156),dp) 
m12= Cmplx(g(157),g(158),dp) 
mh= Cmplx(g(159),g(160),dp) 
v= g(161) 
vv= g(162) 
Do i1=1,162 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters162

Subroutine ParametersToG162(g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,              & 
& lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv,g)

Implicit None 
Real(dp), Intent(out) :: g(162) 
Real(dp), Intent(in) :: g1,g2,g3,lam5,v,vv

Complex(dp), Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG162' 
 
g(1) = g1  
g(2) = g2  
g(3) = g3  
g(4) = Real(lam1,dp)  
g(5) = Aimag(lam1)  
g(6) = Real(lam2,dp)  
g(7) = Aimag(lam2)  
g(8) = Real(lam4,dp)  
g(9) = Aimag(lam4)  
g(10) = Real(lam3,dp)  
g(11) = Aimag(lam3)  
g(12) = Real(lam7,dp)  
g(13) = Aimag(lam7)  
g(14) = lam5  
g(15) = Real(lam6,dp)  
g(16) = Aimag(lam6)  
g(17) = Real(lam9,dp)  
g(18) = Aimag(lam9)  
g(19) = Real(lam8,dp)  
g(20) = Aimag(lam8)  
g(21) = Real(lamh,dp)  
g(22) = Aimag(lamh)  
g(23) = Real(lam10,dp)  
g(24) = Aimag(lam10)  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+25) = Real(epsU(i1,i2), dp) 
g(SumI+26) = Aimag(epsU(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+43) = Real(Yu(i1,i2), dp) 
g(SumI+44) = Aimag(Yu(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+61) = Real(epsD(i1,i2), dp) 
g(SumI+62) = Aimag(epsD(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+79) = Real(epsE(i1,i2), dp) 
g(SumI+80) = Aimag(epsE(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+97) = Real(Yd(i1,i2), dp) 
g(SumI+98) = Aimag(Yd(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+115) = Real(Ye(i1,i2), dp) 
g(SumI+116) = Aimag(Ye(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+133) = Real(Yh(i1,i2), dp) 
g(SumI+134) = Aimag(Yh(i1,i2)) 
End Do 
End Do 

g(151) = Real(mu,dp)  
g(152) = Aimag(mu)  
g(153) = Real(mH2,dp)  
g(154) = Aimag(mH2)  
g(155) = Real(mEt2,dp)  
g(156) = Aimag(mEt2)  
g(157) = Real(m12,dp)  
g(158) = Aimag(m12)  
g(159) = Real(mh,dp)  
g(160) = Aimag(mh)  
g(161) = v  
g(162) = vv  
Iname = Iname - 1 
 
End Subroutine ParametersToG162

Subroutine rge162(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: g1,betag11,betag12,Dg1,g2,betag21,betag22,Dg2,g3,betag31,betag32,         & 
& Dg3,lam5,betalam51,betalam52,Dlam5,v,betav1,betav2,Dv,vv,betavv1,betavv2,Dvv
Complex(dp) :: lam1,betalam11,betalam12,Dlam1,lam2,betalam21,betalam22,               & 
& Dlam2,lam4,betalam41,betalam42,Dlam4,lam3,betalam31,betalam32,Dlam3,lam7,              & 
& betalam71,betalam72,Dlam7,lam6,betalam61,betalam62,Dlam6,lam9,betalam91,               & 
& betalam92,Dlam9,lam8,betalam81,betalam82,Dlam8,lamh,betalamh1,betalamh2,               & 
& Dlamh,lam10,betalam101,betalam102,Dlam10,epsU(3,3),betaepsU1(3,3),betaepsU2(3,3)       & 
& ,DepsU(3,3),adjepsU(3,3),Yu(3,3),betaYu1(3,3),betaYu2(3,3),DYu(3,3),adjYu(3,3)         & 
& ,epsD(3,3),betaepsD1(3,3),betaepsD2(3,3),DepsD(3,3),adjepsD(3,3),epsE(3,3)             & 
& ,betaepsE1(3,3),betaepsE2(3,3),DepsE(3,3),adjepsE(3,3),Yd(3,3),betaYd1(3,3)            & 
& ,betaYd2(3,3),DYd(3,3),adjYd(3,3),Ye(3,3),betaYe1(3,3),betaYe2(3,3),DYe(3,3)           & 
& ,adjYe(3,3),Yh(3,3),betaYh1(3,3),betaYh2(3,3),DYh(3,3),adjYh(3,3),mu,betamu1,          & 
& betamu2,Dmu,mH2,betamH21,betamH22,DmH2,mEt2,betamEt21,betamEt22,DmEt2,m12,             & 
& betam121,betam122,Dm12,mh,betamh1,betamh2,Dmh
Complex(dp) :: epsDadjepsD(3,3),epsDadjYd(3,3),epsEadjepsE(3,3),epsUadjepsU(3,3),epsUadjYd(3,3),     & 
& epsUadjYu(3,3),YdadjepsD(3,3),YdadjepsU(3,3),YdadjYd(3,3),YeadjYe(3,3),YhadjYe(3,3),   & 
& YhCYh(3,3),YuadjepsD(3,3),YuadjepsU(3,3),YuadjYu(3,3),adjepsDepsD(3,3),adjepsDYd(3,3), & 
& adjepsEepsE(3,3),adjepsEYh(3,3),adjepsETpYe(3,3),adjepsUepsU(3,3),adjepsUYu(3,3),      & 
& adjYdepsD(3,3),adjYdYd(3,3),adjYeYe(3,3),adjYeTpepsE(3,3),adjYuepsU(3,3),              & 
& adjYuYu(3,3),CepsEYe(3,3),CepsETpepsE(3,3),CYeepsE(3,3),CYeYh(3,3),CYeTpYe(3,3),       & 
& CYhepsE(3,3),CYhYh(3,3),TpepsEadjYe(3,3),TpepsECepsE(3,3),TpepsECYh(3,3),              & 
& TpYeadjepsE(3,3),TpYeCYe(3,3),epsDadjepsDepsD(3,3),epsDadjepsDYd(3,3),epsDadjepsUepsU(3,3),& 
& epsDadjYdYd(3,3),epsDadjYuepsU(3,3),epsDadjYuYu(3,3),epsEadjepsEepsE(3,3),             & 
& epsEadjepsEYh(3,3),epsECYeTpYe(3,3),epsUadjepsDepsD(3,3),epsUadjepsUepsU(3,3),         & 
& epsUadjepsUYu(3,3),epsUadjYdepsD(3,3),epsUadjYdYd(3,3),epsUadjYuYu(3,3),               & 
& YdadjepsDepsD(3,3),YdadjepsUepsU(3,3),YdadjepsUYu(3,3),YdadjYdepsD(3,3),               & 
& YdadjYdYd(3,3),YdadjYuYu(3,3),YeadjYeYe(3,3),YeCepsETpepsE(3,3),YeCYhYh(3,3),          & 
& YhadjYeYe(3,3),YhCepsETpepsE(3,3),YhCYhepsE(3,3),YhCYhYh(3,3),YuadjepsDepsD(3,3),      & 
& YuadjepsDYd(3,3),YuadjepsUepsU(3,3),YuadjYdYd(3,3),YuadjYuepsU(3,3),YuadjYuYu(3,3),    & 
& adjepsDepsDadjepsD(3,3),adjepsDepsDadjYd(3,3),adjepsDYdadjepsD(3,3),adjepsDYdadjYd(3,3),& 
& adjepsEepsEadjepsE(3,3),adjepsEYhCYh(3,3),adjepsETpYeadjepsE(3,3),adjepsETpYeCYe(3,3), & 
& adjepsUepsUadjepsU(3,3),adjepsUepsUadjYu(3,3),adjepsUYuadjepsD(3,3),adjepsUYuadjepsU(3,3),& 
& adjepsUYuadjYu(3,3),adjYdepsDadjepsD(3,3),adjYdepsDadjYd(3,3),adjYdYdadjepsD(3,3),     & 
& adjYdYdadjepsU(3,3),adjYdYdadjYd(3,3),adjYeYeadjYe(3,3),adjYeTpepsEadjYe(3,3),         & 
& adjYeTpepsECepsE(3,3),adjYeTpepsECYh(3,3),adjYuepsUadjepsU(3,3),adjYuepsUadjYd(3,3),   & 
& adjYuepsUadjYu(3,3),adjYuYuadjepsD(3,3),adjYuYuadjepsU(3,3),adjYuYuadjYu(3,3),         & 
& CYhYhadjYe(3,3),CYhYhCYh(3,3),CYhTpYeadjepsE(3,3),TpepsEadjYeTpepsE(3,3),              & 
& TpepsECepsEYe(3,3),TpepsECepsETpepsE(3,3),TpYeadjepsETpYe(3,3),TpYeCYeepsE(3,3),       & 
& TpYeCYeYh(3,3),TpYeCYeTpYe(3,3),epsDadjepsDepsDadjepsD(3,3),epsDadjepsDepsDadjYd(3,3), & 
& epsDadjepsDYdadjepsD(3,3),epsDadjepsDYdadjYd(3,3),epsDadjYdepsDadjepsD(3,3),           & 
& epsDadjYdepsDadjYd(3,3),epsDadjYdYdadjepsD(3,3),epsDadjYdYdadjYd(3,3),epsDadjYuepsUadjYd(3,3),& 
& epsDadjYuYuadjepsD(3,3),epsEadjepsEepsEadjepsE(3,3),epsEadjepsEYhCYh(3,3),             & 
& epsEadjepsETpYeadjepsE(3,3),epsEadjepsETpYeCYe(3,3),epsUadjepsUepsUadjepsU(3,3),       & 
& epsUadjepsUepsUadjYu(3,3),epsUadjepsUYuadjepsU(3,3),epsUadjepsUYuadjYu(3,3),           & 
& epsUadjYdYdadjepsU(3,3),epsUadjYuepsUadjepsU(3,3),epsUadjYuepsUadjYu(3,3),             & 
& epsUadjYuYuadjepsU(3,3),epsUadjYuYuadjYu(3,3),YdadjepsDYdadjepsD(3,3),YdadjepsDYdadjYd(3,3),& 
& YdadjepsUYuadjepsD(3,3),YdadjYdYdadjepsD(3,3),YdadjYdYdadjYd(3,3),YeadjYeYeadjYe(3,3), & 
& YeadjYeTpepsEadjYe(3,3),YeadjYeTpepsECepsE(3,3),YeCYhYhadjYe(3,3),YhadjYeTpepsECYh(3,3),& 
& YhCYhYhCYh(3,3),YhCYhTpYeadjepsE(3,3),YuadjepsUYuadjepsU(3,3),YuadjepsUYuadjYu(3,3),   & 
& YuadjYuYuadjepsU(3,3),YuadjYuYuadjYu(3,3),adjepsETpYeadjepsETpYe(3,3),adjepsETpYeCYeTpYe(3,3),& 
& adjYeTpepsEadjYeTpepsE(3,3),adjYeTpepsECepsETpepsE(3,3)

Complex(dp) :: TrepsDadjepsD,TrepsDadjYd,TrepsEadjepsE,TrepsUadjepsU,TrepsUadjYu,TrYdadjepsD,        & 
& TrYdadjYd,TrYeadjYe,TrYhCYh,TrYuadjepsU,TrYuadjYu,TradjepsETpYe,TradjYeTpepsE,         & 
& TrepsDadjepsDepsDadjepsD,TrepsDadjepsDepsDadjYd,TrepsDadjepsDYdadjepsD,TrepsDadjepsDYdadjYd,& 
& TrepsDadjYdepsDadjepsD,TrepsDadjYdepsDadjYd,TrepsDadjYdYdadjepsD,TrepsDadjYdYdadjYd,   & 
& TrepsDadjYuepsUadjYd,TrepsDadjYuYuadjepsD,TrepsEadjepsEepsEadjepsE,TrepsEadjepsEYhCYh, & 
& TrepsEadjepsETpYeadjepsE,TrepsEadjepsETpYeCYe,TrepsUadjepsUepsUadjepsU,TrepsUadjepsUepsUadjYu,& 
& TrepsUadjepsUYuadjepsU,TrepsUadjepsUYuadjYu,TrepsUadjYdYdadjepsU,TrepsUadjYuepsUadjepsU,& 
& TrepsUadjYuepsUadjYu,TrepsUadjYuYuadjepsU,TrepsUadjYuYuadjYu,TrYdadjepsDYdadjepsD,     & 
& TrYdadjepsDYdadjYd,TrYdadjepsUYuadjepsD,TrYdadjYdYdadjepsD,TrYdadjYdYdadjYd,           & 
& TrYeadjYeYeadjYe,TrYeadjYeTpepsEadjYe,TrYeadjYeTpepsECepsE,TrYeCYhYhadjYe,             & 
& TrYhadjYeTpepsECYh,TrYhCYhYhCYh,TrYhCYhTpYeadjepsE,TrYuadjepsUYuadjepsU,               & 
& TrYuadjepsUYuadjYu,TrYuadjYuYuadjepsU,TrYuadjYuYuadjYu,TradjepsETpYeadjepsETpYe,       & 
& TradjepsETpYeCYeTpYe,TradjYeTpepsEadjYeTpepsE,TradjYeTpepsECepsETpepsE

Real(dp) :: g1p2,g1p3,g1p4,g2p2,g2p3,g2p4,g3p2,g3p3,lam5p2

Complex(dp) :: lam1p2,lam10p2,lam2p2,lam3p2,lam4p2,lam6p2,lam7p2,lam8p2,lam9p2,lamhp2,mup2

Iname = Iname +1 
NameOfUnit(Iname) = 'rge162' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters162(gy,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,            & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,v,vv)

Call Adjungate(epsU,adjepsU)
Call Adjungate(Yu,adjYu)
Call Adjungate(epsD,adjepsD)
Call Adjungate(epsE,adjepsE)
Call Adjungate(Yd,adjYd)
Call Adjungate(Ye,adjYe)
Call Adjungate(Yh,adjYh)
 epsDadjepsD = Matmul(epsD,adjepsD) 
Forall(i2=1:3)  epsDadjepsD(i2,i2) =  Real(epsDadjepsD(i2,i2),dp) 
 epsDadjYd = Matmul(epsD,adjYd) 
 epsEadjepsE = Matmul(epsE,adjepsE) 
Forall(i2=1:3)  epsEadjepsE(i2,i2) =  Real(epsEadjepsE(i2,i2),dp) 
 epsUadjepsU = Matmul(epsU,adjepsU) 
Forall(i2=1:3)  epsUadjepsU(i2,i2) =  Real(epsUadjepsU(i2,i2),dp) 
 epsUadjYd = Matmul(epsU,adjYd) 
 epsUadjYu = Matmul(epsU,adjYu) 
 YdadjepsD = Matmul(Yd,adjepsD) 
 YdadjepsU = Matmul(Yd,adjepsU) 
 YdadjYd = Matmul(Yd,adjYd) 
Forall(i2=1:3)  YdadjYd(i2,i2) =  Real(YdadjYd(i2,i2),dp) 
 YeadjYe = Matmul(Ye,adjYe) 
Forall(i2=1:3)  YeadjYe(i2,i2) =  Real(YeadjYe(i2,i2),dp) 
 YhadjYe = Matmul(Yh,adjYe) 
 YhCYh = Matmul(Yh,Conjg(Yh)) 
 YuadjepsD = Matmul(Yu,adjepsD) 
 YuadjepsU = Matmul(Yu,adjepsU) 
 YuadjYu = Matmul(Yu,adjYu) 
Forall(i2=1:3)  YuadjYu(i2,i2) =  Real(YuadjYu(i2,i2),dp) 
 adjepsDepsD = Matmul(adjepsD,epsD) 
Forall(i2=1:3)  adjepsDepsD(i2,i2) =  Real(adjepsDepsD(i2,i2),dp) 
 adjepsDYd = Matmul(adjepsD,Yd) 
 adjepsEepsE = Matmul(adjepsE,epsE) 
Forall(i2=1:3)  adjepsEepsE(i2,i2) =  Real(adjepsEepsE(i2,i2),dp) 
 adjepsEYh = Matmul(adjepsE,Yh) 
 adjepsETpYe = Matmul(adjepsE,Transpose(Ye)) 
 adjepsUepsU = Matmul(adjepsU,epsU) 
Forall(i2=1:3)  adjepsUepsU(i2,i2) =  Real(adjepsUepsU(i2,i2),dp) 
 adjepsUYu = Matmul(adjepsU,Yu) 
 adjYdepsD = Matmul(adjYd,epsD) 
 adjYdYd = Matmul(adjYd,Yd) 
Forall(i2=1:3)  adjYdYd(i2,i2) =  Real(adjYdYd(i2,i2),dp) 
 adjYeYe = Matmul(adjYe,Ye) 
Forall(i2=1:3)  adjYeYe(i2,i2) =  Real(adjYeYe(i2,i2),dp) 
 adjYeTpepsE = Matmul(adjYe,Transpose(epsE)) 
 adjYuepsU = Matmul(adjYu,epsU) 
 adjYuYu = Matmul(adjYu,Yu) 
Forall(i2=1:3)  adjYuYu(i2,i2) =  Real(adjYuYu(i2,i2),dp) 
 CepsEYe = Matmul(Conjg(epsE),Ye) 
 CepsETpepsE = Matmul(Conjg(epsE),Transpose(epsE)) 
Forall(i2=1:3)  CepsETpepsE(i2,i2) =  Real(CepsETpepsE(i2,i2),dp) 
 CYeepsE = Matmul(Conjg(Ye),epsE) 
 CYeYh = Matmul(Conjg(Ye),Yh) 
 CYeTpYe = Matmul(Conjg(Ye),Transpose(Ye)) 
Forall(i2=1:3)  CYeTpYe(i2,i2) =  Real(CYeTpYe(i2,i2),dp) 
 CYhepsE = Matmul(Conjg(Yh),epsE) 
 CYhYh = Matmul(Conjg(Yh),Yh) 
 TpepsEadjYe = Matmul(Transpose(epsE),adjYe) 
 TpepsECepsE = Matmul(Transpose(epsE),Conjg(epsE)) 
Forall(i2=1:3)  TpepsECepsE(i2,i2) =  Real(TpepsECepsE(i2,i2),dp) 
 TpepsECYh = Matmul(Transpose(epsE),Conjg(Yh)) 
 TpYeadjepsE = Matmul(Transpose(Ye),adjepsE) 
 TpYeCYe = Matmul(Transpose(Ye),Conjg(Ye)) 
Forall(i2=1:3)  TpYeCYe(i2,i2) =  Real(TpYeCYe(i2,i2),dp) 
 epsDadjepsDepsD = Matmul(epsD,adjepsDepsD) 
 epsDadjepsDYd = Matmul(epsD,adjepsDYd) 
 epsDadjepsUepsU = Matmul(epsD,adjepsUepsU) 
 epsDadjYdYd = Matmul(epsD,adjYdYd) 
 epsDadjYuepsU = Matmul(epsD,adjYuepsU) 
 epsDadjYuYu = Matmul(epsD,adjYuYu) 
 epsEadjepsEepsE = Matmul(epsE,adjepsEepsE) 
 epsEadjepsEYh = Matmul(epsE,adjepsEYh) 
 epsECYeTpYe = Matmul(epsE,CYeTpYe) 
 epsUadjepsDepsD = Matmul(epsU,adjepsDepsD) 
 epsUadjepsUepsU = Matmul(epsU,adjepsUepsU) 
 epsUadjepsUYu = Matmul(epsU,adjepsUYu) 
 epsUadjYdepsD = Matmul(epsU,adjYdepsD) 
 epsUadjYdYd = Matmul(epsU,adjYdYd) 
 epsUadjYuYu = Matmul(epsU,adjYuYu) 
 YdadjepsDepsD = Matmul(Yd,adjepsDepsD) 
 YdadjepsUepsU = Matmul(Yd,adjepsUepsU) 
 YdadjepsUYu = Matmul(Yd,adjepsUYu) 
 YdadjYdepsD = Matmul(Yd,adjYdepsD) 
 YdadjYdYd = Matmul(Yd,adjYdYd) 
 YdadjYuYu = Matmul(Yd,adjYuYu) 
 YeadjYeYe = Matmul(Ye,adjYeYe) 
 YeCepsETpepsE = Matmul(Ye,CepsETpepsE) 
 YeCYhYh = Matmul(Ye,CYhYh) 
 YhadjYeYe = Matmul(Yh,adjYeYe) 
 YhCepsETpepsE = Matmul(Yh,CepsETpepsE) 
 YhCYhepsE = Matmul(Yh,CYhepsE) 
 YhCYhYh = Matmul(Yh,CYhYh) 
 YuadjepsDepsD = Matmul(Yu,adjepsDepsD) 
 YuadjepsDYd = Matmul(Yu,adjepsDYd) 
 YuadjepsUepsU = Matmul(Yu,adjepsUepsU) 
 YuadjYdYd = Matmul(Yu,adjYdYd) 
 YuadjYuepsU = Matmul(Yu,adjYuepsU) 
 YuadjYuYu = Matmul(Yu,adjYuYu) 
 adjepsDepsDadjepsD = Matmul(adjepsD,epsDadjepsD) 
 adjepsDepsDadjYd = Matmul(adjepsD,epsDadjYd) 
 adjepsDYdadjepsD = Matmul(adjepsD,YdadjepsD) 
 adjepsDYdadjYd = Matmul(adjepsD,YdadjYd) 
 adjepsEepsEadjepsE = Matmul(adjepsE,epsEadjepsE) 
 adjepsEYhCYh = Matmul(adjepsE,YhCYh) 
 adjepsETpYeadjepsE = Matmul(adjepsE,TpYeadjepsE) 
 adjepsETpYeCYe = Matmul(adjepsE,TpYeCYe) 
 adjepsUepsUadjepsU = Matmul(adjepsU,epsUadjepsU) 
 adjepsUepsUadjYu = Matmul(adjepsU,epsUadjYu) 
 adjepsUYuadjepsD = Matmul(adjepsU,YuadjepsD) 
 adjepsUYuadjepsU = Matmul(adjepsU,YuadjepsU) 
 adjepsUYuadjYu = Matmul(adjepsU,YuadjYu) 
 adjYdepsDadjepsD = Matmul(adjYd,epsDadjepsD) 
 adjYdepsDadjYd = Matmul(adjYd,epsDadjYd) 
 adjYdYdadjepsD = Matmul(adjYd,YdadjepsD) 
 adjYdYdadjepsU = Matmul(adjYd,YdadjepsU) 
 adjYdYdadjYd = Matmul(adjYd,YdadjYd) 
 adjYeYeadjYe = Matmul(adjYe,YeadjYe) 
 adjYeTpepsEadjYe = Matmul(adjYe,TpepsEadjYe) 
 adjYeTpepsECepsE = Matmul(adjYe,TpepsECepsE) 
 adjYeTpepsECYh = Matmul(adjYe,TpepsECYh) 
 adjYuepsUadjepsU = Matmul(adjYu,epsUadjepsU) 
 adjYuepsUadjYd = Matmul(adjYu,epsUadjYd) 
 adjYuepsUadjYu = Matmul(adjYu,epsUadjYu) 
 adjYuYuadjepsD = Matmul(adjYu,YuadjepsD) 
 adjYuYuadjepsU = Matmul(adjYu,YuadjepsU) 
 adjYuYuadjYu = Matmul(adjYu,YuadjYu) 
 CYhYhadjYe = Matmul(Conjg(Yh),YhadjYe) 
 CYhYhCYh = Matmul(Conjg(Yh),YhCYh) 
 CYhTpYeadjepsE = Matmul(Conjg(Yh),TpYeadjepsE) 
 TpepsEadjYeTpepsE = Matmul(Transpose(epsE),adjYeTpepsE) 
 TpepsECepsEYe = Matmul(Transpose(epsE),CepsEYe) 
 TpepsECepsETpepsE = Matmul(Transpose(epsE),CepsETpepsE) 
 TpYeadjepsETpYe = Matmul(Transpose(Ye),adjepsETpYe) 
 TpYeCYeepsE = Matmul(Transpose(Ye),CYeepsE) 
 TpYeCYeYh = Matmul(Transpose(Ye),CYeYh) 
 TpYeCYeTpYe = Matmul(Transpose(Ye),CYeTpYe) 
 epsDadjepsDepsDadjepsD = Matmul(epsD,adjepsDepsDadjepsD) 
Forall(i2=1:3)  epsDadjepsDepsDadjepsD(i2,i2) =  Real(epsDadjepsDepsDadjepsD(i2,i2),dp) 
 epsDadjepsDepsDadjYd = Matmul(epsD,adjepsDepsDadjYd) 
 epsDadjepsDYdadjepsD = Matmul(epsD,adjepsDYdadjepsD) 
 epsDadjepsDYdadjYd = Matmul(epsD,adjepsDYdadjYd) 
 epsDadjYdepsDadjepsD = Matmul(epsD,adjYdepsDadjepsD) 
 epsDadjYdepsDadjYd = Matmul(epsD,adjYdepsDadjYd) 
 epsDadjYdYdadjepsD = Matmul(epsD,adjYdYdadjepsD) 
Forall(i2=1:3)  epsDadjYdYdadjepsD(i2,i2) =  Real(epsDadjYdYdadjepsD(i2,i2),dp) 
 epsDadjYdYdadjYd = Matmul(epsD,adjYdYdadjYd) 
 epsDadjYuepsUadjYd = Matmul(epsD,adjYuepsUadjYd) 
 epsDadjYuYuadjepsD = Matmul(epsD,adjYuYuadjepsD) 
Forall(i2=1:3)  epsDadjYuYuadjepsD(i2,i2) =  Real(epsDadjYuYuadjepsD(i2,i2),dp) 
 epsEadjepsEepsEadjepsE = Matmul(epsE,adjepsEepsEadjepsE) 
Forall(i2=1:3)  epsEadjepsEepsEadjepsE(i2,i2) =  Real(epsEadjepsEepsEadjepsE(i2,i2),dp) 
 epsEadjepsEYhCYh = Matmul(epsE,adjepsEYhCYh) 
 epsEadjepsETpYeadjepsE = Matmul(epsE,adjepsETpYeadjepsE) 
 epsEadjepsETpYeCYe = Matmul(epsE,adjepsETpYeCYe) 
 epsUadjepsUepsUadjepsU = Matmul(epsU,adjepsUepsUadjepsU) 
Forall(i2=1:3)  epsUadjepsUepsUadjepsU(i2,i2) =  Real(epsUadjepsUepsUadjepsU(i2,i2),dp) 
 epsUadjepsUepsUadjYu = Matmul(epsU,adjepsUepsUadjYu) 
 epsUadjepsUYuadjepsU = Matmul(epsU,adjepsUYuadjepsU) 
 epsUadjepsUYuadjYu = Matmul(epsU,adjepsUYuadjYu) 
 epsUadjYdYdadjepsU = Matmul(epsU,adjYdYdadjepsU) 
Forall(i2=1:3)  epsUadjYdYdadjepsU(i2,i2) =  Real(epsUadjYdYdadjepsU(i2,i2),dp) 
 epsUadjYuepsUadjepsU = Matmul(epsU,adjYuepsUadjepsU) 
 epsUadjYuepsUadjYu = Matmul(epsU,adjYuepsUadjYu) 
 epsUadjYuYuadjepsU = Matmul(epsU,adjYuYuadjepsU) 
Forall(i2=1:3)  epsUadjYuYuadjepsU(i2,i2) =  Real(epsUadjYuYuadjepsU(i2,i2),dp) 
 epsUadjYuYuadjYu = Matmul(epsU,adjYuYuadjYu) 
 YdadjepsDYdadjepsD = Matmul(Yd,adjepsDYdadjepsD) 
 YdadjepsDYdadjYd = Matmul(Yd,adjepsDYdadjYd) 
 YdadjepsUYuadjepsD = Matmul(Yd,adjepsUYuadjepsD) 
 YdadjYdYdadjepsD = Matmul(Yd,adjYdYdadjepsD) 
 YdadjYdYdadjYd = Matmul(Yd,adjYdYdadjYd) 
Forall(i2=1:3)  YdadjYdYdadjYd(i2,i2) =  Real(YdadjYdYdadjYd(i2,i2),dp) 
 YeadjYeYeadjYe = Matmul(Ye,adjYeYeadjYe) 
Forall(i2=1:3)  YeadjYeYeadjYe(i2,i2) =  Real(YeadjYeYeadjYe(i2,i2),dp) 
 YeadjYeTpepsEadjYe = Matmul(Ye,adjYeTpepsEadjYe) 
 YeadjYeTpepsECepsE = Matmul(Ye,adjYeTpepsECepsE) 
 YeCYhYhadjYe = Matmul(Ye,CYhYhadjYe) 
 YhadjYeTpepsECYh = Matmul(Yh,adjYeTpepsECYh) 
 YhCYhYhCYh = Matmul(Yh,CYhYhCYh) 
 YhCYhTpYeadjepsE = Matmul(Yh,CYhTpYeadjepsE) 
 YuadjepsUYuadjepsU = Matmul(Yu,adjepsUYuadjepsU) 
 YuadjepsUYuadjYu = Matmul(Yu,adjepsUYuadjYu) 
 YuadjYuYuadjepsU = Matmul(Yu,adjYuYuadjepsU) 
 YuadjYuYuadjYu = Matmul(Yu,adjYuYuadjYu) 
Forall(i2=1:3)  YuadjYuYuadjYu(i2,i2) =  Real(YuadjYuYuadjYu(i2,i2),dp) 
 adjepsETpYeadjepsETpYe = Matmul(adjepsE,TpYeadjepsETpYe) 
 adjepsETpYeCYeTpYe = Matmul(adjepsE,TpYeCYeTpYe) 
 adjYeTpepsEadjYeTpepsE = Matmul(adjYe,TpepsEadjYeTpepsE) 
 adjYeTpepsECepsETpepsE = Matmul(adjYe,TpepsECepsETpepsE) 
 TrepsDadjepsD = Real(cTrace(epsDadjepsD),dp) 
 TrepsDadjYd = cTrace(epsDadjYd) 
 TrepsEadjepsE = Real(cTrace(epsEadjepsE),dp) 
 TrepsUadjepsU = Real(cTrace(epsUadjepsU),dp) 
 TrepsUadjYu = cTrace(epsUadjYu) 
 TrYdadjepsD = cTrace(YdadjepsD) 
 TrYdadjYd = Real(cTrace(YdadjYd),dp) 
 TrYeadjYe = Real(cTrace(YeadjYe),dp) 
 TrYhCYh = cTrace(YhCYh) 
 TrYuadjepsU = cTrace(YuadjepsU) 
 TrYuadjYu = Real(cTrace(YuadjYu),dp) 
 TradjepsETpYe = cTrace(adjepsETpYe) 
 TradjYeTpepsE = cTrace(adjYeTpepsE) 
 TrepsDadjepsDepsDadjepsD = Real(cTrace(epsDadjepsDepsDadjepsD),dp) 
 TrepsDadjepsDepsDadjYd = cTrace(epsDadjepsDepsDadjYd) 
 TrepsDadjepsDYdadjepsD = cTrace(epsDadjepsDYdadjepsD) 
 TrepsDadjepsDYdadjYd = cTrace(epsDadjepsDYdadjYd) 
 TrepsDadjYdepsDadjepsD = cTrace(epsDadjYdepsDadjepsD) 
 TrepsDadjYdepsDadjYd = cTrace(epsDadjYdepsDadjYd) 
 TrepsDadjYdYdadjepsD = Real(cTrace(epsDadjYdYdadjepsD),dp) 
 TrepsDadjYdYdadjYd = cTrace(epsDadjYdYdadjYd) 
 TrepsDadjYuepsUadjYd = cTrace(epsDadjYuepsUadjYd) 
 TrepsDadjYuYuadjepsD = Real(cTrace(epsDadjYuYuadjepsD),dp) 
 TrepsEadjepsEepsEadjepsE = Real(cTrace(epsEadjepsEepsEadjepsE),dp) 
 TrepsEadjepsEYhCYh = cTrace(epsEadjepsEYhCYh) 
 TrepsEadjepsETpYeadjepsE = cTrace(epsEadjepsETpYeadjepsE) 
 TrepsEadjepsETpYeCYe = cTrace(epsEadjepsETpYeCYe) 
 TrepsUadjepsUepsUadjepsU = Real(cTrace(epsUadjepsUepsUadjepsU),dp) 
 TrepsUadjepsUepsUadjYu = cTrace(epsUadjepsUepsUadjYu) 
 TrepsUadjepsUYuadjepsU = cTrace(epsUadjepsUYuadjepsU) 
 TrepsUadjepsUYuadjYu = cTrace(epsUadjepsUYuadjYu) 
 TrepsUadjYdYdadjepsU = Real(cTrace(epsUadjYdYdadjepsU),dp) 
 TrepsUadjYuepsUadjepsU = cTrace(epsUadjYuepsUadjepsU) 
 TrepsUadjYuepsUadjYu = cTrace(epsUadjYuepsUadjYu) 
 TrepsUadjYuYuadjepsU = Real(cTrace(epsUadjYuYuadjepsU),dp) 
 TrepsUadjYuYuadjYu = cTrace(epsUadjYuYuadjYu) 
 TrYdadjepsDYdadjepsD = cTrace(YdadjepsDYdadjepsD) 
 TrYdadjepsDYdadjYd = cTrace(YdadjepsDYdadjYd) 
 TrYdadjepsUYuadjepsD = cTrace(YdadjepsUYuadjepsD) 
 TrYdadjYdYdadjepsD = cTrace(YdadjYdYdadjepsD) 
 TrYdadjYdYdadjYd = Real(cTrace(YdadjYdYdadjYd),dp) 
 TrYeadjYeYeadjYe = Real(cTrace(YeadjYeYeadjYe),dp) 
 TrYeadjYeTpepsEadjYe = cTrace(YeadjYeTpepsEadjYe) 
 TrYeadjYeTpepsECepsE = cTrace(YeadjYeTpepsECepsE) 
 TrYeCYhYhadjYe = cTrace(YeCYhYhadjYe) 
 TrYhadjYeTpepsECYh = cTrace(YhadjYeTpepsECYh) 
 TrYhCYhYhCYh = cTrace(YhCYhYhCYh) 
 TrYhCYhTpYeadjepsE = cTrace(YhCYhTpYeadjepsE) 
 TrYuadjepsUYuadjepsU = cTrace(YuadjepsUYuadjepsU) 
 TrYuadjepsUYuadjYu = cTrace(YuadjepsUYuadjYu) 
 TrYuadjYuYuadjepsU = cTrace(YuadjYuYuadjepsU) 
 TrYuadjYuYuadjYu = Real(cTrace(YuadjYuYuadjYu),dp) 
 TradjepsETpYeadjepsETpYe = cTrace(adjepsETpYeadjepsETpYe) 
 TradjepsETpYeCYeTpYe = cTrace(adjepsETpYeCYeTpYe) 
 TradjYeTpepsEadjYeTpepsE = cTrace(adjYeTpepsEadjYeTpepsE) 
 TradjYeTpepsECepsETpepsE = cTrace(adjYeTpepsECepsETpepsE) 
 g1p2 =g1**2 
 g1p3 =g1**3 
 g1p4 =g1**4 
 g2p2 =g2**2 
 g2p3 =g2**3 
 g2p4 =g2**4 
 g3p2 =g3**2 
 g3p3 =g3**3 
 lam1p2 =lam1**2 
 lam10p2 =lam10**2 
 lam2p2 =lam2**2 
 lam3p2 =lam3**2 
 lam4p2 =lam4**2 
 lam5p2 =lam5**2 
 lam6p2 =lam6**2 
 lam7p2 =lam7**2 
 lam8p2 =lam8**2 
 lam9p2 =lam9**2 
 lamhp2 =lamh**2 
 mup2 =mu**2 


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! g1 
!-------------------- 
 
betag11  = 22._dp*(g1p3)/5._dp

 
 
If (TwoLoopRGE) Then 
betag12 = 0

 
Dg1 = oo16pi2*( betag11 + oo16pi2 * betag12 ) 

 
Else 
Dg1 = oo16pi2* betag11 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = -3._dp*(g2p3)

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = -7._dp*(g3p3)

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! lam1 
!-------------------- 
 
betalam11  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(lam1p2) + 4._dp*(lam3p2) + 2._dp*(lam4p2) + 2._dp*(lam5p2)            & 
&  + 24._dp*(lam6p2) + 2._dp*(lam8p2) - (9*g1p2*lam1)/5._dp - 9*g2p2*lam1 +              & 
&  4*lam3*lam4 + 2*lam6*TradjepsETpYe + 2*lam6*TradjYeTpepsE + 6*lam6*TrepsDadjYd +      & 
&  6*lam6*TrepsUadjYu + 6*lam6*TrYdadjepsD + 12*lam1*TrYdadjYd - 12._dp*(TrYdadjYdYdadjYd)& 
&  + 4*lam1*TrYeadjYe - 4._dp*(TrYeadjYeYeadjYe) + 6*lam6*TrYuadjepsU + 12*lam1*TrYuadjYu -& 
&  12._dp*(TrYuadjYuYuadjYu)

 
 
If (TwoLoopRGE) Then 
betalam12 = 0

 
Dlam1 = oo16pi2*( betalam11 + oo16pi2 * betalam12 ) 

 
Else 
Dlam1 = oo16pi2* betalam11 
End If 
 
 
Call Chop(Dlam1) 

!-------------------- 
! lam2 
!-------------------- 
 
betalam21  = 27._dp*(g1p4)/100._dp + (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 12._dp*(lam2p2) + 4._dp*(lam3p2) + 2._dp*(lam4p2) + 2._dp*(lam5p2)            & 
&  + 24._dp*(lam7p2) + 2._dp*(lam9p2) - (9*g1p2*lam2)/5._dp - 9*g2p2*lam2 +              & 
&  4*lam3*lam4 + 2*lam7*TradjepsETpYe + 2*lam7*TradjYeTpepsE + 12*lam2*TrepsDadjepsD -   & 
&  12._dp*(TrepsDadjepsDepsDadjepsD) + 6*lam7*TrepsDadjYd + 4*lam2*TrepsEadjepsE -       & 
&  4._dp*(TrepsEadjepsEepsEadjepsE) + 12*lam2*TrepsUadjepsU - 12._dp*(TrepsUadjepsUepsUadjepsU)& 
&  + 6*lam7*TrepsUadjYu + 6*lam7*TrYdadjepsD + 6*lam7*TrYuadjepsU

 
 
If (TwoLoopRGE) Then 
betalam22 = 0

 
Dlam2 = oo16pi2*( betalam21 + oo16pi2 * betalam22 ) 

 
Else 
Dlam2 = oo16pi2* betalam21 
End If 
 
 
Call Chop(Dlam2) 

!-------------------- 
! lam4 
!-------------------- 
 
betalam41  = (9*g1p2*g2p2)/5._dp + 2._dp*(lam10p2) + 4._dp*(lam4p2) + 8._dp*(lam5p2)  & 
&  + 10._dp*(lam6p2) + 10._dp*(lam7p2) - (9*g1p2*lam4)/5._dp - 9*g2p2*lam4 +             & 
&  2*lam1*lam4 + 2*lam2*lam4 + 8*lam3*lam4 + 4*lam6*lam7 + lam6*TradjepsETpYe +          & 
&  lam7*TradjepsETpYe + lam6*TradjYeTpepsE + lam7*TradjYeTpepsE + 6*lam4*TrepsDadjepsD + & 
&  3*(lam6 + lam7)*TrepsDadjYd - 12._dp*(TrepsDadjYdYdadjepsD) - 12._dp*(TrepsDadjYuepsUadjYd)& 
&  + 12._dp*(TrepsDadjYuYuadjepsD) + 2*lam4*TrepsEadjepsE - 4._dp*(TrepsEadjepsETpYeCYe) & 
&  + 6*lam4*TrepsUadjepsU + 12._dp*(TrepsUadjYdYdadjepsU) + 3*lam6*TrepsUadjYu +         & 
&  3*lam7*TrepsUadjYu - 12._dp*(TrepsUadjYuYuadjepsU) + 3*lam6*TrYdadjepsD +             & 
&  3*lam7*TrYdadjepsD - 12._dp*(TrYdadjepsUYuadjepsD) + 6*lam4*TrYdadjYd +               & 
&  2*lam4*TrYeadjYe + 3*lam6*TrYuadjepsU + 3*lam7*TrYuadjepsU + 6*lam4*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam42 = 0

 
Dlam4 = oo16pi2*( betalam41 + oo16pi2 * betalam42 ) 

 
Else 
Dlam4 = oo16pi2* betalam41 
End If 
 
 
Call Chop(Dlam4) 

!-------------------- 
! lam3 
!-------------------- 
 
betalam31  = 27._dp*(g1p4)/100._dp - (9*g1p2*g2p2)/10._dp + 9._dp*(g2p4)              & 
& /4._dp + 4._dp*(lam3p2) + 2._dp*(lam4p2) + 2._dp*(lam5p2) + 4._dp*(lam6p2)             & 
&  + 4._dp*(lam7p2) - (9*g1p2*lam3)/5._dp - 9*g2p2*lam3 + 6*lam1*lam3 + 6*lam2*lam3 +    & 
&  2*lam1*lam4 + 2*lam2*lam4 + 16*lam6*lam7 + 2*lam8*lam9 + lam6*TradjepsETpYe +         & 
&  lam7*TradjepsETpYe + lam6*TradjYeTpepsE + lam7*TradjYeTpepsE + 6*lam3*TrepsDadjepsD - & 
&  12._dp*(TrepsDadjepsDYdadjYd) + 3*(lam6 + lam7)*TrepsDadjYd + 12._dp*(TrepsDadjYuepsUadjYd)& 
&  - 12._dp*(TrepsDadjYuYuadjepsD) + 2*lam3*TrepsEadjepsE + 6*lam3*TrepsUadjepsU -       & 
&  12._dp*(TrepsUadjepsUYuadjYu) - 12._dp*(TrepsUadjYdYdadjepsU) + 3*lam6*TrepsUadjYu +  & 
&  3*lam7*TrepsUadjYu + 3*lam6*TrYdadjepsD + 3*lam7*TrYdadjepsD + 12._dp*(TrYdadjepsUYuadjepsD)& 
&  + 6*lam3*TrYdadjYd + 2*lam3*TrYeadjYe - 4._dp*(TrYeadjYeTpepsECepsE) + 3*lam6*TrYuadjepsU +& 
&  3*lam7*TrYuadjepsU + 6*lam3*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam32 = 0

 
Dlam3 = oo16pi2*( betalam31 + oo16pi2 * betalam32 ) 

 
Else 
Dlam3 = oo16pi2* betalam31 
End If 
 
 
Call Chop(Dlam3) 

!-------------------- 
! lam7 
!-------------------- 
 
betalam71  = (60*lam3*lam6 + 40*lam4*lam6 + 20*lam5*lam6 - 18*g1p2*lam7 -             & 
&  90*g2p2*lam7 + 120*lam2*lam7 + 60*lam3*lam7 + 80*lam4*lam7 + 100*lam5*lam7 +          & 
&  20*lam10*lam9 + 5*lam2*TradjepsETpYe + 5*lam3*TradjepsETpYe + 5*lam4*TradjepsETpYe +  & 
&  5*lam5*TradjepsETpYe + 5*lam2*TradjYeTpepsE + 5*lam3*TradjYeTpepsE + 5*lam4*TradjYeTpepsE +& 
&  5*lam5*TradjYeTpepsE - 20._dp*(TradjYeTpepsECepsETpepsE) + 90*lam7*TrepsDadjepsD -    & 
&  30._dp*(TrepsDadjepsDepsDadjYd) - 60._dp*(TrepsDadjepsDYdadjepsD) + 15*(lam2 +        & 
&  lam3 + lam4 + lam5)*TrepsDadjYd - 30._dp*(TrepsDadjYdepsDadjepsD) + 30*lam7*TrepsEadjepsE -& 
&  20._dp*(TrepsEadjepsETpYeadjepsE) + 90*lam7*TrepsUadjepsU - 30._dp*(TrepsUadjepsUepsUadjYu)& 
&  - 60._dp*(TrepsUadjepsUYuadjepsU) + 15*lam2*TrepsUadjYu + 15*lam3*TrepsUadjYu +       & 
&  15*lam4*TrepsUadjYu + 15*lam5*TrepsUadjYu - 30._dp*(TrepsUadjYuepsUadjepsU)           & 
&  + 15*lam2*TrYdadjepsD + 15*lam3*TrYdadjepsD + 15*lam4*TrYdadjepsD + 15*lam5*TrYdadjepsD +& 
&  30*lam7*TrYdadjYd + 10*lam7*TrYeadjYe + 15*lam2*TrYuadjepsU + 15*lam3*TrYuadjepsU +   & 
&  15*lam4*TrYuadjepsU + 15*lam5*TrYuadjepsU + 30*lam7*TrYuadjYu)/10._dp

 
 
If (TwoLoopRGE) Then 
betalam72 = 0

 
Dlam7 = oo16pi2*( betalam71 + oo16pi2 * betalam72 ) 

 
Else 
Dlam7 = oo16pi2* betalam71 
End If 
 
 
Call Chop(Dlam7) 

!-------------------- 
! lam5 
!-------------------- 
 
betalam51  = 2._dp*(lam10p2) + 10._dp*(lam6p2) + 10._dp*(lam7p2) - (9*g1p2*lam5)      & 
& /5._dp - 9*g2p2*lam5 + 2*lam1*lam5 + 2*lam2*lam5 + 8*lam3*lam5 + 12*lam4*lam5 +        & 
&  4*lam6*lam7 + lam6*TradjepsETpYe + lam7*TradjepsETpYe - 2._dp*(TradjepsETpYeadjepsETpYe)& 
&  + lam6*TradjYeTpepsE + lam7*TradjYeTpepsE - 2._dp*(TradjYeTpepsEadjYeTpepsE)          & 
&  + 6*lam5*TrepsDadjepsD + 3*(lam6 + lam7)*TrepsDadjYd - 6._dp*(TrepsDadjYdepsDadjYd)   & 
&  + 2*lam5*TrepsEadjepsE + 6*lam5*TrepsUadjepsU + 3*lam6*TrepsUadjYu + 3*lam7*TrepsUadjYu -& 
&  6._dp*(TrepsUadjYuepsUadjYu) + 3*lam6*TrYdadjepsD + 3*lam7*TrYdadjepsD -              & 
&  6._dp*(TrYdadjepsDYdadjepsD) + 6*lam5*TrYdadjYd + 2*lam5*TrYeadjYe + 3*lam6*TrYuadjepsU +& 
&  3*lam7*TrYuadjepsU - 6._dp*(TrYuadjepsUYuadjepsU) + 6*lam5*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam52 = 0

 
Dlam5 = oo16pi2*( betalam51 + oo16pi2 * betalam52 ) 

 
Else 
Dlam5 = oo16pi2* betalam51 
End If 
 
 
!-------------------- 
! lam6 
!-------------------- 
 
betalam61  = (-18*g1p2*lam6 - 90*g2p2*lam6 + 120*lam1*lam6 + 60*lam3*lam6 +           & 
&  80*lam4*lam6 + 100*lam5*lam6 + 60*lam3*lam7 + 40*lam4*lam7 + 20*lam5*lam7 +           & 
&  20*lam10*lam8 + 5*lam1*TradjepsETpYe + 5*lam3*TradjepsETpYe + 5*lam4*TradjepsETpYe +  & 
&  5*lam5*TradjepsETpYe - 20._dp*(TradjepsETpYeCYeTpYe) + 5*lam1*TradjYeTpepsE +         & 
&  5*lam3*TradjYeTpepsE + 5*lam4*TradjYeTpepsE + 5*lam5*TradjYeTpepsE + 30*lam6*TrepsDadjepsD +& 
&  15*(lam1 + lam3 + lam4 + lam5)*TrepsDadjYd - 60._dp*(TrepsDadjYdYdadjYd)              & 
&  + 10*lam6*TrepsEadjepsE + 30*lam6*TrepsUadjepsU + 15*lam1*TrepsUadjYu +               & 
&  15*lam3*TrepsUadjYu + 15*lam4*TrepsUadjYu + 15*lam5*TrepsUadjYu - 60._dp*(TrepsUadjYuYuadjYu)& 
&  + 15*lam1*TrYdadjepsD + 15*lam3*TrYdadjepsD + 15*lam4*TrYdadjepsD + 15*lam5*TrYdadjepsD -& 
&  30._dp*(TrYdadjepsDYdadjYd) + 90*lam6*TrYdadjYd - 30._dp*(TrYdadjYdYdadjepsD)         & 
&  + 30*lam6*TrYeadjYe - 20._dp*(TrYeadjYeTpepsEadjYe) + 15*lam1*TrYuadjepsU +           & 
&  15*lam3*TrYuadjepsU + 15*lam4*TrYuadjepsU + 15*lam5*TrYuadjepsU - 30._dp*(TrYuadjepsUYuadjYu)& 
&  + 90*lam6*TrYuadjYu - 30._dp*(TrYuadjYuYuadjepsU))/10._dp

 
 
If (TwoLoopRGE) Then 
betalam62 = 0

 
Dlam6 = oo16pi2*( betalam61 + oo16pi2 * betalam62 ) 

 
Else 
Dlam6 = oo16pi2* betalam61 
End If 
 
 
Call Chop(Dlam6) 

!-------------------- 
! lam9 
!-------------------- 
 
betalam91  = 27._dp*(g1p4)/25._dp + 4._dp*(lam10p2) + 4._dp*(lam9p2) + 12*lam10*lam7 +& 
&  4*lam3*lam8 + 2*lam4*lam8 - (9*g1p2*lam9)/2._dp - (9*g2p2*lam9)/2._dp +               & 
&  6*lam2*lam9 + 8*lam9*lamh + lam10*TradjepsETpYe + lam10*TradjYeTpepsE +               & 
&  6*lam9*TrepsDadjepsD + 3*lam10*TrepsDadjYd + 2*lam9*TrepsEadjepsE + 16._dp*(TrepsEadjepsEYhCYh)& 
&  + 6*lam9*TrepsUadjepsU + 3*lam10*TrepsUadjYu + 3*lam10*TrYdadjepsD - 8*lam9*TrYhCYh + & 
&  3*lam10*TrYuadjepsU

 
 
If (TwoLoopRGE) Then 
betalam92 = 0

 
Dlam9 = oo16pi2*( betalam91 + oo16pi2 * betalam92 ) 

 
Else 
Dlam9 = oo16pi2* betalam91 
End If 
 
 
Call Chop(Dlam9) 

!-------------------- 
! lam8 
!-------------------- 
 
betalam81  = 27._dp*(g1p4)/25._dp + 4._dp*(lam10p2) + 4._dp*(lam8p2) + 12*lam10*lam6 -& 
&  (9*g1p2*lam8)/2._dp - (9*g2p2*lam8)/2._dp + 6*lam1*lam8 + 4*lam3*lam9 +               & 
&  2*lam4*lam9 + 8*lam8*lamh + lam10*TradjepsETpYe + lam10*TradjYeTpepsE +               & 
&  3*lam10*TrepsDadjYd + 3*lam10*TrepsUadjYu + 3*lam10*TrYdadjepsD + 6*lam8*TrYdadjYd +  & 
&  2*lam8*TrYeadjYe + 16._dp*(TrYeCYhYhadjYe) - 8*lam8*TrYhCYh + 3*lam10*TrYuadjepsU +   & 
&  6*lam8*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betalam82 = 0

 
Dlam8 = oo16pi2*( betalam81 + oo16pi2 * betalam82 ) 

 
Else 
Dlam8 = oo16pi2* betalam81 
End If 
 
 
Call Chop(Dlam8) 

!-------------------- 
! lamh 
!-------------------- 
 
betalamh1  = 54._dp*(g1p4)/25._dp + 4._dp*(lam10p2) + 2._dp*(lam8p2) + 2._dp*(lam9p2) & 
&  - (36*g1p2*lamh)/5._dp + 20._dp*(lamhp2) - 16*lamh*TrYhCYh - 32._dp*(TrYhCYhYhCYh)

 
 
If (TwoLoopRGE) Then 
betalamh2 = 0

 
Dlamh = oo16pi2*( betalamh1 + oo16pi2 * betalamh2 ) 

 
Else 
Dlamh = oo16pi2* betalamh1 
End If 
 
 
Call Chop(Dlamh) 

!-------------------- 
! lam10 
!-------------------- 
 
betalam101  = (-9*g1p2*lam10 - 9*g2p2*lam10 + 4*lam10*lam3 + 8*lam10*lam4 +           & 
&  12*lam10*lam5 + 8*lam10*lam8 + 12*lam6*lam8 + 8*lam10*lam9 + 12*lam7*lam9 +           & 
&  16*lam10*lamh + lam8*TradjepsETpYe + lam9*TradjepsETpYe + lam8*TradjYeTpepsE +        & 
&  lam9*TradjYeTpepsE + 6*lam10*TrepsDadjepsD + 3*(lam8 + lam9)*TrepsDadjYd +            & 
&  2*lam10*TrepsEadjepsE + 6*lam10*TrepsUadjepsU + 3*lam8*TrepsUadjYu + 3*lam9*TrepsUadjYu +& 
&  3*lam8*TrYdadjepsD + 3*lam9*TrYdadjepsD + 6*lam10*TrYdadjYd + 2*lam10*TrYeadjYe +     & 
&  16._dp*(TrYhadjYeTpepsECYh) - 16*lam10*TrYhCYh + 16._dp*(TrYhCYhTpYeadjepsE)          & 
&  + 3*lam8*TrYuadjepsU + 3*lam9*TrYuadjepsU + 6*lam10*TrYuadjYu)/2._dp

 
 
If (TwoLoopRGE) Then 
betalam102 = 0

 
Dlam10 = oo16pi2*( betalam101 + oo16pi2 * betalam102 ) 

 
Else 
Dlam10 = oo16pi2* betalam101 
End If 
 
 
Call Chop(Dlam10) 

!-------------------- 
! epsU 
!-------------------- 
 
betaepsU1  = epsU*(-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)          & 
&  + 3._dp*(TrepsDadjepsD) + TrepsEadjepsE + 3._dp*(TrepsUadjepsU)) + (-3._dp*(epsUadjepsDepsD)& 
&  + 3._dp*(epsUadjepsUepsU) + epsUadjYdYd + epsUadjYuYu + 2*TradjepsETpYe*Yu +          & 
&  6*TrepsUadjYu*Yu + 6*TrYdadjepsD*Yu - 4._dp*(YuadjepsDYd) + 2._dp*(YuadjYuepsU))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepsU2 = 0

 
DepsU = oo16pi2*( betaepsU1 + oo16pi2 * betaepsU2 ) 

 
Else 
DepsU = oo16pi2* betaepsU1 
End If 
 
 
Call Chop(DepsU) 

!-------------------- 
! Yu 
!-------------------- 
 
betaYu1  = epsU*(TradjYeTpepsE + 3._dp*(TrepsDadjYd) + 3._dp*(TrYuadjepsU))           & 
&  + (-17._dp*(g1p2)/20._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2) + 3._dp*(TrYdadjYd)      & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Yu + (2._dp*(epsUadjepsUYu) - 4._dp*(epsUadjYdepsD)  & 
&  + YuadjepsDepsD + YuadjepsUepsU - 3._dp*(YuadjYdYd) + 3._dp*(YuadjYuYu))/2._dp

 
 
If (TwoLoopRGE) Then 
betaYu2 = 0

 
DYu = oo16pi2*( betaYu1 + oo16pi2 * betaYu2 ) 

 
Else 
DYu = oo16pi2* betaYu1 
End If 
 
 
Call Chop(DYu) 

!-------------------- 
! epsD 
!-------------------- 
 
betaepsD1  = epsD*(-1._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp - 8._dp*(g3p2)            & 
&  + 3._dp*(TrepsDadjepsD) + TrepsEadjepsE + 3._dp*(TrepsUadjepsU)) + (3._dp*(epsDadjepsDepsD)& 
&  - 3._dp*(epsDadjepsUepsU) + epsDadjYdYd + epsDadjYuYu + 2*TradjYeTpepsE*Yd +          & 
&  6*TrepsDadjYd*Yd + 6*TrYuadjepsU*Yd - 4._dp*(YdadjepsUYu) + 2._dp*(YdadjYdepsD))/2._dp

 
 
If (TwoLoopRGE) Then 
betaepsD2 = 0

 
DepsD = oo16pi2*( betaepsD1 + oo16pi2 * betaepsD2 ) 

 
Else 
DepsD = oo16pi2* betaepsD1 
End If 
 
 
Call Chop(DepsD) 

!-------------------- 
! epsE 
!-------------------- 
 
betaepsE1  = 3._dp*(epsEadjepsEepsE)/2._dp + epsECYeTpYe + TpYeCYeepsE/2._dp +        & 
&  epsE*(-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrepsDadjepsD) +              & 
&  TrepsEadjepsE + 3._dp*(TrepsUadjepsU)) - 2._dp*(YhCYhepsE) + TradjYeTpepsE*Transpose(Ye)& 
&  + 3*TrepsDadjYd*Transpose(Ye) + 3*TrYuadjepsU*Transpose(Ye)

 
 
If (TwoLoopRGE) Then 
betaepsE2 = 0

 
DepsE = oo16pi2*( betaepsE1 + oo16pi2 * betaepsE2 ) 

 
Else 
DepsE = oo16pi2* betaepsE1 
End If 
 
 
Call Chop(DepsE) 

!-------------------- 
! Yd 
!-------------------- 
 
betaYd1  = epsD*(TradjepsETpYe + 3._dp*(TrepsUadjYu) + 3._dp*(TrYdadjepsD))           & 
&  + (-((g1p2 + 9._dp*(g2p2) + 32._dp*(g3p2) - 12._dp*(TrYdadjYd) - 4._dp*(TrYeadjYe)    & 
&  - 12._dp*(TrYuadjYu))*Yd) + 2*(2._dp*(epsDadjepsDYd) - 4._dp*(epsDadjYuepsU)          & 
&  + YdadjepsDepsD + YdadjepsUepsU + 3._dp*(YdadjYdYd) - 3._dp*(YdadjYuYu)))/4._dp

 
 
If (TwoLoopRGE) Then 
betaYd2 = 0

 
DYd = oo16pi2*( betaYd1 + oo16pi2 * betaYd2 ) 

 
Else 
DYd = oo16pi2* betaYd1 
End If 
 
 
Call Chop(DYd) 

!-------------------- 
! Ye 
!-------------------- 
 
betaYe1  = (-9._dp*(g1p2)/4._dp - 9._dp*(g2p2)/4._dp + 3._dp*(TrYdadjYd)              & 
&  + TrYeadjYe + 3._dp*(TrYuadjYu))*Ye + (2._dp*(TpepsECepsEYe) + 3._dp*(YeadjYeYe)      & 
&  + YeCepsETpepsE - 4._dp*(YeCYhYh))/2._dp + (TradjepsETpYe + 3._dp*(TrepsUadjYu)       & 
&  + 3._dp*(TrYdadjepsD))*Transpose(epsE)

 
 
If (TwoLoopRGE) Then 
betaYe2 = 0

 
DYe = oo16pi2*( betaYe1 + oo16pi2 * betaYe2 ) 

 
Else 
DYe = oo16pi2* betaYe1 
End If 
 
 
Call Chop(DYe) 

!-------------------- 
! Yh 
!-------------------- 
 
betaYh1  = (-((9*(g1p2 + 5._dp*(g2p2)) + 40._dp*(TrYhCYh))*Yh) + 5*(epsEadjepsEYh +   & 
&  TpYeCYeYh + YhadjYeYe + YhCepsETpepsE - 8._dp*(YhCYhYh)))/10._dp

 
 
If (TwoLoopRGE) Then 
betaYh2 = 0

 
DYh = oo16pi2*( betaYh1 + oo16pi2 * betaYh2 ) 

 
Else 
DYh = oo16pi2* betaYh1 
End If 
 
 
Call Chop(DYh) 

!-------------------- 
! mu 
!-------------------- 
 
betamu1  = (-27*g1p2*mu)/10._dp - (9*g2p2*mu)/2._dp + 2*lam3*mu - 2*lam4*mu +         & 
&  2*lam8*mu + 2*lam9*mu + 3*mu*TrepsDadjepsD + mu*TrepsEadjepsE + 3*mu*TrepsUadjepsU +  & 
&  3*mu*TrYdadjYd + mu*TrYeadjYe - 4*mu*TrYhCYh + 3*mu*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betamu2 = 0

 
Dmu = oo16pi2*( betamu1 + oo16pi2 * betamu2 ) 

 
Else 
Dmu = oo16pi2* betamu1 
End If 
 
 
Call Chop(Dmu) 

!-------------------- 
! mH2 
!-------------------- 
 
betamH21  = -12*lam6*m12 + 4*lam3*mEt2 + 2*lam4*mEt2 + 2*lam8*mh - (9*g1p2*mH2)       & 
& /10._dp - (9*g2p2*mH2)/2._dp + 6*lam1*mH2 + 2._dp*(mup2) - 2*m12*TradjepsETpYe -       & 
&  6*m12*TrYdadjepsD + 6*mH2*TrYdadjYd + 2*mH2*TrYeadjYe - 6*m12*TrYuadjepsU +           & 
&  6*mH2*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betamH22 = 0

 
DmH2 = oo16pi2*( betamH21 + oo16pi2 * betamH22 ) 

 
Else 
DmH2 = oo16pi2* betamH21 
End If 
 
 
Call Chop(DmH2) 

!-------------------- 
! mEt2 
!-------------------- 
 
betamEt21  = -12*lam7*m12 - (9*g1p2*mEt2)/10._dp - (9*g2p2*mEt2)/2._dp +              & 
&  6*lam2*mEt2 + 2*lam9*mh + 4*lam3*mH2 + 2*lam4*mH2 + 2._dp*(mup2) - 2*m12*TradjYeTpepsE +& 
&  6*mEt2*TrepsDadjepsD - 6*m12*TrepsDadjYd + 2*mEt2*TrepsEadjepsE + 6*mEt2*TrepsUadjepsU -& 
&  6*m12*TrepsUadjYu

 
 
If (TwoLoopRGE) Then 
betamEt22 = 0

 
DmEt2 = oo16pi2*( betamEt21 + oo16pi2 * betamEt22 ) 

 
Else 
DmEt2 = oo16pi2* betamEt21 
End If 
 
 
Call Chop(DmEt2) 

!-------------------- 
! m12 
!-------------------- 
 
betam121  = (-9*g1p2*m12)/10._dp - (9*g2p2*m12)/2._dp + 2*lam3*m12 + 4*lam4*m12 +     & 
&  6*lam5*m12 - 6*lam7*mEt2 - 2*lam10*mh - 6*lam6*mH2 - mEt2*TradjepsETpYe -             & 
&  mH2*TradjYeTpepsE + 3*m12*TrepsDadjepsD - 3*mH2*TrepsDadjYd + m12*TrepsEadjepsE +     & 
&  3*m12*TrepsUadjepsU - 3*mH2*TrepsUadjYu - 3*mEt2*TrYdadjepsD + 3*m12*TrYdadjYd +      & 
&  m12*TrYeadjYe - 3*mEt2*TrYuadjepsU + 3*m12*TrYuadjYu

 
 
If (TwoLoopRGE) Then 
betam122 = 0

 
Dm12 = oo16pi2*( betam121 + oo16pi2 * betam122 ) 

 
Else 
Dm12 = oo16pi2* betam121 
End If 
 
 
Call Chop(Dm12) 

!-------------------- 
! mh 
!-------------------- 
 
betamh1  = -8*lam10*m12 + 4*lam9*mEt2 - (18*g1p2*mh)/5._dp + 8*lamh*mh +              & 
&  4*lam8*mH2 + 4._dp*(mup2) - 8*mh*TrYhCYh

 
 
If (TwoLoopRGE) Then 
betamh2 = 0

 
Dmh = oo16pi2*( betamh1 + oo16pi2 * betamh2 ) 

 
Else 
Dmh = oo16pi2* betamh1 
End If 
 
 
Call Chop(Dmh) 

!-------------------- 
! v 
!-------------------- 
 
betav1  = (9*g1p2*v + 45*g2p2*v - 60*TrYdadjYd*v - 20*TrYeadjYe*v - 60*TrYuadjYu*v -  & 
&  10*TradjepsETpYe*vv - 10*TradjYeTpepsE*vv - 30*TrepsDadjYd*vv - 30*TrepsUadjYu*vv -   & 
&  30*TrYdadjepsD*vv - 30*TrYuadjepsU*vv + 3*g1p2*v*Xi + 15*g2p2*v*Xi)/20._dp

 
 
If (TwoLoopRGE) Then 
betav2 = 0

 
Dv = oo16pi2*( betav1 + oo16pi2 * betav2 ) 

 
Else 
Dv = oo16pi2* betav1 
End If 
 
 
!-------------------- 
! vv 
!-------------------- 
 
betavv1  = (-10*TradjepsETpYe*v - 10*TradjYeTpepsE*v - 30*TrepsDadjYd*v -             & 
&  30*TrepsUadjYu*v - 30*TrYdadjepsD*v - 30*TrYuadjepsU*v + 9*g1p2*vv + 45*g2p2*vv -     & 
&  60*TrepsDadjepsD*vv - 20*TrepsEadjepsE*vv - 60*TrepsUadjepsU*vv + 3*g1p2*vv*Xi +      & 
&  15*g2p2*vv*Xi)/20._dp

 
 
If (TwoLoopRGE) Then 
betavv2 = 0

 
Dvv = oo16pi2*( betavv1 + oo16pi2 * betavv2 ) 

 
Else 
Dvv = oo16pi2* betavv1 
End If 
 
 
Call ParametersToG162(Dg1,Dg2,Dg3,Dlam1,Dlam2,Dlam4,Dlam3,Dlam7,Dlam5,Dlam6,          & 
& Dlam9,Dlam8,Dlamh,Dlam10,DepsU,DYu,DepsD,DepsE,DYd,DYe,DYh,Dmu,DmH2,DmEt2,             & 
& Dm12,Dmh,Dv,Dvv,f)

Iname = Iname - 1 
 
End Subroutine rge162  

End Module RGEs_radinuZeeHB 
 
