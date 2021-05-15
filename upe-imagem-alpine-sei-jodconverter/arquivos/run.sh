#!/bin/sh

### Altera o id do usuario default.
## Necessario para o openoffice poder iniciar.
cp /etc/passwd /tmp/passwd.bkp || exit $?
sed "s/:1001:0:/:$(id -u):0:/" /etc/passwd > /tmp/passwd.tmp || exit $?
cat /tmp/passwd.tmp > /etc/passwd || exit $?
soffice --headless --nologo --nofirststartwizard --accept="socket,host=0.0.0.0,port=8100;urp" &
sleep 10
cat /tmp/passwd.bkp > /etc/passwd || exit $?

/opt/jodconverter-tomcat-2.2.2/bin/catalina.sh run &

sleep 10 

while ps -C java &>/dev/null && ps -C soffice.bin &>/dev/null ; do
   sleep 3
done
