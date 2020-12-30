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

