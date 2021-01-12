# **Section 3 - Building custom images**

In order to build your own docker images, you need to create a dockerfile which is a kind of a recipe.

A basic implementation of a dockerfile would be as the following:

```dockerfile
# Imagem base
FROM alpine

# Executa comando
RUN apk add --update redis

# Comando de execução do processo principal
CMD ["redis-server"]
```

After you have finished writing the dockerfile, the next step is to build a docker image from it. For that, there is the following command:

```shell
>> docker build .
```

Now, let's break the dockerfile down, line by line.

<hr />

```dockerfile
FROM alpine
```
Nessa linha define-se uma imagem base, a partir da qual a imagem da aplicação será construída.

Essa imagem base já vem com o sistema de arquivos de um sistema linux, com as funcionalidades essenciais. 

**Alpine** é uma versão do linux extremamente leve. Ela só possuí os arquivos que são necessários para o funcionamento do SO. **Nada além disso**.

<hr/>

```dockerfile
RUN apk add --update redis
```
**apk** é o gerenciador de pacotes do Alpine. Com ele é possível adicionar softwares de terceiros à imagem que está para ser construída.

Neste caso, o gerenciador está sendo usado para instalar o redis.

<hr/>

```dockerfile
CMD ["redis-server"]
```

Depois de os softwares requeridos pela aplicação terem sido instalados (incluindo  a própria aplicação), é preciso explicitar qual será o comando usado para iniciar a aplicação como um processo dentro do container.

Como a aplicação é o redis (neste caso), o comando é "redis-server".
<hr/>

```shell
>> docker build .
```

Comando para construir a imagem a partir do dockerfile.

O processo de build consiste de etapas. A primeira etapa quem faz é o Docker Server. Ela consiste basicamente em verificar se a imagem base se encontra na máquina local (no cache de imagens), caso negativo, o Docker Server vai baixar ela do repositório.

Cada comando RUN consiste de uma nova etapa.

No primeiro comando RUN, um container será criado com a imagem base. Uma vez montado, o comando explicitado será executado e o sistema de arquivos, que até então era o da imagem base, será transformado para um novo estado (seja pela adição de novas pastas e arquivos, seja pela instalação de novos pacotes). Ao final, uma nova imagem será criada, dessa vez contendo o atual estado do sistema de arquivos.

No segundo comando RUN o mesmo processo vai ocorrer. A única diferença é que o container vai ser criado a partir da imagem que foi gerada na etapa imediatamente anterior! (descrita no parágrafo acima).

Após todos os comandos RUN, a imagem resultante do processo (retornada após a execução do último comando RUN) vai ser configurada com o comando de execução do processo principal.
