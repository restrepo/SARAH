(* ::Package:: *)

GenerateSPhenoEffPot:=Block[{},
(*
Print["--------------------------------------"];
Print["Writing SPheno Effective Potential "];
Print["--------------------------------------"];
*)
Print[StyleForm["Write two-loop corrections","Section",FontSize->12]];

(* $sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}]; *)
(* CreateDirectory[$sarahCurrentSPhenoDir]; *)

(*
$sarahSPhenoTwoLoopDir=ToFileName[{$sarahCurrentSPhenoDir,"TwoLoopMasses"}];
If[FileExistsQ[$sarahSPhenoTwoLoopDir]=!=True,
CreateDirectory[$sarahSPhenoTwoLoopDir];
];
*)

sphenoEP=OpenWrite[ToFileName[$sarahSPhenoTwoLoopDir,"EffectivePotential_"<>ModelName<>".f90"]];

InitMassCoupsDerivatives;

DefineGlobalParticleLists;

WriteEffPotHeader;
WriteWrapperFunction;

Print["  Writing two-loop effective potential"];
WriteEffPotFunction;
WriteEffPotFunction2Loop;

Print["  Writing second derivatives of two-loop effective potential"];
WriteSecondDerivativeEffPot;

Print["  Writing first derivatives of two-loop effective potential"];
WriteFirstDerivativeEffPot;


(* WriteCalcAllDerivatives; *)
Print["  Writing derivatives of masses and couplings"];
WriteDerivativesMassesCoups;
WriteWrapperForDerivatives;
WriteMassesCoupsToG;
WriteGToMassesCoups;

WriteString[sphenoEP,"End Module EffectivePotential_"<>ModelName<>" \n \n"];
Close[sphenoEP];

If[FileExistsQ[ToFileName[$sarahSPhenoTwoLoopDir,"EffPotFunctions.f90"]]===True,
DeleteFile[ToFileName[$sarahSPhenoTwoLoopDir,"EffPotFunctions.f90"]];
];
CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"EffPotFunctions.f90"],ToFileName[$sarahSPhenoTwoLoopDir,"EffPotFunctions.f90"]];

If[FileExistsQ[ToFileName[$sarahSPhenoTwoLoopDir,"DerivativesEffPotFunctions.f90"]]===True,
DeleteFile[ToFileName[$sarahSPhenoTwoLoopDir,"DerivativesEffPotFunctions.f90"]];
];
CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"DerivativesEffPotFunctions.f90"],ToFileName[$sarahSPhenoTwoLoopDir,"DerivativesEffPotFunctions.f90"]];
];

InitMassCoupsDerivatives:=Block[{i,j},
DnamesAll3P={};
DDnamesAll3P={};
DnamesAll4P={};
DDnamesAll4P={};
NumberAllMassesCouplings=0;
For[i=1,i<=Length[namesAll3P],
pos=Position[SPhenoParameters,namesAll3P[[i]]][[1,1]];
SPhenoParameters=Join[SPhenoParameters,{{ToExpression["d"<>ToString[namesAll3P[[i]]]],Join[SPhenoParameters[[pos,2]],{generation,generation}],Join[SPhenoParameters[[pos,3]],{NrVEVs}],Join[SPhenoParameters[[pos,4]],{{generation,NrVEVs}}]}}];
SPhenoParameters=Join[SPhenoParameters,{{ToExpression["dd"<>ToString[namesAll3P[[i]]]],Join[SPhenoParameters[[pos,2]],{generation,generation}],Join[SPhenoParameters[[pos,3]],{NrVEVs,NrVEVs}],Join[SPhenoParameters[[pos,4]],{{generation,NrVEVs},{generation,NrVEVs}}]}}];
DnamesAll3P=Join[DnamesAll3P,{ToExpression["d"<>ToString[namesAll3P[[i]]]]}];
DDnamesAll3P=Join[DDnamesAll3P,{ToExpression["dd"<>ToString[namesAll3P[[i]]]]}];
NumberAllMassesCouplings=NumberAllMassesCouplings+2*Times@@SPhenoParameters[[pos,3]];
i++;];

For[i=1,i<=Length[namesAll4P],
pos=Position[SPhenoParameters,namesAll4P[[i]]][[1,1]];
SPhenoParameters=Join[SPhenoParameters,{{ToExpression["d"<>ToString[namesAll4P[[i]]]],Join[SPhenoParameters[[pos,2]],{generation,generation}],Join[SPhenoParameters[[pos,3]],{NrVEVs}],Join[SPhenoParameters[[pos,4]],{{generation,NrVEVs}}]}}];
SPhenoParameters=Join[SPhenoParameters,{{ToExpression["dd"<>ToString[namesAll4P[[i]]]],Join[SPhenoParameters[[pos,2]],{generation,generation}],Join[SPhenoParameters[[pos,3]],{NrVEVs,NrVEVs}],Join[SPhenoParameters[[pos,4]],{{generation,NrVEVs},{generation,NrVEVs}}]}}];
DnamesAll4P=Join[DnamesAll4P,{ToExpression["d"<>ToString[namesAll4P[[i]]]]}];
DDnamesAll4P=Join[DDnamesAll4P,{ToExpression["dd"<>ToString[namesAll4P[[i]]]]}];
NumberAllMassesCouplings=NumberAllMassesCouplings+2*Times@@SPhenoParameters[[pos,3]];
i++;];

dMasses={};
ddMasses={};

For[i=1,i<=Length[AllMassesSPheno],
pos=Position[SPhenoParameters,AllMassesSPheno[[i]]][[1,1]];
SPhenoParameters=Join[SPhenoParameters,{{ToExpression["d"<>ToString[AllMassesSPheno[[i]]]],Join[SPhenoParameters[[pos,2]],{generation}],Join[SPhenoParameters[[pos,3]],{NrVEVs}]}}];
SPhenoParameters=Join[SPhenoParameters,{{ToExpression["dd"<>ToString[AllMassesSPheno[[i]]]],Join[SPhenoParameters[[pos,2]],{generation,generation}],Join[SPhenoParameters[[pos,3]],{NrVEVs,NrVEVs}]}}];
dMasses=Join[dMasses,{ToExpression["d"<>ToString[AllMassesSPheno[[i]]]]}];
ddMasses=Join[ddMasses,{ToExpression["dd"<>ToString[AllMassesSPheno[[i]]]]}];
NumberAllMassesCouplings=NumberAllMassesCouplings+SPhenoParameters[[pos,3,1]];
i++;];


];

WriteEffPotHeader:=Block[{},
WriteString[sphenoEP,"Module EffectivePotential_"<>ModelName<>" \n \n"];
WriteString[sphenoEP,"Use Control \n"];
WriteString[sphenoEP,"Use Settings \n"];
WriteString[sphenoEP,"Use Couplings_"<>ModelName<>" \n"];
WriteString[sphenoEP,"Use LoopFunctions \n"];
WriteString[sphenoEP,"Use Mathematics \n"];
WriteString[sphenoEP,"Use MathematicsQP \n"];
WriteString[sphenoEP,"Use Model_Data_"<>ModelName<>" \n"];
WriteString[sphenoEP,"Use StandardModel \n"];
WriteString[sphenoEP,"Use TreeLevelMasses_"<>ModelName<>" \n"];
WriteString[sphenoEP,"Use EffPotFunctions\n"];
WriteString[sphenoEP,"Use DerivativesEffPotFunctions\n \n"];



WriteString[sphenoEP,"Contains \n \n"];
];

WriteCalcAllDerivatives:=Block[{i,j,temp},
MakeSubroutineTitle["CalculateDerivatesMC",Flatten[{listVEVs,listAllParameters,namesAll3P,namesAll4P,DnamesAll3P,DDnamesAll3P,DnamesAll4P,DDnamesAll3P,AllMassesSPheno,dMasses,ddMasses}],{},{},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];

MakeVariableList[namesAll3P,",Intent(out)",sphenoEP];
MakeVariableList[namesAll4P,",Intent(out)",sphenoEP];
MakeVariableList[DnamesAll3P,",Intent(out)",sphenoEP];
MakeVariableList[DnamesAll4P,",Intent(out)",sphenoEP];
MakeVariableList[DDnamesAll3P,",Intent(out)",sphenoEP];
MakeVariableList[DDnamesAll4P,",Intent(out)",sphenoEP];

MakeVariableList[Complement[NewMassParameters,AllMassesSPheno],"",sphenoEP];

MakeVariableList[AllMassesSPheno,",Intent(out)",sphenoEP];
MakeVariableList[dMasses,",Intent(out)",sphenoEP];
MakeVariableList[ddMasses,",Intent(out)",sphenoEP];

(* Calculate first derivatives *)
WriteString[sphenoEP,"Do i1=1,"<>ToString[NrVEVs]<>"\n"];
MakeCall["FirstDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1"},{"gout"},sphenoEP];
MakeCall["GToMassesCoups",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{"gout"},{},sphenoEP];
pars=Flatten[{dMasses,DnamesAll3P,DnamesAll4P}];
For[i=1,i<=Length[pars],
WriteString[sphenoEP,ToString[pars[[i]]]<>StringReplace[StringReplace[StringReplace[ToString[getDimSPheno[pars[[i]]]]," "->""],{RegularExpression["(.,)"]:>":,",RegularExpression["(.})"]:>"i1}"}],{"{"->"(","}"->")"}]<>" = "<>StringDrop[ToString[pars[[i]]],{1}]<>"\n"];
i++;];
WriteString[sphenoEP,"End Do \n \n"];

(* Calculate second derivatives *)
WriteString[sphenoEP,"Do i1=1,"<>ToString[NrVEVs]<>"\n"];
WriteString[sphenoEP,"  Do i2=i1,"<>ToString[NrVEVs]<>"\n"];
MakeCall["SecondDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1","i2"},{"gout"},sphenoEP];
MakeCall["GToMassesCoups",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{"gout"},{},sphenoEP];
pars=Flatten[{ddMasses,DDnamesAll3P,DDnamesAll4P}];
For[i=1,i<=Length[pars],
WriteString[sphenoEP,ToString[pars[[i]]]<>StringReplace[StringReplace[StringReplace[StringReplace[ToString[getDimSPheno[pars[[i]]]]," "->""],{RegularExpression["(.,)"]:>":,"}],{RegularExpression["(.,.})"]:>"i1,i2}"}],{"{"->"(","}"->")"}]<>" = "<>StringDrop[ToString[pars[[i]]],2]<>"\n"];
i++;];
WriteString[sphenoEP,"  End Do \n "];
WriteString[sphenoEP,"End Do \n \n"];


(* Calculate tree level masses  *)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoEP];
(* Calculate 3-point couplings *)
MakeCall["CouplingsForEffPot3" , Join[parametersAll3P,namesAll3P],{},{},sphenoEP];
(* Calculate 4-point couplings including colorfactors *)
MakeCall["CouplingsForEffPot4" , Join[parametersAll4P,namesAll4P],{},{},sphenoEP];

WriteString[sphenoEP,"End Subroutine CalculateDerivatesMC\n\n"];
];

WriteDerivativesMassesCoups:=Block[{i,j},
MakeSubroutineTitle["SecondDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1","i2"},{"gout"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
WriteString[sphenoEP,"Real(dp), Intent(out) :: gout(:) \n"];
WriteString[sphenoEP,"Real(dp) :: err, vevs("<>ToString[NrVEVs]<>") \n"];
WriteString[sphenoEP,"Integer :: iout \n"];
WriteString[sphenoEP,"Integer, Intent(in) :: i1,i2 \n"];

WriteString[sphenoEP,"vevs = (/"<>StringJoin@Riffle[SPhenoForm/@listVEVs,","]<>"/) \n"];
WriteString[sphenoEP,"gout = partialDiffXY_RiddersMulDim(AllMassesCouplings,"<>ToString[NumberAllMassesCouplings]<>",vevs,i1,i2,"<>ToString[NrVEVs]<>",err) \n"];
WriteString[sphenoEP, "If (err.gt.err2L) err2L = err \n"];


WriteString[sphenoEP,"End Subroutine SecondDerivativeMassesCoups\n\n"];

MakeSubroutineTitle["FirstDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1"},{"gout"},sphenoEP];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
WriteString[sphenoEP,"Real(dp), Intent(out) :: gout(:) \n"];
WriteString[sphenoEP,"Real(dp) :: err, vevs("<>ToString[NrVEVs]<>") \n"];
WriteString[sphenoEP,"Integer :: iout \n"];
WriteString[sphenoEP,"Integer, Intent(in) :: i1 \n"];

WriteString[sphenoEP,"vevs = (/"<>StringJoin@Riffle[SPhenoForm/@listVEVs,","]<>"/) \n"];
WriteString[sphenoEP,"gout = partialDiff_RiddersMulDim(AllMassesCouplings,"<>ToString[NumberAllMassesCouplings]<>",vevs,i1,"<>ToString[NrVEVs]<>",err) \n"];
WriteString[sphenoEP, "If (err.gt.err2L) err2L = err \n"];
WriteString[sphenoEP,"End Subroutine FirstDerivativeMassesCoups\n\n"];

WriteString[sphenoEP,"Subroutine AllMassesCouplings(vevs,gout) \n"];
WriteString[sphenoEP,"Implicit None \n"];
WriteString[sphenoEP,"Real(dp), Intent(out) :: gout("<>ToString[NumberAllMassesCouplings]<>") \n"];
WriteString[sphenoEP,"Real(dp), Intent(in) :: vevs("<>ToString[NrVEVs]<>") \n"];
WriteString[sphenoEP,"Integer :: kont \n"];
MakeVariableList[listVEVs,"",sphenoEP];
MakeVariableList[namesAll3P,"",sphenoEP];
MakeVariableList[namesAll4P,"",sphenoEP];
MakeVariableList[NewMassParameters,"",sphenoEP];

For[i=1,i<=Length[listVEVs],
If[getGen[listVEVs[[i]]]===1,
WriteString[sphenoEP,SPhenoForm[listVEVs[[i]]]<>"=vevs("<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+1]<>") \n"];,WriteString[sphenoEP,SPhenoForm[listVEVs[[i]]]<>"=vevs("<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+1]<>":"<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+getGen[listVEVs[[i]]]]<>")\n"];
];
i++;];
MakeCall["WrapperForDerivatives",Join[listVEVs,listAllParameters],{},{"gout"},sphenoEP];

