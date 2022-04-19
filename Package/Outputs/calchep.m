(* ::Package:: *)





(* ::Input::Initialization:: *)
(* ----------------------------------- *)
(* Write CalcHep Model File *)
(* ----------------------------------- *)


(* ::Input::Initialization:: *)

Options[MakeCHep]={FeynmanGauge->True, CPViolation -> False, ModelNr->1, CompHep->False,NoSplittingWith->{},NoSplittingOnly->{}, UseRunningCoupling->True, SLHAinput->True, WriteMOfile->True, CalculateMasses->True, RunSPhenoViaCalcHep->False, IncludeEffectiveHiggsVertices->False,DMcandidate1->Default,DMcandidate2->None,Exclude->{}};

MakeCHep[opt___ ]:=MakeCalcHepOutput[FeynmanGauge/.{opt}/.Options[MakeCHep],CPViolation/.{opt}/.Options[MakeCHep],ModelNr/.{opt}/.Options[MakeCHep],CompHep/.{opt}/.Options[MakeCHep],NoSplittingWith/.{opt}/.Options[MakeCHep],NoSplittingOnly/.{opt}/.Options[MakeCHep],UseRunningCoupling/.{opt}/.Options[MakeCHep], SLHAinput/.{opt}/.Options[MakeCHep], WriteMOfile/.{opt}/.Options[MakeCHep], CalculateMasses/.{opt}/.Options[MakeCHep], RunSPhenoViaCalcHep/.{opt}/.Options[MakeCHep],IncludeEffectiveHiggsVertices/.{opt}/.Options[MakeCHep],DMcandidate1/.{opt}/.Options[MakeCHep],DMcandidate2/.{opt}/.Options[MakeCHep],Exclude/.{opt}/.Options[MakeCHep]];


MakeCalcHepOutput[FeynmanGauge_,CPViolation_,ModelNr_, CompHep_,NoSplitWith_,NoSplitOnly_, RunningCoup_, SLHA_, WriteMO_, CalcMM_,RunSPhenoCH_,effHiggsV_,DMc1_,DMc2_,exclude_]:=Block[{startedtime},
startedtime=TimeUsed[];
(*If[FreeQ[NameOfStates,InitalizedVertexCalculaton]\[Equal]True,
Message[ModelFile::NoVertices];,
*)

Print[StyleForm["Generate CalcHep model files","Section"]];

If[FreeQ[NameOfStates,InitalizedVertexCalculaton]==True,
Print["Have to calculate the vertices first..."];
ModelOutput[Last[NameOfStates]];
];

CreateTeXNameList[SA`CurrentStates];
CH`NotWriteMassMatrices={};
StringReplaceExtra={};
WritingCalcHep=True;

ListVerticesExpandedCH={};

(*
Print["--------------------------------------"];
Print[" Creating CalcHep/CompHep Model File  "];
Print["--------------------------------------"];
*)

saveWriteErrorNum=WriteErrorNum;
WriteErrorNum=False;
SetNaNtoZero=True;
realVarSave = realVar;
Clear[Q];
UseCHForm = True;
split=0;


If[FileExistsQ[$sarahCurrentCalcHepDir]=!=True,
CreateDirectory[$sarahCurrentCalcHepDir];
];

CalcHepParticlesM0 = {};
MassParameterCHep ={};


parDep=Intersection[Select[Table[subNumDependences[[i,1]],{i,1,Length[subNumDependences]}],(FreeQ[#,Integer])&]];
parNum=Intersection[Select[Table[DefinedNumericalValues[[i,1]],{i,1,Length[DefinedNumericalValues]}],(FreeQ[#,Integer])&]];


For[i=1,i<=Length[subAlways],
If[FreeQ[subAlways[[i,1]],Pattern] && FreeQ[parDep,subAlways[[i,1]]] && FreeQ[parNum,subAlways[[i,1]]],parDep=Join[parDep,{subAlways[[i,1]]}];];
i++;];

parDep=Select[parDep,(FreeQ[parNum,#])&];

subNumLeft=Select[subNumDependences,(FreeQ[#,Integer])&];
subNumLeft = Select[Table[subNumLeft[[i,2]],{i,1,Length[subNumLeft]}],(FreeQ[#,Integer])&];

parDep=Select[parDep,(FreeQ[VertexListNonCC,#]==False || FreeQ[subNumLeft,#]==False || Head[#]===Mass)&];

If[RunningCoup==True, 
parNum=DeleteCases[parNum,strongCoupling]; 
parDep=DeleteCases[parDep,strongCoupling]; 
];


angles=Select[Intersection[DeleteCases[Flatten[{Cases[VertexListNonCC,x_Sin,99],Cases[VertexListNonCC,x_Cos,99],Cases[VertexListNonCC,x_Tan,99],Cases[VertexListNonCC,x_Sec,99],Cases[VertexListNonCC,x_Sec,99],Cases[VertexListNonCC,x_Cot,99],Cases[subNumDependences,x_Cot,99],Cases[subNumDependences,x_Cos,99],Cases[subNumDependences,x_Csc,99],Cases[subNumDependences,x_Sec,99],Cases[subNumDependences,x_Sin,99],Cases[subNumDependences,x_Tan,99],Cases[subAlways,x_Cot,99],Cases[subAlways,x_Cos,99],Cases[subAlways,x_Csc,99],Cases[subAlways,x_Sec,99],Cases[subAlways,x_Sin,99],Cases[subAlways,x_Tan,99]}] /. Sec[x_]->x /. Cos[x_]-> x /. Tan[x_]->x /. Cot[x_]->x /. Sin[x_]-> x /. Csc[x_]->x,_Integer,5]],(Head[#]==Symbol)&];

SortDependendParameters[RunningCoup];


Particles[Current]=Particles[EigenstateName];
InitSMParameters[EigenstateName];

If[effHiggsV==True,
RealScalarsCPeven=Select[Select[Transpose[PART[S]][[1]],conj[#]==#&],FreeQ[SA`ScalarsCPodd,#]&];
RealScalarsCPodd=Select[Select[Transpose[PART[S]][[1]],conj[#]==#&],FreeQ[RealScalarsCPeven,#]&];
RealScalarsAll=Join[RealScalarsCPeven,RealScalarsCPodd];
ListPhotonS=Select[Transpose[PART[S]][[1]],getElectricCharge[#]=!=0&];
ListPhotonF=Select[Transpose[PART[F]][[1]],getElectricCharge[#]=!=0&];
ListPhotonV=Select[Transpose[PART[V]][[1]],getElectricCharge[#]=!=0&];

ListGluonS=Select[Transpose[PART[S]][[1]],SA`DimensionGG[#,Position[Gauge,color][[1,1]]]=!=1&];
ListGluonF=Select[Transpose[PART[F]][[1]],SA`DimensionGG[#,Position[Gauge,color][[1,1]]]=!=1&];
ListGluonV=Select[Transpose[PART[V]][[1]],SA`DimensionGG[#,Position[Gauge,color][[1,1]]]=!=1&];

];


If[CalcMM==True && SLHA==False,
InitCalcHepMM;
];

If[RunSPhenoCH==True,
GetSPhenoParameters["SPheno.m"];
];

CalcHepParticles[CPViolation,ModelNr, CompHep,RunningCoup,SLHA,CalcMM,RunSPhenoCH,effHiggsV,DMc1,DMc2];
CalcHepVertices[FeynmanGauge,CPViolation,ModelNr, CompHep,NoSplitWith,NoSplitOnly,RunningCoup,SLHA,CalcMM,RunSPhenoCH,effHiggsV,exclude];


If[RunSPhenoCH==True,
WriteCwrapper;
WriteEXTLib[ModelNr];
];

If[WriteMO,
WriteCalcOmegaMO[TrueQ[DMc2=!=None]];
];


Print[""];
Print["Done. Model files generated in ",TimeUsed[]-startedtime, "s"];
Print["Output is saved in ", StyleForm[$sarahCurrentCalcHepDir,"Section",FontSize->10]];

If[WriteModelDirectories==True,
WriteString[DirectoryNamesFile,"CHepDir="<>ToString[$sarahCurrentCalcHepDir] <>"\n"];
];

For[i=1,i<=Length[angles],
If[FreeQ[parDep,angles[[i]]],
UnsetAbbreviateAngle[angles[[i]]];
];
i++;];

WriteErrorNum=saveWriteErrorNum;
SetNaNtoZero=False;
realVar = realVarSave;
UseCHForm = False;
WritingCalcHep=False;
(* ]; *)
];



CalcHepParticles[CPViolation_,ModelNr_, CompHep_,RunningCoup_,SLHA_,CalcMM_,RunSPhenoCH_,effHiggsV_,DMc1_,DMc2_]:=Block[{i,name,nameC,Minutes},
StringReCH[CPViolation];
CreateCForm[CPViolation,CalcMM,SLHA];
CalcHepSubs;
CreateParticleList[CompHep,DMc1,DMc2];
AddGoldstone[CompHep];


massList = Masses[EigenstateName];
massless=Massless[EigenstateName];
widthList = Width[EigenstateName];

replaceMass={};


Print["Writing Particle List"];

particlesFile = OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"prtcls"<>ToString[ModelNr]<>".mdl"]];
varsFile = OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"vars"<>ToString[ModelNr]<>".mdl"]];


If[UsePDGIX===True,
columnWidthsParticles = {10, 5,5,10,6,6,6,5,3,20,20};
lN=10; lP=8; lNr=10; lS=6;lM=6; lW=6; lC=5; lA=3; lL=20;
lVN=20; lVV=20; lVC=20; ,
columnWidthsParticles = {10, 5,5,8,6,6,6,5,3,20,20};
lN=10; lP=8; lNr=8; lS=6;lM=6; lW=6; lC=5; lA=3; lL=20;
lVN=20; lVV=20; lVC=20; 
];
columnWidthsVars =  {10,20,20};



Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
WriteString[particlesFile, ModelName <> "  % Created by SARAH v"<>SA`Version<>" (arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223, 1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306) at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"  \n"];
WriteString[particlesFile, "Particles  \n"];

WriteString[particlesFile, "Full name |A       |A+      |"];
If[CompHep==False,
If[UsePDGIX===True,WriteString[particlesFile,  " number   "];,WriteString[particlesFile,  " number "];];
WriteString[particlesFile,  "|"];
];
WriteString[particlesFile,  "2*spin| mass |width |color|aux|>LaTex(A)             <|>LaTex(A+)               <<| \n"];

Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
WriteString[varsFile,ModelName <> "  % Created by SARAH v"<>SA`Version<>" (arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223, 1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306) at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"\n"];
If[CompHep==False,
WriteString[varsFile, "Parameters  \n"];,
WriteString[varsFile, "Variables  \n"];
];

WriteString[varsFile, InsString[" Name",lVN]<>"|"];
WriteString[varsFile, InsString[" Value ",lVV]<>"|"];
WriteString[varsFile, InsString["> Comment ",lVC-1]<>"<|\n"];

Print["   Scalars"];
WriteCHepParticles[PART[S], CompHep,True,SLHA,CalcMM];

Print["   Vector Bosons"];
WriteCHepParticles[PART[V],CompHep,True,SLHA,CalcMM];

Print["   Fermions"];
WriteCHepParticles[PART[F],CompHep,True,SLHA,CalcMM];

Print["   Auxiliary Fields"];
WriteCHepParticles[PART[A],CompHep,True,SLHA,CalcMM];

Print["   Ghost Fields"];
WriteCHepParticles[PART[G],CompHep,False,SLHA,CalcMM];

For[i=1,i<=Length[partGA],
If[FreeQ[partGA[[i,4]],color]==False,
For[j=1,j<=partGA[[i,2]],
For[k=1,k<=partGA[[i,3]],
name=CalcHepName[partGA[[i,1]],j,k];
nameC=CalcHepName[conj[partGA[[i,1]]],j,k];
WriteString[particlesFile,InsString[CalcHepFullName[partGA[[i,1]],j,k],lN]<>"|"];
WriteString[particlesFile,InsString[name,lP] <> "|"];
WriteString[particlesFile,InsString[nameC,lP] <> "|"];
CHepName[partGA[[i,1]],j,k]=name;
CHepName[conj[partGA[[i,1]]],j,k]=nameC;
If[CompHep==False,
If[UsePDGIX===True,WriteString[particlesFile,"   0      |"];,WriteString[particlesFile," 0      |"];]];
WriteString[particlesFile," 2    |"];
WriteString[particlesFile," Maux |"];
WriteString[particlesFile," 0    |"];
(* WriteString[particlesFile," 3   |"]; *)
WriteString[particlesFile,ToString[partGA[[i,4]][[Position[partGA[[i,4]],color][[1,1]],2]]]<>"    |"]; 
If[NumericQ[(getElectricCharge[ToExpression[StringDrop[ToString[partGA[[i,1]]],2]]]//. Hold->ReleaseHold)]=!=False,
If[(getElectricCharge[ToExpression[StringDrop[ToString[partGA[[i,1]]],2]]] //. Hold->ReleaseHold)<0,
WriteString[particlesFile,ToString[3*(getElectricCharge[ToExpression[StringDrop[ToString[partGA[[i,1]]],2]]] //. Hold->ReleaseHold)]<>"*|"];,
WriteString[particlesFile,ToString[3*(getElectricCharge[ToExpression[StringDrop[ToString[partGA[[i,1]]],2]]] //. Hold->ReleaseHold)]<>" *|"];
];,
WriteString[particlesFile," * |"];
];
WriteString[particlesFile,"                       |               \n"];
k++;];
j++;];
];
i++;];


CalcHepVars[CPViolation,RunningCoup,SLHA,CalcMM,RunSPhenoCH,effHiggsV];


Close[varsFile];
Close[particlesFile];


];


CalcHepVars[CPViolation_,RunningCoup_,SLHA_,CalcMM_,RunSPhenoCH_,effHiggsV_]:=Block[{i,j,k,l},


Print["Writing Variables"];

If[RunSPhenoCH==True,
SetVarsSPhenoCH;
];

WriteString[varsFile, InsString["Maux",lVN]];
WriteString[varsFile, "|"];
WriteString[varsFile, InsString["1",lVV]];
WriteString[varsFile, "|  \n"];

WriteString[varsFile, InsString["sqrt2",lVN]];
WriteString[varsFile, "|"];
WriteString[varsFile, InsString[ToString[N[Sqrt[2],15]],lVV]];
WriteString[varsFile, "|  \n"];

WriteString[varsFile, InsString["Pi",lVN]];
WriteString[varsFile, "|"];
WriteString[varsFile, InsString[ToString[N[Pi,15]],lVV]];
WriteString[varsFile, "|  \n"];


WriteString[varsFile, InsString["Q",lVN]<>"|"];
WriteString[varsFile, InsString["100",lVV]<> "|  \n"];
If[RunningCoup==True,
WriteString[varsFile, InsString["alfSMZ",lVN]<>"|"];
WriteString[varsFile, InsString["0.1172",lVV]<> "|  \n"];
];



For[i=1,i<=Length[parameters],
If[FreeQ[parNum,parameters[[i,1]]]==False  ||((FreeQ[parDepNeeded,parameters[[i,1]]]==False || FreeQ[parNum,parameters[[i,1]]]==False  || FreeQ[VertexList3,parameters[[i,1]]]==False || FreeQ[VertexList4,parameters[[i,1]]] ==False || (CalcMM==True && FreeQ[CalcHepMassMatrices,parameters[[i,1]]]==False) ) && FreeQ[parDep,parameters[[i,1]]]==True  &&(SLHA==False || LHBlockName[parameters[[i,1]]]==="NONE" || LHBlockName[parameters[[i,1]]]==="LESHOUCHES" ) ) && (parameters[[i,1]]=!=strongCoupling || RunningCoupling==False) && FreeQ[MassParameterCHep,parameters[[i,1]]] && Head[parameters[[i,1]]]=!=Mass && (CalcMM==False || FreeQ[SA`ListMixingMatrices,parameters[[i,1]]]),
Switch[Length[parameters[[i,2]]],
0,
If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
WriteString[varsFile, InsString[ToString[CForm[parameters[[i,1]]]],lVN]<>"|"];
WriteString[varsFile, InsString[ToString[CForm[NumericalValue[parameters[[i,1]]]]],lVV]<> "| "<>getDescription[parameters[[i,1]]]<>"  \n"];,
WriteString[varsFile, InsString[ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]]]],lVN]<> "|"];
WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Im[parameters[[i,1]]]]/.NaN->0]],lVV]<> "| Im("<>getDescription[parameters[[i,1]]]<>")  \n"];
WriteString[varsFile, InsString[ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]]]],lVN]<> "|"];
WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Re[parameters[[i,1]]]]/.NaN->0]],lVV]<> "| Re("<>getDescription[parameters[[i,1]]]<>") \n"];
		];,

1,
	temp=ToString[CForm[parameters[[i,1]][gt1]]];
	tempR=ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]][gt1]]];
	tempI=ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]][gt1]]];
	For[j=1,j<=parameters[[i,3,1]],
	If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
	WriteString[varsFile, InsString[StringReplace[temp,{"gt1"->ToString[j]}],lVN]<>"|"];
	WriteString[varsFile, InsString[ToString[CForm[Re[NumericalValue[parameters[[i,1]][j]]/.NaN->0]]],lVV]<> "| "<>getDescription[parameters[[i,1]]]<>"  \n"];,
	WriteString[varsFile, InsString[StringReplace[tempI,{"gt1"->ToString[j]}],lVN]<> "|"];
	WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Im[parameters[[i,1]][j]]]/.NaN->0]],lVV]<> "|  Im("<>getDescription[parameters[[i,1]]]<>") \n"];
	WriteString[varsFile, InsString[StringReplace[tempR,{"gt1"->ToString[j]}],lVN]<> "|"];
	WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Re[parameters[[i,1]][j]]]/.NaN->0]],lVV]<> "|  Re("<>getDescription[parameters[[i,1]]]<>") \n"];
			];
	j++;];,

2,
	temp=ToString[CForm[parameters[[i,1]][gt1,gt2]]];
	tempR=ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]][gt1,gt2]]];
	tempI=ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]][gt1,gt2]]];

	For[j=1,j<=parameters[[i,3,1]],
	For[k=1,k<=parameters[[i,3,2]],
	If[(MemberQ[realVar,parameters[[i,1]]]==True) || (CPViolation==False),
	WriteString[varsFile, InsString[StringReplace[temp,{"gt1"->ToString[j],"gt2"->ToString[k]}],lVN]<>"|"];
	WriteString[varsFile, InsString[ToString[CForm[Re[NumericalValue[parameters[[i,1]][j,k]]/.NaN->0]]],lVV]<> "| "<>getDescription[parameters[[i,1]]]<>"  \n"];,
	WriteString[varsFile, InsString[StringReplace[tempI,{"gt1"->ToString[j],"gt2"->ToString[k]}],lVN]<> "|"];
	WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Im[parameters[[i,1]][j,k]]]/.NaN->0]],lVV]<> "|  Im("<>getDescription[parameters[[i,1]]]<>") \n"];
	WriteString[varsFile, InsString[StringReplace[tempR,{"gt1"->ToString[j],"gt2"->ToString[k]}],lVN]<> "|"];
	WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Re[parameters[[i,1]][j,k]]]/.NaN->0]],lVV]<> "| Re("<>getDescription[parameters[[i,1]]]<>") \n"];
	];
		k++;];
	j++;];,

