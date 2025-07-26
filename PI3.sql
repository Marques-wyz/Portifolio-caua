-- 1. CRIAÇÃO DO BANCO DE DADOS
DROP DATABASE IF EXISTS upwayz;
CREATE DATABASE upwayz;
USE upwayz;

-- 2. CRIAÇÃO DAS TABELAS

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT DEFAULT 0
);

CREATE TABLE EntradaEstoque (
    id_entrada INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_usuario INT NOT NULL,
    quantidade INT NOT NULL,
    data_entrada DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE SaidaEstoque (
    id_saida INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_usuario INT NOT NULL,
    quantidade INT NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- 3. INSERÇÃO DE DADOS (pelo menos 5 por tabela)

-- Usuarios
INSERT INTO Usuario (nome_usuario, senha, tipo) VALUES
('admin', 'admin123', 'Gerente'),
('joao', 'joao123', 'Funcionario'),
('maria', 'maria123', 'Funcionario'),
('paulo', 'paulo123', 'Funcionario'),
('ana', 'ana123', 'Funcionario');

-- Produtos
INSERT INTO Produto (codigo, nome, descricao, tamanho, cor, preco_custo, preco_venda, quantidade_estoque) VALUES
('P001', 'Camiseta Branca', 'Camiseta básica', 'M', 'Branco', 20.00, 39.90, 100),
('P002', 'Calça Jeans', 'Calça slim', '42', 'Azul', 50.00, 99.90, 50),
('P003', 'Vestido Floral', 'Vestido curto', 'G', 'Rosa', 35.00, 89.90, 30),
('P004', 'Jaqueta Couro', 'Jaqueta sintética', 'GG', 'Preto', 100.00, 199.90, 20),
('P005', 'Tênis Esportivo', 'Tênis corrida', '40', 'Cinza', 80.00, 149.90, 15);

-- Entradas
INSERT INTO EntradaEstoque (id_produto, id_usuario, quantidade, data_entrada) VALUES
(1, 1, 20, '2025-06-01'),
(2, 2, 15, '2025-06-02'),
(3, 1, 10, '2025-06-03'),
(4, 3, 5, '2025-06-04'),
(5, 4, 8, '2025-06-05');

-- Saídas
INSERT INTO SaidaEstoque (id_produto, id_usuario, quantidade, data_saida) VALUES
(1, 2, 5, '2025-06-06'),
(2, 3, 2, '2025-06-06'),
(3, 4, 1, '2025-06-07'),
(4, 2, 1, '2025-06-07'),
(5, 5, 2, '2025-06-08');

-- 4. CONSULTAS

-- Exibir todos os dados
SELECT * FROM Usuario;
SELECT * FROM Produto;
SELECT * FROM EntradaEstoque;
SELECT * FROM SaidaEstoque;

-- Consultas com WHERE
SELECT * FROM Usuario WHERE tipo = 'Gerente';
SELECT * FROM Produto WHERE preco_venda > 100;
SELECT * FROM EntradaEstoque WHERE quantidade > 10;
SELECT * FROM SaidaEstoque WHERE data_saida = '2025-06-06';

-- 5. UPDATE (edição de um registro por tabela)
UPDATE Usuario SET senha = 'nova123' WHERE nome_usuario = 'joao';
UPDATE Produto SET preco_venda = 129.90 WHERE codigo = 'P005';
UPDATE EntradaEstoque SET quantidade = 25 WHERE id_entrada = 1;
UPDATE SaidaEstoque SET quantidade = 3 WHERE id_saida = 5;

-- 6. DELETE (exclusão de um registro por tabela)
DELETE FROM Usuario WHERE nome_usuario = 'ana';
DELETE FROM Produto WHERE codigo = 'P004';
DELETE FROM EntradaEstoque WHERE id_entrada = 2;
DELETE FROM SaidaEstoque WHERE id_saida = 4;
-- Apagar registros que dependem do produto P004 (id_produto = 4)
DELETE FROM EntradaEstoque WHERE id_produto = 4;
DELETE FROM SaidaEstoque WHERE id_produto = 4;

-- Apagar registros que dependem da usuária Ana (id_usuario = 5)
DELETE FROM SaidaEstoque WHERE id_usuario = 5;
DELETE FROM EntradaEstoque WHERE id_usuario = 5;

-- Agora sim, apagar Ana e o produto P004
DELETE FROM Usuario WHERE nome_usuario = 'ana';
DELETE FROM Produto WHERE codigo = 'P004';
-- Corrigir exclusão da usuária Ana e do produto P004

-- 1. Remover registros que usam o usuário 'ana' (id_usuario = 5)
DELETE FROM SaidaEstoque WHERE id_usuario = 5;
DELETE FROM EntradaEstoque WHERE id_usuario = 5;

-- 2. Remover registros que usam o produto 'P004' (id_produto = 4)
DELETE FROM SaidaEstoque WHERE id_produto = 4;
DELETE FROM EntradaEstoque WHERE id_produto = 4;

-- 3. Agora apagar o usuário e o produto
DELETE FROM Usuario WHERE nome_usuario = 'ana';
DELETE FROM Produto WHERE codigo = 'P004';

