ProcessWrapper = True; 
NameProcess = "Gamma2l" 
ExternalFields = {bar[ChargedLepton], ChargedLepton, Photon}; 

SumContributionsOperators["Gamma2l"] = { 
{K1L, OA1L}, 
{K1R, OA1R}, 
{K2L, OA2lSL}, 
{K2R, OA2lSR}}; 

NormalizationOperators["Gamma2l"] ={
"K1L = K1L/sqrt(Alpha_MZ*4*Pi)",
"K1R = K1R/sqrt(Alpha_MZ*4*Pi)",
"K2L(2,:) = -0.5_dp*K2L(2,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(2)",
"K2L(3,:) = -0.5_dp*K2L(3,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(3)",
"K2R(2,:) = -0.5_dp*K2R(2,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(2)",
"K2R(3,:) = -0.5_dp*K2R(3,:)/sqrt(Alpha_MZ*4*Pi)/mf_l_mz(3)"
};


