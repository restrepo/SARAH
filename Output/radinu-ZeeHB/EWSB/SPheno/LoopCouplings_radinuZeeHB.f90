! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.12.2 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 23:00 on 10.10.2017   
! ----------------------------------------------------------------------  
 
 
Module LoopCouplings_radinuZeeHB 
 
Use Control 
Use Settings 
Use Couplings_radinuZeeHB 
Use Mathematics 
Use LoopFunctions 
Use StandardModel 
 
 Contains 
 
Real(dp) Function Alpha_MSbar(Q,mW,mt) 
Implicit None 
Real(dp),Intent(in)::Q,mW 
Real(dp),Intent(in),Optional::mt 
Real(dp)::DeltaAlpha 
If (MZ_input) Then 
Alpha_MSbar=Alpha_mZ_MS 
If (Present(mt)) Then 
DeltaAlpha=-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha_MSbar/(1._dp+DeltaAlpha*alpha) 
End If 
Else 
DeltaAlpha=3.5_dp*Log(Q/mW)/Pi+0.5_dp*oo3pi 
If (Present(mt)) DeltaAlpha=DeltaAlpha-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha/(1._dp-Delta_Alpha_Lepton-Delta_Alpha_Hadron& 
&+DeltaAlpha*alpha) 
Alpha_MZ_MS=Alpha_MSbar 
End If 
End Function Alpha_MSbar
 
 
Real(dp) Function AlphaEwDR(Q,MVWp,MHm,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::Q,MVWp,MHm(3),MFd(3),MFu(3),MFe(3)
Integer::i1 
Real(dp)::DeltaAlpha 
If (MZ_input) then 
DeltaAlpha=1._dp-Alpha/Alpha_MZ_MS! MSbar value^=mW+light fermions 
DeltaAlpha=DeltaAlpha+alpha/(6._dp*Pi)*(1._dp-rMS)! conversion to DRbar if necessary 
If (MVWp.gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MVWp/ Q)*Alpha/(2._dp*pi) 
End if 
Do i1=2,3
If (MHm(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MHm(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/9._dp*Log(MFd(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-16._dp/9._dp*Log(MFu(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/3._dp*Log(MFe(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Else 
DeltaAlpha=7._dp*Log(Q/mW)
If (MVWp.gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWp/ Q)
End if 
Do i1=2,3
If (MHm(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHm(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MFd(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+16._dp/9._dp*Log(MFu(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MFe(i1)/ Q) 
End if 
End Do 
DeltaAlpha=Delta_Alpha_Lepton+Delta_Alpha_Hadron& 
    &-alpha*DeltaAlpha/(2._dp*Pi) 
End If 
 
AlphaEwDR=Alpha/(1._dp-DeltaAlpha) 
 
End Function AlphaEwDR 
 
 
Real(dp) Function AlphaSDR(Q,MFd,MFu) 
Real(dp),Intent(in)::Q,MFd(3),MFu(3) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha = 0._dp 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha = 0.5_dp 
End if 
Do i1=1,3
 If (Abs(MFd(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
 End If 
End Do 
Do i1=1,3
 If (Abs(MFu(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
 End If 
End Do 
DeltaAlpha=AlphaS_mZ*DeltaAlpha/(2._dp*Pi) 
AlphaSDR=AlphaS_mZ/(1._dp-DeltaAlpha)
 
End Function AlphaSDR 
Real(dp) Function AlphaEW_T(AlphaEW_In, Q,MVWp,MHm,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::AlphaEW_In, Q,MVWp,MHm(3),MFd(3),MFu(3),MFe(3)
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=1._dp/(6._dp)*(1._dp-rMS)! conversion to DRbar if necessary 
Do i1=2,3
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHm(i1)/ Q) 
End Do 
DeltaAlpha=-AlphaEW_in*DeltaAlpha/(2._dp*Pi) 
AlphaEW_T=AlphaEW_in/(1._dp-DeltaAlpha) 
 
End Function AlphaEW_T 
 
 
Real(dp) Function AlphaS_T(AlphaS_In, Q,MFd,MFu) 
Real(dp),Intent(in):: AlphaS_In, Q,MFd(3),MFu(3) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=0._dp 
!Conversion to DR bar if necessary 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha=0.5_dp 
End if
Do i1=4,3
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
End Do 
Do i1=4,3
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
End Do 
DeltaAlpha=AlphaS_In*DeltaAlpha/(2._dp*Pi) 
   AlphaS_T=AlphaS_In/(1._dp-DeltaAlpha)
 
End Function AlphaS_T



Subroutine DeltaVB(sinW2,sinW2_dr,rho,MAh,MetI,MFe,MFv,Mhh,MHm,MVWp,epsE,             & 
& g2,ZER,v,ZEL,vv,UVinput,Ye,Yh,ZH,ZP,res)

Implicit None 
Real(dp),Intent(in) :: MAh,MetI,MFe(3),MFv(3),Mhh(2),MHm(3),MVWp,g2,v,vv,ZH(2,2),ZP(3,3)

Complex(dp),Intent(in) :: epsE(3,3),ZER(3,3),ZEL(3,3),UVinput(3,3),Ye(3,3),Yh(3,3)

Real(dp) :: MAh2,MetI2,MFe2(3),MFv2(3),Mhh2(2),MHm2(3),MVWp2

Complex(dp) :: cplAhHmVWp(3),cplcFeFeAhL(3,3),cplcFeFeAhR(3,3),cplcFeFeetIL(3,3),cplcFeFeetIR(3,3),  & 
& cplcFeFehhL(3,3,2),cplcFeFehhR(3,3,2),cplcFeFvcHmL(3,3,3),cplcFeFvcHmR(3,3,3),         & 
& cplcFeFvVWpL(3,3),cplcFeFvVWpR(3,3),cpletIHmVWp(3),cplFvFecVWpL(3,3),cplFvFecVWpR(3,3),& 
& cplFvFeHmL(3,3,3),cplFvFeHmR(3,3,3),cplhhcVWpVWp(2),cplhhHmVWp(2,3)

Complex(dp) :: UV(3,3) 
Integer :: i1,i2,i3,i4,gt1,gt2,gt3,gt4 
Real(dp), Intent(in) :: sinW2,sinW2_Dr, rho 
Real(dp), Intent(out) :: res 
 
Complex(dp) :: sumI, coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,coup3, coup4L,coup4R, teil 
Complex(dp) :: D27m2, D0m2, vertex, phase 
Real(dp) :: cosW2, cosW2_Dr, chargefactor 
Iname = Iname+1
NameOfUnit(Iname) = "DeltaVB" 
MAh2 = MAh**2 
MetI2 = MetI**2 
MFe2 = MFe**2 
MFv2 = MFv**2 
Mhh2 = Mhh**2 
MHm2 = MHm**2 
MVWp2 = MVWp**2 

 
 ! Fix neutrino phases 
 
Do i1=1,3
  phase=(1._dp,0._dp) 
  If (Abs(UVinput(i1,i1)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,i1))/Abs(UVinput(i1,i1)) 
     Else If (Abs(UVinput(i1,1)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,1))/Abs(UVinput(i1,1)) 
     Else If (Abs(UVinput(i1,2)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,2))/Abs(UVinput(i1,2)) 
     Else If (Abs(UVinput(i1,3)).Ne.0._dp) Then 
     phase=Conjg(UVinput(i1,3))/Abs(UVinput(i1,3)) 
  End If 
 UV(i1,:) = UVinput(i1,:)*phase 
End Do 
 
cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeAhT(gt1,gt2,Ye,ZEL,ZER,cplcFeFeAhL(gt1,gt2),cplcFeFeAhR(gt1,gt2))

 End Do 
End Do 


cplAhHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingAhHmVWpT(gt2,g2,ZP,cplAhHmVWp(gt2))

End Do 


cplcFeFeetIL = 0._dp 
cplcFeFeetIR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeetIT(gt1,gt2,epsE,ZEL,ZER,cplcFeFeetIL(gt1,gt2),cplcFeFeetIR(gt1,gt2))

 End Do 
End Do 


cpletIHmVWp = 0._dp 
Do gt2 = 1, 3
Call CouplingetIHmVWpT(gt2,g2,ZP,cpletIHmVWp(gt2))

End Do 


cplFvFeHmL = 0._dp 
cplFvFeHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingFvFeHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplFvFeHmL(gt1,gt2,gt3)     & 
& ,cplFvFeHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecVWpL = 0._dp 
cplFvFecVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingFvFecVWpT(gt1,gt2,g2,UV,ZEL,cplFvFecVWpL(gt1,gt2),cplFvFecVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 2
Call CouplingcFeFehhT(gt1,gt2,gt3,epsE,Ye,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)         & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvVWpL = 0._dp 
cplcFeFvVWpR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFvVWpT(gt1,gt2,g2,UV,ZEL,cplcFeFvVWpL(gt1,gt2),cplcFeFvVWpR(gt1,gt2))

 End Do 
End Do 


cplcFeFvcHmL = 0._dp 
cplcFeFvcHmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 3
Call CouplingcFeFvcHmT(gt1,gt2,gt3,epsE,Ye,Yh,ZP,UV,ZEL,ZER,cplcFeFvcHmL(gt1,gt2,gt3) & 
& ,cplcFeFvcHmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHmVWp = 0._dp 
Do gt1 = 1, 2
 Do gt2 = 1, 3
Call CouplinghhHmVWpT(gt1,gt2,g2,ZH,ZP,cplhhHmVWp(gt1,gt2))

 End Do 
End Do 


cplhhcVWpVWp = 0._dp 
Do gt1 = 1, 2
Call CouplinghhcVWpVWpT(gt1,g2,v,vv,ZH,cplhhcVWpVWp(gt1))

End Do 


!-------------------------- 
!SM Contributions 
!-------------------------- 
cosW2 = 1._dp - sinW2 
cosW2_DR = 1._dp - sinW2_DR 
sumI = 6._dp & 
  & + Log(cosW2)*(3.5_dp - 2.5_dp *sinW2   & 
  & - sinW2_DR*(5._dp - 1.5_dp*cosW2/cosW2_DR))/sinW2   
res = sumI*g2**2*rho 
 
 
If (IncludeBSMdeltaVB) Then 
!-------------------------- 
!BSM  Contributions 
!-------------------------- 
teil = 0._dp 
 
Do gt1=1,3 
 Do gt2=1,3 
sumI = 0._dp 
 
If (mf_l2(2).gt. 0.5_dp*MFv2(gt2)) Then 
chargefactor = 1 
Do i1=1,3
  Do i2=1,3
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(gt1,i1,i2)
coup1R = cplFvFeHmR(gt1,i1,i2)
coup2R = Conjg(cplFvFeHmL(gt2,i1,i2))
coup2L = Conjg(cplFvFeHmR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i1),MHm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,3
  Do i2=1,3
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2R = Conjg(cplcFeFvcHmL(i1,gt2,i2))
coup2L = Conjg(cplcFeFvcHmR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i1),MHm2(i2))  
End if 
   End Do
  End Do




res = res + sumI*(UV(gt2,1)+UV(gt2,2)) 
End if 
End Do 
 
End Do 
 
Do gt1=1,2 
Do  gt2=1,3 
sumI = 0._dp 
 
chargefactor = 1 
  Do i2=1,3
If ((MAh2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeAhL(i2,gt1)
coup1R = cplcFeFeAhR(i2,gt1)
coup2R = Conjg(cplcFeFeAhL(i2,gt2))
coup2L = Conjg(cplcFeFeAhR(i2,gt2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MAh2)  
End if 
  End Do




chargefactor = 1 
  Do i2=1,3
If ((MetI2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeetIL(i2,gt1)
coup1R = cplcFeFeetIR(i2,gt1)
coup2R = Conjg(cplcFeFeetIL(i2,gt2))
coup2L = Conjg(cplcFeFeetIR(i2,gt2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MetI2)  
End if 
  End Do




chargefactor = 1 
Do i1=1,3
  Do i2=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(i1,gt1,i2)
coup1R = cplFvFeHmR(i1,gt1,i2)
coup2R = Conjg(cplFvFeHmL(i1,gt2,i2))
coup2L = Conjg(cplFvFeHmR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),MHm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,2
  Do i2=1,3
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFehhL(i2,gt1,i1)
coup1R = cplcFeFehhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFehhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFehhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),Mhh2(i1))  
End if 
   End Do
  End Do




res = res + sumI 
End Do 
 
End Do 
 
vertex = 0._dp 
 
Do gt1=1,3 
 Do gt2=1,2 
chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
   Do i3= 1,3
  If ((MHm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(gt1,i2,i1)
coup1R = cplFvFeHmR(gt1,i2,i1)
coup2L = cplcFeFvcHmL(gt2,i3,i1)
coup2R = cplcFeFvcHmR(gt2,i3,i1)
coup3L = cplcFeFvVWpL(i2,i3)
coup3R = cplcFeFvVWpR(i2,i3)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFe(i2)*MFv(i3)& 
& *C0_3m(MHm2(i1),MFe2(i2),MFv2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFe2(i2),MFv2(i3))-0.5_dp +MHm2(i1)*C0_3m(MHm2(i1),MFe2(i2),MFv2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2)).Or.(MAh2.gt.mf_l2(2))) Then
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplcFeFeAhL(gt2,i1)
coup2R = cplcFeFeAhR(gt2,i1)
coup3 = -cplAhHmVWp(i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHm2(i2),MAh2) + B0(0._dp,MHm2(i2),MAh2) +0.5_dp)) 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2)).Or.(MetI2.gt.mf_l2(2))) Then
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplcFeFeetIL(gt2,i1)
coup2R = cplcFeFeetIR(gt2,i1)
coup3 = -cpletIHmVWp(i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHm2(i2),MetI2) + B0(0._dp,MHm2(i2),MetI2) +0.5_dp)) 
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,3
   Do i3= 1,2
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvcHmL(i1,gt1,i2)
coup1R = cplcFeFvcHmR(i1,gt1,i2)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = -cplhhHmVWp(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHm2(i2),Mhh2(i3)) + B0(0._dp,MHm2(i2),Mhh2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
   Do i3= 1,2
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWp2.gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvVWpL(i1,gt1)
coup1R = cplcFeFvVWpR(i1,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = cplhhcVWpVWp(i3)
End if 
   End Do
End Do


chargefactor = 1 
  Do i2= 1,3
   Do i3= 1,3
  If ((MVWp2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFecVWpL(gt1,i2)
coup1R = cplFvFecVWpR(gt1,i2)
coup2L = cplcFeFvVWpL(gt2,i3)
coup2R = cplcFeFvVWpR(gt2,i3)
coup3L = cplcFeFvVWpL(i2,i3)
coup3R = cplcFeFvVWpR(i2,i3)
End if 
  End Do
End Do


 End Do 
 
End Do 
 
res = res + vertex/g2 
Do gt1=1,3 
 Do gt2=1,3 
gt3 = 2 
gt4 = 1 
! Fe,conj[Hm],Fv,conj[Hm]
chargefactor = 1 
Do i1=1,3
  Do i2=1,3
    Do i3=1,3
      Do i4=1,3
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHm2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MHm2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(gt1,i1,i4)
coup1R = cplFvFeHmR(gt1,i1,i4)
coup2L = cplcFeFvcHmL(i1,gt2,i2)
coup2R = cplcFeFvcHmR(i1,gt2,i2)
coup3L = cplFvFeHmL(i3,gt3,i2)
coup3R = cplFvFeHmR(i3,gt3,i2)
coup4L = cplcFeFvcHmL(gt4,i3,i4)
coup4R = cplcFeFvcHmR(gt4,i3,i4)
D27m2 = D27_Bagger(MHm2(i2),MHm2(i4),MFe2(i1),MFv2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Hm,bar[Fe],Ah,bar[Fe]
chargefactor = 1 
Do i1=1,3
  Do i2=1,3
      Do i4=1,3
If ((MHm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MAh2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(gt1,i4,i1)
coup1R = cplFvFeHmR(gt1,i4,i1)
coup2L = cplcFeFvcHmL(i2,gt2,i1)
coup2R = cplcFeFvcHmR(i2,gt2,i1)
coup3L = cplcFeFeAhL(gt4,i2)
coup3R = cplcFeFeAhR(gt4,i2)
coup4L = cplcFeFeAhL(i4,gt3)
coup4R = cplcFeFeAhR(i4,gt3)
D0m2 = D0_Bagger(MHm2(i1),MAh2,MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHm2(i1),MAh2,MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
End Do 


 ! Hm,bar[Fe],etI,bar[Fe]
chargefactor = 1 
Do i1=1,3
  Do i2=1,3
      Do i4=1,3
If ((MHm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MetI2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(gt1,i4,i1)
coup1R = cplFvFeHmR(gt1,i4,i1)
coup2L = cplcFeFvcHmL(i2,gt2,i1)
coup2R = cplcFeFvcHmR(i2,gt2,i1)
coup3L = cplcFeFeetIL(gt4,i2)
coup3R = cplcFeFeetIR(gt4,i2)
coup4L = cplcFeFeetIL(i4,gt3)
coup4R = cplcFeFeetIR(i4,gt3)
D0m2 = D0_Bagger(MHm2(i1),MetI2,MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHm2(i1),MetI2,MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
End Do 


 ! Hm,bar[Fe],hh,bar[Fe]
chargefactor = 1 
Do i1=1,3
  Do i2=1,3
    Do i3=1,2
      Do i4=1,3
If ((MHm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFeHmL(gt1,i4,i1)
coup1R = cplFvFeHmR(gt1,i4,i1)
coup2L = cplcFeFvcHmL(i2,gt2,i1)
coup2R = cplcFeFvcHmR(i2,gt2,i1)
coup3L = cplcFeFehhL(gt4,i2,i3)
coup3R = cplcFeFehhR(gt4,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHm2(i1),Mhh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHm2(i1),Mhh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


  End Do 
 
End Do 
 

 
sumI = -2._dp*cosW2_DR*mz2*Real(teil,dp)/g2**2 
res = res + SumI 
End if ! BSM part 
res = res*oo16pi2 
Iname = Iname-1
End subroutine DeltaVB 
 
 
Subroutine CoupHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHm,ratVWp,               & 
& MFd,MFe,MFu,MHm,MVWp,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFe(3),ratFu(3),ratHm(3),ratVWp

Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(3),MVWp

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(1)**2*ratVWp*A_one(mH2p/MVWp**2)
HPPloopVWp(inG) = HPPloopVWp(inG)+1*(1)**2*ratVWp*A_one(mH2p/MVWp**2)
Do i1 = 2 , 3
coup = coup + 1*(1)**2*ratHm(i1)*A_zero(mH2p/MHm(i1)**2)
HPPloopHm(i1,inG) = HPPloopHm(i1,inG)+1*(1)**2*ratHm(i1)*A_zero(mH2p/MHm(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1,inG) = HPPloopFd(i1,inG) + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1,inG) = HPPloopFu(i1,inG) + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
HPPloopFe(i1,inG) = HPPloopFe(i1,inG)+1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhoton

Subroutine CoupHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 = 1 , 3
coup = coup + 1*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluon

Subroutine CoupHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHm,MVWp,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(3),MVWp

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(1)**2*A_one(mH2p/MVWp**2)
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*(-1)**2*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhotonSM 

Subroutine CoupHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluonSM 

Subroutine CoupPseudoHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHm,ratVWp,         & 
& MFd,MFe,MFu,MHm,MVWp,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFe(3),ratFu(3),ratHm(3),ratVWp

Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(3),MVWp

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2*ratFe(i1)*AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhoton

Subroutine CoupPseudoHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluon

Subroutine CoupPseudoHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHm,MVWp,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHm(3),MVWp

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2**AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2**AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2**AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhotonSM 

Subroutine CoupPseudoHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluonSM 

Complex(dp) Function cNLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cNLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_onehalf = 1._dp - oo4pi2*g**2  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cNLO_onehalf = 1._dp 
  End if 
End if 
End Function cNLO_onehalf 
 
Complex(dp) Function cANLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cANLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cANLO_onehalf = 1._dp  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cANLO_onehalf = 1._dp 
  End if 
End if 
End Function cANLO_onehalf 
 
Real(dp) Function cNLO_zero(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
If (g.lt.0._dp) Then 
   cNLO_zero= 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_zero = 1._dp + 2._dp*oo3pi2*g**2  
  Else  
    cNLO_zero = 1._dp 
  End if 
End if 
End Function cNLO_zero 
End Module LoopCouplings_radinuZeeHB 
 
