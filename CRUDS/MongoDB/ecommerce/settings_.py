from bson import ObjectId
from pymongo import MongoClient, errors


def conectar():
    """
    Função para conectar ao servidor, nesse caso não
    ocorre exceção, pois o servidor está local.
    """
    conn = MongoClient('localhost', 27017)
    return conn


def desconectar(conn):
    """
    Função para desconectar do servidor.
    """
    if conn:
        conn.close()


def listar():
    """
    Função para listar os documentos da coleção.
    """
    conn = conectar()
    db = conn.CRUD
    try:
        if db.ecommerce.count_documents({}) > 0:
            for ecommerce in db.ecommerce.find():
                print('---------------------------------------')
                print(f'{ecommerce["_id"]}')
                try:
                    print(f'{ecommerce["nome"]}')
                    print(f'{ecommerce["email"]}')
                    print(f'{ecommerce["senha"]}')
                    print(f'{ecommerce["data_cadastro"]}')
                    print('---------------------------------------')
                except KeyError:
                    print('Chave não encontrada!')
        else:
            print('A coleção está vazia!')
    except errors.PyMongoError as e:
        print(f'Erro ao listar os documentos: {e}')

    desconectar(conn)


def inserir():
    """
    Função para inserir um documento na coleção.
    """
    conn = conectar()
    db = conn.CRUD
    try:
        nome = input('Digite o nome: ')
        email = input('Digite o e-mail: ')
        senha = input('Digite a senha: ')
        data_cadastro = input('Digite a data de cadastro: ')

        db.ecommerce.insert_one({
            'nome': nome,
            'email': email,
            'senha': senha,
            'data_cadastro': data_cadastro
        })
        print('Documento inserido com sucesso!')
    except errors.PyMongoError as e:
        print(f'Erro ao inserir documento: {e}')

    desconectar(conn)


def atualizar():
    """
    Função para atualizar um documento na coleção.
    """
    conn = conectar()
    db = conn.CRUD
    try:
        id = input('Digite o ID do documento que deseja atualizar: ')
        nome = input('Digite o nome: ')
        email = input('Digite o e-mail: ')
        senha = input('Digite a senha: ')
        data_cadastro = input('Digite a data de cadastro: ')

        db.ecommerce.update_one(
            {'_id': ObjectId(id)},
            {
                '$set': {
                    'nome': nome,
                    'email': email,
                    'senha': senha,
                    'data_cadastro': data_cadastro
                }
            }
        )
        print('Documento atualizado com sucesso!')
    except errors.PyMongoError as e:
        print(f'Erro ao atualizar documento: {e}')

    desconectar(conn)


def deletar():
    """
    Função para deletar um documento na coleção.
    """
    conn = conectar()
    db = conn.CRUD
    try:
        id = input('Digite o ID do documento que deseja deletar: ')
        db.ecommerce.delete_one({'_id': ObjectId(id)})
        print('Documento deletado com sucesso!')
    except errors.PyMongoError as e:
        print(f'Erro ao deletar documento: {e}')

    desconectar(conn)


def menu():
    """
    Função para gerar o menu de opções.
    """
    print('1) Listar documentos')
    print('2) Inserir documento')
    print('3) Atualizar documento')
    print('4) Deletar documento')
    print('5) Sair')
    print()

    nav = input('Digite a opção desejada: ')

    if nav == '1':
        listar()
    elif nav == '2':
        inserir()
    elif nav == '3':
        atualizar()
    elif nav == '4':
        deletar()
    elif nav == '5':
        print('Saindo...')
        exit()
    else:
        print('Opção inválida!')
