# **Section 2 - Manipulating Containers**

## **Aula 21**
No sistema operacional do Linux, o Kernel pode enviar dois tipos de sinais para parar um processo (uma aplicação rodando). 

São eles:

- SIGTERM
    - Esse sinal informa ao processo que ele deve ser encerrado dentro de um intervalo de tempo. Isso permite ao processo realizar alguma operação de backup de dados, persistência de arquivos, ou mesmo de limpeza (clean-up) antes de ser encerrado.
- SIGKILL
    - Esse sinal é enviado para fechar o processo imediatamente. Tudo que ele tiver produzido de dados e que não tiver sido salvo, será perdido.

Os processos que rodam dentro das namespaces também são encerrados via esses dois sinais.

O comando "docker stop containerID" faz o kernel enviar um SIGTERM para o processo principal dentro do container.

O comando "docker kill containerID" faz o kernel enviar um SIGKILL para o processo principal dentro do container.

## **Aulas 23 - 25**
Todo processo do linux possui três interfaces com o sistema operacional:

- STDIN
    - Essa é a interface de entrada.
    - Toda informação que chega ao processo entra por essa interface
    - Quando um comando é enviado a um processo, ele chega neste pelo STDIN
- STDOUT
    - Esse é o ponto de saída de dados e informações do processo
    - Todo log, ou outro tipo de informação que o processo responde, é retornado pelo STDOUT
- STDERR
    - Esse é o canal usado pelo processo para comunicar erros internos.

O mesmo vale para um processo rodando dentro de um container.

Existem comandos do docker que permitem conectar o terminal da sua máquina local à interface STDIN do processo que está dentro do container. Dessa forma, se o processo que está dentro do container for um outro terminal (shell), é possível rodar comandos dentro do container a partir do terminal local da máquina host.
