import MySQLdb  # type: ignore
from settings_ import DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_DATABASE
import os


def conectar() -> MySQLdb.connect:
    try:
        conn = MySQLdb.connect(
            host=DB_HOST,
            port=int(DB_PORT),
            user=DB_USER,
            passwd=DB_PASSWORD,
            db=DB_DATABASE
        )
        return conn
    except MySQLdb.Error as e:
        print(f'Erro na conexão ao MySQL Server: {e}')
    return None


def desconectar(conn: MySQLdb.connect) -> None:
    if conn:
        conn.close()


def create_tables() -> None:
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'CREATE TABLE IF NOT EXISTS produtos ( '
        'id INT AUTO_INCREMENT PRIMARY KEY,'
        'nome VARCHAR(50) NOT NULL,'
        'preco DECIMAL(8,2) NOT NULL,'
        'estoque INT NOT NULL'
        ');'
    )

    cursor.execute(
        'CREATE TABLE IF NOT EXISTS clientes ( '
        'id INT AUTO_INCREMENT PRIMARY KEY,'
        'nome VARCHAR(50) NOT NULL,'
        'sobrenome VARCHAR(50) NOT NULL,'
        'cpf VARCHAR(11) NOT NULL,'
        'email VARCHAR(100) NOT NULL'
        ');'
    )

    conn.commit()
    desconectar(conn)


def listar_clientes() -> None:
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'SELECT * FROM clientes;'
    )
    clientes = cursor.fetchall()  # fetchall() -> lista de tuplas
    if clientes:
        print('\nListando clientes...\n')
        for cliente in clientes:
            print(f'ID: {cliente[0]}\n'
                  f'Nome: {cliente[1]}\n'
                  f'Sobrenome: {cliente[2]}\n'
                  f'CPF: {cliente[3]}\n'
                  f'E-mail: {cliente[4]}\n')
    else:
        print('Não existem clientes cadastrados.')
    desconectar(conn)


def listar_produtos() -> None:
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute(
        'SELECT * FROM produtos;'
    )
    produtos = cursor.fetchall()
    if produtos:
        print('Listando produtos...\n')
        for produto in produtos:
            print(f'ID: {produto[0]}\n'
                  f'Nome: {produto[1]}\n'
                  f'Preço: {produto[2]}\n'
                  f'Estoque: {produto[3]}\n')
    else:
        print('Não existem produtos cadastrados.')
    desconectar(conn)


def inserir_produto() -> None:
    conn = conectar()
    cursor = conn.cursor()

    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe a quantidade em estoque: '))

    cursor.execute(
        f"INSERT INTO produtos (nome, preco, estoque)"
        f"VALUES ('{nome}', '{preco}', '{estoque}')"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'O produto {nome} foi inserido com sucesso! ')
    else:
        print(f'Não foi possível inserir o produto {nome}!')
    desconectar(conn)


def inserir_cliente() -> None:
    conn = conectar()
    cursor = conn.cursor()

    nome = input('Informe o nome do cliente: ')
    sobrenome = input('Informe o sobrenome do cliente: ')
    cpf = input('Informe o cpf do cliente: ')
    email = input('Informe o email do cliente: ')

    cursor.execute(
        "INSERT INTO clientes (nome, sobrenome, cpf, email)"
        f"VALUES ('{nome}', '{sobrenome}', '{cpf}', '{email}')"
    )

    conn.commit()
    if cursor.rowcount == 1:
        print(f'O cliente {nome} foi cadastrado com sucesso! ')
    else:
        print(f'Não foi possível cadastrar o cliente {nome}')

    desconectar(conn)


def atualizar_cliente() -> None:
    conn = conectar()
    cursor = conn.cursor()

    _id = int(input('Informe o ID do cliente a ser modificado: '))

    nome = input('Informe o nome do cliente: ')
    sobrenome = input('Informe o sobrenome do cliente: ')
    cpf = input('Informe o cpf do cliente: ')
    email = input('Informe o email do cliente: ')

    cursor.execute(
        "UPDATE clientes "
        f"SET nome='{nome}', sobrenome='{sobrenome}', "
        f" cpf='{cpf}', email='{email}' "
        f" WHERE id = '{_id}';"
    )
    conn.commit()
    if cursor.rowcount == 1:
        print(f'O cliente {nome} foi atualizado com sucesso! ')
    else:
        print('Não foi possível atualizar o cliente! ')
    desconectar(conn)


def atualizar_produto() -> None:
    conn = conectar()
    cursor = conn.cursor()

    _id = int(input('Informe o ID do produto a ser modificado: '))

    nome = input('Informe o nome do produto: ')
    preco = float(input('Informe o preço do produto: '))
    estoque = int(input('Informe a quantidade em estoque: '))

    cursor.execute(
        "UPDATE produtos "
        f"SET nome='{nome}', preco='{preco}', "
        f" estoque='{estoque}' WHERE id='{_id}';"
        )

    conn.commit()
    if cursor.rowcount == 1:
        print(f'O produto {nome} foi atualizado com sucesso! ')
    else:
        print('Não foi possível atualizar o produto! ')
    desconectar(conn)


def deletar_produto() -> None:
    conn = conectar()
    cursor = conn.cursor()

    _id = int(input('Informe o código do produto: '))

    cursor.execute(
        f"DELETE FROM produtos WHERE id='{_id}';"
    )

    conn.commit()

    if cursor.rowcount == 1:
        print(f'Foi possível deletar o produto com ID = {_id}')
    else:
        print('Não foi possível excluir o produto! ')
    desconectar(conn)


def deletar_cliente() -> None:
    conn = conectar()
    cursor = conn.cursor()

    _id = int(input('Informe o código do cliente: '))

    cursor.execute(
        f"DELETE FROM clientes WHERE id='{_id}';"
    )

    conn.commit()

    if cursor.rowcount == 1:
        print(f'Foi possível deletar o cliente com ID = {_id}')
    else:
        print('Não foi possível excluir o cliente! ')
    desconectar(conn)


def menu():
    """
    Função para gerar o menu inicial
    """
    print(f'-------- Bem vindo ao sistema de cadastro de produtos e clientes --------') # noqa
    print('Selecione uma opção abaixo: ')
    print('1 - Inserir novo produto')
    print('2 - Listar produtos')
    print('3 - Atualizar produto')
    print('4 - Deletar produto')
    print('5 - Inserir novo cliente')
    print('6 - Listar clientes')
    print('7 - Atualizar cliente')
    print('8 - Deletar cliente')
    print('9 - Sair do sistema')

    opcao = int(input('Digite a opção desejada: '))
    if opcao == 1:
        os.system('cls' if os.name == 'nt' else 'clear')
        inserir_produto()

    elif opcao == 2:
        os.system('cls' if os.name == 'nt' else 'clear')
        listar_produtos()

    elif opcao == 3:
        os.system('cls' if os.name == 'nt' else 'clear')
        atualizar_produto()

    elif opcao == 4:
        os.system('cls' if os.name == 'nt' else 'clear')
        deletar_produto()

    elif opcao == 5:
        os.system('cls' if os.name == 'nt' else 'clear')
        inserir_cliente()

    elif opcao == 6:
        os.system('cls' if os.name == 'nt' else 'clear')
        listar_clientes()

    elif opcao == 7:
        os.system('cls' if os.name == 'nt' else 'clear')
        atualizar_cliente()

    elif opcao == 8:
        os.system('cls' if os.name == 'nt' else 'clear')
        deletar_cliente()

    elif opcao == 9:
        os.system('cls' if os.name == 'nt' else 'clear')
        print('Saindo do sistema...')
        exit(0)
