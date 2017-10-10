Mathematica 9.0 for Linux x86 (64-bit)
Copyright 1988-2013 Wolfram Research, Inc.

In[1]:= SARAH (Private Version)
by Florian Staub, 2015
contributions by M. D. Goodsell, K. Nickel

References:
  Comput.Phys.Commun.181 (2010) 1077-1086. (arXiv:0909.2863[hep-ph])
  Comput.Phys.Commun.182 (2011) 808-833. (arXiv:1002.0840[hep-ph])
  Comput.Phys.Commun.184 (2013) 1792-1809. (arXiv:1207.0906[hep-ph])
  Comput.Phys.Commun.185 (2014) 1773-1790. (arXiv:1309.7223[hep-ph])
Download and Documentation:
  http://sarah.hepforge.org

Start evaluation of a model with:
   Start["Name of Model"]
e.g. Start["MSSM"] or Start["NMSSM","CKM"]
To get a list with all installed models, use ShowModels

In[2]:= Preparing arrays
 ... checking Directory: /home/fnstaub/Documents/Uni/SARAH/sarah4/Models/
Model file for the Omega Model (Regime-2) loaded
Model files loaded   
  Model    : Omega
  Author(s): undefined
  Date     : 2012-09-01
******************************************************* 
Loading Susyno functions for the handling of Lie Groups 
Based on Susyno v.2.0 by Renato Fonseca (1106.5016)
webpage: web.ist.utl.pt/renato.fonseca/susyno.html
******************************************************* 
Initialization
Checking model files: Dynamic[DynamicCheckModelFiles]
Initialize gauge groups: Dynamic[DynamicInitGaugeG]
Initialize field: Dynamic[DynamicInitFields]
Preprocessing necessary information: Dynamic[DynamicInitMisc]
Checking for anomalies: Dynamic[DynamicCheckAnomalies]
Checking U(1)'s for orthogonality
   U(1)'s not orthogonality: bminl and right
Derive Lagrangian
Calculate superpotential: Dynamic[DynamicTermSuperpotentialNr]/12(
 
>   Dynamic[DynamicTermSuperpotential])
  checking charge conservation: Dynamic[DynamicCheckingCCSup]
Calculate F-Terms: Dynamic[DynamicFTermNr]/18 (Dynamic[DynamicFTermName])
Calculate Matter interactions: Dynamic[DynamicMatterNr]/324 (
 
>   Dynamic[DynamicMatterName])
Calculate soft-breaking terms: Dynamic[DynamicSoftTermsCurrent]
Calculate kinetic Terms
  ... for scalars: Dynamic[DynamicKineticScalarNr]/12 (
 
>   Dynamic[DynamicKineticScalarName])
  ... for fermions: Dynamic[DynamicKineticFermionNr]/12 (
 
>   Dynamic[DynamicKineticFermionName])
Calculate D-Terms: Dynamic[DynamicDTermsNr]/48 (Dynamic[DynamicDTermsName])
Calculate gaugino interactions: Dynamic[DynamicGauginoMatter]/48 (
 
>   Dynamic[DynamicGauginoMatterName])
Calculate vector-gaugino interactions: Dynamic[DynamicGauginoVector]/4 (
 
>   Dynamic[DynamicGauginoVectorName])
Calculate vector self-interactions: Dynamic[DynamicVectorNr]/4 (
 
>   Dynamic[DynamicVectorName])
Calculate gauge transformations: Dynamic[DynamicGaugeTNr]/16 (
 
>   Dynamic[DynamicGaugeTName])
Calc Complete Lagrangian

Evolve States: GaugeES
Rotate Lagrangian: Dynamic[DynamicRotateLag[1]]/14
Derive ghost terms: 
  ... generate gauge fixing terms: Dynamic[DynamicGFnr[GaugeES]]/4 (
 
>   Dynamic[DynamicGFname[GaugeES]])
  ... calculate Ghost interactions
Calc Mixings of Matter Fields
Save information (Dynamic[DynamicSaveInfo[GaugeES]])

Evolve States: EWSB
Parametrize Higgs Sector
   Update gauge transformations: Dynamic[DynamicUGT[UGTvev[2]]]/75 (
 
>   Dynamic[DynamicUGTname[UGTvev[2]]])
Calc mass matrices gauge sector: Dynamic[DynamicMMgaugeNr[EWSB]]/1(
 
>   Dynamic[DynamicMMgaugeName[EWSB]])
   Update gauge transformations: Dynamic[DynamicUGT[UGTgaugeMM[2]]]/79 (
 
>   Dynamic[DynamicUGTname[UGTgaugeMM[2]]])
Rotate Lagrangian: Dynamic[DynamicRotateLag[2]]/14
Derive ghost terms: 
  ... generate gauge fixing terms: Dynamic[DynamicGFnr[EWSB]]/4 (
 
>   Dynamic[DynamicGFname[EWSB]])
  ... calculate Ghost interactions
