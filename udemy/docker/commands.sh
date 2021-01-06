# Apenas cria o container do Redis
# Esse comando apenas monta o sistema de arquivos contento o Redis em uma namespace separada.
docker create redis

# Inicia um Container que está parado
# Esse comando vai executar o comando de execução que vem na imagem do container
docker start containerID

# Implanta um container contendo o banco de dados Redis
# Equivale ao combo docker create + docker start
docker run redis
# O comando vai substituir o processo principal por um terminal do shell e vai te conectar a ele
# O redis não vai rodar nesse caso.
docker run -it redis sh

# Implanta um container e substitui o comando de execução pelo indicado abaixo.
# Esse comando cria um container e iniciar ele!
# Não é possível sobrescrever o comando de execução de um container já criado
docker run redis echo hello there!

# Implanta um container com mapeamento de porta
docker run -p 8080:8080 imageName

# Lista containers rodando na máquina
docker ps 
# Lista todos os containers da máquina (rodando ou não)
docker ps --all
docker ps -a

# Apaga tudo do docker (containers, imagens guardadas em cache e networks criadas)
docker sysyem prune

# Obtém os logs produzidos pela aplicação que está (ou estava) rodando dentro do container
docker logs containerID

# Executa um comando dentro do container
docker exec -it containerID command
# Acessa um terminal shell dentro do container
docker exec -it containerID sh

# Faz o build da imagem a partir do dockerfile, que deve estar no diretório atual (por causa do ".")
docker build .
# Faz o build e atribui uma tag à imagem
docker build -t dockerID/nomeDaImagem:latest .

# A partir de um container, é possível criar uma imagem com o seu estado atual, passando inclusive o comando
# para executar a aplicação que tiver sido instalada dentro dele.
docker commit -c 'CMD ["redis-server"]' containerID


