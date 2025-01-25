import pyodbc
dados_conexao=(
    "Driver={};"
    "Server={};"
    "Database={};"
)
conexao = pyodbc.connect(dados_conexao)
print("conexão bem sucedida")

def conectar():
    try:
        conexao = pyodbc.connect(dados_conexao)
        cursor = conexao.cursor()
        return conexao, cursor
    except Exception as e:
        print(f"erro ao conectar ao banco de dados: {e}")
        return None, None


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
    print(f"\ntarefas do projeto ID {projeto_id}:")
    if tarefas:
        for tarefa in tarefas:
            print(f"ID: {tarefa[0]}, Nome: {tarefa[1]}, Status: {tarefa[4]}, Vencimento: {tarefa[3]}")
    else:
        print("Nenhuma tarefa encontrada")
    conexao.close()

def adicionar_tarefa(projeto_id):
    nome = input("nome da tarefa: ")
    descricao = input("descrição da tarefa: ")
    data_vencimento = input("data de vencimento (AAAA-MM-DD): ")
    status = input("status da tarefa (pendente, em andamento, concluida): ")
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

def editar_tarefa():
    tarefa_id = int(input("digite o ID da tarefa que deseja editar: "))
    conexao, cursor = conectar()
    if conexao is None:
        return
        

    query = "SELECT * FROM tarefas WHERE id = ?"
    cursor.execute(query, tarefa_id)
    tarefa = cursor.fetchone()
    if tarefa:
        print(f"Tarefa encontrada: {tarefa[1]} - status atual: {tarefa[4]}")
        novo_nome = input(f"Novo nome (deixe em branco para manter '{tarefa[1]}'): ")
        nova_descricao = input(f"nova descrição (deixe em branco para manter '{tarefa[2]}'): ")
        nova_data_vencimento = input(f"Nova data de vencimento (deixe em branco para manter '{tarefa[3]}'): ")
        novo_status = input(f"novo status (deixe em branco para manter '{tarefa[4]}'): ")
        
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
        print("tarefa atualizada com sucesso")
    else:
        print("tarefa não encontrada.")
    conexao.close()

def excluir_tarefa():
    tarefa_id = int(input("digite o ID da tarefa que deseja excluir: "))
    conexao, cursor = conectar()
    if conexao is None:
        return

    
    query = "SELECT * FROM tarefas WHERE id = ?"
    cursor.execute(query, tarefa_id)
    tarefa = cursor.fetchone()
    if tarefa:
        confirmacao = input(f"deseja excluir tarefa '{tarefa[1]}'? (s/n): ")
        if confirmacao.lower() == 's':
            delete_query = "DELETE FROM tarefas WHERE id = ?"
            cursor.execute(delete_query, tarefa_id)
            conexao.commit()
            print("tarefa excluída com sucesso")
        else:
            print("exclusão cancelada")
    else:
        print("Tarefa não encontrada")
    conexao.close()


def menu():
    while True:
        print("\n*** Gerenciador de Tarefas ***")
        print("1. Ver tarefas de um projeto")
        print("2. Adicionar uma nova tarefa")
        print("3. wditar tarefa existente")
        print("4. excluir tarefa")
        print("5. Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == '1':
            projeto_id = int(input("digite o ID do projeto para ver suas tarefas: "))
            exibir_tarefas(projeto_id)
        elif opcao == '2':
            projeto_id = int(input("digite o ID do projeto para adicionar uma tarefa: "))
            adicionar_tarefa(projeto_id)
        elif opcao == '3':
            editar_tarefa()
        elif opcao == '4':
            excluir_tarefa()
        elif opcao == '5':
            print("saindo do Gerenciador de Tarefas")
            break
        else:
            print("opção inválida. Tente novamente.")

menu()
