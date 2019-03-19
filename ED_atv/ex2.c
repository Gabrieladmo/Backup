#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

int main(){

	char sexo;
	double altura;
	int circunferencia, iac;
	
	scanf("%c", &sexo);
	
	while(sexo != 'X'){
		
		scanf("%d %lf", &circunferencia, &altura);
		
		iac = (circunferencia/(altura*sqrt(altura)))-18;
		
		if(sexo == 'M'){
			if(iac >= 6.0 && iac < 11.0){
				printf("Excepcionalmente baixa\n");
			}else if(iac >= 11.0 && iac < 15.0){
				printf("Baixa\n");
			}else if(iac >= 15.0 && iac < 19.0){
				printf("Ideal\n");
			}else if(iac >= 19.0 && iac <= 25.0){
				printf("Moderada\n");
			}else if(iac > 25.0){
				printf("Excesso de gordura\n");
			}
		}else{
			if(iac >= 10.0 && iac < 16.0){
				printf("Excepcionalmente baixa\n");
			}else if(iac >= 16.0 && iac < 20.0){
				printf("Baixa\n");
			}else if(iac >= 20.0 && iac < 26.0){
				printf("Ideal\n");
			}else if(iac >= 26.0 && iac <= 30.0){
				printf("Moderada\n");
			}else if(iac > 30.0){
				printf("Excesso de gordura\n");
			}
		}
		
		scanf(" %c", &sexo);
	}
	
	return 0;
}