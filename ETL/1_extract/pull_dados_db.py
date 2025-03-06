#Conexão com o banco: O código se conecta ao banco de dados PostgreSQL e consulta as tabelas do esquema 'public'.
#Consulta das colunas: Para cada tabela, ele obtém o nome das colunas.
#Salvamento no CSV: Os dados das tabelas e colunas são salvos em um arquivo CSV no diretório ETL/data_from_db.
#Mensagens de erro e sucesso: O código imprime mensagens de erro caso algo dê errado e mensagens de sucesso ao salvar o arquivo CSV.
#Execute no terminal python ETL/1_extract/pull_dados_db.py

import psycopg2
import csv
import os

def get_tables_and_columns(db_name, user, password, host='localhost', port=5432):
    try:
        # Conectar ao banco de dados PostgreSQL
        conn = psycopg2.connect(
            dbname=db_name, 
            user=user, 
            password=password, 
            host=host, 
            port=port
        )
        cursor = conn.cursor()
        
        # Consultar todas as tabelas no banco de dados
        cursor.execute("""
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = 'public';
        """)
        
        tables = cursor.fetchall()
        
        if not tables:
            print("Nenhuma tabela encontrada no esquema 'public'.")
        
        tables_and_columns = {}
        
        for table in tables:
            table_name = table[0]
            print(f"Processando tabela: {table_name}")
            
            # Consultar todas as colunas de cada tabela
            cursor.execute(f"""
                SELECT column_name
                FROM information_schema.columns
                WHERE table_name = '{table_name}';
            """)
            
            columns = cursor.fetchall()
            if columns:
                column_names = [column[0] for column in columns]
                tables_and_columns[table_name] = column_names
            else:
                print(f"Tabela '{table_name}' não tem colunas.")
        
        # Fechar a conexão
        cursor.close()
        conn.close()
        
        return tables_and_columns
    except Exception as e:
        print(f"Erro ao conectar ou consultar o banco de dados: {e}")
        return {}

def save_to_csv(tables_and_columns, directory="../data_from_db", filename='tabelas_e_colunas_magazord_db.csv'):
    if not tables_and_columns:
        print("Não há dados para salvar no arquivo CSV.")
        return

    # Verificar se o diretório existe, se não, criar
    if not os.path.exists(directory):
        os.makedirs(directory)
    
    # Caminho completo do arquivo CSV
    file_path = os.path.join(directory, filename)
    
    # Salvar os dados em um arquivo CSV
    with open(file_path, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Tabela', 'Colunas'])  # Cabeçalho do CSV
        for table, columns in tables_and_columns.items():
            writer.writerow([table, ', '.join(columns)])  # Escrever tabela e suas colunas

    print(f"Arquivo CSV gerado com sucesso em '{file_path}'!")

# dados de conexão
db_name = 'magazord'
user = 'magazord_user'
password = 'magazord'

# Obter as tabelas e colunas
result = get_tables_and_columns(db_name, user, password)

# Salvar os resultados em um arquivo CSV no diretório "../data_from_db"
save_to_csv(result, directory="../data_from_db")
