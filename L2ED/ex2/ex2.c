/*
	Autores: Gabriel Giovani Felicidade 0030481711046
			 Gabriela Domingues Mendes de Oliveira 0030481711010
	
	Exercício 2 da lista 2
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define MAX_TAM 5001

struct regCid {
	char nome[31];
	int pop;
	float area;
	float pib;
	float idh;
};

typedef struct regCid TCidade;

typedef struct {
	TCidade listaCidade[MAX_TAM];
	int qtde;
} TDescritor;

void InicializaLista(TDescritor *);
void ImprimeLista(TDescritor *, char *);
int pai(int i);
int esquerda(int i);
int direita(int i);
void heapify_up(TDescritor *, int);
void insere(TDescritor *, TCidade);

int main()
{	char vNome[31];
	int vPop, n, i;
	float vArea;
	TCidade ent;
	TDescritor lista;
	
	InicializaLista(&lista);
	
	while(1){
		printf("Informe a cidade (FIM p/ encerrar):\n");
		scanf("%s", ent.nome);
		
		if (strcmp(ent.nome, "FIM") == 0)
			break;
		
		printf("Populacao:\n");
		scanf("%d", &ent.pop);
		
		printf("Area:\n");
		scanf("%f", &ent.area);
		
		printf("PIB:\n");
		scanf("%f", &ent.pib);
		
		printf("IDH:\n");
		scanf("%f", &ent.idh);
		
		insere(&lista, ent);
	}
	
	scanf("%d", &n);
	
	for(i=1;i<=n;i++){
		printf("%-32s %7d %7.2f %7.2f %7.2f %7.2f\n", 
		lista.listaCidade[i].nome,
		lista.listaCidade[i].pop,
		lista.listaCidade[i].area,
		lista.listaCidade[i].pib,
		lista.listaCidade[i].idh,
		lista.listaCidade[i].pop / lista.listaCidade[i].area);
	}
	
	return 0;
}

void InicializaLista(TDescritor *lista){
	lista->qtde = 0;
}

int pai(int i){
    return i/2;
}

int esquerda(int i){
    return 2*i;
}

int direita(int i){
    return 2*i+1;
}

void heapify_up(TDescritor *lista, int v){
    
    if(v == 1) return;
    
    int p = pai(v);
    if(lista->listaCidade[v].idh < lista->listaCidade[p].idh){
		TCidade temp;
		temp = lista->listaCidade[v];
        lista->listaCidade[v] = lista->listaCidade[p];
		lista->listaCidade[p] = temp;
        
        heapify_up(lista, p);
    }
    
}

void insere(TDescritor *lista, TCidade valor){
    lista->listaCidade[++lista->qtde] = valor;
    
    heapify_up(lista, lista->qtde);
}