3,

	
	temp=ToString[CForm[parameters[[i,1]][gt1,gt2,gt3]]];
	tempR=ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]][gt1,gt2,gt3]]];
	tempI=ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]][gt1,gt2,gt3]]];

	For[j=1,j<=parameters[[i,3,1]],
	For[k=1,k<=parameters[[i,3,2]],
	For[l=1,l<=parameters[[i,3,3]],
		If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
			WriteString[varsFile, InsString[StringReplace[temp,{"gt1"->ToString[j],"gt2"->ToString[k],"gt3"->ToString[l]}],lVN]<>"|"];
			WriteString[varsFile, InsString[ToString[CForm[Re[NumericalValue[parameters[[i,1]][j,k,l]]/.NaN->0]]],lVV]<> "| "<>getDescription[parameters[[i,1]]]<>"  \n"];,
			WriteString[varsFile, InsString[StringReplace[tempI,{"gt1"->ToString[j],"gt2"->ToString[k],"gt3"->ToString[l]}],lVN]<> "|"];
			WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Im[parameters[[i,1]][j,k,l]]]/.NaN->0]],lVV]<> "| Im("<>getDescription[parameters[[i,1]]]<>")  \n"];
			WriteString[varsFile, InsString[StringReplace[tempR,{"gt1"->ToString[j],"gt2"->ToString[k],"gt3"->ToString[l]}],lVN]<> "|"];
			WriteString[varsFile, InsString[ToString[CForm[NumericalValue[Re[parameters[[i,1]][j,k,l]]]/.NaN->0]],lVV]<> "|  Re("<>getDescription[parameters[[i,1]]]<>")\n"];
				];
		l++;];
		k++;];
	j++;];
];
];
i++;];


If[SLHA==False && effHiggsV==True,
If[getGen[HiggsBoson]<99,
For[iter1=1,iter1<=getGen[HiggsBoson],
For[fiter1=1,fiter1<=getFla[HiggsBoson],
If[getFla[HiggsBoson]>1,
WriteString[varsFile,InsString["HPP"<>ToString[iter1]<>ToString[fiter1],lVN]];,
WriteString[varsFile,InsString["HPP"<>ToString[iter1],lF]];
];
WriteString[varsFile,"| 0. \n"];
If[getFla[HiggsBoson]>1,
WriteString[varsFile,InsString["HGG"<>ToString[iter1]<>ToString[fiter1],lVN]];,
WriteString[varsFile,InsString["HGG"<>ToString[iter1],lF]];
];
WriteString[varsFile,"| 0. \n"];
fiter1++;];
iter1++;];
];

If[getGen[PseudoScalar]<99,
For[iter1=getGenSPhenoStart[PseudoScalar],iter1<=getGen[PseudoScalar],
For[fiter1=1,fiter1<=getFla[PseudoScalar],
If[getFla[PseudoScalar]>1,
WriteString[varsFile,InsString["APP"<>ToString[iter1]<>ToString[fiter1],lVN]];,
WriteString[varsFile,InsString["APP"<>ToString[iter1],lVN]];
];
WriteString[varsFile,"| 0. \n"];
If[getFla[PseudoScalar]>1,
WriteString[varsFile,InsString["AGG"<>ToString[iter1]<>ToString[fiter1],lVN]];,
WriteString[varsFile,InsString["AGG"<>ToString[iter1],lVN]];
];
WriteString[varsFile,"| 0. \n"];
fiter1++;];
iter1++;];
];
];


];




(* ::Input::Initialization:: *)
CalcHepVertices[FeynmanGauge_,CPViolation_, ModelNr_, CompHep_,NoSplitWith_,NoSplitOnly_,RunningCoup_,SLHA_,CalcMM_,RunSPhenoCH_,effHiggsV_,exclude_]:=Block[{i,particle1,particle2,particle3,particle4,iter1,iter2,iter3,iter4,Minutes},

Print["Writing Lagrangian and Functions"];


lagrangeFile = OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"lgrng"<>ToString[ModelNr]<>".mdl"]];
funcFile = OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"func"<>ToString[ModelNr]<>".mdl"]];


(* columnWidthsLagrange = {6, 5,5,5,10,45}; *)
columnWidthsLagrange = {9, 8,8,8,10,45};
columnWidthsFunc =  {12,100};

(* lP=5; *)lP=8; lF=40; lFF=15;

Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
(* WriteString[lagrangeFile, StringDrop[Modelname,-2]<>": "<> modelName <> "\n"]; *)
WriteString[lagrangeFile, ModelName <> "  % Created by SARAH v"<>SA`Version<>" (arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223, 1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306) at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"\n"];
If[CompHep==False,
WriteString[lagrangeFile, "Vertices  \n"];
(* WriteString[lagrangeFile, "  A1  | A2  | A3  | A4  |"]; *)
WriteString[lagrangeFile, "  A1     | A2     | A3     | A4     |"];
WriteString[lagrangeFile,InsString["> Factor ",lF-1]];
WriteString[lagrangeFile,"<|"];
WriteString[lagrangeFile, "> Lorentz part                                                                                             <|\n"];
,
WriteString[lagrangeFile, "Lagrangian  \n"];
WriteString[lagrangeFile, "  P1  | P2  | P3  | P4  |"];
WriteString[lagrangeFile,InsString["> Factor ",lF-1]];
WriteString[lagrangeFile,"<|"];
WriteString[lagrangeFile, "> dLagrangian/ dA(p1) dA(p2) dA(p3)                                                                       <|\n"];

];

(* WriteString[funcFile, StringDrop[Modelname,-2]<>": "<> modelName <> "\n"]; *)
Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
WriteString[funcFile, ModelName <> "  % Created by SARAH v"<>SA`Version<>" (arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223, 1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306) at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"\n"];
WriteString[funcFile, "Constraints  \n"];
WriteString[funcFile, InsString[" Name",lFF]];
WriteString[funcFile,"|> Expression                                                                                                                                                                                <|\n"];

WriteAdditonalFunctions[RunningCoup,CPViolation,SLHA,CalcMM,RunSPhenoCH,effHiggsV];

fNr=0;

goldfak=0;
StringReplaceExtra={};

Print["Writing all vertices"];

If[FreeQ[exclude,SSS],
WriteVerticesCHep[SA`VertexList[SSS],CPViolation,FeynmanGauge, SSS,NoSplitWith,NoSplitOnly,False];
];

If[FreeQ[exclude,SSV],
WriteVerticesCHep[SA`VertexList[SSV],CPViolation,FeynmanGauge, SSV,NoSplitWith,NoSplitOnly,False];
];

If[FreeQ[exclude,SVV],
WriteVerticesCHep[SA`VertexList[SVV],CPViolation,FeynmanGauge, SVV,NoSplitWith,NoSplitOnly,False];
];

If[FreeQ[exclude,GGV],
WriteVerticesCHep[SA`VertexList[GGV],CPViolation,FeynmanGauge, GGV,NoSplitWith,NoSplitOnly,False];
];

If[FreeQ[exclude,GGS],
WriteVerticesCHep[SA`VertexList[GGS],CPViolation,FeynmanGauge, GGS,NoSplitWith,NoSplitOnly,False];
];

If[FreeQ[exclude,FFS],
WriteVerticesCHep[SA`VertexList[FFS],CPViolation,FeynmanGauge, FFS,NoSplitWith,NoSplitOnly,False];
];

If[FreeQ[exclude,FFV],
WriteVerticesCHep[SA`VertexList[FFV],CPViolation,FeynmanGauge, FFV,NoSplitWith,NoSplitOnly,False];
]
;
If[FreeQ[exclude,SSSS],
WriteVerticesCHep4[SA`VertexList[SSSS],CPViolation,FeynmanGauge, SSSS,NoSplitWith,NoSplitOnly,SupersymmetricModel];
];

StringReplaceExtra={"Sig(1,1,2)"->"1","Sig(1,2,1)"->"1","Sig(3,1,1)"->"1","Sig(3,2,2)"->"(-1)","Sig(2,1,2)"->"(-1)","Sig(2,2,1)"->"1"};
If[FreeQ[exclude,ASS],
WriteVerticesCHep[Expand[SA`VertexList[ASS]],CPViolation,FeynmanGauge, SSA, NoSplitWith,NoSplitOnly,True];
];

StringReplaceExtra={};
If[FreeQ[exclude,VVV],
WriteVerticesCHep[SA`VertexList[VVV],CPViolation,FeynmanGauge, VVV,NoSplitWith,NoSplitOnly,False];
];
(* SSVV *)

If[FreeQ[exclude,SSVV],
WriteVerticesCHep4[SA`VertexList[SSVV],CPViolation,FeynmanGauge, SSVV,NoSplitWith,NoSplitOnly,False];
];

WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[Gluon,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[Gluon,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[Gluon,1,1]<>".t",lP]<>"|        |"];
WriteString[lagrangeFile,InsString[CHForm[strongCoupling]<>"/sqrt2",lF]];
WriteString[lagrangeFile,"|m1.M3*m2.m3-m1.m3*m2.M3 \n"];



(* V V V V*)

(* Print["  Four Vector Boson - Interaction"]; *)
If[FreeQ[exclude,VVVV],
startedtimeVVVV=TimeUsed[];
Print["   ... Generic class: ",StyleForm[VVVV,"Section",FontSize->10],". Expanding and writing: ",Dynamic[progressNrCH[VVVV]] ,"/",Length[SA`VertexList[VVVV]]". (",Dynamic[progressCoupCH[VVVV]],")"];

For[i=1,i<=Length[SA`VertexList[VVVV]],
progressNrCH[VVVV]=i;
progressCoupCH[VVVV]=SA`VertexList[VVVV][[i,1]];
value=CalcHepVertex[SA`VertexList[VVVV][[i,2,1]]];
c1=1;

c2 =FullSimplify[SA`VertexList[VVVV][[i,3,1]]/SA`VertexList[VVVV][[i,2,1]]];
If[Head[c2]===Rational,value=value/Denominator[c2];c1=c1*Denominator[c2];c2=c2*Denominator[c2]];

c3 = FullSimplify[SA`VertexList[VVVV][[i,4,1]]/value];
If[Head[c3]===Rational,value=value/Denominator[c3];c1=c1*Denominator[c3];c2=c2*Denominator[c3];c3=c3*Denominator[c3]; ];

If[c1===1,c1="";,c1=CHForm[c1]<>"*"];
If[c2===1,c2="+";,If[c2<0,c2=CHForm[c2]<>"*";,c2="+"<>CHForm[c2]<>"*"]];
If[c3===1,c3="+";,If[c3<0,c3=CHForm[c3]<>"*";,c3="+"<>CHForm[c3]<>"*"]];

subVertexGen={"gt1"-> Hold[ToString[iter1]],"gt2"-> Hold[ToString[iter2]],"gt3"-> Hold[ToString[iter3]]};
If[D[D[value,strongCoupling],strongCoupling]===0,

particle1=SA`VertexList[VVVV][[i,1,1]] /. A_[{a__}]->A;
particle2=SA`VertexList[VVVV][[i,1,2]] /. A_[{a__}]->A;
particle3=SA`VertexList[VVVV][[i,1,3]] /. A_[{a__}]->A;
particle4=SA`VertexList[VVVV][[i,1,4]] /. A_[{a__}]->A;

If[FreeQ[value,Complex]==False, 
valueCurrent=value/I;
Imc="1";,
valueCurrent=value;
Imc="i";
];

valueSplit=SplitValue[valueCurrent];
 facName=CalcHepFactor[i, {iter1,iter2,iter3,iter4},VVVV]; 
(* CHForm[valueSplit, facName,iter1,iter2,iter3,iter4];*)
CHForm[valueSplit, facName];

WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CHepName[particle1,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle2,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle3,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle4,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[Imc<>"*"<>facName,lF]];
(*
c2 =CHForm[FullSimplify[SA`VertexList[VVVV][[i,3,1]]/SA`VertexList[VVVV][[i,2,1]]]];
c3 = CHForm[FullSimplify[SA`VertexList[VVVV][[i,4,1]]/SA`VertexList[VVVV][[i,2,1]]]];
*)

(* WriteString[lagrangeFile,"|("<>c1<>"*m1.m2*m3.m4)+("<>c2<>"*m1.m3*m2.m4)+("<>c3<>"*m1.m4*m2.m3)\n"]; *)

WriteString[lagrangeFile,"|"<>c1<>"m1.m2*m3.m4"<>c2<>"m1.m3*m2.m4"<>c3<>"m1.m4*m2.m3\n"];


];

i++;];
progressCoupCH[VVVV]="All done in "<>ToString[TimeUsed[]-startedtimeVVVV]<>"s";
];




(* S V A *)
If[FreeQ[exclude,SVA],
startedtimeSVA=TimeUsed[];
Print["   ... Generic class: ",StyleForm[SVA,"Section",FontSize->10],". Expanding and writing: ",Dynamic[progressNrCH[SVA]] ,"/",Length[PART[S]]". (",Dynamic[progressCoupCH[SVA]],")"];

For[i=1,i<=Length[PART[S]],
progressNrCH[SVA]=i;
progressCoupCH[SVA]={PART[S][[i,1]],Gluon,conj[partGA[[i,1]]]};

If[FreeQ[getIndizes[PART[S][[i,1]]],color]==False  && (SA`DynL[PART[S][[i,1]],color] ==={1,1} || SA`DynL[PART[S][[i,1]],color] ==={1,0} || SA`DynL[PART[S][[i,1]],color] ==={0,1} ),
For[iter1=1,iter1<=getGen[PART[S][[i,1]]],
For[fiter1=1,fiter1<=getFla[PART[S][[i,1]]],
WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[PART[S][[i,1]],iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[Gluon,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[conj[partGA[[i,1]]],iter1,fiter1],lP]<>"|        |"];
WriteString[lagrangeFile,InsString["i*Maux*"<>CHForm[strongCoupling],lF]];
WriteString[lagrangeFile,"| m2.m3 \n"];

WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[conj[PART[S][[i,1]]],iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[Gluon,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[partGA[[i,1]],iter1,fiter1],lP]<>"|        |"];
WriteString[lagrangeFile,InsString["i*Maux*"<>CHForm[strongCoupling],lF]];
WriteString[lagrangeFile,"| m2.m3 \n"];
fiter1++;];
iter1++;];
];
i++;];
progressCoupCH[SVA]="All done in "<>ToString[TimeUsed[]-startedtimeSVA]<>"s";
];
If[effHiggsV==True,
Print["  Loop induced Scalar - Two Vector Boson - Interaction"];

(*
For[i=1,i\[LessEqual]Length[RealScalarsAll],
For[iter1=getGenSPhenoStart[RealScalarsAll[[i]]],iter1\[LessEqual]getGen[RealScalarsAll[[i]]],
WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[RealScalarsAll[[i]],iter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[VectorP,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[VectorP,1,1],lP]<>"|        |"];
WriteString[lagrangeFile,InsString["-16*"<>getOutputName[RealScalarsAll[[i]]]<>"PP"<>ToString[iter1],lF]];
WriteString[lagrangeFile,"| (p2.p3*m2.m3-p2.m3*p3.m2) \n"];

WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[RealScalarsAll[[i]],iter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[VectorG,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[VectorG,1,1],lP]<>"|        |"];
WriteString[lagrangeFile,InsString["-16*"<>getOutputName[RealScalarsAll[[i]]]<>"GG"<>ToString[iter1],lF]];
WriteString[lagrangeFile,"| (p2.p3*m2.m3-p2.m3*p3.m2) \n"];
iter1++;];
i++;];
*)

If[getGen[HiggsBoson]<99,For[iter1=1,iter1<=getGen[HiggsBoson],For[fiter1=1,fiter1<=getFla[HiggsBoson],WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[HiggsBoson,iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[VectorP,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[VectorP,1,1],lP]<>"|        |"];
If[getFla[HiggsBoson]>1,WriteString[lagrangeFile,InsString["HPP"<>ToString[iter1]<>ToString[fiter1],lF]];,WriteString[lagrangeFile,InsString["HPP"<>ToString[iter1],lF]];];
WriteString[lagrangeFile,"| (p2.p3*m2.m3-p2.m3*p3.m2) \n"];
WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[HiggsBoson,iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[VectorG,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[VectorG,1,1],lP]<>"|        |"];
If[getFla[HiggsBoson]>1,WriteString[lagrangeFile,InsString["HGG"<>ToString[iter1]<>ToString[fiter1],lF]];,WriteString[lagrangeFile,InsString["HGG"<>ToString[iter1],lF]];];
WriteString[lagrangeFile,"| (p2.p3*m2.m3-p2.m3*p3.m2) \n"];
fiter1++;];
iter1++;];];

If[getGen[PseudoScalar]<99,For[iter1=getGenSPhenoStart[PseudoScalar],iter1<=getGen[PseudoScalar],For[fiter1=1,fiter1<=getFla[PseudoScalar],WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[PseudoScalar,iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[VectorP,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[VectorP,1,1],lP]<>"|        |"];
If[getFla[PseudoScalar]>1,WriteString[lagrangeFile,InsString["APP"<>ToString[iter1]<>ToString[fiter1],lF]];,WriteString[lagrangeFile,InsString["APP"<>ToString[iter1],lF]];];
WriteString[lagrangeFile,"| (p2.p3*m2.m3-p2.m3*p3.m2) \n"];
WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CalcHepName[PseudoScalar,iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[VectorG,1,1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CalcHepName[VectorG,1,1],lP]<>"|        |"];
If[getFla[PseudoScalar]>1,WriteString[lagrangeFile,InsString["AGG"<>ToString[iter1]<>ToString[fiter1],lF]];,WriteString[lagrangeFile,InsString["AGG"<>ToString[iter1],lF]];];
WriteString[lagrangeFile,"| (p2.p3*m2.m3-p2.m3*p3.m2) \n"];
fiter1++;];
iter1++;];];

(* WriteLoopInducedCouplingsCH; *)
];

(*
For[i=1,i\[LessEqual]Length[CalcHepParticlesM0],
WriteString[funcFile];
WriteString[funcFile,InsString[CalcHepParticlesM0[[i,3]],lFF]<>"|"];
WriteString[funcFile,"aWidth(\""<>CalcHepParticlesM0[[i,4]]<>"\") \n"];
i++;];
*)


For[i=1,i<=174,
WriteString[lagrangeFile,"="];
WriteString[funcFile,"="];
i++;
];


Close[lagrangeFile];
Close[funcFile];
];

WriteLoopInducedCouplingsCH:=Block[{i,j,gt1,gt2,k,counterS=1,counterT=1,pos,suffix},

For[i=1,i<=Length[RealScalarsAll],
If[FreeQ[RealScalarsCPodd,RealScalarsAll[[i]]],
suffix="even",
suffix="odd";
];

For[gt1=getGenSPhenoStart[RealScalarsAll[[i]]],gt1<=getGen[RealScalarsAll[[i]]],
WriteString[funcFile,InsString["aQCD"<>ToString[counterS],lFF]<>"|"];
WriteString[funcFile,"alphaQCD("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>")/pi\n"];

For[j=1,j<=Length[ListPhotonF],
For[gt2=1,gt2<=getGen[ListPhotonF[[j]]],
If[FreeQ[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListPhotonF[[j]],gt2,1},{AntiField[ListPhotonF[[j]]],gt2,1}}]]==False,
WriteString[funcFile,InsString["aT"<>ToString[counterT],lFF]<>"|"];
pos=Position[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListPhotonF[[j]],gt2,1},{AntiField[ListPhotonF[[j]]],gt2,1}}]][[1,1]];
WriteString[funcFile,ListVerticesExpandedCH[[pos,2]]<>"/"<>CalcHepMass[ListPhotonF[[j]],gt2,1]<>" \n"];
WriteString[funcFile,InsString["sT"<>ToString[counterT],lFF]<>"|"];
WriteString[funcFile,If[j>1 || gt2>1,"sT"<>ToString[counterT-1],""]<>"-("<>ToString[InputForm[getElectricCharge[ListPhotonF[[j]]]]]<>")^2*cabs(hAA"<>suffix<>"("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>",aQCD"<>ToString[counterS]<>",1,1,"<>ToString[SA`DimensionGG[ListPhotonF[[j]],Position[Gauge,color][[1,1]]]/. SA`DimensionGG[a__]->1]<>","<>CalcHepMass[ListPhotonF[[j]],gt2,1]<>",aT"<>ToString[counterT]<>")) \n"];
counterT++;
];
gt2++;];
j++;];

If[FreeQ[RealScalarsCPodd,RealScalarsAll[[i]]],
For[j=1,j<=Length[ListPhotonS],
For[gt2=getGenSPhenoStart[ListPhotonS[[j]]],gt2<=getGen[ListPhotonS[[j]]],
If[FreeQ[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListPhotonS[[j]],gt2,1},{AntiField[ListPhotonS[[j]]],gt2,1}}]]==False,
WriteString[funcFile,InsString["aT"<>ToString[counterT],lFF]<>"|"];
pos=Position[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListPhotonS[[j]],gt2,1},{AntiField[ListPhotonS[[j]]],gt2,1}}]][[1,1]];
WriteString[funcFile,ListVerticesExpandedCH[[pos,2]]<>"/(2*"<>CalcHepMass[ListPhotonS[[j]],gt2,1]<>"^2) \n"];
WriteString[funcFile,InsString["sT"<>ToString[counterT],lFF]<>"|"];
WriteString[funcFile,"sT"<>ToString[counterT-1]<>"-("<>ToString[InputForm[getElectricCharge[ListPhotonS[[j]]]]]<>")^2*cabs(hAAeven("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>",aQCD"<>ToString[counterS]<>",1,0,"<>ToString[SA`DimensionGG[ListPhotonS[[j]],Position[Gauge,color][[1,1]]]]<>","<>CalcHepMass[ListPhotonS[[j]],gt2,1]<>",aT"<>ToString[counterT]<>")) \n"];
counterT++;
];
gt2++;];
j++;];

For[j=1,j<=Length[ListPhotonV],
For[gt2=1,gt2<=getGen[ListPhotonV[[j]]],
If[FreeQ[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListPhotonV[[j]],gt2,1},{AntiField[ListPhotonV[[j]]],gt2,1}}]]==False,
WriteString[funcFile,InsString["aT"<>ToString[counterT],lFF]<>"|"];
pos=Position[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListPhotonV[[j]],gt2,1},{AntiField[ListPhotonV[[j]]],gt2,1}}]][[1,1]];
WriteString[funcFile,"-"<>ListVerticesExpandedCH[[pos,2]]<>"/"<>CalcHepMass[ListPhotonV[[j]],gt2,1]<>"^2 \n"];
WriteString[funcFile,InsString["sT"<>ToString[counterT],lFF]<>"|"];
WriteString[funcFile,"sT"<>ToString[counterT-1]<>"-("<>ToString[InputForm[getElectricCharge[ListPhotonV[[j]]]]]<>")^2*cabs(hAAeven("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>",aQCD"<>ToString[counterS]<>",1,2,1,"<>CalcHepMass[ListPhotonV[[j]],gt2,1]<>",aT"<>ToString[counterT]<>")) \n"];
counterT++;
];
gt2++;];
j++;];
];
WriteString[funcFile,InsString[getOutputName[RealScalarsAll[[i]]]<>"PP"<>ToString[gt1],lFF]<>"|"];
WriteString[funcFile,"sT"<>ToString[counterT-1]<>" \n"];

