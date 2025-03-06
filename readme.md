<div align='center'>

![Magazord](image/logo-magazord.png)

</div>

# Teste para vaga de Engenheiro de Dados no Magazord.com.br
Este repositório tem como fim testar os candidatos para vaga de engenheiro de dados na empresa [Magazord](https://magazord.com.br).
> Para esta vaga buscamos alguém apaixonado por Dados e como disponibilizar de maneira estrutura e eficiente para tomada de decisão sobre esses dados!


## O teste

O objetivo deste teste é avaliar as habilidades técnicas do candidato na manipulação de grandes volumes de dados, desenvolvimento de pipelines, modelagem de dados, otimização de consultas, e compreensão de arquiteturas de dados modernas.

# Proposta do Projeto Teste
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


## ⚙️ Ferramentas Utilizadas

- 🐍 **Python** – Linguagem de programação para manipulação de dados e execução do pipeline.
- 📊 **Pandas** – Biblioteca para manipulação e análise de dados.
- 🐘 **psycopg2** – Adaptador PostgreSQL para Python, utilizado para comunicação com o banco de dados.
- 🛠 **virtualenv** – Ferramenta para criar ambientes virtuais em Python.
- ⚡ **SQLAlchemy** – Biblioteca para trabalhar com bancos de dados SQL de forma mais eficiente.
- 🐋 **Docker** – Utilizado para rodar containers de ambiente e banco de dados.
- 🐘 **PostgreSQL (Docker)** – Banco de dados relacional utilizado no projeto.
- ⚡ **SQL** – Para consultas e manipulação dos dados.
- 📝 **nbconvert** – Ferramenta para converter notebooks Jupyter em outros formatos.
- ⚙️ **os** – Módulo Python para interagir com o sistema operacional.
- 🔄 **subprocess** – Módulo Python para executar processos no sistema operacional.


## 📂 Estrutura de Diretórios

```bash
### Descrição dos Diretórios

- **data/**: Contém scripts SQL para configuração do banco de dados.
  - `setup.sql`: Script de configuração inicial do banco de dados.
  - `setup.sql_teste_com otimizacao.txt`: Script de configuração para testes com otimização.

- **ETL/**: Contém o código principal do processo ETL.
  - `main.py`: Script principal para execução do processo ETL.
  - **1_extract/**: Contém notebooks para extração de dados.
    - `1_extract_db_to_local.ipynb`: Notebook para extração de dados do banco de dados para local.
  - **2_transform/**: Diretório para notebooks de transformação de dados.
  - **3_load/**: Diretório para notebooks de carregamento de dados.
  - **4_optimize/**: Diretório para notebooks de otimização de dados.
  - **data_from_db/**: Diretório para armazenar dados extraídos do banco de dados.
  - **final_data/**: Diretório para armazenar dados finais após transformação e otimização.
  - **output_notebooks/**: Diretório para armazenar notebooks de saída.
  - **raw_data/**: Diretório para armazenar dados brutos.

- **help/**: Contém notebooks e arquivos de ajuda.
  - `ajuste_ids_csv.ipynb`: Notebook para ajuste de IDs em arquivos CSV.
  - `estrutura dos CSVs e do DB.txt`: Descrição da estrutura dos arquivos CSV e do banco de dados.
  - `objetivo.md`: Documento descrevendo o objetivo do projeto.
  - `teste_conexao_db.ipynb`: Notebook para testar a conexão com o banco de dados.
  - `teste_diretorios.ipynb`: Notebook para testar diretórios.
  - `teste_pandas.ipynb`: Notebook para testar funcionalidades do Pandas.
  - `verifica_otimização.ipynb`: Notebook para verificar otimizações.

- **image/**: Contém imagens utilizadas no projeto.
  - `logo-magazord.png`: Logo da Magazord.

- **queries/**: Diretório para armazenar consultas SQL.
```

## Requisitos
Para executar este projeto, você precisará dos seguintes requisitos:

- Python 3.x
- Bibliotecas listadas em `requirements.txt`
- Docker (para uso com `docker-compose.yml`)

## 📥 Como Rodar o Projeto

### 1️⃣ Clone o repositório

Primeiro, faça o clone do repositório:

```bash
git clone https://github.com/DuxAlex/
```

### 2️⃣ Verifique se o Docker está instalado

Certifique-se de que o Docker está instalado no seu computador. Para verificar, execute:

```
docker --version
```

Se não estiver instalado, siga a [a documentação do docker](https://docs.docker.com/engine/install/) para realizar a instalação.

### 3️⃣ Verifique se o Python está instalado

Verifique se o Python está instalado:

```
python --version
```

Se não estiver instalado, siga a [a documentação do python](https://www.python.org/downloads/) para realizar a instalação.

## 4️⃣ Instale o `virtualenv`:

    ``` bash
    
    ### Ambiente Virtual

    pip install virtualenv
    ```

## 5️⃣ **Crie o ambiente virtual**:

    ```bash
    virtualenv .venv
    ou
    python3 -m venv .venv

    ```

## 6️⃣ **Ative o ambiente virtual**:

    - **No Linux**:
    
      ```bash
      source .venv/bin/activate
      ```
    
    - **No Windows**:
    
      ```bash
      venv\Scripts\activate
      ```

## 7️⃣ **Instale as dependências do projeto**:

    ```bash
    pip install -r requirements.txt
    ```

## 8️⃣ **Subindo o Docker Compose:**

Depois de executar os scripts, agora é necessário subir os contêineres usando o Docker Compose. 

na raiz do diretório digite:

```bash
 docker compose up -d
```

verifique a situação dos containers digitando:

```bash
docker ps
```
e também:
```bash
docker logs 
```
## 9️⃣ ** Execute o scritp principal de TLE (Transform, Load & Extract) **

Entre no diretório ETL usando:

```bash
cd ETL/
```
e Execute o script principal a qual está que puxa todos os outros scritps de execução de forma automatizada:
```bash
python main.py
```

### Após estes passos o banco de dados já estará no ar, populado, otimizado, com uma tabela adicional para facilitação das consultas e pronto para consulta.

## 🔌 Conectando ao Banco de Dados

Para facilitar a interação com o banco de dados e realizar consultas SQL, recomendamos utilizar ferramentas como o **DBeaver** ou a extensão **MySQL** do VSCode, chamada **Weijan Chen** disponível no [Marketplace do VSCode](https://marketplace.visualstudio.com/items?itemName=weijanchen.database-client).

### 🔧 Usando o DBeaver:

1. Instale o DBeaver [aqui](https://dbeaver.io/download/).
2. Abra o DBeaver e crie uma nova conexão PostgreSQL.
3. Preencha os detalhes da conexão com as seguintes configurações:
   - **Host**: `localhost` OU `127.0.0.1`
   - **Porta**: `5432`
   - **Banco de Dados**: `magazord`
   - **Usuário**: `magazord_user`
   - **Senha**: `magazord`
4. Conecte-se ao banco de dados e comece a executar as consultas.

### 💻 Usando a Extensão MySQL no VSCode:

1. Instale a extensão **Database Client** de Weijan Chen no VSCode.
2. Adicione uma nova conexão no painel de conexões.
3. Use as configurações de conexão para o banco de dados PostgreSQL, da mesma forma que faria no DBeaver.
4. Acesse a pasta `db` para consultar os scripts SQL e execute as consultas diretamente no VSCode.

Essas ferramentas vão facilitar a visualização, manipulação e execução de consultas SQL diretamente no banco de dados.

## 📚 Informações Adicionais

Na pasta `help`, você encontrará uma série de informações úteis que podem te ajudar a compreender melhor os dados utilizados no projeto. Essas informações incluem: 

## Contribuição
### Para contribuir com este projeto, por favor, siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (git checkout -b feature/nova-feature).
3. Commit suas mudanças (git commit -m 'Adiciona nova feature').
4. Faça um push para a branch (git push origin feature/nova-feature).
5. Abra um Pull Request.

📧 Caso tenha sugestões ou feedbacks, entre em contato:  

- **E-mail**: [alexkrypto.ti@gmail.com](mailto:alexkrypto.ti@gmail.com)  
- **LinkedIn**: [Alex Miqueias](https://www.linkedin.com/in/alexmiqueias/)

Agradeço por sua atenção e interesse neste projeto! 😊

---