WriteString[sphenoEP,"End Subroutine \n\n"];
];

WriteWrapperForDerivatives:=Block[{i,j,k},
MakeSubroutineTitle["WrapperForDerivatives",Join[listVEVs,listAllParameters],{},{"gout"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
WriteString[sphenoEP,"Real(dp), Intent(out) :: gout(:) \n"];
WriteString[sphenoEP,"Integer :: kont \n"];
MakeVariableList[AllMassesSPheno,"",sphenoEP];
MakeVariableList[namesAll3P,"",sphenoEP];
MakeVariableList[namesAll4P,"",sphenoEP];

MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoEP];
MakeCall["CouplingsForEffPot3" , Join[parametersAll3P,namesAll3P],{},{},sphenoEP];
MakeCall["CouplingsForEffPot4" , Join[parametersAll4P,namesAll4P],{},{},sphenoEP];

MakeCall["MassesCoupsToG",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{},{"gout"},sphenoEP];

WriteString[sphenoEP,"End Subroutine WrapperForDerivatives\n\n"];
];

WriteMassesCoupsToG:=Block[{i,j,k,count,gt1,gt2,gt3,gt4, parameterList,dimP,entryNr},
MakeSubroutineTitle["MassesCoupsToG",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{},{"g"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
WriteString[sphenoEP,"Real(dp), Intent(out) :: g(:) \n"];
WriteString[sphenoEP,"Integer :: i1,i2,i3,i4, sumI\n"];
MakeVariableList[AllMassesSPheno,",Intent(in)",sphenoEP];
MakeVariableList[namesAll3P,",Intent(in)",sphenoEP];
MakeVariableList[namesAll4P,",Intent(in)",sphenoEP];

count=0;
For[i=1,i<=Length[AllMassesSPheno],
If[getDimSPheno[AllMassesSPheno[[i]]][[1]]>1,
WriteString[sphenoEP,"g("<>ToString[count+1]<>":"<>ToString[count+getDimSPheno[AllMassesSPheno[[i]]][[1]]]<>") = "<>SPhenoForm[AllMassesSPheno[[i]]]<>"\n"];
count=count+getDimSPheno[AllMassesSPheno[[i]]][[1]];,
WriteString[sphenoEP,"g("<>ToString[count+1]<>") = "<>SPhenoForm[AllMassesSPheno[[i]]]<>"\n"];
count=count+getDimSPheno[AllMassesSPheno[[i]]][[1]];
];
i++;];
entryNr=count+1;

For[j=1,j<=2,
Switch[j,
1,parameterList=namesAll3P;,
2,parameterList=namesAll4P;
];
For[i=1,i<=Length[parameterList],
openDo=0;
If[getDimSPheno[parameterList[[i]]]=!={1} && getDimSPheno[parameterList[[i]]]=!={},
dimP=getDimSPheno[parameterList[[i]]];
For[k=1,k<=Length[dimP],
WriteString[sphenoEP, "Do i"<>ToString[k]<>" = 1,"<>ToString[dimP[[k]]] <>"\n"];
openDo++;
k++;];

Switch[Length[dimP],
1,WriteString[sphenoEP,"SumI = (i1-1) \n"];,
2,WriteString[sphenoEP,"SumI = (i2-1) + (i1-1)*"<>ToString[dimP[[2]]]<> "\n"];,
3,WriteString[sphenoEP,"SumI = (i3-1) + (i2-1)*"<>ToString[dimP[[3]]]<>" + (i1-1)*"<>ToString[dimP[[3]]*dimP[[2]]]<> "\n"];,
4,WriteString[sphenoEP,"SumI = (i4-1) + (i3-1)*"<>ToString[dimP[[4]]]<>" + (i2-1)*"<>ToString[dimP[[4]]*dimP[[3]]]<>" + (i1-1)*"<>ToString[dimP[[4]]*dimP[[2]]*dimP[[3]]]<> "\n"];
];
If[MemberQ[realVar,parameterList[[i]]]==False,
WriteString[sphenoEP, "SumI = SumI*2 \n"];

WriteString[sphenoEP,"g(SumI+" <>ToString[entryNr] <>") = Real("];
WriteString[sphenoEP, SPhenoForm[parameterList[[i]]]];
Switch[Length[dimP],
1,WriteString[sphenoEP,"(i1)"];,
2,WriteString[sphenoEP,"(i1,i2)"];,
3,WriteString[sphenoEP,"(i1,i2,i3)"];,
4,WriteString[sphenoEP,"(i1,i2,i3,i4)"];
];
WriteString[sphenoEP,", dp) \n"];

WriteString[sphenoEP,"g(SumI+" <>ToString[entryNr+1] <>") = Aimag("];
WriteString[sphenoEP, SPhenoForm[parameterList[[i]]]];
Switch[Length[dimP],
1,WriteString[sphenoEP,"(i1)"];,
2,WriteString[sphenoEP,"(i1,i2)"];,
3,WriteString[sphenoEP,"(i1,i2,i3)"];,
4,WriteString[sphenoEP,"(i1,i2,i3,i4)"];
];

WriteString[sphenoEP,") \n"];


entryNr += 2*Apply[Times,dimP]; ,

WriteString[sphenoEP,"g(SumI+" <>ToString[entryNr] <>") = "];
WriteString[sphenoEP, SPhenoForm[parameterList[[i]]]];
Switch[Length[dimP],
1,WriteString[sphenoEP,"(i1)"];,
2,WriteString[sphenoEP,"(i1,i2)"];,
3,WriteString[sphenoEP,"(i1,i2,i3)"];,
4,WriteString[sphenoEP,"(i1,i2,i3,i4)"];
];
WriteString[sphenoEP," \n"];
entryNr +=Apply[Times,dimP];
];

For[k=1,k<=openDo,
WriteString[sphenoEP, "End Do \n"];
k++;];
WriteString[sphenoEP, "\n"];,

If[MemberQ[realVar,parameterList[[i]]]==False,
WriteString[sphenoEP,"g("<>ToString[entryNr]<>") = Real("<> SPhenoForm[parameterList[[i]]]<>",dp)  \n"];
WriteString[sphenoEP,"g("<>ToString[entryNr+1]<>") = Aimag("<> SPhenoForm[parameterList[[i]]]<>")  \n"];
entryNr=entryNr+2;,
WriteString[sphenoEP,"g("<>ToString[entryNr]<>") = "<> SPhenoForm[parameterList[[i]]]<>"  \n"];
entryNr++;
];

];

i++;];
j++;];


WriteString[sphenoEP,"End Subroutine MassesCoupsToG\n\n"];
];

WriteGToMassesCoups:=Block[{i,j,k,count,gt1,gt2,gt3,gt4, parameterList,dimP,entryNr},
MakeSubroutineTitle["GToMassesCoups",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{"g"},{},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
WriteString[sphenoEP,"Real(dp), Intent(in) :: g(:) \n"];
WriteString[sphenoEP,"Integer :: i1,i2,i3,i4, sumI\n"];
MakeVariableList[AllMassesSPheno,",Intent(inout)",sphenoEP];
MakeVariableList[namesAll3P,",Intent(inout)",sphenoEP];
MakeVariableList[namesAll4P,",Intent(inout)",sphenoEP];

count=0;
For[i=1,i<=Length[AllMassesSPheno],
If[getDimSPheno[AllMassesSPheno[[i]]][[1]]>1,
WriteString[sphenoEP,SPhenoForm[AllMassesSPheno[[i]]] <>"=g("<>ToString[count+1]<>":"<>ToString[count+getDimSPheno[AllMassesSPheno[[i]]][[1]]]<>") \n"];,
WriteString[sphenoEP,SPhenoForm[AllMassesSPheno[[i]]] <>"=g("<>ToString[count+1]<>") \n"];
];
count=count+getDimSPheno[AllMassesSPheno[[i]]][[1]];
i++;];
entryNr=count+1;

For[j=1,j<=2,
Switch[j,
1,parameterList=namesAll3P;,
2,parameterList=namesAll4P;
];
For[i=1,i<=Length[parameterList],
openDo=0;
If[getDimSPheno[parameterList[[i]]]=!={1} && getDimSPheno[parameterList[[i]]]=!={},
dimP=getDimSPheno[parameterList[[i]]];
For[k=1,k<=Length[dimP],
WriteString[sphenoEP, "Do i"<>ToString[k]<>" = 1,"<>ToString[dimP[[k]]]<>"\n"];
openDo++;
k++;];

Switch[Length[dimP],
1,WriteString[sphenoEP,"SumI = (i1-1) \n"];,
2,WriteString[sphenoEP,"SumI = (i2-1) + (i1-1)*"<>ToString[dimP[[2]]]<> "\n"];,
3,WriteString[sphenoEP,"SumI = (i3-1) + (i2-1)*"<>ToString[dimP[[3]]]<>" + (i1-1)*"<>ToString[dimP[[3]]*dimP[[2]]]<> "\n"];,
4,WriteString[sphenoEP,"SumI = (i4-1) + (i3-1)*"<>ToString[dimP[[4]]]<>" + (i2-1)*"<>ToString[dimP[[4]]*dimP[[3]]]<>" + (i1-1)*"<>ToString[dimP[[4]]*dimP[[2]]*dimP[[3]]]<> "\n"];
];
If[MemberQ[realVar,parameterList[[i]]]==False,
WriteString[sphenoEP, "SumI = SumI*2 \n"];
WriteString[sphenoEP, SPhenoForm[parameterList[[i]]]];
Switch[Length[dimP],
1,WriteString[sphenoEP,"(i1)"];,
2,WriteString[sphenoEP,"(i1,i2)"];,
3,WriteString[sphenoEP,"(i1,i2,i3)"];,
4,WriteString[sphenoEP,"(i1,i2,i3,i4)"];
];
WriteString[sphenoEP," = Cmplx( g(SumI+" <>ToString[entryNr] <>"), g(SumI+"<>ToString[entryNr+1] <>"), dp) \n"];
entryNr += 2*Apply[Times,dimP];,

WriteString[sphenoEP, SPhenoForm[parameterList[[i]]]];
Switch[Length[dimP],
1,WriteString[sphenoEP,"(i1)"];,
2,WriteString[sphenoEP,"(i1,i2)"];,
3,WriteString[sphenoEP,"(i1,i2,i3)"];,
4,WriteString[sphenoEP,"(i1,i2,i3,i4)"];
];
WriteString[sphenoEP," =  g(SumI+" <>ToString[entryNr] <>") \n"];
entryNr +=Apply[Times,dimP];
];

For[k=1,k<=openDo,
WriteString[sphenoEP, "End Do \n "];
k++;];
WriteString[sphenoEP, "\n"];,

If[MemberQ[realVar,parameterList[[i]]]==False,
WriteString[sphenoEP,SPhenoForm[parameterList[[i]]]<>"= Cmplx(g("<>ToString[entryNr]<>"),g("<>ToString[entryNr+1]<>"),dp) \n"];
entryNr=entryNr+2;,
WriteString[sphenoEP,SPhenoForm[parameterList[[i]]]<>"= g("<>ToString[entryNr]<>") \n"];
entryNr++;
];

];

i++;];
j++;];


WriteString[sphenoEP,"End Subroutine GToMassesCoups\n\n"];
];


WriteWrapperFunction:= Block[{i,j,gen,genStart},
(*
MakeSubroutineTitle["CalculateCorrectionsEffPot",Join[listVEVs,listAllParameters],{"ti_ep","pi_ep","ti_ep2L","pi_ep2L"},{"kont"},sphenoEP];
*)
MakeSubroutineTitle["CalculateCorrectionsEffPot",Join[listVEVs,listAllParameters],{"ti_ep2L","pi_ep2L"},{"kont"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
WriteString[sphenoEP, "Integer , Intent(inout):: kont \n"];
WriteString[sphenoEP, "Integer :: iout \n"];
NrVEVs=Plus@@(getGen/@listVEVs);
NrHiggsBosons=getGen[HiggsBoson];
WriteString[sphenoEP, "Real(dp) :: err,h_start,vevs("<>ToString[NrVEVs]<>") \n"];
(*
WriteString[sphenoEP, "Real(dp), Intent(out) :: ti_ep("<>ToString[NrVEVs]<>"),ti_ep2L("<>ToString[NrVEVs]<>")  \n"];
WriteString[sphenoEP, "Real(dp), Intent(out) :: pi_ep("<>ToString[NrVEVs]<>","<>ToString[NrVEVs]<>"),pi_ep2L("<>ToString[NrVEVs]<>","<>ToString[NrVEVs]<>")\n"];
*)
WriteString[sphenoEP, "Real(dp), Intent(out) :: ti_ep2L("<>ToString[NrVEVs]<>")  \n"];
WriteString[sphenoEP, "Real(dp), Intent(out) :: pi_ep2L("<>ToString[NrVEVs]<>","<>ToString[NrVEVs]<>")\n"];

WriteString[sphenoEP,"\n\n"];
WriteString[sphenoEP, "err2L = 0._dp \n"];
WriteString[sphenoEP,"If (.not.PurelyNumericalEffPot) Then \n"];
WriteString[sphenoEP, "epsM = 1.0E-8_dp \n"];
WriteString[sphenoEP, "epsD = 1.0E-8_dp \n"];
(*MakeCall["FirstDerivativeEffPot2Loop",Join[listVEVs,listAllParameters],{},{"kont","ti_ep2L"},sphenoEP];*)
WriteString[sphenoEP,"! 2nd deriv. also calculates the 1st deriv. of V\n"];
MakeCall["SecondDerivativeEffPot2Loop",Join[listVEVs,listAllParameters],{},{"kont","pi_ep2L","ti_ep2L"},sphenoEP];


WriteString[sphenoEP,"Else \n"];
WriteString[sphenoEP, "epsM = 1.0E-6_dp \n"];
WriteString[sphenoEP, "epsD = 1.0E-6_dp \n"];
(* Write function to get first derivative of eff. pot to calculate ti_ep (ti_ep2L) *)
(* WriteString[sphenoEP,"h_start= 0.9*min("<>StringJoin@Riffle[ToString/@listVEVs,","]<>")\n"]; *)
WriteString[sphenoEP,"vevs = (/"<>StringJoin@Riffle[SPhenoForm/@listVEVs,","]<>"/) \n"];
WriteString[sphenoEP,"! Calculate 1st (ti_ep) and 2nd derivatives (pi_ep)\n"];
For[i=1,i<=NrVEVs,i++;,
(* WriteString[sphenoEP,"ti_ep("<>ToString[i]<>") = partialDiff_Ridders(EffPotFunction,vevs,"<>ToString[i]<>","<>ToString[NrVEVs]<>",err,h_start,iout) \n"]; *)
WriteString[sphenoEP,"ti_ep2L("<>ToString[i]<>") = partialDiff_Ridders(EffPotFunction2Loop,vevs,"<>ToString[i]<>","<>ToString[NrVEVs]<>",err,h_start,iout) \n"];
WriteString[sphenoEP, "If (err.gt.err2L) err2L = err \n"];
];
(*calculate upper triangle (i,j), j\[LessEqual]i *)
For[i=1,i<=NrVEVs,i++;,
For[j=1,j<=i,j++;,
(*WriteString[sphenoEP,"pi_ep("<>ToString[i]<>","<>ToString[j]<>") = partialDiffXY_Ridders(EffPotFunction,vevs,"<>ToString[i]<>","<>ToString[j]<>","<>ToString[NrVEVs]<>",err,h_start,iout) \n"];*)
WriteString[sphenoEP,"pi_ep2L("<>ToString[i]<>","<>ToString[j]<>") = partialDiffXY_Ridders(EffPotFunction2Loop,vevs,"<>ToString[i]<>","<>ToString[j]<>","<>ToString[NrVEVs]<>",err,h_start,iout) \n"];
WriteString[sphenoEP, "If (err.gt.err2L) err2L = err \n"];
];
];
(*copy to lower triangle (i,j), j>i *)
For[j=1,j<=NrVEVs,j++;,
For[i=1,i<j,i++;,
WriteString[sphenoEP,"pi_ep2L("<>ToString[i]<>","<>ToString[j]<>")=pi_ep2L("<>ToString[j]<>","<>ToString[i]<>")\n"];
];
];
WriteString[sphenoEP,"End If \n"];

WriteString[sphenoEP,"Contains \n\n"];
WriteString[sphenoEP,"Real(dp) Function EffPotFunction(vevs) \n"];
WriteString[sphenoEP,"  ! a wrapping function to be passed to numerical differentiation \n"];
WriteString[sphenoEP,"  Implicit None \n"];
WriteString[sphenoEP,"  Real(dp), Intent(in) :: vevs("<>ToString[NrVEVs]<>") \n"];
WriteString[sphenoEP,"  Real(dp) :: effPot \n"];
MakeCall["CalculateEffPot",listAllParameters,Table[If[getGen[listVEVs[[i]]]===1,"vevs("<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+1]<>")","vevs("<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+1]<>":"<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+getGen[listVEVs[[i]]]]<>")"],{i,1,Length[listVEVs]}],{"kont","effPot"},sphenoEP];
WriteString[sphenoEP,"  EffPotFunction = effPot \n"];
WriteString[sphenoEP,"  End Function \n\n"];
(*two loop function eff pot*)
WriteString[sphenoEP,"Real(dp) Function EffPotFunction2Loop(vevs) \n"];
WriteString[sphenoEP,"  ! a wrapping function to be passed to numerical differentiation \n"];
WriteString[sphenoEP,"  Implicit None \n"];
WriteString[sphenoEP,"  Real(dp), Intent(in) :: vevs("<>ToString[NrVEVs]<>") \n"];
WriteString[sphenoEP,"  Real(dp) :: effPot2L \n"];
MakeCall["CalculateEffPot2Loop",listAllParameters,Table[If[getGen[listVEVs[[i]]]===1,"vevs("<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+1]<>")","vevs("<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+1]<>":"<>ToString[Plus@@(getGen/@Take[listVEVs,{1,i-1}])+getGen[listVEVs[[i]]]]<>")"],{i,1,Length[listVEVs]}],{"kont","effPot2L"},sphenoEP];
WriteString[sphenoEP,"  EffPotFunction2Loop = effPot2L \n"];
WriteString[sphenoEP,"  End Function \n\n"];
WriteString[sphenoEP,"End subroutine CalculateCorrectionsEffPot \n\n\n"];
];

WriteEffPotFunction:=Block[{i,mass,massSq,particle,complex,contr,mult,multString,gen,genStart},
MakeSubroutineTitle["CalculateEffPot",Join[listVEVs,listAllParameters],{},{"kont","effPot"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
MakeVariableList[NewMassParameters,"",sphenoEP];
WriteString[sphenoEP, "Integer, Intent(inout):: kont\n"];
WriteString[sphenoEP, "Integer :: i \n"];
WriteString[sphenoEP,"Real(dp) :: effpot,Qscale,result,temp\n"];
WriteString[sphenoEP,"\n\n"];

(* Calculate tree level masses *)
MakeCall["TreeMasses",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoEP];


WriteString[sphenoEP,"Qscale= getRenormalizationScale()\n"];
WriteString[sphenoEP,"result=0._dp\n"];
WriteString[sphenoEP,"temp=0._dp\n"];
WriteString[sphenoEP,"! sum over real scalars (color *[2 if complex]) \n"];
contr="";
For[i=1,i<=Length[AllScalars],i++;,
particle=AllScalars[[i]];
gen=getGen[particle[[1]]];
genStart=getGenSPhenoStart[particle[[1]]];
multString=getParticleMultiplicityString[particle];
If[gen===1,
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>",Qscale) ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."->"0._dp"}]];
,
WriteString[sphenoEP,"Do i="<>ToString[genStart]<>","<>ToString[gen]<>"\n"];
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>"(i),Qscale) ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."->"0._dp"}]];
WriteString[sphenoEP,"End Do\n"];
];
];
WriteString[sphenoEP,"result=(+1)*temp !scalars\n\n"];

