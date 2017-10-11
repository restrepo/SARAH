Module Pole2L_radinuZeeHB 
 
Use Control 
Use Settings 
Use Couplings_radinuZeeHB 
Use AddLoopFunctions 
Use LoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_radinuZeeHB 
Use StandardModel 
Use TreeLevelMasses_radinuZeeHB 
Use Pole2LFunctions
Contains 
 
Subroutine CalculatePi2S(p2,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,              & 
& lam6,lam9,lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,               & 
& kont,tad2L,Pi2S,Pi2P)

Implicit None 
Real(dp),Intent(in) :: g1,g2,g3,lam5

Complex(dp),Intent(in) :: lam1,lam2,lam4,lam3,lam7,lam6,lam9,lam8,lamh,lam10,epsU(3,3),Yu(3,3),epsD(3,3),       & 
& epsE(3,3),Yd(3,3),Ye(3,3),Yh(3,3),mu,mH2,mEt2,m12,mh

Real(dp),Intent(in) :: v,vv

Real(dp) :: MAh,MAh2,MetI,MetI2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(3),              & 
& MFv2(3),Mhh(2),Mhh2(2),MHm(3),MHm2(3),MVWp,MVWp2,MVZ,MVZ2,TW,ZH(2,2),ZP(3,3),          & 
& ZZ(2,2),alphaH

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),UV(3,3),ZW(2,2)

Complex(dp) :: cplAhAhAh,cplAhAhetI,cplAhAhhh(2),cplAhetIetI,cplAhetIhh(2),cplAhhhhh(2,2),           & 
& cplAhHmcHm(3,3),cpletIetIetI,cpletIetIhh(2),cpletIhhhh(2,2),cpletIHmcHm(3,3),          & 
& cplhhhhhh(2,2,2),cplhhHmcHm(2,3,3),cplVGVGVG,cplcFdFdAhL(3,3),cplcFdFdAhR(3,3),        & 
& cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFuFuAhL(3,3),cplcFuFuAhR(3,3),cplcFdFdetIL(3,3), & 
& cplcFdFdetIR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),cplcFuFuetIL(3,3),               & 
& cplcFuFuetIR(3,3),cplcFdFdhhL(3,3,2),cplcFdFdhhR(3,3,2),cplcFuFdHmL(3,3,3),            & 
& cplcFuFdHmR(3,3,3),cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplcFeFehhL(3,3,2),             & 
& cplcFeFehhR(3,3,2),cplcFuFuhhL(3,3,2),cplcFuFuhhR(3,3,2),cplcFdFucHmL(3,3,3),          & 
& cplcFdFucHmR(3,3,3),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),cplcFdFdVGL(3,3),          & 
& cplcFdFdVGR(3,3),cplcFuFuVGL(3,3),cplcFuFuVGR(3,3)

Complex(dp) :: cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh(2),cplAhAhetIetI,cplAhAhetIhh(2),cplAhAhhhhh(2,2),& 
& cplAhAhHmcHm(3,3),cplAhetIetIetI,cplAhetIetIhh(2),cplAhetIhhhh(2,2),cplAhetIHmcHm(3,3),& 
& cplAhhhhhhh(2,2,2),cplAhhhHmcHm(2,3,3),cpletIetIetIetI,cpletIetIetIhh(2),              & 
& cpletIetIhhhh(2,2),cpletIetIHmcHm(3,3),cpletIhhhhhh(2,2,2),cpletIhhHmcHm(2,3,3),       & 
& cplhhhhhhhh(2,2,2,2),cplhhhhHmcHm(2,2,3,3),cplHmHmcHmcHm(3,3,3,3)

