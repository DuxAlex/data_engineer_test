import pandas as pd
from sqlalchemy import create_engine
import psycopg2

# Configurações do banco de dados
DB_USER = 'magazord_user'
DB_PASSWORD = 'magazord'
DB_HOST = 'localhost'
DB_PORT = '5432'
DB_NAME = 'magazord'

# Conexão com o banco de dados PostgreSQL
engine = create_engine(f'postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}')

# 1. Extração
def extrair_dados():
    # Extraindo dados do banco de dados
    query = "SELECT * FROM sua_tabela;"
    df_db = pd.read_sql(query, engine)

    # Extraindo dados de um arquivo CSV
    df_csv = pd.read_csv('raw_data/cliente.csv')

    # Combinando os DataFrames
    df = pd.concat([df_db, df_csv], ignore_index=True)
    return df

# 2. Transformação
def transformar_dados(df):
    # Normalizar nomes de clientes (capitalizar)
    df['nome_cliente'] = df['nome_cliente'].str.title()

    # Corrigir valores ausentes (exemplo: preço médio)
    df['preco'] = df['preco'].fillna(df['preco'].mean())

    # Deduplicar registros
    df = df.drop_duplicates()

    return df

# 3. Agregação
def agregar_dados(df):
    # Criar uma nova tabela agregada
    df_agregado = df.groupby('cliente_id').agg(
        receita_total=('preco', 'sum'),
        numero_transacoes=('transacao_id', 'count'),
        produto_mais_comprado=('produto', lambda x: x.mode()[0])
    ).reset_index()

    return df_agregado

# 4. Carga
def carregar_dados(df_agregado):
    # Carregar os dados transformados em uma nova tabela no PostgreSQL
    df_agregado.to_sql('tabela_agregada', engine, if_exists='replace', index=False)

# Pipeline ETL
def pipeline_etl():
    df_extraido = extrair_dados()
    df_transformado = transformar_dados(df_extraido)
    df_agregado = agregar_dados(df_transformado)
    carregar_dados(df_agregado)
    print("Pipeline ETL concluída com sucesso!")

# Executar a pipeline
if __name__ == "__main__":
    pipeline_etl()
