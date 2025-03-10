-- Índices para a tabela clientes
CREATE INDEX IF NOT EXISTS idx_id_cliente ON clientes(id_cliente);
CREATE INDEX IF NOT EXISTS idx_nome_cliente ON clientes(nome_cliente);

-- Índices para a tabela produtos
CREATE INDEX IF NOT EXISTS idx_id_produto ON produtos(id_produto);

-- Índices para a tabela transacoes
CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes ON transacoes(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes ON transacoes(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao ON transacoes(data_transacao);

-- Índices para a tabela total_por_cliente
CREATE INDEX IF NOT EXISTS idx_id_cliente_total ON total_por_cliente(id_cliente);

-- Verificação de particionamento para a tabela transacoes
SELECT COUNT(*) 
FROM pg_inherits 
WHERE inhparent = 'transacoes'::regclass;

-- Se a tabela transacoes não estiver particionada, particionar a tabela
-- (Execute o seguinte bloco apenas se a contagem for 0)

-- Criar a tabela particionada 'transacoes_particionada' com chave primária incluindo a coluna de particionamento
CREATE TABLE transacoes_particionada (
    id SERIAL,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data_transacao DATE,
    PRIMARY KEY (id, data_transacao)  -- Incluindo data_transacao na chave primária
) PARTITION BY RANGE (data_transacao);

-- Criar partições para a tabela 'transacoes_particionada' (de 2020 a 2024)
CREATE TABLE transacoes_2020 PARTITION OF transacoes_particionada 
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');  -- Limite superior exclusivo
CREATE TABLE transacoes_2021 PARTITION OF transacoes_particionada 
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');  -- Limite superior exclusivo
CREATE TABLE transacoes_2022 PARTITION OF transacoes_particionada 
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');  -- Limite superior exclusivo
CREATE TABLE transacoes_2023 PARTITION OF transacoes_particionada 
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');  -- Limite superior exclusivo
CREATE TABLE transacoes_2024 PARTITION OF transacoes_particionada 
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');  -- Limite superior exclusivo

-- Transferir os dados da tabela original 'transacoes' para a tabela particionada
INSERT INTO transacoes_particionada (id_cliente, id_produto, quantidade, data_transacao)
SELECT id_cliente, id_produto, quantidade, data_transacao::date FROM transacoes;

-- Remover a tabela original 'transacoes'
DROP TABLE IF EXISTS transacoes;

-- Renomear a tabela particionada para 'transacoes'
ALTER TABLE transacoes_particionada RENAME TO transacoes;
