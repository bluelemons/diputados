# Deployment #

La aplicación tiene pocos requisitos para funcionar y el proceso de deployment
está automatizado utilizando [capistrano][cap], el cual está configurado en el
archivo `config/deploy.rb`.

Para configurar el servidor por primera vez, es necesario:

1. Crear un usuario con el nombre `diputados`.

2. Instalar mediante los repositorios:

   a. Nginx (web server similar a apache).

   b. MySQL (Base de Datos).

3. Instalar RVM (Ruby Version Manager) en el usuario `diputados`. https://rvm.io/rvm/install

4. Instalar [Phusssion Passanger][passenger] siguiendo las 
   [instrucciones][inst]

5. Permitir el accesso ssh mediante una llave pública.

6. Por último, habrá que configurar el archivo `.ssh/config` agregando el host
   `diputados` con user: `diputados` con la ip y puerto de acceso ssh servidor.

  [cap]: http://capistranorb.com/
  [passenger]: https://www.phusionpassenger.com/
  [inst]: http://www.modrails.com/documentation/Users%20guide%20Nginx.html

7. Clonar el repositorio en tu máquina local.

```
$ git clone git@github.com:BlueLemon/diputados.git
```

8. Instalar rvm en tu máquina local siguiendo los mismos pasos que en el servidor. https://rvm.io/rvm/install

9. instalar las gemas necesarias para la aplicacion

```
$ bundle install
```
