


Do i1=1,Size(mHpm)
  Do i2=1,3 
    Do i3=1,3 
cplcHpmcFuFdL(i1,i2,i3) = cplcFdFuHpmL(i2,i3,i1)
cplcHpmcFuFdR(i1,i2,i3) = cplcFdFuHpmR(i2,i3,i1)
    End Do 
  End Do 
End Do 


Do i1=1,2
  Do i2=1,3 
    Do i3=1,6 
cpl_CDSu_L(i1,i2,i3) = cplcFdChaSuL(i2,i1,i3)
cpl_CDSu_R(i1,i2,i3) = cplcFdChaSuR(i2,i1,i3)
    End Do 
  End Do 
End Do  


Do i1=1,2
  Do i2=1,3 
    Do i3=1,6 
cpl_CNuSl_L(i1,i2,i3) = cplcFvcChaSeL(i2,i1,i3)
cpl_CNuSl_R(i1,i2,i3) = cplcFvcChaSeR(i2,i1,i3)
    End Do 
  End Do 
End Do  


Call BtoQGamma(2, MFd, gauge, MFu, mVWm, Yd, ZDL, ZDR, Yu, ZUL, ZUR &
   & , MHpm2, ZP, MCha, UM, UP, MSu2, ZU, TYu, MSd2, ZD, TYd, mglu     &
   & , phaseGlu, Mchi, ZN, mueEff, mhh2, ZH, mAh2, ZA, vevSM, cplcHpmcFuFdL, &
   & cplcHpmcFuFdR, cpl_CDSu_L ,cpl_CDSu_R, &
   & cplcFdGluSdL/2._dp,cplcFdGluSdR/2._dp, cplcFdChiSdL, cplcFdChiSdR, cplFdcFdhhLeff,cplFdcFdhhReff, &
   & cplFdcFdAhLeff,cplFdcFdAhReff, BRBtoSGamma)

BRBtoSGamma = BRBtoSGamma*1.e-4 


Call BToSLL(gauge, MFd, MFu, mVWm, Yd, ZDL, ZDR, Yu, ZUL, ZUR     &
   & , Ye, ZEL, ZER, mSv2, id3C, MSe2, ZE                 &
   & , MHpm2, ZP, MCha, UM, UP, MSu2, ZU, TYu, MSd2, ZD, TYd, mglu &
   & , phaseGlu, Mchi, ZN, mueEff, mhh2, ZH, mAh2, ZA, vevSM,  &
   &  cplcHpmcFuFdL,cplcHpmcFuFdR, cpl_CDSu_L,cpl_CDSu_R, cplcFdGluSdL/2._dp &
   & ,cplcFdGluSdR/2._dp, cplcFdChiSdL, cplcFdChiSdR,cplcChaFecSvL,cplcChaFecSvR   &
   & , cplcFeChiSeL,cplcFeChiSeR,cplFdcFdhhLeff,cplFdcFdhhReff, &
   & cplFdcFdAhLeff,cplFdcFdAhReff, BtoSEE, BtoSMuMu )


Call B_To_SNuNu(gauge, MFd, MFu, mVWm, Yd, ZDL, ZDR, Yu, ZUL, ZUR &
   & , Ye, mSv2, id3C, MSe2, ZE, MHpm2, ZP, MCha, UM, UP     &
   & , MSu2, ZU, MSd2, ZD, mglu, phaseGlu, MChi, ZN, vevSM,cpl_CDSu_L,cpl_CDSu_R,  &
   &  cplcFdGluSdL/2._dp,cplcFdGluSdR/2._dp, cplcFdChiSdL, cplcFdChiSdR,cpl_CNuSl_L, &
   & cpl_CNuSl_R, cplcFvChiSvR,.False., BtoSNuNu)

Call Delta_MB(1, MFu, gauge, Yu, ZUL,ZUR, Yd, ZDL, ZDR, MCha, UM, UP &
   & , MCHI, ZN, mGlu, phaseglu, mhh2, ZH, mAh2, ZA, mHpm2, ZP, MSu2, ZU &
   & , TYu, mueEff, mSd2, ZD, TYd, vevSM,cplcHpmcFuFdR,cplcHpmcFuFdL,           &
   &  cpl_CDSu_R,cpl_CDSu_L, cplcFdGluSdL/2._dp     &
   & , cplcFdGluSdR/2._dp, cplcFdChiSdL,cplcFdChiSdR,cplFdcFdhhLeff,cplFdcFdhhReff, &
   & cplFdcFdAhLeff,cplFdcFdAhReff,DeltaMBd)

Call Delta_MB(2, MFu, gauge, Yu, ZUL,ZUR, Yd, ZDL, ZDR, MCha, UM, UP &
   & , MCHI, ZN, mGlu, phaseglu, mhh2, ZH, mAh2, ZA, mHpm2, ZP, MSu2, ZU &
   & , TYu, mueEff, mSd2, ZD, TYd, vevSM,cplcHpmcFuFdR,cplcHpmcFuFdL,           &
   &  cpl_CDSu_R,cpl_CDSu_L, cplcFdGluSdL/2._dp     &
   & , cplcFdGluSdR/2._dp, cplcFdChiSdL,cplcFdChiSdR,cplFdcFdhhLeff,cplFdcFdhhReff, &
   & cplFdcFdAhLeff,cplFdcFdAhReff,DeltaMBs)

Call Bs_to_MuMu(2, MFu, gauge, Yu, ZUL, ZUR, Yd, ZDL, ZDR        &
      & , mCha, UM, UP, MChi, ZN, mGlu, phaseGlu, mhh2, ZH, mAh2, ZA, mHpm2, ZP   &
      & , mSu2, ZU, TYu, mueEff, mSd2, ZD, TYd, vevSM, mSv2, mSe2 &
      & , cpl_CDSu_L,cpl_CDSu_R, conjg(cplcFvcChaSeR), &
      & conjg(cplcFvcChaSeL), cplcFeChiSeL,cplcFeChiSeR        &
      & , cplcFdGluSdL/2._dp, cplcFdGluSdR/2._dp, cplcFdChiSdL, cplcFdChiSdR, &
      & cplFdcFdhhLeff,cplFdcFdhhReff, &
      & cplFdcFdAhLeff,cplFdcFdAhReff, BsToMuMu )

DeltaMBd = 1.e-12_dp*DeltaMBd/hbar 
DeltaMBs = 1.e-12_dp*DeltaMBs/hbar 


