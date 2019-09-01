## Changelog

*   03.December 2018 **(4.14.1)**:
    *   Bug-fixes in NLO matching conditions (affects only diagrams with tree-level Propagator diagrams, ie. not the MSSM)
    *   Turned-off debug output of SPheno in NLO matching routines
*   29.October 2018 **(4.14.0)**:
    *   One-loop matching between two scalar sectors, see [1810.XXXXX](https://arxiv.org/abs/1810.XXXXX)
    *   Corrections in non-SUSY RGEs, see [1809.06797](https://arxiv.org/abs/1809.06797)
*   11.May 2018 **(4.13.0)**:
    *   Full tree-level calculation of unitarity constraints
    *   Improvements for non-SUSY RGEs
    *   Several bug-fixes and other improvements; see the full [Changelog](Changelog.4.13.0)
*   15.December 2017 **(4.12.3)**:
    *   Added support of Wilson Coefficient Exchange Format (WCxF)
*   01.September 2017 **(4.12.2)**:
    *   Check of tree-level unitarity condtions with SPheno. Set AddTreeLevelUnitarityLimits=True; to the SPheno.m file
    *   Calculation of S,T,U Parameters with SPheno (beta-status; use it carefully!)
    *   Patches in the one-loop shifts to the tadpoles used by the new two-loop routine (prevented some models to compile)
    *   Tiny improvements in LaTeX Output
    *   Updated models: Georgi-Machacek (new SPheno.m files), TNMSSM (added phase to double charged Higgs [Thanks to Keping Xie]), added to non-SUSY models the calculation of tree-level unitarity checks
    *   Fix in FlavorKit implementation of Meson to Lepton+Neutrino decays (sum over final states neutrinos correct now)
    *   Fix in Vevacious output for cases in which a single scalar mass (not mass matrix) depends on the Higgs VEV
    *   Beta version of routines to get an uncertainty estimates of the mass calculation in SPheno
*   20.July 2017 **(4.12.1)**:
    *   Bug-fix in new SA_B0 function (check for p2=0 missing; thanks to P. Diessner)
    *   Symmetry information used in TeX output to get shorter expressions
*   16.June 2017 **(4.12.0)**:
    *   Implemented general solution for the 'Goldstone Boson Catastrophe' (in collaboration with Mark D. Goodsell and Johannes Braathen): two-loop corrections are now available also for non-SUSY models. See arxiv:1706:05372 for more details
    *   Bug-fix in one-loop S->VV decays for massless V; corrected colour factor for loop-induced decays if external colour structure is not trivial
    *   New check in 'ModelOutput' if non-vanishing vertices violate charge
    *   tan(beta) in SPheno now by default defined at renormalisation scale (M_SUSY for SUSY models) even if SPA conventions are turned off (before, it was M_Z)
    *   anomalous dimensions are written to LaTeX output also for non-SUSY models now
    *   bug-fix in HiggsBounds interface of SPheno
*   27.March 2017 **(4.11.0)**:
    *   Two-body decays with SPheno at full one-loop (in collaboration with Mark D. Goodsell and Stefan Liebler), see 1703.09237
    *   Changes in MadGraph specific output of SPheno (spc files accepted by MG 2.5.3 as param_card)
    *   FeynArts interfaces uses now 'IndexSum' to reduce the length of the expressions
    *   Beta-version of FeynArts interface with counter-terms
    *   Fix in the B->Kll calculation in FlavorKit: coefficient of C7, C7' corrected (thanks to Luc Darme)
    *   Fix in CalcHep output with CP-violation: real and imaginary part for quartics was exchanged when reading input files
    *   Fix in two-loop gauge dependent part of running VEVs for non-SUSY models (thanks to Tom Steudtner)
    *   Interface to HiggsBounds 5 (set HiggsBounds flag to 2 instead 1)
*   11.March 2017 **(4.10.2)**:
    *   Solved seg-fault when writing SPheno output (Thanks to A. Voigt)
*   09.March 2017 **(4.10.1)**:
    *   Improvements in two-scale matching in SPheno
    *   Flag to get get an SLHA output from SPheno which is supported as param_card by MG
*   20.February 2017 **(4.10.0)**:
    *   New matching procedure in SPheno to obtain running gauge and Yukawa couplings
    *   Possibility to calculate the light Higgs mass within an effective SM setup
    *   Possibility to set regulator masses to prevent the 'Goldstone boson catastrophe'
*   08.November 2016 **(4.9.3)**:
    *   New option to write explicitly imaginary parts for all parameters in SPheno spectrum file (might be needed by newer MadGraph version)
    *   Bug-Fix in the SPheno output of RGEs with tensor-valued parameters (Thanks to M. Krauss)
    *   Fix in the charged Higgs contributions in FlavorKit affected tree-level B-decays
*   26.July 2016 **(4.9.1)**:
    *   Fixed problem with MicrOmegas when setting RunningCoup->False in MakeCHep
    *   Fixed problem with non-SUSY models including RGE running: turned off two-loop Higgs masses which are not yet supposed to be used in that case
    *   Solved problem introduced in 4.9.0 with one-loop corrections of vector-like fermions appearing in one generation
*   13.July 2016 **(4.9.0)**:
    *   Re-organised SPheno output using sub-directories: <font color="red">It is necessary from now on to use "cp -R"</font> when copying the SARAH output to the SPheno directory!
    *   Generalised matching conditions, see [the SARAH wiki](http://stauby.de/sarah_wiki/index.php?title=Matching_to_the_SM_in_SPheno)
    *   New flag 77 to get output for MicrOmegas: running masses for light quarks are written; that's necessary for the direct detection calculation to have proper cancellations in case of flavour violation
    *   Updated FlavorKit to include Wilson coefficients for 4d operators (thanks to J. Jones for providing the file)
    *   changed calculation of Delta M_K and Delta M_B (thanks for D. Straub for helpful discussions)
    *   Using correct masses for diphoton and digluon decays of pseudo-scalars (thanks for A. Wlotzka)
*   10.Mai 2016 **(4.8.6)**: Some small patches:
    *   NoU1Mixing=False doesn't cause a problem anymore if just Abelian group is present
    *   correct hypercharge normalisation in FirstGuess for models which just one Higgs doublet
    *   On-Shell condition for models with CPV in second iteration correctly applied
    *   correct dimension of effective Higgs couplings in models with only one CP-odd state (SPheno failed to compile). Thanks to J. Ellis and A. Kvellestad
*   26.April 2016 **(4.8.5)**:
    *   Fixed (compiler dependent) problem with RGE running in SPheno in non-SUSY models (Thanks to A. Fowlie)
    *   fixed bug in two-loop corrections to pseudo-scalars (Thanks to P. Diessner)
*   19.April 2016 **(4.8.4)**:
    *   Changed default values for Les Houches input for several models
    *   added SLHA1-like SPheno.m for NMSSM/CPV
*   12.April 2016 **(4.8.3)**:
    *   Added model U1xMSSM
    *   patches in SPheno output: (i) ignoring empty list for EXTPAR, (ii) fixed complex phase in gaugino RGEs at 2-loop, (iii) solved problem with code generating in the presence of fermions that don't mix (bug added in v.4.8.2)
*   04.April 2016 **(4.8.2)**: Made sure that fields are correctly ordered in functions for non-SUSY RGEs
*   03.March 2016 **(4.8.1)**:
    *   Added micromegas main file with direct detection working with MO v4.2 and newer
    *   updated SPheno output of Wilson coefficients to work with [flavio](https://github.com/flav-io/flavio)
    *   fixes in calculation of B->Kll in FlavorKit
*   02.March 2016 **(4.8.0)**:
    *   Large speed improvement in non-SUSY RGEs
    *   SPheno output of scalar cross sections at 13,14 and 100 TeV
    *   refined NLO calculation to diphotons in light quark limit
    *   output of NP contributions to Wilson coefficients in FLHA blocks
*   18.February 2016 **(4.7.0)**:
    *   Precise calculation of diphoton and digluon rates with SPheno up to NNNLO
    *   UFO interface extended to read effective Hgg and H\gamma\gamma vertices from SPheno file
    *   some bug-fixes (MS-bar terms, UFO files support now states with more than 10 generations)
*   18.November 2015 **(4.6.0)**:
    *   routines to generates templates for particles and parameters file
    *   new functionality to match Yukawas/VEVs in SPheno
    *   many more small improvements: [Changelog for 4.6.0](Changelog.4.6.0)
*   18.June 2015 **(4.5.8)**:
    *   several small fixes for: FeynArts output with counter terms
    *   UFO output with neutral scalars appearing in one generation
    *   RGEs for SSDM;
*   02.June 2015 **(4.5.7)**:
    *   added support to colored propagators in LFV and QFV penugins
    *   added support of several unbroken non-abelian gauge groups to SPheno
    *   some improvements in CPV models with SPheno
    *   fix in non-SUSY RGEs for fermion mass terms
    *   removed 'overwrite' statement in Lagrangian definition of non-SUSY models
    *   fixed color factor in decays of non-fundamental colour representations in two fields which are also non-fundamental colour representations
*   24.April 2015 **(4.5.6)**:
    *   changed model files NMSSM/CPV and MSSM/CPV to include phases in charged Higgs sector (thanks to A. Voigt and S. Passher)
    *   added support of double charged Higgs in flavor observables at tree-level
    *   changed implementation of TSM and added SPheno.m
    *   rewrote Yukawa thresholds in SPheno (numerically equivalent, but easier to adjust)
    *   support of SPheno output in case of several unbroken gauge groups
*   11.April 2015 **(4.5.5)**:
    *   solved problem with running SPheno when compiled with specific gfortran version
    *   patched calculation of Dynkin and Casimir of a state defined as "-2" of SU(2)
*   08.April 2015 **(4.5.4)**:
    *   solved problem with non-susy RGEs for some models introduced with version 4.5.3
    *   possibility to define same phase for several states
*   27.March 2015 **(4.5.3)**:
    *   fixed problem with CGCs in non-susy RGEs in the presense of non-fundamental fields of broken groups
    *   changed convention how to set SM gauge and Yukawa couplings in SPheno for non-SUSY models
    *   added kinetic mixingup to two-loop to SUSY RGEs for B and T terms
    *   fixed sign in one-loop beta-function for gauge-dependent part of running VEVs in non-susy model s(Thanks to Tom Steudtner)
*   16.March 2015 **(4.5.1)**:
    *   fixed phase calculation of gluino in SPheno (thanks to Constantin Sluka)
    *   fixed problem with scalar 3-body decays in Z' models
    *   included CP splitting for Sgluons in MRSSM
*   11.March 2015 **(4.5.0)**:
    *   Diagrammatic calculation of two-loop Higgs masses with SPheno in generic models (in collaboration with Mark D. Goodsell and Kilian Nickel)
    *   three-body decays for scalars (S->SFF topologies) added (Thanks to Lukas Mitzka and Roberto Ruiz de Austri!)
    *   support of Fayet-Iliopoulowqs D-term for U(1) groups
    *   FlavorKit files updated to better catch special casses in combinations of C0 and B0-functions
*   08.January 2015 **(4.4.6)**: Fixed output problem for 3-body decays in SPheno
*   06.January 2015 **(4.4.5)**:
    *   Changed "FirstGuess" in SPheno in case of small tan(beta)
    *   fixed problem with Mathematica 10.0.2 in SPheno output
*   08.December 2014 **(4.4.4)**:
    *   WHIZARD output supports now v.2.2.3
    *   FlavorKit output includes Wilson coefficients
    *   adjusted input conventions for SPhenoNMSSM to SLHA2 in low scale mode.
*   27.November 2014 **(4.4.3)**:
    *   fixed compilation problem with long WHIZARD model files
    *   fixed tex problem for SU(N) with N>3
    *   simplified auxiliary interactions in CalcHep output which could cause compilation problems with MicrOmegas
*   20.November 2014 **(4.4.2)**:
    *   fixed problem with color factor in two-loop Higgs masses in the presence of scalar octets
    *   changed settings for 'SafeMode' in two loop calculation to start with larger step-size
    *   flag 'SkipFlavorKit=True' to skip FlavorKit output
*   09.November 2014 **(4.4.1)**: changed sign conventions in non-SUSY RGEs (global sign for Lagrangian terms removed)
*   04.November 2014 **(4.4.0)**:
    *   [Two-loop corrections to CP even scalars](http://arxiv.org/abs/arxiv:1411.0675) are calculated by SPheno in effective potential approach
    *   some more small changes and bug fixes: [Changelog for 4.4.0](Changelog.4.4.0)
*   11.September 2014 **(4.3.5)**: Some cosmetical changes in TeX output and several models
*   04.September 2014 **(4.3.4)**: Fixed compilation problem with SPheno if fine-tuning is turned on
*   19.August 2014 **(4.3.3)**:
    *   Support of CalcHep models with two DM candidates [(description)](MO_with_Two_DM_candidates.txt)
    *   new model SDDM with singlet and doublet DM candidates
*   14.August 2014 **(4.3.2)**: Fixed small compilation problem with SPheno and gfortran
*   26.July 2014 **(4.3.1)**:
    *   replaced CG coefficients for 3x8xbar(3) in CalcHep, MadGraph and WHIZARD output by Gell-Mann matrices
    *   fixed typo in some SPheno.m files (MAinput <->mAinput), because of the case-insensitivity of Fortran this hasn't caused any problem
    *   added check for R-symmetry in CalcHep/MicrOmegas output if no Z_2 is defined in model
    *   new flag for SPheno.m (UseBoundarySUSYatEWSB) if the boundary conditions defined in BoundarySUSY are used at MZ in the matching to SM parameters
*   10.July 2014 **(4.3.0)**: A face-lift to the SARAH front-end which provides also more information about the status of a current calculation.
*   18.June 2014 **(4.2.3)**:
    *   Better support of additional Lagrangian parameters in SPheno output
    *   added l_i -> l_j l_k l_k to FlavorKit; NHSSM as new model
    *   fixed calculation of mixing angle beta in singlet extensions in spc file
    *   fine-tuning now calculated at M_SUSY instead of M_Z
*   21.May 2014 **(4.2.2)**: Patched compatibility issue with WHIZARD; needs WHIZARD 2.2.1
*   07.May 2014 **(4.2.1)**: Added reference for FlavorKit; updated N-B-L-SSM and MDGSSM
*   06.May 2014 **(4.2.0)**:
    *   FlavorKit left beta-status
    *   new Models: MDGSSM and BxL-SSM
    *   improved handling of parameter dependence a bit
    *   initializing gluon phase in UFO output with 1
    *   changed running of SM parameters in calculation of precision observables
    *   SPheno output needs at least **SPheno 3.3.0**
*   26.March 2014 **(4.2.0beta)**:
    *   [New FlavorKit functionality (in collab. with W. Porod, A. Vicente) together with many new precision observables in SPheno output (e.g. Delta M_Bq, P -> l nu,B->s ll, epsilon_K)](FlavorKit.txt)
    *   bug fix in CalcHep output when using the CalcHep internal tree mass calculation (thanks to Waleed Abdallah)
    *   renamed in UFO output Feinstructure constant as aEWM1 to match MadGraph conventions (thanks to James Scoville)
    *   bug fix in color sum in 4-scalar vertices in SPheno output if non-fundamental, colored scalars or colored scalars appearing in only one generation are involved (thanks to A. Voigt, J. Park);
*   17.February 2014 **(4.1.0)**:
    *   Possibility to calculate the fine-tuning with SPheno ([Description](Changelog.4.1))
    *   added new model 'DiracNMSSM'
    *   check if all SM couplings are present in the model, if not, running of SM RGEs disabled in SPheno output
*   6\. February 2014 **(4.0.5)**:
    *   Fixed problem with FeynArts output (thanks to A. Bednyakov)
    *   fixed problem with numerical solutions of tadpole equations in SPheno for specific parameter combinations (thanks to D. Busbridge)
*   31.January 2014 **(4.0.4)**
    *   New function to check contraction of non-SUSY interactions (SA`LagrangianContractions)
    *   Fixed problems with 'CheckModel' for non-SUSY models (thanks to M. Hirsch)
    *   fixed calculation of rho-parameter in presence of triplet VEVs (thanks to W. Kotlarski, P. Diessner)
    *   fixed defintion of ThetaW in MRSSM (thanks to A. Voigt)
*   26.November 2013 **(4.0.3)**:
    *   Added check if parameters calculated from the tadpole equations in SPheno are real
    *   disabled calculation of vertices and loops in SPheno output for higher regimes
    *   added check to SPheno output if there are new contributions to EW VEV
    *   Fix in TeX output of Gauge Fixing terms
    *   Fix in loopmasses (affects only Rpm in MRSSM; Thanks to A.Voigt, W. Kotlarski)
    *   fix in non-SUSY RGEs of fermion mass terms (Thanks to M. Goodsell)
    *   new model SSDM (Thanks to D. Restrepo)
*   30.October 2013 **(4.0.2)**:
    *   Added Quiver models from [1310.4500](http://arxiv.org/abs/arxiv:1310.4500) (Thanks to A. Bharucha, A. Goudelis, M. McGarrie)
    *   Model 'DiracGauginos': decomposed scalar octet into real and imaginary component. (Thanks to D Busbridge)
    *   Fixed problem with SPheno output for B-L-SM and B-L-SM-IS
*   04.October 2013 **(4.0.1)**:
    *   Solved compatibility issue with MicrOmegas 3.X (Thanks to A. Pukhov)
    *   support of eff. Higgs vertices for CalcHep output in case of CPV. Changed MRSSM (added mu-term to get automatically B_mu; Thanks to P. Diessner).
*   27.September 2013 **(4.0.0)**: First final version of SARAH 4! Note, SPheno output needs SPheno 3.2.4\. See [1309.7223](http://arxiv.org/abs/arXiv:1309.7223) for a description of all new features.

# Older Versions

*   25.September 2013 (4b.0.1.16): Fixed compatibility issue with Mathematica 9
*   23.September 2013 (4b.0.1.8): New input format: SuperFields, ScalarFields, FermionFields; simplified syntax for superpotential; calculation of RGEs for non-SUSY models.
*   31.July 2013 (4b.0.0.10): Output of loop corrections includes new constant rMS to translate the results to bar(MS) scheme. rMS=0 is bar(DR), and rMS=1 corresponds to bar(MS). Fixed index problem in ghost contributions.
*   28.July 2013 (4b.0.0.9): Fixed typo in output of tadpole corrections due to fermions. Thanks to Wojciech Kotlarski.
*   26.July 2013 (4b.0.0.8): Fixed problem when vector bosons are defined before corresponding Goldstone in particles.m (Thanks to Adriano Sampieri); bug fix in the 2-loop RGEs in the case that Tr2 involved non-fundamental irreps (Thanks to Ken Van Tilburg).
*   17.July 2013 (4b.0.0.7): Including gauge fixing parameters in UFO output to handle Ghost vertices; support of multiplets of broken gauge groups which components are the sum of several states (i.e. the (1,1)-entry of a SU(3) octet can be written as a3 + a8/Sqrt(3) )
*   05.July 2013 (4b.0.0.6): Fix in output of pseudo scalar self-energy involving ghosts; entries of MINPAR/EXTPAR in LesHouches template created by SARAH only written if necessary; fix in HiggsBounds output of SPheno in case of several charged Higgs fields
*   24.May 2013 (4b.0.0.5): Minor improvements in SPheno output; added new model SM-8C; Fix in TeX-like output of self-energy of charged vector bosons (Thanks to A.Voigt)
*   16.May 2013 (4b.0.0.4): Beta-Functions of VEVs in RXi gauge (see 1305.1548); New flags for SPheno modules: SPhenoInput[61]=(1/0): run SM RGEs for low scale input or use values given in LesHouches file; SPhenoInput[62]=(1/0): run/don't run SUSY parameters in calculation of LowEnergy observables; SPhenoInput[14]=(1/0) run/don't run SUSY parameters in calculation of SUSY decays; SPhenoInput[530]=(1/0): write/don't write blocks necessary for Vevacious; fix in HiggsBounds output (eff. coupling ratios of pseudo scalars were wrong by a factor of 4)
*   16.May 2013 (3.3.2): Fixed compatibility issue with SPheno-3.2.3; bugfix in HiggsBounds output of SPheno
*   09.May 2013 (4b.0.0.3): Solved compatibility issue with SPheno-3.2.3
*   26.April 2013 (4b.0.0.2): Fixed problem in TeX-Output of Self-Energies; Fixed problem of UFO output in case of complex VEVs;
*   15.April 2013: Beta-Version of SARAH4 released. Improved support of non-SUSY models (see e.g. new model files for SM); Support of other Lie-Groups by linking Susyno; Changed color handling (non-fundamental irreps no longer treated as tensors); Support of color sextets in UFO output (see also new Model MSSM6C)
*   12.April 2013 (3.3.1): SPheno spectrum files include SM values for B_s/B_d decays; Added U(1)-charges to SPheno spectrum file which are variable (concerns UMSSM); solved problem with CalcHep output in case of CP violation;
*   20.December 2012 (3.3.0): SPheno output includes full one-loop calculation for $B_{s,d}^0 \to l_i \bar{l}_j$ (implementation together with Kilian Nickel); solved problem with SPheno output of models with several regimes on a Mac (thanks to Moritz McGarrie);
*   12.November 2012 (3.2.1): It could happen that Mathematica 8 displayed some error message when loading SARAH. This is fixed now.
*   6.November 2012 (3.2.0): Support of models with Dirac Gauginos; new models: MSSM/NMSSM with DiracGauginos, MRSSM
*   28.September 2012 (3.1.2): Added effective Higgs vertices to CalcHep output; writing c-code to run SPheno from CalcHep; added couplings_orders.py to UFO output; more information about Higgs sector included in SPheno output. [Complete changelog](Changelog.3.1.2)
*   27.June 2012 (3.1.1): Speed improvement in WHIZARD output; QCD correction to H-> glu glu and H-> photon photon in SPheno output; support of generalized PDG numbering scheme ('UsePDG.IX = True;')
*   15.June 2012 (3.1.0): main changes: UFO/Madgraph 5 output has left beta-status; gauge fixing terms no longer needed as input but derived by SARAH. [Complete changelog](Changelog.3.1.0)
*   6.Mach 2012 (3.0.41): main changes: basis for scalar mass matrices changed by a complex conjugation; small improvements in tex output; [Complete changelog](Changelog.3.0.41)
*   29.February 2012 (3.0.39): Main changes: possibility to define electric charge of particles; improved treatment of U(1) gauge couplings SPheno output. [Complete changelog](Changelog.3.0.39)
*   11.January 2012 (3.0.30): Main changes: renamed particle names in output, better support of phases in Higgs sector. Few bug fixes. [Complete changelog](Changelog3030). Thanks to Eduardo Ponton and Ben O`Leary.
*   3.January 2012 (3.0.27): B-L models included; option to include flags in SPheno code to switch off loop-contributions due to specific fields; bugfix in HiggsBounds output of SPheno (concerns A-H-Z coupling); rotation of heavy fields to mass eigenstates at each tresholds scale (e.g. Seesaw 3); known widths are written to WHIZARD model files; written main file for MicrOmegas writes main annihilation channels; calculation of Br(h->gg) corrected
*   24.November 2011 (3.0.23): Included W contributions for l -> 3l'; SPheno code runs now also with SPheno 3.1.5; widths of particles included in parameters file for WHIZARD written by SPheno
*   16.November 2011 (3.0.20): Changed convention of soft-breaking scalar masses to be in agreement with Martin/Vaughn (thanks to Filipe Joaquim), changed sign of PDGs for Charginos and charged Higgs to agree with conventions of SLHA 2 (thanks to Ben O`Leary), corrected Z-penguins in l->3l' in created SPheno code (thanks to Avelino Vicente); changed function for decays of scalars in two vector bosons (need SPheno 3.1.6!)
*   25.October 2011 (3.0.15): Beta version of output in UFO format: MakeUFO[]; (thanks to Florian Bonnet, Olivier Mattelaer, Clause Duhr, Benjamin Fuks and Johan Alwall for helpful discussion), SPheno output includes calculation of additional low energy constraints: b to s gamma, lepton to lepton' gamma, lepton to 3 lepton' (thanks to Avelino Vicente and Martin Hirsch for support), bug fix in LaTeX output using MakeAll[] (thanks to Arindam Das)
*   11.October 2011 (3.0.8): Enabled SPheno output for models in SCKM basis (MSSM/CKM, NMSSM/CKM); solved problem with FeynArts and TeX filenames for long model name; changed standard parametrization of EW sector in CalcHep/WHIZARD: Gf and alpah^-1 are taken as input now.
*   4.October 2011 (3.0.5): New function to check model (CheckModel); improved documentation of commands inside Mathematica
*   24.September 2011 (3.0.0): Final version of SARAH 3 online
*   21.September 2011 (3.0.beta32): Changes in input (rotations of gauge bosons; GUT scale of SPheno), see [Changes.txt](Changes_v30.txt) for more details. NOTE: Produced SPheno code needs at least SPheno 3.1.5! New models: TMSSM, TNMSSM
*   18.August 2011 (3.0.beta24): Calculation of neutrino masses with SPheno happens now at MZ; some bug fixes: in SPheno.m files for Seesaw I-III (thanks to M. Hirsch); in the check for vertices (concerns model MSSM-RpV-BnV; thanks to T.Slatyer); in the numerical calculations (thanks to C. Wells).
*   20.July 2011 (3.0.beta21): Model files for inverse seesaw included; small speed improvement in calculation of vertices
*   19.July 2011: Moved to hepforge.org
*   15.July 2011 (3.0.beta20b): Included possibility of complex VEVs
*   12.July 2011 (3.0.beta20): U(1) mixing included in RGEs, cf. [arXiv:1107.2670](http://arxiv.org/abs/1107.2670)
*   07.July 2011 (3.0.beta19): Created SPheno version supports HiggsBounds output: writes all necessary files HiggsBounds 3beta; also some low-energy constraints are now calculated by the new SPheno-modules: delta rho, g-2, EDM
*   20.June 2011 (3.0.beta18): Possibility of low-energy SPheno version
*   05.June 2011 (3.0.beta15): More checks of consistency of model files included
*   20.April 2011 (3.0.beta10): Extended possibility to define terms in the Lagrangian manually: extendes support of non-SUSY models
*   13.April 2011 (3.0.beta7): Included U(1) mixing in Lagrangian (i.e. appears in vertices, tadpoles, masses; RGEs not yet coverd)
*   4.April 2011 (3.0.beta5): No flag NoFlavorMixing for mass matrices
*   8.March 2011 (3.0.beta2): Output for WHIZARD/Omega (in collaboration with Christian Speckner)
*   02.December 2010 (3.0 beta): Beta version of the third version online: Source code generator for SPheno: Easy way to implement new models in SPheno. The new SPheno modules support for instance: 2-loop RGEs, 1-loop mass corrections, 2- and 3-body decays
*   21\. November 2010 (2.2.3): Simplified input of additional terms to the Lagrangian (changed SM model file in this context); Support of SLHAplus output of CalcHep; Renamed directories nMSSM and sMSSM to solve problem with file system without case-sensitivity (Thanks to Carol Phillips); New model: Inert doublet model (non-supersymmetric!); Automatic inclusion of mixed soft-breaking mass terms (Thanks to Martin Spinrath); Fix of F-Terms involving symmetric parameters (Thanks to Gao Tiejun)
*   02\. November 2010 (2.2.2): Change in FeynArts output: trigonometric functions replaced by constant variable, 'color' renamed to 'Colour', real parameters defined in model file (Thanks to Oscar Stahl); Change in RGEs: possibility of mixed anomalous dimension between two different superfields added; Supersymmetric left-right model added  

*   15\. October 2010 (2.2.1): Change in TeX main file; change in calculation of higherdimensional representations: contraction with epsilon tensor added; bug fix in flavor decompositon of scalars  

*   07\. October 2010 (2.2): Global definitions of properites for particle and parameters; LaTeX output improved; models reorder; new models: sMSSM,SMSSM,nMSSM, UMSSM; gauge fixing terms corrected; GUT normalization for U(1) couplings can be defined via parameters file  

*   17\. September 2010 (2.1.5): Problems with FeynArts output solved: naming of trilinear, scalar couplings changed; added definitions for gauge fixing parameters  

*   01\. July 2010 (2.1.4): Check of charge conservation in superpotential; new functions MassMatrix[field], TadpoleEquation[vev]: Easier to handle as MassMatricesFull[Eigenstates][[entry]] and TadpoleEquations[Eigenstates][[entry]]  

*   03\. June 2010 (2.1.3): Possibility to define Phases for particles added; RGEs for VEVs added  

*   16\. May 2010 (2.1.2): NMSSM in CKM basis added; minor changes in TeX output; RGEs of effective superpotential parameters added  

*   23\. April 2010 (2.1.1): Running of strong coupling in CalcHep-Output; Bugfix in model file for MSSM in CKM basis  

*   06\. April 2010 (2.1.0): Using SLHA 2 conventions: Trilinear, softbreaking parameters called T[X] and bilinear ones B[X]; function to name different flavors separately: DEFINITION[Eigenstates][Flavors]; Bugfix in TeX output of one loop tadpoles; New options for CalcRGEs: handle generations as variable, switch off matrix multipliction, support of parameters with three generation indices  

*   17\. February 2010 (2.0.1): CalcHep/CompHep: Possibility to suppress splitting of 4-Scalar-Vertices, Bugfix for interaction of auxiliary fields of vector bosons; Improvements of the function for reading LesHouches files; Bugfix in kovariant derivates (doesn't affect MSSM-Gauge-Sector)  

*   03\. February 2010 (2.0): Functions for RGEs and loop corrections, support of non-fundamental representations.  

*   15\. December 2009 (1.0.4): Changing convention for Ghost interactions in FeynArts Model to convention of FeynArts 3.5
*   14\. December 2009: Change in CalcHep-Output with CP-Violation (only in Lagrange file)
*   12\. November 2009 (1.0.3): Bug fix in ModelOutput (adresses only output of gauge eigenstates)
*   02\. October 2009 (1.0.2): Automatized numbering of particles in FeynArts models, if number is not defined
*   15\. September 2009 (1.0.1): Small changes in CompHep and LaTeX output
*   28\. August 2009: Final Version SARAH 1.0 online
