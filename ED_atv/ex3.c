#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

typedef struct {
	int dia;
	int mes;
	int ano;
} Data;

int main(){
	
	int a, s, m, diaSemana;
	Data entrada;
	
	scanf("%d %d %d", &entrada.dia, &entrada.mes, &entrada.ano);
	
	while(entrada.dia != 0 && entrada.mes != 0 && entrada.ano != 0){
		
		a = entrada.ano%100;
		s = entrada.ano/100;
		if(entrada.mes == 1 || entrada.mes == 2){
			m = entrada.mes+10;
			if(a == 0){
				s = s - 1;
				a = 99;
			}else{
				a = a - 1;
			}
		}else{
			m = entrada.mes-2;
		}
		
		diaSemana = ( (int)(2.6 * m - 0.1) + entrada.dia + a + a / 4 + s / 4 - 2 * s ) % 7;
		
		if(diaSemana < 0){
			diaSemana += 7;
		}
		
		printf("%02d/%02d/%d: ", entrada.dia, entrada.mes, entrada.ano);
		
		if(diaSemana == 0){
			printf("Domingo\n");
		}else if(diaSemana == 1){
			printf("Segunda-Feira\n");
		}else if(diaSemana == 2){
			printf("Terca-Feira\n");
		}else if(diaSemana == 3){
			printf("Quarta-Feira\n");
		}else if(diaSemana == 4){
			printf("Quinta-Feira\n");
		}else if(diaSemana == 5){
			printf("Sexta-Feira\n");
		}else{
			printf("Sabado\n");
		}
		
		scanf(" %d %d %d", &entrada.dia, &entrada.mes, &entrada.ano);
	}
	
	return 0;
}