SELECT COUNT(DISTINCT t.id_cliente) AS clientes_ativos
FROM (
    SELECT id_cliente 
    FROM transacoes_2024 
    WHERE data_transacao BETWEEN '2024-10-01' AND '2024-12-31'
) t;
/*
Essa query tem como objetivo contar o número de clientes distintos que realizaram transações em um período específico, conforme descrito abaixo:

Subconsulta:
A subconsulta seleciona os id_cliente da tabela transacoes_2024 onde a data da transação (data_transacao) 
está entre 1º de outubro de 2024 e 31 de dezembro de 2024. 
Ela cria uma lista de clientes que realizaram transações nesse intervalo.
Alias t:
O resultado da subconsulta é tratado como uma tabela temporária chamada t, 
para facilitar a referência na query principal.

Contagem de clientes únicos:
A cláusula COUNT(DISTINCT t.id_cliente) conta apenas os valores únicos de id_cliente da tabela temporária t, 
garantindo que cada cliente seja contado uma única vez, independentemente de quantas transações realizou.

Resultado:
A query retorna o número total de clientes distintos que estiveram ativos no período especificado. 
O resultado é apresentado na coluna clientes_ativos.

OTMIZAÇÃOES
A otimização da consulta em uma tabela particionada como transacoes_2024 pode ser feita com os seguintes métodos:

Particionamento: O PostgreSQL lê apenas a partição relevante (neste caso, a de 2024), reduzindo o volume de dados processados.

Índices: Criar índices em id_cliente e data_transacao para acelerar a busca e a contagem de valores distintos.

Predicate Pushdown: O filtro de data é aplicado diretamente na partição, evitando o processamento de dados irrelevantes.

Vacuum e Analyze: Realizar manutenção nas partições para garantir estatísticas atualizadas e um plano de execução eficiente.

Execução Paralela: O PostgreSQL pode usar múltiplos núcleos de processamento para acelerar a consulta, especialmente em partições grandes.

Essas práticas ajudam a reduzir o tempo de execução e melhorar a performance da consulta.
*/