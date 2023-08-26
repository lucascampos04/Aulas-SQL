-- Criação da tabela de autores
CREATE TABLE autores(
    id_autores INT PRIMARY KEY NOT NULL,
    nome_autor VARCHAR(100)
);

-- Criação da tabela de livros
CREATE TABLE livros(
    id_livro INT PRIMARY KEY NOT NULL,
    titulo VARCHAR(200),
    ano_publi DATE NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- Criação da tabela de associação entre autores e livros (muitos-para-muitos)
CREATE TABLE autores_livros(
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY(id_livro, id_autor),
    FOREIGN KEY(id_livro) REFERENCES livros(id_livro),
    FOREIGN KEY(id_autor) REFERENCES autores(id_autores)
);

-- Criação da tabela de usuários
CREATE TABLE usuarios(
    id_usuarios INT PRIMARY KEY NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(400)
);

-- Criação da tabela de empréstimos
CREATE TABLE emprestimos(
    id_emprestimo INT PRIMARY KEY NOT NULL,
    id_usuario INT NOT NULL,
    id_livros INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuarios),
	FOREIGN KEY(id_livros) REFERENCES livros(id_livro)
);

-- Inserção na tabela "autores"
INSERT INTO autores (id_autores, nome_autor)
VALUES (1, 'Autor 1');

-- Consulta na tabela "autores"
SELECT * FROM autores;

-- Inserção na tabela "livros"
INSERT INTO livros (id_livro, titulo, ano_publi, quantidade_estoque)
VALUES (1, 'Livro 1', to_date('29/06/2023', 'DD/MM/YYYY'), 10);

-- Consulta na tabela "livros"
SELECT * FROM livros;

-- Inserção na tabela "autores_livros"
INSERT INTO autores_livros (id_livro, id_autor)
VALUES (1, 1);

-- Consulta na tabela "autores_livros"
SELECT * FROM autores_livros;

-- Inserção na tabela "usuarios"
INSERT INTO usuarios (id_usuarios, nome_usuario, email)
VALUES (1, 'Usuário 1', 'usuario1@example.com');

-- Consulta na tabela "usuarios"
SELECT * FROM usuarios;

-- Inserção na tabela "emprestimos"
INSERT INTO emprestimos (id_emprestimo, id_usuario, id_livros, data_emprestimo, data_devolucao)
VALUES (1, 1, 1, to_date('29/06/2023', 'DD/MM/YYYY'), to_date('29/06/2024', 'DD/MM/YYYY'));

-- Consulta na tabela "emprestimos"
SELECT * FROM emprestimos;


-- tabela "autores" contém informações sobre os autores.
-- tabela "livros" contém informações sobre os livros.
-- tabela "autores_livros" armazena os relacionamentos entre autores e livros.
-- tabela "usuarios" guarda informações sobre os usuários da biblioteca.