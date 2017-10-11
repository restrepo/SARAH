modname = radinuZeeHB  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables:SM 
name = ../lib/libSPhenoradinuZeeHB.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoradinuZeeHB:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoradinuZeeHB.o 
	 ${F90} -o SPhenoradinuZeeHB ${LFlagsB} SPhenoradinuZeeHB.o ../lib/libSPhenoradinuZeeHB.a ../lib/libSPheno.a
	 mv SPhenoradinuZeeHB ../bin
	 rm SPhenoradinuZeeHB.o  
${name}:  ${name}(Settings.o) ${name}(Model_Data_radinuZeeHB.o)  \
 ${name}(RGEs_radinuZeeHB.o)   \
 ${name}(Couplings_radinuZeeHB.o) ${name}(TreeLevelMasses_radinuZeeHB.o) ${name}(TadpoleEquations_radinuZeeHB.o) \
 ${name}(LoopCouplings_radinuZeeHB.o) ${name}(CouplingsForDecays_radinuZeeHB.o) \
 ${name}(TreeLevel_Decays_radinuZeeHB.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(2LPoleFunctions.o) ${name}(2LPole_radinuZeeHB.o) \
 ${name}(LoopMasses_radinuZeeHB.o) \
 ${name}(RGEs_SM_HC.o) ${name}(Couplings_SM_HC.o) ${name}(TreeLevelMasses_SM_HC.o) ${name}(LoopMasses_SM_HC.o)   \
${name}(CouplingsCT_radinuZeeHB.o) \
${name}(Bremsstrahlung.o) ${name}(DecayFFS.o) ${name}(DecayFFV.o) ${name}(DecaySSS.o) ${name}(DecaySSV.o) ${name}(DecaySFF.o) ${name}(DecaySVV.o) \
 ${name}(LoopDecayFu_radinuZeeHB.o)  ${name}(LoopDecayFe_radinuZeeHB.o)  ${name}(LoopDecayFd_radinuZeeHB.o)  ${name}(LoopDecayFv_radinuZeeHB.o)  ${name}(LoopDecayhh_radinuZeeHB.o)  ${name}(LoopDecayHm_radinuZeeHB.o)  ${name}(LoopDecayetI_radinuZeeHB.o) \
 ${name}(Wrapper_LoopDecay_Fu_radinuZeeHB.o)  ${name}(Wrapper_LoopDecay_Fe_radinuZeeHB.o)  ${name}(Wrapper_LoopDecay_Fd_radinuZeeHB.o)  ${name}(Wrapper_LoopDecay_Fv_radinuZeeHB.o)  ${name}(Wrapper_LoopDecay_hh_radinuZeeHB.o)  ${name}(Wrapper_LoopDecay_Hm_radinuZeeHB.o)  ${name}(Wrapper_LoopDecay_etI_radinuZeeHB.o) ${name}(OneLoopDecays_radinuZeeHB.o) \
 ${name}(BranchingRatios_radinuZeeHB.o) ${name}(HiggsCS_radinuZeeHB.o) ${name}(RunSM_radinuZeeHB.o) \
 ${name}(LowEnergy_radinuZeeHB.o) \
${name}(FlavorKit_LFV_radinuZeeHB.o) ${name}(FlavorKit_QFV_radinuZeeHB.o) ${name}(FlavorKit_Observables_radinuZeeHB.o)\
 ${name}(Boundaries_radinuZeeHB.o)  ${name}(InputOutput_radinuZeeHB.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc -U $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
