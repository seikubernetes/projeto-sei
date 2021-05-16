## Imagem base a ser usada
FROM docker.io/alpine

## Label com informacoes
LABEL io.k8s.display-name="Alpine Linux - SEI - JODConverter 2.2.2" \
      io.k8s.description="Imagem do JODCOnverter 2.2.2 usada pelo SEI (Sistema Eletronico de InformacoesAlpine)" \
      maintainer="Carlos Lima <c.lima07@gmail.com> / Igor Oliveira <ijgoliveira@gmail.com / Marcelo Lima <marcelo.suporte.redes@gmail.com>"

## Portas a serem expostas
EXPOSE 8080

## Variaveis de ambiente
ENV HOME=/opt/app-root/src

## Diretorio padrao
WORKDIR ${HOME}

## Atividades com root
USER root

## Copia dos arquivos necessarios
COPY ./arquivos/run.sh ${HOME}/run.sh

## Instalacao de pacotes necessarios
RUN apk --no-cache add ca-certificates curl procps tzdata shadow bash grep \
    openjdk7 libreoffice ttf-opensans font-liberation-nerd libxfont \
    && apk --no-cache search -qe 'font-noto*' | xargs apk add && \
    wget http://sourceforge.net/projects/jodconverter/files/JODConverter/2.2.2/jodconverter-tomcat-2.2.2.zip/download \
    -O /opt/jodconverter-tomcat-2.2.2.zip && cd /opt && unzip /opt/jodconverter-tomcat-2.2.2.zip && \
    rm -f /opt/jodconverter-tomcat-2.2.2.zip

## Correcao do TimeZone
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/America/Recife /etc/localtime

## Criacao de usuario default
RUN useradd -d ${HOME} -u 1001 -r -g 0 -s /sbin/nologin -c "Default Application User" default

## Correcao de Permissao
RUN chown -R 1001:0 ${HOME} /opt/jodconverter-tomcat-2.2.2 && \
    chmod -R ug+rwx ${HOME} /etc/passwd ${HOME}/run.sh \
    /opt/jodconverter-tomcat-2.2.2

## Atividades com o usuario default (id 1001)
USER 1001

CMD ${HOME}/run.sh
