import pyodbc

dados_conexao=(
    "Driver={};"
    "Server={};"
    "Database={};"
)

conexao = pyodbc.connect(dados_conexao)
print("Conexão bem sucedida")

def conectar():
    try:
        conexao = pyodbc.connect(dados_conexao)
        cursor = conexao.cursor()
        return conexao, cursor
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None, None

# Função para exibir todas as tarefas de um projeto
def exibir_tarefas(projeto_id):
    conexao, cursor = conectar()
    if conexao is None:
        return

    query = """
    SELECT t.id, t.nome, t.descricao, t.data_vencimento, t.status
    FROM tarefas t
    WHERE t.projeto_id = ?
    """
    cursor.execute(query, projeto_id)
    tarefas = cursor.fetchall()

    print(f"\nTarefas do Projeto ID {projeto_id}:")
    if tarefas:
        for tarefa in tarefas:
            print(f"ID: {tarefa[0]}, Nome: {tarefa[1]}, Status: {tarefa[4]}, Vencimento: {tarefa[3]}")
    else:
        print("Nenhuma tarefa encontrada.")

    conexao.close()

# Função para adicionar uma nova tarefa
def adicionar_tarefa(projeto_id):
    nome = input("Nome da tarefa: ")
    descricao = input("Descrição da tarefa: ")
    data_vencimento = input("Data de vencimento (YYYY-MM-DD): ")
    status = input("Status da tarefa (pendente, em andamento, concluida): ")

    conexao, cursor = conectar()
    if conexao is None:
        return

    query = """
    INSERT INTO tarefas (nome, descricao, data_vencimento, status, projeto_id)
    VALUES (?, ?, ?, ?, ?)
    """
    cursor.execute(query, nome, descricao, data_vencimento, status, projeto_id)
    conexao.commit()
    print("Tarefa adicionada com sucesso!")
    conexao.close()

# Função para editar uma tarefa existente
def editar_tarefa():
    tarefa_id = int(input("Digite o ID da tarefa que deseja editar: "))
    conexao, cursor = conectar()
    if conexao is None:
        return

    query = "SELECT * FROM tarefas WHERE id = ?"
    cursor.execute(query, tarefa_id)
    tarefa = cursor.fetchone()

    if tarefa:
        print(f"Tarefa encontrada: {tarefa[1]} - Status atual: {tarefa[4]}")
        novo_nome = input(f"Novo nome (deixe em branco para manter '{tarefa[1]}'): ")
        nova_descricao = input(f"Nova descrição (deixe em branco para manter '{tarefa[2]}'): ")
        nova_data_vencimento = input(f"Nova data de vencimento (deixe em branco para manter '{tarefa[3]}'): ")
        novo_status = input(f"Novo status (deixe em branco para manter '{tarefa[4]}'): ")

        # Atualizar os valores se forem fornecidos
        query_update = """
        UPDATE tarefas
        SET nome = COALESCE(?, nome),
            descricao = COALESCE(?, descricao),
            data_vencimento = COALESCE(?, data_vencimento),
            status = COALESCE(?, status)
        WHERE id = ?
        """
        cursor.execute(query_update, novo_nome or tarefa[1], nova_descricao or tarefa[2], nova_data_vencimento or tarefa[3], novo_status or tarefa[4], tarefa_id)
        conexao.commit()
        print("Tarefa atualizada com sucesso!")
    else:
        print("Tarefa não encontrada.")

    conexao.close()

# Função para excluir uma tarefa
def excluir_tarefa():
    tarefa_id = int(input("Digite o ID da tarefa que deseja excluir: "))
    conexao, cursor = conectar()
    if conexao is None:
        return

    query = "SELECT * FROM tarefas WHERE id = ?"
    cursor.execute(query, tarefa_id)
    tarefa = cursor.fetchone()

    if tarefa:
        confirmacao = input(f"Deseja excluir a tarefa '{tarefa[1]}'? (s/n): ")
        if confirmacao.lower() == 's':
            delete_query = "DELETE FROM tarefas WHERE id = ?"
            cursor.execute(delete_query, tarefa_id)
            conexao.commit()
            print("Tarefa excluída com sucesso!")
        else:
            print("Exclusão cancelada.")
    else:
        print("Tarefa não encontrada.")

    conexao.close()

# Função principal do menu
def menu():
    while True:
        print("\n*** Gerenciador de Tarefas ***")
        print("1. Ver tarefas de um projeto")
        print("2. Adicionar uma nova tarefa")
        print("3. Editar tarefa existente")
        print("4. Excluir tarefa")
        print("5. Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            projeto_id = int(input("Digite o ID do projeto para ver suas tarefas: "))
            exibir_tarefas(projeto_id)
        elif opcao == '2':
            projeto_id = int(input("Digite o ID do projeto para adicionar uma tarefa: "))
            adicionar_tarefa(projeto_id)
        elif opcao == '3':
            editar_tarefa()
        elif opcao == '4':
            excluir_tarefa()
        elif opcao == '5':
            print("Saindo do Gerenciador de Tarefas...")
            break
        else:
            print("Opção inválida! Tente novamente.")

# Iniciar o menu
menu()
