(* ::Package:: *)

(* ::Input::Initialization:: *)
InitDiagramGeneration:=Block[{i,j,k,l,temp,pos},
OneKnown={};
TwoKnown={};
ThreeKnown={};
OneKnownIns={};
TwoKnownIns={};
ThreeKnownIns={};

temp =Join[VertexList3,VertexList4]/. a_[{b__}]->a;


For[i=1,i<=Length[temp],
For[j=1,j<=Length[temp[[i,1]]],
If[FreeQ[OneKnownIns,C[temp[[i,1,j]]]],
OneKnown = Join[OneKnown,{Delete[temp[[i,1]],j]}];
OneKnownIns= Join[OneKnownIns,{C[temp[[i,1,j]]]}];,
pos= Position[OneKnownIns,C[temp[[i,1,j]]],1,1][[1,1]];
OneKnown[[pos]] = Join[OneKnown[[pos]],Delete[temp[[i,1]],j]];
];
For[k=j+1,k<=Length[temp[[i,1]]],
If[FreeQ[TwoKnownIns,C[temp[[i,1,j]],temp[[i,1,k]]]],
TwoKnown = Join[TwoKnown,{Delete[temp[[i,1]],{{j},{k}}]}];
TwoKnownIns= Join[TwoKnownIns,{C[temp[[i,1,j]],temp[[i,1,k]]]}];,
pos= Position[TwoKnownIns,C[temp[[i,1,j]],temp[[i,1,k]]],1,1][[1,1]];
TwoKnown[[pos]] = Join[TwoKnown[[pos]],Delete[temp[[i,1]],{{j},{k}}]];
];
For[l=k+1,l<=Length[temp[[i,1]]],
If[FreeQ[ThreeKnownIns,C[temp[[i,1,j]],temp[[i,1,k]],temp[[i,1,l]]]],
ThreeKnown = Join[ThreeKnown,{Delete[temp[[i,1]],{{j},{k},{l}}]}];
ThreeKnownIns= Join[ThreeKnownIns,{C[temp[[i,1,j]],temp[[i,1,k]],temp[[i,1,l]]]}];,
pos= Position[ThreeKnownIns,C[temp[[i,1,j]],temp[[i,1,k]],temp[[i,1,l]]],1,1][[1,1]];
ThreeKnown[[pos]] = Join[ThreeKnown[[pos]],Delete[temp[[i,1]],{{j},{k},{l}}]];
];
l++;];
k++;];
j++;];
i++;];


OneKnown=Intersection/@OneKnown;
TwoKnown=Intersection/@TwoKnown;
ThreeKnown=Intersection/@ThreeKnown;

];

InsFields[process_]:=Block[{i},
DiagramList={};
ListInsertedVertices={};
AddFieldToDiagram[process];
Return[DiagramList];
];


