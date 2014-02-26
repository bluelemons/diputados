# Diputados

Es una aplicación prototipo para la cámara de diputados de la provincia de Santa
Fe que usará los datos de un sistema en dbf.


## Funcionalidades

* El prototipo tiene tres vistas, un buscador, un listado y un detalle
  de expedientes.
* También tiene tres tipos de impresiones para las dos últimas vistas.
* Es multi-usuario y puede accederse a traves de la red o internet.
* La base de datos se actuliza con los datos obtenidos de la base de datos
  dBase (dbf) del sistema actual en FoxPro.
* Este prototipo sirve de base para una aplicación futura que tiene como
  objetivo reemplazar el sistema actual de FoxPro.


## Tipo de impresiones

Cada listado incluye información sobre los parametros de busqueda:

* Listado del index
* Detalle del expediente
* Detalle del expediente incluyendo el asunto entrado, listado de comisiónes,
  sesiones y final.


## Actualizaciones

La interacción con los datos legados está implementado en el módulo Legacy
que maneja todos los detalles propios de la migración. Se utilizan las gemas
'dbf' para extracción de los datos y 'seed-fu' para cargar los mismos.


## Sistema para la administración de notas

Se está implementando de manera progresiva, un modulo para la administración de
las notas. El mismo facilitará el seguimiento de las mismas por las distintas
áreas de la cámara de diputados, así como los documentos que con ella se
vinculan, como ser, la versión escaneada de la misma, proyectos de ley y
expedientes en otras dependencias.


## Requisitos

Para comenzar a desarrollar la aplicación deberá clonar el repositorio
utilizando [git][git] y tener instalado ruby preferentemente utilizando
[rvm][rvm].

    # Para instalar los pre-requisitos:
    sudo apt-get install git curl libxslt-dev libxml2-dev

    # Para instalar rvm
    \curl -sSL https://get.rvm.io | bash -s stable --ruby

Las instrucciones para desplegar la aplicación en el servidor se encuentran en
archivo DEPLOYMENT.md

# Licencia #

Esta aplicación utiliza la licencia AGPLv3 de la cual puede encontrar
una copia en el archivo COPYING.

Copyright (C) 2012-2013  bluelemons

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

  [git]: http://git-scm.com/
  [rvm]: https://rvm.io/rvm/install
