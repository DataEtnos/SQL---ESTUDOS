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




