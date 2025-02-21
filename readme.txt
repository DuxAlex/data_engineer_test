## ⚙️ Ferramentas Utilizadas

- 🐍 **Python** – Linguagem de programação para manipulação de dados e execução do pipeline.
- 📊 **Pandas** – Biblioteca para manipulação e análise de dados.
- 🌐 **Requests** – Biblioteca para realizar requisições HTTP.
- 🐘 **psycopg2** – Adaptador PostgreSQL para Python, utilizado para comunicação com o banco de dados.
- 🛠 **virtualenv** – Ferramenta para criar ambientes virtuais em Python.
- ⚡ **SQLAlchemy** – Biblioteca para trabalhar com bancos de dados SQL de forma mais eficiente.
- 🐋 **Docker** – Utilizado para rodar containers de ambiente e banco de dados.
- ✈️ **Airflow** – Plataforma para orquestração de workflows e automação de pipelines de dados.
- 🐘 **PostgreSQL (Docker)** – Banco de dados relacional utilizado no projeto.
- ⚡ **SQL** – Para consultas e manipulação dos dados.

## 📂 Estrutura de Diretórios

```bash

```


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

## Ambiente Virtual

## 4️⃣ Instale o `virtualenv`:

    ```bash
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

```
se no linux:
sudo docker compose up -d

ou windows 
docker compose up -d

verifique a situação dos containers digitando
sudo docker ps


e também:

sudo docker logs 
e
sudo docker logs 
```