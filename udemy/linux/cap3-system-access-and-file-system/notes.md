# Capítulo 3 - System Access and File System

## Aula 33
Para acessar um sistema linux de forma remota a partir de uma máquina Windows, é preciso instalar o software Putty. <br/>
Caso a sua máquina seja Linux, não precisa. Basta fazer o acesso via protocolo SSH.

## Aula 35
Para conectar ao terminal de uma máquina remota, é preciso saber o IP dela.
Uma forma de descobrir o IP de uma máquina, é acessando o terminal dela e listando as interfaces de rede que ela possui. <br/>

Comando para listar as interfaces de rede conectadas à máquina: <br/>
<> ifconfig <br/>
<> ip addr <br/>
<> ip a <br/>

O comando **ifconfig** está sendo depreciado em algumas versões do linux. Dê preferência pelos comandos "**ip a**" ou "**up addr**".

## Aula 36
Se a máquina linux remota não tiver um IP atribuído à sua interface de rede, então será necessário fazer isso manualmente. <br/>

Acesse o terminal como administrador e use o comando:<br/>
<> ifup enp0s3 <br/>

O comando vai ativar a interface de rede, permitindo que ela se comunique pela rede. <br/>

No caso acima, **enp0s3** é o nome da interface de rede, obtido pelo comando **ifconfig**.<br/>
