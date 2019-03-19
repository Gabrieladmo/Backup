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
	
	int i;
	FILE * arq;
	sVendas vendas;
	
	arq = fopen("Vendas.dat", "w");
	
	for(i=0;i<20;i++){
		scanf("%d %d %d", &vendas.cod, &vendas.tvsGrandes, &vendas.tvsPequenas);
		fwrite(&vendas, sizeof(vendas), 1, arq);
	}
	
	fclose(arq);
	
	return 0;
}