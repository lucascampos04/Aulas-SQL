-- Criando a tabela "clientes" com suas colunas e restrições
CREATE TABLE clientes (
    id INT PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sexo CHAR(1) NOT NULL,
    data_nascimento DATE NOT NULL,
    altura FLOAT NOT NULL
);

-- Adicionando a coluna "rg" à tabela "clientes"
ALTER TABLE clientes ADD rg CHAR(10);

-- Modificando o tamanho da coluna "rg"
ALTER TABLE clientes MODIFY rg CHAR(12);

-- Renomeando a coluna "rg" para "REGISTRO_GERAL"
ALTER TABLE clientes RENAME COLUMN rg TO REGISTRO_GERAL;

-- Renomeando a tabela "clientes" para "NEW_TABLE"
ALTER TABLE clientes RENAME TO new_table;

-- Alterando o nome da tabela "new_table" de volta para "clientes"
ALTER TABLE new_table RENAME TO clientes;

-- Excluindo a coluna "REGISTRO_GERAL" da tabela "clientes"
ALTER TABLE clientes DROP COLUMN REGISTRO_GERAL;

-- Excluindo a tabela "clientes"
DROP TABLE clientes;

-- Inserindo dados na tabela "clientes"
INSERT INTO clientes (id, nome, sexo, data_nascimento, altura) 
VALUES (1, 'Lucas Oliviera', 'M', TO_DATE('29/06/2004', 'DD/MM/YYYY'), 1.83);

INSERT INTO clientes (id, nome, sexo, data_nascimento, altura) 
VALUES (2, 'Pedro Oliviera', 'M', TO_DATE('19/04/2004', 'DD/MM/YYYY'), 1.93);

INSERT INTO clientes (id, nome, sexo, data_nascimento, altura) 
VALUES (3, 'Tamara Oliviera', 'F', TO_DATE('29/02/2004', 'DD/MM/YYYY'), 1.63);

-- Atualizando o nome do cliente com ID 1
UPDATE clientes SET nome = 'Lucas Oliveira' WHERE id = 1;

-- Atualizando o número de RG do cliente com ID 2
UPDATE clientes SET rg = '91.234.567' WHERE id = 2;

-- Deletando o cliente com ID 1
DELETE FROM clientes WHERE id = 1;

-- # -------------------------------------------------------------------- # --

-- DDL (Data Definition Language) - Linguagem de Definição de Dados
-- CREATE, ALTER, DROP

-- DML (Data Manipulation Language) - Linguagem de Manipulação de Dados
-- INSERT, UPDATE, DELETE

-- # -------------------------------------------------------------------- # --

-- DIFERENÇA ENTRE UPDATE E ALTER

-- ALTER é usado para modificar a estrutura da tabela, como adicionar ou remover colunas.
-- UPDATE é usado para modificar os dados existentes em uma tabela, como atualizar valores de colunas.