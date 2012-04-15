# Encoding: utf-8
require 'legacy/migration'

module Legacy
  # El encoding utilizado en las tablas dBase de FoxPro
  # Las alternativas serían "CP850", "IBM437", "CP1252".

  TABLES_ENCODING = "CP1252"

  # Realiza la migración de todas las tablas e indica los resultados en la
  # consola
  def self.seed_legacy_databases
    # TODO
  end
end

