#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

typedef struct{
	int cod;
	int tvsGrandes;
	int tvsPequenas;
} sVendas;

int main(){
	
	FILE * arq;
	sVendas vendas[100];
	int identificador=1, i, j, qtdeAluno, qtdeTelefone;
	
	arq = fopen("Vendas.dat", "r");
	
	fread(&vendas[0], sizeof(vendas[0]), 1, arq);
	while(!feof(arq)){
		fread(&vendas[identificador], sizeof(vendas[0]), 1, arq);
		identificador++;
	}
	
	fclose(arq);
	
	printf("ID Func.\t\tSalario Bruto\t\tSalario Liquido\n");
	
	for(i=0;i<identificador-1;i++){
		double salInicial=899.00, salBruto, salLiquido;
		salBruto = salInicial;
		if(vendas[i].tvsGrandes >= 10)
			salBruto += vendas[i].tvsGrandes * 50.00;
		else
			salBruto += vendas[i].tvsGrandes * 5.00;
		if(vendas[i].tvsPequenas >= 20)
			salBruto += vendas[i].tvsPequenas * 20.00;
		else
			salBruto += vendas[i].tvsPequenas * 2.00;
		if(salBruto-(salInicial*0.08) >= 900.0)
			salLiquido = ((salBruto-salInicial*0.08)*0.85);
		else
			salLiquido = salBruto-(salInicial*0.08);
		printf("\t\t%d\t\tR$\t%.2lf\t\t\tR$\t%.2lf\n", vendas[i].cod, salBruto, salLiquido);
	}
	
	return 0;
}