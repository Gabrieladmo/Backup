#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

typedef enum{P,E} TTipo;

typedef union{
	
	typedef struct{
		
		char nome[41],cpf[15],rg[15],sexo;
		int dia,mes,ano;
		
	} TPessoa;
	
	typedef struct{
		
		char nome[51],cnpj[19],inscEstd[15];
		
	} TEmpresa;
	
} TDados;

typedef struct{
	
	TTipo tipo;
	TDados dados;
	char *logradouro,*complemento,*bairro,*cidade,*CEP,*UF;
	float limCred;
	int dia,mes,ano;
	Tcliente *prox;
	
} Tcliente;

typedef struct{
	
	Tcliente *inicio,*final;
	
} TDescript;

int main(){
	
	TDescript lista;
	Tcliente *aux;
	Tcliente cliente;

	lista.inicio = NULL;
	lista.final = NULL;
	
	scanf("%d",&cliente.tipo);
	
	if(cliente.tipo == P){
		
		scanf("%s %s %s %c %d %d %d",cliente.dados.nome,cliente.dados.cpf,cliente.dados.rg,cliente.dados.sexo,&cliente.dados.dia,&cliente.dados.mes,&cliente.dados.ano);
	
	}else{
		
		scanf("%s %s %s",cliente.dados.nome,cliente.dados.cnpj,cliente.dados.inscEstd);
		
	}
	scanf("%s %s %s %s %s %s %f %d %d %d",cliente.logradouro,cliente.complemento,cliente.bairro,cliente.cidade,cliente.CEP,cliente.UF,&cliente.limCred,&cliente.dia,&cliente.mes,&cliente.ano);
	
	aux = (Tcliente *) malloc (sizeof(Tcliente));
	
	if(aux == NULL)
		return 2;
	
	if(cliente.tipo == P){
		
		strcpy(aux->dados.nome,cliente.dados.nome);
		strcpy(aux->dados.cpf,cliente.dados.cpf);
		strcpy(aux->dados.rg,cliente.dados.rg);
		strcpy(aux->dados.sexo,cliente.dados.sexo);
		aux->dados.dia = cliente.dados.dia;
		aux->dados.mes = cliente.dados.mes;
		aux->dados.ano = cliente.dados.ano;
		
	}else{
		
		strcpy(aux->dados.nome,cliente.dados.nome);
		strcpy(aux->dados.cnpj,strcliente.dados.cnpj);
		strcpy(aux->dados.inscEstd,cliente.dados.inscEstd);
		
	}
	
	strcpy(aux->logradouro,cliente.logradouro);
	strcpy(aux->complemento,cliente.complemento);
	strcpy(aux->bairro,cliente.bairro);
	strcpy(aux->cidade,cliente.cidade);
	strcpy(aux->CEP,cliente.CEP);
	strcpy(aux->UF,cliente.UF);
	aux->limCred = cliente.limCred;
	aux->dia = cliente.dia;
	aux->mes = cliente.mes;
	aux->ano = cliente.ano;
	
	if(lista.inicio == NULL)
		
		lista.inicio = aux;
	
	else
		
		lista.final->prox = aux;
	
	lista.final = aux;
	aux = lista.inicio;
	
	while(aux != NULL){
		
		if(aux->tipo == P){
		
		printf("%s %s %s %c %d %d %d ",aux->dados.nome,aux->dados.cpf,aux->dados.rg,aux->dados.sexo,aux->dados.dia,aux->dados.mes,aux->dados.ano);
	
		}else{
			
			printf("%s %s %s ",aux->dados.nome,aux->dados.cnpj,aux->dados.inscEstd);
			
		}
		printf("%s %s %s %s %s %s %f %d %d %d\n",aux->logradouro,aux->complemento,aux->bairro,aux->cidade,aux->CEP,aux->UF,aux->limCred,aux->dia,aux->mes,aux->ano);
		
		aux = aux->prox;
		
	}
	
	
	return 0;
}