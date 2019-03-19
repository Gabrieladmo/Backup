/*
	Autores: Gabriel Giovani Felicidade 0030481711046
			 Gabriela Domingues Mendes de Oliveira 0030481711010
	
	Exercício 1 da lista 2
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

struct regNo{
	struct regNo *esq;
	int valor;
	struct regNo *dir;
};
typedef struct regNo TNo;

TNo *AchaPai( TNo *r, int n );
void ImprimeArvore(TNo *r, int n);
int maiorValor(TNo *r);
int menorValor(TNo *r);
void contaFolhas(TNo *r, int *num);
void alturaArv(TNo *r, int num, int *alt);
int busca(TNo *r, int n);

int main(){
	TNo *raiz = NULL, *aux, *pai;
	int numero, folhas=0, altura=0;
	
	while(1){
		printf("\nInforme o valor:\n");
		scanf("%d", &numero);
		if( numero < 0 )
			break;
		aux = (TNo *) malloc( sizeof(TNo) );
		aux->valor = numero;
		aux->dir = NULL;
		aux->esq = NULL;
		pai = AchaPai( raiz, numero );
		if( pai == NULL ){
			raiz = aux;
		}else{
			if( numero <= pai->valor )
				pai->esq = aux;
			else
				pai->dir = aux;
		}
	}
	
	ImprimeArvore(raiz, 0);
	contaFolhas(raiz, &folhas);
	alturaArv(raiz, 1, &altura);
	printf("\nMaior Valor: %d\n", maiorValor(raiz));
	printf("Menor Valor: %d\n", menorValor(raiz));
	printf("Quantidade de folhas: %d\n", folhas);
	printf("Altura da arvore: %d\n", altura);
	
	while(1){
		printf("\nInforme o valor a ser pesquisado:\n");
		scanf("%d", &numero);
		if( numero < 0 )
			break;
		if(busca(raiz, numero) == 0){
			printf("%d nao encontrado.\n", numero);
		}else{
			printf("%d foi encontrado.\n", numero);
		}
	}
	
	return 0;
}

TNo *AchaPai( TNo *r, int n ){
	if( r == NULL ){
		return NULL;
	}else{
		if( n <= r->valor ){
			if( r->esq == NULL )
				return r;
			else
				return AchaPai( r->esq, n );
		}else{
			if( r->dir == NULL )
				return r;
			else
				return AchaPai( r->dir, n );
		}
	}
}

void ImprimeArvore(TNo *r, int n){
	int c;
	if( r != NULL ){
		for( c=0; c<n; c++)
			printf("\t");
		printf("%d\n", r->valor);
		ImprimeArvore(r->esq, n+1);
		ImprimeArvore(r->dir, n+1);
	}
}

int maiorValor(TNo *r){
	if(r->dir != NULL){
		return maiorValor(r->dir);
	}else{
		return r->valor;
	}
}

int menorValor(TNo *r){
	if(r->esq != NULL){
		return menorValor(r->esq);
	}else{
		return r->valor;
	}
}

void contaFolhas(TNo *r, int *num){
	if(r->esq == NULL && r->dir == NULL){
		*num = *num + 1;
	}else if(r->esq == NULL){
		contaFolhas(r->dir, num);
	}else if(r->dir == NULL){
		contaFolhas(r->esq, num);
	}else{
		contaFolhas(r->dir, num);
		contaFolhas(r->esq, num);
	}
}

void alturaArv(TNo *r, int num, int *alt){
	if(r != NULL){
		if(num > *alt){
			*alt = num;
		}
		alturaArv(r->dir, num+1, alt);
		alturaArv(r->esq, num+1, alt);
	}
}

int busca(TNo *r, int n){
	if(r == NULL){
		return 0;
	}else{
		if(n < r->valor){
			return busca(r->esq, n);
		}else if(n > r->valor){
			return busca(r->dir, n);
		}else{
			return 1;
		}
	}
}