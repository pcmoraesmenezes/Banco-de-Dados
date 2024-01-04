import os
from settings_ import DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_DATABASE
import psycopg2


def conectar():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            port=DB_PORT,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_DATABASE
        )
        return conn
    except psycopg2.Error as e:
        print(f'Erro na conexão ao PostgreSQL Server: {e}')
    return None


def desconectar(conn):
    if conn:
        conn.close()


def criar_categoria():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'CREATE TABLE IF NOT EXISTS categoria ( '
        'id SERIAL PRIMARY KEY, '
        'nome VARCHAR(50) NOT NULL);'
    )
    conn.commit()
    desconectar(conn)


def criar_tarefa():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'CREATE TABLE IF NOT EXISTS tarefa ('
        'id SERIAL PRIMARY KEY,'
        'descricao VARCHAR(50) NOT NULL,'
        'data_limite DATE NOT NULL,'
        'concluida BOOLEAN NOT NULL,'
        'categoria_id INTEGER NOT NULL,'
        'FOREIGN KEY (categoria_id) REFERENCES categoria(id)'
        ');'
    )
    conn.commit()
    desconectar(conn)


def listar_tarefas():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'SELECT * FROM tarefa;'
    )
    tarefas = cursor.fetchall()
    if tarefas:
        print('\nListando tarefas...\n')
        for tarefa in tarefas:
            print(f'ID: {tarefa[0]}')
            print(f'Descrição: {tarefa[1]}')
            print(f'Data limite: {tarefa[2]}')
            print(f'Concluída: {tarefa[3]}')
            print(f'Categoria ID: {tarefa[4]}')
            print('-------------------')
    else:
        print('\nNão existem tarefas cadastradas!\n')
    desconectar(conn)


def listar_categorias():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'SELECT * FROM categoria;'
    )
    categorias = cursor.fetchall()
    if categorias:
        print('\nListando categorias...\n')
        for categoria in categorias:
            print(f'ID: {categoria[0]}')
            print(f'Nome: {categoria[1]}')
            print('-------------------')
    else:
        print('\nNão existem categorias cadastradas!\n')
    desconectar(conn)


def listar_tarefas_e_categorias():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'SELECT * FROM tarefa INNER JOIN'
        ' categoria ON tarefa.categoria_id = categoria.id;'
    )
    tarefas = cursor.fetchall()
    if tarefas:
        print('\nListando tarefas...\n')
        for tarefa in tarefas:
            print(f'ID: {tarefa[0]}')
            print(f'Descrição: {tarefa[1]}')
            print(f'Data limite: {tarefa[2]}')
            print(f'Concluída: {tarefa[3]}')
            print(f'Categoria ID: {tarefa[4]}')
            print(f'Categoria Nome: {tarefa[6]}')
            print('-------------------')
    else:
        print('\nNão existem tarefas cadastradas!\n')
    desconectar(conn)


def inserir_categoria():
    conn = conectar()
    cursor = conn.cursor()
    nome = input('Informe o nome da categoria: ')
    cursor.execute(
        f"INSERT INTO categoria (nome) VALUES ('{nome}')"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'A categoria {nome} foi inserida com sucesso.')
    else:
        print(f'Não foi possível inserir a categoria {nome}.')
    desconectar(conn)


def inserir_tarefa():
    conn = conectar()
    cursor = conn.cursor()
    descricao = input('Informe a descrição da tarefa: ')
    data_limite = input('Informe a data limite da tarefa: ')
    concluida = input('A tarefa já foi concluída? [Y/N]: ')
    categoria_id = input('Informe o ID da categoria da tarefa: ')
    cursor.execute(
        f"INSERT INTO tarefa (descricao, data_limite, concluida, categoria_id)"
        f"VALUES ('{descricao}',"
        f"'{data_limite}', '{concluida}', '{categoria_id}')"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'A tarefa {descricao} foi inserida com sucesso.')
    else:
        print(f'Não foi possível inserir a tarefa {descricao}.')
    desconectar(conn)


def atualizar_tarefa():
    conn = conectar()
    cursor = conn.cursor()
    tarefa_id = input('Informe o ID da tarefa: ')
    descricao = input('Informe a nova descrição da tarefa: ')
    data_limite = input('Informe a nova data limite da tarefa: ')
    concluida = input('A tarefa já foi concluída? [Y/N]: ')
    categoria_id = input('Informe o novo ID da categoria da tarefa: ')
    cursor.execute(
        f"UPDATE tarefa SET descricao='{descricao}',"
        f"data_limite='{data_limite}', concluida='{concluida}',"
        f"categoria_id='{categoria_id}' WHERE id='{tarefa_id}'"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'A tarefa {descricao} foi atualizada com sucesso.')
    else:
        print(f'Não foi possível atualizar a tarefa {descricao}.')
    desconectar(conn)


