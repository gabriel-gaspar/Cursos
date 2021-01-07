# Capítulo 4 - Linux Fundamentals

## Aula 53
Para obter detalhes sobre os comandos do linux, diretamente pelo terminal, use o comando "man". <br/>
Ex: <br/>
<> man ls <br/>

## Aula 54
Todos os arquivos do linux possuem permissões que são atribuídas em três níveis:
-   u - usuários cadastrados no sistema
-   g - grupos de usuários cadastrados no sistema
-   o - outros usuários e convidados

Existem três tipos de permissões:
-   r - leitura (read)
-   w - escrita (w)
-   x - execução (execute)

Ao rodar o comando <br/> 
<> ls -l <br/>
Serão exibidas as permissões de acesso a cada arquivo dentro do diretório.<br/>
Ex: <br/>
Supondo que um arquivo chamado jerry tenha o seguinte tipo: <br/>
-rw-rw-r-- <br/>
-   o primeiro caractere "-" indica que o arquivo é um arquivo, propriamente dito.
-   os próximos 3 caracteres indicam as permissões atribuídas ao usuário dono do arquivo.
    -   rw-
    -   permissão para leitura e escrita.
- os próximos três caracteres indicam as permissões atribuídas aos grupos de usuários aos quais o arquivo pertence
  - rw-
    - permissão para leitura e escrita
- os últimos 3 caracteres indicam as permissões atribuídas a quaisquer outros usuários do sistema
  - r--
    - permissão para leitura

As permissões podem ser alteradas através do comando **chmod** (change moderators).

**Curiosidade**: <br/>
Os diretórios possuem o campo type no seguinte formato: <br/>
drwxrwxr-x <br/>
Se a permissão de execução (x) for removida de todos os níveis (u,g,o), ninguém poderá acessar a pasta, apenas o usuário **root**.

## Aula 56
Arquivos do linux pertencem a usuários e grupos de usuários.
Apenas o usuário root pode alterar os donos de um arquivo.
O dono de um arquivo, ou o grupo de usuários ao qual um arquivo pertence, podem ser alterados pelos comandos: **chown e chgrp**

Curiosidade: Se você for o usuário gaspar e dentro do seu diretório (/home/gaspar) haver um arquivo que pertence ao usuário root, você ainda assim poderá fazer o que quiser com esse arquivo, pois o seu diretório /home/gaspar pertence a você e te permite ler, escrever e executar qualquer arquivo que estiver dentro.

## Aula 57
Para dar permissões específicas para um usuários, ou para um grupo de usuário, sobre um arquivo, deve-se usar o recurso Access List Control.

Toda vez que um arquivo possuir permissões desse tipo, um "+" será o ultimo caractere do campo type desse arquivo.

Exemplos:
Para listar as permissões ACL de um arquivo
getfacl path/to/file

Para adicionar permissões a um usuário em especifico
setfacl -m u:userName:rwx /path/to/file

Para adicionar permissões a um grupo de usuários específico
setfacl -m g:groupName:rw path/to/file

Para adicionar permissões a um diretório e todos os seus arquivos filhos
setfacl -dm "rwx" /path/to/file

Para remover todas as permissões ACL
setfacl -b /path/to/file

