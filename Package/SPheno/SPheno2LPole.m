(* ::Package:: *)

GenerateSPheno2LPole:=
Block[{},


Print[StyleForm["Writing SPheno two loop diagrammatic Higgs mass","Section",FontSize->12]];
Print["by Mark Goodsell (goodsell@lpthe.jussieu.fr), arxiv:1503.03098"];

(* $sarahCurrentSPhenoDir=ToFileName[{$sarahCurrentOutputDir,"SPheno"}]; *)

spheno2LP=OpenWrite[ToFileName[$sarahSPhenoTwoLoopDir,"2LPole_"<>ModelName<>".f90"]];

Write2LPoleHeader;

Write2LPoleFunction;

WriteString[spheno2LP,"End Subroutine CalculatePi2S\n"];
WriteString[spheno2LP,"End Module Pole2L_"<>ModelName<>" \n \n"];
Close[spheno2LP];

If[FileExistsQ[ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]]===True,
DeleteFile[ToFileName[$sarahSPhenoTwoLoopDir,"2LPoleFunctions.f90"]];
  ];

      If[SupersymmetricModel=!=False,
	 CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"2LPoleFunctions.f90"],ToFileName[$sarahCurrentSPhenoDir,"2LPoleFunctions.f90"]];
	 ,
	 CopyFile[ToFileName[ToFileName[{$sarahSPhenoPackageDir,"IncludeSPheno"}],"2LPoleFunctionsMSbar.f90"],ToFileName[$sarahCurrentSPhenoDir,"2LPoleFunctions.f90"]];
	];



];


Write2LPoleHeader:=Block[{},
WriteString[spheno2LP,"Module Pole2L_"<>ModelName<>" \n \n"];
WriteString[spheno2LP,"Use Control \n"];
WriteString[spheno2LP,"Use Couplings_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use LoopFunctions \n"];
WriteString[spheno2LP,"Use Mathematics \n"];
WriteString[spheno2LP,"Use MathematicsQP \n"];
WriteString[spheno2LP,"Use Model_Data_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use StandardModel \n"];
WriteString[spheno2LP,"Use TreeLevelMasses_"<>ModelName<>" \n"];
WriteString[spheno2LP,"Use Pole2LFunctions\n"];

WriteString[spheno2LP,"Contains \n \n"];


];



