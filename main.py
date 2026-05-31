import psycopg2
import os
from dotenv import load_dotenv


# ====================================================================
        # EXEMPLO DE POVOAMENTO (INSERT) - Descomente para testar
        # ====================================================================
        # comando_insert = """
        #     INSERT INTO PESSOA (cpf, sexo, nome, dt_nasc, rua, bairro, cidade, cep)
        #     VALUES ('12345678901', 'M', 'João da Silva', '1995-10-25', 'Rua A', 'Centro', 'Recife', '50000000');
        # """
        # cursor.execute(comando_insert)
        # conexao.commit() # O commit é OBRIGATÓRIO para salvar os dados no banco
        # print("Dados inseridos com sucesso!")


        # ====================================================================
        # EXEMPLO DE CONSULTA (SELECT) - Descomente para testar
        # ====================================================================
        # cursor.execute("SELECT cpf, nome, cidade FROM PESSOA;")
        # resultados = cursor.fetchall() # Pega todas as linhas retornadas
        # 
        # print("--- Lista de Pessoas ---")
        # for linha in resultados:
        #     print(f"CPF: {linha[0]} | Nome: {linha[1]} | Cidade: {linha[2]}")

# 1. Carrega as variáveis do arquivo .env
load_dotenv()

def conectar_banco():
    # Inicializa como None para o VS Code saber que elas existem
    conexao = None
    cursor = None
    
    try:
        # 2. Estabelece a conexão usando os dados do .env
        conexao = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            port=os.getenv("DB_PORT"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD")
        )
        
        cursor = conexao.cursor()
        print("Conexão com o banco de dados realizada com sucesso!\n")

        print("Lendo e executando o arquivo 'povoamento_db.sql'...")
        
        # Abre o arquivo. O 'encoding="utf-8"' garante que acentos não quebrem o código
        with open('povoamento_db.sql', 'r', encoding='utf-8') as arquivo_sql:
            script_sql = arquivo_sql.read() # Transforma o arquivo em uma grande string
            
            cursor.execute(script_sql) # O psycopg2 executa tudo de uma vez só
            conexao.commit() # Salva as inserções fisicamente no banco
            
        print("Banco de dados povoado com sucesso!")
        # ====================================================================

    except psycopg2.Error as e:
        print("Erro ao conectar ou manipular o banco de dados:", e)

    finally:
        # Agora a checagem fica limpa e sem avisos do linter
        if cursor:
            cursor.close()
        if conexao:
            conexao.close()
            print("\nConexão encerrada.")

# Executa a função
if __name__ == "__main__":
    conectar_banco()