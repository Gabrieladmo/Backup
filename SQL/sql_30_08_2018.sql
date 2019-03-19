CREATE TABLE Cliente(
  Cod_cliente     number    (5,0),
  Nome_cliente    varchar2  (30),
  Endereco        varchar2  (25),
  Cidade          varchar2  (20),
  Cep             varchar2  (10),
  UF              char      (02)
);

ALTER TABLE Cliente ADD CONSTRAINT pk_Cliente PRIMARY KEY (Cod_Cliente);

CREATE TABLE Vendedor(
  Cod_vendedor    number(5,0),
  nomevendedor    varchar2(30)    Not Null,
  faixa_comissao  number(4,2),
  salario_fixo    number(7,2)
);

ALTER TABLE Vendedor ADD CONSTRAINT pk_Vendedor PRIMARY KEY (Cod_vendedor);

CREATE TABLE Produto(
  Cod_produto     number(3,0),
  Descricao       varchar2(20),
  unidade         varchar2(2),
  valor_unitario  number(8,2)
);

ALTER TABLE Produto ADD CONSTRAINT pk_Produto PRIMARY KEY (Cod_produto);

CREATE TABLE Pedido(
  Num_pedido      number(5,0),
  Prazo_entrega   date,
  Cod_cliente     number(5,0),
  Cod_vendedor    number(5,0)
);

ALTER TABLE Pedido ADD CONSTRAINT pk_Pedido PRIMARY KEY (Num_Pedido);
ALTER TABLE Pedido ADD FOREIGN KEY (Cod_cliente) REFERENCES Cliente(Cod_Cliente);
ALTER TABLE Pedido ADD FOREIGN KEY (Cod_vendedor) REFERENCES Vendedor(Cod_vendedor);

CREATE TABLE Item_Pedido(
  Num_pedido      number(5,0),
  cod_produto     number(3,0),
  Quantidade      number(5,0),
);

ALTER TABLE Item_Pedido ADD FOREIGN KEY (Num_pedido) REFERENCES Pedido(Num_pedido);
ALTER TABLE Item_Pedido ADD FOREIGN KEY (Cod_produto) REFERENCES Produto(Cod_produto);

Insert Into cliente values (11111,'Gabriela Domingues','Av Sorocaba','Sorocaba','11111-111','SP');
Insert Into cliente values (22222,'Gabriel Giovani','Av Araçoiaba','Araçoiaba','22222-222','AR');
Insert Into cliente values (33333,'Rafael Henrique','Av Ipanema','Sorocaba','33333-333','SP');
Insert Into cliente values (44444,'Alex Barros','Rua Roça','Pilar','44444-444','PL');
Insert Into cliente values (55555,'Lord','Av Independencia','Cidade do Futuro','55555-555','IG');

Insert Into vendedor values (11112,'Maria Angelica',15.9,10000.00);
Insert Into vendedor values (22223,'Antonio Munari',14.9,10500.00);
Insert Into vendedor values (33334,'Tadeu José',12.3,2000.00);
Insert Into vendedor values (44445,'Fábio Jesus',20.0,8000.00);
Insert Into vendedor values (55556,'Andressa Antunes',30.3,15000.00);

Insert Into produto values  (123,'carro vermelho','UN',100000.00);
Insert Into produto values  (234,'carro preto','UN',99000.00);
Insert Into produto values  (345,'carro azul','UN',130000.00);
Insert Into produto values  (456,'caneta','CX',8.00);
Insert Into produto values  (567,'óleo','LT',73.00);

Insert Into pedido values (12345,'01/01/2001',11111,11112);
Insert Into pedido values (23456,'02/01/2001',44444,22223);
Insert Into pedido values (34567,'03/01/2001',33333,33334);
Insert Into pedido values (45678,'04/01/2001',55555,55556);
Insert Into pedido values (56789,'05/01/2001',55555,55556);

Insert Into item_pedido values (12345,234,2);
Insert Into item_pedido values (23456,456,10);
Insert Into item_pedido values (34567,567,2);
Insert Into item_pedido values (45678,123,1);
Insert Into item_pedido values (56789,345,2);

select cod_produto,descricao,'antes do aumento' as Quando, valor_unitario from produto
union
select cod_produto,descricao,'depois do aumento' as Quando, valor_unitario*1.1 from produto
order by cod_produto;

select cod_produto,descricao,valor_unitario from produto
union
select  as cod_produto, 'Soma dos valores =' as descricao, sum(valor_unitario) as valor_unitario from produto
order by 3;

