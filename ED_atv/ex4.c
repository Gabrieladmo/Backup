#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

int main(){
	
	int PecaMes[3][3], GranaPeca[3][2], GranaMes[3][2], i, j;
	
	for(i=0;i<3;i++){
		for(j=0;j<3;j++){
			scanf("%d", &PecaMes[i][j]);
		}
	}
	
	for(i=0;i<3;i++){
		for(j=0;j<2;j++){
			scanf("%d", &GranaPeca[i][j]);
		}
	}
	
	for(i=0;i<3;i++){
		GranaMes[i][0] = PecaMes[i][0] * GranaPeca[0][0] + PecaMes[i][1] * GranaPeca[1][0] + PecaMes[i][2] * GranaPeca[2][0];
		GranaMes[i][1] = PecaMes[i][0] * GranaPeca[0][1] + PecaMes[i][1] * GranaPeca[1][1] + PecaMes[i][2] * GranaPeca[2][1];
	}
	
	printf("Matriz GranaMes:\n\n");
	printf("\tCusto\tLucro\n");
	printf("Jan:\t%d\t%d\n", GranaMes[0][0], GranaMes[0][1]);
	printf("Fev:\t%d\t%d\n", GranaMes[1][0], GranaMes[1][1]);
	printf("Mar:\t%d\t%d\n", GranaMes[2][0], GranaMes[2][1]);
	
	return 0;
}