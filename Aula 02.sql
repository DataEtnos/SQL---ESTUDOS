CREATE DATABASE comunidade;
USE comunidade;
TRUNCATE TABLE aluno;
TRUNCATE TABLE cursos;
SELECT * FROM aluno;
SELECT * FROM cursos;
-- VARCHAR(100) --> EXTRACT(YEAR FROM CAST(nascimento IN REAL))


                                            




SELECT
	  nome, EXTRACT(YEAR FROM nascimento) AS 'Ano_Nascimento' ,
    CASE -- categórica
		WHEN DAYOFWEEK(nascimento) = 1 THEN 'Domingo'
        WHEN DAYOFWEEK(nascimento) = 2 THEN 'Segunda'
        WHEN DAYOFWEEK(nascimento) = 3 THEN 'Terça'
        WHEN DAYOFWEEK(nascimento) = 4 THEN 'Quarta'
        WHEN DAYOFWEEK(nascimento) = 5 THEN 'Quinta'
        WHEN DAYOFWEEK(nascimento) = 6 THEN 'Sexta'
        WHEN DAYOFWEEK(nascimento) = 7 THEN 'Sábado'
    END AS 'Dia_da_Semana'
    , EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM nascimento) AS 'Idade'
    , c.*
FROM aluno
LEFT JOIN cursos c -- INNER JOIN == JOIN
	ON aluno.matricula = c.matricula;








/*
DROP TABLE IF EXISTS aluno;
CREATE TABLE aluno(
	matricula INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nascimento DATE,
    PRIMARY KEY (matricula)
);

DROP TABLE IF EXISTS cursos;
CREATE TABLE cursos(
	cod_curso VARCHAR(50) NOT NULL,
    nome_curso VARCHAR(100),
    materia VARCHAR(50),
    matricula INT
    -- FOREIGN KEY (matricula) 
	-- REFERENCES aluno(matricula)
	-- ON DELETE CASCADE
);


INSERT INTO aluno (nome, nascimento) VALUES ('Naruto Uzumaki', '1994-02-15'),
											('Matheus de Almeida', '1994-07-20'),
											('Igor da Fonseca', '1988-02-20'),
											('Beatriz Godoi', '1996-02-15'),
											('Ross Geller', '1970-02-15');

INSERT INTO aluno (nome, nascimento) VALUES ('Fernando da Silva', '1994-02-15'),
											('Grazi Lacerda', '1994-07-20'),
											('Vitor Fábio', '1988-02-20'),
											('Lucas Silva e Silva', '1996-02-15'),
											('Gabriella Damácio', '1970-02-15');

                                            
INSERT INTO cursos (cod_curso, nome_curso, materia, matricula) VALUES ('ENGQ120241', 'Engenharia Química', 'Processos', 2),
																	  ('COMP120241', 'Ciência da Computação', 'Inteligência Artificial', 3),
                                                                      ('FIS120241','Física','Mecânica',5),
                                                                      ('FIS120241','Física','Mecânica',1),
                                                                      ('GEO120241','Paleontologia','Evolução',10);

INSERT INTO cursos (cod_curso, nome_curso, materia, matricula) VALUES ('DADOS120241', 'Ciência de Dados', 'Estrutura de Dados', 7),
																	  ('MAT120241', 'Matemática Bacharel', 'Álgebra Linear', 9),
                                                                      ('LICMAT120241','Matemática Licenciatura', 'Didádica',8);

*/

/*
1 = Domingo, 
2 = Segunda,
3 = Terça,
4 = Quarta,
5 = Quinta,
6 = Sexta
7 = Sábado

CASE
    WHEN DAYOFWEEK(nascimento) = 1 THEN "Domingo"
    WHEN DAYOFWEEK(nascimento) = 2 THEN "Segunda"
    ...
    WHEN DAYOFWEEK(nascimento) = 7 THEN "Sábado"
END AS 'Dia_da_Semana'


-- Cálculo da Idade
SELECT EXTRACT(YEAR FROM CURRENT_DATE) AS 'Ano_Atual'
	,  EXTRACT(YEAR FROM nascimento) AS "Ano_Nascimento"
    ,  EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM nascimento) AS 'Idade'
FROM aluno
;

*/