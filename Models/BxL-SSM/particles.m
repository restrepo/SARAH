
ParticleDefinitions[GaugeES] = {
      {SdL,  {  Description -> "Left Down-Squarks",
                 LaTeX -> "\\tilde{d}_L^0"  }},
      {SdR,  { Description -> "Right Down-Squarks",
                 LaTeX -> "\\tilde{d}_R^0"}},
      {SuL,  { Description -> "Left Up-Squarks",
                 LaTeX -> "\\tilde{u}_L^0"}}, 
      {SuR,  { Description -> "Right Up-Squarks",
                 LaTeX -> "\\tilde{u}_R^0" }},                
      {SeL,  { Description -> "Left Selectron"}}, 
      {SeR,  { Description -> "Right Selectron"}},                         
      {SvL,  { Description -> "Left Sneutrino"}},                         
      {SHd0, { Description -> "Neutral Down-Higgs"}},                         
      {SHdm, { Description -> "Charged Down-Higgs"}}, 
      {SHu0, { Description -> "Neutral Up-Higgs"}},                         
      {SHup, { Description -> "Charged Up-Higgs"}},                                                   
      {VB,   { Description -> "B-Boson"}},                                                   
      {VG,   { Description -> "Gluon"}},          
      {VWB,  { Description -> "W-Bosons"}},          
      {gB,   { Description -> "B-Boson Ghost"}},                                                   
      {gG,   { Description -> "Gluon Ghost" }},          
      {gWB,  { Description -> "W-Boson Ghost"}},    
      {Glu,  { Description -> "Gluino"}},
      {Wino, { Description -> "Wino"}},
      {Bino, { Description -> "Bino"}},                                                                                           
      {H0,   { Description -> "Neutral Higgsinos"}},
      {HC,   { Description -> "Charged Higgsinos"}}, 
      {SvR,  { Description -> "Right Sneutrino"}},                                         

      {FB,  { Description -> "Bino'"}},
      {VBp,  { Description -> "B'-Boson"}},
      {gBp,  { Description -> "B'-Boson Ghost"}},    

      {SC10,  {  PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 102,
                 LaTeX -> "\\eta",
                 OutputName -> "C1" }},    


      {SC20,  {  PDG -> {0},
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 103,
                 LaTeX -> "\\bar{\\eta}",
                 OutputName -> "C2" }},  


                 
      {FvR,    { PDG -> {9910012,9910014,9910016},
                 Width -> {0, 0, 0}, 
                 Mass -> Automatic,
                 FeynArtsNr -> 1,
                 LaTeX -> "\\nu_R",
                 OutputName -> "nR" }},       
      
      


      {Pino,    { PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 20,
                 LaTeX -> "{\\tilde{B}'}",
                 OutputName -> "bp" }},

     {C10,    {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 123,
                 LaTeX -> "\\tilde{\\eta}",
                 OutputName -> "TC1" }},
        
      {C20,    {  PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 FeynArtsNr -> 124,
                 LaTeX -> "\\tilde{\\bar{\\eta}}",
                 OutputName -> "TC2" }},

      {Fd1,  { Description -> "Dirac Left Down-Quark"}},
      {Fd2,  { Description -> "Dirac Right Down-Quark"}},
      {Fu1,  { Description -> "Dirac Left Up-Quark"}},
      {Fu2,  { Description -> "Dirac Right Up-Quark"}},
      {Fe1,  { Description -> "Dirac Left Electron"}},
      {Fe2,  { Description -> "Dirac Right Electron"}},
      {Fv1,   { Description -> "Dirac Left Neutrino" }},
      {Fv2,   { Description -> "Dirac Right Neutrino" }},
      {FC,    { LaTeX -> "C",
                FeynArtsNr -> 20,
                OutputName -> "FC"}}
      };
      