WriteString[sphenoEP,"temp=0._dp\n"];
WriteString[sphenoEP,"! sum over two-component fermions (*color [*2 if Dirac Fermion]) \n"];
contr="";
For[i=1,i<=Length[AllDiracFermions],i++;,
particle=AllDiracFermions[[i]];
gen=getGen[particle[[1]]];
genStart=getGenSPhenoStart[particle[[1]]];
multString=getParticleMultiplicityString[particle];
If[gen===1,
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>",Qscale)*"<>ToString[AllDiracFermions[[i,6]]]<>" ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."->"0._dp"}]];
,
WriteString[sphenoEP,"Do i=1,"<>ToString[gen]<>"\n"];
massSq=SPhenoMassSq[particle[[1]]];
contr=multString<>"h_SMartin("<>ToString[massSq]<>If[massSq===0.,"","(i)"]<>",Qscale)*"<>ToString[AllDiracFermions[[i,6]]]<>" ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."->"0._dp"}]];
WriteString[sphenoEP,"End Do\n"];
];
];
WriteString[sphenoEP,"result=result+(-2)*temp ! fermions\n\n"];

WriteString[sphenoEP,"temp=0._dp\n"];
WriteString[sphenoEP,"! sum over real vectors (color *[2 if complex]) \n"];
contr="";
For[i=1,i<=Length[AllVectors],i++;,
particle=AllVectors[[i]];
gen=getGen[particle[[1]]];
genStart=getGenSPhenoStart[particle[[1]]];
multString=getParticleMultiplicityString[particle];
If[gen===1,
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>",Qscale) ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."->"0._dp"}]];
,
WriteString[sphenoEP,"Do i=1,"<>ToString[gen]<>"\n"];
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>"(i),Qscale) ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."->"0._dp"}]];
WriteString[sphenoEP,"End Do\n"];
];
];
WriteString[sphenoEP,"result=result+(+3)*temp ! vectors\n\n"];

(*
WriteString[sphenoEP,"temp=0._dp\n"];
WriteString[sphenoEP,"! sum over ghosts (times generations) \n"];
contr="";
For[i=1,i\[LessEqual]Length[AllGhosts],i++;,
particle=AllGhosts[[i]];
gen=getGen[particle[[1]]];
multString=getParticleMultiplicityString[particle];
If[gen===1,
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>",Qscale) ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."\[Rule]"0._dp"}]];
,
WriteString[sphenoEP,"Do i=1,"<>ToString[gen]<>"\n"];
contr=multString<>"h_SMartin("<>ToString[SPhenoMassSq[particle[[1]]]]<>"(i),Qscale) ! "<>ToString[particle[[1]]]<>"\n";
WriteString[sphenoEP,"temp=temp+"<>StringReplace[contr,{"0."\[Rule]"0._dp"}]];
WriteString[sphenoEP,"End Do\n"];
];
];
WriteString[sphenoEP,"result=result+(+1)*temp*includeGhosts ! ghosts\n\n"];
*)
WriteString[sphenoEP,"effPot = result * oo16pi2"];

(* Calculate vertices (needed for two-loop) *)
(* MakeCall["CouplingsForLoopMasses" , Join[parametersLoop,namesLoop],{},{},sphenoEP]; *)

WriteString[sphenoEP,"\n\n"];
WriteString[sphenoEP,"End Subroutine CalculateEffPot \n\n\n"];


];



