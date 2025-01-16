<div align='center'>

![Magazord](image/logo-magazord.png)

</div>

# Teste para vaga de Engenheiro de Dados no Magazord.com.br
Este repositório tem como fim testar os candidatos para vaga de engenheiro de dados na empresa [Magazord](https://magazord.com.br).
> Para esta vaga buscamos alguém apaixonado por Dados e como disponibilizar de maneira estrutura e eficiente para tomada de decisão sobre esses dados!


## O teste

O objetivo deste teste é garantir que suas habilidades de engenheria de dados sejam postas a prova.
O importante é o funcionamento, o cumprimento com os requisitos, utilização de boas práticas e a documentação.

O cenário do teste é de uma empresa fictícia que está migrando para uma arquitetura moderna de dados que combina processamento em tempo real e batch. Como engenheiro de dados, você deve criar uma solução híbrida para processar, transformar e integrar dados de diversas fontes, garantindo alta performance e escalabilidade.

## Desafios

> [!IMPORTANT]
> Construir pipelines de dados para processamento em batch e em tempo real.

> [!IMPORTANT]
> Implementar um modelo de dados otimizado para consultas analíticas.

> [!IMPORTANT]
> Garantir confiabilidade, integridade e desempenho ao longo do pipeline.

### Parte 1: Processamento em Batch
Descrição:
 - Fonte de Dados Batch:
   - Banco de dados relacional PostgreSQL com tabelas de transações, clientes e produtos.
   - Arquivos JSON representando logs de navegação no site da empresa.
 - Tarefas:
   - Extração:
     - Extrair dados do PostgreSQL e dos arquivos JSON.
   - Transformação:
     - Limpar e deduplicar dados de transações e logs de navegação.
     - Normalizar os dados (e.g., nomes de clientes e produtos).
     - Enriquecer os dados de logs de navegação com informações dos produtos (união entre logs e dados do banco).
     - Agregar as seguintes informações:
       - Receita total por cliente e por produto.
       - Produtos mais visualizados por cliente (baseados nos logs).
       - Conversão: porcentagem de visualizações que resultaram em compras por produto.
 - Entregáveis:
   - Pipeline funcional para processamento batch utilizando ferramentas como Apache Airflow, Prefect ou scripts Python (com Pandas, SQLAlchemy ou PySpark).

### Parte 2: Processamento em Tempo Real
Descrição:
 - Fonte de dados em Tempo Real:
   - Streaming de eventos Kafka contendo dados de transações em tempo real com o seguinte schema:
     - id_transacao, id_cliente, id_produto, quantidade, timestamp.
 - Tarefas:
   - Consumir dados do Kafka:
     - Configurar um consumidor para processar os eventos de transações.
   - Transformação e Agregação:
     - Atualizar em tempo real:
       - Receita total por produto.
       - Contagem de transações por cliente.
     - Detectar anomalias em transações, como compras com valores muito altos (> 3 vezes o preço médio do produto).
   - Carregamento:
     - Armazenar os dados em um banco de dados NoSQL (como MongoDB ou Elasticsearch) para consulta rápida.
 - Entregáveis:
   - Pipeline funcional para processamento em tempo real utilizando Kafka e uma tecnologia de stream processing (como Spark Streaming, Flink ou Kafka Streams).

### Parte 3: Modelagem e Consultas Avançadas
 - Modelagem de Dados:
   - Criar um modelo de dados dimensional (data warehouse) para suportar análises futuras.
     - Dimensão Cliente, Dimensão Produto, Fato Transação.
 - Consultas Analíticas:
   - Receita total por mês e categoria de produto.
   - Taxa de conversão por canal de entrada (baseado nos logs de navegação).
   - Detecção de clientes churn (sem compras nos últimos 3 meses).
  
### Parte 4: Otimização e Documentação
 - Otimização:
   - Garantir desempenho no processamento em batch e em tempo real utilizando:
     - Estratégias de particionamento de dados.
     - Uso eficiente de índices e cache em consultas.
     - Paralelização de tarefas onde aplicável.
 - Documentação:
   - Criar um README.md exmplicando:
     - Como executar os pipelines.
     - Decisões técnicas tomadas.
     - Melhorias que poderiam ser feitas no pipeline.
    
## Entregas Esperadas

> [!IMPORTANT]
> Código fonte do pipeline de batch e tempo real.

> [!IMPORTANT]
> Arquivo SQL ou modelo visual para a modelagem dimensional.

> [!IMPORTANT]
> Consultas SQL para as análises propostas.

> [!IMPORTANT]
> Banco de dados populado (ou Snapshots exportados).

> [!IMPORTANT]
> README.md bem detalhado.

## Critérios de Avaliação:
 - Completude Técnica:
   - Todos os requisitos funcionais foram atendidos?
 - Qualidade e Eficiência do Código:
   - O código é limpo, modular e bem estruturado?
   - As soluções são escaláveis e eficientes?
 - Soluções Avançadas:
   - A modelagem de dados e as consultas estão otimizadas?
   - O pipeline em tempo real é confiável e de alto desempenho?
 - Documentação:
   - O README fornece instruções claras e detalhadas?
 - Criatividade e Inovação:
   - O candidato usou estratégias diferenciadas para resolver os problemas?

## Envio do teste

* Suba o repositório no seu Github e envie o link diretamente para o seu recrutador.

Obs.: Não serão aceitos alterações após o envio.
