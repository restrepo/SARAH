Mathematica 5.2 for Linux x86 (64 bit)
Copyright 1988-2005 Wolfram Research, Inc.
 -- Motif graphics initialized -- 

In[1]:= SARAH 3.0
by Florian Staub, 2010

Begin evaluation of Model with:       Start["Name of Model"]
e.g. Start["MSSM"] or Start["NMSSM","CKM"]

In[2]:= Initialization

Model file for the Omega Model (Regime-3) loaded
Generate all Superfields
Checking Model Files ...
    Model File is okay
    Particle File is okay
    Parameter File is okay
Create all component Fields
Generate Parameter Dependences
Set Information for Rotations
Calc Superpotential
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
Calc Mixings Gauge Sector
Calc Mixings of Matter Fields
Calc Mass Matrices
    For {SdeltaRm, conj[SdeltaRbarp]}
    For {SomegaRm, conj[SomegaRp]}
    For {fWR0, FomegaR0}
    For {fWRm, FomegaRm}{fWRp, FomegaRp}
    For {SdL}
    For {SuL}
    For {SdR}
    For {SuR}
    For {SeL}
    For {SeR}
    For {SvL}
    For {SvR}
    For {SHd0, conj[SHu0]}
    For {SHdm, conj[SHup]}
    For {SomegaLm, conj[SomegaLp]}
    For {SdeltaLp, conj[SdeltaLbarm]}
    For {SdeltaLpp, conj[SdeltaLbarmm]}
    For {SdeltaL0, conj[SdeltaLbar0]}
    For {SdeltaRmm, conj[SdeltaRbarpp]}
    For {SdeltaR0, conj[SdeltaRbar0]}
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

All Done... Omega is ready!

In[3]:= Generate Directories
Building Particle List
-----------------------
Calculate All Vertices
-----------------------
      Three Scalar Interaction
      Four Scalar Interaction
      Two Scalar - One Vector Boson - Interaction
      One Scalar - Two Vector Boson - Interaction
      Two Scalar - Two Vector Boson - Interaction
      Three Vector Boson - Interaction
      Two Fermion - One Scalar - Interaction
      Two Fermion - One Vector Boson - Interaction
      Four Vector Boson - Interaction
      Two Ghost - One Vector Boson - Interaction
      Two Ghost - One Scalar - Interaction
      Two Scalar - One Auxiliary - Interaction

Simplify Vertices
Writing vertices to files
Done... all vertices are saved in 
 
>   /home/fnstaub/Documents/Uni/SARAH/sarah3/Output/Omega-Regime-1/EWSB/Verti\
 
>    ces/
Generate interaction list
------------------------------------
Calculate Loop Corrections
------------------------------------
     For Rotated Fields
------------------------------------
    Calculate One Loop Self Energy of Hpm1R1
    Calculate One Loop Self Energy of Hpm2R1
    Calculate One Loop Self Energy of ChiR1
    Calculate One Loop Self Energy of Cha1r1
    Calculate One Loop Self Energy of SDLr1
    Calculate One Loop Self Energy of SULr1
    Calculate One Loop Self Energy of SDRr1
    Calculate One Loop Self Energy of SURr1
    Calculate One Loop Self Energy of SELr1
    Calculate One Loop Self Energy of SERr1
    Calculate One Loop Self Energy of SVLr1
    Calculate One Loop Self Energy of SVRr1
    Calculate One Loop Self Energy of SH0r1
    Calculate One Loop Self Energy of SHCr1
    Calculate One Loop Self Energy of SO1r1
    Calculate One Loop Self Energy of SDLpR1
    Calculate One Loop Self Energy of SDLppR1
    Calculate One Loop Self Energy of SDL0r1
    Calculate One Loop Self Energy of SDRmmR1
    Calculate One Loop Self Energy of SDR0r1


     For Tadpoles
------------------------------------


     For Gauge Eigenstates
------------------------------------
    Calculate One Loop Self Energy of H0r1
    Calculate One Loop Self Energy of HCr1
    Calculate One Loop Self Energy of DL3r1
    Calculate One Loop Self Energy of DL1r1
    Calculate One Loop Self Energy of DL2r1
    Calculate One Loop Self Energy of DR1r1
    Calculate One Loop Self Energy of DR2r1
    Calculate One Loop Self Energy of DR3r1
    Calculate One Loop Self Energy of Om1r1
    Calculate One Loop Self Energy of Om2r1
    Calculate One Loop Self Energy of BinoR1
    Calculate One Loop Self Energy of WinoLr1
    Calculate One Loop Self Energy of GluR1
    Calculate One Loop Self Energy of SomegaL0
    Calculate One Loop Self Energy of sigmaOmR
    Calculate One Loop Self Energy of phiOmR
    Calculate One Loop Self Energy of VWRm
Removing light field contributions
-----------------------
Calculate RGEs   
-----------------------
Making Lists of Particles and Couplings
Calculating anomalous Dimensions
Calculate Beta Functions for trilinear Superpotential parameters
Calculate Beta Functions for bilinear Superpotential parameters
Calculate Beta Functions for linear Superpotential parameters
Calculate Beta Functions for trilinear soft breaking parameters
Calculate Beta Functions for bilinear soft breaking parameters
Calculate Beta Functions for linear soft breaking parameters
Calculate Beta Functions for scalar soft breaking masses
Calculate Beta Functions for Gaugino masses
Calculate Beta Functions for Gauge Couplings
Calculate Beta Functions for 4-point Superpotential parameters
Calculate Beta Functions for VEVs
--------------------------------
Generate SPheno Source Code
--------------------------------
Build parameter lists
-----------------------------------
Write RGEs for Low Scale Parameters
-----------------------------------
Write Function GToParameters
Write Function ParametersToG
Write RGE Function
-------------------------------
Write RGEs for all Parameters
-------------------------------
Write Function GToParameters
Write Function ParametersToG
Write RGE Function
-------------------------------
Write RGEs including VEVs      
-------------------------------
Write Function GToParameters
Write Function ParametersToG
Write RGE Function
----------------------------------------------
Writing Routines for Tree Level-Masses
----------------------------------------------
Getting needed Information
Writing Routine for Calculating all Masses
Write other Tree-Level Masses
Writing Subroutine for Calculating MHpm1R1
Writing Subroutine for Calculating MHpm2R1
Writing Subroutine for Calculating MCha1r1
Writing Subroutine for Calculating MSH0r1
Writing Subroutine for Calculating MSHCr1
Writing Subroutine for Calculating MSDLpR1
Writing Subroutine for Calculating MSDLppR1
Writing Subroutine for Calculating MSDL0r1
Writing Subroutine for Calculating MSDRmmR1
--------------------------------------
Writing SPheno Shifts for Parameters 
--------------------------------------
Subroutine for Shifts up and dowm

Finished! Output is in /home/fnstaub/Documents/Uni/SARAH/sarah3/Output/Omega-\
 
>    Regime-1/EWSB/SPheno/
Copy files to subdirectory /Omega of SPheno
and compile the model afterwards using "make".

In[4]:= 