getParticleMultiplicityString[particle_]:=Block[{complex,mult,multString},
If[getType[particle[[1]]]===F,complex=False;,
complex=If[particle[[1]]===AntiField[particle[[1]]],False,True];
];
mult=#[[2]]&/@Select[particle[[5]],(!#[[1]]===lorentz&&!#[[1]]===generation)&];
If[!mult==={},
multString=StringJoin["(",ToString[#]&/@Riffle[mult,"*"]];
If[complex,multString=multString<>"*2) * ";,multString=multString<>")   * ";];,
If[complex,multString="(2)    * ";,multString="          ";];
];
Return[multString];
];


DefineGlobalParticleLists:=Block[{},
ListAllParticles=Particles[EWSB];
AllScalars=Select[ListAllParticles,#[[4]]===S&];
AllFermions=Select[ListAllParticles,#[[4]]===F&];
AllDiracFermions=getDiracFermionList;
DiracList={#[[1]],#[[6]]}&/@AllDiracFermions;
AllVectors=Select[ListAllParticles,#[[4]]===V&];
AllGhosts=Select[ListAllParticles,#[[4]]===G&];
AllAuxFields=Select[ListAllParticles,#[[4]]===A&];
];


WriteSecondDerivativeEffPot:=Block[{i,j,string,mass,massSq,particle,complex,contr,mult,multString,gen,genStart,All2LoopDiagrams,All2LoopDiagramsHemisphere,All2LoopDiagramsBalls,All2LoopDiagramsHemisphereCL,All2LoopDiagramsBallsCL,type,diagrams,NrDiags,diag,ListNeededCouplingsEffPot,NrContr1,NrContr2,jAll,pars},
MakeSubroutineTitle["SecondDerivativeEffPot2Loop",Join[listVEVs,listAllParameters],{},{"kont","pi2L,ti2L"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
(* MakeVariableList[NewMassParameters,"",sphenoEP]; *)
WriteString[sphenoEP, "Integer, Intent(inout):: kont\n"];
WriteString[sphenoEP,"Real(dp), Intent(out) :: pi2L("<>ToString[NrVEVs]<>","<>ToString[NrVEVs]<>"),ti2L("<>ToString[NrVEVs]<>")\n"];
WriteString[sphenoEP, "Integer :: i,i1,i2,i3,NrContr \n"];
WriteString[sphenoEP, "Integer :: iv1, iv2 \n"];
WriteString[sphenoEP, "Integer :: NrContr1,NrContr2 !nr of contributing diagrams\n"];
WriteString[sphenoEP,"Real(dp) :: Q2,colorfactor,coeff,coeffbar\n"];
WriteString[sphenoEP,"Complex(dp) :: result,result_ti,temp,temp_ti,temp_tj,tempbar,tempbar_ti,tempbar_tj\n"];
WriteString[sphenoEP,"Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar\n"];
WriteString[sphenoEP,"Complex(dp) :: Di_coup1,Di_coup2,Di_coup1L,Di_coup1R,Di_coup2L,Di_coup2R,Di_coupx,Di_coupxbar\n"];
WriteString[sphenoEP,"Complex(dp) :: Dj_coup1,Dj_coup2,Dj_coup1L,Dj_coup1R,Dj_coup2L,Dj_coup2R,Dj_coupx,Dj_coupxbar\n"];
WriteString[sphenoEP,"Complex(dp) :: DDcoup1,DDcoup2,DDcoup1L,DDcoup1R,DDcoup2L,DDcoup2R,DDcoupx,DDcoupxbar\n"];

All2LoopDiagramsHemisphere=Generate2LoopDiagramsHemisphere;
All2LoopDiagramsBalls=Generate2LoopDiagramsBalls;

(* Remove diagrams which only involve gauge couplings from broken groups *)
temp=Select[All2LoopDiagramsHemisphere,FreeQ[getType/@(List@@#[[1,1]]),G]&];
temp=Select[temp,FreeQ[namesAll3P,getSPhenoCoupling[#[[1,1]]][[1,1]]]==False&];
All2LoopDiagramsHemisphere=temp;

temp=Select[All2LoopDiagramsBalls,FreeQ[getType/@(List@@#[[1,1]]),G]&];
temp=Select[temp,FreeQ[namesAll4P,getSPhenoCoupling[#[[1,1]],SPhenoCouplingsAllreallyAll][[1,1]]]==False&];
All2LoopDiagramsBalls=temp;

(* REMOVE CONJUGATE DIAGRAMS (avoid double counting) *) 
All2LoopDiagramsHemisphere=Intersection[All2LoopDiagramsHemisphere,SameTest->ConjugateDiagramsQ];
All2LoopDiagramsBalls=Intersection[All2LoopDiagramsBalls,SameTest->ConjugateDiagramsQ];

All2LoopDiagramsHemisphereCL=Classify2LoopDiagrams[All2LoopDiagramsHemisphere];
All2LoopDiagramsBallsCL=Classify2LoopDiagrams[All2LoopDiagramsBalls];
NrContr1=Plus@@(Length[#[[2]]]&/@All2LoopDiagramsHemisphereCL);
NrContr2=Plus@@(Length[#[[2]]]&/@All2LoopDiagramsBallsCL);

WriteString[sphenoEP,"Complex(dp) :: results1("<>ToString[NrContr1]<>"),results2("<>ToString[NrContr2]<>")\n"];
WriteString[sphenoEP,"Complex(dp) :: results1_ti("<>ToString[NrContr1]<>"),results2_ti("<>ToString[NrContr2]<>")\n"];
WriteString[sphenoEP,"Real(dp) :: gout("<>ToString[NumberAllMassesCouplings]<>") \n"];

MakeVariableList[namesAll3P,"",sphenoEP];
MakeVariableList[namesAll4P,"",sphenoEP];
MakeVariableList[DnamesAll3P,"",sphenoEP];
MakeVariableList[DnamesAll4P,"",sphenoEP];
MakeVariableList[DDnamesAll3P,"",sphenoEP];
MakeVariableList[DDnamesAll4P,"",sphenoEP];
MakeVariableList[AllMassesSPheno,"",sphenoEP];
MakeVariableList[dMasses,"",sphenoEP];
MakeVariableList[ddMasses,"",sphenoEP];

WriteString[sphenoEP,"!! ------------------------------------------------- \n"];
WriteString[sphenoEP,"!! Calculate masses, couplings and their derivatives \n"];
WriteString[sphenoEP,"!! ------------------------------------------------- \n\n"];
(* Calculate first derivatives *)
WriteString[sphenoEP,"Do i1=1,"<>ToString[NrVEVs]<>"\n"];
MakeCall["FirstDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1"},{"gout"},sphenoEP];
MakeCall["GToMassesCoups",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{"gout"},{},sphenoEP];
pars=Flatten[{dMasses,DnamesAll3P,DnamesAll4P}];
For[i=1,i<=Length[pars],
WriteString[sphenoEP,ToString[pars[[i]]]<>StringReplace[StringReplace[StringReplace[ToString[getDimSPheno[pars[[i]]]]," "->""],{RegularExpression["(.,)"]:>":,",RegularExpression["(.})"]:>"i1}"}],{"{"->"(","}"->")"}]<>" = "<>StringDrop[ToString[pars[[i]]],{1}]<>"\n"];
i++;];
WriteString[sphenoEP,"End Do \n \n"];

(* Calculate second derivatives *)
WriteString[sphenoEP,"Do i1=1,"<>ToString[NrVEVs]<>"\n"];
WriteString[sphenoEP,"  Do i2=i1,"<>ToString[NrVEVs]<>"\n"];
MakeCall["SecondDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1","i2"},{"gout"},sphenoEP];
MakeCall["GToMassesCoups",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{"gout"},{},sphenoEP];
pars=Flatten[{ddMasses,DDnamesAll3P,DDnamesAll4P}];
For[i=1,i<=Length[pars],
WriteString[sphenoEP,ToString[pars[[i]]]<>StringReplace[StringReplace[StringReplace[StringReplace[ToString[getDimSPheno[pars[[i]]]]," "->""],{RegularExpression["(.,)"]:>":,"}],{RegularExpression["(.,.})"]:>"i1,i2}"}],{"{"->"(","}"->")"}]<>" = "<>StringDrop[ToString[pars[[i]]],2]<>"\n"];
i++;];
WriteString[sphenoEP,"  End Do \n "];
WriteString[sphenoEP,"End Do \n \n"];


(* Calculate tree level masses  *)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoEP];
(* Calculate 3-point couplings *)
MakeCall["CouplingsForEffPot3" , Join[parametersAll3P,namesAll3P],{},{},sphenoEP];
(* Calculate 4-point couplings including colorfactors *)
MakeCall["CouplingsForEffPot4" , Join[parametersAll4P,namesAll4P],{},{},sphenoEP];

WriteString[sphenoEP,"\n\n!! ------------------------------------------------- \n"];
WriteString[sphenoEP,"!! Calculate derivative of effective potential      \n"];
WriteString[sphenoEP,"!! ------------------------------------------------- \n\n"];




WriteString[sphenoEP,"\n\n"];

WriteString[sphenoEP,"Q2 = getRenormalizationScale()\n"];
WriteString[sphenoEP,"Do iv1=1,"<>ToString[NrVEVs]<>"\n"];
WriteString[sphenoEP,"  Do iv2=iv1,"<>ToString[NrVEVs]<>"\n"];
WriteString[sphenoEP,"    result = ZeroC\n"];
WriteString[sphenoEP,"    result_ti = ZeroC\n"];
WriteString[sphenoEP,"    results1 = ZeroC\n"];
WriteString[sphenoEP,"    results1_ti = ZeroC\n"];
WriteString[sphenoEP,"    results2 = ZeroC\n"];
WriteString[sphenoEP,"    results2_ti = ZeroC\n\n"];

WriteString[sphenoEP,"\n! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices\n\n"];

jAll=1;
For[i=1,i<=Length[All2LoopDiagramsHemisphereCL],i++;,
type=All2LoopDiagramsHemisphereCL[[i,1]];
diagrams=All2LoopDiagramsHemisphereCL[[i,2]];
NrDiags=Length[diagrams];
If[NrDiags>0,
WriteString[sphenoEP,"\n! ----- diagrams of type "<>ToString[type]<>", "<>ToString[NrDiags]<>" ------ \n\n"];
If[type===ggV,Continue[];];
For[j=1,j<=NrDiags,j++;,
diag=diagrams[[j]];
Write2LoopDiagramContributionSecondDerivative[sphenoEP,diag,type,"results1("<>ToString[jAll]<>")","results1_ti("<>ToString[jAll]<>")"];
(*Write2LoopDiagramContributionSecondDerivative[sphenoEP,diag,type,"results1("<>ToString[jAll]<>")"];*)
jAll++;
];
];
];
jAll=1;
WriteString[sphenoEP,"! ----- Topology2: diagrams w. 2 Particles and 1 Vertex\n\n"];
For[i=1,i<=Length[All2LoopDiagramsBallsCL],i++;,
type=All2LoopDiagramsBallsCL[[i,1]];
diagrams=All2LoopDiagramsBallsCL[[i,2]];
NrDiags=Length[diagrams];
If[type===VV,Continue[];];
If[NrDiags>0,
WriteString[sphenoEP,"\n! ----- diagrams of type "<>ToString[type]<>", "<>ToString[NrDiags]<>" ------ \n\n"];
For[j=1,j<=NrDiags,j++;,
diag=diagrams[[j]];
(*Write2LoopDiagramContributionSecondDerivative[sphenoEP,diag,type,"results2("<>ToString[jAll]<>")"];*)
Write2LoopDiagramContributionSecondDerivative[sphenoEP,diag,type,"results2("<>ToString[jAll]<>")","results2_ti("<>ToString[jAll]<>")"];
jAll++;
];
];
];
WriteString[sphenoEP,"\n"];
WriteString[sphenoEP,"  result = sum(results1)+sum(results2) ! 2nd deriv. of V\n"];
WriteString[sphenoEP,"  result_ti = sum(results1_ti)+sum(results2_ti) ! 1st deriv. of V\n"];
WriteString[sphenoEP, "  pi2L(iv1,iv2) = oo16pi2**2 * Real(result,dp) \n"];
WriteString[sphenoEP, "  End Do \n"];
WriteString[sphenoEP, "  ti2L(iv1) = oo16pi2**2 * Real(result_ti,dp) \n"];
WriteString[sphenoEP, "End Do \n"];

WriteString[sphenoEP,"Do iv1=1,"<>ToString[NrVEVs]<>"\n"];
WriteString[sphenoEP,"  Do iv2=1,iv1-1\n"];
WriteString[sphenoEP, "  pi2L(iv1,iv2) = pi2L(iv2,iv1) \n"];
WriteString[sphenoEP, "  End Do \n"];
WriteString[sphenoEP, "End Do \n"];
WriteString[sphenoEP, "End Subroutine SecondDerivativeEffPot2Loop \n\n\n" ];
];


WriteFirstDerivativeEffPot:=Block[{i,j,string,mass,massSq,particle,complex,contr,mult,multString,gen,genStart,All2LoopDiagrams,All2LoopDiagramsHemisphere,All2LoopDiagramsBalls,All2LoopDiagramsHemisphereCL,All2LoopDiagramsBallsCL,type,diagrams,NrDiags,diag,ListNeededCouplingsEffPot,NrContr1,NrContr2,jAll,pars},
WriteString[sphenoEP, "\n\n\n"];
MakeSubroutineTitle["FirstDerivativeEffPot2Loop",Join[listVEVs,listAllParameters],{},{"kont","ti2L"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
(* MakeVariableList[NewMassParameters,"",sphenoEP]; *)
WriteString[sphenoEP, "Integer, Intent(inout):: kont\n"];
WriteString[sphenoEP,"Real(dp), Intent(out) :: ti2L("<>ToString[NrVEVs]<>")\n"];
WriteString[sphenoEP, "Integer :: i,i1,i2,i3,includeGhosts,NrContr \n"];
WriteString[sphenoEP, "Integer :: iv1, iv2 \n"];
WriteString[sphenoEP, "Integer :: NrContr1,NrContr2 !nr of contributing diagrams\n"];
WriteString[sphenoEP,"Real(dp) :: Q2,colorfactor,coeff,coeffbar\n"];
WriteString[sphenoEP,"Complex(dp) :: result,temp,tempbar\n"];
WriteString[sphenoEP,"Complex(dp) :: coup1,coup2,coup1L,coup1R,coup2L,coup2R,coupx,coupxbar\n"];
WriteString[sphenoEP,"Complex(dp) :: dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R,dcoupx,dcoupxbar\n"];
WriteString[sphenoEP,"Real(dp) :: gout("<>ToString[NumberAllMassesCouplings]<>") \n"];

All2LoopDiagramsHemisphere=Generate2LoopDiagramsHemisphere;
All2LoopDiagramsBalls=Generate2LoopDiagramsBalls;

(* Remove diagrams which only involve gauge couplings from broken groups *)
temp=Select[All2LoopDiagramsHemisphere,FreeQ[getType/@(List@@#[[1,1]]),G]&];
temp=Select[temp,FreeQ[namesAll3P,getSPhenoCoupling[#[[1,1]]][[1,1]]]==False&];
All2LoopDiagramsHemisphere=temp;

temp=Select[All2LoopDiagramsBalls,FreeQ[getType/@(List@@#[[1,1]]),G]&];
temp=Select[temp,FreeQ[namesAll4P,getSPhenoCoupling[#[[1,1]],SPhenoCouplingsAllreallyAll][[1,1]]]==False&];
All2LoopDiagramsBalls=temp;

(* REMOVE CONJUGATE DIAGRAMS (avoid double counting) *) 
All2LoopDiagramsHemisphere=Intersection[All2LoopDiagramsHemisphere,SameTest->ConjugateDiagramsQ];
All2LoopDiagramsBalls=Intersection[All2LoopDiagramsBalls,SameTest->ConjugateDiagramsQ];

All2LoopDiagramsHemisphereCL=Classify2LoopDiagrams[All2LoopDiagramsHemisphere];
All2LoopDiagramsBallsCL=Classify2LoopDiagrams[All2LoopDiagramsBalls];
NrContr1=Plus@@(Length[#[[2]]]&/@All2LoopDiagramsHemisphereCL);
NrContr2=Plus@@(Length[#[[2]]]&/@All2LoopDiagramsBallsCL);


WriteString[sphenoEP,"Real(dp) :: results1("<>ToString[NrContr1]<>"),results2("<>ToString[NrContr2]<>")\n"];

MakeVariableList[namesAll3P,"",sphenoEP];
MakeVariableList[namesAll4P,"",sphenoEP];
MakeVariableList[DnamesAll3P,"",sphenoEP];
MakeVariableList[DnamesAll4P,"",sphenoEP];
MakeVariableList[AllMassesSPheno,"",sphenoEP];
MakeVariableList[dMasses,"",sphenoEP];


WriteString[sphenoEP,"!! ------------------------------------------------- \n"];
WriteString[sphenoEP,"!! Calculate masses, couplings and their derivatives \n"];
WriteString[sphenoEP,"!! ------------------------------------------------- \n\n"];
(* Calculate first derivatives *)
WriteString[sphenoEP,"Do i1=1,"<>ToString[NrVEVs]<>"\n"];
MakeCall["FirstDerivativeMassesCoups",Join[listVEVs,listAllParameters],{"i1"},{"gout"},sphenoEP];
MakeCall["GToMassesCoups",Join[Join[AllMassesSPheno,namesAll3P],namesAll4P],{"gout"},{},sphenoEP];
pars=Flatten[{dMasses,DnamesAll3P,DnamesAll4P}];
For[i=1,i<=Length[pars],
WriteString[sphenoEP,ToString[pars[[i]]]<>StringReplace[StringReplace[StringReplace[ToString[getDimSPheno[pars[[i]]]]," "->""],{RegularExpression["(.,)"]:>":,",RegularExpression["(.})"]:>"i1}"}],{"{"->"(","}"->")"}]<>" = "<>StringDrop[ToString[pars[[i]]],{1}]<>"\n"];
i++;];
WriteString[sphenoEP,"End Do \n \n"];


(* Calculate tree level masses  *)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoEP];
(* Calculate 3-point couplings *)
MakeCall["CouplingsForEffPot3" , Join[parametersAll3P,namesAll3P],{},{},sphenoEP];
(* Calculate 4-point couplings including colorfactors *)
MakeCall["CouplingsForEffPot4" , Join[parametersAll4P,namesAll4P],{},{},sphenoEP];


WriteString[sphenoEP,"\n\n!! ------------------------------------------------- \n"];
WriteString[sphenoEP,"!! Calculate derivative of effective potential      \n"];
WriteString[sphenoEP,"!! ------------------------------------------------- \n\n"];




WriteString[sphenoEP,"\n\n"];
WriteString[sphenoEP,"Q2 = getRenormalizationScale()\n"];
WriteString[sphenoEP, "ti2L = 0._dp\n"];
WriteString[sphenoEP,"result = ZeroC\n"];
WriteString[sphenoEP,"results1 = ZeroC\n"];
WriteString[sphenoEP,"results2 = ZeroC\n"];

WriteString[sphenoEP,"Do iv1=1,"<>ToString[NrVEVs]<>"\n"];
WriteString[sphenoEP,"! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices\n\n"];
jAll=1;
For[i=1,i<=Length[All2LoopDiagramsHemisphereCL],i++;,
type=All2LoopDiagramsHemisphereCL[[i,1]];
diagrams=All2LoopDiagramsHemisphereCL[[i,2]];
NrDiags=Length[diagrams];
If[NrDiags>0,
WriteString[sphenoEP,"! ----- diagrams of type "<>ToString[type]<>", "<>ToString[NrDiags]<>" ------ \n"];
If[type===ggV,Continue[];];
For[j=1,j<=NrDiags,j++;,
diag=diagrams[[j]];
Write2LoopDiagramContributionFirstDerivative[sphenoEP,diag,type,"results1("<>ToString[jAll]<>")"];
jAll++;
];
];
];
jAll=1;
WriteString[sphenoEP,"! ----- Topology2: diagrams w. 2 Particles and 1 Vertex\n\n"];
For[i=1,i<=Length[All2LoopDiagramsBallsCL],i++;,
type=All2LoopDiagramsBallsCL[[i,1]];
diagrams=All2LoopDiagramsBallsCL[[i,2]];
NrDiags=Length[diagrams];
If[type===VV,Continue[];];
If[NrDiags>0,
WriteString[sphenoEP,"! ----- diagrams of type "<>ToString[type]<>", "<>ToString[NrDiags]<>" ------ \n"];
For[j=1,j<=NrDiags,j++;,
diag=diagrams[[j]];
Write2LoopDiagramContributionFirstDerivative[sphenoEP,diag,type,"results2("<>ToString[jAll]<>")"];
jAll++;
];
];
];
WriteString[sphenoEP,"result = sum(results1)+sum(results2) \n"];
WriteString[sphenoEP, "\n\n \n"];
WriteString[sphenoEP, "ti2L(iv1) = oo16pi2**2 * Real(result,dp) \n"];
WriteString[sphenoEP, "End Do \n"];


WriteString[sphenoEP, "End Subroutine FirstDerivativeEffPot2Loop \n\n\n" ];

];


WriteEffPotFunction2Loop:=Block[{i,j,string,mass,massSq,particle,complex,contr,mult,multString,gen,genStart,All2LoopDiagrams,All2LoopDiagramsHemisphere,All2LoopDiagramsBalls,All2LoopDiagramsHemisphereCL,All2LoopDiagramsBallsCL,type,diagrams,NrDiags,diag,ListNeededCouplingsEffPot,NrContr1,NrContr2,jAll},
WriteString[sphenoEP,"\n \n \n"];
MakeSubroutineTitle["CalculateEffPot2Loop",Join[listVEVs,listAllParameters],{},{"kont","effPot2L"},sphenoEP];
WriteString[sphenoEP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",sphenoEP];
MakeVariableList[listVEVs,",Intent(in)",sphenoEP];
MakeVariableList[NewMassParameters,"",sphenoEP];
WriteString[sphenoEP, "Integer, Intent(inout):: kont\n"];
WriteString[sphenoEP,"Real(dp), Intent(out) :: effpot2L\n"];
WriteString[sphenoEP, "Integer :: i,i1,i2,i3,includeGhosts,NrContr \n"];
WriteString[sphenoEP, "Integer :: NrContr1,NrContr2 !nr of contributing diagrams\n"];
WriteString[sphenoEP,"Real(dp) :: Qscale,result,colorfactor,coeff,coeffbar\n"];
WriteString[sphenoEP,"Complex(dp) :: temp,coupx,coupxbar,coup1,coup2,coup1L,coup1R,coup2L,coup2R\n"];
WriteString[sphenoEP,"Complex(dp) :: dcoupx,dcoupxbar,dcoup1,dcoup2,dcoup1L,dcoup1R,dcoup2L,dcoup2R\n"];

MakeVariableList[namesAll3P,"",sphenoEP];
MakeVariableList[namesAll4P,"",sphenoEP];

(*generate all diagrams*)
All2LoopDiagramsHemisphere=Generate2LoopDiagramsHemisphere;
All2LoopDiagramsBalls=Generate2LoopDiagramsBalls;


(* Remove diagrams which only involve gauge couplings from broken groups *)
temp=Select[All2LoopDiagramsHemisphere,FreeQ[getType/@(List@@#[[1,1]]),G]&];
temp=Select[temp,FreeQ[namesAll3P,getSPhenoCoupling[#[[1,1]]][[1,1]]]==False&];
All2LoopDiagramsHemisphere=temp;

temp=Select[All2LoopDiagramsBalls,FreeQ[getType/@(List@@#[[1,1]]),G]&];
temp=Select[temp,FreeQ[namesAll4P,getSPhenoCoupling[#[[1,1]],SPhenoCouplingsAllreallyAll][[1,1]]]==False&];
All2LoopDiagramsBalls=temp;

(* REMOVE CONJUGATE DIAGRAMS (avoid double counting) *) 
All2LoopDiagramsHemisphere=Intersection[All2LoopDiagramsHemisphere,SameTest->ConjugateDiagramsQ];
All2LoopDiagramsBalls=Intersection[All2LoopDiagramsBalls,SameTest->ConjugateDiagramsQ];

All2LoopDiagramsHemisphereCL=Classify2LoopDiagrams[All2LoopDiagramsHemisphere];
All2LoopDiagramsBallsCL=Classify2LoopDiagrams[All2LoopDiagramsBalls];
NrContr1=Plus@@(Length[#[[2]]]&/@All2LoopDiagramsHemisphereCL);
NrContr2=Plus@@(Length[#[[2]]]&/@All2LoopDiagramsBallsCL);

WriteString[sphenoEP,"Real(dp) :: results1("<>ToString[NrContr1]<>"),results2("<>ToString[NrContr2]<>")\n"];
WriteString[sphenoEP,"\n\n"];

(*MakeVariableList[namesAll,"",sphenoEP]; *)



(* Calculate tree level masses *)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoEP];
(* Calculate 3-point couplings *)
(* MakeCall["AllCouplings",Join[parametersAll,namesAll],{},{},sphenoEP]; *)
MakeCall["CouplingsForEffPot3" , Join[parametersAll3P,namesAll3P],{},{},sphenoEP];
(* Calculate 4-point couplings including colorfactors *)

MakeCall["CouplingsForEffPot4" , Join[parametersAll4P,namesAll4P],{},{},sphenoEP];


WriteString[sphenoEP,"\n"];
WriteString[sphenoEP,"Qscale = getRenormalizationScale()\n"];
WriteString[sphenoEP,"result=0._dp\n"];
WriteString[sphenoEP,"results1=0._dp\n"];
WriteString[sphenoEP,"results2=0._dp\n"];
WriteString[sphenoEP,"temp=0._dp\n"];



WriteString[sphenoEP,"! ----- Topology1 (sunrise): diagrams w. 3 Particles and 2 Vertices\n\n"];
jAll=1;
For[i=1,i<=Length[All2LoopDiagramsHemisphereCL],i++;,
type=All2LoopDiagramsHemisphereCL[[i,1]];
diagrams=All2LoopDiagramsHemisphereCL[[i,2]];
NrDiags=Length[diagrams];
If[NrDiags>0,
WriteString[sphenoEP,"! ----- diagrams of type "<>ToString[type]<>", "<>ToString[NrDiags]<>" ------ \n"];
If[type===ggV,Continue[];];
For[j=1,j<=NrDiags,j++;,
diag=diagrams[[j]];
Write2LoopDiagramContribution[sphenoEP,diag,type,"results1("<>ToString[jAll]<>")"];
jAll++;
];
];
];
jAll=1;
WriteString[sphenoEP,"! ----- Topology2: diagrams w. 2 Particles and 1 Vertex\n\n"];
For[i=1,i<=Length[All2LoopDiagramsBallsCL],i++;,
type=All2LoopDiagramsBallsCL[[i,1]];
diagrams=All2LoopDiagramsBallsCL[[i,2]];
NrDiags=Length[diagrams];
If[type===VV,Continue[];];
If[NrDiags>0,
WriteString[sphenoEP,"! ----- diagrams of type "<>ToString[type]<>", "<>ToString[NrDiags]<>" ------ \n"];
For[j=1,j<=NrDiags,j++;,
diag=diagrams[[j]];
Write2LoopDiagramContribution[sphenoEP,diag,type,"results2("<>ToString[jAll]<>")"];
jAll++;
];
];
];
WriteString[sphenoEP,"result = sum(results1)+sum(results2) \n"];
WriteString[sphenoEP,"effPot2L = result * oo16pi2 * oo16Pi2\n"];
WriteString[sphenoEP,"End Subroutine CalculateEffPot2Loop\n\n\n"]
];


Write2LoopDiagramContributionSecondDerivative[file_,diagram_,type_,resultvar_,resultvarTI_]:=Block[{NrCoupParticles,p1,p2,p3,string,coup1,coup2,ind1,ind2,i1,i2,i3,arglist,arglistd,arglistdj,arglistdd,colorfactor,particlelist,prefactor1="0.000",prefactor2="0.000",WriteColorFactor,LR},
NrCoupParticles=Length/@diagram;
NrCoupParticles=Length/@diagram;
p1=Internal[1]/.diagram[[2]];
p2=Internal[2]/.diagram[[2]];
If[NrCoupParticles[[2]]===3,
p3=Internal[3]/.diagram[[2]];
string=StringJoin@Riffle[ToString/@{p1,p2,p3},","];,
string=StringJoin@Riffle[ToString/@{p1,p2},","];
];
WriteString[file,"! ---- "<>string<>" ----\n"];
If[getGen[p1]>1,
WriteString[file,"Do i1=1,"<>ToString[getGen[p1]]<>"\n"];
];
If[getGen[p2]>1,
WriteString[file," Do i2=1,"<>ToString[getGen[p2]]<>"\n"];
];
If[NrCoupParticles[[2]]===3,
If[getGen[p3]>1,
WriteString[file,"    Do i3=1,"<>ToString[getGen[p3]]<>"\n"];
];
];

Switch[NrCoupParticles,
{2,3},
coup1=getSPhenoCoupling2[diagram[[1,1]],SPhenoCouplingsAllreallyAll];
coup2=getSPhenoCoupling2[diagram[[1,2]],SPhenoCouplingsAllreallyAll];
ind1=MakeIndicesCoupling[{p1,i1},{p2,i2},{p3,i3},coup1[[2]]];
ind2=MakeIndicesCoupling[{AntiField[p1],i1},{AntiField[p2],i2},{AntiField[p3],i3},coup2[[2]]];
WriteVertexToFile[1,coup1,ind1,getVertexType[diagram[[1,1]]],file];
WriteVertexToFile[2,coup2,ind2,getVertexType[diagram[[1,2]]],file];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv1","Di_","d"];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv2","Dj_","d"];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv1,iv2","DD","dd"];
arglist=PutMassesInRightOrderList[{{p1,i1},{p2,i2},{p3,i3}},type]; (*to give to MakeCall*)
(*StringTake[s,{-1}] gives last character*)
arglistd=MakeDMassesList[arglist,"d","iv1"];
arglistdj=MakeDMassesList[arglist,"d","iv2"];
arglistdd=MakeDMassesList[arglist,"dd","iv1,iv2"];
colorfactor=getColorFactorEffPot[{p1,p2,p3}][[1]];
particlelist={{p1,i1},{p2,i2},{p3,i3}};
WriteColorFactor=True;
Switch[type,
SSS,
prefactor1=DeterminePrefactorString[SSS,p1,p2,p3];
WriteCouplingDerivatives[file,SSS,{p1,p2,p3}];
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupx","Di_coupx","Dj_coupx","DDcoupx"}],{"'SSS   '"},{"Q2","temp","temp_ti","temp_tj"},file];
,
FFS,
prefactor1=DeterminePrefactorString[FFS,p1,p2,p3];
prefactor2=DeterminePrefactorString[FFSbar,p1,p2,p3];
WriteCouplingDerivatives[file,FFS,{p1,p2,p3}];
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupx","Di_coupx","Dj_coupx","DDcoupx"}],{"'FFS   '"},{"Q2","temp","temp_ti","temp_tj"},file];
WriteCouplingDerivatives[file,FFSbar,{p1,p2,p3}];
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupxbar","Di_coupxbar","Dj_coupxbar","DDcoupxbar"}],{"'FFSbar'"},{"Q2","tempbar","tempbar_ti","tempbar_tj"},file];
,
FFV,
prefactor1=DeterminePrefactorString[FFV,p1,p2,p3];
prefactor2=DeterminePrefactorString[FFVbar,p1,p2,p3];
WriteCouplingDerivatives[file,FFV,{p1,p2,p3}];(*same coupling variables FFV,FFS*)
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupx","Di_coupx","Dj_coupx","DDcoupx"}],{"'FFV   '"},{"Q2","temp","temp_ti","temp_tj"},file];
WriteCouplingDerivatives[file,FFVbar,{p1,p2,p3}];(*same couplings variables  FFVbar,FFSbar*)
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupxbar","Di_coupxbar","Dj_coupxbar","DDcoupxbar"}],{"'FFVbar'"},{"Q2","tempbar","tempbar_ti","tempbar_tj"},file];
,
SSV,
prefactor1=DeterminePrefactorString[SSV,p1,p2,p3];
WriteCouplingDerivatives[file,SSS,{p1,p2,p3}];(*same couplings variables SSS,SSV,VVS*)
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupx","Di_coupx","Dj_coupx","DDcoupx"}],{"'SSV   '"},{"Q2","temp","temp_ti","temp_tj"},file];
,
VVS,
prefactor1=DeterminePrefactorString[VVS,p1,p2,p3];
WriteCouplingDerivatives[file,SSS,{p1,p2,p3}];(*same couplings variables SSS,SSV,VVS*)
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupx","Di_coupx","Dj_coupx","DDcoupx"}],{"'VVS   '"},{"Q2","temp","temp_ti","temp_tj"},file];
,
gauge,
prefactor1=DeterminePrefactorString[gauge,p1,p2,p3];
WriteCouplingDerivatives[file,gauge,{p1,p2,p3}];(*same couplings variables SSS,SSV,VVS*)
MakeCallWithStrings["SecondDerivativeVeff_sunrise",Join[arglist,arglistd,arglistdj,arglistdd,{"coupx","Di_coupx","Dj_coupx","DDcoupx"}],{"'gauge '"},{"Q2","temp","temp_ti","temp_tj"},file];
];
,
{1,2},
arglist=PutMassesInRightOrderList[{{p1,i1},{p2,i2}},type];
arglistd=MakeDMassesList[arglist,"d","iv1"];
arglistdj=MakeDMassesList[arglist,"d","iv2"];
arglistdd=MakeDMassesList[arglist,"dd","iv1,iv2"];
coup1=getSPhenoCoupling2[diagram[[1,1]],SPhenoCouplingsAllreallyAll];
ind1=MakeIndicesCoupling4[{p1,i1},{AntiField[p1],i1},{p2,i2},{AntiField[p2],i2},coup1[[2]]];
WriteVertexToFile[1,coup1,ind1,getVertexType[diagram[[1,1]]],file];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv1","Di_","d"];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv2","Dj_","d"];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv1,iv2","DD","dd"];
WriteColorFactor=False;
Switch[type,
SS,
prefactor1=DeterminePrefactorString[SS,p1,p2,None];
MakeCallWithStrings["SecondDerivativeVeff_balls",Join[arglist,arglistd,arglistdj,arglistdd,{"coup1","Di_coup1","Dj_coup1","DDcoup1"}],{"'SS'"},{"Q2","temp","temp_ti","temp_tj"},file];
,
VS,
prefactor1=DeterminePrefactorString[VS,p1,p2,None];
MakeCallWithStrings["SecondDerivativeVeff_balls",Join[arglist,arglistd,arglistdj,arglistdd,{"coup1","Di_coup1","Dj_coup1","DDcoup1"}],{"'VS'"},{"Q2","temp","temp_ti","temp_tj"},file];
];
];

WriteString[file,"coeff = "<>ToString[prefactor1]<>"\n"];
If[WriteColorFactor,
WriteString[file,"colorfactor = "<>ToString[colorfactor]<>"\n"];
WriteString[file,resultvar<>"="<>resultvar<>" + coeff*colorfactor*temp\n"];
WriteString[file,resultvarTI<>"="<>resultvarTI<>" + coeff*colorfactor*temp_ti\n"];,
WriteString[file,resultvar<>"="<>resultvar<>" + coeff*temp\n"];
WriteString[file,resultvarTI<>"="<>resultvarTI<>" + coeff*temp_ti\n"];
];
If[type===FFS||type===FFV,
WriteString[file,"coeffbar = "<>ToString[prefactor2]<>"\n"];
WriteString[file,resultvar<>"="<>resultvar<>" + coeffbar*colorfactor*tempbar\n"];
WriteString[file,resultvarTI<>"="<>resultvarTI<>" + coeffbar*colorfactor*tempbar_ti\n"];
];

If[NrCoupParticles[[2]]===3,If[getGen[p3]>1,WriteString[file,"    End Do\n"]]];
If[getGen[p2]>1,WriteString[file,"  End Do\n"]];
If[getGen[p1]>1,WriteString[file,"End Do\n"]];
WriteString[file,"if (.not.("<>resultvar<>".eq."<>resultvar<>"))  write(*,*) 'NaN at "<>ToString[type]<>" "<>ToString[diagram[[1,1]]]<>"' \n"];
];


WriteCouplingDerivatives[file_,type_,particles_]:=Block[{LR},
Switch[type,
SSS, (*has the same couplings as SSV and VVS*)
WriteString[file,"coupx=abs(coup1)**2 \n"];
WriteString[file,"Di_coupx=Di_coup1*conjg(coup1)+coup1*conjg(Di_coup1) \n"];
WriteString[file,"Dj_coupx=Dj_coup1*conjg(coup1)+coup1*conjg(Dj_coup1) \n"];
WriteString[file,"DDcoupx = DDcoup1*conjg(coup1)+coup1*conjg(DDcoup1) & \n"];
WriteString[file,"& + Di_coup1*conjg(Dj_coup1)+Dj_coup1*conjg(Di_coup1)  \n"];
,
FFS | FFV, (*has the same couplings as FFV*)
LR=Or@@DiracQ/@{p1,p2,p3};(*check for Dirac particles*)
If[LR,
WriteString[file,"coupx = (abs(coup1L)**2 + abs(coup1R)**2) \n"];
WriteString[file,"Di_coupx = Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) &\n"];
WriteString[file,"& + Di_coup1R*conjg(coup1R)+coup1R*conjg(Di_coup1R) \n"];
WriteString[file,"Dj_coupx = Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) &\n"];
WriteString[file,"& + Dj_coup1R*conjg(coup1R)+coup1R*conjg(Dj_coup1R) \n"];
WriteString[file,"DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & \n"];
WriteString[file,"& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L) & \n"];
WriteString[file,"& + DDcoup1R*conjg(coup1R)+coup1R*conjg(DDcoup1R) & \n"];
WriteString[file,"& + Di_coup1R*conjg(Dj_coup1R)+Dj_coup1R*conjg(Di_coup1R)  \n"];
,
WriteString[file,"coupx = abs(coup1L)**2\n"];
WriteString[file,"Di_coupx=Di_coup1L*conjg(coup1L)+coup1L*conjg(Di_coup1L) \n"];
WriteString[file,"Dj_coupx=Dj_coup1L*conjg(coup1L)+coup1L*conjg(Dj_coup1L) \n"];
WriteString[file,"DDcoupx = DDcoup1L*conjg(coup1L)+coup1L*conjg(DDcoup1L) & \n"];
WriteString[file,"& + Di_coup1L*conjg(Dj_coup1L)+Dj_coup1L*conjg(Di_coup1L)  \n"];
];
,
FFSbar, 
LR=Or@@DiracQ/@{p1,p2,p3};(*check for Dirac particles*)
If[LR,
WriteString[file,"coupxbar = 2*Real(coup1L*conjg(coup1R),dp) \n"];
WriteString[file,"Di_coupxbar = 2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) \n"];
WriteString[file,"Dj_coupxbar = 2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) \n"];
WriteString[file,"DDcoupxbar = 2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  \n"];
WriteString[file,"&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) \n"];
,
WriteString[file,"coupxbar = Real(coup1L**2,dp) \n"];
WriteString[file,"Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) \n"];
WriteString[file,"Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) \n"];
WriteString[file,"DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) \n"];
];
,
FFVbar, 
LR=Or@@DiracQ/@{p1,p2,p3};(*check for Dirac particles*)
If[LR,
WriteString[file,"coupxbar = -2*Real(coup1L*conjg(coup1R),dp) \n"];
WriteString[file,"Di_coupxbar = -2*Real(Di_coup1L*conjg(coup1R)+coup1L*conjg(Di_coup1R),dp) \n"];
WriteString[file,"Dj_coupxbar = -2*Real(Dj_coup1L*conjg(coup1R)+coup1L*conjg(Dj_coup1R),dp) \n"];
WriteString[file,"DDcoupxbar = -2*Real(DDcoup1L*conjg(coup1R)+coup1L*conjg(DDcoup1R) &  \n"];
WriteString[file,"&          + Di_coup1L*conjg(Dj_coup1R)+Dj_coup1L*conjg(Di_coup1R)  ,dp) \n"];
,
WriteString[file,"coupxbar = Real(coup1L**2,dp) \n"];
WriteString[file,"Di_coupxbar = Real(2*Di_coup1L*coup1L,dp) \n"];
WriteString[file,"Dj_coupxbar = Real(2*Dj_coup1L*coup1L,dp) \n"];
WriteString[file,"DDcoupxbar = Real(2*DDcoup1L*coup1L + 2*Di_coup1L*Dj_coup1L,dp) \n"];
];
,
gauge,
WriteString[file,"coupx = (coup1)**2 \n"];
WriteString[file,"Di_coupx = 2*coup1*Di_coup1 \n"];
WriteString[file,"Dj_coupx = 2*coup1*Dj_coup1 \n"];
WriteString[file,"DDcoupx = 2*coup1*DDcoup1 + 2*Di_coup1*Dj_coup1 \n"];
];
];


Write2LoopDiagramContributionFirstDerivative[file_,diagram_,type_,resultvar_]:=Block[{NrCoupParticles,i,j,i1,i2,i3,p1,p2,p3,coup1,coup2,ind1,ind2,coup1L,coup1R,coup2L,coup3L,mS1sq,mS2sq,mV1sq,mV2sq,mF1sq,mF2sq,mF1,mF2,FermionList,string,string2,auxstring1,auxstring2,m1sq,m2sq,m3sq,arglist,arglistd,argstring,argstringd,LR,Fermion1,Fermion2,indexFermion1,indexFermion2,colorfactor,Scalar1,Scalar2,Vector1,Vector2,ComplexScalar,functionname,prefactor1="0.0000",prefactor2="0.000",particlelist,templist,WriteColorFactor=True},
NrCoupParticles=Length/@diagram;
p1=Internal[1]/.diagram[[2]];
p2=Internal[2]/.diagram[[2]];
If[NrCoupParticles[[2]]===3,
p3=Internal[3]/.diagram[[2]];
string=StringJoin@Riffle[ToString/@{p1,p2,p3},","];,
string=StringJoin@Riffle[ToString/@{p1,p2},","];
];
WriteString[file,"! ---- "<>string<>" ----\n"];
If[getGen[p1]>1,
WriteString[file,"Do i1=1,"<>ToString[getGen[p1]]<>"\n"];
];
If[getGen[p2]>1,
WriteString[file," Do i2=1,"<>ToString[getGen[p2]]<>"\n"];
];
If[NrCoupParticles[[2]]===3,
If[getGen[p3]>1,
WriteString[file,"    Do i3=1,"<>ToString[getGen[p3]]<>"\n"];
];
];

Switch[NrCoupParticles,
{2,3},
coup1=getSPhenoCoupling2[diagram[[1,1]],SPhenoCouplingsAllreallyAll];
coup2=getSPhenoCoupling2[diagram[[1,2]],SPhenoCouplingsAllreallyAll];
ind1=MakeIndicesCoupling[{p1,i1},{p2,i2},{p3,i3},coup1[[2]]];
ind2=MakeIndicesCoupling[{AntiField[p1],i1},{AntiField[p2],i2},{AntiField[p3],i3},coup2[[2]]];
WriteVertexToFile[1,coup1,ind1,getVertexType[diagram[[1,1]]],file];
WriteVertexToFile[2,coup2,ind2,getVertexType[diagram[[1,2]]],file];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv1","d"];
(*WriteVertexToFileWithPrefix[2,coup2,ind2,getVertexType[diagram[[1,2]]],file,"iv1","d"];*)
arglist=PutMassesInRightOrderList[{{p1,i1},{p2,i2},{p3,i3}},type]; (*to give to MakeCall*)
arglistd=MakeDMassesList[arglist,"d","iv1"];
colorfactor=getColorFactorEffPot[{p1,p2,p3}][[1]];
particlelist={{p1,i1},{p2,i2},{p3,i3}};

Switch[type,
SSS,
prefactor1=DeterminePrefactorString[SSS,p1,p2,p3];
WriteString[file,"coupx=abs(coup1)**2 \n"];
WriteString[file,"dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) \n"];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupx","dcoupx"}],{"'SSS   '"},{"Q2","temp"},file];
,
FFS,
prefactor1=DeterminePrefactorString[FFS,p1,p2,p3];
prefactor2=DeterminePrefactorString[FFSbar,p1,p2,p3];
LR=Or@@DiracQ/@{p1,p2,p3};(*check for Dirac particles*)
If[LR,
WriteString[file,"coupx=(abs(coup1L)**2+abs(coup1R)**2) \n"];
WriteString[file,"dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) \n"];
WriteString[file,"coupxbar=2*Real(coup1L*conjg(coup1R),dp) \n"];
WriteString[file,"dcoupxbar=2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) \n"];,
WriteString[file,"coupx=(abs(coup1L)**2) \n"];
WriteString[file,"dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) \n"];
WriteString[file,"coupxbar=Real(coup1L**2,dp) \n"];
WriteString[file,"dcoupxbar=Real(2*dcoup1L*coup1L,dp) \n"];
];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupx","dcoupx"}],{"'FFS   '"},{"Q2","temp"},file];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupxbar","dcoupxbar"}],{"'FFSbar'"},{"Q2","tempbar"},file];,
SSV,
prefactor1=DeterminePrefactorString[SSV,p1,p2,p3];
WriteString[file,"coupx=abs(coup1)**2\n"];
WriteString[file,"dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) \n"];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupx","dcoupx"}],{"'SSV   '"},{"Q2","temp"},file];
,
VVS, 
prefactor1=DeterminePrefactorString[VVS,p1,p2,p3];
WriteString[file,"coupx=abs(coup1)**2\n"];
WriteString[file,"dcoupx=dcoup1*conjg(coup1)+coup1*conjg(dcoup1) \n"];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupx","dcoupx"}],{"'VVS   '"},{"Q2","temp"},file];
,
FFV,
prefactor1=DeterminePrefactorString[FFV,p1,p2,p3];
prefactor2=DeterminePrefactorString[FFVbar,p1,p2,p3];
LR=Or@@DiracQ/@{p1,p2,p3};
If[LR,
WriteString[file,"coupx=(abs(coup1L)**2+abs(coup1R)**2) \n"];
WriteString[file,"dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L)+dcoup1R*conjg(coup1R)+coup1R*conjg(dcoup1R) \n"];
WriteString[file,"coupxbar=-2*Real(coup1L*conjg(coup1R),dp) \n"];
WriteString[file,"dcoupxbar=-2*Real(dcoup1L*conjg(coup1R)+coup1L*conjg(dcoup1R),dp) \n"];,
WriteString[file,"coupx=(abs(coup1L)**2) \n"];
WriteString[file,"dcoupx=dcoup1L*conjg(coup1L)+coup1L*conjg(dcoup1L) \n"];
WriteString[file,"coupxbar=Real(coup1L**2,dp) \n"];
WriteString[file,"dcoupxbar=Real(2*dcoup1L*coup1L,dp) \n"];
];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupx","dcoupx"}],{"'FFV   '"},{"Q2","temp"},file];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupxbar","dcoupxbar"}],{"'FFVbar'"},{"Q2","temp"},file];
,
gauge,
prefactor1="0._dp";
prefactor1=DeterminePrefactorString[gauge,p1,p2,p3];
WriteString[file,"coupx = (coup1)**2 \n"];
WriteString[file,"dcoupx = 2*coup1*dcoup1 \n"];
MakeCallWithStrings["FirstDerivativeVeff_sunrise",Join[arglist,arglistd,{"coupx","dcoupx"}],{"'gauge '"},{"Q2","temp"},file];

];

,
{1,2},
arglist=PutMassesInRightOrderList[{{p1,i1},{p2,i2}},type];
arglistd=MakeDMassesList[arglist,"d","iv1"];
coup1=getSPhenoCoupling2[diagram[[1,1]],SPhenoCouplingsAllreallyAll];
ind1=MakeIndicesCoupling4[{p1,i1},{AntiField[p1],i1},{p2,i2},{AntiField[p2],i2},coup1[[2]]];
WriteVertexToFile[1,coup1,ind1,getVertexType[diagram[[1,1]]],file];
WriteVertexToFileWithPrefix[1,coup1,ind1,getVertexType[diagram[[1,1]]],file,"iv1","d"];
WriteColorFactor=False;
Switch[type,
SS,
prefactor1=DeterminePrefactorString[SS,p1,p2,None];
MakeCallWithStrings["FirstDerivativeVeff_balls",Join[arglist,arglistd,{"coup1","dcoup1"}],{"'SS'"},{"Q2","temp"},file];,
VS,
(*string="0.25_dp*coup1*Fep_VS";*)
prefactor1="0._dp";
prefactor1=DeterminePrefactorString[VS,p1,p2,None];
MakeCallWithStrings["FirstDerivativeVeff_balls",Join[arglist,arglistd,{"coup1","dcoup1"}],{"'VS'"},{"Q2","temp"},file];
];
];


WriteString[file,"coeff = "<>ToString[prefactor1]<>"\n"];
If[WriteColorFactor,
WriteString[file,"colorfactor = "<>ToString[colorfactor]<>"\n"];
WriteString[file,resultvar<>"="<>resultvar<>" + coeff*colorfactor*temp\n"];,
WriteString[file,resultvar<>"="<>resultvar<>" + coeff*temp\n"];
];
WriteString[file,"if (.not.(temp.eq.temp))  write(*,*) 'NaN at "<>ToString[type]<>" "<>ToString[diagram[[1,1]]]<>"' \n"];
If[type===FFS||type===FFV,
(* additional FFSbar (or FFVbar) contribution *)
WriteString[file,"coeffbar = "<>ToString[prefactor2]<>"\n"];
WriteString[file,resultvar<>"="<>resultvar<>" + coeffbar*colorfactor*tempbar\n"];
];
If[NrCoupParticles[[2]]===3,If[getGen[p3]>1,WriteString[file,"    End Do\n"]]];
If[getGen[p2]>1,WriteString[file,"  End Do\n"]];
If[getGen[p1]>1,WriteString[file,"End Do\n"]];
];






Write2LoopDiagramContribution[file_,diagram_,type_,resultvar_]:=Block[{NrCoupParticles,i,j,i1,i2,i3,p1,p2,p3,coup1,coup2,ind1,ind2,coup1L,coup1R,coup2L,coup3L,mS1sq,mS2sq,mV1sq,mV2sq,mF1sq,mF2sq,mF1,mF2,FermionList,string,string2,auxstring1,auxstring2,m1sq,m2sq,m3sq,argstring,LR,Fermion1,Fermion2,indexFermion1,indexFermion2,colorfactor,Scalar1,Scalar2,Vector1,Vector2,ComplexScalar,prefactor1="1._dp*",prefactor2="2._dp",particlelist,templist,WriteColorFactor=True},
NrCoupParticles=Length/@diagram;
p1=Internal[1]/.diagram[[2]];
p2=Internal[2]/.diagram[[2]];
m1sq=SPhenoMassSq[p1,i1];
m2sq=SPhenoMassSq[p2,i2];
If[NrCoupParticles[[2]]===3,
p3=Internal[3]/.diagram[[2]];
m3sq=SPhenoMassSq[p3,i3];
string=StringJoin@Riffle[ToString/@{p1,p2,p3},","];,
string=StringJoin@Riffle[ToString/@{p1,p2},","];
];
WriteString[file,"! ---- "<>string<>" ----\n"];
WriteString[file,"temp=0._dp\n"];
If[getGen[p1]>1,
WriteString[file,"Do i1=1,"<>ToString[getGen[p1]]<>"\n"];
];
If[getGen[p2]>1,
WriteString[file," Do i2=1,"<>ToString[getGen[p2]]<>"\n"];];
If[NrCoupParticles[[2]]===3,
If[getGen[p3]>1,
WriteString[file,"    Do i3=1,"<>ToString[getGen[p3]]<>"\n"];
];
];
string="0._dp";
Switch[NrCoupParticles,
{2,3},

coup1=getSPhenoCoupling2[diagram[[1,1]],SPhenoCouplingsAllreallyAll];
coup2=getSPhenoCoupling2[diagram[[1,2]],SPhenoCouplingsAllreallyAll];

ind1=MakeIndicesCoupling[{p1,i1},{p2,i2},{p3,i3},coup1[[2]]];
ind2=MakeIndicesCoupling[{AntiField[p1],i1},{AntiField[p2],i2},{AntiField[p3],i3},coup2[[2]]];
WriteVertexToFile[1,coup1,ind1,getVertexType[diagram[[1,1]]],file];
WriteVertexToFile[2,coup2,ind2,getVertexType[diagram[[1,2]]],file];
argstring=PutMassesInRightOrderString[{{p1,i1},{p2,i2},{p3,i3}},type];
colorfactor=getColorFactorEffPot[{p1,p2,p3}][[1]];
particlelist={{p1,i1},{p2,i2},{p3,i3}};
Switch[type,
SSS,
prefactor1=DeterminePrefactorStringSSS[p1,p2,p3];
string=prefactor1<>"*abs(coup1)**2*Fep_SSS"<>argstring;,
FFS,
templist=Select[particlelist,getType[#[[1]]]===F&];
Fermion1=templist[[1,1]];
indexFermion1=templist[[1,2]];
Fermion2=templist[[2,1]];
indexFermion2=templist[[2,2]];
mF1=SPhenoMass[Fermion1,indexFermion1];
mF2=SPhenoMass[Fermion2,indexFermion2];
LR=Or@@DiracQ/@{p1,p2,p3};(*check for Dirac particles*)
If[LR,
auxstring1="(abs(coup1L)**2+abs(coup1R)**2)";
auxstring2="2*Real(coup1L*conjg(coup1R),dp)";,
auxstring1="(abs(coup1L)**2)";
	    auxstring2="Real(coup1L**2,dp)";
];
If[(Fermion1/.bar[a_]->a)===(Fermion2/.bar[a_]->a),
prefactor1="0.5_dp*";
prefactor2="0.5_dp*";,
prefactor1="";
prefactor2="";
];
(*FFS contribution*)
string=prefactor1<>auxstring1<>"*Fep_FFS"<>argstring;
(*FFSbar contribution*)
string2=prefactor2<>auxstring2<>"*"<>ToString[mF1]<>"*"<>ToString[mF2]<>"*Fep_FFSbar"<>argstring;,
SSV,
templist=Select[particlelist,getType[#[[1]]]===S&];
Scalar1=templist[[1,1]];
Scalar2=templist[[2,1]];
If[(Scalar1/.conj[a_]->a)===(Scalar2/.conj[a_]->a),
prefactor1="0.5_dp*"; ,
prefactor1="";
];
string=prefactor1<>"abs(coup1)**2*Fep_SSV"<>argstring;,
VVS, 
templist=Select[particlelist,getType[#[[1]]]===V&];
Vector1=templist[[1,1]];
Vector2=templist[[2,1]];
If[(Vector1/.conj[a_]->a)===(Vector2/.conj[a_]->a),
prefactor1="0.5_dp*0.25_dp"; ,
prefactor1="1.0_dp*0.25_dp";
];
string=prefactor1<>"0.25_dp*abs(coup1)**2*Fep_VVS"<>argstring;,
FFV,
LR=Or@@DiracQ/@{p1,p2,p3};
If[LR,
auxstring1="(abs(coup1L)**2+abs(coup1R)**2)";
auxstring2="2*Real(-coup1L*conjg(coup1R),dp)";,
auxstring1="(abs(coup1L)**2)";
	    auxstring2="Real(coup1L**2,dp)";
];
templist=Select[particlelist,getType[#[[1]]]===F&];
Fermion1=templist[[1,1]];
indexFermion1=templist[[1,2]];
Fermion2=templist[[2,1]];
indexFermion2=templist[[2,2]];
If[(Fermion1/.bar[a_]->a)===(Fermion2/.bar[a_]->a),
prefactor1="0.5_dp*";
prefactor2="0.5_dp*";,
prefactor1="";
prefactor2="";
];
(* FFV contribution *)
string=prefactor1<>auxstring1<>"*Fep_FFV"<>argstring;
(*FFVbar contribution*)
mF1=SPhenoMass[Fermion1,indexFermion1];
mF2=SPhenoMass[Fermion2,indexFermion2];
string2=prefactor2<>auxstring2<>"*"<>ToString[mF1]<>"*"<>ToString[mF2]<>"*Fep_FFVbar"<>argstring;
,
VVV,
string="1._dp/12._dp*(coup1)**2*Fep_gauge"<>argstring;
];
,
{1,2},
argstring=PutMassesInRightOrderString[{{p1,i1},{p2,i2}},type];
colorfactor=1;
coup1=getSPhenoCoupling2[diagram[[1,1]],SPhenoCouplingsAllreallyAll];
ind1=MakeIndicesCoupling4[{p1,i1},{AntiField[p1],i1},{p2,i2},{AntiField[p2],i2},coup1[[2]]];
WriteVertexToFile[1,coup1,ind1,getVertexType[diagram[[1,1]]],file];
Switch[type,
SS,
WriteColorFactor=False;
prefactor1=GetPrefactorStringSS[p1,p2];
string=prefactor1<>"*(-coup1)*Fep_SS"<>argstring;,
VS,
WriteColorFactor=False;
string="0.25_dp*coup1*Fep_VS"<>argstring;
];
];
If[WriteColorFactor,
WriteString[file,"colorfactor="<>ToString[colorfactor]<>"\n"];
WriteString[file,"temp=temp+colorfactor*"<>string<>"\n "];,
WriteString[file,"temp=temp+"<>string<>"\n"];
];
WriteString[file,"if (.not.(temp.eq.temp))  write(*,*) 'NaN at "<>ToString[type]<>" "<>ToString[diagram[[1,1]]]<>"' \n"];
If[type===FFS||type===FFV,
(* additional FFSbar (or FFVbar) contribution *)
WriteString[file,"temp=temp+colorfactor*"<>string2<>"\n"];
];
If[NrCoupParticles[[2]]===3,If[getGen[p3]>1,WriteString[file,"    End Do\n"]]];
If[getGen[p2]>1,WriteString[file,"  End Do\n"]];
If[getGen[p1]>1,WriteString[file,"End Do\n"]];
WriteString[file,resultvar<>"=temp\n"];
];


PutMassesInRightOrderString[particles_,type_]:=Block[{orderingFunc,riffled,ordered},
Switch[type,
FFS,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===S)&;,
FFSbar,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===S)&;,
SSV,
orderingFunc=(getType[#1[[1]]]===S&&getType[#2[[1]]]===V)&;,
VVS,
orderingFunc=(getType[#1[[1]]]===V&&getType[#2[[1]]]===S)&;,
FFV,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===V)&;,
FFVbar,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===V)&;,
VS,
orderingFunc=(getType[#1[[1]]]===V&&getType[#2[[1]]]===S)&;
];
ordered=(ToString@SPhenoMassSq[#[[1]],#[[2]]])/.{"0."->"0._dp"}&/@Sort[particles,orderingFunc];
riffled=Riffle[ordered,","];
Return["("<>(StringJoin@@riffled)<>",Qscale)"];
];



PutMassesInRightOrderList[particles_,type_]:=Block[{orderingFunc,riffled,ordered},
Switch[type,
FFS,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===S)&;,
FFSbar,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===S)&;,
SSV,
orderingFunc=(getType[#1[[1]]]===S&&getType[#2[[1]]]===V)&;,
VVS,
orderingFunc=(getType[#1[[1]]]===V&&getType[#2[[1]]]===S)&;,
FFV,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===V)&;,
FFVbar,
orderingFunc=(getType[#1[[1]]]===F&&getType[#2[[1]]]===V)&;,
VS,
orderingFunc=(getType[#1[[1]]]===V&&getType[#2[[1]]]===S)&;
];
ordered=((ToString@SPhenoMassSq[#[[1]],#[[2]]])/.{"0."->"0._dp"})&/@Sort[particles,orderingFunc];
Return[ordered];
];


MakeListNeededCouplingsSPhenoEffPot[diagrams_]:=Block[{couplings,SPhenoCouplings},
couplings=#[[1]]&/@diagrams;
couplings=Intersection[Flatten[couplings]];
(*remove ghost couplings*)
couplings=Select[couplings,!(Or@@(getType[#]===G&/@#))&];
SPhenoCouplings=getSPhenoCoupling2[#,SPhenoCouplingsAll][[1]]&/@couplings;
Return[Flatten@SPhenoCouplings];
];


DeterminePrefactorStringSSS[p1_,p2_,p3_]:=Block[{p1real,p2real,p3real,EqualParticles=0,TwoConjugates=False,AllReal=False,prefactor="0._dp"},
(* check relations of the particles *)
p1real=(conj[p1]===p1);
p2real=(conj[p2]===p2);
p3real=(conj[p3]===p3);
If[p1real&&p2real&&p3real,AllReal=True];
If[(p1===p2)||(p1===p3)||(p2===p3),EqualParticles=2];
If[(p1===conj[p2])||(p1===conj[p3])||(p2===conj[p3]),TwoConjugates=True];
If[(p1===p2)&&(p2===p3),EqualParticles=3];
(* assign prefactor depending on the relations *)
If[AllReal,
Switch[EqualParticles,
0,
prefactor="0.5_dp";,
2,
prefactor="0.25_dp";,
3,
prefactor="1._dp/12._dp"; (*here: coupling constant is real*)
];, (* one or more are complex *)
Switch[EqualParticles,
0,
If[TwoConjugates,
  If[p1real||p2real||p3real,
  prefactor="0.5_dp";,
  prefactor="1._dp";
  ];,
prefactor="1._dp";
];,
2,
prefactor="0.5_dp";,
3,
prefactor="1._dp/6._dp"; (*coupling constant can be complex*)
];
];
Return[prefactor];
];


DeterminePrefactorString[type_,p1_,p2_,p3_]:=Block[{HasDiracFermion=False,HasFermions=False,TwoParticles=False,p1real=False,p2real=False,p3real=False,FermionList={},Fermion1,Fermion2,prefactor="0._dp",AllReal=False,EqualParticles=0,ScalarList={},VectorList={}},
If[(type===SS)||(type===VS),TwoParticles=True];
If[(type===FFS)||(type===FFV)||(type===FFSbar)||(type===FFVbar),HasFermions=True;];
FermionList=Select[{p1,p2,p3},getType[#]===F&];
If[HasFermions,
Fermion1=FermionList[[1]];
Fermion2=FermionList[[2]];
HasDiracFermion=Or@@DiracQ/@FermionList;(*check for Dirac particles*)
];
If[Not[HasFermions],
p1real=(conj[p1]===p1);
p2real=(conj[p2]===p2);
];
If[Not[TwoParticles],
p3real=(conj[p3]===p3);
];
Switch[type,
SSS,
prefactor=DeterminePrefactorStringSSS[p1,p2,p3];
,
FFS,
If[(Fermion1/.{bar[a_]->a})===(Fermion2/.{bar[a_]->a}),EqualParticles=2];
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp";
]; (*holds for DD/DM/MM case*)
,
FFSbar,
If[(Fermion1/.{bar[a_]->a})===(Fermion2/.{bar[a_]->a}),EqualParticles=2];
If[HasDiracFermion,
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp";
];,
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp"
];
];,
FFV,
If[(Fermion1/.{bar[a_]->a})===(Fermion2/.{bar[a_]->a}),EqualParticles=2];
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp";
];, (*holds for DD/DM/MM case*)
FFVbar,
If[(Fermion1/.{bar[a_]->a})===(Fermion2/.{bar[a_]->a}),EqualParticles=2];
If[HasDiracFermion,
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp";
];,
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp"
];
];,
SSV,
ScalarList=Select[{p1,p2,p3},getType[#]===S&];
If[((ScalarList[[1]]/.{conj[a_]->a})===(ScalarList[[2]]/.{conj[a_]->a})),EqualParticles=2];
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp";
];
,
VVS,
VectorList=Select[{p1,p2,p3},getType[#]===V&];
If[((VectorList[[1]]/.{conj[a_]->a})===(VectorList[[2]]/.{conj[a_]->a})),EqualParticles=2];
If[EqualParticles===2,
prefactor="0.5_dp",
prefactor="1._dp";
];
,
SS,
prefactor=GetPrefactorStringSS[p1,p2];
,
VS,
prefactor="0._dp";,
gauge,
prefactor="0._dp";
];
Return[prefactor];
];


GetPrefactorStringSS[p1_,p2_]:=Block[{p1real,p2real,Equal,prefactor},
p1real=(conj[p1]===p1);
p2real=(conj[p2]===p2);
Equal=((p1/.{conj[a_]->a})===(p2/.{conj[a_]->a}));
If[p1real&&p2real,
If[Equal,
prefactor="(-1._dp/8._dp)";, (* both real and equal *)
prefactor="(-0.25_dp)"; (* both real and different *)
];, (*at least one complex *)
If[p1real||p2real,
(* one is real *)
prefactor = "(-0.5_dp)";,
(* both are complex *)
If[Equal,
(* both complex and equal *)
prefactor="(-0.5_dp)";,
(* both complex and different *)
prefactor="(-1._dp)";
];
];
];
Return[prefactor];
];


WriteVertexToFileWithPrefix[nr_, name_, ind_, type_, file_,vevindex_,prefix_]:=WriteVertexToFileWithPrefix[nr, name, ind, type, file,vevindex,prefix,prefix]; 
(*if you just give one prefix, it's    prefix coup1L = prefix cplcSdSdhh(..)     *)
WriteVertexToFileWithPrefix[nr_, name_, ind_, type_, file_,vevindex_,prefix_,prefixcoupling_]:=
  Block[{index},
If[ind[[1]]===""||ind[[1]]===Null,
index="("<>vevindex<>")";,
index=StringReplace[ind[[1]],")"->","<>vevindex<>")"];
];
Switch[type, 
FFV, 
If[ind[[2]] == False, 
WriteString[file, StringJoin[prefix,"coup", ToString[nr], "L = ", 
          prefixcoupling<>ToString[name[[1,1]]], index, "\n"]]; 
WriteString[file, StringJoin[prefix,"coup", ToString[nr], "R = ", 
          prefixcoupling<>ToString[name[[1,2]]], index, "\n"]]; 
SA`SubSPhenoTeXVertex = 
         {StringJoin[prefix,"coup", ToString[nr], "L"] -> StringJoin[prefixcoupling,TeXOutput[name[[1,1]]], "_", 
            TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> 
                j3, i4 -> j4}]], StringJoin[prefix,"coup", ToString[nr], "R"] -> StringJoin[prefixcoupling,TeXOutput[name[[1,2]]], "_", 
            TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> 
                j3, i4 -> j4}]]}; ,
 WriteString[file, StringJoin[prefix,"coup", ToString[nr], "L = Conjg(", 
          prefixcoupling<>ToString[name[[1,1]]], index, ")\n"]]; 
WriteString[file, StringJoin[prefix,"coup", ToString[nr], "R = Conjg(", 
          prefixcoupling<>ToString[name[[1,2]]], index, ")\n"]]; 
SA`SubSPhenoTeXVertex = 
         {StringJoin[prefix,"coup", ToString[nr], "L"] -> StringJoin["(",prefixcoupling, TeXOutput[name[[1,1]]], "_", 
            TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> 
                j3, i4 -> j4}], ")^*"], StringJoin[prefix,"coup", ToString[nr], "R"] -> StringJoin["(", prefixcoupling,
            TeXOutput[name[[1,2]]], "_", TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. 
              {i1 -> j1, i2 -> j2, i3 -> j3, i4 -> j4}], ")^*"]}; ]; , 
FFS, 
     If[ind[[2]] == False, WriteString[file, StringJoin[prefix,"coup", ToString[nr], "L = ", prefixcoupling<>ToString[name[[1,1]]], 
          index, "\n"]]; WriteString[file, StringJoin[prefix,"coup", ToString[nr], "R = ", prefixcoupling<>ToString[name[[1,2]]], 
          index, "\n"]]; 
SA`SubSPhenoTeXVertex = {StringJoin[prefix,"coup", ToString[nr], "L"] -> 
           StringJoin[prefixcoupling,TeXOutput[name[[1,1]]], "_", TeXOutput[ToExpression[StringReplace[index, 
                {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> j3, i4 -> j4}]], 
          StringJoin[prefix,"coup", ToString[nr], "R"] -> StringJoin[prefixcoupling,TeXOutput[name[[1,2]]], "_", 
            TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> 
                j3, i4 -> j4}]]}; , WriteString[file, StringJoin[prefix,"coup", ToString[nr], "R = Conjg(", 
          prefixcoupling<>ToString[name[[1,1]]], index, ")\n"]]; WriteString[file, StringJoin[prefix,"coup", ToString[nr], "L = Conjg(", 
          prefixcoupling<>ToString[name[[1,2]]], index, ")\n"]]; 
SA`SubSPhenoTeXVertex = 
         {StringJoin[prefix,"coup", ToString[nr], "R"] -> StringJoin["(",prefixcoupling, TeXOutput[name[[1,1]]], "_", 
            TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> 
                j3, i4 -> j4}], ")^*"], StringJoin[prefix,"coup", ToString[nr], "L"] -> StringJoin["(", prefixcoupling,
            TeXOutput[name[[1,2]]], "_", TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. 
              {i1 -> j1, i2 -> j2, i3 -> j3, i4 -> j4}], ")^*"]}; ]; , _, 
     If[ind[[2]] == False, WriteString[file, StringJoin[prefix,"coup", ToString[nr], " = ", prefixcoupling<>ToString[name[[1,1]]], index, 
          "\n"]]; If[(name[[1,1]]/Abs[name[[1,1]]] /. Abs[x_] -> x) === -1, 
         SA`SubSPhenoTeXVertex = {StringJoin[prefix,"coup", ToString[nr]] -> StringJoin["(", prefixcoupling,TeXOutput[name[[1,1]]], "_", 
              TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, 
                 i3 -> j3, i4 -> j4}], ")"]}; , 
SA`SubSPhenoTeXVertex = {StringJoin[prefix,"coup", ToString[nr]] -> 
             StringJoin[prefixcoupling,TeXOutput[name[[1,1]]], "_", TeXOutput[ToExpression[StringReplace[index, 
                  {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> j3, i4 -> j4}]]}; ]; , 
       WriteString[file, StringJoin[prefix,"coup", ToString[nr], " = Conjg(", prefixcoupling<>ToString[name[[1,1]]], index, ")\n"]]; 
        SA`SubSPhenoTeXVertex = {StringJoin[prefix,"coup", ToString[nr]] -> StringJoin["(", prefixcoupling,TeXOutput[name[[1,1]]], "_", 
            TeXOutput[ToExpression[StringReplace[index, {"(" -> "{", ")" -> "}"}]] /. {i1 -> j1, i2 -> j2, i3 -> 
                j3, i4 -> j4}], ")^*"]}; 
];
 ];
 ];





MakeCallWithStrings[name_,list1_,list2_,list3_,file_]:=Block[{i,string},
string="Call "<>ToString[name]<>"(";
For[i=1,i<=Length[list1],i++;,
string=string<>list1[[i]]<>",";

];
For[i=1,i<=Length[list2],i++;,
string=string<>list2[[i]]<>",";
];
For[i=1,i<=Length[list3],i++;,
string=string<>list3[[i]];
If[i<Length[list3],string=string<>",";];
];
string=string<>")\n";
WriteString[file,FortranLineBreak[string]];
];


MakeDMassesList[arglist_,prefix_,vevindex_]:=Block[{i,mass,dmass,arglistd={}},
For[i=1,i<=Length[arglist],i++;,
mass=arglist[[i]];
If[StringTake[mass,{-1}]===")",
dmass=prefix<>StringReplace[arglist[[i]],")"->","<>vevindex<>")"];,
dmass=prefix<>arglist[[i]]<>"(1,"<>vevindex<>")";
If[mass==="0._dp",dmass="ZeroC";];
];
arglistd=Append[arglistd,dmass];
];
Return[arglistd];
];
