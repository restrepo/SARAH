
Generic1LoopAmp[WFR][diag][FF] = 
    -(B0i[bb1, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2]*
       (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
         C[Internal[1], Internal[2], External[2]][L] + 
        C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
         C[Internal[1], Internal[2], External[2]][R])) - 
     B0i[dbb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*M[Internal[1][IndexInternal[1]]]*
      (M[Internal[1][IndexInternal[1]]]*
        (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
          C[Internal[1], Internal[2], External[2]][L] + 
         C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
          C[Internal[1], Internal[2], External[2]][R]) + 
       M[Internal[2][IndexInternal[2]]]*
        (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
          C[Internal[1], Internal[2], External[2]][L] + 
         C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
          C[Internal[1], Internal[2], External[2]][R]))
 
Generic1LoopAmp[WFR][diag][GG] = 
    -(B0i[dbb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
        AntiField[Internal[2]], AntiField[Internal[1]]]*
       C[External[2], Internal[1], Internal[2]])/2
 
Generic1LoopAmp[WFR][diag][S] = 0
 
Generic1LoopAmp[WFR][diag][SS] = 
    (B0i[dbb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
       AntiField[Internal[1]], AntiField[Internal[2]]]*
      C[External[2], Internal[1], Internal[2]])/2
 
Generic1LoopAmp[WFR][diag][SV] = 16*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], Internal[2]]*
     (-B0i[bb1, 0, M[Internal[1][IndexInternal[1]]]^2, 
         M[Internal[2][IndexInternal[2]]]^2]/8 + 
      (B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
         M[Internal[2][IndexInternal[2]]]^2] + 
        B0i[dbb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
          M[Internal[2][IndexInternal[2]]]^2]*
         M[Internal[1][IndexInternal[1]]]^2)/16)
 
Generic1LoopAmp[WFR][diag][V] = 0
 
Generic1LoopAmp[WFR][diag][VV] = 
    2*B0i[dbb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
      AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], Internal[2]]
 
Generic1LoopAmp[WFR][offdiag][FF] = 2*Den[M[External[1][IndexExternal[1]]]^2, 
      M[External[2][IndexExternal[2]]]^2]*
     (A0i[M[Internal[2][IndexInternal[2]]]^2]*
       (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
         C[Internal[1], Internal[2], External[2]][L] + 
        C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
         C[Internal[1], Internal[2], External[2]][R]) + 
      B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2]*M[Internal[1][IndexInternal[1]]]*
       (M[Internal[1][IndexInternal[1]]]*
         (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
           C[Internal[1], Internal[2], External[2]][L] + 
          C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
           C[Internal[1], Internal[2], External[2]][R]) + 
        M[Internal[2][IndexInternal[2]]]*
         (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
           C[Internal[1], Internal[2], External[2]][L] + 
          C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
           C[Internal[1], Internal[2], External[2]][R])))
 
Generic1LoopAmp[WFR][offdiag][GG] = 
    B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
      AntiField[Internal[2]], AntiField[Internal[1]]]*
     C[External[2], Internal[1], Internal[2]]*
     Den[M[External[1][IndexExternal[1]]]^2, M[External[2][IndexExternal[2]]]^
       2]
 
Generic1LoopAmp[WFR][offdiag][S] = I*A0i[M[Internal[1][IndexInternal[1]]]^2]*
     C[External[1], External[2], AntiField[Internal[1]], Internal[1]]*
     Den[M[External[1][IndexExternal[1]]]^2, M[External[2][IndexExternal[2]]]^
       2]
 
Generic1LoopAmp[WFR][offdiag][SS] = 
    -(B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
       AntiField[Internal[1]], AntiField[Internal[2]]]*
      C[External[2], Internal[1], Internal[2]]*
      Den[M[External[1][IndexExternal[1]]]^2, 
       M[External[2][IndexExternal[2]]]^2])
 
Generic1LoopAmp[WFR][offdiag][SV] = -2*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], Internal[2]]*
     Den[M[External[1][IndexExternal[1]]]^2, M[External[2][IndexExternal[2]]]^
       2]*(A0i[M[Internal[2][IndexInternal[2]]]^2] + 
      B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2]*M[Internal[1][IndexInternal[1]]]^
        2)
 
Generic1LoopAmp[WFR][offdiag][V] = 
    (-4*I)*A0i[M[Internal[1][IndexInternal[1]]]^2]*
     C[External[1], External[2], AntiField[Internal[1]], Internal[1]]*
     Den[M[External[1][IndexExternal[1]]]^2, M[External[2][IndexExternal[2]]]^
       2]
 
