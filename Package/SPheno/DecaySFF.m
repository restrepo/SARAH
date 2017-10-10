(* -------------------------------------- *) 
(* Topology Nr.1 *)
(* -------------------------------------- *)

(* 
{Topology -> 1, LoopParticles -> {F, F, S}, Amplitude -> {{LorPos[1], I*coup1L*coup2R*coup3R*bb0[Mex3^2, ML2^2, ML3^2] - I*coup1L*coup2L*coup3R*Mex2*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2R*coup3L*Mex3*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2R*coup3R*ML1^2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2R*coup3R*ML1*ML2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2R*coup3R*Mex1^2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1L*coup2L*coup3R*Mex2*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2R*coup3L*Mex3*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1R*coup2L*coup3R*Mex2*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2R*coup3L*Mex3*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2R*coup3R*Mex2^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1R*coup2L*coup3L*Mex2*Mex3*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1L*coup2L*coup3R*Mex2*ML1*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1R*coup2L*coup3R*Mex2*ML2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2]}, {LorPos[2], I*coup1R*coup2L*coup3L*bb0[Mex3^2, ML2^2, ML3^2] - I*coup1R*coup2R*coup3L*Mex2*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2L*coup3R*Mex3*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2L*coup3L*ML1^2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2L*coup3L*ML1*ML2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2L*coup3L*Mex1^2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1R*coup2R*coup3L*Mex2*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1L*coup2L*coup3R*Mex3*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1L*coup2R*coup3L*Mex2*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2L*coup3R*Mex3*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + I*coup1R*coup2L*coup3L*Mex2^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1L*coup2R*coup3R*Mex2*Mex3*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1R*coup2R*coup3L*Mex2*ML1*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - I*coup1L*coup2R*coup3L*Mex2*ML2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2]}}}
*) 
FieldOrder[S -> {F, F},1,{F, F, S},1]={Internal[1][i1], AntiField[Internal[2]][i2], External[1][gt1]}; 
FieldOrder[S -> {F, F},1,{F, F, S},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {F, F},1,{F, F, S},3]={Internal[2][i2], External[3][gt3], AntiField[Internal[3]][i3]}; 
 

ExtraSign[S -> {F, F},1,{F, F, S},1]=1; 
ExtraSign[S -> {F, F},1,{F, F, S},2]=1; 
ExtraSign[S -> {F, F},1,{F, F, S},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {S, S, F}, Amplitude -> {{LorPos[1], I*coup1*coup2R*coup3R*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*Mex2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}, {LorPos[2], I*coup1*coup2L*coup3L*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*Mex2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}}}
*) 
FieldOrder[S -> {F, F},1,{S, S, F},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {F, F},1,{S, S, F},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {F, F},1,{S, S, F},3]={AntiField[Internal[3]][i3], External[3][gt3], Internal[2][i2]}; 
 

ExtraSign[S -> {F, F},1,{S, S, F},1]=1; 
ExtraSign[S -> {F, F},1,{S, S, F},2]=1; 
ExtraSign[S -> {F, F},1,{S, S, F},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {F, F, V}, Amplitude -> {{LorPos[1], (2*I)*coup1R*coup2L*coup3R*Finite - (4*I)*coup1R*coup2L*coup3R*bb0[Mex3^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2R*coup3R*Mex2*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1L*coup2L*coup3L*Mex3*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (4*I)*coup1R*coup2L*coup3R*ML1^2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (4*I)*coup1L*coup2L*coup3R*ML1*ML2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (4*I)*coup1R*coup2L*coup3R*Mex1^2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2R*coup3R*Mex2*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1L*coup2L*coup3L*Mex3*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2R*coup3R*Mex2*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1R*coup2L*coup3L*Mex3*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2L*coup3R*Mex1^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2L*coup3R*Mex2^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1R*coup2L*coup3R*Mex3^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2R*coup3R*Mex2*ML1*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2R*coup3R*Mex2*ML2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2]}, {LorPos[2], (2*I)*coup1L*coup2R*coup3L*Finite - (4*I)*coup1L*coup2R*coup3L*bb0[Mex3^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2L*coup3L*Mex2*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1R*coup2R*coup3R*Mex3*ML1*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (4*I)*coup1L*coup2R*coup3L*ML1^2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (4*I)*coup1R*coup2R*coup3L*ML1*ML2*cc0[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (4*I)*coup1L*coup2R*coup3L*Mex1^2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2L*coup3L*Mex2*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1R*coup2R*coup3R*Mex3*ML1*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2L*coup3L*Mex2*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1L*coup2R*coup3R*Mex3*ML2*cc1[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2R*coup3L*Mex1^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2R*coup3L*Mex2^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] + (2*I)*coup1L*coup2R*coup3L*Mex3^2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1L*coup2L*coup3L*Mex2*ML1*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2] - (2*I)*coup1R*coup2L*coup3L*Mex2*ML2*cc2[Mex1^2, Mex3^2, Mex2^2, ML1^2, ML2^2, ML3^2]}}}
*) 
FieldOrder[S -> {F, F},1,{F, F, V},1]={Internal[1][i1], AntiField[Internal[2]][i2], External[1][gt1]}; 
FieldOrder[S -> {F, F},1,{F, F, V},2]={External[2][gt2], AntiField[Internal[1]][i1], Internal[3][i3]}; 
FieldOrder[S -> {F, F},1,{F, F, V},3]={Internal[2][i2], External[3][gt3], AntiField[Internal[3]][i3]}; 
 

