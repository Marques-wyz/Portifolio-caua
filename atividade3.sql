SELECT * FROM Usuario
WHERE data_cadastro > '2023-03-01';

SELECT * FROM Jogo
WHERE preco > 100;

SELECT * FROM Desenvolvedora
WHERE ano_fundacao > 2000;

SELECT J.* 
FROM Jogo J
JOIN Desenvolvedora D ON J.id_desenvolvedora = D.id
WHERE D.nome = 'Valve Corporation';

SELECT AVG(preco) AS preco_medio
FROM Jogo;

SELECT SUM(J.preco) 
FROM Biblioteca B
JOIN Jogo J ON B.id_jogo = J.id
JOIN Usuario U ON B.id_usuario = U.id
WHERE U.nome = 'Carlos Silva';

SELECT J.titulo, J.preco
FROM Jogo J
JOIN Desenvolvedora D ON J.id_desenvolvedora = D.id
WHERE D.nome = 'Rockstar Games'
ORDER BY J.preco DESC
LIMIT 1;

SELECT J.titulo 
FROM Jogo J
JOIN JogoCategoria JC ON J.id = JC.id_jogo
JOIN Categoria C ON JC.id_categoria = C.id
WHERE C.nome = 'RPG';

SELECT U.nome, J.titulo 
FROM Usuario U
JOIN Biblioteca B ON U.id = B.id_usuario
JOIN Jogo J ON B.id_jogo = J.id;

SELECT COUNT(*) 
FROM Jogo J
JOIN Desenvolvedora D ON J.id_desenvolvedora = D.id
WHERE D.pais = 'EUA';
