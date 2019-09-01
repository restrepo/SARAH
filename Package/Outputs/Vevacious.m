(* ::Package:: *)

(* Options[MakeVevacious]={ComplexParameters->{},
      OffdiagonalParameters->{},IgnoreParameters->{},
      OutputFile->"Vevacious.in", GenerateSPhenoCode->False}; *)

Options[MakeVevacious]={ComplexParameters->{},
    IgnoreParameters->{}, OutputFile->"Vevacious.in", Scheme->"DR",Version->"1"};


MakeVevacious[opt___]:=
    FunctionVevacious[ComplexParameters /. {opt} /. Options[MakeVevacious],
      IgnoreParameters/. {opt} /. Options[MakeVevacious],
      OutputFile /. {opt} /. Options[MakeVevacious],Scheme /. {opt} /. Options[MakeVevacious],Version /. {opt} /. Options[MakeVevacious]];

FunctionVevacious[a_,b_,c_,d_,"1"]:=FunctionVevacious1[a,b,c,d];
FunctionVevacious[a_,b_,c_,d_,"++"]:=FunctionVevacious2[a,b,c,d];

FunctionVevacious1[complexPar_,zerop_,outputfile_,renscheme_]:=Block[{i,j,ES,temp,res,potv},
      (* Print["Generating input files for Vevacious"]; *)
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"FunctionVevacious1\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];

      Print[StyleForm["Generate model files for Vevacious","Section"]];
      
      SA`RealSubHOM={};
      subVEVnames = {};
      subVEVtoScalar = {};
      SA`VEVs=Transpose[Select[Particles[ALL],(#[[4]]===VEV)&]][[1]];
      
      ES=Last[NameOfStates];

	    
	 subout=GenerateParameterOutputNameALL["SLHA::",complexPar,ES];		      
       
      (* Put parameters to zero *)
      subzerop={};
      For[i=1,i<=Length[zerop],
        If[
          getDimParameters[zerop[[i]]]==={} || 
            getDimParameters[zerop[[i]]]==={0}, 
          subzerop = Join[subzerop,{zerop[[i]]->0}];,
          subzerop = Join[subzerop,{zerop[[i]][a___]->0}];
          ];
        i++;];
      

       subout=Join[subzerop,subout];
	   (* Preparing the scalar potential *)
       res = potSaveTadpoleEquations /. vacuumS /. vacuumF /. zero[_] -> 0 /. RXi[_] -> 0;
	   res = makeSumAll[CalcDelta[res]] //. sum[a_, b_, c_, d_] :> Sum[d, {a, b, c}];

	   (* Expand things like Sqrt[2] to floating-point numbers *)
	   SA`PotentialVevaciousNN = res  //. subzerop //. conj[x_]->x;
	   SA`PotentialVevacious = N[res  //. subzerop//. subout //. conj[x_]->x];

      
      SA`TadpoleEquationsHOM={};


      For[i=1,i<=Length[SA`ScalarHF[ES]],
		For[j=1,j<=getGenALL[SA`ScalarHF[ES][[i]]],
			If[j>=SA`VEVsGenScalar[ES][[i,1]] && j<=SA`VEVsGenScalar[ES][[i,2]],	  
			 SA`TadpoleEquationsHOM = Join[SA`TadpoleEquationsHOM, {Expand[N[Expand[TadpoleEquations[ES][[i]] /.I->IMAG //. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}]/.gt1->j  //. subzerop//. subout //. conj[x_]->x]]//. Complex[0.`,a_]->IMAG*a]}];
			];
		j++;];
	  i++;];
	
	If[SA`CPViolationHiggsSector === True,
	For[i=1,i<=Length[SA`PseudoScalarHF[ES]],
		For[j=1,j<=getGenALL[SA`PseudoScalarHF[ES][[i]]],	  
			If[j>=SA`VEVsGenPseudoScalar[ES][[i,1]] && j<=SA`VEVsGenPseudoScalar[ES][[i,2]],	  
			 SA`TadpoleEquationsHOM = Join[SA`TadpoleEquationsHOM, {Expand[N[Expand[TadpoleEquations[ES][[i+Length[SA`ScalarHF[ES]]]]/.I->IMAG//. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}]/.gt1->j  //. subzerop//. subout //. conj[x_]->x]]//. Complex[0.`,a_]->IMAG*a]}];
			];
		j++;];
	  i++;];
	];
      
  
      
   
      If[FileExistsQ[$sarahOutputDir]=!=True,
        CreateDirectory[$sarahOutputDir];];
      If[FileExistsQ[$sarahCurrentOutputMainDir]=!=True,
        CreateDirectory[$sarahCurrentOutputMainDir];];
      $sarahCurrentVevaciousDir=
        ToFileName[{$sarahCurrentOutputMainDir,"Vevacious"}];
      If[FileExistsQ[$sarahCurrentVevaciousDir]=!=True,
        CreateDirectory[$sarahCurrentVevaciousDir];];
      
homout=OpenWrite[ToFileName[$sarahCurrentVevaciousDir,outputfile]];

