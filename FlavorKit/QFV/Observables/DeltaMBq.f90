Complex(dp) :: MBq, etaB, FBq2, BBq, Ftt, Veff2, r, &
     & P1bLR, P2bLR, P1bSLL, P2bSLL, norm, &
     & CVLLnew, C1VRR, C1LR, C2LR, C1SLL, C1SRR, C2SLL, C2SRR
Real(dp) ::  hbar, xt, GF
Real(dp) :: mS
Complex(dp) :: HL, HR, AL, AR
Integer :: i1, iS

! ---------------------------------------------------------------- 
! Delta M_{Bd,Bs}
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on A. J. Buras et al, NPB 619 (2001) 434 [hep-ph/0107048]
! and NPB 659 (2003) 3 [hep-ph/0210145]
! ---------------------------------------------------------------- 

hbar =  6.58211889e-25_dp
xt = mf_u2_160(3)/mw2
r = 0.985_dp
P1bLR = -0.71_dp
P2bLR = 0.90_dp
P1bSLL = -0.37_dp
P2bSLL = -0.72_dp

! QCD factor, see A. J. Buras et al, NPB 47 (1990) 491
! and J. Urban et al, NPB 523 (1998) 40 
etaB = 0.55_dp

GF =  (Alpha_160*4._dp*Pi/sinW2_160)/mw**2*sqrt2/8._dp

Do i1 = 1,2

If (i1.eq.1) Then ! Delta M_Bd
 MBq = mass_B0d
 FBq2 = f_B0d_CONST**2
 BBq = 1.26_dp ! see arXiv:0910.2928
 Veff2 = Conjg(Conjg(CKM_160(3,3))*CKM_160(3,1))**2
Else ! Delta M_Bs
 MBq = mass_B0s
 FBq2 = f_B0s_CONST**2
 BBq = 1.33_dp ! see arXiv:0910.2928
 Veff2 = Conjg(Conjg(CKM_160(3,3))*CKM_160(3,2))**2
End if

! normalization factor
norm = GF**2*mw2/(8._dp*Pi**2)*Veff2 ! Note the relative factor of 2

! Wilson coefficients
CVLLnew = (O4dVLL(3,i1,3,i1)-O4dVLLSM(3,i1,3,i1))/norm ! we remove the SM contribution
C1VRR = O4dVRR(3,i1,3,i1)/norm
C1LR = 2._dp*(O4dVLR(3,i1,3,i1)+O4dVRL(3,i1,3,i1))/norm
C2LR = 2._dp*(O4dSLR(3,i1,3,i1)+O4dSRL(3,i1,3,i1))/norm
C1SLL = O4dSLL(3,i1,3,i1)/norm
C1SRR = O4dSRR(3,i1,3,i1)/norm
C2SLL  = O4dTLL(3,i1,3,i1)/norm
C2SRR  = O4dTRR(3,i1,3,i1)/norm


! Double Higgs penguins
@ If[HiggsBosonPresent===True, "Do iS =  "<>ToString[getGenSPhenoStart[HiggsBoson]]<>", "<>ToString[getGen[HiggsBoson]],""]
@ If[HiggsBosonPresent===True, "HL = OH2qSL(3,i1,iS)",""]
@ If[HiggsBosonPresent===True, "HR = OH2qSR(3,i1,iS)",""]
@ If[HiggsBosonPresent===True, "mS = "<>SPhenoMassSq[HiggsBoson,iS],""]
@ If[HiggsBosonPresent===True, "C2LR = C2LR - HL*Conjg(HR)/(mS*norm)",""]
@ If[HiggsBosonPresent===True, "C1SLL = C1SLL - 0.5_dp*HL**2/(mS*norm)",""]
@ If[HiggsBosonPresent===True, "C1SRR = C1SRR - 0.5_dp*HR**2/(mS*norm)",""]
@ If[HiggsBosonPresent===True, "End Do",""]


@ If[PseudoScalarBosonPresent===True, "Do iS = "<>ToString[getGenSPhenoStart[PseudoScalar]]<>", "<>ToString[getGen[PseudoScalar]],""]
@ If[PseudoScalarBosonPresent===True, "AL = OAh2qSL(3,i1,iS)",""]
@ If[PseudoScalarBosonPresent===True, "AR = OAh2qSR(3,i1,iS)",""]
@ If[PseudoScalarBosonPresent===True, "mS = "<>SPhenoMassSq[PseudoScalar,iS],""]
@ If[PseudoScalarBosonPresent===True, "C2LR = C2LR - AL*Conjg(AR)/(mS*norm)",""]
@ If[PseudoScalarBosonPresent===True, "C1SLL = C1SLL - 0.5_dp*AL**2/(mS*norm)",""]
@ If[PseudoScalarBosonPresent===True, "C1SRR = C1SRR - 0.5_dp*AR**2/(mS*norm)",""]
@ If[PseudoScalarBosonPresent===True, "End Do",""]


Ftt = S0xt(xt) + CVLLnew/(4._dp*r) + &
     & C1VRR/(4._dp*r) + P1bLR*C1LR + P2bLR*C2LR  + &
     & P1bSLL*(C1SLL + C1SRR) + P2bSLL*(C2SLL + C2SRR)

If (i1.eq.1) Then ! Delta M_Bd
   ratioDeltaMBq = Abs(Ftt/S0xt(xt))
   DeltaMBq = G_F**2*mw2/(6._dp*Pi**2)*    &
      & MBq*etaB*BBq*FBq2*Veff2*Abs(Ftt)*1.e-12_dp/hbar
Else ! Delta M_Bs
   ratioDeltaMBs = Abs(Ftt/S0xt(xt))
   DeltaMBs =  G_F**2*mw2/(6._dp*Pi**2)*   & 
      & MBq*etaB*BBq*FBq2*Veff2*Abs(Ftt)*1.e-12_dp/hbar
End if
 
End Do

Contains 

  Real(dp) Function S0xt(x) ! See for example hep-ph/9806471
    Implicit None
    Real(dp), Intent(in) :: x
    S0xt = 1._dp - 2.75_dp * x + 0.25_dp * x**2 &
        & - 1.5_dp * x**2 * Log(x) / (1-x)
    S0xt = x*S0xt / (1 -x)**2
  End  Function S0xt
