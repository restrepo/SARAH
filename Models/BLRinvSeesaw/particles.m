(* ////////////////////////////////////////////////////////////// *)
(*                  ParticlesDefintions[GaugeES]                  *)
(* ////////////////////////////////////////////////////////////// *)
       
ParticleDefinitions[GaugeES] = {
      (* -------------------------------------------------------- *)
      (* Fermions (Dirac/Majorana particles)                      *)
      (* -------------------------------------------------------- *)

      (* MSSM Fermions *)
  
      {Fd1,  { Description -> "Dirac Left Down-Quark"}},
      {Fd2,  { Description -> "Dirac Right Down-Quark"}},
      {Fu1,  { Description -> "Dirac Left Up-Quark"}},
      {Fu2,  { Description -> "Dirac Right Up-Quark"}},
      {Fe1,  { Description -> "Dirac Left Electron"}},
      {Fe2,  { Description -> "Dirac Right Electron"}},
      {Fv1,  { Description -> "Neutrinos" }},

      (* New Fermions *)

      {Fv2,  {                PDG -> {0, 0, 0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\nu_R",
               OutputName -> "nR"}},

      {FS0,  {                PDG -> {0, 0, 0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "F_{S0}",
               OutputName -> "FS0" }},

      (* -------------------------------------------------------- *)
      (*  Sfermions                                               *)       
      (* -------------------------------------------------------- *)
     
      (* MSSM Sfermions *)

      {SdL,  { Description -> "Left Down-Squarks"}},
      {SdR,  { Description -> "Right Down-Squarks"}},
      {SuL,  { Description -> "Left Up-Squarks"}},
      {SuR,  { Description -> "Right Up-Squarks" }},
      {SeL,  { Description -> "Left Selectron"}},
      {SeR,  { Description -> "Right Selectron"}},
      {SvL,  { Description -> "Left Sneutrino"}},
      
      (* New Sfermions *)

      {SvR,  {                PDG -> {0, 0, 0},
               Width -> 0, 
               Mass -> Automatic,
               LaTeX -> "\\tilde{\\nu}_R",
               OutputName -> "SR" }},
      
      {Ssi,  {  PDG -> {0, 0, 0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\tilde{S}",
               OutputName -> "Ss" }},

      (* -------------------------------------------------------- *)
      (* Higgs                                                    *)       
      (* -------------------------------------------------------- *)
      
      (* MSSM Higgs *)

      {SHd0, { Description -> "Neutral Down-Higgs"}},
      {SHdm, { Description -> "Charged Down-Higgs"}},
      {SHu0, { Description -> "Neutral Up-Higgs"}},
      {SHup, { Description -> "Charged Up-Higgs"}},      

      (* New Higgs *)

      {SchiR0, {
	                      PDG -> {0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\chi_R^0",
               OutputName -> "ScR" }},

      {SchiRbar0, {
	                      PDG -> {0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\bar{\\chi}_R^0",
               OutputName -> "SRb" }},
       
      (* -------------------------------------------------------- *)
      (* Higgsinos (Dirac particles)                              *)
      (* -------------------------------------------------------- *)

      (* MSSM Higgsinos *)

      {H0,   { Description -> "Neutral Higgsinos"}},
      {HC,   { Description -> "Charged Higgsinos"}},

      (* New Higgsinos *)

      {ChiR0, {
               PDG -> {0},
               Mass -> Automatic,
               LaTeX -> "\\tilde{\\chi}^0_R",
               OutputName -> "CR0" }},

      (* -------------------------------------------------------- *)
      (* Gauge Bosons and Ghosts                                  *)       
      (* -------------------------------------------------------- *)
     
      (* MSSM Gauge Bosons *)

      {VB,   { Description -> "B-Boson"}},
      {VG,   { Description -> "Gluon"}},

      {VWL,  { Description -> "W-Bosons",
               FeynArtsNr -> 2,
               LaTeX -> "W",
               OutputName -> "W" }}, 


      
      (* New Gauge Bosons *)

      {VBR,  { 	       PDG -> {0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "B_R",
               OutputName -> "BR" }},
      
      (* MSSM Ghosts *)

      {gB,   { Description -> "B-Boson Ghost"}},
      {gG,   { Description -> "Gluon Ghost" }},
      {gWL,  { Description -> "W-Boson Ghost"}},
      {Glu,  { Description -> "Gluino"}},
      {Wino, { Description -> "Wino"}},
      {Bino, { Description -> "Bino"}},

      (* New Ghosts *)

      {gBR,  { PDG -> {0},
               Width -> 0, 
               Mass -> Automatic,
               LaTeX -> "\\eta^{B_R}",
               OutputName -> "gBR" }},
      
      (* -------------------------------------------------------- *)
      (* Gauginos (Majorana particles)                            *)
      (* -------------------------------------------------------- *)

      (* MSSM Gauginos *)

      {Glu,  { Description -> "Gluino"}},
      {Wino, { Description -> "Wino"}},
      {Bino, { Description -> "Bino"}},

      (* New Gauginos *)

      {BinoR, {
               PDG -> {0},
               LaTeX -> "{\\tilde{B}_R'}",
               OutputName -> "FBR"}}
      
};



(* ////////////////////////////////////////////////////////////// *)
(*                   ParticlesDefintions[EWSB]                    *)
(* ////////////////////////////////////////////////////////////// *)

ParticleDefinitions[EWSB] = { 
      (* -------------------------------------------------------- *)
      (* Fermions (Dirac/Majorana particles)                      *)
      (* -------------------------------------------------------- *)

      {Fd,   { Description -> "Down-Quarks"}},
      {Fu,   { Description -> "Up-Quarks"}},
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos",
	       LaTeX -> "\\nu",
               OutputName -> "v",
               ElectricCharge -> 0,
	       PDG -> {12,14,16,9000012,9000014,9000016,9000050,9000051,9000052},
               PDG.IX ->{111000001,111000002,111000003,111000004,111000005,111000006,111000007,111000008,111000009 }
}},      

      (* -------------------------------------------------------- *)
      (*  Sfermions                                               *)       
      (* -------------------------------------------------------- *)
      
      {Sd ,  { Description -> "Down-Squarks"}},
      {Su ,  { Description -> "Up-Squarks"}},
      {Se ,  { Description -> "Sleptons"}},
      {Sv ,  { Description -> "Sneutrinos",
	       LaTeX -> "\\tilde{\\nu}",
               OutputName -> "Sv",
	       PDG -> {1000012,1000014,1000016,2000012,2000014,2000016,3000012,3000014,3000016},
                PDG.IX ->{200000001,200000002,200000003,200000004,200000005,200000006,200000007,200000008,200000009}}},
      

      (* -------------------------------------------------------- *)
      (* Higgs                                                    *)
      (* -------------------------------------------------------- *)

      {hh , { Description -> "Higgs",
              PDG -> {25,35,225,232},
                PDG.IX->{101000001,101000002,101000003,101000004}}},

      {Ah , { Description -> "Pseudo-Scalar Higgs",
              PDG->{0,0,36,236},
                PDG.IX->{0,0,102000001,102000002}}},

      {Hpm, { Description -> "Charged Higgs"}},

      (* -------------------------------------------------------- *)
      (* Gauge Bosons and Ghosts                                  *)       
      (* -------------------------------------------------------- *)
      
      (* MSSM Gauge Bosons *)

      {VP,   { Description -> "Photon"}},
      {VZ,   { Description -> "Z-Boson" }},
      {VG,   { Description -> "Gluon" }},
      {VWm,  { Description -> "W-Boson"}},

      (* New Gauge Bosons *)

      {VZR,  {                Mass -> LesHouches,
               ElectricCharge -> 0,
               LaTeX -> "Z_R",
               PDG -> {99},
               PDG.IX ->{122000002},
               OutputName -> "VZR",
               FeynArtsNr -> 7,
               Goldstone->Ah[{2}] }},

      (* MSSM Ghosts *)

      {gP,   { Description -> "Photon Ghost"}},
      {gWm,  { Description -> "Negative W-Boson Ghost"}},
      {gWmC, { Description -> "Positive W-Boson Ghost" }},
      {gZ,   { Description -> "Z-Boson Ghost" }},
      {gG,   { Description -> "Gluon Ghost" }},

      (* New Ghosts *)

      {gZR,  { 	       PDG -> 0,
               Width -> 0,
               Mass -> Automatic,
               ElectricCharge->0,
               LaTeX -> "\\eta^{Z_R}",
               FeynArtsNr -> 7,
               OutputName -> "gZR" }},

      (* -------------------------------------------------------- *)
      (* Gauginos (Dirac/Majorana particles)                      *)
      (* -------------------------------------------------------- *)
      
      {Glu,  { Description -> "Gluino" }},
      {Chi,  { Description -> "Neutralinos",
	       PDG -> {1000022,1000023,1000025,1000035,9000001,9000002,9000003},
               PDG.IX ->{211000001,211000002,211000003,211000004,211000005,211000006,211000007} }},
      {Cha,  { Description -> "Charginos",
               ElectricCharge -> -1}}

}; 



(* ////////////////////////////////////////////////////////////// *)
(*                   WeylFermionAndIndermediate                   *)
(* ////////////////////////////////////////////////////////////// *)

WeylFermionAndIndermediate = {

      (* -------------------------------------------------------- *)
      (* Superfields                                              *)       
      (* -------------------------------------------------------- *)
      
      (* MSSM superfields *)

      {l,    { Description -> "left Lepton Superfield" }},
      {e,    { Description -> "Right Electron Superfield" }},

      {q,    { Description -> "Left Quark Superfield" }},
      {d,    { Description -> "Right Down-Quark Superfield" }},
      {u,    { Description -> "Right Up-Quark Superfield" }},
      
      {Hd,   { Description -> "Down-Higgs Superfield"}},
      {Hu,   { Description -> "Up-Higgs Superfield" }},

      {G,    { Description -> "Gluon Superfield" }},
      {B,    { Description -> "B Superfield" }},
      {WL,   { Description -> "W Superfield" }},

      (* new superfields *)

      {BR,   { LaTeX -> "\\hat{B}_R"}},

      {ChiR,    { LaTeX -> "\\hat{\\chi}_R"}},
      {ChiRbar, { LaTeX -> "\\hat{\\bar{\\chi}}_R"}},

      {v,    { LaTeX -> "\\hat{\\nu}"}},      
       
      {S,    { LaTeX -> "\\hat{S}"}},

      (* -------------------------------------------------------- *)
      (* Fermions (Weyl-Spinor)                                   *)
      (* -------------------------------------------------------- *)
      
      (* ------------------------ GaugeES ----------------------- *)
      
      (* MSSM Fermions *)

      {Fl,   { Description -> "Left Leptons"}},
      {Fq,   { Description -> "Left Quarks"}},

      {FeL,  { Description -> "Left Electron" }},
      {FeR,  { Description -> "Right Electron" }} ,
      {FvL,  { Description -> "Left Neutrino"}},
      
      {FdL,  { Description -> "Left Down-Quark" }},
      {FdR,  { Description -> "Right Down-Quark" }},
      {FuL,  { Description -> "Left Up-Quark" }},
      {FuR,  { Description -> "Right Up-Quark" }},

      (* New Fermions *)

      {FvR,  {                PDG -> {0, 0, 0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "\\nu_R",
               OutputName -> "FvR"}},

      {Fsi, {                 PDG -> {0, 0, 0},
               Width -> 0,
               Mass -> Automatic,
               LaTeX -> "S",
               OutputName -> "FS" }},
       
      (* ------------------------- MassES ----------------------- *)

      (* MSSM Fermions *)
       
      {FEL,  { Description -> "Rotated Left Electron" }},
      {FER,  { Description -> "Rotated Right Electron" }},
      {FDL,  { Description -> "Rotated Left Up-Quark" }},
      {FDR,  { Description -> "Rotated Right Up-Quark" }},              
      {FUL,  { Description -> "Rotated Left Down-Quark"}},
      {FUR,  { Description -> "Rotated Right Down-Quark" }},

      (* New Fermions *)

      {Fv0,  { 	       PDG -> {0, 0, 0, 0, 0, 0, 0, 0, 0},
               LaTeX -> "\\nu_0",
               OutputName -> "Fv0"}},

      (* -------------------------------------------------------- *)
      (*  Sfermions                                               *)       
      (* -------------------------------------------------------- *)
     
      (* MSSM Sfermions *)

      {Sl,   { Description -> "Left Slepton" }},
      {Sq,   { Description -> "Left Squark" }}, 
      
      (* New Sfermions *)

      (* ... only new SU(2)-doublets ... *) 
      
      (* -------------------------------------------------------- *)
      (* Higgs                                                    *)       
      (* -------------------------------------------------------- *)

      (* MSSM Higgs *)

      {SHd,  { Description -> "Down-Higgs"}},
      {SHu,  { Description -> "Up-Higgs"}},

      {phid, { Description -> "Scalar Down"}},
      {phiu, { Description -> "Scalar Up"}},
      {sigmad,   { Description -> "Pseudo Scalar Down"}},
      {sigmau,   { Description -> "Pseudo Scalar Up" }},

      (* New Higgs *)

      {SChiR,     { PDG -> 0,
	            LaTeX -> "\\chi_R",
                    OutputName -> "SChiR"}},
      {SChiRbar,  { PDG -> 0,
                    LaTeX -> "\\bar{\\chi}_R",
                    OutputName -> "SChiRb"}},
      
      {sigmaChiR,    { PDG -> 0,
                       LaTeX -> "{\\sigma}_R",
                       OutputName -> "sigChiR"}},
      {sigmaChiRbar, { PDG -> 0,
                       LaTeX -> "\\bar{\\sigma}_R",
                       OutputName -> "sigChiRb"}},
      {phiChiR,    { PDG -> 0,
                     LaTeX -> "{\\phi}_R",
                     OutputName -> "phiChiR"}},      
      {phiChiRbar, { PDG -> 0,
                     LaTeX -> "\\bar{\\phi}_R",
                     OutputName -> "phiChiRb"}},

      (* -------------------------------------------------------- *)
      (* Higgsinos (Weyl-Spinor)                                  *)       
      (* -------------------------------------------------------- *)
      
      (* MSSM Higgsinos *)

      {FHd,  { Description -> "Down-Higgsino" }},
      {FHu,  { Description -> "Up-Higgsino" }},
      
      {FHd0, { Description -> "Neutral Down-Higgsino"}},
      {FHu0, { Description -> "Neutral Up-Higgsino" }},
      {FHdm, { Description -> "Charged Down-Higgsino"}},
      {FHup, { Description -> "Charged Up-Higgsino"}},

      (* New Higgsinos *)

      {FChiR, {LaTeX -> "\\tilde{\\chi}_R"}},
      {FChiRbar, {LaTeX -> "\\tilde{\\bar{\\chi}}_R"}},
      
      {FchiR0, { LaTeX -> "\\tilde{\\chi}_R^0" }},
      {FchiRbar0, { LaTeX -> "\\tilde{\\bar{\\chi}}_R^0" }},
      
      (* -------------------------------------------------------- *)
      (* Gauginos (Weyl-Spinor)                                   *)       
      (* -------------------------------------------------------- *)
      
      (* ------------------------ GaugeES ----------------------- *)

      (* MSSM Gauginos *)

      {fB,   { Description -> "Bino Weyl-Spinor"}},
      {fWL,  { Description -> "Wino Weyl-Spinor"}},
      {fG,   { Description -> "Gluino Weyl-Spinor"}},
      
      (* New Gauginos *)

      {fBR,  { PDG -> 0,
               LaTeX -> "\\lambda_{R}",
               OutputName -> "fBR" }},

      (* ------------------------- EWSB ------------------------- *)

      {fW0,  { Description -> "Neutral Wino" }},
      {fWm,  { Description -> "Negative Wino"}},
      {fWp,  { Description -> "Positive Wino"}}, 

      (* ------------------------ MassES ------------------------ *)      
      
      {L0,   { Description -> "Neutralino Weyl-Spinor"}},
      {Lm,   { Description -> "Negative Chargino Weyl-Spinor"}},
      {Lp,   { Description -> "Positive Chargino Weyl-Spinor"}}

};       




