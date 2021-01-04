# Apenas cria o container do Redis
# Esse comando apenas monta o sistema de arquivos contento o Redis em uma namespace separada.
docker create redis

# Inicia um Container que está parado
# Esse comando vai executar o comando de execução que vem na imagem do container
docker start containerID

# Implanta um container contendo o banco de dados Redis
# Equivale ao combo docker create + docker start
docker run redis
docker run -it redis

# Implanta um container e substitui o comando de execução pelo indicado abaixo.
docker run redis echo hello there!

# Lista containers rodando na máquina
docker ps 
# Lista todos os containers da máquina (rodando ou não)
docker ps --all