ParticleDefinitions[TEMP] = {
      {SdL,  {  Description -> "Left Down-Squarks"}},
      {SdR,  { Description -> "Right Down-Squarks"}},
      {SuL,  { Description -> "Left Up-Squarks"}}, 
      {SuR,  { Description -> "Right Up-Squarks" }},
      {VB1,   { LaTeX -> "B_1"}},
      {VB2,   { LaTeX -> "B_2"}}
            };   
      
      
      
  ParticleDefinitions[EWSB] = {
      {Sd ,  { Description -> "Down-Squarks" }},
      {Su ,  { Description -> "Up-Squarks"             }},   
      {Se ,  { Description -> "Sleptons"}}, 


     {Sdp, {    PDG ->  {3000001, 3000003, 3000005, 3000007},
                PDG.IX -> {-200890205,-200890206,-200890207,-200890208,-200890209,-200890210},
                Mass -> LesHouches,
                FeynArtsNr -> 44,   
                LaTeX -> "\\tilde{d}^{'}",
                ElectricCharge -> -1/3,
                LHPC -> {7, "cyan"},
                OutputName -> "sdp" }},
           
      {Sup, {   PDG ->  { 3000002, 3000004, 3000006, 3000008},
               PDG.IX -> {200100407,200100408,200100409,200100410},
                Mass -> LesHouches,
                FeynArtsNr -> 43,   
                ElectricCharge -> 2/3,
                LaTeX -> "\\tilde{u}^{'}",
                LHPC -> {7, "blue"},
                OutputName -> "sup" }},   
                
     
     {Sep,    { 
                PDG ->  {3000011,3000013,3000015,3000017},
                PDG.IX -> {-200000607,-200000608,-200000609,-200000610},
                Mass -> LesHouches,
                FeynArtsNr -> 42,  
                ElectricCharge -> -1, 
                LaTeX -> "\\tilde{e}^{'}",
                LHPC -> {5, "green"},
                OutputName -> "sep" }}, 



      {SvRe,  { Description -> "CP-even Sneutrino" }},
      {SvIm ,  {Description -> "CP-odd Sneutrino"}},

  {SvRep, { Description -> "CP-even Sneutrino",
         LaTeX -> "\\nu^{R'}",
         OutputName -> "nRp",
         FeynArtsNr -> 51,
         LHPC -> {5, "blue"},
                PDG ->  {3000012,3000014,3000016,3000018},
                PDG.IX ->{200000007,200000008,200000009,200000010}}}, 
                               
   {SvImp, {  LaTeX -> "\\nu^{I'}",
         OutputName -> "nIp",
         FeynArtsNr -> 50,
         LHPC -> {5, "turquoise"},
                 PDG->{6000012,6000014,6000016,6000018},
                 PDG.IX ->{202000007,202000008,202000009,202000010}}},       



      {hh ,  { Description -> "Higgs",
                PDG -> {25,35,9900025, 9900035, 9900045, 9900055},
                PDG.IX->{101000001,101000002,101000003,101000004,101000005,101000006}  }}, 
      {Ah ,  { Description -> "Pseudo-Scalar Higgs",
 				PDG -> {0,0,0,36,9900036,9900046},
                PDG.IX->{0,0,0,102000001,102000002,102000003} }},                       
      {Hpm,  { Description -> "Charged Higgs"}},   

      {SX,   {   PDG -> {8100000,8100001},
                 FeynArtsNr -> 8,
                 LaTeX -> {"\\tilde{X}"},
                 ElectricCharge -> 0,
                 OutputName -> {"SX","SX"} }}, 

      {FX,   {   PDG -> {9100000},
                 FeynArtsNr -> 8,
                 LaTeX -> {"X"},
                 ElectricCharge -> 0,
                 OutputName -> {"FX"} }}, 
                                               
                                                
      {VP,   { Description -> "Photon"}}, 
      {VZ,   { Description -> "Z-Boson"}}, 
      {VG,   { Description -> "Gluon" }},          
      {VWm,  { Description -> "W-Boson" }},         
      {gP,   { Description -> "Photon Ghost"}},                                                   
      {gWm,  { Description -> "Negative W-Boson Ghost"}}, 
      {gWmC, { Description -> "Positive W-Boson Ghost" }}, 
      {gG,   { Description -> "Gluon Ghost" }},
      {gZ,   { Description -> "Z-Boson Ghost" }},     
      {Fd,   { Description -> "Down-Quarks"}},   
      {Fu,   { Description -> "Up-Quarks"}},   
      {Fe,   { Description -> "Leptons" }},
      {Fv,   { Description -> "Neutrinos",
                Mass -> Automatic,
                Width -> Automatic,
    			PDG ->{12,14,16,112,114,116},
                     PDG.IX->{111000001,111000002,111000003,111000004,111000005,111000006 } }},      

     {Fdp, {     PDG -> {401,403},
                 PDG.IX->{-110890204,-110890205},
                 FeynArtsNr -> 64,
                 LaTeX -> "dp",
                 ElectricCharge -> -1/3,
                 OutputName -> "dp" }},   
                 
      {Fup, {    PDG -> {402, 404},
                 PDG.IX->{110100404,110100405},
                 Mass -> Automatic,
                 Width -> Automatic,
                 FeynArtsNr -> 63,
                 LaTeX -> "up",
                 ElectricCharge -> 2/3,
                 OutputName -> "up" }},   
                 
      {Fep,  {   Description -> "Leptons",
                 PDG -> {411,413},
                 PDG.IX -> {-110000604,-110000605},
                 Mass -> Automatic,
                 Width -> Automatic,
                 FeynArtsNr -> 62,
                 LaTeX -> "ep",
                 ElectricCharge -> -1,
                 OutputName -> "ep" }},
                 
      {Fvp,  {    Description -> "Neutrinos",
                 PDG -> {312,314,316,318},
                 PDG.IX ->{,111000007,111000008,111000009,1110000010},
                 Mass -> Automatic,
                 Width -> Automatic,
                 FeynArtsNr -> 61,
                 ElectricCharge -> 0,
                 LaTeX -> "\\nu^{'}",
                 OutputName -> "nup" }}, 



      {Glu,  { Description -> "Gluino" }},
      {Cha,  { Description -> "Charginos"}},                                      


      
                                                                               
      {VZp,    { Description -> "Z'-Boson"}},
      {VZpp,    {  PDG -> {32},
                   PDG.IX -> {122000003},
                   FeynArtsNr -> 11,
                   LaTeX -> "{Z^{''}}",
                   Goldstone -> Ah[{3}],
                   ElectricCharge -> 0,
                   OutputName -> "Zpp"}},

      {gZp,    { Description -> "Z'-Ghost"}},
      {gZpp,    {  PDG -> 0,
                   PDG.IX -> 0,
                   Width -> 0, 
                   Mass -> Automatic,
                   FeynArtsNr -> 11,
                   LaTeX -> "\\eta^{Z^{''}}",
                   ElectricCharge -> 0,
                   OutputName -> "gZpp"}},              
       
      {Chi,    { Description -> "Neutralinos",
                 PDG -> {1000022,1000023,1000025,1000035,1000032,1000036,1000039,3000032,3000033,3000035},
                 PDG.IX ->{211000001,211000002,211000003,211000004,211000005,211000006,211000007,211000008,211000009,211000010 }
                }}
                

        };    
        
        
        