(* ::Input::Initialization:: *)
AddFieldToDiagram[process_]:=Block[{pos, possFields,i,possFieldsSub, newProcess},
currentInsertion = Cases[process,FieldToInsert[_],3,1][[1]];
pos = Position[process[[1]],currentInsertion];
For[i=1,i<=Length[pos],
currentVertex=Extract[process[[1]],pos[[i,1]]];
If[Length[pos[[i]]]==2,
If[i==1,
possFields=getPossibleFields[currentVertex];,
possFields=Intersection[possFields,getPossibleFields[currentVertex]];
];,
If[i==1,
possFields=AntiField/@getPossibleFields[currentVertex];,
possFields=Intersection[possFields,AntiField/@getPossibleFields[currentVertex]];
];
];
i++;];
If[Length[possFields]>0,
possFieldsSub=Flatten[Table[{currentInsertion->possFields[[i]]},{i,1,Length[possFields]}]];
For[i=1,i<=Length[possFieldsSub],
newProcess= process /. possFieldsSub[[i]];
Switch[CheckVertex[newProcess],
Finished,
   
		If[SA`CheckSameVertices===False||FreeQ[ListInsertedVertices,newProcess[[1]]],
		DiagramList = Join[DiagramList,{newProcess}];
		ListInsertedVertices=Join[ListInsertedVertices,{newProcess[[1]]}];
		];,
GoOn,
		AddFieldToDiagram[newProcess];
];
i++];
];
];


(* ::Input::Initialization:: *)

CheckVertex[process_]:=Block[{goOn,i},
finishedVertices =Cases[process[[1]],x_?FieldToInsertQ,1];
If[Length[finishedVertices]==0,
Return[GoOn];,
goOn = True;
 For[i=1,i<=Length[finishedVertices],
If[FreeQ[VerticesInv[All],finishedVertices[[i]]],
goOn=False;
];
i++;]; 
If[goOn==True,
If[Length[finishedVertices]==Length[process[[1]]],
Return[Finished];,
Return[GoOn];
];,
Return[stop];
];
];
];

FieldToInsertQ[x_]:=Return[FreeQ[x,FieldToInsert]];

getPossibleFields[vertex_]:=Block[{temp,pos},
temp = DeleteCases[vertex,FieldToInsert[_]];
temp = DeleteCases[temp,AntiField[FieldToInsert[_]]];
Switch[Length[temp],
0, Return[OneKnownIns /. C->Plus];,
1,
	pos=Position[OneKnownIns,temp,1,1];
	If[pos=!={},Return[Extract[OneKnown,pos[[1,1]]]];,Return[{}];];,
2,
	pos=Position[TwoKnownIns,temp,1,1];
	If[pos=!={},Return[Extract[TwoKnown,pos[[1,1]]]];,Return[{}];];,
3,
	pos=Position[ThreeKnownIns,temp,1,1];
	If[pos=!={},Return[Extract[ThreeKnown,pos[[1,1]]]];,Return[{}];];
];
];


(* ::Input::Initialization:: *)
GenerateBoxDiagrams[f1_,f2_,f3_,f4_]:=Block[{},
AllBoxDiagrams={};

currentTop={{C[f1,FieldToInsert[1],AntiField[FieldToInsert[4]]],C[f2,AntiField[FieldToInsert[1]],FieldToInsert[2]],C[f3,AntiField[FieldToInsert[2]],FieldToInsert[3]],C[f4,AntiField[FieldToInsert[3]],FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->f1,External[2]->f2,External[3]->f3,External[4]->f4,Index[1]->gt1,Index[2]->gt2,Index[3]->gt3,Index[4]->gt4, InsertionOrder ->1}};
AllBoxDiagrams=InsFields[currentTop];


currentTop={{C[f1,FieldToInsert[1],AntiField[FieldToInsert[4]]],C[f2,AntiField[FieldToInsert[1]],FieldToInsert[2]],C[f4,AntiField[FieldToInsert[2]],FieldToInsert[3]],C[f3,AntiField[FieldToInsert[3]],FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->f1,External[2]->f2,External[3]->f4,External[4]->f3,Index[1]->gt1,Index[2]->gt2,Index[3]->gt4,Index[4]->gt3, InsertionOrder ->2}};
AllBoxDiagrams=Join[AllBoxDiagrams,InsFields[currentTop]];


currentTop={{C[f1,FieldToInsert[1],AntiField[FieldToInsert[4]]],C[f4,AntiField[FieldToInsert[1]],FieldToInsert[2]],C[f3,AntiField[FieldToInsert[2]],FieldToInsert[3]],C[f2,AntiField[FieldToInsert[3]],FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->f1,External[2]->f4,External[3]->f3,External[4]->f2,Index[1]->gt1,Index[2]->gt4,Index[3]->gt3,Index[4]->gt2, InsertionOrder ->3}};
InsFields[currentTop];
AllBoxDiagrams=Join[AllBoxDiagrams,InsFields[currentTop]]; 

currentTop={{C[f1,FieldToInsert[1],AntiField[FieldToInsert[4]]],C[f3,AntiField[FieldToInsert[1]],FieldToInsert[2]],C[f2,AntiField[FieldToInsert[2]],FieldToInsert[3]],C[f4,AntiField[FieldToInsert[3]],FieldToInsert[4]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],Internal[4]->FieldToInsert[4],External[1]->f1,External[2]->f3,External[3]->f2,External[4]->f4,Index[1]->gt1,Index[2]->gt4,Index[3]->gt3,Index[4]->gt2, InsertionOrder ->4}};
InsFields[currentTop];
AllBoxDiagrams=Join[AllBoxDiagrams,InsFields[currentTop]]; 


Return[AllBoxDiagrams];
];




(* ::Input::Initialization:: *)
GeneratePenguinDiagrams[f1_,f2_,f3_]:=Block[{},
currentTop={{C[f1,FieldToInsert[1],AntiField[FieldToInsert[2]]],C[f2,AntiField[FieldToInsert[1]],FieldToInsert[3]],C[f3,AntiField[FieldToInsert[3]],FieldToInsert[2]]},{Internal[1]->FieldToInsert[1],Internal[2]->FieldToInsert[2],Internal[3]->FieldToInsert[3],External[1]->f1,External[2]->f2,External[3]->f3}};
Return[InsFields[currentTop]];
];


(* ::Input:: *)
(*DiracChain[a___,f_*b_,c___]:=f DiracChain[a,b,c]/;(FreeQ[f,GammaMatrix]&&FreeQ[f,Spinor]);*)
(*DiracChain[a___,f_,c___]:=f DiracChain[a,c]/;(FreeQ[f,GammaMatrix]&&FreeQ[f,Spinor]);*)
(*DiracChain[a___,b_+c_,d___]:=DiracChain[a,b,d]+DiracChain[a,c,d];*)
(*DiracChain[a___,GammaMatrix[PL],GammaMatrix[mu],b___]:=DiracChain[a,GammaMatrix[mu],GammaMatrix[PR],b];*)
(*DiracChain[a___,GammaMatrix[PR],GammaMatrix[mu],b___]:=DiracChain[a,GammaMatrix[mu],GammaMatrix[PL],b];*)
(*DiracChain[a___,GammaMatrix[PR],GammaMatrix[PL],b___]:=0;*)
(*DiracChain[a___,GammaMatrix[PL],GammaMatrix[PR],b___]:=0;*)
(*DiracChain[a___,GammaMatrix[PR],GammaMatrix[PL],b___]:=0;*)
(*DiracChain[a___,GammaMatrix[PR],GammaMatrix[PR],b___]:=DiracChain[a,GammaMatrix[PR],b];*)
(*DiracChain[a___,GammaMatrix[PL],GammaMatrix[PL],b___]:=DiracChain[a,GammaMatrix[PL],b];*)
(**)
(**)


(* ::Input:: *)
(*MakeAmplitudeBox[process_]:=Block[{i},*)
(*If[getType[Internal[1] /. process[[2]]]===F,*)
(*prop1=Internal[1] /. process[[2]];*)
(*prop2=Internal[3] /. process[[2]];*)
(*contraction=1;,*)
(*prop3=Internal[2] /. process[[2]];*)
(*prop4=Internal[4] /. process[[2]];*)
(*contraction=2;*)
(*];*)
(**)
(**)
(*col =MakeColorStructur[{External[1],Index[1]}/.process[[2]],{Internal[1],dummy[1]}/.process[[2]],{AntiField[Internal[4]],dummy[4]}/.process[[2]]]*MakeColorStructur[{External[2],Index[2]}/.process[[2]],{AntiField[Internal[1]],dummy[1]}/.process[[2]],{Internal[2],dummy[2]}/.process[[2]]]*MakeColorStructur[{External[3],Index[3]}/.process[[2]],{AntiField[Internal[2]],dummy[2]}/.process[[2]],{Internal[3],dummy[3]}/.process[[2]]] MakeColorStructur[{External[4],Index[4]}/.process[[2]],{AntiField[Internal[3]],dummy[3]}/.process[[2]],{Internal[4],dummy[4]}/.process[[2]]];*)
(**)
(*Print[col];*)
(**)
(*col=SimplifyColorStructur[col];*)
(**)
(*Switch[contraction,*)
(*1,*)
(*chain1 = DC[Spinor[Index[2] /. process[[2]]],coup2L*GammaMatrix[PL]+coup2R*GammaMatrix[PR],kmu*GammaMatrix[mu] + Mass[prop1],coup1L*GammaMatrix[PL]+coup1R*GammaMatrix[PR],Spinor[Index[1] /. process[[2]]]];*)
(*chain2 = DC[Spinor[Index[3] /. process[[2]]],coup3L*GammaMatrix[PL]+coup3R*GammaMatrix[PR],kmu*GammaMatrix[mu] + Mass[prop2],coup4L*GammaMatrix[PL]+coup4R*GammaMatrix[PR],Spinor[Index[4] /. process[[2]]]];*)
(**)
(*If[Head[External[2] /. process[[2]]]=!=bar,chain1=Reverse[chain1]; ];*)
(*If[Head[External[3] /. process[[2]]]=!=bar,chain2=Reverse[chain2]; ];*)
(*chain1=chain1 /. DC ->DiracChain;*)
(*chain2=chain2 /. DC ->DiracChain;,*)
(**)
(*2,*)
(*chain1 = DC[Spinor[Index[1] /. process[[2]]],coup1L*GammaMatrix[PL]+coup1R*GammaMatrix[PR],kmu*GammaMatrix[mu] + Mass[prop1],coup4L*GammaMatrix[PL]+coup4R*GammaMatrix[PR],Spinor[Index[4] /. process[[2]]]];*)
(*chain2 = DC[Spinor[Index[2] /. process[[2]]],coup2L*GammaMatrix[PL]+coup2R*GammaMatrix[PR],kmu*GammaMatrix[mu] + Mass[prop2],coup3L*GammaMatrix[PL]+coup3R*GammaMatrix[PR],Spinor[Index[3] /. process[[2]]]];*)
(**)
(*If[Head[External[1] /. process[[2]]]=!=bar,chain1=Reverse[chain1]; ];*)
(*If[Head[External[2] /. process[[2]]]=!=bar,chain2=Reverse[chain2]; ];*)
(*chain1=chain1 /. DC ->DiracChain;*)
(*chain2=chain2 /. DC ->DiracChain;*)
(*];*)
(**)
(*Return[col*chain1*chain2];*)
(*];*)


(* ::Input:: *)
(*MakeColorStructur[{p1_,in1_},{p2_,in2_},{p3_,in3_}]:=Block[{finished,i},*)
(*ind1=getIndizes[p1];*)
(*ind2=getIndizes[p2];*)
(*ind3=getIndizes[p3];*)
(**)
(*fac=1;*)
(*finished=False;*)
(*Which[*)
(*FreeQ[Gauginos,p1]==False,*)
(*pos=Position[Gauginos,p1][[1,1]]/2;*)
(*If[Gauge[[pos,2]]=!=U[1],*)
(*If[Head[p2]===bar || Head[p2]===conj,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in1,in2,in3];,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in1,in3,in2];*)
(*];*)
(*];*)
(*finished=True;,*)
(**)
(*FreeQ[Gauginos,p2]==False,*)
(*pos=Position[Gauginos,p2][[1,1]]/2;*)
(*If[Gauge[[pos,2]]=!=U[1],*)
(*If[Head[p1]===bar || Head[p1]===conj,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in2,in1,in3];,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in2,in3,in1];*)
(*];*)
(*];*)
(*finished=True;,*)
(**)
(*FreeQ[Gauginos,p3]==False,*)
(*pos=Position[Gauginos,p3][[1,1]]/2;*)
(*If[Gauge[[pos,2]]=!=U[1],*)
(*If[Head[p1]===bar || Head[p1]===conj,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in3,in1,in2];,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in3,in2,in1];*)
(*];*)
(*];*)
(*finished=True;,*)
(**)
(**)
(*FreeQ[SGauge,p1]==False,*)
(*pos=Position[SGauge,p1][[1,1]];*)
(*If[Head[p2]===bar || Head[p2]===conj,*)
(*fac = fac * TAtemptemp[Gauge[[pos,2,1]],in1,in2,in3];,*)
(*fac = fac * TAtemptemp[Gauge[[pos,2,1]],in1,in3,in2];*)
(*];*)
(*finished=True;,*)
(**)
(**)
(*FreeQ[SGauge,p2]==False,*)
(*pos=Position[SGauge,p2][[1,1]];*)
(*If[Head[p1]===bar || Head[p1]===conj,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in2,in1,in3];,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in2,in3,in1];*)
(*];*)
(*finished=True;,*)
(**)
(*FreeQ[SGauge,p3]==False,*)
(*pos=Position[SGauge,p3][[1,1]];*)
(*If[Head[p1]===bar || Head[p1]===conj,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in3,in1,in2];,*)
(*fac = fac * TAtemp[Gauge[[pos,2,1]],in3,in2,in1];*)
(*];*)
(*finished=True;*)
(*];*)
(**)
(**)
(**)
(*If[finished==False,*)
(*ind1b=DeleteCases[DeleteCases[ind1,generation],lorentz];*)
(*ind2b=DeleteCases[DeleteCases[ind2,generation],lorentz];*)
(*ind3b=DeleteCases[DeleteCases[ind3,generation],lorentz];*)
(**)
(*For[i=1,i<=Length[ind1b],*)
(*If[FreeQ[ind2b,ind1b[[i]]]==False,fac = fac * Delta[in1,in2];];*)
(*If[FreeQ[ind3b,ind1b[[i]]]==False,fac = fac * Delta[in1,in3];];*)
(*i++;];*)
(*For[i=1,i<=Length[ind2b],*)
(*If[FreeQ[ind3b,ind2b[[i]]]==False,fac = fac * Delta[in2,in3];];*)
(*i++;];*)
(*];*)
(**)
(*Return[fac];*)
(**)
(*];*)
(**)
(**)
(*SimplifyColorStructur[ins_]:=Block[{temp},*)
(*temp=Expand[ins];*)
(**)
(*While[FreeQ[temp,TAtemp]==False,*)
(*temp = Expand[temp] /. TAtemp[a_,b_,alpha_,beta_]*TAtemp[a_,b_,gamma_,delta_]->1/2 Delta[alpha,delta] Delta[beta,gamma] - 1/(2 a) Delta[alpha,beta] Delta[gamma,delta];*)
(*];*)
(**)
(**)
(*While[FreeQ[temp,Delta[_,dummy[a_]]]==False,*)
(*temp = Expand[temp]/. Delta[a_,dummy[b_]]*Delta[c_,dummy[b_]]-> Delta[a,c] /. Delta[dummy[a_],dummy[a_]]->3 /. Delta[dummy[a_],dummy[b_]]->1;*)
(*];*)
(**)
(*Return[temp];*)
(*];*)
(**)
(**)
(**)
(*FierzTransform[operator_]:=Block[{},*)
(*temp = operator;*)
(**)
(**)
(**)
(**)
(*];*)
(**)
(**)
(**)
