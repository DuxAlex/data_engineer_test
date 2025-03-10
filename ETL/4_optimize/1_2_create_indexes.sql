-- Índices para a tabela clientes
CREATE INDEX IF NOT EXISTS idx_id_cliente ON clientes(id_cliente);
CREATE INDEX IF NOT EXISTS idx_nome_cliente ON clientes(nome_cliente);

-- Índices para a tabela produtos
CREATE INDEX IF NOT EXISTS idx_id_produto ON produtos(id_produto);

-- Índices para a tabela transacoes (particionada)
CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes ON transacoes(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes ON transacoes(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao ON transacoes(data_transacao);

-- Índices para a tabela total_por_cliente
CREATE INDEX IF NOT EXISTS idx_id_cliente_total ON total_por_cliente(id_cliente);

-- Índices para as partições de transacoes
CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes_2020 ON transacoes_2020(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes_2020 ON transacoes_2020(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao_2020 ON transacoes_2020(data_transacao);

CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes_2021 ON transacoes_2021(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes_2021 ON transacoes_2021(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao_2021 ON transacoes_2021(data_transacao);

CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes_2022 ON transacoes_2022(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes_2022 ON transacoes_2022(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao_2022 ON transacoes_2022(data_transacao);

CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes_2023 ON transacoes_2023(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes_2023 ON transacoes_2023(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao_2023 ON transacoes_2023(data_transacao);

CREATE INDEX IF NOT EXISTS idx_id_cliente_transacoes_2024 ON transacoes_2024(id_cliente);
CREATE INDEX IF NOT EXISTS idx_id_produto_transacoes_2024 ON transacoes_2024(id_produto);
CREATE INDEX IF NOT EXISTS idx_data_transacao_2024 ON transacoes_2024(data_transacao);
