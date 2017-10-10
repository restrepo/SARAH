NameProcess = "bsGamma";
NameObservables = {{BrBsGamma, 200, "BR(B->X_s gamma)"},
                   {ratioBsGamma, 201, "BR(B->X_s gamma)/BR(B->X_s gamma)_SM"}};

NeededOperators = {CC7, CC7p, CC8, CC8p,
                   CC7SM, CC7pSM, CC8SM, CC8pSM};

Body = "bsGamma.f90"; 