Real(dp), Intent(in) :: p2
Integer, Intent(inout):: kont
Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 
Real(dp) :: Qscale,prefactor,funcvalue
complex(dp) :: cplxprefactor,A0m
Real(dp)  :: temptad(2)
Real(dp)  :: tempcont(2,2)
Real(dp)  :: tempcontah(1,1)
Real(dp)  :: runningval(2,2)
Real(dp), Intent(out) :: tad2l(2)
Real(dp), Intent(out) :: Pi2S(2,2)
Real(dp), Intent(out) :: Pi2P(1,1)
complex(dp) :: coup1,coup2,coup3,coup4
complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r
real(dp) :: epsFmass
real(dp) :: epscouplings
Real(dp)  :: tempcouplingvector(2)
Real(dp)  :: tempcouplingmatrix(2,2)
Real(dp)  :: tempcouplingmatrixah(1,1)
logical :: nonzerocoupling
real(dp) :: delta2Ltadpoles(2)
real(dp)  :: delta2Lmasses(2,2)
real(dp)  :: delta2Lmassesah(1,1)
Real(dp)  :: tad1LG(2)


tad2l(:)=0
Pi2S(:,:)=0
Pi2P(:,:)=0
Qscale=getrenormalizationscale()
epsfmass=0._dp
epscouplings=1.0E-6_dp
Call TreeMassesEffPot(MAh,MAh2,MetI,MetI2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHm,MHm2,MVWp,MVWp2,MVZ,MVZ2,TW,ZDR,ZER,ZUR,ZDL,ZEL,ZUL,UV,              & 
& ZH,ZP,ZW,ZZ,alphaH,v,vv,g1,g2,g3,lam1,lam2,lam4,lam3,lam7,lam5,lam6,lam9,              & 
& lam8,lamh,lam10,epsU,Yu,epsD,epsE,Yd,Ye,Yh,mu,mH2,mEt2,m12,mh,.True.,kont)

If (Abs(MAh2/Qscale).lt.TwoLoopRegulatorMass) MAh2=Qscale*TwoLoopRegulatorMass
If (Abs(MetI2/Qscale).lt.TwoLoopRegulatorMass) MetI2=Qscale*TwoLoopRegulatorMass
Where (Abs(Mhh2/Qscale).lt.TwoLoopRegulatorMass )Mhh2=Qscale*TwoLoopRegulatorMass
Where (Abs(MHm2/Qscale).lt.TwoLoopRegulatorMass )MHm2=Qscale*TwoLoopRegulatorMass
Call CouplingsFor2LPole3(lam6,vv,v,lam1,lam4,lam3,lam5,ZH,lam7,mu,lam10,              & 
& ZP,lam2,lam9,lam8,g3,Yd,ZDL,ZDR,Ye,ZEL,ZER,Yu,ZUL,ZUR,epsD,epsE,epsU,Yh,               & 
& UV,cplAhAhAh,cplAhAhetI,cplAhAhhh,cplAhetIetI,cplAhetIhh,cplAhhhhh,cplAhHmcHm,         & 
& cpletIetIetI,cpletIetIhh,cpletIhhhh,cpletIHmcHm,cplhhhhhh,cplhhHmcHm,cplVGVGVG,        & 
& cplcFdFdAhL,cplcFdFdAhR,cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,               & 
& cplcFdFdetIL,cplcFdFdetIR,cplcFeFeetIL,cplcFeFeetIR,cplcFuFuetIL,cplcFuFuetIR,         & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFuFdHmL,cplcFuFdHmR,cplFvFeHmL,cplFvFeHmR,cplcFeFehhL,     & 
& cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,cplcFdFucHmL,cplcFdFucHmR,cplcFeFvcHmL,            & 
& cplcFeFvcHmR,cplcFdFdVGL,cplcFdFdVGR,cplcFuFuVGL,cplcFuFuVGR)

