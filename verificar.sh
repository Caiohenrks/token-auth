#!/bin/bash

# Faz a solicitação para gerar o token e armazena a resposta na variável "TOKEN"
TOKEN=$(curl -s -X POST -H "Content-Type: application/json" -d '{"usuario":"admin", "senha":"12345"}' http://localhost:5000/gerar_token)

# Imprime o token gerado
echo "Token gerado: $TOKEN"

# Envia o token para a segunda aplicação para verificação
curl -X POST -H "Content-Type: application/json" -d "{\"token\":\"$TOKEN\"}" http://localhost:5001/verificar_token

