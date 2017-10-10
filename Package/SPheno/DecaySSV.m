(* -------------------------------------- *) 
(* Topology Nr.1 *)
(* -------------------------------------- *)

(* 
{Topology -> 1, LoopParticles -> {F, F, F}, Amplitude -> {{LorPos[1], (-2*I)*coup1L*coup2R*coup3L*bb0[Mex3^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2L*coup3R*bb0[Mex3^2, ML2^2, ML3^2] - (4*I)*coup1L*coup2R*coup3L*ML1^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (4*I)*coup1R*coup2L*coup3R*ML1^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2R*coup3L*ML1*ML2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2L*coup3R*ML1*ML2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2L*coup3L*ML1*ML3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2R*coup3R*ML1*ML3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2R*coup3L*Mex2^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2L*coup3R*Mex2^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2R*coup3L*ML1^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2L*coup3R*ML1^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2R*coup3L*ML1*ML2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2L*coup3R*ML1*ML2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2L*coup3L*ML1*ML3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2R*coup3R*ML1*ML3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2L*coup3L*ML2*ML3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2R*coup3R*ML2*ML3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2R*coup3L*Mex1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2L*coup3R*Mex1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2R*coup3L*ML1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2L*coup3R*ML1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2R*coup3L*ML1*ML2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2L*coup3R*ML1*ML2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2L*coup3L*ML1*ML3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2R*coup3R*ML1*ML3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1R*coup2L*coup3L*ML2*ML3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1L*coup2R*coup3R*ML2*ML3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{F, F, F},1]={Internal[1][i1], AntiField[Internal[2]][i2], External[1][gt1]}; 
FieldOrder[S -> {S, V},1,{F, F, F},2]={Internal[3][i3], AntiField[Internal[1]][i1], External[2][gt2]}; 
FieldOrder[S -> {S, V},1,{F, F, F},3]={Internal[2][i2], AntiField[Internal[3]][i3], External[3][gt3]}; 
 

ExtraSign[S -> {S, V},1,{F, F, F},1]=1; 
ExtraSign[S -> {S, V},1,{F, F, F},2]=1; 
ExtraSign[S -> {S, V},1,{F, F, F},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {S, S, S}, Amplitude -> {{LorPos[1], (-2*I)*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{S, S, S},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{S, S, S},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {S, V},1,{S, S, S},3]={Internal[2][i2], AntiField[Internal[3]][i3], External[3][gt3]}; 
 

ExtraSign[S -> {S, V},1,{S, S, S},1]=1; 
ExtraSign[S -> {S, V},1,{S, S, S},2]=1; 
ExtraSign[S -> {S, V},1,{S, S, S},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {U, U, U}, Amplitude -> {{LorPos[1], I*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{U, U, U},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{U, U, U},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {S, V},1,{U, U, U},3]={Internal[2][i2], AntiField[Internal[3]][i3], External[3][gt3]}; 
 

ExtraSign[S -> {S, V},1,{U, U, U},1]=1; 
ExtraSign[S -> {S, V},1,{U, U, U},2]=1; 
ExtraSign[S -> {S, V},1,{U, U, U},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {V, V, V}, Amplitude -> {{LorPos[1], (-6*I)*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (6*I)*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (6*I)*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{V, V, V},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{V, V, V},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {S, V},1,{V, V, V},3]={External[3][gt3], Internal[2][i2], AntiField[Internal[3]][i3]}; 
 

ExtraSign[S -> {S, V},1,{V, V, V},1]=1; 
ExtraSign[S -> {S, V},1,{V, V, V},2]=1; 
ExtraSign[S -> {S, V},1,{V, V, V},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {S, S, V}, Amplitude -> {{LorPos[1], (-I)*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{S, S, V},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{S, S, V},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {S, V},1,{S, S, V},3]={Internal[2][i2], External[3][gt3], AntiField[Internal[3]][i3]}; 
 

ExtraSign[S -> {S, V},1,{S, S, V},1]=1; 
ExtraSign[S -> {S, V},1,{S, S, V},2]=-1; 
ExtraSign[S -> {S, V},1,{S, S, V},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {S, V, S}, Amplitude -> {{LorPos[1], I*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{S, V, S},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{S, V, S},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {S, V},1,{S, V, S},3]={AntiField[Internal[3]][i3], External[3][gt3], Internal[2][i2]}; 
 

ExtraSign[S -> {S, V},1,{S, V, S},1]=1; 
ExtraSign[S -> {S, V},1,{S, V, S},2]=1; 
ExtraSign[S -> {S, V},1,{S, V, S},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {V, S, S}, Amplitude -> {{LorPos[1], (-2*I)*coup1*coup2*coup3*ML1^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (8*I)*coup1*coup2*coup3*cc00[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*ML1^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (8*I)*coup1*coup2*coup3*Mex1^2*cc12[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (8*I)*coup1*coup2*coup3*Mex2^2*cc12[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (4*I)*coup1*coup2*coup3*Mex3^2*cc12[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (10*I)*coup1*coup2*coup3*Mex1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (6*I)*coup1*coup2*coup3*Mex2^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (6*I)*coup1*coup2*coup3*Mex3^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*ML1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (6*I)*coup1*coup2*coup3*Mex1^2*cc22[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*Mex2^2*cc22[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (2*I)*coup1*coup2*coup3*Mex3^2*cc22[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}, {LorPos[2], (-4*I)*coup1*coup2*coup3*Mex1^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (4*I)*coup1*coup2*coup3*Mex2^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (4*I)*coup1*coup2*coup3*Mex3^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (6*I)*coup1*coup2*coup3*Mex1^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (10*I)*coup1*coup2*coup3*Mex2^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (6*I)*coup1*coup2*coup3*Mex3^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*Mex1^2*cc11[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (6*I)*coup1*coup2*coup3*Mex2^2*cc11[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (2*I)*coup1*coup2*coup3*Mex3^2*cc11[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{V, S, S},1]={External[1][gt1], AntiField[Internal[2]][i2], Internal[1][i1]}; 
FieldOrder[S -> {S, V},1,{V, S, S},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {S, V},1,{V, S, S},3]={Internal[2][i2], AntiField[Internal[3]][i3], External[3][gt3]}; 
 

ExtraSign[S -> {S, V},1,{V, S, S},1]=1; 
ExtraSign[S -> {S, V},1,{V, S, S},2]=-1; 
ExtraSign[S -> {S, V},1,{V, S, S},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {S, V, V}, Amplitude -> {{LorPos[1], (-4*I)*coup1*coup2*coup3*bb0[Mex3^2, ML2^2, ML3^2] - I*coup1*coup2*coup3*Mex3^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (4*I)*coup1*coup2*coup3*ML1^2*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (4*I)*coup1*coup2*coup3*cc00[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*Mex1^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*Mex2^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (2*I)*coup1*coup2*coup3*Mex3^2*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (4*I)*coup1*coup2*coup3*Mex1^2*cc12[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (4*I)*coup1*coup2*coup3*Mex2^2*cc12[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - (2*I)*coup1*coup2*coup3*Mex3^2*cc12[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*Mex1^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*Mex2^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (2*I)*coup1*coup2*coup3*Mex3^2*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (3*I)*coup1*coup2*coup3*Mex1^2*cc22[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*Mex2^2*cc22[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*Mex3^2*cc22[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}, {LorPos[2], I*coup1*coup2*coup3*Mex1^2*cc11[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + (3*I)*coup1*coup2*coup3*Mex2^2*cc11[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*Mex3^2*cc11[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{S, V, V},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{S, V, V},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {S, V},1,{S, V, V},3]={External[3][gt3], Internal[2][i2], AntiField[Internal[3]][i3]}; 
 

ExtraSign[S -> {S, V},1,{S, V, V},1]=1; 
ExtraSign[S -> {S, V},1,{S, V, V},2]=-1; 
ExtraSign[S -> {S, V},1,{S, V, V},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {V, S, V}, Amplitude -> {{LorPos[1], (-2*I)*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] - I*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{V, S, V},1]={External[1][gt1], AntiField[Internal[2]][i2], Internal[1][i1]}; 
FieldOrder[S -> {S, V},1,{V, S, V},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {S, V},1,{V, S, V},3]={Internal[2][i2], External[3][gt3], AntiField[Internal[3]][i3]}; 
 

ExtraSign[S -> {S, V},1,{V, S, V},1]=1; 
ExtraSign[S -> {S, V},1,{V, S, V},2]=1; 
ExtraSign[S -> {S, V},1,{V, S, V},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {V, V, S}, Amplitude -> {{LorPos[1], (2*I)*coup1*coup2*coup3*cc0[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*cc1[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2] + I*coup1*coup2*coup3*cc2[Mex2^2, Mex3^2, Mex1^2, ML1^2, ML3^2, ML2^2]}}}
*) 
FieldOrder[S -> {S, V},1,{V, V, S},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {S, V},1,{V, V, S},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {S, V},1,{V, V, S},3]={AntiField[Internal[3]][i3], External[3][gt3], Internal[2][i2]}; 
 

ExtraSign[S -> {S, V},1,{V, V, S},1]=1; 
ExtraSign[S -> {S, V},1,{V, V, S},2]=-1; 
ExtraSign[S -> {S, V},1,{V, V, S},3]=1; 
 

(* -------------------------------------- *) 
(* Topology Nr.2 *)
(* -------------------------------------- *)

(* 
{Topology -> 2, LoopParticles -> {S, V}, Amplitude -> {{LorPos[1], (-I)*coup1*coup2*bb0[Mex1^2, ML1^2, ML2^2] + I*coup1*coup2*bb1[Mex1^2, ML1^2, ML2^2]}}}
*) 
(* -------------------------------------- *) 
(* Topology Nr.3 *)
(* -------------------------------------- *)

(* 
{Topology -> 3, LoopParticles -> {S, V}, Amplitude -> {{LorPos[1], I*coup1*coup2*bb0[Mex2^2, ML1^2, ML2^2] - I*coup1*coup2*bb1[Mex2^2, ML1^2, ML2^2]}}}
*) 
(* -------------------------------------- *) 
(* Topology Nr.4 *)
(* -------------------------------------- *)

(* 
{Topology -> 4, LoopParticles -> {S, S}, Amplitude -> {1, 0}}
*) 
(* 
{Topology -> 4, LoopParticles -> {V, V}, Amplitude -> {1, 0}}
*) 
