# Diputados

Es una aplicación prototipo para la cámara de diputaos de la provincia de Santa Fe que usará los datos de un sistema en dbf.


## Funcionalidades

* El prototipo tendrá 3 vistas, un buscador, un listado y un detalle de expedientes. como también 3 tipos de impresiones para las 2 últimas vistas.
* Será multi-usuario y podrá accederse a traves de internet.
* La base de datos se actulizará con los datos obtenidos de una base de datos dBase (dbf) del sistema actual en FoxPro.
* Este prototipo servirá de base para una aplicación futura que tiene como objetivo reemplazar el sistema actual de FoxPro.


## Tipo de impresiones

Cada listado incluye información sobre los parametros de busqueda:

* Listado del index
* Detalle del expediente
* Detalle del expediente incluyendo el asunto entrado, listado de comisiónes, sessiones y final.


## Actualizaciones

La interacción con los datos legados está implementado en un módulo Legacy que maneja todos los detalles propios de la migración. Se utilizan las gemas 'dbf' para extracción de los datos y 'seed-fu' para cargar los mismos.