counterS++;
gt1++;];
i++;];


For[i=1,i<=Length[RealScalarsAll],
If[FreeQ[RealScalarsCPodd,RealScalarsAll[[i]]],
suffix="even",
suffix="odd";
];

For[gt1=getGenSPhenoStart[RealScalarsAll[[i]]],gt1<=getGen[RealScalarsAll[[i]]],
WriteString[funcFile,InsString["aQCD"<>ToString[counterS],lFF]<>"|"];
WriteString[funcFile,"alphaQCD("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>")/pi\n"];

For[j=1,j<=Length[ListGluonF],
For[gt2=1,gt2<=getGen[ListGluonF[[j]]],
If[FreeQ[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListGluonF[[j]],gt2,1},{AntiField[ListGluonF[[j]]],gt2,1}}]]==False,
WriteString[funcFile,InsString["aT"<>ToString[counterT],lFF]<>"|"];
pos=Position[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListGluonF[[j]],gt2,1},{AntiField[ListGluonF[[j]]],gt2,1}}]][[1,1]];
WriteString[funcFile,ListVerticesExpandedCH[[pos,2]]<>"/"<>CalcHepMass[ListGluonF[[j]],gt2,1]<>" \n"];
WriteString[funcFile,InsString["sT"<>ToString[counterT],lFF]<>"|"];
WriteString[funcFile,If[j>1 || gt2>1,"sT"<>ToString[counterT-1],""]<>"-cabs(hGG"<>suffix<>"("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>",aQCD"<>ToString[counterS]<>",1,1,"<>ToString[SA`DimensionGG[ListGluonF[[j]],Position[Gauge,color][[1,1]]]/. SA`DimensionGG[a__]->1]<>","<>CalcHepMass[ListGluonF[[j]],gt2,1]<>",aT"<>ToString[counterT]<>")) \n"];
counterT++;
];
gt2++;];
j++;];

