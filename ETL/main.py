import os
import subprocess
import nbformat

# Dicionário com notebooks e seus respectivos diretórios
notebooks = {
    '1_transform_csv_cliente.ipynb': '2_transform',
    '1_load_cliente.ipynb': '3_load',
    '2_transform_csv_produtos.ipynb': '2_transform',
    '2_load_produtos.ipynb': '3_load',
    '3_transform_csv_transacoes.ipynb': '2_transform',
    '3_load_transacao.ipynb': '3_load',
    '4_transform_total_por_cliente.ipynb': '2_transform',
    '4_load_total_por_cliente.ipynb': '3_load',
    '1_extract_db_to_local.ipynb':'1_extract'
}

# Diretório de saída para os notebooks gerados
output_dir = "output_notebooks"
os.makedirs(output_dir, exist_ok=True)

# Função para substituir input() por 's' no notebook
def substituir_input_por_s(caminho_notebook):
    try:
        with open(caminho_notebook, "r", encoding="utf-8") as f:
            notebook = nbformat.read(f, as_version=4)
        
        # Percorrer as células e substituir input() por "s"
        for cell in notebook.cells:
            if cell.cell_type == "code" and "input(" in cell.source:
                cell.source = cell.source.replace("input(", "'s'  # Automático substituindo input(")
        
        # Salvar as alterações
        with open(caminho_notebook, "w", encoding="utf-8") as f:
            nbformat.write(notebook, f)
        print(f"Alterações feitas no notebook {caminho_notebook}")
    except Exception as e:
        print(f"Erro ao processar o notebook {caminho_notebook}: {e}")

# Função para executar um notebook
def executar_notebook(nome_notebook, diretorio):
    caminho_notebook = os.path.join(diretorio, nome_notebook)
    
    # Verificar se o notebook existe no diretório
    if not os.path.exists(caminho_notebook):
        print(f"Erro: O notebook {nome_notebook} não foi encontrado no diretório {diretorio}.")
        return
    
    # Substituir input() por "s" antes da execução
    substituir_input_por_s(caminho_notebook)
    
    try:
        print(f"Executando o notebook {nome_notebook} em {diretorio}...")
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
