#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

double areaTri(double f1, double f2, double f3){
	
	double p, area;
	
	p = (f1+f2+f3)/2;
	
	area = sqrt(p*(p-f1)*(p-f2)*(p-f3));
	
	return area;
	
}

void tipoTri(double f1, double f2, double f3){
	
	if(f1 > 0.0 && f2 > 0.0 && f3 > 0.0){
		if(f1 < f2+f3 && f2 < f1+f3 && f3 < f1+f2){
			printf("Tipo: ");
			if(f1 == f2 && f3 == f1){
				printf("Equilatero\t");
			}else if(f1 != f2 && f3 != f2){
				printf("Escaleno\t\t");
			}else if((f1 == f2 && f1 != f3) || (f1 == f3 && f1 != f2) || (f2 == f3 && f2 != f1)){
				printf("Isosceles\t\t");
			}
			printf("Area: %.3lf\n", areaTri(f1,f2,f3));
		}else{
			printf("%.3lf %.3lf %.3lf nao formam um triangulo\n", f1, f2, f3);
		}
	}else{
		printf("%.3lf %.3lf %.3lf nao formam um triangulo\n", f1, f2, f3);
	}
}

int main(){
	
	double matriz[12][3];
	int i, j, k;
	
	for(i=0;i<12;i++){
		for(j=0;j<3;j++){
			scanf("%lf", &matriz[i][j]);
		}
	}
	
	for(i=0;i<12;i++){
		for(j=0;j<3;j++){
			for(k=0;k<2;k++){
				if(matriz[i][k] > matriz[i][k+1]){
					double temp;
					temp = matriz[i][k+1];
					matriz[i][k+1] = matriz[i][k];
					matriz[i][k] = temp;
				}
			}
		}
	}
	
	for(i=0;i<12;i++){
		tipoTri(matriz[i][0], matriz[i][1], matriz[i][2]);
	}
	
	return 0;
}