ExtraSign[S -> {F, F},1,{F, F, V},1]=1; 
ExtraSign[S -> {F, F},1,{F, F, V},2]=1; 
ExtraSign[S -> {F, F},1,{F, F, V},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {S, V, F}, Amplitude -> {{LorPos[1], I*coup1*coup2R*coup3R*bb0[Mex3^2, ML3^2, ML2^2] - I*coup1*coup2R*coup3R*Mex2^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3R*ML1^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - (2*I)*coup1*coup2L*coup3R*Mex2*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3L*Mex3*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3L*Mex2*Mex3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*Mex2*ML3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3R*Mex1^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3R*Mex2^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - (2*I)*coup1*coup2L*coup3L*Mex2*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*Mex3*ML3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}, {LorPos[2], I*coup1*coup2L*coup3L*bb0[Mex3^2, ML3^2, ML2^2] - I*coup1*coup2L*coup3L*Mex2^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3L*ML1^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - (2*I)*coup1*coup2R*coup3L*Mex2*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3R*Mex3*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3R*Mex2*Mex3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*Mex2*ML3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3L*Mex1^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3L*Mex2^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - (2*I)*coup1*coup2R*coup3R*Mex2*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*Mex3*ML3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}}}
*) 
FieldOrder[S -> {F, F},1,{S, V, F},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {F, F},1,{S, V, F},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {F, F},1,{S, V, F},3]={AntiField[Internal[3]][i3], External[3][gt3], Internal[2][i2]}; 
 

ExtraSign[S -> {F, F},1,{S, V, F},1]=-1; 
ExtraSign[S -> {F, F},1,{S, V, F},2]=1; 
ExtraSign[S -> {F, F},1,{S, V, F},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {V, S, F}, Amplitude -> {{LorPos[1], (-I)*coup1*coup2L*coup3R*bb0[Mex3^2, ML3^2, ML2^2] + I*coup1*coup2L*coup3R*Mex2^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*ML1^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3R*Mex2*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2L*coup3L*Mex3*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2L*coup3R*Mex1^2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3R*Mex2^2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2R*coup3L*Mex2*Mex3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - (2*I)*coup1*coup2L*coup3R*Mex3^2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3R*Mex2*ML3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*Mex1^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3R*Mex2^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3L*Mex2*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3R*Mex3^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3L*Mex3*ML3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}, {LorPos[2], (-I)*coup1*coup2R*coup3L*bb0[Mex3^2, ML3^2, ML2^2] + I*coup1*coup2R*coup3L*Mex2^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*ML1^2*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2L*coup3L*Mex2*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2R*coup3R*Mex3*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2R*coup3L*Mex1^2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3L*Mex2^2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2L*coup3R*Mex2*Mex3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - (2*I)*coup1*coup2R*coup3L*Mex3^2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3L*Mex2*ML3*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*Mex1^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3L*Mex2^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2L*coup3R*Mex2*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] - I*coup1*coup2R*coup3L*Mex3^2*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + I*coup1*coup2R*coup3R*Mex3*ML3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}}}
*) 
FieldOrder[S -> {F, F},1,{V, S, F},1]={External[1][gt1], AntiField[Internal[2]][i2], Internal[1][i1]}; 
FieldOrder[S -> {F, F},1,{V, S, F},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {F, F},1,{V, S, F},3]={AntiField[Internal[3]][i3], External[3][gt3], Internal[2][i2]}; 
 

ExtraSign[S -> {F, F},1,{V, S, F},1]=-1; 
ExtraSign[S -> {F, F},1,{V, S, F},2]=1; 
ExtraSign[S -> {F, F},1,{V, S, F},3]=1; 
 

(* 
{Topology -> 1, LoopParticles -> {V, V, F}, Amplitude -> {{LorPos[1], (4*I)*coup1*coup2L*coup3R*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2R*coup3R*Mex2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2L*coup3L*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}, {LorPos[2], (4*I)*coup1*coup2R*coup3L*ML3*cc0[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2L*coup3L*Mex2*cc1[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2] + (2*I)*coup1*coup2R*coup3R*Mex3*cc2[Mex2^2, Mex1^2, Mex3^2, ML3^2, ML1^2, ML2^2]}}}
*) 
FieldOrder[S -> {F, F},1,{V, V, F},1]={External[1][gt1], Internal[1][i1], AntiField[Internal[2]][i2]}; 
FieldOrder[S -> {F, F},1,{V, V, F},2]={External[2][gt2], Internal[3][i3], AntiField[Internal[1]][i1]}; 
FieldOrder[S -> {F, F},1,{V, V, F},3]={AntiField[Internal[3]][i3], External[3][gt3], Internal[2][i2]}; 
 

ExtraSign[S -> {F, F},1,{V, V, F},1]=1; 
ExtraSign[S -> {F, F},1,{V, V, F},2]=1; 
ExtraSign[S -> {F, F},1,{V, V, F},3]=1; 
 

(* -------------------------------------- *) 
(* Topology Nr.2 *)
(* -------------------------------------- *)

(* -------------------------------------- *) 
(* Topology Nr.3 *)
(* -------------------------------------- *)

(* -------------------------------------- *) 
(* Topology Nr.4 *)
(* -------------------------------------- *)