Calc Mixings of Matter Fields
   Calculate mass matrices Dynamic[DynamicNrMass[{{{phiR, phiRbar, phiOmR}, 
 
>       {phiR, phiRbar, phiOmR}}, 
 
>      {{sigmaR, sigmaRbar, sigmaOmR}, {sigmaR, sigmaRbar, sigmaOmR}}, 
 
>      {{fB, fWR0, FdeltaR0, FdeltaRbar0, FomegaR0}, 
 
>       {fB, fWR0, FdeltaR0, FdeltaRbar0, FomegaR0}}, 
 
>      {{FvL, conj[FvR]}, {FvL, conj[FvR]}}, {{SdL}, {conj[SdL]}}, 
 
>      {{SuL}, {conj[SuL]}}, {{SdR}, {conj[SdR]}}, {{SuR}, {conj[SuR]}}, 
 
>      {{SeL}, {conj[SeL]}}, {{SeR}, {conj[SeR]}}, {{SvL}, {conj[SvL]}}, 
 
>      {{SvR}, {conj[SvR]}}, {{SHd0, conj[SHu0]}, {conj[SHd0], SHu0}}, 
 
>      {{SHdm, conj[SHup]}, {conj[SHdm], SHup}}, 
 
>      {{SomegaLp, conj[SomegaLm]}, {conj[SomegaLp], SomegaLm}}}]]/15 (
 
>   Dynamic[DynamicNameMass[{{{phiR, phiRbar, phiOmR}, 
 
>       {phiR, phiRbar, phiOmR}}, 
 
>      {{sigmaR, sigmaRbar, sigmaOmR}, {sigmaR, sigmaRbar, sigmaOmR}}, 
 
>      {{fB, fWR0, FdeltaR0, FdeltaRbar0, FomegaR0}, 
 
>       {fB, fWR0, FdeltaR0, FdeltaRbar0, FomegaR0}}, 
 
>      {{FvL, conj[FvR]}, {FvL, conj[FvR]}}, {{SdL}, {conj[SdL]}}, 
 
>      {{SuL}, {conj[SuL]}}, {{SdR}, {conj[SdR]}}, {{SuR}, {conj[SuR]}}, 
 
>      {{SeL}, {conj[SeL]}}, {{SeR}, {conj[SeR]}}, {{SvL}, {conj[SvL]}}, 
 
>      {{SvR}, {conj[SvR]}}, {{SHd0, conj[SHu0]}, {conj[SHd0], SHu0}}, 
 
>      {{SHdm, conj[SHup]}, {conj[SHdm], SHup}}, 
 
>      {{SomegaLp, conj[SomegaLm]}, {conj[SomegaLp], SomegaLm}}}]])
   Update gauge transformations: Dynamic[DynamicUGT[UGTmatterMM[2]]]/90 (
 
>   Dynamic[DynamicUGTname[UGTmatterMM[2]]])
Calculate Tadpole Equations
Save information (Dynamic[DynamicSaveInfo[EWSB]])

ModelFile::NoGoldstone: 
   No Goldstone boson for (possibly) massive gauge boson VBY defined.

Finishing
Calculate final Lagrangian
Cleaning up
   ... add matrix products
   ... checking for massless particles
   ... calculating tree level masses (Dynamic[DynamicCalcTreeMasses])
   ... simplify mass matrices
Numerical calculations (if necessary)
   ... checking for spectrum file: Dynamic[DynamicSpectrumFileInput]
   ... reading parameter values and dependences
   ... calculate mixing matrices
Checking for CP even and odd scalars

All Done. Omega is ready!
(Model initialized in 36.7404s)