WriteString[homout, "<!--  \n"];
WriteString[homout, " This model file was automatically created by SARAH version"<>SA`Version<>"  \n"];
WriteString[homout, " SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 \n"];
WriteString[homout, " (c) Florian Staub, 2013   \n \n"];
Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
WriteString[homout, " File created at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"  \n \n"];
WriteString[homout, "                                      -->\n \n \n"];



WriteString[homout,"<Vevacious_stuff> \n"];

(* Close[homout]; *)
      
      GenerateXLM[renscheme];
      
      Print["Finished! Output was written to file ",$sarahCurrentVevaciousDir];
      
      SA`Doc`EndEntry[];
      ];


FunctionVevacious2[complexPar_,zerop_,outputfile_,renscheme_]:=Block[{i,j,ES,temp,res,potv},
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"FunctionVevacious2\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      Print[StyleForm["Generate model files for Vevacious","Section"]];
      
      SA`RealSubHOM={};
      subVEVnames = {};
      SA`VEVs=Transpose[Select[Particles[ALL],(#[[4]]===VEV)&]][[1]];
      ES=Last[NameOfStates];


      subExtraTermsTree={};
      subExtraTermsLoop={};
      Get[ToFileName[{$sarahCurrentModelDir},"SPheno.m"]];

      For[i=1,i<=Length[ParametersToSolveTadpolesLowScaleInput],
        subExtraTermsTree = Join[subExtraTermsTree, {ParametersToSolveTadpolesLowScaleInput[[i]]->ToExpression[ToString[getOutputNameParameter[ParametersToSolveTadpolesLowScaleInput[[i]]]]<>"Tree"]}];
        subExtraTermsLoop = Join[subExtraTermsLoop, {ParametersToSolveTadpolesLowScaleInput[[i]]->ToExpression[ToString[getOutputNameParameter[ParametersToSolveTadpolesLowScaleInput[[i]]]]<>"Loop"]}];
      i++;];

      For[i=1,i<=Length[ParametersToSolveTadpoles],
        subExtraTermsTree = Join[subExtraTermsTree, {ParametersToSolveTadpoles[[i]]->ToExpression[ToString[getOutputNameParameter[ParametersToSolveTadpoles[[i]]]]<>"Tree"]}];
        subExtraTermsLoop = Join[subExtraTermsLoop, {ParametersToSolveTadpoles[[i]]->ToExpression[ToString[getOutputNameParameter[ParametersToSolveTadpoles[[i]]]]<>"Loop"]}];
      i++;];



subVEVtoScalar={};
For[i=1,i<=Length[SA`ScalarHF[EWSB]],
pos=Position[DEFINITION[EWSB][VEVs],SA`ScalarHF[EWSB][[i]]][[1,1]];
If[DEFINITION[EWSB][VEVs][[pos]][[2,1]]=!=0,
subVEVtoScalar=Join[subVEVtoScalar,{DEFINITION[EWSB][VEVs][[pos]][[2,1]]->SA`ScalarHF[EWSB][[i]]}];
];
i++;];
For[i=1,i<=Length[SA`PseudoScalarHF[EWSB]],
pos=Position[DEFINITION[EWSB][VEVs],SA`PseudoScalarHF[EWSB][[i]]][[1,1]];
If[Length[DEFINITION[EWSB][VEVs][[pos]]]===5,
If[DEFINITION[EWSB][VEVs][[pos]][[3,1]]=!=0,
subVEVtoScalar=Join[subVEVtoScalar,{DEFINITION[EWSB][VEVs][[pos]][[3,1]]->SA`PseudoScalarHF[EWSB][[i]]}];
];
];
i++;];
	    
	 subout=GenerateParameterOutputNameALL["",complexPar,ES];		      
       
      (* Put parameters to zero *)
      subzerop={};
      For[i=1,i<=Length[zerop],
        If[
          getDimParameters[zerop[[i]]]==={} || 
            getDimParameters[zerop[[i]]]==={0}, 
          subzerop = Join[subzerop,{zerop[[i]]->0}];,
          subzerop = Join[subzerop,{zerop[[i]][a___]->0}];
          ];
        i++;];
      

       subout=Join[subzerop,subout];
	   (* Preparing the scalar potential *)
       res = potSaveTadpoleEquations /. vacuumS /. vacuumF /. zero[_] -> 0 /. RXi[_] -> 0;
	   res = makeSumAll[CalcDelta[res]] //. sum[a_, b_, c_, d_] :> Sum[d, {a, b, c}] /. subVEVtoScalar;

	   (* Expand things like Sqrt[2] to floating-point numbers *)
	   SA`PotentialVevaciousNN = res //.subExtraTermsTree  //. subzerop //. conj[x_]->x;
	   SA`PotentialVevacious = N[res  //.subExtraTermsTree  //. subzerop//. subout //. conj[x_]->x];

       SA`PotentialVevaciousExtraNN = (res //.subExtraTermsTree)-(res //.subExtraTermsLoop)  //. subzerop //. conj[x_]->x;
	   SA`PotentialVevaciousExtra = N[(res //.subExtraTermsTree)-(res //.subExtraTermsLoop)  //. subzerop//. subout //. conj[x_]->x];

      
      SA`TadpoleEquationsHOM={};


      For[i=1,i<=Length[SA`ScalarHF[ES]],
		For[j=1,j<=getGenALL[SA`ScalarHF[ES][[i]]],
			If[j>=SA`VEVsGenScalar[ES][[i,1]] && j<=SA`VEVsGenScalar[ES][[i,2]],	  
			 SA`TadpoleEquationsHOM = Join[SA`TadpoleEquationsHOM, {Expand[N[Expand[TadpoleEquations[ES][[i]] /.I->IMAG //. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}]/.gt1->j  //. subzerop//. subout //. conj[x_]->x]]//. Complex[0.`,a_]->IMAG*a]}];
			];
		j++;];
	  i++;];
	
	If[SA`CPViolationHiggsSector === True,
	For[i=1,i<=Length[SA`PseudoScalarHF[ES]],
		For[j=1,j<=getGenALL[SA`PseudoScalarHF[ES][[i]]],	  
			If[j>=SA`VEVsGenPseudoScalar[ES][[i,1]] && j<=SA`VEVsGenPseudoScalar[ES][[i,2]],	  
			 SA`TadpoleEquationsHOM = Join[SA`TadpoleEquationsHOM, {Expand[N[Expand[TadpoleEquations[ES][[i+Length[SA`ScalarHF[ES]]]]/.I->IMAG//. sum[a_,b_,c_,d_]:>Sum[d,{a,b,c}]/.gt1->j  //. subzerop//. subout //. conj[x_]->x]]//. Complex[0.`,a_]->IMAG*a]}];
			];
		j++;];
	  i++;];
	];
      
  
      
   
      If[FileExistsQ[$sarahOutputDir]=!=True,
        CreateDirectory[$sarahOutputDir];];
      If[FileExistsQ[$sarahCurrentOutputMainDir]=!=True,
        CreateDirectory[$sarahCurrentOutputMainDir];];
      $sarahCurrentVevaciousDir=
        ToFileName[{$sarahCurrentOutputMainDir,"Vevacious"}];
      If[FileExistsQ[$sarahCurrentVevaciousDir]=!=True,
        CreateDirectory[$sarahCurrentVevaciousDir];];
      
homout=OpenWrite[ToFileName[$sarahCurrentVevaciousDir,outputfile]];

WriteString[homout, "<!--  \n"];
WriteString[homout, " This model file was automatically created by SARAH version"<>SA`Version<>"  \n"];
WriteString[homout, " SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 \n"];
WriteString[homout, " (c) Florian Staub, 2013   \n \n"];
Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
WriteString[homout, " File created at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"  \n \n"];
WriteString[homout, "                                      -->\n \n \n"];



WriteString[homout,"<VevaciousModelFile> \n"];
GenerateVpp[renscheme];
WriteString[homout,"</VevaciousModelFile> \n"];
Close[homout];


homout=OpenWrite[ToFileName[$sarahCurrentVevaciousDir,"ScaleAndBlock.xml"]];

WriteString[homout, "<!--  \n"];
WriteString[homout, " This model file was automatically created by SARAH version"<>SA`Version<>"  \n"];
WriteString[homout, " SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223 \n"];
WriteString[homout, " (c) Florian Staub, 2013   \n \n"];
Minutes=If[Date[][[5]]<10,"0"<>ToString[Date[][[5]]],ToString[Date[][[5]]]];
WriteString[homout, " File created at "<>ToString[Date[][[4]]]<>":"<>Minutes<>" on "<>ToString[Date[][[3]]]<>"."<>ToString[Date[][[2]]]<>"."<>ToString[Date[][[1]]]<>"  \n \n"];
WriteString[homout, "                                      -->\n \n \n"];



WriteString[homout,"<LhaBlockParameterManagerInitializationFile> \n"];

WriteString[homout,"<ParameterManagerDetails \n"];
WriteString[homout,"ParameterManagerName=\"SARAHManager\" \n"];
WriteString[homout,"VevaciousMajorVersion=\"2\" VevaciousMinorVersion=\"0\" /> \n\n"];


WriteString[homout,"<RenormalizationScaleChoices> \n"];
WriteString[homout,"	<FixedScaleChoice>\n"];
WriteString[homout,"	  <EvaluationType>\n"];
WriteString[homout,"		BlockLowestScale\n"];
WriteString[homout,"	  </EvaluationType>\n"];
WriteString[homout,"		  <EvaluationArgument>\n"];
WriteString[homout,"			GAUGE\n"];
WriteString[homout,"		  </EvaluationArgument>\n"];
WriteString[homout,"		</FixedScaleChoice>\n"];
WriteString[homout,"		<MaximumScaleBound>\n"];
WriteString[homout,"		  <EvaluationType>\n"];
WriteString[homout,"			FixedNumber\n"];
WriteString[homout,"		  </EvaluationType>\n"];
WriteString[homout,"		  <EvaluationArgument>\n"];
WriteString[homout,"			1.0E+016 <!-- Roughly the GUT scale. -->\n"];
WriteString[homout,"		  </EvaluationArgument>\n"];
WriteString[homout,"		</MaximumScaleBound>\n"];
WriteString[homout,"	</RenormalizationScaleChoices>\n"];
WriteBlocksVpp;
WriteDerivedParametersVpp;
WriteString[homout,"</LhaBlockParameterManagerInitializationFile> \n"];
Close[homout];

Print["Finished! Output was written to file ",$sarahCurrentVevaciousDir];
      
      SA`Doc`EndEntry[];
];





GenerateParameterOutputNameALL[prefix_,complexPar_,ES_]:=Block[{i},
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"GenerateParameterOutputNameALL\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
Off[Parameter::NoLesHouches];
       subparameters={};
      For[i=1,i<=Length[parameters],
	  If[FreeQ[Particles[ES],parameters[[i,1]]]==False,SkipLHMessage=True;,SkipLHMessage=False;];
      If[FreeQ[TadpoleEquations[ES],parameters[[i,1]]]==False || FreeQ[MassMatrices[ES]/. RXi[_]->0,parameters[[i,1]]]==False || FreeQ[MassMatricesGauge[ES]/. RXi[_]->0,parameters[[i,1]]]==False  || LHBlockName[parameters[[i,1]]]=!="NONE",
      If[FreeQ[SA`VEVs,parameters[[i,1]]]==True,
         If[conj[parameters[[i,1]]]===parameters[[i,1]] || MemberQ[complexPar,parameters[[i,1]]]==False,
              Switch[Length[parameters[[i,2]]],
                  0,
                  	
                  subparameters = 
                      Join[subparameters,{parameters[[i,1]]-> 
                            ToExpression[
                                prefix<>LHBlockName[parameters[[i,1]]]][
                              ToExpression[LHPos[parameters[[i,1]]]]]}];,
                  1,
                  	
                  subparameters = 
                      Join[subparameters,{parameters[[i,1]][a_]-> 
                            ToExpression[
                                prefix<>LHBlockName[parameters[[i,1]]]][
                              a]}];,
                  2,
                  	If[FreeQ[offdiagonalPar,parameters[[i,1]]],
                      	
                      subparameters = 
                          Join[subparameters,{parameters[[i,1]][a__]->
                                ToExpression[
                                    prefix<>LHBlockName[parameters[[i,1]]]][
                                  a]}];,
                      	
                      subparameters = 
                          Join[subparameters,{parameters[[i,1]][a__]-> 
                                ToExpression[
                                    prefix<>LHBlockName[parameters[[i,1]]]][
                                  a]}];
                      	];,
                  3,
                  	
                  subparameters = 
                      Join[subparameters,{parameters[[i,1]][a__]-> 
                            ToExpression[
                                prefix<>LHBlockName[parameters[[i,1]]]][a]}];
                  ];,
              Switch[Length[parameters[[i,2]]],
                  0,
                  	
                  subparameters = 
                      Join[subparameters,{parameters[[i,1]]-> 
                            ToExpression[
                                  prefix<>LHBlockName[parameters[[i,1]]]][
                                ToExpression[
                                  LHPos[
                                    parameters[[i,
                                        1]]]]]+I ToExpression[
                                    prefix<>"IM"<>
                                      LHBlockName[parameters[[i,1]]]][
                                  ToExpression[LHPos[parameters[[i,1]]]]]}];,
                  1,
                  	
                  subparameters = 
                      Join[subparameters,{parameters[[i,1]][a_]-> 
                            ToExpression[LHBlockName[parameters[[i,1]]]][
                                a]+I  ToExpression[
                                    prefix<>"IM"<>
                                      LHBlockName[parameters[[i,1]]]][a]}];,
                  2,
                  	If[FreeQ[offdiagonalPar,parameters[[i,1]]],
                      	
                      subparameters = 
                          Join[subparameters,{parameters[[i,1]][
                                  a__]-> (ToExpression[
                                        prefix<>
                                        LHBlockName[parameters[[i,1]]]][
                                      a]+I ToExpression[
                                        prefix<>"IM"<>
                                        LHBlockName[parameters[[i,1]]]][
                                        a])}];,
                      	
                      subparameters = 
                          Join[subparameters,{parameters[[i,1]][a__]-> 
                                ToExpression[
                                      prefix<>LHBlockName[parameters[[i,1]]]][
                                    a]+I ToExpression[
                                        prefix<>"IM"<>
                                        LHBlockName[parameters[[i,1]]]][a]}];
                      	];,
                  3,
                  	
                  subparameters = 
                      Join[subparameters,{parameters[[i,1]][a__]-> 
                            ToExpression[
                                  prefix<>LHBlockName[parameters[[i,1]]]][
                                a]+I ToExpression[
                                    prefix<>"IM"<>
                                      LHBlockName[parameters[[i,1]]]][a]}];
                  ];
              ];,
			 subparameters=Join[subparameters,{NAME[a_Integer]:>ToExpression[ToString[NAME]<>ToString[a]]} /. NAME->parameters[[i,1]]];
			];
			];
           i++;];
      SkipLHMessage=False;
      On[Parameter::NoLesHouches];
      SA`Doc`Return[subparameters];
      ];

GenerateXLM[renscheme_]:=Block[{i,j,k},
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"GenerateXLM\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      (* Print["Writing input file for Minuit"]; *)
      
      (* outHM= OpenWrite[ToFileName[$sarahCurrentVevaciousDir,"Vevacious.in"]]; *)
      outHM = homout;
      (* WriteString[outHM,"<Vevacious_stuff> \n"]; *)
      WritePotHM;
      WriteTadpolesVevacious;
      WriteMassMatricesHM[renscheme];
      WriteString[outHM,"</Vevacious_stuff> \n"];
      Close[outHM];
      (*
        WriteVerticesHM;
        WriteOEquationsForDeltaViHM;
        WriteExpressionsForOneLoopTadpoles;
        *)
      SA`Doc`EndEntry[];
      ];

GenerateVpp[renscheme_]:=Block[{i,j,k},
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"GenerateVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      WriteDetailsVpp;
      WriteFieldVariablesVpp;
      WritePotVpp;
      
      WriteString[homout,"<LoopCorrections RenormalizationScheme=\""<>If[renscheme==="DR","DRBAR","MSBAR"]<>"\" GaugeFixing=\"LANDAU\">\n"];  
      WriteExtraPolynomialVpp;
      WriteMassMatricesVpp[renscheme];
      WriteString[homout,"</LoopCorrections>\n\n\n"];  
      
      SA`Doc`EndEntry[];
      

      ];


WriteExtraPolynomialVpp:=Block[{term},
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteExtraPolynomialVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      WriteString[homout,"<ExtraPolynomialPart> \n"];
      term=Expand[-SA`PotentialVevaciousExtra];
      
      For[i=1,i<=Length[term],
      WriteString[homout,StringReplace["+"<>ToString[InputForm[term[[i]]]],{"+-"->"-"}]<>" \n "];
                    i++;];
WriteString[homout,"</ExtraPolynomialPart> \n\n"];
];

WriteFieldVariablesVpp:=Block[{i,j},
SkipLHMessage=True;
WriteString[homout,"<FieldVariables> \n"];
  For[i=1,i<=Length[subVEVtoScalar],
   WriteString[homout,ToString[subVEVtoScalar[[i,2]]]<>"\n"];
  i++;];
WriteString[homout,"</FieldVariables> \n\n"];

 WriteString[homout,"<DsbMinimum> \n"];
  For[i=1,i<=Length[subVEVtoScalar],
   If[LHBlockName[subVEVtoScalar[[i,1]] /. A_[b_]->A]=!="None",
    (* WriteString[homout,ToString[subVEVtoScalar[[i,2]]]<>"="<>ToString[subVEVtoScalar[[i,1]]]<>"\n"]; *)
    WriteString[homout,ToString[subVEVtoScalar[[i,2]]]<>"="<>LHBlockName[subVEVtoScalar[[i,1]]]<>"["<>ToString[LHPos[subVEVtoScalar[[i,1]]]]<>"]\n"];
    ];
 i++;];
WriteString[homout,"</DsbMinimum> \n\n"];
SkipLHMessage=False;

SA`Doc`EndEntry[];
];

WriteDerivedParametersVpp:=Block[{temp},

SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteDerivedParametersVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
  temp=ParametersToSolveTadpoles;
  If[Head[ParametersToSolveTadpolesLowScaleInput]===List,
    temp=Join[temp,ParametersToSolveTadpolesLowScaleInput];
   ];
  temp=Intersection[temp];
  WriteString[homout,"<DerivedParameters> \n"];
  
      For[i=1,i<=Length[temp],
        WriteString[homout, ToString[getOutputNameParameter[temp[[i]]]]<>"="<>LHBlockName[temp[[i]]]<>"["<>ToString[LHPos[temp[[i]]]]<>"] \n"];
   WriteString[homout, ToString[getOutputNameParameter[temp[[i]]]]<>"SarahTree=TREE"<>LHBlockName[temp[[i]]]<>"["<>ToString[LHPos[temp[[i]]]]<>"] \n"];
   WriteString[homout, ToString[getOutputNameParameter[temp[[i]]]]<>"Tree=IFNONZERO["<>ToString[getOutputNameParameter[temp[[i]]]]<>"SarahTree,"<>ToString[getOutputNameParameter[temp[[i]]]]<>"] \n"];
   WriteString[homout, ToString[getOutputNameParameter[temp[[i]]]]<>"SarahLoop=LOOP"<>LHBlockName[temp[[i]]]<>"["<>ToString[LHPos[temp[[i]]]]<>"] \n"];
   WriteString[homout, ToString[getOutputNameParameter[temp[[i]]]]<>"Loop=IFNONZERO["<>ToString[getOutputNameParameter[temp[[i]]]]<>"SarahLoop,"<>ToString[getOutputNameParameter[temp[[i]]]]<>"] \n"];
   i++;];

SkipLHMessage=True;


SkipLHMessage=False;
  WriteString[homout,"</DerivedParameters> \n\n"];
  
  SA`Doc`EndEntry[];
];

WriteDetailsVpp:=Block[{},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteDetailsVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
  WriteString[homout,"<ModelFileDetails \n"];
  WriteString[homout,"ModelName=\""<>ToString[ModelName]<>"\" \n"];
  WriteString[homout,"VevaciousMajorVersion=\"2\" VevaciousMinorVersion=\"0\" /> \n\n"];
  SA`Doc`EndEntry[];
];

WriteBlocksVpp:=Block[{i,j,temp,extra},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteBlocksVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
If[Length[ParametersToSolveTadpoles]>0 && Length[ParametersToSolveTadpolesLowScaleInput]>0,
 extra=Intersection[LHBlockName/@Join[ParametersToSolveTadpoles,ParametersToSolveTadpolesLowScaleInput]];,
 If[Length[ParametersToSolveTadpoles]>0,
 extra=Intersection[LHBlockName/@ParametersToSolveTadpoles];,
 extra=Intersection[LHBlockName/@ParametersToSolveTadpolesLowScaleInput];
 ];
 ];
 extra=ToExpression/@extra;
 temp=Select[subout,Head[#]=!=RuleDelayed&];
 temp=Intersection[Table[temp[[i,2]],{i,1,Length[temp]}]  /. A_[b_Integer]->A /. A_[b_]->A];
 temp=Intersection[Join[temp,LHBlockName/@SA`VEVs]];
 
 WriteString[homout,"<ValidBlocks>\n"];
  For[i=1,i<=Length[temp],
     WriteString[homout,ToString[temp[[i]]]<>"\n"];
   If[FreeQ[extra,temp[[i]]]==False,
     WriteString[homout,"TREE"<>ToString[temp[[i]]]<>"\n"];
     WriteString[homout,"LOOP"<>ToString[temp[[i]]]<>"\n"];
    ];
  i++;];
  WriteString[homout,"</ValidBlocks>\n\n"];
  
  SA`Doc`EndEntry[];
];



WriteTadpolesVevacious:=Block[{i,j},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteTadpolesVevacious\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
   Print["    Writing tadpole equations"];
WriteString[homout,"<tadpoles> \n"];
WriteString[homout,"{ \n"];
For[i=1,i<=Length[SA`TadpoleEquationsHOM],
    If[SA`TadpoleEquationsHOM[[i]]=!=0.,
      WriteString[homout,
        "("<>StringReplace[ToString[InputForm[SA`TadpoleEquationsHOM[[i,1]]]],{"IMAG"->"I"}]<>") \n"];
      For[j=2,j<=Length[SA`TadpoleEquationsHOM[[i]]],
        WriteString[homout,
          "+("<>StringReplace[ToString[InputForm[SA`TadpoleEquationsHOM[[i,j]]]],{"IMAG"->"I"}]<>") \n"];
        j++;];
      WriteString[homout,"; \n"];
      ];
    i++;];
WriteString[homout,"} \n"];
WriteString[homout,"</tadpoles> \n \n \n"];

SA`Doc`EndEntry[];
];

WritePotVpp:=Block[{i,j},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WritePotVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      Print["    Writing tree level potential"];
      WriteString[homout,"<TreeLevelPotential> \n"];
      term=Expand[SA`PotentialVevacious];
      For[i=1,i<=Length[term],
        WriteString[homout,"("<>ToString[InputForm[term[[i]]]]<>") \n "];
        If[i<Length[term],WriteString[homout," + "];];
        i++;];
      WriteString[homout,"\n</TreeLevelPotential>\n\n"];
      SA`Doc`EndEntry[];
];

WritePotHM:=Block[{i,j,k,term,dim,knownvev},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WritePotHM\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      outHMpot=outHM;
      (* outHMpot= 
            OpenWrite[
              ToFileName[$sarahCurrentVevaciousDir,"Potential_Vevacious.in"]]; *)


	  Print["    Writing possible vevs"];    
      WriteString[outHMpot,"<input_vevs "];
knownvev=False;
SkipLHMessage=True;
SA`CurrentStates=ALL;
 For[i=1,i<=Length[SA`VEVs],
	If[getGen[SA`VEVs[[i]]]===1,
	If[LHBlockName[SA`VEVs[[i]]]=!="None",
	knownvev = True;
	WriteString[outHMpot,ToString[SA`VEVs[[i]]] <>"=\"SLHA::"<>ToString[LHBlockName[SA`VEVs[[i]]]]<>"["<>ToString[LHPos[SA`VEVs[[i]]]]<>"]\""];,
	WriteString[outHMpot,ToString[SA`VEVs[[i]]] <>"=\"0\""];
	];,
	For[j=getGenStart[SA`VEVs[[i]]],j<=getGen[SA`VEVs[[i]]],
	If[LHBlockName[SA`VEVs[[i]]]=!="None",
	knownvev = True;
	WriteString[outHMpot,ToString[SA`VEVs[[i]][j] /.subout] <>"=\"SLHA::"<>ToString[LHBlockName[SA`VEVs[[i]]]]<>"["<>ToString[j]<>"]\""];,
	WriteString[outHMpot,ToString[SA`VEVs[[i]][j] /.subout] <>"=\"0\""];
	];
	 If[j<getGen[SA`VEVs[[i]]],WriteString[outHMpot," "];];
	j++;];
	];
		If[i<Length[SA`VEVs],WriteString[outHMpot," "];];
	i++;];
	  WriteString[outHMpot," /> \n\n"];
	If[knownvev==False,Message[Vevacious::UnknonwVEVs];];
	SkipLHMessage=False;

      Print["    Writing tree level potential"];
      WriteString[outHMpot,"<polynomial_part> \n"];
      term=Expand[SA`PotentialVevacious];
      For[i=1,i<=Length[term],
        WriteString[outHMpot,"("<>ToString[InputForm[term[[i]]]]<>") \n "];
        If[i<Length[term],WriteString[outHMpot," + "];];
        i++;];
      WriteString[outHMpot,"\n</polynomial_part>\n\n"];

	SA`Doc`EndEntry[];
      ];

WriteMassMatricesVpp[renscheme_]:= Block[{i,j,k,states=Last[NameOfStates],particlename,matrixname1,matrixname2,diracf,kind,type,extrafactor},    
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteMassMatricesVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
        
      Print["    Writing mass matrices for 1-loop eff. potential"];
      For[i=1,i<=Length[MassMatrices[states]],
        If[Length[DEFINITION[states][MatterSector][[i]][[2,1]]]==2,
          kind="ComplexWeylFermionMassSquaredMatrix";
          type="WeylFermion";
          extrafactor=2;
          particlename = 
            DEFINITION[states][MatterSector][[i]][[2,1,1]]/.diracSubBack[
                ALL];,
          extrafactor=1;
          particlename=
            DEFINITION[states][MatterSector][[i]][[2,1]]/.diracSubBack[ALL];
	    Switch[getTypeOld[particlename],
			F, kind="ComplexWeylFermionMassSquaredMatrix";
               type="WeylFermion";,
			S, kind="RealBosonMassSquaredMatrix";
               type="ScalarBoson";,
			V, type="VectorBoson";
		];
        ];
        WriteString[homout,"<"<>kind<>" "];
        WriteString[homout,"SpinType=\""<>type<>"\"  "];
        WriteString[homout, "ParticleName=\""<>StringReplace[ToString[particlename/.conj[x_]->x],{"{"->"","}"->""}]<>"\"  "];
        WriteString[homout,"MultiplicityFactor=\""<>ToString[InputForm[extrafactor*getFactorVpp[DEFINITION[states][MatterSector][[i]]]]]<>"\" >     \n"];
        If[getTypeOld[particlename]===F,
		WriteMassMatrixVpp[MassMatricesFull[states][[i]].Transpose[conj[MassMatricesFull[states][[i]]]]];,
        If[conj[particlename]===particlename,
		  WriteMassMatrixVpp[MassMatricesFull[states][[i]]];,
          WriteMassMatrixVpp[MakeMatrixReal[MassMatricesFull[states][[i]]]];
        ];
		];
	    WriteString[homout,"</"<>kind<>"> \n \n"];
        i++;];
      
      For[i=1,i<=Length[MassMatricesGauge[states]],
        kind="RealBosonMassSquaredMatrix";
        If[getType[DEFINITION[states][GaugeSector][[i,1,1]]]===V,
          particlename=DEFINITION[states][GaugeSector][[i,2]];
          WriteString[homout,"<"<>kind<>" "];
          
          WriteString[homout, "ParticleName=\""<>StringReplace[ToString[Intersection[particlename/.conj[x_]->x]],{"{"->"","}"->""}]<>"\"  "];
          
          WriteString[homout,"SpinType=\"GaugeBoson\" MultiplicityFactor=\"1\"> \n "];
          WriteMassMatrixVpp[MassMatricesGauge[states][[i]]];
          WriteString[homout,"</"<>kind<>"> \n \n"];
          ];
        i++;];

SA`Doc`EndEntry[];
      ];

MakeMatrixReal[matrix_]:=Block[{i,j,temp,res,a,subr,r1,r2},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"MakeMatrixReal\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
  res=0;
  For[i=1,i<=Length[matrix],
  res = res + matrix[[i,i]] a[i] conj[a[i]];
  For[j=i+1,j<=Length[matrix],
    res = res+matrix[[i,j]] a[i] conj[a[j]] + matrix[[j,i]] a[j] conj[a[i]];
   j++;];
  i++;];
  
  res = res //. a[x_]:>1/Sqrt[2](r1[x]+I*r1[x+Length[matrix]]) //. conj[r1[x_]]->r1[x];

  SA`Doc`Return[Table[D[D[res,r1[i]],r1[j]],{i,1,Length[matrix]*2},{j,1,Length[matrix]*2}]];

];

WriteMassMatricesHM[renscheme_]:=
    Block[{i,j,k,states=Last[NameOfStates],particlename,matrixname1,
        matrixname2,diracf,notmixed,treemass},
      
      SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteMassMatricesHM\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      Print["    Writing mass matrices for 1-loop eff. potential"];
      SA`HMparticleList={};
      For[i=1,i<=Length[MassMatrices[states]],
        diracf=False;
        If[Length[DEFINITION[states][MatterSector][[i]][[2,1]]]==2,
          
          particlename = 
            DEFINITION[states][MatterSector][[i]][[2,1,1]]/.diracSubBack[
                ALL];
          
          matrixname1 = 
            DEFINITION[states][MatterSector][[i]][[2,1,2]]/.diracSubBack[
                ALL];
          
          matrixname2= 
            DEFINITION[states][MatterSector][[i]][[2,2,2]]/.diracSubBack[
                ALL];
          diracf=True;,
          
          particlename=
            DEFINITION[states][MatterSector][[i]][[2,1]]/.diracSubBack[ALL];
          
          matrixname1=
            DEFINITION[states][MatterSector][[i]][[2,2]]/.diracSubBack[ALL];
          ];
        WriteString[outHM,"<mass-squared_matrix \n"];
        WriteString[outHM,"particle=\""<>ToString[particlename]<>"\"  "];
        If[diracf==False,
          
          WriteString[outHM,
              "rotationmatrix=\""<>ToString[matrixname1]<>"\"  "];,
          
          WriteString[outHM,
            "rotationmatrix1=\""<>ToString[matrixname1]<>"\"  "];
          
          WriteString[outHM,
            "rotationmatrix2=\""<>ToString[matrixname2]<>"\"  "];
          ];
		Switch[getType[particlename],
			F, WriteString[outHM,"spin=\"Weyl\" "];,
			S, WriteString[outHM,"spin=\"scalar\" "];,
			V, WriteString[outHM,"spin=\"vector\" "];
		];
        WriteString[outHM,
          "factor=\""<>ToString[
              InputForm[getFactorHM[DEFINITION[states][MatterSector][[i]]]]]<>
            "\" >     \n"];
		If[Length[DEFINITION[states][MatterSector][[i]][[2,1]]]===2||getType[DEFINITION[states][MatterSector][[i]][[2,1]],False,ALL]===F,
        WriteMassMatrixHM[Expand[MassMatricesFull[states][[i]].Transpose[conj[MassMatricesFull[states][[i]]]]]];,
		WriteMassMatrixHM[MassMatricesFull[states][[i]]];
		];
        WriteString[outHM,"</mass-squared_matrix> \n \n"];
        SA`HMparticleList=Join[SA`HMparticleList,{particlename}];
        i++;];
      
      For[i=1,i<=Length[MassMatricesGauge[states]],
        If[getType[DEFINITION[states][GaugeSector][[i,1,1]]]===V,
          particlename=DEFINITION[states][GaugeSector][[i,2]];
          matrixname1=DEFINITION[states][GaugeSector][[i,3]];
          WriteString[outHM,"<mass-squared_matrix \n"];
          
          WriteString[outHM,
            "particle=\""<>StringReplace[
                ToString[Intersection[particlename/.conj[x_]->x]],{"{"->"",
                  "}"->""}]<>"\"  "];
          
          WriteString[outHM,
            "rotationmatrix=\""<>ToString[matrixname1]<>"\"  "];
		  WriteString[outHM,"spin=\"vector\" "];
		If[renscheme==="DR",
		  WriteString[outHM,"factor=\"3\" >\n"];,
		  WriteString[outHM,"factor=\"3\" constant=\"5/6\" >\n"];
		  ];
          WriteMassMatrixHM[MassMatricesGauge[states][[i]]];
          WriteString[outHM,"</mass-squared_matrix> \n \n"];
          ];
        SA`HMparticleList=Join[SA`HMparticleList,{particlename}];
        i++;];

        notmixed=Select[Select[Transpose[Particles[states]][[1]], FreeQ[DEFINITION[states][MatterSector], #] &], getType[#] === S ||  getType[#] === F &];

 For[i=1,i<=Length[notmixed],
        treemass=TreeMass[notmixed[[i]],states];
       If[treemass=!=0,
        WriteString[outHM,"<mass-squared_matrix \n"];
        WriteString[outHM,"particle=\""<>ToString[notmixed[[i]]]<>"\"  "];
        WriteString[outHM,       "rotationmatrix=\"No\"  "];
		Switch[getType[notmixed[[i]]],
			F, WriteString[outHM,"spin=\"Weyl\" "];,
			S, WriteString[outHM,"spin=\"scalar\" "];,
			V, WriteString[outHM,"spin=\"vector\" "];
		];
        WriteString[outHM,  "factor=\""<>ToString[InputForm[getFactorHM[{{},{notmixed[[i]]}}]]]<>       "\" >     \n"];
		If[getType[notmixed[[i]]]===F,
        WriteMassMatrixHM[{{Expand[treemass conj[treemass]]}}];,
		WriteMassMatrixHM[{{treemass}}];
		];
        WriteString[outHM,"</mass-squared_matrix> \n \n"];
        SA`HMparticleList=Join[SA`HMparticleList,{particlename}];
      ];

i++;];


      SA`HMparticleList=
        Select[Intersection[Flatten[SA`HMparticleList] /. conj[x_]->x],
          FreeQ[Massless[Last[NameOfStates]],#]&];
      (* Close[outHM]; *)
      
      SA`Doc`EndEntry[];
      ];

getSubtractionConstantHM:=5/6;

WriteMassMatrixHM[matrix_]:=Block[{i,j,res,temp},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteMassMatrixHM\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      temp=
        N[Expand[
            matrix /.RXi[a_]->0 //. sum[a_,b_,c_,d_]:>
                          Sum[d,{a,b,c}] //.subVEVnames //.subout//. 
                  Delta[__]->1 //. subout /. conj[x_]->x]];
      
      For[i=1,i<=Length[temp[[1]]],
        For[j=1,j<=Length[temp[[1]]],
          If[i=!=j || j<Length[temp[[1]]],
            
            WriteString[outHM,
                "("<>StringReplace[
                    ToString[InputForm[temp[[i,j]]]],{" "->""}]<>"), \n"];,
            WriteString[outHM,
                "("<>StringReplace[
                    ToString[InputForm[temp[[i,j]]]],{" "->""}]<>") \n"];
            ];
          j++;];
        i++;];
      
      SA`Doc`EndEntry[];
      ];

WriteMassMatrixVpp[matrix_]:=Block[{i,j,res,temp},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"WriteMassMatrixVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      temp=
        N[Expand[
            matrix /.RXi[a_]->0 //. sum[a_,b_,c_,d_]:>
                          Sum[d,{a,b,c}] //.subVEVnames //. subVEVtoScalar //. subExtraTermsTree //.subout//. 
                  Delta[__]->1 //. subout /. conj[x_]->x]];
      
      For[i=1,i<=Length[temp[[1]]],
        For[j=1,j<=Length[temp[[1]]],
          If[i=!=j || j<Length[temp[[1]]],
            
            WriteString[homout,
               StringReplace[
                    ToString[InputForm[temp[[i,j]]]],{" "->""}]<>"\n"];,
            WriteString[homout,
               StringReplace[
                    ToString[InputForm[temp[[i,j]]]],{" "->""}]<>"\n"];
            ];
          j++;];
        i++;];
      
      SA`Doc`EndEntry[];
      ];

getFactorHM[def_]:=Block[{temp,res,particle,i,j},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"getFactorHM\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      If[Length[def[[2,1]]]==2,
        particle=def[[2,1,1]]/.diracSubBack[ALL];,
        particle=def[[2,1]]/.diracSubBack[ALL];
        ];
      res=1;
      For[i=1,i<=Length[Gauge],
        If[FreeQ[BrokenSymmetries,i] && getType[particle]=!=V,
          res=SA`DimensionGG[particle,i]*res ;
          ];
        i++;];
      
      res = res //. SA`DimensionGG->ONE /. ONE[a_,b_]->1;
      
      If[conj[particle]=!=particle && bar[particle]=!=particle,res=2*res;];
      
      HM`MultiplicityCoefficient[particle]=res;
      
      Switch[getType[particle,False, ALL],
        F,res= -1/2*res*4;,
        S,res= 1/4*res*4;,
        V,res= 3/4*res*4;
        ];
      
      SA`Doc`Return[res];
      
      ];


getFactorVpp[def_]:=Block[{temp,res,particle,i,j},
SA`Doc`File = "Package/Outputs/Vevacious.m";
      SA`Doc`Name = "\!\(\*
StyleBox[\"getFactorVpp\",\nInitializationCell->True]\)";
      SA`Doc`Info = "";
      SA`Doc`Input={};
      SA`Doc`GenerateEntry[];
      
      If[Length[def[[2,1]]]==2,
        particle=def[[2,1,1]]/.diracSubBack[ALL];,
        particle=def[[2,1]]/.diracSubBack[ALL];
        ];
      res=1;
      For[i=1,i<=Length[Gauge],
        If[FreeQ[BrokenSymmetries,i] && getType[particle]=!=V,
          res=SA`DimensionGG[particle,i]*res ;
          ];
        i++;];
      
      res = res //. SA`DimensionGG->ONE /. ONE[a_,b_]->1;
      
      (* If[conj[particle]=!=particle && bar[particle]=!=particle,res=2*res;]; *)
      
           
      SA`Doc`Return[res];
      
      ];


(* EigenvaluesTreeMassMatrices[inputValues_]:=
    Block[{i,j,k,def,matricesMatter,matricesGauge,matTemp,eigenvalues,
        particle},res={};
      subSLHA=GenerateParameterOutputNameALL[""];
      SA`CurrentStates=Last[NameOfStates];
      If[SA`MassCalculationInitialized=!=True,ListSimplifiedMassMatrices={};
        defMatter=DEFINITION[Last[NameOfStates]][MatterSector];
        defGauge=DEFINITION[Last[NameOfStates]][GaugeSector];
        matricesMatter=MassMatricesFull[Last[NameOfStates]];
        matricesGauge=MassMatricesGauge[Last[NameOfStates]];
        For[i=1,i<=Length[matricesMatter],
          If[Length[defMatter[[i,2,1]]]==2,
            particle=defMatter[[i,2,1,1]]/.diracSubBack[ALL];,
            particle=defMatter[[i,2,1]]/.diracSubBack[ALL];];
          
          matTemp=matricesMatter[[i]]//.sum[a_,b_,c_,d_]:>Sum[
                          d,{a,b,c}]//.ThetaW->ArcCos[
                        g2/Sqrt[g1^2+g2^2]]//.subSLHA//.Delta[
                    a__]->1//.RXi[__]->0;
          
          ListSimplifiedMassMatrices=
            Join[ListSimplifiedMassMatrices,{{particle,matTemp}}];
          matTemp=matTemp//.inputValues;
          
          If[NumericQ[Plus@@Flatten[matTemp]]==False,
            Print["Matrix for ",particle," is not a numerical function: "];
            Print[matTemp];
            Interrupt[];];
          eigenvalues=Reverse[Eigenvalues[matTemp]];
          If[getType[particle]===F,
            res=Join[res,
                  Table[ToString[particle]<>"_"<>ToString[j]->
                      N[eigenvalues[[j]]]^2,{j,1,Length[eigenvalues]}]];,
            res=Join[res,
                  Table[ToString[particle]<>"_"<>ToString[j]->
                      N[eigenvalues[[j]]],{j,1,Length[eigenvalues]}]];];
          i++;];
        For[i=1,i<=Length[matricesGauge],
          particle=Intersection[defGauge[[i,2]]/.conj[x_]->x];
          
          If[getType[particle[[1]]]===V,
            matTemp=matricesGauge[[i]]//.sum[a_,b_,c_,d_]:>
                      Sum[d,{a,b,c}]//.subSLHA//.Delta[a__]->1;
            
            ListSimplifiedMassMatrices=
              Join[ListSimplifiedMassMatrices,{{particle,matTemp}}];
            matTemp=matTemp//.inputValues;
            eigenvalues=Eigenvalues[matTemp];
            
            If[NumericQ[Plus@@Flatten[matTemp]]==False,
              Print["Matrix for ",particle," is not a numerical function: "];
              Print[matTemp];
              Interrupt[];];
            eigenvalues=Reverse[Eigenvalues[matTemp]];
            
            res=Join[res,
                Table[ToString[particle[[j]]]->N[eigenvalues[[j]]],{j,1,
                    Length[particle]}]];];
          i++;];
        SA`MassCalculationInitialized=True;,ListWithMatricesAndMasses={};
        For[i=1,i<=Length[ListSimplifiedMassMatrices],
          matTemp=ListSimplifiedMassMatrices[[i,2]]/.inputValues;
          
          If[NumericQ[Plus@@Flatten[matTemp]]==False,
            Print["Matrix for ",particle," is not a numerical function: "];
            Print[matTemp];
            Interrupt[];];
          eigenvalues=Reverse[Eigenvalues[matTemp]];
          particle=ListSimplifiedMassMatrices[[i,1]];
          
          If[getType[particle]===F&&particle=!=AntiField[particle],
            eigensystem=SingularValueDecomposition[matTemp];,
            eigensystem=Eigensystem[matTemp];];
          
          ListWithMatricesAndMasses=
            Join[ListWithMatricesAndMasses,{{particle,eigensystem}}];
          
          If[Head[particle]===List,
            res=Join[res,
                  Table[ToString[particle[[j]]]->N[eigenvalues[[j]]],{j,
                      1,Length[particle]}]];,
            If[getType[particle]===F,
                res=Join[res,
                      Table[ToString[particle]<>"_"<>ToString[j]->
                          N[eigenvalues[[j]]]^2,{j,1,Length[eigenvalues]}]];,
                res=Join[res,
                      Table[ToString[particle]<>"_"<>ToString[j]->
                          N[eigenvalues[[j]]],{j,1,
                          Length[eigenvalues]}]];];];
          i++;];];
      Return[res];]; *)
