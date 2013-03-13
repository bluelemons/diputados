# language: es
Característica: Tratamiento en sesión.
  Para llevar el control de que notas se tratan en cada sesión
  Como empleado de mesa de entrada
  Quiero indicar pases para las notas a ser tratadas en sesión.

  Antecedentes:
    Dado que estoy logeado como "mesa de entrada"

  @wip
  Escenario: Cargar una nota como Asunto Entrado.
    Dado que cargo una nota.
    Cuando selecciono como destino "Asunto Entrado"
    Y selecciono como sesión la siguiente sesión
    Entonces la nota queda registrada en el "Asunto Entrado"
