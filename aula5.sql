-- Create tables
CREATE TABLE autor (
  id INT PRIMARY KEY NOT NULL,
  nome VARCHAR(200) NOT NULL
);

CREATE TABLE livro (
  id INT PRIMARY KEY NOT NULL,
  titulo_livro VARCHAR(500) NOT NULL
);

CREATE TABLE livrosautores (
  id_livro INT NOT NULL,
  id_autor INT NOT NULL,
  PRIMARY KEY (id_livro, id_autor),
  FOREIGN KEY (id_livro) REFERENCES livro (id),
  FOREIGN KEY (id_autor) REFERENCES autor (id)
);

CREATE TABLE usuario (
  id INT PRIMARY KEY NOT NULL,
  nome VARCHAR(200) NOT NULL
);

CREATE TABLE emprestimo (
  id INT PRIMARY KEY NOT NULL,
  data_emp DATE NOT NULL,
  id_usuario INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

CREATE TABLE emprestimo_lista_livro (
  id_livros INT NOT NULL,
  id_emprestimo INT NOT NULL,
  FOREIGN KEY (id_livros) REFERENCES livro (id),
  FOREIGN KEY (id_emprestimo) REFERENCES emprestimo (id)
);

-- Insert data
INSERT INTO autor (id, nome) VALUES (1, 'Leandor');
INSERT INTO autor (id, nome) VALUES (2, 'Maria');
INSERT INTO livro (id, titulo_livro) VALUES (1, 'Livro 1');
INSERT INTO livro (id, titulo_livro) VALUES (2, 'Livro 2');
INSERT INTO livro (id, titulo_livro) VALUES (3, 'Livro TESTE');
INSERT INTO livrosautores (id_livro, id_autor) VALUES (1, 1);
INSERT INTO livrosautores (id_livro, id_autor) VALUES (3, 1);
INSERT INTO emprestimo (id, data_emp, id_usuario) VALUES (1, TO_DATE('31/07/2023', 'DD/MM/YYYY'), 1);
INSERT INTO usuario (id, nome) VALUES (1, 'Lucas');
INSERT INTO emprestimo_lista_livro (id_livros, id_emprestimo) VALUES (1, 1);

-- Select data
SELECT * FROM autor;
SELECT * FROM livro;
SELECT * FROM livrosautores;
SELECT * FROM emprestimo;
SELECT * FROM emprestimo_lista_livro;