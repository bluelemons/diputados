# Deployment #

La aplicación tiene pocos requisitos para funcionar y el proceso de deployment
está automatizado utilizando [capistrano][cap], el cual está configurado en el
archivo `config/deploy.rb`.

Para configurar el servidor por primera vez, es necesario:

1. Crear un usuario con el nombre `diputados`.

2. Instalar mediante los repositorios:

   a. Nginx (web server similar a apache).

   b. MySQL (Base de Datos).

3. Instalar RVM (Ruby Version Manager) en el usuario `diputados`.

4. Instalar [Phusssion Passanger][passenger] siguiendo las 
   [instrucciones][inst]

5. Permitir el accesso ssh mediante una llave pública.

6. Por último, habrá que configurar el archivo `.ssh/config` agregando el host
   `diputados` con user: `diputados` con la ip y puerto de acceso ssh servidor.

  [cap]: http://capistranorb.com/
  [passenger]: https://www.phusionpassenger.com/
  [inst]: http://www.modrails.com/documentation/Users%20guide%20Nginx.html
