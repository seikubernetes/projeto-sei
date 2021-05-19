## Imagem base a ser usada
FROM docker.io/alpine:3.5

## Label com informacoes
LABEL io.k8s.display-name="Alpine Linux - SEI - Apache 2.4 + php 5.6" \
      io.k8s.description="Imagem do Apache 2.4 + php 5.6 usada pelo SEI (Sistema Eletronico de InformacoesAlpine)" \
      maintainer="Carlos Lima <c.lima07@gmail.com> / Igor Oliveira <ijgoliveira@gmail.com / Marcelo Lima <marcelo.suporte.redes@gmail.com>"

## Portas a serem expostas
EXPOSE 8080

## Variaveis de ambiente
ENV HOME=/var/www/localhost/htdocs

## Diretorio padrao
WORKDIR /var/www/localhost/htdocs

## Atividades com root
USER root

## Instalacao de pacotes necessarios
RUN apk --no-cache add git ca-certificates curl procps tzdata shadow bash grep \
    apache2 && apk --no-cache search -qe 'php5-*' | xargs apk --no-cache add

## Configuracao necessaria
RUN mkdir /run/apache2 && \
    sed -i "/^Listen /s/ .*/ 0.0.0.0:8080/" /etc/apache2/httpd.conf && \
    sed -i "/^ErrorLog /s/ .*/ \"|\/bin\/cat\"/" /etc/apache2/httpd.conf && \
    sed -i "s/ CustomLog logs\/access.log/CustomLog \"|\/bin\/cat\"/" /etc/apache2/httpd.conf && \
    sed -i "/^variables_order =/s/= .*/= \"EGPCS\"/" /etc/php5/php.ini && \
    sed -i "/^Group/s/ .*/ root/" /etc/apache2/httpd.conf && \
    sed -i "/^LogLevel/s/ .*/ debug/" /etc/apache2/httpd.conf && \
    sed -i -e '$aAddDefaultCharset UTF-8' /etc/apache2/httpd.conf

## Copia dos arquivos necessarios
COPY ./arquivos/99-openssl.ini /etc/php5/conf.d/99-openssl.ini
COPY ./arquivos/99-sei.ini /etc/php5/conf.d/99-sei.ini
COPY ./arquivos/00-sei.conf /etc/apache2/conf.d/00-sei.conf
COPY ./arquivos/SEI-Fontes/infra /var/www/localhost/htdocs/infra
COPY ./arquivos/SEI-Fontes/sei /var/www/localhost/htdocs/sei
COPY ./arquivos/SEI-Fontes/sip /var/www/localhost/htdocs/sip

## update dos certificados.
RUN wget -O /tmp/ACcompactadox.zip http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactadox.zip && \
    cd /usr/local/share/ca-certificates && unzip -o /tmp/ACcompactadox.zip && \
    update-ca-certificates && rm -f /tmp/ACcompactadox.zip

## Correcao do TimeZone
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/America/Recife /etc/localtime

## Correcao de permissoes
RUN chown -R 100:0 ${HOME} /run/apache2 \
    /usr/local/share/ca-certificates && \
    chmod -R ug+rwx ${HOME} /run/apache2 \
    /usr/local/share/ca-certificates

## Atividades com o usuario default (id 1001)
USER 100

CMD ["httpd", "-D",  "FOREGROUND"]
