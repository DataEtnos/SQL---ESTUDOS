

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



SELECT * FROM company.rh;


SELECT AVG(MonthlyIncome) AS AVG_INCOME
FROM company.rh
WHERE Department = 'Sales' AND Attrition = 'YES';


SELECT * FROM company.brazil_data;


	SELECT 
	COUNT(DISTINCT UF) AS QTD_UF
	FROM
	company.brazil_data
	WHERE
	minimum_wage > (SELECT 
	AVG(MonthlyIncome) / 4.8 AS AVG_INCOME
	FROM company.rh
	WHERE
	Department = 'Sales'
	AND Attrition = 'YES');
    
    -- ALTERAÇÃO DA TABELA RH
    ALTER TABLE company.rh ADD COLUMN UF_Id INT;
    
    SET SQL_SAFE_UPDATES = 0;
    
    UPDATE company.rh
    SET UF_Id = FLOOR(1 + (RAND() *27));
    
    SELECT * FROM company.rh;
    
    -- sub query  exemplo > aqui ja sabemos que id´s são correlações-- exemplo ficcional
    SELECT * FROM company.rh
    where UF_Id in(
    SELECT Id FROM company.Brazil_Data
	WHERE Minimum_wage < 1400
    );
    
SELECT rh_ext.ï»¿Age, rh_ext.Attrition, rh_ext.BusinessTravel, rh_ext.Department
FROM company.rh AS rh_ext
WHERE rh_ext.MonthlyIncome >
(
SELECT AVG(rh_int.MonthlyIncome) 
FROM company.rh AS rh_int
WHERE rh_int.Department = rh_ext.Department
);

SELECT rh_ext.ï»¿Age, rh_ext.Attrition, rh_ext.BusinessTravel, rh_ext.Department
	,  (
		SELECT AVG(rh_int.MonthlyIncome) 
        FROM company.rh AS rh_int
        WHERE rh_int.Department = rh_ext.Department
    ) AS Inc_per_Department
FROM company.rh AS rh_ext;

    
    
    
    