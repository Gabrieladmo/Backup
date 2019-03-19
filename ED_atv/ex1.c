#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

int main(){

	char disciplina[3], campus[3];
	int max, inscManha, inscTarde, inscNoite;
	double i;
	
	scanf("%s", disciplina);
	
	while(strcmp(disciplina,"XX") != 0){
		scanf(" %s %i %i %i %i", campus, &max, &inscManha, &inscTarde, &inscNoite);
		
		if(inscManha > 0){
			for(i=1.0;i<=ceil((double)inscManha/max);i++){
				if(i<9.01)
					printf("%s1%c%s ",disciplina,((int)i)+64,campus);
			}
		}
		if(inscTarde > 0){
			for(i=1.0;i<=ceil((double)inscTarde/max);i++){
				if(i<6.01)
					printf("%s2%c%s ",disciplina,((int)i)+73,campus);
			}
		}
		if(inscNoite > 0){
			for(i=1.0;i<=ceil((double)inscNoite/max);i++){
				if(i<11.01)
					printf("%s3%c%s ",disciplina,((int)i)+79,campus);
			}
		}
		
		printf("\n");
		
		scanf("%s", disciplina);
	}
	
	return 0;
}