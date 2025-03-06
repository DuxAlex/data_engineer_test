SELECT COUNT(DISTINCT t.id_cliente) AS clientes_ativos
FROM (
    SELECT id_cliente 
    FROM transacoes_2024 
    WHERE data_transacao BETWEEN '2024-10-01' AND '2024-12-31'
    UNION ALL
    SELECT id_cliente 
    FROM transacoes_2023 
    WHERE data_transacao BETWEEN '2024-10-01' AND '2024-12-31'
    UNION ALL
    SELECT id_cliente 
    FROM transacoes_2022 
    WHERE data_transacao BETWEEN '2024-10-01' AND '2024-12-31'
    UNION ALL
    SELECT id_cliente 
    FROM transacoes_2021 
    WHERE data_transacao BETWEEN '2024-10-01' AND '2024-12-31'
    UNION ALL
    SELECT id_cliente 
    FROM transacoes_2020 
    WHERE data_transacao BETWEEN '2024-10-01' AND '2024-12-31'
) t;
