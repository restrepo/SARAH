WCXF`Outputs = 2;

(* Output for QFV at Q=160 GeV *)
WCXF`EFT[1]= "WET";
WCXF`Basis[1]= "FlavorKit";
WCXF`Scale[1]= 160.0;

WCXF`Values[1]={

(* SECTOR: SBSB *)
(* 4D *)
{{"DVLL_2323",O4dVLL[2,3,2,3]-O4dVLLSM[2,3,2,3], Complex}},
{{"DVRR_2323",O4dVRR[2,3,2,3]-O4dVRRSM[2,3,2,3], Complex}},
{{"DVLR_2323",O4dVLR[2,3,2,3]-O4dVLRSM[2,3,2,3], Complex}},
{{"DSRR_2323",O4dSRR[2,3,2,3]-O4dSRRSM[2,3,2,3], Complex}},
{{"DSRR_3232",O4dSRR[3,2,3,2]-O4dSRRSM[3,2,3,2], Complex}},

(* SECTOR: DBDB *)
(* 4D *)
{{"DVLL_1313",O4dVLL[1,3,1,3]-O4dVLLSM[1,3,1,3], Complex}},
{{"DVRR_1313",O4dVRR[1,3,1,3]-O4dVRRSM[1,3,1,3], Complex}},
{{"DVLR_1313",O4dVLR[1,3,1,3]-O4dVLRSM[1,3,1,3], Complex}},
{{"DSRR_1313",O4dSRR[1,3,1,3]-O4dSRRSM[1,3,1,3], Complex}},
{{"DSRR_3131",O4dSRR[3,1,3,1]-O4dSRRSM[3,1,3,1], Complex}},

(* SECTOR: SDSD *)
(* 4D *)
{{"DVLL_1212",O4dVLL[1,2,1,2]-O4dVLLSM[1,2,1,2], Complex}},
{{"DVRR_1212",O4dVRR[1,2,1,2]-O4dVRRSM[1,2,1,2], Complex}},
{{"DVLR_1212",O4dVLR[1,2,1,2]-O4dVLRSM[1,2,1,2], Complex}},
{{"DSRR_1212",O4dSRR[1,2,1,2]-O4dSRRSM[1,2,1,2], Complex}},
{{"DSRR_2121",O4dSRR[2,1,2,1]-O4dSRRSM[2,1,2,1], Complex}},

(* SECTOR: DBSB *)
(* 4D *)
{{"DVLL_1323",O4dVLL[1,3,2,3]-O4dVLLSM[1,3,2,3], Complex}},
{{"DVRR_1323",O4dVRR[1,3,2,3]-O4dVRRSM[1,3,2,3], Complex}},
{{"DVLR_1323",O4dVLR[1,3,2,3]-O4dVLRSM[1,3,2,3], Complex}},
{{"DVLR_2313",O4dVLR[2,3,1,3]-O4dVLRSM[2,3,1,3], Complex}},
{{"DSRR_1323",O4dSRR[1,3,2,3]-O4dSRRSM[1,3,2,3], Complex}},
{{"DSRR_3132",O4dSRR[3,1,3,2]-O4dSRRSM[3,1,3,2], Complex}},

(* SECTOR: SBSD *)
(* 4D *)
{{"DVLL_1232",O4dVLL[1,2,3,2]-O4dVLLSM[1,2,3,2], Complex}},
{{"DVRR_1232",O4dVRR[1,2,3,2]-O4dVRRSM[1,2,3,2], Complex}},
{{"DVLR_1232",O4dVLR[1,2,3,2]-O4dVLRSM[1,2,3,2], Complex}},
{{"DVLR_2321",O4dVLR[2,3,2,1]-O4dVLRSM[2,3,2,1], Complex}},
{{"DSRR_1232",O4dSRR[1,2,3,2]-O4dSRRSM[1,2,3,2], Complex}},
{{"DSRR_2123",O4dSRR[2,1,2,3]-O4dSRRSM[2,1,2,3], Complex}},

(* SECTOR: DBDS *)
(* 4D *)
{{"DVLL_1213",O4dVLL[1,2,1,3]-O4dVLLSM[1,2,1,3], Complex}},
{{"DVRR_1213",O4dVRR[1,2,1,3]-O4dVRRSM[1,2,1,3], Complex}},
{{"DVLR_1213",O4dVLR[1,2,1,3]-O4dVLRSM[1,2,1,3], Complex}},
{{"DVLR_1312",O4dVLR[1,3,1,2]-O4dVLRSM[1,3,1,2], Complex}},
{{"DSRR_1213",O4dSRR[1,2,1,3]-O4dSRRSM[1,2,1,3], Complex}},
{{"DSRR_2131",O4dSRR[2,1,3,1]-O4dSRRSM[2,1,3,1], Complex}},

(* SECTOR: UBENU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[1],OdulvVLL[3,1,i,1]-OdulvVLLSM[3,1,i,1], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[1],OdulvVRL[3,1,i,1]-OdulvVRLSM[3,1,i,1], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[1],OdulvSLL[3,1,i,1]-OdulvSLLSM[3,1,i,1], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[1],OdulvSRL[3,1,i,1]-OdulvSRLSM[3,1,i,1], Complex},{i,1,3}],

(* SECTOR: CBENU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[1],OdulvVLL[3,2,i,1]-OdulvVLLSM[3,2,i,1], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[1],OdulvVRL[3,2,i,1]-OdulvVRLSM[3,2,i,1], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[1],OdulvSLL[3,2,i,1]-OdulvSLLSM[3,2,i,1], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[1],OdulvSRL[3,2,i,1]-OdulvSRLSM[3,2,i,1], Complex},{i,1,3}],

(* SECTOR: USENU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[1],OdulvVLL[2,1,i,1]-OdulvVLLSM[2,1,i,1], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[1],OdulvVRL[2,1,i,1]-OdulvVRLSM[2,1,i,1], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[1],OdulvSLL[2,1,i,1]-OdulvSLLSM[2,1,i,1], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[1],OdulvSRL[2,1,i,1]-OdulvSRLSM[2,1,i,1], Complex},{i,1,3}],

(* SECTOR: CSENU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[1],OdulvVLL[2,2,i,1]-OdulvVLLSM[2,2,i,1], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[1],OdulvVRL[2,2,i,1]-OdulvVRLSM[2,2,i,1], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[1],OdulvSLL[2,2,i,1]-OdulvSLLSM[2,2,i,1], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[1],OdulvSRL[2,2,i,1]-OdulvSRLSM[2,2,i,1], Complex},{i,1,3}],

(* SECTOR: UDENU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[1],OdulvVLL[1,1,i,1]-OdulvVLLSM[1,1,i,1], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[1],OdulvVRL[1,1,i,1]-OdulvVRLSM[1,1,i,1], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[1],OdulvSLL[1,1,i,1]-OdulvSLLSM[1,1,i,1], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[1],OdulvSRL[1,1,i,1]-OdulvSRLSM[1,1,i,1], Complex},{i,1,3}],

(* SECTOR: CDENU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[1],OdulvVLL[1,2,i,1]-OdulvVLLSM[1,2,i,1], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[1],OdulvVRL[1,2,i,1]-OdulvVRLSM[1,2,i,1], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[1],OdulvSLL[1,2,i,1]-OdulvSLLSM[1,2,i,1], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[1],OdulvSRL[1,2,i,1]-OdulvSRLSM[1,2,i,1], Complex},{i,1,3}],

(* SECTOR: UBMUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[2],OdulvVLL[3,1,i,2]-OdulvVLLSM[3,1,i,2], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[2],OdulvVRL[3,1,i,2]-OdulvVRLSM[3,1,i,2], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[2],OdulvSLL[3,1,i,2]-OdulvSLLSM[3,1,i,2], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[2],OdulvSRL[3,1,i,2]-OdulvSRLSM[3,1,i,2], Complex},{i,1,3}],

(* SECTOR: CBMUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[2],OdulvVLL[3,2,i,2]-OdulvVLLSM[3,2,i,2], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[2],OdulvVRL[3,2,i,2]-OdulvVRLSM[3,2,i,2], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[2],OdulvSLL[3,2,i,2]-OdulvSLLSM[3,2,i,2], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[2],OdulvSRL[3,2,i,2]-OdulvSRLSM[3,2,i,2], Complex},{i,1,3}],

(* SECTOR: USMUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[2],OdulvVLL[2,1,i,2]-OdulvVLLSM[2,1,i,2], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[2],OdulvVRL[2,1,i,2]-OdulvVRLSM[2,1,i,2], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[2],OdulvSLL[2,1,i,2]-OdulvSLLSM[2,1,i,2], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[2],OdulvSRL[2,1,i,2]-OdulvSRLSM[2,1,i,2], Complex},{i,1,3}],

(* SECTOR: CSMUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[2],OdulvVLL[2,2,i,2]-OdulvVLLSM[2,2,i,2], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[2],OdulvVRL[2,2,i,2]-OdulvVRLSM[2,2,i,2], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[2],OdulvSLL[2,2,i,2]-OdulvSLLSM[2,2,i,2], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[2],OdulvSRL[2,2,i,2]-OdulvSRLSM[2,2,i,2], Complex},{i,1,3}],

(* SECTOR: UDMUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[2],OdulvVLL[1,1,i,2]-OdulvVLLSM[1,1,i,2], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[2],OdulvVRL[1,1,i,2]-OdulvVRLSM[1,1,i,2], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[2],OdulvSLL[1,1,i,2]-OdulvSLLSM[1,1,i,2], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[2],OdulvSRL[1,1,i,2]-OdulvSRLSM[1,1,i,2], Complex},{i,1,3}],

(* SECTOR: CDMUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[2],OdulvVLL[1,2,i,2]-OdulvVLLSM[1,2,i,2], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[2],OdulvVRL[1,2,i,2]-OdulvVRLSM[1,2,i,2], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[2],OdulvSLL[1,2,i,2]-OdulvSLLSM[1,2,i,2], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[2],OdulvSRL[1,2,i,2]-OdulvSRLSM[1,2,i,2], Complex},{i,1,3}],

(* SECTOR: UBTAUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[3],OdulvVLL[3,1,i,3]-OdulvVLLSM[3,1,i,3], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[3],OdulvVRL[3,1,i,3]-OdulvVRLSM[3,1,i,3], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[3],OdulvSLL[3,1,i,3]-OdulvSLLSM[3,1,i,3], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[3],OdulvSRL[3,1,i,3]-OdulvSRLSM[3,1,i,3], Complex},{i,1,3}],

(* SECTOR: CBTAUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[3],OdulvVLL[3,2,i,3]-OdulvVLLSM[3,2,i,3], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[3],OdulvVRL[3,2,i,3]-OdulvVRLSM[3,2,i,3], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[3],OdulvSLL[3,2,i,3]-OdulvSLLSM[3,2,i,3], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[3],OdulvSRL[3,2,i,3]-OdulvSRLSM[3,2,i,3], Complex},{i,1,3}],

(* SECTOR: USTAUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[3],OdulvVLL[2,1,i,3]-OdulvVLLSM[2,1,i,3], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[3],OdulvVRL[2,1,i,3]-OdulvVRLSM[2,1,i,3], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[3],OdulvSLL[2,1,i,3]-OdulvSLLSM[2,1,i,3], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[3],OdulvSRL[2,1,i,3]-OdulvSRLSM[2,1,i,3], Complex},{i,1,3}],

(* SECTOR: CSTAUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[3],OdulvVLL[2,2,i,3]-OdulvVLLSM[2,2,i,3], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[3],OdulvVRL[2,2,i,3]-OdulvVRLSM[2,2,i,3], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[3],OdulvSLL[2,2,i,3]-OdulvSLLSM[2,2,i,3], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[2]<>ToString[2]<>ToString[i]<>ToString[3],OdulvSRL[2,2,i,3]-OdulvSRLSM[2,2,i,3], Complex},{i,1,3}],

(* SECTOR: UDTAUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[3],OdulvVLL[1,1,i,3]-OdulvVLLSM[1,1,i,3], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[3],OdulvVRL[1,1,i,3]-OdulvVRLSM[1,1,i,3], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[3],OdulvSLL[1,1,i,3]-OdulvSLLSM[1,1,i,3], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[1]<>ToString[1]<>ToString[i]<>ToString[3],OdulvSRL[1,1,i,3]-OdulvSRLSM[1,1,i,3], Complex},{i,1,3}],

(* SECTOR: CDTAUNU *)
(* UDENU *)
Table[{"GVLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[3],OdulvVLL[1,2,i,3]-OdulvVLLSM[1,2,i,3], Complex},{i,1,3}],
Table[{"GVRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[3],OdulvVRL[1,2,i,3]-OdulvVRLSM[1,2,i,3], Complex},{i,1,3}],
Table[{"GSLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[3],OdulvSLL[1,2,i,3]-OdulvSLLSM[1,2,i,3], Complex},{i,1,3}],
Table[{"GSRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[3],OdulvSRL[1,2,i,3]-OdulvSRLSM[1,2,i,3], Complex},{i,1,3}],

(* SECTOR: SBNUNU *)
(* 2D2NU *)
Table[{"FVLL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddvvVLL[2,3,i,i]-OddvvVLLSM[2,3,i,i], Complex},{i,1,3}],
{{"FVLL_2312",OddvvVLL[2,3,1,2]-OddvvVLLSM[2,3,1,2], Complex}},
{{"FVLL_2313",OddvvVLL[2,3,1,3]-OddvvVLLSM[2,3,1,3], Complex}},
{{"FVLL_2323",OddvvVLL[2,3,2,3]-OddvvVLLSM[2,3,2,3], Complex}},
{{"FVLL_3212",OddvvVLL[3,2,1,2]-OddvvVLLSM[3,2,1,2], Complex}},
{{"FVLL_3213",OddvvVLL[3,2,1,3]-OddvvVLLSM[3,2,1,3], Complex}},
{{"FVLL_3223",OddvvVLL[3,2,2,3]-OddvvVLLSM[3,2,2,3], Complex}},
Table[{"FVRL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddvvVRL[2,3,i,i]-OddvvVRLSM[2,3,i,i], Complex},{i,1,3}],
{{"FVRL_2312",OddvvVRL[2,3,1,2]-OddvvVRLSM[2,3,1,2], Complex}},
{{"FVRL_2313",OddvvVRL[2,3,1,3]-OddvvVRLSM[2,3,1,3], Complex}},
{{"FVRL_2323",OddvvVRL[2,3,2,3]-OddvvVRLSM[2,3,2,3], Complex}},
{{"FVRL_3212",OddvvVRL[3,2,1,2]-OddvvVRLSM[3,2,1,2], Complex}},
{{"FVRL_3213",OddvvVRL[3,2,1,3]-OddvvVRLSM[3,2,1,3], Complex}},
{{"FVRL_3223",OddvvVRL[3,2,2,3]-OddvvVRLSM[3,2,2,3], Complex}},

(* SECTOR: DBNUNU *)
(* 2D2NU *)
Table[{"FVLL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddvvVLL[1,3,i,i]-OddvvVLLSM[1,3,i,i], Complex},{i,1,3}],
{{"FVLL_1312",OddvvVLL[1,3,1,2]-OddvvVLLSM[1,3,1,2], Complex}},
{{"FVLL_1313",OddvvVLL[1,3,1,3]-OddvvVLLSM[1,3,1,3], Complex}},
{{"FVLL_1323",OddvvVLL[1,3,2,3]-OddvvVLLSM[1,3,2,3], Complex}},
{{"FVLL_3112",OddvvVLL[3,1,1,2]-OddvvVLLSM[3,1,1,2], Complex}},
{{"FVLL_3113",OddvvVLL[3,1,1,3]-OddvvVLLSM[3,1,1,3], Complex}},
{{"FVLL_3123",OddvvVLL[3,1,2,3]-OddvvVLLSM[3,1,2,3], Complex}},
Table[{"FVRL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddvvVRL[1,3,i,i]-OddvvVRLSM[1,3,i,i], Complex},{i,1,3}],
{{"FVRL_1312",OddvvVRL[1,3,1,2]-OddvvVRLSM[1,3,1,2], Complex}},
{{"FVRL_1313",OddvvVRL[1,3,1,3]-OddvvVRLSM[1,3,1,3], Complex}},
{{"FVRL_1323",OddvvVRL[1,3,2,3]-OddvvVRLSM[1,3,2,3], Complex}},
{{"FVRL_3112",OddvvVRL[3,1,1,2]-OddvvVRLSM[3,1,1,2], Complex}},
{{"FVRL_3113",OddvvVRL[3,1,1,3]-OddvvVRLSM[3,1,1,3], Complex}},
{{"FVRL_3123",OddvvVRL[3,1,2,3]-OddvvVRLSM[3,1,2,3], Complex}},

(* SECTOR: SDNUNU *)
(* 2D2NU *)
Table[{"FVLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OddvvVLL[2,1,i,i]-OddvvVLLSM[2,1,i,i], Complex},{i,1,3}],
{{"FVLL_2112",OddvvVLL[2,1,1,2]-OddvvVLLSM[2,1,1,2], Complex}},
{{"FVLL_2113",OddvvVLL[2,1,1,3]-OddvvVLLSM[2,1,1,3], Complex}},
{{"FVLL_2123",OddvvVLL[2,1,2,3]-OddvvVLLSM[2,1,2,3], Complex}},
{{"FVLL_1212",OddvvVLL[1,2,1,2]-OddvvVLLSM[1,2,1,2], Complex}},
{{"FVLL_1213",OddvvVLL[1,2,1,3]-OddvvVLLSM[1,2,1,3], Complex}},
{{"FVLL_1223",OddvvVLL[1,2,2,3]-OddvvVLLSM[1,2,2,3], Complex}},
Table[{"FVRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OddvvVRL[2,1,i,i]-OddvvVRLSM[2,1,i,i], Complex},{i,1,3}],
{{"FVRL_2112",OddvvVRL[2,1,1,2]-OddvvVRLSM[2,1,1,2], Complex}},
{{"FVRL_2113",OddvvVRL[2,1,1,3]-OddvvVRLSM[2,1,1,3], Complex}},
{{"FVRL_2123",OddvvVRL[2,1,2,3]-OddvvVRLSM[2,1,2,3], Complex}},
{{"FVRL_1212",OddvvVRL[1,2,1,2]-OddvvVRLSM[1,2,1,2], Complex}},
{{"FVRL_1213",OddvvVRL[1,2,1,3]-OddvvVRLSM[1,2,1,3], Complex}},
{{"FVRL_1223",OddvvVRL[1,2,2,3]-OddvvVRLSM[1,2,2,3], Complex}},

(* SECTOR: SB *)
(* GAMMA2Q *)
{{"Q1R_23",CC7p[2,3]-CC7pSM[2,3], Complex}},
{{"Q1R_32",CC7p[3,2]-CC7pSM[3,2], Complex}},
(* GLUON2Q *)
{{"Q2R_23",CC8p[2,3]-CC8pSM[2,3], Complex}},
{{"Q2R_32",CC8p[3,2]-CC8pSM[3,2], Complex}},
(* 4D *)
Table[{"DVLL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],O4dVLL[2,3,i,i]-O4dVLLSM[2,3,i,i], Complex},{i,1,3}],
{{"DVLL_1231",O4dVLL[1,2,3,1]-O4dVLLSM[1,2,3,1], Complex}},
Table[{"DVRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],O4dVRR[2,3,i,i]-O4dVRRSM[2,3,i,i], Complex},{i,1,3}],
{{"DVRR_1231",O4dVRR[1,2,3,1]-O4dVRRSM[1,2,3,1], Complex}},                       
Table[{"DVLR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],O4dVLR[2,3,i,i]-O4dVLRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"DVRL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],O4dVRL[2,3,i,i]-O4dVRLSM[2,3,i,i], Complex},{i,1,3}],
{{"DVLR_1231",O4dVLR[1,2,3,1]-O4dVLRSM[1,2,3,1], Complex}},                      
{{"DVLR_1321",O4dVLR[1,3,2,1]-O4dVLRSM[1,3,2,1], Complex}},                      
Table[{"DSRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],O4dSRR[2,3,i,i]-O4dSRRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"DSRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],O4dSRR[3,2,i,i]-O4dSRRSM[3,2,i,i], Complex},{i,1,3}],
{{"DSRR_1231",O4dSRR[1,2,3,1]-O4dSRRSM[1,2,3,1], Complex}},
{{"DSRR_1321",O4dSRR[1,3,2,1]-O4dSRRSM[1,3,2,1], Complex}},
(* 2D2L *)
Table[{"EVLL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllVLL[2,3,i,i]-OddllVLLSM[2,3,i,i], Complex},{i,1,3}],
Table[{"EVRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllVRR[2,3,i,i]-OddllVRRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"EVLR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllVLR[2,3,i,i]-OddllVLRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"EVRL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllVRL[2,3,i,i]-OddllVRLSM[2,3,i,i], Complex},{i,1,3}],
Table[{"ESRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllSRR[2,3,i,i]-OddllSRRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"ESRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OddllSRR[3,2,i,i]-OddllSRRSM[3,2,i,i], Complex},{i,1,3}],
Table[{"ESLR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllSLR[2,3,i,i]-OddllSLRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"ESLR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OddllSLR[3,2,i,i]-OddllSLRSM[3,2,i,i], Complex},{i,1,3}],
Table[{"ETRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OddllTRR[2,3,i,i]-OddllTRRSM[2,3,i,i], Complex},{i,1,3}],
Table[{"ETRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OddllTRR[3,2,i,i]-OddllTRRSM[3,2,i,i], Complex},{i,1,3}],

(* SECTOR: DB *)
(* GAMMA2Q *)
{{"Q1R_13",CC7p[1,3]-CC7pSM[1,3], Complex}},
{{"Q1R_31",CC7p[3,1]-CC7pSM[3,1], Complex}},
(* GLUON2Q *)
{{"Q2R_13",CC8p[1,3]-CC8pSM[1,3], Complex}},
{{"Q2R_31",CC8p[3,1]-CC8pSM[3,1], Complex}},
(* 4D *)
Table[{"DVLL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],O4dVLL[1,3,i,i]-O4dVLLSM[1,3,i,i], Complex},{i,1,3}],
{{"DVLL_2132",O4dVLL[2,1,3,2]-O4dVLLSM[2,1,3,2], Complex}},                                  
Table[{"DVRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],O4dVRR[1,3,i,i]-O4dVRRSM[1,3,i,i], Complex},{i,1,3}],
{{"DVRR_2132",O4dVRR[2,1,3,2]-O4dVRRSM[2,1,3,2], Complex}},                                  
Table[{"DVLR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],O4dVLR[1,3,i,i]-O4dVLRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"DVRL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],O4dVRL[1,3,i,i]-O4dVRLSM[1,3,i,i], Complex},{i,1,3}],
{{"DVLR_2132",O4dVLR[2,1,3,2]-O4dVLRSM[2,1,3,2], Complex}},                                  
{{"DVLR_2312",O4dVLR[2,3,1,2]-O4dVLRSM[2,3,1,2], Complex}},                                  
Table[{"DSRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],O4dSRR[1,3,i,i]-O4dSRRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"DSRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],O4dSRR[3,1,i,i]-O4dSRRSM[3,1,i,i], Complex},{i,1,3}],
{{"DSRR_2132",O4dSRR[2,1,3,2]-O4dSRRSM[2,1,3,2], Complex}},
{{"DSRR_2312",O4dSRR[2,3,1,2]-O4dSRRSM[2,3,1,2], Complex}},
(* 2D2L *)
Table[{"EVLL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],conj[OddllVLL[3,1,i,i]-OddllVLLSM[3,1,i,i]], Complex},{i,1,3}],
Table[{"EVRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddllVRR[1,3,i,i]-OddllVRRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"EVLR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddllVLR[1,3,i,i]-OddllVLRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"EVRL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddllVRL[1,3,i,i]-OddllVRLSM[1,3,i,i], Complex},{i,1,3}],
Table[{"ESRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddllSRR[1,3,i,i]-OddllSRRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"ESRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OddllSRR[3,1,i,i]-OddllSRRSM[3,1,i,i], Complex},{i,1,3}],
Table[{"ESLR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddllSLR[1,3,i,i]-OddllSLRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"ESLR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OddllSLR[3,1,i,i]-OddllSLRSM[3,1,i,i], Complex},{i,1,3}],
Table[{"ETRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OddllTRR[1,3,i,i]-OddllTRRSM[1,3,i,i], Complex},{i,1,3}],
Table[{"ETRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OddllTRR[3,1,i,i]-OddllTRRSM[3,1,i,i], Complex},{i,1,3}],

(* SECTOR: SD *)
(* GAMMA2Q *)
{{"Q1R_12",CC7p[1,2]-CC7pSM[1,2], Complex}},
{{"Q1R_21",CC7p[2,1]-CC7pSM[2,1], Complex}},
(* GLUON2Q *)
{{"Q2R_12",CC8p[1,2]-CC8pSM[1,2], Complex}},
{{"Q2R_21",CC8p[2,1]-CC8pSM[2,1], Complex}},
(* 4D *)
Table[{"DVLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],O4dVLL[1,2,i,i]-O4dVLLSM[1,2,i,i], Complex},{i,1,3}],
{{"DVLL_3123",O4dVLL[3,1,2,3]-O4dVLLSM[3,1,2,3], Complex}},                                         
Table[{"DVRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],O4dVRR[1,2,i,i]-O4dVRRSM[1,2,i,i], Complex},{i,1,3}],
{{"DVRR_3123",O4dVRR[3,1,2,3]-O4dVRRSM[3,1,2,3], Complex}},                                       
Table[{"DVLR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],O4dVLR[1,2,i,i]-O4dVLRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"DVRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],O4dVRL[1,2,i,i]-O4dVRLSM[1,2,i,i], Complex},{i,1,3}],
{{"DVLR_3123",O4dVLR[3,1,2,3]-O4dVLRSM[3,1,2,3], Complex}},                                       
{{"DVLR_3213",O4dVLR[3,2,1,3]-O4dVLRSM[3,2,1,3], Complex}},                                       
Table[{"DSRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],O4dSRR[1,2,i,i]-O4dSRRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"DSRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],O4dSRR[2,1,i,i]-O4dSRRSM[2,1,i,i], Complex},{i,1,3}],
{{"DSRR_3123",O4dSRR[3,1,2,3]-O4dSRRSM[3,1,2,3], Complex}},
{{"DSRR_3213",O4dSRR[3,2,1,3]-O4dSRRSM[3,2,1,3], Complex}},
(* 2D2L *)
Table[{"EVLL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllVLL[1,2,i,i]-OddllVLLSM[1,2,i,i], Complex},{i,1,3}],
Table[{"EVRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllVRR[1,2,i,i]-OddllVRRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"EVLR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllVLR[1,2,i,i]-OddllVLRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"EVRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllVRL[1,2,i,i]-OddllVRLSM[1,2,i,i], Complex},{i,1,3}],
Table[{"ESRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllSRR[1,2,i,i]-OddllSRRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"ESRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OddllSRR[2,1,i,i]-OddllSRRSM[2,1,i,i], Complex},{i,1,3}],
Table[{"ESLR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllSLR[1,2,i,i]-OddllSLRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"ESLR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OddllSLR[2,1,i,i]-OddllSLRSM[2,1,i,i], Complex},{i,1,3}],
Table[{"ETRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OddllTRR[1,2,i,i]-OddllTRRSM[1,2,i,i], Complex},{i,1,3}],
Table[{"ETRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OddllTRR[2,1,i,i]-OddllTRRSM[2,1,i,i], Complex},{i,1,3}], 

(* SECTOR: SBEMU *)
(* 2D2L *)
{{"EVLL_2312",OddllVLL[2,3,1,2]-OddllVLLSM[2,3,1,2], Complex}},
{{"EVRR_2312",OddllVRR[2,3,1,2]-OddllVRRSM[2,3,1,2], Complex}},
{{"EVLR_2312",OddllVLR[2,3,1,2]-OddllVLRSM[2,3,1,2], Complex}},
{{"EVRL_2312",OddllVRL[2,3,1,2]-OddllVRLSM[2,3,1,2], Complex}},
{{"ESRR_2312",OddllSRR[2,3,1,2]-OddllSRRSM[2,3,1,2], Complex}},
{{"ESRR_3221",OddllSRR[3,2,2,1]-OddllSRRSM[3,2,2,1], Complex}},
{{"ESLR_2312",OddllSLR[2,3,1,2]-OddllSLRSM[2,3,1,2], Complex}},
{{"ESLR_3221",OddllSLR[3,2,2,1]-OddllSLRSM[3,2,2,1], Complex}},
{{"ETRR_2312",OddllTRR[2,3,1,2]-OddllTRRSM[2,3,1,2], Complex}},
{{"ETRR_3221",OddllTRR[3,2,2,1]-OddllTRRSM[3,2,2,1], Complex}},
                        
(* SECTOR: SBMUE *)     
(* 2D2L *)              
{{"EVLL_3212",OddllVLL[3,2,1,2]-OddllVLLSM[3,2,1,2], Complex}},
{{"EVRR_3212",OddllVRR[3,2,1,2]-OddllVRRSM[3,2,1,2], Complex}},
{{"EVLR_3212",OddllVLR[3,2,1,2]-OddllVLRSM[3,2,1,2], Complex}},
{{"EVRL_3212",OddllVRL[3,2,1,2]-OddllVRLSM[3,2,1,2], Complex}},
{{"ESRR_3212",OddllSRR[3,2,1,2]-OddllSRRSM[3,2,1,2], Complex}},
{{"ESRR_2321",OddllSRR[2,3,2,1]-OddllSRRSM[2,3,2,1], Complex}},
{{"ESLR_3212",OddllSLR[3,2,1,2]-OddllSLRSM[3,2,1,2], Complex}},
{{"ESLR_2321",OddllSLR[2,3,2,1]-OddllSLRSM[2,3,2,1], Complex}},
{{"ETRR_3212",OddllTRR[3,2,1,2]-OddllTRRSM[3,2,1,2], Complex}},
{{"ETRR_2321",OddllTRR[2,3,2,1]-OddllTRRSM[2,3,2,1], Complex}},
                        
(* SECTOR: SBETAU *)    
(* 2D2L *)              
{{"EVLL_2313",OddllVLL[2,3,1,3]-OddllVLLSM[2,3,1,3], Complex}},
{{"EVRR_2313",OddllVRR[2,3,1,3]-OddllVRRSM[2,3,1,3], Complex}},
{{"EVLR_2313",OddllVLR[2,3,1,3]-OddllVLRSM[2,3,1,3], Complex}},
{{"EVRL_2313",OddllVRL[2,3,1,3]-OddllVRLSM[2,3,1,3], Complex}},
{{"ESRR_2313",OddllSRR[2,3,1,3]-OddllSRRSM[2,3,1,3], Complex}},
{{"ESRR_3231",OddllSRR[3,2,3,1]-OddllSRRSM[3,2,3,1], Complex}},
{{"ESLR_2313",OddllSLR[2,3,1,3]-OddllSLRSM[2,3,1,3], Complex}},
{{"ESLR_3231",OddllSLR[3,2,3,1]-OddllSLRSM[3,2,3,1], Complex}},
{{"ETRR_2313",OddllTRR[2,3,1,3]-OddllTRRSM[2,3,1,3], Complex}},
{{"ETRR_3231",OddllTRR[3,2,3,1]-OddllTRRSM[3,2,3,1], Complex}},
                             
(* SECTOR: SBTAUE *)         
(* 2D2L *)                   
{{"EVLL_3213",OddllVLL[3,2,1,3]-OddllVLLSM[3,2,1,3], Complex}},
{{"EVRR_3213",OddllVRR[3,2,1,3]-OddllVRRSM[3,2,1,3], Complex}},
{{"EVLR_3213",OddllVLR[3,2,1,3]-OddllVLRSM[3,2,1,3], Complex}},
{{"EVRL_3213",OddllVRL[3,2,1,3]-OddllVRLSM[3,2,1,3], Complex}},
{{"ESRR_3213",OddllSRR[3,2,1,3]-OddllSRRSM[3,2,1,3], Complex}},
{{"ESRR_2331",OddllSRR[2,3,3,1]-OddllSRRSM[2,3,3,1], Complex}},
{{"ESLR_3213",OddllSLR[3,2,1,3]-OddllSLRSM[3,2,1,3], Complex}},
{{"ESLR_2331",OddllSLR[2,3,3,1]-OddllSLRSM[2,3,3,1], Complex}},
{{"ETRR_3213",OddllTRR[3,2,1,3]-OddllTRRSM[3,2,1,3], Complex}},
{{"ETRR_2331",OddllTRR[2,3,3,1]-OddllTRRSM[2,3,3,1], Complex}},
                         
(* SECTOR: SBMUTAU *)    
(* 2D2L *)               
{{"EVLL_2323",OddllVLL[2,3,2,3]-OddllVLLSM[2,3,2,3], Complex}},
{{"EVRR_2323",OddllVRR[2,3,2,3]-OddllVRRSM[2,3,2,3], Complex}},
{{"EVLR_2323",OddllVLR[2,3,2,3]-OddllVLRSM[2,3,2,3], Complex}},
{{"EVRL_2323",OddllVRL[2,3,2,3]-OddllVRLSM[2,3,2,3], Complex}},
{{"ESRR_2323",OddllSRR[2,3,2,3]-OddllSRRSM[2,3,2,3], Complex}},
{{"ESRR_3232",OddllSRR[3,2,3,2]-OddllSRRSM[3,2,3,2], Complex}},
{{"ESLR_2323",OddllSLR[2,3,2,3]-OddllSLRSM[2,3,2,3], Complex}},
{{"ESLR_3232",OddllSLR[3,2,3,2]-OddllSLRSM[3,2,3,2], Complex}},
{{"ETRR_2323",OddllTRR[2,3,2,3]-OddllTRRSM[2,3,2,3], Complex}},
{{"ETRR_3232",OddllTRR[3,2,3,2]-OddllTRRSM[3,2,3,2], Complex}},
                           
(* SECTOR: SBTAUMU *)      
(* 2D2L *)                 
{{"EVLL_3223",OddllVLL[3,2,2,3]-OddllVLLSM[3,2,2,3], Complex}},
{{"EVRR_3223",OddllVRR[3,2,2,3]-OddllVRRSM[3,2,2,3], Complex}},
{{"EVLR_3223",OddllVLR[3,2,2,3]-OddllVLRSM[3,2,2,3], Complex}},
{{"EVRL_3223",OddllVRL[3,2,2,3]-OddllVRLSM[3,2,2,3], Complex}},
{{"ESRR_3223",OddllSRR[3,2,2,3]-OddllSRRSM[3,2,2,3], Complex}},
{{"ESRR_2332",OddllSRR[2,3,3,2]-OddllSRRSM[2,3,3,2], Complex}},
{{"ESLR_3223",OddllSLR[3,2,2,3]-OddllSLRSM[3,2,2,3], Complex}},
{{"ESLR_2332",OddllSLR[2,3,3,2]-OddllSLRSM[2,3,3,2], Complex}},
{{"ETRR_3223",OddllTRR[3,2,2,3]-OddllTRRSM[3,2,2,3], Complex}},
{{"ETRR_2332",OddllTRR[2,3,3,2]-OddllTRRSM[2,3,3,2], Complex}},
                           
(* SECTOR: DBEMU *)        
(* 2D2L *)                 
{{"EVLL_1312",OddllVLL[1,3,1,2]-OddllVLLSM[1,3,1,2], Complex}},
{{"EVRR_1312",OddllVRR[1,3,1,2]-OddllVRRSM[1,3,1,2], Complex}},
{{"EVLR_1312",OddllVLR[1,3,1,2]-OddllVLRSM[1,3,1,2], Complex}},
{{"EVRL_1312",OddllVRL[1,3,1,2]-OddllVRLSM[1,3,1,2], Complex}},
{{"ESRR_1312",OddllSRR[1,3,1,2]-OddllSRRSM[1,3,1,2], Complex}},
{{"ESRR_3121",OddllSRR[3,1,2,1]-OddllSRRSM[3,1,2,1], Complex}},
{{"ESLR_1312",OddllSLR[1,3,1,2]-OddllSLRSM[1,3,1,2], Complex}},
{{"ESLR_3121",OddllSLR[3,1,2,1]-OddllSLRSM[3,1,2,1], Complex}},
{{"ETRR_1312",OddllTRR[1,3,1,2]-OddllTRRSM[1,3,1,2], Complex}},
{{"ETRR_3121",OddllTRR[3,1,2,1]-OddllTRRSM[3,1,2,1], Complex}},
                           
(* SECTOR: DBMUE *)        
(* 2D2L *)                 
{{"EVLL_3112",OddllVLL[3,1,1,2]-OddllVLLSM[3,1,1,2], Complex}},
{{"EVRR_3112",OddllVRR[3,1,1,2]-OddllVRRSM[3,1,1,2], Complex}},
{{"EVLR_3112",OddllVLR[3,1,1,2]-OddllVLRSM[3,1,1,2], Complex}},
{{"EVRL_3112",OddllVRL[3,1,1,2]-OddllVRLSM[3,1,1,2], Complex}},
{{"ESRR_3112",OddllSRR[3,1,1,2]-OddllSRRSM[3,1,1,2], Complex}},
{{"ESRR_1321",OddllSRR[1,3,2,1]-OddllSRRSM[1,3,2,1], Complex}},
{{"ESLR_3112",OddllSLR[3,1,1,2]-OddllSLRSM[3,1,1,2], Complex}},
{{"ESLR_1321",OddllSLR[1,3,2,1]-OddllSLRSM[1,3,2,1], Complex}},
{{"ETRR_3112",OddllTRR[3,1,1,2]-OddllTRRSM[3,1,1,2], Complex}},
{{"ETRR_1321",OddllTRR[1,3,2,1]-OddllTRRSM[1,3,2,1], Complex}},
                           
(* SECTOR: DBETAU *)       
(* 2D2L *)                 
{{"EVLL_1313",OddllVLL[1,3,1,3]-OddllVLLSM[1,3,1,3], Complex}},
{{"EVRR_1313",OddllVRR[1,3,1,3]-OddllVRRSM[1,3,1,3], Complex}},
{{"EVLR_1313",OddllVLR[1,3,1,3]-OddllVLRSM[1,3,1,3], Complex}},
{{"EVRL_1313",OddllVRL[1,3,1,3]-OddllVRLSM[1,3,1,3], Complex}},
{{"ESRR_1313",OddllSRR[1,3,1,3]-OddllSRRSM[1,3,1,3], Complex}},
{{"ESRR_3131",OddllSRR[3,1,3,1]-OddllSRRSM[3,1,3,1], Complex}},
{{"ESLR_1313",OddllSLR[1,3,1,3]-OddllSLRSM[1,3,1,3], Complex}},
{{"ESLR_3131",OddllSLR[3,1,3,1]-OddllSLRSM[3,1,3,1], Complex}},
{{"ETRR_1313",OddllTRR[1,3,1,3]-OddllTRRSM[1,3,1,3], Complex}},
{{"ETRR_3131",OddllTRR[3,1,3,1]-OddllTRRSM[3,1,3,1], Complex}},
                           
(* SECTOR: DBTAUE *)       
(* 2D2L *)                 
{{"EVLL_3113",OddllVLL[3,1,1,3]-OddllVLLSM[3,1,1,3], Complex}},
{{"EVRR_3113",OddllVRR[3,1,1,3]-OddllVRRSM[3,1,1,3], Complex}},
{{"EVLR_3113",OddllVLR[3,1,1,3]-OddllVLRSM[3,1,1,3], Complex}},
{{"EVRL_3113",OddllVRL[3,1,1,3]-OddllVRLSM[3,1,1,3], Complex}},
{{"ESRR_3113",OddllSRR[3,1,1,3]-OddllSRRSM[3,1,1,3], Complex}},
{{"ESRR_1331",OddllSRR[1,3,3,1]-OddllSRRSM[1,3,3,1], Complex}},
{{"ESLR_3113",OddllSLR[3,1,1,3]-OddllSLRSM[3,1,1,3], Complex}},
{{"ESLR_1331",OddllSLR[1,3,3,1]-OddllSLRSM[1,3,3,1], Complex}},
{{"ETRR_3113",OddllTRR[3,1,1,3]-OddllTRRSM[3,1,1,3], Complex}},
{{"ETRR_1331",OddllTRR[1,3,3,1]-OddllTRRSM[1,3,3,1], Complex}},
                            
(* SECTOR: DBMUTAU *)       
(* 2D2L *)                  
{{"EVLL_1323",OddllVLL[1,3,2,3]-OddllVLLSM[1,3,2,3], Complex}},
{{"EVRR_1323",OddllVRR[1,3,2,3]-OddllVRRSM[1,3,2,3], Complex}},
{{"EVLR_1323",OddllVLR[1,3,2,3]-OddllVLRSM[1,3,2,3], Complex}},
{{"EVRL_1323",OddllVRL[1,3,2,3]-OddllVRLSM[1,3,2,3], Complex}},
{{"ESRR_1323",OddllSRR[1,3,2,3]-OddllSRRSM[1,3,2,3], Complex}},
{{"ESRR_3132",OddllSRR[3,1,3,2]-OddllSRRSM[3,1,3,2], Complex}},
{{"ESLR_1323",OddllSLR[1,3,2,3]-OddllSLRSM[1,3,2,3], Complex}},
{{"ESLR_3132",OddllSLR[3,1,3,2]-OddllSLRSM[3,1,3,2], Complex}},
{{"ETRR_1323",OddllTRR[1,3,2,3]-OddllTRRSM[1,3,2,3], Complex}},
{{"ETRR_3132",OddllTRR[3,1,3,2]-OddllTRRSM[3,1,3,2], Complex}},
                        
(* SECTOR: DBTAUMU *)   
(* 2D2L *)              
{{"EVLL_3123",OddllVLL[3,1,2,3]-OddllVLLSM[3,1,2,3], Complex}},
{{"EVRR_3123",OddllVRR[3,1,2,3]-OddllVRRSM[3,1,2,3], Complex}},
{{"EVLR_3123",OddllVLR[3,1,2,3]-OddllVLRSM[3,1,2,3], Complex}},
{{"EVRL_3123",OddllVRL[3,1,2,3]-OddllVRLSM[3,1,2,3], Complex}},
{{"ESRR_3123",OddllSRR[3,1,2,3]-OddllSRRSM[3,1,2,3], Complex}},
{{"ESRR_1332",OddllSRR[1,3,3,2]-OddllSRRSM[1,3,3,2], Complex}},
{{"ESLR_3123",OddllSLR[3,1,2,3]-OddllSLRSM[3,1,2,3], Complex}},
{{"ESLR_1332",OddllSLR[1,3,3,2]-OddllSLRSM[1,3,3,2], Complex}},
{{"ETRR_3123",OddllTRR[3,1,2,3]-OddllTRRSM[3,1,2,3], Complex}},
{{"ETRR_1332",OddllTRR[1,3,3,2]-OddllTRRSM[1,3,3,2], Complex}},
                          
(* SECTOR: SDEMU *)       
(* 2D2L *)                
{{"EVLL_2112",OddllVLL[2,1,1,2]-OddllVLLSM[2,1,1,2], Complex}},
{{"EVRR_2112",OddllVRR[2,1,1,2]-OddllVRRSM[2,1,1,2], Complex}},
{{"EVLR_2112",OddllVLR[2,1,1,2]-OddllVLRSM[2,1,1,2], Complex}},
{{"EVRL_2112",OddllVRL[2,1,1,2]-OddllVRLSM[2,1,1,2], Complex}},
{{"ESRR_2112",OddllSRR[2,1,1,2]-OddllSRRSM[2,1,1,2], Complex}},
{{"ESRR_1221",OddllSRR[1,2,2,1]-OddllSRRSM[1,2,2,1], Complex}},
{{"ESLR_2112",OddllSLR[2,1,1,2]-OddllSLRSM[2,1,1,2], Complex}},
{{"ESLR_1221",OddllSLR[1,2,2,1]-OddllSLRSM[1,2,2,1], Complex}},
{{"ETRR_2112",OddllTRR[2,1,1,2]-OddllTRRSM[2,1,1,2], Complex}},
{{"ETRR_1221",OddllTRR[1,2,2,1]-OddllTRRSM[1,2,2,1], Complex}},
                           
(* SECTOR: SDMUE *)        
(* 2D2L *)                 
{{"EVLL_1212",OddllVLL[1,2,1,2]-OddllVLLSM[1,2,1,2], Complex}},
{{"EVRR_1212",OddllVRR[1,2,1,2]-OddllVRRSM[1,2,1,2], Complex}},
{{"EVLR_1212",OddllVLR[1,2,1,2]-OddllVLRSM[1,2,1,2], Complex}},
{{"EVRL_1212",OddllVRL[1,2,1,2]-OddllVRLSM[1,2,1,2], Complex}},
{{"ESRR_1212",OddllSRR[1,2,1,2]-OddllSRRSM[1,2,1,2], Complex}},
{{"ESRR_2121",OddllSRR[2,1,2,1]-OddllSRRSM[2,1,2,1], Complex}},
{{"ESLR_1212",OddllSLR[1,2,1,2]-OddllSLRSM[1,2,1,2], Complex}},
{{"ESLR_2121",OddllSLR[2,1,2,1]-OddllSLRSM[2,1,2,1], Complex}},
{{"ETRR_1212",OddllTRR[1,2,1,2]-OddllTRRSM[1,2,1,2], Complex}},
{{"ETRR_2121",OddllTRR[2,1,2,1]-OddllTRRSM[2,1,2,1], Complex}},
                           
(* SECTOR: SDETAU *)       
(* 2D2L *)                 
{{"EVLL_2113",OddllVLL[2,1,1,3]-OddllVLLSM[2,1,1,3], Complex}},
{{"EVRR_2113",OddllVRR[2,1,1,3]-OddllVRRSM[2,1,1,3], Complex}},
{{"EVLR_2113",OddllVLR[2,1,1,3]-OddllVLRSM[2,1,1,3], Complex}},
{{"EVRL_2113",OddllVRL[2,1,1,3]-OddllVRLSM[2,1,1,3], Complex}},
{{"ESRR_2113",OddllSRR[2,1,1,3]-OddllSRRSM[2,1,1,3], Complex}},
{{"ESRR_1231",OddllSRR[1,2,3,1]-OddllSRRSM[1,2,3,1], Complex}},
{{"ESLR_2113",OddllSLR[2,1,1,3]-OddllSLRSM[2,1,1,3], Complex}},
{{"ESLR_1231",OddllSLR[1,2,3,1]-OddllSLRSM[1,2,3,1], Complex}},
{{"ETRR_2113",OddllTRR[2,1,1,3]-OddllTRRSM[2,1,1,3], Complex}},
{{"ETRR_1231",OddllTRR[1,2,3,1]-OddllTRRSM[1,2,3,1], Complex}},
                            
(* SECTOR: SDTAUE *)        
(* 2D2L *)                  
{{"EVLL_1213",OddllVLL[1,2,1,3]-OddllVLLSM[1,2,1,3], Complex}},
{{"EVRR_1213",OddllVRR[1,2,1,3]-OddllVRRSM[1,2,1,3], Complex}},
{{"EVLR_1213",OddllVLR[1,2,1,3]-OddllVLRSM[1,2,1,3], Complex}},
{{"EVRL_1213",OddllVRL[1,2,1,3]-OddllVRLSM[1,2,1,3], Complex}},
{{"ESRR_1213",OddllSRR[1,2,1,3]-OddllSRRSM[1,2,1,3], Complex}},
{{"ESRR_2131",OddllSRR[2,1,3,1]-OddllSRRSM[2,1,3,1], Complex}},
{{"ESLR_1213",OddllSLR[1,2,1,3]-OddllSLRSM[1,2,1,3], Complex}},
{{"ESLR_2131",OddllSLR[2,1,3,1]-OddllSLRSM[2,1,3,1], Complex}},
{{"ETRR_1213",OddllTRR[1,2,1,3]-OddllTRRSM[1,2,1,3], Complex}},
{{"ETRR_2131",OddllTRR[2,1,3,1]-OddllTRRSM[2,1,3,1], Complex}},
                            
(* SECTOR: SDMUTAU *)       
(* 2D2L *)                  
{{"EVLL_2123",OddllVLL[2,1,2,3]-OddllVLLSM[2,1,2,3], Complex}},
{{"EVRR_2123",OddllVRR[2,1,2,3]-OddllVRRSM[2,1,2,3], Complex}},
{{"EVLR_2123",OddllVLR[2,1,2,3]-OddllVLRSM[2,1,2,3], Complex}},
{{"EVRL_2123",OddllVRL[2,1,2,3]-OddllVRLSM[2,1,2,3], Complex}},
{{"ESRR_2123",OddllSRR[2,1,2,3]-OddllSRRSM[2,1,2,3], Complex}},
{{"ESRR_1232",OddllSRR[1,2,3,2]-OddllSRRSM[1,2,3,2], Complex}},
{{"ESLR_2123",OddllSLR[2,1,2,3]-OddllSLRSM[2,1,2,3], Complex}},
{{"ESLR_1232",OddllSLR[1,2,3,2]-OddllSLRSM[1,2,3,2], Complex}},
{{"ETRR_2123",OddllTRR[2,1,2,3]-OddllTRRSM[2,1,2,3], Complex}},
{{"ETRR_1232",OddllTRR[1,2,3,2]-OddllTRRSM[1,2,3,2], Complex}},
                          
(* SECTOR: SDTAUMU *)     
(* 2D2L *)                
{{"EVLL_1223",OddllVLL[1,2,2,3]-OddllVLLSM[1,2,2,3], Complex}},
{{"EVRR_1223",OddllVRR[1,2,2,3]-OddllVRRSM[1,2,2,3], Complex}},
{{"EVLR_1223",OddllVLR[1,2,2,3]-OddllVLRSM[1,2,2,3], Complex}},
{{"EVRL_1223",OddllVRL[1,2,2,3]-OddllVRLSM[1,2,2,3], Complex}},
{{"ESRR_1223",OddllSRR[1,2,2,3]-OddllSRRSM[1,2,2,3], Complex}},
{{"ESRR_2132",OddllSRR[2,1,3,2]-OddllSRRSM[2,1,3,2], Complex}},
{{"ESLR_1223",OddllSLR[1,2,2,3]-OddllSLRSM[1,2,2,3], Complex}},
{{"ESLR_2132",OddllSLR[2,1,3,2]-OddllSLRSM[2,1,3,2], Complex}},
{{"ETRR_1223",OddllTRR[1,2,2,3]-OddllTRRSM[1,2,2,3], Complex}},
{{"ETRR_2132",OddllTRR[2,1,3,2]-OddllTRRSM[2,1,3,2], Complex}}

};
WCXF`Values[1]=Flatten[WCXF`Values[1],1];

(* Output for LFV at Q=91 GeV *)
WCXF`EFT[2]= "WET";
WCXF`Basis[2]= "FlavorKit";
WCXF`Scale[2]= 91.0;

WCXF`Values[2]={

(* SECTOR: MUE *)
(* GAMMA2L *)
{{"K2R_21",K2R[2,1], Complex}},
{{"K2R_12",K2R[1,2], Complex}},
(* 4L *)
Table[{"AVLL_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[1],O4lVLL[i,i,2,1] + 0.09825152943204982*K1L[2,1], Complex},{i,1,3}],
Table[{"AVRR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[1],O4lVRR[i,i,2,1] + 0.09825152943204982*K1R[2,1], Complex},{i,1,3}],
Table[{"AVLR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[1],O4lVLR[i,i,2,1] + 0.09825152943204982*K1R[2,1], Complex},{i,1,3}],
Table[{"AVLR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],O4lVLR[2,1,i,i] + 0.09825152943204982*K1L[2,1], Complex},{i,1,3}],
{{"AVLR_3213",O4lVLR[3,2,1,3], Complex}},
{{"AVLR_3123",O4lVLR[3,1,2,3], Complex}},
Table[{"ASRR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[1],O4lSRR[i,i,2,1], Complex},{i,1,3}],
Table[{"ASRR_"<>ToString[i]<>ToString[i]<>ToString[1]<>ToString[2],O4lSRR[i,i,1,2], Complex},{i,1,3}],
{{"ASRR_3213",O4lSRR[3,2,1,3], Complex}},
{{"ASRR_3123",O4lSRR[3,1,2,3], Complex}},
(* 2L2D *)
Table[{"BVLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OllddVLL[2,1,i,i], Complex},{i,1,3}],
Table[{"BVRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OllddVRR[2,1,i,i], Complex},{i,1,3}],
Table[{"BVLR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OllddVLR[2,1,i,i], Complex},{i,1,3}],
Table[{"BSRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OllddSRL[2,1,i,i], Complex},{i,1,3}],
Table[{"BSRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OllddSRL[1,2,i,i], Complex},{i,1,3}],
Table[{"BSRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OllddSRR[2,1,i,i], Complex},{i,1,3}],
Table[{"BSRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OllddSRR[1,2,i,i], Complex},{i,1,3}],
Table[{"BTRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OllddTRR[2,1,i,i], Complex},{i,1,3}],
Table[{"BTRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OllddTRR[1,2,i,i], Complex},{i,1,3}],
(* 2D2L *)
Table[{"EVLR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[1],OddllVLR[i,i,2,1], Complex},{i,1,3}],
(* 2L2U *)
Table[{"CVLL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OlluuVLL[2,1,i,i], Complex},{i,1,2}],
Table[{"CVRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OlluuVRR[2,1,i,i], Complex},{i,1,2}],
Table[{"CVLR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OlluuVLR[2,1,i,i], Complex},{i,1,2}],
Table[{"CSRL_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OlluuSRL[2,1,i,i], Complex},{i,1,2}],
Table[{"CSRL_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OlluuSRL[1,2,i,i], Complex},{i,1,2}],
Table[{"CSRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OlluuSRR[2,1,i,i], Complex},{i,1,2}],
Table[{"CSRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OlluuSRR[1,2,i,i], Complex},{i,1,2}],
Table[{"CTRR_"<>ToString[2]<>ToString[1]<>ToString[i]<>ToString[i],OlluuTRR[2,1,i,i], Complex},{i,1,2}],
Table[{"CTRR_"<>ToString[1]<>ToString[2]<>ToString[i]<>ToString[i],OlluuTRR[1,2,i,i], Complex},{i,1,2}], 

(* SECTOR: TAUE *)
(* GAMMA2L *)
{{"K2R_31",K2R[3,1], Complex}},
{{"K2R_13",K2R[1,3], Complex}},
(* 4L *)
Table[{"AVLL_"<>ToString[i]<>ToString[i]<>ToString[3]<>ToString[1],O4lVLL[i,i,3,1] + 0.09825152943204982*K1L[3,1], Complex},{i,1,3}],
Table[{"AVRR_"<>ToString[i]<>ToString[i]<>ToString[3]<>ToString[1],O4lVRR[i,i,3,1] + 0.09825152943204982*K1R[3,1], Complex},{i,1,3}],
Table[{"AVLR_"<>ToString[i]<>ToString[i]<>ToString[3]<>ToString[1],O4lVLR[i,i,3,1] + 0.09825152943204982*K1R[3,1], Complex},{i,1,3}],
Table[{"AVLR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],O4lVLR[3,1,i,i] + 0.09825152943204982*K1L[3,1], Complex},{i,1,3}],
{{"AVLR_2312",O4lVLR[2,3,1,2], Complex}},
{{"AVLR_2132",O4lVLR[2,1,3,2], Complex}},
Table[{"ASRR_"<>ToString[i]<>ToString[i]<>ToString[3]<>ToString[1],O4lSRR[i,i,3,1], Complex},{i,1,3}],
Table[{"ASRR_"<>ToString[i]<>ToString[i]<>ToString[1]<>ToString[3],O4lSRR[i,i,1,3], Complex},{i,1,3}],
{{"ASRR_2312",O4lSRR[2,3,1,2], Complex}},
{{"ASRR_2132",O4lSRR[2,1,3,2], Complex}},
(* 2L2D *)
Table[{"BVLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OllddVLL[3,1,i,i], Complex},{i,1,3}],
Table[{"BVRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OllddVRR[3,1,i,i], Complex},{i,1,3}],
Table[{"BVLR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OllddVLR[3,1,i,i], Complex},{i,1,3}],
Table[{"BSRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OllddSRL[3,1,i,i], Complex},{i,1,3}],
Table[{"BSRL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OllddSRL[1,3,i,i], Complex},{i,1,3}],
Table[{"BSRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OllddSRR[3,1,i,i], Complex},{i,1,3}],
Table[{"BSRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OllddSRR[1,3,i,i], Complex},{i,1,3}],
Table[{"BTRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OllddTRR[3,1,i,i], Complex},{i,1,3}],
Table[{"BTRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OllddTRR[1,3,i,i], Complex},{i,1,3}],
(* 2D2L *)
Table[{"EVLR_"<>ToString[i]<>ToString[i]<>ToString[3]<>ToString[1],OddllVLR[i,i,3,1], Complex},{i,1,3}],
(* 2L2U *)
Table[{"CVLL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OlluuVLL[3,1,i,i], Complex},{i,1,2}],
Table[{"CVRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OlluuVRR[3,1,i,i], Complex},{i,1,2}],
Table[{"CVLR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OlluuVLR[3,1,i,i], Complex},{i,1,2}],
Table[{"CSRL_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OlluuSRL[3,1,i,i], Complex},{i,1,2}],
Table[{"CSRL_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OlluuSRL[1,3,i,i], Complex},{i,1,2}],
Table[{"CSRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OlluuSRR[3,1,i,i], Complex},{i,1,2}],
Table[{"CSRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OlluuSRR[1,3,i,i], Complex},{i,1,2}],
Table[{"CTRR_"<>ToString[3]<>ToString[1]<>ToString[i]<>ToString[i],OlluuTRR[3,1,i,i], Complex},{i,1,2}],
Table[{"CTRR_"<>ToString[1]<>ToString[3]<>ToString[i]<>ToString[i],OlluuTRR[1,3,i,i], Complex},{i,1,2}], 

(* SECTOR: MUTAU *)
(* GAMMA2L *)
{{"K2R_23",K2R[2,3], Complex}},
{{"K2R_32",K2R[3,2], Complex}},
(* 4L *)
Table[{"AVLL_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[3],O4lVLL[i,i,2,3] + 0.09825152943204982*K1L[2,3], Complex},{i,1,3}],
Table[{"AVRR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[3],O4lVRR[i,i,2,3] + 0.09825152943204982*K1R[2,3], Complex},{i,1,3}],
Table[{"AVLR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[3],O4lVLR[i,i,2,3] + 0.09825152943204982*K1R[2,3], Complex},{i,1,3}],
Table[{"AVLR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],O4lVLR[2,3,i,i] + 0.09825152943204982*K1L[2,3], Complex},{i,1,3}],
{{"AVLR_1231",O4lVLR[1,2,3,1], Complex}},
{{"AVLR_1321",O4lVLR[1,3,2,1], Complex}},
Table[{"ASRR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[3],O4lSRR[i,i,2,3], Complex},{i,1,3}],
Table[{"ASRR_"<>ToString[i]<>ToString[i]<>ToString[3]<>ToString[2],O4lSRR[i,i,3,2], Complex},{i,1,3}],
{{"ASRR_1231",O4lSRR[1,2,3,1], Complex}},
{{"ASRR_1321",O4lSRR[1,3,2,1], Complex}},
(* 2L2D *)
Table[{"BVLL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OllddVLL[2,3,i,i], Complex},{i,1,3}],
Table[{"BVRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OllddVRR[2,3,i,i], Complex},{i,1,3}],
Table[{"BVLR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OllddVLR[2,3,i,i], Complex},{i,1,3}],
Table[{"BSRL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OllddSRL[2,3,i,i], Complex},{i,1,3}],
Table[{"BSRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OllddSRL[3,2,i,i], Complex},{i,1,3}],
Table[{"BSRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OllddSRR[2,3,i,i], Complex},{i,1,3}],
Table[{"BSRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OllddSRR[3,2,i,i], Complex},{i,1,3}],
Table[{"BTRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OllddTRR[2,3,i,i], Complex},{i,1,3}],
Table[{"BTRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OllddTRR[3,2,i,i], Complex},{i,1,3}],
(* 2D2L *)
Table[{"EVLR_"<>ToString[i]<>ToString[i]<>ToString[2]<>ToString[3],OddllVLR[i,i,2,3], Complex},{i,1,3}],
(* 2L2U *)
Table[{"CVLL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OlluuVLL[2,3,i,i], Complex},{i,1,2}],
Table[{"CVRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OlluuVRR[2,3,i,i], Complex},{i,1,2}],
Table[{"CVLR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OlluuVLR[2,3,i,i], Complex},{i,1,2}],
Table[{"CSRL_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OlluuSRL[2,3,i,i], Complex},{i,1,2}],
Table[{"CSRL_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OlluuSRL[3,2,i,i], Complex},{i,1,2}],
Table[{"CSRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OlluuSRR[2,3,i,i], Complex},{i,1,2}],
Table[{"CSRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OlluuSRR[3,2,i,i], Complex},{i,1,2}],
Table[{"CTRR_"<>ToString[2]<>ToString[3]<>ToString[i]<>ToString[i],OlluuTRR[2,3,i,i], Complex},{i,1,2}],
Table[{"CTRR_"<>ToString[3]<>ToString[2]<>ToString[i]<>ToString[i],OlluuTRR[3,2,i,i], Complex},{i,1,2}], 

(* SECTOR: TAUETAUE *)
(* 4L *)
{{"AVLL_1313",O4lVLL[1,3,1,3], Complex}},
{{"AVRR_1313",O4lVRR[1,3,1,3], Complex}},
{{"AVLR_1313",O4lVLR[1,3,1,3], Complex}},
{{"ASRR_1313",O4lSRR[1,3,1,3], Complex}},
{{"ASRR_3131",O4lSRR[3,1,3,1], Complex}},

(* SECTOR: TAUMUTAUMU *)
(* 4L *)
{{"AVLL_2323",O4lVLL[2,3,2,3], Complex}},
{{"AVRR_2323",O4lVRR[2,3,2,3], Complex}},
{{"AVLR_2323",O4lVLR[2,3,2,3], Complex}},
{{"ASRR_2323",O4lSRR[2,3,2,3], Complex}},
{{"ASRR_3232",O4lSRR[3,2,3,2], Complex}},

(* SECTOR: MUEMUE *)
(* 4L *)
{{"AVLL_1212",O4lVLL[1,2,1,2], Complex}},
{{"AVRR_1212",O4lVRR[1,2,1,2], Complex}},
{{"AVLR_1212",O4lVLR[1,2,1,2], Complex}},
{{"ASRR_1212",O4lSRR[1,2,1,2], Complex}},
{{"ASRR_2121",O4lSRR[2,1,2,1], Complex}},

(* SECTOR: MUEMUTAU *)
(* 4L *)
{{"AVLL_1232",O4lVLL[1,2,3,2], Complex}},
{{"AVRR_1232",O4lVRR[1,2,3,2], Complex}},
{{"AVLR_1232",O4lVLR[1,2,3,2], Complex}},
{{"AVLR_2321",O4lVLR[2,3,2,1], Complex}},
{{"ASRR_1232",O4lSRR[1,2,3,2], Complex}},
{{"ASRR_2123",O4lSRR[2,1,2,3], Complex}},

(* SECTOR: ETAUEMU *)
(* 4L *)
{{"AVLL_1213",O4lVLL[1,2,1,3], Complex}},
{{"AVRR_1213",O4lVRR[1,2,1,3], Complex}},
{{"AVLR_1213",O4lVLR[1,2,1,3], Complex}},
{{"AVLR_1312",O4lVLR[1,3,1,2], Complex}},
{{"ASRR_1213",O4lSRR[1,2,1,3], Complex}},
{{"ASRR_2131",O4lSRR[2,1,3,1], Complex}},

(* SECTOR: TAUETAUMU *)
(* 4L *)
{{"AVLL_1323",O4lVLL[1,3,2,3], Complex}},
{{"AVRR_1323",O4lVRR[1,3,2,3], Complex}},
{{"AVLR_1323",O4lVLR[1,3,2,3], Complex}},
{{"AVLR_2313",O4lVLR[2,3,1,3], Complex}},
{{"ASRR_1323",O4lSRR[1,3,2,3], Complex}},
{{"ASRR_3132",O4lSRR[3,1,3,2], Complex}}

};
WCXF`Values[2]=Flatten[WCXF`Values[2],1];
Clear[i,j,k,l];


