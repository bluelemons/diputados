# Deployment #

La aplicación tiene pocos requisitos para funcionar y el proceso de deployment
está automatizado utilizando [capistrano][cap], el cual está configurado en el
archivo `config/deploy.rb`. Para realizar un deploy es necesario tener la
applicación funcionando localmente en desarrollo.

Para configurar el servidor por primera vez, es necesario:

1. Disponer de un usuario con el nombre `diputados` en el servidor (es
   conveniente que este en el grupo sudo).

2. El servidor debera disponer de un alias en el archivo `.ssh/config` con los
   detalles necesarios para realizar la conexión ssh.

~~~
#~/.ssh/config
Host diputatres
  HostName 192.168.0.111
  Port 3322
  User diputados
~~~

3. Deberá agregarse a la lista de host autorizados en el servidor.

~~~
ssh-copy-id diputatres
~~~

4. Instalar en el servidor mediante los repositorios los servicios y los
   paquetes de desarrollo necesarios, como nginx (web server similar a apache)
   y MySQL (Base de Datos).

~~~
sudo apt-get install mysql-server nginx-full curl git \
  libxslt-dev libxml2-dev libmysqlclient-dev
~~~

5. Instalar [Phusssion Passanger][passenger] siguiendo las
   [instrucciones][inst]

6. Ejecutar localmente el comando de capistrano para completar la
   configuración del servidor.

~~~
cap setup
~~~

7. Realizar el deploy.

~~~
cap deploy
~~~

  [cap]: http://capistranorb.com/
  [passenger]: https://www.phusionpassenger.com/
  [inst]: http://www.modrails.com/documentation/Users%20guide%20Nginx.html
