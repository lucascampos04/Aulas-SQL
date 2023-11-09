CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome_cliente VARCHAR(50),
    email_cliente VARCHAR(50)
);
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);


CREATE TABLE itens_pedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(8, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(50),
    categoria VARCHAR(50)
);

SELECT 
    c.cliente_id, -- ID do cliente
    p.pedido_id, -- ID do pedido
    p.cliente_id, -- ID do cliente associado ao pedido
    p.valor_total, -- Valor total do pedido
    p.data_pedido, -- Data do pedido
    ip.item_id -- ID do item do pedido
FROM 
    clientes c -- Alias 'c' para a tabela clientes
JOIN 
    pedidos p ON c.cliente_id = p.cliente_id -- Junta a tabela clientes com a tabela pedidos usando a condição de que os IDs dos clientes coincidam
JOIN 
    itens_pedido ip ON p.pedido_id = ip.pedido_id; -- Junta a tabela resultante com a tabela itens_pedido usando a condição de que os IDs dos pedidos coincidam

CREATE TABLE fornecedores (
    fornecedor_id INT PRIMARY KEY,
    nome_fornecedor VARCHAR(50),
    endereco VARCHAR(100)
);
CREATE TABLE compras (
    compra_id INT PRIMARY KEY,
    fornecedor_id INT,
    data_compra DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(fornecedor_id)
);



CREATE TABLE itens_compra (
    item_id INT PRIMARY KEY,
    compra_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(8, 2),
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
CREATE TABLE funcionarios (
    funcionario_id INT PRIMARY KEY,
    nome_funcionario VARCHAR(50),
    cargo VARCHAR(50)
);



CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    funcionario_id INT,
    data_venda DATE,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(funcionario_id)
);
CREATE TABLE itens_venda (
    item_id INT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(8, 2),
    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
