# Encoding: utf-8
require 'legacy/migration'
require 'legacy/tables'

module Legacy
  # Realiza la migración de todas las tablas e indica los resultados en la
  # consola
  def self.seed_legacy_databases
    LEGACY_TABLES.each do |tabla|
      begin
        puts "Migrando: #{tabla[:legacy]}\n"
        migracion = Migration.new(tabla)

        if migracion.legacy_table.record_count == migracion.model.count
          raise "Tabla ya migrada y sin registros nuevos #{migracion.legacy_table.record_count} #{migracion.model.count}"
        else
          migracion.model.delete_all
        end

        migracion.run
        puts "\n---\n#{tabla[:legacy]} migrado correctamente"
      rescue
        puts "\n---\n#{tabla[:legacy]} #{$!}"
      end
    end
  end
end

