-- Índices para a tabela clientes
CREATE INDEX IF NOT EXISTS idx_id_cliente ON clientes(id_cliente);
CREATE INDEX IF NOT EXISTS idx_nome_cliente ON clientes(nome_cliente);

-- Índices para a tabela produtos
CREATE INDEX IF NOT EXISTS idx_id_produto ON produtos(id_produto);

-- Índices para a tabela transacoes
CREATE INDEX IF NOT EXISTS idx_id_cliente ON transacoes(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto ON transacoes(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao ON transacoes(data_transacao);

-- Índices para a tabela total_por_cliente
CREATE INDEX IF NOT EXISTS idx_id_cliente ON total_por_cliente(id_cliente);

-- Verificação de particionamento para a tabela transacoes
SELECT relname, relispartition
FROM pg_class
WHERE relname = 'transacoes';

-- Se a tabela transacoes não estiver particionada, particionar a tabela
DO $$
BEGIN
    -- Verificar se a tabela 'transacoes' já está particionada
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'transacoes' AND relispartition = true) THEN
        
        -- Criar a tabela particionada 'transacoes_particionada' com chave primária
        EXECUTE 'CREATE TABLE transacoes_particionada (
            id_transacao INT PRIMARY KEY,
            id_cliente INT,
            id_produto INT,
            quantidade INT,
            data_transacao DATE
        ) PARTITION BY RANGE (data_transacao)';
        
        -- Criar partições para a tabela 'transacoes_particionada'
        EXECUTE 'CREATE TABLE transacoes_2023 PARTITION OF transacoes_particionada 
                 FOR VALUES FROM (''2023-01-01'') TO (''2023-12-31'')';
        EXECUTE 'CREATE TABLE transacoes_2024 PARTITION OF transacoes_particionada 
                 FOR VALUES FROM (''2024-01-01'') TO (''2024-12-31'')';
        
        -- Transferir os dados da tabela original 'transacoes' para a tabela particionada
        EXECUTE 'INSERT INTO transacoes_particionada (id_transacao, id_cliente, id_produto, quantidade, data_transacao)
                 SELECT id_transacao, id_cliente, id_produto, quantidade, data_transacao::date FROM transacoes';
        
        -- Remover a tabela original 'transacoes'
        EXECUTE 'DROP TABLE IF EXISTS transacoes';

        -- Renomear a tabela particionada para 'transacoes'
        EXECUTE 'ALTER TABLE transacoes_particionada RENAME TO transacoes';
        
        RAISE NOTICE 'A tabela ''transacoes'' foi particionada com sucesso.';
    ELSE
        RAISE NOTICE 'A tabela ''transacoes'' já está particionada.';
    END IF;
END $$;
