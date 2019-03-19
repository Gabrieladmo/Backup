#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

typedef struct{
	char nome[101];
	char part[4];
	int tam;
	int indice;
} sParticipantes;

int comp(const void *p1, const void *p2){
	sParticipantes *s1 = (sParticipantes*) p1;
	sParticipantes *s2 = (sParticipantes*) p2;
	
	if(strcmp(s1->part, s2->part) > 0){
		return -1;
	}else if(strcmp(s1->part, s2->part) < 0){
		return 1;
	}else{
		return strcmp(s1->nome, s2->nome);
	}
}

int comp2(const void *p1, const void *p2){
	sParticipantes *s1 = (sParticipantes*) p1;
	sParticipantes *s2 = (sParticipantes*) p2;
	
	if(strcmp(s1->part, s2->part) > 0){
		return -1;
	}else if(strcmp(s1->part, s2->part) < 0){
		return 1;
	}else{
		if(s1->tam > s2->tam){
			return -1;
		}else if(s1-> tam < s2->tam){
			return 1;
		}else{
			if(s1->indice > s2->indice){
				return 1;
			}else if(s1->indice < s2->indice){
				return -1;
			}else{
				return 0;
			}
		}
	}
}

int main(){
	
	sParticipantes entradas[200];
	char teste[101], teste2[101];
	int i, ind=0;
	
	while(scanf(" %s %s", teste, teste2), strcmp(teste, "FIM") != 0){
		
		for(i=0;i<ind && strcmp(entradas[i].nome, teste) != 0;i++);
		if(i == ind){
			strcpy(entradas[ind].nome, teste);
			strcpy(entradas[ind].part, teste2);
			entradas[ind].tam = strlen(entradas[ind].nome);
			entradas[ind].indice = ind;
			ind++;
		}
		
	}
	
	qsort(entradas, ind, sizeof(entradas[0]), comp);
	
	for(i=0;i<ind;i++){
		printf("%s\n", entradas[i].nome);
	}
	
	qsort(entradas, ind, sizeof(entradas[0]), comp2);
	
	printf("\nAmigo do Habay:\n%s\n", entradas[0].nome);
	
	return 0;
}