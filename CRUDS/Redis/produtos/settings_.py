import redis


def gera_id():
    try:
        conn = conectar()
        chave = conn.get('chave')

        if chave:
            chave = conn.incr('chave')
            return chave

        conn.set('chave', 1)
        return 1

    except redis.exceptions.conectionError as e:
        print(f'Erro ao gerar ID: {e}')


def conectar():
    conn = redis.Redis(
        host='localhost',
        port=6379,
    )
    return conn


def desconectar(conn):
    if conn:
        conn.close()


def listar():
    conn = conectar()
    try:
        dados = conn.keys(pattern='produtos:*')
        if len(dados) > 0:
            print('---------------------------------------')

            for chave in dados:
                produto = conn.hgetall(chave)
                print(f"id: {str(chave, 'utf-8', 'ignore')}")
                print(f"produto: {str(produto[b'nome'], 'utf-8', 'ignore')}")
                print(f"preco: {str(produto[b'preco'], 'utf-8', 'ignore')}")
                print(f"estoque: {str(produto[b'estoque'], 'utf-8','ignore')}")
                """
                o b'nome' é para converter o valor em bytes para string
                """
                print('---------------------------------------')
        else:
            print('A coleção está vazia!')
    except redis.RedisError as e:
        print(f'Erro ao listar os documentos: {e}')

    desconectar(conn)


def inserir():
    conn = conectar()
    nome = input('Digite o nome: ')
    preco = float(input('Digite o preço: '))
    estoque = int(input('Digite o estoque: '))

    produtos = {
        "nome": nome,
        "preco": preco,
        "estoque": estoque
        }

    chave = f'produtos:{gera_id()}'  # gera um id para cada produto

    try:
        conn.hmset(chave, produtos)
        print('Documento inserido com sucesso!')
    except redis.RedisError as e:
        print(f'Erro ao inserir o documento: {e}')

    desconectar(conn)


def atualizar():
    conn = conectar()

    chave = input('Digite o ID do produto: ')

    if chave == '':
        print('O ID do produto não pode ser vazio!')
        return

    if not conn.exists(chave):
        print('O ID do produto não existe!')
        return

    nome = input('Digite o nome: ')
    preco = float(input('Digite o preço: '))
    estoque = int(input('Digite o estoque: '))

    produto = {
        "nome": nome,
        "preco": preco,
        "estoque": estoque
        }

    try:
        res = conn.hmset(chave, produto)
        if res:
            print(f'O produto {nome} foi atualizado com sucesso!')
        else:
            print('Erro ao atualizar o produto!')
    except redis.RedisError as e:
        print(f'Erro ao atualizar o documento: {e}')

    desconectar(conn)


def deletar():
    conn = conectar()

    chave = input('Digite o ID do produto: ')

    if chave == '':
        print('O ID do produto não pode ser vazio!')
        return

    if not conn.exists(chave):
        print('O ID do produto não existe!')
        return

    try:
        res = conn.delete(chave)
        if res:
            print('Produto deletado com sucesso!')
        else:
            print('Erro ao deletar o produto!')
    except redis.RedisError as e:
        print(f'Erro ao deletar o documento: {e}')

    desconectar(conn)


def menu():
    while True:
        print('-----------------MENU-----------------')
        print('1 - Listar documentos')
        print('2 - Inserir documento')
        print('3 - Atualizar documento')
        print('4 - Deletar documento')
        print('5 - Sair')

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
            break

        else:
            print('Opção inválida!')
