#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

typedef struct{
	int cod;
	char nome[21];
	char sexo;
	char eCivil;
} sAlunos;

typedef struct{
	int aluno;
	char telefone[16];
	char tipo[4];
} sTelefones;

int main(){
	
	FILE * arq;
	sAlunos alunos[100];
	sTelefones telefones[200];
	int identificador=1, i, j, qtdeAluno, qtdeTelefone;
	
	arq = fopen("Alunos.dat", "r");
	
	fread(&alunos[0], sizeof(alunos[0]), 1, arq);
	while(!feof(arq)){
		fread(&alunos[identificador], sizeof(alunos[0]), 1, arq);
		identificador++;
	}
	
	fclose(arq);
	
	qtdeAluno = identificador-1;
	
	identificador=1;
	
	arq = fopen("Telefones.dat", "r");
	
	fread(&telefones[0], sizeof(telefones[0]), 1, arq);
	while(!feof(arq)){
		fread(&telefones[identificador], sizeof(telefones[0]), 1, arq);
		identificador++;
	}
	
	fclose(arq);
	
	qtdeTelefone = identificador-1;
	
	for(i=0;i<qtdeAluno;i++){
		printf("Cod: %d\t\tNome: %s\t\tSexo: %c\t\tEstado Civil: %c\n", alunos[i].cod, alunos[i].nome, alunos[i].sexo, alunos[i].eCivil);
		for(j=0;j<qtdeTelefone;j++){
			if(telefones[j].aluno == alunos[i].cod)
				printf("%s %s\n", telefones[j].telefone, telefones[j].tipo);
		}
		printf("\n");
	}
	
	return 0;
}