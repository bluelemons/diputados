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

  def test_sanity
    assert_kind_of Class, Legacy::Migration
  end

  def test_consume_options
    assert_kind_of DBF::Table, @migration.legacy_table, "I have not access to legacy table"
    assert_equal Expediente, @migration.model, "Model not accesible"
  end

  def test_simple_migration
    Expediente.delete_all
    @migration.run(:count => 1)
    assert_equal Expediente.all.count, 1, "should create a single record"
  end

  def test_estado_migration
    Estado.delete_all
    @migration = Legacy::Migration.new :legacy => "estado.dbf", :model => Estado
    @migration.run(:count => 1)
    assert_equal 1, Estado.all.count, "should create a single record"
    assert Estado.first.numero, "El estado no tienen numero"
    assert Estado.first.expediente == expedientes(:two)
  end

  def test_complete_migration
#    skip
    Diputado.delete_all
    @migration = Legacy::Migration.new :legacy => 'diputado.dbf', :model => Diputado
    @migration.run
    assert Diputado.count > 20, "Los diputados no se migraron bien"
  end
end

