#include "../sources/micromegas.h"
#include "lib/pmodel.h"
#include "lib/RandomNumbers.h"
#include <string>

using namespace std;

/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
/* MAIN PROGRAM 							     		    */
/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

int main(int argc, char** argv)
{  
		int err;
	   	char lspname[10], nlspname[10];
		double Omega=-1, Xf=-1;
				        

			err = sortOddParticles(lspname);	
			printMasses(stdout,1);				

			int fast = 1;			/* 0 = best accuracy, 1 = "fast option" accuracy ~1% 	     */
	  		double Beps = 1.E-5;  		/* Criteqrium for including co-annihilations (1 = no coann.) */
	 		Omega = darkOmega(&Xf,fast,Beps);



			printf("Xf=%.2e Omega=%.2e\n",Xf,Omega);
			double cut = 0.01;		// cut-off for channel output								
  			printChannels(Xf,cut,Beps,1,stdout);
			printf("\n");

                    

  	return 0;
}

