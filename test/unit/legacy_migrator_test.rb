require 'test_helper'
require 'legacy_migrator'

class LegacyMigrationTest < ActiveSupport::TestCase

  def setup
    @migration =
      Legacy::Migration.new :legacy => "proyecto.dbf", :model => "Expediente"
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
end

