# Encoding: UTF-8
require 'test_helper'
require 'legacy/comision_migration'

class LegacyComisionMigrationTest < ActiveSupport::TestCase

  def test_comision_codigo_is_replaced_by_id
    Comision.delete_all
    migration = Legacy::ComisionMigration.new :legacy => 'comision.dbf', :model => Comision
    migration.run
    assert_equal 1, Comision.first.id, "El id no se salvo bien"
  end

end