Generic1LoopAmp[WFR][offdiag][VV] = 
    -4*B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
      AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], Internal[2]]*
     Den[M[External[1][IndexExternal[1]]]^2, M[External[2][IndexExternal[2]]]^
       2]

Generic1LoopAmp[T[2]][None] = C[External[1], External[2]]

Generic1LoopAmp[A[2]][S] = (I/2)*A0i[M[Internal[1][IndexInternal[1]]]^2]*
     C[External[1], External[2], AntiField[Internal[1]], Internal[1]]
 
Generic1LoopAmp[A[2]][V] = (-2*I)*A0i[M[Internal[1][IndexInternal[1]]]^2]*
     C[External[1], External[2], AntiField[Internal[1]], Internal[1]]
 
Generic1LoopAmp[B[2]][FF] = A0i[M[Internal[2][IndexInternal[2]]]^2]*
      (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
        C[Internal[1], Internal[2], External[2]][L] + 
       C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
        C[Internal[1], Internal[2], External[2]][R]) + 
     B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*M[Internal[1][IndexInternal[1]]]*
      (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
          AntiField[Internal[1]], External[1]][L]*
        C[Internal[1], Internal[2], External[2]][L] + 
       M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[2]], 
          AntiField[Internal[1]], External[1]][R]*
        C[Internal[1], Internal[2], External[2]][L] + 
       M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[2]], 
          AntiField[Internal[1]], External[1]][L]*
        C[Internal[1], Internal[2], External[2]][R] + 
       M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
          AntiField[Internal[1]], External[1]][R]*
        C[Internal[1], Internal[2], External[2]][R])
 
Generic1LoopAmp[B[2]][GG] = 
    (B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
       AntiField[Internal[2]], AntiField[Internal[1]]]*
      C[External[2], Internal[1], Internal[2]])/2
 
Generic1LoopAmp[B[2]][SS] = 
    -(B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
        AntiField[Internal[1]], AntiField[Internal[2]]]*
       C[External[2], Internal[1], Internal[2]])/2
 
Generic1LoopAmp[B[2]][SV] = -(C[External[1], AntiField[Internal[1]], 
       AntiField[Internal[2]]]*C[External[2], Internal[1], Internal[2]]*
      (A0i[M[Internal[2][IndexInternal[2]]]^2] + 
       B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
         M[Internal[2][IndexInternal[2]]]^2]*M[Internal[1][IndexInternal[1]]]^
         2))
 
Generic1LoopAmp[B[2]][VV] = 
    -2*B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*C[External[1], 
      AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], Internal[2]]
 
Generic1LoopAmp[B[3]][SS] = 
    (-3*B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*C[External[2], 
       AntiField[Internal[1]], AntiField[Internal[2]]]*
      C[External[1], External[3], Internal[1], Internal[2]])/2
 
Generic1LoopAmp[B[3]][VV] = 
    -6*B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*C[External[2], 
      AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[1], External[3], Internal[1], Internal[2]]
 
Generic1LoopAmp[T[3]][None] = (-I)*C[External[1], External[2], 
      External[3]]
 
Generic1LoopAmp[C[3]][FFF] = 
    (2*I)*(C0i[cc0, 0, 0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
         2]*M[Internal[1][IndexInternal[1]]]*
       ((M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][L] + 
          M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][R])*
         (M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[3]], 
             Internal[1], External[2]][L] + M[Internal[1][IndexInternal[1]]]*
           C[AntiField[Internal[3]], Internal[1], External[2]][R])*
         C[Internal[2], Internal[3], External[3]][L] + 
        (M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][L] + 
          M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][R])*
         (M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[3]], 
             Internal[1], External[2]][L] + M[Internal[3][IndexInternal[3]]]*
           C[AntiField[Internal[3]], Internal[1], External[2]][R])*
         C[Internal[2], Internal[3], External[3]][R]) + 
      B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2]*
       ((M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][R]*
           C[AntiField[Internal[3]], Internal[1], External[2]][L] + 
          M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][L]*
           C[AntiField[Internal[3]], Internal[1], External[2]][R] + 
          M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][R]*
           C[AntiField[Internal[3]], Internal[1], External[2]][R])*
         C[Internal[2], Internal[3], External[3]][L] + 
        (M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][L]*
           C[AntiField[Internal[3]], Internal[1], External[2]][L] + 
          M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][R]*
           C[AntiField[Internal[3]], Internal[1], External[2]][L] + 
          M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[1]], 
             AntiField[Internal[2]], External[1]][L]*
           C[AntiField[Internal[3]], Internal[1], External[2]][R])*
         C[Internal[2], Internal[3], External[3]][R]))
 
