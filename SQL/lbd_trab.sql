create table curso
(   sigla               varchar2(5)     primary key,
    nome                varchar2(40),
    cargaHoraria        number(5,0),
    valor               number(10,2),
    dataVigencia        varchar2(8),
    valorHoraInstrutor  number(10,2),
    programa            varchar2(30)
);

create table pessoa
(   cpf                 varchar2(14)    primary key,
	nome                varchar2(30),
    dataNasc            varchar2(8),
    endereco            varchar2(30),
    numero              number(6,0),
    bairro              varchar2(30),
    cidade              varchar2(30),
    estado              varchar2(2),
    cep                 varchar2(10),
    telefone            varchar2(12),
    celular             varchar2(12),
    sexo                char(1),
    estadoCivil         varchar2(15),
    rg                  varchar2(13),
    email               varchar2(100)
);

create table instrutor
(   cpf                 varchar2(14)    primary key references pessoa(cpf),
    formacao            varchar2(30),
    areaAtuacao         varchar2(30)
);

create table turma
(   siglaTurma          varchar2(5)     primary key,
    siglaCurso          varchar2(5)     references curso(sigla),
    cpfInst             varchar2(14)    references instrutor(cpf),
    descricao           varchar2(100),
    dataInicio          varchar2(8),
    dataTermino         varchar2(8),
    periodo             varchar2(12),
    qtdeVagas           number(3,0),
    observacoes         varchar2(100)
);

create table aluno
(   cpf                 varchar2(14)    primary key references pessoa(cpf),
    escolaridade        varchar2(30)
);

create table aVista
(   codigo				number(5,0)		primary key,
    valor               number(10,2),
    agencia             number(15,0),
    nCheque             number(3,0),
    preData             varchar2(5)
);

create table aPrazo
(   codigo				number(5,0)		primary key,
    valor               number(10,2),
    dtVencimento        varchar2(8),
    taxaJuros           number(5,2),
    qtdeMensalidade     number(3,0)
);

create table matricula
(   cpfAluno            varchar2(14)    references aluno(cpf),
    siglaTurma          varchar2(5)     references turma(siglaTurma),
    dtMatricula         varchar2(8),
    qtdeFaltas          number(2,0),
    nota                number(2,2),
	codAPrazo			number(5,0)		references aprazo(codigo),
	codAVista			number(5,0)		references avista(codigo),
	CONSTRAINT pk_matricula primary key(cpfAluno, siglaTurma)
);

INSERT INTO CURSO(SIGLA, NOME, CARGAHORARIA, VALOR, DATAVIGENCIA, VALORHORAINSTRUTOR, PROGRAMA) VALUES ('ADS', 'Análise de Sistemas', '3600', '500', '14112018', '80', 'Teste');
INSERT INTO CURSO(SIGLA, NOME, CARGAHORARIA, VALOR, DATAVIGENCIA, VALORHORAINSTRUTOR, PROGRAMA) VALUES ('ADM', 'Administração', '2000', '200', '14112018', '40', 'Teste');
INSERT INTO CURSO(SIGLA, NOME, CARGAHORARIA, VALOR, DATAVIGENCIA, VALORHORAINSTRUTOR, PROGRAMA) VALUES ('PME', 'Projetos Mecânicos', '2800', '350', '14112018', '50', 'Teste');
INSERT INTO CURSO(SIGLA, NOME, CARGAHORARIA, VALOR, DATAVIGENCIA, VALORHORAINSTRUTOR, PROGRAMA) VALUES ('BIO', 'Biologia', '3000', '370', '14112018', '55', 'Teste');
INSERT INTO CURSO(SIGLA, NOME, CARGAHORARIA, VALOR, DATAVIGENCIA, VALORHORAINSTRUTOR, PROGRAMA) VALUES ('LOG', 'Logística', '2100', '220', '14112018', '45', 'Teste');

INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('11111111111', 'Teste 1', '14112018', 'End Teste', '200', 'Teste', 'Teste', 'TS', '11510000', '1532314757', '15998753231', 'F', 'Casado', '111111111', 'teste@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('22222222222', 'Teste 2', '11112018', 'End Teste 2', '200', 'Teste', 'Teste', 'TS', '11113231', '1533251112', '15995433721', 'M', 'Solteiro', '222222222', 'teste2@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('33333333333', 'Teste 3', '08112018', 'End Teste 3', '200', 'Teste', 'Teste', 'TS', '32134656', '1535126672', '15994354321', 'M', 'Divorciado', '333333333', 'teste3@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('44444444444', 'Teste 4', '23112018', 'End Teste 4', '200', 'Teste', 'Teste', 'TS', '71235761', '1573361123', '15416545321', 'F', 'Viúvo', '444444444', 'teste4@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('55555555555', 'Teste 5', '6112018', 'End Teste 5', '200', 'Teste', 'Teste', 'TS', '13682365', '1235658312', '15976557321', 'F', 'Casado', '555555555', 'teste5@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('66666666666', 'Teste 6', '14102018', 'End Teste 6', '200', 'Teste', 'Teste', 'TS', '11513000', '1153242877', '15993331121', 'F', 'Casado', '666666666', 'teste6@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('77777777777', 'Teste 7', '11102018', 'End Teste 7', '200', 'Teste', 'Teste', 'TS', '11143231', '1565351112', '15995434421', 'M', 'Solteiro', '777777777', 'teste7@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('88888888888', 'Teste 8', '08102018', 'End Teste 8', '200', 'Teste', 'Teste', 'TS', '32135656', '1535466712', '15667354321', 'M', 'Divorciado', '888888888', 'teste8@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('99999999999', 'Teste 9', '23102018', 'End Teste 9', '200', 'Teste', 'Teste', 'TS', '71765761', '1533356123', '16435425321', 'F', 'Viúvo', '999999999', 'teste9@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('10000000000', 'Teste 10', '06102018', 'End Teste 10', '200', 'Teste', 'Teste', 'TS', '13782365', '1267678312', '15356657321', 'F', 'Casado', '100000000', 'teste10@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('11000000000', 'Teste 11', '07102018', 'End Teste 11', '200', 'Teste', 'Teste', 'TS', '11131365', '1524351312', '32132215431', 'M', 'Solteiro', '110000000', 'teste11@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('12000000000', 'Teste 12', '02102018', 'End Teste 12', '200', 'Teste', 'Teste', 'TS', '16321365', '5435134313', '54354313213', 'M', 'Viúvo', '120000000', 'teste12@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('13000000000', 'Teste 13', '12102018', 'End Teste 13', '200', 'Teste', 'Teste', 'TS', '12321365', '4322254343', '52234543543', 'F', 'Divorciado', '130000000', 'teste13@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('14000000000', 'Teste 14', '15102018', 'End Teste 14', '200', 'Teste', 'Teste', 'TS', '16632165', '5342436624', '65454311322', 'M', 'Casado', '140000000', 'teste14@teste.com');
INSERT INTO PESSOA(CPF, NOME, DATANASC, ENDERECO, NUMERO, BAIRRO, CIDADE, ESTADO, CEP, TELEFONE, CELULAR, SEXO, ESTADOCIVIL, RG, EMAIL) VALUES ('15000000000', 'Teste 15', '18102018', 'End Teste 15', '200', 'Teste', 'Teste', 'TS', '14752165', '3211321321', '76574113224', 'F', 'Solteiro', '150000000', 'teste15@teste.com');

INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('11111111111', 'Ensino Superior Completo');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('22222222222', 'Ensino Técnico Completo');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('33333333333', 'Ensino Médio Completo');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('44444444444', 'Ensino Superior Cursando');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('55555555555', 'Ensino Médio Cursando');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('11000000000', 'Ensino Superior Completo');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('12000000000', 'Ensino Técnico Completo');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('13000000000', 'Ensino Médio Completo');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('14000000000', 'Ensino Superior Cursando');
INSERT INTO ALUNO(CPF, ESCOLARIDADE) VALUES ('15000000000', 'Ensino Médio Cursando');

INSERT INTO INSTRUTOR(CPF, FORMACAO, AREAATUACAO) VALUES ('66666666666', 'Analista de Sistemas', 'Tecnologia da Informação');
INSERT INTO INSTRUTOR(CPF, FORMACAO, AREAATUACAO) VALUES ('77777777777', 'Administrador', 'Administração');
INSERT INTO INSTRUTOR(CPF, FORMACAO, AREAATUACAO) VALUES ('88888888888', 'Vendedor', 'Vendas');
INSERT INTO INSTRUTOR(CPF, FORMACAO, AREAATUACAO) VALUES ('99999999999', 'Analista de Marketing', 'Marketing');
INSERT INTO INSTRUTOR(CPF, FORMACAO, AREAATUACAO) VALUES ('10000000000', 'Desenvolvedor', 'Tecnologia da Informação');

INSERT INTO TURMA(SIGLATURMA, SIGLACURSO, CPFINST, DESCRICAO, DATAINICIO, DATATERMINO, PERIODO, QTDEVAGAS, OBSERVACOES) VALUES ('ADS01', 'ADS', '10000000000', 'Análise e Desenvolvimento', '01082018', '20122018', 'Manhã', '40', 'Sem observações');
INSERT INTO TURMA(SIGLATURMA, SIGLACURSO, CPFINST, DESCRICAO, DATAINICIO, DATATERMINO, PERIODO, QTDEVAGAS, OBSERVACOES) VALUES ('ADM01', 'ADM', '77777777777', 'Administração 01', '01082018', '20122018', 'Manhã', '40', 'Sem observações');
INSERT INTO TURMA(SIGLATURMA, SIGLACURSO, CPFINST, DESCRICAO, DATAINICIO, DATATERMINO, PERIODO, QTDEVAGAS, OBSERVACOES) VALUES ('PME01', 'PME', '88888888888', 'Projetos Mecânicos 01', '01082018', '20122018', 'Manhã', '40', 'Sem observações');
INSERT INTO TURMA(SIGLATURMA, SIGLACURSO, CPFINST, DESCRICAO, DATAINICIO, DATATERMINO, PERIODO, QTDEVAGAS, OBSERVACOES) VALUES ('BIO01', 'BIO', '99999999999', 'Biologia 01', '01082018', '20122018', 'Manhã', '40', 'Sem observações');
INSERT INTO TURMA(SIGLATURMA, SIGLACURSO, CPFINST, DESCRICAO, DATAINICIO, DATATERMINO, PERIODO, QTDEVAGAS, OBSERVACOES) VALUES ('LOG01', 'LOG', '66666666666', 'Logística 01', '01082018', '20122018', 'Manhã', '40', 'Sem observações');

INSERT INTO APRAZO(CODIGO, VALOR, DTVENCIMENTO, TAXAJUROS, QTDEMENSALIDADE) VALUES ('1', '200', '23112018', '12,67', '3');
INSERT INTO APRAZO(CODIGO, VALOR, DTVENCIMENTO, TAXAJUROS, QTDEMENSALIDADE) VALUES ('2', '300', '28112018', '18,67', '2');
INSERT INTO APRAZO(CODIGO, VALOR, DTVENCIMENTO, TAXAJUROS, QTDEMENSALIDADE) VALUES ('3', '365', '26112018', '6,67', '6');
INSERT INTO APRAZO(CODIGO, VALOR, DTVENCIMENTO, TAXAJUROS, QTDEMENSALIDADE) VALUES ('4', '653', '29112018', '4,67', '7');
INSERT INTO APRAZO(CODIGO, VALOR, DTVENCIMENTO, TAXAJUROS, QTDEMENSALIDADE) VALUES ('5', '277', '30112018', '9,67', '1');

INSERT INTO AVISTA(CODIGO, VALOR, AGENCIA, NCHEQUE, PREDATA) VALUES ('1', '200', '14', '5', 'Sim');
INSERT INTO AVISTA(CODIGO, VALOR, AGENCIA, NCHEQUE, PREDATA) VALUES ('2', '300', '10', '3', 'Não');
INSERT INTO AVISTA(CODIGO, VALOR, AGENCIA, NCHEQUE, PREDATA) VALUES ('3', '444', '12', '4', 'Sim');
INSERT INTO AVISTA(CODIGO, VALOR, AGENCIA, NCHEQUE, PREDATA) VALUES ('4', '213', '8', '9', 'Não');
INSERT INTO AVISTA(CODIGO, VALOR, AGENCIA, NCHEQUE, PREDATA) VALUES ('5', '654', '2', '10', 'Sim');

INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAPRAZO) VALUES ('11111111111', 'ADS01', '14072018', '0', '0', '1');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAPRAZO) VALUES ('22222222222', 'ADM01', '14072018', '0', '0', '2');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAPRAZO) VALUES ('33333333333', 'PME01', '14072018', '0', '0', '3');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAPRAZO) VALUES ('44444444444', 'BIO01', '14072018', '0', '0', '4');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAPRAZO) VALUES ('55555555555', 'LOG01', '14072018', '0', '0', '5');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAVISTA) VALUES ('11000000000', 'ADS01', '14072018', '0', '0', '1');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAVISTA) VALUES ('12000000000', 'ADM01', '14072018', '0', '0', '2');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAVISTA) VALUES ('13000000000', 'PME01', '14072018', '0', '0', '3');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAVISTA) VALUES ('14000000000', 'BIO01', '14072018', '0', '0', '4');
INSERT INTO MATRICULA(CPFALUNO, SIGLATURMA, DTMATRICULA, QTDEFALTAS, NOTA, CODAVISTA) VALUES ('15000000000', 'LOG01', '14072018', '0', '0', '5');
