import psycopg2

# Função para ler e executar o arquivo SQL
def execute_sql_file(file_path, db_config):
    # Conectar ao banco de dados PostgreSQL
    try:
        connection = psycopg2.connect(
            host=db_config['host'],
            database=db_config['database'],
            user=db_config['user'],
            password=db_config['password']
        )

        cursor = connection.cursor()

        # Abrir e ler o arquivo SQL
        with open(file_path, 'r') as file:
            sql_query = file.read()

        # Executar a consulta SQL
        cursor.execute(sql_query)

        # Confirmar a execução (caso a consulta modifique dados)
        connection.commit()

        # Opcional: Se precisar ver o resultado (se for uma consulta de SELECT, por exemplo)
        if cursor.description:  # Verifica se há dados retornados
            rows = cursor.fetchall()
            for row in rows:
                print(row)

    except Exception as e:
        print(f"Ocorreu um erro: {e}")
    
    finally:
        # Fechar o cursor e a conexão com o banco de dados
        if cursor:
            cursor.close()
        if connection:
            connection.close()

# Configuração do banco de dados (substitua com suas credenciais)
db_config = {
    'host': 'localhost',  # Host do banco de dados
    'database': 'magazord',  # Nome do banco de dados
    'user': 'magazord_user',  # Usuário do banco
    'password': 'magazord'  # Senha do banco
}

# Caminho para o arquivo SQL
file_path = 'top_5_vendidos_por_período.sql'

# Executar o arquivo SQL
execute_sql_file(file_path, db_config)
