Print["MSSM/CPV"];
debugFile=OpenWrite["../Debugs/debug_file_MSSM-CPV.txt"];
$Output = {debugFile};
AppendTo[$Messages,{debugFile}];
<<SARAH.m
Off[Superpotential::MaybeChargeViolation];
Off[Superpotential::ViolationGlobal];
Off[TeXOutput::NoRGEs];
Off[TeXOutput::NoLoops];
Start["MSSM/CPV"];
MakeAll[IncludeWHIZARD->False];
MakeTeX[];
Exit;
