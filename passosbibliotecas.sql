CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE editora(
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);


CREATE TABLE autor(
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(200),
    data_nascimento DATE
);


CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_assunto VARCHAR(500) NOT NULL
);


CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao INT(4),
    editora INT,
    autor INT,
    assunto INT,
    FOREIGN KEY (editora) REFERENCES editora(id_editora),
    FOREIGN KEY (autor) REFERENCES autor(id_autor),
    FOREIGN KEY (assunto) REFERENCES assunto(id_assunto)
);


CREATE TABLE extra(
    id INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50),
    quantidade INT(20),
    preco DOUBLE NOT NULL
);


ALTER TABLE autor
ADD COLUMN email VARCHAR(100);


DROP TABLE extra;


INSERT INTO editora(nome_editora, pais)
VALUES 
('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugal'),
('Editora Bertrand Brasil', 'Brasil');


INSERT INTO autor(nome_autor, data_nascimento, email)
VALUES
('Jorge Amado', '1912-08-10', 'jorginho@email.com'),
('Machado de Assis', '1839-06-21', 'machadinho@gmail.com'),
('Matt Haig', '1975-06-03', 'matt@email.com'),
('Fyodor Dostoevsky', '1821-11-11', 'fiododosto@gmail.com');


INSERT INTO assunto(descricao_assunto)
VALUES
('Ficção'),
('Terror'),
('Romance'),
('Mistério'),
('Histórias em quadrinhos');


INSERT INTO livro(titulo, ano_publicacao, editora, autor, assunto)
VALUES
('Capitães da Areia', 1937, 1, 1, 4),
('Dom Casmurro', 1839, 2, 2, 4),
('Crime e Castigo', 1866, 3, 4, 4),
('A Biblioteca da Meia-Noite', 2020, 3, 3, 4),
('Memórias Póstumas de Brá Cubas', 1881, 1, 2, 3),
('Noites Brancas', 1848, 2, 4, 3); 


UPDATE livro
SET ano_publicacao = 1938
WHERE titulo = 'Capitães da Areia';



DELETE FROM livro
WHERE id_livro = 11;



SELECT livro.titulo AS nome,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao_assunto AS tema,
        livro.ano_publicacao AS ano
FROM livro
JOIN editora ON livro.editora = editora.id_editora
JOIN autor ON livro.autor = autor.id_autor
JOIN assunto ON livro.assunto = assunto.id_assunto;



SELECT livro.titulo AS nome,
        assunto.descricao_assunto AS tema
FROM livro
JOIN assunto ON livro.assunto = assunto.id_assunto
WHERE id_assunto = 4;

