-- Estrutura do CTE
WITH consulta AS (
...
),
consulta_2 AS (
...
),
...

-- Estrutura do CTE
WITH consulta_1 AS (
	SELECT * FROM company.rh
    WHERE ...
),
consulta_2 AS (
	SELECT * FROM consulta_1
    LEFT JOIN ...
),
...
SELECT * FROM consulta_n

-- Exemplo introdutório
-- Primeira consulta se chama get_male e filtra todos os funcionários Male
-- Segunda consulta se chama get_avg_distance e pega a média de DistanceFromHome de TODOS funcionários
-- Terceira consulta se chama join_information e junta as informações (CROSS JOIN)
-- Finalize pegando os funcionários Male com DistanceFromHome menor que a média

SELECT * FROM company.brazil_data;
SELECT * FROM company.rh;


WITH get_male AS (
	SELECT * FROM company.rh
    WHERE Gender = 'Male'
),
get_avg_distance AS (
	SELECT AVG(DistanceFromHome) AS AvgDistance
    FROM company.rh 
),
join_information AS (
	SELECT gm.*, gad.AvgDistance
    FROM get_male AS gm
    CROSS JOIN get_avg_distance AS gad
)
SELECT * FROM join_information 
WHERE DistanceFromHome < AvgDistance;

CREATE TABLE company.Brazil_Data (
    UF VARCHAR(2),
    Minimum_Wage INT
);

INSERT INTO company.Brazil_Data (UF, Minimum_Wage) VALUES
('AC', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('AL', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('AP', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('AM', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('BA', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('CE', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('DF', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('ES', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('GO', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('MA', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('MT', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('MS', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('MG', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('PA', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('PB', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('PR', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('PE', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('PI', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('RJ', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('RN', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('RS', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('RO', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('RR', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('SC', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('SP', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('SE', FLOOR(1100 + (RAND() * (1500 - 1100)))),
('TO', FLOOR(1100 + (RAND() * (1500 - 1100))));

ALTER TABLE company.brazil_data ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;


SELECT * from company.rh;






















-- Exemplo um pouco mais trabalhado
-- Primeiro, crie uma consulta get_female_att para filtrar funcionárias mulheres com Attrition = Yes
-- Depois, crie add_UF onde para Education = 1, a UF_Id será 10. Para Education = 2, será 15, para Education = 3, será 20.
-- Para as demais será 22. (CASE WHEN)
-- Na terceira consulta, crie get_minimum_wage onde você seleciona as colunas UF_ID e MinimumWage de company.brazil_data
-- e o  será o menor valor entre Minimum_Wage e 1250 (LEAST)
-- Depois, traga a informação de MinimumWage com o nome UFMinimumWage
-- Por fim, faça uma contagem por cada salário mínimo

-- Pegar female com Attrition = Yes
WITH get_female AS (
  SELECT * 
  FROM company.rh
  WHERE UPPER(Gender) = 'FEMALE' 
    AND UPPER(Attrition) = 'YES'
),
add_UF AS (
  SELECT * ,
         CASE 
           WHEN Education = 1 THEN 10 
           WHEN Education = 2 THEN 15 
           WHEN Education = 3 THEN 20 
           ELSE 22 
         END AS CLASS_UF
  FROM get_female
),
get_minimum_wage AS (
  SELECT Id, LEAST(1250, Minimum_Wage) AS MinimumWage 
  FROM company.brazil_data
),
join_information AS (
  SELECT au.Gender, au.Attrition, au.Education, au.CLASS_UF, 
         COALESCE(gmw.MinimumWage, 1250) AS MinimumWage  -- Substituir NULL por 1250 se não houver correspondência
  FROM add_UF AS au 
  LEFT JOIN get_minimum_wage AS gmw 
  ON au.CLASS_UF = gmw.Id
)
SELECT MinimumWage, COUNT(*) AS QtdFuncionarios 
FROM join_information 
GROUP BY MinimumWage 
ORDER BY MinimumWage;


SELECT VERSION();





