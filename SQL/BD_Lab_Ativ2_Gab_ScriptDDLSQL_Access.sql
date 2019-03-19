--
--	Criacao do banco de dados do caso da Clinica
--	no Access via SQL
--

CREATE TABLE Medicos
( 	Codigo	LONG		PRIMARY KEY,
	Nome	Text( 40 )	NOT NULL )

CREATE TABLE Especialidades
(	Codigo	LONG		PRIMARY KEY,
	Nome	Text( 40 ) 	NOT NULL UNIQUE,
	MedResp	LONG		UNIQUE REFERENCES Medicos )

CREATE TABLE MedEspec
(	CodMed	LONG		NOT NULL REFERENCES Medicos,
	CodEsp	LONG		NOT NULL REFERENCES Especialidades,
	PRIMARY KEY( CodMed, CodEsp ) )

CREATE TABLE Pacientes
(	Codigo	LONG		PRIMARY KEY,
	Nome	Text( 40 )	NOT NULL,
	Sexo	Text( 1 ) 	NOT NULL,
	DtNasc	Datetime	NOT NULL,
	Peso	Double,
	Altura	Double )

CREATE TABLE Atendimentos
(	Numero	LONG		PRIMARY KEY,
	DtHora	Datetime	NOT NULL,
	Descr	Text( 255 ),
	CodPac	LONG 		NOT NULL REFERENCES Pacientes,
	CodMed	LONG		NOT NULL,
	CodEsp	LONG		NOT NULL,
	FOREIGN KEY( CodMed, CodEsp ) REFERENCES MedEspec )

CREATE TABLE Exames
( 	Codigo	LONG		PRIMARY KEY,
	Nome	Text( 40 )	NOT NULL UNIQUE )
	
CREATE TABLE AtendExames
(	NumAte	LONG		NOT NULL REFERENCES Atendimentos,
	CodExa	LONG		NOT NULL REFERENCES Exames,
	DtReal	Datetime	NOT NULL,
	Resul	Text( 255 ),
	PRIMARY KEY( NumAte, CodExa ) )

CREATE TABLE Laboratorios
(	Codigo	LONG		PRIMARY KEY,
	Nome	Text( 40 )	NOT NULL,
	Telef	Text( 20 ),
	EndLog	Text( 30 )	NOT NULL,
	EndBai	Text( 20 ),
	EndCid	Text( 20 )	NOT NULL,
	EndUF	Text( 2 )	NOT NULL,
	EndCEP	Long		NOT NULL )

CREATE TABLE Medicamentos
(	Codigo	LONG		PRIMARY KEY,
	Nome	Text( 60 )	NOT NULL UNIQUE,
	QtEstoq	Double,
	CodLab	LONG 		REFERENCES Laboratorios )
	
CREATE TABLE Composicoes
(	CodComposto	LONG	NOT NULL REFERENCES Medicamentos,
	CodComponen	LONG	NOT NULL REFERENCES Medicamentos,
	QtComponen	Double,
	PRIMARY KEY( CodComposto, CodComponen ) )

CREATE TABLE AtendReceitas
(	NumAte	LONG	NOT NULL REFERENCES Atendimentos,
	CodMed	LONG 	NOT NULL REFERENCES Medicamentos,
	QtMed	Double 	NOT NULL,
	Posolog	Text( 255 ),
	PRIMARY KEY( NumAte, CodMed ) )
