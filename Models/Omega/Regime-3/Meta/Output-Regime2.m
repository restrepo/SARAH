Mathematica 5.2 for Linux x86 (64 bit)
Copyright 1988-2005 Wolfram Research, Inc.
 -- Motif graphics initialized -- 

In[1]:= SARAH SARAHVERSION
by Florian Staub, 2011

Begin evaluation of Model with:       Start["Name of Model"]
e.g. Start["MSSM"] or Start["NMSSM","CKM"]

In[2]:= Initialization

Model file for the Omega Model loaded
Generate all Superfields
Checking Model Files ...
    Model File is okay
    Particle File is okay
    Parameter File is okay
Create all component Fields
Generate Parameter Dependences
Set Information for Rotations
Checking Anomalies
     No (hypercharge)^3 Gauge Anomaly
     No Witten Anomaly
     No (hypercharge)x(left)^2  Gauge Anomaly
     No (color)^3 Gauge Anomaly
     No (hypercharge)x(color)^2  Gauge Anomaly
Calc Superpotential
Checking charge conservation of superpotential
     No violation of charge conservation in superpotential
     No violation of R-Parity in superpotential
Calc F-Terms
Calc Fermion-Scalar
Calc Soft Breaking
Calc Kinetic Terms
Calc D-Terms
Calc Gaugino Interactions
Calculate Vector Boson Self Interactions
Calculate Vector Boson - Gaugino - Interactions
Calc Gauge Transformations
Calc Complete Lagrangian

-----------------------------------
Evolve States: GaugeES
-----------------------------------
Calc Mixings of Matter Fields
Calc Ghost Interactions
Save Model Information: GaugeES
      TadpoleEquations
      Interactions
      Split Lagrangian

-----------------------------------
Evolve States: EWSB
-----------------------------------
Parametrize Higgs Sector
Update Gauge Transformations
Update Gauge Transformations
Add Phases
Update Gauge Transformations
Calc Mixings of Matter Fields
Calc Mass Matrices
    For {SdL, SdR}
    For {SvL}
    For {SuL, SuR}
    For {SeL, SeR}
    For {phid, phiu}
    For {sigmad, sigmau}
    For {SHdm, conj[SHup]}
    For {fB, fW0, FHd0, FHu0}
    For {FvL}
    For {fWm, FHdm}{fWp, FHup}
    For {FeL}{conj[FeR]}
    For {FdL}{conj[FdR]}
    For {FuL}{conj[FuR]}
Update Gauge Transformations
Calculate Tadpole Equations
Calc Ghost Interactions
Save Model Information: EWSB
      TadpoleEquations
      Interactions
      Split Lagrangian

-----------------------------------
Finishing
-----------------------------------
Calculate final Lagrangian
Add Matrix Products
Checking for massless particles
Calculating Tree Level Masses
     For GaugeES
     For EWSB
Simplify Mass Matrices
Checking for Spectrum File
     No Spectrum File defined
Reading Parameter Values and Dependences
Calculate Mixing Matrices
Checking for CP even and odd scalars

All Done... Omega/Regime-3 is ready!


Are you unfamiliar with SARAH? Use SARAH`FirstSteps

In[3]:= 
                                        Sqrt[2] g1 gR
Out[3]= {{gR, g1 g1RBLFactor}, {gBL, --------------------}, {gL, g2}, 
                                               2       2
                                     Sqrt[-3 g1  + 5 gR ]
 
>    {Yv, LHInput[Yv]}}

In[4]:= Checking model for missing definitions
Generate Directories
Building Particle List
-----------------------
Calculate All Vertices
-----------------------
      Three Scalar - Interaction
      Four Scalar - Interaction
      Two Scalar - One Vector Boson - Interaction
      Two Scalar - Two Vector Boson - Interaction
      Three Vector Boson - Interaction
      Two Fermion - One Scalar - Interaction