If[FreeQ[RealScalarsCPodd,RealScalarsAll[[i]]],
For[j=1,j<=Length[ListGluonS],
For[gt2=getGenSPhenoStart[ListGluonS[[j]]],gt2<=getGen[ListGluonS[[j]]],
If[FreeQ[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListGluonS[[j]],gt2,1},{AntiField[ListGluonS[[j]]],gt2,1}}]]==False,
WriteString[funcFile,InsString["aT"<>ToString[counterT],lFF]<>"|"];
pos=Position[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListGluonS[[j]],gt2,1},{AntiField[ListGluonS[[j]]],gt2,1}}]][[1,1]];
WriteString[funcFile,ListVerticesExpandedCH[[pos,2]]<>"/(2*"<>CalcHepMass[ListGluonS[[j]],gt2,1]<>"^2) \n"];
WriteString[funcFile,InsString["sT"<>ToString[counterT],lFF]<>"|"];
WriteString[funcFile,"sT"<>ToString[counterT-1]<>"-cabs(hGGeven("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>",aQCD"<>ToString[counterS]<>",1,0,"<>ToString[SA`DimensionGG[ListGluonS[[j]],Position[Gauge,color][[1,1]]]]<>","<>CalcHepMass[ListGluonS[[j]],gt2,1]<>",aT"<>ToString[counterT]<>")) \n"];
counterT++;
];
gt2++;];
j++;];

For[j=1,j<=Length[ListGluonV],
For[gt2=1,gt2<=getGen[ListGluonV[[j]]],
If[FreeQ[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListGluonV[[j]],gt2,1},{AntiField[ListGluonV[[j]]],gt2,1}}]]==False,
WriteString[funcFile,InsString["aT"<>ToString[counterT],lFF]<>"|"];
pos=Position[ListVerticesExpandedCH,Sort[{{RealScalarsAll[[i]],gt1,1},{ListGluonV[[j]],gt2,1},{AntiField[ListGluonV[[j]]],gt2,1}}]][[1,1]];
WriteString[funcFile,"-"<>ListVerticesExpandedCH[[pos,2]]<>"/"<>CalcHepMass[ListGluonV[[j]],gt2,1]<>"^2 \n"];
WriteString[funcFile,InsString["sT"<>ToString[counterT],lFF]<>"|"];
WriteString[funcFile,"sT"<>ToString[counterT-1]<>"-cabs(hGGeven("<>CalcHepMass[RealScalarsAll[[i]],gt1,1]<>",aQCD"<>ToString[counterS]<>",1,2,1,"<>CalcHepMass[ListGluonV[[j]],gt2,1]<>",aT"<>ToString[counterT]<>")) \n"];
counterT++;
];
gt2++;];
j++;];
];
WriteString[funcFile,InsString[getOutputName[RealScalarsAll[[i]]]<>"GG"<>ToString[gt1],lFF]<>"|"];
WriteString[funcFile,"sT"<>ToString[counterT-1]<>" \n"];

counterS++;
gt1++;];
i++;];


];


(* ::Input::Initialization:: *)
WriteAdditonalFunctions[RunningCoup_,CPViolation_,SLHA_,CalcMM_,RunSPhenoCH_,effHiggsV_]:=Block[{list,i,abbr,name, writtenLH={}},
Print["Writing additional functions"];

If[RunSPhenoCH==True,
SetFuncSPhenoCH;
];

SA`DependentMasses=ToString/@CForm/@Table[subNumDependencesMasses[[i,1]],{i,1,Length[subNumDependencesMasses]}];

If[SLHA,
WriteString[funcFile,InsString["rd",lFF]<>"|"];
WriteString[funcFile,"slhaRead(\"SPheno.spc."<>ModelName<>"\",0) \n"];

For[i=1,i<=Length[CalcHepParticlesM0],
If[FreeQ[SA`DependentMasses,CalcHepParticlesM0[[i,1]]],
WriteString[funcFile,InsString[CalcHepParticlesM0[[i,1]],lFF]<>"|"];
WriteString[funcFile,"slhaVal(\"MASS\",Q,1,"<>ToString[Abs[ToExpression[CalcHepParticlesM0[[i,2]]]]]<>") \n"];
];
i++;];

For[i=1,i<=Length[parameters],
If[(FreeQ[parNum,parameters[[i,1]]]==True && FreeQ[parDep,parameters[[i,1]]]==True)  && (LHBlockName[parameters[[i,1]]]=!="NONE"&& LHBlockName[parameters[[i,1]]]=!="LESHOUCHES") && (RunningCoupling===False || parameters[[i,1]]=!=strongCoupling) &&(FreeQ[VertexList3,parameters[[i,1]]]==False || FreeQ[VertexList4,parameters[[i,1]]] ==False || FreeQ[parDepNeeded,parameters[[i,1]]] ==False),

writtenLH = Join[writtenLH,{parameters[[i,1]]}];
Switch[Length[parameters[[i,2]]],
0,

temp=StringReplace[ToString[CForm[parameters[[i,1]]]],{")"->"","("->""}];
tempR=StringReplace[ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]]]],{")"->"","("->""}];
tempI=StringReplace[ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]]]],{")"->"","("->""}];

If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
WriteString[funcFile,InsString[temp,lFF]<>"|"];
WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>LHPos[parameters[[i,1]]]<>") \n"];,
WriteString[funcFile,InsString[tempI,lFF]<>"|"];
WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>LHPos[parameters[[i,1]]]<>") \n"];
WriteString[funcFile,InsString[tempR,lFF]<>"|"];
WriteString[funcFile,"slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>LHPos[parameters[[i,1]]]<>") \n"];
];,

1,
	temp=ToString[CForm[parameters[[i,1]][gt1]]];
	tempR=ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]][gt1]]];
	tempI=ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]][gt1]]];
	For[j=1,j<=parameters[[i,3,1]],
	If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
	WriteString[funcFile, InsString[StringReplace[temp,{"gt1"->ToString[j]}],lFF]<>"|"];
	WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>ToString[j]<>") \n"];,
	WriteString[funcFile, InsString[StringReplace[tempI,{"gt1"->ToString[j]}],lFF]<> "|"];
	WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>ToString[j]<>") \n"];
	WriteString[funcFile, InsString[StringReplace[tempR,{"gt1"->ToString[j]}],lFF]<> "|"];
	WriteString[funcFile,"slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>ToString[j]<>") \n"];
			];
	j++;];,

2,

	temp=ToString[CForm[parameters[[i,1]][gt1,gt2]]];
	tempR=ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]][gt1,gt2]]];
	tempI=ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]][gt1,gt2]]];

	For[j=1,j<=parameters[[i,3,1]],
	For[k=1,k<=parameters[[i,3,2]],
	If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
	WriteString[funcFile, InsString[StringReplace[temp,{"gt1"->ToString[j],"gt2"->ToString[k]}],lFF]<>"|"];
	WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,2,"<>ToString[j]<>","<>ToString[k]<>") \n"];,
	WriteString[funcFile, InsString[StringReplace[tempI,{"gt1"->ToString[j],"gt2"->ToString[k]}],lFF]<> "|"];
	WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,2,"<>ToString[j]<>","<>ToString[k]<>") \n"];
	WriteString[funcFile, InsString[StringReplace[tempR,{"gt1"->ToString[j],"gt2"->ToString[k]}],lFF]<> "|"];
	WriteString[funcFile,"slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,2,"<>ToString[j]<>","<>ToString[k]<>") \n"];
			];
	k++;];
	j++;];,
3,

	
	temp=ToString[CForm[parameters[[i,1]][gt1,gt2,gt3]]];
	tempR=ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]][gt1,gt2,gt3]]];
	tempI=ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]][gt1,gt2,gt3]]];
	
	For[j=1,j<=parameters[[i,3,1]],
	For[k=1,k<=parameters[[i,3,2]],
	For[l=1,l<=parameters[[i,3,3]],
	If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
	WriteString[funcFile, InsString[StringReplace[temp,{"gt1"->ToString[j],"gt2"->ToString[k],"gt3"->ToString[l]}],lFF]<>"|"];
	WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,3,"<>ToString[j]<>","<>ToString[k]<>","<>ToString[l]<>") \n"];,
	WriteString[funcFile, InsString[StringReplace[tempI,{"gt1"->ToString[j],"gt2"->ToString[k],"gt3"->ToString[l]}],lFF]<> "|"];
	WriteString[funcFile,"slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,3,"<>ToString[j]<>","<>ToString[k]<>","<>ToString[l]<>") \n"];
	WriteString[funcFile, InsString[StringReplace[tempR,{"gt1"->ToString[j],"gt2"->ToString[k],"gt3"->ToString[l]}],lFF]<> "|"];
	WriteString[funcFile,"slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,3,"<>ToString[j]<>","<>ToString[k]<>","<>ToString[l]<>") \n"];
			];
		l++;];
		k++;];
	j++;];
];
];
i++;];
];


If[SLHA==True && effHiggsV==True,
If[getGen[HiggsBoson]<99,
For[iter1=1,iter1<=getGen[HiggsBoson],
For[fiter1=1,fiter1<=getFla[HiggsBoson],
If[getFla[HiggsBoson]>1,
WriteString[funcFile,InsString["HPP"<>ToString[iter1]<>ToString[fiter1],lFF]];,
WriteString[funcFile,InsString["HPP"<>ToString[iter1],lFF]];
];
WriteString[funcFile,"| slhaVal(\"EFFHIGGSCOUPLINGS\",Q,3,"<>ToString[getPDG[HiggsBoson,iter1,fiter1]]<>","<>ToString[getPDG[VectorP,1]]<>","<>ToString[getPDG[VectorP,1]]<>") \n"];
If[getFla[HiggsBoson]>1,
WriteString[funcFile,InsString["HGG"<>ToString[iter1]<>ToString[fiter1],lFF]];,
WriteString[funcFile,InsString["HGG"<>ToString[iter1],lFF]];
];
WriteString[funcFile,"| slhaVal(\"EFFHIGGSCOUPLINGS\",Q,3,"<>ToString[getPDG[HiggsBoson,iter1,fiter1]]<>","<>ToString[getPDG[VectorG,1]]<>","<>ToString[getPDG[VectorG,1]]<>") \n"];
fiter1++;];
iter1++;];
];

If[getGen[PseudoScalar]<99,
For[iter1=getGenSPhenoStart[PseudoScalar],iter1<=getGen[PseudoScalar],
For[fiter1=1,fiter1<=getFla[PseudoScalar],
If[getFla[PseudoScalar]>1,
WriteString[funcFile,InsString["APP"<>ToString[iter1]<>ToString[fiter1],lFF]];,
WriteString[funcFile,InsString["APP"<>ToString[iter1],lFF]];
];
WriteString[funcFile,"| slhaVal(\"EFFHIGGSCOUPLINGS\",Q,3,"<>ToString[getPDG[PseudoScalar,iter1,fiter1]]<>","<>ToString[getPDG[VectorP,1]]<>","<>ToString[getPDG[VectorP,1]]<>") \n"];
If[getFla[PseudoScalar]>1,
WriteString[funcFile,InsString["AGG"<>ToString[iter1]<>ToString[fiter1],lFF]];,
WriteString[funcFile,InsString["AGG"<>ToString[iter1],lFF]];
];
WriteString[funcFile,"| slhaVal(\"EFFHIGGSCOUPLINGS\",Q,3,"<>ToString[getPDG[PseudoScalar,iter1,fiter1]]<>","<>ToString[getPDG[VectorG,1]]<>","<>ToString[getPDG[VectorG,1]]<>") \n"];
fiter1++;];
iter1++;];
];
];

If[RunningCoup==True && FreeQ[ParameterDefinitions,"Strong-Coupling"] == False && FreeQ[ParticleDefinitions[EigenstateName],"Up-Quarks"] ==False && FreeQ[ParticleDefinitions[EigenstateName],"Down-Quarks"] ==False,
WriteString[funcFile,InsString["QCDok",lFF]<>"|"];
WriteString[funcFile,"initQCD(alfSMZ,"<>CalcHepMass[TopQuark,2]<>","<>CalcHepMass[BottomQuark,3]<>","<>CalcHepMass[TopQuark,3]<>") \n"];
WriteString[funcFile,InsString[CHForm[strongCoupling],lFF]<>"|"];
WriteString[funcFile,"sqrt(alphaQCD(Q)*4*3.1415927)*one(QCDok) \n"];,
If[RunningCoup==True ,
WriteString[funcFile,InsString["QCDok",lFF]<>"|"];
WriteString[funcFile,"initQCD(alfSMZ,1.2,4.23,175.) \n"];
WriteString[funcFile,InsString[ToString[strongCoupling],lFF]<>"|"];
WriteString[funcFile,"sqrt(alphaQCD(Q)*4*3.1415927)*one(QCDok) \n"];
];
];

For[i=1,i<=Length[angles],
If[FreeQ[parDep,angles[[i]]],
AbbreviateAngle[angles[[i]]];
];
i++;];

For[i=1,i<=Length[parDepExpandedList],
If[CPViolation===True && MemberQ[realVar,parDepExpandedList[[i,1]]]==False && MemberQ[realVar,Head[parDepExpandedList[[i,1]]]]==False,
WriteString[funcFile,InsString["R"<>ToString[CForm[parDepExpandedList[[i,1]]/. Mass->CalcHepMassExp]],lFF]<>"|"];
WriteString[funcFile,ToString[CForm[parDepExpandedList[[i,2]]/. Mass->CalcHepMassExp]]<>" \n"];
WriteString[funcFile,InsString["I"<>ToString[CForm[parDepExpandedList[[i,1]]/. Mass->CalcHepMassExp]],lFF]<>"|"];
WriteString[funcFile,"0.  \n"];,
WriteString[funcFile,InsString[ToString[CForm[parDepExpandedList[[i,1]]/. Mass->CalcHepMassExp]],lFF]<>"|"];
WriteString[funcFile,ToString[CForm[parDepExpandedList[[i,2]]/. Mass->CalcHepMassExp]]<>" \n"];
];
If[FreeQ[angles,parDepExpandedList[[i,1]]]==False,
AbbreviateAngle[parDepExpandedList[[i,1]]];
];
i++;];

If[SLHA===False && CalcMM===True,
WriteCalcHepMassMatrices;
];


];

AbbreviateAngle[ang_]:=Block[{i,pos,abn},

list={\[Alpha],\[Beta],\[Gamma],\[Delta],\[Lambda],\[Epsilon], ThetaW};
abbr={a,b,g,d,k,e,TW};
name={alpha,beta,gamma,delta,lambda,epsilon,ThetaW}; 

pos=Position[list,ang];


If[pos==={},
If[StringLength[ToString[ang]]>2,
abn=StringTake[ToString[ang],2];,
abn = ToString[ang];
];
WriteString[funcFile,InsString["S"<>abn,lFF]<>"|"];
WriteString[funcFile,"sin("<>ToString[CForm[ang]]<>") \n"];
WriteString[funcFile,InsString["C"<>abn,lFF]<>"|"];
WriteString[funcFile,"cos("<>ToString[CForm[ang]]<>") \n"];
WriteString[funcFile,InsString["T"<>abn,lFF]<>"|"];
WriteString[funcFile,"tan("<>ToString[CForm[ang]]<>") \n"];

Unprotect[Cos,Sin,Tan];
Format[Cos[ang],CForm]=Format["C"<>abn,OutputForm];
Format[Sin[ang],CForm]=Format["S"<>abn,OutputForm];
Format[Tan[ang],CForm]=Format["T"<>abn,OutputForm];
Protect[Cos,Sin,Tan];,

pos=pos[[1,1]];
WriteString[funcFile,InsString["S"<>ToString[abbr[[pos]]],lFF]<>"|"];
WriteString[funcFile,"sin("<>ToString[CForm[ang]]<>") \n"];
WriteString[funcFile,InsString["C"<>ToString[abbr[[pos]]],lFF]<>"|"];
WriteString[funcFile,"cos("<>ToString[CForm[ang]]<>") \n"];
WriteString[funcFile,InsString["T"<>ToString[abbr[[pos]]],lFF]<>"|"];
WriteString[funcFile,"tan("<>ToString[CForm[ang]]<>") \n"];

Unprotect[Cos,Sin,Tan];
Format[Cos[list[[pos]]],CForm]=Format["C"<>ToString[abbr[[pos]]],OutputForm];
Format[Sin[list[[pos]]],CForm]=Format["S"<>ToString[abbr[[pos]]],OutputForm];
Format[Tan[list[[pos]]],CForm]=Format["T"<>ToString[abbr[[pos]]],OutputForm];
Protect[Cos,Sin,Tan];
];
];

UnsetAbbreviateAngle[ang_]:=Block[{i,pos,abn},

list={\[Alpha],\[Beta],\[Gamma],\[Delta],\[Lambda],\[Epsilon], ThetaW};
abbr={a,b,g,d,k,e,TW};
name={alpha,beta,gamma,delta,lambda,epsilon,ThetaW}; 

pos=Position[list,ang];


If[pos==={},
If[StringLength[ToString[ang]]>2,
abn=StringTake[ToString[ang],2];,
abn = ToString[ang];
];

Unprotect[Cos,Sin,Tan];
Format[Cos[ang],CForm]=.;
Format[Sin[ang],CForm]=.;
Format[Tan[ang],CForm]=.;
Protect[Cos,Sin,Tan];,

pos=pos[[1,1]];

Unprotect[Cos,Sin,Tan];
Format[Cos[list[[pos]]],CForm]=.;
Format[Sin[list[[pos]]],CForm]=.;
Format[Tan[list[[pos]]],CForm]=.;
Protect[Cos,Sin,Tan];
];
];


CalcHepVertex[vertex_]:=Block[{i,temp},
	(* Change to cope better with CP phases, sometimes the I a is not picked up -- how else do we get exponentials? *)
temp=vertex //. Exp[I a_]->(Cos[a] + I Sin[a]) //. Exp[a_]->(Cos[-I*a]+I*Sin[-I*a]);
While[(FreeQ[temp,sum]==False),
temp=ReleaseHold[ReleaseHold[ReleaseHold[temp /. sum[a_,b_,c_,d_]->Hold[Sum[d,{a,b,c}]]]/. sum[a_,b_,c_,d_]->Hold[Sum[d,{a,b,c}]]]/. sum[a_,b_,c_,d_]->Hold[Sum[d,{a,b,c}]] ];
];
temp = Return[temp /. CHsub];

];

CHForm[x_String]:=Return[StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[x," "->""],StringReplacementsCH],StringReplacementsCH],StringReplacementsCH],StringReplaceConj]];
CHForm[x_]:=Return[StringReplace[StringReplace[StringReplace[StringReplace[StringReplace[ToString[InputForm[x]]," "->""],StringReplacementsCH],StringReplacementsCH],StringReplacementsCH],StringReplaceConj]];

CHForm[x_,name_]:=Block[{i}, 
splitComplete=0;
If[Length[x]>1,
For[i=1,i<=Length[x],
splitNr=SplitF[split];
splitNrM=SplitF[split-1];
If[i===Length[x],
WriteString[funcFile,InsString[name,lFF]<>"|"];
split--,
WriteString[funcFile,InsString[ToString[splitNr],lFF]<>"|"];
];
If[i>1,
WriteString[funcFile,ToString[splitNrM]<>"+("<>StringReplace[StringReplace[x[[i]],ReleaseHold[subVertexGen]],StringReplaceExtra]<>") \n"];,
WriteString[funcFile,StringReplace[StringReplace[x[[i]],ReleaseHold[subVertexGen]],StringReplaceExtra]<>" \n"];
];
split++;
i++;];,
WriteString[funcFile,InsString[name,lFF]<>"|"];
WriteString[funcFile,StringReplace[StringReplace[x,ReleaseHold[subVertexGen]],StringReplaceExtra]<>" \n"];
];
];

SplitF[Nr_]:=Which[Nr <100000,Return[ToExpression["s"<>ToString[Nr]]];,
 100000<=Nr<200000,Return[ToExpression["t"<>ToString[Nr-100000]]];,
200000<=Nr<300000,Return[ToExpression["u"<>ToString[Nr-200000]]];,
300000<=Nr<400000,Return[ToExpression["w"<>ToString[Nr-300000]]];,
400000<=Nr<500000,Return[ToExpression["x"<>ToString[Nr-400000]]];,
500000<=Nr<600000,Return[ToExpression["y"<>ToString[Nr-500000]]];,
600000<=Nr<700000,Return[ToExpression["z"<>ToString[Nr-600000]]];,
Nr>700000,Print["Number of necessary parameters more than 700000; the output file would be much too long to work with, so it is not reasonable to continue here"];  Interrupt[];
                                            ];

 CalcHepFactor[nr_,list_,type_]:=Block[{i,string},
string="v";
For[i=1,i<=(4-StringLength[ToString[fNr]]), 
string=string<>"0";
i++;];
string=string<>ToString[fNr];
fNr++;
Return[string];
];

CalcHepFullName[x_,gen_,fla___] :=Block[{i,p,pTemp},
p=ToString[x];
If[(getGen[x]>1) && (gen=!=0),
If[getFla[x]>1,
p=p<>"[{"<>ToString[gen]<>ToString[fla]<>"}]";,
p=p<>"[{"<>ToString[gen]<>"}]";
];
];
pTemp=p;
For[i=1,i<=(-StringLength[p]+ columnWidthsParticles[[1]]),
pTemp=pTemp<>" ";
i++;];
If[StringLength[pTemp]>10,
pTemp = StringReplace[pTemp,{"["->"","]"->"","{"->"","}"->""}];
If[StringLength[pTemp]>10,
pTemp=StringTake[pTemp,10];
];
];
Return[pTemp];
];


CalcHepName[x_,gen_,fla___]:=Block[{i,p,pTemp,nF,pos},
If[FreeQ[partGA,getBlank[x]],
nF = getFla[x];,
pos=Position[partGA,getBlank[x]][[1,1]];
nF = partGA[[pos]][[3]];
];

If[getType[getBlank[x]]=!=G,
If[FreeQ[CHParticleList,getBlank[x]]===False,
If[((Head[x]=!=conj) && (Head[x]=!=bar))  || (SelfAdjQ[x]===True),
If[(getGen[x]==1) || (gen==0), 
pos=Position[CHParticleList ,getBlank[x]][[1,1]];
Return[Extract[CHParticleList ,pos][[3,1]]];,
If[nF>1,
pos=Position[CHParticleList ,getBlank[x][{gen,fla}]][[1,1]];
Return[Extract[CHParticleList ,pos][[3,1]]];,
pos=Position[CHParticleList ,getBlank[x][{gen}]][[1,1]];
Return[Extract[CHParticleList ,pos][[3,1]]];
];
];,
If[(getGen[x]==1) || (gen==0), 
pos=Position[CHParticleList ,getBlank[x]][[1,1]];
Return[Extract[CHParticleList ,pos][[3,2]]];,
If[nF>1,
pos=Position[CHParticleList ,getBlank[x][{gen,fla}]][[1,1]];
Return[Extract[CHParticleList ,pos][[3,2]]];,
pos=Position[CHParticleList ,getBlank[x][{gen}]][[1,1]];
Return[Extract[CHParticleList ,pos][[3,2]]];
];
];
];,
Message[CHep::NoName,x];
Return[CalcHepNameAuto[x,gen]];
];,
If[Head[x]===bar, 
finalC=".C";
SwitchPosition=True;,
finalC=".c";
SwitchPosition=False;
];


If[StringTake[ToString[getBlank[x]],-1]==="C",
VectorBoson = ToExpression["V"<>StringDrop[StringDrop[ToString[getBlank[x]],-1],1]];
If[SwitchPosition==False,
pos2={3,2};,
pos2={3,1};
];,
If[SwitchPosition==False,
pos2={3,1};,
pos2={3,2};
];
VectorBoson= ToExpression["V"<>StringDrop[ToString[getBlank[x]],1]];
];
pos=Position[CHParticleList ,VectorBoson][[1,1]];
Return[ToString[Extract[Extract[CHParticleList ,pos],pos2]]<>finalC];
];
];


CalcHepNameAuto[x_,gen_,fla___]:=Block[{i,p,pTemp},
If[getType[getBlank[x]]=!=G,
If[(Head[x]=!=conj) || (conj[x]===x),
p=ToString[getBlank[x]];
If[StringLength[p]>3,
p=StringTake[p,3];
];
If[(getGen[x]>1) && (gen=!=0),
p=p<>ToString[gen];
If[getFla[x]>1,
p=p<>ToString[fla];
];
];
pTemp=p;
For[i=1,i<=(-StringLength[p]+ columnWidthsParticles[[2]]),
pTemp=pTemp<>" ";
i++;];
Return[pTemp];,

p=ToString[getBlank[x]];
If[StringLength[p]>3,
	p=StringTake[p,3];
];

firstLetter=StringTake[p,1];
p=StringDrop[p,1];

If[UpperCaseQ[firstLetter],
firstLetter=ToLowerCase[firstLetter];,
firstLetter=ToUpperCase[firstLetter];
];

p=firstLetter<>p;
If[(getGen[x]>1) && (gen=!=0),
p=p<>ToString[gen];
If[getFla[x]>1,
p=p<>ToString[fla];
];
];
pTemp=p;
For[i=1,i<=(-StringLength[p]+ columnWidthsParticles[[2]]),
pTemp=pTemp<>" ";
i++;];

Return[pTemp];
];,

If[Head[x]===bar,finalC=".C";,finalC=".c";];
p=ToString[getBlank[x]];
If[StringTake[p,-1]==="C",
Return["v"<>StringDrop[StringDrop[p,{1}],-1]<>finalC];,
Return["V"<>StringDrop[p,{1}]<>finalC];
];



];
]; 


CalcHepMass[x_,gen_,fla___]:=Block[{i,p,pTemp,name},
name=StringReplace[CalcHepName[x,gen,fla],{"~"->""}];
Return["M"<>name];
];

CalcHepMassExp[x_]:=CalcHepMassExp[x,1];

CalcHepMassExp[x_,gen_,fla___]:=Block[{i,p,pTemp,name},
name=StringReplace[CalcHepName[x,gen,fla],{"~"->""}];
Return[ToExpression["M"<>name]];
];


CalcHepWidth[x_,gen_,fla___]:=Block[{i,p,pTemp,name},
name=StringReplace[CalcHepName[x,gen,fla],{"~"->""}];
Return["W"<>name];
];

InsString[string_,length_]:=Block[{i,p},
p=string;
For[i=1,i<=(length-StringLength[string]),
p=p<>" ";
i++;];
Return[p];
];


automatizedNumber=12345;

 CalcHepNumber[x_,gen_,fla___]:=Block[{pos,i,p},
If[FreeQ[CHParticleList ,x]==False,
If[getGen[x]>1,
If[getFla[x]>1,
pos=Position[CHParticleList ,x[{gen,fla}]][[1,1]];
p=ToString[Extract[CHParticleList ,pos][[2]]];,
pos=Position[CHParticleList ,x[{gen}]][[1,1]];
p=ToString[Extract[CHParticleList ,pos][[2]]];
];,
pos=Position[CHParticleList ,x][[1,1]];
p=ToString[Extract[CHParticleList ,pos][[2]]];
];,
Message[CHep::NoNumber,x];
automatizedNumber++;
p=ToString[automatizedNumber];
];

Return[p];
];



CalcHepTeXName[part_,gen_,fla___]:=Block[{i,p,pTemp,pos},
If[FreeQ[TeXParticles,part]==True,
Message[CHep::NoLatex,part];
texname=ToString[part];,
pos = Position[TeXParticles,part,2,1][[1,1]];
texname=Extract[TeXParticles,pos][[2]];
];
If[getFla[part]<2,
Return[AddExp[texname,"",ToString[gen]]];,
Return[AddExp[texname,"","{"<>ToString[gen]<>ToString[fla]<>"}"]];
];
];

CalcHepSubs:=Block[{i},
CHsub={};
CHsub = Join[CHsub,{RXi[x_]->1, fSU3[a__]->1/I,epsTensor[ct1,ct2,ct3]->1,Delta[a__]->1,ThetaStep[a__]->1,Lam[a__]->2,CG[SU[3],{___,{1,1},___}][a__]->2}];  (* Changes by FS, 11/07/19 *)
];

AddGoldstone[CompHep_]:=Block[{i,j,k},
GoldList = GoldstoneBosons[ToExpression[modelName]];
Goldstones={};
For[i=1,i<=Length[GoldList],
If[Head[GoldList[[i,2]]]===conj,
CHParticleList =Join[CHParticleList ,{{RE[GoldList[[i,2]]],0,{CalcHepName[conj[GoldstoneGhost[[i,1]]],0]<>".f",CalcHepName[GoldstoneGhost[[i,1]],0]<>".f"} }}];,
CHParticleList =Join[CHParticleList ,{{GoldList[[i,2]],0,{CalcHepName[GoldstoneGhost[[i,1]],0]<>".f",CalcHepName[conj[GoldstoneGhost[[i,1]]],0]<>".f"} }}];
];
Goldstones=Join[Goldstones,{RE[GoldList[[i,2]]]}];
i++;
];

ANr=0;
For[i=1,i<=Length[PART[A]],
(* If[getGen[PART[A][[i,1]]]\[NotEqual] 8,  *)
If[FreeQ[getBlankSF/@aGauge,PART[A][[i,1]]],
start=1;  ende=getGen[PART[A][[i,1]]];,
If[FreeQ[BrokenGaugeSymmetries[SA`CurrentStates],Position[getBlankSF/@aGauge,PART[A][[i,1]]][[1,1]]] || Gauge[[Position[getBlankSF/@aGauge,PART[A][[i,1]]][[1,1]]]][[2]]===U[1],
start=0; ende=0;,
start=1;  ende=getGen[PART[A][[i,1]]];
];
];
If[getFla[PART[A][[i,1]]]<2,
For[j=start,j<=ende,
If[conj[PART[A][[i,1]]]===PART[A][[i,1]],
If[CompHep==True,
CHParticleList =Join[CHParticleList , {{PART[A][[i,1]][{j}] /.a_[{0}]->a,0,{"~"<>ToString[ANr],"~"<>ToString[ANr]} }}];,
CHParticleList =Join[CHParticleList , {{PART[A][[i,1]][{j}] /.a_[{0}]->a,0,{"~0"<>ToString[ANr],"~0"<>ToString[ANr]} }}];
];
ANr++;,
If[CompHep==True,
CHParticleList =Join[CHParticleList ,{{PART[A][[i,1]][{j}],0,{"~"<>ToString[ANr],"~"<>ToString[ANr+1]}} }];,
CHParticleList =Join[CHParticleList ,{{PART[A][[i,1]][{j}],0,{"~0"<>ToString[ANr],"~0"<>ToString[ANr+1]}} }];
];
ANr+=2;
];
j++;];,
For[j=start,j<=ende,
For[k=1,k<=getFla[PART[A][[i,1]]],
If[conj[PART[A][[i,1]]]===PART[A][[i,1]],
If[CompHep==True,
CHParticleList =Join[CHParticleList , {{PART[A][[i,1]][{j,k}] /.a_[{0}]->a,0,{"~"<>ToString[ANr],"~"<>ToString[ANr]} }}];,
CHParticleList =Join[CHParticleList , {{PART[A][[i,1]][{j,k}] /.a_[{0}]->a,0,{"~0"<>ToString[ANr],"~0"<>ToString[ANr]} }}];
];
ANr++;,
If[CompHep==True,
CHParticleList =Join[CHParticleList ,{{PART[A][[i,1]][{j,k}],0,{"~"<>ToString[ANr],"~"<>ToString[ANr+1]}} }];,
CHParticleList =Join[CHParticleList ,{{PART[A][[i,1]][{j,k}],0,{"~0"<>ToString[ANr],"~0"<>ToString[ANr+1]}} }];
];
ANr+=2;
];
k++;];
j++;];
];
i++;];


If[CompHep==True,
GANr=ANr;,
GANr=0;
];

partGA={};
For[i=1,i<=Length[PART[S]],
partGA=Join[partGA,{{ToExpression["GA"<>ToString[PART[S][[i,1]]]],getGen[PART[S][[i,1]]],getFla[PART[S][[i,1]]],getIndizesWI[PART[S][[i,1]]]}}];
If[getFla[PART[S][[i,1]]]<2,
For[j=1,j<=getGen[PART[S][[i,1]]],
If[CompHep==True,
CHParticleList =Join[CHParticleList ,{{partGA[[i,1]][{j}],0,{"~"<>ToString[GANr],"~"<>ToString[GANr+1]}} }];,
CHParticleList =Join[CHParticleList ,{{partGA[[i,1]][{j}],0,{"~G"<>ToString[GANr],"~G"<>ToString[GANr+1]}} }];
];
GANr+=2;
j++;];,
For[j=1,j<=getGen[PART[S][[i,1]]],
For[k=1,k<=getFla[PART[S][[i,1]]],
If[CompHep==True,
CHParticleList =Join[CHParticleList ,{{partGA[[i,1]][{j,k}],0,{"~"<>ToString[GANr],"~"<>ToString[GANr+1]}} }];,
CHParticleList =Join[CHParticleList ,{{partGA[[i,1]][{j,k}],0,{"~G"<>ToString[GANr],"~G"<>ToString[GANr+1]}} }];
];
GANr+=2;
k++;];
j++;];
];
i++;];

];


