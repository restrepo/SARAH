Module RMsquared
Use Control
Use LoopFunctions
Use AddLoopFunctions

Contains

 Subroutine TreeFtoFS1(MI,MO1,MO2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = Mtree*Mtree^* for Mtree
! containing the following couplings:
!
! G[1][0][F[25, {1}], F[26, {1}], S[10]][NonCommutative[PL]] == Cgen1
! G[1][0][F[25, {1}], F[26, {1}], S[10]][NonCommutative[PR]] == Cgen2
!
! This result was produced using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8)

 Iname=Iname+1
 NameOfUnit(Iname)='TreeFtoFS1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*MIp(2)*Conjg(Cgen1) &
 & + 2._dp*Cgen2*MI*MO1*Conjg(Cgen1) &
 & + Cgen1*MO1p(2)*Conjg(Cgen1) &
 & + (-1._dp)*Cgen1*MO2p(2)*Conjg(Cgen1) &
 & + Cgen2*MIp(2)*Conjg(Cgen2) &
 & + 2._dp*Cgen1*MI*MO1*Conjg(Cgen2) &
 & + Cgen2*MO1p(2)*Conjg(Cgen2) &
 & + (-1._dp)*Cgen2*MO2p(2)*Conjg(Cgen2)

  InMsquared = InMSquared/(2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine TreeFtoFS1


 Subroutine TreeFtoFV1(MI,MO1,MO2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = Mtree*Mtree^* for Mtree
! containing the following couplings:
!
! G[-1][0][-F[26, {1}], F[25, {1}], V[10]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[26, {1}], F[25, {1}], V[10]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
!
! This result was produced using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8)

 Iname=Iname+1
 NameOfUnit(Iname)='TreeFtoFV1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*MIp(4)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MIp(2)*MO1p(2)*Conjg(Cgen1) &
 & + Cgen1*MO1p(4)*Conjg(Cgen1) &
 & + Cgen1*MIp(2)*MO2p(2)*Conjg(Cgen1) &
 & + (-6._dp)*Cgen2*MI*MO1*MO2p(2)*Conjg(Cgen1) &
 & + Cgen1*MO1p(2)*MO2p(2)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MO2p(4)*Conjg(Cgen1) &
 & + Cgen2*MIp(4)*Conjg(Cgen2) &
 & + (-2._dp)*Cgen2*MIp(2)*MO1p(2)*Conjg(Cgen2) &
 & + Cgen2*MO1p(4)*Conjg(Cgen2) &
 & + Cgen2*MIp(2)*MO2p(2)*Conjg(Cgen2) &
 & + (-6._dp)*Cgen1*MI*MO1*MO2p(2)*Conjg(Cgen2) &
 & + Cgen2*MO1p(2)*MO2p(2)*Conjg(Cgen2) &
 & + (-2._dp)*Cgen2*MO2p(4)*Conjg(Cgen2)

  InMsquared = InMSquared/(2._dp*MO2p(2))

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine TreeFtoFV1

 Subroutine TreeStoSS1(MI,MO1,MO2,Cgen1,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = Mtree*Mtree^* for Mtree
! containing the following couplings:
!
! G[1][0][S[10, {1}], -S[11, {1}], S[12, {1}]][1] == Cgen1
!
! This result was produced using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1 

 Real(dp),Intent(in) :: MI, MO1, MO2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8)

 Iname=Iname+1
 NameOfUnit(Iname)='TreeStoSS1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*Conjg(Cgen1)

  InMsquared = InMSquared/(1)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine TreeStoSS1


 Subroutine TreeStoSV1(MI,MO1,MO2,Cgen1,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = Mtree*Mtree^* for Mtree
! containing the following couplings:
!
! G[-1][0][S[10, {1}], -S[11], V[10]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
!
! This result was produced using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1 

 Real(dp),Intent(in) :: MI, MO1, MO2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8)

 Iname=Iname+1
 NameOfUnit(Iname)='TreeStoSV1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*MIp(4)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MIp(2)*MO1p(2)*Conjg(Cgen1) &
 & + Cgen1*MO1p(4)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MIp(2)*MO2p(2)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MO1p(2)*MO2p(2)*Conjg(Cgen1) &
 & + Cgen1*MO2p(4)*Conjg(Cgen1)

  InMsquared = InMSquared/(MO2p(2))

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine TreeStoSV1


 Subroutine TreeStoVV1(MI,MO1,MO2,Cgen1,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = Mtree*Mtree^* for Mtree
! containing the following couplings:
!
! G[1][0][S[10, {1}], -V[10], V[11]][MT[KI1[2], KI1[3]]] == Cgen1
!
! This result was produced using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1 

 Real(dp),Intent(in) :: MI, MO1, MO2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8)

 Iname=Iname+1
 NameOfUnit(Iname)='TreeStoVV1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*MIp(4)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MIp(2)*MO1p(2)*Conjg(Cgen1) &
 & + Cgen1*MO1p(4)*Conjg(Cgen1) &
 & + (-2._dp)*Cgen1*MIp(2)*MO2p(2)*Conjg(Cgen1) &
 & + 10._dp*Cgen1*MO1p(2)*MO2p(2)*Conjg(Cgen1) &
 & + Cgen1*MO2p(4)*Conjg(Cgen1)

  InMsquared = InMSquared/(4._dp*MO1p(2)*MO2p(2))

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine TreeStoVV1


 Subroutine VertexFtoFS1(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(5)),Loop).eq.Mloop1
! Mass(F(Ind(6)),Loop).eq.Mloop2
! Mass(S(Ind(4)),Loop).eq.Mloop3
! G[1][0][-F[Ind[5]], F[25, {1}], -S[Ind[4]]][NonCommutative[PL]] == Cgen1
! G[1][0][-F[Ind[5]], F[25, {1}], -S[Ind[4]]][NonCommutative[PR]] == Cgen2
! G[1][0][F[Ind[6]], F[Ind[5]], S[10]][NonCommutative[PL]] == Cgen3
! G[1][0][F[Ind[6]], F[Ind[5]], S[10]][NonCommutative[PR]] == Cgen4
! G[1][0][-F[26, {1}], -F[Ind[6]], S[Ind[4]]][NonCommutative[PL]] == Cgen5
! G[1][0][-F[26, {1}], -F[Ind[6]], S[Ind[4]]][NonCommutative[PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFS1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 4._dp*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MIp(3)*Mloop1*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop2*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*Mloop2*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*SCgenT1 &
 & + 8._dp*Cgen2*Cgen3*Cgen6*Cnr2*MI*MO1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(3)*MO1*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(3)*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop2*MO1*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop2*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop2*MO1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr1*MI*Mloop1*Mloop2*MO1*SCgenT1 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr2*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop2*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MI*MO1p(3)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr6*MI*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr7*MI*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr3*Mloop1*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr6*Mloop1*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop2*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr3*Mloop2*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr6*Mloop2*MO1p(3)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr6*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr7*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr4*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop2*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop2*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr3*MI*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr4*MI*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MI*MO1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr6*MI*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr1*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr3*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen6*Cnr2*MIp(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*MIp(3)*Mloop1*SCgenT2 &
 & + Cgen1*Cgen4*Cgen6*Cnr1*MIp(3)*Mloop2*SCgenT2 &
 & + Cgen1*Cgen4*Cgen6*Cnr3*MIp(3)*Mloop2*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*SCgenT2 &
 & + 8._dp*Cgen1*Cgen4*Cgen5*Cnr2*MI*MO1*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(3)*MO1*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(3)*MO1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop2*MO1*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop2*MO1*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop2*MO1*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop1*Mloop2*MO1*SCgenT2 &
 & + 4._dp*Cgen2*Cgen3*Cgen6*Cnr2*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MI*Mloop2*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr3*MI*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop2*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MI*MO1p(3)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen5*Cnr6*MI*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr7*MI*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*Mloop1*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*Mloop1*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop2*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*Mloop2*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*Mloop2*MO1p(3)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr6*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr7*MO1p(4)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr4*MIp(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MI*Mloop1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MI*Mloop2*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr3*MI*Mloop2*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr3*MI*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr4*MI*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MI*MO1*MO2p(2)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen5*Cnr6*MI*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr3*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr4*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFS1


 Subroutine VertexFtoFS2(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(S(Ind(6)),Loop).eq.Mloop3
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PL]] == Cgen1
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PR]] == Cgen2
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PL]] == Cgen3
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PR]] == Cgen4
! G[1][0][S[10], S[Ind[5]], S[Ind[6]]][1] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFS2'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C1  ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C2  ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen2*Cgen3*Cgen5*Cnr1*MIp(3)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr2*MIp(3)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*MO1*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*MO1*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*MO1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO1*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*MI*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr2*MI*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr2*MI*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*MIp(3)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen5*Cnr2*MIp(3)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MIp(3)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*MO1*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr2*MIp(2)*MO1*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*MO1*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1*SCgenT2 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*MI*MO1p(2)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen5*Cnr2*MI*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MI*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MI*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MI*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MI*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MO1*MO2p(2)*SCgenT2

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFS2


 Subroutine VertexFtoFS3(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(5)),Loop).eq.Mloop1
