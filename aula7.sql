-- ANSI 89
select c.nome, c.data_nascimento, e.cep, e.logradouro, e.numero 
    from Cliente c, Endereco e 
    Where c.codigo = e.codigo_cliente and c.nome = 'Fernando Lima';

-- ANSI 92 (JOINS - INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN)

-- INNER JOIN
select c.nome, c.data_nascimento, e.cep, e.logradouro, e.numero 
	from Cliente c INNER JOIN Endereco e
		ON c.codigo = e.codigo_cliente
		where c.nome = 'Fernando Lima';


-- Mostrar todos os pedidos da cliente 'Maria Francisca'
-- ANSI 89
select c.nome, p.data, p.total, p.status
	from Cliente c, Pedido p
	where c.codigo = p.codigo_cliente and nome ='Maria Francisca';

-- Mostrar todos os pedidos da cliente 'Maria Francisca'
-- ANSI 92
select c.nome, p.data, p.total, p.status
	from Cliente c INNER JOIN Pedido p
	on c.codigo = p.codigo_cliente
	where c.nome = 'Maria Francisca';


-- Mostrar todos os produtos adquirido pela cliente Maria Francisca
-- ANSI 89
select c.nome, ped.codigo, pro.descricao
	from Cliente c, Pedido ped, ItemPedido i, Produto pro
	where c.codigo = ped.codigo_cliente
		  and ped.codigo = i.codped
		  and pro.codigo = i.codprod
		  and c.nome = 'Maria Francisca';


-- Mostrar todos os produtos adquirido pela cliente Maria Francisca
-- ANSI 92
select c.nome, ped.codigo, pro.descricao
	from Cliente c
    	INNER JOIN Pedido ped ON c.codigo = ped.codigo_cliente
    	INNER JOIN ItemPedido i ON ped.codigo = i.codped
    	INNER JOIN Produto pro ON i.codprod = pro.codigo
	where c.nome = 'Maria Francisca';

-- Mostra os status sem repetição
select distinct pro.descricao
	from Cliente c
    	INNER JOIN Pedido ped ON c.codigo = ped.codigo_cliente
    	INNER JOIN ItemPedido i ON ped.codigo = i.codped
    	INNER JOIN Produto pro ON i.codprod = pro.codigo
	where c.nome = 'Maria Francisca';

-- Mostra os status sem repetição 
select distinct status, codigo from pedido;  
select status from pedido;

-- Grup By / SUM()
select p.status,SUM(total) "Soma por status", status from pedido p group by status;















