#include "../sources/micromegas.h"
#include "lib/pmodel.h"
#include"../sources/micromegas_aux.h"
#include <string>

using namespace std;

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
/* MAIN PROGRAM for two dark-matter candidates (by F.Staub, last change 04.05.2015)			     		    */
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

int main(int argc, char** argv)
{  
		int err, i;
	   	char lspname[10], nlspname[10];
		double Omega=-1, Xf=-1;
		double w;
		double cut = 0.01;		// cut-off for channel output								
		int fast = 1;			/* 0 = best accuracy, 1 = "fast option" accuracy ~1% 	     */
 		double Beps = 1.E-5;  		/* Criteqrium for including co-annihilations (1 = no coann.) */
 		VZdecay=0; VWdecay=0; cleanDecayTable();
		ForceUG=1; 
			err = sortOddParticles(lspname);	
			printMasses(stdout,1);				
	 		Omega = darkOmega2(fast,Beps);
                        printf("Omega_1h^2=%.2E\n", Omega*(1-fracCDM2));
                        printf("Omega_2h^2=%.2E\n", Omega*fracCDM2);			
			printf("\n");
// 			printChannels(Xf, cut,Beps,1,stdout);
			FILE *omega = fopen("omg.out","w");
			fprintf(omega,"%i %6.6lf # total relic density \n",1,Omega);
			fprintf(omega,"%i %6.6lf # relic density for CDM1\n", 2,Omega*(1-fracCDM2));
			fprintf(omega,"%i %6.6lf # relic density for CDM2\n", 3,Omega*fracCDM2);			
// 			w = 1.;
// 			i = 0;
// 			while (w>cut) 
// 			{
// 			    fprintf(omega,"%i %6.6lf # %s %s -> %s %s\n",100+i,omegaCh[i].weight,omegaCh[i].prtcl[0],omegaCh[i].prtcl[1],omegaCh[i].prtcl[2],omegaCh[i].prtcl[3]);
// 			    i++;
// 			    w = omegaCh[i].weight;
// 			}
// 			FILE *channels = fopen("channels.out","w");
// 			w = 1.;
// 			i = 0;
// 			while (w>cut) 
// 			{
// 			fprintf(channels,"%li %li %li %li %6.6lf # %s %s -> %s %s\n",pNum(omegaCh[i].prtcl[0]),pNum(omegaCh[i].prtcl[1]),pNum(omegaCh[i].prtcl[2]),pNum(omegaCh[i].prtcl[3]),omegaCh[i].weight,omegaCh[i].prtcl[0],omegaCh[i].prtcl[1],omegaCh[i].prtcl[2],omegaCh[i].prtcl[3]);
// 			    i++;
// 			    w = omegaCh[i].weight;
// 			}
			fclose(omega);
// 			fclose(channels);

                  

  	return 0;
}

