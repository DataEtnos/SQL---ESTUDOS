# SQL---ESTUDOS

Tabela de estudos e contexto de  SQL :

| **Atribuição**                | **Descrição**                                                                                          | **Exemplo de Código SQL**                                                                 |
|-------------------------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| **Extração de Dados**          | Consultar e recuperar dados de diferentes tabelas ou bancos de dados para análise.                     | `SELECT * FROM tabela WHERE condicao;`                                                    |
| **Filtragem de Dados**         | Aplicar filtros para obter apenas as informações relevantes.                                           | `SELECT coluna1, coluna2 FROM tabela WHERE coluna1 = 'valor';`                            |
| **Agregação de Dados**         | Agrupar e sumarizar dados para gerar relatórios.                                                       | `SELECT coluna1, SUM(coluna2) FROM tabela GROUP BY coluna1;`                              |
| **Join entre Tabelas**         | Combinar dados de duas ou mais tabelas relacionadas.                                                   | `SELECT a.coluna1, b.coluna2 FROM tabela_a a JOIN tabela_b b ON a.coluna_id = b.coluna_id;`|
| **Criação de Tabelas**         | Criar uma nova tabela no banco de dados.                                                               | `CREATE TABLE nova_tabela (id INT, nome VARCHAR(100), data DATE);`                        |
| **Atualização de Dados**       | Modificar informações existentes em uma tabela.                                                        | `UPDATE tabela SET coluna = 'novo_valor' WHERE condicao;`                                 |
| **Exclusão de Dados**          | Remover registros desnecessários ou incorretos.                                                        | `DELETE FROM tabela WHERE condicao;`                                                      |
| **Inserção de Dados**          | Adicionar novos registros a uma tabela.                                                                | `INSERT INTO tabela (coluna1, coluna2) VALUES ('valor1', 'valor2');`                      |
| **Indexação de Tabelas**       | Melhorar a performance nas consultas criando índices para colunas específicas.                         | `CREATE INDEX idx_nome ON tabela (coluna);`                                               |
| **Criação de Views**           | Criar uma visualização personalizada dos dados para facilitar consultas frequentes.                    | `CREATE VIEW nome_view AS SELECT coluna1, coluna2 FROM tabela WHERE condicao;`            |

  ## cte 

  -- Exemplo de uso de múltiplas CTEs (6 CTEs)
WITH cte1 AS (
  -- Definição da primeira CTE
  SELECT column1, column2 
  FROM table1
  WHERE condition1
),
cte2 AS (
  -- Definição da segunda CTE
  SELECT column1, column3 
  FROM table2
  WHERE condition2
),
cte3 AS (
  -- Definição da terceira CTE
  SELECT column4, column5 
  FROM table3
  WHERE condition3
),
cte4 AS (
  -- Definição da quarta CTE
  SELECT column6, column7 
  FROM cte1
  JOIN cte2 ON cte1.column1 = cte2.column1
),
cte5 AS (
  -- Definição da quinta CTE
  SELECT column8, column9 
  FROM cte3
  WHERE condition4
),
cte6 AS (
  -- Definição da sexta CTE
  SELECT column10, column11 
  FROM cte4
  JOIN cte5 ON cte4.column6 = cte5.column8
)
-- Consulta final usando as CTEs definidas acima
SELECT * 
FROM cte6
WHERE final_condition;



# subquery

-- Exemplo de uso de 1 subquery
SELECT column1, column2 
FROM (
  -- Subquery
  SELECT column1, column3 
  FROM table1
  WHERE condition1
) AS subquery
WHERE condition2;


#subquery correlacionada

-- Exemplo de uso de uma subquery correlacionada
SELECT column1, column2 
FROM table1 t1
WHERE column3 > (
  -- Subquery correlacionada
  SELECT AVG(column3) 
  FROM table2 t2
  WHERE t2.foreign_key = t1.primary_key
);




