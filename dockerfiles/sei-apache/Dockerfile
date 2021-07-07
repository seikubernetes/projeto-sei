## Imagem base a ser usada
FROM docker.io/centos:7

## Label com informacoes
LABEL io.k8s.display-name="Centos Linux - SEI - Apache 2.4 + php 5.6" \
      io.k8s.description="Imagem do Apache 2.4 + php 5.6 usada pelo SEI (Sistema Eletronico de InformacoesAlpine)" \
      maintainer="Carlos Lima <c.lima07@gmail.com> / Igor Oliveira <ijgoliveira@gmail.com / Marcelo Lima <marcelo.suporte.redes@gmail.com>"

## Portas a serem expostas
EXPOSE 8080

## Variaveis de ambiente
ENV HOME=/var/www/html

## Diretorio padrao
WORKDIR /var/www/html

## Atividades com root
USER root

## Reativa todos os idiomas no locale. 
RUN sed -i '/^override_install_langs=/d' /etc/yum.conf && \
    yum reinstall -y glibc-common

## Instalacao de pacotes necessarios
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php56 && \
    yum -y install java-1.8.0-openjdk libXext libXrender git unzip wget openssl dejavu-fonts-common \
    dejavu-sans-mono-fonts liberation-serif-fonts xorg-x11-font-utils fontconfig \
    fontpackages-filesystem liberation-fonts-common libfonts dejavu-sans-fonts \
    dejavu-serif-fonts liberation-mono-fonts google-crosextra-carlito-fonts \
    google-crosextra-caladea-fonts urw-fonts libfontenc libXfont \
    xorg-x11-fonts-Type1 liberation-sans-fonts libreoffice-opensymbol-fonts \
    httpd php php-common php-cli php-pear php-bcmath \
    php-gd php-gmp php-imap php-intl php-ldap php-mbstring php-mysqli php-odbc php-pdo \
    php-pecl-apc php-pspell php-zlib php-snmp php-soap php-xml php-xmlrpc php-zts php-devel \
    php-pecl-apc-devel php-pecl-memcache php-calendar php-shmop php-intl php-mcrypt \
    php-pecl-xdebug php56-php-dba php56-php-enchant php56-php-pecl-mongo php56-php-pgsql \
    php56-php-opcache php56-php-fpm php56-php-dbg php56-php-embedded php56-runtime \
    php56-php-recode php56-scldevel && yum clean all -y && rm -rf /var/cache/yum

## Configuracao necessaria
RUN chmod 777 /run/httpd /var/lib/php/session && \
    sed -i "/^Listen /s/ .*/ 0.0.0.0:8080/" /etc/httpd/conf/httpd.conf && \
    sed -i "/^ErrorLog /s/ .*/ \"|\/bin\/cat\"/" /etc/httpd/conf/httpd.conf && \
    sed -i "s/ CustomLog \"logs\/access_log\"/CustomLog \"|\/bin\/cat\"/" /etc/httpd/conf/httpd.conf && \
    sed -i "/^variables_order =/s/= .*/= \"EGPCS\"/" /etc/php.ini && \
    sed -i "/^Group/s/ .*/ root/" /etc/httpd/conf/httpd.conf && \
    #sed -i "/^LogLevel/s/ .*/ debug/" /etc/httpd/conf/httpd.conf && \
    #sed -i "/^display_errors =/s/= .*/= \"On\"/" /etc/php.ini && \
    sed -i -e '$aAddDefaultCharset UTF-8' /etc/httpd/conf/httpd.conf

## Copia dos arquivos necessarios
COPY ./arquivos/99-openssl.ini /etc/php.d/99-openssl.ini
COPY ./arquivos/99-sei.ini /etc/php.d/99-sei.ini
COPY ./arquivos/00-sei.conf /etc/httpd/conf.d/00-sei.conf
COPY ./arquivos/SEI-Fontes/infra /var/www/html/infra
COPY ./arquivos/SEI-Fontes/sei /var/www/html/sei
COPY ./arquivos/SEI-Fontes/sip /var/www/html/sip

## update dos certificados.
RUN wget -O /tmp/ACcompactadox.zip http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactadox.zip && \
    cd /etc/pki/ca-trust/source/anchors/ && unzip -o /tmp/ACcompactadox.zip && \
    update-ca-trust && rm -f /tmp/ACcompactadox.zip

## Correcao do TimeZone
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/America/Recife /etc/localtime

## Correcao de permissoes
RUN chown -R 48:0 ${HOME} /run/httpd \
    /etc/pki/ca-trust && \
    chmod -R ug+rwx ${HOME} /run/httpd \
    /etc/pki/ca-trust

## Atividades com o usuario default (id 1001)
USER 48

CMD ["httpd", "-D",  "FOREGROUND"]
