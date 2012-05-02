module Legacy
  # El encoding utilizado en las tablas dBase de FoxPro
  # Las alternativas serían "CP850", "IBM437", "CP1252".

  LEGACY_ENCODING = "CP1252"

  # Listado de las tablas a migrar en el orden que debe ser realizado.

  LEGACY_TABLES = [
    {:model=> Comision, :legacy=>"comision.dbf"},
    {:model=> Tema, :legacy=>"temas.dbf"},
    {:model=> Status, :legacy=>"status.dbf"},
    {:model=> Expediente, :legacy=>"proyecto.dbf"},
    {:model=> Final, :legacy=>"final.dbf"},
    {:model=> Asunto, :legacy=>"asunto.dbf"},
    {:model=> Estado, :legacy=>"estado.dbf"},
    {:model=> Sesion, :legacy=>"sesion.dbf"},
    {:model=> Senado, :legacy=>"senado.dbf"},
    {:model=> Diputado, :legacy=>"diputado.dbf"},
    {:model=> Prefer, :legacy=>"prefer.dbf"}
  ]
end

