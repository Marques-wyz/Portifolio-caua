-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS kart;

-- Usar o banco de dados
USE kart;

-- Criar tabelas
DROP TABLE IF EXISTS Piloto;
DROP TABLE IF EXISTS Equipe;
DROP TABLE IF EXISTS Patrocinador;
DROP TABLE IF EXISTS Etapa;
DROP TABLE IF EXISTS Temporada;

CREATE TABLE Temporada (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero INT NOT NULL
);

CREATE TABLE Etapa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  data_hora DATETIME NOT NULL,
  temporada_id INT,
  FOREIGN KEY (temporada_id) REFERENCES Temporada(id)
);

CREATE TABLE Patrocinador (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE Equipe (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  patrocinador_id INT,
  FOREIGN KEY (patrocinador_id) REFERENCES Patrocinador(id)
);

CREATE TABLE Piloto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  peso DECIMAL(5,2),
  nacionalidade VARCHAR(50),
  capitão BOOLEAN DEFAULT FALSE,
  equipe_id INT,
  FOREIGN KEY (equipe_id) REFERENCES Equipe(id)
);

-- Inserir dados
INSERT INTO Temporada (numero) VALUES (1);

INSERT INTO Etapa (nome, data_hora, temporada_id) VALUES 
('São Paulo', '2024-01-15 14:00:00', 1),
('Rio de Janeiro', '2024-02-20 16:00:00', 1),
('Campo Grande', '2024-03-18 15:00:00', 1),
('Londrina', '2024-04-22 13:00:00', 1),
('Porto Alegre', '2024-05-10 10:00:00', 1);

INSERT INTO Patrocinador (nome) VALUES 
('MotorTech Brasil'),
('Velocidade Extremal'),
('Alta Performance'),
('Turbo Racing'),
('Pneus ProDrive');

INSERT INTO Equipe (nome, patrocinador_id) VALUES 
('Escuderia Veloz', 1),
('Rápidos & Furiosos', 2),
('Fenix Racing', 3),
('Equipe Tempestade', 4),
('Corredores de Aço', 5);

INSERT INTO Piloto (nome, peso, nacionalidade, capitão, equipe_id) VALUES 
('Lucas Andrade', 70.5, 'Brasil', TRUE, 1),
('Renato Figueiredo', 75.0, 'Brasil', FALSE, 1),
('Mateus Silva', 65.0, 'Brasil', FALSE, 2),
('Bruno Almeida', 78.3, 'Brasil', TRUE, 2);

-- Atualizar etapas
SET SQL_SAFE_UPDATES = 0;
UPDATE Etapa SET nome = 'Salvador' WHERE nome = 'Campo Grande';
UPDATE Etapa SET nome = 'Goiânia' WHERE nome = 'Londrina';

-- Excluir patrocinador
UPDATE Equipe SET patrocinador_id = NULL WHERE nome = 'Corredores de Aço';
DELETE FROM Patrocinador WHERE id = 5;

-- Exibir dados dos pilotos
SELECT * FROM Piloto;