Call CouplingsFor2LPole4(lam1,lam6,ZH,lam4,lam3,lam5,lam8,ZP,lam7,lam10,              & 
& lam2,lam9,lamh,cplAhAhAhAh,cplAhAhAhetI,cplAhAhAhhh,cplAhAhetIetI,cplAhAhetIhh,        & 
& cplAhAhhhhh,cplAhAhHmcHm,cplAhetIetIetI,cplAhetIetIhh,cplAhetIhhhh,cplAhetIHmcHm,      & 
& cplAhhhhhhh,cplAhhhHmcHm,cpletIetIetIetI,cpletIetIetIhh,cpletIetIhhhh,cpletIetIHmcHm,  & 
& cpletIhhhhhh,cpletIhhHmcHm,cplhhhhhhhh,cplhhhhHmcHm,cplHmHmcHmcHm)

! ----------------------------------
! ------- 1L GAUGELESS TADPOLE DIAGRAMS --------
! ----------------------------------
delta2Ltadpoles(:)=0._dp
delta2Lmasses(:,:)=0._dp
delta2LmassesAh(:,:)=0._dp
tad1LG(:)=0._dp
if(include1l2lshift) then
temptad(:) = 0._dp 
A0m = 1._dp/2._dp*(-J0(MAh2,qscale)) 
  Do gE1 = 1, 2
coup1 = cplAhAhhh(gE1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
A0m = 1._dp/2._dp*(-J0(MetI2,qscale)) 
  Do gE1 = 1, 2
coup1 = cpletIetIhh(gE1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFd2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFdFdhhL(i1,i1,gE1)
coup1R = cplcFdFdhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFd(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 1._dp*(-J0(MFe2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFeFehhL(i1,i1,gE1)
coup1R = cplcFeFehhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFe(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 3._dp*(-J0(MFu2(i1),qscale)) 
  Do gE1 = 1, 2
coup1L = cplcFuFuhhL(i1,i1,gE1)
coup1R = cplcFuFuhhR(i1,i1,gE1)
  temptad(gE1)  = temptad(gE1)+ 2._dp*MFu(i1)*real((coup1L+coup1R)*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 2
A0m = 1._dp/2._dp*(-J0(Mhh2(i1),qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhhhhh(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

  Do i1 = 1, 3
A0m = 1._dp*(-J0(MHm2(i1),qscale)) 
  Do gE1 = 1, 2
coup1 = cplhhHmcHm(gE1,i1,i1)
   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) 
  End Do 
  End do 

tad1LG=matmul(temptad*oo16Pi2,ZH)
! ----------------------------
! ----------------------------------
! ------- 1L2L SHIFTS --------
! ----------------------------------
delta2Ltadpoles=delta2Ltadpoles*oo16Pi2
delta2Lmasses=delta2Lmasses*oo16Pi2
delta2LmassesAh=delta2LmassesAh*oo16Pi2
! ----------------------------
end if ! include1l2lshift
! ----------------------------------
! ------- TADPOLE DIAGRAMS --------
! ----------------------------------
temptad(:)=0._dp
tempcouplingvector(:)=0._dp
! ----------------------------
! ---- Final tadpole result --
temptad=(temptad*oo16Pi2*oo16Pi2)+delta2ltadpoles
tad2L=matmul(temptad,ZH)
! ----------------------------

! ------------------------------------
! ------- CP EVEN MASS DIAGRAMS ------
! ------------------------------------
tempcont(:,:)=0._dp
tempcouplingmatrix(:,:)=0._dp
do gE1=1,2
Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2
do gE2=1,gE1-1
Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2
Pi2S(gE2,gE1)=Pi2S(gE1,gE2)
End do
End do
Pi2S=Pi2S+delta2lmasses
Pi2S = Matmul(Pi2S,ZH)
Pi2S = Matmul(Transpose(ZH),Pi2S)

! -----------------------------------
! ------- CP ODD MASS DIAGRAMS ------
! -----------------------------------
tempcontah(:,:)=0._dp
tempcouplingmatrixah(:,:)=0._dp
Pi2P(1,1)=tempcontah(1,1)*oo16Pi2*oo16Pi2+delta2lmassesah(1,1)
End Subroutine CalculatePi2S
End Module Pole2L_radinuZeeHB 
 
