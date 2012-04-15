module Legacy
  # Listado de las tablas a migrar en el orden que debe ser realizado.

  LEGACY_TABLES = [
    {:model=> Expediente, :legacy=>"proyecto.dbf"},
    {:model=> Final, :legacy=>"final.dbf"},
    {:model=> Senado, :legacy=>"senado.dbf"},
    {:model=> Asunto, :legacy=>"asunto.dbf"},
    {:model=> Estado, :legacy=>"estado.dbf"},
    {:model=> Sesion, :legacy=>"sesion.dbf"},
    {:model=> Tema, :legacy=>"temas.dbf"},
    {:model=> Diputado, :legacy=>"diputado.dbf"},
    {:model=> Prefer, :legacy=>"prefer.dbf"},
    {:model=> Status, :legacy=>"status.dbf"}
  ]
end

