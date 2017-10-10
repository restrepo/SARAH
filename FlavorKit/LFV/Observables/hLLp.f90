Real(dp) :: width1, width2, width, mh, gamh, kinfactor
Complex(dp) :: SL1, SR1, SL2, SR2
Integer :: i1, gt1, gt2, hLoc

! ---------------------------------------------------------------- 
! h -> l l'
! Observable implemented by W. Porod, F. Staub and A. Vicente
! Based on E. Arganda et al, PRD 71 (2005) 035011 [hep-ph/0407302]
! ---------------------------------------------------------------- 

!! NEXT LINE HAVE TO BE PARSED BY SARAH
! Checking if there are several generations of Scalars and what is the SM-like doublet
@ If[getGen[HiggsBoson]>1, "hLoc = MaxLoc(Abs("<>ToString[HiggsMixingMatrix]<>"(2,:)),1)", "hLoc = 1"]

@ "mh = "<>ToString[SPhenoMass[HiggsBoson]]<>If[getGen[HiggsBoson]>1, "(hLoc)", ""]

@ "gamh ="<>ToString[SPhenoWidth[HiggsBoson]]<>If[getGen[HiggsBoson]>1, "(hLoc)", ""]

If (.not.L_BR) gamh = 4.5E-3_dp  ! Decays not calculated; using SM value

Do i1=1,3 

If (i1.eq.1) Then         ! h -> e mu
 gt1 = 1
 gt2 = 2
Elseif (i1.eq.2) Then     ! h -> e tau
 gt1 = 1
 gt2 = 3
Else                      ! h -> mu tau
 gt1 = 2
 gt2 = 3
End if

! width = Gamma(h -> \bar{l1} l2) + Gamma(h -> l1 \bar{l2})

SL1 = OH2lSL(gt1,gt2,hLoc)
SR1 = OH2lSR(gt1,gt2,hLoc)
SL2 = OH2lSL(gt2,gt1,hLoc)
SR2 = OH2lSR(gt2,gt1,hLoc)

kinfactor = (1-(mf_l(gt1)+mf_l(gt2)/mh)**2)*&
       & (1-(mf_l(gt1)-mf_l(gt2)/mh)**2)

width1 = (mh**2-mf_l(gt1)**2-mf_l(gt2)**2)*(Abs(SL1)**2+Abs(SR1)**2) & 
     & - 4._dp*mf_l(gt1)*mf_l(gt2)*Real(SL1*Conjg(SR1),dp)
width2 = (mh**2-mf_l(gt1)**2-mf_l(gt2)**2)*(Abs(SL2)**2+Abs(SR2)**2) & 
     & - 4._dp*mf_l(gt1)*mf_l(gt2)*Real(SL2*Conjg(SR2),dp)

! decay width
width = oo16pi/mh * sqrt(kinfactor) * (width1+width2)

If (i1.eq.1) Then
BrhtoMuE = width/(width+gamh)
Elseif (i1.eq.2) Then 
BrhtoTauE = width/(width+gamh)
Else
BrhtoTauMu = width/(width+gamh)
End if

End do
