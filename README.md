**README.md**

# Demonstração de Comunicação entre Aplicações com Docker


# Instalação
- Dar permissão ao arquivo ```chmod +x install_cenarios.sh```
- Executar o instalador para buildar a imagem e subir o container ``` ./install_cenarios.sh```

Essa solução é um cenário de exemplo que demonstra o uso do Docker para implantar duas aplicações em contêineres separados, que se comunicam através de solicitações HTTP.

## Descrição dos Arquivos

- **Dockerfile-gerar**: Arquivo de definição Docker que instrui a construção da imagem para a aplicação que gera o token. Contém as dependências e comandos necessários para criar o ambiente em que a aplicação será executada.

- **Dockerfile-verificar**: Arquivo de definição Docker que instrui a construção da imagem para a aplicação que verifica o token. Também contém as dependências e comandos necessários para criar o ambiente em que a aplicação será executada.

- **gerar_token.py**: Script Python que implementa a primeira aplicação. Essa aplicação expõe um endpoint HTTP que recebe uma solicitação com um usuário e senha específicos. Se as credenciais forem válidas (usuário: "admin" e senha: "12345"), a aplicação gera um token JWT usando o algoritmo SHA256. O token tem uma expiração de 15 segundos e é retornado como resposta da solicitação.

- **verificar_token.py**: Script Python que implementa a segunda aplicação. Essa aplicação expõe um endpoint HTTP que recebe um token JWT como entrada. Ela verifica se o token é válido e não expirou. Se o token for válido, retorna uma mensagem "Acesso permitido"; caso contrário, retorna uma mensagem "Acesso negado".

- **install_cenarios.sh**: Script shell que automatiza o processo de construção das imagens Docker e início dos contêineres para ambas as aplicações. O script verifica se os contêineres já existem; se existirem, eles são removidos para permitir a criação de novos contêineres. Em seguida, o script constrói as imagens Docker e inicia os contêineres com base nos arquivos Dockerfile e nos scripts Python fornecidos.

- **verificar.sh**: Script shell que interage com as aplicações em contêineres. Ele faz uma solicitação para a primeira aplicação (gerar_token.py) para obter um token e, em seguida, envia esse token para a segunda aplicação (verificar_token.py) para verificação. O script exibe o token gerado e a resposta da segunda aplicação.

## Objetivo

Essa solução tem como objetivo demonstrar um cenário onde duas aplicações são isoladas em contêineres Docker e se comunicam através de solicitações HTTP para gerar e verificar tokens JWT. A primeira aplicação gera o token com base nas credenciais fornecidas, enquanto a segunda aplicação valida e verifica a autenticidade do token antes de conceder ou negar o acesso.

## Benefícios do Uso do Docker

A utilização do Docker torna a implantação das aplicações e a configuração do ambiente mais fácil e consistente, pois cada aplicação é executada em um contêiner independente, garantindo isolamento e portabilidade. Além disso, o Docker permite escalonar e gerenciar as aplicações de forma mais eficiente, possibilitando o desenvolvimento ágil e a construção de arquiteturas de microsserviços e sistemas distribuídos.

## Instruções de Uso

1. Certifique-se de ter o Docker instalado em seu sistema.

2. Faça o download dos arquivos deste repositório.

3. Dê permissão de execução aos scripts shell:

```bash
chmod +x install_cenarios.sh verificar.sh
```

4. Execute o script `install_cenarios.sh` para construir as imagens Docker e iniciar os contêineres para ambas as aplicações:

```bash
./install_cenarios.sh
```

5. O script `verificar.sh` interage com as aplicações em contêineres, obtendo um token gerado pela primeira aplicação e enviando-o para a segunda aplicação para verificação:

```bash
./verificar.sh
```

6. Observe o resultado da verificação na resposta do script `verificar.sh`.

Esperamos que esta demonstração seja útil para entender como utilizar o Docker para criar uma arquitetura de comunicação entre aplicações de forma simples e eficiente.

---
