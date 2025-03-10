WITH vendas_por_produto AS (
    SELECT
        p.id_produto,
        p.nome_produto,
        EXTRACT(YEAR FROM t.data_transacao) AS ano,
        SUM(t.quantidade) AS total_vendido
    FROM
        transacoes_2020 t
    JOIN
        produtos p ON t.id_produto = p.id_produto
    GROUP BY
        p.id_produto, p.nome_produto, ano
    UNION ALL
    SELECT
        p.id_produto,
        p.nome_produto,
        EXTRACT(YEAR FROM t.data_transacao) AS ano,
        SUM(t.quantidade) AS total_vendido
    FROM
        transacoes_2021 t
    JOIN
        produtos p ON t.id_produto = p.id_produto
    GROUP BY
        p.id_produto, p.nome_produto, ano
    UNION ALL
    SELECT
        p.id_produto,
        p.nome_produto,
        EXTRACT(YEAR FROM t.data_transacao) AS ano,
        SUM(t.quantidade) AS total_vendido
    FROM
        transacoes_2022 t
    JOIN
        produtos p ON t.id_produto = p.id_produto
    GROUP BY
        p.id_produto, p.nome_produto, ano
    UNION ALL
    SELECT
        p.id_produto,
        p.nome_produto,
        EXTRACT(YEAR FROM t.data_transacao) AS ano,
        SUM(t.quantidade) AS total_vendido
    FROM
        transacoes_2023 t
    JOIN
        produtos p ON t.id_produto = p.id_produto
    GROUP BY
        p.id_produto, p.nome_produto, ano
    UNION ALL
    SELECT
        p.id_produto,
        p.nome_produto,
        EXTRACT(YEAR FROM t.data_transacao) AS ano,
        SUM(t.quantidade) AS total_vendido
    FROM
        transacoes_2024 t
    JOIN
        produtos p ON t.id_produto = p.id_produto
    GROUP BY
        p.id_produto, p.nome_produto, ano
)
SELECT
    id_produto,
    nome_produto,
    ano,
    total_vendido,
    ranking
FROM (
    SELECT
        id_produto,
        nome_produto,
        ano,
        total_vendido,
        RANK() OVER (PARTITION BY ano ORDER BY total_vendido DESC) AS ranking
    FROM
        vendas_por_produto
) AS ranked_vendas
WHERE
    ranking <= 5
ORDER BY
    ano, ranking;



/*
Este código SQL retorna os 5 produtos mais vendidos por ano entre 2020 e 2024, somando as quantidades vendidas e utilizando ranking para selecionar os top 5 por ano. A consulta é otimizada para tabelas particionadas, melhorando a performance.

Estrutura da Consulta:
CTE vendas_por_produto: Agrega dados de transações de 2020 a 2024 usando UNION ALL para combinar dados anuais e SUM(t.quantidade) para calcular a quantidade total vendida por produto e ano.
Ranking de Produtos: Utiliza RANK() para classificar produtos por quantidade vendida, particionando os dados por ano.
Filtragem dos Top 5: A subconsulta externa filtra os top 5 produtos mais vendidos por ano com WHERE ranking <= 5.
Ordenação Final: O resultado é ordenado por ano e ranking.
Métodos de Otimização:
Particionamento de Tabelas: Dados de cada ano estão em tabelas separadas, melhorando a eficiência da consulta.
Uso de RANK(): Permite classificar produtos com empates corretamente.
Agregação com SUM(): Reduz o volume de dados manipulados.
Subconsulta para Filtragem: Melhora a eficiência evitando funções complexas no nível principal.
Etapas de Execução:
Agregação de Transações: Soma as quantidades vendidas por produto e ano.
Cálculo do Ranking: Classifica produtos por ano com base nas vendas.
Filtragem dos Top 5: Seleciona os 5 produtos mais vendidos por ano.
Ordenação do Resultado: Organiza o resultado por ano e ranking.



*/