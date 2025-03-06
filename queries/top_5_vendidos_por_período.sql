WITH todas_transacoes AS (
    SELECT id_produto, quantidade
    FROM transacoes
    WHERE data_transacao BETWEEN '2024-01-01' AND '2024-12-31'  -- Período específico
    UNION ALL
    SELECT id_produto, quantidade
    FROM transacoes_2020
    WHERE data_transacao BETWEEN '2024-01-01' AND '2024-12-31'
    UNION ALL
    SELECT id_produto, quantidade
    FROM transacoes_2021
    WHERE data_transacao BETWEEN '2024-01-01' AND '2024-12-31'
    UNION ALL
    SELECT id_produto, quantidade
    FROM transacoes_2022
    WHERE data_transacao BETWEEN '2024-01-01' AND '2024-12-31'
    UNION ALL
    SELECT id_produto, quantidade
    FROM transacoes_2023
    WHERE data_transacao BETWEEN '2024-01-01' AND '2024-12-31'
    UNION ALL
    SELECT id_produto, quantidade
    FROM transacoes_2024
    WHERE data_transacao BETWEEN '2024-01-01' AND '2024-12-31'
)
SELECT p.nome_produto, SUM(t.quantidade) AS total_vendido
FROM todas_transacoes t
JOIN produtos p ON t.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY total_vendido DESC
LIMIT 5;