CreateParticleList[CompHep_,DMc1_,DMc2_] :=Block[{i,j, name,k,l,temp={}},
If[CompHep==True,
maxStringLengthName=3;,
maxStringLengthName=8;
];

CHParticleList = {};
GoldList = Transpose[GoldstoneBosons[ToExpression[modelName]]][[2]];
pList = ParticleDefinitions[ToExpression[modelName]];

For[i=1,i<=Length[pList],
If[FreeQ[Particles[Current],getParticleName[pList[[i,1]]]]==False,
temp = Join[temp,{pList[[i]]}];
];
i++;];
pList = temp;


For[i=1,i<=Length[pList],
If[getGen[pList[[i,1]]]==1,
name = pList[[i,1]];
If[FreeQ[GoldList,name]==True && getType[name]=!=G,
nameString = OutputName /. pList[[i,2]];

If[Head[nameString]=!=String && Head[nameString]=!=List,
nameString=ToString[pList[[i,1]]];
];

AntiFieldGiven=False;
If[Head[nameString]===List,
AntiFieldGiven=True;
nameStringAdj = nameString[[2]];
nameString=nameString[[1]];
];

(* If[CompHep\[Equal]True, *)
LettersToAdd=0;
(*
If[(RParity /. pList[[i,2]])\[Equal]-1, LettersToAdd++;];
*)

If[DMc1===Default,
If[getRParity[ pList[[i,1]],ToExpression[modelName]]==-1, LettersToAdd++;];,
If[getSecondParity[ pList[[i,1]],ToExpression[modelName],DMc1[[1]]]==DMc1[[2]], LettersToAdd++;];
];

If[DMc2=!=None,
If[getSecondParity[ pList[[i,1]],ToExpression[modelName],DMc2[[1]]]==DMc2[[2]],LettersToAdd++;LettersToAdd++;];
];

If[StringLength[nameString]+LettersToAdd > maxStringLengthName,
Message[CHep::ParticleNameLength,pList[[i,1]]];
nameString=StringTake[nameString,{1,maxStringLengthName-LettersToAdd}];
]; 
(* ]; *)

If[AntiFieldGiven=!=True,
nameAdj = If[SelfAdjQ[name]==True,nameStringAdj=nameString;,nameStringAdj =SwitchCase[nameString];];
];
(*If[(RParity /. pList[[i,2]])\[Equal]-1,nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];]; *)
If[DMc1===Default,
If[getRParity[ pList[[i,1]],ToExpression[modelName]]==-1,nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];];,
If[getSecondParity[ pList[[i,1]],ToExpression[modelName],DMc1[[1]]]==DMc1[[2]],nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];];
];
If[DMc2=!=None,
If[getSecondParity[ pList[[i,1]],ToExpression[modelName],DMc2[[1]]]==DMc2[[2]],nameStringAdj=StringJoin["~~",nameStringAdj]; nameString=StringJoin["~~",nameString];];
];
If[UsePDGIX===True,
pdg = PDG.IX /. pList[[i,2]];,
pdg = PDG /. pList[[i,2]];
];
If[Head[pdg]===List,pdg=pdg[[1]]];
If[pdg===None || pdg===PDG, pdg=99;];
CHParticleList = Join[CHParticleList,{{name,  pdg,{nameString,nameStringAdj}}}];
];,
For[j=1,j<=getGen[pList[[i,1]]],
For[l=1,l<=getFla[pList[[i,1]]],
If[getFla[pList[[i,1]]]>1,
name = pList[[i,1]][{j,l}];,
name = pList[[i,1]][{j}];
];
If[FreeQ[GoldList,name]==True && getType[name]=!=G,
nameString = OutputName /. pList[[i,2]];

If[Head[nameString]=!=String && Head[nameString]=!=List,
nameString=ToString[pList[[i,1]]];
];

AntiFieldGiven=False;
If[Head[nameString]===List,
AntiFieldGiven=True;
nameStringAdj = nameString[[2]];
nameString=nameString[[1]];
];

(* If[CompHep\[Equal]True, *)
LettersToAdd=1;
(*If[(RParity /. pList[[i,2]])\[Equal]-1, LettersToAdd++;]; *)
If[getRParity[ pList[[i,1]],ToExpression[modelName]]==-1, LettersToAdd++;];
If[StringLength[nameString]+LettersToAdd >maxStringLengthName,
Message[CHep::ParticleNameLength,pList[[i,1]]];
nameString=StringTake[nameString,{1,maxStringLengthName-LettersToAdd}];
]; 
(* ]; *)

If[getFla[pList[[i,1]]]>1,
nameString = nameString <>ToString[j]<>ToString[l];,
nameString = nameString <>ToString[j];
];
If[AntiFieldGiven=!=True,
nameAdj = If[SelfAdjQ[name]==True,nameStringAdj=nameString;,nameStringAdj =SwitchCase[nameString];];,
If[getFla[pList[[i,1]]]>1,
nameStringAdj = nameStringAdj <>ToString[j]<>ToString[l];,
nameStringAdj = nameStringAdj <>ToString[j];
];
];
(* If[(RParity /. pList[[i,2]])\[Equal]-1,nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];]; *)
(* If[getRParity[pList[[i,1]],ToExpression[modelName]]\[Equal]-1,nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];]; *)
If[DMc1===Default,
If[getRParity[ pList[[i,1]],ToExpression[modelName]]==-1,nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];];,
If[getSecondParity[ pList[[i,1]],ToExpression[modelName],DMc1[[1]]]==DMc1[[2]],nameStringAdj=StringJoin["~",nameStringAdj]; nameString=StringJoin["~",nameString];];
];
If[DMc2=!=None,
If[getSecondParity[ pList[[i,1]],ToExpression[modelName],DMc2[[1]]]==DMc2[[2]],nameStringAdj=StringJoin["~~",nameStringAdj]; nameString=StringJoin["~~",nameString];];
];
If[UsePDGIX===True,
pdg = PDG.IX /. pList[[i,2]];,
pdg = PDG /. pList[[i,2]];
];
If[pdg===None || pdg===PDG, 
pdg=99;,
If[Length[pdg]<j*getFla[pList[[i,1]]],
pdg=99;,
pdg=pdg[[1+(j-1)*getFla[pList[[i,1]]]+(l-1)]];
];
];
CHParticleList = Join[CHParticleList,{{name,  pdg,{nameString,nameStringAdj}}}];
];
l++;];
j++;];
];
i++;];


subComplexParameters={};
For[i=1,i<=Length[parameters],
If[MemberQ[realVar,parameters[[i,1]]]==False,
realVar = Join[realVar,{ToExpression["Re"<>ToString[parameters[[i,1]]]],ToExpression["Im"<>ToString[parameters[[i,1]]]]}];
If[Length[parameters[[i,2]]]==0,
subComplexParameters=Join[subComplexParameters,{parameters[[i,1]]->ToExpression["Re"<>ToString[parameters[[i,1]]]]+I ToExpression["Im"<>ToString[parameters[[i,1]]]]}];,
If[FreeQ[parameters[[i]],flavor],
subComplexParameters=Join[subComplexParameters,{parameters[[i,1]][x__]->ToExpression["Re"<>ToString[parameters[[i,1]]]][x]+I ToExpression["Im"<>ToString[parameters[[i,1]]]][x]}];,
subComplexParameters=Join[subComplexParameters,{parameters[[i,1]][y_][x__]->ToExpression["Re"<>ToString[parameters[[i,1]]]][y,x]+I ToExpression["Im"<>ToString[parameters[[i,1]]]][y,x]}];
];
];
];
i++;];

];


SwitchCase[x_]:=Block[{},
firstL=StringTake[x,1];
If[LowerCaseQ[firstL]==True,firstL=ToUpperCase[firstL];,firstL=ToLowerCase[firstL];];
Return[firstL<>StringDrop[x,1]];
];

SelfAdjQ[x_]:=Block[{},
If[getTypeOld[x]===F,
If[MemberQ[MajoranaPart,getBlank[x]]==True, Return[True];,Return[False];];,
If[MemberQ[realVar,getBlank[x]]==True, Return[True];,Return[False];];
];
];




