import psycopg2
import os
from dotenv import load_dotenv

# Carrega as variáveis do arquivo .env
load_dotenv()

def exibir_menu():
    print("\n" + "="*50)
    print(" SISTEMA DE GERENCIAMENTO ESCOLAR - MENU")
    print("="*50)
    print("1 - Inserir nova Pessoa (INSERT)")
    print("2 - Verificar Pessoas cadastradas (SELECT)")
    print("3 - Modificar nome de uma Pessoa (UPDATE)")
    print("4 - Deletar uma Pessoa (DELETE)")
    print("5 - Executar comando SQL Livre (Avançado)")
    print("0 - Sair do programa (EXIT)")
    print("="*50)

def conectar_banco():
    conexao = None
    cursor = None
    
    try:
        # Estabelece a conexão
        conexao = psycopg2.connect(
            host=os.getenv("DB_HOST"),
            port=os.getenv("DB_PORT"),
            database=os.getenv("DB_NAME"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD")
        )
        cursor = conexao.cursor()
        print("Conectado ao banco de dados com sucesso!")

        # INÍCIO DO PROGRAMA INTERATIVO
        while True:
            exibir_menu()
            opcao = input("Escolha uma opção: ")

            if opcao == '0':
                print("Encerrando o programa... Até logo!")
                break # Sai do loop while

            elif opcao == '1':
                print("\n--- INSERIR NOVA PESSOA ---")
                cpf = input("Digite o CPF (até 14 caracteres): ")
                nome = input("Digite o Nome: ")
                cidade = input("Digite a Cidade: ")
                
                # Usamos %s para proteger o banco contra ataques (SQL Injection)
                comando = "INSERT INTO PESSOA (cpf, nome, cidade) VALUES (%s, %s, %s);"
                cursor.execute(comando, (cpf, nome, cidade))
                conexao.commit()
                print("Pessoa inserida com sucesso!")

            elif opcao == '2':
                print("\n--- VERIFICAR PESSOAS ---")
                cursor.execute("SELECT cpf, nome, cidade FROM PESSOA;")
                resultados = cursor.fetchall()
                
                if resultados:
                    for linha in resultados:
                        print(f"CPF: {linha[0]} | Nome: {linha[1]} | Cidade: {linha[2]}")
                else:
                    print("Nenhuma pessoa cadastrada ainda.")

            elif opcao == '3':
                print("\n--- MODIFICAR PESSOA ---")
                cpf = input("Digite o CPF da pessoa que deseja alterar: ")
                novo_nome = input("Digite o novo Nome: ")
                
                comando = "UPDATE PESSOA SET nome = %s WHERE cpf = %s;"
                cursor.execute(comando, (novo_nome, cpf))
                conexao.commit()
                
                # rowcount diz quantas linhas foram afetadas
                if cursor.rowcount > 0:
                    print("Nome atualizado com sucesso!")
                else:
                    print("CPF não encontrado!")

            elif opcao == '4':
                print("\n--- DELETAR PESSOA ---")
                cpf = input("Digite o CPF da pessoa que deseja deletar: ")
                
                comando = "DELETE FROM PESSOA WHERE cpf = %s;"
                cursor.execute(comando, (cpf,))
                conexao.commit()
                
                if cursor.rowcount > 0:
                    print("Pessoa deletada com sucesso!")
                else:
                    print("CPF não encontrado!")

            elif opcao == '5':
                print("\n--- COMANDO SQL LIVRE ---")
                print("Digite seu comando SQL. Você pode dar 'Enter' para pular de linha.")
                print("IMPORTANTE: Para executar, digite um ponto e vírgula ( ; ) e dê Enter!")
                
                linhas_comando = []
                while True:
                    linha = input()
                    linhas_comando.append(linha)
                    # O loop só para quando encontrar um ';' na linha
                    if ';' in linha:
                        break
                
                # Junta todas as linhas que foram digitadas em um único texto, separadas por quebra de linha
                comando_livre = "\n".join(linhas_comando)
                
                try:
                    cursor.execute(comando_livre)
                    
                    if comando_livre.strip().upper().startswith("SELECT"):
                        resultados = cursor.fetchall()
                        for linha in resultados:
                            print(linha)
                    else:
                        conexao.commit()
                        print(f"Comando executado! Linhas afetadas: {cursor.rowcount}")
                except Exception as erro_sql:
                    conexao.rollback()
                    print(f"Erro na sintaxe do seu SQL: {erro_sql}")
            else:
                print("Opção inválida. Tente novamente.")

    except psycopg2.Error as e:
        print("Erro grave com o banco de dados:", e)

    finally:
        # Fechamento seguro
        if cursor: cursor.close()
        if conexao: 
            conexao.close()
            print("Conexão encerrada.")

if __name__ == "__main__":
    conectar_banco()