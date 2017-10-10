Write(io_L,102) 1,1.*ErrorLevel,"# ErrorLevel"

If (SPA_convention) Then
Write(io_L,102) 2,1.,"# SPA_conventions"
Else
Write(io_L,102) 2,0.,"# SPA_conventions"
End if

If (L_BR) Then
Write(io_L,102) 11,1.,"# Branching ratios"
Else
Write(io_L,102) 11,0.,"# Branching ratios"
End if


If (Enable3BDecays) Then
Write(io_L,102) 13,1.,"# 3 Body decays"
Else
Write(io_L,102) 13,0.,"# 3 Body decays"
End if


Write(io_L,102) 31,m_GUT,"# GUT scale"

Write(io_L,102) 33,Q,"# Renormalization scale"

Write(io_L,102) 34,delta_mass,"# Precision"

Write(io_L,102) 35,1.*n_run,"# Iterations"


If (TwoLoopRGE) Then
Write(io_L,102) 38,2.,"# RGE level"
Else
Write(io_L,102) 38,1.,"# RGE level"
End if

Write(io_L,102) 40,Alpha,"# Alpha"

Write(io_L,102) 41,gamZ,"# Gamma_Z"

Write(io_L,102) 42,gamW,"# Gamma_W"

If (RotateNegativeFermionMasses) Then
Write(io_L,102) 50,1.,"# Rotate negative fermion masses"
Else
Write(io_L,102) 50,0.,"# Rotate negative fermion masses"
End if


If (SwitchToSCKM) Then
Write(io_L,102) 51,1.,"# Switch to SCKM matrix"
Else
Write(io_L,102) 51,0.,"# Switch to SCKM matrix"
End if


If (IgnoreNegativeMasses) Then
Write(io_L,102) 52,1.,"# Ignore negative masses"
Else
Write(io_L,102) 52,0.,"# Ignore negative masses"
End if


If (IgnoreNegativeMassesMZ) Then
Write(io_L,102) 53,1.,"# Ignore negative masses at MZ"
Else
Write(io_L,102) 53,0.,"# Ignore negative masses at MZ"
End if


If (CalculateOneLoopMasses) Then
Write(io_L,102) 55,1.,"# Calculate one loop masses"
Else
Write(io_L,102) 55,0.,"# Calculate one loop masses"
End if


If (CalculateTwoLoopHiggsMasses) Then
Write(io_L,102) 56,1.,"# Calculate two-loop Higgs masses"
Else
Write(io_L,102) 56,0.,"# Calculate two-loop Higgs masses"
End if

If (CalculateLowEnergy) Then
Write(io_L,102) 57,1.,"# Calculate low energy"
Else
Write(io_L,102) 57,0.,"# Calculate low energy"
End if

If (KineticMixing) Then
Write(io_L,102) 60,1.,"# Include kinetic mixing"
Else
Write(io_L,102) 60,0.,"# Include kinetic mixing"
End if

Write(io_L,102) 65,1.*SolutionTadpoleNr,"# Solution of tadpole equation"
 

