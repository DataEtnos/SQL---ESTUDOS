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


| Tipo                           | Descrição                                                                               | Exemplo                                                                                                      |
|--------------------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| **CTE (Common Table Expression)**        | Uma expressão de tabela comum que permite definir uma tabela temporária para a consulta, facilitando a legibilidade e a organização. | ```sql                                                                                                      |
|                                |                                                                                         | WITH cte_example AS (                                   |
|                                |                                                                                         |   SELECT column1, column2                               |
|                                |                                                                                         |   FROM table1                                         |
|                                |                                                                                         |   WHERE condition1                                     |
|                                |                                                                                         | )                                                    |
|                                |                                                                                         | SELECT *                                            |
|                                |                                                                                         | FROM cte_example                                     |
|                                |                                                                                         | WHERE condition2;                                    |
| **Subquery**                  | Uma consulta dentro de outra consulta, usada para filtrar ou manipular dados.          | ```sql                                                                                                      |
|                                |                                                                                         | SELECT column1, column2                               |
|                                |                                                                                         | FROM table1 t1                                       |
|                                |                                                                                         | WHERE column3 > (                                    |
|                                |                                                                                         |   SELECT AVG(column3)                                 |
|                                |                                                                                         |   FROM table2                                       |
|                                |                                                                                         | );                                                  |
| **Subquery Correlacionada**   | Uma subquery que se relaciona com a linha atual da consulta externa, podendo acessar colunas da tabela externa. | ```sql                                                                                                      |
|                                |                                                                                         | SELECT column1, column2                               |
|                                |                                                                                         | FROM table1 t1                                       |
|                                |                                                                                         | WHERE column3 > (                                    |
|                                |                                                                                         |   SELECT AVG(column3)                                 |
|                                |                                                                                         |   FROM table2 t2                                     |
|                                |                                                                                         |   WHERE t2.foreign_key = t1.primary_key               |
|                                |                                                                                         | );                                                  |
| **CASE WHEN**                 | Estrutura condicional que permite retornar valores diferentes com base em condições especificadas. | ```sql                                                                                                      |
|                                |                                                                                         | SELECT column1,                                      |
|                                |                                                                                         |   CASE                                              |
|                                |                                                                                         |     WHEN condition1 THEN 'Value1'                   |
|                                |                                                                                         |     WHEN condition2 THEN 'Value2'                   |
|                                |                                                                                         |     ELSE 'OtherValue'                               |
|                                |                                                                                         |   END AS NewColumn                                  |
|                                |                                                                                         | FROM table1;                                       |
| **INNER JOIN**                | Retorna apenas as linhas em que há correspondência entre as duas tabelas.            | ```sql                                                                                                      |
|                                |                                                                                         | SELECT t1.column1, t2.column2                         |
|                                |                                                                                         | FROM table1 t1                                        |
|                                |                                                                                         | INNER JOIN table2 t2 ON t1.id = t2.foreign_id;       |
| **LEFT JOIN**                 | Retorna todas as linhas da tabela da esquerda e as correspondências da tabela da direita; se não houver correspondência, retorna NULL. | ```sql                                                                                                      |
|                                |                                                                                         | SELECT t1.column1, t2.column2                         |
|                                |                                                                                         | FROM table1 t1                                        |
|                                |                                                                                         | LEFT JOIN table2 t2 ON t1.id = t2.foreign_id;        |
| **RIGHT JOIN**                | Retorna todas as linhas da tabela da direita e as correspondências da tabela da esquerda; se não houver correspondência, retorna NULL. | ```sql                                                                                                      |
|                                |                                                                                         | SELECT t1.column1, t2.column2                         |
|                                |                                                                                         | FROM table1 t1                                        |
|                                |                                                                                         | RIGHT JOIN table2 t2 ON t1.id = t2.foreign_id;       |
| **CROSS JOIN**                | Retorna o produto cartesiano das duas tabelas, combinando todas as linhas de ambas as tabelas. | ```sql                                                                                                      |
|                                |                                                                                         | SELECT t1.column1, t2.column2                         |
|                                |                                                                                         | FROM table1 t1                                        |
|                                |                                                                                         | CROSS JOIN table2 t2;                                 |

| Função                    | Descrição                                                                               | Exemplo                                                                                                      |
|--------------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| **Funções de Data**      | Funções que manipulam e formatam valores de data e hora.                               | ```sql                                                                                                      |
|                          |                                                                                         | SELECT CURRENT_DATE AS Today;                           |
|                          |                                                                                         | SELECT DATE_FORMAT(date_column, '%Y-%m-%d') AS FormattedDate FROM table1;  |
| **CAST**                 | Converte um valor de um tipo de dado para outro tipo.                                  | ```sql                                                                                                      |
|                          |                                                                                         | SELECT CAST(column1 AS VARCHAR(50)) AS NewColumn FROM table1;                                              |
| **BETWEEN**             | Filtra resultados que estão dentro de um intervalo especificado.                       | ```sql                                                                                                      |
|                          |                                                                                         | SELECT * FROM table1 WHERE column1 BETWEEN value1 AND value2;                                              |
| **UNION**                | Combina os resultados de duas ou mais consultas, eliminando duplicatas.                | ```sql                                                                                                      |
|                          |                                                                                         | SELECT column1 FROM table1                                |
|                          |                                                                                         | UNION                                                 |
|                          |                                                                                         | SELECT column1 FROM table2;                            |
| **UPPER**                | Converte todos os caracteres de uma string para maiúsculas.                           | ```sql                                                                                                      |
|                          |                                                                                         | SELECT UPPER(column1) AS UpperCase FROM table1;                                                       |
| **LOWER**                | Converte todos os caracteres de uma string para minúsculas.                           | ```sql                                                                                                      |
|                          |                                                                                         | SELECT LOWER(column1) AS LowerCase FROM table1;                                                       |
| **LIKE**                 | Filtra resultados com base em padrões usando caracteres curinga.                       | ```sql                                                                                                      |
|                          |                                                                                         | SELECT * FROM table1 WHERE column1 LIKE 'A%';             |
|                          |                                                                                         | SELECT * FROM table1 WHERE column1 LIKE '%B';             |
| **REPLACE**              | Substitui ocorrências de uma substring por outra em uma string.                       | ```sql                                                                                                      |
|                          |                                                                                         | SELECT REPLACE(column1, 'old_value', 'new_value') AS NewColumn FROM table1;                             |
| **CONCAT**               | Combina duas ou mais strings em uma única string.                                     | ```sql                                                                                                      |
|                          |                                                                                         | SELECT CONCAT(column1, ' ', column2) AS FullName FROM table1;                                           |
| **DISTINCT**             | Remove duplicatas dos resultados de uma consulta.                                     | ```sql                                                                                                      |
|                          |                                                                                         | SELECT DISTINCT column1 FROM table1;                                                                        |


