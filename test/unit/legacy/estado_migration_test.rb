# Encoding: UTF-8
require 'test_helper'
require 'legacy/estado_migration'

class LegacyEstadoMigrationTest < ActiveSupport::TestCase

  def test_migration_con_relacion
    Estado.delete_all
    migration = Legacy::EstadoMigration.new :legacy => "estado.dbf", :model => Estado
    migration.run(:count => 2)
    estado_1, estado_2 = *Estado.first(2)
    assert_equal estado_1.expediente_id, expedientes(:two).id, "El estado no tiene relacion"
    assert_nil estado_2.expediente_id, "El estado tiene relacion"
    assert_equal 8, estado_1.comision_id, "la comision fue salvada sin mas"
  end

end