Generic1LoopAmp[C[3]][GGG] = 
    I*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], AntiField[Internal[3]], Internal[1]]*
     C[External[3], Internal[2], Internal[3]]*C0i[cc0, 0, 0, 0, 
      M[Internal[1][IndexInternal[1]]]^2, M[Internal[3][IndexInternal[3]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[C[3]][SSS] = 
    (-I)*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], Internal[2], Internal[3]]*C0i[cc0, 0, 0, 0, 
      M[Internal[1][IndexInternal[1]]]^2, M[Internal[3][IndexInternal[3]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[C[3]][SSV] = 
    (-I)*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], Internal[2], Internal[3]]*
     (B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2] + 
      C0i[cc0, 0, 0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[1][IndexInternal[1]]]^2, M[Internal[2][IndexInternal[2]]]^
         2]*M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[C[3]][SVV] = 
    I*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], Internal[2], Internal[3]]*
     (B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2] + 
      C0i[cc0, 0, 0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2, M[Internal[1][IndexInternal[1]]]^
         2]*M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[C[3]][VVV] = 
    (4*I)*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], Internal[2], Internal[3]]*C0i[cc0, 0, 0, 0, 
      M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[B[4][1]][SS] = 
    (-3*B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
       M[Internal[2][IndexInternal[2]]]^2]*C[External[1], External[2], 
       AntiField[Internal[1]], AntiField[Internal[2]]]*
      C[External[3], External[4], Internal[1], Internal[2]])/2
 
Generic1LoopAmp[B[4][1]][VV] = 
    -6*B0i[bb0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*C[External[1], External[2], 
      AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[3], External[4], Internal[1], Internal[2]]
 
Generic1LoopAmp[B[4][2][1]][SSS] = 
    (-3*I)*B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2]*C[External[2], External[4], 
      AntiField[Internal[1]]]*C[Internal[1], AntiField[Internal[2]], 
      AntiField[Internal[3]]]*C[External[1], External[3], Internal[2], 
      Internal[3]]*Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[B[4][2][1]][SSV] = 0
 
Generic1LoopAmp[B[4][2][1]][SVV] = 
    (-12*I)*B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2]*C[External[2], External[4], 
      AntiField[Internal[1]]]*C[Internal[1], AntiField[Internal[2]], 
      AntiField[Internal[3]]]*C[External[1], External[3], Internal[2], 
      Internal[3]]*Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[B[4][2][1]][VVV] = 0
 
