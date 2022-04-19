(* ::Package:: *)

(* ::Input::Initialization:: *)
GenerateUnitarityConstraints:=Block[{},

FHUnit=OpenWrite[ToFileName[$sarahCurrentOutputDir,"Unitarity.m"]];
WriteString[FHUnit,"{\n"];
(*
(* remove Goldstones everywhere ? *)
UnitarityWithoutGoldstones=True;
*)
Print[StyleForm["Write routines to calculate tree-level unitarity constraints","Section",FontSize->12]];

sphenoUni=OpenWrite[ToFileName[$sarahCurrentSPhenoDir,"Unitarity_"<>ModelName<>".f90"]];

WriteCopyRight[sphenoUni];

WriteString[sphenoUni,"Module Unitarity_"<>ModelName<>" \n \n"];
WriteString[sphenoUni, "Use Control \n"];
WriteString[sphenoUni, "Use Settings \n"];
WriteString[sphenoUni, "Use LoopFunctions \n"];
WriteString[sphenoUni, "Use Mathematics \n"];
WriteString[sphenoUni, "Use Model_Data_"<>ModelName<>" \n"];
WriteString[sphenoUni, "Use RGEs_"<>ModelName<>" \n"];
WriteString[sphenoUni, "Use LoopMasses_"<>ModelName<>" \n"];
WriteString[sphenoUni, "Use TreeLevelMasses_"<>ModelName<>" \n"];
WriteString[sphenoUni, "Use Couplings_"<>ModelName<>" \n"];
WriteString[sphenoUni,"Use Tadpoles_"<>ModelName<>" \n "];


WriteString[sphenoUni, "Use StandardModel \n \n"];

WriteString[sphenoUni,"Logical :: IncludeGoldstoneContributions=.true. \n"];
WriteString[sphenoUni,"Logical :: IncludeGoldstoneExternal=.true. \n"];
(*
WriteString[sphenoUni,"Logical :: IncludeVectorContributions=.false. \n"];
WriteString[sphenoUni,"Logical :: Ignore_TUpoles_Dieter=.true. \n"];
WriteString[sphenoUni,"Logical :: Ignore_TUpoles_Mine=.false. \n"];
WriteString[sphenoUni,"Logical :: Ignore_Spoles=.false. \n"];
WriteString[sphenoUni,"Logical :: Ignore_Tpoles=.false. \n"];
WriteString[sphenoUni,"Logical :: Ignore_Upoles=.false. \n"];
WriteString[sphenoUni,"Logical :: Hard_Cut_Poles=.false. \n"];
*)
WriteString[sphenoUni,"Logical :: AddR=.true. \n"];
WriteString[sphenoUni,"Real(dp) :: cut_elements = 0.0001_dp \n"];
WriteString[sphenoUni,"Real(dp) :: cut_amplitudes = 0.01_dp \n"];

WriteString[sphenoUni,"Logical :: Ignore_poles=.false. \n \n"];

WriteString[sphenoUni, "Contains \n\n"];

GenerateTreeLevelUni;
WriteUnitarityFull;
WriteIntegrals;



WriteString[sphenoUni,"End Module Unitarity_"<>ModelName<>" \n"];
Close[sphenoUni];
WriteString[FHUnit,"0};\n"];
Close[FHUnit];

];

getColourProducts[{a_,b_},group_,snogroup_]:=Block[{res={},rr,singlet},
dyn1=SA`DynL[a,group];
dyn2=SA`DynL[b,group];
rr=Length[dyn1];
singlet=Array[0&,{rr}];
(* 1 x 1 *)
If[dyn1==={0} && dyn2==={0},
Return[{{{0}},1}];
];

(* 1 x Z *)
If[dyn1==={0},
Return[{{dyn2},1}];
];

(* Z x 1 *)
If[dyn2==={0},
Return[{{dyn1},1}];
];
(*res=Transpose[ReduceRepProduct[snogroup,{dyn1,dyn2}]][[1]]/.{singlet\[Rule]{0}};
Return[res];*)
res=Transpose[ReduceRepProduct[snogroup,{dyn1,dyn2}]];
Return[{res[[1]]/.{singlet->{0}},res[[2]]}];
];



