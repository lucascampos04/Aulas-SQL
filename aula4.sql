-- Definição da tabela de endereços
CREATE TABLE endereco (
    id INT PRIMARY KEY NOT NULL,
    logradouro VARCHAR(100) NOT NULL
);

-- Definição da tabela de pedidos
CREATE TABLE pedido (
    id INT PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    total FLOAT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)  -- Chave estrangeira referenciando a tabela cliente
);

-- Definição da tabela de itens do pedido
CREATE TABLE itensPedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    subtotal INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),  -- Chave primária composta
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),  -- Chave estrangeira referenciando a tabela pedido
    FOREIGN KEY (id_produto) REFERENCES produtos(id)  -- Chave estrangeira referenciando a tabela produtos
);

-- Definição da tabela de produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    produto VARCHAR(500) NOT NULL,
    valor_unitario FLOAT NOT NULL
);

-- Tabela de relacionamento entre pedido e produto
CREATE TABLE pedido_produto (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),  -- Chave primária composta
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),  -- Chave estrangeira referenciando a tabela pedido
    FOREIGN KEY (id_produto) REFERENCES produtos(id)  -- Chave estrangeira referenciando a tabela produtos
);

-- Definição da tabela de clientes
CREATE TABLE cliente (
    id INT PRIMARY KEY NOT NULL,
    nome VARCHAR(300) NOT NULL,
    id_endereco INT NOT NULL UNIQUE,
    id_pedido INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES endereco(id),  -- Chave estrangeira referenciando a tabela endereco
    FOREIGN KEY (id_pedido) REFERENCES pedido(id)  -- Chave estrangeira referenciando a tabela pedido
);

INSERT INTO cliente(id,nome,id_endereco) VALUES (1,'Lucas',1);

-- Comentários sobre os tipos de relacionamento entre as tabelas
-- Tabela endereco = Um para Um (OneToOne)
-- Tabela pedido = Um para Muitos (OneToMany)
-- Tabela produtos = Muitos para Muitos (ManyToMany)

-- Tabela pedido_produto = Tabela intermediária para relacionamento Muitos para Muitos entre pedido e produto
-- Essa tabela possui uma PRIMARY KEY composta, representando a chave composta da relação Muitos para Muitos.
