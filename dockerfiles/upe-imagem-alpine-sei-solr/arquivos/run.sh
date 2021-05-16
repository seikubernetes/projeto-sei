#!/bin/sh

if [ -d /dados ] ; then
   ln -vsf /dados /opt/solr-6.1.0/server/solr/dados || exit $?
   cp -vf /tmp/solr-config/log4j.properties /opt/solr-6.1.0/server/resources || exit $?
   listaDiretorios="/dados/sei-protocolos /dados/sei-bases-conhecimento /dados/sei-publicacoes" 
   for diretorio in ${listaDiretorios} ; do
      diretorioNome=$(basename ${diretorio})
      if ! [ -d ${diretorio}/conteudo ] ; then
         mkdir -vp ${diretorio}/conteudo || exit $?
      fi
      cp -vrf /opt/solr-6.1.0/example/files/conf ${diretorio}/ || exit $? 
      rm -vf ${diretorio}/conf/solrconfig.xml || exit $?
      cp -vf /opt/solr-6.1.0/example/example-DIH/solr/solr/conf/admin-extra* ${diretorio}/conf/ || exit $?
      cp -vrf /tmp/solr-config/${diretorioNome}-*.xml ${diretorio}/conf || exit $?
      ln -vsf /opt/solr-6.1.0/contrib ${diretorio}/contrib || exit $?
      ln -vsf /opt/solr-6.1.0/dist ${diretorio}/dist || exit $?
      [ ${diretorio}/conteudo/index/write.lock ] && rm -rf ${diretorio}/conteudo/index/write.lock || exit $?
   done
   /opt/solr-6.1.0/bin/solr start -p 8983 -a "${JAVA_OPTS_APPEND}" -f &
   sleep 10
   for diretorio in ${listaDiretorios} ; do
      diretorioNome=$(basename ${diretorio})
      if ! [ -d ${diretorio}/conteudo/index ] ; then
         statusIndexCreate=$(curl "http://localhost:8983/solr/admin/cores?action=CREATE&name=${diretorioNome}&instanceDir=${diretorio}&config=${diretorioNome}-config.xml&schema=${diretorioNome}-schema.xml&dataDir=${diretorio}/conteudo" | grep -oP '<int name="status"(?:\s[^>]*)?>\K.*?(?=</int>)')
         [ "${statusIndexCreate}" != "0" ] && exit ${statusIndexCreate}
      fi
   done
   while ps -C java &> /dev/null ; do
      sleep 3
   done
else
   echo "O volume persistente /dados não existe."
   sleep 30
fi
