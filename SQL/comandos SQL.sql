Totalizações: Funções de agregação
Agrupamentos

1. SUM() \pode ou não ter DISTINCT, pode ou não ter WHERE e considera apenas os não NULL
	SELECT SUM(___) FROM ________ 
	SELECT SUM(___) FROM ________ \caso deseje incluir condição colocar: \ WHERE ________
	SELECT SUM(DISTINCT ____) FROM ________
	SELECT SUM(_____*__) FROM ________ \não é obrigatório colocar apenas coluna, pode-se fazer uma expressão com ela\
	
2. COUNT() \contabiliza a qtde de linhas do conjunto, vulgo coluna\ apenas COUNT usa o símbolo especial *
	SELECT COUNT(*) FROM ________ \contabiliza a qtde total das linhas do conjunto, independentemente se conterem o valor NULL
	SELECT COUNT(*) FROM ________ WHERE ________ \contabiliza a qtde total das linhas do conjunto, não contabiliza os NULL
	SELECT COUNT(___) FROM ________ \nulo é ignorado
	SELECT COUNT(DISTINCT ___) FROM ________ \retorna os valores distintos da coluna cliente
	
3. AVG() \pode conter WHERE
	SELECT AVG(___) FROM ________
	
4. MAX() \retorna o MÁXIMO da coluna
	SELECT MAX(___) FROM ________ WHERE ________
	
5. MIN() \retorna o MINIMO da coluna
	SELECT MIN(___) FROM ________


Easter Egg:

1. SELECT SUM(___)/COUNT(*) FROM ________ \combinação de funções para retornar uma média
2. SELECT COUNT(DISTINCT ________), COUNT(*), SUM(________) \SELECT retorna os valores em uma tabela\ x,y,z\
3. SELECT SexCliente, COUNT(*)
		FROM Clientes
		GROUP BY SexCliente
4. 

Exercícios:

1 a 4
	1.
	SELECT COUNT(CdSuperv) FROM Funcionarios

	2.
	SELECT COUNT(CdSuperv) FROM Funcionarios WHERE CdSuperv = '1001'

	3.
	SELECT SUM(VrSalario) FROM Cargos INNER JOIN Funcionarios ON Funcionarios.CdCargo = Cargos.CdCargo

	4.
	SELECT MAX(VrSalario), MIN(VrSalario), SUM(VrSalario)/COUNT(VrSalario) FROM Cargos
	
	5.
	SELECT Cargos.CdCargo, COUNT (Cargos.CdCargo) FROM Cargos INNER JOIN Funcionarios ON Funcionarios.CdCargo = Cargos.CdCargo GROUP BY Cargos.CdCargo

	6.
	SELECT COUNT(Sexo) FROM Funcionarios GROUP BY Sexo

	7.
	SELECT COUNT(VrSalario) FROM Cargos INNER JOIN Funcionarios ON Cargos.CdCargo = Funcionarios.CdCargo GROUP BY CdDepto

	8.
	SELECT SUM(VrSalario)/COUNT(VrSalario) FROM Cargos INNER JOIN Funcionarios ON Cargos.CdCargo = Funcionarios.CdCargo GROUP BY Sexo

	9.
	SELECT Deptos.NmDepto, MAX(VrSalario), MIN(VrSalario) FROM Cargos INNER JOIN Funcionarios ON Cargos.CdCargo = Funcionarios.CdCargo INNER JOIN Deptos ON Deptos.CdDepto = Funcionarios.CdDepto GROUP BY Deptos.NmDepto

	10.
	SELECT COUNT(CdAgencia) FROM Contas WHERE CdAgencia = '0040'

	11.
	SELECT COUNT(SexCliente) FROM Clientes WHERE SexCliente = 'F'

	12.
	SELECT COUNT (DISTINCT NrConta) FROM Movimentos

	13.
	SELECT SUM(VrMov)/COUNT(VrMov)
	  FROM Movimentos
	  INNER JOIN Contas ON Movimentos.NrConta = Contas.NrConta
	  WHERE Contas.CdAgencia = '0050' AND Movimentos.TpMov = 'D'

	14.
	SELECT COUNT(NrConta) FROM Movimentos WHERE NrConta = '1021'

	15.
	SELECT MAX(VrMov) FROM Movimentos WHERE NrConta = '1021' AND TpMov = 'D'

	16.
	SELECT SUM(VrMov) FROM Movimentos WHERE NrConta = '1021' AND TpMov = 'C'

	17.
	SELECT SUM(VrMov)
	  FROM Movimentos
	  INNER JOIN Contas ON Movimentos.NrConta = Contas.NrConta
	  WHERE Contas.CdAgencia = '0050' AND Movimentos.TpMov = 'C'

	18.
	SELECT MAX(VrMov)-MIN(VrMov) FROM Movimentos WHERE NrConta = '1021' AND TpMov = 'C'

	19.
	SELECT COUNT(CliContas.CdCliente)
		  FROM CliContas
		  INNER JOIN Clientes ON CliContas.CdCliente = Clientes.CdCliente
		  WHERE Clientes.NmCliente = 'SILVIO PADILHA'
	
	20.
	SELECT COUNT(NrConta) FROM Contas GROUP BY CdAgencia

	21.
	SELECT NmAgencia FROM Agencias INNER JOIN Contas ON Agencias.CdAgencia = Contas.CdAgencia GROUP BY NmAgencia HAVING COUNT(*) >= 4

26 a 29
	26.
	SELECT COUNT(CodMedico) FROM Atendimentos WHERE CodMedico = '7'

	27.
	SELECT SUM(Peso)/COUNT(Peso), SUM(Altura)/COUNT(Altura) FROM Pacientes

	28.
	SELECT MAX(Altura), MIN(Altura) FROM Pacientes

	29.
	SELECT SUM(ValConsulta) FROM Atendimentos WHERE CodMedico = '7'