Generic1LoopAmp[B[4][2][2]][SSS] = 
    (-6*I)*B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2]*C[External[2], External[4], 
      AntiField[Internal[1]]]*C[External[3], AntiField[Internal[2]], 
      AntiField[Internal[3]]]*C[External[1], Internal[1], Internal[2], 
      Internal[3]]*Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[B[4][2][2]][SVV] = 
    (-24*I)*B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2]*C[External[2], External[4], 
      AntiField[Internal[1]]]*C[External[3], AntiField[Internal[2]], 
      AntiField[Internal[3]]]*C[External[1], Internal[1], Internal[2], 
      Internal[3]]*Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[D][FFFF] = 
    3*(-2*B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
        M[Internal[4][IndexInternal[4]]]^2]*
       (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
         C[AntiField[Internal[4]], Internal[2], External[3]][R]*
         C[Internal[1], AntiField[Internal[3]], External[2]][R]*
         C[Internal[3], Internal[4], External[4]][L] + 
        C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
         C[AntiField[Internal[4]], Internal[2], External[3]][L]*
         C[Internal[1], AntiField[Internal[3]], External[2]][L]*
         C[Internal[3], Internal[4], External[4]][R]) - 
      2*D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2, M[Internal[4][IndexInternal[4]]]^
         2, M[Internal[2][IndexInternal[2]]]^2]*
       M[Internal[1][IndexInternal[1]]]*(M[Internal[3][IndexInternal[3]]]*
         (M[Internal[4][IndexInternal[4]]]*(M[Internal[2][IndexInternal[2]]]*
             C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][
              L] + M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][L] + 
          M[Internal[1][IndexInternal[1]]]*(M[Internal[1][IndexInternal[1]]]*
             C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][
              L] + M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][R])*
         C[Internal[1], AntiField[Internal[3]], External[2]][L]*
         C[Internal[3], Internal[4], External[4]][L] + 
        M[Internal[1][IndexInternal[1]]]*(M[Internal[4][IndexInternal[4]]]*
           (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][L] + 
            M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][L] + 
          M[Internal[1][IndexInternal[1]]]*(M[Internal[1][IndexInternal[1]]]*
             C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][
              L] + M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][R])*
         C[Internal[1], AntiField[Internal[3]], External[2]][R]*
         C[Internal[3], Internal[4], External[4]][L] + 
        M[Internal[1][IndexInternal[1]]]*(M[Internal[1][IndexInternal[1]]]*
           (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][L] + 
            M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][L] + 
          M[Internal[4][IndexInternal[4]]]*(M[Internal[1][IndexInternal[1]]]*
             C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][
              L] + M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][R])*
         C[Internal[1], AntiField[Internal[3]], External[2]][L]*
         C[Internal[3], Internal[4], External[4]][R] + 
        M[Internal[3][IndexInternal[3]]]*(M[Internal[1][IndexInternal[1]]]*
           (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][L] + 
            M[Internal[1][IndexInternal[1]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][L] + 
          M[Internal[4][IndexInternal[4]]]*(M[Internal[1][IndexInternal[1]]]*
             C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][
              L] + M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
               AntiField[Internal[1]], External[1]][R])*
           C[AntiField[Internal[4]], Internal[2], External[3]][R])*
         C[Internal[1], AntiField[Internal[3]], External[2]][R]*
         C[Internal[3], Internal[4], External[4]][R]) - 
      2*C0i[cc0, 0, 0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[4][IndexInternal[4]]]^2, M[Internal[2][IndexInternal[2]]]^
         2]*((M[Internal[1][IndexInternal[1]]]^2 + 
          M[Internal[3][IndexInternal[3]]]^2)*
         (C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][L]*
           C[AntiField[Internal[4]], Internal[2], External[3]][R]*
           C[Internal[1], AntiField[Internal[3]], External[2]][R]*
           C[Internal[3], Internal[4], External[4]][L] + 
          C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
           C[AntiField[Internal[4]], Internal[2], External[3]][L]*
           C[Internal[1], AntiField[Internal[3]], External[2]][L]*
           C[Internal[3], Internal[4], External[4]][R]) + 
        C[AntiField[Internal[2]], AntiField[Internal[1]], External[1]][R]*
         (M[Internal[3][IndexInternal[3]]]*(M[Internal[4][IndexInternal[4]]]*
             C[AntiField[Internal[4]], Internal[2], External[3]][L] + 
            M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[4]], 
               Internal[2], External[3]][R])*C[Internal[1], 
             AntiField[Internal[3]], External[2]][L]*
           C[Internal[3], Internal[4], External[4]][L] + 
          M[Internal[2][IndexInternal[2]]]*M[Internal[4][IndexInternal[4]]]*
           C[AntiField[Internal[4]], Internal[2], External[3]][R]*
           C[Internal[1], AntiField[Internal[3]], External[2]][L]*
           C[Internal[3], Internal[4], External[4]][R] + 
          M[Internal[1][IndexInternal[1]]]*C[Internal[1], 
             AntiField[Internal[3]], External[2]][R]*
           (M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[4]], 
               Internal[2], External[3]][L]*C[Internal[3], Internal[4], 
               External[4]][L] + M[Internal[2][IndexInternal[2]]]*
             C[AntiField[Internal[4]], Internal[2], External[3]][R]*
             C[Internal[3], Internal[4], External[4]][L] + 
            M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[4]], 
               Internal[2], External[3]][L]*C[Internal[3], Internal[4], 
               External[4]][R])) + C[AntiField[Internal[2]], 
           AntiField[Internal[1]], External[1]][L]*
         (M[Internal[2][IndexInternal[2]]]*M[Internal[4][IndexInternal[4]]]*
           C[AntiField[Internal[4]], Internal[2], External[3]][L]*
           C[Internal[1], AntiField[Internal[3]], External[2]][R]*
           C[Internal[3], Internal[4], External[4]][L] + 
          M[Internal[3][IndexInternal[3]]]*(M[Internal[2][IndexInternal[2]]]*
             C[AntiField[Internal[4]], Internal[2], External[3]][L] + 
            M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[4]], 
               Internal[2], External[3]][R])*C[Internal[1], 
             AntiField[Internal[3]], External[2]][R]*
           C[Internal[3], Internal[4], External[4]][R] + 
          M[Internal[1][IndexInternal[1]]]*C[Internal[1], 
             AntiField[Internal[3]], External[2]][L]*
           (M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[4]], 
               Internal[2], External[3]][R]*C[Internal[3], Internal[4], 
               External[4]][L] + M[Internal[2][IndexInternal[2]]]*
             C[AntiField[Internal[4]], Internal[2], External[3]][L]*
             C[Internal[3], Internal[4], External[4]][R] + 
            M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[4]], 
               Internal[2], External[3]][R]*C[Internal[3], Internal[4], 
               External[4]][R]))))
 