WeylFermionAndIndermediate = {
       {FHd0, { Description -> "Neutral Down-Higgsino"}},      
       {FHu0, { Description -> "Neutral Up-Higgsino" }}, 
       {FHdm, { Description -> "Charged Down-Higgsino"}},  
       {FHup, { Description -> "Charged Up-Higgsino"}},
       {L0,   { Description -> "Neutralino Weyl-Spinor"}},
       {Lm,   { Description -> "Negative Chargino Weyl-Spinor"}},
       {Lp,   { Description -> "Positive Chargino Weyl-Spinor"}}, 
       {fG,   { Description ->"Gluino Weyl-Spinor"}},
       {fWB,  { Description ->"Wino Weyl-Spinor"}},
       {fW0,  { Description ->"Neutral Wino" }},
       {fWm,  { Description ->"Negative Wino"}},                 
       {fWp,  { Description ->"Positive Wino"}},                 
       {fB,   { Description ->"Bino Weyl-Spinor"}},    
       {phid, { Description -> "Scalar Down"}},                                                                       
       {phiu, { Description -> "Scalar Up"}}, 
       {sigmad,   { Description -> "Pseudo Scalar Down"}},                                                                                        
       {sigmau,   { Description -> "Pseudo Scalar Up" }},
       {SHd,  { Description -> "Down-Higgs"}},
       {SHu,  { Description -> "Up-Higgs"}},
       {Sl,   { Description -> "Left Slepton" }},
       {Sq,   { Description -> "Left Squark" }},
       {FeL,  { Description -> "Left Electron" }},
       {FeR,  { Description -> "Right Electron" }} ,
       {FdL,  { Description -> "Left Down-Quark" }},
       {FdR,  { Description -> "Right Down-Quark" }},              
       {FuL,  { Description -> "Left Up-Quark" }},
       {FuR,  { Description -> "Right Up-Quark" }},
       {FDL,  { Description -> "Rotated Left Up-Quark" }},
       {FDR,  { Description -> "Rotated Right Up-Quark" }},              
       {FUL,  { Description -> "Rotated Left Down-Quark"}},
       {FUR,  { Description -> "Rotated Right Down-Quark" }},                
       {FEL,  { Description -> "Rotated Left Electron"}},
       {FER,  { Description -> "Rotated Right Electron" }},                
       {FHd,  { Description -> "Down-Higgsino" }},
       {FHu,  { Description -> "Up-Higgsino" }},
       {Fl,   { Description -> "Left Leptons"}},
       {Fq,   { Description -> "Left Quarks"}},  
       {FvL,  { Description -> "Left Neutrino"}},                         

       {e,    { Description -> "Right Electron Superfield" }},
       {d,    { Description -> "Right Down-Quark Superfield" }},                 
       {q,    { Description -> "Left Quark Superfield" }},                 
       {u,    { Description -> "Right Up-Quark Superfield" }},                 
       {l,    { Description -> "left Lepton Superfield" }},  
       {Hd,   { Description -> "Down-Higgs Superfield"}},                                         
       {Hu,   { Description -> "Up-Higgs Superfield" }},                 
       {G,    { Description -> "Gluon Superfield" }},                 
       {B,    { Description -> "B Superfield" }},                 
       {Bp,    { LaTeX -> "\\hat{B}'" }},
       {fBp,    { LaTeX -> "\\lambda_{B'}" }},
       
       {WB,   { Description -> "W Superfield" }},
       {vR,   { Description -> "Right Neutrino Superfield" }},
       {C1,   { LaTeX  -> "\\hat{\\eta}" }},
       {C2,   { LaTeX  -> "\\hat{\\bar{\\eta}}" }},

       {FC10,   { LaTeX  -> "\\tilde{\\eta}" }},
       {FC20,   { LaTeX  -> "\\tilde{\\bar{\\eta}}" }},


       {phi1,   { LaTeX  -> "\\phi_{\\eta}" }},
       {phi2,   { LaTeX  -> "\\phi_{\\bar{\\eta}}" }},

                
       {fBp,   { PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "{\\tilde{B}{}'}",
                 OutputName -> "" }},  
                 
                                                                                       
    {sigma1,   { PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{\\eta}",
                 OutputName -> "" }},
                                                                                        
    {sigma2,   { PDG -> 0,
                 Width -> 0, 
                 Mass -> Automatic,
                 LaTeX -> "\\sigma_{\\bar{\\eta}}",
                 OutputName -> "" }},
                 
     {Fvm, { LaTeX -> "\\lambda_\\nu" }}            

         


        };       


