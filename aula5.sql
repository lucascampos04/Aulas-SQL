CREATE TABLE autores(
    id_autores INT PRIMARY KEY NOT NULL,
    nome_autor VARCHAR(100)
);

CREATE TABLE livros(
    id_livro INT PRIMARY KEY NOT NULL,
    titulo VARCHAR(200),
    ano_publi DATE NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- Tabela de autores_livros (para lidar com a relação muitos-para-muitos entre livros e autores)
CREATE TABLE autores_livros(
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY(id_livro, id_autor),
    FOREIGN KEY(id_livro) REFERENCES livros(id_livro),
    FOREIGN KEY(id_autor) REFERENCES autores(id_autores)
);

CREATE TABLE usuarios(
    id_usuarios INT PRIMARY KEY NOT NULL,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(400)
);

-- Tabela emprestimo
CREATE TABLE emprestimos(
    id_emprestimo INT PRIMARY KEY NOT NULL,
    id_usuario INT NOT NULL,
    id_livros INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuarios),
	FOREIGN KEY(id_livros) REFERENCES livros(id_livro),
    
);