Write2LPoleFunction:=Block[{},
MakeSubroutineTitle["CalculatePi2S",Join[listVEVs,listAllParameters],{"p2"},{"kont","tad2L","Pi2S","Pi2P"},spheno2LP];

			  

dimMatrix = ToString[getGenSPheno[hh]];

WriteString[spheno2LP, "Implicit None \n"];
MakeVariableList[listAllParameters,",Intent(in)",spheno2LP];
MakeVariableList[listVEVs,",Intent(in)",spheno2LP];
MakeVariableList[NewMassParameters,"",spheno2LP];


MakeVariableList[namesAll3P,"",spheno2LP];
MakeVariableList[namesAll4Pole,"",spheno2LP];


WriteString[spheno2LP,"Real(dp), Intent(in) :: p2\n"];
WriteString[spheno2LP, "Integer, Intent(inout):: kont\n"];
WriteString[spheno2LP, "Integer :: gE1,gE2,i,i1,i2,i3,i4,i5 \n"];
WriteString[spheno2LP,"Real(dp) :: Qscale,prefactor,funcvalue\n"];
WriteString[spheno2LP,"complex(dp) :: cplxprefactor\n"];
WriteString[spheno2LP,"Real(dp)  :: temptad("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcont("<>dimMatrix<>","<>dimMatrix<>")\n"];
 WriteString[spheno2LP,"Real(dp)  :: runningval("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: tad2l("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: Pi2S("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp), Intent(out) :: Pi2P("<>dimMatrix<>","<>dimMatrix<>")\n"];

WriteString[spheno2LP,"complex(dp) :: coup1,coup2,coup3,coup4\n"];
WriteString[spheno2LP,"complex(dp) :: coup1L,coup1R,coup2l,coup2r,coup3l,coup3r,coup4l,coup4r\n"];

(* parameter for when to tree fermions in the loop as massless*) 
WriteString[spheno2LP,"real(dp) :: epsFmass\n"];
WriteString[spheno2LP,"real(dp) :: epscouplings\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingvector("<>dimMatrix<>")\n"];
WriteString[spheno2LP,"Real(dp)  :: tempcouplingmatrix("<>dimMatrix<>","<>dimMatrix<>")\n"];
WriteString[spheno2LP,"logical :: nonzerocoupling\n"];

(* Vector IncludeOnlyInternals restricts to only specific fields in the loop, e.g. 

IncludeOnlyInternals={Su,VG,Fu,Glu};

This can also be set in the SPheno.m file.

If this is set, then we also restrict to third generation only. 
*)
If[Length[IncludeOnlyInternals]!=0,
   WriteString[spheno2LP,"Complex(dp) :: Ydtemp(3,3),Yetemp(3,3),Yutemp(3,3)\n"];
   WriteString[spheno2LP,"real(dp) :: topyukawa,sbe,pietromt,vv\n"];
   WriteString[spheno2LP,"write(*,*) \"Setting Yukawas diagonal and Yd to zero \"\n"];
   WriteString[spheno2LP,"Ydtemp = (0._dp,0._dp)\nYdtemp(3,3)=real(Yd(3,3))\nYetemp = (0._dp,0._dp)\nYetemp(3,3)=real(Ye(3,3))\ntopyukawa = real(Yu(3,3))\nYutemp = (0._dp,0._dp)\nYutemp(3,3) = topyukawa\n"];
   subcoupnames={Yu->Yutemp,Yd->Ydtemp,Ye->Yetemp,T[x_]->T[x]};,
   (* otherwise we don't do anything *)
   subcoupnames={};
];

WriteString[spheno2LP,"\n\n"];

WriteString[spheno2LP,"tad2l(:)=0\n"];
WriteString[spheno2LP,"Pi2S(:,:)=0\n"];
WriteString[spheno2LP,"Pi2P(:,:)=0\n"];
WriteString[spheno2LP,"Qscale=getrenormalizationscale()\n"];
WriteString[spheno2LP,"epsfmass=0._dp\n"];
WriteString[spheno2LP,"epscouplings=1.0E-6_dp\n"];


(* Call tree level masses *)
MakeCall["TreeMassesEffPot",Join[NewMassParameters,Join[listVEVs,listAllParameters/.subcoupnames]],{},{".True.","kont"},spheno2LP];
(* Call 3-point couplings *)
MakeCall["CouplingsFor2LPole3" , Join[parametersAll3P/.subcoupnames,namesAll3P],{},{},spheno2LP];
(* Call 4-point couplings taking proper care of colour factors *)
MakeCall["CouplingsFor2LPole4" , Join[parametersAll4Pole/.subcoupnames,namesAll4Pole],{},{},spheno2LP];

(*************************************************************************)
(********************* TADPOLE DIAGRAMS **********************************)
(*************************************************************************)

Print["Generating tadpole diagrams"];

total2Ldiagramswritten=0;
	 		   
all2LPddata=Classify2LTadpoleDiagrams[HiggsBoson];
all2LPdiagrams=all2LPddata[[1]];
POLE2Ldiagramdata=all2LPddata[[2]];

dynamictwolooptadpoletopology="";
dynamictwolooptadpolediagram="";

Print[Dynamic[dynamictwolooptadpoletopology],": ",Dynamic[dynamictwolooptadpolediagram]];

WriteString[spheno2LP,"! ----------------------------\n"];
WriteString[spheno2LP,"! ----- TADPOLE DIAGRAMS -----\n"];
WriteString[spheno2LP,"! ----------------------------\n"];



WriteString[spheno2LP,"temptad(:)=0._dp\n"];
WriteString[spheno2LP,"tempcouplingvector(:)=0._dp\n"];

WriteString[spheno2LP,"! ----- SCALAR ONLY DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology T_SSS\n\n"];
type=ToSSS;

writePOLEfunctions[1,type,{1,1,1},{1,1,1}];

			  
WriteString[spheno2LP,"! ----- Topology T_SS\n\n"];
type=ToSS;

writePOLEfunctions[1,type,{1,1,2},{1,1,2}];

WriteString[spheno2LP,"! ----- Topology T_SSSS\n\n"];
type=ToSSSS;

writePOLEfunctions[1,type,{1,1,2,2},{1,1,1,1}];

WriteString[spheno2LP,"! ----- SCALAR AND VECTOR DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology T_SV\n\n"];
type=ToSV;

writePOLEfunctions[1,type,{1},{1}];


WriteString[spheno2LP,"! ----- FERMION AND SCALAR DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology T_SSFF\n\n"];
type=ToSSFF;

writePOLEfunctionsF[1,type,{1,1,2,2}];

WriteString[spheno2LP,"! ----- Topology T_FFFS\n\n"];
type=ToFFFS;

writePOLEfunctionsF[1,type,{1,1,2,3}];

WriteString[spheno2LP,"! ----- FERMION AND VECTOR DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology T_FV\n\n"];
type=ToFV;

writePOLEfunctionsF[1,type,{1}];


WriteString[spheno2LP,"! ----------------------------\n"];
WriteString[spheno2LP,"! ---- Final tadpole result --\n"];
WriteString[spheno2LP,"temptad=temptad*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"tad2L=matmul(temptad,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];
WriteString[spheno2LP,"! ----------------------------\n"];


dynamictwolooptadpoletopology="Tadpole diagrams complete";
dynamictwolooptadpolediagram=ToString[total2Ldiagramswritten]<>" diagrams written to file.";
			    
(*************************************************************************)
(********************* MASS DIAGRAMS *************************************)
(*************************************************************************)

If[FreeQ[ParticleDefinitions[CurrentStates],"Pseudo-Scalar Higgs"],iScalarEnd=1;,iScalarEnd=2;];

For[iScalar=1,iScalar<=iScalarEnd,

total2Ldiagramswritten=0;

If[iScalar===1,

Print["Generating mass diagrams for CP-even states"];
Clear[all2LPddata,all2LPdiagrams,POLE2Ldiagramdata,topdata];
all2LPddata=Classify2LPdiagrams[HiggsBoson];,
Print["Generating mass diagrams for CP-odd states"];
Clear[all2LPddata,all2LPdiagrams,POLE2Ldiagramdata,topdata];
all2LPddata=Classify2LPdiagrams[PseudoScalar];
];


all2LPdiagrams=all2LPddata[[1]];
POLE2Ldiagramdata=all2LPddata[[2]];


WriteString[spheno2LP,"! ----------------------------\n"];
WriteString[spheno2LP,"! ------- MASS DIAGRAMS ------\n"];
WriteString[spheno2LP,"! ----------------------------\n"];


dynamictwolooppoletopology="";
dynamictwolooppolediagram="";

Print[Dynamic[dynamictwolooppoletopology],": ",Dynamic[dynamictwolooppolediagram]];


(********************* SCALAR ONLY DIAGRAMS **********************************)
			 


WriteString[spheno2LP,"tempcont(:,:)=0._dp\n"];
WriteString[spheno2LP,"tempcouplingmatrix(:,:)=0._dp\n"];

(*------------------------------------- SCALARS ONLY --------------------------------- *)


WriteString[spheno2LP,"! ----- SCALAR ONLY DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology W_SSSS\n\n"];
type=WoSSSS;

writePOLEfunctions[2,type,{1,1,2,2},{1,1,1,1}];


WriteString[spheno2LP,"! ----- Topology X_SSS\n\n"];
type=XoSSS;

writePOLEfunctions[2,type,{1,1,2},{1,1,2}];


WriteString[spheno2LP,"! ----- Topology Y_SSSS\n\n"];
type=YoSSSS;

writePOLEfunctions[2,type,{1,2,2,3},{1,1,1,2}];

WriteString[spheno2LP,"! ----- Topology Z_SSSS\n\n"];
type=ZoSSSS;

writePOLEfunctions[2,type,{1,1,2,2},{1,1,2,2},{1,1}];


WriteString[spheno2LP,"! ----- Topology1 S_SSS\n\n"];
type=SoSSS;

writePOLEfunctions[2,type,{1,1,1},{1,1,1}];


WriteString[spheno2LP,"! ----- Topology U_SSSS\n\n"];
type=UoSSSS;

writePOLEfunctions[2,type,{1,2,3,3},{1,1,1,1}];


WriteString[spheno2LP,"! ----- Topology V_SSSSS\n\n"];
type=VoSSSSS;

			   
writePOLEfunctions[2,type,{1,2,2,3,3},{1,1,1,1,1}];

WriteString[spheno2LP,"! ----- Topology M_SSSSS\n\n"];
type=MoSSSSS;

writePOLEfunctions[2,type,{1,2,1,2,3},{1,1,1,1,1},{1,1,3}];







(********************* SCALAR AND VECTOR DIAGRAMS **********************************)

WriteString[spheno2LP,"! ----- SCALAR AND VECTOR DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology W_SSSV \n\n"];
type=WoSSSV;

writePOLEfunctions[2,type,{1},{1}];

WriteString[spheno2LP,"! ----- Topology V_SSSSV \n\n"];
type=VoSSSSV;

writePOLEfunctions[2,type,{1,1},{1,1}];

WriteString[spheno2LP,"! ----- Topology M_SSSSV \n\n"];
type=MoSSSSV;

writePOLEfunctions[2,type,{1,1},{1,1}];



(*------------------------------------- FERMIONS AND SCALARS --------------------------------- *)

WriteString[spheno2LP,"! ----- FERMION AND SCALAR DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology W_SSFF \n\n"];
type=WoSSFF;

writePOLEfunctionsF[2,type,{1,1,2,2}]; 

WriteString[spheno2LP,"! ----- Topology M_FFFFS \n\n"];
type=MoFFFFS;

writePOLEfunctionsF[2,type,{1,2,1,2,3}];

WriteString[spheno2LP,"! ----- Topology M_SFSFF \n\n"];
type=MoSFSFF;

writePOLEfunctionsF[2,type,{1,2,3,2,4}];

WriteString[spheno2LP,"! ----- Topology V_SSSFF \n\n"];
type=VoSSSFF;

writePOLEfunctionsF[2,type,{1,2,2,3,3}];

WriteString[spheno2LP,"! ----- Topology V_FFFFS \n\n"];
type=VoFFFFS;

writePOLEfunctionsF[2,type,{1,2,2,3,4}]; 



(*------------------------------------- FERMIONS AND VECTORS --------------------------------- *)

WriteString[spheno2LP,"! ----- FERMION AND VECTOR DIAGRAMS\n"];

WriteString[spheno2LP,"! ----- Topology G_FFFFV \n\n"];
type=GoFFFFV;

writePOLEfunctionsF[2,type,{1,1}]; 

(*------------------------------------- END OF FUNCTIONS --------------------------------- *)

dynamictwolooppoletopology="Mass diagrams complete";
dynamictwolooppolediagram=ToString[total2Ldiagramswritten]<>" diagrams written to file.";

WriteString[spheno2LP,"! ----- TIDY UP AND SYMMETRISE -----\n"];

If[iScalar==1,

(** TIDY UP THE POLE FUNCTION ***)
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
WriteString[spheno2LP,"Pi2S(gE1,gE1)=Pi2S(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"do gE2=1,gE1-1\n"];

WriteString[spheno2LP,"Pi2S(gE1,gE2)=Pi2S(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"Pi2S(gE2,gE1)=Pi2S(gE1,gE2)\n"];
WriteString[spheno2LP,"End do\nEnd do\n"];


(** --- now to "undiagonalise" ---- *)

WriteString[spheno2LP,"Pi2S = Matmul(Pi2S,"<>SPhenoForm[HiggsMixingMatrix]<>")\n"];
WriteString[spheno2LP,"Pi2S = Matmul(Transpose("<>SPhenoForm[HiggsMixingMatrix]<>"),Pi2S)\n"];

If[Length[IncludeOnlyInternals]!=0,
   WriteString[spheno2LP,"write(*,*) \"Result of Pi2S: \"\n"];
   WriteString[spheno2LP,"write(*,*) Pi2S\n"];
   ];,



(** TIDY UP THE POLE FUNCTION ***)
WriteString[spheno2LP,"do gE1=1,"<>dimMatrix<>"\n"];
WriteString[spheno2LP,"Pi2P(gE1,gE1)=Pi2P(gE1,gE1)+tempcont(gE1,gE1)*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"do gE2=1,gE1-1\n"];

WriteString[spheno2LP,"Pi2P(gE1,gE2)=Pi2P(gE1,gE2)+0.5_dp*(tempcont(gE1,gE2)+tempcont(gE2,gE1))*oo16Pi2*oo16Pi2\n"];
WriteString[spheno2LP,"Pi2P(gE2,gE1)=Pi2P(gE1,gE2)\n"];
WriteString[spheno2LP,"End do\nEnd do\n"];


(** --- now to "undiagonalise" ---- *)

WriteString[spheno2LP,"Pi2P = Matmul(Pi2P,"<>SPhenoForm[PseudoScalarMixingMatrix]<>")\n"];
WriteString[spheno2LP,"Pi2P = Matmul(Transpose("<>SPhenoForm[PseudoScalarMixingMatrix]<>"),Pi2P)\n"];

If[Length[IncludeOnlyInternals]!=0,
   WriteString[spheno2LP,"write(*,*) \"Result of Pi2P: \"\n"];
   WriteString[spheno2LP,"write(*,*) Pi2P\n"];
   ];

 ];
 iScalar++;
];




			   
];  

(****************************************************** END OF Write2LPoleFunction ********************************)

(****************************************************** DEFINE HELPER FUNCTIONS  ********************************)

getSPhenoCouplingPole[x_, couplings_] := Module[{func, cList, pList,pos},
(* Returns the spheno coupling name and the ordered list of particles given a coupling of the form C[p1,....]*)
  func = x /. Cp[a__] -> C[a] /. A_[{a__}] -> A;
  If[FreeQ[couplings, func] == False,
   pos = Position[couplings, func];
   cList = Extract[couplings, pos[[1, 1]]][[2]];
            pList = Last[Extract[couplings, pos[[1, 1]]]];
   Return[{Delete[cList, 1], pList}],
   If[FreeQ[couplings, ConjCoupling[func]] == False,
    pos = Position[couplings, ConjCoupling[func]];
    cList = Extract[couplings, pos[[1, 1]]][[2]];
           pList = Map[AntiField,Last[Extract[couplings,pos[[1,1]]]]];
           Return[{Delete[cList, 1], pList}];,
      Return[0]]];
  Return[0]]




(****************************************************** SYMMETRY FACTORS  ********************************)

SetAttributes[{POLEdiagsymmetries}, {HoldAll}];
POLEdiagsymmetries[listinternals_,ps_,equivalencesets_,chains_,metaequivalencesets_:{1,2,3,4,5}] := Module[{i, j, nsets,tempsets,ctempsets,tempset,tempset2,equivalentset,cequivalentset,equivalentsetno,
nid, lenset, symfac, ncomplex, nchains, tempchains, tempchain, lenchain},

											    
   nsets = Last[equivalencesets];
   nchains = Last[chains];
   tempsets = Table[{}, {i, 1, nsets}];
   ctempsets = Table[{}, {i, 1, nsets}];
   tempchains = Table[{}, {i, 1, nchains}];
   symfac = 1;												     
 
  If[nchains>0,(* added for fermion bits, which have no chains ... *)
     For[i = 1, i <= Length[equivalencesets], i++,
	 AppendTo[tempsets[[equivalencesets[[i]]]], ps[[i]]];
	 AppendTo[ctempsets[[equivalencesets[[i]]]], myconj[{ps[[i]]}]/.{{x_}->x}];
	 AppendTo[tempchains[[chains[[i]]]], ps[[i]]];
	 ];
     ,
     For[i = 1, i <= Length[equivalencesets], i++,
	 AppendTo[tempsets[[equivalencesets[[i]]]], ps[[i]]];
	 AppendTo[ctempsets[[equivalencesets[[i]]]], myconj[{ps[[i]]}]/.{{x_}->x}];
	 ];
     ];


  For[i = 1, i <= nsets, i++,
      tempsets[[i]]=Sort[tempsets[[i]]];
      ctempsets[[i]]=Sort[ctempsets[[i]]];
      equivalentsetno=metaequivalencesets[[i]];
      If[equivalentsetno<i,
	 tempset=tempsets[[i]];
	 equivalentset=tempsets[[equivalentsetno]]; (* Already sorted on the first pass ... *)

	 ctempset=ctempsets[[i]];
	 cequivalentset=ctempsets[[equivalentsetno]];

	 If[tempset =!= equivalentset,
	    symfac = symfac*2;
	    ];
	 If[OrderedQ[{equivalentset,tempset}]==False, (* If not correctly ordered then swap them round *)
	    tempsets[[equivalentsetno]]=tempset;
	    tempsets[[i]]=equivalentset;
	    ];
	 If[OrderedQ[{cequivalentset,ctempset}]==False, (* If not correctly ordered then swap them round *)
	    ctempsets[[equivalentsetno]]=ctempset;
	    ctempsets[[i]]=cequivalentset;
	    ];

	 ];
      ];
    										     

  If[FreeQ[listinternals,tempsets]=!=True,
     (* old diagram!*) 
     Return[0]
     ];
  If[FreeQ[listinternals,ctempsets]=!=True,
     (* old diagram!*)
     Return[0]
     ];

(* Otherwise we have a new diagram: compute the symmetry factor *)
											     
  AppendTo[listinternals,tempsets];
  ncomplex=0;
  For[i = 1, i <= nchains, i++, 
      tempchain = tempchains[[i]];
      lenchain = Length[tempchain];
      For[j = 1, j <= lenchain, j++,
	  If[conj[tempchain[[j]]] =!= tempchain[[j]],
	     ncomplex++;
	     Break[];
	     ];
	  ];
      ];

  For[i = 1, i <= nsets, i++, 
      tempset = tempsets[[i]];
      lenset = Length[tempset];
      tempset = tempset //. {conj[a_] -> a,bar[a_]->a};
      symfac = symfac*Factorial[lenset];
      While[lenset > 0, tempset = DeleteCases[tempset, tempset[[1]]];
	    nid = 0;
	    nid = lenset - Length[tempset];
	    symfac = symfac/Factorial[nid];
	    lenset = Length[tempset]
	    ];
      ];
   
  symfac = symfac*Power[2, ncomplex];
   
  Return[symfac];
											     
  
];









(************************************************************************************************************************)
(****************************************************** OVERALL SCALAR WRITER FUNCTION **********************************)
(************************************************************************************************************************)

writePOLEfunctions[nh_,type_,equivalences_,chains_,metasets_:{1,2,3,4,5}]:=Module[{ps,finalnumberofdiags,ninternalparticles,numberofcouplings,i,j,iic,iii,k,x,diag,NrDiags,diagrams,diagselection,diagdata,BreakFlag,tempcoup,coups,prefactor,constantprefactor,string,funcstring,finalstring,symfactor,Scalarcouplingnumber,myparts,nmyparts,setofindices,findpart,target,descriptioninternalprops,allindicesstrings,mylistinternals,indstring,indicestowrite},

Clear[topdata];

If[nh==1,
   dynamictwolooptadpoletopology="Topology "<>ToString[type];
   ,
   dynamictwolooppoletopology="Topology "<>ToString[type];
  ];

ninternalparticles=Length[equivalences];
finalnumberofdiags=0;

mylistinternals={};

					
diagselection=Select[all2LPdiagrams,#[[1]]===type&];
If[Length[diagselection]>0,
diagrams=diagselection[[1,2]];
   NrDiags=Length[diagrams],
   NrDiags=0];


If[NrDiags>0,
   finalnumberofdiags=0;
   diagdata=(Select[POLE2Ldiagramdata,#[[1]]===type&])[[1,2]];
   topdata=topdata/.diagdata;
   CPOLEprefactor=pprefactor/.diagdata;
   funcstring=pfuncstring/.diagdata;

   For[i=1,i<=NrDiags,i++,
       diag=diagrams[[i]];
       ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
       
       BreakFlag=False;
       If[Length[IncludeOnlyInternals]!=0,
	  For[j=1,j<=Length[ps],j++,
	      If[FreeQ[IncludeOnlyInternals,ps[[j]]/.{conj[x_]->x}]==True,
		 BreakFlag=True;
		 Continue[];  
		 ];
	      ];
	  ];
       If[BreakFlag==True,
	  Continue[]];
       
       
       numberofcouplings=Length[diag[[1]]];
    

    

       coups={};
       BreakFlag=False;
       For[j=1,j<=numberofcouplings,j++,
	   tempcoup=diag[[1,j]];
	   If[Length[tempcoup/.{C[x__]->{x}}]==4,
	      tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings4Pole],
	      tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings3P]];
	   If[tempcoup===0,BreakFlag=True,
	      AppendTo[coups,tempcoup]
	      ];
	      ];
       
       If[BreakFlag==True,
	  Continue[]];

       
       
       symfactor=POLEdiagsymmetries[mylistinternals,ps,equivalences,chains,metasets];
       If[symfactor==0,
	  Continue[];
	  ];


       finalnumberofdiags++;
       
    

       descriptioninternalprops=StringJoin@Riffle[ToString/@ps,","];

       WriteString[spheno2LP,"! ---- "<>descriptioninternalprops<>" ----\n"];

       If[nh==1,
	  dynamictwolooptadpolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
	  ,
	  dynamictwolooppolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
	 ];
    

       allindicesstrings={};
       adjoint=False;
   
   
       indexmaps = {};
       setofindices = {};
       myparts = {};
       internalparticlelist = {};
       GaugeBosonFlag = False;
       Scalarcouplingnumber = 0;
       numberofcouplings = Length[diag[[1]]];
       colourfactor=0;
       
       ps = DeleteCases[{Internal[1] /. diag[[2]], Internal[2] /. diag[[2]], 
		      Internal[3] /. diag[[2]], Internal[4] /. diag[[2]], 
		      Internal[5] /. diag[[2]]}, Internal[_]];
       setofindices = topdata /. diag[[2]];

  

       nmyparts=Count[Flatten[topdata],Internal[_]];
       internalparticlelist=Table[{ps[[iii]], ToExpression["i" <> ToString[iii]]}, {iii, 1, nmyparts}];
       myparts=Take[ps,nmyparts];


       
       If[FreeQ[ps, VG] == False,
	  GaugeBosonFlag=True;
	  indicesoffirstinternal = getIndizesWI[myparts[[1]]];
	  dimoffirstinternal = (Select[indicesoffirstinternal, FreeQ[#, color] == False &])[[1]] /. {color, a_Integer} -> a;
	  numberingaugegroupofcolor = (Position[Gauge, color])[[1, 1]];
	  colourfactor = 8*(CalculateDynkinAndCasimir[numberingaugegroupofcolor,dimoffirstinternal])[[2]]
	  ];

       indextonumber={i1->1,i2->2,i3->3,i4->4,i5->5};

       For[j = 1, j <= numberofcouplings, j++,
	   particlesincouplingj = diag[[1, j]] /. {C[x__] -> {x}};
	   nparticlesincouplingj = Length[particlesincouplingj];
	   If[FreeQ[particlesincouplingj, VG] == False,
	      coups[[j]] = {{g3}, False};
	      AppendTo[allindicesstrings,{"",False}];
	      Continue[]
	      ];
	   Scalarcouplingnumber++;
	   If[nparticlesincouplingj==4,
	      (* First check whether four identical particles up to conjugation; in that case have to be careful with order if coloured *)
	      
	      If[Length[Intersection[RE/@particlesincouplingj]]==1 && Length[Intersection[particlesincouplingj]]==2,
		 particlesincoupling=Transpose[setofindices[[Scalarcouplingnumber]]][[1]];
		 indicesincoupling=Transpose[setofindices[[Scalarcouplingnumber]]][[2]];
		 setofpairs={{},{}};
		 
		 orderedfieldsincoupling=diag[[1,j]]/.{C[x__]->{x}};
		  
		 
		 For[k=1,k<=4,k++,
		     
		     AppendTo[setofpairs[[chains[[indicesincoupling[[k]]/.indextonumber]]]],{particlesincoupling[[k]],indicesincoupling[[k]]}];
		    ];
		
		 (* sets of pairs should be sets of conjugates ... *)
		 newcouplingindices={{},{},{},{}};
		 pp1=Position[orderedfieldsincoupling,setofpairs[[1,1,1]],1][[1,1]];
		 pp2=Position[orderedfieldsincoupling,setofpairs[[1,2,1]],1][[1,1]];
		 pp3=Position[orderedfieldsincoupling,setofpairs[[2,1,1]],1][[2,1]];
		 pp4=Position[orderedfieldsincoupling,setofpairs[[2,2,1]],1][[2,1]];
		 newcouplingindices[[pp1]]=setofpairs[[1,1]];
		 newcouplingindices[[pp2]]=setofpairs[[1,2]];
		 newcouplingindices[[pp3]]=setofpairs[[2,1]];
		 newcouplingindices[[pp4]]=setofpairs[[2,2]];
		
		 (* Have already ordered the couplings so let's do our own makeindicescoupling4 rather than calling the other function *)
		    
		 indstring="(";
		 indicestowrite={};
		 For[k=1,k<=4,k++,
		     If[getGenSPheno[newcouplingindices[[k,1]]]>1,
		       AppendTo[indicestowrite,newcouplingindices[[k,2]]]];
		     
		    ];
		 indstring=indstring<>(StringJoin @@ Riffle[ToString /@ indicestowrite, ","]);
		 indstring=indstring<>")";
		 (* Don't have a complex conjugate for this sort of four-point coupling*)
		 AppendTo[allindicesstrings,{indstring,False}];
		 ,
		 
		 

		 (* Otherwise just a regular coupling *)
		 AppendTo[allindicesstrings,MakeIndicesCoupling4[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]
		],
	      AppendTo[allindicesstrings,MakeIndicesCoupling[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]
	     ];
	  ];
  

       For[j=1,j<=Length[internalparticlelist],j++,
	   If[getGen[internalparticlelist[[j,1]]]>1,
	      WriteString[spheno2LP,"Do "<>ToString[internalparticlelist[[j,2]]]<>"=1,"<>ToString[getGen[internalparticlelist[[j,1]]]]<>"\n"];
	      ]
	   ];

       
       Clear[ci1,ci2,ci3,icc];

 

	 
    
       If[GaugeBosonFlag == False,
	  colourfactor=mhpolegetcolour[setofindices];
	  ];
       
	
     
       If[nh==1,
	  argstring="(";
	  ,
	  argstring="(p2,";
	  ];
       argstring=argstring<>StringJoin@@Riffle[(ToString@SPhenoMassSq[#[[1]], #[[2]]]) /. {"0." -> "0._dp"}&/@internalparticlelist,","]<>",Qscale)";
    
       If[nh==1,
	  WriteString[spheno2LP,"tempcouplingvector=0._dp\n"]; 
	  ,
	  WriteString[spheno2LP,"tempcouplingmatrix=0._dp\n"];   
	  ];
       WriteString[spheno2LP,"nonzerocoupling=.false.\n"];

       WriteString[spheno2LP,"Do gE1=1,"<>dimMatrix<>"\n"];
       If[nh>1,
       WriteString[spheno2LP,"  Do gE2=1,"<>dimMatrix<>"\n"];
	  ];
	  
       
    
       POLEprefactor=CPOLEprefactor*symfactor;

       prefactorstring=ToString[FortranForm[POLEprefactor]];
       
       

       
       string="prefactor=Real("<>prefactorstring;


       For[j=1,j<=numberofcouplings,j++,
	   WriteVertexToFile[j,coups[[j]],allindicesstrings[[j]],getVertexType[diag[[1,j]]],spheno2LP];
	   string=string<>"*coup"<>ToString[j];
	  ];
       If[colourfactor!=1,
	  string=string<>"*"<>ToString[FortranForm[colourfactor]]];
	  
	  
       string=string<>",dp)\n";


       WriteString[spheno2LP,string];
	 
       
       WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n"];
       If[nh==1,
	  WriteString[spheno2LP,"tempcouplingvector(gE1)=tempcouplingvector(gE1)+prefactor\n"];
	  ,
	  WriteString[spheno2LP,"tempcouplingmatrix(gE1,gE2)=tempcouplingmatrix(gE1,gE2)+prefactor\n"];
	  ];
       WriteString[spheno2LP,"nonzerocoupling=.true.\n"];
       WriteString[spheno2LP,"end if\n"];
	  

	  
	  
       If[nh==1,
	  WriteString[spheno2LP,"   End Do\n"];
	  ,
	  WriteString[spheno2LP,"   End Do\nEnd do\n"];
	  ];

       WriteString[spheno2LP,"if(nonzerocoupling) then \n"];
       If[Mod[numberofcouplings,2]==1,
	  (* Switch sign -- this is a cheat because all of the couplings are actually defined with a minus sign relative to martin *)
	  WriteString[spheno2LP,"funcvalue= -1._dp*"<>funcstring<>argstring<>"\n"];,
	  (* Otherwise no need to switch sign *)
	  WriteString[spheno2LP,"funcvalue= "<>funcstring<>argstring<>"\n"];
	  ];
       If[nh==1,
	  WriteString[spheno2LP," temptad=temptad+tempcouplingvector*funcvalue\n"];
	  ,
	  WriteString[spheno2LP," tempcont=tempcont+tempcouplingmatrix*funcvalue\n"];
	  ];
       WriteString[spheno2LP,"end if\n"];

 
       For[j=1,j<=Length[internalparticlelist],j++,
	   If[getGen[internalparticlelist[[j,1]]]>1,
	      WriteString[spheno2LP,"End do\n"];
	      ]
	  ];

      
       
	 
  
      ];
       
   If[nh==1,
      dynamictwolooptadpolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
      ,
      dynamictwolooppolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
     ];
  
   total2Ldiagramswritten+=finalnumberofdiags;

  ];
];
(************************************************************************************************************************)
(******************************************************  END OVERALL WRITER FUNCTION  ***********************************)
(************************************************************************************************************************)

(************************************************************************************************************************)
(******************************************************  FUNCTION INVOLVING FERMIONS ... ********************************)
(************************************************************************************************************************)


writePOLEfunctionsF[nh_,type_,equivalences_,metasets_:{1,2,3,4,5}]:=Module[{ps,fermionmasses,finalnumberofdiags,ninternalparticles,numberofcouplings,i,j,iic,ii,iii,k,diag,diagrams,diagselection,diagdata,BreakFlag,tempcoup,coups,prefactor,constantprefactor,funcstring,finalstring,symfactor,Scalarcouplingnumber,myparts,nmyparts,setofindices,findpart,target,generalddata,specificddata,tempddata,CPOLEprefactors,funcstrings,mylistinternals},




If[nh==1,
   dynamictwolooptadpoletopology="Topology "<>ToString[type];
   ,
   dynamictwolooppoletopology="Topology "<>ToString[type];
  ];

ninternalparticles=Length[equivalences];
finalnumberofdiags=0;

mylistinternals={};

diagselection=Select[all2LPdiagrams,#[[1]]===type&];
If[Length[diagselection]>0,
diagrams=diagselection[[1,2]];
   NrDiags=Length[diagrams],
   NrDiags=0];
If[NrDiags>0,
   finalnumberofdiags=0;
   diagdata=(Select[POLE2Ldiagramdata,#[[1]]===type&])[[1,2]];
   generalddata=diagdata[[1]];
   specificddata=diagdata[[2]];
   topdata=topdata/.generalddata;

   CPOLEprefactors=pprefactor/.specificddata;
   funcstrings=pfuncstrings/.specificddata;
 
   
   For[i=1,i<=NrDiags,i++,
       diag=diagrams[[i]];
       ps=DeleteCases[{Internal[1]/.diag[[2]],Internal[2]/.diag[[2]],Internal[3]/.diag[[2]],Internal[4]/.diag[[2]],Internal[5]/.diag[[2]]},Internal[_]];
       
       BreakFlag=False;
       If[Length[IncludeOnlyInternals]!=0,
	  For[j=1,j<=Length[ps],j++,
	      If[FreeQ[IncludeOnlyInternals,ps[[j]]/.{conj[x_]->x,bar[x_]->x}]==True,
		 BreakFlag=True;
		 Continue[];  
		 ];
	      ];
	  ];
       If[BreakFlag==True,
	  Continue[]];
       

       numberofcouplings=Length[diag[[1]]];
   
       coups={};
       BreakFlag=False;
       For[j=1,j<=numberofcouplings,j++,
	   tempcoup=diag[[1,j]];
	   If[Length[tempcoup/.{C[x__]->{x}}]==4,
	      tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings4Pole],
	      tempcoup=getSPhenoCouplingPole[diag[[1,j]],SPhenoCouplings3P]];
	   If[tempcoup===0,BreakFlag=True;Continue[];,
	      AppendTo[coups,tempcoup]
	      ];
	   ];
       
       If[BreakFlag==True,
	  Continue[]];

       
       symfactor=POLEdiagsymmetries[mylistinternals,ps,equivalences,{1,1,1,1,1,0},metasets];
       If[symfactor==0,
	  Continue[];
	  ];

       finalnumberofdiags++;
  
       descriptioninternalprops=StringJoin@Riffle[ToString/@ps,","];
       WriteString[spheno2LP,"! ---- "<>descriptioninternalprops<>" ----\n"];
       If[nh==1,
	  dynamictwolooptadpolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
	  ,
	  dynamictwolooppolediagram=descriptioninternalprops<>" ("<>ToString[i]<>"/"<>ToString[NrDiags]<>")";
	 ];

       allindicesstrings={};
       adjoint=False;
   
   
       indexmaps = {};
       setofindices = {};
       myparts = {};
       internalparticlelist = {};
       GaugeBosonFlag = False;
       Scalarcouplingnumber = 0;
       numberofcouplings = Length[diag[[1]]];
       colourfactor=0;
       
       ps = DeleteCases[{Internal[1] /. diag[[2]], Internal[2] /. diag[[2]], 
		      Internal[3] /. diag[[2]], Internal[4] /. diag[[2]], 
		      Internal[5] /. diag[[2]]}, Internal[_]];
       setofindices = topdata /. diag[[2]];

  

       nmyparts=Count[Flatten[topdata],Internal[_]];
       internalparticlelist=Table[{ps[[iii]], ToExpression["i" <> ToString[iii]]}, {iii, 1, nmyparts}];
       myparts=Take[ps,nmyparts];

 
       
       If[FreeQ[ps, VG] == False,
	  GaugeBosonFlag=True;
	  indicesoffirstinternal = getIndizesWI[myparts[[1]]];
	  dimoffirstinternal = (Select[indicesoffirstinternal, FreeQ[#, color] == False &])[[1]] /. {color, a_Integer} -> a;
	  numberingaugegroupofcolor = (Position[Gauge, color])[[1, 1]];
	  colourfactor = 8*(CalculateDynkinAndCasimir[numberingaugegroupofcolor,dimoffirstinternal])[[2]]
	  ];

       For[j = 1, j <= numberofcouplings, j++,
	   particlesincouplingj = diag[[1, j]] /. {C[x__] -> {x}};
	   nparticlesincouplingj = Length[particlesincouplingj];
	   If[FreeQ[particlesincouplingj, VG] == False,
	      coups[[j]] = {{g3}, False};
	      AppendTo[allindicesstrings,{"",False}];
	      Continue[]
	      ];
	   Scalarcouplingnumber++;
	   If[nparticlesincouplingj==4,
	      AppendTo[allindicesstrings,MakeIndicesCoupling4[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]],
	      AppendTo[allindicesstrings,MakeIndicesCoupling[Sequence@@setofindices[[Scalarcouplingnumber]],coups[[j,2]]]]
	      ];
	   ];
 

       For[j=1,j<=Length[internalparticlelist],j++,
	   If[getGen[internalparticlelist[[j,1]]]>1,
	      WriteString[spheno2LP,"Do "<>ToString[internalparticlelist[[j,2]]]<>"=1,"<>ToString[getGen[internalparticlelist[[j,1]]]]<>"\n"];
	      ]
	   ];

       
       Clear[ci1,ci2,ci3,icc];

 

	 
    
       If[GaugeBosonFlag == False,
	  colourfactor=mhpolegetcolour[setofindices];
	  
	  ];
     
       If[nh==1,
	  argstring="(";
	  ,
	  argstring="(p2,";
	  ];
       argstring=argstring<>StringJoin@@Riffle[(ToString@SPhenoMassSq[#[[1]], #[[2]]]) /. {"0." -> "0._dp"}&/@internalparticlelist,","]<>",Qscale)";
   
       
       
 
       
       

       For[ii=1,ii<=Length[specificddata],ii++,
       
	   fermionmassesarray=(pfermionmasses/.specificddata[[ii]])/.diag[[2]];
	   couplingtypesarray=pcouplingtypes/.specificddata[[ii]];
	   funcstring=pfuncstring/.specificddata[[ii]];
	   CPOLEprefactor=pprefactor/.specificddata[[ii]];

	    
	   fermionmassstring="";
	   fermionandstring="";
	   If[Length[fermionmassesarray]>0,
	      tempmassstring=ToString[SPhenoMass[fermionmassesarray[[1,1]],fermionmassesarray[[1,2]]]];
	      fermionmassstring="*"<>tempmassstring;
	      fermionandstring="if(("<>tempmassstring<>".gt. epsfmass)";
	      For[k=2,k<=Length[fermionmassesarray],k++,
		  tempmassstring=ToString[SPhenoMass[fermionmassesarray[[k,1]],fermionmassesarray[[k,2]]]];	   
		  fermionmassstring=fermionmassstring<>"*"<>tempmassstring;
	          fermionandstring=fermionandstring<>".and. ("<>tempmassstring<>".gt. epsfmass)"
		  ];
	      fermionandstring=fermionandstring<>") then \n";
	      WriteString[spheno2LP,fermionandstring];
	      ];
	   
	   

	   
	   WriteString[spheno2LP,"nonzerocoupling=.false.\n"];
	   WriteString[spheno2LP,"  Do gE1=1,"<>dimMatrix<>"\n"];
	   If[nh>1,
	      WriteString[spheno2LP,"   Do gE2=1,"<>dimMatrix<>"\n"];
	      ];
	   

	   
	  
	   POLEprefactor=CPOLEprefactor*symfactor;

	   
	   isdirac=Or@@PDiracQ/@ps;
	   If[isdirac==False,
	      POLEprefactor=POLEprefactor*1/2,
	      POLEprefactor=POLEprefactor
	      ];

	   POLEprefactor=POLEprefactor*colourfactor;
	   
	   prefactorstring=ToString[FortranForm[POLEprefactor]];
	   

	   
	   string="prefactor=Real("<>prefactorstring;
	   
	   string=string<>"*(";

	   string1="";
	   string2="";
	   
	   
	   For[j=1,j<=numberofcouplings,j++,
	       If[j!=1,
		  string1=string1<>"*";
		  string2=string2<>"*";
		 ];
	       If[getVertexType[diag[[1,j]]]===FFV,
		  WriteString[spheno2LP,"coup"<>ToString[j]<>"=g3\n"],
		  WriteVertexToFile[j,coups[[j]],allindicesstrings[[j]],getVertexType[diag[[1,j]]],spheno2LP];
		  ];
	       Switch[couplingtypesarray[[j]],
		      L,
		      string1=string1<>"coup"<>ToString[j]<>"L";
		      string2=string2<>"coup"<>ToString[j]<>"R";,
		      R,
		      string1=string1<>"coup"<>ToString[j]<>"R";
		      string2=string2<>"coup"<>ToString[j]<>"L";,
		      _,
		      string1=string1<>"coup"<>ToString[j];
		      string2=string2<>"coup"<>ToString[j];
		  ];
	       
	       ];
	   
	   
	   string=string<>string1<>"+"<>string2<>")";
	   (* NB take care of sign  from the gauge vertices in the prefactor ---- *)
	   
	   string=string<>",dp)\n";
	   
	   WriteString[spheno2LP,string];
	   If[nh==1,
	      WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingvector(gE1)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingvector(gE1)= 0._dp\n end if\n"]; 
	      ,
	      WriteString[spheno2LP,"if(abs(prefactor) .gt. epscouplings) then\n tempcouplingmatrix(gE1,gE2)=prefactor\n nonzerocoupling=.true.\n else\n tempcouplingmatrix(gE1,gE2)= 0._dp\n end if\n"]; 
	      ];

	   If[nh==1,
	      WriteString[spheno2LP,"   End Do\n"];
	      ,
	      WriteString[spheno2LP,"   End Do\n  End do\n"];
	      ];

	   
	   WriteString[spheno2LP,"if(nonzerocoupling) then \n"];
	   If[Mod[numberofcouplings,2]==1,
	      (* Switch sign -- this is a cheat because all of the couplings are actually defined with a minus sign relative to martin *)
	      WriteString[spheno2LP," funcvalue= -1._dp*"<>funcstring<>argstring<>fermionmassstring<>"\n"];,
	      (* Otherwise no need to switch sign *)
	      WriteString[spheno2LP," funcvalue= "<>funcstring<>argstring<>fermionmassstring<>"\n"];
	      ];

	   If[nh==1,
	      WriteString[spheno2LP," temptad=temptad+tempcouplingvector*funcvalue\n"];
	      ,
	      WriteString[spheno2LP," tempcont=tempcont+tempcouplingmatrix*funcvalue\n"];
	      ];
	   WriteString[spheno2LP,"end if\n"];

	   If[Length[fermionmassesarray]>0,
	      WriteString[spheno2LP,"end if\n\n"];
	      ];
	   
	   ];


       For[j=1,j<=Length[internalparticlelist],j++,
	   If[getGen[internalparticlelist[[j,1]]]>1,
	      WriteString[spheno2LP,"End do\n"];
	      ]
	   ];



      
      
	 
  
       ];
       
   
   If[nh==1,
      dynamictwolooptadpolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
      ,
      dynamictwolooppolediagram=ToString[finalnumberofdiags]<>" diagrams written to file";
     ];

   total2Ldiagramswritten+=finalnumberofdiags;

   ];

];



(************************************************************************************************************************)
(******************************************************  END FUNCTION INVOLVING FERMIONS ********************************)
(************************************************************************************************************************)



