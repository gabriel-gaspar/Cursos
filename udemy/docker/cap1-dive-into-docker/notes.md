# Capítulo 1 - Dive into docker

## Aulas 3-4
Docker é uma plataforma que facilita a implantação de múltiplos softwares em uma mesma máquina, isolados entre si, em uma estrutura conhecida como Container.

O docker é formado por dois componentes:
- Docker CLI
  - É a linha de comando que permite a comunicação com o Docker Daemon
- Docker Daemon
  - É a engine do Docker, responsável por criar imagens, implantar containeres etc...


## Aula 12
Container é um ambiente isolado, dentro do qual um processo é executado.
A implementação do container é feita por dois recursos:
- **namespaces**
- **cgroups**

**namespace** é um artifício, DO LINUX, usado para fazer a segmentação de recursos, tais como: espaço em disco, comunicação em rede, processos, usuáros e hostnames.
Isso significa que:
- um processo rodando dentro de uma namespace só consegue enxergar e se comunicar com outros processos que estejam dentro dessa mesma namespace. 
- todas as chamadas para escrita em disco, que esse processo fizer, serão redirecionadas (pelo kernel) para o espaço que foi mapeado para a namespace onde o processo está contido.
- o processo só enxerga as interfaces de rede que estão na namespace
- o processo só enxerga os usuários que estão definidos na namespace

**cgroup** é outro artifício, DO LINUX, de segmentação, mas que permite a isolação de recursos de hardware, tais como: memória RAM, uso de CPU, taxa de leitura escrita em disco, largura de banda etc...

A combinação de **namespaces e cgroups** permite criar, em uma mesma máquina, ambientes onde diferentes processos (softwares) operam de forma isolada.

**PS: A máquina hospedeira continua enxergando tudo como processos rodando sobre o sistema operacional. O Kernel que faz a mágica de isolar os processos! (foi o que entendi).**


## Aula 13
Uma imagem de um container é uma Snapshot de um sistema de arquivos. Dentro desse sistema de arquivos estão todos os arquivos necessários para a execução de um sofware em específico, seguido de um comando que deve ser executado para que esse software entre em execução como um processo.

Quando um container é implantado a partir de uma imagem, a snapshot do sistema de arquivos é montada dentro do disco, especificamente no espaço que foi mapeado para a namespace onde a aplicação vai rodar.Após isso, o comando de execução da aplicação é executado.