Are you unfamiliar with SARAH? Use SARAH`FirstSteps

In[3]:= 
                                        Sqrt[2] g1 gR
Out[3]= {{gR, g1 g1RBLFactor}, {gBL, --------------------}, {gL, g2}, 
                                               2       2
                                     Sqrt[-3 g1  + 5 gR ]
 
>    {Yv, LHInput[Yv]}}

In[4]:= Generate SPheno Source Code
Performing necessary calculations
 ... can't extract tree level contributions to delta(rho) because gauge group\
 
>   'left' or 'hypercharge' not defined; assuming zero
Checking model for missing definitions

CheckModelFiles::MissingParticle: 
   The following particle are not defined in ParticleDefinitions in
     particles.m: {WinoLR2, GluR2, Fd1r2, Fu1r2, Fd2r2, Fu2r2, Fe1r2, Fe2r2, 
     H0r2, HCr2, Fomega0, ChaR2, SomegaL0r2, hhR2}

CheckModelFiles::MissingOutputName: 
   For the following particles is no OutputName defined: 
    {WinoLR2, GluR2, Fd1r2, Fu1r2, Fd2r2, Fu2r2, Fe1r2, Fe2r2, H0r2, HCr2, 
     Fomega0, ChaR2, FvR2, SomegaL0r2, hhR2, SDLr2, SULr2, SDRr2, SURr2, 
     SELr2, SERr2, SVLr2, SVRr2, SH0r2, SHCr2, SOmLpR2}

CheckModelFiles::WrongPDG: 
   The number of PDG numbers defined for the following particles does not fit
     to their number of generations: {VWL, VG, VBY}

CheckModelFiles::WrongPDGIX: 
   The number of PDG.IX numbers defined for the following particles does not
     fit to their number of generations: {VWL, VG, VBY}

CheckModelFiles::MissingOutputNameParameter: 
   For the following parameters is no OutputName defined: 
    {gBL, gL, gR, g3, Mdeltac1, B[Mdeltac1], Momega, ac1, T[ac1], Yv, T[Yv], 
     b, T[b], bc, T[bc], fc1, T[fc1], mqL2, mdR2, muR2, mlL2, <<20>>, UUL, 
     UDR, UUR, UEL, UER, UVL, UVR, UH0, UHC, UDLp}
Generate Directories
Building Particle List
Calculate supersymmetric RGEs
Making Lists of Particles and Couplings
Calculating anomalous Dimensions
Calculate Beta Functions for trilinear Superpotential parameters
   Calculating Dynamic[DynamicProgressRGE[YIJK]]/8.(
 
>   Dynamic[DynamicCoupProgess[YIJK]])
Calculate Beta Functions for bilinear Superpotential parameters
   Calculating Dynamic[DynamicProgressRGE[MUIJ]]/3.(
 
>   Dynamic[DynamicCoupProgess[MUIJ]])
Calculate Beta Functions for linear Superpotential parameters
   Nothing to do.
Calculate Beta Functions for trilinear soft breaking parameters
   Calculating Dynamic[DynamicProgressRGE[TIJK]]/8.(
 
>   Dynamic[DynamicCoupProgess[TIJK]])
Calculate Beta Functions for bilinear soft breaking parameters
   Calculating Dynamic[DynamicProgressRGE[BIJ]]/3.(
 
>   Dynamic[DynamicCoupProgess[BIJ]])
Calculate Beta Functions for linear soft breaking parameters
   Nothing to do.
Calculate Traces for soft-scalar masses
   Calculating: Dynamic[DynamicCoupProgess[trace]]
Calculate Beta Functions for scalar soft breaking masses
   Calculating Dynamic[DynamicProgressRGE[M2IJ]]/12.(
 
>   Dynamic[DynamicCoupProgess[M2IJ]])
Calculate Beta Functions for Gaugino masses
   Calculating Dynamic[DynamicProgressRGE[MI]]/4.(
 
>   Dynamic[DynamicCoupProgess[MI]])
Calculate Beta Functions for Gauge Couplings
   Calculating Dynamic[DynamicProgressRGE[GAUGE]]/4.(
 
>   Dynamic[DynamicCoupProgess[GAUGE]])
Calculate Beta Functions for 4-point Superpotential parameters
   Nothing to do.
Calculate Beta Functions for 4-point soft breaking parameters
   Nothing to do.
Calculate Beta Functions for VEVs
   Calculating Dynamic[DynamicProgressRGE[VEV]]/2.(
 
>   Dynamic[DynamicCoupProgess[VEV]])

Finished with the calculation of the RGEs. Time needed: 70.4768s
The results are saved in /home/fnstaub/Documents/Uni/SARAH/sarah4/Output/Omeg\
 
>    a-Regime-2/RGEs/

Preparing SPheno code
  Build parameter lists
Write RGEs
  Processing RGEs running up: Dynamic[DynamicRGEup] 
 
>   Dynamic[DynamicRGEbeta[numberLow]]
  Processing RGEs running including VEVs: Dynamic[DynamicRGEall] 
 
>   Dynamic[DynamicRGEbeta[numberAllwithVEVs]]
Write Tree Level-Masses
  Getting needed Information
  Writing routine for calculating all masses
  Writing all masses: Dynamic[DynamicMassNr]/23(Dynamic[DynamicMassName])

Intersection::normal: 
   Nonatomic expression expected at position 1 in Intersection[List].

Part::partd: Part specification List[[3]] is longer than depth of object.

Part::partd: Part specification List[[3]] is longer than depth of object.
Write routine for tadpole equations
  Writing solver for tadpole equations 
  Writing tadpole equations 
--------------------------------------
Writing SPheno Shifts for Parameters 
--------------------------------------
Subroutine for Shifts up and dowm

Finished! SPheno code generated in 95.7949s
Output saved in /home/fnstaub/Documents/Uni/SARAH/sarah4/Output/Omega-Regime-\
 
>    2/EWSB/SPheno/

The following steps are now necessary to implement the model in SPheno: 
  1. Copy the created files to a new subdirectory "/Omega" of your SPheno\
 
>    3.3.6 (or later) installation
  2. Compile the model by using 
        make Model=Omega
     in the main directory of SPheno

In[5]:= 