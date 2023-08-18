-- RELACIONAMENTOS: UMA POR UMA / UMA POR MUITAS / MUITAS POR MUITAS

-- Tabela que contém os endereços de entrega
CREATE TABLE endereco_entregas (
    id INT PRIMARY KEY NOT NULL,
    logradouro VARCHAR(100) NOT NULL
);

-- Tabela master de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sexo CHAR(1) NOT NULL,
    data_nascimento DATE NOT NULL,
    altura FLOAT NOT NULL,
    id_endereco INT NOT NULL UNIQUE, -- Chave estrangeira para a tabela endereco_entregas.
    id_pedido INT NOT NULL, -- Chave estrangeira para a tabela pedido.
    FOREIGN KEY(id_endereco) REFERENCES endereco_entregas(id),
    FOREIGN KEY(id_pedido) REFERENCES pedido(id)
);

-- Inserindo um endereço na tabela endereco_entregas
INSERT INTO endereco_entregas(id, logradouro) VALUES (1, 'XXXXX');

-- Inserindo um cliente com referência ao endereço inserido
INSERT INTO clientes(id, nome, sexo, data_nascimento, altura, id_endereco, id_pedido)
VALUES (1, 'Lucas Oliveira', 'M', TO_DATE('12/03/2020', 'DD/MM/YYYY'), 1.90, 1, 1);

-- Selecionando dados da tabela clientes
SELECT * FROM clientes;

-- # ---------------------- # --

-- RELACIONAMENTO UM POR MUITOS

-- Tabela de produtos
CREATE TABLE produtos (
    id INT NOT NULL PRIMARY KEY,
    nome_produto VARCHAR(300)
);

-- Tabela de pedidos
CREATE TABLE pedido (
    id INT NOT NULL PRIMARY KEY,
    valor_total FLOAT NOT NULL,
    id_produto INT NOT NULL, -- Chave estrangeira para a tabela produtos
    FOREIGN KEY(id_produto) REFERENCES produtos(id)
);

-- Inserindo um produto
INSERT INTO produtos(id, nome_produto) VALUES (1, 'Produto 1');

-- Inserindo um pedido com referência ao produto inserido
INSERT INTO pedido(id, valor_total, id_produto) VALUES (1, 300.0, 1);

-- Selecionando dados da tabela pedido
SELECT * FROM pedido;

-- LIMPEZA
DROP TABLE clientes;
DROP TABLE pedido;
DROP TABLE produtos;
DROP TABLE endereco_entregas;

-- Explicando lógica
/*
A tabela clientes está estabelecendo um relacionamento um por um com a tabela endereco_entregas,
onde cada cliente possui um endereço de entrega único. Além disso, a tabela clientes também
estabelece um relacionamento um por muitos com a tabela pedido, onde cada cliente pode fazer
vários pedidos, sendo que cada pedido está relacionado a produtos da tabela produtos.
*/
