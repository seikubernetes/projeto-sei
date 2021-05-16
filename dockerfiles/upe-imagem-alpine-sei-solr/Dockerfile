## Imagem base a ser usada
FROM docker.io/alpine

## Label com informacoes
LABEL io.k8s.display-name="Alpine Linux - SEI - SOLR 6.1.0" \
      io.k8s.description="Imagem do SOLR 6.1.0 usada pelo SEI (Sistema Eletronico de InformacoesAlpine)" \
      maintainer="Carlos Lima <c.lima07@gmail.com> / Igor Oliveira <ijgoliveira@gmail.com / Marcelo Lima <marcelo.suporte.redes@gmail.com>"

## Portas a serem expostas
EXPOSE 8983

## Variaveis de ambiente
ENV HOME=/opt/app-root/src

## Diretorio padrao
WORKDIR ${HOME}

## Atividades com root
USER root

## Copia dos arquivos necessarios
COPY ./arquivos/run.sh ${HOME}/run.sh
ADD ./arquivos/solr-config.tgz /tmp/

## Instalacao de pacotes necessarios
RUN apk --no-cache add ca-certificates curl procps tzdata shadow bash grep openjdk8 && \
    wget https://archive.apache.org/dist/lucene/solr/6.1.0/solr-6.1.0.tgz \
    -O /opt/solr-6.1.0.tgz && cd /opt && tar -xzf /opt/solr-6.1.0.tgz && \
    rm -f /opt/solr-6.1.0.tgz

## Correcao do TimeZone
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/America/Recife /etc/localtime

## Criacao do usuario default
RUN useradd -d ${HOME} -u 1001 -r -g 0 -s /sbin/nologin -c "Default Application User" default

## Correcao de permissoes
RUN chown -R 1001:0 ${HOME} /opt/solr-6.1.0 && \
    chmod -R ug+rwx ${HOME} /opt/solr-6.1.0 ${HOME}/run.sh

## Atividades com o usuario default (id 1001)
USER 1001

## 
CMD $HOME/run.sh