! Mass(F(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(4)),Loop).eq.Mloop3
! G[-1][0][-F[Ind[5]], F[25, {1}], -V[Ind[4]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[Ind[5]], F[25, {1}], -V[Ind[4]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][-F[26, {1}], -F[Ind[6]], V[Ind[4]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen3
! G[-1][0][-F[26, {1}], -F[Ind[6]], V[Ind[4]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen4
! G[1][0][F[Ind[6]], F[Ind[5]], S[10]][NonCommutative[PL]] == Cgen5
! G[1][0][F[Ind[6]], F[Ind[5]], S[10]][NonCommutative[PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFS3'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-8._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr6*MIp(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MIp(3)*Mloop1*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*MIp(3)*Mloop2*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr3*MIp(3)*Mloop2*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*SCgenT1 &
 & + (-16._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MI*MO1*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen6*Cnr5*MIp(3)*MO1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr6*MIp(3)*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop2*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop2*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop2*MO1*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*Mloop2*MO1*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr1*MI*Mloop2*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MI*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MI*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MI*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MI*MO1p(3)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MI*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr3*Mloop1*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr6*Mloop1*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop2*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*Mloop2*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*Mloop2*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MO1p(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen4*Cgen5*Cnr2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr1*MI*Mloop2*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MI*Mloop2*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MI*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr6*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr7*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr3*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr4*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr6*MO2p(4)*SCgenT1 &
 & + (-8._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MIp(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MIp(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr6*MIp(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*MIp(3)*Mloop1*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop2*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*Mloop2*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*SCgenT2 &
 & + (-16._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MI*MO1*SCgenT2 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr5*MIp(3)*MO1*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(3)*MO1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop2*MO1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop2*MO1*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop2*MO1*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MI*Mloop1*Mloop2*MO1*SCgenT2 &
 & + (-8._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop2*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MI*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(2)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MI*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MI*MO1p(3)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MI*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*Mloop1*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*Mloop1*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr1*Mloop2*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*Mloop2*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*Mloop2*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MO1p(4)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MO1p(4)*SCgenT2 &
 & + 8._dp*Cgen2*Cgen3*Cgen6*Cnr2*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MI*Mloop1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop2*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*Mloop2*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MI*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr3*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen6*Cnr6*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr7*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr3*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr4*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MO2p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr6*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFS3


 Subroutine VertexFtoFS4(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][S[10], S[Ind[5]], V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen3
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PL]] == Cgen4
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PR]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFS4'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-4._dp)*Cgen2*Cgen3*Cgen4*Cnr2*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr3*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr5*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr6*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr7*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop1*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop1*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MI*MO1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*MO1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(3)*MO1*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(3)*MO1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(3)*MO1*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr1*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr6*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen4*Cnr2*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen4*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr4*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr5*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr7*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MI*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1p(3)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr1*Mloop1*MO1p(3)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr3*Mloop1*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr4*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr5*MO1p(4)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen4*Cnr2*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen4*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen4*Cnr5*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen4*Cnr6*MIp(2)*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen4*Cnr7*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr1*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen4*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen4*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen4*Cnr5*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr5*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(4)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(4)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr1*MIp(3)*Mloop1*SCgenT2 &
 & + Cgen1*Cgen3*Cgen4*Cnr6*MIp(3)*Mloop1*SCgenT2 &
 & + (-8._dp)*Cgen2*Cgen3*Cgen4*Cnr2*MI*MO1*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr3*MIp(3)*MO1*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr5*MIp(3)*MO1*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen4*Cnr6*MIp(3)*MO1*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr7*MIp(3)*MO1*SCgenT2 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen4*Cnr6*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr4*MI*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr5*MI*MO1p(3)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen4*Cnr6*MI*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(3)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(4)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr2*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*MO2p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MI*Mloop1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr6*MI*Mloop1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen4*Cnr3*MI*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen4*Cnr5*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr6*MI*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr4*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFS4


 Subroutine VertexFtoFS5(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][S[10], S[Ind[6]], V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen3
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PL]] == Cgen4
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PR]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFS5'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 4._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr5*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr6*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr7*MIp(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen4*Cnr1*MIp(3)*Mloop1*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr6*MIp(3)*Mloop1*SCgenT1 &
 & + 8._dp*Cgen2*Cgen3*Cgen5*Cnr2*MI*MO1*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*MO1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr5*MIp(3)*MO1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr7*MIp(3)*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen4*Cnr2*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr5*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr6*MIp(2)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr7*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen4*Cnr1*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr3*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr6*MI*Mloop1*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr3*MI*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr4*MI*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr5*MI*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr6*MI*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr5*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr6*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr5*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr6*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr7*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr1*MI*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen4*Cnr6*MI*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr5*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen4*Cnr6*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr5*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr6*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen5*Cnr2*MIp(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr5*MIp(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MIp(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr7*MIp(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop1*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop1*SCgenT2 &
 & + 8._dp*Cgen1*Cgen3*Cgen4*Cnr2*MI*MO1*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(3)*MO1*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr5*MIp(3)*MO1*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr7*MIp(3)*MO1*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr3*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr6*MIp(2)*Mloop1*MO1*SCgenT2 &
 & + 4._dp*Cgen2*Cgen3*Cgen5*Cnr2*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr5*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr7*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr3*MI*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr4*MI*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr5*MI*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr6*MI*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen4*Cnr1*Mloop1*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen4*Cnr3*Mloop1*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr3*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr4*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr5*MO1p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr6*MO1p(4)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen5*Cnr2*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr7*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO2p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO2p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen4*Cnr3*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr5*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr6*MI*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen4*Cnr1*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen4*Cnr3*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr4*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr5*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr6*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFS5


 Subroutine VertexFtoFS6(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen3
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen4
! G[1][0][S[10], V[Ind[5]], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFS6'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen2*Cgen4*Cgen5*Cnr3*MIp(3)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr2*MI*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MI*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO1*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO1*SCgenT2 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO1*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MI*MO1p(2)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr2*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MO1*MO2p(2)*SCgenT2

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFS6


 Subroutine VertexFtoFV1(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(5)),Loop).eq.Mloop1
! Mass(F(Ind(6)),Loop).eq.Mloop2
! Mass(S(Ind(4)),Loop).eq.Mloop3
! G[-1][0][F[Ind[6]], F[Ind[5]], V[10]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][F[Ind[6]], F[Ind[5]], V[10]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[1][0][-F[Ind[5]], F[25, {1}], -S[Ind[4]]][NonCommutative[PL]] == Cgen3
! G[1][0][-F[Ind[5]], F[25, {1}], -S[Ind[4]]][NonCommutative[PR]] == Cgen4
! G[1][0][-F[26, {1}], -F[Ind[6]], S[Ind[4]]][NonCommutative[PL]] == Cgen5
! G[1][0][-F[26, {1}], -F[Ind[6]], S[Ind[4]]][NonCommutative[PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFV1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(5)*Mloop2*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr1*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr7*MIp(5)*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*Mloop1*MO1*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen6*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen6*Cnr6*MIp(3)*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(3)*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr7*MI*MO1p(5)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(5)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MIp(3)*Mloop1*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen4*Cgen6*Cnr1*MIp(3)*Mloop2*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen4*Cgen6*Cnr3*MIp(3)*Mloop2*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen6*Cnr6*MIp(3)*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen4*Cgen5*Cnr2*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen4*Cgen5*Cnr1*MI*Mloop1*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr3*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen6*Cnr6*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr3*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr5*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr6*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr7*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr1*Mloop2*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr3*Mloop2*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr6*Mloop2*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen3*Cgen6*Cnr2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr3*MI*Mloop1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MI*Mloop2*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr3*MI*Mloop2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop2*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr1*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*MI*MO1*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr4*MI*MO1*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr5*MI*MO1*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr6*MI*MO1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr7*MI*MO1*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop2*MO1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*Mloop2*MO1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*Mloop2*MO1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen6*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen6*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr3*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr4*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(5)*Mloop2*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr1*MIp(4)*Mloop1*Mloop2*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr7*MIp(5)*MO1*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(4)*Mloop1*MO1*SCgenT2 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(3)*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop2*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr7*MI*MO1p(5)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(5)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MIp(4)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*Mloop1*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop2*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*Mloop2*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop2*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT2 &
 & + 12._dp*Cgen2*Cgen3*Cgen6*Cnr2*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-6._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + (-6._dp)*Cgen1*Cgen3*Cgen6*Cnr1*MI*Mloop1*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen6*Cnr5*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen3*Cgen6*Cnr6*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen3*Cgen6*Cnr7*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen6*Cnr3*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen6*Cnr1*Mloop2*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen6*Cnr3*Mloop2*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen6*Cnr6*Mloop2*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MO1p(4)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr2*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop2*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop2*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop2*MO2p(4)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*Mloop2*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen6*Cnr3*MI*MO1*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen6*Cnr4*MI*MO1*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen6*Cnr5*MI*MO1*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen3*Cgen6*Cnr6*MI*MO1*MO2p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr7*MI*MO1*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr3*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop2*MO1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr3*Mloop2*MO1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen6*Cnr6*Mloop2*MO1*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MO1p(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr6*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr7*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr3*MO2p(6)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr4*MO2p(6)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*MO2p(6)*SCgenT2

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFV1


 Subroutine VertexFtoFV2(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(S(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[Ind[5]], S[Ind[6]], V[10]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PL]] == Cgen2
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PR]] == Cgen3
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PL]] == Cgen4
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PR]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFV2'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C00 ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C1  ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C11 ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr4 = Cget("C12 ",MIp(2),MO1p(2),MO2p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen2*Cgen5*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(5)*Mloop1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MIp(5)*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(5)*MO1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(4)*Mloop1*MO1*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen5*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(3)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(3)*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(3)*MO1p(3)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*Mloop1*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen5*Cnr1*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MI*Mloop1*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MI*MO1p(5)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MI*MO1p(5)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*Mloop1*MO1p(5)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr4*MO1p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen5*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(3)*Mloop1*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen3*Cgen4*Cnr1*MI*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen5*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen4*Cnr2*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen5*Cnr1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MI*Mloop1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MI*MO1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MI*MO1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MIp(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MIp(6)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(6)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MIp(6)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(5)*Mloop1*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MIp(5)*MO1*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MIp(5)*MO1*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*Mloop1*MO1*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen4*Cnr1*MIp(2)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(4)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(4)*MO1p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr4*MIp(4)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen4*Cnr2*MIp(3)*Mloop1*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(3)*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(3)*MO1p(3)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*Mloop1*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*MO1p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MIp(2)*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MI*Mloop1*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MI*MO1p(5)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MI*MO1p(5)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*Mloop1*MO1p(5)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MO1p(6)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MIp(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr4*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen4*Cnr2*MIp(3)*Mloop1*MO2p(2)*SCgenT2 &
 & + 12._dp*Cgen1*Cgen2*Cgen5*Cnr1*MI*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen4*Cnr2*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MO1p(4)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen4*Cnr1*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MI*Mloop1*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MI*MO1*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MI*MO1*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MO1p(2)*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFV2


 Subroutine VertexFtoFV3(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(5)),Loop).eq.Mloop1
! Mass(F(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(4)),Loop).eq.Mloop3
! G[-1][0][-F[Ind[5]], F[25, {1}], -V[Ind[4]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[Ind[5]], F[25, {1}], -V[Ind[4]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][F[Ind[6]], F[Ind[5]], V[10]][NC[DiracMatrix[KI1[3]], PL]] == Cgen3
! G[-1][0][F[Ind[6]], F[Ind[5]], V[10]][NC[DiracMatrix[KI1[3]], PR]] == Cgen4
! G[-1][0][-F[26, {1}], -F[Ind[6]], V[Ind[4]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen5
! G[-1][0][-F[26, {1}], -F[Ind[6]], V[Ind[4]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFV3'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO2p(2),MIp(2),MO1p(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MIp(5)*Mloop1*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*MIp(5)*Mloop2*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*MIp(5)*MO1*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*MIp(4)*Mloop1*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*MIp(4)*Mloop2*MO1*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(3)*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr7*MIp(3)*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop2*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*MI*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*MI*MO1p(5)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(5)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1p(5)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(3)*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen2*Cgen4*Cgen6*Cnr2*MI*MO1*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen4*Cgen6*Cnr5*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr7*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen3*Cgen6*Cnr1*MI*Mloop1*Mloop2*MO1*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen6*Cnr5*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr6*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen6*Cnr7*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*MI*Mloop2*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen6*Cnr3*MI*MO1*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen6*Cnr4*MI*MO1*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen6*Cnr5*MI*MO1*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr6*MI*MO1*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*MI*MO1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr4*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr2*MIp(4)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*MIp(5)*Mloop1*SCgenT2 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*MIp(5)*Mloop2*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr1*MIp(4)*Mloop1*Mloop2*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*MIp(5)*MO1*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*MIp(4)*Mloop1*MO1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*MIp(4)*Mloop2*MO1*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen6*Cnr2*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(3)*Mloop1*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(3)*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(3)*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop2*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr2*MO1p(4)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop1*MO1p(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*MI*Mloop2*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*MI*MO1p(5)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(5)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1p(5)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr2*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MIp(4)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr4*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr5*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr6*MIp(4)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(3)*Mloop1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(3)*Mloop2*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT2 &
 & + 12._dp*Cgen1*Cgen3*Cgen5*Cnr2*MI*MO1*MO2p(2)*SCgenT2 &
 & + (-6._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + (-6._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MI*Mloop1*Mloop2*MO1*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen6*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MI*Mloop2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr7*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr4*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr5*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen6*Cnr7*MO1p(4)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen6*Cnr2*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr4*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr5*MIp(2)*MO2p(4)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*MO2p(4)*SCgenT2 &
 & + Cgen1*Cgen4*Cgen6*Cnr6*MI*Mloop1*MO2p(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*MI*Mloop2*MO2p(4)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr1*Mloop1*Mloop2*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen3*Cgen5*Cnr4*MI*MO1*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1*MO2p(4)*SCgenT2 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*MI*MO1*MO2p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr6*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MO1p(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr4*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr5*MO1p(2)*MO2p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr7*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr3*MO2p(6)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr4*MO2p(6)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr5*MO2p(6)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr6*MO2p(6)*SCgenT2

  InMsquared = InMsquared/(8._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFV3


 Subroutine VertexFtoFV4(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PL]] == Cgen3
! G[1][0][-F[Ind[4]], F[25, {1}], -S[Ind[5]]][NonCommutative[PR]] == Cgen4
! G[1][0][S[Ind[5]], V[10], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFV4'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*Cgen4*Cgen5*Cnr2*MIp(5)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MIp(5)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(3)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(3)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr2*MI*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MI*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(3)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MIp(3)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr2*MIp(2)*MO1*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*MO1*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen4*Cgen5*Cnr2*MI*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*MI*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr2*MO1p(3)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr2*MI*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MI*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen5*Cnr2*MO1*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr2*MIp(5)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(5)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr1*MIp(4)*Mloop1*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr2*MIp(3)*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*MO1p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr2*MI*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MI*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(4)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr2*MIp(3)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*MO1*MO2p(2)*SCgenT2 &
 & + (-6._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*MO1*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen3*Cgen5*Cnr2*MI*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*MI*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MO1p(3)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen3*Cgen5*Cnr2*MI*MO2p(4)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr1*Mloop1*MO2p(4)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr2*MO1*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFV4


 Subroutine VertexFtoFV5(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PL]] == Cgen3
! G[1][0][-F[26, {1}], F[Ind[4]], -S[Ind[6]]][NonCommutative[PR]] == Cgen4
! G[1][0][S[Ind[6]], V[10], V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFV5'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(4)*Mloop1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*MO1*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*MO1*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1p(3)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(3)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MO1p(5)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MO1p(5)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(3)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MI*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen5*Cnr3*MI*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MO1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr2*MIp(4)*MO1*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MIp(4)*MO1*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO1p(3)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO1p(3)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(4)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr2*MO1p(5)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MO1p(5)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO1*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO1*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-6._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MI*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1p(2)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr2*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO2p(4)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MO1*MO2p(4)*SCgenT2 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MO1*MO2p(4)*SCgenT2

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFV5


 Subroutine VertexFtoFV6(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][-F[Ind[4]], F[25, {1}], -V[Ind[5]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PL]] == Cgen3
! G[-1][0][-F[26, {1}], F[Ind[4]], -V[Ind[6]]][NC[DiracMatrix[KI1[3]], PR]] == Cgen4
! G[-1][0][V[10], V[Ind[5]], V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexFtoFV6'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-12._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(6)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(5)*Mloop1*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(5)*Mloop1*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(5)*Mloop1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(5)*MO1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MIp(5)*MO1*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MIp(5)*MO1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(5)*MO1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(5)*MO1*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(4)*Mloop1*MO1*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(4)*Mloop1*MO1*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(4)*Mloop1*MO1*SCgenT1 &
 & + 24._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop1*MO1p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*Mloop1*MO1p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop1*MO1p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(3)*MO1p(3)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr4*MIp(3)*MO1p(3)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(3)*MO1p(3)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(3)*MO1p(3)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(3)*MO1p(3)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(3)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop1*MO1p(3)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop1*MO1p(3)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(4)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*MO1p(5)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MI*MO1p(5)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MI*MO1p(5)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MI*MO1p(5)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MI*MO1p(5)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(5)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*Mloop1*MO1p(5)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*Mloop1*MO1p(5)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MO1p(6)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(3)*Mloop1*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr3*MIp(3)*Mloop1*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(3)*Mloop1*MO2p(2)*SCgenT1 &
 & + 72._dp*Cgen2*Cgen4*Cgen5*Cnr2*MI*MO1*MO2p(2)*SCgenT1 &
 & + 7._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr4*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 13._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 16._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(3)*MO1*MO2p(2)*SCgenT1 &
 & + 15._dp*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 7._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 7._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 15._dp*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 13._dp*Cgen2*Cgen4*Cgen5*Cnr3*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 16._dp*Cgen2*Cgen4*Cgen5*Cnr4*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen2*Cgen4*Cgen5*Cnr5*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 7._dp*Cgen2*Cgen4*Cgen5*Cnr6*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr7*MI*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr6*Mloop1*MO1p(3)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 24._dp*Cgen1*Cgen3*Cgen5*Cnr2*MO2p(4)*SCgenT1 &
 & + 7._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr1*MI*Mloop1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MI*Mloop1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MI*Mloop1*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MI*MO1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MI*MO1*MO2p(4)*SCgenT1 &
 & + (-16._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MI*MO1*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MI*MO1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MI*MO1*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*Mloop1*MO1*MO2p(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 7._dp*Cgen1*Cgen3*Cgen5*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO2p(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MO2p(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MO2p(6)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(6)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MIp(6)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(6)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(6)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(5)*Mloop1*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(5)*Mloop1*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(5)*Mloop1*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(5)*MO1*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(5)*MO1*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(5)*MO1*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(5)*MO1*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(5)*MO1*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*MO1*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(4)*Mloop1*MO1*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(4)*Mloop1*MO1*SCgenT2 &
 & + 24._dp*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO1p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(4)*MO1p(2)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MIp(4)*MO1p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(4)*MO1p(2)*SCgenT2 &
 & + 5._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(4)*MO1p(2)*SCgenT2 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(4)*MO1p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr1*MIp(3)*Mloop1*MO1p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*MIp(3)*Mloop1*MO1p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(3)*Mloop1*MO1p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*MO1p(3)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(3)*MO1p(3)*SCgenT2 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(3)*MO1p(3)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(3)*MO1p(3)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(3)*MO1p(3)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(3)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1p(3)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1p(3)*SCgenT2 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MO1p(4)*SCgenT2 &
 & + 5._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO1p(4)*SCgenT2 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr4*MIp(2)*MO1p(4)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*MO1p(4)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*MO1p(4)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO1p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO1p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MI*Mloop1*MO1p(4)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1p(5)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MI*MO1p(5)*SCgenT2 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1p(5)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1p(5)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MI*MO1p(5)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(5)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(5)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(5)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MO1p(6)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MO1p(6)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MO1p(6)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MO1p(6)*SCgenT2 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(4)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(4)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(3)*Mloop1*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*MIp(3)*Mloop1*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(3)*Mloop1*MO2p(2)*SCgenT2 &
 & + 72._dp*Cgen1*Cgen3*Cgen5*Cnr2*MI*MO1*MO2p(2)*SCgenT2 &
 & + 7._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 20._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 13._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 16._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(3)*MO1*MO2p(2)*SCgenT2 &
 & + 15._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1*MO2p(2)*SCgenT2 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 7._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 7._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 15._dp*Cgen1*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr6*MI*Mloop1*MO1p(2)*MO2p(2)*SCgenT2 &
 & + 13._dp*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 16._dp*Cgen1*Cgen3*Cgen5*Cnr4*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 20._dp*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 7._dp*Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr7*MI*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(3)*MO2p(2)*SCgenT2 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MO1p(4)*MO2p(2)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr5*MO1p(4)*MO2p(2)*SCgenT2 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MO1p(4)*MO2p(2)*SCgenT2 &
 & + 24._dp*Cgen2*Cgen4*Cgen5*Cnr2*MO2p(4)*SCgenT2 &
 & + 7._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*MO2p(4)*SCgenT2 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen1*Cgen4*Cgen5*Cnr1*MI*Mloop1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MI*Mloop1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MI*Mloop1*MO2p(4)*SCgenT2 &
 & + (-5._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MI*MO1*MO2p(4)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MI*MO1*MO2p(4)*SCgenT2 &
 & + (-16._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MI*MO1*MO2p(4)*SCgenT2 &
 & + (-5._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MI*MO1*MO2p(4)*SCgenT2 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MI*MO1*MO2p(4)*SCgenT2 &
 & + 6._dp*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr3*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen5*Cnr6*Mloop1*MO1*MO2p(4)*SCgenT2 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr3*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr5*MO1p(2)*MO2p(4)*SCgenT2 &
 & + 7._dp*Cgen2*Cgen4*Cgen5*Cnr6*MO1p(2)*MO2p(4)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MO2p(6)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MO2p(6)*SCgenT2 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MO2p(6)*SCgenT2

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexFtoFV6


 Subroutine VertexStoSS1(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(F(Ind(5)),Loop).eq.Mloop2
! Mass(F(Ind(6)),Loop).eq.Mloop3
! G[1][0][-F[Ind[4]], -F[Ind[5]], S[10, {1}]][NonCommutative[PL]] == Cgen1
! G[1][0][-F[Ind[4]], -F[Ind[5]], S[10, {1}]][NonCommutative[PR]] == Cgen2
! G[1][0][F[Ind[5]], F[Ind[6]], S[12, {1}]][NonCommutative[PL]] == Cgen3
! G[1][0][F[Ind[5]], F[Ind[6]], S[12, {1}]][NonCommutative[PR]] == Cgen4
! G[1][0][-F[Ind[6]], F[Ind[4]], -S[11, {1}]][NonCommutative[PL]] == Cgen5
! G[1][0][-F[Ind[6]], F[Ind[4]], -S[11, {1}]][NonCommutative[PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-8._dp)*Cgen1*Cgen4*Cgen5*Cnr2*Mloop1*SCgenT1 &
 & + (-8._dp)*Cgen2*Cgen3*Cgen6*Cnr2*Mloop1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*MIp(2)*Mloop1*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr1*MIp(2)*Mloop1*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop1*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop1*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop1*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop1*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop1*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop1*SCgenT1 &
 & + (-8._dp)*Cgen2*Cgen4*Cgen5*Cnr2*Mloop2*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen3*Cgen6*Cnr2*Mloop2*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop2*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop2*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop2*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop2*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop2*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop2*SCgenT1 &
 & + (-8._dp)*Cgen2*Cgen3*Cgen5*Cnr2*Mloop3*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen4*Cgen6*Cnr2*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr7*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr7*MIp(2)*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*Mloop3*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr1*Mloop1*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr3*Mloop1*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr3*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr4*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr4*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*Mloop1*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*Mloop1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr3*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr4*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr4*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr5*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr5*Mloop2*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr3*Mloop3*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr3*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr4*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr4*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr5*Mloop3*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr1*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr1*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr3*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr3*Mloop1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr5*Mloop1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr5*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr6*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr6*Mloop1*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr5*Mloop2*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr5*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr3*Mloop3*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr3*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr5*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen6*Cnr5*Mloop3*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS1


 Subroutine VertexStoSS2(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(S(Ind(6)),Loop).eq.Mloop3
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen1
! G[1][0][-S[11, {1}], S[Ind[4]], -S[Ind[6]]][1] == Cgen2
! G[1][0][S[12, {1}], S[Ind[5]], S[Ind[6]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS2'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*Cgen2*Cgen3*Cnr1*SCgenT1

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS2


 Subroutine VertexStoSS3(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(U(Ind(4)),Loop).eq.Mloop1
! Mass(U(Ind(5)),Loop).eq.Mloop2
! Mass(U(Ind(6)),Loop).eq.Mloop3
! G[1][0][S[10, {1}], -U[Ind[4]], -U[Ind[5]]][1] == Cgen1
! G[1][0][-S[11, {1}], -U[Ind[6]], U[Ind[4]]][1] == Cgen2
! G[1][0][S[12, {1}], U[Ind[5]], U[Ind[6]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS3'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*SCgenT1

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS3


 Subroutine VertexStoSS4(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][-S[11, {1}], V[Ind[4]], -V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[12, {1}], V[Ind[5]], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS4'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*SCgenT1

  InMsquared = InMsquared/(2._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS4


 Subroutine VertexStoSS5(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-S[11, {1}], S[Ind[4]], -V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[12, {1}], S[Ind[5]], V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS5'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 4._dp*Cgen1*Cgen2*Cgen3*Cnr2*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS5


 Subroutine VertexStoSS6(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[12, {1}], S[Ind[6]], V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][-S[11, {1}], S[Ind[4]], -S[Ind[6]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS6'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 4._dp*Cgen1*Cgen2*Cgen3*Cnr2*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS6


 Subroutine VertexStoSS7(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(5)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(4)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[5]], -V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][-S[11, {1}], -S[Ind[6]], V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][S[12, {1}], S[Ind[5]], S[Ind[6]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS7'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 4._dp*Cgen1*Cgen2*Cgen3*Cnr2*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(8._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS7


 Subroutine VertexStoSS8(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][-S[11, {1}], S[Ind[4]], -V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][S[12, {1}], V[Ind[5]], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS8'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr2*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS8


 Subroutine VertexStoSS9(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(5)),Loop).eq.Mloop1
! Mass(V(Ind(4)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[5]], -V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[12, {1}], S[Ind[5]], V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][-S[11, {1}], V[Ind[4]], -V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS9'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr2*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*SCgenT1 &
 & + (-7._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS9


 Subroutine VertexStoSS10(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(6)),Loop).eq.Mloop1
! Mass(V(Ind(4)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][-S[11, {1}], -S[Ind[6]], V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[12, {1}], S[Ind[6]], V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS10'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr2*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*SCgenT1 &
 & + (-7._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(2)*SCgenT1

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS10


 Subroutine VertexStoSS11(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen1
! G[1][0][-S[11, {1}], S[12, {1}], S[Ind[4]], S[Ind[5]]][1] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS11'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MIp(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*SCgenT1

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS11


 Subroutine VertexStoSS12(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][-S[11, {1}], S[12, {1}], V[Ind[4]], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS12'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MIp(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*SCgenT1

  InMsquared = InMsquared/(4._dp*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS12


 Subroutine VertexStoSS13(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! G[1][0][-S[11, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen1
! G[1][0][S[10, {1}], S[12, {1}], S[Ind[4]], S[Ind[5]]][1] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS13'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO1p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*SCgenT1

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS13


 Subroutine VertexStoSS14(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[1][0][-S[11, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][S[10, {1}], S[12, {1}], V[Ind[4]], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS14'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO1p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*SCgenT1

  InMsquared = InMsquared/(4._dp*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS14


 Subroutine VertexStoSS15(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! G[1][0][S[12, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen1
! G[1][0][S[10, {1}], -S[11, {1}], S[Ind[4]], S[Ind[5]]][1] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS15'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO2p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*SCgenT1

  InMsquared = InMsquared/(16._dp*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS15


 Subroutine VertexStoSS16(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[1][0][S[12, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][S[10, {1}], -S[11, {1}], V[Ind[4]], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSS16'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO2p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*SCgenT1

  InMsquared = InMsquared/(4._dp*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSS16


 Subroutine VertexStoSV1(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(F(Ind(5)),Loop).eq.Mloop2
! Mass(F(Ind(6)),Loop).eq.Mloop3
! G[-1][0][F[Ind[5]], F[Ind[6]], V[10]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][F[Ind[5]], F[Ind[6]], V[10]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[1][0][-F[Ind[4]], -F[Ind[5]], S[10, {1}]][NonCommutative[PL]] == Cgen3
! G[1][0][-F[Ind[4]], -F[Ind[5]], S[10, {1}]][NonCommutative[PR]] == Cgen4
! G[1][0][-F[Ind[6]], F[Ind[4]], -S[11]][NonCommutative[PL]] == Cgen5
! G[1][0][-F[Ind[6]], F[Ind[4]], -S[11]][NonCommutative[PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 Complex(dp) :: Cnr8
 Complex(dp) :: Cnr9
 Complex(dp) :: Cnr10
 Complex(dp) :: Cnr11
 Complex(dp) :: Cnr12
 Complex(dp) :: Cnr13
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C001",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C002",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C111",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr8 = Cget("C112",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr9 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr10 = Cget("C122",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr11 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr12 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr13 = Cget("C222",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 8._dp*Cgen2*Cgen4*Cgen5*Cnr2*MIp(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen6*Cnr2*MIp(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr3*MIp(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr3*MIp(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr4*MIp(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr4*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr10*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr10*MIp(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr11*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr11*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr12*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr12*MIp(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr13*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr13*MIp(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr8*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr8*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr9*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr9*MIp(6)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr1*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr11*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr11*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr5*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr5*MIp(4)*Mloop1*Mloop2*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*Mloop3*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*MIp(4)*Mloop1*Mloop3*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr11*MIp(4)*Mloop1*Mloop3*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr11*MIp(4)*Mloop1*Mloop3*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr5*MIp(4)*Mloop1*Mloop3*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr5*MIp(4)*Mloop1*Mloop3*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr11*MIp(4)*Mloop2*Mloop3*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr11*MIp(4)*Mloop2*Mloop3*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*MIp(4)*Mloop2*Mloop3*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*MIp(4)*Mloop2*Mloop3*SCgenT1 &
 & + (-16._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen3*Cgen6*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen6*Cnr4*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr10*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen6*Cnr10*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr11*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr11*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr12*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr12*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr13*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr13*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr9*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr9*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr11*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr11*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop1*Mloop2*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr11*MIp(2)*Mloop1*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr11*MIp(2)*Mloop1*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop1*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop1*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr11*MIp(2)*Mloop2*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr11*MIp(2)*Mloop2*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop2*Mloop3*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop2*Mloop3*MO1p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr2*MO1p(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen6*Cnr2*MO1p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr3*MO1p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr3*MO1p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr4*MO1p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr4*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr11*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr11*MIp(2)*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr12*MIp(2)*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr12*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr13*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr13*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr8*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen6*Cnr8*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr9*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr9*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr11*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr11*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr5*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr5*Mloop1*Mloop2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr11*Mloop1*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr11*Mloop1*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr5*Mloop1*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr5*Mloop1*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr11*Mloop2*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr11*Mloop2*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*Mloop2*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*Mloop2*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr10*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr10*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr5*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr5*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr6*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr6*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr8*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr8*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr9*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr9*MO1p(6)*SCgenT1 &
 & + (-16._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen3*Cgen6*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen6*Cnr4*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-5._dp)*Cgen2*Cgen4*Cgen5*Cnr10*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen3*Cgen6*Cnr10*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr11*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr11*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr12*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr12*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr13*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr13*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr8*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen6*Cnr8*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen4*Cgen5*Cnr9*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen3*Cgen6*Cnr9*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr11*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr11*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop1*Mloop2*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr11*MIp(2)*Mloop1*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr11*MIp(2)*Mloop1*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop1*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop1*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr11*MIp(2)*Mloop2*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr11*MIp(2)*Mloop2*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop2*Mloop3*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop2*Mloop3*MO2p(2)*SCgenT1 &
 & + (-16._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen3*Cgen6*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen3*Cgen6*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr10*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr10*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr11*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr11*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr12*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr12*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr13*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr13*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr8*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr8*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr9*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr9*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr11*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr11*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen5*Cnr5*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen6*Cnr5*Mloop1*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr11*Mloop1*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr11*Mloop1*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr5*Mloop1*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr5*Mloop1*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr11*Mloop2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr11*Mloop2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen4*Cgen5*Cnr5*Mloop2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen3*Cgen6*Cnr5*Mloop2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen4*Cgen5*Cnr10*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen6*Cnr10*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-5._dp)*Cgen2*Cgen4*Cgen5*Cnr8*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen3*Cgen6*Cnr8*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen4*Cgen5*Cnr9*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen3*Cgen6*Cnr9*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr2*MO2p(4)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen6*Cnr2*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr3*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr3*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr4*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr4*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr10*MIp(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen6*Cnr10*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr11*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr11*MIp(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr12*MIp(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr12*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr13*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr13*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen5*Cnr8*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen6*Cnr8*MIp(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr9*MIp(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr9*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr11*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr11*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen5*Cnr5*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen6*Cnr5*Mloop1*Mloop2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr11*Mloop1*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr11*Mloop1*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr5*Mloop1*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr5*Mloop1*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr11*Mloop2*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr11*Mloop2*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*Mloop2*Mloop3*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*Mloop2*Mloop3*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen5*Cnr10*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen6*Cnr10*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr8*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen6*Cnr8*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen2*Cgen4*Cgen5*Cnr9*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen3*Cgen6*Cnr9*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr10*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr10*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr8*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr8*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr9*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr9*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(8._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV1


 Subroutine VertexStoSV2(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(S(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[Ind[5]], S[Ind[6]], V[10]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][-S[11], S[Ind[4]], -S[Ind[6]]][1] == Cgen2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV2'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(8._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV2


 Subroutine VertexStoSV3(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(U(Ind(4)),Loop).eq.Mloop1
! Mass(U(Ind(5)),Loop).eq.Mloop2
! Mass(U(Ind(6)),Loop).eq.Mloop3
! G[1][0][-S[11], -U[Ind[6]], U[Ind[4]]][1] == Cgen1
! G[1][0][S[10, {1}], -U[Ind[4]], -U[Ind[5]]][1] == Cgen2
! G[1][0][U[Ind[5]], U[Ind[6]], V[10]][FV[Mom[1], KI1[3]]] == Cgen3
! G[1][0][U[Ind[5]], U[Ind[6]], V[10]][FV[Mom[2], KI1[3]]] == Cgen4
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV3'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr3*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr1*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr3*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV3


 Subroutine VertexStoSV4(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][V[10], V[Ind[5]], V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][-S[11], V[Ind[4]], -V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV4'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 3._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(8._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV4


 Subroutine VertexStoSV5(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-S[11], S[Ind[4]], -V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][S[Ind[5]], V[10], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV5'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV5


 Subroutine VertexStoSV6(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][-S[11], S[Ind[4]], -S[Ind[6]]][1] == Cgen2
! G[1][0][S[Ind[6]], V[10], V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV6'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV6


 Subroutine VertexStoSV7(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(5)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(4)),Loop).eq.Mloop3
! G[-1][0][-S[11], -S[Ind[6]], V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[Ind[5]], S[Ind[6]], V[10]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[-1][0][S[10, {1}], -S[Ind[5]], -V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 Complex(dp) :: Cnr8
 Complex(dp) :: Cnr9
 Complex(dp) :: Cnr10
 Complex(dp) :: Cnr11
 Complex(dp) :: Cnr12
 Complex(dp) :: Cnr13
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV7'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr3 = Cget("C001",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr4 = Cget("C002",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr5 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr6 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr7 = Cget("C111",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr8 = Cget("C112",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr9 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr10 = Cget("C122",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr11 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr12 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr13 = Cget("C222",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 8._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr10*MIp(6)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr11*MIp(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr12*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr13*MIp(6)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr8*MIp(6)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr9*MIp(6)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr10*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-7._dp)*Cgen1*Cgen2*Cgen3*Cnr11*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-7._dp)*Cgen1*Cgen2*Cgen3*Cnr12*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr13*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen2*Cgen3*Cnr9*MIp(4)*MO1p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr11*MIp(2)*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr12*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr13*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-7._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-7._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr8*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen2*Cgen3*Cnr9*MIp(2)*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr10*MO1p(6)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr11*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr12*MO1p(6)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr8*MO1p(6)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr9*MO1p(6)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen2*Cgen3*Cnr10*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-13._dp)*Cgen1*Cgen2*Cgen3*Cnr11*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen2*Cgen3*Cnr12*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr13*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr8*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-13._dp)*Cgen1*Cgen2*Cgen3*Cnr9*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr10*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen2*Cgen3*Cnr11*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr12*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr13*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr8*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-14._dp)*Cgen1*Cgen2*Cgen3*Cnr9*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr10*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen2*Cgen3*Cnr11*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr12*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-13._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen2*Cgen3*Cnr8*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-13._dp)*Cgen1*Cgen2*Cgen3*Cnr9*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr4*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr10*MIp(2)*MO2p(4)*SCgenT1 &
 & + 11._dp*Cgen1*Cgen2*Cgen3*Cnr11*MIp(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr12*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr13*MIp(2)*MO2p(4)*SCgenT1 &
 & + 9._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr8*MIp(2)*MO2p(4)*SCgenT1 &
 & + 11._dp*Cgen1*Cgen2*Cgen3*Cnr9*MIp(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr10*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 9._dp*Cgen1*Cgen2*Cgen3*Cnr11*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr12*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 11._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr8*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 11._dp*Cgen1*Cgen2*Cgen3*Cnr9*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr10*MO2p(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr11*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr12*MO2p(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr8*MO2p(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr9*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(8._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV7


 Subroutine VertexStoSV8(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-S[11], S[Ind[4]], -V[Ind[6]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[-1][0][V[10], V[Ind[5]], V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV8'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(6)*SCgenT1 &
 & + (-24._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(6)*SCgenT1 &
 & + (-24._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-24._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(4)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV8


 Subroutine VertexStoSV9(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(5)),Loop).eq.Mloop1
! Mass(V(Ind(4)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[5]], -V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][-S[11], V[Ind[4]], -V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[Ind[5]], V[10], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV9'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV9


 Subroutine VertexStoSV10(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(6)),Loop).eq.Mloop1
! Mass(V(Ind(4)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][-S[11], -S[Ind[6]], V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][S[Ind[6]], V[10], V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV10'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr2 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV10


 Subroutine VertexStoSV11(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][-S[11], S[Ind[4]], V[10], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 Complex(dp) :: Bnr2
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV11'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MIp(2),Mloop1p(2),Mloop2p(2))
 Bnr2 = B1(MIp(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Bnr1*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Bnr2*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Bnr2*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + Bnr1*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Bnr2*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Bnr2*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Bnr2*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Bnr1*Cgen1*Cgen2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Bnr2*Cgen1*Cgen2*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV11


 Subroutine VertexStoSV12(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[-1][0][-S[11], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[1][0][S[10, {1}], S[Ind[4]], V[10], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 Complex(dp) :: Bnr2
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoSV12'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO1p(2),Mloop1p(2),Mloop2p(2))
 Bnr2 = B1(MO1p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + Bnr2*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Bnr2*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + Bnr2*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Bnr2*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Bnr2*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen2*MO2p(4)*SCgenT1 &
 & + Bnr2*Cgen1*Cgen2*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO2p(2)*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoSV12


 Subroutine VertexStoVV1(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,Cgen6,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(F(Ind(4)),Loop).eq.Mloop1
! Mass(F(Ind(5)),Loop).eq.Mloop2
! Mass(F(Ind(6)),Loop).eq.Mloop3
! G[-1][0][F[Ind[5]], F[Ind[6]], V[11]][NC[DiracMatrix[KI1[3]], PL]] == Cgen1
! G[-1][0][F[Ind[5]], F[Ind[6]], V[11]][NC[DiracMatrix[KI1[3]], PR]] == Cgen2
! G[-1][0][-F[Ind[6]], F[Ind[4]], -V[10]][NC[DiracMatrix[KI1[3]], PL]] == Cgen3
! G[-1][0][-F[Ind[6]], F[Ind[4]], -V[10]][NC[DiracMatrix[KI1[3]], PR]] == Cgen4
! G[1][0][-F[Ind[4]], -F[Ind[5]], S[10, {1}]][NonCommutative[PL]] == Cgen5
! G[1][0][-F[Ind[4]], -F[Ind[5]], S[10, {1}]][NonCommutative[PR]] == Cgen6
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5, Cgen6 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV1'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*Mloop1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr2*MIp(4)*Mloop1*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr2*MIp(4)*Mloop2*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr2*MIp(4)*Mloop2*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr2*MIp(4)*Mloop3*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr2*MIp(4)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(6)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(6)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(6)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(6)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(6)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(6)*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*Mloop2*Mloop3*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr1*MIp(4)*Mloop1*Mloop2*Mloop3*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*Mloop1*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr2*MIp(2)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr3*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr4*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr4*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr5*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr6*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*MIp(4)*Mloop1*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*Mloop2*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr2*MIp(2)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr4*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr4*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr5*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*MIp(4)*Mloop2*MO1p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*Mloop3*MO1p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen3*Cgen6*Cnr2*MIp(2)*Mloop3*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr6*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr7*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr7*MIp(4)*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*Mloop3*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*Mloop1*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr2*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr4*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr7*MIp(2)*Mloop1*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr2*Mloop2*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr2*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr4*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop2*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr2*Mloop3*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr2*Mloop3*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr4*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr4*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*Mloop3*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*Mloop3*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr3*Mloop1*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr4*Mloop1*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr4*Mloop1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr5*Mloop1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr5*Mloop1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*Mloop1*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*Mloop1*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr4*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr4*Mloop2*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr5*Mloop2*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr5*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*Mloop2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*Mloop2*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr3*Mloop3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr3*Mloop3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*Mloop3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*Mloop3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr5*Mloop3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr5*Mloop3*MO1p(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*Mloop1*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr2*MIp(2)*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr6*MIp(4)*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr6*MIp(4)*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*MIp(4)*Mloop1*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*MIp(4)*Mloop1*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen5*Cnr2*MIp(2)*Mloop2*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen6*Cnr2*MIp(2)*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*MIp(4)*Mloop2*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*MIp(4)*Mloop2*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen4*Cgen5*Cnr2*MIp(2)*Mloop3*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen3*Cgen6*Cnr2*MIp(2)*Mloop3*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen4*Cgen5*Cnr5*MIp(4)*Mloop3*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen3*Cgen6*Cnr5*MIp(4)*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr6*MIp(4)*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr6*MIp(4)*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr7*MIp(4)*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr7*MIp(4)*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*Mloop2*Mloop3*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*Mloop2*Mloop3*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen1*Cgen3*Cgen5*Cnr2*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen2*Cgen4*Cgen6*Cnr2*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen6*Cnr1*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr3*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr4*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr5*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen6*Cnr5*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen6*Cnr7*MIp(2)*Mloop1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen2*Cgen4*Cgen5*Cnr2*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen1*Cgen3*Cgen6*Cnr2*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr4*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr4*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-40._dp)*Cgen1*Cgen4*Cgen5*Cnr2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-40._dp)*Cgen2*Cgen3*Cgen6*Cnr2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr3*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr3*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen4*Cgen5*Cnr4*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen3*Cgen6*Cnr4*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*Mloop3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 14._dp*Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 14._dp*Cgen2*Cgen4*Cgen6*Cnr3*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen3*Cgen5*Cnr4*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen2*Cgen4*Cgen6*Cnr4*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen5*Cnr5*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen6*Cnr5*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr7*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr7*Mloop1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen2*Cgen4*Cgen5*Cnr3*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen3*Cgen6*Cnr3*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen2*Cgen4*Cgen5*Cnr4*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen3*Cgen6*Cnr4*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen2*Cgen4*Cgen5*Cnr5*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 8._dp*Cgen1*Cgen3*Cgen6*Cnr5*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr7*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr7*Mloop2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr3*Mloop3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr3*Mloop3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen4*Cgen5*Cnr4*Mloop3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen3*Cgen6*Cnr4*Mloop3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen4*Cgen5*Cnr5*Mloop3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-9._dp)*Cgen2*Cgen3*Cgen6*Cnr5*Mloop3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen5*Cnr2*Mloop1*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen6*Cnr2*Mloop1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr6*MIp(2)*Mloop1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr6*MIp(2)*Mloop1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr7*MIp(2)*Mloop1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen6*Cnr7*MIp(2)*Mloop1*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen2*Cgen4*Cgen5*Cnr2*Mloop2*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen6*Cnr2*Mloop2*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen2*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop2*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop2*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen4*Cgen5*Cnr2*Mloop3*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen3*Cgen6*Cnr2*Mloop3*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen4*Cgen5*Cnr5*MIp(2)*Mloop3*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen2*Cgen3*Cgen6*Cnr5*MIp(2)*Mloop3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr6*MIp(2)*Mloop3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr6*MIp(2)*Mloop3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr7*MIp(2)*Mloop3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr7*MIp(2)*Mloop3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen5*Cnr1*Mloop1*Mloop2*Mloop3*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen6*Cnr1*Mloop1*Mloop2*Mloop3*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen3*Cgen5*Cnr1*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen2*Cgen4*Cgen6*Cnr1*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen5*Cnr3*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen2*Cgen4*Cgen6*Cnr3*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr4*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr4*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen3*Cgen5*Cnr5*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen4*Cgen6*Cnr5*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-6._dp)*Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr7*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen6*Cnr7*Mloop1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr3*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr3*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr4*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr4*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-10._dp)*Cgen2*Cgen4*Cgen5*Cnr5*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen3*Cgen6*Cnr5*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen2*Cgen4*Cgen5*Cnr6*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen3*Cgen6*Cnr6*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen4*Cgen5*Cnr7*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen6*Cnr7*Mloop2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen4*Cgen5*Cnr3*Mloop3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 5._dp*Cgen2*Cgen3*Cgen6*Cnr3*Mloop3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen4*Cgen5*Cnr4*Mloop3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen2*Cgen3*Cgen6*Cnr4*Mloop3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 9._dp*Cgen1*Cgen4*Cgen5*Cnr5*Mloop3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 9._dp*Cgen2*Cgen3*Cgen6*Cnr5*Mloop3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr6*Mloop1*MO2p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr6*Mloop1*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr7*Mloop1*MO2p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen6*Cnr7*Mloop1*MO2p(6)*SCgenT1 &
 & + Cgen2*Cgen4*Cgen5*Cnr7*Mloop2*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen6*Cnr7*Mloop2*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen4*Cgen5*Cnr5*Mloop3*MO2p(6)*SCgenT1 &
 & + Cgen2*Cgen3*Cgen6*Cnr5*Mloop3*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV1


 Subroutine VertexStoVV2(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(S(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[Ind[4]], -S[Ind[6]], -V[10]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[Ind[5]], S[Ind[6]], V[11]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV2'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(16._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV2


 Subroutine VertexStoVV3(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,Cgen4,Cgen5,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(U(Ind(4)),Loop).eq.Mloop1
! Mass(U(Ind(5)),Loop).eq.Mloop2
! Mass(U(Ind(6)),Loop).eq.Mloop3
! G[1][0][S[10, {1}], -U[Ind[4]], -U[Ind[5]]][1] == Cgen1
! G[1][0][U[Ind[5]], U[Ind[6]], V[11]][FV[Mom[1], KI1[3]]] == Cgen2
! G[1][0][U[Ind[5]], U[Ind[6]], V[11]][FV[Mom[2], KI1[3]]] == Cgen3
! G[1][0][-U[Ind[6]], U[Ind[4]], -V[10]][FV[Mom[1], KI1[3]]] == Cgen4
! G[1][0][-U[Ind[6]], U[Ind[4]], -V[10]][FV[Mom[2], KI1[3]]] == Cgen5
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4, Cgen5 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV3'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr1*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr1*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr2*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr2*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr3*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr4*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr4*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen4*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen5*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen4*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen4*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen4*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr1*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen4*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr2*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr4*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr4*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen4*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen3*Cgen4*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen5*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen3*Cgen5*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen4*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen4*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen4*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen5*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen1*Cgen3*Cgen4*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen1*Cgen2*Cgen5*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen4*Cnr1*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen3*Cgen4*Cnr1*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen5*Cnr1*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen3*Cgen5*Cnr1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen4*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen3*Cgen4*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen5*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen4*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen4*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen5*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr2*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr2*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr2*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr2*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr3*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr3*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen4*Cnr4*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen3*Cgen4*Cnr4*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen5*Cnr4*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen3*Cgen5*Cnr4*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(64._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV3


 Subroutine VertexStoVV4(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][-V[10], V[Ind[4]], -V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen1
! G[-1][0][V[11], V[Ind[5]], V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV4'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = 36._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MIp(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + 14._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(6)*SCgenT1 &
 & + 14._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(6)*SCgenT1 &
 & + 14._dp*Cgen1*Cgen2*Cgen3*Cnr7*MIp(6)*SCgenT1 &
 & + (-72._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO1p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-34._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-36._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-38._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + 36._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + 26._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + 30._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + 34._dp*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(6)*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(6)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(6)*SCgenT1 &
 & + (-72._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-42._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-40._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-38._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO2p(2)*SCgenT1 &
 & + 360._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-50._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 60._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 60._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 60._dp*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 69._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 50._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 40._dp*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 46._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 28._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + 36._dp*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(4)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + 42._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + 38._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + 34._dp*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO2p(4)*SCgenT1 &
 & + 51._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-26._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-8._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + (-14._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(6)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(6)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(64._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV4


 Subroutine VertexStoVV5(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[1][0][S[Ind[4]], -V[10], -V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][S[Ind[5]], V[11], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV5'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(32._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV5


 Subroutine VertexStoVV6(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[-1][0][S[Ind[4]], -S[Ind[6]], -V[10]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][S[Ind[6]], V[11], V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV6'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr2 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr3 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 Cnr4 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop2p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr2*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(32._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV6


 Subroutine VertexStoVV7(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(5)),Loop).eq.Mloop1
! Mass(S(Ind(6)),Loop).eq.Mloop2
! Mass(V(Ind(4)),Loop).eq.Mloop3
! G[-1][0][S[Ind[5]], S[Ind[6]], V[11]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][S[10, {1}], -S[Ind[5]], -V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen2
! G[1][0][-S[Ind[6]], -V[10], V[Ind[4]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV7'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr4 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr5 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 Cnr6 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop3p(2),Mloop2p(2),Mloop1p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO1p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + 9._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO1p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO2p(2)*SCgenT1 &
 & + 9._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-9._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr4*MO2p(6)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(32._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV7


 Subroutine VertexStoVV8(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[4]], -V[Ind[5]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][V[11], V[Ind[5]], V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[Ind[4]], -V[10], -V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV8'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop1p(2),Mloop3p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(6)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO1p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(6)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-60._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 20._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-18._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 18._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-18._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 18._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-26._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-17._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-19._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-18._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-26._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 19._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 17._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(6)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MO2p(6)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(64._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV8


 Subroutine VertexStoVV9(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(5)),Loop).eq.Mloop1
! Mass(V(Ind(4)),Loop).eq.Mloop2
! Mass(V(Ind(6)),Loop).eq.Mloop3
! G[-1][0][S[10, {1}], -S[Ind[5]], -V[Ind[4]]][FV[Mom[1] - Mom[2], KI1[3]]] == Cgen1
! G[-1][0][-V[10], V[Ind[4]], -V[Ind[6]]][FV[-Mom[1] + Mom[2], KI1[3]]*MT[KI1[1], KI1[2]] + FV[Mom[1] - Mom[3], KI1[2]]*MT[KI1[1], KI1[3]] + FV[-Mom[2] + Mom[3], KI1[1]]*MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[Ind[5]], V[11], V[Ind[6]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 Complex(dp) :: Cnr2
 Complex(dp) :: Cnr3
 Complex(dp) :: Cnr4
 Complex(dp) :: Cnr5
 Complex(dp) :: Cnr6
 Complex(dp) :: Cnr7
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV9'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr2 = Cget("C00 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr3 = Cget("C1  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr4 = Cget("C11 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr5 = Cget("C12 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr6 = Cget("C2  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 Cnr7 = Cget("C22 ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop3p(2),Mloop1p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(6)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO1p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO1p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(4)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(4)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(4)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(4)*SCgenT1 &
 & + 7._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(6)*SCgenT1 &
 & + (-4._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(6)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(6)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(6)*SCgenT1 &
 & + (-5._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO1p(6)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 6._dp*Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*MO2p(2)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr3*MIp(4)*MO2p(2)*SCgenT1 &
 & + 3._dp*Cgen1*Cgen2*Cgen3*Cnr5*MIp(4)*MO2p(2)*SCgenT1 &
 & + 5._dp*Cgen1*Cgen2*Cgen3*Cnr6*MIp(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(4)*MO2p(2)*SCgenT1 &
 & + (-60._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-36._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-16._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr4*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-18._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-54._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-18._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-34._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-60._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-20._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-17._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-15._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(4)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO1p(4)*MO2p(2)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr2*MO2p(4)*SCgenT1 &
 & + (-6._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-12._dp)*Cgen1*Cgen2*Cgen3*Cnr3*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-3._dp)*Cgen1*Cgen2*Cgen3*Cnr5*MIp(2)*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MIp(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MIp(2)*MO2p(4)*SCgenT1 &
 & + 38._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 12._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO1p(2)*MO2p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr4*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 19._dp*Cgen1*Cgen2*Cgen3*Cnr5*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 21._dp*Cgen1*Cgen2*Cgen3*Cnr6*MO1p(2)*MO2p(4)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr7*MO1p(2)*MO2p(4)*SCgenT1 &
 & + 2._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO2p(6)*SCgenT1 &
 & + 4._dp*Cgen1*Cgen2*Cgen3*Cnr3*MO2p(6)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr5*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr6*MO2p(6)*SCgenT1 &
 & + (-1._dp)*Cgen1*Cgen2*Cgen3*Cnr7*MO2p(6)*SCgenT1

  InMsquared = InMsquared/(64._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV9


 Subroutine VertexStoVV10(MI,MO1,MO2,Mloop1,Mloop2,Mloop3,Cgen1,Cgen2,Cgen3,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(6)),Loop).eq.Mloop1
! Mass(V(Ind(4)),Loop).eq.Mloop2
! Mass(V(Ind(5)),Loop).eq.Mloop3
! G[1][0][-S[Ind[6]], -V[10], V[Ind[4]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][S[Ind[6]], V[11], V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen3
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2, Mloop3 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Cnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8),Mloop3p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV10'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Mloop3p(1) = Mloop3
 Do i1=2,8
 Mloop3p(i1) = Mloop3 * Mloop3p(i1-1)
 End Do

 Cnr1 = Cget("C0  ",MO1p(2),MO2p(2),MIp(2),Mloop2p(2),Mloop1p(2),Mloop3p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Cgen1*Cgen2*Cgen3*Cnr1*MIp(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO1p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Cgen1*Cgen2*Cgen3*Cnr1*MIp(2)*MO2p(2)*SCgenT1 &
 & + 10._dp*Cgen1*Cgen2*Cgen3*Cnr1*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Cgen1*Cgen2*Cgen3*Cnr1*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(32._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = REAL(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV10


 Subroutine VertexStoVV11(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(S(Ind(5)),Loop).eq.Mloop2
! G[1][0][S[10, {1}], -S[Ind[4]], -S[Ind[5]]][1] == Cgen1
! G[1][0][S[Ind[4]], S[Ind[5]], -V[10], V[11]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV11'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MIp(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Bnr1*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen2*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(64._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV11


 Subroutine VertexStoVV12(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,Cgen3,Cgen4,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(V(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[1][0][S[10, {1}], -V[Ind[4]], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][-V[10], V[11], V[Ind[4]], V[Ind[5]]][MT[KI1[1], KI1[4]]*MT[KI1[2], KI1[3]]] == Cgen2
! G[1][0][-V[10], V[11], V[Ind[4]], V[Ind[5]]][MT[KI1[1], KI1[3]]*MT[KI1[2], KI1[4]]] == Cgen3
! G[1][0][-V[10], V[11], V[Ind[4]], V[Ind[5]]][MT[KI1[1], KI1[2]]*MT[KI1[3], KI1[4]]] == Cgen4
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2, Cgen3, Cgen4 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV12'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MIp(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = (-1._dp)*Bnr1*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen3*MIp(4)*SCgenT1 &
 & + (-4._dp)*Bnr1*Cgen1*Cgen4*MIp(4)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen3*MIp(2)*MO1p(2)*SCgenT1 &
 & + 8._dp*Bnr1*Cgen1*Cgen4*MIp(2)*MO1p(2)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen3*MO1p(4)*SCgenT1 &
 & + (-4._dp)*Bnr1*Cgen1*Cgen4*MO1p(4)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 2._dp*Bnr1*Cgen1*Cgen3*MIp(2)*MO2p(2)*SCgenT1 &
 & + 8._dp*Bnr1*Cgen1*Cgen4*MIp(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Bnr1*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-10._dp)*Bnr1*Cgen1*Cgen3*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-40._dp)*Bnr1*Cgen1*Cgen4*MO1p(2)*MO2p(2)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen2*MO2p(4)*SCgenT1 &
 & + (-1._dp)*Bnr1*Cgen1*Cgen3*MO2p(4)*SCgenT1 &
 & + (-4._dp)*Bnr1*Cgen1*Cgen4*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(64._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV12


 Subroutine VertexStoVV13(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[1][0][-S[Ind[4]], -V[10], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][S[10, {1}], S[Ind[4]], V[11], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV13'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO1p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Bnr1*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + Bnr1*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 10._dp*Bnr1*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Bnr1*Cgen1*Cgen2*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(32._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV13


 Subroutine VertexStoVV14(MI,MO1,MO2,Mloop1,Mloop2,Cgen1,Cgen2,CgenT1,CgenT2,OutRMsquared)

! calculates RMsquared = 2*Re(Mloop*Mtree^*) for Mloop
! containing the following internal particles and couplings:
!
! Mass(S(Ind(4)),Loop).eq.Mloop1
! Mass(V(Ind(5)),Loop).eq.Mloop2
! G[1][0][-S[Ind[4]], V[11], -V[Ind[5]]][MT[KI1[2], KI1[3]]] == Cgen1
! G[1][0][S[10, {1}], S[Ind[4]], -V[10], V[Ind[5]]][MT[KI1[3], KI1[4]]] == Cgen2
!
! in 't Hooft-Feynman gauge.
! This result is based on constrained differential renormalization
! (see hep-ph/9806451 for more information) and was produced
! using FeynArts and FormCalc.
!-------------------------------------------------------------
! This routine was generated automatically on
! Thu 8 Mar 2012 - Stefan Liebler
!-------------------------------------------------------------

 Implicit None

!Variables:
 Complex(dp),Intent(in) :: CgenT1, CgenT2, Cgen1, Cgen2 

 Real(dp),Intent(in) :: MI, MO1, MO2, Mloop1, Mloop2 

 Complex(dp) ::  SCgenT1, SCgenT2

 Complex(dp) :: InMsquared

 Real(dp),Intent(out) :: OutRMsquared

 Complex(dp) :: Bnr1
 
 Integer :: i1
 Real(dp) :: MO1p(8), MO2p(8), MIp(8),Mloop1p(8),Mloop2p(8)

 Iname=Iname+1
 NameOfUnit(Iname)='VertexStoVV14'

 SCgenT1=Conjg(CgenT1)
 SCgenT2=Conjg(CgenT2)

 MO1p(1) = MO1
 Do i1=2,8
 MO1p(i1) = MO1 * MO1p(i1-1)
 End Do
 MIp(1) = MI
 Do i1=2,8
 MIp(i1) = MI * MIp(i1-1)
 End Do
 MO2p(1) = MO2
 Do i1=2,8
 MO2p(i1) = MO2 * MO2p(i1-1)
 End Do

 Mloop1p(1) = Mloop1
 Do i1=2,8
 Mloop1p(i1) = Mloop1 * Mloop1p(i1-1)
 End Do

 Mloop2p(1) = Mloop2
 Do i1=2,8
 Mloop2p(i1) = Mloop2 * Mloop2p(i1-1)
 End Do

 Bnr1 = B0(MO2p(2),Mloop1p(2),Mloop2p(2))
 
  InMsquared = (0._dp , 0._dp)

  InMsquared = Bnr1*Cgen1*Cgen2*MIp(4)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MIp(2)*MO1p(2)*SCgenT1 &
 & + Bnr1*Cgen1*Cgen2*MO1p(4)*SCgenT1 &
 & + (-2._dp)*Bnr1*Cgen1*Cgen2*MIp(2)*MO2p(2)*SCgenT1 &
 & + 10._dp*Bnr1*Cgen1*Cgen2*MO1p(2)*MO2p(2)*SCgenT1 &
 & + Bnr1*Cgen1*Cgen2*MO2p(4)*SCgenT1

  InMsquared = InMsquared/(32._dp*MO1p(2)*MO2p(2)*Pi2)

  OutRMsquared = -AIMAG(InMSquared)

  Iname = Iname - 1

End SubRoutine VertexStoVV14


End Module RMsquared
