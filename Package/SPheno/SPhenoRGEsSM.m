(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



WriteRunRGEsSM:=Block[{},
(*
Print["--------------------------------------"];
Print["Writing SM RGEs "];
Print["--------------------------------------"];
*)

Print[StyleForm["Write SM RGEs","Section",FontSize->12]];

sphenoSM=OpenWrite[ToFileName[$sarahCurrentSPhenoDir,"RunSM_"<>ModelName<>".f90"]];

WriteCopyRight[sphenoSM];

WriteString[sphenoSM,"Module RunSM_"<>ModelName<>" \n \n"];
WriteString[sphenoSM, "Use Control \n"];
WriteString[sphenoSM, "Use LoopFunctions \n"];
WriteString[sphenoSM, "Use Mathematics \n"];
WriteString[sphenoSM, "Use StandardModel \n"];
WriteString[sphenoSM, "Use RGEs_"<>ModelName<>" \n"];
WriteString[sphenoSM, "Use Model_Data_"<>ModelName<>" \n\n"];

WriteString[sphenoSM, "Logical,Private,Save::OnlyDiagonal \n"];

(* WriteString[sphenoSM, "Real(dp),Parameter::id3R(3,3)=& \n & Reshape(Source=(/& \n & 1,0,0,& \n &0,1,0,& \n &0,0,1&\n &/),shape=(/3,3/)) \n\n\n"]; *)

WriteString[sphenoSM, "Contains \n \n "];

MakeSubroutineTitle["RunSM_and_SUSY_RGEs",Join[Map[ToExpression[SPhenoForm[#]<>"input"]&,listAllParametersAndVEVs],listAllParametersAndVEVs],{"Qout"},{"CKMout","sinW2_out", "Alpha_out","AlphaS_out", "realCKM"},sphenoSM];
WriteString[sphenoSM,"Implicit None \n"];
MakeVariableList[Map[ToExpression[SPhenoForm[#]<>"input"]&,listAllParametersAndVEVs],",Intent(in)",sphenoSM];
MakeVariableList[listAllParametersAndVEVs,",Intent(out)",sphenoSM];
WriteString[sphenoSM,"Real(dp), Intent(in) :: Qout \n"];
WriteString[sphenoSM,"Complex(dp), Intent(out) :: CKMout(3,3) \n"];
WriteString[sphenoSM,"Real(dp), Intent(out) :: sinW2_out, Alpha_out, AlphaS_out \n"];
WriteString[sphenoSM,"Complex(dp) :: YdSM(3,3), YuSM(3,3), YeSM(3,3) \n"];
WriteString[sphenoSM,"Real(dp) :: g1SM, g2SM, g3SM, vevSM \n"];
WriteString[sphenoSM,"Complex(dp) :: lambdaSM, muSM, dummy(3,3) \n"];
WriteString[sphenoSM,"Integer :: kont \n"];
WriteString[sphenoSM,"Logical :: OnlyDiagonal \n"];
WriteString[sphenoSM,"Logical :: realCKM \n"];
WriteString[sphenoSM,"Real(dp) :: deltaM = 0.000001_dp, test(3)  \n"];
If[Head[DEFINITION[MoreEWvevs]]===List,
WriteString[sphenoSM,"Real(dp) :: vd_aux, vu_aux\n"];
];

If[WriteCKMBasis===True,
WriteString[sphenoSM,"Complex(dp) :: Yd_ckm(3,3), Yu_ckm(3,3), Tu_ckm(3,3), Td_ckm(3,3), mq2_ckm(3,3), mu2_ckm(3,3), md2_ckm(3,3) \n"];
WriteString[sphenoSM,"Complex(dp) :: Yd_out(3,3), Yu_out(3,3), Tu_out(3,3), Td_out(3,3), mq2_out(3,3), mu2_out(3,3), md2_out(3,3) \n"];
];
WriteString[sphenoSM,"Real(dp) :: scale_save, Qin, tz, dt, g1D("<>ToString[numberAllwithVEVs]<>"), g62_SM(62) \n \n \n"];



WriteRunSUSYRGEs[sphenoSM];
WriteRunSMRGEs[sphenoSM];


WriteString[sphenoSM,"Qin = SetRenormalizationScale(Qout**2) \n"];

If[WriteCKMBasis===True,
WriteString[sphenoSM,"\n Contains \n\n" ];
AppendSourceCode["Switches_SCKM.f90",sphenoSM];
];

WriteString[sphenoSM,"End Subroutine RunSM_and_SUSY_RGEs \n \n \n"];

WriteGetSMparameters[sphenoSM];

AppendSourceCode["RGEs_SM.f90",sphenoSM];
WriteString[sphenoSM, "End Module RunSM_"<>ModelName<>" \n"];
Close[sphenoSM];
];

WriteRunSUSYRGEs[file_]:=Block[{i,j},
WriteString[file,"! Run SUSY RGEs from M_SUSY to Qin \n"];
WriteString[file,"Qin=sqrt(getRenormalizationScale()) \n"];
WriteString[file,"scale_save = Qin \n"];

MakeCall["ParametersToG"<>ToString[numberAllwithVEVs],Map[ToExpression[SPhenoForm[#]<>"input"]&,listAllParametersAndVEVs],{},{"g1D"},file];

If[OnlyLowEnergySPheno=!=True,
WriteString[file,"If (RunningSUSYparametersLowEnergy) Then \n"];
WriteString[file,"tz=Log(Qout/Qin) \n"];
WriteString[file,"dt=tz/100._dp \n"];
WriteString[file,"Call odeint(g1D,"<>ToString[numberAllwithVEVs]<>",0._dp,tz,deltaM,dt,0._dp,rge"<>ToString[numberAllwithVEVs]<>",kont)\n\n"];
WriteString[file,"End if \n\n"];
];

MakeCall["GToParameters"<>ToString[numberAllwithVEVs],listAllParametersAndVEVs,{"g1D"},{},file];
For[i=1,i<=Length[Gauge],If[Gauge[[i,2,1]]==1,WriteString[file,SPhenoForm[Gauge[[i,4]]]<> " = "<>SPhenoForm[Simplify[GUTren[i]]]<>"*" <> SPhenoForm[Gauge[[i,4]]]<>" \n"]; ];
i++;];
For[i=1,i<=Length[SA`ListGaugeMixed2],WriteString[file,SPhenoForm[SA`ListGaugeMixed2[[i,2,2]]]<> " = "<>SPhenoForm[GUTren[SA`ListGaugeMixed2[[i,1,1]],SA`ListGaugeMixed2[[i,1,2]]]]<>"*" <> SPhenoForm[SA`ListGaugeMixed2[[i,2,2]]]<>" \n"];
i++;];
WriteString[file,"\n\n"];

If[WriteCKMBasis,
WriteString[file, "If (GenerationMixing) Then \n"];
WriteString[file,"Call Switch_to_superCKM("<>SPhenoForm[DownYukawa]<>"(1:3,1:3),"<>SPhenoForm[UpYukawa]<>"(1:3,1:3),"<>SPhenoForm[TrilinearDown]<>"(1:3,1:3),"<>SPhenoForm[TrilinearUp]<>"(1:3,1:3),"<>SPhenoForm[SoftDown]<>"(1:3,1:3),"<>SPhenoForm[SoftSquark]<>"(1:3,1:3),"<>SPhenoForm[SoftUp]<>"(1:3,1:3) &\n"];
WriteString[file,"&,Td_ckm, Tu_ckm,md2_ckm,mq2_ckm,mu2_ckm, .False., Yd_ckm, Yu_ckm)\n"];
WriteString[file, "Else \n"];
WriteString[file, "Td_ckm = "<>SPhenoForm[TrilinearDown]<>"(1:3,1:3) \n"];
WriteString[file, "Tu_ckm = "<>SPhenoForm[TrilinearUp]<>"(1:3,1:3) \n"];
WriteString[file, "Yd_ckm = "<>SPhenoForm[DownYukawa]<>"(1:3,1:3) \n"];
WriteString[file, "Yu_ckm = "<>SPhenoForm[UpYukawa]<>"(1:3,1:3) \n"];
WriteString[file, "mq2_ckm = "<>SPhenoForm[SoftSquark]<>"(1:3,1:3) \n"];
WriteString[file, "md2_ckm = "<>SPhenoForm[SoftDown]<>"(1:3,1:3) \n"];
WriteString[file, "mu2_ckm = "<>SPhenoForm[SoftUp]<>"(1:3,1:3) \n"];
WriteString[file, "End If \n"];
];


];

WriteGetSMparameters[file_]:=Block[{i,j,v1,v2},
MakeSubroutineTitle["GetRunningSMparametersMZ",{"YdSM","YeSM","YuSM","g1SM","g2SM","g3SM","lambdaSM","muSM","vevSM","realCKM"},{},{},file];
WriteString[file,"Implicit None \n"];
WriteString[file,"Complex(dp), Intent(out) :: YdSM(3,3), YuSM(3,3), YeSM(3,3) \n"];
WriteString[file,"Real(dp), Intent(out) :: g1SM, g2SM, g3SM, vevSM \n"];
WriteString[file,"Complex(dp), Intent(out) :: lambdaSM, muSM \n"];
WriteString[file,"Real(dp) :: vev2, sinW2, CosW2SinW2 \n"];
WriteString[file,"Real(dp) :: gSM2(2), gSM3(3), mtopMS, mtopMS_MZ \n"];
WriteString[file,"Real(dp) :: dt, tz\n"];
WriteString[file,"Real(dp) :: deltaM = 0.000001_dp, test(3)  \n"];
WriteString[file,"Logical :: realCKM \n"];
WriteString[file, "Integer :: i1,kont \n \n \n"];

WriteString[file,"SinW2=0.22290_dp \n"];



WriteString[file,"CosW2SinW2=(1._dp-sinW2)*sinW2 \n"];
WriteString[file,"vev2=mZ2*CosW2SinW2/(pi*Alpha_mZ) -"<>SPhenoForm[SA`AdditionalDoubletVEVs]<>" \n"];

(*
If[AddOHDM=!=True,
WriteString[file,"v1=Sqrt(vev2/(1._dp+TanBeta**2))\n"];
WriteString[file,"v2=TanBeta*v1\n"];,
WriteString[file,"v1 = sqrt(vev2) \n"];
WriteString[file,"v2 = sqrt(vev2) \n"];
];
*)

WriteString[file,"vevSM = sqrt(vev2) \n \n"];

WriteString[file,"YdSM = 0._dp \n"];
WriteString[file,"YeSM = 0._dp \n"];
WriteString[file,"YuSM = 0._dp \n \n"];

WriteString[file,"Do i1=1,3 \n"];
WriteString[file,"YdSM(i1,i1) = sqrt2*mf_d_mz(i1)/vevSM \n"];
WriteString[file,"YeSM(i1,i1) = sqrt2*mf_l_mz(i1)/vevSM \n"];
WriteString[file,"YuSM(i1,i1) = sqrt2*mf_u_mz(i1)/vevSM \n"];
WriteString[file,"End do \n \n\n"];

WriteString[file,"! Calculating m_top(M_Z) \n"];
WriteString[file,"gSM2(1)=sqrt(Alpha_mZ*4*Pi) \n"];
WriteString[file,"gSM2(2)=sqrt(AlphaS_mZ*4*Pi) \n"];
WriteString[file,"tz=Log(sqrt(mz2)/mf_u(3)) \n"];
WriteString[file,"dt=tz/50._dp \n"];
WriteString[file,"Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont) \n \n"];
WriteString[file,"!m_top^pole to m_top^MS(m_top) \n"];
WriteString[file,"mtopMS=mf_u(3)*(1._dp-4._dp/3._dp*(gSM2(2)**2/4._dp/Pi )/Pi) \n\n"];
WriteString[file,"!Running m_top^MS(m_top) to M_Z \n"];
WriteString[file,"gSM3(1)=gSM2(1) \n"];
WriteString[file,"gSM3(2)=gSM2(2) \n"];
WriteString[file,"gSM3(3)=mtopMS \n"];
WriteString[file,"tz=Log(sqrt(mz2)/mf_u(3)) \n"];
WriteString[file,"dt=tz/50._dp \n"];
WriteString[file,"Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont) \n"];
WriteString[file,"mtopMS_MZ=gSM3(3) \n"];
WriteString[file,"YuSM(3,3) = sqrt2*mtopMS_MZ/vevSM \n \n\n"];

WriteString[file,"If (realCKM) Then \n"];
WriteString[file," YuSM = Transpose(Matmul(Transpose(Real(CKMcomplex,dp)),Transpose(YuSM))) \n"];
WriteString[file,"Else \n"];
WriteString[file," YuSM = Transpose(Matmul(Transpose(CKMcomplex),Transpose(YuSM))) \n"];
WriteString[file,"End if \n"];

If[AddOHDM=!=True && SupersymmetricModel===True && FreeQ[SuperPotential,UpYukawa]===False,
If[SA`Casimir[Select[SuperPotential[[Position[SuperPotential,UpYukawa][[1,1]],2]],(SA`Casimir[#,Position[Gauge,color][[1,1]]]==4/3)&][[1]],Position[Gauge,left][[1,1]]]==3/4,
WriteString[file,"YuSM = Transpose(YuSM) \n"];
];
];

WriteString[file,"g1SM=sqrt(Alpha_MZ/(1-sinW2)*4._dp*Pi) \n"];
WriteString[file,"g2SM=sqrt(Alpha_MZ/sinW2*4._dp*Pi) \n"];
WriteString[file,"g3SM=sqrt(AlphaS_MZ*4._dp*Pi) \n \n"];

WriteString[file,"lambdaSM = 0._dp \n"];
WriteString[file,"muSM = 0._dp \n \n"];



WriteString[file, "End Subroutine GetRunningSMparametersMZ \n\n"];
];

WriteRunSMRGEs[file_]:=Block[{i,j},
WriteString[file,"! Run SM RGEs from MZ to Qin \n"];

WriteString[file,"If (RunningSMparametersLowEnergy) Then \n"];
WriteString[sphenoSM,"! Run SM RGEs separately \n \n"];

WriteString[sphenoSM,"! Get values of gauge and Yukawa couplings at M_Z \n"];
MakeCall["GetRunningSMparametersMZ",{"YdSM","YeSM","YuSM","g1SM","g2SM","g3SM","lambdaSM", "muSM","vevSM","realCKM"},{},{},file];

WriteString[file,"Call ParametersToG62_SM(g1SM, g2SM, g3SM, lambdaSM, YuSM, YdSM, YeSM, muSM, vevSM, g62_SM) \n"];

WriteString[sphenoSM,"! Run to output scale \n"];
WriteString[file,"tz=Log(sqrt(MZ2)/Qout) \n"];
WriteString[file,"dt=tz/100._dp \n"];
WriteString[file,"Call odeint(g62_SM,62,tz,0._dp,deltaM,dt,0._dp,rge62_SM,kont)\n\n"];

WriteString[file,"Call GtoParameters62_SM(g62_SM, g1SM, g2SM, g3SM, lambdaSM, YuSM, YdSM, YeSM, muSM, vevSM) \n \n"];

WriteString[sphenoSM,"! Overwrite values obtained from SUSY running \n"];
If[FreeQ[ParameterDefinitions,"Hypercharge-Coupling"]==False,WriteString[file,SPhenoForm[hyperchargeCoupling]<> " = g1SM \n"];];
If[FreeQ[ParameterDefinitions,"Left-Coupling"]==False,WriteString[file,SPhenoForm[leftCoupling] <>" = g2SM \n"];];
If[FreeQ[ParameterDefinitions,"Strong-Coupling"]==False,WriteString[file,SPhenoForm[strongCoupling]<> " = g3SM \n"];];

If[AddOHDM=!=True,
If[FreeQ[ParameterDefinitions,"Down-VEV"]==False  && FreeQ[parameters,VEVSM1]===False ,WriteString[file,SPhenoForm[VEVSM1]<>"=vevSM/Sqrt(1._dp+"<>SPhenoForm[TanBeta]<>"**2) \n"];];
If[FreeQ[ParameterDefinitions,"Up-VEV"]==False && FreeQ[parameters,VEVSM2]===False ,WriteString[file,SPhenoForm[VEVSM2]<>"="<>SPhenoForm[TanBeta]<>"*"<>SPhenoForm[VEVSM1]<>" \n"];];,
If[FreeQ[ParameterDefinitions,"EW-VEV"]==False  && FreeQ[parameters,VEVSM]===False ,WriteString[file,SPhenoForm[VEVSM]<>"=vevSM \n"];];
];

If[Head[DEFINITION[MoreEWvevs]]===List,
WriteString[file,"! Set things in case of non-standard Yukawas or VEVs\n"];
For[i=1,i<=Length[DEFINITION[MoreEWvevs]],
WriteString[file,StringReplace[DEFINITION[MoreEWvevs][[i]],{"vev2"->"vevSM**2"}] <>"\n"];
i++;];
];

If[AddOHDM=!=True && Head[DEFINITION[MoreEWvevs]]===List,
WriteString[file,"vd_aux =  vevSM/Sqrt(1._dp+"<>SPhenoForm[TanBeta]<>"**2)  \n"];
WriteString[file,"vu_aux =  vd_aux*"<>SPhenoForm[TanBeta]<>"\n"];
];


If[DEFINITION[UseNonStandardYukwas]=!=True,
If[AddOHDM=!=True,
If[FreeQ[ParameterDefinitions,"Up-Yukawa-Coupling"]==False,WriteString[file,SPhenoForm[UpYukawa]<> " = YuSM*Sqrt(1._dp+"<>SPhenoForm[TanBeta]<>"**2)/"<>SPhenoForm[TanBeta]<>" \n"];];
If[FreeQ[ParameterDefinitions,"Down-Yukawa-Coupling"]==False,WriteString[file,SPhenoForm[DownYukawa]<> " = YdSM*Sqrt(1._dp+"<>SPhenoForm[TanBeta]<>"**2) \n"]; ];
If[FreeQ[ParameterDefinitions,"Lepton-Yukawa-Coupling"]==False,WriteString[file,SPhenoForm[ElectronYukawa]<> " = YeSM*Sqrt(1._dp+"<>SPhenoForm[TanBeta]<>"**2) \n"]; ];,
If[FreeQ[ParameterDefinitions,"Up-Yukawa-Coupling"]==False,WriteString[file,SPhenoForm[UpYukawa]<> " = YuSM \n"];];
If[FreeQ[ParameterDefinitions,"Down-Yukawa-Coupling"]==False,WriteString[file,SPhenoForm[DownYukawa]<> " = YdSM \n"]; ];
If[FreeQ[ParameterDefinitions,"Lepton-Yukawa-Coupling"]==False,WriteString[file,SPhenoForm[ElectronYukawa]<> " = YeSM \n"]; ];
	];,
For[i=1,i<=Length[DEFINITION[NonStandardYukawasRelations]],
WriteString[file,StringReplace[DEFINITION[NonStandardYukawasRelations][[i]] ,{"Y_l"->"YeSM","Y_d"->"YdSM","Y_u"->"YuSM","vd"->"vd_aux","vu"->"vu_aux"}]<>"\n"];
i++;];
];

WriteString[sphenoSM,"! Calculate running CKM matrix \n"];
WriteString[file, "Call FermionMass(YuSM,1._dp,test,dummy,CKMout,kont) \n \n"];

If[WriteCKMBasis===True,
WriteString[sphenoSM,"! Rotating from SCKM to EW basis \n"];
WriteString[sphenoSM,"Call Switch_from_superCKM(YdSM, YuSM, Td_ckm, Tu_ckm, md2_ckm, mq2_ckm, mu2_ckm& \n"];
WriteString[sphenoSM,"&, "<>SPhenoForm[TrilinearDown] <>"," <>SPhenoForm[TrilinearUp] <>"," <>SPhenoForm[SoftDown] <>"," <>SPhenoForm[SoftSquark] <>","<>SPhenoForm[SoftUp] <>",.True.) \n"];
];

WriteString[sphenoSM,"\n \n ! Output values for running SM constants \n"];
WriteString[file, "sinW2_out = g1SM**2/(g1SM**2+g2SM**2) \n"];
WriteString[file, "Alpha_out = sinW2_out*g2SM**2/(4._dp*Pi) \n"];
WriteString[file, "AlphaS_out = g3SM**2/(4._dp*Pi) \n \n"];
WriteString[file,"Else \n\n"];
WriteString[sphenoSM,"! Don't run SM RGEs separately \n"];
If[FreeQ[ParameterDefinitions,"Up-Yukawa-Coupling"]==False,
WriteString[file, "Call FermionMass("<>SPhenoForm[UpYukawa]<>",1._dp,test,dummy,CKMout,kont) \n"];,
WriteString[file, "CKMout = CKMcomplex \n"];
];
If[FreeQ[ParameterDefinitions,"Hypercharge-Coupling"]==False && FreeQ[ParameterDefinitions,"Left-Coupling"]==False,
WriteString[file, "sinW2_out = "<>SPhenoForm[hyperchargeCoupling] <>"**2/("<>SPhenoForm[hyperchargeCoupling] <>"**2+"<>SPhenoForm[leftCoupling] <>"**2) \n"];
WriteString[file, "Alpha_out = sinW2_out*"<>SPhenoForm[leftCoupling] <>"**2/(4._dp*Pi) \n"];,
WriteString[file, "sinW2_out = 0.22290_dp \n"];
WriteString[file, "Alpha_out = Alpha \n"];

];
If[FreeQ[ParameterDefinitions,"Strong-Coupling"]==False,
WriteString[file, "AlphaS_out = "<>SPhenoForm[strongCoupling] <>"**2/(4._dp*Pi) \n"];,
WriteString[file, "AlphaS_out = AlphaS \n"];
];
WriteString[file,"End if \n\n"];
];
