# Comando aprendidos neste capítulo

# Utilitários -------------------------------------------------------------------------------------------

# exibe usuario atual logado no sistema
whoami

# trocar de usuário
su
su - # trocar para o usuário root

clear # limpa terminal

ln /home/gaspar/contrato #cria hard link para arquivo
ln -s /home/gaspar/contrato #cria soft link para arquivo

man ls # acessa o manual do comando ls
whatis ls # obtém descrição de um comando
ls --help #

date # obtém a data atual

# Rede ---------------------------------------------------------------------------------------------------
ifconfig # Lista interfaces de rede
ip addr # Lista interfaces de rede
ip a # Lista interfaces de rede

# Sistema de arquivos ------------------------------------------------------------------------------------
# cd - change directory
cd /folderName
#pwd - print working directory
pwd
# ls - list
ls  # lista o conteúdo de um diretório
ls -l # lista e detalha o conteúdo de um diretório
ls -ltr # lista com detalhes, ordena por tempo em ordem reversa
ls -l *[xy]* # lista arquivos que satisfizerem o wildcard
ls -l * xy * # lista arquivos que satisfizerem o wildcard
ls -l ?bcd* # lista arquivos que satisfizerem o wildcard
ls -l *xyz # lista arquivos que satisfizerem o wildcard
ls -l abc* # lista arquivos que satisfizerem o wildcard


touch gaspar.txt   # cria um arquivo
rm -f gaspar.txt   # remove um arquivo
rm -r folderName   # remove uma pasta
touch arquivo[1..9]-xyz # cria arquivos seguindo o padrão do wildcard
cp ./gaspar.txt ./gaspar_backuo.txt  #faz uma cópia do arquivo
mkdir documentos # cria um diretório

# Busca de arquivos (retornam o caminho do arquivo, caso seja encontrado)
find . -name gaspar.txt # a partir do caminho atual, procura pelo arquivo
find / -name gaspar.txt # procura o arquivo a partir da raíz do sistema (necessário acesso root)
locate gaspar.txt # procura o arquivo

# Controle de usuários ------------------------------------------------------------------------------------
passwd # inicia algoritmo para troca da senha do usuário atual
passwd userId # inicia algoritmo para troca da senha de um usuário (necessário estar como root)
passwd - # inicia algoritmo para troca da senha do usuário root (necessário estar como root)

# Controle de permissões -
chmod g-w jerry
chmod u-w jerry
chmod a-r jerry
chmod u+w jerry
chmod a+r jerry
chmod g+rw jerry
chmod o+w jerry
chmod ugo-x jerry

# trocar o dono de um arquivo
chown root gaspar.txt
# trocar o grupo ao qual um arquivo pertecente
chgrp root gaspar.txt
# Ajustes finos de permissões
getfacl path/to/file
setfacl -m u:userName:rwx /path/to/file
setfacl -m g:groupName:rw path/to/file
setfacl -dm "rwx" /path/to/file
setfacl -b /path/to/file

# Manipulação de arquivos e textos
echo "hello world" > hellofile
echo "hello again" >> hellofile
cat hellofile
touch fileWithOutput
ls -ltr > fileWithOutput # escreve a saída de um comando em um arquivo
