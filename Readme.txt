==============================================
SARAH
by Florian Staub, 2012
with updates by Mark Goodsell and Werner Porod
==============================================

1. Introduction
----------------
SARAH is a Mathematica package for building and analyzing supersymmetric models. SARAH only needs the gauge structure, particle content and superpotential to produce all the information about the gauge eigenstates of a model. Breaking of gauge symmetries and mixings of particles can be easily added. The gauge fixing terms are also automatically derived in R_Xi gauge, and the corresponding ghost interactions are calculated.

In addition, analytical results for the 1- and 2-loop renormalisation group equations for for the parameters of the superpotential, the gauge couplings and the soft breaking parameters can be calculated. Functions for an automatic calculation of the 1-loop corrections to self energies and the tadpoles are included. In all calculations possible effects due to gauge kinetic mixing are included for models with several Abelian gauge groups.

SARAH can write all the information about the model in LaTeX, or create a model file for FeynArts and CalcHep/CompHep, which can also be used for dark matter studies using MicrOmegas, and in the UFO format which is supported by MadGraph 5. All necessary files to implement new models in WHIZARD and OMEGA can be generated.

Beginning with version 3, SARAH is also the first available spectrum-generator-generator: based on the derived, analytical expression it creates source code for SPheno. In that way, it is possible to implement new models in SPheno without the need to write any Fortran code by hand.

The intention by the development of SARAH was to make it very flexible: there is a large freedom in the matter and gauge sector that can be handled. The work with SARAH should be easy: all the information SARAH needs is specified in an easy to modify model file. Nevertheless, SARAH is also fast: an existing model can be changed within minutes, and the needed time for doing all necessary calculations and writing a model file is normally less than 10 minutes. 



2. Download and installation
----------------------------
The package can be downloaded from 

    http://sarah.hepforge.org/

and should be extracted to the application directory of Mathematica. This directory is in Linux
    ~/.Mathematica/Applications/
and
    Mathematica-Directory\AddOns\Applications\
in Windows. The package archive contains the following directories:
  - Models: Definition of the different models
  - Package: All package files.
  - LaTeX: LaTeX packages, which might be needed for the output of SARAH
During the work, also the directory
    Output 
is created. It will contain all files written by SARAH. In addition, the root directory of SARAH contains this short introduction (Readme.txt) as well as an example for the evaluation of the MSSM (Example.nb). A comprehensive wiki, and a forum for getting help, are found online. 


3. Evaluation and commands
---------------------------
After the installation, the package is loaded in Mathematica via
     <<"[DIRECTORY]/SARAH.m"
and a supersymmetric model is initialized by 
     Start["Modelname"];
Here, "Modelname" is the name of the corresponding model file, e.g. for the minimal supersymmetric standard model the command would read  
     Start["MSSM"];


The most important commands to work with SARAH are the following:
 - Vertex[Fields, Options]: Calculates a vertex for given fields
 - MassMatrices[States]: Shows all mass matrices for given eigenstates "States"
 - TadpoleEquations[States]: Shows all tadpole equations for given eigenstates "States"
 - MassMatrix[Field]: Shows the mass matrix of the field "Field"
 - TadpoleEquation[Field]: Shows the tadpole equation corresponding to the VEV "VEV"
 - CalcRGEs[Options]: Calculates the RGEs
 - CalcLoopCorrections[Options]: Calculates one-loop corrections for given eigenstates "States"
 - ModelOutput[States,Options]: Create output defined by options  for given eigenstates "States".
 - MakeVertexList[States,Options]: Calculates all vertices  for given eigenstates "States"
 - MakeTeX[Options]: Writes LaTeX files 
 - MakeCHep[Options]: Writes CalcHep/CompHep model files
 - MakeFeynArts[Options]: Writes FeynArts model file 
 - MakeUFO[Options]: Writes model files in UFO format
 - MakeSPheno[Options]: Writes source code for SPheno

"States" can be 'EWSB' for the mass eigenstates after EWSB or 'GaugeES' for the gauge eigenstates. "VEV" is either 'vd' or 'vu' for the vacuum expectation values of the two Higgs doublets. "Field" can be 'Chi' for neutralino, 'Cha' for Charginos, 'hh' for scalar Higgs fields, 'Ah' for pseudo scalar Higgs fields as well as  'Se', 'Sd' or 'Su' for sleptons, down-squark and up-squarks, respectively.


4. Models
---------
Each model is defined in SARAH in an own directory. Each directory should contain the three files:
 - Model.m: defines all necessary information about a model: gauge sector, particle content, superpotential, field rotations
 - parameters.m: gives additional information about the parameters involved in the model, e.g.  real/complex, symmetry assumptions, numerical value, position in LesHouches input file, dependences on other parameters or LaTeX name
 - particles.m: gives additional information about the particles of the model like R-parity, PDG code, mass, width, output name, LaTeX name
In addition, it is possible to include spectrum files in the model directory. These can be read using
   ReadSpectrum["filename"];


The following models are contained in the package, among others:
 - MSSM: The minimal-supersymmetric standard models
 - MSSM/CPV: The MSSM with CP violation
 - MSSM/CKM: The MSSM in SCKM basis
 - MSSM/NoFV: The MSSM without flavor vioaltion
 - MSSM/HeavyGluino: The MSSM, in which the gluino has been integrated out
 - MSSM/RpV-Bi: The MSSM with bilinear R-parity violation
 - MSSM/RpV-LnV: The MSSM with R-parity violation: only lepton number violating terms
 - MSSM/RpV-TriLnV: The MSSM with R-parity violation: only trilinear, lepton number violating terms
 - MSSM/RpV-BnV: The MSSM with R-parity violation: only baryon number violating terms

 - NMSSM/One_Rotation: The next-to-minimal supersymmetric standard model with one rotation in the pseudo scalar sector
 - NMSSM/Two_Rotation: The NMSSM with two rotations in the pseudo scalar sector
 - NMSSM/CKM: The NMSSM in SCKM basis
 - NMSSM/CPV: The NMSSM with CP violation

 - near-MSSM: The near-to-minimak supersymmetric standard model

 - SMSSM: The singlet extended minimal supersymmetric standard model

 - UMSSM: The U(1)-extended minimal supersymmetric standard model

 - secluded-MSSM: Secluded U(1)-extended minimal supersymmetric standard model

 - munuSSM: The mu-nu-supersymmetric standard models
 
 - Omega: The left-right supersymmetric standard model with two gauge symmetry breaking scales
 - Omega_Short: The left-right supersymmetric standard model with one gauge symmetry breaking scales

 - Seesaw1: The MSSM with seesaw type I
 - Seesaw2: The MSSM with seesaw type II
 - Seesaw3: The MSSM with seesaw type III
 - inverse-Seesaw: MSSM with inserve seesaw
 - inverse-Seesaw-NMSSM: NMSSM with inverse seesaw
 - LinSeesaw: MSSM with linear Seesaw
 
 - B-L-SSM: minimal, supersymmetric model with U(1)_B-L x U(1)_Y gauge sector
 - N-B-L-SSM: singlet extenions of U(1)_B-L x U(1)_Y model
 - B-L-SSM-IS: B-L model with inverse seesaw
 - BLRinvSeesaw: minimal, supersymmetric model with U(1)_B-L x U(1)_R gauge sector and inverse seesaw

 - TMSSM: triplet extended MSSM
 - TNMSSM: triplet extended NMSSM


