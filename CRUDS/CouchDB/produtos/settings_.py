import socket
"""
O couchdb usa sockets para se conectar ao servidor.
Sockets são pontos de comunicação entre processos.
Um servidor é um processo que fica esperando por conexões.
"""
import couchdb
from utils import nome, senha


def conectar():
    user = nome
    password = senha

    conn = couchdb.Server(f'http://{user}:{password}@localhost:5984/')

    banco = 'produtos'

    if banco in conn:
        db = conn[banco]
        return db
    try:
        db = conn.create(banco)
        return db
    except socket.gaierror:
        print('Não foi possível conectar ao servidor.'
              'Verifique se ele está ativo.')
    except couchdb.http.Unauthorized as e:
        print('Verifique o nome de usuário e senha. Erro: ', e)
    except ConnectionRefusedError as g:
        print('Verifique se o servidor está ativo. Erro: ', g)


def desconectar():
    """
    Desconectar não é necessário pois
    a própria biblioteca se encarrega disso.
    """
    pass


def listar():
    db = conectar()
    if db:
        if db.info()['doc_count'] > 0:
            print('Listando produtos...')
            for doc in db:
                print(f'Id: {db[doc]["_id"]}')
                print(f'Rev: {db[doc]["_rev"]}')
                print(f'Nome: {db[doc]["nome"]}')
                print(f'Preço: {db[doc]["preco"]}')
                print(f'Estoque: {db[doc]["estoque"]}')
                print()
        else:
            print('Não há produtos cadastrados.')
    else:
        print('Não foi possível conectar ao servidor.')
    print()


def inserir():
    db = conectar()

    if db:
        nome = input('Informe o nome do produto: ')
        preco = float(input('Informe o preço do produto: '))
        estoque = int(input('Informe a quantidade em estoque: '))
        produto = {'nome': nome, 'preco': preco, 'estoque': estoque}

        res = db.save(produto)

        if res:
            print('Produto cadastrado com sucesso.')
        else:
            print('Não foi possível cadastrar o produto.')
    else:
        print('Não foi possível conectar ao servidor.')
    print()


def atualizar():
    db = conectar()

    if db:
        chave = input('Informe o id do produto: ')

        try:
            doc = db[chave]
            nome = input('Informe o nome do produto: ')
            preco = float(input('Informe o preço do produto: '))
            estoque = int(input('Informe a quantidade em estoque: '))

            doc['nome'] = nome
            doc['preco'] = preco
            doc['estoque'] = estoque
            db[doc.id] = doc
            res = db.save(doc)

            if res:
                print('Produto atualizado com sucesso.')
            else:
                print('Não foi possível atualizar o produto.')
        except couchdb.http.ResourceNotFound:
            print('Produto não encontrado.')
    else:
        print('Não foi possível conectar ao servidor.')
    print()


def remover():
    db = conectar()

    if db:
        chave = input('Informe o id do produto: ')

        try:
            doc = db[chave]
            db.delete(doc)
            print('Produto removido com sucesso.')
        except couchdb.http.ResourceNotFound:
            print('Produto não encontrado.')
    else:
        print('Não foi possível conectar ao servidor.')
    print()


def buscar():
    db = conectar()

    if db:
        chave = input('Informe o id do produto: ')

        try:
            doc = db[chave]
            print(f'Nome: {doc["nome"]}')
            print(f'Preço: {doc["preco"]}')
            print(f'Estoque: {doc["estoque"]}')
        except couchdb.http.ResourceNotFound:
            print('Produto não encontrado.')
    else:
        print('Não foi possível conectar ao servidor.')
    print()


def menu():
    print('1 - Listar produtos')
    print('2 - Inserir produto')
    print('3 - Atualizar produto')
    print('4 - Remover produto')
    print('5 - Buscar produto')
    print('0 - Sair')
    print()

    nav = input('Escolha uma opção: ')

    if nav == '1':
        listar()
    elif nav == '2':
        inserir()
    elif nav == '3':
        atualizar()
    elif nav == '4':
        remover()
    elif nav == '5':
        buscar()
    elif nav == '0':
        exit()
    else:
        print('Opção inválida.')
