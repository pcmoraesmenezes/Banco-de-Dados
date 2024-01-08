import sqlite3


def conectar():
    """
    Função para conectar ao servidor
    """
    conn = sqlite3.connect('crud.db')
    conn.execute(
        "CREATE TABLE IF NOT EXISTS usuarios ( "
        " id INTEGER PRIMARY KEY AUTOINCREMENT, "
        " nome TEXT NOT NULL, "
        " sobrenome TEXT NOT NULL, "
        " telefone TEXT NOT NULL, "
        " email TEXT NOT NULL );"
        )
    return conn


def desconectar(conn):
    """
    Função para desconectar do servidor.
    """
    if conn:
        conn.close()


def listar():
    """
    Função para listar os registros.
    """
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM usuarios;")
    lista = cursor.fetchall()

    if len(lista) > 0:
        print("Listando usuários...")
        for i in lista:
            print(i)
    else:
        print("Não existem usuários cadastrados!")

    desconectar(conn)
    return lista


def inserir():
    """
    Função para inserir registros.
    """
    conn = conectar()
    cursor = conn.cursor()

    nome = input("Digite o nome: ")
    sobrenome = input("Digite o sobrenome: ")
    telefone = input("Digite o telefone: ")
    email = input("Digite o email: ")

    cursor.execute(
        "INSERT INTO usuarios (nome, sobrenome, telefone, email) "
        "VALUES ('{}', '{}', '{}', '{}');"
        .format(nome, sobrenome, telefone, email)
        )
    conn.commit()
    desconectar(conn)


def atualizar():
    """
    Função para atualizar registros.
    """
    conn = conectar()
    cursor = conn.cursor()

    id = input("Digite o ID do usuário a ser atualizado: ")
    nome = input("Digite o nome: ")
    sobrenome = input("Digite o sobrenome: ")
    telefone = input("Digite o telefone: ")
    email = input("Digite o email: ")

    cursor.execute(
        "UPDATE usuarios SET nome='{}', sobrenome='{}', "
        "telefone='{}', email='{}' WHERE id='{}';"
        .format(nome, sobrenome, telefone, email, id)
        )
    conn.commit()
    desconectar(conn)


def deletar():
    """
    Função para deletar registros.
    """
    conn = conectar()
    cursor = conn.cursor()

    id = input("Digite o ID do usuário a ser deletado: ")

    cursor.execute("DELETE FROM usuarios WHERE id='{}';".format(id))
    conn.commit()
    desconectar(conn)


def menu():
    """
    Função para gerar o menu principal.
    """
    print("Controle de usuários")
    print("1 - Listar usuários")
    print("2 - Inserir usuário")
    print("3 - Atualizar usuário")
    print("4 - Deletar usuário")
    print("5 - Sair")

    nav = int(input("Escolha uma opção: "))
    if nav == 1:
        listar()
    elif nav == 2:
        inserir()
    elif nav == 3:
        atualizar()
    elif nav == 4:
        deletar()
    elif nav == 5:
        print("Saindo...")
        exit()
    else:
        print("Opção inválida!")
