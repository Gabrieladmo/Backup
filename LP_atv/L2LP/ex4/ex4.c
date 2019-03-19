#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

typedef struct{
	char RA[4];
	double nota;
	int faltas;
} sAlunos;

int main(){
	
	sAlunos alunos[100];
	int ind=0, i;
	char opt;
	FILE * arq;
	
	arq = fopen("Alunos.dat", "r");
	
	if(arq == NULL){
		arq = fopen("Alunos.dat", "w");
	}else{
		fread(&alunos[0], sizeof(sAlunos), 1, arq);
		ind = 1;
		while(!feof(arq)){
			fread(&alunos[ind], sizeof(sAlunos), 1, arq);
			ind++;
		}
	}
	
	printf("Selecione uma opcao:\n1. Adicionar Aluno\n2. Buscar Aluno\n0. Sair\n");
	
	while(scanf(" %c", &opt)==1 && opt!='0'){
		if(opt == '1'){
			printf("Informe o RA, a nota e as faltas do aluno\n");
			scanf(" %s %lf %d", alunos[ind].RA, &alunos[ind].nota, &alunos[ind].faltas);
			for(i=0;i<ind && strcmp(alunos[ind].RA, alunos[i].RA) != 0;i++);
			if(i!=ind){
				printf("RA ja cadastrado, informe os dados novamente.\n");
				alunos[ind].faltas = -1;
			}
			while(alunos[ind].nota < 0 || alunos[ind].nota > 10.0 || alunos[ind].faltas < 0){
				scanf(" %s %lf %d", alunos[ind].RA, &alunos[ind].nota, &alunos[ind].faltas);
			}
			ind++;
		}else if(opt == '2'){
			char ra[4];
			printf("Informe o RA a ser pesquisado: ");
			scanf(" %s", ra);
			for(i=0;i < ind && strcmp(alunos[i].RA, ra) != 0;i++);
			if(i==ind){
				printf("\nAluno nao encontrado.\n");
			}else{
				if(alunos[i].nota >= 6.0 && alunos[i].faltas <= 10)
					printf("\n%s aprovado\n", alunos[i].RA);
				else
					printf("\n%s reprovado\n", alunos[i].RA);
			}
		}
		printf("\nSelecione uma opcao:\n1. Adicionar Aluno\n2. Buscar Aluno\n0. Sair\n");
	}
	
	arq = fopen("Alunos.dat", "w");
	
	for(i=0;i<ind;i++)
		fwrite(&alunos[i], sizeof(sAlunos), 1, arq);
	
	fclose(arq);
	
	
	
	return 0;
}