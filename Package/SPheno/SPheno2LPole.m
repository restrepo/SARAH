(* ::Package:: *)

(* ::Input::Initialization:: *)
GenerateSPheno2LPole[ReadL_]:=Block[{generate2L},Print[StyleForm["Writing SPheno two loop diagrammatic Higgs mass","Section",FontSize->12]];
Print["by Mark Goodsell (goodsell@lpthe.jussieu.fr), arxiv:1503.03098"];
(*$sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}];*)

generate2L=True;
spheno2LP=OpenWrite[ToFileName[$sarahSPhenoTwoLoopDir,"2LPole_"<>ModelName<>".f90"]];
If[FreeQ[ParticleDefinitions[CurrentStates],"Pseudo-Scalar Higgs"]==False,AddPseudos=True;,AddPseudos=False;];

getneededtadpolemasses;

Write2LPoleHeader;
$sarahStoreTwoLoopDir=ToFileName[{$sarahCurrentOutputDir,"Two-Loop"}];

If[FileExistsQ[$sarahStoreTwoLoopDir]=!=True,
generate2L=True;
CreateDirectory[$sarahStoreTwoLoopDir];
,
If[ReadL==True,
generate2L=Not[Read2LLists]
];
];




If[generate2L,
(*SA`CheckSameVertices=False;*)
generate2LPoleFunctions;
generate2L=Read2LLists;
If[!generate2L,Print["Error generating/reading two loop functions!\n]";Return[]]];
];

Clear[tad2L1Ldyn,tot2L1dyn,tad2Ldyn,hh2Ldyn,Ah2Ldyn];

WriteString[spheno2LP,"! ----------------------------------\n"];
WriteString[spheno2LP,"! ------- 1L GAUGELESS TADPOLE DIAGRAMS --------\n"];
WriteString[spheno2LP,"! ----------------------------------\n"];

WriteString[spheno2LP,"delta2Ltadpoles(:)=0._dp\n"];
WriteString[spheno2LP,"delta2Lmasses(:,:)=0._dp\n"];
WriteString[spheno2LP,"delta2LmassesAh(:,:)=0._dp\n"];
WriteString[spheno2LP,"tad1LG(:)=0._dp\n"];

If[Skip1l2lshift=!=True,

WriteString[spheno2LP,"if(include1l2lshift) then\n"];
Writegaugeless1L;

WriteString[spheno2LP,"! ----------------------------------\n"];
WriteString[spheno2LP,"! ------- 1L2L SHIFTS --------\n"];
WriteString[spheno2LP,"! ----------------------------------\n"];

If[FreeQ[getType/@Transpose[relevanttreemasses][[1]],F],
(*Routines for shifts not available if fermion masses are modified*)
Write1L2Lshifts;
];
WriteString[spheno2LP,"end if ! include1l2lshift\n"];

]; (* end if[Skip1l2lshift=!=True,*)


WriteString[spheno2LP,"! ----------------------------------\n"];
       WriteString[spheno2LP,"! ------- TADPOLE DIAGRAMS --------\n"]; 
       WriteString[spheno2LP,"! ----------------------------------\n"];

Write2LPoleFunction[1,tad2Ldyn,twolooptadpolediags];

If[AddPseudos==True,
 WriteString[spheno2LP,"\n! ------------------------------------\n"];
          WriteString[spheno2LP,"! ------- CP EVEN MASS DIAGRAMS ------\n"];
         WriteString[spheno2LP,"! ------------------------------------\n"];
,
WriteString[spheno2LP,"\n! -------------------------------\n"];
         WriteString[spheno2LP,"! ------- MASS DIAGRAMS ------\n"];
         WriteString[spheno2LP,"! -------------------------------\n"];
];

Write2LPoleFunction[2,hh2Ldyn,twoloophiggsmassdiags[[1]]];


If[AddPseudos==True,
 WriteString[spheno2LP,"\n! -----------------------------------\n"];
          WriteString[spheno2LP,"! ------- CP ODD MASS DIAGRAMS ------\n"];
         WriteString[spheno2LP,"! -----------------------------------\n"];
Write2LPoleFunction[3,Ah2Ldyn,twoloophiggsmassdiags[[2]]];
];

WriteString[spheno2LP,"End Subroutine CalculatePi2S\n"];
WriteString[spheno2LP,"End Module Pole2L_"<>ModelName<>" \n \n"];
Close[spheno2LP];
If[FileExistsQ[ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]]===True,DeleteFile[ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]];];

CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"2LPoleFunctions.f90"],ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]];


];


Read2LLists:=Block[{readok},
readok=True;
twolooptadpolediags={};


Check[Get[ToFileName[$sarahStoreTwoLoopDir,"tadpoles.m"]],readok=False];

If[AddPseudos==False,
twoloophiggsmassdiags={0};
,
twoloophiggsmassdiags={0,0};
Check[Get[ToFileName[$sarahStoreTwoLoopDir,"Ah.m"]],readok=False];
];

Check[Get[ToFileName[$sarahStoreTwoLoopDir,"hh.m"]],readok=False];
Return[readok];

];


Write2LPoleHeader:=Block[{i,ii,j},
WriteString[spheno2LP,"! ------------------------------------------------------------------------------ \n"];
WriteString[spheno2LP,"! This file was automatically created by SARAH version "<>SA`Version<>" \n"];
WriteString[spheno2LP,"! Two Loop diagrammatic calculation of Higgs masses (c) Mark Goodsell 2015-20 \n"];
WriteString[spheno2LP,"! References: arXiv: 1503.03098, 1604.05335, 1706.05372  \n"];
WriteString[spheno2LP,"! ------------------------------------------------------------------------------  \n\n"];
WriteString[spheno2LP,"Module Pole2L_"<>ModelName<>" \n \n"];
WriteString[spheno2LP,"Use Control \n"];
WriteString[spheno2LP,"Use Settings \n"];
WriteString[spheno2LP,"Use Couplings_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use AddLoopFunctions \n"];
WriteString[spheno2LP,"Use LoopFunctions \n"];
WriteString[spheno2LP,"Use Mathematics \n"];
WriteString[spheno2LP,"Use MathematicsQP \n"];
WriteString[spheno2LP,"Use Model_Data_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use StandardModel \n"];
WriteString[spheno2LP,"Use TreeLevelMasses_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use Pole2LFunctions\n"];
WriteString[spheno2LP,"Contains \n \n"];

MakeSubroutineTitle["CalculatePi2S",Join[listVEVs,listAllParameters],{"p2"},{"kont","tad2L","Pi2S","Pi2P"},spheno2LP];



dimMatrix=ToString[getGenSPheno[HiggsBoson]];
       dimMatrixAh=ToString[getGenSPheno[PseudoScalar]];


WriteString[spheno2LP,"Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",spheno2LP];
MakeVariableList[listVEVs,",Intent(in)",spheno2LP];
MakeVariableList[NewMassParameters,"",spheno2LP];


MakeVariableList[namesAll3P,"",spheno2LP];
MakeVariableList[namesAll4Pole,"",spheno2LP];


WriteString[spheno2LP,"Real(dp), Intent(in) :: p2\n"];
WriteString[spheno2LP,"Integer, Intent(inout):: kont\n"];
WriteString[spheno2LP,"Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 \n"];
WriteString[spheno2LP,"Real(dp) :: Qscale,prefactor,funcvalue\n"];
WriteString[spheno2LP,"complex(dp) :: cplxprefactor,A0m\n"];
WriteString[spheno2LP,"Real(dp)  :: temptad("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcont("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcontah("<>dimMatrixAh<>","<>dimMatrixAh<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: runningval("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: tad2l("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: Pi2S("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: Pi2P("<>dimMatrixAh<>","<>dimMatrixAh<>")\n"];

WriteString[spheno2LP,"complex(dp) :: coup1,coup2,coup3,coup4\n"];
WriteString[spheno2LP,"complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r\n"];

(*parameter for when to tree fermions in the loop as massless*)
WriteString[spheno2LP,"real(dp) :: epsFmass\n"];
WriteString[spheno2LP,"real(dp) :: epscouplings\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingvector("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingmatrix("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingmatrixah("<>dimMatrixAh<>","<>dimMatrixAh<>")\n"];
WriteString[spheno2LP,"logical :: nonzerocoupling\n"];

(*Bits for 1L shifts*)
WriteString[spheno2LP,"real(dp) :: delta2Ltadpoles("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"real(dp)  :: delta2Lmasses("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"real(dp)  :: delta2Lmassesah("<>dimMatrixAh<>","<>dimMatrixAh<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tad1LG("<>dimMatrix<>")\n"];
For[ii=1,ii<=Length[relevanttreemasses],ii++,
WriteString[spheno2LP,"complex(dp) :: "<>relevanttreemasses[[ii,4]]<>"("<>ToString[relevanttreemasses[[ii,2]]]<>","<>ToString[relevanttreemasses[[ii,2]]]<>")\n"];
];

(*Vector IncludeOnlyInternals restricts to only specific fields in the loop,e.g.IncludeOnlyInternals={Su,VG,Fu,Glu};
This can also be set in the SPheno.m file.If this is set,then we also restrict to third generation only.*)
If[Length[IncludeOnlyInternals]!=0,WriteString[spheno2LP,"Complex(dp) :: Ydtemp(3,3),Yetemp(3,3),Yutemp(3,3)\n"];
WriteString[spheno2LP,"real(dp) :: topyukawa,sbe,pietromt,vv\n"];
WriteString[spheno2LP,"write(*,*) \"Setting Yukawas diagonal and Yd to zero \"\n"];
WriteString[spheno2LP,"Ydtemp = (0._dp,0._dp)\nYdtemp(3,3)=real(Yd(3,3))\nYetemp = (0._dp,0._dp)\nYetemp(3,3)=real(Ye(3,3))\ntopyukawa = real(Yu(3,3))\nYutemp = (0._dp,0._dp)\nYutemp(3,3) = topyukawa\n"];
subcoupnames={Yu->Yutemp,Yd->Ydtemp,Ye->Yetemp,T[x_]->T[x]};,(*otherwise we don't do anything*)subcoupnames={};];

WriteString[spheno2LP,"\n\n"];

WriteString[spheno2LP,"tad2l(:)=0\n"];
WriteString[spheno2LP,"Pi2S(:,:)=0\n"];
WriteString[spheno2LP,"Pi2P(:,:)=0\n"];
WriteString[spheno2LP,"Qscale=getrenormalizationscale()\n"];
WriteString[spheno2LP,"epsfmass=0._dp\n"];
WriteString[spheno2LP,"epscouplings=1.0E-6_dp\n"];


(*Call tree level masses*)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters/.subcoupnames]],{},{".True.","kont"},spheno2LP];
(*Call 3-point couplings*)
For[i=1,i<=Length[PART[S]],
If[getGen[PART[S][[i,1]]]>1,
WriteString[spheno2LP,"Where (Abs("<>SPhenoForm[SPhenoMassSq[PART[S][[i,1]]]]<>"/Qscale).lt.TwoLoopRegulatorMass )"<>SPhenoForm[SPhenoMassSq[PART[S][[i,1]]]]<>"=Qscale*TwoLoopRegulatorMass\n"];,
WriteString[spheno2LP,"If (Abs("<>SPhenoForm[SPhenoMassSq[PART[S][[i,1]]]]<>"/Qscale).lt.TwoLoopRegulatorMass) "<>SPhenoForm[SPhenoMassSq[PART[S][[i,1]]]]<>"=Qscale*TwoLoopRegulatorMass\n"];
];
i++;];

MakeCall["CouplingsFor2LPole3",Join[parametersAll3P/.subcoupnames,namesAll3P],{},{},spheno2LP];
(*Call 4-point couplings taking proper care of colour factors*)
MakeCall["CouplingsFor2LPole4",Join[parametersAll4Pole/.subcoupnames,namesAll4Pole],{},{},spheno2LP];






];



generate2LPoleFunctions:=Block[{},dimhh=getGenSPheno[HiggsBoson];
(*************************************************************************)(*********************TADPOLE DIAGRAMS**********************************)(*************************************************************************)

Print["Generating tadpole diagrams"];
FH2LP=OpenWrite[ToFileName[$sarahStoreTwoLoopDir,"tadpoles.m"]];
(*Print[$sarahStoreTwoLoopDir," tadpoles\n"];*)
WriteString[FH2LP,"twolooptadpolediags={"];
total2Ldiagramswritten=0;
all2LPddata=Classify2LTadpoleDiagrams[HiggsBoson];
all2LPdiagrams=all2LPddata[[1]];
POLE2Ldiagramdata=all2LPddata[[2]];
dynamictwolooptadpoletopology="";
dynamictwolooptadpolediagram="";
Print[Dynamic[dynamictwolooptadpoletopology],": ",Dynamic[dynamictwolooptadpolediagram]];
type=ToSSS;
generatePOLEfunctions[1,type,{1,1,1},{1,1,1}];
type=ToSS;
generatePOLEfunctions[1,type,{1,1,2},{1,1,2}];
type=ToSSSS;
generatePOLEfunctions[1,type,{1,1,2,2},{1,1,1,1}];
(*-----SCALAR AND VECTOR DIAGRAMS*)
(*Print["Generating Scalar-Vector diags"];*)
type=ToSV;
generatePOLEfunctions[1,type,{1},{1}];
(*-----FERMION AND SCALAR DIAGRAMS*)
(*Print["Generating Scalar-Fermion diags"];*)
type=ToSSFF;
generatePOLEfunctions[1,type,{1,1,2,2},{1,1,1,1,1,0}];
type=ToFFFS;
generatePOLEfunctions[1,type,{1,1,2,3},{1,1,1,1,1,0}];
(*-----FERMION AND VECTOR DIAGRAMS*)
(*Print["Generating Fermion-Vector diags"];*)
type=ToFV;
generatePOLEfunctions[1,type,{1},{1,1,1,1,1,0}];

dynamictwolooptadpoletopology="Tadpole diagrams complete";
dynamictwolooptadpolediagram=ToString[total2Ldiagramswritten-1]<>" diagrams written to file.";
WriteString[FH2LP,"\n}\n"];
Close[FH2LP];

(*************************************************************************)(*********************MASS DIAGRAMS*************************************)(*************************************************************************)

If[FreeQ[ParticleDefinitions[CurrentStates],"Pseudo-Scalar Higgs"],
iScalarEnd=1;
twoloophiggsmassdiags={0};
,
twoloophiggsmassdiags={0,0};
iScalarEnd=2;];
    
For[iScalar=1,iScalar<=iScalarEnd,iScalar++,
total2Ldiagramswritten=0;
Clear[all2LPddata,all2LPdiagrams,POLE2Ldiagramdata,topdata];
If[iScalar===1,
Print["Generating mass diagrams for " <>ToString[HiggsBoson]<>" states"];
          all2LPddata=Classify2LPdiagrams[HiggsBoson];
FH2LP=OpenWrite[ToFileName[$sarahStoreTwoLoopDir,"hh.m"]];

WriteString[FH2LP,"twoloophiggsmassdiags[[1]]={"];
(*Print[$sarahStoreTwoLoopDir," hh\n"];*)
,
Print["Generating mass diagrams for "<>ToString[PseudoScalar]<>" states"];
          all2LPddata=Classify2LPdiagrams[PseudoScalar];
FH2LP=OpenWrite[ToFileName[$sarahStoreTwoLoopDir,"Ah.m"]];
WriteString[FH2LP,"twoloophiggsmassdiags[[2]]={"];
(*Print[$sarahStoreTwoLoopDir," Ah\n"];*)
          ];



all2LPdiagrams=all2LPddata[[1]];
	POLE2Ldiagramdata=all2LPddata[[2]];

If[iScalar==1,
dynamictwolooppoletopology="";
              dynamictwolooppolediagram="";
	      Print[Dynamic[dynamictwolooppoletopology],": ",Dynamic[dynamictwolooppolediagram]];
,
dynamictwolooppoleAhtopology="";
              dynamictwolooppoleAhdiagram="";
	      Print[Dynamic[dynamictwolooppoleAhtopology],": ",Dynamic[dynamictwolooppoleAhdiagram]];

];

(*********************SCALAR ONLY DIAGRAMS**********************************)

(* ----- SCALAR ONLY DIAGRAMS *)

        type=WoSSSS;
        generatePOLEfunctions[2,type,{1,1,2,2},{1,1,1,1}];
type=XoSSS;
 generatePOLEfunctions[2,type,{1,1,2},{1,1,2}];
type=YoSSSS;
 generatePOLEfunctions[2,type,{1,2,2,3},{1,1,1,2}];
type=ZoSSSS;
 generatePOLEfunctions[2,type,{1,1,2,2},{1,1,2,2},{{1->ps3,2->ps4,3->ps1,4->ps2}}];
type=SoSSS;
 generatePOLEfunctions[2,type,{1,1,1},{1,1,1}];
type=UoSSSS;
 generatePOLEfunctions[2,type,{1,2,3,3},{1,1,1,1}];
type=VoSSSSS;
 generatePOLEfunctions[2,type,{1,2,2,3,3},{1,1,1,1,1}];
type=MoSSSSS;
 generatePOLEfunctions[2,type,{1,2,3,4,5},{1,1,1,1,1},{{1->ps3,2->ps4,3->ps1,4->ps2,5->-ps5},{1->ps2,2->ps1,3->ps4,4->ps3}}];
(*********************SCALAR AND VECTOR DIAGRAMS**********************************)
type=WoSSSV;
 generatePOLEfunctions[2,type,{1},{1}];
type=VoSSSSV;
 generatePOLEfunctions[2,type,{1,1},{1,1}];
type=MoSSSSV;
 generatePOLEfunctions[2,type,{1,1},{1,1}];
(*-------------------------------------FERMIONS AND SCALARS---------------------------------*)
type=WoSSFF;
 generatePOLEfunctions[2,type,{1,1,2,2},{1,1,1,1,1,0}];
(*
type=MoFFFFS;
 generatePOLEfunctions[2,type,{1,2,3,4,5},{1,1,1,1,1,0},{{1\[Rule]ps3,2\[Rule]ps4,3\[Rule]ps1,4\[Rule]ps2,5\[Rule]-ps5},{1\[Rule]ps2,2\[Rule]ps1,3\[Rule]ps4,4\[Rule]ps3}}];
type=MoSFSFF;
 generatePOLEfunctions[2,type,{1,2,3,4,5},{1,1,1,1,1,0},{{1\[Rule]ps3,2\[Rule]ps4,3\[Rule]ps1,4\[Rule]ps2,5\[Rule]-ps5}}];
*)
type=MoFFFFS;
 generatePOLEfunctions[2,type,{1,2,3,4,5},{1,1,1,1,1,0}];
type=MoSFSFF;
 generatePOLEfunctions[2,type,{1,2,3,4,5},{1,1,1,1,1,0}];
type=VoSSSFF;
 generatePOLEfunctions[2,type,{1,2,2,3,3},{1,1,1,1,1,0}];
(*
type=VoFFFFS;
 generatePOLEfunctions[2,type,{1,2,2,3,4},{1,1,1,1,1,0}];*)
type=VoFFFFS;
 generatePOLEfunctions[2,type,{1,2,3,4,5},{1,1,1,1,1,0}];
(*-------------------------------------FERMIONS AND VECTORS---------------------------------*)
type=GoFFFFV;
 generatePOLEfunctions[2,type,{1,1},{1,1,1,1,1,0}];

WriteString[FH2LP,"\n}\n"];
Close[FH2LP];

If[iScalar==1,
dynamictwolooppoletopology="Complete";
dynamictwolooppolediagram=ToString[total2Ldiagramswritten-1]<>" diagrams written to file.";
,
dynamictwolooppoleAhtopology="Complete";
dynamictwolooppoleAhdiagram=ToString[total2Ldiagramswritten-1]<>" diagrams written to file.";

];



];



](*end generate2LPoleFunctions*)



(******************************************************END OF Write2LPoleFunction********************************)(******************************************************DEFINE HELPER FUNCTIONS********************************)getSPhenoCouplingPole[x_,couplings_]:=Module[{func,cList,pList,pos},(*Returns the spheno coupling name and the ordered list of particles given a coupling of the form C[p1,....]*)func=x/.Cp[a__]->C[a]/.A_[{a__}]->A;
If[FreeQ[couplings,func]==False,pos=Position[couplings,func];
cList=Extract[couplings,pos[[1,1]]][[2]];
pList=Last[Extract[couplings,pos[[1,1]]]];
Return[{Delete[cList,1],pList}],If[FreeQ[couplings,ConjCoupling[func]]==False,pos=Position[couplings,ConjCoupling[func]];
cList=Extract[couplings,pos[[1,1]]][[2]];
pList=Map[AntiField,Last[Extract[couplings,pos[[1,1]]]]];
Return[{Delete[cList,1],pList}];,Return[0]]];
Return[0]];

twoloopgetSPhenoCouplingName[x_]:=Module[{func,cList,pList,pos,parts,nparts,ctype,couplings},(*Returns the spheno coupling name and the ordered list of particles given a coupling of the form C[p1,....]*)
func=x/.Cp[a__]->C[a];
parts=func/.{C[a__]->{a}};
nparts=Length[parts];
If[nparts==3,couplings=SPhenoCouplings3P,couplings=SPhenoCouplings4Pole];
If[FreeQ[couplings,func]==False,
pos=Position[couplings,func];
cList=Extract[couplings,pos[[1,1]]][[2]];
Return[{Delete[cList,1]}],
If[FreeQ[couplings,ConjCoupling[func]]==False,
pos=Position[couplings,ConjCoupling[func]];
cList=Extract[couplings,pos[[1,1]]][[2]];
Return[{Delete[cList,1]}];
,
Return[0]]];
Return[0]];

TwoLMakeIndices[setofindices_,Coupling_]:=Block[{tps,ps,indextemp,pos,pp,outindices,plisttemp,ilisttemp,sphenoc,couplings},
(*Order the particles as in the spheno coupling *)
tps=Coupling/.{C[x__]->{x}};
Switch[Length[tps],
3,
couplings=SPhenoCouplings3P;
,
4,
couplings=SPhenoCouplings4Pole;
,
_,
Print["Problem with length of coupling in two loop routines\n"];
Abort[];
];
pos=Position[couplings,Coupling];
If[pos=={},Print["Problem with couplings in two loop routines\n"];
Abort[];];

ps=(Last[couplings[[pos[[1,1]]]]])/.{A_[{b__}]->A};

plisttemp=Transpose[setofindices][[1]];
ilisttemp=Transpose[setofindices][[2]];
outindices={};
For[pp=1,pp<=Length[ps],pp++,
pos=Position[plisttemp,ps[[pp]],1];
If[pos=!={},
If[getGenSPheno[ps[[pp]]]>1,AppendTo[outindices,{ps[[pp]],ilisttemp[[pos[[1,1]]]]}]];
plisttemp=Delete[plisttemp,pos[[1,1]]];
ilisttemp=Delete[ilisttemp,pos[[1,1]]];
,
Print["Error in ordering vertex ",Coupling," in two loop routines\n"];
Abort[];
];
];
Return[{outindices,Coupling}]

];

(******************************************************SYMMETRY FACTORS********************************)
(*myrep[x_,rrule_]:=Module[{trule},
If[Length[rrule]>4,
trule=rrule/.{ps1\[Rule]x[[1]],ps2\[Rule]x[[2]],ps3\[Rule]x[[3]],ps4\[Rule]x[[4]],ps5\[Rule]x[[5]]};
,
trule=rrule/.{ps1\[Rule]x[[1]],ps2\[Rule]x[[2]],ps3\[Rule]x[[3]],ps4\[Rule]x[[4]]};
];
Return[(ReplacePart[x,trule])]];*)
myrep[x_,rrule_]:=Module[{trule},
trule=rrule/.{-ps1->AntiField[x[[1]]],ps1->x[[1]],-ps2->AntiField[x[[2]]],ps2->x[[2]],-ps3->AntiField[x[[3]]],ps3->x[[3]],-ps4->AntiField[x[[4]]],ps4->x[[4]]};
If[Length[rrule]>4,trule=trule/.{-ps5->AntiField[x[[5]]],ps5->x[[5]]}];
Return[(ReplacePart[x,trule])]];

SetAttributes[{POLEdiagsymmetries},{HoldAll}];
POLEdiagsymmetries[listinternals_,ps_,equivalencesets_,chains_,metaequivalencesets_:{}]:=Module[{i,j,nsets,tempsets,ctempsets,tempset,tempset2,equivalentset,cequivalentset,equivalentsetno,nid,lenset,symfac,ncomplex,nchains,tempchains,tempchain,lenchain,possibleset1,possibleset2,setchainrep,realts,iset,set0,set1,set2,set3,fset,rset1,rset2,lrset1,lrset2,tps,pos,listpossiblematches,s0parts,swap1,swap2,s1parts,s2parts,s3parts,tfset,tfset2,Invertorder,orderedpartlist},
nsets=Last[equivalencesets];
nchains=Last[chains];
tps=ps;
tempsets=Table[{},{i,1,nsets}];
realts=Table[{},{i,1,nsets}];
ctempsets=Table[{},{i,1,nsets}];
tempchains=Table[{},{i,1,nchains}];
symfac=1;
If[Length[metaequivalencesets]>0,

set0=tps;
set1=myrep[set0,metaequivalencesets[[1]]];
Switch[Length[metaequivalencesets],
1,
iset=Intersection[{set0,set1}];
,
2,
set2=myrep[tps,metaequivalencesets[[2]]];
set3=myrep[set1,metaequivalencesets[[2]]];
iset=Intersection[{set0,set1,set2,set3}];

];
symfac=symfac*Length[Intersection[iset//.{conj[x_]->x,bar[x_]->x}]];

For[i=1,i<=Length[iset],i++,
If[Head[Last[iset]]===conj||Head[Last[tps]]===bar,
iset[[i]]=myconj[iset[[i]]];
];
];
fset=iset[[1]];
tfset=fset//.{conj[x_]->x,bar[x_]->x};


For[i=2,i<=Length[iset],i++,
tfset2=iset[[i]]//.{conj[x_]->x,bar[x_]->x};
If[!OrderedQ[{tfset,tfset2}],
tfset=tfset2;
fset=iset[[i]];
,
If[tfset===tfset2,
If[!OrderedQ[{fset,iset[[i]]}],
fset=iset[[i]];
];
];
];
];
(*fset=Sort[iset,(#1/.{conj[x_]\[Rule]x,bar[x_]\[Rule]x})>(#2/.{conj[x_]\[Rule]x,bar[x_]\[Rule]x})&][[1]];*)
tps=fset;
];

If[nchains>0,
(*added for fermion bits,which have no chains...*)
For[i=1,i<=Length[equivalencesets],i++,
AppendTo[tempsets[[equivalencesets[[i]]]],tps[[i]]];
AppendTo[realts[[equivalencesets[[i]]]],RE[tps[[i]]]];
AppendTo[ctempsets[[equivalencesets[[i]]]],AntiField[tps[[i]]]];
AppendTo[tempchains[[chains[[i]]]],tps[[i]]];
];
,
For[i=1,i<=Length[equivalencesets],i++,
AppendTo[tempsets[[equivalencesets[[i]]]],tps[[i]]];
AppendTo[realts[[equivalencesets[[i]]]],RE[tps[[i]]]];
AppendTo[ctempsets[[equivalencesets[[i]]]],AntiField[tps[[i]]]];
];
];

For[i=1,i<=nsets,i++,
tempsets[[i]]=Sort[tempsets[[i]]];
ctempsets[[i]]=Sort[ctempsets[[i]]];
realts[[i]]=Sort[realts[[i]]];
];
orderedpartlist=Flatten[tempsets];
(* Here's where we need to check ...*)
pos=Position[Transpose[listinternals][[2]],Flatten[realts]];

If[Length[pos]>0,
listpossiblematches=Table[listinternals[[pos[[i,1]],1]],{i,1,Length[pos]}];

If[FreeQ[listpossiblematches,orderedpartlist]=!=True,(*old diagram!*)Return[0]];
If[FreeQ[listpossiblematches,Flatten[ctempsets]]=!=True,(*old diagram!*)Return[0]];

If[nchains>1,
(* nb if no chains \[Rule] only ossibility for overlap is that the whole diagram is conjugate *)
(* In practice only have 2 chains at most, so will do this the simple way *)
(* first is to conjugate the first chain, then the second *)
possibleset1={};
possibleset2={};
setchainrep=Union[Table[equivalencesets[[i]]->chains[[i]],{i,1,Length[ps]}]];
For[i=1,i<=Length[tempsets],i++,
If[(i/.setchainrep)==1,
(*AppendTo[possibleset1,Sort[AntiField/@tempsets[[i]]]];*)
AppendTo[possibleset1,ctempsets[[i]]];
AppendTo[possibleset2,tempsets[[i]]];
,
AppendTo[possibleset1,tempsets[[i]]];
AppendTo[possibleset2,ctempsets[[i]]];
(*AppendTo[possibleset2,Sort[AntiField/@tempsets[[i]]]];*)
];


];
possibleset1=Flatten[possibleset1];
possibleset2=Flatten[possibleset2];
If[FreeQ[listpossiblematches,possibleset1]=!=True,(*old diagram!*)Return[0]];
If[FreeQ[listpossiblematches,possibleset2]=!=True,(*old diagram!*)Return[0]];
];(* if[nchains>1 *)
];(* if[Length[pos]>0 *)
(*Otherwise we have a new diagram:compute the symmetry factor*)

AppendTo[listinternals,{orderedpartlist,Flatten[realts]}];

ncomplex=0;
For[i=1,i<=nchains,i++,
tempchain=tempchains[[i]];
lenchain=Length[tempchain];
For[j=1,j<=lenchain,j++,
If[conj[tempchain[[j]]]=!=tempchain[[j]],
ncomplex++;
Break[];
];
];
];
For[i=1,i<=nsets,i++,
tempset=tempsets[[i]];
lenset=Length[tempset];
If[lenset>1,
tempset=tempset//.{conj[a_]->a,bar[a_]->a};
symfac=symfac*Factorial[lenset];
While[lenset>0,tempset=DeleteCases[tempset,tempset[[1]]];
nid=0;
nid=lenset-Length[tempset];
symfac=symfac/Factorial[nid];
lenset=Length[tempset]];
];
];
symfac=symfac*Power[2,ncomplex];
Return[symfac];

];


(************************************************************************************************************************)(******************************************************GENERATOR FUNCTION**********************************)(************************************************************************************************************************)generatePOLEfunctions[nh_,type_,equivalences_,chains_,metasets_:{}]:=Module[{ps,finalnumberofdiags,ninternalparticles,numberofcouplings,i,j,iic,iii,k,x,diag,NrDiags,diagrams,diagselection,diagdata,BreakFlag,tempcoup,coups,prefactor,constantprefactor,string,funcstring,finalstring,symfactor,Scalarcouplingnumber,myparts,nmyparts,setofindices,findpart,target,descriptioninternalprops,allindicesstrings,mylistinternals,indstring,indicestowrite,partsgens,gaugebosonsincoup,gbgaugegroup,topodata,generalddata,specificddata,fermionflag,SPOLEprefactor,POLEprefactor,FPOLEprefactor,gaugeindices},
Clear[topdata,topodata,diagdata];
If[nh==1,
dynamictwolooptadpoletopology="Topology "<>ToString[type];,
If[iScalar>1,
dynamictwolooppoleAhtopology="Topology "<>ToString[type];
,
dynamictwolooppoletopology="Topology "<>ToString[type];
];
];
ninternalparticles=Length[equivalences];
finalnumberofdiags=0;
mylistinternals={{{},{}}};
diagselection=Select[all2LPdiagrams,#[[1]]===type&];
If[Length[diagselection]>0,diagrams=diagselection[[1,2]];
NrDiags=Length[diagrams],NrDiags=0];
If[NrDiags>0,

(*Print[NrDiags," of type ",type];*)

(*If[total2Ldiagramswritten=!=0,WriteString[FH2LP,","]];*)
If[total2Ldiagramswritten=!=0,
WriteString[FH2LP,","];
total2Ldiagramswritten-=1;(*This is to avoid problems with the first entry*)
];
WriteString[FH2LP,"\n{"<>ToString[type]<>",{\n"];
finalnumberofdiags=0;
diagdata=(Select[POLE2Ldiagramdata,#[[1]]===type&])[[1,2]];

If[Length[diagdata]>2,
(* Bosonic processes *)
topodata=topdata/.diagdata;
generalddata={};
specificddata={};
SPOLEprefactor=pprefactor/.diagdata;
funcstring=pfuncstring/.diagdata;
fermionflag=False;
,

(* Fermionic processes *)
SPOLEprefactor=1;
generalddata=diagdata[[1]];
         specificddata=diagdata[[2]];
        topodata=topdata/.generalddata;
fermionflag=True;
];




For[i=1,i<=NrDiags,i++,
diag=diagrams[[i]];
ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];

BreakFlag=False;
If[Length[IncludeOnlyInternals]!=0,
For[j=1,j<=Length[ps],j++,
If[FreeQ[IncludeOnlyInternals,ps[[j]]/.{conj[x_]->x}]==True,BreakFlag=True;
Continue[];
];
];
];
If[BreakFlag==True,Continue[]];
numberofcouplings=Length[diag[[1]]];
coups={};
BreakFlag=False;
For[j=1,j<=numberofcouplings,j++,
tempcoup=diag[[1,j]];
If[Length[tempcoup/.{C[x__]->{x}}]==4,
tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings4Pole],
tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings3P]
];
If[tempcoup===0,BreakFlag=True,AppendTo[coups,tempcoup]];];
If[BreakFlag==True,Continue[]];
symfactor=POLEdiagsymmetries[mylistinternals,ps,equivalences,chains,metasets];
If[symfactor==0,Continue[];];
finalnumberofdiags++;


descriptioninternalprops=StringJoin@Riffle[ToString/@ps,","];
If[nh==1,
dynamictwolooptadpolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";,
If[iScalar>1,
dynamictwolooppoleAhdiagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
,
dynamictwolooppolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
];
];
allindicesstrings={};
adjoint=False;
indexmaps={};
setofindices={};
myparts={};
internalparticlelist={};
GaugeBosonFlag=False;
Scalarcouplingnumber=0;
numberofcouplings=Length[diag[[1]]];
colourfactor=0;
(*WTF ARE WE DOING THIS AGAIN FOR?*)
(*ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];*)

setofindices=topodata/.diag[[2]];
nmyparts=Count[Flatten[topodata],Internal[_]];
internalparticlelist=Table[{ps[[iii]],ToExpression["i"<>ToString[iii]]},{iii,1,nmyparts}];
myparts=Take[ps,nmyparts];
(*If[FreeQ[ps,VG]\[Equal]False,GaugeBosonFlag=True;
indicesoffirstinternal=getIndizesWI[myparts[[1]]];
dimoffirstinternal=(Select[indicesoffirstinternal,FreeQ[#,color]\[Equal]False&])[[1]]/.{color,a_Integer}\[Rule]a;
numberingaugegroupofcolor=(Position[Gauge,color])[[1,1]];
colourfactor=8*(CalculateDynkinAndCasimir[numberingaugegroupofcolor,dimoffirstinternal])[[2]]];*)
gaugebosonsincoup=Select[ps,getType[#]==V&];
If[gaugebosonsincoup=!={},(*Should only be one gauge boson present for now!*)
gbgaugegroup=Position[Transpose[dataUnBrokenGaugeGroups][[4]],gaugebosonsincoup[[1]]];
If[gbgaugegroup=!={},
GaugeBosonFlag=True;
gbgaugegroup=gbgaugegroup[[1,1]];(*This should now have all the info about the group necessary*)
(* Now want colour factor \[Rule] dimension of gauge group * dynkin index for first particle *)
(* = dimension of rep * casimir *)
(* Assume that we need to multiply by dimension of all unbroken gauge groups that the field is charged under *)
gaugeindices=DeleteCases[DeleteCases[getIndizesWI[RE[myparts[[1]]]],{generation,_},3],{lorentz,_},3];
colourfactor=Times@@(Transpose[gaugeindices][[2]]);
colourfactor*=SA`Casimir[RE[myparts[[1]]],dataUnBrokenGaugeGroups[[gbgaugegroup,1]]];
(*
colourfactor=dataUnBrokenGaugeGroups[[gbgaugegroup,6]]*SA`Dynkin[RE[myparts[[1]]],dataUnBrokenGaugeGroups[[gbgaugegroup,1]]];
*)
];
];

indextonumber={i1->1,i2->2,i3->3,i4->4,i5->5};


For[j=1,j<=numberofcouplings,j++,
particlesincouplingj=diag[[1,j]]/.{C[x__]->{x}};
nparticlesincouplingj=Length[particlesincouplingj];
(*If[FreeQ[particlesincouplingj,VG]\[Equal]False,*)
If[GaugeBosonFlag,
If[FreeQ[particlesincouplingj,dataUnBrokenGaugeGroups[[gbgaugegroup,4]]]==False,
coups[[j]]={{dataUnBrokenGaugeGroups[[gbgaugegroup,3]]},False};
AppendTo[allindicesstrings,{"{}",dataUnBrokenGaugeGroups[[gbgaugegroup,3]]}];
Continue[]
];
]; (* end gaugebosonflag*)
Scalarcouplingnumber++;

If[nparticlesincouplingj==4,(*First check whether four identical particles up to conjugation;in that case have to be careful with order if coloured*)
	If[Length[Intersection[RE/@particlesincouplingj]]==1&&Length[Intersection[particlesincouplingj]]==2,
	(*Then check whether the particle has more than one generation-- otherwise we don't need to worry!*)
               If[getGen[particlesincouplingj[[1]]]<2,AppendTo[allindicesstrings,{{},diag[[1,j]]/.a_[{x__}]->a}];
         ,
	
	particlesincoupling=Transpose[setofindices[[Scalarcouplingnumber]]][[1]];
	indicesincoupling=Transpose[setofindices[[Scalarcouplingnumber]]][[2]];
	setofpairs={{},{}};
	orderedfieldsincoupling=diag[[1,j]]/.{C[x__]->{x}};
	For[k=1,k<=4,k++,
		AppendTo[setofpairs[[chains[[indicesincoupling[[k]]/.indextonumber]]]],{particlesincoupling[[k]],indicesincoupling[[k]]}];
		];
	(*sets of pairs should be sets of conjugates...*)
	newcouplingindices={{},{},{},{}};
	pp1=Position[orderedfieldsincoupling,setofpairs[[1,1,1]],1][[1,1]];
	pp2=Position[orderedfieldsincoupling,setofpairs[[1,2,1]],1][[1,1]];
	pp3=Position[orderedfieldsincoupling,setofpairs[[2,1,1]],1][[2,1]];
	pp4=Position[orderedfieldsincoupling,setofpairs[[2,2,1]],1][[2,1]];
	newcouplingindices[[pp1]]=setofpairs[[1,1]];
	newcouplingindices[[pp2]]=setofpairs[[1,2]];
	newcouplingindices[[pp3]]=setofpairs[[2,1]];
	newcouplingindices[[pp4]]=setofpairs[[2,2]];
(*Have already ordered the couplings so let's do our own makeindicescoupling4 rather than calling the other function*)
	indicestowrite={};
	For[k=1,k<=4,k++,AppendTo[indicestowrite,{orderedfieldsincoupling[[k]],newcouplingindices[[k,2]]}]
	];
	AppendTo[allindicesstrings,{indicestowrite,diag[[1,j]]/.a_[{x__}]->a}];
];(*end if[getGen...*)
,
(*Otherwise just a regular 4pt coupling*)
(*AppendTo[allindicesstrings,MakeIndicesCoupling4[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]*)


(*AppendTo[allindicesstrings,{setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]\[Rule]a}];*)
AppendTo[allindicesstrings,TwoLMakeIndices[setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]->a]];

]; (* *)
,
(* three particles in coupling *)
(*AppendTo[allindicesstrings,MakeIndicesCoupling[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]*)

(*AppendTo[allindicesstrings,{setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]\[Rule]a}];*)

AppendTo[allindicesstrings,TwoLMakeIndices[setofindices[[Scalarcouplingnumber]],diag[[1,j]]/.a_[{x__}]->a]];

];
];
(*For[j=1,j\[LessEqual]Length[internalparticlelist],j++,If[getGen[internalparticlelist[[j,1]]]>1,WriteString[spheno2LP,"Do "<>ToString[internalparticlelist[[j,2]]]<>"=1,"<>ToString[getGen[internalparticlelist[[j,1]]]]<>"\n"];]];*)


Clear[ci1,ci2,ci3,icc];
If[GaugeBosonFlag==False,colourfactor=mhpolegetcolour[setofindices];];


POLEprefactor=((-1)^numberofcouplings)*SPOLEprefactor*symfactor*colourfactor;


If[finalnumberofdiags>1,WriteString[FH2LP,",\n"];];

partsgens={#[[1]],#[[2]],getGenSPheno[#[[1]]]}&/@internalparticlelist;
WriteString[FH2LP,"{"<>ToString[partsgens]<>","];

If[fermionflag==False,
(* bosonic diagrams *) 
WriteString[FH2LP,"{{"<>ToString[POLEprefactor,InputForm]<>","<>funcstring<>","<>ToString[Array[0&,{numberofcouplings}]]<>"}},"];
,
(* fermionic diagrams *)
WriteString[FH2LP,"{"];

isdirac=Or@@PDiracQ/@ps;
            If[isdirac==False,POLEprefactor=POLEprefactor*1/2];


For[ii=1,ii<=Length[specificddata],ii++,
fermionmassesarray=(pfermionmasses/.specificddata[[ii]])/.diag[[2]];
                couplingtypesarray=pcouplingtypes/.specificddata[[ii]];
              funcstring=pfuncstring/.specificddata[[ii]];
              FPOLEprefactor=pprefactor/.specificddata[[ii]];
fermionmassstring="";

For[k=1,k<=Length[fermionmassesarray],k++,
tempmassstring="Mass["<>ToString[fermionmassesarray[[k,1]]];
If[getGenSPheno[fermionmassesarray[[k,1]]]>1,tempmassstring=tempmassstring<>","<>ToString[fermionmassesarray[[k,2]]]];
tempmassstring=tempmassstring<>"]";
fermionmassstring=fermionmassstring<>"*"<>tempmassstring;
];
If[ii>1,
WriteString[FH2LP,","];
];

WriteString[FH2LP,"{"<>ToString[FPOLEprefactor*POLEprefactor,InputForm]<>fermionmassstring<>","<>funcstring<>","<>ToString[couplingtypesarray]<>"}"];


]; (* end For[ii=1,... *)
WriteString[FH2LP,"},"];


]; (* end if fermionflag \[Equal] False*)


WriteString[FH2LP,ToString[allindicesstrings]<>"}"];




];(*End For[count over diagrams*)

WriteString[FH2LP,"\n}}"];(* to end the type*)

If[nh==1,
dynamictwolooptadpolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
,
If[iScalar>1,
dynamictwolooppoleAhdiagram=ToString[finalnumberofdiags]<>" diagrams written to file";
,
dynamictwolooppolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
];
];

total2Ldiagramswritten+=finalnumberofdiags+1;
](*end if[NrDiags>0,*)
(*Print[type,mylistinternals];*)
];(*End generate*)(************************************************************************************************************************)(******************************************************END GENERATOR FUNCTION***********************************)(************************************************************************************************************************)








(************************************************************************************************************************)
(******************************************************WRITER FUNCTION**********************************)
(************************************************************************************************************************)



(* ::Input::Initialization:: *)
Clear[Write2LPoleFunction];
Write2LPoleFunction[nh_,dynamic_,setofdiags_]:=Block[{types,ntypes,dcount,diag,ndiags,ps,ddata,pdesc,funcdesc,coupdescs,i,j,k,ii,argstring,string,string1,string2,prefactorstring,numberofcouplings,fcouptypes,fcount,indstring,prefactorlist,prefactormasslist,fermionmassstring,fermionandstring,tempmassstring,numericalprefactors,fermionmassstrings,fermionandstrings,labelstrings,tdimMatrix,ngen,fermionmassespresent,MyPSMixingMatrix},
ntypes=Length[setofdiags];
dynamic="";

Switch[nh,
1,
tdimMatrix=dimMatrix;
ngen=getGenSPheno[HiggsBoson];
WriteString[spheno2LP,"temptad(:)=0._dp\n"];
WriteString[spheno2LP,"tempcouplingvector(:)=0._dp\n"];
,
2,
tdimMatrix=dimMatrix;
ngen=getGenSPheno[HiggsBoson];
WriteString[spheno2LP,"tempcont(:,:)=0._dp\n"];
WriteString[spheno2LP,"tempcouplingmatrix(:,:)=0._dp\n"];
,
3,
tdimMatrix=dimMatrixAh;
ngen=getGenSPheno[PseudoScalar];
WriteString[spheno2LP,"tempcontah(:,:)=0._dp\n"];
WriteString[spheno2LP,"tempcouplingmatrixah(:,:)=0._dp\n"];
];


If[AddPseudos,
labelstrings={"Tadpoles: ","CP-even masses: ","CP-odd masses: "};,
labelstrings={"Tadpoles: ","Masses: "};
];
Print["Writing "<>labelstrings[[nh]],Dynamic[dynamic]];
For[types=1,types<=ntypes,types++,
(*writerdynamics[[writerdynamic]]=ToString[setofdiags[[types,1]]]<>", ("<>ToString[types]<>" of "<>ToString[ntypes];*)

dynamic=ToString[setofdiags[[types,1]]]<>" ("<>ToString[types]<>" of "<>ToString[ntypes]<>") topologies";
WriteString[spheno2LP,"! ---- Topology "<>ToString[setofdiags[[types,1]]]<>"\n"];


ndiags=Length[setofdiags[[types,2]]];

For[dcount=1,dcount<=ndiags,dcount++,
ddata=setofdiags[[types,2,dcount]];
pdesc=ddata[[1]];
funcdesc=ddata[[2]];
coupdescs=ddata[[3]];
(*Print[coupdescs];*)
ps=Transpose[pdesc][[1]];

WriteString[spheno2LP,"! ---- "<>StringJoin@Riffle[ToString/@ps,","]<>" ----\n"];

For[j=1,j<=Length[pdesc],j++,
If[pdesc[[j,3]]>1,
WriteString[spheno2LP,"Do "<>ToString[pdesc[[j,2]]]<>"=1,"<>ToString[pdesc[[j,3]]]<>"\n"];]];

If[nh==1,argstring="(";,argstring="(p2,";];
	argstring=argstring<>StringJoin@@Riffle[(ToString@SPhenoMassSq[#[[1]],#[[2]]])/.{"0."->"0._dp"}&/@pdesc,","]<>",Qscale)";



  


fcouptypes=Length[funcdesc];
numberofcouplings=Length[coupdescs];



For[fcount=1,fcount<=fcouptypes,fcount++,

(* don't really need to do this as we overwrite each entry *)
(*
If[nh\[Equal]1,
WriteString[spheno2LP,"tempcouplingvector=0._dp\n"];
,
WriteString[spheno2LP,"tempcouplingmatrix=0._dp\n"];
];
*)

(*
prefactorlist=Flatten[{funcdesc[[fcount,1]]/.{Times\[Rule]List}}];
numericalprefactors=Flatten[{DeleteCases[{DeleteCases[prefactorlist,Mass[x__]]},1]}];(*Remove leading 1s *)
prefactormasslist=Cases[prefactorlist,Mass[x__]\[Rule]{x}];
fermionmassstrings=ToString[SPhenoMass[Sequence@@#]]&/@prefactormasslist;
*)

prefactorlist=Flatten[{funcdesc[[fcount,1]]/.{Times->List,Power[x_,2]->List[x,x],Power[x_,3]->List[x,x,x],Power[x_,4]->List[x,x,x,x]}}];

    numericalprefactors=Flatten[{DeleteCases[{DeleteCases[prefactorlist,Mass[x__]]},1]}];
		prefactormasslist=Cases[prefactorlist,Mass[x__]->{x}];
		fermionmassstrings=ToString[SPhenoMass[Sequence@@#]]&/@prefactormasslist;
                  fermionmassespresent=Intersection[fermionmassstrings];



If[FreeQ[fermionmassespresent,"0."]==False,(*One of the particles in the prefactor has its mass defined to be zero *)
Continue[];
];
(*Print["prefactors: ",prefactorlist,"-----",prefactormasslist,"-----",fermionmassstrings];*)
prefactorstring=StringJoin[Riffle[Join[ToString[FortranForm[If[Head[#]===Integer,1.0*#,#]]]&/@numericalprefactors,fermionmassstrings],"*"]];
If[prefactorstring=!="",prefactorstring=prefactorstring<>"*"];

(*Print["prefactorstring: ",prefactorstring];*)
If[Length[fermionmassespresent]>0,

fermionandstring="if(";
fermionandstrings=StringJoin["(",#," .gt. epsfmass)"]&/@fermionmassespresent;
fermionandstring=fermionandstring<>StringJoin[Riffle[fermionandstrings," .and. "]]<>") then \n";
WriteString[spheno2LP,fermionandstring];
]

WriteString[spheno2LP,"nonzerocoupling=.false.\n"];
		WriteString[spheno2LP,"  Do gE1=1,"<>tdimMatrix<>"\n"];
		If[nh>1,WriteString[spheno2LP,"   Do gE2=1,"<>tdimMatrix<>"\n"];];


string="prefactor=Real(";
string1="";
               string2="";

		
For[j=1,j<=numberofcouplings,j++,
   If[j!=1,
         string1=string1<>"*";
         string2=string2<>"*";
        ];

        If[Length[coupdescs[[j,1]]]==0,(*gauge boson coupling or no indices*)

             If[FreeQ[coupdescs[[j,2]],C[__]]&&FreeQ[coupdescs[[j,2]],Cp[__]],
(*gauge boson coupling*)
WriteString[spheno2LP,"coup"<>ToString[j]<>" = ",ToString[coupdescs[[j,2]]]<>"\n"];
,(*regular coupling but no indices*)
indstring="";
WriteVertexToFile[j,twoloopgetSPhenoCouplingName[coupdescs[[j,2]]],{indstring,False},getVertexType[coupdescs[[j,2]]],spheno2LP];
];
,(*Otherwise regular coupling*)
indstring="("<>StringJoin@@Riffle[ToString/@Transpose[DeleteCases[coupdescs[[j,1]],{}]][[2]],","]<>")";
WriteVertexToFile[j,twoloopgetSPhenoCouplingName[coupdescs[[j,2]]],{indstring,False},getVertexType[coupdescs[[j,2]]],spheno2LP];
];

Switch[funcdesc[[fcount,3,j]],
L,
string1=string1<>"coup"<>ToString[j]<>"L";
string2=string2<>"coup"<>ToString[j]<>"R";
,
R,
string1=string1<>"coup"<>ToString[j]<>"R";
string2=string2<>"coup"<>ToString[j]<>"L";
,
_,
string1=string1<>"coup"<>ToString[j];
string2=string2<>"coup"<>ToString[j];
];


]; (* end for j=1 *)
(*Print[funcdesc[[fcount,3]],FreeQ[funcdesc[[fcount,3]],L]];*)
If[FreeQ[funcdesc[[fcount,3]],L],(* bosonic coupling \[Rule] in case of one chirality only, we put L rather than R *)
string=string<>string1;
,
(* fermionic coupling*)
string=string<>string1<>"+"<>string2;
];
              string=string<>",dp)\n";

	WriteString[spheno2LP,string];

Switch[nh,
1,
WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingvector(gE1)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingvector(gE1)= 0._dp\n end if\n"];
WriteString[spheno2LP,"   End Do\n"];
WriteString[spheno2LP,"if(nonzerocoupling) then \n"];
WriteString[spheno2LP," funcvalue= "<>prefactorstring<>ToString[funcdesc[[fcount,2]]]<>argstring<>"\n"];
WriteString[spheno2LP," temptad=temptad+tempcouplingvector*funcvalue\n"];
,
2,
WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingmatrix(gE1,gE2)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingmatrix(gE1,gE2)= 0._dp\n end if\n"];
WriteString[spheno2LP,"   End Do\n  End do\n"];
WriteString[spheno2LP,"if(nonzerocoupling) then \n"];
WriteString[spheno2LP," funcvalue= "<>prefactorstring<>ToString[funcdesc[[fcount,2]]]<>argstring<>"\n"];
WriteString[spheno2LP," tempcont=tempcont+tempcouplingmatrix*funcvalue\n"];
,
3,
WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingmatrixah(gE1,gE2)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingmatrixah(gE1,gE2)= 0._dp\n end if\n"];
WriteString[spheno2LP,"   End Do\n  End do\n"];
WriteString[spheno2LP,"if(nonzerocoupling) then \n"];
WriteString[spheno2LP," funcvalue= "<>prefactorstring<>ToString[funcdesc[[fcount,2]]]<>argstring<>"\n"];
WriteString[spheno2LP," tempcontah=tempcontah+tempcouplingmatrixah*funcvalue\n"];
];

WriteString[spheno2LP,"end if\n"];

If[Length[fermionmassstrings]>0,WriteString[spheno2LP,"end if\n\n"];];



];(* end for fcount=1 *)







For[j=1,j<=Length[pdesc],j++,
If[pdesc[[j,3]]>1,
WriteString[spheno2LP,"end do\n"];]
 ];

];(* end for dcount=1 *)

];(* end for types=1 *)

Switch[nh,
1,
WriteString[spheno2LP,"! ----------------------------\n"];
WriteString[spheno2LP,"! ---- Final tadpole result --\n"];

WriteString[spheno2LP,"temptad=(temptad*oo16Pi2*oo16Pi2)+delta2ltadpoles\n"];
If[ngen>1,
WriteString[spheno2LP,"tad2L=matmul(temptad,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];,
WriteString[spheno2LP,"tad2L=temptad\n"];
];
WriteString[spheno2LP,"! ----------------------------\n"];

,
2,
If[ngen>1,
WriteString[spheno2LP,"do gE1=1,"<>tdimMatrix<>"\n"];
WriteString[spheno2LP,"Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"do gE2=1,gE1-1\n"];
WriteString[spheno2LP,"Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"Pi2S(gE2,gE1)=Pi2S(gE1,gE2)\n"];
WriteString[spheno2LP,"End do\nEnd do\n"];
WriteString[spheno2LP,"Pi2S=Pi2S+delta2lmasses\n"];
WriteString[spheno2LP,"Pi2S = Matmul(Pi2S,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];
WriteString[spheno2LP,"Pi2S = Matmul(Transpose("<>SPhenoForm[HiggsMixingMatrix]<>"),Pi2S)\n"];
,
WriteString[spheno2LP,"Pi2S(1,1)=tempcont(1,1)*oo16Pi2*oo16Pi2+delta2lmasses(1,1)\n"];
];

If[Length[IncludeOnlyInternals]!=0,WriteString[spheno2LP,"write(*,*) \"Result of Pi2S: \"\n"];
WriteString[spheno2LP,"write(*,*) Pi2S\n"];];

,
3,
If[ngen>1,
WriteString[spheno2LP,"do gE1=1,"<>tdimMatrix<>"\n"];
WriteString[spheno2LP,"Pi2P(gE1,gE1)=Pi2P(gE1,gE1)+tempcontah(gE1,gE1)*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"do gE2=1,gE1-1\n"];
WriteString[spheno2LP,"Pi2P(gE1,gE2)=Pi2P(gE1,gE2)+0.5_dp*(tempcontah(gE1,gE2)+tempcontah(gE2,gE1))*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"Pi2P(gE2,gE1)=Pi2P(gE1,gE2)\n"];
WriteString[spheno2LP,"End do\nEnd do\n"];
WriteString[spheno2LP,"Pi2P=Pi2P+delta2lmassesah\n"];
(**---now to "undiagonalise"----*)
If[ValueQ[PseudoScalarMixingMatrix],
WriteString[spheno2LP,"Pi2P = Matmul(Pi2P,"<>SPhenoForm[PseudoScalarMixingMatrix]<>")\n"];
WriteString[spheno2LP,"Pi2P = Matmul(Transpose("<>SPhenoForm[PseudoScalarMixingMatrix]<>"),Pi2P)\n"];
,
MyPSMixingMatrix=getMixingMatrix[PseudoScalar];
WriteString[spheno2LP,"Pi2P = Matmul(Pi2P,"<>SPhenoForm[MyPSMixingMatrix]<>")\n"];
WriteString[spheno2LP,"Pi2P = Matmul(Transpose("<>SPhenoForm[MyPSMixingMatrix]<>"),Pi2P)\n"];
];
,
If[ngen>0,WriteString[spheno2LP,"Pi2P(1,1)=tempcontah(1,1)*oo16Pi2*oo16Pi2+delta2lmassesah(1,1)\n"];];
];

If[Length[IncludeOnlyInternals]!=0,
WriteString[spheno2LP,"write(*,*) \"Result of Pi2P: \"\n"];
WriteString[spheno2LP,"write(*,*) Pi2P\n"];
];

];(* end switch nh*)


dynamic="Completed ("<>ToString[types-1]<>" of "<>ToString[ntypes]<>") topologies";

];

getneededtadpolemasses:=Block[{ii,mass,masss,thisshiftmatrix,ngen,part,sngen,type,mixedmasses,unmixedmasses},
mixedmasses=Select[ListTree,ContainsAny[#[[5]],ParametersToSolveTadpoles]&];
unmixedmasses=Select[listNotMixedMasses,ContainsAny[#[[3]],ParametersToSolveTadpoles]&];
relevanttreemasses={};
For[ii=1,ii<=Length[mixedmasses],ii++,
mass=mixedmasses[[ii,6]];
masss=ToString[mass];(*nb mass isn't zero if it's mixed!*)
part=ToExpression[StringDrop[ToString[mass],1]];
ngen=getGenSPheno[part];
thisshiftmatrix="tad1Lmatrix"<>ToString[part];
AppendTo[relevanttreemasses,{part,ngen,masss,thisshiftmatrix,mixedmasses[[ii,2]],mixedmasses[[ii,3]]}];
];
For[ii=1,ii<=Length[unmixedmasses],ii++,
part=unmixedmasses[[ii,1]];
mass=unmixedmasses[[ii,2]];
If[mass=!=0,
masss=ToString[mass];
ngen=getGenSPheno[part];
thisshiftmatrix="tad1Lmatrix"<>ToString[part];
AppendTo[relevanttreemasses,{part,ngen,masss,thisshiftmatrix,{},{{unmixedmasses[[ii,4]]}}}];
];
];
];


myindstring[inds_]:=Module[{coup,parts,indices,ordered,res},
parts=Transpose[inds][[1]];
indices=Transpose[inds][[2]];
coup=C[Sequence@@parts];
ordered=DeleteCases[TwoLMakeIndices[inds,coup][[1]],{}];
If[Length[ordered]>0,
res="("<>StringJoin@@Riffle[ToString/@Transpose[ordered][[2]],","]<>")";
,
res="";
];
Return[res];
];


Writegaugeless1L:=Block[{i,j,k,(*my1Ltads,gaugeless3Pcouplings,*)type,coup,ind1,sind1,m1,m12,ngen,ngen2,factor,ngtads,hbposintads},
tad2L1Ldyn="";
tot2L1dyn="";
ngtads=0;
Print["Writing 1L Gaugeless tadpoles: ",Dynamic[tot2L1dyn]," completed ",Dynamic[tad2L1Ldyn]];
WriteString[spheno2LP,"temptad(:) = 0._dp \n"];
ngen=getGenSPheno[HiggsBoson];
hbposintads=Position[ScalarsForTadpoles,HiggsBoson];
If[Length[hbposintads]!=1,
Print["Either the Higgs has no tadpole, or more than one!!\n"]];
my1Ltads=LoopCorrectionTadpoles[SA`CurrentStates][[hbposintads[[1,1]]]]//.{Cp[x__]->C[x],ToExpression["U"<>ToString[HiggsBoson]]->HiggsBoson};
(*gaugelesscouplings=Flatten[Join[SPhenoCouplings3P[[All,1]],specialPOLEverticesorg]];*)
gaugeless3Pcouplings=Flatten[SPhenoCouplings3P[[All,1]]];
For[i=1,i<=Length[my1Ltads],i++,
type=my1Ltads[[i,4]];
If[type===SSS||type===FFS,
coup=my1Ltads[[i,3]]/.{x_[{__}]->x};
If[!FreeQ[gaugeless3Pcouplings,coup],
ngtads++;
tot2L1dyn=ToString[ngtads];
m1=SPhenoMass[my1Ltads[[i,1]],i1];
tad2L1Ldyn="("<>ToString[my1Ltads[[i,1]]]<>")";
m12=SPhenoMassSq[my1Ltads[[i,1]],i1];
ngen2=getGenSPheno[my1Ltads[[i,1]]];
factor=2*my1Ltads[[i,6]]*my1Ltads[[i,5]];
If[Head[factor]===Integer,factor=1. factor;];
factor=SPhenoForm[factor];
sind1=myindstring[{{HiggsBoson,gE1},{my1Ltads[[i,1]],i1},{my1Ltads[[i,2]],i1}}];
If[ngen2>1,WriteString[spheno2LP,"  Do i1 = 1, "<>ToString[ngen2]<>"\n"];];
WriteString[spheno2LP,"A0m = "<>factor<>"*(-J0("<>m12<>",qscale)) \n"];
WriteString[spheno2LP,"  Do gE1 = 1, "<>dimMatrix<>"\n"];
WriteVertexToFile[1,twoloopgetSPhenoCouplingName[coup],{sind1,False},type,spheno2LP];
Switch[type,
SSS,
WriteString[spheno2LP,"   temptad(gE1) = temptad(gE1)-real(coup1*A0m,dp) \n"];
,
FFS,
WriteString[spheno2LP,"  temptad(gE1)  = temptad(gE1)+ 2._dp*"<>m1<>"*real((coup1L+coup1R)*A0m,dp) \n"];
];
WriteString[spheno2LP,"  End Do \n"];
If[ngen2>1,WriteString[spheno2LP,"  End do \n\n"];
];
];
];
];
If[ngen>1,
WriteString[spheno2LP,"tad1LG=matmul(temptad*oo16Pi2,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];
,
WriteString[spheno2LP,"tad1LG=temptad*oo16Pi2\n"];
];
WriteString[spheno2LP,"! ----------------------------\n"];
tad2L1Ldyn="";
];



Write1L2Lshifts:=Block[{i,j,k,ii,jj,ngen,(*relevanttreemasses,*)mass,masss,masss2,part,cpart,mpart1,mpart2,massmat,sngen,mixmat,ntads,linestring,deriv,linestub,linestubt,derivnonzero,thisshiftmatrix,ind1,ind2,ind4,coup,coup1,coup2,coup4,cname,cname1,cname2,cname4,indstring,indstring1,indstring2,indstring4,pos,factor,tadspresent,procmassel,pseudoselfs,npseudos,tempcontribs,ngen1,ngen2,cpart1,cpart2,massstr,tempsubsolutions,mconj},
If[Length[relevanttreemasses]>0,
Print["Calculating shifts to tadpoles and masses due to ",StringJoin@@Riffle[ToString/@Transpose[relevanttreemasses][[1]],", "]];
];
ntads=getGenSPheno[HiggsBoson];
If[AddPseudos,
npseudos=getGenSPheno[PseudoScalar];
pseudoselfs=Select[SelfEnergy1LoopList[SA`CurrentStates],#[[1]]===PseudoScalar&];
If[Length[pseudoselfs]>0,
pseudoselfs=Delete[pseudoselfs[[1]],1];
(*get in form of simple list without the Ah at the beginning*)];
];

Clear[mconj];
mconj[a_*b_]:=mconj[a]*mconj[b];
mconj[Tad1Loop[x_]]=Tad1Loop[x];

tempsubsolutions={};
For[k=1,k<=Length[ParametersToSolveTadpoles],k++,
AppendTo[tempsubsolutions,{L[ParametersToSolveTadpoles[[k]]]->L[ParametersToSolveTadpoles[[k]]],B[ParametersToSolveTadpoles[[k]]]->B[ParametersToSolveTadpoles[[k]]],T[ParametersToSolveTadpoles[[k]]]->T[ParametersToSolveTadpoles[[k]]]}];
];
AppendTo[tempsubsolutions,SubSolutionsTadpolesLoop];
tempsubsolutions=Flatten[tempsubsolutions];

For[ii=1,ii<=Length[relevanttreemasses],ii++,
part=relevanttreemasses[[ii,1]];
ngen=relevanttreemasses[[ii,2]];
sngen=ToString[ngen];
masss=relevanttreemasses[[ii,3]];
masss2=masss<>"2";
thisshiftmatrix=relevanttreemasses[[ii,4]];
mixmat=relevanttreemasses[[ii,5]];
massmat=relevanttreemasses[[ii,6]];
If[getType[part]===S,
cpart=conj[part];,
cpart=bar[part];
];
coup=C[HiggsBoson,part,cpart];
If[!FreeQ[gaugeless3Pcouplings,coup],
WriteString[spheno2LP,thisshiftmatrix<>"=0._dp\n"];
For[i=1,i<=ngen,i++,
For[j=i,j<=ngen,j++,
linestub=thisshiftmatrix<>"("<>ToString[i]<>","<>ToString[j]<>")";
derivnonzero=False;
procmassel=(relevanttreemasses[[ii,6,i,j]]/.tempsubsolutions/.subZeroGaugeLess);
procmassel=procmassel/.{conj[x__]->mconj[x]};
tadspresent=Union[Cases[procmassel,Tad1Loop[x_]->x,Infinity]];
For[k=1,k<=Length[tadspresent],k++,
deriv=Simplify[D[procmassel,Tad1Loop[tadspresent[[k]]]]]/.{Tad1Loop[x_]->0};
deriv=deriv//.{mconj[x__]->conj[x]};
If[deriv=!=0,
derivnonzero=True;
linestring=StringReplace[linestub<>"="<>linestub<>"+"<>ToString[FortranForm[deriv]]<>"*tad1LG("<>ToString[tadspresent[[k]]]<>")\n","+-"->"-"];
WriteString[spheno2LP,linestring];
];
];
(*For[k=1,k\[LessEqual]ntads,k++,
deriv=Simplify[D[massmat[[i,j]]//.SubSolutionsTadpolesLoop/.subZeroGaugeLess,Tad1Loop[k]]]/.{Tad1Loop[x_]\[Rule]0};
(*Print[massmat[[i,j]]//.SubSolutionsTadpolesLoop/.subZeroGaugeLess];*)
If[deriv=!=0,
derivnonzero=True;
linestring=StringReplace[linestub<>"="<>linestub<>"+"<>ToString[FortranForm[deriv]]<>"*tad1LG("<>ToString[k]<>")\n","+-"\[Rule]"-"];
WriteString[spheno2LP,linestring];
];
];*)
If[j!=i&&derivnonzero,
linestubt=thisshiftmatrix<>"("<>ToString[j]<>","<>ToString[i]<>")";
WriteString[spheno2LP,linestubt<>"=conjg("<>linestub<>")\n"];
];
];
];
If[ngen>1,
If[Length[mixmat]>1,
WriteString[spheno2LP,thisshiftmatrix<>"=matmul("<>ToString[mixmat[[1]]]<>",matmul("<>thisshiftmatrix<>",transpose(conjg("<>ToString[mixmat[[2]]]<>"))))\n"];
,
If[conj[part]=!=part&&FreeQ[realVar,mixmat],
WriteString[spheno2LP,thisshiftmatrix<>"=matmul("<>ToString[mixmat]<>",matmul("<>thisshiftmatrix<>",transpose(conjg("<>ToString[mixmat]<>"))))\n"];
,
WriteString[spheno2LP,thisshiftmatrix<>"=matmul("<>ToString[mixmat]<>",matmul("<>thisshiftmatrix<>",transpose("<>ToString[mixmat]<>")))\n"];
];
];
];
(*now to write the shifts to tadpoles/masses*)
pos=Position[Transpose[my1Ltads][[2]],RE[part]];
(*get the info about colour/symmetry factors from the tadpole array*)
If[Length[pos]>0,
(*first write tadpole shifts*)
factor=4*my1Ltads[[pos[[1,1]],6]]*my1Ltads[[pos[[1,1]],5]];
(*normalised to 1 for neutral real scalars*)
If[Head[factor]===Integer,
factor=1. factor;
];
factor=SPhenoForm[factor];
coup=my1Ltads[[pos[[1,1]],3]]/.{x_[{__}]->x};
indstring=myindstring[{{HiggsBoson,gE1},{part,i1},{cpart,i2}}];
cname=twoloopgetSPhenoCouplingName[coup];
WriteString[spheno2LP,"do i1=1,"<>ToString[ngen]<>"\n"];
WriteString[spheno2LP,"do i2=1,"<>ToString[ngen]<>"\n"];

Switch[my1Ltads[[pos[[1,1]],4]],
SSS,
If[ngen>1,
WriteString[spheno2LP," funcvalue= "<>thisshiftmatrix<>"(i2,i1)*"<>"BB("<>masss2<>"(i1),"<>masss2<>"(i2),qscale)\n"];,WriteString[spheno2LP," funcvalue= "<>thisshiftmatrix<>"(i2,i1)*"<>"BB("<>masss2<>","<>masss2<>",qscale)\n"];
];
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
WriteVertexToFile[1,cname,{indstring,False},my1Ltads[[pos[[1,1]],4]],spheno2LP];
WriteString[spheno2LP,"delta2Ltadpoles(gE1)=delta2Ltadpoles(gE1)+real(0.5_dp*coup1*"<>factor<>"*funcvalue,dp)\n"];
WriteString[spheno2LP,"end do\n"];
indstring4=myindstring[{{HiggsBoson,gE1},{HiggsBoson,gE2},{part,i1},{cpart,i2}}];
cname4=twoloopgetSPhenoCouplingName[C[HiggsBoson,HiggsBoson,part,cpart]];
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
WriteString[spheno2LP,"do gE2=1,"<>dimMatrix<>"\n"];
WriteVertexToFile[1,cname4,{indstring4,False},SSSS,spheno2LP];
WriteString[spheno2LP,"delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(0.5_dp*coup1*"<>factor<>"*funcvalue,dp)\n"];
WriteString[spheno2LP,"end do\n end do\n"];
];
(*Switch...*)
WriteString[spheno2LP,"end do \n end do\n"];
(*then write remaining higgs mass shifts*)
indstring2=myindstring[{{HiggsBoson,gE2},{part,i3},{cpart,i1}}];
WriteString[spheno2LP,"do i1=1,"<>ToString[ngen]<>"\n"];
WriteString[spheno2LP,"do i2=1,"<>ToString[ngen]<>"\n"];
WriteString[spheno2LP,"do i3=1,"<>ToString[ngen]<>"\n"];

Switch[my1Ltads[[pos[[1,1]],4]],
SSS,
If[ngen>1,
WriteString[spheno2LP," funcvalue= "<>thisshiftmatrix<>"(i2,i3)*"<>"CCtilde("<>masss2<>"(i1),"<>masss2<>"(i2),"<>masss2<>"(i3),qscale)\n"];
,
WriteString[spheno2LP," funcvalue= "<>thisshiftmatrix<>"(i2,i3)*"<>"CCtilde("<>masss2<>","<>masss2<>","<>masss2<>",qscale)\n"];
];
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
WriteString[spheno2LP,"do gE2=1,"<>dimMatrix<>"\n"];
WriteVertexToFile[1,cname,{indstring,False},SSS,spheno2LP];
WriteVertexToFile[2,cname,{indstring2,False},SSS,spheno2LP];
WriteString[spheno2LP,"delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(coup1*coup2*"<>factor<>"*funcvalue,dp)\n"];
WriteString[spheno2LP,"end do\n end do\n"];
];

(*Switch...*)
WriteString[spheno2LP,"end do \n end do\n end do\n"];
(*now for pseudoscalar bit*)
If[AddPseudos,
tempcontribs=Select[pseudoselfs,((RE[#[[1]]]==part||RE[#[[2]]]==part)&&#[[4]]===SSS)&];
For[jj=1,jj<=Length[tempcontribs],jj++,
If[tempcontribs[[jj,1]]===part, (*either real scalars or complex conjugates of each other in loop*)
mpart1=tempcontribs[[jj,1]];
mpart2=tempcontribs[[jj,2]];
,
mpart1=tempcontribs[[jj,2]];
mpart2=tempcontribs[[jj,1]];
];
cpart1=conj[mpart1];
cpart2=conj[mpart2];
coup=C[PseudoScalar,mpart1,mpart2];
If[!FreeQ[gaugeless3Pcouplings,coup],
ngen1=getGenSPheno[mpart1];
ngen2=getGenSPheno[mpart2];
indstring1=myindstring[{{PseudoScalar,gE1},{mpart2,i1},{mpart1,i2}}];
indstring2=myindstring[{{PseudoScalar,gE2},{cpart2,i1},{cpart1,i3}}];
cname=twoloopgetSPhenoCouplingName[coup];
WriteString[spheno2LP,"do i1=1,"<>ToString[ngen2]<>"\n"];
WriteString[spheno2LP,"do i2=1,"<>ToString[ngen1]<>"\n"];
WriteString[spheno2LP,"do i3=1,"<>ToString[ngen1]<>"\n"];
massstr=StringJoin@@Riffle[(ToString@SPhenoMassSq[#[[1]],#[[2]]])/.{"0."->"0._dp"}&/@{{mpart2,i1},{mpart1,i2},{mpart1,i3}},","]<>",Qscale)\n";
WriteString[spheno2LP," funcvalue= "<>thisshiftmatrix<>"(i2,i3)*CCtilde("<>massstr];
WriteString[spheno2LP,"do gE1=1,"<>dimMatrixAh<>"\n"];
WriteString[spheno2LP,"do gE2=1,"<>dimMatrixAh<>"\n"];
WriteVertexToFile[1,cname,{indstring1,False},SSS,spheno2LP];
WriteVertexToFile[2,cname,{indstring2,False},SSS,spheno2LP];
factor=4*tempcontribs[[jj,5]]*tempcontribs[[jj,6]];
If[RE[mpart1]=!=RE[mpart2],
(*special case where we will sum separately*)
factor=factor/2;
];
If[Head[factor]===Integer,factor=1. factor;];
factor=SPhenoForm[factor];
WriteString[spheno2LP,"delta2LmassesAh(gE1,gE2)=delta2LmassesAh(gE1,gE2)+real(coup1*coup2*"<>factor<>"*funcvalue,dp)\n"];
WriteString[spheno2LP,"end do\n end do\n"];
WriteString[spheno2LP,"end do \n end do\n end do\n"];
];
];
];
(*
indstring4=myindstring[{{HiggsBoson,gE1},{HiggsBoson,gE2},{part,i1},{cpart,i2}}];
cname4=twoloopgetSPhenoCouplingName[C[HiggsBoson,HiggsBoson,part,cpart]];
WriteString[spheno2LP,"do i1=1,"<>ToString[ngen]<>"\n"];
WriteString[spheno2LP,"do i2=1,"<>ToString[ngen]<>"\n"];
Switch[my1Ltads[[pos[[1,1]],4]],
SSS,
If[ngen>1,
WriteString[spheno2LP," funcvalue= BB("<>masss2<>"(i1),"<>masss2<>"(i2),qscale)\n"];
,
WriteString[spheno2LP," funcvalue= BB("<>masss2<>","<>masss2<>",qscale)\n"];
];
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
WriteString[spheno2LP,"do gE2=1,"<>dimMatrix<>"\n"];
WriteVertexToFile[1,cname4,{indstring4,False},SSSS,spheno2LP];
WriteString[spheno2LP,"delta2Lmasses(gE1,gE2)=delta2Lmasses(gE1,gE2)+real(0.5_dp*coup1*"<>thisshiftmatrix<>"(i2,i1)*"<>factor<>"*funcvalue,dp)\n"];
WriteString[spheno2LP,"end do\n end do\n"];
];
(*Switch...*)
WriteString[spheno2LP,"end do \n end do\n"];*)
];
(*If[Length[pos]>0,*)];
];
WriteString[spheno2LP,"delta2Ltadpoles=delta2Ltadpoles*oo16Pi2\n"];
WriteString[spheno2LP,"delta2Lmasses=delta2Lmasses*oo16Pi2\n"];
WriteString[spheno2LP,"delta2LmassesAh=delta2LmassesAh*oo16Pi2\n"];
WriteString[spheno2LP,"! ----------------------------\n"];
Clear[mconj];
];


