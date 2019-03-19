/*  Gabriela Domingues Mendes de Oliveira
    0030481711010
	17/10/2018
*/

/* EXERCICIO 1 */

alter table item_pedido add pco_unit NUMBER(6,2);

create or replace procedure inserir(cod_ped number, cod_prod number, qtde number)
as 
  valor NUMBER;
Begin
	select valor_unitario
		into valor
		from Produto
		where cod_produto = cod_prod;
    
  insert into item_pedido values (cod_ped, cod_prod, qtde, valor);
  
	commit;
  
	exception
		when no_data_found then
		rollback;
end;

EXEC inserir(10, 66, 2);

/* EXERCICIO 2 */

create or replace procedure espCli(cod_cli number)
as 
	qtde NUMBER;
  nome VARCHAR2(30);
Begin
	select count(*)
		into qtde
		from Pedido
		where cod_cliente = cod_cli and prazo_entrega >= sysdate and prazo_entrega <= sysdate + 90;
    
  select nome
    into nome
    from Cliente
    where cod_cliente = cod_cli;
    
  if(qtde >= 2) then
    insert into TABLOG
      values(sysdate, 'Cliente especial - enviar brinde', cod_cli || nome);
	end if;
  
	commit;
  
	exception
		when no_data_found then
		rollback;
end;

EXEC espCli(55555);

/* EXERCICIO 3 */

create or replace procedure comVend(cod_vend number)
as 
	total NUMBER;
  vendedor NUMBER;
Begin
  select cod_vendedor
    into vendedor
    from vendedor
    where cod_vendedor = cod_vend;
    
  select sum(ip.QUANTIDADE * ip.PCO_UNIT)
    into total
    from pedido pe inner join item_pedido ip on pe.NUM_PEDIDO = ip.NUM_PEDIDO
    where pe.cod_vendedor = cod_vend;
    
  if(total> 0 and total < 100.00) then
    update vendedor
      set faixa_comissao = 10
      where cod_vendedor = cod_vend;
  elsif(total >= 100.00 and total <= 1000.00) then
    update vendedor
      set faixa_comissao = 15
      where cod_vendedor = cod_vend;
  elsif(total > 1000.00) then
    update vendedor
      set faixa_comissao = 20
      where cod_vendedor = cod_vend;
  else
    update vendedor
      set faixa_comissao = 0
      where cod_vendedor = cod_vend;
	end if;
  
	commit;
  
	exception
		when no_data_found then
      insert into tab_erro
        values(sysdate, cod_vend || ' - Código vendedor não existe');
end;

EXEC comVend(66666);

/* EXERCICIO 4 */

create or replace procedure prod(cod_prod number)
as 
	total NUMBER;
  descricao VARCHAR2(20);
Begin
	select count(*)
		into total
		from item_pedido
		where cod_produto = cod_prod;
    
  select descricao
    into descricao
    from produto
    where cod_produto = cod_prod;
    
  if(total = 0) then
    insert into TABLOG
      values(sysdate, cod_prod || ' ' || descricao , user);
    delete from produto
      where cod_produto = cod_prod;
	end if;
  
	commit;
  
	exception
		when no_data_found then
      insert into tab_erro
        values(sysdate, cod_prod || ' - Código de produto inexistente');
end;

EXEC prod(65);

