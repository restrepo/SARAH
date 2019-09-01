(* ::Package:: *)

(*helper functions*)
ToSymbol[list_]:=Return[Symbol[StringJoin[ToString[#]&/@list]]];

Clear[getOpts]
getOpts[f_,overwrite_:<||>] := Return[(#[[1]] -> If[KeyExistsQ[overwrite,#[[1]]], overwrite[#[[1]]],  opt[#[[1]]]] & /@ Options[f])];
$ReturnLists = False;
$ReturnIR = False;
Clear[IsVertex]
IsVertex[c_]:=If[MemberQ[VerticesInv[All],c],
                    Return[True];,
                    If[Length[c]===2 && Length[Vertex[c/.C[a__]:>{a}]],
                        Return[True],
                        Return[False]];
                ];
Clear[extractVertex]
extractVertex[c_]:=Module[{fields,type,value},
    If[Length[c]===2, Return[Limit[{Vertex[c/.C[a__]:>{a}]}/.TreeLevelTadpoleSolutions//.$AllSimplifications//Expand,epsUV->0]];]; 
    If[!IsVertex[c],Return[{}]];
    fields = VerticesOrg[All][[Position[VerticesInv[All],c][[1,1]]]];
    type   = getVertexType[fields];
    value  = Select[SA`VertexList[type],FreeQ[#,fields]==False&];
    Return[value];
];

MSDRNeeded[msdr_]:=If[msdr===Automatic, If[SupersymmetricModel, 1, 0], msdr];

ReplacementIndices[old_,new_] := Module[{i,oldS,newS,x},
    oldS=Sort[old] /. a_[{b_,c__}]:>b/.A_[{b_}]:>b;
    newS=Sort[new]/. A_[{b_}]:> b;
    Return[Table[oldS[[i]]->newS[[i]],{i,1,Length[oldS]}]] /. conj[x_]->x /.bar[x_]->x;
];


Colorfactor[fields_]:=If[AllTrue[fields, FreeQ[getIndizes[#], color] &]||Length[fields]===0,1,Max[getColorDim[#]&/@fields]];

Clear[setMasses];
setMasses[masses_:None] := Module[
    { f, masstemp },
    masstemp = <| (#->Table[getMass[#,i],{i,1,getGen[#,CurrentStates]}])&/@ParticleDefinitions[CurrentStates][[All,1]] |>;
    Do[
        If[MemberQ[Join[SMParticles,massless], f], masstemp[f] = Table[0,{i,1,Length[masstemp[f]]}]];
        If[Head[masses[f]]===List, masstemp[f] = masses[f]];
    ,{f,ParticleDefinitions[CurrentStates][[All,1]]}];
    Return[masstemp];
];


replaceLogs={Log->log,log[a_^2/b_^2]:>(2log[a]-2log[b]),log[a_/b_]:>(log[a]-log[b]),log[a_^2]:>2log[a]};
equalcolors={ct1->1,ct2->1,ct3->1,ct4->1};


(* one loop effective potential *)
Clear[EffPot1Loop]
EffPot1Loop[m2_:{}, norm_:1/4,MSDR_:3/2]:=norm Sum[m[[i]]^2*(Log[m[[i]]/UVscaleQ^2]-MSDR),{i,1,Length[m]}]


(* ::Subsection:: *)
(*effective scalar amplitudes*)


(* effectively assign factor 2 if charged particles are in the loop *)
SA`CheckSameVertices=False;

(* abbreviations for topologies *)
TopoNotation=Join[(#->#)&/@(GenericScalarCouplings//Keys)
,{
    SA      -> {SA[4]},
    SB      -> {SB[4]},
    S       -> {SA[4],SB[4]},
    A       -> {A[2]},
    B[4][2] -> {B[4][2][1],B[4][2][2]},
    B[4]    -> {B[4][2][1],B[4][2][2],B[4][1]},
    B       -> {B[2],B[3],B[4][1],B[4][2][1],B[4][2][2]},
    T[4]    -> {T[4][1],T[4][2]},
    T       -> {T[2],T[3],T[4][1],T[4][2]},
    C[4]    -> {C[4][1],C[4][2]},
    C       -> {C[3],C[4][1],C[4][2]}
}];

Clear[SelectTopologies]
SelectTopologies[m_Integer, OptionsPattern[EFTcoupNLO]]:=Module[
	{
		Tops = DeleteCases[OptionValue[Topologies], DiagonalWFRs|OffdiagonalWFRs],
		TopsExcl = DeleteCases[OptionValue[ExcludeTopologies], DiagonalWFRs|OffdiagonalWFRs],
		TopsAvail, TopsFiltered, selected
	},
    TopsAvail = Select[GenericScalarCouplings//Keys, !FreeQ[#, F_Symbol[m]]&];
    If[m==4, AppendTo[TopsAvail,D]];
    If[Length[TopsAvail]==0, Print["No Topologies for ",m,"-point function! Can only compute renormalizable couplings!"];Return[{}]];
 
    If[Tops == {},
        If[OptionValue[Topologies]=!={}, Return[{}]];
        TopsFiltered = TopsAvail;
        ,
        TopsFiltered = Select[DeleteDuplicates[Flatten[Tops/.TopoNotation]], !FreeQ[#, F_Symbol[m]]&];
        If[m==4&&MemberQ[OptionValue[Topologies],D], AppendTo[TopsFiltered,D]];
    ];
    TopsExcl = DeleteDuplicates[Flatten[TopsExcl/.TopoNotation]];
 
    unsupported = Complement[Tops,Join[TopoNotation//Keys,TopoNotation//Values]];
    If[Length[unsupported]>0, Print["Invalid Topologies selected! Ignoring: ", unsupported]];
    TopsFiltered = Complement[TopsFiltered, unsupported];
    
    selected = KeyTake[GenericScalarCouplings, TopsFiltered];
    selected = KeyDrop[selected, TopsExcl];
    Return[selected];
];


Clear[InsertFields]
(* Wrapper for InsFields: takes external fields and the coupling list {C[ex[1],ex[2],FieldToInsert[1]],...} *)
InsertFields[exF__, Topology->topo_, OptionsPattern[EFTcoupNLO]]:= Module[
    {
        NumInternalFields,couplings,diags={},
        excludefields=OptionValue[ExcludeFields],
        opts = Sequence @@ (getOpts[EFTcoupNLO]/.opt[z_]:>OptionValue[z])
    },
    NumExternalFields=Length[exF];
    couplings=GenericScalarCouplings[topo];
    NumInternalFields=Count[DeleteDuplicates[couplings/.AntiField->Identity/.C[x__]:>x],FieldToInsert[_]];
    (* local tree-level topologies *)
    If[(Head[topo]===T || Head[Head[topo]]===T) && !OptionValue[IncludeTreeLevel],Return[{}];];
    If[(Head[topo]===T || Head[Head[topo]]===T) && Length[couplings]===1 && NumInternalFields===0,
        If[!IsVertex[C[Sequence@@exF]] || (OptionValue[InternalPatterns]=!={} && !OptionValue[IncludeTreeLevel]) , Return[{}]];
        Return[{{
            {C[exFields]},  
            Join[
                Table[External[i]->exF[[i]],{i,1,NumExternalFields}],
                Table[IndexExternal[i] -> Symbol["ex"<>ToString[i]], {i,1,NumExternalFields}]
            ]
        }}];
    ];
    (* non-local LO and NLO topologies *)
    diags=InsFields[{
        couplings/.Table[ex[i]->exF[[i]],{i,1,NumExternalFields}],
        Join[
            Table[External[i]->exF[[i]],{i,1,NumExternalFields}],
            Table[IndexExternal[i] -> Symbol["ex"<>ToString[i]], {i,1,NumExternalFields}],
            Table[Internal[i]->FieldToInsert[i],{i,NumInternalFields}],
            Table[IndexInternal[i]->Symbol["in"<>ToString[i]],{i,NumInternalFields}]
        ]
    }];

    (* skip all pure SM contributions *)
    excludefields = Join[excludefields, SMParticles];
    (* skip diagrams containing ExcludeFields (except Vectors which are needed for MSDR conversion) *)
    If[MSDRNeeded[OptionValue[ShiftMSDR]]>0, excludefields = Select[excludefields,!getType[#]===V&];];
    diags = Select[diags,
        Intersection[Table[Internal[i]/.#[[2]]/.conj|bar->Identity,{i,NumInternalFields}],excludefields]==={}&
        ];
    
    
    (* take diagrams with selected particle insertion types *)
    If[Length[OptionValue[InternalPatterns]]>0,
        diags = Select[diags, Length[Cases[OptionValue[InternalPatterns],ToSymbol[Sort[getType[##]&/@(Table[Internal[i],{i,1,NumInternalFields}]/.#[[2]])]]]]===1 &]
    ];
    Return[diags]
];
        
(* gives extra shift to gauge couplings arising from DRbar-MSbar scheme switch *)
(* since we start with a DRbar calculation it give the substituion rule for g_DR -> g_MS*( 1 + delta) *)
Clear[GaugeMSDR];
GaugeMSDR[NLOMarker_:1,LoopFactor_:(1/4Pi)^2]:=Return[
    DeleteCases[
        #[[2]]/.{
            SU[n_]:> (#[[4]] -> #[[4]](1 + n     NLOMarker #[[4]]^2/6 LoopFactor)),
            SO[n_]:> (#[[4]] -> #[[4]](1 + (n-1) NLOMarker #[[4]]^2/6 LoopFactor))
        }&/@Gauge
    ,U[1]]
];
(*thresholds to gauge couplings*)
Clear[GaugeThresholds];
GaugeThresholds[NLOMarker_:1,OptionsPattern[EFTcoupNLO]]:=Module[
    {
        heavyfields,rotations,threshold,thresholds=<||>,integratedout={},gaugefields,
        gaugecount,gaugef,gengauge,dyn,colorf=1,chargef=1,fieldf=1,gren,
        masses=$MassesMatching
    },
    heavyfields=Select[Particles[EWSB]/.diracSubBack[EWSB],!SMQ[#[[1]]] && !#[[4]]===VEV&& !#[[4]]===A&];
    rotations=Join[DEFINITION[EWSB][MatterSector],DEFINITION[EWSB][GaugeSector]]//.diracSubBack[ALL];
    Do[
        threshold=0;
        integratedout={};
        Do[
            p=Position[rotations,f[[1]]];
            If[p==={},
                gaugefields={f[[1]]};
            ,
                p=p[[1]];
                p[[2]]=p[[2]]-1;
                p=p[[1;;Length[p]-1]];
                gaugefields=rotations[[Sequence@@p]];
            ];
            gengauge={1,0};
            gaugecount=1;
            Do[
                If[(OptionValue[InternalPatterns]=!={} && !AnyTrue[OptionValue[InternalPatterns], StringContainsQ[ToString[#],ToString[f[[4]]]]&]) 
                   || MemberQ[OptionValue[ExcludeFields],f[[1]]],
                    Continue[];
                ];
                gaugef=gaugef//.diracSubBack[ALL]//getBlank;
                If[getGenALL[gaugef]===99||getGenALL[gaugef]===1,
                    gengauge={gaugecount,gaugecount};,
                    gengauge={gengauge[[2]]+1,gaugecount getGenALL[gaugef]};
                ];
                dyn=SA`Dynkin[gaugef,gauge[[3]]];
                If[gauge[[5]]===True && gauge[[2]]=!=U[1],dyn=dyn/SA`DimensionGG[gaugef,gauge[[3]]];]; (* Add by FS *)
                
                (*
                If[!NumberQ[dyn],
                    gp=Position[DEFINITION[EWSB][GaugeSector],gaugef];
                    If[gp==={},gaugecount++;Continue[]];
                    gp=gp[[1]];
                    gp[[2]]=gp[[2]]-1;
                    gaugef=DEFINITION[EWSB][GaugeSector][[Sequence@@gp]]//.diracSubBack[ALL]//getBlank;
                    dyn=SA`Dynkin[gaugef,gauge[[3]]];
                ];
                *)
                 (* Calculation of chargef Changed by FS *)
                colorf=If[FreeQ[getIndizes[f[[1]]],color],1,getColorDim[f[[1]]]]; 
               (*  chargef=If[AntiField[f[[1]]]===f[[1]], 1, If[MemberQ[rotations//Flatten,f[[1]]]||MemberQ[rotations//Flatten,AntiField[f[[1]]]], 1, 2]]; *)
               chargef=If[AntiField[f[[1]]]===f[[1]], 1, 2];
               If[Head[f[[1]]]===bar,chargef=0;]; 
               (* Changed by FS 
                fieldf=If[f[[4]]===S, 1/2, 1];
                fieldf=If[f[[4]]===F, 4,  fieldf];
                fieldf=If[f[[4]]===V, 21/2,fieldf]; *)
                Switch[f[[4]],
                S,fieldf=1;,
                F,fieldf=4;,
                V,fieldf=21/2;
                ];
                gren = If[gauge[[2]]===U[1],1/GUTren[1]^2,1]; (* Changed by FS *)
                Do[
                    If[FreeQ[integratedout,{gaugef,masses[f[[1]]//getBlank][[gt1]]}],AppendTo[integratedout,{gaugef,masses[f[[1]]//getBlank][[gt1]]}]]; (* changed by FS to get the sum over all generations *)
                    If[masses[f[[1]]//getBlank][[gt1]]===0,Continue[]];
                    threshold -= dyn/12 gren colorf fieldf chargef Log[masses[f[[1]]//getBlank][[gt1]]^2/UVscaleQ^2];
                    ,{gt1,gengauge[[1]],gengauge[[2]]}];
                gaugecount++;
            ,{gaugef,gaugefields}];
        ,{f,heavyfields}];
        thresholds[gauge[[4]]//.$AllSimplifications] = gauge[[4]] + gauge[[4]]^3 NLOMarker OptionValue[LoopFactor] threshold//.$AllSimplifications;
    ,{gauge,Gauge}];
    Return[thresholds];
];

(* get all ingridients for given field insertion (from InsFields) into a given generic topology *)
Clear[InsertVertices]
InsertVertices[diag_,m_,Topology->topo_, OptionsPattern[EFTcoupNLO]]:=Module[
    {
        verts={},coupling,fields,vert,amp,vertOrg,i=1,msdr=0,gauget=0,
        opts = Sequence @@ (getOpts[EFTcoupNLO]/.opt[z_]:>OptionValue[z])
    },
    couplings=GenericScalarCouplings[topo];
    NumInternalFields=Count[DeleteDuplicates[couplings/.AntiField->Identity/.C[x__]:>x],FieldToInsert[_]];
    InternalFields = Table[Internal[i],{i,NumInternalFields}];
    FieldTypesList = (getType[#]&/@(InternalFields/.diag[[2]]))//Sort;
    FieldTypes = If[NumInternalFields>0,ToSymbol[FieldTypesList],None];
    SumIterators=If[NumInternalFields>0,Table[{IndexInternal[s]/.diag[[2]],1,getGen[Internal[s]/.diag[[2]]]},{s,1,NumInternalFields}],{{dummyidx,1,1}}];
    

    Do[
        genericcoupling = genericvert/.{ (* C[Internal[1],...] *)
            ex[i_]:>External[i],
            FieldToInsert->Internal
        };      
        coupling = genericcoupling/.diag[[2]]; (* C[hh,hh,Ah] *)
        
        fields = genericvert/.{ (* {hh[{ex1}],hh[{ex2}],Ah[{in1}]} *)
            ex[i_]:>External[i][{IndexExternal[i]}],
            FieldToInsert[i_]:>Internal[i][{IndexInternal[i]}]
        }/.diag[[2]]/.C[a__]:>{a};
        vertOrg = extractVertex[coupling]; (* contains vertex with gt1, gt2, ... *)
        If[vertOrg =!= {}, 
            vertOrg = vertOrg[[1]];
            If[AnyTrue[fields,getType[#]===F&],
                verts = AppendTo[verts, genericcoupling[L] -> vertOrg[[2,1]]/.ReplacementIndices[vertOrg[[1]],fields]];
                verts = AppendTo[verts, genericcoupling[R] -> vertOrg[[3,1]]/.ReplacementIndices[vertOrg[[1]],fields]];
            ,
                verts = AppendTo[verts, genericcoupling -> vertOrg[[2,1]]/.ReplacementIndices[vertOrg[[1]],fields]]; 
            ];
        ];
        i++;
    ,{genericvert, couplings}];
    verts=verts//.equalcolors//.$AllSimplifications//.epsUV->0;
    ColorFactor=Colorfactor[InternalFields/.diag[[2]]];
	debugterm=If[OptionValue[Debug],debug[topo][Sequence@@Table[Internal[i][IndexInternal[i]],{i,1,NumInternalFields}]],1]/.diag[[2]];
    amp=Generic1LoopAmp[topo][FieldTypes]/.verts/.diag[[2]];
    If[MemberQ[FieldTypesList,V] && !MSDRNeeded[OptionValue[ShiftMSDR]]===0 && !Head[Generic1LoopAmpMSDR[topo][FieldTypes]]===Generic1LoopAmpMSDR[topo],
        (* Generic1LoopAmpMSDR gives the difference AmpMSbar - AmpDRbar *)
        msdr = Generic1LoopAmpMSDR[topo][FieldTypes]/.verts/.diag[[2]];
        If[MSDRNeeded[OptionValue[ShiftMSDR]]===2,
            amp  = -msdr;,
            amp -= msdr;
        ];
    ];
    If[Head[topo]===T || Head[Head[topo]]===T,
        msdr = (amp/.(GaugeMSDR[NLOMarker,OptionValue[LoopFactor]]//.$AllSimplifications)) - amp//Expand;
        Switch[MSDRNeeded[OptionValue[ShiftMSDR]],
            1,  amp = amp + msdr//Expand, 
            2,  amp = msdr;
        ];
        If[OptionValue[GaugeThresholds], amp = amp/.GaugeThresholds[NLOMarker,opts]//Expand];
       (*  Print[GaugeThresholds[NLOMarker,opts]//Expand];  *)
        amp = amp/.NLOMarker^_->0/.NLOMarker->1;
        ,
        amp = OptionValue[LoopFactor] amp;
    ];

    (*
       diagrams that include vectors but have vanishing MS-DR contributions must not be included as they cancel anyways in the sum
       (see also paragraph 3.3 of 1810.09388)
       TODO: momentum flow of e.g. SSV vertices is not considered and thus the cancelation does not happen because of a missing sign
       (this will be important for heavy vectors but not for MS-DR conversion (?) since its quadratic).
    *)
    If[MemberQ[FieldTypesList,V] && msdr === 0, amp=0]; 

    If[$ReturnLists,
        If[MSDRNeeded[OptionValue[ShiftMSDR]]===2 && msdr===0, Return[{}]];
        Return[<| 
            "Colorfactor"->ColorFactor,
            "TypeInsertion" -> FieldTypes,
            "Vertices" -> verts,
            "Insertions" -> diag[[2]],
            "Iterators" -> SumIterators,
			"Topology"-> topo,
            "MSDR" -> msdr
        |>];
        ,
        If[MSDRNeeded[OptionValue[ShiftMSDR]]===2 && msdr===0, Return[0]];
        Return[SUM[debugterm ColorFactor amp,Evaluate[Sequence@@SumIterators]]];
    ];
]


(* map InsertVertices onto InsertFields  *)
Clear[getFieldInsertions,CACHE]
getFieldInsertions[exF__, OptionsPattern[EFTcoupNLO]]:=Module[
	{
		m = Length[exF], 
		opts = Sequence @@ (getOpts[EFTcoupNLO]/.opt[z_] :> OptionValue[z]),
        insertions = {}, Tops, hash,WatchTopo="N/A",WatchL=0,WatchC=0,tPrint
	},

    If[!OptionValue[Caching],Clear[CACHE];];
    hash = Hash[{opts}];
    If[Head[CACHE["ins"][exF, hash]]!=CACHE["ins"],Return[CACHE["ins"][exF, hash]]];

    Tops = SelectTopologies[m, opts];
    If[Length[Tops]>1 && OptionValue[ShowProgress],
        tPrint=PrintTemporary["Inserting fields into topology: ", Dynamic[Topo], Dynamic[WatchC], "/(", Dynamic[WatchL],")"];
    ];
	Do[
    	FieldInsertions=InsertFields[exF,Topology->Topo,opts];
        WatchL = Length[FieldInsertions];
    	VertexInsertions=MapIndexed[(WatchC=IntegerString[#2];InsertVertices[#1,Length[exF],Topology->Topo,opts])&,FieldInsertions];
    	If[$ReturnLists,
        	insertions = Join[insertions,VertexInsertions];
       	,
       		AppendTo[insertions, Total[VertexInsertions]];
    	];
	,{Topo, Keys[Tops]}];
    If[Length[Tops]>1&& OptionValue[ShowProgress], NotebookDelete[tPrint]];
	If[$ReturnLists,
        CACHE["ins"][exF,hash] = insertions;
    ,
        CACHE["ins"][exF,hash] = Total[insertions];
   	];
    Return[CACHE["ins"][exF,hash]];
]

(* do the summation, replace masses and apply extra assumptions *)
Clear[DoSUM]
DoSUM[expr_, OptionsPattern[EFTcoupNLO]]:=Return[(((((expr//.($AllSimplifications)
                )//.SUM->Sum
                )//.($AllSimplifications)
                )//.M[conj[x_][y_]]:>$MassesMatching[x][[y]]
                )//.M[bar[x_][y_]]:>$MassesMatching[x][[y]]
                )//.M[x_[y_]]:>$MassesMatching[x][[y]]
];

(* amplitude for non-specified generations of external states *)
Clear[getAmplitude,getAmplitudeGen,CACHE]
getAmplitudeGen[exF__,OptionsPattern[EFTcoupNLO]]:=Module[{opts = Sequence @@ (getOpts[EFTcoupNLO]/.opt[z_]:>OptionValue[z]), hash},
	If[!OptionValue[Caching],Clear[CACHE];];
    fields =  exF/.conj[F_[n_Integer]]:>conj[F] /.conj[F_][n_Integer]:>conj[F] /.F_[n_Integer] :> F;
    hash = Hash[{opts}];
    If[Head[CACHE["amp"][fields, hash]]===CACHE["amp"], CACHE["amp"][fields, hash]=getFieldInsertions[fields,opts]//DoSUM;];
    Return[(CACHE["amp"][fields, hash]//.$AllSimplifications//OptionValue[LoopReplace])//.$AllSimplifications];
];

getAmplitude[exF__,OptionsPattern[EFTcoupNLO]]:=Module[
    {setgen,opts=Sequence@@(getOpts[EFTcoupNLO]/.opt[z_]:>OptionValue[z])},
    idx = exF/.conj[F_[n_Integer]]:>F[n]/.conj[F_][n_Integer]:>F[n]/.F_[n_Integer]:>n;
    setgen=Table[Symbol["ex"<>ToString[i]] -> idx[[i]], {i,1,Length[exF]}];
    fields = exF/.conj[F_[n_Integer]]:>conj[F] /.conj[F_][n_Integer]:>conj[F] /.F_[n_Integer] :> F;
    Return[getAmplitudeGen[fields, opts]//.setgen//.$AllSimplifications];
]

(* give all non-equal diagrams of a given set of external states *)
Clear[FieldPermutations,EFTcoupNLO]
FieldPermutations[exF__,OptionsPattern[EFTcoupNLO]]:=Module[
	{i=0,listtemp={},lamtemp,pos,Perm,AllPerms,norm=1, opts = Sequence @@ (getOpts[EFTcoupNLO]/.opt[z_]:>OptionValue[z])},
    If[OptionValue[Topologies]==={},Message[FieldPermutations::NoTopology];Return[{}];];
    If[Length[Flatten[OptionValue[Topologies]/.TopoNotation]]>1,Message[FieldPermutations::MultiTopology];];
	AllPerms=Permutations[exF];
    norm=Factorial[Length[exF]]/Times @@ ((Count[exF,#]!)&/@DeleteDuplicates[exF]);
    If[OptionValue[ShowProgress],
        tPrint2 = PrintTemporary["Calculating field permutations for topology: ", 
                                 OptionValue[Topologies][[1]],"  ("
                                 Dynamic[i], "/", Length[AllPerms],")"];
    ];
    Do[
        lamtemp = 1/norm getAmplitude[Perm,opts]//Expand;
        pos = Position[listtemp,lamtemp];
        If[Length[pos]===1,
            listtemp[[pos[[1,1]]]][[1]] += 1;
            If[OptionValue[Debug],AppendTo[listtemp[[pos[[1,1]]]][[2]], eFs[Perm]];];
            ,
            AppendTo[listtemp,{1,{eFs[exF]},lamtemp}];           
        ];
        i++;
    ,{Perm,AllPerms}];
    If[OptionValue[ShowProgress], NotebookDelete[tPrint2]];
    Return[listtemp];
]

(* sum up the permutations *)
EFTcoupNLO[exF__,OptionsPattern[EFTcoupNLO]]:=Module[
    {
        perms, lambda, p,
        opts = Sequence @@ (getOpts[EFTcoupNLO]/.opt[z_]:>OptionValue[z])
    },
    lambda = WFRCorrectedAmp[exF, opts];
    If[Length[DeleteDuplicates[exF]]===1,
        lambda += getAmplitude[exF,opts];
    ,
        Tops = SelectTopologies[Length[exF],opts];
        opts = Sequence[DeleteCases[{opts},"Topologies"->___]];
        Do[
            perms=FieldPermutations[exF,"Topologies"->{topo},opts];
            lambda += Sum[ perms[[p,1]] perms[[p,3]], {p,1,Length[perms]}];
        ,{topo,Keys[Tops]}];
    ];
    If[!$ReturnIR,
        lambda = lambda//.epsUV->0//.Den[0, 0]:>0//.Den[a_,b_]:>1/(a-b)//.Inf[___]:>0;
    ];
    If[OptionValue[SimplifyResults],
        If[OptionValue[ShowProgress],tPrint3=PrintTemporary["Simplifying results (if this takes too long, set the SimplifyResults Option to False)."]];
        lambda = Simplify[lambda//.$AllSimplifications, $AssumptionsMatching];
        lambda = Simplify[lambda//.$AllSimplifications, $AssumptionsMatching];
        If[OptionValue[ShowProgress],NotebookDelete[tPrint3]];
    ];
    Return[lambda//.$AllSimplifications];
];

EFTcoupLO[exF__,OptionsPattern[EFTcoupLO]] := EFTcoupNLO[exF,
                                     Topologies->{T},
                                     ShiftMSDR->0,
                                     GaugeThresholds->False,
                                     ExcludeTopologies -> {OffdiagonalWFRs, DiagonalWFRs},
                                     Debug -> OptionValue[Debug],
                                     ExcludeFields -> OptionValue[ExcludeFields],
                                     SimplifyResults -> OptionValue[SimplifyResults],
                                     ShowProgress -> False
                    ];

(* Wave function renormalizations *)

Clear[WFRConstant]
WFRConstant[f1__,f2__,OptionsPattern[EFTcoupNLO]] := Module[{Z,type,replopts,opts,masses=$MassesMatching},
    Clear[diag,offdiag];
	If[!OptionValue[Caching],Clear[CACHE];];
    replopts = <|ShowProgress->False,GaugeThresholds->False,ShiftMSDR->0,Topologies->{A[2],B[2]}|>;
    opts = Sequence @@ (getOpts[EFTcoupNLO,replopts]/.opt[z_] :> OptionValue[z]);
    hash = Hash[{opts}];
    If[Head[CACHE["wfr"][f1, f2, hash]]=!=CACHE["wfr"], Return[CACHE["wfr"][f1, f2, hash]];];
    n1  =f1//.conj[F_[n_Integer]]:>n//.F_[n_Integer]:>n;
    n2  =f2//.conj[F_[n_Integer]]:>n//.F_[n_Integer]:>n;
    exF1=f1//.conj[F_[n_Integer]]:>conj[F]//.F_[n_Integer]:>F;
    exF2=f2//.conj[F_[n_Integer]]:>conj[F]//.F_[n_Integer]:>F;

    $ReturnLists = True;
    fieldinsertions=getFieldInsertions[{exF1,exF2}, opts];
    $ReturnLists = False;
    type=If[masses[exF1//getBlank][[n1]]===masses[exF2//getBlank][[n2]], diag, offdiag];
    If[type===diag && MemberQ[OptionValue[ExcludeTopologies], DiagonalWFRs], Return[0]];
    If[type===offdiag && MemberQ[OptionValue[ExcludeTopologies],OffdiagonalWFRs], Return[0]];
    Clear[debugterm];
    debugterm[n_Integer]:=Return[If[OptionValue[Debug],debug[WFR][f1,f2][Sequence@@Table[Internal[i][IndexInternal[i]],{i,1,n}]],1]];
    Z = ( OptionValue[LoopFactor] #["Colorfactor"] * SUM[debugterm[Length[#["Iterators"]]] Generic1LoopAmp[WFR][type][#["TypeInsertion"]]//.#["Vertices"]//.#["Insertions"],Sequence@@#["Iterators"]]
        )&/@fieldinsertions/.ex1->n1/.ex2->n2;
    If[$ReturnLists,
        Return[Z];
    ,
        CACHE["wfr"][f1, f2, hash] = Total[Z//DoSUM//OptionValue[LoopReplace]];
        Return[CACHE["wfr"][f1, f2, hash]];
    ];
]

(* 
calculation of all involved diagrams for (off)diagonal WFR terms:
    DeltaZ_ii = treelevel * Re(del(2_point_function)_ii)
    DeltaZ_ij = treelevel * 2 Re(2_point_function_ij)/(mi^-mj^2)
*)

Clear[WFRCorrectedAmp]
WFRCorrectedAmp[extF__,OptionsPattern[EFTcoupNLO]]:=Module[
    {
    WFROff = 0, WFRDiag = 0, WFR=0, norm = 1,
    TreeDiagrams, SelfDiagrams, FieldsToInsert,
    opts,replopts,perms
    },

    (*determine summation over field permutations*)
    Switch[Length[extF],
    1,Return[0];,
    2,Return[0];,
    3,perms = {extF};,
    4,perms = Permutations[extF];
      norm = Factorial[Length[extF]]/Times@@((Count[extF,#]!)&/@DeleteDuplicates[extF]);,
    ___,Return[0];
    ];

    replopts=<|"IncludeTreeLevel"->True,ShowProgress->False,GaugeThresholds->False,ShiftMSDR->0,Topologies->{T}|>;
    opts=Sequence@@(getOpts[EFTcoupNLO,replopts]/.opt[z_]:>OptionValue[z]);


    Do[
        (*replace external legs with generic legs,one at a time*)
        TreeDiagrams=Table[GAi[ReplacePart[exF,i->FieldToInsert[exF[[i]]]],OPTSi],{i,1,Length[exF]}];
        
        (*Z-factors for external leg and generic leg*)
        SelfDiagrams=Table[WFi[conj[FieldToInsert[exF[[i]]]],exF[[i]],OPTSi],{i,1,Length[exF]}];
        
        (*fields to insert into generic legs*)
        FieldsToInsert=Flatten[Table[#[i],{i,1,getGen[#]}]&/@If[conj[#]===#,{#},{#,conj[#]}]&/@Select[Particles[Current]//.diracSubBack[ALL],RE[#[[4]]]===S&][[All,1]]];
        
        (*multiply Z-factor with tree diagrams and sum over generic legs*)
        WFRDiag=Select[Sum[TreeDiagrams.SelfDiagrams/.FieldToInsert[i_]:>If[j===i,j,NoField],{j,FieldsToInsert}],FreeQ[#,NoField]&];
        WFROff=Select[Sum[TreeDiagrams.SelfDiagrams/.FieldToInsert[i_]:>If[j=!=i,j,NoField],{j,FieldsToInsert}],FreeQ[#,NoField]&];
        
        If[!MemberQ[OptionValue[ExcludeTopologies],DiagonalWFRs],
            If[OptionValue[Topologies]=!={}&&!MemberQ[OptionValue[Topologies],DiagonalWFRs],WFRDiag=0];
            WFR+=1/2 WFRDiag/.OPTSi->opts/.GAi->getAmplitude/.WFi->WFRConstant;
        ];
        
        If[!MemberQ[OptionValue[ExcludeTopologies],OffdiagonalWFRs],
            If[OptionValue[Topologies]=!={}&&!MemberQ[OptionValue[Topologies],DiagonalWFRs],WFROff=0];
            WFR+=1/2 WFROff/.OPTSi->opts/.GAi->getAmplitude/.WFi->WFRConstant;
        ];
    ,{exF,perms}];
    Return[1/norm WFR//.$AllSimplifications];
];

(* ::Subsection:: *)
(*Output for MakeSPheno*)


Clear[ListToString]
getArrayForm[func_,par_]:=Block[{},
If[FreeQ[func,par[b__Integer]],Return[""];];
If[FreeQ[func,par[a_Integer]]==False,Return["(:)"];];
If[FreeQ[func,par[a_Integer,b_Integer]]==False,Return["(:,:)"];];
If[FreeQ[func,par[a_Integer,b_Integer,c_Integer]]==False,Return["(:,:,:)"];];
If[FreeQ[func,par[a_Integer,b_Integer,c_Integer,d_Integer]]==False,Return["(:,:,:,:)"];];
];
ListToString[list_]:=StringRiffle[ToString[SPhenoForm[#]]&/@list, ","];
ListToStringDim[list_,func_]:=StringRiffle[(ToString[SPhenoForm[#1]<>getArrayForm[func,#1]]&)/@list,","];



Clear[GenerateSelfDefinedFuntion]
GenerateSelfDefinedFuntion[funcname_String, func_, OptionsPattern[GenerateSPhenodotm]]:=Module[
    {
   	vars,varsRAW,real,complex,arguments,fortran,functionbody,sphenom,expr,minpar,
    SMParameters={g1,g2,g3,mu2,v,e,Yu[__],Yd[__],Ye[__]} (* TODO: load complete list from EFT Model*)
    },
    SARAHFortran = True;
    (* replacements for Fortran expressions. E.g. Tan[\beta]->atan[tanbeta] *)
    expr = func//.Den[0,0]:>0//.Inf[___]:>0 (*//.OptionValue["FortranReplacements"] *);
    
    (* convert function to a fortran compatible string *)
    functionbody = expr//SPhenoForm//FortranLineBreak;
    
    (* get all variables and function arguments *)
    varsRAW = Variables@Level[expr, {-Infinity,Infinity}];
    vars = Join[Select[varsRAW,SymbolQS[#]&],Cases[varsRAW,_[__Integer]]]//Sort;
    arguments = (#/.F_[___]:>F&/@vars);
    real = Select[vars, conj[#]==#&];
    complex = DeleteCases[Complement[vars,real],UVscaleQ];
    If[!FreeQ[expr, UVscaleQ] && FreeQ[real, UVscaleQ], AppendTo[real, UVscaleQ]];

    Sargs = arguments//ListToString//FortranLineBreak;
    Sreal = If[Length[real]>0,"Real(dp),Intent(in) :: " <>(real/.A_[b__Integer]->A//ListToStringDim[#,expr]& //FortranLineBreak),""];
    Scomplex = If[Length[complex]>0,"Complex(dp),Intent(in) :: " <> (complex/.A_[b__Integer]->A//ListToStringDim[#,expr]& //FortranLineBreak),""];
    fortran = "

Real(dp) Function "<>funcname<>"("<> Sargs <>")
Implicit None
" <> Scomplex <> " 
" <> Sreal <>"

"<>funcname<>"="<>functionbody<>"

End Function "<>funcname<>"

";
    complex = Intersection[Sequence@@(DeleteCases[complex,#]&/@SMParameters)];
    real = Intersection[Sequence@@(DeleteCases[real,#]&/@SMParameters)];
    If[SA`SPhenoCleanUp == True, SARAHFortran = False;];
    Return[<|
        "Arguments"-> arguments,
        "ComplexParameters" -> complex,
        "RealParameters" -> real,
        "SelfDefinedFunction" -> fortran
    |>];

]

Clear[GenerateSPhenodotm]
Options[GenerateSPhenodotm] = {
    "SPhenoBaseFile" -> "SPheno.m",
    "SPhenoFileName" -> Automatic,
    "BoundaryHighScale" -> {},
    "UseParameterAsGUTscale" -> None,
    "FortranReplacements" -> {},
    "SelfDefinedFunctions" -> {},
    "Backup" -> False,
    "RenormalizationScale" -> 173.34^2 
};
    
GenerateSPhenodotm[EFTmodel_String,OptionsPattern[]]:=Module[
    {
    MINPAR={},ComplexParameters={}, RealParameters={}, 
    func, funcname, funcfile, i, c, AllParameters,
    opts = Sequence @@ (getOpts[GenerateSPhenodotm]/.opt[z_]:>OptionValue[z])
    },
    sphenofilename = If[StringQ[OptionValue["SPhenoFileName"]],OptionValue["SPhenoFileName"],"SPhenoEFT_"<>ModelName<>"_"<>$NameUV<>".m"];
    sphenofile=ToFileName[{$sarahModelDirInput, EFTmodel}, sphenofilename];
    BoundaryHighScale = OptionValue["BoundaryHighScale"];
    SPhenoBaseFile = OptionValue["SPhenoBaseFile"];
    UseParameterAsGUTscale = OptionValue["UseParameterAsGUTscale"];
    SelfDefinedFunctions = OptionValue["SelfDefinedFunctions"];
    If[BoundaryHighScale=={},
        Print["Need to specify BoundaryHighScale -> { {eftparam, 42/2 C[..]}, ... }"];
        Return[False];
    ];
    If[Head[UseParameterAsGUTscale]!=List,
        Print["Need to specify UseParameterAsGUTscale -> {somemassscaleparameter}"];
        Return[False];
    ];
    If[FileExistsQ[sphenofile], 
        If[OptionValue["Backup"],
            RenameFile[sphenofile, sphenofile<>".bkp_" <> ToString[AbsoluteTime[]//Round]];,
            DeleteFile[sphenofile];
        ];
    ];
    If[Head[SPhenoBaseFile]==String,
        SPhenoBaseFile = ToFileName[{$sarahModelDirInput,EFTmodel}, SPhenoBaseFile];
        If[!FileExistsQ[SPhenoBaseFile],
            Print["Could not find ", SPhenoBaseFile, " !"];,
            Print["Taking ", ToString[SPhenoBaseFile], " as template."];
            CopyFile[SPhenoBaseFile, sphenofile];
        ];
    ];
    If[!FileExistsQ[sphenofile],CreateFile[sphenofile];];
    Print["Writing ", sphenofile, "."];
    sphenofile = OpenAppend[sphenofile];
    WriteString[sphenofile, "\n\n(* begin: automatically generated by GenerateSPhenodotm[] *)\n\n"];
    WriteString[sphenofile, "OnlyLowEnergySPheno = False;\n\n"];
    
    WriteString[sphenofile, "If[Head[BoundaryHighScale]=!=List,BoundaryHighScale={}];\n"];
    WriteString[sphenofile, "If[Head[BoundaryLowScaleInput]===List,BoundaryLowScaleInput=Select[BoundaryLowScaleInput,FreeQ["<>ToString[Transpose[SA`MatchingResultsNLO][[1]]]<>",#[[1]]]&];]; \n"];
    WriteString[sphenofile, "If[Head[BoundaryHighScale]===List,BoundaryHighScale=Select[BoundaryHighScale,FreeQ["<>ToString[Transpose[SA`MatchingResultsNLO][[1]]]<>",#[[1]]]&];]; \n"];
    WriteString[sphenofile, "If[Head[BoundarySusyScale]===List,BoundarySusyScale=Select[BoundarySusyScale,FreeQ["<>ToString[Transpose[SA`MatchingResultsNLO][[1]]]<>",#[[1]]]&];]; \n"];
    WriteString[sphenofile, "BoundaryMatchingUV = {\n"];
    (* TODO: convert bigints !  *) 
    For[i=1, i<=Length[BoundaryHighScale], i++,
        c = BoundaryHighScale[[i]];
        func = c[[2]];
        funcname = "EFTcoupling" <> ToString[i];
        info = GenerateSelfDefinedFuntion[funcname, func, opts];
        funccall = funcname <> "[" <> ListToString[info["Arguments"]] <> "]";
        ComplexParameters = Union[ComplexParameters,info["ComplexParameters"]];
        RealParameters = Union[RealParameters,info["RealParameters"]];
        funcfilename = funcname <> "_" <> StringReplace[sphenofilename,".m"->""] <> ".f90"; 
        funcfile = ToFileName[{$sarahCurrentMatchingDir},funcfilename];
        If[FileExistsQ[funcfile], 
            If[OptionValue["Backup"],
                RenameFile[funcfile, funcfile <>".bkp_" <> ToString[AbsoluteTime[]//Round]];,
                DeleteFile[funcfile];
            ];
        ];
        CreateFile[funcfile];
        WriteString[funcfile, info["SelfDefinedFunction"]];
        Close[funcfile];
        AppendTo[SelfDefinedFunctions,funcfilename];
        WriteString[sphenofile, "{"<>ToString[c[[1]]//InputForm] <>","<>funccall<> "}"];
        If[i!=Length[BoundaryHighScale],
            WriteString[sphenofile,",\n"];,
            WriteString[sphenofile,"\n};\n\n"];
        ];
        
    ];
    AllParameters = Join[ComplexParameters,RealParameters];
    If[UseParameterAsGUTscale != None && FreeQ[AllParameters,UseParameterAsGUTscale[[1]]],
        AppendTo[AllParameters, UseParameterAsGUTscale[[1]]];
        AppendTo[AllParameters, UseParameterAsGUTscale[[1]]];
    ];  
    MINPAR = Table[{i,AllParameters[[i]]},{i,1,Length[AllParameters]}];
    WriteString[sphenofile,"MINPAR = " <> StringReplace[ToString[MINPAR],"},"->"},\n"] <> ";\n\n"];
    WriteString[sphenofile,"RealParameters = " <> ToString[RealParameters] <> ";\n\n"];
    WriteString[sphenofile,"ComplexParameters = " <> ToString[ComplexParameters] <> ";\n\n"];
    WriteString[sphenofile,"UseParameterAsGUTscale = " <> ToString[UseParameterAsGUTscale] <> ";\n\n"];
    WriteString[sphenofile,"RenormalizationScale = " <> ToString[OptionValue["RenormalizationScale"]] <>";\n" ];
    WriteString[sphenofile,"RenormalizationScaleFirstGuess = " <> ToString[OptionValue["RenormalizationScale"]] <> ";\n\n"];
    WriteString[sphenofile,"SelfDefinedFunctions = {\n"];
    For[i=1, i<=Length[SelfDefinedFunctions], i++,
        WriteString[sphenofile, "  ReadString[\""<>SelfDefinedFunctions[[i]]<>"\"]"];
        If[i!=Length[SelfDefinedFunctions],
            WriteString[sphenofile,",\n"];,
            WriteString[sphenofile,"\n};\n\n"];
        ];
   ];
    WriteString[sphenofile, "(* end: automatically generated by GenerateSPhenodotm[] *)\n"];
    Close[sphenofile];
];


GenerateSPhenoFiles:=Block[{i,sphenofilename},
   sphenofilename = If[StringQ[OptionValue["SPhenoFileName"]],OptionValue["SPhenoFileName"],"SPhenoEFT_"<>ModelName<>"_"<>$NameUV<>".m"];
    sphenofile=ToFileName[{$sarahModelDirInput, $SPhenoEFTmodel}, sphenofilename];
    WriteString[sphenofile, "\n\n(* begin: automatically generated by SARAH *)\n\n"];
    WriteString[sphenofile, "ModelName = \""<>$NameUV<>"\";\n\n"];
    WriteString[sphenofile, "OnlyLowEnergySPheno = False;\n\n"];
    WriteString[sphenofile, "MINPAR="<>ToString[$SPhenoMINPAR]<>"\n\n"];
    WriteString[sphenofile, "ParametersToSolveTadpoles="<>ToString[$SPhenoTadpoles]<>"\n\n"];
    
    WriteString[sphenofile,"UseParameterAsGUTscale = {" <> ToString[$SPhenoMatchingScale] <> "};\n\n"];
    
    WriteString[sphenofile, " RenormalizationScaleFirstGuess = 173.^2;\n"];
    WriteString[sphenofile, " RenormalizationScale = "<>ToString[InputForm[$SPhenoRenScale]]<>";\n\n"];
    
    WriteString[sphenofile, " DEFINITION[MatchingConditions]= "<>ToString[InputForm[$SPhenoMatchingEWSB]]<>";\n\n"];
    
  
    
    If[Head[$SPhenoBoundaryHighScale]==Symbol,$SPhenoBoundaryHighScale={}]; 
    WriteString[sphenofile, " BoundaryHighScale = "<>ToString[InputForm[$SPhenoBoundaryHighScale]]<>";\n\n\n"];

    If[Head[$SPhenoBoundaryRenScale]==Symbol,$SPhenoBoundaryRenScale={}]; 
    WriteString[sphenofile, " BoundaryRenScale = "<>ToString[InputForm[$SPhenoBoundaryRenScale]]<>";\n\n\n"];
    
    WriteString[sphenofile, "BoundaryMatchingUV = {\n"];
    replQ = ToString[#]<>"Q"->ToString[#]&/@Join[Gauge[[All,4]],{Yu,Yd,Ye}];
    For[i=1,i<=Length[SA`ListFuncCalls],
    WriteString[sphenofile, "{"<>ToString[SA`ListFuncCalls[[i,1]]//InputForm] <>","<>StringReplace[SA`ListFuncCalls[[i,2]],replQ]<> "}"];
        If[i!=Length[SA`ListFuncCalls],
            WriteString[sphenofile,",\n"];,
            WriteString[sphenofile,"\n};\n\n"];
        ];
     i++;];
    
    
       
    WriteString[sphenofile, " ListDecayParticles = Automatic;\n"];
    WriteString[sphenofile, " ListDecayParticles3B = Automatic;\n\n"];
    
    WriteString[sphenofile, " RealParameters = "<>ToString[Select[Transpose[$SPhenoMINPAR][[2]],FreeQ[$AssumptionsMatching,#]==False&]]<>";\n\n"];
    
    WriteString[sphenofile,"SelfDefinedFunctions = {\n"];
    For[i=1, i<=Length[SA`ListFuncFiles], i++,
        WriteString[sphenofile, "  ReadString[\""<>SA`ListFuncFiles[[i]]<>"\"]"];
        If[i!=Length[SA`ListFuncFiles],
            WriteString[sphenofile,",\n"];,
            WriteString[sphenofile,"\n};\n\n"];
        ];
   ];
    WriteString[sphenofile, "(* end: automatically generated by GenerateSPhenodotm[] *)\n"];
    Close[sphenofile];

];

