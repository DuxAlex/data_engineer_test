import os
import subprocess

# Dicionário com notebooks e seus respectivos diretórios
notebooks = {
    '1_transform_csv_cliente.ipynb': '2_transform',
    '1_load_cliente.ipynb': '3_load',
    '2_transform_csv_produtos.ipynb': '2_transform',
    '2_load_produtos.ipynb': '3_load',
    '3_transform_csv_transacoes.ipynb': '2_transform',
    '3_load_transacao.ipynb': '3_load',
    '4_transform_total_por_cliente.ipynb': '2_transform',
    '4_load_total_por_cliente.ipynb': '3_load'
    # '1_extract_db_to_local.ipynb': '1_extract',
}

# Criação de diretório de saída
# Diretório de saída para os notebooks gerados
output_dir = "output_notebooks"

# Criar o diretório de saída se não existir
os.makedirs(output_dir, exist_ok=True)

# Função para executar um notebook
def executar_notebook(nome_notebook, diretorio):
    caminho_notebook = os.path.join(diretorio, nome_notebook)
    
    # Verificar se o notebook existe no diretório
    if not os.path.exists(caminho_notebook):
        print(f"Erro: O notebook {nome_notebook} não foi encontrado no diretório {diretorio}.")
        return
    
    try:
        print(f"Executando o notebook {nome_notebook} em {diretorio}...")
        # Adicionado --output-dir para salvar os notebooks gerados na pasta output_dir
        subprocess.run(
            [
                'jupyter', 'nbconvert', '--to', 'notebook', '--execute',
                '--output-dir', output_dir, caminho_notebook
            ],
            check=True
        )
        print(f"Notebook {nome_notebook} executado e salvo em {output_dir}!")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar o notebook {nome_notebook}: {e}")

def main():
    # Iterar sobre os notebooks e seus respectivos diretórios
    for notebook, diretorio in notebooks.items():
        executar_notebook(notebook, diretorio)

if __name__ == "__main__":
    main()
