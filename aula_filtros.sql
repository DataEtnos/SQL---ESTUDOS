SELECT COUNT(*) FROM mkt.bank
WHERE job = 'unemployed'
;

SELECT * FROM mkt.bank;

-- Entramos em contato com 128 pessoas.alter

SELECT COUNT(*) FROM mkt.bank
WHERE job = 'unemployed' AND month = 'apr' AND y = 'yes'
;

-- 2 pessoas estavam desempregadas, foram contatadas em abril e aceitaram nosso produto

-- Filtra emprego como desempregado OU estudante
SELECT COUNT(*) FROM mkt.bank
WHERE job = 'unemployed' OR job = 'student';

-- Filtrar todos empregos entre os parenteses
SELECT COUNT(*) FROM mkt.bank
WHERE job IN ('unemployed','student', 'blue collar');


SELECT * FROM mkt.bank
WHERE (job = 'unemployed' OR job='student') AND month = 'apr' AND y = 'yes';


SELECT * FROM mkt.bank
WHERE (month = 'jan' AND y='no') OR (month = 'feb' AND y = 'yes');


-- Campanha herdeiro
SELECT * FROM mkt.bank
WHERE NOT  y = 'yes' AND job NOT in ('unemployed', 'student') AND age BETWEEN 18 AND 30;

-- WHERE age IS NULL / WHERE job IS NOT NULL


-- FILTRO DE STRINGS
CREATE TABLE mkt.nomes (
    primeiro_nome VARCHAR(50),
    ultimo_nome VARCHAR(50)
);

INSERT INTO mkt.nomes (primeiro_nome, ultimo_nome) VALUES 
('Ana', 'Silva'),
('Antônio', 'Costa'),
('Aline', 'Machado'),
('André', 'Lima'),
('Alice', 'Santos'),
('Alberto', 'Oliveira'),
('Amanda', 'Pereira'),
('Alex', 'Martins'),
('Aurora', 'Souza'),
('Arthur', 'Rocha'),
('Augusto', 'Almeida'),
('Ariel', 'Barros'),
('Anita', 'Carvalho'),
('Anderson', 'Dias'),
('Aurélio', 'Fernandes'),
('Afonso', 'Gonçalves'),
('Alessandra', 'Henriques'),
('Alan', 'Ishida'),
('Alana', 'Jardim'),
('Alexandre', 'Kuwabara');

SELECT * FROM mkt.nomes;

-- Filtro de string
SELECT * FROM mkt.nomes
WHERE UPPER(primeiro_nome) = 'ANA'; -- filtra Ana, ANA< ana 

-- Filtro com nome que contem ___
SELECT * FROM mkt.nomes 
WHERE UPPER(primeiro_nome) LIKE 'GUSTO%';

-- BETWEEN com STRING
SELECT * FROM mkt.nomes 
WHERE UPPER(primeiro_nome) BETWEEN 'AB' AND 'AR';