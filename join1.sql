SELECT 
    A.nome AS 'nome do animal',
    T.nome AS 'nome do tutor',
    T.cidade AS 'cidade do tutor'
FROM 
    Animais AS A 
INNER JOIN 
    Tutores AS T ON A.idTutor_fk = T.idTutor; 

SELECT 
    Animais.nome,
    Tutores.nome,
    Tutores.cidade
FROM
    Animais
INNER JOIN
    Tutores Animais.idTutor_fk = Tutores.idTutor; 

    -- Exercício 07 
SELECT 
    categorias.nome AS Categoria,
    produtos.nome AS Produto
FROM categorias
LEFT JOIN produtos
ON categorias.idCategoria = produtos.idCategoria_fk;

-- Exercício 08 
SELECT 
    categorias.nome AS Categoria
FROM produtos
RIGHT JOIN categorias
ON produtos.idCategoria_fk = categorias.idCategoria
WHERE produtos.idProduto IS NULL;