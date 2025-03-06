### **Parte 1: Construção do Pipeline de Dados**

#### **Descrição**  
**Fonte de Dados**:  
- Um banco de dados PostgreSQL com tabelas simuladas: **transações**, **clientes** e **produtos**.  
- Arquivos CSV fornecidos para dados adicionais.

#### **Requisitos**

1. **Pipeline de Dados:**
   - **1.1**: **Extração** dos dados:
     - Do banco de dados PostgreSQL.
     - Dos arquivos CSV.
   - **1.2**: **Transformação** dos dados:
     - **Normalizar** nomes de clientes (capitalizar).
     - **Corrigir** valores ausentes (exemplo: preço médio para produtos com valores nulos).
     - **Deduplicar** registros.
   - **1.3**: **Criação de Tabela Agregada**:
     - Receita total por cliente.
     - Número total de transações por cliente.
     - Produto mais comprado por cliente.
   - **1.4**: **Carregamento** dos dados transformados:
     - Banco de dados final ou data warehouse (PostgreSQL ou SQLite).

#### **Arquivos Fornecidos**

- **3 arquivos CSV simulados**:
  - **cliente.csv**: id_cliente, nome_cliente, email, telefone.
  - **produtos.csv**: id_produto, nome_produto, ~~categoria~~, preco.
  - **transacoes.csv**: id_transacao, id_cliente, id_produto, quantidade, data_transacao (particionado em 3 zips: transacoes_1, transacoes_2, transacoes_3).
  
- **Script SQL** para criação das tabelas iniciais no PostgreSQL.

---

### **Parte 2: Otimização e Documentação**

#### **Descrição**

- **Otimização**:
  - **Indexação** em tabelas relevantes.
  - **Estratégias de particionamento** ou **paralelização** no processo de transformação.

- **Documentação**:
  - Fornecer **README.md** contendo:
    - Passos para executar o pipeline.
    - Descrição do fluxo de trabalho.
    - Decisões técnicas tomadas e as razões por trás delas.

---

### **Parte 3: Consultas Analíticas**

#### **Descrição**

Crie as seguintes **consultas SQL** no banco de dados final:

- ~~Receita total por categoria de produto.~~
- Top 5 produtos **mais vendidos** em um período de tempo.
- Número de **clientes ativos** (aqueles que realizaram pelo menos 1 compra) nos últimos 3 meses.

**Otimize as consultas** para grandes volumes de dados, explicando as melhorias feitas.

---

### **Entregas Esperadas**

- **Código fonte** do pipeline.
- **Banco de dados final** populado com os dados processados.
- **Consultas SQL**.
- **README.md** com instruções detalhadas para execução.

---

### **Critérios de Avaliação**

#### **Completude Técnica**:
- O pipeline atende aos **requisitos funcionais**?
- As consultas fornecem os **resultados corretos**?

#### **Qualidade do Código**:
- **Estrutura e organização** do código.
- **Tratamento de erros**.
- Uso de **boas práticas de desenvolvimento**.

#### **Eficiência**:
- O pipeline e as consultas foram **otimizados para desempenho**?

#### **Documentação**:
- O **README** fornece **instruções claras** e detalhadas?

#### **Criatividade e Inovação**:
- O candidato utilizou **estratégias diferenciadas** para resolver os problemas?

