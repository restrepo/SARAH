Contains

 Complex(dp) Function vertexC0tilde(masa1c,masa2c,masa3c)
  Real(dp), Intent(in) :: masa1c,masa2c,masa3c
  Real(dp) :: rscale
  vertexC0tilde = 0._dp
  rscale = GetRenormalizationScale()  ! Adding dependence on renormalization scale
  If (masa2c.Eq.masa3c) Then

  vertexC0tilde=(masa1c*(masa1c-masa2c)-masa1c**2*Log(masa1c/rscale)       &
       & +(2._dp*masa1c-masa2c)*masa2c*Log(masa2c/rscale))/(masa1c-masa2c)**2

  Else

  vertexC0tilde=1._dp-1._dp/(masa2c-masa3c)*((masa1c**2*Log(masa1c/rscale)    &
       & -masa2c**2*Log(masa2c/rscale))/(masa1c-masa2c)-(masa1c**2*Log(masa1c/rscale) &
       & -masa3c**2*Log(masa3c/rscale))/(masa1c-masa3c))

  End If
End Function vertexC0tilde

 Complex(dp) Function vertexC11(masa1c,masa2c,masa3c)
   Real(dp), Intent(in) :: masa1c,masa2c,masa3c

   vertexC11 = 0._dp

   If (masa2c.Eq.masa3c) Then

   vertexC11=-(3._dp*masa1c**2-4._dp*masa1c*masa2c+masa2c**2 & 
        & -2._dp*masa1c**2*Log(masa1c/masa2c)) & 
        & /(2._dp*(masa1c-masa2c)**3)   

   Else

   vertexC11=masa1c*(masa1c**2/masa2c**2-masa1c/masa2c & 
        & -masa1c**2/masa3c**2+masa1c**3/(masa2c*masa3c**2) & 
        & +masa1c/masa3c-masa1c**3/(masa2c**2*masa3c) & 
        & +masa1c**2/masa3c**2*Log(masa1c/masa2c) & 
        & -2._dp*masa1c**3/(masa2c*masa3c**2)*Log(masa1c/masa2c) & 
        & -masa1c**2/masa2c**2*Log(masa1c/masa3c) & 
        & +2._dp*masa1c**3/(masa2c**2*masa3c)*Log(masa1c/masa3c) & 
        & -Log(masa2c/masa3c)+2._dp*masa1c/masa2c*Log(masa2c/masa3c) & 
        & +2._dp*masa1c/masa3c*Log(masa2c/masa3c) & 
        & -4._dp*masa1c**2/(masa2c*masa3c)*Log(masa2c/masa3c)) & 
        & /(2._dp*(1._dp-masa1c/masa2c)**2*masa2c  & 
        & *(1._dp-masa1c/masa3c)**2*(masa1c/masa2c-masa1c/masa3c) & 
        & *masa3c)

   End If

 End Function vertexC11

 Complex(dp) Function vertexC12(masa1c,masa2c,masa3c)
   Real(dp), Intent(in) :: masa1c,masa2c,masa3c

   vertexC12 = 0._dp

   If (masa2c.Eq.masa3c) Then

   vertexC12=-(3._dp*masa1c**2-4._dp*masa1c*masa2c+masa2c**2 & 
        & -2._dp*masa1c**2*Log(masa1c/masa2c)) & 
        & /(4._dp*(masa1c-masa2c)**3)   

   Else

   vertexC12=((masa1c-masa2c)*(masa1c-masa3c)*(masa2c-masa3c)*masa3c      & 
        & +masa1c**2*(masa2c**2*Log(masa1c/masa2c)+masa3c                 & 
        & *(-2._dp*masa2c+masa3c)*Log(masa1c/masa3c))                     & 
        & +masa2c**2*(2._dp*masa1c-masa3c)*masa3c*Log(masa2c/masa3c))     &
        & /(2._dp*(masa1c-masa2c)*(masa1c-masa3c)**2*(masa2c-masa3c)**2)

   End If

 End Function vertexC12