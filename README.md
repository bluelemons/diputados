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

