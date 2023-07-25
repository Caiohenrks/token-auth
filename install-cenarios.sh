#!/bin/bash

# Verifica se o contêiner gerar_token_container já existe
if docker ps -a | grep -q gerar_token_container; then
    echo "Removendo contêiner gerar_token_container existente..."
    docker rm -f gerar_token_container
fi

# Verifica se o contêiner verificar_token_container já existe
if docker ps -a | grep -q verificar_token_container; then
    echo "Removendo contêiner verificar_token_container existente..."
    docker rm -f verificar_token_container
fi

# Constrói a imagem para a aplicação que gera o token
docker build -t gerar_token_app -f Dockerfile-gerar .

# Constrói a imagem para a aplicação que verifica o token
docker build -t verificar_token_app -f Dockerfile-verificar .

# Inicia o contêiner para a aplicação que gera o token na porta 5000
docker run -d -p 5000:5000 --name gerar_token_container gerar_token_app

# Inicia o contêiner para a aplicação que verifica o token na porta 5001
docker run -d -p 5001:5000 --name verificar_token_container verificar_token_app

