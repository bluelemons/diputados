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
        migracion.output = :dots

        puts "Datos a migrar: #{migracion.legacy_table.record_count} / #{migracion.model.count}"

        if migracion.legacy_table.record_count <= migracion.model.count + 2
          raise "Tabla ya migrada y sin registros nuevos"
        else
          puts "borrando #{migracion.model.count} registros"
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

