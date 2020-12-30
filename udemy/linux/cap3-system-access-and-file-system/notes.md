# Capítulo 3 - System Access and File System

## Aula 33
Para acessar um sistema linux de forma remota a partir de uma máquina Windows, é preciso instalar o software Putty.

Caso a sua máquina seja Linux, não precisa. Basta fazer o acesso via protocolo SSH.

## Aula 35
Para conectar ao terminal de uma máquina remota, é preciso saber o IP dela.
Uma forma de descobrir o IP de uma máquina, é acessando o terminal dela e listando as interfaces de rede que ela possui.

Comando para listar as interfaces de rede conectadas à máquina:

<> ifconfig <br/>
<> ip addr <br/>
<> ip a <br/>

O comando **ifconfig** está sendo depreciado em algumas versões do linux. Dê preferência pelos comandos "**ip a**" ou "**up addr**".

## Aula 36
Se a máquina linux remota não tiver um IP atribuído à sua interface de rede, então será necessário fazer isso manualmente.

Acesse o terminal como administrador e use o comando:<br/>
<> ifup enp0s3 <br/>

O comando vai ativar a interface de rede, permitindo que ela se comunique pela rede.

No caso acima, **enp0s3** é o nome da interface de rede, obtido pelo comando **ifconfig**.

## Aulas 38-39
O sistema de arquivos do linux é uma árvore de diretórios organizados de forma hierárquica. No topo está o diretório **"/"**, também conhecido como Raíz do sistema.

Dentro desse diretório, existem uma série de pastas destinadas a armazenarem arquivos e informações com diferentes propósitos.
- /boot
  - é o primeiro diretório a ser acessado quando o sistema é iniciado.
  - nela estão os arquivos com informações sobre como deve ser feita a inicialização do sistema operacional (ou boot).
- /root
  - diretório do usuário que está autenticado no sistema
- /dev
  - armazena os arquivos com informações sobre os mídias físicas da máquina, como discos rígidos, cdrom, entradas e saídas de áudio, teclado etc...)
- /etc
  - contém arquivos com configurações para as aplicações que rodam no sistema linux (ftp, nfs, e-mail, dns, etc..)
  - sempre faça backup dos arquivos dessa pasta, antes de alterá-los!
- /bin ou /usr/bin
  - nessa pasta estão os arquivos com as definições dos comandos que os usuários executam na linha de comando do sistema (ls, pwd, cd etc...)
- /sbin ou /usr/sbin
  - nessa pasta estão os arquivos que configuram o próprio sistema de arquivos do sistema
- /opt
  - nessa pasta entram os arquivos com as configurações dos aplicativos de terceiros que o usuário instala no sistema
- /proc
  - cada processo que estiver rodando na máquina terá um arquivo nessa pasta
  - quando o pc é desligado, essa pasta é esvaziada!
- /lib ou /usr/lib
  - essa pasta contém bibliotecas em C que são usadas pelas aplicações que estão instaladas no sistema
  - sempre que algo uma aplicação precisar instalar scripts em C para funcionar, ela vai guardar esse script nesse diretório
- /tmp
  - diretório para guardar arquivos temporários
- /home
  - todos os usuários terão suas pastas nesse diretório
  - todos os arquivos produzidos por eles ficam em seus respectivos diretórios
- /var
  - logs produzidos pelo sistema e pelas aplicações rodando nele são guardados nesse diretório
- /run
  - diretório para guardar arquivos com informações sobre a execução das aplicações que estão rodando no sistema (como arquivos PID). 
  - Se o computador for desligado, tudo é apagado.
- /mnt
  - diretório usado para montar outros sistemas de arquivos na máquina 
- /media
  - diretório onde ficam os dados de dispositivos de mídia externos, como CD-ROM.

## Aula 42
Existem os seguintes tipos de arquivos no linux:
-   regular file (arquivo)
-   directory (diretório)
-   link (link simbólico)
-   special file or device file (dispositivos conectados à máquina)
-   socket
-   named pipe
-   block device

Dentro de um diretório, ao executar o comando:
<> ls -l

Todo o conteúdo do diretório será exibido, com informações detalhadas, incluindo o tipo de cada arquivo.

Caso o arquivo seja um diretório, o campo type começará com **d**. <br/>
Ex: dr-xr-xr-x 

Caso o arquivo seja um link simbólico, o campo type começará com **l**. <br/>
Ex: lrwxrwxrwt

Caso o arquivo seja um arquivo, propriamente dito, o campo type começará vazio, ou com **-**. <br/>
Ex: -rw-r--r--

## Aula 46
Para buscar arquivos, existem dois comandos: **locate** e **find**.

A grande diferença entre eles é que o **locate** mantém um banco de dados (um cache) com as informações dos arquivos do sistema. Assim, as buscas acontecem nesse banco. Ela é muito mais rápida do que o comando **find**, que basicamente itera sobre todos os arquivos do sistema.
De tempos em tempos, o sistema roda automaticamente o comando **updatedb** para atualizar o banco de dados.

Para usar o comando locate, existem dois detalhes importantes:
- é preciso ter o pacote **mlocate** instalado
  - **yum install mlocate**
- caso o comando não retorne nada, acesse o terminal como root e rode o comando:
  - **updatedb**


## Aula 48
Em determinadas atividades, costuma ser preciso operar em uma grande quantidade de arquivos (seja para criar, remover etc...). Se esses arquivos tiverem um padrão em sua nomenclatura, é possível escrever um comando que vai atuar em todos eles!. Para fazer isso, usa-se os chamados **WildCards**.

Existem 3:
- *(asterisco)
  - representa uma totalidade (ou nenhum)
- ?(interrogação)
  - representa um valor em específico, mas que não é importante
- [](colchetes)
  - representa um conjunto de possibilidades

Ex1:
Para criar 9 arquivos com os nomes: arquivo1-xyz, arquivo2-xyz, arquivo3-xyz...arquivo9-xyz, basta usar o wildcard de conjunto **{}**.<br/>
<> touch arquivo[1..9]-xyz

Ex2:
Para listar todos os arquivos que começam com "abc", basta usarmos o wildcard de totalidade.<br/>
<> ls -l abc*

Ex3:
Para listar todos os arquivos que terminam com "xyz", basta usarmos o wildcard de totalidade.<br/>
<> ls -l *xyz

Ex4:
Para listar todos os arquivos que começam com uma caractere qualquer, seguido de "bcd", basta combinar dois wildcards, o de ? e o de totalidade.<br/>
<> ls -l ?bcd*

Ex5:
Para listar todos os arquivos que possuem "xy", basta usar o wildcard de totalidade.<br/>
<> ls -l * xy *

Ex6:
Para listar todos os arquivos que possuem ou "x", ou "y", basta usar o wildcard de conjunto.<br/>
<> ls -l * [xy] *