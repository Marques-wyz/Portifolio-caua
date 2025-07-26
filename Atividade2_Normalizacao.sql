/* ATIVIDADE 2 - NORMALIZAÇÃO */
SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS atividade3;
CREATE DATABASE atividade3;
USE atividade3;

/* CRIAÇÃO DA TABELA 1 */
CREATE TABLE cliente (
	idCliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

/* INSERÇÃO DE DADOS DA TABELA 1 */
INSERT INTO cliente (nome, endereco, telefone) VALUES
('Maria Silva', 'Rua das Flores 123', '(11) 98765-4321'),
('João Santos', 'Avenida Paulista 1000', '(21) 91234-5678'),
('Ana Oliveira', 'Rua do Carmo 45', '(51) 93456-7890'),
('Carlos Souza', 'Rua das Palmeiras 555', '(55) 95678-1234'),
('Mariana Costa', 'Avenida Brasil 200', '(81) 99876-5432');

/* CRIAÇÃO DA TABELA 2 */
CREATE TABLE locacao (
	idLocacao INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    idCliente INT, 
    idFilme INT,
    tituloFilme VARCHAR(100),
    devolucao DATE,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* INSERÇÃO DE DADOS DA TABELA 2 */
INSERT INTO locacao (tituloFilme, devolucao) VALUES 
('O Poderoso Chefão', '2024-11-01'),
('Interestelar', '2024-11-05'),
('A Origem', '2024-11-08'),
('O Senhor dos Anéis: A Sociedade do Anel', '2024-11-10'),
('Matrix', '2024-11-12');

/* ==================================================================== */

/* CRIE AS NORMALIZAÇÕES LOGO ABAIXO */
/* ==================== NORMALIZAÇÃO 1FN ==================== */
/* 1FN: Eliminar campos multivalorados e compostos */

/* Criando tabela de endereço separada */
CREATE TABLE endereco (
    idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    endereco VARCHAR(255),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* Inserindo endereços individuais com relacionamento ao cliente */
INSERT INTO endereco (endereco, idCliente) VALUES
('Rua das Flores 123', 1),
('Avenida Paulista 1000', 2),
('Rua do Carmo 45', 3),
('Rua das Palmeiras 555', 4),
('Avenida Brasil 200', 5);

/* Criando tabela de telefone separada */
CREATE TABLE telefone (
    idTelefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

/* Inserindo telefones individuais */
INSERT INTO telefone (numero, idCliente) VALUES
('(11) 98765-4321', 1),
('(21) 91234-5678', 2),
('(51) 93456-7890', 3),
('(55) 95678-1234', 4),
('(81) 99876-5432', 5);

/* Removendo colunas de endereço e telefone da tabela cliente para evitar duplicidade */
ALTER TABLE cliente
DROP COLUMN endereco,
DROP COLUMN telefone;

-- Comentário:
-- A tabela cliente foi normalizada para a 1FN separando os dados multivalorados (telefone) e compostos (endereço) em tabelas próprias.
-- Isso elimina a redundância e permite que um cliente tenha múltiplos telefones ou endereços no futuro.

/* ==================== NORMALIZAÇÃO 2FN ==================== */
/* 2FN: Eliminar dependência parcial – separando filmes da locação */

/* Criando a tabela de filmes */
CREATE TABLE filme (
    idFilme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100)
);

/* Inserindo os filmes únicos */
INSERT INTO filme (titulo) VALUES
('O Poderoso Chefão'),
('Interestelar'),
('A Origem'),
('O Senhor dos Anéis: A Sociedade do Anel'),
('Matrix');

/* Atualizando a tabela locacao para incluir idFilme com base no título */

-- Passo 1: Atualizar os registros de locacao com o idFilme correto
UPDATE locacao SET idFilme = (SELECT idFilme FROM filme WHERE titulo = 'O Poderoso Chefão') 
WHERE tituloFilme = 'O Poderoso Chefão';

UPDATE locacao SET idFilme = (SELECT idFilme FROM filme WHERE titulo = 'Interestelar') 
WHERE tituloFilme = 'Interestelar';

UPDATE locacao SET idFilme = (SELECT idFilme FROM filme WHERE titulo = 'A Origem') 
WHERE tituloFilme = 'A Origem';

UPDATE locacao SET idFilme = (SELECT idFilme FROM filme WHERE titulo = 'O Senhor dos Anéis: A Sociedade do Anel') 
WHERE tituloFilme = 'O Senhor dos Anéis: A Sociedade do Anel';

UPDATE locacao SET idFilme = (SELECT idFilme FROM filme WHERE titulo = 'Matrix') 
WHERE tituloFilme = 'Matrix';

/* Passo 2: Criar a chave estrangeira e remover a coluna redundante */
ALTER TABLE locacao
ADD CONSTRAINT fk_filme FOREIGN KEY (idFilme) REFERENCES filme(idFilme);

ALTER TABLE locacao
DROP COLUMN tituloFilme;

-- Comentário:
-- A tabela locacao foi normalizada para a 2FN ao separar o título do filme em uma nova tabela (filme).
-- Agora a locação referencia apenas o idFilme, evitando dependência parcial e repetição de títulos.