(* ::Input::Initialization:: *)
WriteVerticesCHep[vlist_,CPViolation_,FeynmanGauge_,type_, NoSplitWith_,NoSplitOnly_,TestAux_]:=Block[{i,j,iter1,iter2,iter3,iter4,fiter1,fiter2,fiter3,fiter4,gf1,gf2,gf3,particle1,particle2,particle3, entry,WriteCompleteVertex,colorflow,cfsupported,startedtime},

startedtime=TimeUsed[];
Print["   ... Generic class: ",StyleForm[type,"Section",FontSize->10],". Expanding and writing: ",Dynamic[progressNrCH[type]] ,"/",Length[vlist]". (",Dynamic[progressCoupCH[type]],")"];

For[i=1,i<=Length[vlist],
progressNrCH[type]=i;
progressCoupCH[type]=vlist[[i,1]];

cfsupported=CheckCHsupportedColor[vlist[[i,1]]];

If[cfsupported==True,
If[TestAux==True,
If[Length[NoSplitOnly]>0,
WriteCompleteVertex=False;
For[j=1,j<=2,
If[FreeQ[NoSplitOnly,getBlank[vlist[[i,1,j]]]]==True,
WriteCompleteVertex=True;
];
j++;];,
WriteCompleteVertex=True;
For[j=1,j<=Length[NoSplit],
If[FreeQ[vlist[[i,1]],NoSplitWith[[j]]]==False,
WriteCompleteVertex=False;
];
j++;];
];,
WriteCompleteVertex=True;
];

If[WriteCompleteVertex==True,

subVertexGen={"gt1"-> Hold[ToString[iter1]],"gt2"-> Hold[ToString[iter2]],"gt3"-> Hold[ToString[iter3]],"ft1"-> Hold[ToString[fiter1]],"ft2"-> Hold[ToString[fiter2]],"ft3"-> Hold[ToString[fiter3]]};
If[type===FFS || type===FFV,
valueA=CalcHepVertex[vlist[[i,2,1]]];
valueB=CalcHepVertex[vlist[[i,3,1]]];
 If[FreeQ[valueA,Complex]==False || FreeQ[valueB,Complex]==False, 
valueA=valueA/I;
valueB=valueB/I;
Imc="1";,
Imc="i";
];


Clear[iter1,iter2,iter3,fiter1,fiter2,fiter3];
PlusIndices=Cases[Expand[valueA],x:(a_Symbol+b_Integer),10];
PlusIndices=Join[PlusIndices,Cases[Expand[valueB],x:(a_Symbol+b_Integer),10]];
PlusIndices=Intersection[PlusIndices];

If[Length[PlusIndices]>0,
For[j=1,j<=Length[PlusIndices],
var=ToExpression["gtP"<>ToString[j]];
valueAReplaced = valueA /. {PlusIndices[[j]]->var};
valueBReplaced = valueB /. {PlusIndices[[j]]->var};
subVertexGen = Join[subVertexGen,{ToString[var]->(Hold[ToString[Evaluate[entry]]] /. entry ->PlusIndices[[j]] /. {gt1->iter1,gt2->iter2,gt3->iter3,ft1->fiter1,ft2->fiter2,ft3->fiter3})}];
j++;];,
valueAReplaced = valueA;
valueBReplaced = valueB;
];

 If[CPViolation==True,
valueCurrentA = Expand[valueAReplaced/. subComplexParameters];
valueCurrentB = Expand[valueBReplaced /. subComplexParameters];
valueImA = SplitValue[Im[valueCurrentA] /. {Im[x_]->0, Re[x_]->x}];
valueReA = SplitValue[Re[valueCurrentA] /. {Im[x_]->0, Re[x_]->x}];
valueImB = SplitValue[Im[valueCurrentB] /. {Im[x_]->0, Re[x_]->x}];
valueReB = SplitValue[Re[valueCurrentB] /. {Im[x_]->0, Re[x_]->x}];,
valueCurrentA = SplitValue[Expand[valueAReplaced]/. conj[x_]->x];
valueCurrentB = SplitValue[Expand[valueBReplaced]/. conj[x_]->x];
]; ,

value=CalcHepVertex[vlist[[i,2,1]]];


If[FreeQ[value,Complex]==False, 
value=value/I;
Imc="1";,
Imc="i";
];


Clear[iter1,iter2,iter3,fiter1,fiter2,fiter3];
PlusIndices=Intersection[Cases[Expand[value],x:(a_Symbol+b_Integer),10]];
If[Length[PlusIndices]>0,
For[j=1,j<=Length[PlusIndices],
var=ToExpression["gtP"<>ToString[j]];
valueReplaced = value /. {PlusIndices[[j]]->var};
subVertexGen = Join[subVertexGen,{ToString[var]->(Hold[ToString[Evaluate[entry]]] /. entry ->PlusIndices[[j]] /. {gt1->iter1,gt2->iter2,gt3->iter3})}];
j++;];,
valueReplaced=value;
];

If[CPViolation==True,
valueCurrent = Expand[valueReplaced/. subComplexParameters];
valueIm = SplitValue[Im[valueCurrent] /. {Im[x_]->0, Re[x_]->x}];
valueRe =SplitValue[Re[valueCurrent] /. {Im[x_]->0, Re[x_]->x}];,
valueCurrent = Expand[valueReplaced/. conj[x_]->x];
valueSplitted =SplitValue[valueCurrent];
]; 
];

gf1=getGen[vlist[[i,1,1]]];
gf2=getGen[vlist[[i,1,2]]];
gf3=getGen[vlist[[i,1,3]]];

ff1=getFla[vlist[[i,1,1]]];
ff2=getFla[vlist[[i,1,2]]];
ff3=getFla[vlist[[i,1,3]]];

particle1=vlist[[i,1,1]] /. A_[{a__}]->A;
particle2=vlist[[i,1,2]] /. A_[{a__}]->A;
particle3=vlist[[i,1,3]] /. A_[{a__}]->A;

If[(vlist[[i,1,2]] /. {gt2->gt1,ft2->ft1, ct2->ct1})===vlist[[i,1,1]],
start2=Hold[iter1];
fstart2=Hold[fiter1];,
start2=1;
fstart2=1;
];

If[(vlist[[i,1,3]] /. {gt3->gt2,ft3->ft2})===vlist[[i,1,2]],
start3=Hold[iter2];
fstart3=Hold[fiter2];,
If[(vlist[[i,1,3]] /. {gt3->gt1,ft3->ft1})===vlist[[i,1,1]],
start3=Hold[iter1];
fstart3=Hold[fiter1];,
start3=1;
fstart3=1;
];
];


 If[FreeQ[vlist[[i]],Delta[gt1,gt2]]==False,start2=Hold[iter1];gf2=Hold[iter1];];
If[FreeQ[vlist[[i]],Delta[gt1,gt3]]==False,start3=Hold[iter1];gf3=Hold[iter1];];
If[FreeQ[vlist[[i]],Delta[gt2,gt3]]==False,start3=Hold[iter2];gf3=Hold[iter2];];

If[FreeQ[vlist[[i]],Delta[ft1,ft2]]==False,fstart2=Hold[fiter1];ff2=Hold[fiter1];];
If[FreeQ[vlist[[i]],Delta[ft1,ft3]]==False,fstart3=Hold[fiter1];ff3=Hold[fiter1];];
If[FreeQ[vlist[[i]],Delta[ft2,ft3]]==False,fstart3=Hold[fiter2];ff3=Hold[fiter2];];




For[iter1=1,iter1<=gf1,
For[fiter1=1,fiter1<=ff1,
For[iter2=ReleaseHold[start2],iter2<=ReleaseHold[gf2],
For[fiter2=ReleaseHold[fstart2],fiter2<=ReleaseHold[ff2],
For[iter3=ReleaseHold[start3],iter3<=ReleaseHold[gf3],
For[fiter3=ReleaseHold[fstart3],fiter3<=ReleaseHold[ff3],
If[FeynmanGauge==False,
If[(FreeQ[Goldstones,RE[vlist[[i,1,1]]] /. {gt1->iter1,ft1->fiter1}]==True && FreeQ[Goldstones,RE[vlist[[i,1,2]]] /. {gt2->iter2,ft2->fiter2}]==True && FreeQ[Goldstones,RE[vlist[[i,1,3]]] /. {gt3->iter3,ft3->fiter3}]==True),
WriteVertex=True;,
WriteVertex=False;
];,
WriteVertex=True;
];

 If[WriteVertex==True,
 If[type===FFV || type===FFS,
If[(valueA /. {gt1->iter1,gt2->iter2, gt3->iter3,ft1->fiter1,ft2->fiter2, ft3->fiter3} /.subAlways /. subDependences)===0 && (valueB /. {gt1->iter1,gt2->iter2, gt3->iter3,ft1->fiter1,ft2->fiter2, ft3->fiter3}/.subAlways/. subDependences)===0,
WriteVertex=False;
];,
If[(value /. {gt1->iter1,gt2->iter2, gt3->iter3,ft1->fiter1,ft2->fiter2, ft3->fiter3}/.subAlways/. subDependences)===0,
WriteVertex=False;
];
]; 
]; 

If[WriteVertex,

If[type===FFV || type===FFS,
facNameA=CalcHepFactor[i, {iter1,iter2,iter3,fiter1,fiter2,fiter3},FFS];
facNameB=CalcHepFactor[i, {iter1,iter2,iter3,fiter1,fiter2,fiter3},FFS];
If[CPViolation==True,
CHForm[valueImA, "I"<>facNameA];
CHForm[valueImB, "I"<>facNameB];
CHForm[valueReA, "R"<>facNameA];
CHForm[valueReB, "R"<>facNameB];, 
CHForm[valueCurrentA, facNameA];
CHForm[valueCurrentB, facNameB];	
];,
facName=CalcHepFactor[i, {iter1,iter2,iter3,fiter1,fiter2,fiter3},type];
If[CPViolation==True,
CHForm[valueIm, "I"<>facName];
CHForm[valueRe, "R"<>facName];,
CHForm[valueSplitted, facName]; 
];
];

WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CHepName[particle1,iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle2,iter2,fiter2],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle3,iter3,fiter3],lP]<>"|        |"];

If[type===FFS || type===FFV,
ListVerticesExpandedCH=Join[ListVerticesExpandedCH,{{Sort[{{particle1,iter1,fiter1},{particle2,iter2,fiter2},{particle3,iter3,fiter3}}],facNameA}}];
If[type===FFV,fac="G(m3)*";,fac="";];
WriteString[lagrangeFile,InsString[Imc<>"/2",lF]];
If[CPViolation==True,
WriteString[lagrangeFile,"|"<>fac<>"(1-G5)*(R"<>facNameA<>"+i*I"<>facNameA<>")+"<>fac<>"(1+G5)*(R"<>facNameB<>"+i*I"<>facNameB<>") \n"];,
WriteString[lagrangeFile,"|"<>fac<>"(1-G5)*"<>facNameA<>"+"<>fac<>"(1+G5)*"<>facNameB<>" \n"];
];,

Switch[type,
SSS, lorentzfactor = "1";,
SSV, lorentzfactor = "m3.p1-m3.p2";,
SVV, lorentzfactor = "m2.m3";,
GGV, lorentzfactor = "m3.p2";,
GGS, lorentzfactor = "1";,
SSA, lorentzfactor = "Maux";
		ImcT=Imc;
		If[particle3===aWB && iter3 == 2,
			 If[Imc==="1", Imc="i";,Imc="-1";]; 
			(* If[Imc==="i", Imc="-1";,Imc="-i";]; *)
			];,
VVV, lorentzfactor = MakeThreeVBLF[SA`VertexList[VVV][[i,2,2]] ];
	  If[StringTake[lorentzfactor,{1}]=="-",
	(* lorentzfactor=StringReplace[ToString[InputForm[-Expand[lor]]]," "->""]; *)
	lorentzfactor = MakeThreeVBLF[-SA`VertexList[VVV][[i,2,2]] ]; 
	Imc="-"<>Imc;
	];
];

ListVerticesExpandedCH=Join[ListVerticesExpandedCH,{{Sort[{{particle1,iter1,fiter1},{particle2,iter2,fiter2},{particle3,iter3,fiter3}}],facName}}];
If[CPViolation==True,
WriteString[lagrangeFile,InsString[Imc,lF]];
If[type===SSV,
WriteString[lagrangeFile,"| m3.p1*(R"<>facName<>"+i*I"<>facName<>")-m3.p2*(R"<>facName<>"+i*I"<>facName<>") \n"];,
WriteString[lagrangeFile,"| "<>lorentzfactor<>"*(R"<>facName<>"+i*I"<>facName<>") \n"];
];,
WriteString[lagrangeFile,InsString[Imc<>"*"<>facName,lF]];
WriteString[lagrangeFile,"| "<> lorentzfactor <>" \n"];
];
If[type===SSA, Imc=ImcT;];
 ];
];
fiter3++;];
iter3++;];
fiter2++;];
iter2++;];
fiter1++;];
iter1++;];
];
];
i++;];
progressCoupCH[type]="All done in "<>ToString[TimeUsed[]-startedtime]<>"s";
];

MakeThreeVBLF[LS_]:=Block[{p1,p2,p3,m1,m2,m3,lor},
Clear[p1,p2,p3,m1,m2,m3];
lor =LS/. {lt1->m1,lt2->m2,lt3->m3} /. {g[a_,b_]->a.b, Mom[conj[x_],y_]->Mom[x,y]}/. Mom[x_[{y_}],z_] -> Mom[y,z] /. Mom[x_[{y_,w_}],z_] -> Mom[w,z] /. {Mom[m1,x_]->Impuls1.x,Mom[m2,x_]->Impuls2.x,Mom[m3,x_]->Impuls3.x};
Return[StringReplace[StringReplace[ToString[InputForm[Expand[lor]]]," "->""],{"Impuls"->"p"}]];
];

SplitValue[list_]:=Block[{rest,len,maxLen,temp,temp2},
If[Head[list]=!=Plus,Return[{ToString[CForm[list]]}];];
maxLen=4;
len=Length[list];
rest=Mod[len,maxLen];
temp=Partition[List@@list,maxLen];
temp=Map[ToString,Map[CForm,Map[Simplify,Apply[Plus,temp,1]]]];
If[rest=!=0,
temp2=Take[list,{len+1-rest,len}];
temp2=ToString[CForm[Simplify[temp2]]];
temp=Join[temp,{temp2}];
];
temp=Map[DeleteSpace,temp];
Return[temp];
];


DeleteSpace[string_]:=StringReplace[string,{" " ->""}];



