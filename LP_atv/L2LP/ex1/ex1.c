#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

typedef struct{
	char ra[14];
	char nome[41];
	double nota;
	int faltas;
} sAlunos;

int comp(const void* p1, const void* p2){
	sAlunos *s1 = (sAlunos*) p1;
	sAlunos *s2 = (sAlunos*) p2;
	
	if(s1->nota > s2->nota)
		return -1;
	else if(s1->nota < s2->nota)
		return 1;
	else{
		return strcmp(s1->nome, s2->nome);
	}
}

void LimpaBuffer(){
	while(getchar()!='\n');
	return;
}


int main(){
	
	int i, c;
	sAlunos alunos[20];
	
	for(i=0;i<20;i++){
		scanf(" %s", alunos[i].ra);
		LimpaBuffer();
		fgets(alunos[i].nome, 40, stdin);
		for(c=0;alunos[i].nome[c]>=' ';c++);
		alunos[i].nome[c]='\0';
		scanf(" %lf %d", &alunos[i].nota, &alunos[i].faltas);
		printf("%s %s %.2lf %d\n", alunos[i].ra, alunos[i].nome, alunos[i].nota, alunos[i].faltas);
	}
	
	qsort(alunos, 20, sizeof(alunos[0]), comp);
	
	for(i=0;i<20;i++)
		printf("%s %s %.2lf %d\n", alunos[i].ra, alunos[i].nome, alunos[i].nota, alunos[i].faltas);
	
	return 0;
}