# Encoding: UTF-8
require 'test_helper'
require 'legacy/migration'

class LegacyMigrationTest < ActiveSupport::TestCase

  def setup
    @migration =
      Legacy::Migration.new :legacy => "proyecto.dbf", :model => Expediente
  end

  def teardown
    @migration.close
  end

  def test_attributes
    assert_kind_of DBF::Table, @migration.legacy_table, "I have not access to legacy table"
    assert_equal Expediente, @migration.model, "Model not accesible"
  end

  def test_single_migration
    Expediente.delete_all
    @migration.run(:count => 1)
    assert_equal Expediente.all.count, 1, "should create a single record"
    [:numero, :letra, :tipo, :pasada, :numsenado, :tema, :descrip, :autor].each do |attr|
      refute_nil Expediente.first.send(attr), "El expediente no fue bien cargado: Expediente##{attr}: nil"
    end
  end

  def test_migration_con_relacion
    Estado.delete_all
    @migration = Legacy::Migration.new :legacy => "estado.dbf", :model => Estado
    @migration.run(:count => 1)
    assert_equal 1, Estado.all.count, "should create a single record"
    assert Estado.first.numero, "El estado no tienen numero"
    assert Estado.first.expediente == expedientes(:two)
  end

  def test_mass_migration
    Diputado.delete_all
    @migration = Legacy::Migration.new :legacy => 'diputado.dbf', :model => Diputado
    @migration.run
    assert Diputado.count > 20, "Los diputados no se migraron bien"
  end

  def test_migration_with_dots_output
    @migration.output = :dots
    assert_output("··") do
      @migration.run :count => 2
    end
  end

  def test_repeated_migration_do_not_repeat_records
    @migration = Legacy::Migration.new :legacy => 'status.dbf', :model => Status
    @migration.run
    @migration.close
    first_count = Status.count
    @migration = Legacy::Migration.new :legacy => 'status.dbf', :model => Status
    @migration.run
    assert_equal Status.count, first_count, "Los registros son migrados duplicados"
  end
end