(* ::Input::Initialization:: *)
WriteCHepParticles[list_, CompHep_, WriteOut_,SLHA_,CalcMM_]:=Block[{i,j,k,name,nameC},
For[i=1,i<=Length[list],
For[j=1,j<=getGen[list[[i,1]]],(* For[j=1,j\[LessEqual]getGenOne[list[[i,1]]], *)
For[k=1,k<=getFla[list[[i,1]]],
name=CalcHepName[list[[i,1]],j,k];
nameC=CalcHepName[AntiField[list[[i,1]]],j,k];
CHepName[list[[i,1]],j,k]=name;
CHepName[AntiField[list[[i,1]]],j,k]=nameC;


If[FreeQ[GoldstoneGhost,list[[i,1]][{j}]]==True && FreeQ[GoldstoneGhost,list[[i,1]][{j,k}]]==True && WriteOut==True,
WriteString[particlesFile,InsString[CalcHepFullName[list[[i,1]],j,k],lN]<>"|"];
WriteString[particlesFile,InsString[name,lP] <> "|"];
WriteString[particlesFile,InsString[nameC,lP] <> "|" ];

If[CompHep==False,WriteString[particlesFile,InsString[CalcHepNumber[list[[i,1]],j,k],lNr] <> "|"];];
Switch[getType[list[[i,1]]],
S, WriteString[particlesFile,"0     |"];
If[FreeQ[massless,list[[i,1]]]==True,
	CalcHepParticlesM0 = Join[CalcHepParticlesM0,{{CalcHepMass[list[[i,1]],j,k],CalcHepNumber[list[[i,1]],j,k],CalcHepWidth[list[[i,1]],j,k],name}}];
];,
F, WriteString[particlesFile,"1     |"];
If[FreeQ[massless,list[[i,1]]]==True,
	CalcHepParticlesM0 = Join[CalcHepParticlesM0,{{CalcHepMass[list[[i,1]],j,k],CalcHepNumber[list[[i,1]],j,k],CalcHepWidth[list[[i,1]],j,k],name}}];
];,
V, WriteString[particlesFile,"2     |"];
If[FreeQ[massless,list[[i,1]]]==True,
	CalcHepParticlesM0 = Join[CalcHepParticlesM0,{{CalcHepMass[list[[i,1]],j,k],CalcHepNumber[list[[i,1]],j,k],CalcHepWidth[list[[i,1]],j,k],name}}];
];,
A, WriteString[particlesFile,"0     |"];
];




If[getType[list[[i,1]]]=!=A,

WriteMassTerm=True;
If[FreeQ[massless,list[[i,1]]]==True,
If[getType[list[[i,1]]]===F,
 If[ (list[[i,1]]/.diracSub[EigenstateName])[[2]]=!=0,
WriteMassTerm=True;,
WriteMassTerm=False;
];,
WriteMassTerm=True;
];,
WriteMassTerm=False;
];



If[WriteMassTerm,
WriteString[particlesFile,InsString[CalcHepMass[list[[i,1]],j,k],lM]<>"|"];
If[getWidthNumerical[list[[i,1]],j,k]===1 ||  getWidthNumerical[list[[i,1]],j,k]===External,
WriteString[particlesFile,InsString["!"<>CalcHepWidth[list[[i,1]],j,k],lW] <> "|"];,
WriteString[particlesFile,InsString[CalcHepWidth[list[[i,1]],j,k],lW] <> "|"];
WriteString[varsFile, InsString[CalcHepWidth[list[[i,1]],j,k],lVN] <>"|" <> InsString[ToString[FortranForm[getWidthNumerical[list[[i,1]],j,k]]],lVV]<>"| width \n"];
];

MassParameterCHep=Join[MassParameterCHep,{ToExpression[CalcHepMass[list[[i,1]],j,k]],ToExpression[CalcHepWidth[list[[i,1]],j,k]]}];

If[SLHA==False,
If[FreeQ[parDep,Mass[list[[i,1]]]],
SetNaNtoZero=False;
If[getFla[list[[i,1]]]>1,
numVal = NumericalValue[MassGiven[list[[i,1]][j,k]]];
If[NumberQ[numVal]==False,numVal =NumericalValue[MassRead[list[[i,1]][j,k]]]];,
numVal = NumericalValue[MassGiven[list[[i,1]][j]]];
If[NumberQ[numVal]==False,numVal =NumericalValue[MassRead[list[[i,1]][j]]]];
];
If[NumberQ[numVal]==False,numVal =NumericalValue[Mass[list[[i,1]]] /.massList /. generation->j /. Delta[a__]->1]];
If[NumberQ[numVal]===False,numVal =0; NoNumVal=True;, NoNumVal=False;];
If[CalcMM==False || FreeQ[CalcHepMassMatrices,list[[i,1]]]==True || NoNumVal==False,
CH`NotWriteMassMatrices=Join[CH`NotWriteMassMatrices,{list[[i,1]]}];
WriteString[varsFile, InsString[CalcHepMass[list[[i,1]],j,k],lVN]];
WriteString[varsFile, "|"];
WriteString[varsFile, InsString[ToString[CForm[Re[numVal]]],lVV]];
WriteString[varsFile, "|  \n"]; 
];
SetNaNtoZero=True;
];
];,
WriteString[particlesFile,InsString["0",lM]<>"|"];
WriteString[particlesFile,InsString["0",lW] <> "|"];
];

If[getType[list[[i,1]]]===V,
replaceMass =Join[replaceMass,{Mass[list[[i,1]]]->ToExpression[CalcHepMass[list[[i,1]],0]]}];
];,

WriteString[particlesFile," Maux |"];
WriteString[particlesFile," 0    |"];
];

(*
If[FreeQ[getIndizes[list[[i,1]]],color]\[Equal]True,
If[FreeQ[ColoredGaugeParticles,list[[i,1]]]\[Equal]True,
WriteString[particlesFile,"1    |"];,
WriteString[particlesFile,"8    |"]
];,
WriteString[particlesFile,"3    |"];
];
*)

indWI=getIndizesWI[list[[i,1]]];
If[FreeQ[indWI,color]==True,
WriteString[particlesFile,"1    |"];,
WriteString[particlesFile,ToString[indWI[[Position[indWI,color][[1,1]],2]]]<>"    |"]
];


If[NumericQ[(getElectricCharge[list[[i,1]]]//. Hold->ReleaseHold)]=!=False,
If[Head[(3 getElectricCharge[list[[i,1]]]//. Hold ->ReleaseHold)]=!=Integer,
CalcHep::ChargeProblem="There is a particle (``) whose charge times 3 is not an integer. Be prepared that CalcHep might break. ";
Message [CalcHep::ChargeProblem,list[[i,1]]]; 
];
If[(getElectricCharge[list[[i,1]]]//. Hold ->ReleaseHold)<0,
WriteString[particlesFile,ToString[InputForm[3*(getElectricCharge[list[[i,1]]]//. Hold ->ReleaseHold)]]];,
WriteString[particlesFile,ToString[InputForm[3*(getElectricCharge[list[[i,1]]]//. Hold ->ReleaseHold)]]<>" "];
];,
WriteString[particlesFile,"  "];
];

Switch[getType[list[[i,1]]],
V,WriteString[particlesFile,"G|"];,
A,WriteString[particlesFile,"*|"];,
F, If[(list[[i,1]]/.diracSub[EigenstateName])[[1]]===0,
	WriteString[particlesFile,"R|"];,
	If[(list[[i,1]]/.diracSub[EigenstateName])[[2]]===0,
	WriteString[particlesFile,"L|"];,
	WriteString[particlesFile," |"];
	];
	];,	
 _,WriteString[particlesFile," |"];
];


If[getType[list[[i,1]]]=!=A,
WriteString[particlesFile,InsString[CalcHepTeXName[list[[i,1]],j,k],lL]];
WriteString[particlesFile,"   |"];
WriteString[particlesFile,InsString[CalcHepTeXName[AntiField[list[[i,1]]],j,k],lL]];
WriteString[particlesFile,"\n"];,
WriteString[particlesFile,InsString["",lL]];
WriteString[particlesFile,"   |"];
WriteString[particlesFile,InsString["",lL]];
WriteString[particlesFile,"\n"];
];


];
k++;];
j++;];
i++;];

];


WriteVerticesCHep4[vlist_,CPViolation_,FeynmanGauge_,type_, NoSplitWith_,NoSplitOnly_,TestAux_]:=Block[{i,j,iter1,iter2,iter3,iter4,gf1,gf2,gf3,gf4,fiter1,fiter2,fiter3,fiter4,particle1,particle2,particle3,particle4, entry,WriteCompleteVertex,startedtime},

startedtime=TimeUsed[];
Print["   ... Generic class: ",StyleForm[type,"Section",FontSize->10],". Expanding and writing: ",Dynamic[progressNrCH[type]] ,"/",Length[vlist]". (",Dynamic[progressCoupCH[type]],")"];

For[i=1,i<=Length[vlist],
progressNrCH[type]=i;
progressCoupCH[type]=vlist[[i,1]];

If[D[D[vlist[[i,2,1]],strongCoupling],strongCoupling]===0,
cfsupported=CheckCHsupportedColor[vlist[[i,1]]];,
cfsupported=True;
];

If[cfsupported==True,
If[TestAux==True,
If[Length[NoSplitOnly]>0,
WriteCompleteVertex=True;
For[j=1,j<=4,
If[FreeQ[NoSplitOnly,getBlank[vlist[[i,1,j]]]]==True,
WriteCompleteVertex=False;
];
j++;];,
WriteCompleteVertex=False;
For[j=1,j<=Length[NoSplitWith],
If[FreeQ[vlist[[i,1]],NoSplitWith[[j]]]==False,
WriteCompleteVertex=True;
];
j++;];
];,
WriteCompleteVertex=True;
];



If[WriteCompleteVertex==True,

If[D[D[vlist[[i,2,1]],strongCoupling],strongCoupling]===0,
subVertexGen={"gt1"-> Hold[ToString[iter1]],"gt2"-> Hold[ToString[iter2]],"gt3"-> Hold[ToString[iter3]],"gt4"-> Hold[ToString[iter4]],"ft1"-> Hold[ToString[fiter1]],"ft2"-> Hold[ToString[fiter2]],"ft3"-> Hold[ToString[fiter3]],"ft4"-> Hold[ToString[fiter4]]};
value=CalcHepVertex[vlist[[i,2,1]]];

If[FreeQ[value,Complex]==False, 
value=value/I;
Imc="1";,
Imc="i";
];

Clear[iter1,iter2,iter3,iter4,fiter1,fiter2,fiter3,fiter4];
PlusIndices=Intersection[Cases[Expand[value],x:(a_Symbol+b_Integer),10]];


If[Length[PlusIndices]>0,
For[j=1,j<=Length[PlusIndices],
var=ToExpression["gtP"<>ToString[j]];
valueReplaced = value /. {PlusIndices[[j]]->var};
subVertexGen = Join[subVertexGen,{ToString[var]->(Hold[ToString[Evaluate[entry]]] /. entry ->PlusIndices[[j]] /. {gt1->iter1,gt2->iter2,gt3->iter3,gt4->iter4,ft1->fiter1,ft2->fiter2,ft3->fiter3,ft4->fiter4})}];
j++;];,
valueReplaced=value;
];

If[CPViolation==True,
valueCurrent = Expand[valueReplaced/. subComplexParameters];
valueIm = SplitValue[Im[valueCurrent] /. {Im[x_]->0, Re[x_]->x}];
valueRe =SplitValue[ Re[valueCurrent] /. {Im[x_]->0, Re[x_]->x}];,
valueCurrent = Expand[valueReplaced/. conj[x_]->x];
valueSplitted =SplitValue[valueCurrent];
]; 

gf1=getGen[vlist[[i,1,1]]];
gf2=getGen[vlist[[i,1,2]]];
gf3=getGen[vlist[[i,1,3]]];
gf4=getGen[vlist[[i,1,4]]];


ff1=getFla[vlist[[i,1,1]]];
ff2=getFla[vlist[[i,1,2]]];
ff3=getFla[vlist[[i,1,3]]];
ff4=getFla[vlist[[i,1,4]]];

particle1=vlist[[i,1,1]] /. A_[{a__}]->A;
particle2=vlist[[i,1,2]] /. A_[{a__}]->A;
particle3=vlist[[i,1,3]] /. A_[{a__}]->A;
particle4=vlist[[i,1,4]] /. A_[{a__}]->A;


If[(vlist[[i,1,2]] /. {gt2->gt1,ft2->ft1} )===vlist[[i,1,1]],
start2=Hold[iter1];
fstart2=Hold[fiter1];,
start2=1;
fstart2=1;
];

If[(vlist[[i,1,3]] /. {gt3->gt2,ft3->ft2} )===vlist[[i,1,2]],
start3=Hold[iter2];
fstart3=Hold[fiter2];,
If[(vlist[[i,1,3]] /. {gt3->gt1,ft3->ft1} )===vlist[[i,1,1]],
start3=Hold[iter1];
fstart3=Hold[fiter1];,
start3=1;
fstart3=1;
];
];


If[(vlist[[i,1,4]] /. {gt4->gt3,ft4->ft3} )===vlist[[i,1,3]],
start4=Hold[iter3];
fstart4=Hold[fiter3];,
If[(vlist[[i,1,4]] /. {gt4->gt2,ft4->ft2} )===vlist[[i,1,2]],
start4=Hold[iter2];
fstart4=Hold[fiter2];,
If[(vlist[[i,1,4]] /. {gt4->gt1,ft4->ft1} )===vlist[[i,1,1]],
start4=Hold[iter1];
fstart4=Hold[fiter1];,
start4=1;
fstart4=1;
];
];
];



If[FreeQ[vlist[[i]],Delta[gt1,gt2]]==False, start2=Hold[iter1]; gf2=Hold[iter1];];
If[FreeQ[vlist[[i]],Delta[gt1,gt3]]==False, start3=Hold[iter1]; gf3=Hold[iter1];];
If[FreeQ[vlist[[i]],Delta[gt2,gt3]]==False, start3=Hold[iter2]; gf3=Hold[iter2];];
If[FreeQ[vlist[[i]],Delta[gt1,gt4]]==False, start4=Hold[iter1]; gf4=Hold[iter1];];
If[FreeQ[vlist[[i]],Delta[gt3,gt4]]==False, start4=Hold[iter3]; gf4=Hold[iter3];];
If[FreeQ[vlist[[i]],Delta[gt2,gt4]]==False, start4=Hold[iter2]; gf4=Hold[iter2];];

If[FreeQ[vlist[[i]],Delta[ft1,ft2]]==False, start2=Hold[fiter1]; gf2=Hold[fiter1];];
If[FreeQ[vlist[[i]],Delta[ft1,ft3]]==False, start3=Hold[fiter1]; gf3=Hold[fiter1];];
If[FreeQ[vlist[[i]],Delta[ft2,ft3]]==False, start3=Hold[fiter2]; gf3=Hold[fiter2];];
If[FreeQ[vlist[[i]],Delta[ft1,ft4]]==False, start4=Hold[fiter1]; gf4=Hold[fiter1];];
If[FreeQ[vlist[[i]],Delta[ft3,ft4]]==False, start4=Hold[fiter3]; gf4=Hold[fiter3];];
If[FreeQ[vlist[[i]],Delta[ft2,ft4]]==False, start4=Hold[fiter2]; gf4=Hold[fiter2];];




For[iter1=1,iter1<=gf1,
For[fiter1=1,fiter1<=ff1,
For[iter2=ReleaseHold[start2],iter2<=ReleaseHold[gf2],
For[fiter2=ReleaseHold[fstart2],fiter2<=ReleaseHold[ff2],
For[iter3=ReleaseHold[start3],iter3<=ReleaseHold[gf3],
For[fiter3=ReleaseHold[fstart3],fiter3<=ReleaseHold[ff3],
For[iter4=ReleaseHold[start4],iter4<=ReleaseHold[gf4],
For[fiter4=ReleaseHold[fstart4],fiter4<=ReleaseHold[ff4],

If[FeynmanGauge==False,
If[(FreeQ[Goldstones,RE[vlist[[i,1,1]]] /. {gt1->iter1,ft1->fiter1}]==True && FreeQ[Goldstones,RE[vlist[[i,1,3]]] /. {ft3->fiter3,gt3->iter3}]==True),
WriteVertex=True;,
WriteVertex=False;
];,
WriteVertex=True;
];

If[WriteVertex==True,
If[(value /. {gt1->iter1,gt2->iter2, gt3->iter3, gt4->iter4,ft1->fiter1,ft2->fiter2, ft3->fiter3, ft4->fiter4}/.subAlways/. subDependences)===0,
WriteVertex=False;
];
];


If[WriteVertex,

facName=CalcHepFactor[i, {iter1,iter2,iter3,iter4,fiter1,fiter2,fiter3,fiter4},type];


If[CPViolation==True,
CHForm[valueIm, "I"<>facName];
CHForm[valueRe, "R"<>facName];,
CHForm[valueSplitted, facName];
];


WriteString[lagrangeFile," "];
WriteString[lagrangeFile,InsString[CHepName[particle1,iter1,fiter1],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle2,iter2,fiter2],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle3,iter3,fiter3],lP]<>"|"];
WriteString[lagrangeFile,InsString[CHepName[particle4,iter4,fiter4],lP]<>"|"];
If[CPViolation==True,
WriteString[lagrangeFile,InsString[Imc,lF]];
Switch[type,
SSVV,
	WriteString[lagrangeFile,"|m3.m4*(R"<>facName<>"+i*I"<>facName<>") \n"];,
SSSS,
	WriteString[lagrangeFile,"|R"<>facName<>"+i*I"<>facName<>" \n"];
];,
WriteString[lagrangeFile,InsString[Imc<>"*"<>facName,lF]];
Switch[type,
SSVV,
WriteString[lagrangeFile,"|m3.m4 \n"];,
SSSS,
WriteString[lagrangeFile,"| 1 \n"];
];
];


];
fiter4++;];
iter4++;];
fiter3++;];
iter3++;];
fiter2++;];
iter2++;];
fiter1++;];
iter1++;];
];
];
];
i++;];
progressCoupCH[type]="All done in "<>ToString[TimeUsed[]-startedtime]<>"s";
];



(* ::Input::Initialization:: *)

SortDependendParameters[RunningCoupling_]:=Block[{i,j,k,temp,temp2,add,tempNew,subMassTemp,subMassTempRe,iter=1},
Print["Sort parameters"];

temp=parDep; parDepExpanded={};

subMassTemp=Select[temp,(Head[#]==Mass)&];
subMassTempRe = Table[(ToExpression["M"<>ToString[subMassTemp[[i,1]]]])->subMassTemp[[i]],{i,1,Length[subMassTemp]}];
subMassTemp = Table[subMassTemp[[i]]->(ToExpression["M"<>ToString[subMassTemp[[i,1]]]]),{i,1,Length[subMassTemp]}];

temp = temp /. subMassTemp;

 While[temp=!={} && iter < 1000,
tempNew={};
For[i=1,i<=Length[temp],
par=Cases[{temp[[i]]} /. subAlways/. subNumDependences /. subMassTemp/. Mass[a__]:>Random[] /. A_[b__Pattern]->A,x_Symbol,99];
remaining=Join[tempNew,Table[temp[[k]]/. Mass[a__]->Random[],{k,i+1,Length[temp]}]];
add=True;
For[j=1,j<=Length[par],
If[FreeQ[DeleteCases[remaining,x_Pattern,5],par[[j]]]==False,
add=False;
];
j++;];
If[add==False,
tempNew=Join[tempNew,{temp[[i]]}];,
parDepExpanded=Join[parDepExpanded,{temp[[i]]}];
];
i++;];
temp=tempNew;
iter++;
 ]; 

If[iter>= 1000,
SortParameters::Error="There has been a proble sorting the dependent parameters. Please check the array \"parDepExpanded\" and your input for the definitions if it may not possible to resolve the dependences.";
Message [SortParameters::Error]; 
];

temp = parDepExpanded /. subMassTempRe;
parDepExpanded={};

For[i=1,i<=Length[temp],
If[FreeQ[temp[[i]],Pattern],
parDepExpanded=Join[parDepExpanded,{temp[[i]]}];,
parDepExpanded=Join[parDepExpanded,{Head[temp[[i]]]}];
];
i++;];

temp = parDepExpanded;
parDepExpanded={};
parDepNotExpanded = temp;

For[i=1,i<=Length[temp],
dim=getDimParameters[temp[[i]]];
Switch[Length[dim],
0,
 parDepExpanded=Join[parDepExpanded,{temp[[i]]}];,
1,
If[dim==={1},
parDepExpanded=Join[parDepExpanded,{temp[[i]]}];,
parDepExpanded=Join[parDepExpanded,Flatten[Table[temp[[i]][j1],{j1,1,dim[[1]]}]]];
];,
2,
parDepExpanded=Join[parDepExpanded,Flatten[Table[temp[[i]][j1,j2],{j1,1,dim[[1]]},{j2,1,dim[[2]]}]]];,
3,
parDepExpanded=Join[parDepExpanded,Flatten[Table[temp[[i]][j1,j2],{j1,1,dim[[1]]},{j2,1,dim[[2]]},{j3,1,dim[[2]]}]]];
];
i++;];

parDepExpandedList=Table[{parDepExpanded[[i]],parDepExpanded[[i]]  /. subAlways/. subNumDependences},{i,1,Length[parDepExpanded]}];

If[RunningCoupling==True,
parDepExpandedList= parDepExpandedList/.{Mass[BottomQuark,3]-> MbEff[Q]*one[QCDok],Mass[TopQuark,3]-> MtEff[Q]*one[QCDok],Mass[TopQuark,2]-> McEff[Q]*one[QCDok]};
];

parDepExpandedList = parDepExpandedList /. subMassTempRe;

parDepNeeded={};

For[i=1,i<=Length[parDep],
par=Cases[{parDep[[i]]}/. subAlways/. subNumDependences /. Mass[a__]:>Random[] /. A_[b__Pattern]->A,x_Symbol,5];
If[FreeQ[{parDep[[i]]}/. subAlways/. subNumDependences ,sum],
For[j=1,j<=Length[par],
If[FreeQ[parDep,par[[j]]] && FreeQ[parNum,par[[j]]],parDepNeeded=Join[parDepNeeded,{par[[j]]}];];
j++;];
];
i++;];

parDepNeeded = Intersection[parDepNeeded] /. subMassTempRe;

];



WriteCalcOmegaMO[TwoDM_]:=Block[{MOfile},
Print["Write main file for MicrOmegas"];
MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_MOv4.X.cpp"]];
If[TwoDM===True,
AppendSourceCode["CalcOmega2.cpp",MOfile];,
AppendSourceCode["CalcOmega.cpp",MOfile];
];
Close[MOfile];

MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_MOv5.cpp"]];
If[TwoDM===True,
AppendSourceCode["CalcOmega2.cpp",MOfile];,
AppendSourceCode["CalcOmega5.cpp",MOfile];
];
Close[MOfile];

MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_before_v4.3.cpp"]];
If[TwoDM===True,
AppendSourceCode["CalcOmega2_before_4.3.cpp",MOfile];,
AppendSourceCode["CalcOmega_before_4.3.cpp",MOfile];
];
Close[MOfile];


If[TwoDM=!=True,
MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_with_DDetection_MOv3.cpp"]];
AppendSourceCode["CalcOmega_with_DDetection_MOv3.cpp",MOfile];
Close[MOfile];

MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_with_DDetection_MOv4.cpp"]];
AppendSourceCode["CalcOmega_with_DDetection_MOv4.cpp",MOfile];
Close[MOfile];

MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_with_DDetection_MOv4.2.cpp"]];
AppendSourceCode["CalcOmega_with_DDetection_MOv4.2.cpp",MOfile];
Close[MOfile];

MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_with_DDetection_MOv4.3.cpp"]];
AppendSourceCode["CalcOmega_with_DDetection_MOv4.3.cpp",MOfile];
Close[MOfile];

MOfile= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"CalcOmega_with_DDetection_MOv5.cpp"]];
AppendSourceCode["CalcOmega_with_DDetection_MOv5.cpp",MOfile];
Close[MOfile];
];
];

GenerateMicrOmegasLesHouches[Eigenstates_,CPViolation_]:=Block[{i,j,k},

Print["Write LesHouches.c"];

LH= OpenWrite[ToFileName[$sarahCurrentCalcHepDir,"lesHouches.c"]];

WriteString[LH,"#include\"pmodel.h\"\n"];
WriteString[LH,"#include<math.h> \n"];
WriteString[LH,"#include\"../../sources/micromegas.h\"\n"];
WriteString[LH,"#include\"../../CalcHEP_src/c_source/SLHAplus/include/SLHAplus.h\"\n"];
WriteString[LH,"#include<ctype.h>\n"];
WriteString[LH,"#include<stdio.h> \n"];
WriteString[LH,"#static int delFilesKey=1;\n \n"];

WriteString[LH,"int getdelfilesstat_(void) {return delFilesKey;}\n"];
WriteString[LH,"void delFiles(int x) {delFilesKey=x;}\n"];
WriteString[LH,"void delfiles_(int*x){delFilesKey=*x;}\n \n \n"];


WriteString[LH,"static void FillVal(int mode) \n"];

WriteString[LH,"{char name[10]; \n"];
WriteString[LH,"int i,j,k; \n"];

WriteString[LH,"char* massName["<>ToString[Length[CalcHepParticlesM0]]<>"] = { \n"];
For[i=1,i<=Length[CalcHepParticlesM0],
WriteString[LH,"\""<>CalcHepParticlesM0[[i,1]]<>"\""];
If[i== Length[CalcHepParticlesM0],
WriteString[LH,"}; \n \n"];,
WriteString[LH,","];
If[Mod[i,10]==0,
WriteString[LH,"\n"];
];
];
i++;];

WriteString[LH,"int massId["<>ToString[Length[CalcHepParticlesM0]]<>"] = { \n"];
For[i=1,i<=Length[CalcHepParticlesM0],
WriteString[LH,ToString[CalcHepParticlesM0[[i,2]]]];
If[i== Length[CalcHepParticlesM0],
WriteString[LH,"}; \n \n"];,
WriteString[LH,","];
If[Mod[i,10]==0,
WriteString[LH,"\n"];
];
];
i++;];


WriteString[LH,"for(i=0;i<"<>ToString[Length[CalcHepParticlesM0]]<>";i++) assignValW(massName[i],slhaVal(\"MASS\",0.,1,massId[i])); \n \n"];

WriteString[LH,"double Q; \n \n"];

For[i=1,i<=Length[parameters],
If[(FreeQ[UsedDependences,parameters[[i,1]]]==True)&& (LHBlockName[parameters[[i,1]]]=!="NONE") &&(FreeQ[VertexList3,parameters[[i,1]]]==False || FreeQ[VertexList4,parameters[[i,1]]] ==False || FreeQ[subAlways,parameters[[i,1]]] ==False),

temp=StringReplace[ToString[CForm[parameters[[i,1]]]],{")"->"","("->""}];
tempR=StringReplace[ToString[CForm[ToExpression["Im"<>ToString[parameters[[i,1]]]]]],{")"->"","("->""}];
tempI=StringReplace[ToString[CForm[ToExpression["Re"<>ToString[parameters[[i,1]]]]]],{")"->"","("->""}];

Switch[Length[parameters[[i,2]]],
0,
If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
WriteString[LH,"assignVal(\""<>temp<>"\",slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>LHPos[parameters[[i,1]]]<>")); \n"];,
WriteString[LH,"assignVal(\"Re"<>tempR<>"\",slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>LHPos[parameters[[i,1]]]<>")); \n"];
WriteString[LH,"assignVal(\"Im"<>tempI<>"\",slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,"<>LHPos[parameters[[i,1]]]<>")); \n"];
];,


1,
If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
WriteString[LH,"for(i=1;i\[LessEqual]"<>ToString[parameters[[i,3,1]]]<>";i++) \n"];
WriteString[LH,"{sprintf(name,\""<>temp<>"%d%d\",i,j); assignValW(name,slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,i)); \n"];
WriteString[LH,"} \n"];,

WriteString[LH,"for(i=1;i\[LessEqual]"<>ToString[parameters[[i,3,1]]]<>";i++)  \n"];
WriteString[LH,"{sprintf(name,\""<>tempR<>"%d%d\",i,j); assignValW(name,slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,i)); \n"];
WriteString[LH,"{sprintf(name,\""<>tempI<>"%d%d\",i,j); assignValW(name,slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,1,i)); \n"];
WriteString[LH,"} \n"];
];,

2,
If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
WriteString[LH,"for(i=1;i\[LessEqual]"<>ToString[parameters[[i,3,1]]]<>";i++) for(j=1;j\[LessEqual]"<>ToString[parameters[[i,3,2]]]<>";j++) \n"];
WriteString[LH,"{sprintf(name,\""<>temp<>"%d%d\",i,j); assignValW(name,slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,2,i,j)); \n"];
WriteString[LH,"} \n"];,

WriteString[LH,"for(i=1;i\[LessEqual]"<>ToString[parameters[[i,3,1]]]<>";i++) for(j=1;j\[LessEqual]"<>ToString[parameters[[i,3,2]]]<>";j++) \n"];
WriteString[LH,"{sprintf(name,\""<>tempR<>"%d%d\",i,j); assignValW(name,slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,2,i,j)); \n"];
WriteString[LH,"{sprintf(name,\""<>tempI<>"%d%d\",i,j); assignValW(name,slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,2,i,j)); \n"];
WriteString[LH,"} \n"];
];,

3,
If[MemberQ[realVar,parameters[[i,1]]]==True || CPViolation==False,
WriteString[LH,"for(i=1;i\[LessEqual]"<>ToString[parameters[[i,3,1]]]<>";i++) for(j=1;j\[LessEqual]"<>ToString[parameters[[i,3,2]]]<>";j++) for(k=1;k\[LessEqual]"<>ToString[parameters[[i,3,3]]]<>";k++) \n"];
WriteString[LH,"{sprintf(name,\""<>temp<>"%d%d\",i,j); assignValW(name,slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,3,i,j,k)); \n"];
WriteString[LH,"} \n"];,

WriteString[LH,"for(i=1;i\[LessEqual]"<>ToString[parameters[[i,3,1]]]<>";i++) for(j=1;j\[LessEqual]"<>ToString[parameters[[i,3,2]]]<>";j++) for(k=1;k\[LessEqual]"<>ToString[parameters[[i,3,3]]]<>";k++) \n"];
WriteString[LH,"{sprintf(name,\""<>tempR<>"%d%d\",i,j); assignValW(name,slhaVal(\""<>LHBlockName[parameters[[i,1]]]<>"\",Q,3,i,j,k)); \n"];
WriteString[LH,"{sprintf(name,\""<>tempI<>"%d%d\",i,j); assignValW(name,slhaVal(\"IM"<>LHBlockName[parameters[[i,1]]]<>"\",Q,3,i,j,k)); \n"];
WriteString[LH,"} \n"];
];
];
];
i++;];




WriteString[LH,"double lam_wolf=slhaVal(\"VCKMIN\",Q,1,1); \n"];
WriteString[LH,"double A_wolf=slhaVal(\"VCKMIN\",Q,1,2);\n"];
WriteString[LH,"double rho_wolf=slhaVal(\"VCKMIN\",Q,1,3);\n"];
WriteString[LH,"double eta_wolf=slhaVal(\"VCKMIN\",Q,1,4);\n"];
WriteString[LH,"double s12=lam_wolf;\n"];
WriteString[LH,"double s23=s12*s12*A_wolf;\n"];
WriteString[LH,"double s13=s23*lam_wolf*sqrt(eta_wolf*eta_wolf+rho_wolf*rho_wolf);\n"];
WriteString[LH,"double c12=sqrt(1.0-s12*s12);\n"];
WriteString[LH,"double c23=sqrt(1.0-s23*s23);\n"];
WriteString[LH,"double c13=sqrt(1.0-s13*s13);\n"];
WriteString[LH,"assignValW(\"CKM11\",c12*c13);\n"];
WriteString[LH,"assignValW(\"CKM12\",s12*c13);\n"];
WriteString[LH,"assignValW(\"CKM13\",s13);\n"];
WriteString[LH,"assignValW(\"CKM21\",-s12*c23-c12*s23*s13);\n"];
WriteString[LH,"assignValW(\"CKM22\",c12*c23-s12*s23*s13);\n"];
WriteString[LH,"assignValW(\"CKM23\",s23*c13);\n"];
WriteString[LH,"assignValW(\"CKM31\",s12*s23-c12*c23*s13);\n"];
WriteString[LH,"assignValW(\"CKM32\",-c12*s23-s12*c23*s13);\n"];
WriteString[LH,"assignValW(\"CKM33\",c23*c13);\n"];

WriteString[LH,"} \n \n \n"];


WriteString[LH,"int readLesH(char*fname,int mode) \n"];
WriteString[LH,"{int err; \n"];
WriteString[LH,"err=slhaRead(fname,2); \n"];
WriteString[LH,"if(err) return err; \n"];
WriteString[LH,"FillVal(mode); \n"];
WriteString[LH,"return 0;} \n"];


Close[LH];
];

InitCalcHepMM:=Block[{i,j,temp,res},
CalcHepMassMatrices={};
For[i=1,i<=Length[NameOfStates],
temp = DEFINITION[NameOfStates[[i]]][MatterSector];
If[Head[temp]===List && Length[temp]>0,
For[j=1,j<=Length[temp],
CalcHepMassMatrices=Join[CalcHepMassMatrices,{{temp[[j,2]] /. diracSubBack1[ALL] /. diracSubBack2[ALL],MassMatricesFull[NameOfStates[[i]]][[j]]}}];
j++;];
];
i++;];

];

WriteCalcHepMassMatrices:=Block[{i,j,k,i1,i2,tempEntry,res,iteration,start,ende,dim,name,string},

subVertexGen={"gt1"-> Hold[ToString[iter1]],"gt2"-> Hold[ToString[iter2]],"gt3"-> Hold[ToString[iter3]]};

iteration=1;
For[i=1,i<=Length[CalcHepMassMatrices],
tempEntry=CalcHepMassMatrices[[i]];
dim=Length[tempEntry[[2]]];
If[Length[tempEntry[[1,1]]]==2,
name = tempEntry[[1,1,1]];
string="";
For[i1=1,i1<=dim,
For[i2=1,i2<=dim,
res=SplitValue[CalcHepVertex[tempEntry[[2,i1,i2]]]];
CHForm[res,"X"<>ToString[i]<>ToString[i1]<>ToString[i2]];
string=string<>"X"<>ToString[i]<>ToString[i1]<>ToString[i2];
If[i1<dim || i2<dim,string=string<>","];
i2++;];
i1++;];
WriteString[funcFile,InsString["Mid"<>ToString[i],lFF]<>"|"];
WriteString[funcFile,"rDiagonalA("<>ToString[dim]<>","<>string<>") \n"];
If[FreeQ[CH`NotWriteMassMatrices,name],
For[i1=1,i1<=dim,
WriteString[funcFile,InsString[CalcHepMass[name,i1],lFF]<>"|"];
If[getType[name]===F,
WriteString[funcFile,"MassArray(Mid"<>ToString[i]<>","<>ToString[i1]<>") \n"];,
WriteString[funcFile,"sqrt(MassArray(Mid"<>ToString[i]<>","<>ToString[i1]<>")) \n"];
];
i1++;];
];
For[i1=1,i1<=dim,
For[i2=1,i2<=dim,
WriteString[funcFile,InsString[ToString[CForm[tempEntry[[1,1,2]][i1,i2]]],lFF]<>"|"];
WriteString[funcFile,"MixMatrix(Mid"<>ToString[i]<>","<>ToString[i1]<>","<>ToString[i2]<>") \n"];
WriteString[funcFile,InsString[ToString[CForm[tempEntry[[1,2,2]][i1,i2]]],lFF]<>"|"];
WriteString[funcFile,"MixMatrixU(Mid"<>ToString[i]<>","<>ToString[i1]<>","<>ToString[i2]<>") \n"];
i2++;];
i1++;];,
name = tempEntry[[1,1]] /. diracSubBack1[ALL] /. diracSubBack2[ALL];
string="";
For[i1=1,i1<=dim,
For[i2=i1,i2<=dim,
res=SplitValue[CalcHepVertex[tempEntry[[2,i1,i2]]]];
CHForm[res,"X"<>ToString[i]<>ToString[i1]<>ToString[i2]];
string=string<>"X"<>ToString[i]<>ToString[i1]<>ToString[i2];
If[i1<dim || i2<dim,string=string<>","];
i2++;];
i1++;];
WriteString[funcFile,InsString["Mid"<>ToString[i],lFF]<>"|"];
WriteString[funcFile,"rDiagonal("<>ToString[dim]<>","<>string<>") \n"];
If[FreeQ[CH`NotWriteMassMatrices,name],
For[i1=getGenSPhenoStart[name],i1<=getGen[name],
WriteString[funcFile,InsString[CalcHepMass[name,i1],lFF]<>"|"];
If[getType[name]===F,
WriteString[funcFile,"MassArray(Mid"<>ToString[i]<>","<>ToString[i1]<>") \n"];,
WriteString[funcFile,"sqrt(MassArray(Mid"<>ToString[i]<>","<>ToString[i1]<>")) \n"];
];
i1++;];
];
For[i1=1,i1<=dim,
For[i2=1,i2<=dim,
WriteString[funcFile,InsString[ToString[CForm[tempEntry[[1,2]][i1,i2]]],lFF]<>"|"];
WriteString[funcFile,"MixMatrix(Mid"<>ToString[i]<>","<>ToString[i1]<>","<>ToString[i2]<>") \n"];
i2++;];
i1++;];
];

i++;];
];


CheckCHsupportedColor[fields_]:=Block[{i,j,colourflow,res,temp,colors,pos,type,supported=True,cfsub},
pos=Position[Gauge,color];
If[pos==={},Return[True];];
(* 2020-12-03 MDG THIS IS A BAD ALGORITHM, since SA`Casimir[conj[x],3] = SA`Casimir[x,3] it can't decide, so if we define the fields to be of the form S C_1 C_2 it thinks it's not allowed. Maybe we should trust that the vertex does conserve colour*)
(*
colorflow=(SA`CasimirT[#,pos[[1,1]]]&/@(fields /. A_[{b__}]->A)) /. SA`CasimirT[conj[a_],b_]->-SA`Casimir[a,b]/. SA`CasimirT[bar[a_],b_]->-SA`Casimir[a,b] /.SA`CasimirT->SA`Casimir//. SA`Casimir->null /.null[a__]->0 /. -3->3;
type=getVertexType[fields];

If[Max[colorflow]==0,Return[True];];
Switch[type,
SSSS,
	colorflow=DeleteCases[colorflow,0];
	If[colorflow==={4/3,-4/3} || colorflow==={-4/3,4/3} || colorflow==={3,3}  (*|| colorflow==={-4/3,-4/3,4/3,4/3}|| colorflow==={4/3,4/3,-4/3,-4/3} *),
	Return[True];
	];,
SSVV,
	cfsub1={colorflow[[1]],colorflow[[2]]}; cfsub2={colorflow[[3]],colorflow[[4]]};
	Switch[cfsub2,
	{0,0} | {3,3} | {0,3} | {3,0},
		If[cfsub1==={4/3,-4/3} || cfsub1==={-4/3,4/3},Return[True];];
	];, 
SSV,
	If[colorflow==={4/3,-4/3,0} || colorflow==={-4/3,4/3,0} || colorflow==={4/3,-4/3,3}  || colorflow==={3,3,0} || colorflow==={-4/3,4/3,3} || colorflow==={3,3,3}|| colorflow==={-3,3,3} || colorflow==={3,-3,3} || colorflow==={-3,-3,3}, Return[True];];,
ASS, Return[True];,
SSS,
	cfsub={colorflow[[2]],colorflow[[3]]};
	Switch[colorflow[[1]],
	0,
		If[cfsub==={4/3,-4/3} || cfsub==={-4/3,4/3} || cfsub==={3,3},Return[True];];,
	4/3,
		If[cfsub==={-4/3,0} || cfsub==={0,-4/3} || cfsub==={-4/3,3} || cfsub==={3,-4/3} ,Return[True];];,
	-4/3,
		If[cfsub==={4/3,0} || cfsub==={0,4/3} || cfsub==={4/3,3} || cfsub==={3,4/3} ,Return[True];];,
	3,
	         If[cfsub==={-4/3,4/3} || cfsub==={4/3,-4/3} || cfsub==={3,3} || cfsub==={3,0} || cfsub==={0,3},Return[True];];
	];,
FFS,
	cfsub={colorflow[[1]],colorflow[[2]]};
	Switch[colorflow[[3]],
	0,
		If[cfsub==={4/3,-4/3} || cfsub==={-4/3,4/3} || cfsub==={3,3} || cfsub==={3,-3},Return[True];];,
	4/3,
		If[cfsub==={-4/3,0} || cfsub==={0,-4/3} || cfsub==={-4/3,3} || cfsub==={3,-4/3} ,Return[True];];,
	-4/3,
		If[cfsub==={4/3,0} || cfsub==={0,4/3} || cfsub==={4/3,3} || cfsub==={3,4/3} ,Return[True];];,
	3,
	         If[cfsub==={-4/3,4/3} || cfsub==={4/3,-4/3} || cfsub==={3,3},Return[True];];
	];,
FFV,
	If[colorflow==={4/3,-4/3,0} || colorflow==={-4/3,4/3,0}  || colorflow==={3,3,0}  || colorflow==={-3,3,0} || colorflow==={4/3,-4/3,3} || colorflow==={-4/3,4/3,3} || colorflow==={3,3,3}, Return[True];];,
VVV,
	If[colorflow==={3,3,3}, Return[True];];,
GGV,
	If[colorflow==={3,3,3}, Return[True];];,
VVVV,
	If[colorflow==={3,3,3,3},Return[True];];
];
*)

colourflow=(SA`Casimir[#,pos[[1,1]]]&/@(fields /. A_[{b__}]->A /. bar[x_]->x /. conj[y_]->y)) //. SA`Casimir->null /.null[a__]->0 /. -3->3 /. -4/3->4/3;
type=getVertexType[fields];

If[Max[colourflow]==0,Return[True];];
Switch[type,
SSSS,
	colourflow=DeleteCases[colourflow,0];
	If[colourflow==={4/3,4/3} || colourflow==={3,3}  (*|| colorflow==={-4/3,-4/3,4/3,4/3}|| colorflow==={4/3,4/3,-4/3,-4/3} *),
	Return[True];
	];,
SSVV,
	cfsub1={colourflow[[1]],colourflow[[2]]}; cfsub2={colourflow[[3]],colourflow[[4]]};
	Switch[cfsub2,
	{0,0} | {3,3} | {0,3} | {3,0},
		If[cfsub1==={4/3,4/3},Return[True];];
	];, 
SSV,
	If[colourflow==={4/3,4/3,0} || colourflow==={4/3,4/3,3}  || colourflow==={3,3,0} || colourflow==={3,3,3}, Return[True];];,
ASS, Return[True];,
SSS | FFS, (* May cause some issues for fermions? I'm allowing new structures here, including singlet fermions. I don't see why not.*)
	cfsub=Sort[colourflow];
	If[cfsub==={4/3,4/3,3} || cfsub==={0,3,3} || cfsub==={0,4/3,4/3} || cfsub==={3,3,3},Return[True];];,
FFV,
	If[colourflow==={4/3,4/3,0}  || colourflow==={3,3,0} || colourflow==={4/3,4/3,3} || colourflow==={3,3,3}, Return[True];];,
VVV,
	If[colourflow==={3,3,3}, Return[True];];,
GGV,
	If[colourflow==={3,3,3}, Return[True];];,
VVVV,
	If[colourflow==={3,3,3,3},Return[True];];
];


CalcHep::UnknownColorFlow="Color flow in vertex `` is not supported. Skipping vertex";
Message[CalcHep::UnknownColorFlow,fields];
Return[False];


];