Generic1LoopAmp[D][GGGG] = -3*C[External[1], AntiField[Internal[2]], 
      AntiField[Internal[1]]]*C[External[2], Internal[1], 
      AntiField[Internal[3]]]*C[External[3], AntiField[Internal[4]], 
      Internal[2]]*C[External[4], Internal[3], Internal[4]]*
     D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[3][IndexInternal[3]]]^2, 
      M[Internal[4][IndexInternal[4]]]^2, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[D][SSSS] = 3*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], 
      AntiField[Internal[3]]]*C[External[3], Internal[2], 
      AntiField[Internal[4]]]*C[External[4], Internal[3], Internal[4]]*
     D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2, M[Internal[4][IndexInternal[4]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[D][SSSV] = 3*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], 
      AntiField[Internal[3]]]*C[External[3], Internal[2], 
      AntiField[Internal[4]]]*C[External[4], Internal[3], Internal[4]]*
     (C0i[cc0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
        2] + D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
        M[Internal[1][IndexInternal[1]]]^2, M[Internal[3][IndexInternal[3]]]^
         2, M[Internal[2][IndexInternal[2]]]^2]*
       M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[D][SSVV] = -3*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], 
      AntiField[Internal[3]]]*C[External[3], Internal[2], 
      AntiField[Internal[4]]]*C[External[4], Internal[3], Internal[4]]*
     (C0i[cc0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
        2] + D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2, M[Internal[1][IndexInternal[1]]]^
         2, M[Internal[2][IndexInternal[2]]]^2]*
       M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[D][SVVV] = 3*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], 
      AntiField[Internal[3]]]*C[External[3], Internal[2], 
      AntiField[Internal[4]]]*C[External[4], Internal[3], Internal[4]]*
     (C0i[cc0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
        2] + D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
         2, M[Internal[1][IndexInternal[1]]]^2]*
       M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[D][VVVV] = 12*C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], 
      AntiField[Internal[3]]]*C[External[3], Internal[2], 
      AntiField[Internal[4]]]*C[External[4], Internal[3], Internal[4]]*
     D0i[dd0, 0, 0, 0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^2, 
      M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[SB[4]][FFSS] = 
    3*C[External[1], External[2], AntiField[Internal[1]]]*
     C[External[3], External[4], AntiField[Internal[2]]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]*
     (-(A0i[M[Internal[4][IndexInternal[4]]]^2]*
        (C[AntiField[Internal[4]], AntiField[Internal[3]], Internal[1]][R]*
          C[Internal[3], Internal[4], Internal[2]][L] + 
         C[AntiField[Internal[4]], AntiField[Internal[3]], Internal[1]][L]*
          C[Internal[3], Internal[4], Internal[2]][R])) - 
      B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[4][IndexInternal[4]]]^2]*M[Internal[3][IndexInternal[3]]]*
       (M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[4]], 
           AntiField[Internal[3]], Internal[1]][L]*
         C[Internal[3], Internal[4], Internal[2]][L] + 
        M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[4]], 
           AntiField[Internal[3]], Internal[1]][R]*
         C[Internal[3], Internal[4], Internal[2]][L] + 
        M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[4]], 
           AntiField[Internal[3]], Internal[1]][L]*
         C[Internal[3], Internal[4], Internal[2]][R] + 
        M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[4]], 
           AntiField[Internal[3]], Internal[1]][R]*
         C[Internal[3], Internal[4], Internal[2]][R]))
 
Generic1LoopAmp[SB[4]][FFSV] = 0
 
Generic1LoopAmp[SB[4]][FFVV] = 0
 
Generic1LoopAmp[SB[4]][GGSS] = 
    (-3*B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
       M[Internal[4][IndexInternal[4]]]^2]*C[External[1], External[2], 
       AntiField[Internal[1]]]*C[External[3], External[4], 
       AntiField[Internal[2]]]*C[Internal[1], AntiField[Internal[4]], 
       AntiField[Internal[3]]]*C[Internal[2], Internal[3], Internal[4]]*
      Den[0, M[Internal[1][IndexInternal[1]]]^2]*
      Den[0, M[Internal[2][IndexInternal[2]]]^2])/2
 
Generic1LoopAmp[SB[4]][GGSV] = 0
 
Generic1LoopAmp[SB[4]][GGVV] = 0
 
