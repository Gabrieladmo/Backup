#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#define MAX 11234

typedef struct {
    char nome[80];
} pessoa_t;

int cmp(const void *a, const void *b){
    pessoa_t *A = (pessoa_t *) a;
    pessoa_t *B = (pessoa_t *) b;
	
    return strcmp(A->nome, B->nome);
}

int main(void){
    int k, i, j, tam, maior;
    char venc[80], p[80], resp[10];
	
    pessoa_t a[MAX], na[MAX];
    maior = i = j = 0;
	
    while (scanf(" %s", p), strcmp(p, "FIM")){
		
        scanf(" %s", resp);
		
        if (!strcmp(resp, "YES")){
			
            strcpy(a[i++].nome, p);
            tam = strlen(p);
			
            if (tam > maior){
                maior = tam;
                strcpy(venc, p);
            }
        }
        else strcpy(na[j++].nome, p);
    }
	
    qsort(a, i, sizeof(pessoa_t), cmp);
    qsort(na, j, sizeof(pessoa_t), cmp);
	
    for (k = 1; k < i; k++)	if (strcmp(a[k].nome, a[k-1].nome))	printf("%s\n", a[k-1].nome);
    if (i)	printf("%s\n", a[i-1].nome);
    for (k = 0; k < j; k++)	printf("%s\n", na[k].nome);
	
    printf("\nAmigo do Habay:\n%s\n", venc);
	
    return 0;
}