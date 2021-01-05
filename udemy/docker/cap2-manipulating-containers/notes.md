# Cap2 - Manipulating Containers

## Aula 21
No sistema operacional do Linux, o Kernel pode enviar dois tipos de sinais para parar um processo (uma aplicação rodando). São eles:
- SIGTERM
  - Esse sinal informa ao processo que ele deve ser encerrado dentro de um intervalo de tempo. Isso permite ao processo realizar alguma operação de backup de dados, persistência de arquivos, ou mesmo de limpeza (clean-up) antes de ser encerrado.
- SIGKILL
  - Esse sinal é enviado para fechar o processo imediatamente. Tudo que ele tiver produzido de dados e que não tiver sido salvo, será perdido.

Os processos que rodam dentro das namespaces também são encerrados via esses dois sinais.

O comando "docker stop containerID" faz o kernel enviar um SIGTERM para o processo principal dentro do container.

O comando "docker kill containerID" faz o kernel enviar um SIGKILL para o processo principal dentro do container.