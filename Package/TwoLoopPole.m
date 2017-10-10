mhpolegetcolour[orderedsetsofparticles_] := Module[{i, j, k, ncs, protovertex, vertex, tempcolourfunc, templistoffields, pos, fieldsordered, propagators, AllIndices, colourPositions, colourIndices, vertices, fieldmap, colourFunctions, tempfieldsordered, mapp, nfs, colourpos, colourrange, tempfield, tempargs, colourindex, tmpc, firstmatch, coloursumindices, finalindex, res, newcolourfuncs, oldcolourfuncs,tfunc, tempverticesorg, tempcords},

(*------------------------------------

Function to compute colour factors of two-loop diagrams.

Function takes sets of particles grouped into vertices in format
{ 
{{p11, index11},{p12,index12},...},
{{p21, index21},{p22,index22},...},
...,
}

and returns a single number.

-----------------------------------------*)
   colourFunctions = 1;
   coloursumindices = {};
   ncs = Length[orderedsetsofparticles];
   mapp = Table[{}, {i, 1, ncs}];
   For[i = 1, i <= ncs, i++, protovertex = orderedsetsofparticles[[i]];
       templistoffields = 
       Table[protovertex[[j, 1]], {j, 1, Length[protovertex]}];
       (*Check to see whether it is a four-point vertex (which we have already extracted the colour structure for), and if so if it is one of the four-point vertices with more than one colour structure*)
    
       If[(Length[protovertex] == 4) && (FreeQ[specialPOLEverticesorg, C @@ templistoffields] ==False), 
	  pos = Position[specialPOLEverticesorg, C @@ templistoffields];
	  fieldsordered = specialPOLEvertices[[pos[[1, 1]], 1, 1]];
	  newcolourfuncs = specialPOLEvertices[[pos[[1, 1]], 1, 2]] /. Lam[a__] -> 1/2 Lam[a];
	  (* IF MORE THAN ONE COLOUR STRUCTURE WE HAVE ALREADY SUMMED OVER IT -> COLOUR FUNCTION IS 1*)
	  If[Length[newcolourfuncs]>1,Return[1]];
	  , 
	  (* Otherwise three-point vertex with only one colour structure -> extract it!*)
	  pos = Position[VerticesInv[All], C @@ templistoffields];
	  fieldsordered = VerticesOrg[All][[pos[[1, 1]]]];
	  vertex = VerticesVal[All][[pos[[1, 1]]]]; 
	  vertex = First[Flatten[vertex]];
	  tempcolourfunc = ExtractStructure[vertex, color] /. Lam[a__] -> 1/2 Lam[a];
	  newcolourfuncs = Select[tempcolourfunc, #[[2, 1]] =!= 0 &];
	  newcolourfuncs = Table[newcolourfuncs[[j, 1]], {j, 1, Length[newcolourfuncs]}];
	 ]; (* end of checking which type of vertex *)
       
       tempfieldsordered = fieldsordered;
       AllIndices = getIndizesWI /@ templistoffields;
       colourIndices = Select[#, FreeQ[#, color] == False &] & /@ AllIndices /. {color, a_Integer} -> a;
       colourPositions = Position[#, color] & /@ AllIndices;
       nfs = Length[templistoffields];
       For[j = 1, j <= nfs, j++,
	   firstmatch = (Position[tempfieldsordered /. {bar[a_[__]] -> bar[a],conj[a_[__]] -> conj[a], a_[{__}] -> a},templistoffields[[j]], 1])[[1, 1]];
	   If[colourPositions[[j]] != {}, 
	      colourpos = colourPositions[[j, 1, 1]];
	      colourrange = colourIndices[[j]];
	      finalindex = protovertex[[j, 2]];
	      If[FreeQ[coloursumindices, finalindex], 
		 AppendTo[coloursumindices, {finalindex, 1, First[colourrange]}]
		];
	      tempfield = tempfieldsordered[[firstmatch]];
	      tempargs = tempfield /. {bar[a_[x__]] -> x, conj[a_[x__]] -> x, a_[x__] -> x};
	      colourindex = tempargs[[colourpos]];
	      AppendTo[mapp[[i]], colourindex -> finalindex]
	     ];
	   tempfieldsordered = Delete[tempfieldsordered, firstmatch];
	  ];
       
       lncf = Length[newcolourfuncs];
       oldcolourfuncs = colourFunctions;
       If[lncf >= 1, 
	  colourFunctions=oldcolourfuncs*(newcolourfuncs[[1]] //. {Delta[a_, b_] -> delta[a, b]} //. mapp[[i]])
	 ];

      ];(* end For[i=1,...*)
    If[Length[coloursumindices] >= 1, 
       (* There is a colour factor*)
	   tempcf = colourFunctions //. {sum[a_, b_, c_, d_] :> Sum[d, {a, b, c}], delta[a_, b_] -> Delta[a, b]};
	   res= Sum[tempcf, Evaluate[Sequence @@ coloursumindices]], 
       (* otherwise no indices to sum, so get 1 *)
       res = 1];
Return[res]
    

];


GenerateW :=Block[{topW,insW},
topW = {{C[hh, hh, FieldToInsert[1], FieldToInsert[2]], C[AntiField@FieldToInsert[1], FieldToInsert[3], FieldToInsert[4]],C[AntiField@FieldToInsert[2], AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]}, {Internal[1] -> FieldToInsert[1], Internal[2] -> FieldToInsert[2], Internal[3] -> FieldToInsert[3], Internal[4] -> FieldToInsert[4], External[1] -> hh,External[2] -> hh}};
insW=InsFields[topW];
Return[insW]];

GenerateX := Block[{topX, insX},
  topX = {{C[hh, hh, FieldToInsert[1], FieldToInsert[2]],C[AntiField@FieldToInsert[1], AntiField@FieldToInsert[2],FieldToInsert[3],AntiField@FieldToInsert[3]]}, {Internal[1] -> FieldToInsert[1],Internal[2] -> FieldToInsert[2], Internal[3] -> FieldToInsert[3], External[1] -> hh, External[2] -> hh}};
  insX = InsFields[topX];
		   Return[insX]];


GenerateY :=Block[{topY,insY},
		  topY = {{C[hh, FieldToInsert[1], FieldToInsert[2]], 
			   C[hh, AntiField@FieldToInsert[1], FieldToInsert[3]],
			   C[AntiField@FieldToInsert[2], AntiField@FieldToInsert[3], FieldToInsert[4],AntiField@FieldToInsert[4]]}, {Internal[1] -> FieldToInsert[1], 
    Internal[2] -> FieldToInsert[2], Internal[3] -> FieldToInsert[3], 
    Internal[4] -> FieldToInsert[4], External[1] -> hh,External[2] -> hh}};
insY=InsFields[topY];
Return[insY]];

GenerateZ :=Block[{topZ,insZ},
		  topZ = {{C[hh, FieldToInsert[1], FieldToInsert[2]], 
			   C[hh, FieldToInsert[3], FieldToInsert[4]],
			   C[AntiField@FieldToInsert[1], AntiField@FieldToInsert[2], AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]}, {Internal[1] -> FieldToInsert[1], 
    Internal[2] -> FieldToInsert[2], Internal[3] -> FieldToInsert[3], 
    Internal[4] -> FieldToInsert[4], External[1] -> hh,External[2] -> hh}};
insZ=InsFields[topZ];
Return[insZ]];


GenerateS := Block[{topS, insS},
  topS = {{C[hh, FieldToInsert[1], FieldToInsert[2],FieldToInsert[3]], C[hh, AntiField@FieldToInsert[1], AntiField@FieldToInsert[2], AntiField@FieldToInsert[3]]}, {Internal[1] -> FieldToInsert[1], 
     Internal[2] -> FieldToInsert[2], Internal[3] -> FieldToInsert[3],
      External[1] -> hh, External[2] -> hh}};
  insS = InsFields[topS];
		   Return[insS]];


GenerateU :=Block[{topU,insU},
		  topU = {{C[hh, FieldToInsert[1], FieldToInsert[2]], 
			   C[hh, AntiField@FieldToInsert[1], FieldToInsert[3],FieldToInsert[4]],
			   C[AntiField@FieldToInsert[2], AntiField@FieldToInsert[3],AntiField@FieldToInsert[4]]}, {Internal[1] -> FieldToInsert[1], 
    Internal[2] -> FieldToInsert[2], Internal[3] -> FieldToInsert[3], 
    Internal[4] -> FieldToInsert[4], External[1] -> hh,External[2] -> hh}};
insU=InsFields[topU];
Return[insU]];


GenerateV := 
  Block[{topV, insV}, 
   topV = {{C[hh, FieldToInsert[1], FieldToInsert[2]], 
      C[hh, AntiField@FieldToInsert[1], FieldToInsert[3]], 
      C[AntiField@FieldToInsert[2], FieldToInsert[4], 
       FieldToInsert[5]],C[AntiField@FieldToInsert[3], AntiField@FieldToInsert[4], 
       AntiField@FieldToInsert[5]]}, {Internal[1] -> FieldToInsert[1],
       Internal[2] -> FieldToInsert[2], 
      Internal[3] -> FieldToInsert[3], 
      Internal[4] -> FieldToInsert[4], 
      Internal[5] -> FieldToInsert[5], External[1] -> hh, 
      External[2] -> hh}};
   insV = InsFields[topV];
   Return[insV]];










	 

GenerateM := 
  Block[{topM, insM}, 
   topM = {{C[hh, FieldToInsert[1], FieldToInsert[3]], 
      C[hh, FieldToInsert[2], FieldToInsert[4]], 
      C[AntiField@FieldToInsert[1], AntiField@FieldToInsert[2], 
       FieldToInsert[5]], 
      C[AntiField@FieldToInsert[3], AntiField@FieldToInsert[4], 
       AntiField@FieldToInsert[5]]}, {Internal[1] -> FieldToInsert[1],
       Internal[2] -> FieldToInsert[2], 
      Internal[3] -> FieldToInsert[3], 
      Internal[4] -> FieldToInsert[4], 
      Internal[5] -> FieldToInsert[5], External[1] -> hh, 
      External[2] -> hh}};
   insM = InsFields[topM];
   Return[insM]];





POLEtypes[diag_] := 
  Module[{i, ps, psT, templen, type, remainders, nrems, nscalars, 
    nvectors, nfermions, stringtype}, 
   ps = DeleteCases[{Internal[1] /. diag[[2]], 
      Internal[2] /. diag[[2]], Internal[3] /. diag[[2]], 
      Internal[4] /. diag[[2]], Internal[5] /. diag[[2]]}, 
     Internal[_]];
   psT = getType /@ ps;
   If[FreeQ[psT, G] == False, type = Discard; Return[type]];
   templen = Length[psT];
   remainders = DeleteCases[psT, S];
   nrems = Length[remainders];
   nscalars = templen - nrems;
   
   
   If[nrems == 0, 
      Switch[nscalars, 2, type = SS, 3, type = SSS, 4, type = SSSS, 5, 
	     type = SSSSS, _, type = Discard], 
      nfermions = Length[Select[remainders, # == F &]];
      nvectors = templen - nscalars - nfermions;
      If[nvectors > 1, type = Discard; Return[type]];
      If[nrems == 1 && nvectors == 1, 
	 Switch[nscalars, 3, type = SSSV, 4, type = SSSSV, _, 
		type = Discard],
	 stringtype = "";
	 For[i = 1, i <= nscalars, i++,
	     stringtype = stringtype <> "S"];
	 For[i = 1, i <= nfermions, i++,
	     stringtype = stringtype <> "F"];
	 If[nvectors == 1,
	    stringtype = stringtype <> "V"];
	 type = ToExpression[stringtype];
	 ];
      ];
    Return[type];
    ];

POLEordertypes[diag_]:=Module[{i, ps, psT, type, stringtype}, 
   ps = DeleteCases[{Internal[1] /. diag[[2]], 
      Internal[2] /. diag[[2]], Internal[3] /. diag[[2]], 
      Internal[4] /. diag[[2]], Internal[5] /. diag[[2]]}, 
     Internal[_]];
   psT = getType /@ ps;
   stringtype="";
   If[FreeQ[psT, G] == False, type = Discard; Return[type]];
   For[i = 1, i <= Length[psT], i++,
       stringtype= stringtype<>ToString[psT[[i]]];
       ];
   type=ToExpression[stringtype];
   Return[type];

  ];


PDiracQ[p_]:=Block[{temp},
temp=Select[DiracList,#[[1]]===(p/.{conj[a_]->a,bar[a_]->a})&];
If[!temp==={},
If[temp[[1,2]]===2,Return[True]];
];
Return[False];
];


myconj[ps_] := Module[{psT, i, res, pt}, 
   psT = getType /@ ps;
   res = {};
   For[i = 1, i <= Length[ps], i++,
    Switch[psT[[i]],
     S,
     pt = conj[ps[[i]]],
     F,
     pt = bar[ps[[i]]],
     V,
     pt = ps[[i]],
     G,
     pt = conj[ps[[i]]]
     ];
    AppendTo[res, pt];
    ];
   Return[res];
   ];
	   
myMatchQ[a__, b__] := Module[{res, i, j, tempa, tempb},
   res = True;
   tempa = a;
   tempb = b;
   If[Length[a] == 0,
    If[a === b, Return[True], Return[False]]];
   For[i = 1, i <= Length[a], i++,
    If[Length[a[[i]]] == 0,
       If[a[[i]] =!= b[[i]],Return[False]];,
      tempa = a[[i]];
      tempb = b[[i]];
      For[j = 1, j <= Length[b[[i]]], j++,
       tempa = DeleteCases[tempa, tempb[[j]], 1, 1]
       ];
      If[tempa != {}, Return[False]];
      ];
    ];
   Return[res]
   ];

delconj[diags_] := 
  Module[{i, j, diag, outdiags, listparts, ps, conjps, sps, scps, 
    FoundMatch, outcouplings, tempcouplings, conjtempcouplings, 
    possiblematchingdiags}, listparts = {};
   outdiags = {};
   listparts = {};
   For[i = 1, i <= Length[diags], i++, diag = diags[[i]];
    ps = DeleteCases[{Internal[1] /. diag[[2]], 
       Internal[2] /. diag[[2]], Internal[3] /. diag[[2]], 
       Internal[4] /. diag[[2]], Internal[5] /. diag[[2]]}, 
      Internal[_]];
    conjps = myconj[ps];
    sps = Sort[ps];
    scps = Sort[conjps];
    If[FreeQ[listparts, sps] && FreeQ[listparts, scps], 
       AppendTo[outdiags, diag];
       AppendTo[listparts, {sps, Length[outdiags]}],
       (*------We may still have a non-equivalent diagram:check for those with the same internals---*)
     possiblematchingdiags = 
      Union[Position[listparts, sps], Position[listparts, scps]];
     FoundMatch = False;
         
     tempcouplings = diag[[1]];
     conjtempcouplings = myconj/@(tempcouplings /. {C[x__] -> {x}});
     
     For[j = 1, j <= Length[possiblematchingdiags], j++, 
      outcouplings = outdiags[[possiblematchingdiags[[j, 1]], 1]];
      If[MatchQ[outcouplings, tempcouplings] || 
        myMatchQ[outcouplings /. {C[x__] -> {x}}, conjtempcouplings], 
       FoundMatch = True; Break[];];];
     If[FoundMatch == False, 
       AppendTo[outdiags, diag];
       AppendTo[listparts, {sps, Length[outdiags]}]
	];];];
   Return[outdiags];
];


POLEorderVFFFFS[diag_] := Module[{i, ps, result},
  (*This corrects the ordering of the internals for diagrams of type V_FFFFS *)
  
  ps = {Internal[1] /. diag[[2]], Internal[2] /. diag[[2]], 
    Internal[3] /. diag[[2]], Internal[4] /. diag[[2]], 
    Internal[5] /. diag[[2]]};
  If[getType[ps[[5]]] === S,
   result = diag;,
   (*Otherwise swap 4 & 5 *)
   result = {diag[[1]], {Internal[1] -> ps[[1]], 
       Internal[2] -> ps[[2]], Internal[3] -> ps[[3]], 
       Internal[4] -> ps[[5]], Internal[5] -> ps[[4]]}};
   ];
  Return[result]
];


Classify2LPdiagrams := 
	 Block[{diagsS, diagsX, diagsW,listWoSSSS,listXoSSS, listSoSSS, res,ddata},
	       ddata={}; (* STORES GLOBAL INFO FOR DIAGRAMS*)

	       (* SCALAR ONLY DIAGRAMS *)
	       
	       diagsW = GenerateW;
	       listWoSSSS = {WoSSSS, delconj[Select[diagsW, POLEordertypes[#] === SSSS &]]};
	       AppendTo[ddata,{WoSSSS,{pfuncstring->"WfSSSS",pprefactor->1/4,topdata->{{{hh, gE1}, {hh, gE2}, {Internal[1], i1}, {Internal[2],i2}}, {{AntiField@Internal[1], i1}, {Internal[3], i3}, {Internal[4], i4}}, {{AntiField@Internal[2], i2}, {AntiField@Internal[3], i3}, {AntiField@Internal[4], i4}}}}}];

	        diagsX = GenerateX;
	       listXoSSS = {XoSSS, delconj[Select[diagsX, POLEordertypes[#] === SSS &]]};
	       AppendTo[ddata,{XoSSS,{pfuncstring->"XfSSS",pprefactor->1/4,topdata-> {{{hh,gE1},{hh,gE2},{Internal[1],i1},{Internal[2],i2}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[3],i3},{AntiField@Internal[3],i3}}}}}];

	       diagsY = GenerateY;
	       listYoSSSS = {YoSSSS, delconj[Select[diagsY, POLEordertypes[#] === SSSS &]]};
	       AppendTo[ddata,{YoSSSS,{pfuncstring->"YfSSSS",pprefactor->1/2,topdata-> {{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{Internal[4],i4},{AntiField@Internal[4],i4}}}}}];

	       diagsZ= GenerateZ;
	       listZoSSSS = {ZoSSSS, delconj[Select[diagsZ, POLEordertypes[#] === SSSS &]]};
	       AppendTo[ddata,{ZoSSSS,{pfuncstring->"ZfSSSS",pprefactor->1/4,topdata-> {{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}}}}];
	       
	       diagsS = GenerateS;
	       listSoSSS = {SoSSS, delconj[Select[diagsS, POLEordertypes[#] === SSS &]]};
	       AppendTo[ddata,{SoSSS,{pfuncstring->"SfSSS",pprefactor->1/6, topdata->{{{hh,gE1}, {Internal[1],i1}, {Internal[2],i2}, {Internal[3],i3}},{{hh,gE2},{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{AntiField@Internal[3],i3}}}}}];

	       diagsU = GenerateU;
	       listUoSSSS = {UoSSSS, delconj[Select[diagsU, POLEordertypes[#] === SSSS &]]};
	       AppendTo[ddata,{UoSSSS,{pfuncstring->"UfSSSS",pprefactor->1, topdata->{{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{Internal[3],i3},{Internal[4],i4}},{{AntiField@Internal[2],i2},{AntiField@Internal[3],i3},{AntiField@Internal[4],i4}}}}}];

	       diagsV = GenerateV;
	       listVoSSSSS = {VoSSSSS, delconj[Select[diagsV, POLEordertypes[#] === SSSSS &]]};
	       AppendTo[ddata,{VoSSSSS,{pfuncstring->"VfSSSSS",pprefactor->1/2, topdata->{{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}}}}];

	       diagsM = GenerateM;
	       listMoSSSSS = {MoSSSSS, delconj[Select[diagsM, POLEordertypes[#] === SSSSS &]]};
	       AppendTo[ddata, {MoSSSSS, {pfuncstring -> "MfSSSSS", pprefactor -> 1/2, topdata->{{{hh,gE1},{Internal[1],i1},{Internal[3],i3}},{{hh,gE2},{Internal[2],i2},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}}}}];
	       
	       (* SCALARS AND VECTORS *)

	       listWoSSSV = {WoSSSV, Select[diagsW, POLEtypes[#] === SSSV &]};
	       AppendTo[ddata, {WoSSSV, {pfuncstring -> "WfSSSV", pprefactor -> 1/2,topdata->{{{hh,gE1},{hh,gE2},{Internal[1],i1},{AntiField@Internal[1],i1}}}}}];

	       listMoSSSSV = {MoSSSSV, Select[diagsM, POLEtypes[#] === SSSSV &]};
	       AppendTo[ddata, {MoSSSSV, {pfuncstring -> "MfSSSSV", pprefactor -> 1/2,topdata->{{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{AntiField@Internal[2],i2}}}}}];


	       (* SCALARS AND FERMIONS *)
	       
	      
	       listWoSSFF = {WoSSFF, delconj[Select[diagsW, POLEordertypes[#] === SSFF &]]};
	       AppendTo[ddata, {WoSSFF, {topdata->{{{hh, gE1}, {hh, gE2}, {Internal[1], i1}, {Internal[2],i2}}, {{AntiField@Internal[1], i1}, {Internal[3], i3}, {Internal[4], i4}}, {{AntiField@Internal[2], i2}, {AntiField@Internal[3], i3}, {AntiField@Internal[4], i4}}},
		     (* first combination *)
		       {
			 {pfuncstring -> "WfSSFbFb", pprefactor -> 1/2,pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{0,L,L}},
		       (* second combo *)
			 {pfuncstring -> "WfSSFF", pprefactor -> 1/2,pfermionmasses->{},pcouplingtypes->{0,L,R}}	 
		       }
		   }}];
	       
	       listMoFFFFS={MoFFFFS,delconj[Select[diagsM, POLEordertypes[#] === FFFFS &]]};
	       AppendTo[ddata, {MoFFFFS,{topdata->{{{hh,gE1},{Internal[1],i1},{Internal[3],i3}},{{hh,gE2},{Internal[2],i2},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},
		       {
			 {pfuncstring -> "MfFbFbFbFbS", pprefactor->1, pfermionmasses->{{Internal[1],i1},{Internal[2],i2},{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,L,L,L}},
			 {pfuncstring -> "MfFFbFbFS", pprefactor->2, pfermionmasses->{{Internal[2],i2},{Internal[3],i3}},pcouplingtypes->{L,R,R,L}},  
			 {pfuncstring -> "MfFFbFFbS", pprefactor->2, pfermionmasses->{{Internal[2],i2},{Internal[4],i4}},pcouplingtypes->{L,R,R,R}},  
			 {pfuncstring -> "MfFFFbFbS", pprefactor->2, pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,L,R,L}},
			 {pfuncstring -> "MfFFFFS", pprefactor->1, pfermionmasses->{},pcouplingtypes->{L,L,R,R}}
		       }
		   }}];
	       
	        listMoSFSFF={MoSFSFF,delconj[Select[diagsM, POLEordertypes[#] === SFSFF &]]};
	       AppendTo[ddata, {MoSFSFF,{topdata->{{{hh,gE1},{Internal[1],i1},{Internal[3],i3}},{{hh,gE2},{Internal[2],i2},{Internal[4],i4}},{{AntiField@Internal[1],i1},{AntiField@Internal[2],i2},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},
		       {
			 {pfuncstring -> "MfSFbSFbFb", pprefactor->2, pfermionmasses->{{Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},pcouplingtypes->{0,L,L,L}},
			 {pfuncstring -> "MfSFSFbF", pprefactor->4, pfermionmasses->{{Internal[4],i4}},pcouplingtypes->{0,L,R,L}},
			 {pfuncstring -> "MfSFSFFb", pprefactor->2, pfermionmasses->{{Internal[5],i5}},pcouplingtypes->{0,L,R,R}}
		       }
		   }}];
	      
	       listVoSSSFF = {VoSSSFF, delconj[Select[diagsV, POLEordertypes[#] === SSSFF &]]};
	       AppendTo[ddata,{VoSSSFF,{topdata->{{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},
		     {
		       {pfuncstring -> "VfSSSFbFb", pprefactor->1, pfermionmasses->{{Internal[4],i4},{Internal[5],i5}},pcouplingtypes->{0,0,L,L}},
		       {pfuncstring -> "VfSSSFF", pprefactor->1, pfermionmasses->{},pcouplingtypes->{0,0,L,R}}
		     }

		   }}];

	       (* NB special treatment for VoFFFFS because we can switch the scalar and fermion positions *)
	       listVoFFFFS = {VoFFFFS, POLEorderVFFFFS/@delconj[Select[diagsV, POLEtypes[#] === SFFFF &]]};
	       AppendTo[ddata,{VoFFFFS,{topdata->{{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{Internal[3],i3}},{{AntiField@Internal[2],i2},{Internal[4],i4},{Internal[5],i5}},{{AntiField@Internal[3],i3},{AntiField@Internal[4],i4},{AntiField@Internal[5],i5}}},
		     {
		       {pfuncstring -> "VfFbFbFbFbS", pprefactor->2, pfermionmasses->{{Internal[1],i1},{Internal[2],i2},{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,L,L,L}},
		       {pfuncstring -> "VfFbFFbFS", pprefactor->4, pfermionmasses->{{Internal[1],i1},{Internal[3],i3}},pcouplingtypes->{L,L,R,L}},
		       {pfuncstring -> "VfFbFFFbS", pprefactor->2, pfermionmasses->{{Internal[1],i1},{Internal[4],i4}},pcouplingtypes->{L,L,R,R}},
		       {pfuncstring -> "VfFFbFbFS", pprefactor->2, pfermionmasses->{{Internal[2],i2},{Internal[3],i3}},pcouplingtypes->{L,R,L,R}},
		       {pfuncstring -> "VfFFFbFbS", pprefactor->4, pfermionmasses->{{Internal[3],i3},{Internal[4],i4}},pcouplingtypes->{L,R,R,R}},
		       {pfuncstring -> "VfFFFFS", pprefactor->2, pfermionmasses->{},pcouplingtypes->{L,R,R,L}}       
		     }
		   }}];

	       ListGoFFFFV={GoFFFFV, delconj[Select[diagsV, POLEtypes[#] === FFFFV &]]};
	       AppendTo[ddata,{GoFFFFV,{topdata->{{{hh,gE1},{Internal[1],i1},{Internal[2],i2}},{{hh,gE2},{AntiField@Internal[1],i1},{AntiField@Internal[2],i2}}},
		       {
			 {pfuncstring ->"GfFFV", pprefactor->1, pfermionmasses->{},pcouplingtypes->{L,R,0,0}},
			 {pfuncstring ->"GfFbFbV", pprefactor->1, pfermionmasses->{{Internal[1],i1},{Internal[2],i2}},pcouplingtypes->{L,L,0,0}}
		       }
		   }}];


	   res = {{listWoSSSS,listXoSSS,listYoSSSS,listZoSSSS,listSoSSS,listUoSSSS,listVoSSSSS,listMoSSSSS,listWoSSSV,listMoSSSSV,listWoSSFF,listMoFFFFS,listMoSFSFF,listVoSSSFF,listVoFFFFS,ListGoFFFFV},ddata};

	 
	       Return[res]
	       ];

	 
	 
(************************************************ NOW FOR TADPOLE STUFF *********************************)

SetAttributes[{checkconj}, {HoldAll}];
checkconj[diag_, listparts_, outdiags_] := 
  Module[{j, ps, conjps, sps, scps, FoundMatch, outcouplings, 
	  tempcouplings, conjtempcouplings, possiblematchingdiags},
   
   ps = DeleteCases[{Internal[1] /. diag[[2]], 
      Internal[2] /. diag[[2]], Internal[3] /. diag[[2]], 
      Internal[4] /. diag[[2]], Internal[5] /. diag[[2]]}, 
     Internal[_]];
   conjps = myconj[ps];
   sps = Sort[ps];
   scps = Sort[conjps];
   If[FreeQ[listparts, sps] && FreeQ[listparts, scps],
    AppendTo[outdiags[[2]], diag];
    AppendTo[listparts, {sps, Length[outdiags[[2]]]}];
    Return[True];,
    (*------We may still have a non-equivalent diagram:
    check for those with the same internals---*)
    possiblematchingdiags = 
     Union[Position[listparts, sps], Position[listparts, scps]];
    
    
    FoundMatch = False;
    tempcouplings = diag[[1]];
    conjtempcouplings = myconj /@ (tempcouplings /. {C[x__] -> {x}});
    For[j = 1, j <= Length[possiblematchingdiags], j++,
	     
	outcouplings = outdiags[[2,possiblematchingdiags[[j, 1]], 1]];
     If[MatchQ[outcouplings, tempcouplings] || 
       myMatchQ[outcouplings /. {C[x__] -> {x}},
        conjtempcouplings],
      	FoundMatch = True;
      	Return[False];
      	];
     	];
    If[FoundMatch == False,
     AppendTo[outdiags[[2]], diag];
     AppendTo[listparts, {sps, Length[outdiags[[2]]]}];
     Return[True];
     	];
    ];
   ];



GenerateT1 := 
  Block[{topT1, insT1}, 
   topT1 = {{C[hh, FieldToInsert[1], FieldToInsert[2], 
       FieldToInsert[3]], 
      C[AntiField@FieldToInsert[1], AntiField@FieldToInsert[2], 
       AntiField@FieldToInsert[3]]}, {Internal[1] -> FieldToInsert[1],
       Internal[2] -> FieldToInsert[2], 
      Internal[3] -> FieldToInsert[3]}};
   insT1 = InsFields[topT1];
   Return[insT1]];


GenerateT2 := 
  Block[{topT2, insT2}, 
   topT2 = {{C[hh, FieldToInsert[1], FieldToInsert[2]], 
      C[AntiField@FieldToInsert[1], AntiField@FieldToInsert[2], 
       FieldToInsert[3], AntiField@FieldToInsert[3]]}, {Internal[1] ->
        FieldToInsert[1], Internal[2] -> FieldToInsert[2], 
      Internal[3] -> FieldToInsert[3]}};
   insT2 = InsFields[topT2];
   Return[insT2]];


GenerateT3 := 
  Block[{topT3, insT3}, 
   topT3 = {{C[hh, FieldToInsert[1], FieldToInsert[2]], 
      C[AntiField@FieldToInsert[1], FieldToInsert[3], 
       FieldToInsert[4]], 
      C[AntiField@FieldToInsert[2], AntiField@FieldToInsert[3], 
       AntiField@FieldToInsert[4]]}, {Internal[1] -> FieldToInsert[1],
       Internal[2] -> FieldToInsert[2], 
      Internal[3] -> FieldToInsert[3], 
      Internal[4] -> FieldToInsert[4]}};
   insT3 = InsFields[topT3];
   Return[insT3]];

Classify2LTadpoleDiagrams := 
  Block[{diagsT1, diagsT2, diagsT3, i, diag, ps, psT, listparts, 
    listbroken, type, listSS, listSSS, listSSSS, listFFFS, listSSFF, 
    listSV, listFV, listpartsSSSS, listpartsFFFS, listpartsSSFF, 
    listpartsSV, listpartsFV, res, ddata},
    listSS = {ToSS,{}};
   listSSS = {ToSSS,{}};
   listSSSS = {ToSSSS,{}};
   listFFFS = {ToFFFS,{}};
   listSSFF = {ToSSFF,{}};
   listSV = {ToSV,{}};
   listFV = {ToFV,{}};
   res = {};
   ddata = {};
   
   
   diagsT1 = GenerateT1;
   diagsT2 = GenerateT2;
   diagsT3 = GenerateT3;
   
   listparts = {};
   For[i = 1, i <= Length[diagsT1], i++,
    diag = diagsT1[[i]];
    
    
    type = POLEordertypes[diag];
    If[type === SSS,
     checkconj[diag, listparts, listSSS];
     ];
    ];
    AppendTo[ddata, {ToSSS, { pfuncstring -> "TfSSS", pprefactor -> 1/6,
      topdata -> {{{hh, gE1}, {Internal[1], i1}, {Internal[2], 
          i2}, {Internal[3], i3}}, {{AntiField@Internal[1], 
          i1}, {AntiField@Internal[2], i2}, {AntiField@Internal[3], 
          i3}}}
      }}];
   
   listparts = {};
   For[i = 1, i <= Length[diagsT2], i++,
    diag = diagsT2[[i]]; 
    ps = DeleteCases[{Internal[1] /. diag[[2]], 
        Internal[2] /. diag[[2]], Internal[3] /. diag[[2]], 
        Internal[4] /. diag[[2]], Internal[5] /. diag[[2]]}, 
       Internal[_]] /. {bar[a_] -> a, conj[a_] -> a};
    psT = getType /@ ps;
    If[FreeQ[psT, G] == False,
     Continue[]];
   
    
    type = POLEordertypes[diag];
    If[type === SSS,
     checkconj[diag, listparts, listSS];
     ];
    ];
    AppendTo[ddata, {ToSS, {pfuncstring -> "TfSS", pprefactor -> 1/4,
      topdata -> {{{hh, gE1}, {Internal[1], i1}, {Internal[2], i2}}, {{AntiField@Internal[1], i1}, {AntiField@Internal[2], i2}, {Internal[3], i3}, {AntiField@Internal[3], i3}}}
      }}];
   
   listpartsSSSS = {};
   listpartsFFFS = {};
   listpartsSSFF = {};
   listpartsSV = {};
   listpartsFV = {};
   
   For[i = 1, i <= Length[diagsT3], i++,
    diag = diagsT3[[i]];
    
    
    ps = DeleteCases[{Internal[1] /. diag[[2]], 
       Internal[2] /. diag[[2]], Internal[3] /. diag[[2]], 
       Internal[4] /. diag[[2]], Internal[5] /. diag[[2]]}, 
      Internal[_]];
    type = POLEordertypes[diag];
    
    Switch[type,
     SSSS,
     checkconj[diag, listpartsSSSS, listSSSS];,
     SSFF,
     checkconj[diag, listpartsSSFF, listSSFF];,
     SSSV | SSVS,
     If[FreeQ[ps, VG] === False, 
       checkconj[diag, listpartsSV, listSV]];,
     FFFV | FFVF,
     If[FreeQ[ps, VG] === False, 
       checkconj[diag, listpartsFV, listFV]];,
     FFFS,
     checkconj[diag, listpartsFFFS, listFFFS];,
     FFSF,
     diag = {diag[[1]], {Internal[1] -> ps[[1]], 
        Internal[2] -> ps[[2]], Internal[3] -> ps[[4]], 
        Internal[4] -> ps[[3]]}};
     checkconj[diag, listpartsFFFS, listFFFS];,
     _,
     Continue[];
     ];
    ];

   AppendTo[ddata, {ToSSSS, {pfuncstring -> "TfSSSS", pprefactor -> 1/4, 
		  topdata -> {{{hh, gE1}, {Internal[1], i1}, {Internal[2], i2}}, {{AntiField@Internal[1], i1}, {Internal[3], i3}, {Internal[4], i4}}, {{AntiField@Internal[2], i2}, {AntiField@Internal[3], i3}, {AntiField@Internal[4], i4}}}
	      }}];
    AppendTo[ddata, {ToSSFF, {topdata -> {{{hh, gE1}, {Internal[1], i1}, {Internal[2], i2}}, {{AntiField@Internal[1],i1},{Internal[3], i3}, {Internal[4], i4}}, {{AntiField@Internal[2], i2},{AntiField@Internal[3],i3}, {AntiField@Internal[4], i4}}},
      {
	{pfuncstring -> "TfSSFF", pprefactor -> 1/2, 
        pfermionmasses -> {}, pcouplingtypes -> {0, L, R}},
        {pfuncstring -> "TfSSFbFb", pprefactor -> -1, 
        pfermionmasses -> {{Internal[3], i3}, {Internal[4], i4}}, 
        pcouplingtypes -> {0, L, L}}
       }
      }}];
   AppendTo[ddata, {ToFFFS, {topdata -> {{{hh, gE1}, {Internal[1],i1}, {Internal[2], i2}}, {{AntiField@Internal[1], i1}, {Internal[3], i3}, {Internal[4], i4}}, {{AntiField@Internal[2], i2}, {AntiField@Internal[3], 
          i3}, {AntiField@Internal[4], i4}}},
      {
	{pfuncstring -> "TfFFFbS", pprefactor -> 2, 
        pfermionmasses -> {{Internal[3], i3}}, 
        pcouplingtypes -> {L, R, R}},
	  {pfuncstring -> "TfFFbFS", pprefactor -> 2, 
        pfermionmasses -> {{Internal[2], i2}}, 
        pcouplingtypes -> {L, R, L}},
       {pfuncstring -> "TfFbFbFbS", pprefactor -> -2, 
        pfermionmasses -> {{Internal[1], i1}, {Internal[2], 
           i2}, {Internal[3], i3}}, pcouplingtypes -> {L, L, L}}
       }
      }}];
   AppendTo[ddata, {ToSV, {pfuncstring -> "TfSV", pprefactor -> 1/2, topdata -> {{{hh, gE1}, {Internal[1], 
          i1}, {AntiField@Internal[1], i1}}}}}];
   AppendTo[ddata, {ToFV, {topdata -> {{{hh, gE1}, {Internal[1], i1}, {AntiField@Internal[1], i1}}},
	   {
	     {pfuncstring -> "TfFV", pprefactor -> 1, 
		 pfermionmasses -> {{Internal[1], i1}}, pcouplingtypes -> {L,0,0}}
	   }
      }}];
   
 
   
    res = {{listSS, listSSS, listSSSS, listSSFF, listFFFS, listSV, listFV}, 
     ddata};
   Return[res];
   
   
   ];
