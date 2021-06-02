## Imagem base a ser usada
FROM docker.io/mysql:latest

## Instalacao de pacotes necessarios (so sera usado durante o debug)
RUN apt update && apt -y install  procps net-tools

## Copia dos arquivos necessarios
COPY ./arquivos/sei_3_1_0.sql /tmp/
COPY ./arquivos/sip_3_1_0.sql /tmp/
COPY ./arquivos/criaBase.sh /tmp/
COPY ./arquivos/sei.cnf /etc/mysql/conf.d/sei.cnf

RUN chmod 755 /tmp/criaBase.sh