Generic1LoopAmp[SB[4]][SSSS] = 
    (3*B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
       M[Internal[4][IndexInternal[4]]]^2]*C[External[1], External[2], 
       AntiField[Internal[1]]]*C[External[3], External[4], 
       AntiField[Internal[2]]]*C[Internal[1], AntiField[Internal[3]], 
       AntiField[Internal[4]]]*C[Internal[2], Internal[3], Internal[4]]*
      Den[0, M[Internal[1][IndexInternal[1]]]^2]*
      Den[0, M[Internal[2][IndexInternal[2]]]^2])/2
 
Generic1LoopAmp[SB[4]][SSSV] = 
    3*C[External[1], External[2], AntiField[Internal[1]]]*
     C[External[3], External[4], AntiField[Internal[2]]]*
     C[Internal[1], AntiField[Internal[3]], AntiField[Internal[4]]]*
     C[Internal[2], Internal[3], Internal[4]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]*
     (A0i[M[Internal[4][IndexInternal[4]]]^2] + 
      B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[4][IndexInternal[4]]]^2]*M[Internal[3][IndexInternal[3]]]^
        2)
 
Generic1LoopAmp[SB[4]][SSVV] = 
    6*B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
      M[Internal[4][IndexInternal[4]]]^2]*C[External[1], External[2], 
      AntiField[Internal[1]]]*C[External[3], External[4], 
      AntiField[Internal[2]]]*C[Internal[1], AntiField[Internal[3]], 
      AntiField[Internal[4]]]*C[Internal[2], Internal[3], Internal[4]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[SB[4]][SVVV] = 0
 
Generic1LoopAmp[SB[4]][VVVV] = 0
 
Generic1LoopAmp[SA[4]][SSS] = 
    ((-3*I)/2)*A0i[M[Internal[3][IndexInternal[3]]]^2]*
     C[External[1], External[2], AntiField[Internal[1]]]*
     C[External[3], External[4], AntiField[Internal[2]]]*
     C[Internal[1], Internal[2], AntiField[Internal[3]], Internal[3]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[SA[4]][SSV] = 
    (6*I)*A0i[M[Internal[3][IndexInternal[3]]]^2]*C[External[1], External[2], 
      AntiField[Internal[1]]]*C[External[3], External[4], 
      AntiField[Internal[2]]]*C[Internal[1], Internal[2], 
      AntiField[Internal[3]], Internal[3]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[SA[4]][SVV] = 0
 
Generic1LoopAmp[SA[4]][VVV] = 0
 
Generic1LoopAmp[T[4][1]][None] = (-I)*C[External[1], External[2], 
      External[3], External[4]]
 
Generic1LoopAmp[T[4][2]][S] = 3*C[External[1], External[2], 
      AntiField[Internal[1]]]*C[External[3], External[4], Internal[1]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[T[4][2]][V] = 0
 
Generic1LoopAmp[C[4][1]][SSS] = 
    (-6*I)*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], External[4], Internal[2], Internal[3]]*
     C0i[cc0, 0, 0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[C[4][1]][SSV] = 
    (-6*I)*C[External[1], AntiField[Internal[2]], AntiField[Internal[1]]]*
     C[External[2], AntiField[Internal[3]], Internal[1]]*
     C[External[3], External[4], Internal[2], Internal[3]]*
     (B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2] + 
      C0i[cc0, 0, 0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2, M[Internal[1][IndexInternal[1]]]^
         2]*M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[C[4][1]][SVV] = 
    (6*I)*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], External[4], Internal[2], Internal[3]]*
     (B0i[bb0, 0, M[Internal[2][IndexInternal[2]]]^2, 
       M[Internal[3][IndexInternal[3]]]^2] + 
      C0i[cc0, 0, 0, 0, M[Internal[1][IndexInternal[1]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
         2]*M[Internal[1][IndexInternal[1]]]^2)
 
Generic1LoopAmp[C[4][1]][VVV] = 
    (24*I)*C[External[1], AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[2], Internal[1], AntiField[Internal[3]]]*
     C[External[3], External[4], Internal[2], Internal[3]]*
     C0i[cc0, 0, 0, 0, M[Internal[1][IndexInternal[1]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmp[C[4][2]][FFFS] = 
    12*C[External[3], External[4], AntiField[Internal[1]]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     (-(C0i[cc0, 0, 0, 0, M[Internal[3][IndexInternal[3]]]^2, 
         M[Internal[2][IndexInternal[2]]]^2, M[Internal[4][IndexInternal[4]]]^
          2]*M[Internal[2][IndexInternal[2]]]*
        ((M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[2]], 
              AntiField[Internal[3]], External[1]][L] + 
           M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
              AntiField[Internal[3]], External[1]][R])*
          (M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[4]], 
              Internal[2], External[2]][L] + M[Internal[2][IndexInternal[2]]]*
            C[AntiField[Internal[4]], Internal[2], External[2]][R])*
          C[Internal[3], Internal[4], Internal[1]][L] + 
         (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
              AntiField[Internal[3]], External[1]][L] + 
           M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[2]], 
              AntiField[Internal[3]], External[1]][R])*
          (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[4]], 
              Internal[2], External[2]][L] + M[Internal[4][IndexInternal[4]]]*
            C[AntiField[Internal[4]], Internal[2], External[2]][R])*
          C[Internal[3], Internal[4], Internal[1]][R])) - 
      B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
        M[Internal[4][IndexInternal[4]]]^2]*
       ((M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[2]], 
             AntiField[Internal[3]], External[1]][R]*
           C[AntiField[Internal[4]], Internal[2], External[2]][L] + 
          M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[2]], 
             AntiField[Internal[3]], External[1]][L]*
           C[AntiField[Internal[4]], Internal[2], External[2]][R] + 
          M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
             AntiField[Internal[3]], External[1]][R]*
           C[AntiField[Internal[4]], Internal[2], External[2]][R])*
         C[Internal[3], Internal[4], Internal[1]][L] + 
        (M[Internal[2][IndexInternal[2]]]*C[AntiField[Internal[2]], 
             AntiField[Internal[3]], External[1]][L]*
           C[AntiField[Internal[4]], Internal[2], External[2]][L] + 
          M[Internal[3][IndexInternal[3]]]*C[AntiField[Internal[2]], 
             AntiField[Internal[3]], External[1]][R]*
           C[AntiField[Internal[4]], Internal[2], External[2]][L] + 
          M[Internal[4][IndexInternal[4]]]*C[AntiField[Internal[2]], 
             AntiField[Internal[3]], External[1]][L]*
           C[AntiField[Internal[4]], Internal[2], External[2]][R])*
         C[Internal[3], Internal[4], Internal[1]][R]))
 