def atualizar_categoria():
    conn = conectar()
    cursor = conn.cursor()
    categoria_id = input('Informe o ID da categoria: ')
    nome = input('Informe o novo nome da categoria: ')
    cursor.execute(
        f"UPDATE categoria SET nome='{nome}' WHERE id='{categoria_id}'"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'A categoria {nome} foi atualizada com sucesso.')
    else:
        print(f'Não foi possível atualizar a categoria {nome}.')
    desconectar(conn)


def remover_tarefa():
    conn = conectar()
    cursor = conn.cursor()
    tarefa_id = input('Informe o ID da tarefa: ')
    cursor.execute(
        f"DELETE FROM tarefa WHERE id='{tarefa_id}'"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'A tarefa {tarefa_id} foi removida com sucesso.')
    else:
        print(f'Não foi possível remover a tarefa {tarefa_id}.')
    desconectar(conn)


def remover_categoria():
    conn = conectar()
    cursor = conn.cursor()

    categoria_id = input("Informe o ID da categoria: ")

    try:
        cursor.execute('SELECT COUNT(*) FROM tarefa WHERE '
                       'categoria_id = %s;', (categoria_id,))

        count = cursor.fetchone()[0]

        if count > 0:
            nova_categoria_id = input("Informe o ID da nova categoria "
                                      "(ou deixe em branco para NULL): ")

            if nova_categoria_id.strip():
                cursor.execute('UPDATE tarefa SET '
                               'categoria_id = %s WHERE '
                               'categoria_id = %s;',
                               (nova_categoria_id, categoria_id))
            else:
                cursor.execute('UPDATE tarefa SET '
                               ' categoria_id = NULL WHERE '
                               'categoria_id = %s;', (categoria_id,))

        cursor.execute('DELETE FROM categoria WHERE id = %s '
                       ' AND NOT EXISTS (SELECT 1 FROM'
                       ' tarefa WHERE categoria_id = %s);',
                       (categoria_id, categoria_id))
        conn.commit()
        print("Categoria removida com sucesso.")

    except Exception as e:
        conn.rollback()
        print(f"Erro ao remover categoria: {e}")

    finally:
        desconectar(conn)


def menu():
    """
    Função para gerar o menu inicial
    """
    print(f'-------- Bem vindo ao sistema de Tarefas --------') # noqa
    print('Selecione uma opção abaixo: ')
    print('1 - Inserir nova tarefa')
    print('2 - Listar tarefas')
    print('3 - Atualizar tarefa')
    print('4 - Deletar tarefa')
    print('5 - Inserir nova categoria')
    print('6 - Listar categorias')
    print('7 - Atualizar categoria')
    print('8 - Deletar categoria')
    print('9 - Listar tarefas e categorias')
    print('0 - Sair do sistema')

    opcao = int(input('Digite a opção desejada: '))

    if opcao == 1:
        os.system('cls' if os.name == 'nt' else 'clear')
        inserir_tarefa()
    elif opcao == 2:
        os.system('cls' if os.name == 'nt' else 'clear')
        listar_tarefas()
    elif opcao == 3:
        os.system('cls' if os.name == 'nt' else 'clear')
        atualizar_tarefa()
    elif opcao == 4:
        os.system('cls' if os.name == 'nt' else 'clear')
        remover_tarefa()
    elif opcao == 5:
        os.system('cls' if os.name == 'nt' else 'clear')
        inserir_categoria()
    elif opcao == 6:
        os.system('cls' if os.name == 'nt' else 'clear')
        listar_categorias()
    elif opcao == 7:
        os.system('cls' if os.name == 'nt' else 'clear')
        atualizar_categoria()
    elif opcao == 8:
        os.system('cls' if os.name == 'nt' else 'clear')
        remover_categoria()
    elif opcao == 9:
        os.system('cls' if os.name == 'nt' else 'clear')
        listar_tarefas_e_categorias()
    elif opcao == 0:
        print('Saindo do sistema...')
        exit()
    else:
        print('Opção inválida!')
