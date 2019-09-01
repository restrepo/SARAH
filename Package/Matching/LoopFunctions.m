(* ::Package:: *)

Clear[A0,B0,B1,C0,D0,dB0,dB1]

SetAttributes[B0,Orderless];
SetAttributes[C0,Orderless];
SetAttributes[D0,Orderless];
Inf=Symbol["Inf"];
Inf::usage = "
In case of two vanishing masses
Inf[<Loopfunction>, <Mass1>^2,<Mass2>^2,..] 
is defined as 
Inf[_,0,0,__] = + Limit[Log[M^2/UVscaleQ^2],M->0]
Inf[Den^n,__] = + Limit[1/M^n,M->0]
";


A0[0]:=0;
A0[p2_]:=p2*(1+Log[UVscaleQ^2/p2]);

B0[0,0]:= -Inf[B0,0,0];
B0[m12_,m22_]:=1+Log[UVscaleQ^2/m22]+m12/(m12-m22)Log[m22/m12];
B0[m12_,m12_]:=Log[UVscaleQ^2/m12];
B0[m12_,0]:=1+Log[UVscaleQ^2/m12];

B1[0,m12_]:=-1/4 + Log[m12/UVscaleQ^2]/2
B1[m12_,0]:=1/4 (-3 + 2 Log[m12/UVscaleQ^2])
B1[m12_,m12_]:= 1/2 Log[m12/UVscaleQ^2]
B1[0,0]:=1/2 Inf[B1,0,0]
B1[m12_,m22_]:=Module[{t0},Return[1/2 Log[m12/UVscaleQ^2]+ (-3+4 t0 - t0^2 - 4 t0 Log[t0]+2t0^2 Log[t0])/(4(-1+t0)^2)/.t0->m22/m12]];

C0[m12_,0,0]:=1/m12 - Log[m12/UVscaleQ^2]/m12 + Inf[C0,m12,0,0]/m12;
C0[m12_,m22_,0]:=-(Log[m12/m22]/(m12-m22));
C0[m12_,m12_,0]:=-1/m12;
C0[0,0,0]:=-1/2 Inf[Den,C0];
C0[m12_,m22_,m32_]:=Module[{t1,t2},Return[(-1/m12)(-t1*Log[t1]+t1*t2*Log[t1]+t2*Log[t2]-t1*t2*Log[t2])/((-1+t1)*(t1-t2)*(-1+t2))/.{t1->m22/m12,t2->m32/m12}]];
C0[m12_,m12_,m22_]:=(-m12+m22+m22 Log[m12/m22])/(m12-m22)^2;
C0[m12_,m12_,m12_]:=-(1/(2 m12));



D0[m12_,m12_,0,0]:= -2/m12^2 + Log[m12/UVscaleQ^2]/m12^2 - Inf[D0,m12,m12,0,0]/m12^2 ;
D0[m12_,m22_,0,0]:= Log[m22/m12]/(m12(m12 - m22)) +  Log[m22/UVscaleQ^2]/(m12 m22) - Inf[D0,m12,m22,0,0]/(m12 m22);
D0[m12_,0,0,0]:= -Log[m12/UVscaleQ^2]/m12^2 + 1/m12^2 + 1/2 Inf[Den,D0]/m12 + Inf[D0,m12,0,0,0]/m12^2 ;
D0[0,0,0,0]:=1/6 Inf[Den^2,D0];
D0[m12_,m22_,m32_,0]:=((m22-m32) Log[m32/m12]+(-m12+m32) Log[m32/m22])/((m12-m22) (m12-m32) (m22-m32));
D0[m12_,m22_,m22_,0]:=(m12-m22+m22 Log[m22/m12])/((m12-m22)^2 m22);
D0[m12_,m12_,m12_,0]:=1/(2m12^2);

D0[m12_,m22_,m32_,m42_]:=1/(m12-m22)*(C0[m12,m32,m42]-C0[m22,m32,m42]);
D0[m12_,m12_,m22_,m22_]:=(-2 m12+2 m22 + (m12+m22)Log[m12/m22])/(m12-m22)^3;
D0[m12_,m22_,m32_,m32_]:=((m12-m32+m12 Log[m32/m12])/(m12-m32)^2+(-m22+m32-m22 Log[m32/m22])/(m22-m32)^2)/(m12-m22)
D0[m12_,m22_,m22_,m22_]:=(m12^2-m22^2+2 m12 m22 Log[m22/m12])/(2 (m12-m22)^3 m22)
D0[m12_,m12_,m12_,m12_]:=1/(6m12^2)


(* finite parts of the derivatives of B0 and B1 used for wave function renormalization constants *)
dB0[0,0]:=1/6 Inf[Den,dB0]
dB0[m12_,m22_]:=1/(2 (m12-m22)^2) (m12+m22+2 m12 m22/(m12-m22) Log[m22/m12])
dB0[m12_,m12_]:=1/(6m12)
dB0[m12_,0]:=1/(2m12)
dB0[0,m21_]:=1/(2m21)


dB1[0,0]:=-1/12 Inf[Den,dB1]
dB1[m12_,m22_]:=1/(6(m12-m22)^4) (-3m12^2 m22(2Log[m22/m12]+1)-2m12^3+6m12 m22^2-m22^3)
dB1[m2_,m2_]:=-1/(12m2)
dB1[0,m2_]:=-1/(6m2)
dB1[m2_,0]:=1/(3m2)

AnalyticLoopFunctions[expr_]:=Return[expr/.{
    A0i->A0,
    B0i[bb0,0,m1_,m2_]:>B0[m1,m2],
    B0i[bb1,0,m1_,m2_]:>B1[m1,m2],
    B0i[dbb0,0,m1_,m2_]:>dB0[m1,m2],
    B0i[dbb1,0,m1_,m2_]:>dB1[m1,m2],
    C0i[cc0,0,0,0,m1_,m2_,m3_]:>C0[m1,m2,m3],
    D0i[dd0,0,0,0,0,0,0,m1_,m2_,m3_,m4_]:>D0[m1,m2,m3,m4]
}];
