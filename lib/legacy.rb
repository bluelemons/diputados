# Encoding: utf-8
require 'legacy/migration'
require 'legacy/comision_migration'
require 'legacy/estado_migration'
require 'legacy/tables'

module Legacy
  # Realiza la migración de todas las tablas e indica los resultados en la
  # consola
  def self.seed_legacy_databases
    LEGACY_TABLES.each do |tabla|
      begin
        puts "\n---"
        puts "Migrando: #{tabla[:legacy]}\n"

        migration_class = Legacy.const_get(tabla[:legacy].chomp(".dbf").capitalize.concat("Migration")) rescue Migration
        migracion = migration_class.new(tabla)

        migracion.output = :dots

        puts "Datos a migrar: #{migracion.legacy_table.record_count} / #{migracion.model.count}"

        unless re_seedable? migracion.model
          if migracion.model.count == 0
            puts "Cargando los datos por primera vez"
          elsif migracion.legacy_table.record_count <= migracion.model.count + 2 and migracion.model.count > 0
            raise "Tabla ya migrada y sin registros nuevos (y además no es reseedeable)"
          else
            puts "Borre primero los registros: #{migracion.model.count} registros (porque no es re-seedeable)"
            raise "ahora no borro registros, mejor borrar a mano :)"
          end
        end

        migracion.run
        puts "\n---\n#{tabla[:legacy]} migrado correctamente"
      rescue
        puts "\n---\n#{tabla[:legacy]} #{$!}"
      end
    end
  end

  def self.re_seedable?(model)
    legacy_id = model.const_get(:LEGACY_CONSTRAINTS) rescue nil
  end
end

