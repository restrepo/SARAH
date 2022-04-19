(* ::Package:: *)

(* ::Input::Initialization:: *)
Calc2LoopCorrections[states_]:=Block[{i,ii,sstates},Print["Calculating 2 loop corrections"];
sstates=ToString[states];
SA`CurrentStates=states;
StringReplaceFinal={};
SPhenoParameters={};
temp=Select[VertexListNonCC,(#[[-1]]===SSSS||#[[-1]]===SSVV)&];(*extract all 4-vertices with scalars*)temp=Select[temp,((Length[Intersection[RE/@(#[[1,1]]/.A_[{b__}]->A)]]<3)&&(Mod[Count[RE/@(#[[1,1]]/.A_[{b__}]->A),RE[(#[[1,1,1]]/.A_[{b__}]->A)]],2]=!=1))&];(*take only those vertices which have 2 pairs of identical fields*)CouplingUsedForEffPot=True;
dataUnBrokenGaugeGroups={#,Gauge[[#,3]],Gauge[[#,4]],SGauge[[#]]/.A_[{b__}]->A,getDimFundamental[Gauge[[#,2]]],getDimAdjoint[Gauge[[#,2]]]}&/@(Position[SGauge/.A_[{b__}]->A,#][[1,1]]&/@Select[SGauge/.A_[{b__}]->A,FreeQ[Particles[SA`CurrentStates],#]==False&]);
subfourpoint={};
For[ii=1,ii<=Length[dataUnBrokenGaugeGroups],ii++,namestub=StringTake[ToString[dataUnBrokenGaugeGroups[[ii,2]]],1];
AppendTo[subfourpoint,ToExpression[namestub<>"t"<>"3"]->ToExpression[namestub<>"t"<>"1"]];
AppendTo[subfourpoint,ToExpression[namestub<>"t"<>"4"]->ToExpression[namestub<>"t"<>"2"]];];
listBrokenGaugeCouplings=Table[SA`ListGaugeMixed[[i,2,2]],{i,1,Length[SA`ListGaugeMixed]}];
For[i=1,i<=Length[dataUnBrokenGaugeGroups],i++,listBrokenGaugeCouplings=DeleteCases[listBrokenGaugeCouplings,dataUnBrokenGaugeGroups[[i,3]]]];
subZeroGaugeLess=Table[listBrokenGaugeCouplings[[i]]->0,{i,1,Length[listBrokenGaugeCouplings]}];
AllRelevant=getAllRelevantCouplings[VertexListNonCC];
AllRelevant=Select[AllRelevant/.subZeroGaugeLess,If[Length[#[[1]]]===3,(#[[1,2,1]]=!=0)||(#[[1,3,1]]=!=0),#[[1,2,1]]=!=0]&];
temp=SPhenoCouplingList[AllRelevant];
SPhenoCouplings3P=temp[[1]];
temp=Select[VertexListNonCC,(#[[-1]]===SSSS)&];
(*extract all 4-vertices with scalars only,drop the ones with vectors*)temp=Select[temp/.subZeroGaugeLess,#[[1,2,1]]=!=0&];
specialPOLEvertices={};
Block[{tt,mi,mj,mk,tttt2,tttt3,POLEstructures,inner,outer},
specialPOLEvertices=Reap[For[mi=1,mi<=Length[temp],mi++,
Sow[Reap[Sow[{temp[[mi,1,1]]}];
(*entries start with the particles in the coupling,then a list of group structures*)
For[mj=1,mj<=Length[dataUnBrokenGaugeGroups],mj++,
tt=ExtractStructure[temp[[mi,1,2,1]],dataUnBrokenGaugeGroups[[mj,2]]];
tttt2=Select[tt,#[[2]]=!=0&];
POLEstructures=Table[tttt2[[mk,1]],{mk,1,Length[tttt2]}];
Sow[POLEstructures]];][[2,1]](*end inner reap*)];] (*end for...*)][[2,1]];(*end outer Reap*)
specialPOLEverticesorg=Table[C@@specialPOLEvertices[[mi,1,1]]/.{A_[{___}]->A},{mi,1,Length[specialPOLEvertices]}];];
CouplingsFor2LPole=True;
temp2=SPhenoCouplingList4ptPOLE[temp];
CouplingUsedFor2LPole=False;
SPhenoCouplings4Pole=temp2[[1]];
$sarahCurrentOutputDir=ToFileName[{$sarahCurrentOutputMainDir,sstates}];
$sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}];
$sarahStoreTwoLoopDir=ToFileName[{$sarahCurrentOutputDir,"Two-Loop"}];
If[FileExistsQ[$sarahStoreTwoLoopDir]=!=True,CreateDirectory[$sarahStoreTwoLoopDir]];
ListAllParticles=Particles[states];
AllScalars=Select[ListAllParticles,#[[4]]===S&];
AllFermions=Select[ListAllParticles,#[[4]]===F&];
AllDiracFermions=getDiracFermionList;
DiracList={#[[1]],#[[6]]}&/@AllDiracFermions;
generate2LPoleFunctions
];



InitDiagramGeneration2L:=Block[{i,j,k,l,temp,pos},
OneKnown2L={};
TwoKnown2L={};
ThreeKnown2L={};
OneKnownIns2L={};
TwoKnownIns2L={};
ThreeKnownIns2L={};
(*Not backwards compatible with Mathematica<10.4*)
(*
VertexList2L=Join[Complement[Extract[SPhenoCouplings3P,{All,1,1}],{C[PseudoScalar,PseudoScalar,PseudoScalar],C[PseudoScalar,HiggsBoson,HiggsBoson]}],Extract[SPhenoCouplings4Pole,{All,1,1}]];
*)
VertexList2L=Join[Complement[SPhenoCouplings3P[[1;;,1,1]],{C[PseudoScalar,PseudoScalar,PseudoScalar],C[PseudoScalar,HiggsBoson,HiggsBoson]}],SPhenoCouplings4Pole[[1;;,1,1]]];

temp=VertexList2L/.{C[x__]->{x}};
For[i=1,i<=Length[temp],For[j=1,j<=Length[temp[[i]]],If[FreeQ[OneKnownIns2L,C[temp[[i,j]]]],OneKnown2L=Join[OneKnown2L,{Delete[temp[[i]],j]}];
OneKnownIns2L=Join[OneKnownIns2L,{C[temp[[i,j]]]}];,pos=Position[OneKnownIns2L,C[temp[[i,j]]],1,1][[1,1]];
OneKnown2L[[pos]]=Join[OneKnown2L[[pos]],Delete[temp[[i]],j]];];
For[k=j+1,k<=Length[temp[[i]]],If[FreeQ[TwoKnownIns2L,C[temp[[i,j]],temp[[i,k]]]],TwoKnown2L=Join[TwoKnown2L,{Delete[temp[[i]],{{j},{k}}]}];
TwoKnownIns2L=Join[TwoKnownIns2L,{C[temp[[i,j]],temp[[i,k]]]}];,pos=Position[TwoKnownIns2L,C[temp[[i,j]],temp[[i,k]]],1,1][[1,1]];
TwoKnown2L[[pos]]=Join[TwoKnown2L[[pos]],Delete[temp[[i]],{{j},{k}}]];];
For[l=k+1,l<=Length[temp[[i]]],If[FreeQ[ThreeKnownIns2L,C[temp[[i,j]],temp[[i,k]],temp[[i,l]]]],ThreeKnown2L=Join[ThreeKnown2L,{Delete[temp[[i]],{{j},{k},{l}}]}];
ThreeKnownIns2L=Join[ThreeKnownIns2L,{C[temp[[i,j]],temp[[i,k]],temp[[i,l]]]}];,pos=Position[ThreeKnownIns2L,C[temp[[i,j]],temp[[i,k]],temp[[i,l]]],1,1][[1,1]];
ThreeKnown2L[[pos]]=Join[ThreeKnown2L[[pos]],Delete[temp[[i]],{{j},{k},{l}}]];];
l++;];
k++;];
j++;];
i++;];
OneKnown2L=Intersection/@OneKnown2L;
TwoKnown2L=Intersection/@TwoKnown2L;
ThreeKnown2L=Intersection/@ThreeKnown2L;
Diag2Linitiated=True;
];

InsFields2L[process_]:=Block[{i},
DiagramList2L={};
listparts={};
AddFieldToDiagram2L[process];
Return[DiagramList2L];];


AddFieldToDiagram2L[process_]:=Block[{pos,possFields,i,possFieldsSub,newProcess,parts,conjparts},
currentInsertion=Cases[process,FieldToInsert[_],3,1][[1]];
pos=Position[process[[1]],currentInsertion];
For[i=1,i<=Length[pos],
currentVertex=Extract[process[[1]],pos[[i,1]]];
If[Length[pos[[i]]]==2,
If[i==1,
possFields=getPossibleFields2L[currentVertex];
,
possFields=Intersection[possFields,getPossibleFields2L[currentVertex]];
];
,
If[i==1,
possFields=AntiField/@getPossibleFields2L[currentVertex];
,
possFields=Intersection[possFields,AntiField/@getPossibleFields2L[currentVertex]];
];
];
i++;
];
If[Length[possFields]>0,
possFieldsSub=Flatten[Table[{currentInsertion->possFields[[i]]},{i,1,Length[possFields]}]];
For[i=1,i<=Length[possFieldsSub],
newProcess=process/.possFieldsSub[[i]];

Switch[CheckVertex2L[newProcess],
Finished,
parts=DeleteCases[{Internal[1]/.newProcess[[2]],Internal[2]/.newProcess[[2]],Internal[3]/.newProcess[[2]],Internal[4]/.newProcess[[2]],Internal[5]/.newProcess[[2]]},Internal[_]];
conjparts=myconj[parts];
If[FreeQ[listparts,parts]&&FreeQ[listparts,conjparts],
DiagramList2L=Join[DiagramList2L,{newProcess}];
AppendTo[listparts,parts];
];
,
GoOn,
AddFieldToDiagram2L[newProcess];
];
i++
];
];
];



CheckVertex2L[process_]:=Block[{goOn,i},
finishedVertices=Cases[process[[1]],x_?FieldToInsertQ,1];
If[Length[finishedVertices]==0,
Return[GoOn];
,
goOn=True;
For[i=1,i<=Length[finishedVertices],
If[FreeQ[VertexList2L,finishedVertices[[i]]],
goOn=False;
];
i++;
];
If[goOn==True,
If[Length[finishedVertices]==Length[process[[1]]],
Return[Finished];,
Return[GoOn];
];
,
Return[stop];
];
];
];

getPossibleFields2L[vertex_]:=Block[{temp,pos},temp=DeleteCases[vertex,FieldToInsert[_]];
temp=DeleteCases[temp,AntiField[FieldToInsert[_]]];
Switch[Length[temp],0,Return[OneKnownIns2L/.C->Plus];,1,pos=Position[OneKnownIns2L,temp,1,1];
If[pos=!={},Return[Extract[OneKnown2L,pos[[1,1]]]];,Return[{}];];,2,pos=Position[TwoKnownIns2L,temp,1,1];
If[pos=!={},Return[Extract[TwoKnown2L,pos[[1,1]]]];,Return[{}];];,3,pos=Position[ThreeKnownIns2L,temp,1,1];
If[pos=!={},Return[Extract[ThreeKnown2L,pos[[1,1]]]];,Return[{}];];];];



mhpolegetcolour[orderedsetsofparticles_]:=Module[{i,j,k,ncs,vertex,templistoffields,pos,fieldsordered,AllIndices,colourFunctions,nfs,res,tosum,newcolourfuncs,tfunc,tempcords,couplengths,topologytag,Sun3,Sun4,Sun34,Bub,tindices,referencevertex,gaugegroups,gaugeindices,cgsub,tempstruct,sumline,fourindices,foursums,gaugestub,sub4,vertinds,itosum,itosub,pair1,pair2},

(*------------------------------------

Function to compute colour factors of two loop diagrams.
Function takes sets of particles grouped into vertices in format 
{
{{p11,index11},{p12,index12},...},
{{p21,index21},{p22,index22},...},
...,
} 
and returns a single number.

-----------------------------------------*)


cgsub={CG[SU[3],{{0,1},{1,0},{1,1}}][a_,b_,c_]->Lam[c,b,a]/2,CG[SU[3],{{0,1},{1,1},{1,0}}][a_,b_,c_]->Lam[b,c,a]/2,CG[SU[3],{{1,1},{0,1},{1,0}}][a_,b_,c_]->Lam[a,c,b]/2,CG[SU[3],{{1,0},{0,1},{1,1}}][a_,b_,c_]->Lam[c,a,b]/2,CG[SU[3],{{1,0},{1,1},{0,1}}][a_,b_,c_]->Lam[b,a,c]/2,CG[SU[3],{{1,1},{1,0},{0,1}}][a_,b_,c_]->Lam[a,b,c]/2};
{Sun3,Sun4,Sun34,Bub}={"Sun3","Sun4","Sun34","Bub"};
colourFunctions=1;
ncs=Length[orderedsetsofparticles];
couplengths=Length/@orderedsetsofparticles;
sub4={};

If[FreeQ[couplengths,4],
topologytag=Sun3;(*Only three-point couplings \[Rule] sunset topology *)
For[i=1,i<=ncs,i++,
tindices=Transpose[orderedsetsofparticles[[i]]][[2]];
If[FreeQ[tindices,gE1]&&FreeQ[tindices,gE2],
referencevertex=i;
Break[];
];
]; 
(* Corresponds to V, M, T_SSSS *)
, 
(* Must see whether there is a four-point coupling with only internal indices *)
pos=Position[couplengths,4];
topologytag=Sun34;
For[i=1,i<=Length[pos],i++,
tindices=Transpose[orderedsetsofparticles[[pos[[i,1]]]]][[2]];
If[FreeQ[tindices,gE1]&&FreeQ[tindices,gE2],
topologytag=Bub;
referencevertex=pos[[i,1]];
Break[];
];
]; (* end For[i=1,... *)

If[topologytag===Sun34,(* i.e. if we don't have a nice bubble *)
If[FreeQ[couplengths,3],(*We actually have the awkward topology S *)
topologytag=Sun4;
referencevertex=1;
,

pos=Position[couplengths,3];
For[i=1,i<=Length[pos],i++,
tindices=Transpose[orderedsetsofparticles[[pos[[i,1]]]]][[2]];
If[FreeQ[tindices,gE1]&&FreeQ[tindices,gE2],
referencevertex=pos[[i,1]];
Break[];
];
]; (* end For[i=1,... *)

];(* end freeq[...,3]*)

]; (* end If[topologyrag ...*)
]; (* end freeq[...,4]*)

templistoffields=Transpose[orderedsetsofparticles[[referencevertex]]][[1]];

If[couplengths[[referencevertex]]==4,
pos=Position[specialPOLEverticesorg,C@@templistoffields];
vertex=specialPOLEvertices[[pos[[1,1]]]]/.{Lam[a__]->Lam[a]/2}/.cgsub;
fieldsordered=specialPOLEvertices[[pos[[1,1]],1,1]];
,
(* three-point vertex*)
pos=Position[VerticesInv[All],C@@templistoffields];
fieldsordered=VerticesOrg[All][[pos[[1,1]]]];
vertex=VerticesVal[All][[pos[[1,1]]]];
vertex=First[Flatten[vertex]];
]; (* end If[couplengths *)

templistoffields=fieldsordered/.{A_[{x__}]->A};
AllIndices=getIndizesWI/@templistoffields;
gaugeindices=DeleteCases[DeleteCases[AllIndices,{generation,_},3],{lorentz,_},3];
If[Length[Flatten[gaugeindices]]==0,Return[1]];(* If there are no indices to sum then just return 1 *)

gaugegroups=Intersection[Transpose[Flatten[gaugeindices,1]][[1]]];

vertinds=DeleteCases[(RE/@fieldsordered)/.{A_[{x__}]->{x}},Alternatives@@{gt1,gt2,gt3,gt4,lt1,lt2,lt3,lt4},2];

If[topologytag=!=Bub,
sumline=Reap[
For[i=1,i<=Length[vertinds],i++,
For[j=1,j<=Length[vertinds[[i]]],j++,
Sow[{vertinds[[i,j]],1,gaugeindices[[i,j,2]]}];
]]][[2,1]];
sub4={};
];

Switch[topologytag,
Bub,
(* do the sum over one four-point vertex, multiplied over all structures *)
tosum=1;
For[i=2,i<=Length[vertex],i++,
If[Length[vertex[[i]]]>1,(* multiple colour structures \[Rule] already summed over *)
Return[1];
,
tosum*=vertex[[i,1]];
];
];(* end For *)
(* First work out which pairs there are *)
i=1;
While[gaugeindices[[i]]=={}&&i<5,i++];
j=i+1;

While[j<5&&conj[templistoffields[[j]]]=!=templistoffields[[i]],j++];

	(*Catch the cases when there are no conjugates:we just need to find the other field with matching indices since we assume that there can only be one possible pairing of indices,otherwise will have more than one colour structure\[Rule]to modify,maybe*)
If[j==5,
j=i+1;
While[j<5&&gaugeindices[[j]]=!=gaugeindices[[i]],j++];
If[j==5,
Print["Warning: problem with extracting colour factor!",orderedsetsofparticles];
];
];


pair1={i,j};
pair2=DeleteCases[{1,2,3,4},i|j];
itosum={i,First[pair2]};
itosub={j,pair2[[2]]};

sumline=Reap[
For[k=1,k<=2,k++,
For[l=1,l<=Length[vertinds[[itosum[[k]]]]],l++,
Sow[{vertinds[[itosum[[k]],l]],1,gaugeindices[[itosum[[k]],l,2]]}];
]]][[2,1]];


sub4=Flatten[Reap[
For[k=1,k<=2,k++,
For[l=1,l<=Length[vertinds[[itosub[[k]]]]],l++,
Sow[{vertinds[[itosub[[k]],l]]->vertinds[[itosum[[k]],l]]}];
]]][[2,1]]];	



,
Sun4,(* do the sum over two four-point vertices, assuming a simple structure *)
tosum=1;
For[i=2,i<=Length[vertex],i++,
tosum*=(vertex[[i,1]]*conj[vertex[[i,1]]]);
];
,
_,
(* do the sum over two three-point vertices, assuming a simple structure *)
tosum=1;
For[i=1,i<=Length[gaugegroups],i++,
tempstruct=ExtractStructure[vertex,gaugegroups[[i]]][[1,1]]/.{Lam[a__]->Lam[a]/2}/.cgsub;
tosum*=(tempstruct*conj[tempstruct]);
];


];(* end Switch[topologytag *)

(* Now to evaluate the sum *)
res=Sum[tosum//.sub4,Evaluate[Sequence@@sumline]];
Return[res]

]; (* end module*)

GenerateW[field_]:=Block[{topW,insW},topW={{C[field,field,FieldToInsert[1],FieldToInsert[2]],C[AntiField@FieldToInsert[1],FieldToInsert[3],FieldToInsert[4]],C[AntiField@FieldToInsert[2],AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->field,External[2]->field}};
insW=InsFields2L[topW];
Return[insW]];

GenerateX[field_]:=Block[{topX,insX},topX={{C[field,field,FieldToInsert[1],FieldToInsert[2]],C[AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],FieldToInsert[3],AntiField@FieldToInsert[3]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],External[1]->field,External[2]->field}};
insX=InsFields2L[topX];
Return[insX]];


GenerateY[field_]:=Block[{topY,insY},topY={{C[field,FieldToInsert[1],FieldToInsert[2]],C[field,AntiField@FieldToInsert[1],FieldToInsert[3]],C[AntiField@FieldToInsert[2],AntiField@FieldToInsert[3],FieldToInsert[4],AntiField@FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->field,External[2]->field}};
insY=InsFields2L[topY];
Return[insY]];

GenerateZ[field_]:=Block[{topZ,insZ},topZ={{C[field,FieldToInsert[1],FieldToInsert[2]],C[field,FieldToInsert[3],FieldToInsert[4]],C[AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->field,External[2]->field}};
insZ=InsFields2L[topZ];
Return[insZ]];


GenerateS[field_]:=Block[{topS,insS},topS={{C[field,FieldToInsert[1],FieldToInsert[2],FieldToInsert[3]],C[field,AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],AntiField@FieldToInsert[3]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],External[1]->field,External[2]->field}};
insS=InsFields2L[topS];
Return[insS]];


GenerateU[field_]:=Block[{topU,insU},topU={{C[field,FieldToInsert[1],FieldToInsert[2]],C[field,AntiField@FieldToInsert[1],FieldToInsert[3],FieldToInsert[4]],C[AntiField@FieldToInsert[2],AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->field,External[2]->field}};
insU=InsFields2L[topU];
Return[insU]];


GenerateV[field_]:=Block[{topV,insV},topV={{C[field,FieldToInsert[1],FieldToInsert[2]],C[field,AntiField@FieldToInsert[1],FieldToInsert[3]],C[AntiField@FieldToInsert[2],FieldToInsert[4],FieldToInsert[5]],C[AntiField@FieldToInsert[3],AntiField@FieldToInsert[4],AntiField@FieldToInsert[5]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],Internal[5]->FieldToInsert[5],External[1]->field,External[2]->field}};
insV=InsFields2L[topV];
Return[insV]];


GenerateM[field_]:=Block[{topM,insM},topM={{C[field,FieldToInsert[1],FieldToInsert[3]],C[field,FieldToInsert[2],FieldToInsert[4]],C[AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],FieldToInsert[5]],C[AntiField@FieldToInsert[3],AntiField@FieldToInsert[4],AntiField@FieldToInsert[5]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],Internal[5]->FieldToInsert[5],External[1]->field,External[2]->field}};
insM=InsFields2L[topM];
Return[insM]];





POLEtypes[diag_]:=Module[{i,ps,psT,templen,type,remainders,nrems,nscalars,nvectors,nfermions,stringtype},ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
psT=getType/@ps;
If[FreeQ[psT,G]==False,type=Discard;Return[type]];
templen=Length[psT];
remainders=DeleteCases[psT,S];
nrems=Length[remainders];
nscalars=templen-nrems;
If[nrems==0,Switch[nscalars,2,type=SS,3,type=SSS,4,type=SSSS,5,type=SSSSS,_,type=Discard],nfermions=Length[Select[remainders,#==F&]];
nvectors=templen-nscalars-nfermions;
If[nvectors>1,type=Discard;Return[type]];
If[nrems==1&&nvectors==1,Switch[nscalars,3,type=SSSV,4,type=SSSSV,_,type=Discard],stringtype="";
For[i=1,i<=nscalars,i++,stringtype=stringtype<>"S"];
For[i=1,i<=nfermions,i++,stringtype=stringtype<>"F"];
If[nvectors==1,stringtype=stringtype<>"V"];
type=ToExpression[stringtype];];];
Return[type];];

POLEordertypes[diag_]:=Module[{i,ps,psT,type,stringtype},ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
psT=getType/@ps;
stringtype="";
If[FreeQ[psT,G]==False,type=Discard;Return[type]];
For[i=1,i<=Length[psT],i++,stringtype=stringtype<>ToString[psT[[i]]];];
type=ToExpression[stringtype];
Return[type];];


PDiracQ[p_]:=Block[{temp},temp=Select[DiracList,#[[1]]===(p/.{conj[a_]->a,bar[a_]->a})&];
If[!temp==={},If[temp[[1,2]]===2,Return[True]];];
Return[False];];


myconj[ps_]:=Module[{psT,i,res,pt},psT=getType/@ps;
res={};
For[i=1,i<=Length[ps],i++,Switch[psT[[i]],S,pt=conj[ps[[i]]],F,pt=bar[ps[[i]]],V,pt=ps[[i]],G,pt=conj[ps[[i]]]];
AppendTo[res,pt];];
Return[res];];

myMatchQ[a__,b__]:=Module[{res,i,j,tempa,tempb},res=True;
tempa=a;
tempb=b;
If[Length[a]==0,If[a===b,Return[True],Return[False]]];
For[i=1,i<=Length[a],i++,If[Length[a[[i]]]==0,If[a[[i]]=!=b[[i]],Return[False]];,tempa=a[[i]];
tempb=b[[i]];
For[j=1,j<=Length[b[[i]]],j++,tempa=DeleteCases[tempa,tempb[[j]],1,1]];
If[tempa!={},Return[False]];];];
Return[res]];

SetAttributes[{delconj},{HoldAll}];
delconj[diags_]:=diags;

(*
delconj[diags_]:=Module[{i,j,diag,outdiags,listparts,ps,conjps,sps,scps,FoundMatch,oudtcouplings,tempcouplings,conjtempcouplings,possiblematchingdiags},listparts={};
outdiags={};
listparts={};
For[i=1,i\[LessEqual]Length[diags],i++,diag=diags[[i]];
ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];

conjps=myconj[ps];
sps=ps;
scps=conjps;
If[FreeQ[listparts,sps]&&FreeQ[listparts,scps],
AppendTo[outdiags,diag];
AppendTo[listparts,{sps}]
];
];
Return[outdiags];
];
*)

(*
delconj[diags_]:=Module[{i,j,diag,outdiags,listparts,ps,conjps,sps,scps,FoundMatch,outcouplings,tempcouplings,conjtempcouplings,possiblematchingdiags},listparts={};
outdiags={};
listparts={};
For[i=1,i\[LessEqual]Length[diags],i++,diag=diags[[i]];
ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
conjps=myconj[ps];
sps=Sort[ps];
scps=Sort[conjps];
If[FreeQ[listparts,sps]&&FreeQ[listparts,scps],AppendTo[outdiags,diag];
AppendTo[listparts,{sps,Length[outdiags]}],(*------We may still have a non-equivalent diagram:check for those with the same internals---*)possiblematchingdiags=Union[Position[listparts,sps],Position[listparts,scps]];
FoundMatch=False;
tempcouplings=diag[[1]];
conjtempcouplings=myconj/@(tempcouplings/.{C[x__]\[Rule]{x}});
For[j=1,j\[LessEqual]Length[possiblematchingdiags],j++,outcouplings=outdiags[[possiblematchingdiags[[j,1]],1]];
If[MatchQ[outcouplings,tempcouplings]||myMatchQ[outcouplings/.{C[x__]\[Rule]{x}},conjtempcouplings],FoundMatch=True;Break[];];];
If[FoundMatch\[Equal]False,AppendTo[outdiags,diag];
AppendTo[listparts,{sps,Length[outdiags]}]];];];
Return[outdiags];];
*)

POLEorderVFFFFS[diag_]:=Module[{i,ps,result},(*This corrects the ordering of the internals for diagrams of type V_FFFFS*)ps={Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]};
If[getType[ps[[5]]]===S,result=diag;,(*Otherwise swap 4& 5*)result={diag[[1]],{Internal[1]->ps[[1]],Internal[2]->ps[[2]],Internal[3]->ps[[3]],Internal[4]->ps[[5]],Internal[5]->ps[[4]]}};];
Return[result]];


Classify2LPdiagrams[field_]:=Block[{diagsS,diagsX,diagsW,listWoSSSS,listXoSSS,listSoSSS,res,ddata},ddata={};(*STORES GLOBAL INFO FOR DIAGRAMS*)(*SCALAR ONLY DIAGRAMS*)
If[Diag2Linitiated=!=True,
InitDiagramGeneration2L;
];
diagsW=GenerateW[field];
listWoSSSS={WoSSSS,delconj[Select[diagsW,POLEordertypes[#]===SSSS&]]};
AppendTo[ddata,{WoSSSS,{pfuncstring->"WfSSSS",pprefactor->1/4,topdata->{{{field,gE1},{field,gE2},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}}}}];
diagsX=GenerateX[field];
listXoSSS={XoSSS,delconj[Select[diagsX,POLEordertypes[#]===SSS&]]};
AppendTo[ddata,{XoSSS,{pfuncstring->"XfSSS",pprefactor->1/4,topdata->{{{field,gE1},{field,gE2},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[3],i3},{AntiField@Internal[3],i3}}}}}];
diagsY=GenerateY[field];
listYoSSSS={YoSSSS,delconj[Select[diagsY,POLEordertypes[#]===SSSS&]]};
AppendTo[ddata,{YoSSSS,{pfuncstring->"YfSSSS",pprefactor->1/2,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{Internal[4],i4},{AntiField@Internal[4],i4}}}}}];
diagsZ=GenerateZ[field];
listZoSSSS={ZoSSSS,delconj[Select[diagsZ,POLEordertypes[#]===SSSS&]]};
AppendTo[ddata,{ZoSSSS,{pfuncstring->"ZfSSSS",pprefactor->1/4,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}}}}];
diagsS=GenerateS[field];
listSoSSS={SoSSS,delconj[Select[diagsS,POLEordertypes[#]===SSS&]]};
AppendTo[ddata,{SoSSS,{pfuncstring->"SfSSS",pprefactor->1/6,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2},{Internal[3],i3}},{{field,gE2},{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{AntiField@Internal[3],i3}}}}}];
diagsU=GenerateU[field];
listUoSSSS={UoSSSS,delconj[Select[diagsU,POLEordertypes[#]===SSSS&]]};
AppendTo[ddata,{UoSSSS,{pfuncstring->"UfSSSS",pprefactor->1,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}}}}];
diagsV=GenerateV[field];
listVoSSSSS={VoSSSSS,delconj[Select[diagsV,POLEordertypes[#]===SSSSS&]]};
AppendTo[ddata,{VoSSSSS,{pfuncstring->"VfSSSSS",pprefactor->1/2,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}}}}];
diagsM=GenerateM[field];
listMoSSSSS={MoSSSSS,delconj[Select[diagsM,POLEordertypes[#]===SSSSS&]]};
AppendTo[ddata,{MoSSSSS,{pfuncstring->"MfSSSSS",pprefactor->1/2,topdata->{{{field,gE1},{Internal[1],i1},{Internal[3],i3}},{{field,gE2},{Internal[2],i2},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}}}}];
(*SCALARS AND VECTORS*)listWoSSSV={WoSSSV,Select[diagsW,POLEtypes[#]===SSSV&]};
AppendTo[ddata,{WoSSSV,{pfuncstring->"WfSSSV",pprefactor->1/2,topdata->{{{field,gE1},{field,gE2},{Internal[1],i1},{AntiField@Internal[1],i1}}}}}];
listMoSSSSV={MoSSSSV,Select[diagsM,POLEtypes[#]===SSSSV&]};
AppendTo[ddata,{MoSSSSV,{pfuncstring->"MfSSSSV",pprefactor->1/2,topdata->{{{field,gE1},{Internal[1],i1},{Internal[3],i2}},{{field,gE2},{AntiField@Internal[1],i1},{AntiField@Internal[3],i2}}}}}];
(*SCALARS AND FERMIONS*)listWoSSFF={WoSSFF,delconj[Select[diagsW,POLEordertypes[#]===SSFF&]]};
AppendTo[ddata,{WoSSFF,{topdata->{{{field,gE1},{field,gE2},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}},(*first combination*){{pfuncstring->"WfSSFbFb",pprefactor->1/2,pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{0,L,L}},(*second combo*){pfuncstring->"WfSSFF",pprefactor->1/2,pfermionmasses->{},pcouplingtypes->{0,L,R}}}}}];
listMoFFFFS={MoFFFFS,delconj[Select[diagsM,POLEordertypes[#]===FFFFS&]]};
AppendTo[ddata,{MoFFFFS,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[3],i3}},{{field,gE2},{Internal[2],i2},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},{{pfuncstring->"MfFbFbFbFbS",pprefactor->1,pfermionmasses->{{Internal[1],i1},{Internal[2],i2},{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,L,L,L}},{pfuncstring->"MfFFbFbFS",pprefactor->2,pfermionmasses->{{Internal[2],i2},{Internal[3],i3}},pcouplingtypes->{L,R,R,L}},{pfuncstring->"MfFFbFFbS",pprefactor->2,pfermionmasses->{{Internal[2],i2},{Internal[4],i4}},pcouplingtypes->{L,R,R,R}},{pfuncstring->"MfFFFbFbS",pprefactor->2,pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,L,R,L}},{pfuncstring->"MfFFFFS",pprefactor->1,pfermionmasses->{},pcouplingtypes->{L,L,R,R}}}}}];
listMoSFSFF={MoSFSFF,delconj[Select[diagsM,POLEordertypes[#]===SFSFF&]]};
AppendTo[ddata,{MoSFSFF,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[3],i3}},{{field,gE2},{Internal[2],i2},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},{{pfuncstring->"MfSFbSFbFb",pprefactor->2,pfermionmasses->{{Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},pcouplingtypes->{0,L,L,L}},{pfuncstring->"MfSFSFbF",pprefactor->4,pfermionmasses->{{Internal[4],i4}},pcouplingtypes->{0,L,R,L}},{pfuncstring->"MfSFSFFb",pprefactor->2,pfermionmasses->{{Internal[5],i5}},pcouplingtypes->{0,L,R,R}}}}}];
listVoSSSFF={VoSSSFF,delconj[Select[diagsV,POLEordertypes[#]===SSSFF&]]};
AppendTo[ddata,{VoSSSFF,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},{{pfuncstring->"VfSSSFbFb",pprefactor->1,pfermionmasses->{{Internal[4],i4},{Internal[5],i5}},pcouplingtypes->{0,0,L,L}},{pfuncstring->"VfSSSFF",pprefactor->1,pfermionmasses->{},pcouplingtypes->{0,0,L,R}}}}}];
(*NB special treatment for VoFFFFS because we can switch the scalar and fermion positions*)listVoFFFFS={VoFFFFS,POLEorderVFFFFS/@delconj[Select[diagsV,POLEtypes[#]===SFFFF&]]};
AppendTo[ddata,{VoFFFFS,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},{{pfuncstring->"VfFbFbFbFbS",pprefactor->2,pfermionmasses->{{Internal[1],i1},{Internal[2],i2},{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,L,L,L}},{pfuncstring->"VfFbFFbFS",pprefactor->4,pfermionmasses->{{Internal[1],i1},{Internal[3],i3}},pcouplingtypes->{L,L,R,L}},{pfuncstring->"VfFbFFFbS",pprefactor->2,pfermionmasses->{{Internal[1],i1},{Internal[4],i4}},pcouplingtypes->{L,L,R,R}},{pfuncstring->"VfFFbFbFS",pprefactor->2,pfermionmasses->{{Internal[2],i2},{Internal[3],i3}},pcouplingtypes->{L,R,L,R}},{pfuncstring->"VfFFFbFbS",pprefactor->4,pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,R,R,R}},{pfuncstring->"VfFFFFS",pprefactor->2,pfermionmasses->{},pcouplingtypes->{L,R,R,L}}}}}];
ListGoFFFFV={GoFFFFV,delconj[Select[diagsV,POLEtypes[#]===FFFFV&]]};
AppendTo[ddata,{GoFFFFV,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{field,gE2},{AntiField@Internal[1],i1},{AntiField@Internal[2],i2}}},{{pfuncstring->"GfFFV",pprefactor->1,pfermionmasses->{},pcouplingtypes->{L,R,0,0}},{pfuncstring->"GfFbFbV",pprefactor->1,pfermionmasses->{{Internal[1],i1},{Internal[2],i2}},pcouplingtypes->{L,L,0,0}}}}}];
res={{listWoSSSS,listXoSSS,listYoSSSS,listZoSSSS,listSoSSS,listUoSSSS,listVoSSSSS,listMoSSSSS,listWoSSSV,listMoSSSSV,listWoSSFF,listMoFFFFS,listMoSFSFF,listVoSSSFF,listVoFFFFS,ListGoFFFFV},ddata};
Return[res]];



(************************************************NOW FOR TADPOLE STUFF*********************************)

SetAttributes[{checkconj},{HoldAll}];
checkconj[diag_,listparts_,outdiags_]:=Module[{j,ps,conjps,sps,scps,FoundMatch,outcouplings,tempcouplings,conjtempcouplings,possiblematchingdiags},ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
conjps=myconj[ps];
sps=Sort[ps];
scps=Sort[conjps];
If[FreeQ[listparts,sps]&&FreeQ[listparts,scps],AppendTo[outdiags[[2]],diag];
AppendTo[listparts,{sps,Length[outdiags[[2]]]}];
Return[True];,(*------We may still have a non-equivalent diagram:check for those with the same internals---*)possiblematchingdiags=Union[Position[listparts,sps],Position[listparts,scps]];
FoundMatch=False;
tempcouplings=diag[[1]];
conjtempcouplings=myconj/@(tempcouplings/.{C[x__]->{x}});
For[j=1,j<=Length[possiblematchingdiags],j++,outcouplings=outdiags[[2,possiblematchingdiags[[j,1]],1]];
If[MatchQ[outcouplings,tempcouplings]||myMatchQ[outcouplings/.{C[x__]->{x}},conjtempcouplings],FoundMatch=True;
Return[False];];];
If[FoundMatch==False,AppendTo[outdiags[[2]],diag];
AppendTo[listparts,{sps,Length[outdiags[[2]]]}];
Return[True];];];];



GenerateT1[field_]:=Block[{topT1,insT1},topT1={{C[field,FieldToInsert[1],FieldToInsert[2],FieldToInsert[3]],C[AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],AntiField@FieldToInsert[3]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3]}};
insT1=InsFields2L[topT1];
Return[insT1]];


GenerateT2[field_]:=Block[{topT2,insT2},topT2={{C[field,FieldToInsert[1],FieldToInsert[2]],C[AntiField@FieldToInsert[1],AntiField@FieldToInsert[2],FieldToInsert[3],AntiField@FieldToInsert[3]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3]}};
insT2=InsFields2L[topT2];
Return[insT2]];


GenerateT3[field_]:=Block[{topT3,insT3},topT3={{C[field,FieldToInsert[1],FieldToInsert[2]],C[AntiField@FieldToInsert[1],FieldToInsert[3],FieldToInsert[4]],C[AntiField@FieldToInsert[2],AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4]}};
insT3=InsFields2L[topT3];
Return[insT3]];

Classify2LTadpoleDiagrams[field_]:=Block[{diagsT1,diagsT2,diagsT3,i,diag,ps,psT,listparts,listbroken,type,listSS,listSSS,listSSSS,listFFFS,listSSFF,listSV,listFV,listpartsSSSS,listpartsFFFS,listpartsSSFF,listpartsSV,listpartsFV,res,ddata},listSS={ToSS,{}};
listSSS={ToSSS,{}};
listSSSS={ToSSSS,{}};
listFFFS={ToFFFS,{}};
listSSFF={ToSSFF,{}};
listSV={ToSV,{}};
listFV={ToFV,{}};
res={};
ddata={};

InitDiagramGeneration2L;



diagsT1=GenerateT1[field];
diagsT2=GenerateT2[field];
diagsT3=GenerateT3[field];
listparts={};
For[i=1,i<=Length[diagsT1],i++,diag=diagsT1[[i]];
type=POLEordertypes[diag];
If[type===SSS,checkconj[diag,listparts,listSSS];];];
AppendTo[ddata,{ToSSS,{pfuncstring->"TfSSS",pprefactor->1/6,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2},{Internal[3],i3}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{AntiField@Internal[3],i3}}}}}];
listparts={};
For[i=1,i<=Length[diagsT2],i++,diag=diagsT2[[i]];
ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]]/.{bar[a_]->a,conj[a_]->a};
psT=getType/@ps;
If[FreeQ[psT,G]==False,Continue[]];
type=POLEordertypes[diag];
If[type===SSS,checkconj[diag,listparts,listSS];];];
AppendTo[ddata,{ToSS,{pfuncstring->"TfSS",pprefactor->1/4,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[3],i3},{AntiField@Internal[3],i3}}}}}];
listpartsSSSS={};
listpartsFFFS={};
listpartsSSFF={};
listpartsSV={};
listpartsFV={};
For[i=1,i<=Length[diagsT3],i++,diag=diagsT3[[i]];
ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
type=POLEordertypes[diag];
Switch[type,SSSS,checkconj[diag,listpartsSSSS,listSSSS];,SSFF,checkconj[diag,listpartsSSFF,listSSFF];,SSSV|SSVS,If[FreeQ[ps,Alternatives@@Transpose[dataUnBrokenGaugeGroups][[4]]]===False,checkconj[diag,listpartsSV,listSV]];,FFFV|FFVF,If[FreeQ[ps,Alternatives@@Transpose[dataUnBrokenGaugeGroups][[4]]]===False,checkconj[diag,listpartsFV,listFV]];,FFFS,checkconj[diag,listpartsFFFS,listFFFS];,FFSF,diag={diag[[1]],{Internal[1]->ps[[1]],Internal[2]->ps[[2]],Internal[3]->ps[[4]],Internal[4]->ps[[3]]}};
checkconj[diag,listpartsFFFS,listFFFS];,_,Continue[];];];
AppendTo[ddata,{ToSSSS,{pfuncstring->"TfSSSS",pprefactor->1/4,topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}}}}];
AppendTo[ddata,{ToSSFF,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}},{{pfuncstring->"TfSSFF",pprefactor->1/2,pfermionmasses->{},pcouplingtypes->{0,L,R}},{pfuncstring->"TfSSFbFb",pprefactor->-1,pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{0,L,L}}}}}];
AppendTo[ddata,{ToFFFS,{topdata->{{{field,gE1},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}},{{pfuncstring->"TfFFFbS",pprefactor->2,pfermionmasses->{{Internal[3],i3}},pcouplingtypes->{L,R,R}},{pfuncstring->"TfFFbFS",pprefactor->2,pfermionmasses->{{Internal[2],i2}},pcouplingtypes->{L,R,L}},{pfuncstring->"TfFbFbFbS",pprefactor->-2,pfermionmasses->{{Internal[1],i1},{Internal[2],i2},{Internal[3],i3}},pcouplingtypes->{L,L,L}}}}}];
AppendTo[ddata,{ToSV,{pfuncstring->"TfSV",pprefactor->1/2,topdata->{{{field,gE1},{Internal[1],i1},{AntiField@Internal[1],i1}}}}}];
AppendTo[ddata,{ToFV,{topdata->{{{field,gE1},{Internal[1],i1},{AntiField@Internal[1],i1}}},{{pfuncstring->"TfFV",pprefactor->1,pfermionmasses->{{Internal[1],i1}},pcouplingtypes->{L,0,0}}}}}];
res={{listSS,listSSS,listSSSS,listSSFF,listFFFS,listSV,listFV},ddata};
Return[res];];

