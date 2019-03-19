/*  Gabriela Domingues Mendes de Oliveira
    0030481711010
	26/09/2018
*/

create or replace procedure qtdePed(cod_cli number)
as 
	qtde NUMBER;
	nome varchar(30);
Begin
	select count(*)
		into qtde
		from Pedido
		where cod_cliente = cod_cli;
	
	select nome_cliente
		into nome
		from Cliente
		where cod_cliente = cod_cli;
	
	insert into Tb_mensagem
		values(sysdate,'Cliente: '|| cod_cli, nome || ' tem ' || qtde || ' pedido(s)');
	
	commit;
  
	exception
		when no_data_found then
		insert into tab_erro
			values(sysdate,'Cliente não encontrado '||cod_cli);
end;