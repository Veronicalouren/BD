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