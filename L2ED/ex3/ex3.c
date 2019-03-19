/*
	Autores: Gabriel Giovani Felicidade 0030481711046
			 Gabriela Domingues Mendes de Oliveira 0030481711010
	
	Exercício 3 da lista 2
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void mergeSort(int *, int, int);
void merge(int *, int, int, int);

int main(){
	
	int inteiros[100000];
	int qtde = 0, num, i;
	
	while(scanf("%d", &num), num != -999){
		inteiros[qtde++] = num;
	}
	
	mergeSort(inteiros, 0, qtde-1);
	
	for(i=0;i<qtde;i++){
		if(i == qtde-1){
			printf("%d\n", inteiros[i]);
		}else{
			printf("%d ", inteiros[i]);
		}
	}
	
	return 0;
}

void mergeSort(int *V, int inicio, int fim){
	int meio;
	if(inicio < fim){
		meio = floor((inicio+fim)/2);
		mergeSort(V, inicio, meio);
		mergeSort(V, meio+1, fim);
		merge(V, inicio, meio, fim);
	}
}

void merge(int *V, int inicio, int meio, int fim){
	int *temp, p1, p2, tamanho, i, j, k;
	int fim1 = 0, fim2 = 0;
	tamanho = fim-inicio+1;
	p1 = inicio;
	p2 = meio+1;
	temp = (int *) malloc(tamanho*sizeof(int));
	if(temp != NULL){
		for(i=0;i<tamanho;i++){
			if(fim1 == 0 && fim2 == 0){
				if(V[p1] < V[p2]){
					temp[i] = V[p1++];
				}else{
					temp[i] = V[p2++];
				}
				if(p1 > meio)
					fim1 = 1;
				if(p2 > fim)
					fim2 = 1;
			}else{
				if(fim1 == 0){
					temp[i] = V[p1++];
				}else{
					temp[i] = V[p2++];
				}
			}
		}
		for(j=0, k=inicio;j<tamanho;j++, k++)
			V[k] = temp[j];
		free(temp);
	}
}