#!/bin/bash


export MYSQL_PWD=$MYSQL_ROOT_PASSWORD

if mysql -uroot  --execute="SHOW DATABASES LIKE '$SEI_BANCO_NOME';" | grep ${SEI_BANCO_NOME} &>/dev/null ; then
       echo "ja existe"
else
mysql --user="root" --execute="CREATE DATABASE "$SEI_BANCO_NOME";"
mysql --user="root" --execute="CREATE DATABASE "$SIP_BANCO_NOME";"

mysql --user="root" --execute="CREATE USER '"$SEI_BANCO_USUARIO"' IDENTIFIED WITH mysql_native_password BY '"$SEI_BANCO_SENHA"';"
mysql --user="root" --execute="CREATE USER '"$SIP_BANCO_USUARIO"' IDENTIFIED WITH mysql_native_password BY '"$SIP_BANCO_SENHA"';"

mysql --user="root" "$SEI_BANCO_NOME" < /tmp/sei_3_1_0.sql
mysql --user="root" "$SIP_BANCO_NOME" < /tmp/sip_3_1_0.sql

mysql --user="root" --execute="GRANT ALL PRIVILEGES ON "$SEI_BANCO_NOME".* TO "$SEI_BANCO_USUARIO"; GRANT ALL PRIVILEGES ON "$SIP_BANCO_NOME".* TO "$SIP_BANCO_USUARIO"; FLUSH PRIVILEGES;"

mysql --user="root" --execute="update "$SIP_BANCO_NOME".orgao set sigla='$SIGLA_ORGAO', descricao='$BASE_UPDATE_DESCRICAO' where id_orgao=0;"
mysql --user="root" --execute="update "$SEI_BANCO_NOME".orgao set sigla='$SIGLA_ORGAO', descricao='$BASE_UPDATE_DESCRICAO' where id_orgao=0;"

mysql --user="root" --execute="update "$SIP_BANCO_NOME".sistema set pagina_inicial='$SEI_SIP_DOMINIO$SIP_CONTEXTO' where sigla='SIP';"
mysql --user="root" --execute="update "$SIP_BANCO_NOME".sistema set pagina_inicial='$SEI_SIP_DOMINIO$BASE_UPDATE_CONTEXTO_INICIAL_SEI', web_service='$SEI_SIP_DOMINIO$BASE_UPDATE_CONTEXTO_WEB_SERVICE' where sigla='SEI';"

fi
