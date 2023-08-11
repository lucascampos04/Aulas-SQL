-- Criação da TABELA
	CREATE TABLE cliente(
    	codigo int,
    	nome varchar(100),
    	sexo char(1),
    	data_nascimento DATE,
        altura float
	);

-- # --------------------------------------------------------------------------------------------------------------------------- # -- 

-- Inserção dos dados
-- 	Inserir na nome da tabela
	INSERT INTO cliente(
    --  nome das colunas (tem que estar em ordem)
        codigo,nome,sexo,data_nascimento, altura
        -- Valores adicionados a cada coluna          day/mount/year
    ) VALUES (1, 'Lucas', 'M', TO_DATE('29/06/2004', 'DD/MM/YYYY'), 1.83);

    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (2, 'Julia', 'F', TO_DATE('15/09/2002', 'DD/MM/YYYY'), 1.83);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (3, 'Carlos', 'M', TO_DATE('03/07/1998', 'DD/MM/YYYY'), 1.83);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (4, 'Ana', 'F', TO_DATE('22/11/1995', 'DD/MM/YYYY'), 1.63);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (5, 'Isabella', 'F', TO_DATE('09/03/2000', 'DD/MM/YYYY'), 1.63);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (6, 'Rafael', 'M', TO_DATE('14/05/1997', 'DD/MM/YYYY'), 1.78);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (7, 'Gabriel', 'M', TO_DATE('28/08/1999', 'DD/MM/YYYY'), 1.78);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (8, 'Mariana', 'F', TO_DATE('19/01/1993', 'DD/MM/YYYY'), 1.68);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (9, 'Sophia', 'F', TO_DATE('07/04/1996', 'DD/MM/YYYY'), 1.68);
    
    INSERT INTO cliente (codigo, nome, sexo, data_nascimento, altura)
    VALUES (10, 'Pedro', 'M', TO_DATE('28/10/1991', 'DD/MM/YYYY'), 1.83);

-- # --------------------------------------------------------------------------------------------------------------------------- # --

-- Visualizando dados

--  selecione (* = tudo) na tabela cliente
	SELECT * FROM cliente;

-- Na linguagem SQL podemos usar operadores relacionais e logicos
-- Operadores Relacioanis: > Maior, < Menor, <= Menor ou igual, >= Maior ou igual, <> Diferente, = Igual.
-- Logicos: AND (e) - OR (ou)

-- Busca em todas as colunas. WHERE(onde) - Filtrando as colunas e as requisições especificas
		SELECT * FROM cliente WHERE codigo > 3 and sexo = 'F';

-- Busca em colunas especificas 
		SELECT codigo,sexo FROM cliente WHERE codigo > 1 and sexo = 'M';

-- Busca por clientes cujos nomes começam com 'L', ordenando em ordem alfabética ascendente
		SELECT * FROM cliente WHERE nome LIKE 'L%' ORDER BY nome ASC;

-- Busca por clientes cujos códigos começam com 'L', ordenando em ordem descendente
		SELECT * FROM cliente WHERE codigo LIKE 'L%' ORDER BY codigo DESC;

-- # --------------------------------------------------------------------------------------------------------------------------- # --

-- Fazendo atualização

-- Alterando o nome 'Lucas' para 'Lucas Oliveira Campos', selecionando a coluna e o nome específico dentro da coluna
	UPDATE cliente SET nome = 'Lucas Oliveira Campos' WHERE nome = 'Lucas';

-- # --------------------------------------------------------------------------------------------------------------------------- # --

-- Deletando 
	DELETE cliente WHERE codigo = 1;

-- # ----------------------------------------------------OBSERVAÇÕES----------------------------------------------------------------------- # --

-- Independentemente do que vai ser feito no UPDATE e DELETE o uso do WHERE é OBRIGATORIO! 
-- Caso suba um UPDATE no banco de dados sem WHERE o banco de dados inteiro sera atualizado.
-- Se der um DELETE sem WHERE a TABELA INTEIRA será deletada.