getCP[{a_,b_}]:=Block[{tp,ptp,ctp,cptp,coptp,gens,conjtp},
tp={a,b}/.{A_[{x__}]->A};
conjtp=conj/@tp;
ptp=Simplify[Times@@tp];

ctp=myCP/@tp;
cptp=Simplify[Times@@ctp];
If[conjtp===tp,
(* only real fields \[Rule] easy case *)
If[cptp===ptp,
Return[{1}];,
Return[{-1}];
];
];

(* At least one complex field *)
(* Pairs of f g, ff etc don't have a definite CP; if they can mix with f fbar then they are neutral. But f fbar can only have odd cp if > 1 generation *)
If[OrderlessPatternSequence[a,b]===OrderlessPatternSequence[conjtp[[1]],conjtp[[2]]],
gens=getGen/@tp;
If[Max[gens]==1,
(* Not possible to have an antisymmetric combination *)
If[cptp===ptp,
Return[{1}];,
Return[{-1}];
];
,
Return[{1,-1}];
];
,
Return[{0}];
];

(* Should never be here *)

Print[tp,"Why here?"];
Return[{1,-1}];

];


getColorProducts[{a_,b_}]:=Block[{res={}},
dyn1=SA`DynL[a,color];
dyn2=SA`DynL[b,color];
(* 1 x 1 *)
If[dyn1==={0} && dyn2==={0},
Return[{{0,0}}];
];

(* 1 x Z *)
If[dyn1==={0},
Return[{dyn2}];
];

(* Z x 1 *)
If[dyn2==={0},
Return[{dyn1}];
];

Return[Transpose[ReduceRepProduct[SU3,{dyn1,dyn2}]][[1]]];


];



WriteUnitarityFull:=Block[{i,mi,mj,mk},
(* get all scalars (inlcuding the complex conjugated ones) *)
partS=Transpose[PART[S]][[1]];
(* partS=Select[partS,FreeQ[getIndizes[#],color]&]; *)
partS=Select[partS,FreeQ[RemoveParticlesFromScattering,#]&];

partS=Intersection[Join[partS,conj/@partS]];

partV=Transpose[PART[V]][[1]];
partV=Intersection[Join[partV,conj/@partV]];


If[UNITARITYCP===True,
Block[{pp,pos,ff,fac},
Clear[myCP];
(* define CP for each state *)
For[mi=1,mi<=Length[partS],mi++,
pp=partS[[mi]];
If[conj[pp]=!=pp,
myCP[pp]=conj[pp];
,
If[!FreeQ[Particles[GaugeES],pp],
myCP[pp]=pp;
,
pos=Position[DEFINITION[CurrentStates][MatterSector],pp];
If[pos=!={},
ff=DEFINITION[CurrentStates][MatterSector][[pos[[1,1]],1,1]];
,
ff=pp;
];
pos=Position[DEFINITION[CurrentStates][VEVs],ff];
If[pos=!={},
fac=DEFINITION[CurrentStates][VEVs][[pos[[1,1]],pos[[1,2]],2]];
myCP[pp]=pp*Simplify[Conjugate[fac]/fac];
];
];

]
];
];
];(* end If[UNITARITYCP===True,*)


(*
(* 3- and 4- tuples => to get vertices *)
tup3=Intersection[Sort/@Tuples[partS,{3}]];
tup3=Select[tup3,Plus@@(getElectricCharge/@#)\[Equal]0&];
tup4=Intersection[Sort/@Tuples[partS,{4}]];
tup4=Select[tup4,Plus@@(getElectricCharge/@#)\[Equal]0&];

tup3V=Intersection[Sort/@Tuples[Join[partS,partV],{3}]];
tup3V=Select[tup3V,Count[getType/@#,S]\[Equal]2&];
tup3V=Select[tup3V,Plus@@(getElectricCharge/@#)\[Equal]0&];

vertexlist3=getVertices[tup3,approx];
vertexlist3V=getVertices[tup3V,approx];
vertexlist4=getVertices[tup4,approx];
*)
scattering22=Select[Intersection[Tuples[partS,{4}] /. {a_,b_,c_,d_}:>{Sort[{a,b}],Sort[{c,d}]}],Plus@@(getElectricCharge/@#[[1]])===-Plus@@(getElectricCharge/@#[[2]])&];
(* get all pairs for initial/final states *)
scatteringPairs=Intersection[Tuples[partS,{2}]/. {a_,b_}:>Sort[{a,b}]] ;

(* sort it differently now ... categorise each *)

(* keep only singlets from groups other than colour?*)
scatteringPairsCharges={};
differentColourMultiplets={};
ColourMultiplicities={};
Block[{mycharge,pos,mycharges,coldat,multdat,tcdat,multiplicities},
mycharges=Map[getElectricCharge[#]&,scatteringPairs,{2}]/.{a_?NumericQ,b_?NumericQ}->a+b;
For[mi=1,mi<=Length[scatteringPairs],mi++,
mycharge=mycharges[[mi]];
If[mycharge>=0,

coldat={};
multdat={};
For[mj=1,mj<=Length[unitarityGroupData],mj++,
tcdat=getColourProducts[scatteringPairs[[mi]],unitarityGroupData[[mj,1]],unitarityGroupData[[mj,3]]];
AppendTo[coldat,tcdat[[1]]];
AppendTo[multdat,tcdat[[2]]];
];
If[Length[multdat]>1,
multiplicities=Flatten[Outer[Times,Sequence@@multdat]];
,
multiplicities=Flatten[multdat];
];

If[UNITARITYCP=!=True,
ColourMultiplets=Tuples[Join[{{{mycharge}}},coldat]];
(*ColourMultiplets=Tuples[Join[{{{mycharge}}},Table[getColourProducts[scatteringPairs[[mi]],unitarityGroupData[[mj,1]],unitarityGroupData[[mj,3]]],{mj,1,Length[unitarityGroupData]}]]];*)
,
mycp=getCP[scatteringPairs[[mi]]];
ColourMultiplets=Tuples[Join[{{{mycharge}}},{{{mycp[[1]]}}},coldat]];
If[Length[mycp]>1,
ColourMultiplets=Join[ColourMultiplets,Tuples[Join[{{{mycharge}}},{{{mycp[[2]]}}},coldat]]];
multiplicities=Join[multiplicities,multiplicities];
];
(*
ColourMultiplets=Tuples[Join[{{{mycharge}}},{{{mycp[[1]]}}},Table[getColourProducts[scatteringPairs[[mi]],unitarityGroupData[[mj,1]],unitarityGroupData[[mj,3]]],{mj,1,Length[unitarityGroupData]}]]];
If[Length[mycp]>1,
ColourMultiplets=Join[ColourMultiplets,Tuples[Join[{{{mycharge}}},{{{mycp[[2]]}}},Table[getColourProducts[scatteringPairs[[mi]],unitarityGroupData[[mj,1]],unitarityGroupData[[mj,3]]],{mj,1,Length[unitarityGroupData]}]]]];
];
*)
];

For[mj=1,mj<=Length[ColourMultiplets],mj++,
If[FreeQ[differentColourMultiplets,ColourMultiplets[[mj]]],
AppendTo[differentColourMultiplets,{ColourMultiplets[[mj]]}];
AppendTo[scatteringPairsCharges,{ColourMultiplets[[mj]],{scatteringPairs[[mi]]}}];
AppendTo[ColourMultiplicities,{ColourMultiplets[[mj]],{multiplicities[[mj]]}}];
,
pos=Position[scatteringPairsCharges,ColourMultiplets[[mj]]];
If[pos=={},
Print["Error in unitarity routine!"];,
AppendTo[scatteringPairsCharges[[pos[[1,1]],2]],scatteringPairs[[mi]]];
AppendTo[ColourMultiplicities[[pos[[1,1]],2]],multiplicities[[mj]]];
];
];
]
]
]
];
(*
If[UNITARITYCP===True,
scatteringPairsChargesCP=scatteringPairsCharges;
scatteringPairsCharges=DeleteDuplicates[Delete[#,{1,2}]&/@scatteringPairsCharges];
ColourMultiplicities=DeleteDuplicates[Delete[#,{1,2}]&/@ColourMultiplicities];
];
*)
GenerateTreeLevelUniWithTrilinears;
];

GenerateTreeLevelUniWithTrilinears:=Block[{i,j,k,dim,x1,x2,row,column,x2start,x3,x4,x4start,x1start,x3start,pF1,pF2,colorprod,ldim,rdim,il,ir,genlists,rowcolumncoords,trowcolumncoords,gencolprods,addCPflag},

Print["  Write 'Tree-Level Unitarity Limits including trilinear couplings'"];

MakeSubroutineTitle["ScatteringEigenvaluesWithTrilinears",Flatten[{Map[ToExpression[SPhenoForm[#]<>"input"]&,Join[NewMassParameters,listVEVs,listAllParameters]]}],{} ,{"delta0","kont"},sphenoUni];

WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni, "Integer, Intent(inout) :: kont \n"];
WriteString[sphenoUni, "Integer :: ierr \n"];
WriteString[sphenoUni, "Logical :: Pole_Present, SPole_Present, TPole_Present, UPole_Present, any_pole_present \n"];
WriteString[sphenoUni, "Integer :: RemoveTUpoles(99) \n"]; 
WriteString[sphenoUni, "Integer :: best_submatrix \n"]; 
MakeVariableList[listAllParameters,"",sphenoUni];
MakeVariableList[listVEVs,"",sphenoUni];
(*MakeVariableList[namesAllreallyAll,"",sphenoUni];*)
(*MakeVariableList[namesColoredQuartics,"",sphenoUni];*)
MakeVariableList[namesstructures,"",sphenoUni];
MakeVariableList[NewMassParameters,"",sphenoUni];
MakeVariableList[Map[ToExpression[SPhenoForm[#]<>"input"]&,listAllParametersAndVEVs],",Intent(in)",sphenoUni];
MakeVariableList[Map[ToExpression[SPhenoForm[#]<>"input"]&,NewMassParameters],",Intent(in)",sphenoUni];

genlists={};
rowcolumncoords={};
For[i=1,i<=Length[scatteringPairsCharges],
(*
If[UnitarityWithoutGoldstones===True,
dim =Plus@@(scatteringPairsCharges[[i,2]] /. {a_,b_}\[RuleDelayed]If[a===b,(getGen[a]-getGenSPhenoStart[a]+1)^2-((getGen[a]-getGenSPhenoStart[a]+1)^2-(getGen[a]-getGenSPhenoStart[a]+1))/2,(getGen[a]-getGenSPhenoStart[a]+1)*(getGen[b]-getGenSPhenoStart[b]+1)]/;Head[a]=!=List && Head[b]=!=List);,
dim =Plus@@(scatteringPairsCharges[[i,2]] /. {a_,b_}\[RuleDelayed]If[a===b,(getGen[a])^2-((getGen[a])^2-(getGen[a]))/2,(getGen[a])*(getGen[b])]/;Head[a]=!=List && Head[b]=!=List);
];
*)

If[UNITARITYCP===True,
Switch[scatteringPairsCharges[[i,1,2,1]],
1,
AppendTo[genlists,(scatteringPairsCharges[[i,2]]/.{a_,b_}:>(getGen[a])^2-((getGen[a])^2-(getGen[a]))/2/;Head[a]=!=List && Head[b]=!=List)]
,
-1,
AppendTo[genlists,(scatteringPairsCharges[[i,2]]/.{a_,b_}:>If[a===conj[b],(getGen[a])^2-((getGen[a])^2+(getGen[a]))/2,(getGen[a])*(getGen[b])]/;Head[a]=!=List && Head[b]=!=List)]
,
_,
AppendTo[genlists,(scatteringPairsCharges[[i,2]]/.{a_,b_}:>If[a===b,(getGen[a])^2-((getGen[a])^2-(getGen[a]))/2,(getGen[a])*(getGen[b])]/;Head[a]=!=List && Head[b]=!=List)]

];
,
AppendTo[genlists,(scatteringPairsCharges[[i,2]]/.{a_,b_}:>If[a===b,(getGen[a])^2-((getGen[a])^2-(getGen[a]))/2,(getGen[a])*(getGen[b])]/;Head[a]=!=List && Head[b]=!=List)]
];

(*
dim =Plus@@(scatteringPairsCharges[[i,2]] /. {a_,b_}\[RuleDelayed]If[a===b,(getGen[a])^2-((getGen[a])^2-(getGen[a]))/2,(getGen[a])*(getGen[b])]/;Head[a]=!=List && Head[b]=!=List);*)



	
(*dim =Dot[ColourMultiplicities[[i,2]],genlists[[i]]];*)
gencolprods=ColourMultiplicities[[i,2]]*genlists[[i]];
trowcolumncoords={1};
trowcolumncoords=(AppendTo[trowcolumncoords,trowcolumncoords[[-1]]+#]&/@gencolprods)[[-1]];
dim=trowcolumncoords[[-1]]-1;
AppendTo[rowcolumncoords,trowcolumncoords];
sdim[i]=dim;

If[dim>1,
WriteString[sphenoUni, "Complex(dp) :: scatter_matrix"<>ToString[i]<>"("<>ToString[dim]<>","<>ToString[dim]<>") \n"]; 
WriteString[sphenoUni, "Complex(dp) :: scatter_matrix"<>ToString[i]<>"B("<>ToString[dim]<>","<>ToString[dim]<>") \n"]; 
WriteString[sphenoUni, "Complex(dp) :: rot_matrix"<>ToString[i]<>"("<>ToString[dim]<>","<>ToString[dim]<>") \n"]; 
WriteString[sphenoUni, "Real(dp) :: eigenvalues_matrix"<>ToString[i]<>"("<>ToString[dim]<>")\n"]; 
];
i++;
];

maxunitaritydim=Max[Flatten[Transpose[ColourMultiplicities][[2]]]];
If[maxunitaritydim>1,
WriteString[sphenoUni, "Complex(dp), dimension("<>ToString[maxunitaritydim]<>", "<>ToString[maxunitaritydim]<>") :: temp_matrix\n"];
];


WriteString[sphenoUni, "Real(dp) :: step_size,scattering_eigenvalue_trilinears, unitarity_s, test(2) \n"]; 
WriteString[sphenoUni,"Real(dp) :: gD("<>ToString[numberAllwithVEVs]<>") \n"];
WriteString[sphenoUni, "Real(dp) :: tz,dt,q,q2,mudim, max_element_removed  \n"];
WriteString[sphenoUni, "Real(dp), Intent(in) :: delta0 \n"];
WriteString[sphenoUni, "Integer :: iter, i, il,ir, count \n"]; 

WriteString[sphenoUni, "best_submatrix = 0 \n"]; 



If[OnlyLowEnergySPheno===True,

For[i=1,i<=Length[listAllParametersAndVEVs],
WriteString[sphenoUni,SPhenoForm[listAllParametersAndVEVs[[i]]]<>" = "<>SPhenoForm[listAllParametersAndVEVs[[i]]]<>"input \n"];
i++;];

MakeCall["TreeMasses",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoUni];
(*MakeCall["AllCouplingsReallyAll",Flatten[{parametersAllreallyAll,namesAllreallyAll}],{},{},sphenoUni];*)

MakeCall["CouplingsColourStructures",Flatten[{parametersstructures,namesstructures}],{},{},sphenoUni];
(*MakeCall["CouplingsColoredQuartics",Flatten[{parametersColoredQuartics,namesColoredQuartics}],{},{},sphenoUni];*)
];

WriteString[sphenoUni, "max_scattering_eigenvalue_trilinears = 0._dp \n"];


 

WriteString[sphenoUni, "If (unitarity_steps.eq.1) Then  \n"]; 
WriteString[sphenoUni, "  step_size = 0._dp\n"]; 
WriteString[sphenoUni, "Else  \n"]; 
WriteString[sphenoUni, " If (unitarity_steps.gt.0) Then \n"]; 
WriteString[sphenoUni, "  step_size = ((Abs(unitarity_s_max)) -(abs(unitarity_s_min)))/(1._dp*(Abs(unitarity_steps)-1)) \n"]; 
WriteString[sphenoUni, " Else \n"]; 
WriteString[sphenoUni, "  step_size = (log(Abs(unitarity_s_max)) -log(abs(unitarity_s_min)))/(1._dp*(Abs(unitarity_steps)-1)) \n"]; 
WriteString[sphenoUni, " End if \n"]; 
WriteString[sphenoUni, "End if \n"]; 

WriteString[sphenoUni, "Do iter=0,Abs(unitarity_steps)-1 \n"]; 
WriteString[sphenoUni, "If (unitarity_steps.lt.0) Then \n"]; 
WriteString[sphenoUni,"  unitarity_s=exp(log(unitarity_s_min) + iter*step_size)**2 \n"];
WriteString[sphenoUni, "Else \n"]; 
WriteString[sphenoUni,"  unitarity_s=(unitarity_s_min + iter*step_size)**2 \n"];
WriteString[sphenoUni, "End if \n"]; 

WriteString[sphenoUni, "any_pole_present = .False. \n"]; 


If[OnlyLowEnergySPheno=!=True,

For[i=1,i<=Length[listAllParametersAndVEVs],
WriteString[sphenoUni,SPhenoForm[listAllParametersAndVEVs[[i]]]<>" = "<>SPhenoForm[listAllParametersAndVEVs[[i]]]<>"input \n"];
i++;];

WriteString[sphenoUni, "If (RunRGEs_unitarity) Then  \n"]; 
WriteGUTnormalization[sphenoUni];
MakeCall["ParametersToG"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{},{"gD"},sphenoUni];
WriteString[sphenoUni,"mudim=GetRenormalizationScale() \n"];
WriteString[sphenoUni,"tz=0.5_dp*Log(mudim/unitarity_s)\n"];
WriteString[sphenoUni,"dt=-tz/50._dp\n"];
WriteString[sphenoUni,"Call odeint(gD,"<>ToString[numberAllwithVEVs]<>",tz,0._dp,0.1_dp*delta0,dt,0._dp,rge"<>ToString[numberAllwithVEVs]<>",kont)\n"];
MakeCall["GToParameters"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{"gD"},{},sphenoUni];
WriteRemoveGUTnormalization[sphenoUni];
WriteTadpoleSolutionOnlyHigh[sphenoUni];
MakeCall["TreeMasses",Join[NewMassParameters,Join[listVEVs,listAllParameters]],{},{".True.","kont"},sphenoUni];
WriteString[sphenoUni, "Else \n"]; 
For[i=1,i<=Length[NewMassParameters],
WriteString[sphenoUni,SPhenoForm[NewMassParameters[[i]]]<>" = "<> SPhenoForm[NewMassParameters[[i]]]<>"input \n"];
i++;];
WriteString[sphenoUni, "End if \n"]; 

(*MakeCall["AllCouplingsReallyAll",Flatten[{parametersAllreallyAll,namesAllreallyAll}],{},{},sphenoUni];*)
MakeCall["CouplingsColourStructures",Flatten[{parametersstructures,namesstructures}],{},{},sphenoUni];
(*MakeCall["CouplingsColoredQuartics",Flatten[{parametersColoredQuartics,namesColoredQuartics}],{},{},sphenoUni];*)
];



For[k=1,k<=Length[scatteringPairsCharges],
WriteString[sphenoUni,"!! "<>ToString[k]<>". sub-matrix  \n"];
(*
WriteString[sphenoUni,"SPole_Present = .false. \n"];
WriteString[sphenoUni,"TPole_Present = .false. \n"];
WriteString[sphenoUni,"UPole_Present = .false. \n"];
*)
WriteString[sphenoUni,"Pole_Present = .false. \n"];
WriteString[sphenoUni,"max_element_removed = 0._dp \n"];

WriteString[sphenoUni,"RemoveTUpoles = 0 \n"];
If[sdim[k]>1,
WriteString[sphenoUni,"scatter_matrix"<>ToString[k]<>"=0._dp \n"];
];

For[i=1,i<=Length[scatteringPairsCharges[[k,2]]],
row=0;
x1start=1;
(* If[UnitarityWithoutGoldstones===True,x1start=getGenSPhenoStart[scatteringPairsCharges[[k,2,i,1]]];]; *)
For[x1=x1start,x1<=getGen[scatteringPairsCharges[[k,2,i,1]]],

x2start=1;
(* If[UnitarityWithoutGoldstones===True,x2start=getGenSPhenoStart[scatteringPairsCharges[[k,2,i,2]]];]; *)
If[scatteringPairsCharges[[k,2,i,1]]===scatteringPairsCharges[[k,2,i,2]],x2start=x1;];
If[(UNITARITYCP===True)&&(scatteringPairsCharges[[k,2,i,1]]===conj[scatteringPairsCharges[[k,2,i,2]]]),
If[(scatteringPairsCharges[[k,1,2,1]])==-1,x2start=x1+1,x2start=x1];
];
For[x2=x2start,x2<=getGen[scatteringPairsCharges[[k,2,i,2]]],
For[j=1,j<=Length[scatteringPairsCharges[[k,2]]],
column=0;
x3start=1;
(* If[UnitarityWithoutGoldstones===True,x3start=getGenSPhenoStart[scatteringPairsCharges[[k,2,j,1]]];]; *)
For[x3=x3start,x3<=getGen[Sort[AntiField/@scatteringPairsCharges[[k,2,j]]][[1]]],
x4start=1;
(* If[UnitarityWithoutGoldstones===True,x4start=getGenSPhenoStart[scatteringPairsCharges[[k,2,j,2]]];]; *)
If[scatteringPairsCharges[[k,2,j,1]]===scatteringPairsCharges[[k,2,j,2]],x4start=x3;];
If[(UNITARITYCP===True)&&(scatteringPairsCharges[[k,2,j,1]]===conj[scatteringPairsCharges[[k,2,j,2]]]),
If[(scatteringPairsCharges[[k,1,2,1]])==-1,x4start=x3+1,x4start=x3];
];

For[x4=x4start,x4<=getGen[Sort[AntiField/@scatteringPairsCharges[[k,2,j]]][[2]]],
If[FreeQ[scattering22,{scatteringPairsCharges[[k,2,i]],Sort[AntiField/@scatteringPairsCharges[[k,2,j]]]}],
(* WriteString[sphenoUni,"scatter_matrix"<>ToString[k]<>"("<>ToString[row]<>","<>ToString[column]<>") = 0._dp \n"]; *)nix;,
pF1=Sort[AntiField/@scatteringPairsCharges[[k,2,j]]][[1]];
pF2=Sort[AntiField/@scatteringPairsCharges[[k,2,j]]][[2]];

If[(UNITARITYCP===True)&&Length[Flatten[{getCP[{scatteringPairsCharges[[k,2,i,1]],scatteringPairsCharges[[k,2,i,2]]}],getCP[{scatteringPairsCharges[[k,2,j,1]],scatteringPairsCharges[[k,2,j,2]]}]}]]>2,
If[scatteringPairsCharges[[k,1,2,1]]==-1,
addCPflag="-1._dp,"
,
addCPflag="1._dp,"
];
,
addCPflag="";
];

If[sdim[k]>1,
ldim=ColourMultiplicities[[k,2,i]];
rdim=ColourMultiplicities[[k,2,j]];

If[Max[{ldim,rdim}]>1,
WriteString[sphenoUni,"temp_matrix(:,:) =0._dp\n"];
WriteString[sphenoUni,addcheckGoldstones[scatteringPairsCharges[[k,2,i]],scatteringPairsCharges[[k,2,i]],x1,x2,x3,x4]<>"call a0_"<>SPhenoForm[scatteringPairsCharges[[k,2,i,1]]/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[scatteringPairsCharges[[k,2,i,2]]/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[pF1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[pF2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(scatteringPairsCharges[[k,1,-1]]/.{0}->{0,0}))<>"("<>addCPflag<>"unitarity_s,"<>ToString[x1]<>","<>ToString[x2]<>","<>ToString[x3]<>","<>ToString[x4]<>","<>ToString[rowcolumncoords[[k,i]]+row]<>","<>ToString[rowcolumncoords[[k,j]]+column]<>","<>ToString[genlists[[k,i]]]<>","<>ToString[genlists[[k,j]]]<>",temp_matrix) \n"];

WriteString[sphenoUni,"Do il=1,"<>ToString[ldim]<>"\n"];
WriteString[sphenoUni,"Do ir=1,"<>ToString[rdim]<>"\n"];
WriteString[sphenoUni,"scatter_matrix"<>ToString[k]<>"("<>ToString[rowcolumncoords[[k,i]]+row]<>"+"<>ToString[genlists[[k,i]]]<>"*(il-1),"<>ToString[rowcolumncoords[[k,j]]+column]<>"+"<>ToString[genlists[[k,j]]]<>"*(ir-1)) =temp_matrix("<>ToString[il]<>", "<>ToString[ir]<>")\n"];

WriteString[sphenoUni,"End do\n End do\n"];


(*
WriteString[sphenoUni,addcheckGoldstones[scatteringPairsCharges[[k,2,i]],scatteringPairsCharges[[k,2,i]],x1,x2,x3,x4]<>"scatter_matrix"<>ToString[k]<>"("<>ToString[rowcolumncoords[[k,row]]]<>","<>ToString[rowcolumncoords[[k,column]]]<>") = a0_"<>SPhenoForm[scatteringPairsCharges[[k,2,i,1]]/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>SPhenoForm[scatteringPairsCharges[[k,2,i,2]]/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[pF1/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>SPhenoForm[pF2/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>"_"<>ToString[Abs[DimR[SU3,scatteringPairsCharges[[k,1,2]]/.{0}\[Rule]{0,0}]]]<>"(unitarity_s,"<>ToString[x1]<>","<>ToString[x2]<>","<>ToString[x3]<>","<>ToString[x4]<>","<>ToString[row]<>","<>ToString[column]<>",temp_matrix) \n"];

WriteString[sphenoUni,"Do il=1,"<>ToString[ldim]<>"\n"];
WriteString[sphenoUni,"Do ir=1,"<>ToString[rdim]<>"\n"];
WriteString[sphenoUni,"scatter_matrix"<>ToString[k]<>"("<>ToString[rowcolumncoords[[k,row]]+genlists[[k,i]]]<>"*(il-1),"<>ToString[rowcolumncoords[[k,column]]+genlists[[k,j]]]<>"*(ir-1)) =temp_matrix("<>ToString[il]<>", "<>ToString[ir]<>")\n"];

WriteString[sphenoUni,"End do\n End do\n"];

*)
(*
For[il=1,il\[LessEqual]ldim,il++,
For[ir=1,ir\[LessEqual]rdim,ir++,
WriteString[sphenoUni,"scatter_matrix"<>ToString[k]<>"("<>ToString[row+(il-1)*sdim[i]]<>","<>ToString[column+(ir-1)*sdim[i]]<>") =temp_matrix("<>ToString[il]<>", "<>ToString[ir]<>")\n"];
];
];*)
,
WriteString[sphenoUni,addcheckGoldstones[scatteringPairsCharges[[k,2,i]],scatteringPairsCharges[[k,2,i]],x1,x2,x3,x4]<>"scatter_matrix"<>ToString[k]<>"("<>ToString[rowcolumncoords[[k,i]]+row]<>","<>ToString[rowcolumncoords[[k,j]]+column]<>") = a0_"<>SPhenoForm[scatteringPairsCharges[[k,2,i,1]]/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[scatteringPairsCharges[[k,2,i,2]]/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[pF1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[pF2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(scatteringPairsCharges[[k,1,-1]]/.{0}->{0,0}))<>"("<>addCPflag<>"unitarity_s,"<>ToString[x1]<>","<>ToString[x2]<>","<>ToString[x3]<>","<>ToString[x4]<>","<>ToString[rowcolumncoords[[k,i]]+row]<>","<>ToString[rowcolumncoords[[k,j]]+column]<>") \n"];
]; (* end if Max[...*)
,

WriteString[sphenoUni,addcheckGoldstones[scatteringPairsCharges[[k,2,i]],scatteringPairsCharges[[k,2,i]],x1,x2,x3,x4]<>"scattering_eigenvalue_trilinears= a0_"<>SPhenoForm[scatteringPairsCharges[[k,2,i,1]]/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[scatteringPairsCharges[[k,2,i,2]]/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[pF1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[pF2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(scatteringPairsCharges[[k,1,-1]]/.{0}->{0,0}))<>"("<>addCPflag<>"unitarity_s,"<>ToString[x1]<>","<>ToString[x2]<>","<>ToString[x3]<>","<>ToString[x4]<>","<>ToString[rowcolumncoords[[k,i]]]<>","<>ToString[rowcolumncoords[[k,j]]]<>") \n"];
WriteString[sphenoUni,"scattering_eigenvalue_trilinears=Abs(scattering_eigenvalue_trilinears) \n"];
];(* end if[sdim*)
];(* end if FreeQ *)
column++;
x4++;
];
x3++;
];
j++;
];
row++;
x2++;
];
x1++;
];
i++;
];
WriteString[sphenoUni,"\n\n"];


WriteString[sphenoUni,"Select CASE (TUcutLevel)  \n"];
WriteString[sphenoUni,"CASE (2) \n"];
If[sdim[k]>1,
WriteString[sphenoUni,"  scatter_matrix"<>ToString[k]<>"B = scatter_matrix"<>ToString[k]<>"\n"];
WriteString[sphenoUni,"Do i=1,"<>ToString[sdim[k]]<>" \n"];
WriteString[sphenoUni,"  If (RemoveTUpoles(i).eq.1) Then\n"];
WriteString[sphenoUni,"   scatter_matrix"<>ToString[k]<>"(i,:) = 0._dp \n"];
WriteString[sphenoUni,"   scatter_matrix"<>ToString[k]<>"(:,i) = 0._dp \n"];
WriteString[sphenoUni,"    If (AddR) scatter_matrix"<>ToString[k]<>"(i,i) = -1111._dp ! to get a fixed order of the eigenvalues \n"];
WriteString[sphenoUni,"   scatter_matrix"<>ToString[k]<>"B(:,i) = 0._dp \n"];
WriteString[sphenoUni,"  Else \n"];
WriteString[sphenoUni,"   scatter_matrix"<>ToString[k]<>"B(i,:) = 0._dp \n"];
WriteString[sphenoUni,"  End If \n"];
WriteString[sphenoUni,"End Do \n"];,
WriteString[sphenoUni,"If (RemoveTUpoles(1).eq.1) scattering_eigenvalue_trilinears = 0._dp \n"];
];


WriteString[sphenoUni,"CASE (1) \n"];
If[sdim[k]>1,
WriteString[sphenoUni,"If ((Abs(max_element_removed)/MaxVal(Abs(scatter_matrix"<>ToString[k]<>"))).gt.cut_elements) Then \n"];
(* WriteString[sphenoUni," Pole_Present = .true. \n"]; *)
WriteString[sphenoUni," ! Write(*,*)  (Abs(max_element_removed)/MaxVal(Abs(scatter_matrix"<>ToString[k]<>")))  \n"];
WriteString[sphenoUni,"End if \n"];
];


WriteString[sphenoUni,"End Select \n"];


(*
WriteString[sphenoUni,"If (SPole_Present) Pole_Present = .true. \n"];
WriteString[sphenoUni,"If (TPole_Present) Pole_Present = .true. \n"];
WriteString[sphenoUni,"If (UPole_Present) Pole_Present = .true. \n"];
*)

(* WriteString[sphenoUni,"If ((.not.Hard_Cut_Poles).or.(.not.Pole_Present)) Then \n"]; *)
If[sdim[k]>1,
WriteString[sphenoUni,"If ((.not. pole_present) .and. (.not. any_pole_present) ) Then \n"];
WriteString[sphenoUni, "Call EigenSystem(scatter_matrix"<>ToString[k]<>",eigenvalues_matrix"<>ToString[k]<>",rot_matrix"<>ToString[k]<>",ierr,test)\n"];
WriteString[sphenoUni, " If ((TUcutLevel.eq.2).and.(AddR)) Then ! Calculate 'R' \n"];
WriteString[sphenoUni, "  scatter_matrix"<>ToString[k]<>"B = MatMul(scatter_matrix"<>ToString[k]<>"B,Conjg(Transpose(rot_matrix"<>ToString[k]<>"))) \n"];
WriteString[sphenoUni,"   Do i=1,"<>ToString[sdim[k]]<>" \n"];
WriteString[sphenoUni,"    If (eigenvalues_matrix"<>ToString[k]"(i).lt.-1000._dp) Then\n"];
WriteString[sphenoUni,"     eigenvalues_matrix"<>ToString[k]<>"(i) = 0._dp \n"];
WriteString[sphenoUni,"    Else \n"];
WriteString[sphenoUni,"     eigenvalues_matrix"<>ToString[k]<>"(i) = sqrt(eigenvalues_matrix"<>ToString[k]<>"(i)**2+  sum(scatter_matrix"<>ToString[k]<>"B(i,:)**2) )\n"];
WriteString[sphenoUni,"    End If\n"];
WriteString[sphenoUni,"   End Do \n"];
WriteString[sphenoUni, " End If \n"];
WriteString[sphenoUni,"scattering_eigenvalue_trilinears=MaxVal(Abs(eigenvalues_matrix"<>ToString[k]<>")) \n"];
WriteString[sphenoUni,"Else \n"];
WriteString[sphenoUni,"  scattering_eigenvalue_trilinears = 0._dp \n"];
WriteString[sphenoUni,"End if \n"];
];

(* DEBUG CODE *******)
(*
WriteString[sphenoUni,"write(*,*) \"Eigenvalues for matrix "<>ToString[k]<>": \", eigenvalues_matrix"<>ToString[k]<>"\n"];
    WriteString[sphenoUni,"write(*,*) \"Maximum for matrix "<>ToString[k]<>": \", scattering_eigenvalue_trilinears\n"];
*)
(* *********************)

WriteString[sphenoUni,"If (scattering_eigenvalue_trilinears.gt.max_scattering_eigenvalue_trilinears) Then \n"];
WriteString[sphenoUni,"   max_scattering_eigenvalue_trilinears=scattering_eigenvalue_trilinears \n"];
WriteString[sphenoUni,"   unitarity_s_best=sqrt(unitarity_s)\n"];
WriteString[sphenoUni,"   best_submatrix="<>ToString[k]<>"\n"];
WriteString[sphenoUni,"End if \n \n"];
k++;
];

(*
WriteString[sphenoUni,"scatter_matrix=0._dp \n"];
row=1;
For[i=1,i\[LessEqual]Length[scatteringPairs],
x1start=1;
If[UnitarityWithoutGoldstones===True,x1start=getGenSPhenoStart[scatteringPairs[[i,1]]];];
For[x1=x1start,x1\[LessEqual]getGen[scatteringPairs[[i,1]]],
x2start=1;
If[UnitarityWithoutGoldstones===True,x2start=getGenSPhenoStart[scatteringPairs[[i,2]]];];
If[scatteringPairs[[i,1]]===scatteringPairs[[i,2]],x2start=x1;];
For[x2=x2start,x2<=getGen[scatteringPairs[[i,2]]],
column=1;
For[j=1,j\[LessEqual]Length[scatteringPairs],
x3start=1;
If[UnitarityWithoutGoldstones===True,x3start=getGenSPhenoStart[scatteringPairs[[j,1]]];];
For[x3=x3start,x3\[LessEqual]getGen[scatteringPairs[[j,1]]],
x4start=1;
If[UnitarityWithoutGoldstones===True,x4start=getGenSPhenoStart[scatteringPairs[[j,2]]];];
If[scatteringPairs[[j,1]]===scatteringPairs[[j,2]],x4start=x3;];
For[x4=x4start,x4<=getGen[scatteringPairs[[j,2]]],
If[FreeQ[scattering22,{scatteringPairs[[i]],scatteringPairs[[j]]}],
WriteString[sphenoUni,"scatter_matrix("<>ToString[row]<>","<>ToString[column]<>") = 0._dp \n"];,
WriteString[sphenoUni,"scatter_matrix("<>ToString[row]<>","<>ToString[column]<>") = a0_"<>SPhenoForm[scatteringPairs[[i,1]]/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>SPhenoForm[scatteringPairs[[i,2]]/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[scatteringPairs[[j,1]]/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>SPhenoForm[scatteringPairs[[j,2]]/.conj[x_]\[RuleDelayed]SPhenoForm[x]<>"c"]<>"(unitarity_s,"<>ToString[x1]<>","<>ToString[x2]<>","<>ToString[x3]<>","<>ToString[x4]<>") \n"];
];
column++;
x4++;];
x3++;];
j++;];
row++;
x2++;];
x1++;];
i++;];
WriteString[sphenoUni,"\n\n"];

WriteString[sphenoUni, "Call EigenSystem(scatter_matrix,eigenvalues_matrix,rot_matrix,ierr,test) \n\n"];
WriteString[sphenoUni,"scattering_eigenvalue_trilinears=16._dp*Pi*MaxVal(Abs(eigenvalues_matrix)) \n"];
WriteString[sphenoUni,"If (scattering_eigenvalue_trilinears.gt.max_scattering_eigenvalue_trilinears) Then \n"];
WriteString[sphenoUni,"  max_scattering_eigenvalue_trilinears=scattering_eigenvalue_trilinears \n "];
WriteString[sphenoUni,"  unitarity_s_best=sqrt(unitarity_s) \n \n"];
WriteString[sphenoUni,"End if \n"];
*)
 

WriteString[sphenoUni,"End do \n\n"];

WriteString[sphenoUni,"If (max_scattering_eigenvalue_trilinears.gt.0.5_dp) TreeUnitarityTrilinear=0._dp \n \n"];
WriteString[sphenoUni," Write(*,*) \"Best submatrix: \",best_submatrix \n \n"];
WriteString[sphenoUni,"! Write(*,*) (max_scattering_eigenvalue_trilinears) \n \n"];

WriteString[sphenoUni,"\n\n Contains \n\n"];

Block[{colourprod,coloudat1,coloudat2,dim1,dim2,rep,crep,pos},
For[i=1,i<=Length[scattering22],
colourprod=getColourProducts[scattering22[[i,1]],color,SU3];
For[j=1,j<=Length[colourprod[[1]]],
rep=colourprod[[1,j]];
crep=ConjugateIrrep[SU3,rep/.{0}->{0,0}]/.{0,0}->{0};
coloudat2=getColourProducts[scattering22[[i,2]],color,SU3];
If[FreeQ[coloudat2[[1]],crep]==False,
dim1=colourprod[[2]];
If[Length[dim1]>0,
dim1=dim1[[j]]
];

If[Length[coloudat2[[2]]]>0,
pos=Position[coloudat2[[1]],crep];
dim2=coloudat2[[2,pos[[1,1]]]];
,
dim2=coloudat2[[2]];
];
WriteScatteringAmplitude[scattering22[[i]],rep,{dim1,dim2}];
];
j++;];
i++;
];
];
(*
(* WTF ???? *)
For[i=1,i\[LessEqual]Length[scattering22],
colorprod=getColorProducts[scattering22[[i,1]]];
For[j=1,j\[LessEqual]Length[colorprod],
If[FreeQ[ConjugateIrrep[SU3,#]&/@getColorProducts[scattering22[[i,2]]],colorprod[[j]]]\[Equal]False,
WriteScatteringAmplitude[scattering22[[i]],colorprod[[j]]];
];
j++;];
i++;
];
*)




WriteString[sphenoUni,"End Subroutine ScatteringEigenvaluesWithTrilinears\n\n"];

];

addcheckGoldstones[{p1_,p2_},{p3_,p4_},i1_,i2_,i3_,i4_]:=If[getGenSPhenoStart[p1]>i1 ||getGenSPhenoStart[p2]>i2 ||getGenSPhenoStart[p3]>i3
 ||getGenSPhenoStart[p4]>i4,
Return["If (IncludeGoldstoneExternal) "];,
Return[""];
];



WriteScatteringAmplitude[{{in1_,in2_},{out1c_,out2c_}},colp_,dimamp_]:=Block[{i,j,k,myl,myl2,c1,ind1,out1,out2,cfactor,dimc,CPstring,instring,CPfactorstring,CPs,manyCP},
(*Print["Writing: ",{{in1,in2},{out1c,out2c}},colp,dimamp];*)
If[colp=={0}||colp=={0,0},
dimc=1,
dimc=Abs[DimR[SU3,colp]];
];

CPfactorstring="";
CPstring="s,";
instring="i1,i2,i3,i4,";
manyCP=1;
If[UNITARITYCP,
CPs={getCP[{in1,in2}],getCP[{out1c,out2c}]};
manyCP=2^(Length[Flatten[CPs]]-2);
If[manyCP>1,
CPfactorstring="CPfactors(c2)*";
CPstring="CPflag,s,";
instring="j1,j2,j3,j4,";
];
];

(* These are selected so that out1c, out2c are already conjugated *)
If[Max[dimamp]<2,
WriteString[sphenoUni,"Complex(dp) Function a0_"<>SPhenoForm[in1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[in2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[out1c/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[out2c/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(colp/.{0}->{0,0}))<>"("<>CPstring<>instring<>"ind1,ind2)  Result(amp)\n"];
WriteString[sphenoUni,"Implicit None \n"];

WriteString[sphenoUni,"Integer, Intent(in) :: "<>instring<>"ind1,ind2 \n"];
,
WriteString[sphenoUni,"subroutine a0_"<>SPhenoForm[in1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[in2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[out1c/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[out2c/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(colp/.{0}->{0,0}))<>"("<>CPstring<>instring<>"ind1,ind2,gen1,gen2,amp)\n"];
WriteString[sphenoUni,"Implicit None \n"];
(*WriteString[sphenoUni,"Complex(dp), intent(out), allocatable :: amp(:,:) \n"];*)
WriteString[sphenoUni,"Complex(dp), intent(out) :: amp("<>ToString[maxunitaritydim]<>","<>ToString[maxunitaritydim]<>") \n"];

WriteString[sphenoUni,"Integer, Intent(in) ::  "<>instring<>"ind1,ind2,gen1,gen2 \n"];
];
If[manyCP>1,
WriteString[sphenoUni,"real(dp), Intent(in) :: CPflag \n"];
];
WriteString[sphenoUni,"Real(dp), Intent(in) :: s \n"];

WriteString[sphenoUni,"Integer :: iprop, istart,c1,c2,c2end \n"];
WriteString[sphenoUni,"Logical :: pole_s_channel=.False. \n"];
WriteString[sphenoUni,"Real(dp) :: m1,m2,m3,m4 \n"];
(*WriteString[sphenoUni,"Complex(dp) :: tempamp \n"];*)
WriteString[sphenoUni,"Complex(dp) :: tempamp2("<>ToString[maxunitaritydim]<>","<>ToString[maxunitaritydim]<>") \n"];
WriteString[sphenoUni,"Complex(dp) :: amp_poles \n"];
WriteString[sphenoUni,"Complex(dp) :: unicpl1(8),unicpl2(8) \n"];

If[manyCP>1,
WriteString[sphenoUni,"integer :: CPperms("<>ToString[manyCP]<>",4)\n"];
WriteString[sphenoUni,"real(dp) :: CPfactors("<>ToString[manyCP]<>")\n"];
WriteString[sphenoUni,"integer :: i1,i2,i3,i4\n"];

WriteString[sphenoUni,"CPperms(1,:) = (/j1,j2,j3,j4/)\n"];
If[Length[CPs[[1]]]==1,
(* only permute second two*)
WriteString[sphenoUni,"if (j3 .eq. j4) then\n"];
WriteString[sphenoUni,"c2end=1\n"];
WriteString[sphenoUni,"CPfactors(:) = (/1._dp,1._dp/)\n"];
WriteString[sphenoUni,"else\n"];
WriteString[sphenoUni,"c2end=2\n"];
WriteString[sphenoUni,"CPperms(2,:) = (/j1,j2,j4,j3/)\n"];
WriteString[sphenoUni,"CPfactors(:) = (/oosqrt2,CPflag*oosqrt2/)\n"];
WriteString[sphenoUni,"end if\n"];
,
WriteString[sphenoUni,"CPperms(2,:) = (/j2,j1,j3,j4/)\n"];
If[Length[CPs[[2]]]==2,
(* both need permuting*)
WriteString[sphenoUni,"if (j1 .eq. j2) then\n"];
WriteString[sphenoUni,"    if (j3 .eq. j4) then\n"];
WriteString[sphenoUni,"c2end=1\n"];
WriteString[sphenoUni,"CPfactors(:) = (/1._dp,1._dp,1._dp,1._dp/)\n"];
WriteString[sphenoUni,"    else\n"];
WriteString[sphenoUni,"c2end=2\n"];
WriteString[sphenoUni,"CPperms(2,:) = (/j1,j2,j4,j3/)\n"];
WriteString[sphenoUni,"CPfactors(:) = (/oosqrt2,CPflag*oosqrt2,0._dp,0._dp/)\n"];
WriteString[sphenoUni,"    end if\n"];
WriteString[sphenoUni,"else\n"];
WriteString[sphenoUni,"    if (j3 .eq. j4) then\n"];
WriteString[sphenoUni,"c2end=2\n"];
WriteString[sphenoUni,"CPperms(2,:) = (/j2,j1,j3,j4/)\n"];
WriteString[sphenoUni,"CPfactors(:) = (/oosqrt2,CPflag*oosqrt2,0._dp,0._dp/)\n"];
WriteString[sphenoUni,"    else\n"];
WriteString[sphenoUni,"c2end=4\n"];
WriteString[sphenoUni,"CPfactors(:) = (/0.5_dp,CPflag*0.5_dp,CPflag*0.5_dp,0.5_dp/)\n"];
WriteString[sphenoUni,"CPperms(3,:) = (/j1,j2,j4,j3/)\n"];
WriteString[sphenoUni,"CPperms(4,:) = (/j2,j1,j4,j3/)\n"];
WriteString[sphenoUni,"    end if\n"];
WriteString[sphenoUni,"end if\n"];


(*WriteString[sphenoUni,"CPfactors(:) = (/0.25_dp,CPflag*0.25_dp,CPflag*0.25_dp,0.25_dp/)\n"];*)
,
WriteString[sphenoUni,"if (j1 .eq. j2) then\n"];
WriteString[sphenoUni,"c2end=1\n"];
WriteString[sphenoUni,"CPfactors(:) = (/1._dp,1._dp/)\n"];
WriteString[sphenoUni,"else\n"];
WriteString[sphenoUni,"c2end=2\n"];
WriteString[sphenoUni,"CPfactors(:) = (/oosqrt2,CPflag*oosqrt2/)\n"];
WriteString[sphenoUni,"end if\n"];
];
];
];

(*
out1=conj[out1c];
out2=conj[out2c];
*)

out1=out1c;
out2=out2c;

WriteString[sphenoUni,"amp = 0._dp \n"];
WriteString[sphenoUni,"tempamp2(:,:) = 0._dp \n"];
WriteString[sphenoUni,"amp_poles = 0._dp \n"];


If[manyCP>1,
WriteString[sphenoUni,"do c2 = 1,c2end\n"];
WriteString[sphenoUni,"i1=CPperms(c2,1)\n"];
WriteString[sphenoUni,"i2=CPperms(c2,2)\n"];
WriteString[sphenoUni,"i3=CPperms(c2,3)\n"];
WriteString[sphenoUni,"i4=CPperms(c2,4)\n"];
];


WriteString[sphenoUni,"m1 = "<>SPhenoMass[in1,i1]<>"\n"];
WriteString[sphenoUni,"m2 = "<>SPhenoMass[in2,i2]<>"\n"];
WriteString[sphenoUni,"m3 = "<>SPhenoMass[out1,i3]<>"\n"];
WriteString[sphenoUni,"m4 = "<>SPhenoMass[out2,i4]<>"\n"];





WriteString[sphenoUni,"If ((s.gt.1.01_dp*(m3+m4)**2).and.(s.gt.1.01_dp*(m1+m2)**2)) Then \n"];
WriteString[sphenoUni,"\n\n! Quartic \n"];
(*If[FreeQ[VerticesInv[SSSS],C[in1,in2,out1,out2]]\[Equal]False,*)
If[FreeQ[UNITARITYverticesorg,C[in1,in2,out1,out2]]==False,

(*
If[Count[getColorRep/@{in1,in2,out1,out2},S]\[GreaterEqual]2, (* More than two coloured states *)
c1=getSPhenoCoupling2[C[in1,in2,out1,out2],SPhenoCouplingsAllreallyAll];
ind1 = MakeIndicesCoupling4[{in1,i1},{in2,i2},{out1,i3},{out2,i4},c1[[2]]];
cfactor=getColorFactorScattering4[in1,in2,out1,out2,colp,False,{}];
WriteString[sphenoUni,"amp = amp -2._dp*("<>SPhenoForm[cfactor]<>")*"<>ToString[c1[[1,1]]]<>ind1[[1]]<>"\n"];,
*)

c1=getSPhenoCoupling2[C[in1,in2,out1,out2],SPhenoCouplingsstructures];
ind1 =MakeIndicesCouplingWrapper[{{in1,i1},{in2,i2},{out1,i3},{out2,i4}},c1[[2]]];

(*
 For[k=1,k<=Length[c1[[1]]],
cfactor=getColorFactorScattering4[in1,in2,out1,out2,colp,ToString[c1[[1,k]]],ToExpression[StringReplace[ind1[[1]],{"("\[Rule]"{",")"\[Rule]"}"}]]];
WriteString[sphenoUni,"amp = amp -2._dp*("<>SPhenoForm[cfactor]<>")*"<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"];
k++;
];*)


(*
 For[k=1,k<=Length[c1[[1]]],
cfactor=getColorFactorScattering4[in1,in2,out1,out2,colp,k,MakeIndicesCoupling4color[{in1,i1},{in2,i2},{out1,i3},{out2,i4},c1[[2]]]];
If[Length[Flatten[{cfactor}]]<2,
WriteString[sphenoUni,"amp = amp -2._dp*("<>SPhenoForm[cfactor]<>")*"<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"];
,
For[myl=1,myl\[LessEqual]Length[cfactor],myl++,
For[myl2=1,myl2<=Length[Transpose[cfactor]],myl2++,
WriteString[sphenoUni,"amp("<>ToString[myl]<>", "<>ToString[myl2]<>") = amp("<>ToString[myl]<>") -2._dp*("<>SPhenoForm[cfactor[[myl,myl2]]]<>")*"<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"];
];
];
];
k++;
];
*)

 For[k=1,k<=Length[c1[[1]]],k++,
WriteString[sphenoUni,"unicpl1("<>ToString[k]<>")="<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"]
];

cfactor=getColourFactorScattering[in1,in2,out1,out2,1,"Q",colp];

If[Max[dimamp]<2,
(*WriteString[sphenoUni,"amp = amp -2._dp*("<>SPhenoForm[cfactor]<>")*"<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"];*)
WriteString[sphenoUni,"amp = amp +"<>CPfactorstring<>"(-2._dp)*("<>SPhenoForm[cfactor[[1,1]]/.{cp1[x_]->unicpl1[x]}]<>")\n"];
,
For[myl=1,myl<=Length[cfactor],myl++,
For[myl2=1,myl2<=Length[Transpose[cfactor]],myl2++,
WriteString[sphenoUni,"amp("<>ToString[myl]<>", "<>ToString[myl2]<>") = amp("<>ToString[myl]<>", "<>ToString[myl2]<>") +"<>CPfactorstring<>"(-2._dp)*("<>SPhenoForm[cfactor[[myl,myl2]]/.{cp1[x_]->unicpl1[x]}]<>")\n"];
];
];
];

(* ]; *)
];


WriteString[sphenoUni,"\n\n! S-Channel \n"];
GenerateChannel[in1,in2,out1,out2,{i1,i2,i3,i4},"S",colp,sphenoUni,CPfactorstring];
WriteString[sphenoUni,"\n\n! T-Channel \n"];
GenerateChannel[in1,out1,in2,out2,{i1,i3,i2,i4},"T",colp,sphenoUni,CPfactorstring];
WriteString[sphenoUni,"\n\n! U-Channel \n"];
GenerateChannel[in1,out2,in2,out1,{i1,i4,i2,i3},"U",colp,sphenoUni,CPfactorstring];
(*
WriteString[sphenoUni,"\n\n! T-Channel \n"];
GenerateChannel[in1,out1,in2,out2,{i1,i3,i2,i4},"T",colp,sphenoUni];
WriteString[sphenoUni,"\n\n! U-Channel \n"];
GenerateChannel[in1,out2,in2,out1,{i1,i4,i2,i3},"U",colp,sphenoUni];
*)



WriteString[sphenoUni,"End if \n"];

If[manyCP>1,
WriteString[sphenoUni,"end do ! c2 \n"];
];

WriteString[sphenoUni,"amp = 0.5_dp*oo16pi*amp*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s \n"];


If[in1===in2,
WriteString[sphenoUni,"If (i1.eq.i2) amp=amp/sqrt(2._dp) \n"];
];
If[out1===out2,
WriteString[sphenoUni,"If (i3.eq.i4) amp=amp/sqrt(2._dp) \n"];
];



WriteString[sphenoUni,"If (TUcutLevel.eq.1) Then \n"];
WriteString[sphenoUni," amp_poles = 0.5_dp*oo16pi*amp_poles*sqrt(sqrt(Kaehler(s,m1**2,m2**2)*Kaehler(s,m3**2,m4**2)))/s \n"];
If[in1===in2,
WriteString[sphenoUni,"If (i1.eq.i2) amp_poles=amp_poles/sqrt(2._dp) \n"];
];
If[out1===out2,
WriteString[sphenoUni,"If (i3.eq.i4) amp_poles=amp_poles/sqrt(2._dp) \n"];
];
If[Max[dimamp]<2,
WriteString[sphenoUni,"  If ((Abs(amp_poles)/Abs(amp)).gt.cut_amplitudes) Then \n"];
WriteString[sphenoUni,"   ! Write(*,*) \"TU ratio\", (Abs(amp_poles)/Abs(amp))  \n"];
(* WriteString[sphenoUni,"   If ((Abs(amp_poles)+Abs(amp)).gt.max_element_removed) max_element_removed = Abs(amp_poles)+Abs(amp) \n"]; *)
WriteString[sphenoUni,"   If (Abs(amp).gt.max_element_removed) max_element_removed = Abs(amp) \n"];
,
WriteString[sphenoUni,"  If ((Abs(amp_poles)/maxval(Abs(amp))).gt.cut_amplitudes) Then \n"];
WriteString[sphenoUni,"   ! Write(*,*) \"TU ratio\", (Abs(amp_poles)/maxval(Abs(amp)))  \n"];
(* WriteString[sphenoUni,"   If ((Abs(amp_poles)+Abs(amp)).gt.max_element_removed) max_element_removed = Abs(amp_poles)+Abs(amp) \n"]; *)
WriteString[sphenoUni,"   If ((maxval(Abs(amp))).gt.max_element_removed) max_element_removed = maxval(Abs(amp)) \n"];
];
WriteString[sphenoUni,"   amp = 0._dp \n"];
WriteString[sphenoUni,"  End if \n"];
WriteString[sphenoUni,"End if \n"];





If[Max[dimamp]<2,
WriteString[sphenoUni,"End Function a0_"<>SPhenoForm[in1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[in2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[out1c/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[out2c/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(colp/.{0}->{0,0}))<>"\n\n"];
,
WriteString[sphenoUni,"End subroutine a0_"<>SPhenoForm[in1/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[in2/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>SPhenoForm[out1c/.conj[x_]:>SPhenoForm[x]<>"c"]<>SPhenoForm[out2c/.conj[x_]:>SPhenoForm[x]<>"c"]<>"_"<>(StringJoin@@ToString/@(colp/.{0}->{0,0}))<>"\n\n"];
];

];

GenerateChannel[s1_,s2_,s3_,s4_,inds_,Type_,colp_,file_,cpfactors_]:=Block[{outlist,i,sign,c1,c2,ind1,ind2,cfactor,tcfactor,myl,myl2},
(* check for all scalars in the propagator *)
(*
Switch[Type,
"T",
{s1,s2,s3,s4}={ps1,conj[ps3],conj[ps2],ps4};
,
"U",
{s1,s2,s3,s4}={ps1,conj[ps4],conj[ps2],ps3};
,
_,
{s1,s2,s3,s4}={ps1,ps2,ps3,ps4};
];
*)

(* MARK DEBUG 
Print["Generating channel ",Type];
*)

For[i=1,i<=Length[partS],
(* check if vertex exists *)
If[(FreeQ[UNITARITYverticesorg,C[s1,s2,partS[[i]]]]==False)&&(FreeQ[UNITARITYverticesorg,C[s3,s4,conj[partS[[i]]]]]==False),

c1=getSPhenoCoupling2[C[s1,s2,partS[[i]]],SPhenoCouplingsstructures];
ind1 = MakeIndicesCoupling[{s1,inds[[1]]},{s2,inds[[2]]},{partS[[i]],iprop},c1[[2]]];

c2=getSPhenoCoupling2[C[s3,s4,conj[partS[[i]]]],SPhenoCouplingsstructures];
ind2 = MakeIndicesCoupling[{s3,inds[[3]]},{s4,inds[[4]]},{conj[partS[[i]]],iprop},c2[[2]]];

(**** Adjust here ... *)
(* colp is output of colour product *) 
(*
cfactor=SPhenoForm[getColorFactorScattering[s1,s2,s3,s4,partS[[i]],Type,colp]];
*)
(*Print["calling cfactor with ",s1,s2,s3,s4,partS[[i]],Type,colp];*)
cfactor=getColourFactorScattering[s1,s2,s3,s4,partS[[i]],Type,colp];





WriteString[file,"istart=1\n"];

 

If[getGenSPhenoStart[partS[[i]]]>1,
WriteString[file, "If (.not.IncludeGoldstoneContributions) istart="<>ToString[getGenSPhenoStart[partS[[i]]]]<>"\n"];
];

WriteString[file,"Do iprop=istart,"<>ToString[getGen[partS[[i]]]]<>"\n"];

For[k=1,k<=Length[c1[[1]]],k++,
WriteString[sphenoUni,"unicpl1("<>ToString[k]<>")="<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"];
];
 For[k=1,k<=Length[c2[[1]]],k++,
WriteString[sphenoUni,"unicpl2("<>ToString[k]<>")="<>ToString[c2[[1,k]]]<>ind2[[1]]<>"\n"]
];

If[Length[Flatten[{cfactor}]]<2,
(*WriteString[sphenoUni,"amp = amp -2._dp*("<>SPhenoForm[cfactor]<>")*"<>ToString[c1[[1,k]]]<>ind1[[1]]<>"\n"];*)
tcfactor=(Flatten[{cfactor}][[1]])/.{cp1[x_]->unicpl1[x],cp2[x_]->unicpl2[x]};
(*Print["cfactor: ",tcfactor];*)
If[tcfactor=!=0,
WriteString[file,"tempamp2(1,1)= "<>SPhenoForm[tcfactor]<>"*"<>Type<>"channel(m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>",s,(1._dp,0._dp),(1._dp,0._dp)) \n"];
,
WriteString[file,"tempamp2(1,1)= 0._dp\n"];
];

(*
WriteString[file,"tempamp(1,1)= "<>SPhenoForm[cfactor[[1,1]]/.{cp1[x_]\[Rule]unicpl1[x],cp2->unicpl2[x]}]<>"\n"];
*)
,
WriteString[file,"tempamp2(:,:) = 0._dp\n"];
For[myl=1,myl<=Length[cfactor],myl++,
For[myl2=1,myl2<=Length[Transpose[cfactor]],myl2++,
tcfactor=cfactor[[myl,myl2]]/.{cp1[x_]->unicpl1[x],cp2[x_]->unicpl2[x]};
(* MARK DEBUG
Print["cfactor: ",tcfactor];*)
If[tcfactor=!=0,
WriteString[sphenoUni,"tempamp2("<>ToString[myl]<>","<>ToString[myl2]<>") = "<>SPhenoForm[tcfactor]<>"*"<>Type<>"channel(m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>",s,(1._dp,0._dp),(1._dp,0._dp)) \n"];
];
];
];
];

Switch[Type,
"S",
WriteString[file,"If (Abs(1-s/"<>SPhenoMass[partS[[i]],iProp]<>"**2).lt.CutSpole) Then \n"];
WriteString[file," Any_Pole_Present = .true. \n"];
WriteString[file," Pole_Present = .true. \n"];,
"U",
WriteString[file,"If  (((s.lt.(CheckUpole(m1**2,m2**2,m3**2,m4**2,"<>SPhenoMass[partS[[i]],iProp]<>"**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then \n"];
WriteString[file,"! Write(*,*) \"U\",m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>"  \n"];
,
"T",
WriteString[file,"If  (((s.lt.(CheckTpole(m1**2,m2**2,m3**2,m4**2,"<>SPhenoMass[partS[[i]],iProp]<>"**2)))).and.(maxval(Abs(tempamp2)).gt.1.0E-10_dp)) Then \n"];
WriteString[file,"! Write(*,*) \"T\",m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>"  \n"];
];




If[Type==="T" || Type==="U",
WriteString[file,"Select Case (TUcutLevel) \n"];
WriteString[file," Case (4) \n"];
WriteString[file,"   Any_Pole_Present = .True. \n"];
WriteString[file," Case (3) \n"];
WriteString[file,"   Pole_Present = .True. \n"];
WriteString[file," Case (2) \n"];
(* FIX THIS BIT*)
(*WriteString[file,"  RemoveTUpoles(ind1) = 1 \n"];*)
If[Length[Flatten[{cfactor}]]<2,
WriteString[file,"  RemoveTUpoles(ind1) = 1 \n"];
WriteString[file,"  RemoveTUpoles(ind2) = 1 \n"]; 
,
WriteString[file," do c1=1,gen1 \n"];
WriteString[file,"  RemoveTUpoles(ind1+gen1*(c1-1)) = 1 \n"];
WriteString[file," end do \n"];
WriteString[file," do c1=1,gen2 \n"];
WriteString[file,"  RemoveTUpoles(ind2+gen2*(c1-1)) = 1 \n"];
WriteString[file," end do \n"];
];

WriteString[file," Case (1) \n"];
(*WriteString[file,"  amp_poles = amp_poles + Abs("<>cfactor<>"*"<>Type<>"channel(m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>",s,"<>ToString[c1[[1,1]]] <>ind1[[1]]<>","<>ToString[c2[[1,1]]] <>ind2[[1]]<>")) \n"];*)
WriteString[file,"  amp_poles  = 0._dp\n"];
WriteString[file," Case (0) \n"];
(*WriteString[file,"  amp = amp + "<>cfactor<>"*"<>Type<>"channel(m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>",s,"<>ToString[c1[[1,1]]] <>ind1[[1]]<>","<>ToString[c2[[1,1]]] <>ind2[[1]]<>") \n"];*)
If[Length[Flatten[{cfactor}]]<2,
WriteString[file,"  amp = amp + "<>cpfactors<>"tempamp2(1,1)\n"];
,
WriteString[file,"  amp = amp + "<>cpfactors<>"tempamp2\n"];
];
WriteString[file,"End Select \n"];
];
WriteString[file,"Else \n"];
(*WriteString[file,"  amp = amp + "<>cfactor<>"*"<>Type<>"channel(m1,m2,m3,m4,"<>SPhenoMass[partS[[i]],iProp]<>",s,"<>ToString[c1[[1,1]]] <>ind1[[1]]<>","<>ToString[c2[[1,1]]] <>ind2[[1]]<>") \n"];*)
If[Length[Flatten[{cfactor}]]<2,
WriteString[file,"  amp = amp + "<>cpfactors<>"tempamp2(1,1)\n"];
,
WriteString[file,"  amp = amp + "<>cpfactors<>"tempamp2\n"];
];
WriteString[file,"End if \n"];
WriteString[file,"End Do \n"];
];(* end If[(FreeQ[*)
i++;
];
];



GenerateTreeLevelUni:=Block[{i,j,dim},
scattermatrix=Get2to2scattering /. Delta[a__]->1;
dim=Length[scattermatrix];

Print["  Write 'Tree-Level Unitarity Limits'"];

MakeSubroutineTitle["ScatteringEigenvalues",Flatten[{Map[ToExpression[SPhenoForm[#]<>"input"]&,Join[listVEVs,listAllParameters]]}],{} ,{"delta0","kont"},sphenoUni];

WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni, "Integer, Intent(inout) :: kont \n"];
WriteString[sphenoUni, "Integer :: ierr \n"];
MakeVariableList[listAllParameters,"",sphenoUni];
MakeVariableList[listVEVs,"",sphenoUni];
WriteString[sphenoUni,"Real(dp) :: gD("<>ToString[numberAllwithVEVs]<>") \n"];
WriteString[sphenoUni, "Real(dp) :: tz,dt,q,q2,mudim \n"];
WriteString[sphenoUni, "Real(dp), Intent(in) :: delta0 \n"];
WriteString[sphenoUni, "Integer :: iter \n"];

WriteString[sphenoUni, "Complex(dp) :: scatter_matrix("<>ToString[dim]<>","<>ToString[dim]<>") \n"]; 
WriteString[sphenoUni, "Complex(dp) :: rot_matrix("<>ToString[dim]<>","<>ToString[dim]<>") \n"]; 
WriteString[sphenoUni, "Real(dp) :: eigenvalues_matrix("<>ToString[dim]<>"), test(2), unitarity_s, scattering_eigenvalue, step_size\n"]; 
MakeVariableList[Map[ToExpression[SPhenoForm[#]<>"input"]&,listAllParametersAndVEVs],",Intent(in)",sphenoUni];

WriteString[sphenoUni, "max_scattering_eigenvalue = 0._dp \n\n"]; 


For[i=1,i<=Length[listAllParametersAndVEVs],
WriteString[sphenoUni,SPhenoForm[listAllParametersAndVEVs[[i]]]<>" = "<>SPhenoForm[listAllParametersAndVEVs[[i]]]<>"input \n"];
i++;];






If[OnlyLowEnergySPheno=!=True,
WriteString[sphenoUni, "If (unitarity_steps.eq.1) Then  \n"]; 
WriteString[sphenoUni, "  step_size = 0._dp\n"]; 
WriteString[sphenoUni, "Else  \n"]; 
WriteString[sphenoUni, " If (unitarity_steps.gt.0) Then \n"]; 
WriteString[sphenoUni, "  step_size = ((Abs(unitarity_s_max)) -(abs(unitarity_s_min)))/(1._dp*(Abs(unitarity_steps)-1)) \n"]; 
WriteString[sphenoUni, " Else \n"]; 
WriteString[sphenoUni, "  step_size = (log(Abs(unitarity_s_max)) -log(abs(unitarity_s_min)))/(1._dp*(Abs(unitarity_steps)-1)) \n"]; 
WriteString[sphenoUni, " End if \n"]; 
WriteString[sphenoUni, "End if \n"]; 

WriteString[sphenoUni, "Do iter=0,Abs(unitarity_steps)-1 \n"]; 
WriteString[sphenoUni, "If (unitarity_steps.lt.0) Then \n"]; 
WriteString[sphenoUni,"  unitarity_s=exp(log(unitarity_s_min) + iter*step_size)**2 \n"];
WriteString[sphenoUni, "Else \n"]; 
WriteString[sphenoUni,"  unitarity_s=(unitarity_s_min + iter*step_size)**2 \n"];
WriteString[sphenoUni, "End if \n"]; 



WriteString[sphenoUni, "If (RunRGEs_unitarity) Then  \n"]; 

For[i=1,i<=Length[listAllParametersAndVEVs],
WriteString[sphenoUni,SPhenoForm[listAllParametersAndVEVs[[i]]]<>" = "<>SPhenoForm[listAllParametersAndVEVs[[i]]]<>"input \n"];
i++;];

WriteGUTnormalization[sphenoUni];
MakeCall["ParametersToG"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{},{"gD"},sphenoUni];
WriteString[sphenoUni,"mudim=GetRenormalizationScale() \n"];
WriteString[sphenoUni,"tz=0.5_dp*Log(mudim/unitarity_s)\n"];
WriteString[sphenoUni,"dt=-tz/50._dp\n"];
WriteString[sphenoUni,"Call odeint(gD,"<>ToString[numberAllwithVEVs]<>",tz,0._dp,0.1_dp*delta0,dt,0._dp,rge"<>ToString[numberAllwithVEVs]<>",kont)\n"];
MakeCall["GToParameters"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{"gD"},{},sphenoUni];
WriteRemoveGUTnormalization[sphenoUni];
WriteTadpoleSolutionOnlyHigh[sphenoUni];
WriteString[sphenoUni, "End if \n"]; 
];

WriteString[sphenoUni,"scatter_matrix=0._dp \n"];

For[i=1,i<=dim,
For[j=1,j<=dim,
If[scattermatrix[[i,j]]=!=0,
WriteString[sphenoUni,"scatter_matrix("<>ToString[i]<>","<>ToString[j]<>") ="<>SPhenoForm[scattermatrix[[i,j]]]<>"\n"];
];
j++;];
i++;];

WriteString[sphenoUni, "Call EigenSystem( oo16pi*scatter_matrix,eigenvalues_matrix,rot_matrix,ierr,test) \n\n"];
WriteString[sphenoUni,"scattering_eigenvalue=MaxVal(Abs(eigenvalues_matrix)) \n"];

If[OnlyLowEnergySPheno=!=True,
WriteString[sphenoUni," If (scattering_eigenvalue.gt.max_scattering_eigenvalue) Then \n"];
WriteString[sphenoUni,"   max_scattering_eigenvalue=scattering_eigenvalue \n"];
WriteString[sphenoUni," End if \n\n"];

WriteString[sphenoUni,"End Do \n"]; ,
WriteString[sphenoUni,"max_scattering_eigenvalue=scattering_eigenvalue \n"];
];


WriteString[sphenoUni,"If (max_scattering_eigenvalue.gt.0.5_dp) TreeUnitarity=0._dp \n"];

WriteString[sphenoUni,"End Subroutine ScatteringEigenvalues\n\n"];

];

WriteIntegrals:=Block[{},
WriteString[sphenoUni,"Complex(dp) Function Kaehler(a,b,c) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::a,b,c\n"];
WriteString[sphenoUni,"Kaehler = a**2-2._dp*a*(b+c)+(b-c)**2 \n"];
WriteString[sphenoUni,"End Function Kaehler \n  \n"];

WriteString[sphenoUni,"Real(dp) Function CheckTpole(m1,m2,m3,m4,mP) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1,m2,m3,m4,mP\n"];
WriteString[sphenoUni,"Complex(dp):: res\n"];
WriteString[sphenoUni,"res = (m2*m3 - m3*m4 + m2*mP + m3*mP + m4*mP - mP**2 + m1*(-m2 + m4 + mP) + Sqrt(m1**2 + (m3 - mP)**2 &\n"];
WriteString[sphenoUni,"  &  - 2*m1*(m3 + mP))*Sqrt(m2**2 + (m4 - mP)**2 - 2*m2*(m4 + mP)))/(2.*mP)\n"];
WriteString[sphenoUni,"If (res.ne.res) res=0._dp \n"];
WriteString[sphenoUni,"If (Aimag(res).gt.1._dp) Then \n"];
WriteString[sphenoUni," CheckTpole = 0._dp \n"];
WriteString[sphenoUni,"Else \n"];
WriteString[sphenoUni," CheckTpole = Real(1.05_dp*res,dp) \n"];
WriteString[sphenoUni,"End If \n"];
WriteString[sphenoUni,"End Function CheckTpole \n \n"];

WriteString[sphenoUni,"Real(dp) Function CheckUpole(m1,m2,m3,m4,mP) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1,m2,m3,m4,mP\n"];
WriteString[sphenoUni,"Complex(dp) :: res\n"];
WriteString[sphenoUni,"res =(m2*m4-m3*m4+m2*mP+m3*mP+m4*mP-mP**2+m1*(-m2+m3+mP)+Sqrt(m2**2+(m3-mP)**2 &\n"];
WriteString[sphenoUni,"  &-2*m2*(m3+mP))*Sqrt(m1**2+(m4-mP)**2-2*m1*(m4+mP)))/(2.*mP)\n"];
WriteString[sphenoUni,"If (res.ne.res) res=0._dp \n"];
WriteString[sphenoUni,"If (Aimag(res).gt.1._dp) Then \n"];
WriteString[sphenoUni," CheckUpole = 0._dp \n"];
WriteString[sphenoUni,"Else \n"];
WriteString[sphenoUni," CheckUpole = Real(1.05_dp*res,dp) \n"];
WriteString[sphenoUni,"End If \n"];
WriteString[sphenoUni,"End Function CheckUpole \n \n"];



WriteString[sphenoUni,"Complex(dp) Function Schannel(m1,m2,m3,m4,mP,s,c1,c2) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1,m2,m3,m4,mP,s\n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::c1,c2\n"];
WriteString[sphenoUni,"Schannel = 2._dp/(-mP**2+s) \n"];
WriteString[sphenoUni,"Schannel = c1*c2*Schannel \n"];
WriteString[sphenoUni,"End Function Schannel \n \n"];

(*
WriteString[sphenoUni,"Complex(dp) Function SVchannel(m1,m2,m3,m4,mP,s,c1,c2) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1,m2,m3,m4,mP,s\n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::c1,c2\n"];
WriteString[sphenoUni,"SVchannel = (2*(m1 - m2)*(m1 + m2)*(m3 - m4)*(m3 + m4))/((mP**2 - s)*s) \n"];
WriteString[sphenoUni,"SVchannel = c1*c2*SVchannel \n"];
WriteString[sphenoUni,"End Function SVchannel \n \n"];
*)
WriteString[sphenoUni,"Complex(dp) Function Uchannel(m1r,m2r,m3r,m4r,mPr,s,c1,c2) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1r,m2r,m3r,m4r,mPr,s\n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::c1,c2\n"];
WriteString[sphenoUni,"Complex(dp)::m1,m2,m3,m4,mP \n"];
WriteString[sphenoUni,"m1=Cmplx(m1r,0._dp)\n"];
WriteString[sphenoUni,"m2=Cmplx(m2r,0._dp)\n"];
WriteString[sphenoUni,"m3=Cmplx(m3r,0._dp)\n"];
WriteString[sphenoUni,"m4=Cmplx(m4r,0._dp)\n"];
WriteString[sphenoUni,"mP=Cmplx(mPr,0._dp)\n"];
WriteString[sphenoUni,"Uchannel = (2*s*Log(-(((m1 - m2)*(m1 + m2)*(m3 - m4)*(m3 + m4) + (m1**2 + m2**2 + m3**2 + m4**2 - 2*mP**2)*s & \n"]; WriteString[sphenoUni,"  & - s**2 + Sqrt((m1**4 + (m2**2 - s)**2 - 2*m1**2*(m2**2 + s))*(m3**4 + (m4**2 - s)**2 - 2*m3**2*(m4**2 + s))))/& \n"]; WriteString[sphenoUni,"  &((-m1 + m2)*(m1 + m2)*(m3 - m4)*(m3 + m4) - (m1**2 + m2**2 + m3**2 + m4**2 - 2*mP**2)*s + s**2 + & \n"]; WriteString[sphenoUni,"  & Sqrt((m1**4 + (m2**2 - s)**2 - 2*m1**2*(m2**2 + s))*(m3**4 + (m4**2 - s)**2 - 2*m3**2*(m4**2 + s)))))))/& \n"];
 WriteString[sphenoUni," &Sqrt((m1**4 + (m2**2 - s)**2 - 2*m1**2*(m2**2 + s))*(m3**4 + (m4**2 - s)**2 - 2*m3**2*(m4**2 + s))) \n"];
WriteString[sphenoUni,"Uchannel = c1*c2*Uchannel \n"];
WriteString[sphenoUni,"End Function Uchannel \n  \n"];
(*
WriteString[sphenoUni,"Complex(dp) Function UVchannel(m1r,m2r,m3r,m4r,mPr,s,c1,c2) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1r,m2r,m3r,m4r,mPr,s\n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::c1,c2\n"];
WriteString[sphenoUni,"Complex(dp)::m1,m2,m3,m4,mP \n"];
WriteString[sphenoUni,"m1=Cmplx(m1r,0._dp)\n"];
WriteString[sphenoUni,"m2=Cmplx(m2r,0._dp)\n"];
WriteString[sphenoUni,"m3=Cmplx(m3r,0._dp)\n"];
WriteString[sphenoUni,"m4=Cmplx(m4r,0._dp)\n"];
WriteString[sphenoUni,"mP=Cmplx(mPr,0._dp)\n"];
WriteString[sphenoUni,"UVchannel = 2-(4*(m1**2+m2**2+m3**2+m4**2-mP**2-2._dp*(s))*s* & \n"]; WriteString[sphenoUni,"  & ArcCoth(((m1-m2)*(m1+m2)*(m3-m4)*(m3+m4)+(m1**2+m2**2+m3**2+m4**2-2*mP**2)*s-s**2)/ & \n"]; WriteString[sphenoUni,"  & (Sqrt((m1**2-m2**2)**2-2*(m1**2+m2**2)*s+s**2)*Sqrt((m3**2-m4**2)**2-2*(m3**2+m4**2)*s+s**2))))/ & \n"]; WriteString[sphenoUni,"  & (Sqrt((m1**2-m2**2)**2-2*(m1**2+m2**2)*s+s**2)*Sqrt((m3**2-m4**2)**2-2*(m3**2+m4**2)*s+s**2))\n"];
WriteString[sphenoUni,"UVchannel = c1*c2*UVchannel \n"];
WriteString[sphenoUni,"End Function UVchannel \n  \n"];
*)
WriteString[sphenoUni,"Complex(dp) Function Tchannel(m1r,m2r,m3r,m4r,mPr,s,c1,c2) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1r,m2r,m3r,m4r,mPr,s\n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::c1,c2\n"];
WriteString[sphenoUni,"Complex(dp)::m1,m2,m3,m4,mP \n"];
WriteString[sphenoUni,"m1=Cmplx(m1r,0._dp)\n"];
WriteString[sphenoUni,"m2=Cmplx(m2r,0._dp)\n"];
WriteString[sphenoUni,"m3=Cmplx(m3r,0._dp)\n"];
WriteString[sphenoUni,"m4=Cmplx(m4r,0._dp)\n"];
WriteString[sphenoUni,"mP=Cmplx(mPr,0._dp)\n"];
WriteString[sphenoUni,"Tchannel =(2*s*Log(((m1-m2)*(m1+m2)*(m3-m4)*(m3+m4)-(m1**2+m2**2+m3**2+m4**2-2*mP**2)*s+s**2& \n"]; WriteString[sphenoUni,"  & -Sqrt((m1**4+(m2**2-s)**2-2*m1**2*(m2**2+s))*(m3**4+(m4**2-s)**2-2*m3**2*(m4**2+s))))/& \n"]; WriteString[sphenoUni,"  & ((m1-m2)*(m1+m2)*(m3-m4)*(m3+m4)-(m1**2+m2**2+m3**2+m4**2-2*mP**2)*s+s**2+Sqrt((m1**4+(m2**2-s)**2& \n"]; WriteString[sphenoUni,"  & -2*m1**2*(m2**2+s))*(m3**4+(m4**2-s)**2-2*m3**2*(m4**2+s))))))/& \n"]; WriteString[sphenoUni,"  & Sqrt((m1**4+(m2**2-s)**2-2*m1**2*(m2**2+s))*(m3**4+(m4**2-s)**2-2*m3**2*(m4**2+s))) \n"];
WriteString[sphenoUni,"Tchannel = c1*c2*Tchannel \n"];
WriteString[sphenoUni,"End Function Tchannel \n  \n"];
(*
WriteString[sphenoUni,"Complex(dp) Function TVchannel(m1r,m2r,m3r,m4r,mPr,s,c1,c2) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Real(dp),Intent(in)::m1r,m2r,m3r,m4r,mPr,s\n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::c1,c2\n"];
WriteString[sphenoUni,"Complex(dp)::m1,m2,m3,m4,mP \n"];
WriteString[sphenoUni,"m1=Cmplx(m1r,0._dp)\n"];
WriteString[sphenoUni,"m2=Cmplx(m2r,0._dp)\n"];
WriteString[sphenoUni,"m3=Cmplx(m3r,0._dp)\n"];
WriteString[sphenoUni,"m4=Cmplx(m4r,0._dp)\n"];
WriteString[sphenoUni,"mP=Cmplx(mPr,0._dp)\n"];
WriteString[sphenoUni,"TVchannel =2+(4*(m1**2+m2**2+m3**2+m4**2-mP**2-2._dp*(s))*s* & \n"]; WriteString[sphenoUni,"  & ArcCoth(((m1-m2)*(m1+m2)*(m3-m4)*(m3+m4)-(m1**2+m2**2+m3**2+m4**2-2*mP**2)*s+s**2)/ & \n"]; WriteString[sphenoUni,"  & (Sqrt((m1**2-m2**2)**2-2*(m1**2+m2**2)*s+s**2)*Sqrt((m3**2-m4**2)**2-2*(m3**2+m4**2)*s+s**2))))/ & \n"]; WriteString[sphenoUni,"  & (Sqrt((m1**2-m2**2)**2-2*(m1**2+m2**2)*s+s**2)*Sqrt((m3**2-m4**2)**2-2*(m3**2+m4**2)*s+s**2)) \n"];
WriteString[sphenoUni,"TVchannel = c1*c2*TVchannel \n"];
WriteString[sphenoUni,"End Function TVchannel \n \n"];

WriteString[sphenoUni,"Complex(dp) Function arccoth(a) \n"];
WriteString[sphenoUni,"Implicit None \n"];
WriteString[sphenoUni,"Complex(dp),Intent(in)::a\n"];
WriteString[sphenoUni,"arccoth = 0.5_dp*Log((a+1)/(a-1)) \n"];
WriteString[sphenoUni,"End Function arccoth \n  \n"];
*)
];


	(* Only used in getColorFactorScattering and getColorFactorScattering4, i.e. the old routines *)
NormalizeState[state_]:=Block[{norm,a,b},
norm=Sqrt[Expand[state^2]/. {a[_]^2->1,b[_]^2->1} /. a[_]->0/. b[_]->0];
Return[Simplify[state/norm]]
];


(* Old routine by FS, not actually used *)
getColorFactorScattering4[ s1_,s2_,s3_,s4_,colorrep_,vert_,index_]:=Block[{colourconstraint,colournorm,res,inds={},dyn1,dyn2,dyn3,dyn4,i1,i2,i3,i4,temp},
inds={i1,i2,i3,i4};
dyn1=SA`DynL[s1,color];
dyn2=SA`DynL[s2,color];
dyn3=SA`DynL[s3,color];
dyn4=SA`DynL[s4,color];


colourconstraint=1;

(* 1 x Z *)
If[dyn1==={0} || dyn2==={0},
If[dyn1==={0} && dyn2==={0},
colourconstraint=colourconstraint;,
If[dyn1==={0},
colourconstraint=colourconstraint Delta[inds[[2]],1];,
colourconstraint=colourconstraint Delta[inds[[1]],1];
];
];
];

If[dyn3==={0} || dyn4==={0},
If[dyn3==={0} && dyn4==={0},
colourconstraint=colourconstraint;,
If[dyn3==={0},
colourconstraint=colourconstraint Delta[inds[[4]],1];,
colourconstraint=colourconstraint Delta[inds[[3]],1];
];
];
];

(* General Case *)

If[dyn1=!={0} && dyn2=!={0},
colourconstraint=colourconstraint (NormalizeState[Coefficient[Invariants[SU3,{dyn1,dyn2,colorrep},Conjugations->{False,False,True}],c[1]][[1]]] /. {a[j_]:>Delta[inds[[1]],j],b[j_]:>Delta[inds[[2]],j]});
];

If[dyn3=!={0} && dyn4=!={0},
colourconstraint=colourconstraint (NormalizeState[Coefficient[Invariants[SU3,{dyn3,dyn4,colorrep},Conjugations->{False,False,False}],c[1]][[1]]] /. {a[j_]:>Delta[inds[[3]],j],b[j_]:>Delta[inds[[4]],j]});
];


(*
(* Check, if vertex is a product of Delta's *)
If[vert=!=False,
colourconstraint=colourconstraint StringTake[vert,{StringLength[vert]-3,StringLength[vert]}] /.{ "aabb"\[Rule]Delta[index[[1]],index[[2]]]Delta[index[[3]],index[[4]]], "abba"\[Rule]Delta[index[[1]],index[[4]]]Delta[index[[2]],index[[3]]], "abab"\[Rule]Delta[index[[1]],index[[3]]]Delta[index[[2]],index[[4]]]};,
colourconstraint=colourconstraint If[dyn1=!={0} && dyn2=!={0},Delta[i1,i2],1]If[dyn1=!={0} && dyn3=!={0},Delta[i1,i3],1] If[dyn1=!={0} && dyn4=!={0},Delta[i1,i4],1]If[dyn2=!={0} && dyn3=!={0},Delta[i2,i3],1] If[dyn2=!={0} && dyn4=!={0},Delta[i2,i4],1] If[dyn3=!={0} && dyn4=!={0},Delta[i3,i4],1]
];
*)

colourconstraint=colourconstraint (ColorStructuresQuartics[C[s1,s2,s3,s4]][[vert]]/.Table[ToExpression["ct"<>ToString[j]]->index[[j]],{j,1,4}]);

temp=colourconstraint;

(* sum over all colours *)
If[dyn1=!={0},temp=Sum[temp,{i1,1,DimR[SU3,dyn1]}]];
If[dyn2=!={0},temp=Sum[temp,{i2,1,DimR[SU3,dyn2]}]];
If[dyn3=!={0},temp=Sum[temp,{i3,1,DimR[SU3,dyn3]}]];
If[dyn4=!={0},temp=Sum[temp,{i4,1,DimR[SU3,dyn4]}]];

Return[temp];

];

(* Old routine by FS, not actually used *)
getColorFactorScattering[ s1_,s2_,s3_,s4_,prop_,Type_,colorrep_]:=Block[{colourconstraint,colournorm,res,inds={},dyn1,dyn2,dyn3,dyn4},

Switch[Type,
"S",
inds={in1,in2,in3,in4};
dyn1=SA`DynL[s1,color];
dyn2=SA`DynL[s2,color];
dyn3=SA`DynL[s3,color];
dyn4=SA`DynL[s4,color];
,
"T",
inds={in1,in3,in2,in4};
dyn1=SA`DynL[s1,color];
dyn2=SA`DynL[s3,color];
dyn3=SA`DynL[s2,color];
dyn4=SA`DynL[s4,color];
,
"U",inds={in1,in3,in4,in2};
dyn1=SA`DynL[s1,color];
dyn2=SA`DynL[s3,color];
dyn3=SA`DynL[s4,color];
dyn4=SA`DynL[s2,color];

];


colourconstraint=1;

(* 1 x Z *)
If[dyn1==={0} || dyn2==={0},
If[dyn1==={0} && dyn2==={0},
colourconstraint=colourconstraint;,
If[dyn1==={0},
colourconstraint=colourconstraint Delta[inds[[2]],1];,
colourconstraint=colourconstraint Delta[inds[[1]],1];
];
];
];

If[dyn3==={0} || dyn4==={0},
If[dyn3==={0} && dyn4==={0},
colourconstraint=colourconstraint;,
If[dyn3==={0},
colourconstraint=colourconstraint Delta[inds[[4]],1];,
colourconstraint=colourconstraint Delta[inds[[3]],1];
];
];
];

(* General Case *)

If[dyn1=!={0} && dyn2=!={0},
colourconstraint=colourconstraint (NormalizeState[Coefficient[Invariants[SU3,{dyn1,dyn2,colorrep},Conjugations->{False,False,True}],c[1]][[1]]] /. {a[j_]:>Delta[inds[[1]],j],b[j_]:>Delta[inds[[2]],j]});
];

If[dyn3=!={0} && dyn4=!={0},
colourconstraint=colourconstraint (NormalizeState[Coefficient[Invariants[SU3,{dyn3,dyn4,colorrep},Conjugations->{False,False,False}],c[1]][[1]]] /. {a[j_]:>Delta[inds[[3]],j],b[j_]:>Delta[inds[[4]],j]});
];


res=getChargeFactor[{{Cp[s1,s2,prop],Cp[s3,s4,conj[prop]]},{Internal[1]->s1,Internal[2]->s2,Internal[3]->s3,Internal[4]->s4,Internal[5]->prop}},{{{s1,in1},{s2,in2},{prop,in5}},{{s3,in3},{s4,in4},{AntiField[prop],in5}}},colourconstraint]/.Delta[__]->1;
Return[res (* colournorm *)];
];

(*
getConstraints[dyna_,dynb_,rep_,flag_,inds_]:=Block[{invos,ninvos,res,invorep,rinvos,invorep2,normos},
If[dyna\[Equal]{0}||dynb\[Equal]{0},
If[dyna\[Equal]{0},
If[dynb\[Equal]{0},
Return[{{{{},1}}}];
,
Return[{{{{inds[[2]]\[Rule]1},1}}}];(* Project onto first index ... *)
];
,
Return[{{{{inds[[1]]\[Rule]1},1}}}];
];
];
If[rep\[Equal]{0}||rep\[Equal]{0,0},
invos=Invariants[SU3,{dyna,dynb},Conjugations\[Rule]{False,False}];
,
invos=Coefficient[Invariants[SU3,{dyna,dynb,rep},Conjugations\[Rule]{False,False,flag}],c[1]];
];

ninvos=Length[invos];

invorep=(If[Head[#]===Plus,List@@#,{#}]&/@Expand[invos])/.{A_*a[x_]b[y_]\[Rule](a[x]b[y]:>A),a[x_]b[y_]->(a[x]b[y]\[RuleDelayed]1)};
normos=Inverse[Array[invos[[#1]]/.invorep[[#2]]/.{a[_]\[Rule]0,b[_]\[Rule]0}&,{ninvos,ninvos}]];

rinvos=(If[Head[#]===Plus,List@@#,{#}]&/@Expand[Simplify[normos.invos]])/.{A_*a[x_]b[y_]\[Rule]{{inds[[1]]\[Rule]x,inds[[2]]\[Rule]y},A},a[x_]b[y_]\[Rule]{{inds[[1]]\[Rule]x,inds[[2]]\[Rule]y},1}};

Return[rinvos];
];
*)



getConstraints[dyna_,dynb_,rep_,flag_,inds_]:=Block[{invos,ninvos,metric,rotmat,diagentries,res,invorep,rinvos,invorep2,normos,normaliser,coeffs,srinvos,i,j,perm,repr,trep,susynoOctettoGellmann,pos},

If[dyna=={0}||dynb=={0},
If[dyna=={0},
If[dynb=={0},
Return[{{{{},1}}}];
,
Return[{{{{inds[[2]]->1},1}}}];(* Project onto first index ... *)
];
,
Return[{{{{inds[[1]]->1},1}}}];
];
];
If[rep=={0}||rep=={0,0},
(* only a delta function since we're only doing SU3 ... Susyno is a bit weird and uses non real representation matrices even for real representations. For dyna = {a,b}, a=!=b it's fine, but for a=b what we really have here is dyna, dyna^* so we would have to use Conjugations\[Rule]{False,True}. So it's better and quicker to just give the result!*)
(*
invos=Invariants[SU3,{dyna,dynb},Conjugations\[Rule]{False,False}];
*)
(* removed by MDG on 20/08/05 becuase this is wrong -- we need the trace!
Return[{{{{inds[[1]]->1,inds[[2]]->1},1/Sqrt[Abs[DimR[SU3,dyna]]]}}}]
*)
Return[{Array[{{inds[[1]] -> #, inds[[2]] -> #}, 
    1/Sqrt[Abs[DimR[SU3,dyna]]]} &, {Abs[DimR[SU3, dyna]]}]}];
,
(* Handle some common cases quickly ... *)
susynoOctettoGellmann=
{{a[1]->-I (ap[3]+I ap[6]),a[2]->ap[1]-I ap[4],a[3]->-ap[2]+I ap[5],a[4]->1/2 (-Sqrt[6] ap[7]+Sqrt[2] ap[8]),a[5]->1/2 (Sqrt[2] ap[7]+Sqrt[6] ap[8]),a[6]->ap[2]+I ap[5],a[7]->-ap[1]-I ap[4],a[8]->I (ap[3]-I ap[6])},{b[1]->-I (bp[3]+I bp[6]),b[2]->bp[1]-I bp[4],b[3]->-bp[2]+I bp[5],b[4]->1/2 (-Sqrt[6] bp[7]+Sqrt[2] bp[8]),b[5]->1/2 (Sqrt[2] bp[7]+Sqrt[6] bp[8]),b[6]->bp[2]+I bp[5],b[7]->-bp[1]-I bp[4],b[8]->I (bp[3]-I bp[6])},{c[1]->-I (cp[3]+I cp[6]),c[2]->cp[1]-I cp[4],c[3]->-cp[2]+I cp[5],c[4]->1/2 (-Sqrt[6] cp[7]+Sqrt[2] cp[8]),c[5]->1/2 (Sqrt[2] cp[7]+Sqrt[6] cp[8]),c[6]->cp[2]+I cp[5],c[7]->-cp[1]-I cp[4],c[8]->I (cp[3]-I cp[6])}};
Switch[Count[{dyna,dynb,rep},{1,1}],
3,
(*If[dyna\[Equal]{1,1}&&dynb\[Equal]{1,1}&&rep\[Equal]{1,1},*)
(*invos={Sum[fSU3[i,j,1]*a[i]*b[j],{i,1,8},{j,1,8}],Sum[dSU3[i,j,1]*a[i]*b[j],{i,1,8},{j,1,8}]}*)
Return[{{{{inds[[1]]->2,inds[[2]]->3},-(1/(2 Sqrt[3]))},{{inds[[1]]->3,inds[[2]]->2},1/(2 Sqrt[3])},{{inds[[1]]->4,inds[[2]]->7},1/2},{{inds[[1]]->4,inds[[2]]->8},-(1/(2 Sqrt[3]))},{{inds[[1]]->5,inds[[2]]->6},1/(2 Sqrt[3])},{{inds[[1]]->6,inds[[2]]->5},-(1/(2 Sqrt[3]))},{{inds[[1]]->7,inds[[2]]->4},-(1/2)},{{inds[[1]]->8,inds[[2]]->4},1/(2 Sqrt[3])}},{{{inds[[1]]->1,inds[[2]]->7},1/(2 Sqrt[5])},{{inds[[1]]->1,inds[[2]]->8},Sqrt[3/5]/2},{{inds[[1]]->2,inds[[2]]->6},-(Sqrt[(3/5)]/2)},{{inds[[1]]->3,inds[[2]]->5},-(Sqrt[(3/5)]/2)},{{inds[[1]]->5,inds[[2]]->3},-(Sqrt[(3/5)]/2)},{{inds[[1]]->6,inds[[2]]->2},-(Sqrt[(3/5)]/2)},{{inds[[1]]->7,inds[[2]]->1},1/(2 Sqrt[5])},{{inds[[1]]->8,inds[[2]]->1},Sqrt[3/5]/2}}}];
,
1,
(* Check if we have {1,0},{0,1},{1,1}*)
If[flag,
trep=Permute[rep,Cycles[{{1,2}}]];
,
trep=rep;
];
If[(!FreeQ[{dyna,dynb,trep},{1,0}])&&(!FreeQ[{dyna,dynb,trep},{0,1}]),
Switch[trep,
{1,1},
(* Project onto 1st Gell-Mann matrix *)
Return[{{{{inds[[1]]->1,inds[[2]]->2},1/Sqrt[2]},{{inds[[1]]->2,inds[[2]]->1},1/Sqrt[2]}}}]
,
{0,1},
perm=FindPermutation[{{1,1},{1,0}},{dyna,dynb}];
repr=Permute[{inds[[1]],inds[[2]]},perm];
Return[{{{{ap->1,bp->2},Sqrt[3]/4},{{ap->3,bp->3},(I Sqrt[3])/4},{{ap->4,bp->2},-((I Sqrt[3])/4)},{{ap->6,bp->3},-(Sqrt[3]/4)},{{ap->7,bp->1},1/2}}}/.{ap->repr[[1]],bp->repr[[2]]}];
,
{1,0},
perm=FindPermutation[{{1,1},{0,1}},{dyna,dynb}];
repr=Permute[{inds[[1]],inds[[2]]},perm];
Return[{{{{ap->1,bp->2},Sqrt[3]/4},{{ap->3,bp->3},-((I Sqrt[3])/4)},{{ap->4,bp->2},(I Sqrt[3])/4},{{ap->6,bp->3},-(Sqrt[3]/4)},{{ap->7,bp->1},1/2}}}/.{ap->repr[[1]],bp->repr[[2]]}];
];
,
pos=Position[{dyna,dynb,trep},{1,1}];
invos=Coefficient[Invariants[SU3,{dyna,dynb,rep},Conjugations->{False,False,flag}]/.susynoOctettoGellmann[[pos[[1,1]]]]/.{ap[x_]->a[x],bp[x_]->b[x],cp[x_]->c[x]},c[1]];

];
,
2,(* n.b. the other state could be (2,2), (3,0) or (0,3) *)
pos=Position[{dyna,dynb,rep},{1,1}];

invos=Coefficient[Invariants[SU3,{dyna,dynb,rep},Conjugations->{False,False,flag}]/.susynoOctettoGellmann[[pos[[1,1]]]]/.susynoOctettoGellmann[[pos[[2,1]]]]/.{ap[x_]->a[x],bp[x_]->b[x],cp[x_]->c[x]},c[1]];

,
_,(* i.e. zero adjoints *)
invos=Coefficient[Invariants[SU3,{dyna,dynb,rep},Conjugations->{False,False,flag}],c[1]];
];
];

ninvos=Length[invos];
If[Count[{dyna,dynb,rep},{1,1}]>0,
metric=Array[Simplify[Expand[invos[[#1]]*Total[Conjugate/@Flatten[{(Expand[invos[[#2]]]/.{Plus->List})}]]/.Conjugate[x__]->x]/. {a[_]^2->1,b[_]^2->1} /. a[_]->0/. b[_]->0]&,{ninvos,ninvos}];
,
(* no adjoints \[Rule] Susyno uses a real basis *)
metric=Array[Simplify[Expand[Expand[invos[[#1]]*invos[[#2]]]/. {a[_]^2->1,b[_]^2->1} ]/. a[_]->0/. b[_]->0]&,{ninvos,ninvos}];
];

Switch[ninvos,
1,
normos={{1/Sqrt[metric[[1,1]]]}};
,
_,
rotmat=Transpose[Eigensystem[metric][[2]]];
If[!FreeQ[rotmat,Root],
rotmat=Transpose[Eigensystem[N[metric]][[2]]]
];
diagentries=Simplify[ConjugateTranspose[rotmat].metric.rotmat];
normaliser=DiagonalMatrix[Array[1/Sqrt[diagentries[[#,#]]]&,{ninvos}]];
normos=Simplify[rotmat.normaliser];
];
srinvos=Expand[Simplify[invos.normos]];
coeffs=Intersection/@((If[Head[#]===Plus,List@@#,{#}]&/@srinvos)/.{A_*a[x_]b[y_]->{x,y},a[x_]b[y_]->{x,y}});
rinvos={};
For[i=1,i<=ninvos,i++,
AppendTo[rinvos,Table[{{inds[[1]]->coeffs[[i,j,1]],inds[[2]]->coeffs[[i,j,2]]},Simplify[Coefficient[srinvos[[i]],a[coeffs[[i,j,1]]]b[coeffs[[i,j,2]]]]]},{j,1,Length[coeffs[[i]]]}]];
];
Return[rinvos];
];


mysparsesum2[MM1_,MM2_,func_]:=Block[{nl,nl2,res},
res=Sum[MM1[[nl,2]]*MM2[[nl2,2]]*(func/.MM1[[nl,1]]/.MM2[[nl2,1]]),{nl,1,Length[MM1]},{nl2,1,Length[MM2]}];
Return[res]

];

IndexOrder[ps_,inds_,set_,setorg_]:=Block[{pos,ops,perm},
pos=Position[setorg,C@@ps];
If[pos=={},
Print["Error in ordering vertex ",ps];
Return[inds];
];
ops=set[[pos[[1,1]],1,1]]/.{A_[{x__}]->A};
perm=FindPermutation[ps,ops];
Return[Permute[inds,perm]];
];
IndexOrderUNITARITY[ps_,inds_]:=Block[{pos,ops,perm},
pos=Position[UNITARITYverticesorg,C@@ps];
If[pos=={},
Print["Error in ordering vertex ",ps,inds];
Return[inds];
];
ops=UNITARITYvertices[[pos[[1,1]],1]]/.{A_[{x__}]->A};
perm=FindPermutation[ps,ops];
Return[Permute[inds,perm]];
];


getColourFactorScattering[ s1_,s2_,s3_,s4_,prop_,Type_,colourrep_]:=Block[{colourconstraint,colournorm,res,inds={},dyn1,dyn2,dyn3,dyn4,j,k,i1,i2,i3,i4,temp,constraint1,constraint2,func,invos1,invos2,ninvos1,ninvos2,invorep1,invorep2,normos1,normos2,inds1,inds2,ps,cs1,cs2,ns1,ns2,dyn5,dd5,cinds},



Switch[Type,
"T",
ps={s1,s3,s2,s4};
cinds={{ct1,ct3},{ct2,ct4}};
,
"U",
ps={s1,s3,s4,s2};
cinds={{ct1,ct3},{ct4,ct2}};
,
_,(* s-channel or 4-pt*)
ps={s1,s2,s3,s4};
cinds={{ct1,ct2},{ct3,ct4}};
];

{dyn1,dyn2,dyn3,dyn4}=SA`DynL[#,color]&/@ps;

(* MARK DEBUG *)
WriteString[FHUnit,"{"<>ToString[{s1,s2,s3,s4,prop,Type,colourrep,{dyn1,dyn2,dyn3,dyn4}}]<>","];
(* *)

If[Type=!="Q",
inds1=IndexOrderUNITARITY[{s1,s2,prop},{ct1,ct2,ct5}];
inds2=IndexOrderUNITARITY[{s3,s4,conj[prop]},{ct3,ct4,ct5}];
dyn5=SA`DynL[prop,color];
,
inds1=IndexOrderUNITARITY[ps,{ct1,ct2,ct3,ct4}];
];



constraint1=getConstraints[dyn1,dyn2,colourrep,True,cinds[[1]]];
constraint2=getConstraints[dyn3,dyn4,colourrep,False,cinds[[2]]];


If[Type=="Q",
cs1=(UNITARITYColourStructures[C[s1,s2,s3,s4]]/.Table[ToExpression["ct"<>ToString[j]]->inds1[[j]],{j,1,4}]);
ns1=Length[cs1];
func=Sum[ToExpression["cp1["<>ToString[j]<>"]"]*cs1[[j]],{j,1,ns1}];
,
cs1=UNITARITYColourStructures[C[s1,s2,prop]]/.Table[ToExpression["ct"<>ToString[j]]->inds1[[j]],{j,1,3}];
cs2=UNITARITYColourStructures[C[s3,s4,conj[prop]]]/.Table[ToExpression["ct"<>ToString[j]]->inds2[[j]],{j,1,3}];
(*Print[cs1,cs2];*)
ns1=Length[cs1];
ns2=Length[cs2];
If[dyn5=={0}||dyn5=={0,0},
func=Sum[ToExpression["cp1["<>ToString[j]<>"]"]*ToExpression["cp2["<>ToString[k]<>"]"]*cs1[[j]]*cs2[[k]],{j,1,ns1},{k,1ns2}];
,
dd5=DimR[SU3,dyn5];
func=Sum[ToExpression["cp1["<>ToString[j]<>"]"]*ToExpression["cp2["<>ToString[k]<>"]"]*cs1[[j]]*cs2[[k]],{j,1,ns1},{k,1ns2},{ct5,1,dd5}];
];

];

temp=Array[mysparsesum2[constraint1[[#1]],constraint2[[#2]],func]&,{Length[constraint1],Length[constraint2]}]/.{sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}]};
(* MARK DEBUG *)
(*Print["result: ",Simplify[temp]];*)
res=Simplify[temp];
WriteString[FHUnit,ToString[InputForm[res]]<>"},\n"];

Return[res];

];





(* ::Input:: *)
(**)