Generic1LoopAmp[C[4][2]][FFFV] = 0
 
Generic1LoopAmp[C[4][2]][GGGS] = 
    -6*C[External[1], AntiField[Internal[2]], AntiField[Internal[3]]]*
     C[External[2], AntiField[Internal[4]], Internal[2]]*
     C[External[3], External[4], AntiField[Internal[1]]]*
     C[Internal[1], Internal[3], Internal[4]]*C0i[cc0, 0, 0, 0, 
      M[Internal[2][IndexInternal[2]]]^2, M[Internal[4][IndexInternal[4]]]^2, 
      M[Internal[3][IndexInternal[3]]]^2]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[C[4][2]][GGGV] = 0
 
Generic1LoopAmp[C[4][2]][SSSS] = 
    6*C[External[1], AntiField[Internal[2]], AntiField[Internal[3]]]*
     C[External[2], Internal[2], AntiField[Internal[4]]]*
     C[External[3], External[4], AntiField[Internal[1]]]*
     C[Internal[1], Internal[3], Internal[4]]*C0i[cc0, 0, 0, 0, 
      M[Internal[4][IndexInternal[4]]]^2, M[Internal[3][IndexInternal[3]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[C[4][2]][SSSV] = 
    6*C[External[1], AntiField[Internal[2]], AntiField[Internal[3]]]*
     C[External[2], Internal[2], AntiField[Internal[4]]]*
     C[External[3], External[4], AntiField[Internal[1]]]*
     C[Internal[1], Internal[3], Internal[4]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     (B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
       M[Internal[4][IndexInternal[4]]]^2] + 
      C0i[cc0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
        M[Internal[3][IndexInternal[3]]]^2, M[Internal[2][IndexInternal[2]]]^
         2]*M[Internal[2][IndexInternal[2]]]^2)
 
Generic1LoopAmp[C[4][2]][SSVV] = 
    -6*C[External[1], AntiField[Internal[2]], AntiField[Internal[3]]]*
     C[External[2], Internal[2], AntiField[Internal[4]]]*
     C[External[3], External[4], AntiField[Internal[1]]]*
     C[Internal[1], Internal[3], Internal[4]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     (B0i[bb0, 0, M[Internal[3][IndexInternal[3]]]^2, 
       M[Internal[4][IndexInternal[4]]]^2] + 
      C0i[cc0, 0, 0, 0, M[Internal[4][IndexInternal[4]]]^2, 
        M[Internal[2][IndexInternal[2]]]^2, M[Internal[3][IndexInternal[3]]]^
         2]*M[Internal[2][IndexInternal[2]]]^2)
 
Generic1LoopAmp[C[4][2]][SVVV] = 
    -24*C[External[1], AntiField[Internal[2]], AntiField[Internal[3]]]*
     C[External[2], Internal[2], AntiField[Internal[4]]]*
     C[External[3], External[4], AntiField[Internal[1]]]*
     C[Internal[1], Internal[3], Internal[4]]*C0i[cc0, 0, 0, 0, 
      M[Internal[4][IndexInternal[4]]]^2, M[Internal[3][IndexInternal[3]]]^2, 
      M[Internal[2][IndexInternal[2]]]^2]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmp[C[4][2]][VVVV] = 0
 
B0i /: B0i::usage = "B0i[id, p, m1, m2] is the generic two-point one-loop \
integral which\nincludes scalar and tensor coefficients as well as their \
derivatives\nwith respect to p, specified by id.  For example, B0i[bb0, ...] \
is the\nscalar function B_0, B0i[bb11, ...] the tensor coefficient \
function\nB_{11} etc.  p is the external momentum squared and m1 and m2 are \
the\nmasses squared."
 
C0i /: C0i::usage = "C0i[id, p1, p2, p1p2, m1, m2, m3] is the generic \
three-point one-loop\nintegral which includes both scalar and tensor \
coefficients, specified\nby id.  For example, C0i[cc0, ...] is the scalar \
function C_0,\nC0i[cc112, ...] the tensor coefficient function C_{112} etc.  \
p1, p2,\nand p1p2 are the external momenta squared and m1, m2, m3 are the \
masses\nsquared."
 
D0i /: D0i::usage = "D0i[id, p1, p2, p3, p4, p1p2, p2p3, m1, m2, m3, m4] is \
the generic\nfour-point one-loop integral which includes both scalar and \
tensor\ncoefficients, specified by id.  For example, D0i[dd0, ...] is the \
scalar\nfunction D_0, D0i[dd1233, ...] the tensor function D_{1233} etc. \
\np1...p4 are the external momenta squared, p1p2 and p2p3 are the squares\nof \
external momenta (1+2) and (2+3), respectively, and m1...m4 are the\nmasses \
squared."
Generic1LoopAmpMSDR[A[2]][V] = I*C[External[1], External[2], 
      AntiField[Internal[1]], Internal[1]]*M[Internal[1][IndexInternal[1]]]^2
 
Generic1LoopAmpMSDR[B[2]][VV] = C[External[1], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[2], Internal[1], Internal[2]]
 
Generic1LoopAmpMSDR[B[3]][VV] = 3*C[External[2], AntiField[Internal[1]], 
      AntiField[Internal[2]]]*C[External[1], External[3], Internal[1], 
      Internal[2]]
 
Generic1LoopAmpMSDR[B[4][1]][VV] = 3*C[External[1], External[2], 
      AntiField[Internal[1]], AntiField[Internal[2]]]*
     C[External[3], External[4], Internal[1], Internal[2]]
 
Generic1LoopAmpMSDR[B[4][2][1]][SVV] = (6*I)*C[External[2], External[4], 
      AntiField[Internal[1]]]*C[Internal[1], AntiField[Internal[2]], 
      AntiField[Internal[3]]]*C[External[1], External[3], Internal[2], 
      Internal[3]]*Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmpMSDR[B[4][2][2]][SVV] = (12*I)*C[External[2], External[4], 
      AntiField[Internal[1]]]*C[External[3], AntiField[Internal[2]], 
      AntiField[Internal[3]]]*C[External[1], Internal[1], Internal[2], 
      Internal[3]]*Den[0, M[Internal[1][IndexInternal[1]]]^2]
 
Generic1LoopAmpMSDR[SB[4]][SSVV] = 
    -3*C[External[1], External[2], AntiField[Internal[1]]]*
     C[External[3], External[4], AntiField[Internal[2]]]*
     C[Internal[1], AntiField[Internal[3]], AntiField[Internal[4]]]*
     C[Internal[2], Internal[3], Internal[4]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]
 
Generic1LoopAmpMSDR[SA[4]][SSV] = 
    (-3*I)*C[External[1], External[2], AntiField[Internal[1]]]*
     C[External[3], External[4], AntiField[Internal[2]]]*
     C[Internal[1], Internal[2], AntiField[Internal[3]], Internal[3]]*
     Den[0, M[Internal[1][IndexInternal[1]]]^2]*
     Den[0, M[Internal[2][IndexInternal[2]]]^2]*
     M[Internal[3][IndexInternal[3]]]^2
