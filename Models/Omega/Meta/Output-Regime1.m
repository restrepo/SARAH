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
Model file for the Omega Model (Regime-3) loaded
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
Derive Lagrangian
Calculate superpotential: Dynamic[DynamicTermSuperpotentialNr]/13(
 
>   Dynamic[DynamicTermSuperpotential])
  checking charge conservation: Dynamic[DynamicCheckingCCSup]
Calculate F-Terms: Dynamic[DynamicFTermNr]/30 (Dynamic[DynamicFTermName])
Calculate Matter interactions: Dynamic[DynamicMatterNr]/900 (
 
>   Dynamic[DynamicMatterName])
Calculate soft-breaking terms: Dynamic[DynamicSoftTermsCurrent]
Calculate kinetic Terms
  ... for scalars: Dynamic[DynamicKineticScalarNr]/11 (
 
>   Dynamic[DynamicKineticScalarName])
  ... for fermions: Dynamic[DynamicKineticFermionNr]/11 (
 
>   Dynamic[DynamicKineticFermionName])
Calculate D-Terms: Dynamic[DynamicDTermsNr]/44 (Dynamic[DynamicDTermsName])
Calculate gaugino interactions: Dynamic[DynamicGauginoMatter]/44 (
 
>   Dynamic[DynamicGauginoMatterName])
Calculate vector-gaugino interactions: Dynamic[DynamicGauginoVector]/4 (
 
>   Dynamic[DynamicGauginoVectorName])
Calculate vector self-interactions: Dynamic[DynamicVectorNr]/4 (
 
>   Dynamic[DynamicVectorName])
Calculate gauge transformations: Dynamic[DynamicGaugeTNr]/15 (
 
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
   Update gauge transformations: Dynamic[DynamicUGT[UGTvev[2]]]/108 (
 
>   Dynamic[DynamicUGTname[UGTvev[2]]])
Calc mass matrices gauge sector: Dynamic[DynamicMMgaugeNr[EWSB]]/2(
 
>   Dynamic[DynamicMMgaugeName[EWSB]])
   Update gauge transformations: Dynamic[DynamicUGT[UGTgaugeMM[2]]]/116 (
 
>   Dynamic[DynamicUGTname[UGTgaugeMM[2]]])
Rotate Lagrangian: Dynamic[DynamicRotateLag[2]]/14
Derive ghost terms: 
  ... generate gauge fixing terms: Dynamic[DynamicGFnr[EWSB]]/5 (
 
>   Dynamic[DynamicGFname[EWSB]])
  ... calculate Ghost interactions
Calc Mixings of Matter Fields
   Calculate mass matrices Dynamic[DynamicNrMass[{{{SdeltaRm, 
 
>        conj[SdeltaRbarp]}, {conj[SdeltaRm], SdeltaRbarp}}, 
 
>      {{SomegaRm, conj[SomegaRp]}, {conj[SomegaRm], SomegaRp}}, 
 
>      {{fWR0, FomegaR0}, {fWR0, FomegaR0}}, 
 
>      {{fWRm, FomegaRm}, {fWRp, FomegaRp}}, {{SdL}, {conj[SdL]}}, 
 
>      {{SuL}, {conj[SuL]}}, {{SdR}, {conj[SdR]}}, {{SuR}, {conj[SuR]}}, 
 
>      {{SeL}, {conj[SeL]}}, {{SeR}, {conj[SeR]}}, {{SvL}, {conj[SvL]}}, 
 
>      {{SvR}, {conj[SvR]}}, {{SHd0, conj[SHu0]}, {conj[SHd0], SHu0}}, 
 
>      {{SHdm, conj[SHup]}, {conj[SHdm], SHup}}, 
 
>      {{SomegaLm, conj[SomegaLp]}, {conj[SomegaLm], SomegaLp}}, 
 
>      {{SdeltaLp, conj[SdeltaLbarm]}, {conj[SdeltaLp], SdeltaLbarm}}, 
 
>      {{SdeltaLpp, conj[SdeltaLbarmm]}, {conj[SdeltaLpp], SdeltaLbarmm}}, 
 
>      {{SdeltaL0, conj[SdeltaLbar0]}, {conj[SdeltaL0], SdeltaLbar0}}, 
 
>      {{SdeltaRmm, conj[SdeltaRbarpp]}, {conj[SdeltaRmm], SdeltaRbarpp}}, 
 
>      {{SdeltaR0, conj[SdeltaRbar0]}, {conj[SdeltaR0], SdeltaRbar0}}}]]/20 (
 
>   Dynamic[DynamicNameMass[{{{SdeltaRm, conj[SdeltaRbarp]}, 
 
>       {conj[SdeltaRm], SdeltaRbarp}}, 
 
>      {{SomegaRm, conj[SomegaRp]}, {conj[SomegaRm], SomegaRp}}, 
 
>      {{fWR0, FomegaR0}, {fWR0, FomegaR0}}, 
 
>      {{fWRm, FomegaRm}, {fWRp, FomegaRp}}, {{SdL}, {conj[SdL]}}, 
 
>      {{SuL}, {conj[SuL]}}, {{SdR}, {conj[SdR]}}, {{SuR}, {conj[SuR]}}, 
 
>      {{SeL}, {conj[SeL]}}, {{SeR}, {conj[SeR]}}, {{SvL}, {conj[SvL]}}, 
 
>      {{SvR}, {conj[SvR]}}, {{SHd0, conj[SHu0]}, {conj[SHd0], SHu0}}, 
 
>      {{SHdm, conj[SHup]}, {conj[SHdm], SHup}}, 
 
>      {{SomegaLm, conj[SomegaLp]}, {conj[SomegaLm], SomegaLp}}, 
 
>      {{SdeltaLp, conj[SdeltaLbarm]}, {conj[SdeltaLp], SdeltaLbarm}}, 
 
>      {{SdeltaLpp, conj[SdeltaLbarmm]}, {conj[SdeltaLpp], SdeltaLbarmm}}, 
 
>      {{SdeltaL0, conj[SdeltaLbar0]}, {conj[SdeltaL0], SdeltaLbar0}}, 
 
>      {{SdeltaRmm, conj[SdeltaRbarpp]}, {conj[SdeltaRmm], SdeltaRbarpp}}, 
 
>      {{SdeltaR0, conj[SdeltaRbar0]}, {conj[SdeltaR0], SdeltaRbar0}}}]])
   Update gauge transformations: Dynamic[DynamicUGT[UGTmatterMM[2]]]/134 (
 
>   Dynamic[DynamicUGTname[UGTmatterMM[2]]])
Calculate Tadpole Equations
Save information (Dynamic[DynamicSaveInfo[EWSB]])

ModelFile::NoGoldstone: 
   No Goldstone boson for (possibly) massive gauge boson VWR0 defined.

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
(Model initialized in 239.906s)


Are you unfamiliar with SARAH? Use SARAH`FirstSteps

In[3]:= 
Out[3]= {{YQ[index1, index2, 1], 
 
>     -(Csc[Theta1 - Theta2] (Sin[Theta2] Yd[index1, index2] + 
 
>          Sin[Theta1] Yu[index1, index2]))}, 
 
>    {YQ[index1, index2, 2], -(Csc[Theta1 - Theta2] 
 
>        (Cos[Theta2] Yd[index1, index2] + Cos[Theta1] Yu[index1, index2]))}, 
 
>    {YL[index1, index2, 1], -(Csc[Theta1 - Theta2] 
 
>        (Sin[Theta2] Ye[index1, index2] + Sin[Theta1] Yv[index1, index2]))}, 
 
>    {YL[index1, index2, 2], -(Csc[Theta1 - Theta2] 
 
>        (Cos[Theta2] Ye[index1, index2] + Cos[Theta1] Yv[index1, index2]))}, 
 
          gL + gR
>    {g2, -------}}
             2

In[4]:= Generate SPheno Source Code
Performing necessary calculations
 ... can't extract tree level contributions to delta(rho) because gauge group\
 
>   'left' or 'hypercharge' not defined; assuming zero
Checking model for missing definitions

CheckModelFiles::MissingParticle: 
   The following particle are not defined in ParticleDefinitions in
     particles.m: {BinoR1, WinoLr1, GluR1, Fd1r1, Fu1r1, Fd2r1, Fu2r1, Fe1r1, 
     FvL1, Fe2r1, FvR1, H0r1, HCr1, DL3r1, DL1r1, DL2r1, DR1r1, DR2r1, DR3r1, 
     Om1r1, Om2r1, SomegaL0, sigmaOmR, phiOmR, SDL0r1}

CheckModelFiles::MissingOutputName: 
   For the following particles is no OutputName defined: 
    {BinoR1, WinoLr1, GluR1, Fd1r1, Fu1r1, Fd2r1, Fu2r1, Fe1r1, FvL1, Fe2r1, 
     FvR1, H0r1, HCr1, DL3r1, DL1r1, DL2r1, DR1r1, <<17>>, SH0r1, SHCr1, 
     SO1r1, SDLpR1, SDLppR1, SDL0r1, SDRmmR1, SDR0r1}

CheckModelFiles::WrongPDG: 
   The number of PDG numbers defined for the following particles does not fit
     to their number of generations: {VB, VWL, VG}

CheckModelFiles::WrongPDGIX: 
   The number of PDG.IX numbers defined for the following particles does not
     fit to their number of generations: {VB, VWL, VG}

CheckModelFiles::MissingOutputNameParameter: 
   For the following parameters is no OutputName defined: 
    {gBL, g2, g3, Mdelta, B[Mdelta], Momega, B[Momega], Mu3, B[Mu3], T[a], 
     T[f], YL, T[YL], T[AlphaOm], YQ, T[YQ], mqL2, mqR2, mlL2, <<26>>, UVR, 
     UH0, UHC, UO1, UDLp, UDLpp, UDL0, UDRmm, UDR0}
Generate Directories
Building Particle List
Calculate supersymmetric RGEs
Making Lists of Particles and Couplings
Calculating anomalous Dimensions
Calculate Beta Functions for trilinear Superpotential parameters
   Calculating Dynamic[DynamicProgressRGE[YIJK]]/5.(
 
>   Dynamic[DynamicCoupProgess[YIJK]])
Calculate Beta Functions for bilinear Superpotential parameters
   Calculating Dynamic[DynamicProgressRGE[MUIJ]]/3.(
 
>   Dynamic[DynamicCoupProgess[MUIJ]])
Calculate Beta Functions for linear Superpotential parameters
   Nothing to do.
Calculate Beta Functions for trilinear soft breaking parameters
   Calculating Dynamic[DynamicProgressRGE[TIJK]]/5.(
 
>   Dynamic[DynamicCoupProgess[TIJK]])
Calculate Beta Functions for bilinear soft breaking parameters
   Calculating Dynamic[DynamicProgressRGE[BIJ]]/3.(
 
>   Dynamic[DynamicCoupProgess[BIJ]])
Calculate Beta Functions for linear soft breaking parameters
   Nothing to do.
Calculate Traces for soft-scalar masses
   Calculating: Dynamic[DynamicCoupProgess[trace]]
Calculate Beta Functions for scalar soft breaking masses
   Calculating Dynamic[DynamicProgressRGE[M2IJ]]/11.(
 
>   Dynamic[DynamicCoupProgess[M2IJ]])
Calculate Beta Functions for Gaugino masses
   Calculating Dynamic[DynamicProgressRGE[MI]]/4.(
 
>   Dynamic[DynamicCoupProgess[MI]])
Calculate Beta Functions for Gauge Couplings
   Calculating Dynamic[DynamicProgressRGE[GAUGE]]/3.(
 
>   Dynamic[DynamicCoupProgess[GAUGE]])
Calculate Beta Functions for 4-point Superpotential parameters
   Nothing to do.
Calculate Beta Functions for 4-point soft breaking parameters
   Nothing to do.
Calculate Beta Functions for VEVs
   Calculating Dynamic[DynamicProgressRGE[VEV]]/1.(
 
>   Dynamic[DynamicCoupProgess[VEV]])

Finished with the calculation of the RGEs. Time needed: 269.444s
The results are saved in /home/fnstaub/Documents/Uni/SARAH/sarah4/Output/Omeg\
 
>    a-Regime-1/RGEs/

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
  Writing all masses: Dynamic[DynamicMassNr]/38(Dynamic[DynamicMassName])

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

Finished! SPheno code generated in 514.801s
Output saved in /home/fnstaub/Documents/Uni/SARAH/sarah4/Output/Omega-Regime-\
 
>    1/EWSB/SPheno/

The following steps are now necessary to implement the model in SPheno: 
  1. Copy the created files to a new subdirectory "/Omega" of your SPheno\
 
>    3.3.6 (or later) installation
  2. Compile the model by using 
        make Model=Omega
     in the main directory of SPheno

In[5]:= 